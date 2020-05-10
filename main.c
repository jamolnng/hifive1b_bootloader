#include <stdint.h>

#define BACKUP15_MAGIC 0xD027B007

#define AON_REG_ADDR 0x10000000ul
#define AON_BACKUP15 0x0bc

#define mmio(reg, offset) (*(volatile uint32_t *)((reg) + (offset)))

int main() {
  // Restore the default mtvec (which may have been set by initialization
  // code, depending on the environment in which this C code is compiled).
  // By default, this would cause an infinite loop upon exception, which is
  // also "safe" behavior and the debugger can connect.
  __asm__ volatile("csrwi mtvec, 0");

  if (mmio(AON_REG_ADDR, AON_BACKUP15) == BACKUP15_MAGIC) {
    // Reset was "double-tapped".
  }
  return 0;
}