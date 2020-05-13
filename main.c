#include <stdint.h>

#define BACKUP15_MAGIC 0xD027B007ul
#define BACKUP15_MAGIC2 0xBED0BED0ul

#define AON_CTRL_ADDR 0x10000000ul
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
#define AON_WDOGKEY_VALUE 0x51F15Eul

#define GPIO_CTRL_ADDR 0x10012000ul
#define GPIO_OUTPUT_EN 0x08u
#define GPIO_OUTPUT_VAL 0x0Cu
#define GPIO_LOW_IP 0x34u
#define GPIO_IOF_EN 0x38u
#define GPIO_IOF_SEL 0x3Cu
#define GPIO_OUTPUT_XOR 0x40u

#define CLINT_CTRL_ADDR 0x02000000ul
#define CLINT_MTIMECMP 0x4000u
#define CLINT_MTIME 0xBFF8u

#define QSPI0_CTRL_ADDR 0x10014000ul
#define SPI_FMT 0x40u
#define SPI_PROTO_SINGLE 0x0u
#define SPI_PROTO_DUAL 0x1u
#define SPI_PROTO_QUAD 0x2u
#define SPI_PROTO_MASK 0x3u

#define UART0_CTRL_ADDR 0x10013000ul
#define UART1_CTRL_ADDR 0x10023000ul
#define UART_TXDATA 0x00u
#define UART_RXDATA 0x04u
#define UART_TX_CTRL 0x08u
#define UART_RX_CTRL 0x0Cu
#define UART_DIV 0x18u
#define UART_RXTX_EN 0x1u

#define PRCI_CTRL_ADDR 0x10008000ul
#define PRCI_PLL_CFG 0x08u
#define PLL_SEL 16u
#define PLL_REF_SEL 17u
#define PLL_BYPASS 18u

#define GREEN_LED 0x00080000ul
#define RED_LED 0x00400000ul
#define UART0_RX 0x10000u
#define UART0_TX 0x20000u
#define UART1_RX 0x40000u
#define UART1_TX 0x800000ul

// mmio (memory mapped i/o) macro
#define mmio32(reg, offset) (*(volatile uint32_t *)((reg) + (offset)))
#define mmio64(reg, offset) (*(volatile uint64_t *)((reg) + (offset)))
#define mmio mmio32

#define mtime_lo mmio(CLINT_CTRL_ADDR, CLINT_MTIME)
#define mtime_hi mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4)
#define mtime mmio64(CLINT_CTRL_ADDR, CLINT_MTIME)

#define PROC_START_ADDR 0x20010000

void bench_rstclk();
void esp32_init();
void measure_lfosc_freq();
void _puts(const char *);

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
  // save = mmio(AON_CTRL_ADDR, AON_BACKUP15)

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

uint32_t print_to_uart1 = 0;

// 2000110e
void bench_rstclk() {
  // set spi to single mode
  mmio(QSPI0_CTRL_ADDR, SPI_FMT) &= ~(SPI_PROTO_MASK) | SPI_PROTO_SINGLE;
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

void esp32_init() {
  // todo
}

uint32_t lfosc_freq;
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