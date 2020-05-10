int main() {
  // Restore the default mtvec (which may have been set by initialization
  // code, depending on the environment in which this C code is compiled).
  // By default, this would cause an infinite loop upon exception, which is
  // also "safe" behavior and the debugger can connect.
  __asm__ volatile("csrw mtvec, %0" ::"i"(0x0));
  return 0;
}