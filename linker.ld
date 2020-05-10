OUTPUT_ARCH("riscv")
 
ENTRY(_enter)

MEMORY
{
  flash (rxai!w) : ORIGIN = 0x20010000, LENGTH = 0x6a120
  itim (wx!rai) : ORIGIN = 0x8000000, LENGTH = 0x2000
  ram (wxa!ri) : ORIGIN = 0x80000000, LENGTH = 0x4000
}

PHDRS
{
  flash PT_LOAD;
  ram PT_LOAD;
  ram_init PT_LOAD;
  itim PT_LOAD;
  itim_init PT_LOAD;
}

SECTIONS
{
  __stack_size = DEFINED(__stack_size) ? __stack_size : 1K;
  PROVIDE(__stack_size = __stack_size);
  __heap_size = DEFINED(__heap_size) ? __heap_size : 0x800;

  .init : {
    KEEP(*(.init.enter))
    KEEP(*(.init.*))
    KEEP(*(SORT_NONE(.init)))
  } >flash AT>flash :flash

  .fini : {
    KEEP(*(SORT_NONE(.fini)))
  } >flash AT>flash :flash

  .text : {
    *(.text.unlikely .text.unlikely.*)
    *(.text.startup .text.startup.*)
    *(.text .text.*)
    *(.gnu.linkonce.t.*)
  } >flash AT>flash :flash

  PROVIDE(__etext = .);
  PROVIDE(_etext = .);
  PROVIDE(etext = .);

  .rodata : {
    *(.rdata)
    *(.rodata .rodata.*)
    *(.gnu.linkonce.r.*)
    . = ALIGN(8);
    *(.srodata.cst16)
    *(.srodata.cst8)
    *(.srodata.cst4)
    *(.srodata.cst2)
    *(.srodata .srodata.*)
  } >flash AT>flash :flash

  . = ALIGN(8);

  .preinit_array : {
    PROVIDE_HIDDEN(__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN(__preinit_array_end = .);
  } >flash AT>flash :flash

  .init_array : {
    PROVIDE_HIDDEN(__init_array_start = .);
    KEEP (*(SORT_BY_INIT_PRIORITY(.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)))
    KEEP (*(.init_array EXCLUDE_FILE(*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .ctors))
    PROVIDE_HIDDEN (__init_array_end = .);
  } >flash AT>flash :flash

  .fini_array : {
    PROVIDE_HIDDEN(__fini_array_start = .);
    KEEP(*(SORT_BY_INIT_PRIORITY(.fini_array.*) SORT_BY_INIT_PRIORITY(.dtors.*)))
    KEEP(*(.fini_array EXCLUDE_FILE(*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .dtors))
    PROVIDE_HIDDEN(__fini_array_end = .);
  } >flash AT>flash :flash

  .ctors : {
    KEEP(*crtbegin.o(.ctors))
    KEEP(*crtbegin?.o(.ctors))
    KEEP(*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP(*(SORT(.ctors.*)))
    KEEP(*(.ctors))
  } >flash AT>flash :flash

  .dtors : {
    KEEP(*crtbegin.o(.dtors))
    KEEP(*crtbegin?.o(.dtors))
    KEEP(*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
    KEEP(*(SORT(.dtors.*)))
    KEEP(*(.dtors))
  } >flash AT>flash :flash

  .itim : ALIGN(8) {
    *(.itim .itim.*)
  } >itim AT>flash :itim_init
  PROVIDE(__itim_source_start = LOADADDR(.itim));
  PROVIDE(__itim_target_start = ADDR(.itim) );
  PROVIDE(__itim_target_end = ADDR(.itim) + SIZEOF(.itim));
  PROVIDE(__itim_memory_end = ORIGIN(itim) + LENGTH(itim));

  .data : ALIGN(8) {
    *(.data .data.*)
    *(.gnu.linkonce.d.*)
    . = ALIGN(8);
    PROVIDE(__global_pointer$ = . + 0x800)
    *(.sdata .sdata.* .sdata2.*)
    *(.gnu.linkonce.s.*)
    . = ALIGN(8);
    *(.srodata.cst16)
    *(.srodata.cst8)
    *(.srodata.cst4)
    *(.srodata.cst2)
    *(.srodata .srodata.*)
    . = ALIGN(8);
    *(.rdata)
    *(.rodata .rodata.*)
    *(.gnu.linkonce.r.*)
    *(.gcc_except_table)
    *(.gcc_except_table.*)
  } >ram AT>flash :ram_init
  PROVIDE(__data_source_start = LOADADDR(.data));
  PROVIDE(__data_target_start = ADDR(.data));
  PROVIDE(__data_target_end = ADDR(.data) + SIZEOF(.data));

  .bss : ALIGN(8) {
    *(.sbss*)
    *(.gnu.linkonce.sb.*)
    *(.bss .bss.*)
    *(.gnu.linkonce.b.*)
    *(COMMON)
  } >ram AT>ram :ram
  PROVIDE(__bss_start = ADDR(.bss));
  PROVIDE(__bss_end = ADDR(.bss) + SIZEOF(.bss));

  .stack : {
    __stack_bottom = .;
    . += __stack_size;
    __stack_top = .;
    __cr2_irq_stack_top = .;
  } >ram AT>ram :ram
  PROVIDE(__stack_pointer = ADDR(.stack) + SIZEOF(.stack));

  .heap : {
    PROVIDE(__heap_target_start = .);
    . += __heap_size;
    PROVIDE(__heap_target_end = .);
    PROVIDE(__heap_end = .);
    PROVIDE(end = .);
  } >ram AT>ram :ram
}