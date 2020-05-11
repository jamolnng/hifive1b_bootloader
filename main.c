#include <stdint.h>

#define BACKUP15_MAGIC 0xD027B007

#define AON_CTRL_ADDR 0x10000000ul
#define AON_BACKUP15 0x0BC

#define GPIO_CTRL_ADDR 0x10012000ul
#define GPIO_OUTPUT_EN 0x08
#define GPIO_OUTPUT_VAL 0x0C
#define GPIO_LOW_IP 0x34
#define GPIO_IOF_EN 0x38
#define GPIO_OUT_XOR 0x40

#define CLINT_CTRL_ADDR 0x02000000ul
#define CLINT_MTIMECMP 0x4000
#define CLINT_MTIME 0xBFF8

#define GREEN_LED 0x00080000ul
#define RED_LED 0x00400000ul

#define mmio(reg, offset) (*(volatile uint32_t *)((reg) + (offset)))

int main() {
  uint32_t mtime_lo, mtime_hi, next_lo, next_hi;

  // Restore the default mtvec (which may have been set by initialization
  // code, depending on the environment in which this C code is compiled).
  // By default, this would cause an infinite loop upon exception, which is
  // also "safe" behavior and the debugger can connect.
  __asm__ volatile("csrwi mtvec, 0");

  // 20000256
  if (mmio(AON_CTRL_ADDR, AON_BACKUP15) == BACKUP15_MAGIC) {
    // 200003ec
    // Reset was "double-tapped".
    mmio(AON_CTRL_ADDR, AON_BACKUP15) = 0;

    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) |= RED_LED;
    mmio(GPIO_CTRL_ADDR, GPIO_OUT_XOR) |= RED_LED;
    mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) &= ~RED_LED;
    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) |= RED_LED;

    mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) &= ~GREEN_LED;

    do {
      mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
      mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
      next_lo = mtime_lo + 0x4000;
      next_hi = mtime_hi + (next_lo < mtime_lo);
      // 20000456
      while (mtime_hi < next_hi) {
        mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
      }

      do {
        mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
        mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
      } while (next_hi == mtime_hi && mtime_lo < next_lo);

      mmio(GPIO_CTRL_ADDR, GPIO_OUT_XOR) ^= RED_LED;

    } while (1);
  }
  // 2000025a
  // gpio
  // enable and invert output for pin 19 (green led)
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) |= GREEN_LED;
  mmio(GPIO_CTRL_ADDR, GPIO_OUT_XOR) |= GREEN_LED;

  // disable gpio function on pin 19
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) |= ~GREEN_LED;

  // toggle green led
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_VAL) |= GREEN_LED;

  // disable pin 22 (red led)
  mmio(GPIO_CTRL_ADDR, GPIO_OUTPUT_EN) &= ~RED_LED;

  // disable gpio function on pin 22 (red led)
  mmio(GPIO_CTRL_ADDR, GPIO_IOF_EN) &= ~RED_LED;

  // aon
  // 20000298: could be useless
  // uint32_t aon_backup15 = mmio(AON_CTRL_ADDR, AON_BACKUP15);
  // 2000029c
  mmio(AON_CTRL_ADDR, AON_BACKUP15) = BACKUP15_MAGIC;

  // clint
  mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
  mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
  next_lo = mtime_lo + 0x4000;
  // overflow, add 1 to mtime_hi
  next_hi = mtime_hi + ((next_lo < mtime_lo) ? 1 : 0);

  mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
  mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
  // 200002cc
  if (mtime_hi >= next_hi) {
    // 2000048c
  } else {
    // 200002d0
    // 200002d4
    // 200002e0
    while (mtime_hi < next_hi) {
      mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
    }

    do {
      mtime_lo = mmio(CLINT_CTRL_ADDR, CLINT_MTIME);
      mtime_hi = mmio(CLINT_CTRL_ADDR, CLINT_MTIME + 4);
    } while (mtime_hi == next_hi && mtime_lo < next_lo);
  }
  return 0;
}