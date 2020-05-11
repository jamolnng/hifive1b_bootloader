#include <stdint.h>

#define BACKUP15_MAGIC 0xD027B007ul
#define BACKUP15_MAGIC2 0xBED0BED0ul

#define AON_CTRL_ADDR 0x10000000ul
#define AON_BACKUP1 0x84
#define AON_BACKUP15 0x0BC

#define GPIO_CTRL_ADDR 0x10012000ul
#define GPIO_INPUT_VAL 0x00
#define GPIO_OUTPUT_EN 0x08
#define GPIO_OUTPUT_VAL 0x0C
#define GPIO_LOW_IP 0x34
#define GPIO_REG_IOF_EN 0x38
#define GPIO_OUT_XOR 0x40

#define CLINT_CTRL_ADDR 0x02000000ul
#define CLINT_MTIMECMP 0x4000
#define CLINT_MTIME 0xBFF8

#define PMU_SLEEPI0 0x120
#define PMU_SLEEPI1 0x124
#define PMU_SLEEPI2 0x128
#define PMU_SLEEPI3 0x12C
#define PMU_SLEEPI4 0x130
#define PMU_SLEEPI5 0x134
#define PMU_SLEEPI6 0x138
#define PMU_SLEEPI7 0x13C
#define PMU_SLEEP 0x148
#define PMU_KEY 0x14C

#define PMU_UNLOCK_MAGIC 0x51F15E

#define GREEN_LED 0x00080000ul
#define RED_LED 0x00400000ul

#define mmio(reg, offset) (*(volatile uint32_t *)((reg) + (offset)))

inline void delay_clk(unsigned int cycles) {
  uint32_t mtime_hi, mtime_lo;
  uint32_t next_mtime_hi, next_mtime_lo;
  mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
  mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
  next_mtime_lo = mtime_lo + cycles;
  next_mtime_hi = (next_mtime_lo < mtime_lo) + mtime_hi;

  while (mtime_hi < next_mtime_hi) {
    mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
  }

  do {
    mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
    mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
  } while (next_mtime_hi == mtime_hi && mtime_lo < next_mtime_lo);
}

void bench_rstclk();
void esp32_init();

int main() {
  // Restore the default mtvec (which may have been set by initialization
  // code, depending on the environment in which this C code is compiled).
  // By default, this would cause an infinite loop upon exception, which is
  // also "safe" behavior and the debugger can connect.
  __asm__ volatile("csrwi mtvec, 0");

  uint32_t aon_backup15 = mmio(AON_CTRL_ADDR, AON_BACKUP15);

  if (aon_backup15 == BACKUP15_MAGIC) {
    // double tapped
    while (1) {
      // this looks like it's just spinning while delaying to make it
      // look like it is doing something
      delay_clk(0x4000);
    }
  }

  // disable red and green led io functions
  mmio(GPIO_CTRL_ADDR, GPIO_REG_IOF_EN) &= ~(GREEN_LED | RED_LED);

  delay_clk(0x4000);

  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) = 0;
  mmio(GPIO_CTRL_ADDR, GPIO_OUT_XOR) = 0;

  if (aon_backup15 == BACKUP15_MAGIC2 || aon_backup15 == BACKUP15_MAGIC) {
    mmio(AON_CTRL_ADDR, AON_BACKUP15) = 0;
  } else {
    // sleep instruction
    // delay 2^8 clk cycles, PMU Output En 0 High
    mmio(AON_CTRL_ADDR, PMU_SLEEPI0) = 0x18;
    mmio(AON_CTRL_ADDR, PMU_SLEEPI1) = 0x18;
    mmio(AON_CTRL_ADDR, PMU_SLEEPI2) = 0x18;
    mmio(AON_CTRL_ADDR, PMU_SLEEPI3) = 0x18;
    // delay 2^8 clk cycles, PMU Output En 0 High, PMU Output En 1 High
    mmio(AON_CTRL_ADDR, PMU_SLEEPI4) = 0x38;
    mmio(AON_CTRL_ADDR, PMU_SLEEPI5) = 0x38;
    mmio(AON_CTRL_ADDR, PMU_SLEEPI6) = 0x38;
    mmio(AON_CTRL_ADDR, PMU_SLEEPI7) = 0x38;

    mmio(AON_CTRL_ADDR, AON_BACKUP15) = BACKUP15_MAGIC2;

    mmio(AON_CTRL_ADDR, AON_BACKUP1) = 0;

    mmio(AON_CTRL_ADDR, PMU_KEY) = PMU_UNLOCK_MAGIC;
    mmio(AON_CTRL_ADDR, PMU_SLEEP) = 0;
  }

  delay_clk(0x4000);

  bench_rstclk();
  esp32_init();

  void (*pgm_start)(void) = (void *)0x20100000;
  pgm_start();

  // shouldn't get here
  return 1234567;
}

void bench_rstclk() {}

void esp32_init() {}