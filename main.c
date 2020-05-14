#include <stdint.h>

#define BACKUP15_MAGIC 0xD027B007u
#define BACKUP15_MAGIC2 0xBED0BED0u

#define AON_CTRL_ADDR 0x10000000u
#define AON_BACKUP1 0x084
#define AON_BACKUP15 0x0BC
#define AON_PMUSLEEPI0 0x120
#define AON_PMUSLEEPI1 0x124
#define AON_PMUSLEEPI2 0x128
#define AON_PMUSLEEPI3 0x12C
#define AON_PMUSLEEPI4 0x130
#define AON_PMUSLEEPI5 0x134
#define AON_PMUSLEEPI6 0x138
#define AON_PMUSLEEPI7 0x13C
#define AON_PMUSLEEP 0x148
#define AON_PMUKEY 0x14C
#define AON_WDOGKEY_VALUE 0x51F15Eu

#define GPIO_CTRL_ADDR 0x10012000u
#define GPIO_INPUT_EN 0x04u
#define GPIO_OUTPUT_EN 0x08u
#define GPIO_OUTPUT_VAL 0x0Cu
#define GPIO_LOW_IP 0x34u
#define GPIO_IOF_EN 0x38u
#define GPIO_IOF_SEL 0x3Cu
#define GPIO_OUTPUT_XOR 0x40u

#define CLINT_CTRL_ADDR 0x02000000u
#define CLINT_MTIMECMP 0x4000u
#define CLINT_MTIME 0xBFF8u

#define QSPI0_CTRL_ADDR 0x10014000u
#define SPI1_CTRL_ADDR 0x10024000u
#define SPI_SCKDIV 0x00u
#define SPI_CSID 0x10u
#define SPI_CSMODE 0x18
#define SPI_DELAY1 0x28
#define SPI_FMT 0x40u
#define SPI_TXDATA 0x48u
#define SPI_RXDATA 0x4Cu
#define SPI_FCTRL 0x60u

#define SPI_FMT_PROTO_SINGLE 0x0u
#define SPI_FMT_PROTO_DUAL 0x1u
#define SPI_FMT_PROTO_QUAD 0x2u
#define SPI_FMT_PROTO_MASK 0x3u
#define SPI_FMT_ENDIAN_BIG 0x0u
#define SPI_FMT_ENDIAN_LIL 0x1u
#define SPI_FMT_DIR_NORMAL 0x0u
#define SPI_FMT_LEN_SHIFT 16u

#define SPI_CSMODE_AUTO 0x0u
#define SPI_CSMODE_HOLD 0x2u
#define SPI_CSMODE_MASK 0x3u

#define UART0_CTRL_ADDR 0x10013000u
#define UART1_CTRL_ADDR 0x10023000u
#define UART_TXDATA 0x00u
#define UART_RXDATA 0x04u
#define UART_TX_CTRL 0x08u
#define UART_RX_CTRL 0x0Cu
#define UART_DIV 0x18u
#define UART_RXTX_EN 0x1u

#define PRCI_CTRL_ADDR 0x10008000u
#define PRCI_PLL_CFG 0x08u
#define PLL_SEL 16u
#define PLL_REF_SEL 17u
#define PLL_BYPASS 18u

#define GREEN_LED 0x00080000u
#define RED_LED 0x00400000u
#define PIN_10 0x400

// io functions
#define UART0_RX 0x00010000u
#define UART0_TX 0x00020000u
#define UART1_RX 0x00040000u
#define UART1_TX 0x00800000u
#define SPI1_DQ0 0x00000008u
#define SPI1_DQ1 0x00000010u
#define SPI1_SCK 0x00000020u
#define SPI1_CS2 0x00000200u

// mmio (memory mapped i/o) macro
#define mmio8(reg, offset) (*(volatile uint8_t *)((reg) + (offset)))
#define mmio16(reg, offset) (*(volatile uint16_t *)((reg) + (offset)))
#define mmio32(reg, offset) (*(volatile uint32_t *)((reg) + (offset)))
#define mmio64(reg, offset) (*(volatile uint64_t *)((reg) + (offset)))
#define mmio mmio32

#define mtime_lo mmio(CLINT_CTRL_ADDR, CLINT_MTIME)
#define mtime_hi mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4)
#define mtime mmio64(CLINT_CTRL_ADDR, CLINT_MTIME)

#define PROC_START_ADDR 0x20010000

void bench_rstclk();
void measure_lfosc_freq();
void esp32_init();

