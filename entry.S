.section .init
.global _enter
_enter:
  # clear registers
  li    ra, 0
  li    sp, 0
  li    gp, 0
  li    tp, 0
  li    t0, 0
  li    t1, 0
  li    t2, 0
  li    s0, 0
  li    s1, 0
  li    a0, 0
  li    a1, 0
  li    a2, 0
  li    a3, 0
  li    a4, 0
  li    a5, 0
  li    a6, 0
  li    a7, 0
  li    s2, 0
  li    s3, 0
  li    s4, 0
  li    s5, 0
  li    s6, 0
  li    s7, 0
  li    s8, 0
  li    s9, 0
  li    s10, 0
  li    s11, 0
  li    t3, 0
  li    t4, 0
  li    t5, 0
  li    t6, 0
  # let the compiler no that there is no valid return address
  .cfi_undefined ra
  
  # set global pointer
.option push
.option norelax
  la    gp, __global_pointer$ 
.option pop

  # set interrupt trap vector
  la    t0, trap_entry
  csrw  mtvec, t0

  # only counting for hart id = 0
  # since this is for hifive1 rev b
  # and it only has one hart

  # load .data into ram
data_init:
  la    t0, __data_source_start
  la    t1, __data_target_start
  la    t2, __data_target_end
  # check data rom source staring location is not the target source starting location
  beq   t0, t1, data_init_end
  # check data target staring location is not greater or equal to target source ending location
  bgeu  t1, t2, data_init_end
data_init_loop:
  lw    a0, 0(t0)
  addi  t0, t0, 4
  sw    a0, 0(t1)
  addi  t1, t1, 4
  bltu  t1, t2, data_init_loop
data_init_end:

  # load zeros into .bss
bss_init:
  la    t0, __bss_start
  la    t1, __bss_end
  bgeu  t0, t1, bss_init_end
bss_init_loop:
  sw    x0, 0(t0)
  addi  t0, t0, 4
  bleu  t0, t1, bss_init_loop
bss_init_end:
  la    sp, __stack_pointer
  call  main
end_pgm:
  j     end_pgm

.align 2
trap_entry:
  j     trap_entry