int32_t at_sendrecv(uint32_t spi, const char *str, uint32_t timeout);
int32_t at_send(uint32_t spi, const char *str, uint32_t timeout);
int32_t at_recv(uint32_t spi);
int32_t at_sendflag(uint32_t spi, char at_flag);
int32_t at_wait_done(uint32_t timeout);

int32_t spi_transceive_one(uint32_t spi, int32_t num_xfers,
                           int32_t check_ready);

void wait_ms(uint32_t time);

void _puts(const char *str);
void _putc(char c);
uint32_t strlen(const char *str);
char *strncpy(char *dest, const char *src, uint32_t n);

uint32_t print_to_uart1 = 0;
uint32_t lfosc_freq = 32768;
uint32_t esp32_diag_mode = 1;

char tx_buf[64];
char rx_buf[128];

int main() {
  uint64_t then;

  // Restore the default mtvec (which may have been set by initialization
  // code, depending on the environment in which this C code is compiled).
  // By default, this would cause an infinite loop upon exception, which is
  // also "safe" behavior and the debugger can connect.
  // __asm__ volatile("csrwi mtvec, 0"); // done in entry.S

  // 20000256
  if (mmio(AON_CTRL_ADDR, AON_BACKUP15) == BACKUP15_MAGIC) {
    // Reset was "double-tapped".
    mmio(AON_CTRL_ADDR, AON_BACKUP15) = 0;

    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) |= RED_LED;
    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_XOR) |= RED_LED;
    mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) &= ~RED_LED;
    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) |= RED_LED;

    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) &= ~GREEN_LED;

    do {
      then = mtime + 0x4000;
      while (mtime < then) {
      }
      mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_XOR) ^= RED_LED;

    } while (1);
  }

  // 2000025A
  // gpio
  // enable and invert output for pin 19 (green led)
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) |= GREEN_LED;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_XOR) |= GREEN_LED;
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) |= ~GREEN_LED;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) |= GREEN_LED;

  // disable pin 22 (red led)
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) &= ~RED_LED;
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) &= ~RED_LED;

  // aon
  // 20000298
  uint32_t save = mmio(AON_CTRL_ADDR, AON_BACKUP15);
  mmio(AON_CTRL_ADDR, AON_BACKUP15) = BACKUP15_MAGIC;

  // clint
  // 200002E0
  then = mtime + 0x4000;
  while (mtime < then) {
  }

  // aon
  // 200002EC
  // reset AON_BACKUP15
  mmio(AON_CTRL_ADDR, AON_BACKUP15) = save;

  // gpio
  // 200002f4
  // turn off all pins
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_XOR) = 0;

  // aon
  // 20000304
  // save = mmio(AON_CTRL_ADDR, AON_BACKUP15);

  // 20000310 || 2000031e
  if (save == BACKUP15_MAGIC2 || save == BACKUP15_MAGIC) {
    mmio(AON_CTRL_ADDR, AON_BACKUP15) = 0;
  } else {
    // unsure the point of  this code
    // it's called on power reset
    // and sets the sleep program
    // then sleeps?
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI0) = 0x18;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI1) = 0x18;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI2) = 0x18;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI3) = 0x18;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;

    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI4) = 0x38;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI5) = 0x38;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI6) = 0x38;
    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEPI7) = 0x38;

    mmio(AON_CTRL_ADDR, AON_BACKUP15) = BACKUP15_MAGIC2;

    mmio(AON_CTRL_ADDR, AON_BACKUP1) = 0;

    mmio(AON_CTRL_ADDR, AON_PMUKEY) = AON_WDOGKEY_VALUE;
    mmio(AON_CTRL_ADDR, AON_PMUSLEEP) = 0;
  }

  // delay
  // 20000380
  then = mtime + 0x4000;
  while (mtime < then) {
  }

  bench_rstclk();
  esp32_init();

  // start user program
  ((void (*)(void))PROC_START_ADDR)();

  // this is here so the compiler does not yell at us
  // it should never be reached
  // in theory we could change main to a void
  // and save like 8 bytes in the binary size
  // however, the goal of this is to emulate the
  // official bootloader as much as possible
  return 1234567;
}

// 2000110e
void bench_rstclk() {
  // set spi to single mode
  mmio(QSPI0_CTRL_ADDR, SPI_FMT) &=
      (~(SPI_FMT_PROTO_MASK) | SPI_FMT_PROTO_SINGLE);
  // disable interrupts
  __asm__ volatile("csrci mstatus, 8");
  // turn off and disable all pins
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_XOR) = 0;
  uint32_t uart = 0;
  uint32_t uart_pins;
  if (print_to_uart1 == 0) {
    uart_pins = UART0_RX | UART0_TX;
    uart = UART0_CTRL_ADDR;
  } else {
    uart_pins = UART1_RX | UART1_TX;
    uart = UART0_CTRL_ADDR;
  }
  // turn on pins uart 16 and 17 (uart0 rx and tx) or
  // pins 18 and 23 (uart1 rx and tx)
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) |= uart_pins;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) |= uart_pins;
  // select iof0
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_SEL) &= ~(uart_pins);
  // enable iof
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) |= ~(uart_pins);
  // set baud rate divisor, div = 138, f_in = 16MHz. Baud 115200 (115107)
  // f_baud=f_in/(div + 1)
  mmio(uart, UART_DIV) = 138;
  // enable tx and set txcnt to 1 in txctrl
  mmio(uart, UART_TX_CTRL) = 0x10001;
  // write 1 to rxctrl to enable rx
  mmio(uart, UART_RX_CTRL) = 0x1;

  // delay... why?
  for (uint32_t i = 0u; i <= 9999u; i++) {
  }

  // use external oscillator
  mmio(PRCI_CTRL_ADDR, PRCI_PLL_CFG) = (1 << PLL_REF_SEL | 1 << PLL_BYPASS);
  // drive clock with pll, except ext osc is bypassed through
  // so really it's using the ext osc
  mmio(PRCI_CTRL_ADDR, PRCI_PLL_CFG) |= (1 << PLL_SEL);

  // warm up the clock
  measure_lfosc_freq();

  _puts("Bench Clock Reset Complete\r\n");
}

// 200010ac
void measure_lfosc_freq() {
  mtime_lo = 0;
  uint32_t delta, prev = mtime_lo;

  uint32_t mcycle_lo, prev_mcycle_lo;
  __asm__ volatile("csrr %0, mcycle" : "=r"(prev_mcycle_lo));

  uint32_t time = 3000;
  do {
    delta = mtime_lo - prev;
  } while (delta < time);

  __asm__ volatile("csrr %0, mcycle" : "=r"(mcycle_lo));

  lfosc_freq =
      524288000 / (((mcycle_lo - prev_mcycle_lo) / time) * 32768 / 1000);
}

void esp32_init() {
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_SEL) &=
      ~(SPI1_DQ0 | SPI1_DQ1 | SPI1_SCK | SPI1_CS2);
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) &=
      (SPI1_DQ0 | SPI1_DQ1 | SPI1_SCK | SPI1_CS2);
  // enable input on pin 10
  mmio(GPIO_CTRL_ADDR, GPIO_INPUT_EN) |= PIN_10;

  // spi
  mmio(SPI1_CTRL_ADDR, SPI_SCKDIV) = 100u;
  // frame format (proto: single, msb first, normal, 8 bit len)
  mmio(SPI1_CTRL_ADDR, SPI_FMT) =
      (SPI_FMT_PROTO_SINGLE | SPI_FMT_ENDIAN_BIG | SPI_FMT_DIR_NORMAL |
       (8 << SPI_FMT_LEN_SHIFT));
  // set csid to 2
  mmio(SPI1_CTRL_ADDR, SPI_CSID) = 2u;
  // disable direct memory mapping
  mmio(SPI1_CTRL_ADDR, SPI_FCTRL) &= ~(1u);
  // set delay1 intercs to 0
  mmio8(SPI1_CTRL_ADDR, SPI_DELAY1) = 0u;
  // set csmode to AUTO
  mmio(SPI1_CTRL_ADDR, SPI_CSMODE) &= (~SPI_CSMODE_MASK | SPI_CSMODE_AUTO);

  // read all current rxdata
  while (mmio(SPI1_CTRL_ADDR, SPI_RXDATA) > 0) {
  }

  _puts("\r\n");
  at_sendrecv(SPI1_CTRL_ADDR, "ATE0\r\n", 100);
  at_sendrecv(SPI1_CTRL_ADDR, "AT+BLEINIT=0\r\n", 100);
  at_sendrecv(SPI1_CTRL_ADDR, "AT+CWMODE=0\r\n", 100);
  _puts("\r\n");
}

int32_t at_sendrecv(uint32_t spi, const char *cmd, uint32_t timeout) {
  int32_t err;
  err = at_send(spi, cmd, timeout);
  if (err != 0) {
    return err;
  }
  err = at_recv(spi);
  return err;
}

int32_t at_send(uint32_t spi, const char *str, uint32_t timeout) {
  uint32_t len = strlen(str);
  if (esp32_diag_mode != 0) {
    _puts(str);
    _puts("-->");
  }
  int32_t err = at_sendflag(spi, (char)2);
  if (err != 0) {
    return 1;
  }
  // 20001626
  if (esp32_diag_mode > 2) {
    _puts("Flag Sent\r\n");
  }
  // 2000162a
  // no idea what this is supposed to be doing or what generated this code
  uint32_t tmp = len << 16;
  tmp = tmp >> 16;
  uint32_t tmp2 = tmp >> 7;
  tx_buf[1] = (char)tmp2;
  tx_buf[2] = (char)0;
  tx_buf[3] = 'A';
  tx_buf[0] = (char)len;
  spi_transceive_one(spi, 4, 1);
  // end no idea part

  // 2000165e
  if (esp32_diag_mode > 2) {
    _puts("Length Sent\r\n");
  }
  if (at_wait_done(timeout) != 0) {
    _puts("CMD Length Timed Out Busy\r\n");
  } else {
    // 2000166e
    if (esp32_diag_mode > 2) {
      _puts("CMD Length Sent\r\n");
    }
  }
  if (rx_buf[0] != 'b') {
    _puts("Send length error: ");
    _putc(rx_buf[0]);
    _putc(rx_buf[1]);
    _putc(rx_buf[2]);
    _putc(rx_buf[3]);
    return 1;
  }
  strncpy(tx_buf, str, tmp);
  spi_transceive_one(spi, (int32_t)tmp, 1);
  if (rx_buf[0] == 'A') {
    _puts(" Send sync error ");
    return 1;
  }
  if (at_wait_done(timeout) != 0) {
    _puts("CMD Length Timed Out Busy\r\n");
    return err;
  }
  if (esp32_diag_mode > 2) {
    _puts("CMD Done\r\n");
  }
  return 0;
}

int32_t at_recv(uint32_t spi) {
  // todo
  return 0;
}

int32_t at_sendflag(uint32_t spi, char at_flag) {
  // todo
  return 0;
}

int32_t at_wait_done(uint32_t timeout) {
  // todo
  return 0;
}

int32_t spi_transceive_one(uint32_t spi, int32_t num_xfers,
                           int32_t check_ready) {
  wait_ms(5);
  mmio(spi, SPI_CSMODE) &= (~SPI_CSMODE_MASK | SPI_CSMODE_HOLD);
  if (num_xfers > 0) {
    char *tx_pos = tx_buf;
    char *rx_pos = rx_buf;
    do {
      mmio8(spi, SPI_TXDATA) = *tx_pos;
      // seriously there are better ways to write these delays...
      // especially because they're clock based not time based
      uint32_t tmp = 30;
      do {
        tmp--;
      } while (tmp != 0);
      // check that we're at the end of transmission
      if (num_xfers - 1 == rx_pos - rx_buf) {
        mmio(spi, SPI_CSMODE) &= (~SPI_CSMODE_MASK | SPI_CSMODE_AUTO);
      }
      // while rxdata empty
      while ((int32_t)mmio(spi, SPI_CSMODE) < 0) {
      }
      *rx_pos = mmio8(spi, SPI_RXDATA);
      rx_pos++;
      tx_pos++;
    } while (rx_pos != rx_buf + num_xfers);
  }
  return 0;
}

void wait_ms(uint32_t time) {
  // this is approximate since the rtc is 32768Hz and this
  // approximates it as 33000Hz
  mtime_lo = 0u;
  while (mtime_lo < time * 33u)
    ;
}

// 200007b4
void _puts(const char *str) {
  while (*str != 0) {
    uint32_t uart = print_to_uart1 ? UART1_CTRL_ADDR : UART0_CTRL_ADDR;
    // checks if txdata is full and waits until it isn't
    while ((int32_t)mmio(uart, UART_TXDATA) < 0) {
    }
    mmio(uart, UART_TXDATA) = (uint32_t)*str;
    str++;
  }
}

void _putc(char c) {
  uint32_t uart = print_to_uart1 ? UART1_CTRL_ADDR : UART0_CTRL_ADDR;
  // checks if txdata is full and waits until it isn't
  while ((int32_t)mmio(uart, UART_TXDATA) < 0) {
  }
  mmio8(uart, UART_TXDATA) = c;
}

uint32_t strlen(const char *str) {
  uint32_t i;
  for (i = 0; str[i] != '\0'; i++)
    ;
  return i;
}

char *strncpy(char *dest, const char *src, uint32_t n) {
  char *ret = dest;
  do {
    if (!n--) return ret;
  } while (((*dest++) = (*src++)));
  while (n--) *dest++ = 0;
  return ret;
}