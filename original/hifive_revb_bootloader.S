
bootloader/hifive_revb_bootloader.hex:     file format ihex


Disassembly of section .sec1:

0000000020000000 <.sec1>:
### entry.S

    20000000:    a011                    j       0x20000004
    20000002:    8082                    ret

    # clear registers (except a0 and a1)
    20000004:    4081                    li      ra,0
    20000006:    4101                    li      sp,0
    20000008:    4181                    li      gp,0
    2000000a:    4201                    li      tp,0
    2000000c:    4281                    li      t0,0
    2000000e:    4301                    li      t1,0
    20000010:    4381                    li      t2,0
    20000012:    4401                    li      s0,0
    20000014:    4481                    li      s1,0
    20000016:    4601                    li      a2,0
    20000018:    4681                    li      a3,0
    2000001a:    4701                    li      a4,0
    2000001c:    4781                    li      a5,0
    2000001e:    4801                    li      a6,0
    20000020:    4881                    li      a7,0
    20000022:    4901                    li      s2,0
    20000024:    4981                    li      s3,0
    20000026:    4a01                    li      s4,0
    20000028:    4a81                    li      s5,0
    2000002a:    4b01                    li      s6,0
    2000002c:    4b81                    li      s7,0
    2000002e:    4c01                    li      s8,0
    20000030:    4c81                    li      s9,0
    20000032:    4d01                    li      s10,0
    20000034:    4d81                    li      s11,0
    20000036:    4e01                    li      t3,0
    20000038:    4e81                    li      t4,0
    2000003a:    4f01                    li      t5,0
    2000003c:    4f81                    li      t6,0

    # set global pointer to 0x80000d80
    2000003e:    60001197                auipc   gp,0x60001
    20000042:    d4218193                addi    gp,gp,-702 # 0x80000d80

    # set interrupt trap handler to 0x200000180
    20000046:    00000297                auipc   t0,0x0
    2000004a:    13a28293                addi    t0,t0,314 # 0x20000180
    2000004e:    30529073                csrw    mtvec,t0

    # enable machine software interrupts
    20000052:    4921                    li      s2,8
    20000054:    30491073                csrw    mie,s2

    # check hart id is 0
    20000058:    4481                    li      s1,0
    2000005a:    f1402973                csrr    s2,mhartid
    2000005e:    05249f63                bne     s1,s2,0x200000bc # hart id != 0

    # hart id == 0
    # check data rom source staring location is not the target source starting location
    20000062:    00002297                auipc   t0,0x2
    20000066:    2de28293                addi    t0,t0,734 # 0x20002340
    2000006a:    60000317                auipc   t1,0x60000
    2000006e:    f9630313                addi    t1,t1,-106 # 0x80000000
    20000072:    00628e63                beq     t0,t1,0x2000008e # 0x20002340 == 0x80000000 (false)

    # check data target staring location is not greater or equal to target source ending location
    20000076:    85018393                addi    t2,gp,-1968 # 0x800005D0
    2000007a:    00737a63                bgeu    t1,t2,0x2000008e # 0x80000000 >= 0x800005D0 (false)

    # loop to load 0x20002340 to 0x2000290F into ram‬ (copy .data to ram)
    2000007e:    0002ae03                lw      t3,0(t0)
    20000082:    01c32023                sw      t3,0(t1)
    20000086:    0291                    addi    t0,t0,4
    20000088:    0311                    addi    t1,t1,4
    2000008a:    fe736ae3                bltu    t1,t2,0x2000007e

    # check that bss start location is not greater or equal to bss end location
    2000008e:    88018293                addi    t0,gp,-1920 # 0x80000600‬
    20000092:    94818313                addi    t1,gp,-1720 # 0x800006C8‬
    20000096:    0062f763                bgeu    t0,t1,0x200000a4 # 0x80000600‬ >= 0x800006C8‬ (false)

    # loop to load 0x80000600‬ to 0x800006C8‬ with zeros (.bss)
    2000009a:    0002a023                sw      zero,0(t0)
    2000009e:    0291                    addi    t0,t0,4
    200000a0:    fe62ede3                bltu    t0,t1,0x2000009a

    # set core local interupt (clint 0x02000000 to 0x02000080) to all ones
    # this is setting the machine-mode software interrupts for all hart
    200000a4:    020004b7                lui     s1,0x2000 # 0x02000000 (clint ctrl addr)
    200000a8:    4905                    li      s2,1
    200000aa:    0124a023                sw      s2,0(s1)
    200000ae:    0491                    addi    s1,s1,4
    200000b0:    02000937                lui     s2,0x2000
    200000b4:    08090913                addi    s2,s2,128 # 0x02000080
    200000b8:    ff24c8e3                blt     s1,s2,0x200000a8 # s1 < 0x02000080

    # heart id != 0
    200000bc:    10500073                wfi     # this should be triggered by the code snippet above for heart 0

    # checks for the mip that was set in the code above, if it isn't set, wfi
    200000c0:    34402973                csrr    s2,mip
    200000c4:    00897913                andi    s2,s2,8
    200000c8:    fe090ae3                beqz    s2,0x200000bc

    # clear clint msip
    200000cc:    020004b7                lui     s1,0x2000 # clint ctrl addr 0x02000000
    200000d0:    f1402973                csrr    s2,mhartid
    200000d4:    090a                    slli    s2,s2,0x2 # hart id * 4
    200000d6:    9926                    add     s2,s2,s1 # 0x02000000 + (hart id * 4) (ex: 0x020000000, 0x02000004, ...)
    200000d8:    00092023                sw      zero,0(s2) # write zero to msip + hart id * 4

    # check that all msips are zero
    # while (value(msip + i * 4) != 0 && addr(msip + i * 4) < addr(msip + 80))
    200000dc:    0004a903                lw      s2,0(s1) # 0x02000000
    200000e0:    fe091ee3                bnez    s2,0x200000dc
    200000e4:    0491                    addi    s1,s1,4 # 0x02000004, 0x02000008, 0x0200000C, ...
    200000e6:    02000937                lui     s2,0x2000 # clint ctrl addr 0x02000000
    200000ea:    08090913                addi    s2,s2,128 # 0x02000080
    200000ee:    ff24c7e3                blt     s1,s2,0x200000dc # 0x02000004, 0x02000008, 0x0200000C, ... < 0x02000080

    # set stack pointer to top of ram
    200000f2:    60004117                auipc   sp,0x60004
    200000f6:    f0e10113                addi    sp,sp,-242 # 0x80004000 (top of ram)

    200000fa:    f14022f3                csrr    t0,mhartid
    200000fe:    00a29313                slli    t1,t0,0xa # hart id * 1024
    20000102:    40610133                sub     sp,sp,t1 # allocate 1024 bytes of ram for each hart stack
    20000106:    4301                    li      t1,0
    20000108:    04629063                bne     t0,t1,0x20000148 # hart id != 0

    # call main
    2000010c:    2a15                    jal     0x20000240 # main

    ## if main returns 0
    2000010e:    a011                    j       0x20000112
    # <abort>
    20000110:    557d                    li      a0,-1

    # <exit_>
    20000112:    cd19                    beqz    a0,0x20000130
    20000114:    8e2a                    mv      t3,a0

    # main does not return 0 <_fail>
    20000116:    e111                    bnez    a0,0x2000011a
    20000118:    4505                    li      a0,1
    2000011a:    35e5                    jal     0x20000002
    2000011c:    6291                    lui     t0,0x4
    2000011e:    00003337                lui     t1,0x3
    20000122:    33330313                addi    t1,t1,819 # 0x3333
    20000126:    0542                    slli    a0,a0,0x10
    20000128:    951a                    add     a0,a0,t1
    2000012a:    00a2a023                sw      a0,0(t0) # 0x4000
    2000012e:    a001                    j       0x2000012e # infinite loop
    # end _fail

    # main returns 0 <_pass>
    20000130:    0ff0000f                fence
    20000134:    4501                    li     a0,0
    20000136:    35f1                    jal    0x20000002 # (instant return)
    20000138:    6291                    lui    t0,0x4 # 4000 (reserved on chip non-volatile memory)
    2000013a:    00005337                lui    t1,0x5
    2000013e:    55530313                addi   t1,t1,1365 # 0x5555
    20000142:    0062a023                sw     t1,0(t0) # 0x4000
    20000146:    a001                    j      0x20000146 # infinite loop

    # hart id != 0
    20000148:    f1402573                csrr   a0,mhartid
    2000014c:    2005                    jal    0x2000016c

    # this doesn't get called? at least not on hifive1b
    # I think this is the exit protocol for harts except hart 0
    2000014e:    cd19                    beqz   a0,0x2000016c
    20000150:    8e2a                    mv     t3,a0
    20000152:    e111                    bnez   a0,0x20000156
    20000154:    4505                    li     a0,1
    20000156:    3575                    jal    0x20000002 # (instant return)
    20000158:    6291                    lui    t0,0x4
    2000015a:    00003337                lui    t1,0x3
    2000015e:    33330313                addi   t1,t1,819 # 0x3333
    20000162:    0542                    slli   a0,a0,0x10
    20000164:    951a                    add    a0,a0,t1
    20000166:    00a2a023                sw     a0,0(t0) # 0x4000
    2000016a:    a001                    j      0x2000016a # infinte loop
    # end _pass

    # origin 0x2000014c <slave_main>
    2000016c:    10500073                wfi
    20000170:    bff5                    j      0x2000016c # infinite loop
    20000172:    00000013                nop
    20000176:    00000013                nop
    2000017a:    00000013                nop
    2000017e:    0001                    nop

    # initial interrupt trap vector
    20000180:    7119                    addi   sp,sp,-128
    20000182:    c206                    sw     ra,4(sp)
    20000184:    c60e                    sw     gp,12(sp)
    20000186:    c812                    sw     tp,16(sp)
    20000188:    ca16                    sw     t0,20(sp)
    2000018a:    cc1a                    sw     t1,24(sp)
    2000018c:    ce1e                    sw     t2,28(sp)
    2000018e:    d022                    sw     s0,32(sp)
    20000190:    d226                    sw     s1,36(sp)
    20000192:    d42a                    sw     a0,40(sp)
    20000194:    d62e                    sw     a1,44(sp)
    20000196:    d832                    sw     a2,48(sp)
    20000198:    da36                    sw     a3,52(sp)
    2000019a:    dc3a                    sw     a4,56(sp)
    2000019c:    de3e                    sw     a5,60(sp)
    2000019e:    c0c2                    sw     a6,64(sp)
    200001a0:    c2c6                    sw     a7,68(sp)
    200001a2:    c4ca                    sw     s2,72(sp)
    200001a4:    c6ce                    sw     s3,76(sp)
    200001a6:    c8d2                    sw     s4,80(sp)
    200001a8:    cad6                    sw     s5,84(sp)
    200001aa:    ccda                    sw     s6,88(sp)
    200001ac:    cede                    sw     s7,92(sp)
    200001ae:    d0e2                    sw     s8,96(sp)
    200001b0:    d2e6                    sw     s9,100(sp)
    200001b2:    d4ea                    sw     s10,104(sp)
    200001b4:    d6ee                    sw     s11,108(sp)
    200001b6:    d8f2                    sw     t3,112(sp)
    200001b8:    daf6                    sw     t4,116(sp)
    200001ba:    dcfa                    sw     t5,120(sp)
    200001bc:    defe                    sw     t6,124(sp)
    200001be:    850a                    mv     a0,sp
    200001c0:    046000ef                jal    ra,0x20000206
    200001c4:    4092                    lw     ra,4(sp)
    200001c6:    41b2                    lw     gp,12(sp)
    200001c8:    4242                    lw     tp,16(sp)
    200001ca:    42d2                    lw     t0,20(sp)
    200001cc:    4362                    lw     t1,24(sp)
    200001ce:    43f2                    lw     t2,28(sp)
    200001d0:    5402                    lw     s0,32(sp)
    200001d2:    5492                    lw     s1,36(sp)
    200001d4:    5522                    lw     a0,40(sp)
    200001d6:    55b2                    lw     a1,44(sp)
    200001d8:    5642                    lw     a2,48(sp)
    200001da:    56d2                    lw     a3,52(sp)
    200001dc:    5762                    lw     a4,56(sp)
    200001de:    57f2                    lw     a5,60(sp)
    200001e0:    4806                    lw     a6,64(sp)
    200001e2:    4896                    lw     a7,68(sp)
    200001e4:    4926                    lw     s2,72(sp)
    200001e6:    49b6                    lw     s3,76(sp)
    200001e8:    4a46                    lw     s4,80(sp)
    200001ea:    4ad6                    lw     s5,84(sp)
    200001ec:    4b66                    lw     s6,88(sp)
    200001ee:    4bf6                    lw     s7,92(sp)
    200001f0:    5c06                    lw     s8,96(sp)
    200001f2:    5c96                    lw     s9,100(sp)
    200001f4:    5d26                    lw     s10,104(sp)
    200001f6:    5db6                    lw     s11,108(sp)
    200001f8:    5e46                    lw     t3,112(sp)
    200001fa:    5ed6                    lw     t4,116(sp)
    200001fc:    5f66                    lw     t5,120(sp)
    200001fe:    5ff6                    lw     t6,124(sp)
    20000200:    6109                    addi   sp,sp,128
    20000202:    30200073                mret
    20000206:    342022f3                csrr   t0,mcause
    2000020a:    00500533                add    a0,zero,t0
    2000020e:    b721                    j      0x20000116
    # end trap vector
    ...

### main.c
    # main()
    20000240:    1101                    addi   sp,sp,-32
    20000242:    ce06                    sw     ra,28(sp)

    # clear trap vector to zero so will loop on interrupt
    20000244:    30505073                csrwi  mtvec,0

    # load AON_BACKUP15
    20000248:    10000737                lui    a4,0x10000 # 0x10000000 AON
    2000024c:    0bc72783                lw     a5,188(a4) # 0x100000bc AON_BACKUP15

    ## if AON_BACKUP15 == BACKUP15_MAGIC
    # double tapped
    20000250:    d027b6b7                lui    a3,0xd027b # 0xD027B000
    20000254:    069d                    addi   a3,a3,7 # 0xD027B007‬ BACKUP15_MAGIC
    20000256:    18d78b63                beq    a5,a3,0x200003ec

    ## else not double tapped
    # gpio
    2000025a:    100127b7                lui    a5,0x10012 # 0x10012000 GPIO
    2000025e:    4790                    lw     a2,8(a5) # load 0x10012008 (output_en)
    20000260:    00080537                lui    a0,0x80 # 0x00080000 (green led)
    20000264:    fff80837                lui    a6,0xfff80 # 0xFFF80000‬
    20000268:    8e49                    or     a2,a2,a0 # output enable pin 19 (green led)
    2000026a:    c790                    sw     a2,8(a5) # write to enable
    2000026c:    43b0                    lw     a2,64(a5) # load 0x10012040‬ (out_xor)
    2000026e:    187d                    addi   a6,a6,-1 # 0xFFF7FFFF‬
    20000270:    0200c8b7                lui    a7,0x200c # 0x0200C000‬ (clint)
    20000274:    8e49                    or     a2,a2,a0 # out_xor pin 19 (green led)
    20000276:    c3b0                    sw     a2,64(a5) # write to enable
    20000278:    5f8c                    lw     a1,56(a5) # load 0x10012038 (iof_en)
    2000027a:    ffc00637                lui    a2,0xffc00 # 0xFFC00000‬
    2000027e:    167d                    addi   a2,a2,-1 # 0xFFBFFFFF‬
    20000280:    0105f5b3                and    a1,a1,a6 # disable pin 19 (green led) io function
    20000284:    df8c                    sw     a1,56(a5) # write to disable
    20000286:    47cc                    lw     a1,12(a5) # load 0x1001200C (output_val)
    20000288:    8dc9                    or     a1,a1,a0 # toggle pin 19 (green led)
    2000028a:    c7cc                    sw     a1,12(a5) # write to enable
    2000028c:    478c                    lw     a1,8(a5) # load 0x10012008 (output_en)
    2000028e:    8df1                    and    a1,a1,a2 # output disable pin 22 (red led)
    20000290:    c78c                    sw     a1,8(a5) # write to disable
    20000292:    5f8c                    lw     a1,56(a5) # load 0x10012038 (iof_en)
    20000294:    8e6d                    and    a2,a2,a1 # disable pin 22 (red led) io function
    20000296:    df90                    sw     a2,56(a5) # write to disable
    # aon
    20000298:    0bc72803                lw     a6,188(a4) # 0x100000bc AON_BACKUP15
    2000029c:    0ad72e23                sw     a3,188(a4) # write BACKUP15_MAGIC to AON_BACKUP15
    # clint
    # delay
    200002a0:    ff88a703                lw     a4,-8(a7) # 0x200bff8 mtime_lo
    200002a4:    ffc8a783                lw     a5,-4(a7) # 0x200bffc mtime_hi
    200002a8:    c03a                    sw     a4,0(sp) # save mtime_lo to the stack
    200002aa:    c23e                    sw     a5,4(sp) # save mtime_hi to the stack
    200002ac:    4502                    lw     a0,0(sp) # copy mtime_low to a0
    200002ae:    6791                    lui    a5,0x4 # 0x4000 (number of ticks)
    200002b0:    4592                    lw     a1,4(sp) # copy mtime_hi to a1
    200002b2:    97aa                    add    a5,a5,a0 # 0x4000 + mtime_lo (next_mtime_lo)
    200002b4:    00a7b733                sltu   a4,a5,a0 # a4 = 1 if a5 < a1, else a4 = 0 (checks for overflow)
    200002b8:    c43e                    sw     a5,8(sp) # store next_mtime_lo to stack
    200002ba:    00b706b3                add    a3,a4,a1 # if mtime_lo overflow add one to mtime_hi (next_mtime_hi)
    200002be:    c636                    sw     a3,12(sp) # store next_mtime_hi to stack
    200002c0:    ff88a603                lw     a2,-8(a7) # 0x200bff8 mtime_lo
    200002c4:    ffc8a683                lw     a3,-4(a7) # 0x200bffc mtime_hi
    200002c8:    4722                    lw     a4,8(sp) # copy next_mtime_lo to a4
    200002ca:    47b2                    lw     a5,12(sp) # copy next_mtime_hi to a5
    200002cc:    1cf6f063                bgeu   a3,a5,0x2000048c # if mtime_hi >= next_mtime_hi
    # while (mtime_hi < next_mtime_hi) {
    200002d0:    0200c8b7                lui    a7,0x200c
    200002d4:    ff88a603                lw     a2,-8(a7) # 0x200bff8 mtime_lo
    200002d8:    ffc8a683                lw     a3,-4(a7) # mtime_hi
    200002dc:    4722                    lw     a4,8(sp) # copy next_mtime_lo to a4
    200002de:    47b2                    lw     a5,12(sp) # copy next_mtime_hi to a5
    200002e0:    fef6eae3                bltu   a3,a5,0x200002d4 # if mtime_hi < next_mtime_hi
    # }
    200002e4:    00d79463                bne    a5,a3,0x200002ec
    200002e8:    fee666e3                bltu   a2,a4,0x200002d4
    //aon
    200002ec:    100007b7                lui    a5,0x10000
    200002f0:    0b07ae23                sw     a6,188(a5) # 0x100000bc AON_BACKUP15
    //gpio
    200002f4:    10012737                lui    a4,0x10012 # GPIO 0x10012000
    200002f8:    00072623                sw     zero,12(a4) # 0x1001200C (output_val) = 0
    200002fc:    04072023                sw     zero,64(a4) # 0x10012040 (out_xor) = 0
    20000300:    00072423                sw     zero,8(a4) # 0x10012008 (out_en) = 0
    //aon
    ## if (save == BACKUP15_MAGIC2 || save == BACKUP15_MAGIC)
    20000304:    0bc7a703                lw     a4,188(a5) # 0x100000bc AON_BACKUP15
    20000308:    bed0c6b7                lui    a3,0xbed0c # BED0C000
    2000030c:    ed068693                addi   a3,a3,-304 # 0xbed0bed0 BACKUP15_MAGIC2
    20000310:    18d70363                beq    a4,a3,0x20000496
    20000314:    0bc7a603                lw     a2,188(a5) # 0x100000bc AON_BACKUP15
    20000318:    d027b737                lui    a4,0xd027b # 0x0xD027B000
    2000031c:    071d                    addi   a4,a4,7 # 0xD027B007 BACKUP15_MAGIC
    2000031e:    16e60c63                beq    a2,a4,0x20000496
    ## else {
    # set pmu sleep instructions 0-3 to 0x18
    20000322:    0051f737                lui    a4,0x51f
    20000326:    15e70713                addi   a4,a4,350 # 0x51f15e
    2000032a:    14e7a623                sw     a4,332(a5) # 0x1000014C AON_PMUKEY
    2000032e:    4661                    li     a2,24 # 0x18
    20000330:    12c7a023                sw     a2,288(a5)
    20000334:    14e7a623                sw     a4,332(a5)
    20000338:    12c7a223                sw     a2,292(a5)
    2000033c:    14e7a623                sw     a4,332(a5)
    20000340:    12c7a423                sw     a2,296(a5)
    20000344:    14e7a623                sw     a4,332(a5)
    20000348:    12c7a623                sw     a2,300(a5)
    # set pmu sleep instructions 4-7 to 0x38
    2000034c:    14e7a623                sw     a4,332(a5)
    20000350:    03800613                li     a2,56 # 0x38
    20000354:    12c7a823                sw     a2,304(a5)
    20000358:    14e7a623                sw     a4,332(a5)
    2000035c:    12c7aa23                sw     a2,308(a5)
    20000360:    14e7a623                sw     a4,332(a5)
    20000364:    12c7ac23                sw     a2,312(a5)
    20000368:    14e7a623                sw     a4,332(a5)
    2000036c:    12c7ae23                sw     a2,316(a5)

    20000370:    0ad7ae23                sw     a3,188(a5) # AON_BACKUP15 = BACKUP15_MAGIC2

    20000374:    0807a223                sw     zero,132(a5) # 0x10000084 AON_BACKUP1

    20000378:    14e7a623                sw     a4,332(a5) # 0x1000014C AON_PMUKEY
    2000037c:    1407a423                sw     zero,328(a5) # 0x10000148 AON_PMUSLEEP
    # }
    # delay
    20000380:    0200c737                lui    a4,0x200c
    20000384:    ff872603                lw     a2,-8(a4) # 0x200bff8 mtime_lo
    20000388:    ffc72683                lw     a3,-4(a4) # mtime_hi
    2000038c:    6791                    lui    a5,0x4 # 0x00004000
    2000038e:    c032                    sw     a2,0(sp) # save mtime_lo to stack
    20000390:    c236                    sw     a3,4(sp) # save mtime_hi to stack
    20000392:    4802                    lw     a6,0(sp) # a6 = mtime_lo
    20000394:    4892                    lw     a7,4(sp) # a7 = mtime_hi
    20000396:    97c2                    add    a5,a5,a6 # next_lo = mtime_lo + 0x4000
    20000398:    0107b533                sltu   a0,a5,a6 # next_lo < mtime_low overflow bit
    2000039c:    c43e                    sw     a5,8(sp) # save next_lo to stack
    2000039e:    011506b3                add    a3,a0,a7 # next_hi = mtime_hi + overflow bit
    200003a2:    c636                    sw     a3,12(sp) # save next_hi to stack
    200003a4:    ff872603                lw     a2,-8(a4) # a2 = mtime_lo
    200003a8:    ffc72683                lw     a3,-4(a4) # a3 = mtime_hi
    200003ac:    4722                    lw     a4,8(sp) # a4 = next_lo
    200003ae:    47b2                    lw     a5,12(sp) # a5 = next_hi
    200003b0:    0ef6f863                bgeu   a3,a5,0x200004a0 # if mtime_hi >= next_hi
    200003b4:    0200c837                lui    a6,0x200c # 0x200C0000
    200003b8:    ff882603                lw     a2,-8(a6) # 0x200bff8 mtime_lo
    200003bc:    ffc82683                lw     a3,-4(a6) # mtime_hi
    200003c0:    4722                    lw     a4,8(sp) # a4 = next_lo
    200003c2:    47b2                    lw     a5,12(sp) # a5 = next_hi
    200003c4:    fef6eae3                bltu   a3,a5,0x200003b8
    200003c8:    00d79463                bne    a5,a3,0x200003d0
    200003cc:    fee666e3                bltu   a2,a4,0x200003b8

    200003d0:    53f000ef                jal    ra,0x2000110e # bench_rstclk
    200003d4:    6f8010ef                jal    ra,0x20001acc # esp32_init
    200003d8:    200107b7                lui    a5,0x20010
    200003dc:    9782                    jalr   a5 # call users program at 0x20010000
    200003de:    40f2                    lw     ra,28(sp)
    200003e0:    0012d537                lui    a0,0x12d
    200003e4:    68750513                addi   a0,a0,1671 # 0x12d687
    200003e8:    6105                    addi   sp,sp,32
    200003ea:    8082                    ret

    # double tapped
    # a4 = 10000000
    200003ec:    0a072e23                sw     zero,188(a4) # AON_BACKUP15 = 0
    200003f0:    100127b7                lui    a5,0x10012 # GPIO 0x10012000
    200003f4:    4798                    lw     a4,8(a5) # 0x10012008 (output_en)
    200003f6:    00400637                lui    a2,0x400 # 0x00400000 (red led)
    200003fa:    ffc005b7                lui    a1,0xffc00 # 0xFFC00000
    200003fe:    8f51                    or     a4,a4,a2 # output enable pin 22 (red led)
    20000400:    c798                    sw     a4,8(a5) # enable pin 22 (red led) write
    20000402:    43b8                    lw     a4,64(a5) # 0x10012040 (out_xor)
    20000404:    15fd                    addi   a1,a1,-1 # 0xFFBFFFFF ~(red led)
    20000406:    0200c837                lui    a6,0x200c # 0x0200C000
    2000040a:    8f51                    or     a4,a4,a2 # xor enable pin 22 (red led)
    2000040c:    c3b8                    sw     a4,64(a5) # enable xor pin 22 (red led) write
    2000040e:    5f94                    lw     a3,56(a5) # 0x10012038 (iof_en)
    20000410:    fff80737                lui    a4,0xfff80 # 0xFFF80000
    20000414:    177d                    addi   a4,a4,-1 # 0xFFF7FFFF ~(green led)
    20000416:    8eed                    and    a3,a3,a1 # disable iof_en pin 22 (red led)
    20000418:    df94                    sw     a3,56(a5) # disable iof_en pin 22 (red led) write
    2000041a:    47d4                    lw     a3,12(a5) # 0x1001200C (out_val)
    2000041c:    6e11                    lui    t3,0x4 # 0x00004000
    2000041e:    100128b7                lui    a7,0x10012 # GPIO 0x10012000
    20000422:    8ed1                    or     a3,a3,a2 # high pin 22 (red led)
    20000424:    c7d4                    sw     a3,12(a5) # high pin 22 (red led) on write
    20000426:    4794                    lw     a3,8(a5) # 0x10012008 (output_en)
    20000428:    00400337                lui    t1,0x400 # 0x00400000 (red led)
    2000042c:    8ef9                    and    a3,a3,a4 # disable pin 19 (green led)
    2000042e:    c794                    sw     a3,8(a5) # disable pin 19 (green led) write
    20000430:    5f94                    lw     a3,56(a5) # 0x10012038 (iof_en)
    20000432:    8f75                    and    a4,a4,a3 # disable iof_en pin 19 (green led)
    20000434:    df98                    sw     a4,56(a5) # disable iof_en pin 19 (green led) write
    # do {
    # delay
    20000436:    ff882703                lw     a4,-8(a6) # 0x200bff8 (mtime_lo)
    2000043a:    ffc82783                lw     a5,-4(a6) # mtime_hi
    2000043e:    c03a                    sw     a4,0(sp) # save mtime_lo on stack
    20000440:    c23e                    sw     a5,4(sp) # save mtime_hi on stack
    20000442:    4e82                    lw     t4,0(sp) # t4 = saved mtime_lo
    20000444:    4f12                    lw     t5,4(sp) # t5 = saved mtime_hi
    20000446:    01ce85b3                add    a1,t4,t3 # next_lo = saved_mtime_lo + 0x4000
    2000044a:    01d5b633                sltu   a2,a1,t4 # overflow bit = next_lo < mtime_lo checks
    2000044e:    c42e                    sw     a1,8(sp) # save next_lo to stack 
    20000450:    01e607b3                add    a5,a2,t5 # next_hi = mtime_hi + overflow bit
    20000454:    c63e                    sw     a5,12(sp) # save next_hi to stack
    # while(mtime_hi < next_hi)
    20000456:    ff882503                lw     a0,-8(a6) # a0 = mtime_lo
    2000045a:    ffc82583                lw     a1,-4(a6) # a1 = mtime_hi
    2000045e:    4622                    lw     a2,8(sp) # a2 = next_lo
    20000460:    46b2                    lw     a3,12(sp) # a3 = next_hi
    20000462:    00d5fa63                bgeu   a1,a3,0x20000476
    20000466:    ff882503                lw     a0,-8(a6) # a0 = mtime_lo
    2000046a:    ffc82583                lw     a1,-4(a6) # a1 = mtime_hi
    2000046e:    4622                    lw     a2,8(sp) # a2 = next_lo
    20000470:    46b2                    lw     a3,12(sp) # a3 = next_hi
    20000472:    fed5eae3                bltu   a1,a3,0x20000466
    # }
    20000476:    00b69463                bne    a3,a1,0x2000047e
    2000047a:    fec566e3                bltu   a0,a2,0x20000466
    2000047e:    0408a783                lw     a5,64(a7) # 0x10012040 (out_xor)
    20000482:    0067c7b3                xor    a5,a5,t1 # toggle xor pin 22 (red led)
    20000486:    04f8a023                sw     a5,64(a7) # toggle xor pin 22 (red led) write
    2000048a:    b775                    j      0x20000436
    # } while(1)

    ## jump from (200002cc) if mtime_hi > next_mtime_hi
    2000048c:    e6d790e3                bne    a5,a3,0x200002ec
    20000490:    e4e660e3                bltu   a2,a4,0x200002d0
    20000494:    bda1                    j      0x200002ec

    # save == BACKUP15_MAGIC2 || save == BACKUP15_MAGIC (20000310 || 2000031e)
    20000496:    100007b7              lui    a5,0x10000
    2000049a:    0a07ae23              sw    zero,188(a5) # 0x100000bc
    2000049e:    b5cd                    j    0x20000380

    200004a0:    f2d798e3              bne    a5,a3,0x200003d0
    200004a4:    f0e668e3              bltu    a2,a4,0x200003b4
    200004a8:    b725                    j    0x200003d0

    200004aa:    100126b7              lui    a3,0x10012
    200004ae:    46cc                    lw    a1,12(a3)
    200004b0:    00680637              lui    a2,0x680
    200004b4:    00c577b3              and    a5,a0,a2
    200004b8:    fff7c793              not    a5,a5
    200004bc:    fff54713              not    a4,a0
    200004c0:    00b7f533              and    a0,a5,a1
    200004c4:    00c777b3              and    a5,a4,a2
    200004c8:    8d5d                    or    a0,a0,a5
    200004ca:    c6c8                    sw    a0,12(a3)
    200004cc:    8082                    ret
    200004ce:    1141                    addi    sp,sp,-16
    200004d0:    00680737              lui    a4,0x680
    200004d4:    c606                    sw    ra,12(sp)
    200004d6:    100127b7              lui    a5,0x10012
    200004da:    03070713              addi    a4,a4,48 # 0x680030
    200004de:    c798                    sw    a4,8(a5)
    200004e0:    0207ac23              sw    zero,56(a5) # 0x10012038
    200004e4:    c7d8                    sw    a4,12(a5)
    200004e6:    577d                    li    a4,-1
    200004e8:    00200537              lui    a0,0x200
    200004ec:    cbd8                    sw    a4,20(a5)
    200004ee:    3f75                    jal    0x200004aa
    200004f0:    40b2                    lw    ra,12(sp)
    200004f2:    4501                    li    a0,0
    200004f4:    0141                    addi    sp,sp,16
    200004f6:    8082                    ret
    200004f8:    1141                    addi    sp,sp,-16
    200004fa:    c606                    sw    ra,12(sp)
    200004fc:    157d                    addi    a0,a0,-1
    200004fe:    4789                    li    a5,2
    20000500:    00a7ee63              bltu    a5,a0,0x2000051c
    20000504:    200027b7              lui    a5,0x20002
    20000508:    ec078793              addi    a5,a5,-320 # 0x20001ec0
    2000050c:    050a                    slli    a0,a0,0x2
    2000050e:    953e                    add    a0,a0,a5
    20000510:    4108                    lw    a0,0(a0)
    20000512:    3f61                    jal    0x200004aa
    20000514:    40b2                    lw    ra,12(sp)
    20000516:    4505                    li    a0,1
    20000518:    0141                    addi    sp,sp,16
    2000051a:    8082                    ret
    2000051c:    00400537              lui    a0,0x400
    20000520:    3769                    jal    0x200004aa
    20000522:    40b2                    lw    ra,12(sp)
    20000524:    4505                    li    a0,1
    20000526:    0141                    addi    sp,sp,16
    20000528:    8082                    ret
    2000052a:    1141                    addi    sp,sp,-16
    2000052c:    00080537              lui    a0,0x80
    20000530:    c606                    sw    ra,12(sp)
    20000532:    3fa5                    jal    0x200004aa
    20000534:    40b2                    lw    ra,12(sp)
    20000536:    4501                    li    a0,0
    20000538:    0141                    addi    sp,sp,16
    2000053a:    8082                    ret

    # <_putc.part.0>
    2000053c:    10023737                lui     a4,0x10023 # 0x10023000 uart1
    20000540:    431c                    lw      a5,0(a4) # tx data
    20000542:    fe07cfe3                bltz    a5,0x20000540 # while tx data is full
    20000546:    c308                    sw      a0,0(a4) # write char to tx data
    20000548:    8082                    ret

    2000054a:    100107b7              lui    a5,0x10010
    2000054e:    d788                    sw    a0,40(a5)
    20000550:    b00027f3              csrr    a5,mcycle
    20000554:    b8002773              csrr    a4,mcycleh
    20000558:    00178513              addi    a0,a5,1 # 0x10010001
    2000055c:    00f537b3              sltu    a5,a0,a5
    20000560:    973e                    add    a4,a4,a5
    20000562:    b00026f3              csrr    a3,mcycle
    20000566:    b80027f3              csrr    a5,mcycleh
    2000056a:    fee7ece3              bltu    a5,a4,0x20000562
    2000056e:    00f71463              bne    a4,a5,0x20000576
    20000572:    fea6e8e3              bltu    a3,a0,0x20000562
    20000576:    fff60e13              addi    t3,a2,-1 # 0x67ffff
    2000057a:    03e00793              li    a5,62
    2000057e:    02fe5e33              divu    t3,t3,a5
    20000582:    4681                    li    a3,0
    20000584:    4305                    li    t1,1
    20000586:    10010537              lui    a0,0x10010
    2000058a:    02000813              li    a6,32
    2000058e:    0e05                    addi    t3,t3,1
    20000590:    a021                    j    0x20000598
    20000592:    0685                    addi    a3,a3,1
    20000594:    09068963              beq    a3,a6,0x20000626
    20000598:    00d5d7b3              srl    a5,a1,a3
    2000059c:    8b85                    andi    a5,a5,1
    2000059e:    dbf5                    beqz    a5,0x20000592
    200005a0:    00d317b3              sll    a5,t1,a3
    200005a4:    d55c                    sw    a5,44(a0)
    200005a6:    b00027f3              csrr    a5,mcycle
    200005aa:    b8002773              csrr    a4,mcycleh
    200005ae:    00178893              addi    a7,a5,1
    200005b2:    00f8b7b3              sltu    a5,a7,a5
    200005b6:    973e                    add    a4,a4,a5
    200005b8:    b0002673              csrr    a2,mcycle
    200005bc:    b80027f3              csrr    a5,mcycleh
    200005c0:    fee7ece3              bltu    a5,a4,0x200005b8
    200005c4:    00f71463              bne    a4,a5,0x200005cc
    200005c8:    ff1668e3              bltu    a2,a7,0x200005b8
    200005cc:    00652223              sw    t1,4(a0) # 0x10010004
    200005d0:    b00027f3              csrr    a5,mcycle
    200005d4:    b8002773              csrr    a4,mcycleh
    200005d8:    01c788b3              add    a7,a5,t3
    200005dc:    00f8b7b3              sltu    a5,a7,a5
    200005e0:    973e                    add    a4,a4,a5
    200005e2:    b0002673              csrr    a2,mcycle
    200005e6:    b80027f3              csrr    a5,mcycleh
    200005ea:    fee7ece3              bltu    a5,a4,0x200005e2
    200005ee:    00f71463              bne    a4,a5,0x200005f6
    200005f2:    ff1668e3              bltu    a2,a7,0x200005e2
    200005f6:    00052223              sw    zero,4(a0)
    200005fa:    b00027f3              csrr    a5,mcycle
    200005fe:    b8002773              csrr    a4,mcycleh
    20000602:    00778893              addi    a7,a5,7
    20000606:    00f8b7b3              sltu    a5,a7,a5
    2000060a:    973e                    add    a4,a4,a5
    2000060c:    b0002673              csrr    a2,mcycle
    20000610:    b80027f3              csrr    a5,mcycleh
    20000614:    fee7ece3              bltu    a5,a4,0x2000060c
    20000618:    f6f71de3              bne    a4,a5,0x20000592
    2000061c:    ff1668e3              bltu    a2,a7,0x2000060c
    20000620:    0685                    addi    a3,a3,1
    20000622:    f7069be3              bne    a3,a6,0x20000598
    20000626:    8082                    ret
    20000628:    b0002573              csrr    a0,mcycle
    2000062c:    b80025f3              csrr    a1,mcycleh
    20000630:    8082                    ret
    20000632:    0200c7b7              lui    a5,0x200c
    20000636:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    2000063a:    ff87a683              lw    a3,-8(a5)
    2000063e:    b0002673              csrr    a2,mcycle
    20000642:    b80027f3              csrr    a5,mcycleh
    20000646:    0200c737              lui    a4,0x200c
    2000064a:    ff872783              lw    a5,-8(a4) # 0x200bff8
    2000064e:    8f95                    sub    a5,a5,a3
    20000650:    fea7ede3              bltu    a5,a0,0x2000064a
    20000654:    b00027f3              csrr    a5,mcycle
    20000658:    b8002773              csrr    a4,mcycleh
    2000065c:    8f91                    sub    a5,a5,a2
    2000065e:    02a7d533              divu    a0,a5,a0
    20000662:    02b50533              mul    a0,a0,a1
    20000666:    8082                    ret
    20000668:    8801a783              lw    a5,-1920(gp)
    2000066c:    86aa                    mv    a3,a0
    2000066e:    10013737              lui    a4,0x10013
    20000672:    c391                    beqz    a5,0x20000676
    20000674:    b5e1                    j    0x2000053c
    20000676:    431c                    lw    a5,0(a4)
    20000678:    fe07cfe3              bltz    a5,0x20000676
    2000067c:    c314                    sw    a3,0(a4)
    2000067e:    8082                    ret
    20000680:    e509                    bnez    a0,0x2000068a
    20000682:    b0002573              csrr    a0,mcycle
    20000686:    b80027f3              csrr    a5,mcycleh
    2000068a:    01e55713              srli    a4,a0,0x1e
    2000068e:    00a55793              srli    a5,a0,0xa
    20000692:    8fb9                    xor    a5,a5,a4
    20000694:    8fa9                    xor    a5,a5,a0
    20000696:    01f55713              srli    a4,a0,0x1f
    2000069a:    8fb9                    xor    a5,a5,a4
    2000069c:    07fe                    slli    a5,a5,0x1f
    2000069e:    8105                    srli    a0,a0,0x1
    200006a0:    8d5d                    or    a0,a0,a5
    200006a2:    8082                    ret
    200006a4:    10012737              lui    a4,0x10012
    200006a8:    471c                    lw    a5,8(a4)
    200006aa:    100126b7              lui    a3,0x10012
    200006ae:    0207e793              ori    a5,a5,32
    200006b2:    c71c                    sw    a5,8(a4)
    200006b4:    b00027f3              csrr    a5,mcycle
    200006b8:    b8002773              csrr    a4,mcycleh
    200006bc:    2007f793              andi    a5,a5,512
    200006c0:    fbf5                    bnez    a5,0x200006b4
    200006c2:    46dc                    lw    a5,12(a3)
    200006c4:    0207e793              ori    a5,a5,32
    200006c8:    c6dc                    sw    a5,12(a3)
    200006ca:    b00027f3              csrr    a5,mcycle
    200006ce:    b8002773              csrr    a4,mcycleh
    200006d2:    2007f793              andi    a5,a5,512
    200006d6:    dbf5                    beqz    a5,0x200006ca
    200006d8:    46dc                    lw    a5,12(a3)
    200006da:    fdf7f793              andi    a5,a5,-33
    200006de:    c6dc                    sw    a5,12(a3)
    200006e0:    bfd1                    j    0x200006b4
    200006e2:    8801a883              lw    a7,-1920(gp)
    200006e6:    0a088a63              beqz    a7,0x2000079a
    200006ea:    100237b7              lui    a5,0x10023
    200006ee:    0047a803              lw    a6,4(a5) # 0x10023004
    200006f2:    c94d                    beqz    a0,0x200007a4
    200006f4:    01005b63              blez    a6,0x2000070a
    200006f8:    100136b7              lui    a3,0x10013
    200006fc:    10023737              lui    a4,0x10023
    20000700:    0a088663              beqz    a7,0x200007ac
    20000704:    435c                    lw    a5,4(a4)
    20000706:    fef04de3              bgtz    a5,0x20000700
    2000070a:    fff04e37              lui    t3,0xfff04
    2000070e:    4301                    li    t1,0
    20000710:    4601                    li    a2,0
    20000712:    10013f37              lui    t5,0x10013
    20000716:    10023eb7              lui    t4,0x10023
    2000071a:    100126b7              lui    a3,0x10012
    2000071e:    1f400513              li    a0,500
    20000722:    1e7d                    addi    t3,t3,-1
    20000724:    000fcfb7              lui    t6,0xfc
    20000728:    06088663              beqz    a7,0x20000794
    2000072c:    004ea803              lw    a6,4(t4) # 0x10023004
    20000730:    b00027f3              csrr    a5,mcycle
    20000734:    b8002773              csrr    a4,mcycleh
    20000738:    2007f793              andi    a5,a5,512
    2000073c:    fbf5                    bnez    a5,0x20000730
    2000073e:    46dc                    lw    a5,12(a3)
    20000740:    0207e793              ori    a5,a5,32
    20000744:    c6dc                    sw    a5,12(a3)
    20000746:    b00027f3              csrr    a5,mcycle
    2000074a:    b8002773              csrr    a4,mcycleh
    2000074e:    2007f793              andi    a5,a5,512
    20000752:    dbf5                    beqz    a5,0x20000746
    20000754:    46dc                    lw    a5,12(a3)
    20000756:    00160713              addi    a4,a2,1
    2000075a:    fdf7f793              andi    a5,a5,-33
    2000075e:    c6dc                    sw    a5,12(a3)
    20000760:    02c57663              bgeu    a0,a2,0x2000078c
    20000764:    863a                    mv    a2,a4
    20000766:    cd91                    beqz    a1,0x20000782
    20000768:    46d8                    lw    a4,12(a3)
    2000076a:    0305                    addi    t1,t1,1
    2000076c:    00e31793              slli    a5,t1,0xe
    20000770:    01c77733              and    a4,a4,t3
    20000774:    c6d8                    sw    a4,12(a3)
    20000776:    46d8                    lw    a4,12(a3)
    20000778:    01f7f7b3              and    a5,a5,t6
    2000077c:    4601                    li    a2,0
    2000077e:    8fd9                    or    a5,a5,a4
    20000780:    c6dc                    sw    a5,12(a3)
    20000782:    fb0053e3              blez    a6,0x20000728
    20000786:    0ff87513              andi    a0,a6,255
    2000078a:    8082                    ret
    2000078c:    863a                    mv    a2,a4
    2000078e:    f9005de3              blez    a6,0x20000728
    20000792:    bfd5                    j    0x20000786
    20000794:    004f2803              lw    a6,4(t5) # 0x10013004
    20000798:    bf61                    j    0x20000730
    2000079a:    100137b7              lui    a5,0x10013
    2000079e:    0047a803              lw    a6,4(a5) # 0x10013004
    200007a2:    f929                    bnez    a0,0x200006f4
    200007a4:    4501                    li    a0,0
    200007a6:    ff0040e3              bgtz    a6,0x20000786
    200007aa:    8082                    ret
    200007ac:    42dc                    lw    a5,4(a3)
    200007ae:    f4f049e3              bgtz    a5,0x20000700
    200007b2:    bfa1                    j    0x2000070a

    # <_puts>
    # function stuff
    200007b4:    1141                    addi    sp,sp,-16
    200007b6:    c422                    sw      s0,8(sp)
    200007b8:    c226                    sw      s1,4(sp)
    200007ba:    c04a                    sw      s2,0(sp)
    200007bc:    c606                    sw      ra,12(sp)
    # actual code
    200007be:    84aa                    mv      s1,a0
    200007c0:    10013437                lui     s0,0x10013 # 0x10013000 uart0
    200007c4:    0004c503                lbu     a0,0(s1) # load first character of string
    200007c8:    c909                    beqz    a0,0x200007da # if first character is null
    200007ca:    8801a783                lw      a5,-1920(gp) # print_to_uart1
    200007ce:    0485                    addi    s1,s1,1 # iterate over the string
    ## if print_to_uart1 == 0
    200007d0:    cb99                    beqz    a5,0x200007e6
    ## else
    200007d2:    33ad                    jal     0x2000053c
    200007d4:    0004c503                lbu     a0,0(s1)
    200007d8:    f96d                    bnez    a0,0x200007ca
    # function stuff
    200007da:    40b2                    lw      ra,12(sp)
    200007dc:    4422                    lw      s0,8(sp)
    200007de:    4492                    lw      s1,4(sp)
    200007e0:    4902                    lw      s2,0(sp)
    200007e2:    0141                    addi    sp,sp,16
    200007e4:    8082                    ret
    # origin: 200007d0 if print_to_uart1 == 0
    # while(txdata < 0) {
    200007e6:    401c                    lw      a5,0(s0) # tx data
    200007e8:    fe07cfe3                bltz    a5,0x200007e6
    # }
    200007ec:    c008                    sw      a0,0(s0) # write current char to tx data
    200007ee:    bfd9                    j       0x200007c4 # repeat until current char is null
    # end <_puts>

    200007f0:    1101                    addi    sp,sp,-32
    200007f2:    c84a                    sw    s2,16(sp)
    200007f4:    c452                    sw    s4,8(sp)
    200007f6:    ce06                    sw    ra,28(sp)
    200007f8:    cc22                    sw    s0,24(sp)
    200007fa:    ca26                    sw    s1,20(sp)
    200007fc:    c64e                    sw    s3,12(sp)
    200007fe:    c256                    sw    s5,4(sp)
    20000800:    892a                    mv    s2,a0
    20000802:    8801a683              lw    a3,-1920(gp)
    20000806:    06054b63              bltz    a0,0x2000087c
    2000080a:    c549                    beqz    a0,0x20000894
    2000080c:    4481                    li    s1,0
    2000080e:    4401                    li    s0,0
    20000810:    4729                    li    a4,10
    20000812:    a011                    j    0x20000816
    20000814:    84be                    mv    s1,a5
    20000816:    02e97633              remu    a2,s2,a4
    2000081a:    00241793              slli    a5,s0,0x2
    2000081e:    943e                    add    s0,s0,a5
    20000820:    0406                    slli    s0,s0,0x1
    20000822:    00148793              addi    a5,s1,1
    20000826:    02e95933              divu    s2,s2,a4
    2000082a:    9432                    add    s0,s0,a2
    2000082c:    fe0914e3              bnez    s2,0x20000814
    20000830:    49a9                    li    s3,10
    20000832:    10013937              lui    s2,0x10013
    20000836:    5afd                    li    s5,-1
    20000838:    a809                    j    0x2000084a
    2000083a:    14fd                    addi    s1,s1,-1
    2000083c:    3301                    jal    0x2000053c
    2000083e:    03345433              divu    s0,s0,s3
    20000842:    03548463              beq    s1,s5,0x2000086a
    20000846:    8801a683              lw    a3,-1920(gp)
    2000084a:    03347533              remu    a0,s0,s3
    2000084e:    03050513              addi    a0,a0,48
    20000852:    f6e5                    bnez    a3,0x2000083a
    20000854:    00092783              lw    a5,0(s2) # 0x10013000
    20000858:    fe07cee3              bltz    a5,0x20000854
    2000085c:    00a92023              sw    a0,0(s2)
    20000860:    14fd                    addi    s1,s1,-1
    20000862:    03345433              divu    s0,s0,s3
    20000866:    ff5490e3              bne    s1,s5,0x20000846
    2000086a:    40f2                    lw    ra,28(sp)
    2000086c:    4462                    lw    s0,24(sp)
    2000086e:    44d2                    lw    s1,20(sp)
    20000870:    4942                    lw    s2,16(sp)
    20000872:    49b2                    lw    s3,12(sp)
    20000874:    4a22                    lw    s4,8(sp)
    20000876:    4a92                    lw    s5,4(sp)
    20000878:    6105                    addi    sp,sp,32
    2000087a:    8082                    ret
    2000087c:    10013737              lui    a4,0x10013
    20000880:    ee89                    bnez    a3,0x2000089a
    20000882:    431c                    lw    a5,0(a4)
    20000884:    fe07cfe3              bltz    a5,0x20000882
    20000888:    02d00793              li    a5,45
    2000088c:    c31c                    sw    a5,0(a4)
    2000088e:    41200933              neg    s2,s2
    20000892:    bfad                    j    0x2000080c
    20000894:    4401                    li    s0,0
    20000896:    4481                    li    s1,0
    20000898:    bf61                    j    0x20000830
    2000089a:    02d00513              li    a0,45
    2000089e:    3979                    jal    0x2000053c
    200008a0:    8801a683              lw    a3,-1920(gp)
    200008a4:    41200933              neg    s2,s2
    200008a8:    b795                    j    0x2000080c
    200008aa:    1101                    addi    sp,sp,-32
    200008ac:    cc22                    sw    s0,24(sp)
    200008ae:    842a                    mv    s0,a0
    200008b0:    3e800513              li    a0,1000
    200008b4:    02a45533              divu    a0,s0,a0
    200008b8:    c64e                    sw    s3,12(sp)
    200008ba:    ce06                    sw    ra,28(sp)
    200008bc:    ca26                    sw    s1,20(sp)
    200008be:    c84a                    sw    s2,16(sp)
    200008c0:    c452                    sw    s4,8(sp)
    200008c2:    c256                    sw    s5,4(sp)
    200008c4:    3735                    jal    0x200007f0
    200008c6:    8801a703              lw    a4,-1920(gp)
    200008ca:    100136b7              lui    a3,0x10013
    200008ce:    eb35                    bnez    a4,0x20000942
    200008d0:    429c                    lw    a5,0(a3)
    200008d2:    fe07cfe3              bltz    a5,0x200008d0
    200008d6:    02e00793              li    a5,46
    200008da:    c29c                    sw    a5,0(a3)
    200008dc:    3e800a93              li    s5,1000
    200008e0:    03547433              remu    s0,s0,s5
    200008e4:    06400a13              li    s4,100
    200008e8:    490d                    li    s2,3
    200008ea:    100134b7              lui    s1,0x10013
    200008ee:    03445533              divu    a0,s0,s4
    200008f2:    03050513              addi    a0,a0,48
    200008f6:    0ff57513              andi    a0,a0,255
    200008fa:    c705                    beqz    a4,0x20000922
    200008fc:    197d                    addi    s2,s2,-1
    200008fe:    393d                    jal    0x2000053c
    20000900:    02090863              beqz    s2,0x20000930
    20000904:    00241793              slli    a5,s0,0x2
    20000908:    943e                    add    s0,s0,a5
    2000090a:    0406                    slli    s0,s0,0x1
    2000090c:    03547433              remu    s0,s0,s5
    20000910:    8801a703              lw    a4,-1920(gp)
    20000914:    03445533              divu    a0,s0,s4
    20000918:    03050513              addi    a0,a0,48
    2000091c:    0ff57513              andi    a0,a0,255
    20000920:    ff71                    bnez    a4,0x200008fc
    20000922:    409c                    lw    a5,0(s1)
    20000924:    fe07cfe3              bltz    a5,0x20000922
    20000928:    c088                    sw    a0,0(s1)
    2000092a:    197d                    addi    s2,s2,-1
    2000092c:    fc091ce3              bnez    s2,0x20000904
    20000930:    40f2                    lw    ra,28(sp)
    20000932:    4462                    lw    s0,24(sp)
    20000934:    44d2                    lw    s1,20(sp)
    20000936:    4942                    lw    s2,16(sp)
    20000938:    49b2                    lw    s3,12(sp)
    2000093a:    4a22                    lw    s4,8(sp)
    2000093c:    4a92                    lw    s5,4(sp)
    2000093e:    6105                    addi    sp,sp,32
    20000940:    8082                    ret
    20000942:    02e00513              li    a0,46
    20000946:    3edd                    jal    0x2000053c
    20000948:    8801a703              lw    a4,-1920(gp)
    2000094c:    bf41                    j    0x200008dc
    2000094e:    1101                    addi    sp,sp,-32
    20000950:    c64e                    sw    s3,12(sp)
    20000952:    8801a783              lw    a5,-1920(gp)
    20000956:    cc22                    sw    s0,24(sp)
    20000958:    ce06                    sw    ra,28(sp)
    2000095a:    ca26                    sw    s1,20(sp)
    2000095c:    c84a                    sw    s2,16(sp)
    2000095e:    c452                    sw    s4,8(sp)
    20000960:    842a                    mv    s0,a0
    20000962:    10013737              lui    a4,0x10013
    20000966:    efad                    bnez    a5,0x200009e0
    20000968:    431c                    lw    a5,0(a4)
    2000096a:    fe07cfe3              bltz    a5,0x20000968
    2000096e:    03000793              li    a5,48
    20000972:    c31c                    sw    a5,0(a4)
    20000974:    10013737              lui    a4,0x10013
    20000978:    431c                    lw    a5,0(a4)
    2000097a:    fe07cfe3              bltz    a5,0x20000978
    2000097e:    07800793              li    a5,120
    20000982:    c31c                    sw    a5,0(a4)
    20000984:    4921                    li    s2,8
    20000986:    a0000a37              lui    s4,0xa0000
    2000098a:    100134b7              lui    s1,0x10013
    2000098e:    a809                    j    0x200009a0
    20000990:    03050513              addi    a0,a0,48
    20000994:    cf9d                    beqz    a5,0x200009d2
    20000996:    197d                    addi    s2,s2,-1
    20000998:    3655                    jal    0x2000053c
    2000099a:    0412                    slli    s0,s0,0x4
    2000099c:    02090363              beqz    s2,0x200009c2
    200009a0:    01c45513              srli    a0,s0,0x1c
    200009a4:    8801a783              lw    a5,-1920(gp)
    200009a8:    ff4464e3              bltu    s0,s4,0x20000990
    200009ac:    05750513              addi    a0,a0,87
    200009b0:    f3fd                    bnez    a5,0x20000996
    200009b2:    409c                    lw    a5,0(s1)
    200009b4:    fe07cfe3              bltz    a5,0x200009b2
    200009b8:    c088                    sw    a0,0(s1)
    200009ba:    197d                    addi    s2,s2,-1
    200009bc:    0412                    slli    s0,s0,0x4
    200009be:    fe0911e3              bnez    s2,0x200009a0
    200009c2:    40f2                    lw    ra,28(sp)
    200009c4:    4462                    lw    s0,24(sp)
    200009c6:    44d2                    lw    s1,20(sp)
    200009c8:    4942                    lw    s2,16(sp)
    200009ca:    49b2                    lw    s3,12(sp)
    200009cc:    4a22                    lw    s4,8(sp)
    200009ce:    6105                    addi    sp,sp,32
    200009d0:    8082                    ret
    200009d2:    409c                    lw    a5,0(s1)
    200009d4:    fe07d2e3              bgez    a5,0x200009b8
    200009d8:    409c                    lw    a5,0(s1)
    200009da:    fe07cce3              bltz    a5,0x200009d2
    200009de:    bfe9                    j    0x200009b8
    200009e0:    03000513              li    a0,48
    200009e4:    3ea1                    jal    0x2000053c
    200009e6:    8801a783              lw    a5,-1920(gp)
    200009ea:    d7c9                    beqz    a5,0x20000974
    200009ec:    07800513              li    a0,120
    200009f0:    36b1                    jal    0x2000053c
    200009f2:    bf49                    j    0x20000984
    200009f4:    1141                    addi    sp,sp,-16
    200009f6:    c422                    sw    s0,8(sp)
    200009f8:    c226                    sw    s1,4(sp)
    200009fa:    c606                    sw    ra,12(sp)
    200009fc:    842a                    mv    s0,a0
    200009fe:    84ae                    mv    s1,a1
    20000a00:    c915                    beqz    a0,0x20000a34
    20000a02:    20002537              lui    a0,0x20002
    20000a06:    ed850513              addi    a0,a0,-296 # 0x20001ed8
    20000a0a:    336d                    jal    0x200007b4
    20000a0c:    8526                    mv    a0,s1
    20000a0e:    335d                    jal    0x200007b4
    20000a10:    20002537              lui    a0,0x20002
    20000a14:    ee450513              addi    a0,a0,-284 # 0x20001ee4
    20000a18:    3b71                    jal    0x200007b4
    20000a1a:    8522                    mv    a0,s0
    20000a1c:    3bd1                    jal    0x200007f0
    20000a1e:    20002537              lui    a0,0x20002
    20000a22:    fd450513              addi    a0,a0,-44 # 0x20001fd4
    20000a26:    3379                    jal    0x200007b4
    20000a28:    8522                    mv    a0,s0
    20000a2a:    40b2                    lw    ra,12(sp)
    20000a2c:    4422                    lw    s0,8(sp)
    20000a2e:    4492                    lw    s1,4(sp)
    20000a30:    0141                    addi    sp,sp,16
    20000a32:    8082                    ret
    20000a34:    852e                    mv    a0,a1
    20000a36:    3bbd                    jal    0x200007b4
    20000a38:    20002537              lui    a0,0x20002
    20000a3c:    ecc50513              addi    a0,a0,-308 # 0x20001ecc
    20000a40:    3b95                    jal    0x200007b4
    20000a42:    8522                    mv    a0,s0
    20000a44:    40b2                    lw    ra,12(sp)
    20000a46:    4422                    lw    s0,8(sp)
    20000a48:    4492                    lw    s1,4(sp)
    20000a4a:    0141                    addi    sp,sp,16
    20000a4c:    8082                    ret
    20000a4e:    b0002673              csrr    a2,mcycle
    20000a52:    b8002773              csrr    a4,mcycleh
    20000a56:    fff50793              addi    a5,a0,-1
    20000a5a:    03e00513              li    a0,62
    20000a5e:    02a7d7b3              divu    a5,a5,a0
    20000a62:    0785                    addi    a5,a5,1
    20000a64:    963e                    add    a2,a2,a5
    20000a66:    00f637b3              sltu    a5,a2,a5
    20000a6a:    97ba                    add    a5,a5,a4
    20000a6c:    b00026f3              csrr    a3,mcycle
    20000a70:    b8002773              csrr    a4,mcycleh
    20000a74:    fef76ce3              bltu    a4,a5,0x20000a6c
    20000a78:    00e79463              bne    a5,a4,0x20000a80
    20000a7c:    fec6e8e3              bltu    a3,a2,0x20000a6c
    20000a80:    8082                    ret
    20000a82:    00551793              slli    a5,a0,0x5
    20000a86:    0200c737              lui    a4,0x200c
    20000a8a:    fe072c23              sw    zero,-8(a4) # 0x200bff8
    20000a8e:    953e                    add    a0,a0,a5
    20000a90:    ff872783              lw    a5,-8(a4)
    20000a94:    fea7eee3              bltu    a5,a0,0x20000a90
    20000a98:    8082                    ret
    20000a9a:    0200c7b7              lui    a5,0x200c
    20000a9e:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000aa2:    0200c737              lui    a4,0x200c
    20000aa6:    ff872783              lw    a5,-8(a4) # 0x200bff8
    20000aaa:    fea7eee3              bltu    a5,a0,0x20000aa6
    20000aae:    8082                    ret
    20000ab0:    0200c7b7              lui    a5,0x200c
    20000ab4:    6685                    lui    a3,0x1
    20000ab6:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000aba:    ce368693              addi    a3,a3,-797 # 0xce3
    20000abe:    ff87a703              lw    a4,-8(a5)
    20000ac2:    ff878613              addi    a2,a5,-8
    20000ac6:    fee6fce3              bgeu    a3,a4,0x20000abe
    20000aca:    8801a783              lw    a5,-1920(gp)
    20000ace:    c7c9                    beqz    a5,0x20000b58
    20000ad0:    100127b7              lui    a5,0x10012
    20000ad4:    5fd8                    lw    a4,60(a5)
    20000ad6:    ff7c06b7              lui    a3,0xff7c0
    20000ada:    16fd                    addi    a3,a3,-1
    20000adc:    8f75                    and    a4,a4,a3
    20000ade:    dfd8                    sw    a4,60(a5)
    20000ae0:    5f98                    lw    a4,56(a5)
    20000ae2:    008406b7              lui    a3,0x840
    20000ae6:    8f55                    or    a4,a4,a3
    20000ae8:    df98                    sw    a4,56(a5)
    20000aea:    8401a803              lw    a6,-1984(gp)
    20000aee:    00062023              sw    zero,0(a2)
    20000af2:    4210                    lw    a2,0(a2)
    20000af4:    b00028f3              csrr    a7,mcycle
    20000af8:    b80027f3              csrr    a5,mcycleh
    20000afc:    6585                    lui    a1,0x1
    20000afe:    0200c6b7              lui    a3,0x200c
    20000b02:    bb758713              addi    a4,a1,-1097 # 0xbb7
    20000b06:    ff86a783              lw    a5,-8(a3) # 0x200bff8
    20000b0a:    8f91                    sub    a5,a5,a2
    20000b0c:    fef77de3              bgeu    a4,a5,0x20000b06
    20000b10:    b00027f3              csrr    a5,mcycle
    20000b14:    b8002773              csrr    a4,mcycleh
    20000b18:    411787b3              sub    a5,a5,a7
    20000b1c:    bb858593              addi    a1,a1,-1096
    20000b20:    02b7d7b3              divu    a5,a5,a1
    20000b24:    10023737              lui    a4,0x10023
    20000b28:    0200c6b7              lui    a3,0x200c
    20000b2c:    030787b3              mul    a5,a5,a6
    20000b30:    02a7d533              divu    a0,a5,a0
    20000b34:    157d                    addi    a0,a0,-1
    20000b36:    cf08                    sw    a0,24(a4)
    20000b38:    471c                    lw    a5,8(a4)
    20000b3a:    0017e793              ori    a5,a5,1
    20000b3e:    c71c                    sw    a5,8(a4)
    20000b40:    0200c7b7              lui    a5,0x200c
    20000b44:    6705                    lui    a4,0x1
    20000b46:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000b4a:    ce370713              addi    a4,a4,-797 # 0xce3
    20000b4e:    ff86a783              lw    a5,-8(a3) # 0x200bff8
    20000b52:    fef77ee3              bgeu    a4,a5,0x20000b4e
    20000b56:    8082                    ret
    20000b58:    100127b7              lui    a5,0x10012
    20000b5c:    5fd8                    lw    a4,60(a5)
    20000b5e:    fffd06b7              lui    a3,0xfffd0
    20000b62:    16fd                    addi    a3,a3,-1
    20000b64:    8f75                    and    a4,a4,a3
    20000b66:    dfd8                    sw    a4,60(a5)
    20000b68:    5f98                    lw    a4,56(a5)
    20000b6a:    000306b7              lui    a3,0x30
    20000b6e:    8f55                    or    a4,a4,a3
    20000b70:    df98                    sw    a4,56(a5)
    20000b72:    8401a803              lw    a6,-1984(gp)
    20000b76:    00062023              sw    zero,0(a2)
    20000b7a:    4210                    lw    a2,0(a2)
    20000b7c:    b00028f3              csrr    a7,mcycle
    20000b80:    b80027f3              csrr    a5,mcycleh
    20000b84:    6585                    lui    a1,0x1
    20000b86:    0200c6b7              lui    a3,0x200c
    20000b8a:    bb758713              addi    a4,a1,-1097 # 0xbb7
    20000b8e:    ff86a783              lw    a5,-8(a3) # 0x200bff8
    20000b92:    8f91                    sub    a5,a5,a2
    20000b94:    fef77de3              bgeu    a4,a5,0x20000b8e
    20000b98:    b00027f3              csrr    a5,mcycle
    20000b9c:    b8002773              csrr    a4,mcycleh
    20000ba0:    411787b3              sub    a5,a5,a7
    20000ba4:    bb858593              addi    a1,a1,-1096
    20000ba8:    02b7d7b3              divu    a5,a5,a1
    20000bac:    10013737              lui    a4,0x10013
    20000bb0:    bfa5                    j    0x20000b28
    20000bb2:    100087b7              lui    a5,0x10008
    20000bb6:    43d8                    lw    a4,4(a5)
    20000bb8:    00171693              slli    a3,a4,0x1
    20000bbc:    0206c263              bltz    a3,0x20000be0
    20000bc0:    43d8                    lw    a4,4(a5)
    20000bc2:    400006b7              lui    a3,0x40000
    20000bc6:    8f55                    or    a4,a4,a3
    20000bc8:    c3d8                    sw    a4,4(a5)
    20000bca:    6685                    lui    a3,0x1
    20000bcc:    0200c7b7              lui    a5,0x200c
    20000bd0:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000bd4:    ce368693              addi    a3,a3,-797 # 0xce3
    20000bd8:    ff87a703              lw    a4,-8(a5)
    20000bdc:    fee6fee3              bgeu    a3,a4,0x20000bd8
    20000be0:    10008737              lui    a4,0x10008
    20000be4:    471c                    lw    a5,8(a4)
    20000be6:    000406b7              lui    a3,0x40
    20000bea:    8fd5                    or    a5,a5,a3
    20000bec:    c71c                    sw    a5,8(a4)
    20000bee:    0200c7b7              lui    a5,0x200c
    20000bf2:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000bf6:    67100693              li    a3,1649
    20000bfa:    ff87a703              lw    a4,-8(a5)
    20000bfe:    ff878613              addi    a2,a5,-8
    20000c02:    fee6fce3              bgeu    a3,a4,0x20000bfa
    20000c06:    10008737              lui    a4,0x10008
    20000c0a:    431c                    lw    a5,0(a4)
    20000c0c:    00179693              slli    a3,a5,0x1
    20000c10:    0206c363              bltz    a3,0x20000c36
    20000c14:    4314                    lw    a3,0(a4)
    20000c16:    40000837              lui    a6,0x40000
    20000c1a:    0200c7b7              lui    a5,0x200c
    20000c1e:    0106e6b3              or    a3,a3,a6
    20000c22:    c314                    sw    a3,0(a4)
    20000c24:    6685                    lui    a3,0x1
    20000c26:    00062023              sw    zero,0(a2)
    20000c2a:    ce368693              addi    a3,a3,-797 # 0xce3
    20000c2e:    ff87a703              lw    a4,-8(a5) # 0x200bff8
    20000c32:    fee6fee3              bgeu    a3,a4,0x20000c2e
    20000c36:    01051793              slli    a5,a0,0x10
    20000c3a:    001f0537              lui    a0,0x1f0
    20000c3e:    8fe9                    and    a5,a5,a0
    20000c40:    02f5f593              andi    a1,a1,47
    20000c44:    40000737              lui    a4,0x40000
    20000c48:    8fcd                    or    a5,a5,a1
    20000c4a:    97ba                    add    a5,a5,a4
    20000c4c:    10008737              lui    a4,0x10008
    20000c50:    c31c                    sw    a5,0(a4)
    20000c52:    0200c7b7              lui    a5,0x200c
    20000c56:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000c5a:    67100613              li    a2,1649
    20000c5e:    ff87a703              lw    a4,-8(a5)
    20000c62:    ff878693              addi    a3,a5,-8
    20000c66:    fee67ce3              bgeu    a2,a4,0x20000c5e
    20000c6a:    10008637              lui    a2,0x10008
    20000c6e:    461c                    lw    a5,8(a2)
    20000c70:    7741                    lui    a4,0xffff0
    20000c72:    177d                    addi    a4,a4,-1
    20000c74:    8ff9                    and    a5,a5,a4
    20000c76:    c61c                    sw    a5,8(a2)
    20000c78:    0006a023              sw    zero,0(a3)
    20000c7c:    67100713              li    a4,1649
    20000c80:    0200c6b7              lui    a3,0x200c
    20000c84:    ff86a783              lw    a5,-8(a3) # 0x200bff8
    20000c88:    fef77ee3              bgeu    a4,a5,0x20000c84
    20000c8c:    10008737              lui    a4,0x10008
    20000c90:    471c                    lw    a5,8(a4)
    20000c92:    000406b7              lui    a3,0x40
    20000c96:    6571                    lui    a0,0x1c
    20000c98:    8fd5                    or    a5,a5,a3
    20000c9a:    c71c                    sw    a5,8(a4)
    20000c9c:    20050513              addi    a0,a0,512 # 0x1c200
    20000ca0:    bd01                    j    0x20000ab0
    20000ca2:    100087b7              lui    a5,0x10008
    20000ca6:    43d8                    lw    a4,4(a5)
    20000ca8:    00171693              slli    a3,a4,0x1
    20000cac:    0206c463              bltz    a3,0x20000cd4
    20000cb0:    43d8                    lw    a4,4(a5)
    20000cb2:    40000837              lui    a6,0x40000
    20000cb6:    0200c6b7              lui    a3,0x200c
    20000cba:    01076733              or    a4,a4,a6
    20000cbe:    c3d8                    sw    a4,4(a5)
    20000cc0:    0200c7b7              lui    a5,0x200c
    20000cc4:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000cc8:    14900793              li    a5,329
    20000ccc:    ff86a703              lw    a4,-8(a3) # 0x200bff8
    20000cd0:    fee7fee3              bgeu    a5,a4,0x20000ccc
    20000cd4:    10008737              lui    a4,0x10008
    20000cd8:    471c                    lw    a5,8(a4)
    20000cda:    000406b7              lui    a3,0x40
    20000cde:    0a400813              li    a6,164
    20000ce2:    8fd5                    or    a5,a5,a3
    20000ce4:    c71c                    sw    a5,8(a4)
    20000ce6:    0200c7b7              lui    a5,0x200c
    20000cea:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000cee:    ff87a703              lw    a4,-8(a5)
    20000cf2:    ff878693              addi    a3,a5,-8
    20000cf6:    fee87ce3              bgeu    a6,a4,0x20000cee
    20000cfa:    10008737              lui    a4,0x10008
    20000cfe:    471c                    lw    a5,8(a4)
    20000d00:    00020837              lui    a6,0x20
    20000d04:    062a                    slli    a2,a2,0xa
    20000d06:    0107e7b3              or    a5,a5,a6
    20000d0a:    c71c                    sw    a5,8(a4)
    20000d0c:    00872803              lw    a6,8(a4) # 0x10008008
    20000d10:    00459793              slli    a5,a1,0x4
    20000d14:    65c1                    lui    a1,0x10
    20000d16:    00b865b3              or    a1,a6,a1
    20000d1a:    c70c                    sw    a1,8(a4)
    20000d1c:    470c                    lw    a1,8(a4)
    20000d1e:    6805                    lui    a6,0x1
    20000d20:    c0080813              addi    a6,a6,-1024 # 0xc00
    20000d24:    01067833              and    a6,a2,a6
    20000d28:    7641                    lui    a2,0xffff0
    20000d2a:    3f07f793              andi    a5,a5,1008
    20000d2e:    8e6d                    and    a2,a2,a1
    20000d30:    891d                    andi    a0,a0,7
    20000d32:    0107e7b3              or    a5,a5,a6
    20000d36:    8d51                    or    a0,a0,a2
    20000d38:    97aa                    add    a5,a5,a0
    20000d3a:    c71c                    sw    a5,8(a4)
    20000d3c:    0006a023              sw    zero,0(a3) # 0x40000
    20000d40:    0200c7b7              lui    a5,0x200c
    20000d44:    14900693              li    a3,329
    20000d48:    ff87a703              lw    a4,-8(a5) # 0x200bff8
    20000d4c:    ff878613              addi    a2,a5,-8
    20000d50:    fee6fce3              bgeu    a3,a4,0x20000d48
    20000d54:    100087b7              lui    a5,0x10008
    20000d58:    479c                    lw    a5,8(a5)
    20000d5a:    0007cb63              bltz    a5,0x20000d70
    20000d5e:    100086b7              lui    a3,0x10008
    20000d62:    469c                    lw    a5,8(a3)
    20000d64:    fffc0737              lui    a4,0xfffc0
    20000d68:    177d                    addi    a4,a4,-1
    20000d6a:    8ff9                    and    a5,a5,a4
    20000d6c:    c69c                    sw    a5,8(a3)
    20000d6e:    8082                    ret
    20000d70:    6711                    lui    a4,0x4
    20000d72:    00062023              sw    zero,0(a2) # 0xffffffffffff0000
    20000d76:    0200c6b7              lui    a3,0x200c
    20000d7a:    07370713              addi    a4,a4,115 # 0x4073
    20000d7e:    ff86a783              lw    a5,-8(a3) # 0x200bff8
    20000d82:    fef77ee3              bgeu    a4,a5,0x20000d7e
    20000d86:    100086b7              lui    a3,0x10008
    20000d8a:    469c                    lw    a5,8(a3)
    20000d8c:    fffc0737              lui    a4,0xfffc0
    20000d90:    177d                    addi    a4,a4,-1
    20000d92:    8ff9                    and    a5,a5,a4
    20000d94:    c69c                    sw    a5,8(a3)
    20000d96:    8082                    ret
    20000d98:    0007a5b7              lui    a1,0x7a
    20000d9c:    12058593              addi    a1,a1,288 # 0x7a120
    20000da0:    02b555b3              divu    a1,a0,a1
    20000da4:    100087b7              lui    a5,0x10008
    20000da8:    4798                    lw    a4,8(a5)
    20000daa:    4798                    lw    a4,8(a5)
    20000dac:    479c                    lw    a5,8(a5)
    20000dae:    1141                    addi    sp,sp,-16
    20000db0:    c606                    sw    ra,12(sp)
    20000db2:    08000793              li    a5,128
    20000db6:    04b7ff63              bgeu    a5,a1,0x20000e14
    20000dba:    00159513              slli    a0,a1,0x1
    20000dbe:    95aa                    add    a1,a1,a0
    20000dc0:    8589                    srai    a1,a1,0x2
    20000dc2:    08b7d663              bge    a5,a1,0x20000e4e
    20000dc6:    0586                    slli    a1,a1,0x1
    20000dc8:    450d                    li    a0,3
    20000dca:    02a5c533              div    a0,a1,a0
    20000dce:    40155593              srai    a1,a0,0x1
    20000dd2:    06a7d963              bge    a5,a0,0x20000e44
    20000dd6:    06b7d363              bge    a5,a1,0x20000e3c
    20000dda:    40255693              srai    a3,a0,0x2
    20000dde:    40355593              srai    a1,a0,0x3
    20000de2:    4601                    li    a2,0
    20000de4:    4505                    li    a0,1
    20000de6:    04d7d663              bge    a5,a3,0x20000e32
    20000dea:    8585                    srai    a1,a1,0x1
    20000dec:    0200c7b7              lui    a5,0x200c
    20000df0:    15fd                    addi    a1,a1,-1
    20000df2:    fe07ac23              sw    zero,-8(a5) # 0x200bff8
    20000df6:    0200c6b7              lui    a3,0x200c
    20000dfa:    14900713              li    a4,329
    20000dfe:    ff86a783              lw    a5,-8(a3) # 0x200bff8
    20000e02:    fef77ee3              bgeu    a4,a5,0x20000dfe
    20000e06:    3d71                    jal    0x20000ca2
    20000e08:    40b2                    lw    ra,12(sp)
    20000e0a:    6571                    lui    a0,0x1c
    20000e0c:    20050513              addi    a0,a0,512 # 0x1c200
    20000e10:    0141                    addi    sp,sp,16
    20000e12:    b979                    j    0x20000ab0
    20000e14:    4791                    li    a5,4
    20000e16:    450d                    li    a0,3
    20000e18:    460d                    li    a2,3
    20000e1a:    4015d713              srai    a4,a1,0x1
    20000e1e:    02e787b3              mul    a5,a5,a4
    20000e22:    30000693              li    a3,768
    20000e26:    0786                    slli    a5,a5,0x1
    20000e28:    fcf6d1e3              bge    a3,a5,0x20000dea
    20000e2c:    167d                    addi    a2,a2,-1
    20000e2e:    85ba                    mv    a1,a4
    20000e30:    bf6d                    j    0x20000dea
    20000e32:    872e                    mv    a4,a1
    20000e34:    47a1                    li    a5,8
    20000e36:    85b6                    mv    a1,a3
    20000e38:    4605                    li    a2,1
    20000e3a:    b7d5                    j    0x20000e1e
    20000e3c:    47a1                    li    a5,8
    20000e3e:    4505                    li    a0,1
    20000e40:    4609                    li    a2,2
    20000e42:    bfe1                    j    0x20000e1a
    20000e44:    85aa                    mv    a1,a0
    20000e46:    47a1                    li    a5,8
    20000e48:    4505                    li    a0,1
    20000e4a:    460d                    li    a2,3
    20000e4c:    b7f9                    j    0x20000e1a
    20000e4e:    4795                    li    a5,5
    20000e50:    4509                    li    a0,2
    20000e52:    460d                    li    a2,3
    20000e54:    b7d9                    j    0x20000e1a
    20000e56:    100107b7              lui    a5,0x10010
    20000e5a:    4685                    li    a3,1
    20000e5c:    c394                    sw    a3,0(a5)
    20000e5e:    4398                    lw    a4,0(a5)
    20000e60:    df75                    beqz    a4,0x20000e5c
    20000e62:    8082                    ret
    20000e64:    100107b7              lui    a5,0x10010
    20000e68:    0007a023              sw    zero,0(a5) # 0x10010000
    20000e6c:    8082                    ret
    20000e6e:    100107b7              lui    a5,0x10010
    20000e72:    4605                    li    a2,1
    20000e74:    4685                    li    a3,1
    20000e76:    c394                    sw    a3,0(a5)
    20000e78:    4398                    lw    a4,0(a5)
    20000e7a:    df75                    beqz    a4,0x20000e76
    20000e7c:    d3d0                    sw    a2,36(a5)
    20000e7e:    cb90                    sw    a2,16(a5)
    20000e80:    4711                    li    a4,4
    20000e82:    cf98                    sw    a4,24(a5)
    20000e84:    b00027f3              csrr    a5,mcycle
    20000e88:    b8002773              csrr    a4,mcycleh
    20000e8c:    00978613              addi    a2,a5,9 # 0x10010009
    20000e90:    00f637b3              sltu    a5,a2,a5
    20000e94:    973e                    add    a4,a4,a5
    20000e96:    b00026f3              csrr    a3,mcycle
    20000e9a:    b80027f3              csrr    a5,mcycleh
    20000e9e:    fee7ece3              bltu    a5,a4,0x20000e96
    20000ea2:    00f71463              bne    a4,a5,0x20000eaa
    20000ea6:    fec6e8e3              bltu    a3,a2,0x20000e96
    20000eaa:    8082                    ret
    20000eac:    100107b7              lui    a5,0x10010
    20000eb0:    0007ac23              sw    zero,24(a5) # 0x10010018
    20000eb4:    0007a823              sw    zero,16(a5)
    20000eb8:    0207a223              sw    zero,36(a5)
    20000ebc:    b00027f3              csrr    a5,mcycle
    20000ec0:    b8002773              csrr    a4,mcycleh
    20000ec4:    03178613              addi    a2,a5,49
    20000ec8:    00f637b3              sltu    a5,a2,a5
    20000ecc:    973e                    add    a4,a4,a5
    20000ece:    b00026f3              csrr    a3,mcycle
    20000ed2:    b80027f3              csrr    a5,mcycleh
    20000ed6:    fee7ece3              bltu    a5,a4,0x20000ece
    20000eda:    00f71463              bne    a4,a5,0x20000ee2
    20000ede:    fec6e8e3              bltu    a3,a2,0x20000ece
    20000ee2:    100107b7              lui    a5,0x10010
    20000ee6:    0007a023              sw    zero,0(a5) # 0x10010000
    20000eea:    8082                    ret
    20000eec:    c199                    beqz    a1,0x20000ef2
    20000eee:    e5cff06f              j    0x2000054a
    20000ef2:    8082                    ret
    20000ef4:    000207b7              lui    a5,0x20
    20000ef8:    050a                    slli    a0,a0,0x2
    20000efa:    953e                    add    a0,a0,a5
    20000efc:    4108                    lw    a0,0(a0)
    20000efe:    8082                    ret
    20000f00:    02c05763              blez    a2,0x20000f2e
    20000f04:    00251713              slli    a4,a0,0x2
    20000f08:    060a                    slli    a2,a2,0x2
    20000f0a:    8f0d                    sub    a4,a4,a1
    20000f0c:    000207b7              lui    a5,0x20
    20000f10:    962e                    add    a2,a2,a1
    20000f12:    4501                    li    a0,0
    20000f14:    973e                    add    a4,a4,a5
    20000f16:    00b707b3              add    a5,a4,a1
    20000f1a:    439c                    lw    a5,0(a5)
    20000f1c:    4194                    lw    a3,0(a1)
    20000f1e:    0591                    addi    a1,a1,4
    20000f20:    fff7c793              not    a5,a5
    20000f24:    8ff5                    and    a5,a5,a3
    20000f26:    8d5d                    or    a0,a0,a5
    20000f28:    fec597e3              bne    a1,a2,0x20000f16
    20000f2c:    8082                    ret
    20000f2e:    4501                    li    a0,0
    20000f30:    8082                    ret
    20000f32:    1101                    addi    sp,sp,-32
    20000f34:    c64e                    sw    s3,12(sp)
    20000f36:    89b2                    mv    s3,a2
    20000f38:    cc22                    sw    s0,24(sp)
    20000f3a:    c452                    sw    s4,8(sp)
    20000f3c:    ce06                    sw    ra,28(sp)
    20000f3e:    ca26                    sw    s1,20(sp)
    20000f40:    c84a                    sw    s2,16(sp)
    20000f42:    c256                    sw    s5,4(sp)
    20000f44:    c05a                    sw    s6,0(sp)
    20000f46:    8a2a                    mv    s4,a0
    20000f48:    842e                    mv    s0,a1
    20000f4a:    3715                    jal    0x20000e6e
    20000f4c:    03305863              blez    s3,0x20000f7c
    20000f50:    00299a93              slli    s5,s3,0x2
    20000f54:    6b31                    lui    s6,0xc
    20000f56:    84a2                    mv    s1,s0
    20000f58:    8952                    mv    s2,s4
    20000f5a:    9aa2                    add    s5,s5,s0
    20000f5c:    350b0b13              addi    s6,s6,848 # 0xc350
    20000f60:    a021                    j    0x20000f68
    20000f62:    0905                    addi    s2,s2,1
    20000f64:    01548c63              beq    s1,s5,0x20000f7c
    20000f68:    408c                    lw    a1,0(s1)
    20000f6a:    0491                    addi    s1,s1,4
    20000f6c:    d9fd                    beqz    a1,0x20000f62
    20000f6e:    854a                    mv    a0,s2
    20000f70:    865a                    mv    a2,s6
    20000f72:    dd8ff0ef              jal    ra,0x2000054a
    20000f76:    0905                    addi    s2,s2,1
    20000f78:    ff5498e3              bne    s1,s5,0x20000f68
    20000f7c:    100107b7              lui    a5,0x10010
    20000f80:    0007ac23              sw    zero,24(a5) # 0x10010018
    20000f84:    0007a823              sw    zero,16(a5)
    20000f88:    0207a223              sw    zero,36(a5)
    20000f8c:    b00027f3              csrr    a5,mcycle
    20000f90:    b8002773              csrr    a4,mcycleh
    20000f94:    03178613              addi    a2,a5,49
    20000f98:    00f637b3              sltu    a5,a2,a5
    20000f9c:    973e                    add    a4,a4,a5
    20000f9e:    b00026f3              csrr    a3,mcycle
    20000fa2:    b80027f3              csrr    a5,mcycleh
    20000fa6:    fee7ece3              bltu    a5,a4,0x20000f9e
    20000faa:    00f71463              bne    a4,a5,0x20000fb2
    20000fae:    fec6e8e3              bltu    a3,a2,0x20000f9e
    20000fb2:    100107b7              lui    a5,0x10010
    20000fb6:    0007a023              sw    zero,0(a5) # 0x10010000
    20000fba:    05305263              blez    s3,0x20000ffe
    20000fbe:    002a1693              slli    a3,s4,0x2
    20000fc2:    00299713              slli    a4,s3,0x2
    20000fc6:    8e81                    sub    a3,a3,s0
    20000fc8:    000207b7              lui    a5,0x20
    20000fcc:    85a2                    mv    a1,s0
    20000fce:    9722                    add    a4,a4,s0
    20000fd0:    4501                    li    a0,0
    20000fd2:    96be                    add    a3,a3,a5
    20000fd4:    00b687b3              add    a5,a3,a1
    20000fd8:    439c                    lw    a5,0(a5)
    20000fda:    4190                    lw    a2,0(a1)
    20000fdc:    0591                    addi    a1,a1,4
    20000fde:    fff7c793              not    a5,a5
    20000fe2:    8ff1                    and    a5,a5,a2
    20000fe4:    8d5d                    or    a0,a0,a5
    20000fe6:    fee597e3              bne    a1,a4,0x20000fd4
    20000fea:    40f2                    lw    ra,28(sp)
    20000fec:    4462                    lw    s0,24(sp)
    20000fee:    44d2                    lw    s1,20(sp)
    20000ff0:    4942                    lw    s2,16(sp)
    20000ff2:    49b2                    lw    s3,12(sp)
    20000ff4:    4a22                    lw    s4,8(sp)
    20000ff6:    4a92                    lw    s5,4(sp)
    20000ff8:    4b02                    lw    s6,0(sp)
    20000ffa:    6105                    addi    sp,sp,32
    20000ffc:    8082                    ret
    20000ffe:    4501                    li    a0,0
    20001000:    b7ed                    j    0x20000fea
    20001002:    04c05263              blez    a2,0x20001046
    20001006:    00251793              slli    a5,a0,0x2
    2000100a:    000208b7              lui    a7,0x20
    2000100e:    00f886b3              add    a3,a7,a5
    20001012:    4198                    lw    a4,0(a1)
    20001014:    4294                    lw    a3,0(a3)
    20001016:    fff74713              not    a4,a4
    2000101a:    8f75                    and    a4,a4,a3
    2000101c:    e749                    bnez    a4,0x200010a6
    2000101e:    8f8d                    sub    a5,a5,a1
    20001020:    00458713              addi    a4,a1,4
    20001024:    4681                    li    a3,0
    20001026:    98be                    add    a7,a7,a5
    20001028:    a811                    j    0x2000103c
    2000102a:    431c                    lw    a5,0(a4)
    2000102c:    00082803              lw    a6,0(a6)
    20001030:    0711                    addi    a4,a4,4
    20001032:    fff7c793              not    a5,a5
    20001036:    0107f7b3              and    a5,a5,a6
    2000103a:    e7b5                    bnez    a5,0x200010a6
    2000103c:    0685                    addi    a3,a3,1
    2000103e:    00e88833              add    a6,a7,a4
    20001042:    fed614e3              bne    a2,a3,0x2000102a
    20001046:    66b1                    lui    a3,0xc
    20001048:    1101                    addi    sp,sp,-32
    2000104a:    35068693              addi    a3,a3,848 # 0xc350
    2000104e:    cc22                    sw    s0,24(sp)
    20001050:    ca26                    sw    s1,20(sp)
    20001052:    c84a                    sw    s2,16(sp)
    20001054:    c64e                    sw    s3,12(sp)
    20001056:    ce06                    sw    ra,28(sp)
    20001058:    c452                    sw    s4,8(sp)
    2000105a:    84ae                    mv    s1,a1
    2000105c:    89aa                    mv    s3,a0
    2000105e:    8432                    mv    s0,a2
    20001060:    3dc9                    jal    0x20000f32
    20001062:    4929                    li    s2,10
    20001064:    c905                    beqz    a0,0x20001094
    20001066:    00062a37              lui    s4,0x62
    2000106a:    a80a0a13              addi    s4,s4,-1408 # 0x61a80
    2000106e:    86d2                    mv    a3,s4
    20001070:    8622                    mv    a2,s0
    20001072:    85a6                    mv    a1,s1
    20001074:    854e                    mv    a0,s3
    20001076:    3d75                    jal    0x20000f32
    20001078:    197d                    addi    s2,s2,-1
    2000107a:    cd09                    beqz    a0,0x20001094
    2000107c:    fe0919e3              bnez    s2,0x2000106e
    20001080:    40f2                    lw    ra,28(sp)
    20001082:    4462                    lw    s0,24(sp)
    20001084:    44d2                    lw    s1,20(sp)
    20001086:    4942                    lw    s2,16(sp)
    20001088:    49b2                    lw    s3,12(sp)
    2000108a:    4a22                    lw    s4,8(sp)
    2000108c:    21400513              li    a0,532
    20001090:    6105                    addi    sp,sp,32
    20001092:    8082                    ret
    20001094:    40f2                    lw    ra,28(sp)
    20001096:    4462                    lw    s0,24(sp)
    20001098:    44d2                    lw    s1,20(sp)
    2000109a:    4942                    lw    s2,16(sp)
    2000109c:    49b2                    lw    s3,12(sp)
    2000109e:    4a22                    lw    s4,8(sp)
    200010a0:    4501                    li    a0,0
    200010a2:    6105                    addi    sp,sp,32
    200010a4:    8082                    ret
    200010a6:    20500513              li    a0,517
    200010aa:    8082                    ret

    # <measure_lfosc_freq>
    200010ac:    100087b7                lui   a5,0x10008 # 0x10008000 PRCI
    200010b0:    00060737                lui   a4,0x60 # 0x00060000 external osc and bypass to 1
    200010b4:    c798                    sw    a4,8(a5) # 0x10008008 pll_cfg to use ext osc
    200010b6:    4798                    lw    a4,8(a5)
    200010b8:    6641                    lui   a2,0x10 # 0x00010000
    200010ba:    0200c6b7                lui   a3,0x200c # 0x0200C000
    200010be:    8f51                    or    a4,a4,a2 # drive clock with pll
    200010c0:    c798                    sw    a4,8(a5) # drive clock with pll write
    200010c2:    fe06ac23                sw    zero,-8(a3) # 0x200bff8 mtime_lo = 0
    200010c6:    ff86a603                lw    a2,-8(a3) # load prev = mtime_lo
    200010ca:    b0002873                csrr  a6,mcycle
    200010ce:    b80027f3                csrr  a5,mcycleh
    200010d2:    6585                    lui   a1,0x1 # 0x00001000
    200010d4:    bb758713                addi  a4,a1,-1097 # 0xbb7 = 2999
    # do
    200010d8:    ff86a783                lw    a5,-8(a3) # 0x200bff8 mtime_lo
    200010dc:    8f91                    sub   a5,a5,a2 # delta = mtime_lo - prev
    # while(delta < 3000)
    200010de:    fef77de3                bgeu  a4,a5,0x200010d8

    200010e2:    b0002573                csrr  a0,mcycle
    200010e6:    b80027f3                csrr  a5,mcycleh
    200010ea:    41050533                sub   a0,a0,a6 # mcycle_lo - prev_mcycle_lo
    200010ee:    bb858593                addi  a1,a1,-1096 # 0xBB8 = 3000
    200010f2:    02b55533                divu  a0,a0,a1 # (mcycle_lo - prev_mcycle_lo) / 3000
    200010f6:    3e800793                li    a5,1000 # a5 = 1000
    200010fa:    053e                    slli  a0,a0,0xf # ((mcycle_lo - prev_mcycle_lo) / 3000) * 32768
    200010fc:    02f55533                divu  a0,a0,a5 # ((mcycle_lo - prev_mcycle_lo) / 3000) * 32768 / 1000
    20001100:    1f4007b7                lui   a5,0x1f400 # 0x1f400000 = 524,288,000
    20001104:    02a7d533                divu  a0,a5,a0 # 0x1f400000 / (((mcycle_lo - prev_mcycle_lo) / 3000) * 32768 / 1000)
    20001108:    84a1a023                sw    a0,-1984(gp) # lfosc_freq
    2000110c:    8082                    ret
    # end measure_lfosc_freq

    # <bench_rstclk>
    2000110e:    10014737              lui    a4,0x10014 # QSPI0 0x10014000
    20001112:    433c                  lw     a5,64(a4) # load frame format (fmt)
    20001114:    1101                  addi   sp,sp,-32 # function stuff
    20001116:    ce06                  sw     ra,28(sp) # function stuff
    20001118:    9bf1                  andi   a5,a5,-4 # fmt &= ~(0x00000003) (clear last 2 bits)
    2000111a:    c33c                  sw     a5,64(a4) # set protocol to single (default value)
    2000111c:    300477f3              csrrci a5,mstatus,8 # disable interrupts
    20001120:    100127b7              lui    a5,0x10012 # GPIO 0x10012000
    20001124:    0007a423              sw     zero,8(a5) # 0x10012008 disable all outputs
    20001128:    0207ac23              sw     zero,56(a5) # 0x10012038 disable all iof
    2000112c:    8801a703              lw     a4,-1920(gp) # data at beginning of bss <print_to_uart1>
    20001130:    0007a623              sw     zero,12(a5) # 0x1001200C turn off all pins
    20001134:    0407a023              sw     zero,64(a5) # 0x10012040 disable xor all pins
    ## if print_to_uart1 = 0
    20001138:    c35d                  beqz   a4,0x200011de
    ## else
    # a5 = GPIO 0x10012000
    2000113a:    47d8                  lw     a4,12(a5) # 0x1001200C (out_val)
    2000113c:    00840637              lui    a2,0x840 # 0x00840000 (pins 18 uart1rx and 23 uart1tx)
    20001140:    ff7c05b7              lui    a1,0xff7c0 # 0xFF7C0000
    20001144:    8f51                  or     a4,a4,a2 # turn on pins 18 and 23
    20001146:    c7d8                  sw     a4,12(a5) # turn on pins 18 and 23 write
    20001148:    4794                  lw     a3,8(a5) # 0x10012008 (out_en)
    2000114a:    10023737              lui    a4,0x10023 # 0x10023000 UART1
    2000114e:    8ed1                  or     a3,a3,a2 # enable output on pins 18 and 23
    20001150:    c794                  sw     a3,8(a5) # enable output on pins 18 and 23 write
    20001152:    5fd4                  lw     a3,60(a5) # 0x1001203C iof_sel
    # jump from 200011f8
    # a5 = GPIO 0x10012000
    # a4 = UART0 0x10013000 or UART1 0x10023000
    # a3 = 0x1001203C iof_sel
    # a1 = 0xFFFD0000 or FF7C0000
    20001154:    15fd                  addi   a1,a1,-1
    # a1 = ~(UART0_RX | UART0_TX) or ~(UART1_RX | UART1_TX)
    20001156:    8eed                  and    a3,a3,a1 # select iof0
    20001158:    dfd4                  sw     a3,60(a5) # select iof0 write
    2000115a:    5f94                  lw     a3,56(a5) # 0x10012038 iof_en
    2000115c:    8ed1                  or     a3,a3,a2 # enable iof
    2000115e:    df94                  sw     a3,56(a5) # enable iof write
    20001160:    08a00793              li     a5,138 # a5 = 138
    20001164:    cf1c                  sw     a5,24(a4) # set baud rate divisor. Baud 115200 (115107)
    20001166:    67c1                  lui    a5,0x10 # 0x10000
    20001168:    0785                  addi   a5,a5,1 # 0x10001
    2000116a:    c71c                  sw     a5,8(a4) # enable tx and set txcnt to 1 in txctrl
    2000116c:    4785                  li     a5,1
    2000116e:    c75c                  sw     a5,12(a4) # write 1 to rxctrl to enable rx
    20001170:    c602                  sw     zero,12(sp) # write 0 to 12(sp)
    20001172:    47b2                  lw     a5,12(sp) # a5 = 12(sp) = 0
    20001174:    6709                  lui    a4,0x2
    20001176:    70f70713              addi   a4,a4,1807 # 0x270f = 9999
    # for(a5 = 0; a5 < a4; a5++)
    # a5 = i
    # a4 = 9999
    # who the fuck writes these delay functions
    2000117a:    00f74863              blt    a4,a5,0x2000118a
    2000117e:    47b2                  lw     a5,12(sp)
    20001180:    0785                  addi   a5,a5,1
    20001182:    c63e                  sw     a5,12(sp)
    20001184:    47b2                  lw     a5,12(sp)
    20001186:    fef75ce3              bge    a4,a5,0x2000117e
    # end for
    # 2000117a
    2000118a:    100087b7              lui    a5,0x10008 # 0x10008000 PRCI
    2000118e:    00060737              lui    a4,0x60 # 0x00060000 external osc and bypass to 1
    20001192:    c798                  sw     a4,8(a5) # 0x10008008 pll_cfg to use ext osc
    20001194:    4798                  lw     a4,8(a5)
    20001196:    66c1                  lui    a3,0x10 # 0x10000
    20001198:    8f55                  or     a4,a4,a3 # drive clock with pll
    2000119a:    c798                  sw     a4,8(a5) # drive clock with pll write
    2000119c:    3f01                  jal    0x200010ac # <measure_lfosc_freq>
    # I am unsure what is trying to be printed here
    2000119e:    20002537              lui    a0,0x20002
    200011a2:    ef850513              addi   a0,a0,-264 # 0x20001ef8
    200011a6:    e0eff0ef              jal    ra,0x200007b4 # _puts
    200011aa:    20002537              lui    a0,0x20002
    200011ae:    f0050513              addi   a0,a0,-256 # 0x20001f00
    200011b2:    e02ff0ef              jal    ra,0x200007b4 # _puts
    200011b6:    20002537              lui    a0,0x20002
    200011ba:    f0850513              addi   a0,a0,-248 # 0x20001f08
    200011be:    df6ff0ef              jal    ra,0x200007b4 # _puts
    200011c2:    20002537              lui    a0,0x20002
    200011c6:    f1050513              addi   a0,a0,-240 # 0x20001f10
    200011ca:    deaff0ef              jal    ra,0x200007b4 # _puts
    # print bench clock reset and return
    200011ce:    40f2                  lw     ra,28(sp) # function stuff
    200011d0:    20002537              lui    a0,0x20002
    200011d4:    f1c50513              addi   a0,a0,-228 # 0x20001f1c
    200011d8:    6105                  addi   sp,sp,32 # function stuff
    200011da:    ddaff06f              j      0x200007b4 # _puts
    # jump from 20001138
    # a5 = GPIO 0x10012000
    200011de:    47d8                  lw     a4,12(a5) # 0x1001200C (out_val)
    200011e0:    00030637              lui    a2,0x30 # 0x00030000 (pins 16 uart0rx and 17 uart0tx)
    200011e4:    fffd05b7              lui    a1,0xfffd0 # 0xFFFD0000
    200011e8:    8f51                  or     a4,a4,a2 # turn on pins 16 and 17
    200011ea:    c7d8                  sw     a4,12(a5) # turn on pins 16 and 17 write
    200011ec:    4794                  lw     a3,8(a5) # 0x10012008 (out_en)
    200011ee:    10013737              lui    a4,0x10013 # UART0 0x10013000
    200011f2:    8ed1                  or     a3,a3,a2 # enable output on pins 16 and 17
    200011f4:    c794                  sw     a3,8(a5) # enable output on pins 16 and 17 write
    200011f6:    5fd4                  lw     a3,60(a5) # 0x1001203C iof_sel
    200011f8:    bfb1                  j      0x20001154
    # end bench_rstclk

    200011fa:    0586                    slli    a1,a1,0x1
    200011fc:    157d                    addi    a0,a0,-1
    200011fe:    952e                    add    a0,a0,a1
    20001200:    02b555b3              divu    a1,a0,a1
    20001204:    00b03533              snez    a0,a1
    20001208:    40a58533              sub    a0,a1,a0
    2000120c:    8082                    ret
    2000120e:    04850793              addi    a5,a0,72
    20001212:    40b7a7af              amoor.w    a5,a1,(a5)
    20001216:    fe07cce3              bltz    a5,0x2000120e
    2000121a:    8082                    ret
    2000121c:    457c                    lw    a5,76(a0)
    2000121e:    fe07cfe3              bltz    a5,0x2000121c
    20001222:    0ff7f513              andi    a0,a5,255
    20001226:    8082                    ret
    20001228:    04850793              addi    a5,a0,72
    2000122c:    40b7a7af              amoor.w    a5,a1,(a5)
    20001230:    fe07cce3              bltz    a5,0x20001228
    20001234:    457c                    lw    a5,76(a0)
    20001236:    fe07cfe3              bltz    a5,0x20001234
    2000123a:    0ff7f513              andi    a0,a5,255
    2000123e:    8082                    ret
    20001240:    4d18                    lw    a4,24(a0)
    20001242:    87aa                    mv    a5,a0
    20001244:    9b71                    andi    a4,a4,-4
    20001246:    00276713              ori    a4,a4,2
    2000124a:    cd18                    sw    a4,24(a0)
    2000124c:    470d                    li    a4,3
    2000124e:    04878513              addi    a0,a5,72 # 0x10008048
    20001252:    40e5252f              amoor.w    a0,a4,(a0)
    20001256:    fe054ce3              bltz    a0,0x2000124e
    2000125a:    47f8                    lw    a4,76(a5)
    2000125c:    fe074fe3              bltz    a4,0x2000125a
    20001260:    01065713              srli    a4,a2,0x10
    20001264:    0ff77713              andi    a4,a4,255
    20001268:    04878513              addi    a0,a5,72
    2000126c:    40e5252f              amoor.w    a0,a4,(a0)
    20001270:    fe054ce3              bltz    a0,0x20001268
    20001274:    47f8                    lw    a4,76(a5)
    20001276:    fe074fe3              bltz    a4,0x20001274
    2000127a:    00865713              srli    a4,a2,0x8
    2000127e:    0ff77713              andi    a4,a4,255
    20001282:    04878513              addi    a0,a5,72
    20001286:    40e5252f              amoor.w    a0,a4,(a0)
    2000128a:    fe054ce3              bltz    a0,0x20001282
    2000128e:    47f8                    lw    a4,76(a5)
    20001290:    fe074fe3              bltz    a4,0x2000128e
    20001294:    0ff67613              andi    a2,a2,255
    20001298:    04878713              addi    a4,a5,72
    2000129c:    40c7272f              amoor.w    a4,a2,(a4)
    200012a0:    fe074ce3              bltz    a4,0x20001298
    200012a4:    47f8                    lw    a4,76(a5)
    200012a6:    fe074fe3              bltz    a4,0x200012a4
    200012aa:    c295                    beqz    a3,0x200012ce
    200012ac:    00d58633              add    a2,a1,a3
    200012b0:    4681                    li    a3,0
    200012b2:    04878713              addi    a4,a5,72
    200012b6:    40d7272f              amoor.w    a4,a3,(a4)
    200012ba:    fe074ce3              bltz    a4,0x200012b2
    200012be:    47f8                    lw    a4,76(a5)
    200012c0:    fe074fe3              bltz    a4,0x200012be
    200012c4:    00e58023              sb    a4,0(a1) # 0xfffffffffffd0000
    200012c8:    0585                    addi    a1,a1,1
    200012ca:    fec594e3              bne    a1,a2,0x200012b2
    200012ce:    4f98                    lw    a4,24(a5)
    200012d0:    4501                    li    a0,0
    200012d2:    9b71                    andi    a4,a4,-4
    200012d4:    cf98                    sw    a4,24(a5)
    200012d6:    8082                    ret
    200012d8:    1141                    addi    sp,sp,-16
    200012da:    c422                    sw    s0,8(sp)
    200012dc:    c606                    sw    ra,12(sp)
    200012de:    842a                    mv    s0,a0
    200012e0:    12f000ef              jal    ra,0x20001c0e
    200012e4:    9522                    add    a0,a0,s0
    200012e6:    00154783              lbu    a5,1(a0)
    200012ea:    8522                    mv    a0,s0
    200012ec:    0977f793              andi    a5,a5,151
    200012f0:    eb91                    bnez    a5,0x20001304
    200012f2:    02300513              li    a0,35
    200012f6:    b72ff0ef              jal    ra,0x20000668
    200012fa:    8522                    mv    a0,s0
    200012fc:    cf4ff0ef              jal    ra,0x200007f0
    20001300:    02000513              li    a0,32
    20001304:    4422                    lw    s0,8(sp)
    20001306:    40b2                    lw    ra,12(sp)
    20001308:    0141                    addi    sp,sp,16
    2000130a:    b5eff06f              j    0x20000668
    2000130e:    00054783              lbu    a5,0(a0)
    20001312:    cf95                    beqz    a5,0x2000134e
    20001314:    1141                    addi    sp,sp,-16
    20001316:    c422                    sw    s0,8(sp)
    20001318:    c606                    sw    ra,12(sp)
    2000131a:    842a                    mv    s0,a0
    2000131c:    a021                    j    0x20001324
    2000131e:    00044783              lbu    a5,0(s0) # 0x10013000
    20001322:    c395                    beqz    a5,0x20001346
    20001324:    0eb000ef              jal    ra,0x20001c0e
    20001328:    00044703              lbu    a4,0(s0)
    2000132c:    0405                    addi    s0,s0,1
    2000132e:    953a                    add    a0,a0,a4
    20001330:    00154783              lbu    a5,1(a0)
    20001334:    0977f793              andi    a5,a5,151
    20001338:    d3fd                    beqz    a5,0x2000131e
    2000133a:    853a                    mv    a0,a4
    2000133c:    b2cff0ef              jal    ra,0x20000668
    20001340:    00044783              lbu    a5,0(s0)
    20001344:    f3e5                    bnez    a5,0x20001324
    20001346:    40b2                    lw    ra,12(sp)
    20001348:    4422                    lw    s0,8(sp)
    2000134a:    0141                    addi    sp,sp,16
    2000134c:    8082                    ret
    2000134e:    8082                    ret
    20001350:    100127b7              lui    a5,0x10012
    20001354:    439c                    lw    a5,0(a5)
    20001356:    1141                    addi    sp,sp,-16
    20001358:    c422                    sw    s0,8(sp)
    2000135a:    c226                    sw    s1,4(sp)
    2000135c:    c606                    sw    ra,12(sp)
    2000135e:    c04a                    sw    s2,0(sp)
    20001360:    4007f793              andi    a5,a5,1024
    20001364:    84aa                    mv    s1,a0
    20001366:    4401                    li    s0,0
    20001368:    e38d                    bnez    a5,0x2000138a
    2000136a:    02a05063              blez    a0,0x2000138a
    2000136e:    10012937              lui    s2,0x10012
    20001372:    a019                    j    0x20001378
    20001374:    00848e63              beq    s1,s0,0x20001390
    20001378:    4529                    li    a0,10
    2000137a:    f08ff0ef              jal    ra,0x20000a82
    2000137e:    00092783              lw    a5,0(s2) # 0x10012000
    20001382:    0405                    addi    s0,s0,1
    20001384:    4007f793              andi    a5,a5,1024
    20001388:    d7f5                    beqz    a5,0x20001374
    2000138a:    00848363              beq    s1,s0,0x20001390
    2000138e:    4401                    li    s0,0
    20001390:    8522                    mv    a0,s0
    20001392:    40b2                    lw    ra,12(sp)
    20001394:    4422                    lw    s0,8(sp)
    20001396:    4492                    lw    s1,4(sp)
    20001398:    4902                    lw    s2,0(sp)
    2000139a:    0141                    addi    sp,sp,16
    2000139c:    8082                    ret
    2000139e:    1141                    addi    sp,sp,-16
    200013a0:    c422                    sw    s0,8(sp)
    200013a2:    842a                    mv    s0,a0
    200013a4:    4515                    li    a0,5
    200013a6:    c226                    sw    s1,4(sp)
    200013a8:    c606                    sw    ra,12(sp)
    200013aa:    84ae                    mv    s1,a1
    200013ac:    ed6ff0ef              jal    ra,0x20000a82
    200013b0:    4c1c                    lw    a5,24(s0)
    200013b2:    9bf1                    andi    a5,a5,-4
    200013b4:    0027e793              ori    a5,a5,2
    200013b8:    cc1c                    sw    a5,24(s0)
    200013ba:    04905063              blez    s1,0x200013fa
    200013be:    88818693              addi    a3,gp,-1912
    200013c2:    04068513              addi    a0,a3,64 # 0x10040
    200013c6:    fff48813              addi    a6,s1,-1 # 0x10012fff
    200013ca:    00a485b3              add    a1,s1,a0
    200013ce:    872a                    mv    a4,a0
    200013d0:    0006c603              lbu    a2,0(a3)
    200013d4:    47f9                    li    a5,30
    200013d6:    04c40423              sb    a2,72(s0)
    200013da:    0001                    nop
    200013dc:    17fd                    addi    a5,a5,-1
    200013de:    fff5                    bnez    a5,0x200013da
    200013e0:    40a707b3              sub    a5,a4,a0
    200013e4:    02f80163              beq    a6,a5,0x20001406
    200013e8:    447c                    lw    a5,76(s0)
    200013ea:    fe07cfe3              bltz    a5,0x200013e8
    200013ee:    00f70023              sb    a5,0(a4) # 0x10013000
    200013f2:    0705                    addi    a4,a4,1
    200013f4:    0685                    addi    a3,a3,1
    200013f6:    fcb71de3              bne    a4,a1,0x200013d0
    200013fa:    40b2                    lw    ra,12(sp)
    200013fc:    4422                    lw    s0,8(sp)
    200013fe:    4492                    lw    s1,4(sp)
    20001400:    4501                    li    a0,0
    20001402:    0141                    addi    sp,sp,16
    20001404:    8082                    ret
    20001406:    4c1c                    lw    a5,24(s0)
    20001408:    9bf1                    andi    a5,a5,-4
    2000140a:    cc1c                    sw    a5,24(s0)
    2000140c:    bff1                    j    0x200013e8
    2000140e:    1141                    addi    sp,sp,-16
    20001410:    c606                    sw    ra,12(sp)
    20001412:    3771                    jal    0x2000139e
    20001414:    40b2                    lw    ra,12(sp)
    20001416:    4501                    li    a0,0
    20001418:    0141                    addi    sp,sp,16
    2000141a:    8082                    ret

    # <at_sendflag>
    2000141c:    7179                    addi    sp,sp,-48
    2000141e:    d422                    sw    s0,40(sp)
    20001420:    88818413              addi    s0,gp,-1912
    20001424:    ce4e                    sw    s3,28(sp)
    20001426:    cc52                    sw    s4,24(sp)
    20001428:    c65e                    sw    s7,12(sp)
    2000142a:    d606                    sw    ra,44(sp)
    2000142c:    d226                    sw    s1,36(sp)
    2000142e:    d04a                    sw    s2,32(sp)
    20001430:    ca56                    sw    s5,20(sp)
    20001432:    c85a                    sw    s6,16(sp)
    20001434:    c462                    sw    s8,8(sp)
    20001436:    04040993              addi    s3,s0,64
    2000143a:    8bae                    mv    s7,a1
    2000143c:    8a2a                    mv    s4,a0
    2000143e:    00b40023              sb    a1,0(s0)
    20001442:    000400a3              sb    zero,1(s0)
    20001446:    00040123              sb    zero,2(s0)
    2000144a:    000401a3              sb    zero,3(s0)
    2000144e:    0c040713              addi    a4,s0,192
    20001452:    87ce                    mv    a5,s3
    20001454:    00078023              sb    zero,0(a5) # 0x10012000
    20001458:    0785                    addi    a5,a5,1
    2000145a:    fee79de3              bne    a5,a4,0x20001454
    2000145e:    8441a703              lw    a4,-1980(gp)
    20001462:    4789                    li    a5,2
    20001464:    12e7e063              bltu    a5,a4,0x20001584
    20001468:    4529                    li    a0,10
    2000146a:    35dd                    jal    0x20001350
    2000146c:    8441a703              lw    a4,-1980(gp)
    20001470:    c545                    beqz    a0,0x20001518
    20001472:    4785                    li    a5,1
    20001474:    10e7e163              bltu    a5,a4,0x20001576
    20001478:    4605                    li    a2,1
    2000147a:    4591                    li    a1,4
    2000147c:    8552                    mv    a0,s4
    2000147e:    3705                    jal    0x2000139e
    20001480:    4529                    li    a0,10
    20001482:    35f9                    jal    0x20001350
    20001484:    c545                    beqz    a0,0x2000152c
    20001486:    44a9                    li    s1,10
    20001488:    04300c13              li    s8,67
    2000148c:    4b05                    li    s6,1
    2000148e:    20002ab7              lui    s5,0x20002
    20001492:    4529                    li    a0,10
    20001494:    3d75                    jal    0x20001350
    20001496:    14fd                    addi    s1,s1,-1
    20001498:    e509                    bnez    a0,0x200014a2
    2000149a:    04044783              lbu    a5,64(s0)
    2000149e:    01878f63              beq    a5,s8,0x200014bc
    200014a2:    8441a783              lw    a5,-1980(gp)
    200014a6:    f88a8513              addi    a0,s5,-120 # 0x20001f88
    200014aa:    00fb7463              bgeu    s6,a5,0x200014b2
    200014ae:    b06ff0ef              jal    ra,0x200007b4
    200014b2:    4605                    li    a2,1
    200014b4:    4591                    li    a1,4
    200014b6:    8552                    mv    a0,s4
    200014b8:    35dd                    jal    0x2000139e
    200014ba:    fce1                    bnez    s1,0x20001492
    200014bc:    4529                    li    a0,10
    200014be:    3d49                    jal    0x20001350
    200014c0:    0e051863              bnez    a0,0x200015b0
    200014c4:    8441a703              lw    a4,-1980(gp)
    200014c8:    4789                    li    a5,2
    200014ca:    08e7e163              bltu    a5,a4,0x2000154c
    200014ce:    04044783              lbu    a5,64(s0)
    200014d2:    04300713              li    a4,67
    200014d6:    4501                    li    a0,0
    200014d8:    02e78463              beq    a5,a4,0x20001500
    200014dc:    4709                    li    a4,2
    200014de:    0eeb8e63              beq    s7,a4,0x200015da
    200014e2:    4705                    li    a4,1
    200014e4:    0eeb8263              beq    s7,a4,0x200015c8
    200014e8:    853e                    mv    a0,a5
    200014ea:    33fd                    jal    0x200012d8
    200014ec:    04144503              lbu    a0,65(s0)
    200014f0:    33e5                    jal    0x200012d8
    200014f2:    04244503              lbu    a0,66(s0)
    200014f6:    33cd                    jal    0x200012d8
    200014f8:    04344503              lbu    a0,67(s0)
    200014fc:    3bf1                    jal    0x200012d8
    200014fe:    4505                    li    a0,1
    20001500:    50b2                    lw    ra,44(sp)
    20001502:    5422                    lw    s0,40(sp)
    20001504:    5492                    lw    s1,36(sp)
    20001506:    5902                    lw    s2,32(sp)
    20001508:    49f2                    lw    s3,28(sp)
    2000150a:    4a62                    lw    s4,24(sp)
    2000150c:    4ad2                    lw    s5,20(sp)
    2000150e:    4b42                    lw    s6,16(sp)
    20001510:    4bb2                    lw    s7,12(sp)
    20001512:    4c22                    lw    s8,8(sp)
    20001514:    6145                    addi    sp,sp,48
    20001516:    8082                    ret
    20001518:    4789                    li    a5,2
    2000151a:    f4e7ffe3              bgeu    a5,a4,0x20001478
    2000151e:    20002537              lui    a0,0x20002
    20001522:    f7450513              addi    a0,a0,-140 # 0x20001f74
    20001526:    a8eff0ef              jal    ra,0x200007b4
    2000152a:    b7b9                    j    0x20001478
    2000152c:    8441a703              lw    a4,-1980(gp)
    20001530:    4789                    li    a5,2
    20001532:    f8e7fee3              bgeu    a5,a4,0x200014ce
    20001536:    20002537              lui    a0,0x20002
    2000153a:    fd850513              addi    a0,a0,-40 # 0x20001fd8
    2000153e:    a76ff0ef              jal    ra,0x200007b4
    20001542:    8441a703              lw    a4,-1980(gp)
    20001546:    4789                    li    a5,2
    20001548:    f8e7f3e3              bgeu    a5,a4,0x200014ce
    2000154c:    20002537              lui    a0,0x20002
    20001550:    fec50513              addi    a0,a0,-20 # 0x20001fec
    20001554:    a60ff0ef              jal    ra,0x200007b4
    20001558:    00498493              addi    s1,s3,4
    2000155c:    0009c503              lbu    a0,0(s3)
    20001560:    0985                    addi    s3,s3,1
    20001562:    3b9d                    jal    0x200012d8
    20001564:    fe999ce3              bne    s3,s1,0x2000155c
    20001568:    20002537              lui    a0,0x20002
    2000156c:    fd450513              addi    a0,a0,-44 # 0x20001fd4
    20001570:    a44ff0ef              jal    ra,0x200007b4
    20001574:    bfa9                    j    0x200014ce
    20001576:    20002537              lui    a0,0x20002
    2000157a:    f4c50513              addi    a0,a0,-180 # 0x20001f4c
    2000157e:    a36ff0ef              jal    ra,0x200007b4
    20001582:    bddd                    j    0x20001478
    20001584:    20002537              lui    a0,0x20002
    20001588:    f3c50513              addi    a0,a0,-196 # 0x20001f3c
    2000158c:    a28ff0ef              jal    ra,0x200007b4
    20001590:    84a2                    mv    s1,s0
    20001592:    00440a93              addi    s5,s0,4
    20001596:    0004c503              lbu    a0,0(s1)
    2000159a:    0485                    addi    s1,s1,1
    2000159c:    3b35                    jal    0x200012d8
    2000159e:    fe9a9ce3              bne    s5,s1,0x20001596
    200015a2:    20002537              lui    a0,0x20002
    200015a6:    fd450513              addi    a0,a0,-44 # 0x20001fd4
    200015aa:    a0aff0ef              jal    ra,0x200007b4
    200015ae:    bd6d                    j    0x20001468
    200015b0:    20002537              lui    a0,0x20002
    200015b4:    fb050513              addi    a0,a0,-80 # 0x20001fb0
    200015b8:    9fcff0ef              jal    ra,0x200007b4
    200015bc:    8441a703              lw    a4,-1980(gp)
    200015c0:    4789                    li    a5,2
    200015c2:    f0e7f6e3              bgeu    a5,a4,0x200014ce
    200015c6:    b759                    j    0x2000154c
    200015c8:    20002537              lui    a0,0x20002
    200015cc:    01050513              addi    a0,a0,16 # 0x20002010
    200015d0:    9e4ff0ef              jal    ra,0x200007b4
    200015d4:    04044783              lbu    a5,64(s0)
    200015d8:    bf01                    j    0x200014e8
    200015da:    20002537              lui    a0,0x20002
    200015de:    ffc50513              addi    a0,a0,-4 # 0x20001ffc
    200015e2:    9d2ff0ef              jal    ra,0x200007b4
    200015e6:    04044783              lbu    a5,64(s0)
    200015ea:    bdfd                    j    0x200014e8
    # end <at_sendflag>

    # <at_send>
    200015ec:    7179                    addi  sp,sp,-48
    200015ee:    cc52                    sw    s4,24(sp)
    200015f0:    8a2a                    mv    s4,a0 # s4 = spi
    200015f2:    852e                    mv    a0,a1 # a0 = str
    200015f4:    d422                    sw    s0,40(sp) # s0 = spi
    200015f6:    ce4e                    sw    s3,28(sp)
    200015f8:    ca56                    sw    s5,20(sp)
    200015fa:    c85a                    sw    s6,16(sp)
    200015fc:    d606                    sw    ra,44(sp)
    200015fe:    d226                    sw    s1,36(sp)
    20001600:    d04a                    sw    s2,32(sp)
    20001602:    c65e                    sw    s7,12(sp)
    20001604:    c462                    sw    s8,8(sp)
    20001606:    8aae                    mv    s5,a1 # s5 = str
    20001608:    8b32                    mv    s6,a2 # s6 = timeout
    2000160a:    798000ef                jal   ra,0x20001da2 # <strlen>
    2000160e:    8441a783                lw    a5,-1980(gp) # 800005c4 <esp32_diag_mode>
    20001612:    89aa                    mv    s3,a0 # s3 = strlen(str)
    ## if esp32_diag_mode != 0
    20001614:    e3dd                    bnez  a5,0x200016ba
    ## then
    20001616:    4589                    li    a1,2 # a1 = 2
    20001618:    8552                    mv    a0,s4 # a0 = spi
    2000161a:    3509                    jal   0x2000141c # <at_sendflag>
    2000161c:    892a                    mv    s2,a0 # s2 = return value
    ## if at_sendflag(spi, 2) != 0 return
    2000161e:    e149                    bnez  a0,0x200016a0 # return
    ## else
    20001620:    8441a703                lw    a4,-1980(gp) # 800005c4 <esp32_diag_mode>
    20001624:    4789                    li    a5,2
    ## if 2 < esp32_diag_mode
    20001626:    0ee7ef63                bltu  a5,a4,0x20001724
    ## then
    2000162a:    01099b93                slli  s7,s3,0x10 # s7 = strlen(str) << 16
    2000162e:    410bdb93                srai  s7,s7,0x10 # s7 = s7 >> 16
    20001632:    88818493                addi  s1,gp,-1912 # 80000608 <tx_buf>
    20001636:    407bd793                srai  a5,s7,0x7 # a5 = s7 >> 7
    2000163a:    00f480a3                sb    a5,1(s1) # tx_buf[1] = a5
    2000163e:    6791                    lui   a5,0x4
    20001640:    10078793                addi  a5,a5,256 # 0x00004100
    20001644:    00f49123                sh    a5,2(s1) # tx_buf[2]=0 and tx_buf[3]=A
    20001648:    07f9f993                andi  s3,s3,127 # convert strlen to unsigned byte
    2000164c:    4605                    li    a2,1 # a2 = 1
    2000164e:    4591                    li    a1,4 # a1 = 4
    20001650:    8552                    mv    a0,s4 # a0 = spi
    20001652:    01348023                sb    s3,0(s1) # tx_buf[0] = strlen(str)
    20001656:    33a1                    jal   0x2000139e # <spi_transceive_one>
    20001658:    8441a703                lw    a4,-1980(gp) # 800005c4 <esp32_diag_mode>
    2000165c:    4789                    li    a5,2 # a5 = 2
    ## if 2 < esp32_diag_mode
    2000165e:    0ce7ea63                bltu  a5,a4,0x20001732
    ## else
    20001662:    855a                    mv    a0,s6 # a0 = timeout
    20001664:    31f5                    jal   0x20001350 # <at_wait_done>
    ## if(at_wait_done(timeout) != 0) (eventually return)
    20001666:    e13d                    bnez  a0,0x200016cc
    ## else
    20001668:    8441a703                lw    a4,-1980(gp) # 800005c4 <esp32_diag_mode>
    2000166c:    4789                    li    a5,2
    ## if 2 < esp32_diag_mode
    2000166e:    0ce7ed63                bltu  a5,a4,0x20001748
    ## then
    20001672:    0404c703                lbu   a4,64(s1) # a4 = rx_buf[0]
    20001676:    06200793                li    a5,98 # a5 = 98 'b'
    ## if rx_buf[0] == 'b'/98 (eventually return)
    2000167a:    06f70563                beq   a4,a5,0x200016e4
    ## else
    ## rx_buf[0] != 'b'/98 (200016e0)
    2000167e:    20002537                lui   a0,0x20002 # 20002000
    20001682:    06450513                addi  a0,a0,100 # 0x20002064 "Send length error: "
    20001686:    04048413                addi  s0,s1,64 # s0 = &rx_buf[0]
    2000168a:    92aff0ef                jal   ra,0x200007b4 # <_puts>
    2000168e:    04448493                addi  s1,s1,68 # &rx_buf[4]
    ## do
    20001692:    00044503                lbu   a0,0(s0) # rx_buf[0,1,2,3]
    20001696:    0405                    addi  s0,s0,1 # &rx_buf[1,2,3,4]
    20001698:    3181                    jal   0x200012d8 # <_putx>
    2000169a:    fe941ce3                bne   s0,s1,0x20001692
    ## while rx_buf[1..4] != rx_buf[4]
    2000169e:    4905                    li    s2,1 # return 1
    ## at_sendflag(spi, 2) != 0
    # (return)
    200016a0:    50b2                    lw    ra,44(sp)
    200016a2:    5422                    lw    s0,40(sp)
    200016a4:    854a                    mv    a0,s2
    200016a6:    5492                    lw    s1,36(sp)
    200016a8:    5902                    lw    s2,32(sp)
    200016aa:    49f2                    lw    s3,28(sp)
    200016ac:    4a62                    lw    s4,24(sp)
    200016ae:    4ad2                    lw    s5,20(sp)
    200016b0:    4b42                    lw    s6,16(sp)
    200016b2:    4bb2                    lw    s7,12(sp)
    200016b4:    4c22                    lw    s8,8(sp)
    200016b6:    6145                    addi  sp,sp,48
    200016b8:    8082                    ret
    ## esp32_diag_mode != 0 (20001614)
    # s5 = str
    200016ba:    8556                    mv    a0,s5
    200016bc:    3989                    jal   0x2000130e # <_putnps> replacting with _puts
    200016be:    20002537                lui   a0,0x20002
    200016c2:    02450513                addi  a0,a0,36 # 0x20002024 "-->"
    200016c6:    8eeff0ef                jal   ra,0x200007b4 # <_puts>
    200016ca:    b7b1                    j     0x20001616
    # at_wait_done(timeout) != 0 (20001666) (20001746)
    # s1 = tx_buf
    200016cc:    20002537                lui   a0,0x20002
    200016d0:    03450513                addi  a0,a0,52 # 0x20002034
    200016d4:    8e0ff0ef                jal   ra,0x200007b4 # <_puts> "CMD Length Timed Out Busy\r\n"
    200016d8:    0404c703                lbu   a4,64(s1) # a4 = rx_buf[0]
    200016dc:    06200793                li    a5,98 # a5 = 98/'b'
    ## if rx_buf[0] != 'b'/98
    200016e0:    f8f71fe3                bne   a4,a5,0x2000167e
    ## else
    ## if rx_buf[0] == 'b'/98 (2000167a)
    # s7 = (strlen(str) << 16) >> 16
    # s5 = str
    # s4 = spi
    # s1 = tx_buf
    200016e4:    865e                    mv    a2,s7 # a2 = (strlen(str) << 16) >> 16
    200016e6:    85d6                    mv    a1,s5 # a1 = str
    200016e8:    88818513                addi  a0,gp,-1912 # 0x80000608 tx_buf
    200016ec:    6f2000ef                jal   ra,0x20001dde # <strncpy>
    200016f0:    4605                    li    a2,1 # a2 = 1
    200016f2:    85de                    mv    a1,s7 # a1 = (strlen(str) << 16) >> 16
    200016f4:    8552                    mv    a0,s4 # a0 = spi
    200016f6:    3165                    jal   0x2000139e # <spi_transceive_one>
    200016f8:    0404c703                lbu   a4,64(s1) # a4 = rx_buf[0]
    200016fc:    04300793                li    a5,67 # a5 = 'A'
    ## if rx_buf[0] == 'A' (returns)
    20001700:    04f70b63                beq   a4,a5,0x20001756
    ## else
    20001704:    855a                    mv    a0,s6 # a0 = timeout
    20001706:    31a9                    jal   0x20001350 # <at_wait_done>
    ## if at_wait_done(timeout) != 0 (returns)
    20001708:    ed39                    bnez  a0,0x20001766
    ## else
    2000170a:    8441a703                lw    a4,-1980(gp) # 800005c4 <esp32_diag_mode>
    2000170e:    4789                    li    a5,2
    20001710:    4901                    li    s2,0 # return 0
    ## if 2 >= esp32_diag_mode (I believe this comes from a type and meant esp32_diag_mode > 2)
    20001712:    f8e7f7e3                bgeu  a5,a4,0x200016a0 # return
    ## else
    20001716:    20002537                lui   a0,0x20002
    2000171a:    0a450513                addi  a0,a0,164 # 0x200020a4 "CMD Done\r\n"
    2000171e:    896ff0ef                jal   ra,0x200007b4 # <_puts>
    20001722:    bfbd                    j     0x200016a0 # return
    # 2 < esp32_diag_mode (20001626)
    20001724:    20002537                lui   a0,0x20002
    20001728:    02850513                addi  a0,a0,40 # 0x20002028 "Flag Sent\r\n"
    2000172c:    888ff0ef                jal   ra,0x200007b4 # <_puts>
    20001730:    bded                    j     0x2000162a
    # 2 < esp32_diag_mode (2000165e)
    20001732:    20002537                lui   a0,0x20002
    20001736:    05450513                addi  a0,a0,84 # 0x20002054 "Length Sent\r\n"
    2000173a:    87aff0ef                jal   ra,0x200007b4 # <_puts>
    2000173e:    855a                    mv    a0,s6 # a0 = timeout
    20001740:    3901                    jal   0x20001350 # <at_wait_done>
    ## if at_wait_done(timeout) == 0
    20001742:    f20503e3                beqz  a0,0x20001668
    ## else
    20001746:    b759                    j     0x200016cc
    # 2 < esp32_diag_mode (2000166e)
    20001748:    20002537                lui   a0,0x20002
    2000174c:    05050513                addi  a0,a0,80 # 0x20002050 "CMD Length Sent\r\n"
    20001750:    864ff0ef                jal   ra,0x200007b4 # <_puts>
    20001754:    bf39                    j     0x20001672
    # rx_buf[0] == 'A' (20001700)
    20001756:    20002537                lui   a0,0x20002
    2000175a:    07850513                addi  a0,a0,120 # 0x20002078 " Send sync error "
    2000175e:    856ff0ef                jal   ra,0x200007b4 # <_puts>
    20001762:    4905                    li    s2,1 # return 1
    20001764:    bf35                    j     0x200016a0 # return
    ## if at_wait_done(timeout) != 0 (20001708)
    20001766:    20002537                lui   a0,0x20002
    2000176a:    08c50513                addi  a0,a0,140 # 0x2000208c "CMD Timed Out Busy\r\n"
    2000176e:    846ff0ef                jal   ra,0x200007b4 # <_puts>
    20001772:    b73d                    j     0x200016a0 # return
    # end <at_send>

    # <at_recv_one>
    20001774:    7139                    addi    sp,sp,-64
    20001776:    da26                    sw    s1,52(sp)
    20001778:    88818493              addi    s1,gp,-1912
    2000177c:    d84a                    sw    s2,48(sp)
    2000177e:    d64e                    sw    s3,44(sp)
    20001780:    d256                    sw    s5,36(sp)
    20001782:    ce5e                    sw    s7,28(sp)
    20001784:    cc62                    sw    s8,24(sp)
    20001786:    c86a                    sw    s10,16(sp)
    20001788:    c66e                    sw    s11,12(sp)
    2000178a:    de06                    sw    ra,60(sp)
    2000178c:    dc22                    sw    s0,56(sp)
    2000178e:    d452                    sw    s4,40(sp)
    20001790:    d05a                    sw    s6,32(sp)
    20001792:    ca66                    sw    s9,20(sp)
    20001794:    8aaa                    mv    s5,a0
    20001796:    4981                    li    s3,0
    20001798:    20002d37              lui    s10,0x20002
    2000179c:    04048d93              addi    s11,s1,64
    200017a0:    04448b93              addi    s7,s1,68
    200017a4:    20002c37              lui    s8,0x20002
    200017a8:    8441a683              lw    a3,-1980(gp)
    200017ac:    4789                    li    a5,2
    200017ae:    00d7f663              bgeu    a5,a3,0x200017ba
    200017b2:    0b0d0513              addi    a0,s10,176 # 0x200020b0
    200017b6:    ffffe0ef              jal    ra,0x200007b4
    200017ba:    4585                    li    a1,1
    200017bc:    8556                    mv    a0,s5
    200017be:    39b9                    jal    0x2000141c
    200017c0:    8a2a                    mv    s4,a0
    200017c2:    14051a63              bnez    a0,0x20001916
    200017c6:    8441a683              lw    a3,-1980(gp)
    200017ca:    4789                    li    a5,2
    200017cc:    16d7e563              bltu    a5,a3,0x20001936
    200017d0:    8b6e                    mv    s6,s11
    200017d2:    0c048793              addi    a5,s1,192
    200017d6:    846e                    mv    s0,s11
    200017d8:    00040023              sb    zero,0(s0)
    200017dc:    0405                    addi    s0,s0,1
    200017de:    fef41de3              bne    s0,a5,0x200017d8
    200017e2:    87a6                    mv    a5,s1
    200017e4:    00078023              sb    zero,0(a5)
    200017e8:    0785                    addi    a5,a5,1
    200017ea:    ffb79de3              bne    a5,s11,0x200017e4
    200017ee:    4605                    li    a2,1
    200017f0:    4591                    li    a1,4
    200017f2:    8556                    mv    a0,s5
    200017f4:    366d                    jal    0x2000139e
    200017f6:    06400513              li    a0,100
    200017fa:    3e99                    jal    0x20001350
    200017fc:    e525                    bnez    a0,0x20001864
    200017fe:    8441a783              lw    a5,-1980(gp)
    20001802:    4689                    li    a3,2
    20001804:    14f6e063              bltu    a3,a5,0x20001944
    20001808:    0434c603              lbu    a2,67(s1)
    2000180c:    04200693              li    a3,66
    20001810:    08d60e63              beq    a2,a3,0x200018ac
    20001814:    4405                    li    s0,1
    20001816:    00f46b63              bltu    s0,a5,0x2000182c
    2000181a:    47a5                    li    a5,9
    2000181c:    12f98b63              beq    s3,a5,0x20001952
    20001820:    06400513              li    a0,100
    20001824:    a5eff0ef              jal    ra,0x20000a82
    20001828:    0985                    addi    s3,s3,1
    2000182a:    bfbd                    j    0x200017a8
    2000182c:    20002537              lui    a0,0x20002
    20001830:    11c50513              addi    a0,a0,284 # 0x2000211c
    20001834:    f81fe0ef              jal    ra,0x200007b4
    20001838:    0434c503              lbu    a0,67(s1)
    2000183c:    e2dfe0ef              jal    ra,0x20000668
    20001840:    fd4c0513              addi    a0,s8,-44 # 0x20001fd4
    20001844:    f71fe0ef              jal    ra,0x200007b4
    20001848:    47a5                    li    a5,9
    2000184a:    10f98463              beq    s3,a5,0x20001952
    2000184e:    8441a783              lw    a5,-1980(gp)
    20001852:    fcf477e3              bgeu    s0,a5,0x20001820
    20001856:    20002537              lui    a0,0x20002
    2000185a:    13050513              addi    a0,a0,304 # 0x20002130
    2000185e:    f57fe0ef              jal    ra,0x200007b4
    20001862:    bf7d                    j    0x20001820
    20001864:    20002537              lui    a0,0x20002
    20001868:    0d450513              addi    a0,a0,212 # 0x200020d4
    2000186c:    f49fe0ef              jal    ra,0x200007b4
    20001870:    8441a783              lw    a5,-1980(gp)
    20001874:    4689                    li    a3,2
    20001876:    f8f6f9e3              bgeu    a3,a5,0x20001808
    2000187a:    200027b7              lui    a5,0x20002
    2000187e:    10878513              addi    a0,a5,264 # 0x20002108
    20001882:    f33fe0ef              jal    ra,0x200007b4
    20001886:    8cee                    mv    s9,s11
    20001888:    000cc503              lbu    a0,0(s9)
    2000188c:    0c85                    addi    s9,s9,1
    2000188e:    34a9                    jal    0x200012d8
    20001890:    ff7c9ce3              bne    s9,s7,0x20001888
    20001894:    fd4c0513              addi    a0,s8,-44
    20001898:    f1dfe0ef              jal    ra,0x200007b4
    2000189c:    0434c603              lbu    a2,67(s1)
    200018a0:    04200693              li    a3,66
    200018a4:    8441a783              lw    a5,-1980(gp)
    200018a8:    f6d616e3              bne    a2,a3,0x20001814
    200018ac:    0414c983              lbu    s3,65(s1)
    200018b0:    0404c603              lbu    a2,64(s1)
    200018b4:    4685                    li    a3,1
    200018b6:    099e                    slli    s3,s3,0x7
    200018b8:    99b2                    add    s3,s3,a2
    200018ba:    08f6ee63              bltu    a3,a5,0x20001956
    200018be:    87ee                    mv    a5,s11
    200018c0:    00078023              sb    zero,0(a5)
    200018c4:    0785                    addi    a5,a5,1
    200018c6:    fe879de3              bne    a5,s0,0x200018c0
    200018ca:    4601                    li    a2,0
    200018cc:    85ce                    mv    a1,s3
    200018ce:    8556                    mv    a0,s5
    200018d0:    34f9                    jal    0x2000139e
    200018d2:    8441a683              lw    a3,-1980(gp)
    200018d6:    94ce                    add    s1,s1,s3
    200018d8:    04048023              sb    zero,64(s1)
    200018dc:    4785                    li    a5,1
    200018de:    02d7fc63              bgeu    a5,a3,0x20001916
    200018e2:    20002537              lui    a0,0x20002
    200018e6:    15450513              addi    a0,a0,340 # 0x20002154
    200018ea:    ecbfe0ef              jal    ra,0x200007b4
    200018ee:    00098e63              beqz    s3,0x2000190a
    200018f2:    99ee                    add    s3,s3,s11
    200018f4:    000b4503              lbu    a0,0(s6)
    200018f8:    0b05                    addi    s6,s6,1
    200018fa:    ef7fe0ef              jal    ra,0x200007f0
    200018fe:    02000513              li    a0,32
    20001902:    d67fe0ef              jal    ra,0x20000668
    20001906:    ff3b17e3              bne    s6,s3,0x200018f4
    2000190a:    20002537              lui    a0,0x20002
    2000190e:    fd450513              addi    a0,a0,-44 # 0x20001fd4
    20001912:    ea3fe0ef              jal    ra,0x200007b4
    20001916:    50f2                    lw    ra,60(sp)
    20001918:    5462                    lw    s0,56(sp)
    2000191a:    8552                    mv    a0,s4
    2000191c:    54d2                    lw    s1,52(sp)
    2000191e:    5942                    lw    s2,48(sp)
    20001920:    59b2                    lw    s3,44(sp)
    20001922:    5a22                    lw    s4,40(sp)
    20001924:    5a92                    lw    s5,36(sp)
    20001926:    5b02                    lw    s6,32(sp)
    20001928:    4bf2                    lw    s7,28(sp)
    2000192a:    4c62                    lw    s8,24(sp)
    2000192c:    4cd2                    lw    s9,20(sp)
    2000192e:    4d42                    lw    s10,16(sp)
    20001930:    4db2                    lw    s11,12(sp)
    20001932:    6121                    addi    sp,sp,64
    20001934:    8082                    ret
    20001936:    200027b7              lui    a5,0x20002
    2000193a:    0c478513              addi    a0,a5,196 # 0x200020c4
    2000193e:    e77fe0ef              jal    ra,0x200007b4
    20001942:    b579                    j    0x200017d0
    20001944:    20002537              lui    a0,0x20002
    20001948:    0f450513              addi    a0,a0,244 # 0x200020f4
    2000194c:    e69fe0ef              jal    ra,0x200007b4
    20001950:    b705                    j    0x20001870
    20001952:    4a05                    li    s4,1
    20001954:    b7c9                    j    0x20001916
    20001956:    20002537              lui    a0,0x20002
    2000195a:    14050513              addi    a0,a0,320 # 0x20002140
    2000195e:    e57fe0ef              jal    ra,0x200007b4
    20001962:    854e                    mv    a0,s3
    20001964:    e8dfe0ef              jal    ra,0x200007f0
    20001968:    02000513              li    a0,32
    2000196c:    cfdfe0ef              jal    ra,0x20000668
    20001970:    20002537              lui    a0,0x20002
    20001974:    fd450513              addi    a0,a0,-44 # 0x20001fd4
    20001978:    e3dfe0ef              jal    ra,0x200007b4
    2000197c:    b789                    j    0x200018be
    # end <at_recv_one>

    # <at_recv>
    2000197e:    7179                    addi    sp,sp,-48
    20001980:    ce4e                    sw    s3,28(sp)
    20001982:    cc52                    sw    s4,24(sp)
    20001984:    d226                    sw    s1,36(sp)
    20001986:    ca56                    sw    s5,20(sp)
    20001988:    c85a                    sw    s6,16(sp)
    2000198a:    c65e                    sw    s7,12(sp)
    2000198c:    c462                    sw    s8,8(sp)
    2000198e:    d606                    sw    ra,44(sp)
    20001990:    d422                    sw    s0,40(sp)
    20001992:    d04a                    sw    s2,32(sp)
    20001994:    8baa                    mv    s7,a0
    20001996:    03100493              li    s1,49
    2000199a:    8c818993              addi    s3,gp,-1848
    2000199e:    20002c37              lui    s8,0x20002
    200019a2:    8c818a13              addi    s4,gp,-1848
    200019a6:    20002b37              lui    s6,0x20002
    200019aa:    a835                    j    0x200019e6
    200019ac:    e3c1                    bnez    a5,0x20001a2c
    200019ae:    200025b7              lui    a1,0x20002
    200019b2:    4619                    li    a2,6
    200019b4:    19058593              addi    a1,a1,400 # 0x20002190
    200019b8:    8522                    mv    a0,s0
    200019ba:    2eed                    jal    0x20001db4
    200019bc:    200025b7              lui    a1,0x20002
    200019c0:    4619                    li    a2,6
    200019c2:    1a458593              addi    a1,a1,420 # 0x200021a4
    200019c6:    14fd                    addi    s1,s1,-1
    200019c8:    cd49                    beqz    a0,0x20001a62
    200019ca:    8522                    mv    a0,s0
    200019cc:    26e5                    jal    0x20001db4
    200019ce:    200025b7              lui    a1,0x20002
    200019d2:    4619                    li    a2,6
    200019d4:    1bc58593              addi    a1,a1,444 # 0x200021bc
    200019d8:    c14d                    beqz    a0,0x20001a7a
    200019da:    8522                    mv    a0,s0
    200019dc:    2ee1                    jal    0x20001db4
    200019de:    57fd                    li    a5,-1
    200019e0:    c955                    beqz    a0,0x20001a94
    200019e2:    06f48363              beq    s1,a5,0x20001a48
    200019e6:    855e                    mv    a0,s7
    200019e8:    3371                    jal    0x20001774
    200019ea:    892a                    mv    s2,a0
    200019ec:    4705                    li    a4,1
    200019ee:    178b0513              addi    a0,s6,376 # 0x20002178
    200019f2:    04091563              bnez    s2,0x20001a3c
    200019f6:    8441a783              lw    a5,-1980(gp)
    200019fa:    8452                    mv    s0,s4
    200019fc:    faf778e3              bgeu    a4,a5,0x200019ac
    20001a00:    db5fe0ef              jal    ra,0x200007b4
    20001a04:    8526                    mv    a0,s1
    20001a06:    debfe0ef              jal    ra,0x200007f0
    20001a0a:    03a00513              li    a0,58
    20001a0e:    c5bfe0ef              jal    ra,0x20000668
    20001a12:    02000513              li    a0,32
    20001a16:    c53fe0ef              jal    ra,0x20000668
    20001a1a:    854e                    mv    a0,s3
    20001a1c:    d99fe0ef              jal    ra,0x200007b4
    20001a20:    fd4c0513              addi    a0,s8,-44 # 0x20001fd4
    20001a24:    844e                    mv    s0,s3
    20001a26:    d8ffe0ef              jal    ra,0x200007b4
    20001a2a:    b751                    j    0x200019ae
    20001a2c:    854e                    mv    a0,s3
    20001a2e:    30c5                    jal    0x2000130e
    20001a30:    fd4c0513              addi    a0,s8,-44
    20001a34:    844e                    mv    s0,s3
    20001a36:    d7ffe0ef              jal    ra,0x200007b4
    20001a3a:    bf95                    j    0x200019ae
    20001a3c:    20002537              lui    a0,0x20002
    20001a40:    16850513              addi    a0,a0,360 # 0x20002168
    20001a44:    d71fe0ef              jal    ra,0x200007b4
    20001a48:    50b2                    lw    ra,44(sp)
    20001a4a:    5422                    lw    s0,40(sp)
    20001a4c:    854a                    mv    a0,s2
    20001a4e:    5492                    lw    s1,36(sp)
    20001a50:    5902                    lw    s2,32(sp)
    20001a52:    49f2                    lw    s3,28(sp)
    20001a54:    4a62                    lw    s4,24(sp)
    20001a56:    4ad2                    lw    s5,20(sp)
    20001a58:    4b42                    lw    s6,16(sp)
    20001a5a:    4bb2                    lw    s7,12(sp)
    20001a5c:    4c22                    lw    s8,8(sp)
    20001a5e:    6145                    addi    sp,sp,48
    20001a60:    8082                    ret
    20001a62:    8441a783              lw    a5,-1980(gp)
    20001a66:    4905                    li    s2,1
    20001a68:    fef970e3              bgeu    s2,a5,0x20001a48
    20001a6c:    20002537              lui    a0,0x20002
    20001a70:    19850513              addi    a0,a0,408 # 0x20002198
    20001a74:    d41fe0ef              jal    ra,0x200007b4
    20001a78:    bfc1                    j    0x20001a48
    20001a7a:    8441a703              lw    a4,-1980(gp)
    20001a7e:    4785                    li    a5,1
    20001a80:    4909                    li    s2,2
    20001a82:    fce7f3e3              bgeu    a5,a4,0x20001a48
    20001a86:    20002537              lui    a0,0x20002
    20001a8a:    1b050513              addi    a0,a0,432 # 0x200021b0
    20001a8e:    d27fe0ef              jal    ra,0x200007b4
    20001a92:    bf5d                    j    0x20001a48
    20001a94:    8441a703              lw    a4,-1980(gp)
    20001a98:    4785                    li    a5,1
    20001a9a:    597d                    li    s2,-1
    20001a9c:    fae7f6e3              bgeu    a5,a4,0x20001a48
    20001aa0:    20002537              lui    a0,0x20002
    20001aa4:    1c850513              addi    a0,a0,456 # 0x200021c8
    20001aa8:    d0dfe0ef              jal    ra,0x200007b4
    20001aac:    bf71                    j    0x20001a48
    # end <at_recv>

    # <at_sendrecv>
    20001aae:    1141                    addi   sp,sp,-16 # function stuff
    20001ab0:    c422                    sw     s0,8(sp) # function stuff
    20001ab2:    c606                    sw     ra,12(sp) # function stuff
    20001ab4:    842a                    mv     s0,a0 # s0 = spi
    20001ab6:    3e1d                    jal    0x200015ec # <at_send>
    20001ab8:    c509                    beqz   a0,0x20001ac2 # if return == 0
    20001aba:    40b2                    lw     ra,12(sp)
    20001abc:    4422                    lw     s0,8(sp)
    20001abe:    0141                    addi   sp,sp,16
    20001ac0:    8082                    ret
    20001ac2:    8522                    mv     a0,s0
    20001ac4:    4422                    lw     s0,8(sp)
    20001ac6:    40b2                    lw     ra,12(sp)
    20001ac8:    0141                    addi   sp,sp,16
    20001aca:    bd55                    j      0x2000197e  # <at_recv>
    # end <at_sendrecv>

    # <esp32_init>
    # gpio
    20001acc:    100127b7                lui    a5,0x10012 # 0x10012000 GPIO
    20001ad0:    5fd4                    lw     a3,60(a5) # iof_sel
    20001ad2:    1141                    addi   sp,sp,-16 # function stuff
    20001ad4:    c606                    sw     ra,12(sp) # function stuff
    20001ad6:    c422                    sw     s0,8(sp) # function stuff
    20001ad8:    9add                    andi   a3,a3,-9 # iof_sel & ~(SPI1_DQ0)
    20001ada:    dfd4                    sw     a3,60(a5) # iof_sel & ~(SPI1_DQ0) write
    20001adc:    5fd4                    lw     a3,60(a5) # iof_sel
    20001ade:    10024737                lui    a4,0x10024 # 0x10024000 SPI1
    20001ae2:    9abd                    andi   a3,a3,-17 # iof_sel & ~(SPI1_DQ1)
    20001ae4:    dfd4                    sw     a3,60(a5) # iof_sel & ~(SPI1_DQ1) write
    20001ae6:    5fd0                    lw     a2,60(a5) # iof_sel
    20001ae8:    100246b7                lui    a3,0x10024 # 0x10024000 SPI1
    20001aec:    fdf67613                andi   a2,a2,-33 # iof_setl & ~(SPI1_SCK)
    20001af0:    dfd0                    sw     a2,60(a5) # iof_setl & ~(SPI1_SCK) write
    20001af2:    5fd0                    lw     a2,60(a5) iof_sel
    20001af4:    dff67613                andi   a2,a2,-513 # iof_setl & ~(SPI1_CS2)
    20001af8:    dfd0                    sw     a2,60(a5) # iof_setl & ~(SPI1_CS2) write
    20001afa:    5f90                    lw     a2,56(a5) # iof_en
    20001afc:    00866613                ori    a2,a2,8 # iof_en | SPI1_DQ0
    20001b00:    df90                    sw     a2,56(a5) # iof_en | SPI1_DQ0 write
    20001b02:    5f90                    lw     a2,56(a5) # iof_en
    20001b04:    01066613                ori    a2,a2,16 # iof_en | SPI1_DQ1
    20001b08:    df90                    sw     a2,56(a5) # iof_en | SPI1_DQ1 write
    20001b0a:    5f90                    lw     a2,56(a5) # iof_en
    20001b0c:    02066613                ori    a2,a2,32 # iof_en | SPI1_SCK
    20001b10:    df90                    sw     a2,56(a5) # iof_en | SPI1_SCK write
    20001b12:    5f90                    lw     a2,56(a5) # iof_en
    20001b14:    20066613                ori    a2,a2,512 # iof_en | SPI1_CS2
    20001b18:    df90                    sw     a2,56(a5) # iof_en | SPI1_CS2 write
    20001b1a:    43d0                    lw     a2,4(a5) # input_en
    20001b1c:    40066613                ori    a2,a2,1024 # enable input on pin 10
    20001b20:    c3d0                    sw     a2,4(a5) # enable input on pin 10 write
    # spi
    # a4 = 0x10024000 SPI1
    20001b22:    06400793                li     a5,100 # new sckdiv 100
    20001b26:    c31c                    sw     a5,0(a4) # set sckdiv to 100
    20001b28:    000807b7                lui    a5,0x80 # 0x00080000 frame format (proto: single, msb first, normal, 8 bit len)
    20001b2c:    c33c                    sw     a5,64(a4) # set frame format
    20001b2e:    4789                    li     a5,2 # set csid to 2
    20001b30:    cb1c                    sw     a5,16(a4) # set csid to 2 write
    20001b32:    533c                    lw     a5,96(a4) # fctrl
    20001b34:    9bf9                    andi   a5,a5,-2 # disable direct memory mapping
    20001b36:    d33c                    sw     a5,96(a4) # disable direct memory mapping write
    20001b38:    02070623                sb     zero,44(a4) # 0x1002402c set delay1 intercs to 0
    20001b3c:    4f1c                    lw     a5,24(a4) # csmode
    20001b3e:    9bf1                    andi   a5,a5,-4 # csmode & ~(3) (set csmode to AUTO)
    20001b40:    cf1c                    sw     a5,24(a4) # set csmode AUTO write
    # while rxdat > 0 {
    20001b42:    46fc                    lw     a5,76(a3) # rxdata
    20001b44:    fef04fe3                bgtz   a5,0x20001b42
    # }
    20001b48:    20002437                lui    s0,0x20002 # 0x20002000
    20001b4c:    fd440513                addi   a0,s0,-44 # 0x20001fd4
    20001b50:    c65fe0ef                jal    ra,0x200007b4
    20001b54:    200025b7                lui    a1,0x20002
    20001b58:    06400613                li     a2,100
    20001b5c:    1d458593                addi   a1,a1,468 # 0x200021d4
    20001b60:    10024537                lui    a0,0x10024
    20001b64:    37a9                    jal    0x20001aae # <at_sendrecv>
    20001b66:    200025b7                lui    a1,0x20002
    20001b6a:    06400613                li     a2,100
    20001b6e:    1dc58593                addi   a1,a1,476 # 0x200021dc
    20001b72:    10024537                lui    a0,0x10024
    20001b76:    3f25                    jal    0x20001aae # <at_sendrecv>
    20001b78:    200025b7                lui    a1,0x20002
    20001b7c:    06400613                li     a2,100
    20001b80:    1ec58593                addi   a1,a1,492 # 0x200021ec
    20001b84:    10024537                lui    a0,0x10024
    20001b88:    371d                    jal    0x20001aae # <at_sendrecv>
    20001b8a:    fd440513                addi   a0,s0,-44
    20001b8e:    c27fe0ef                jal    ra,0x200007b4 # <_puts>
    20001b92:    40b2                    lw     ra,12(sp)
    20001b94:    4422                    lw     s0,8(sp)
    20001b96:    4501                    li     a0,0
    20001b98:    0141                    addi   sp,sp,16
    20001b9a:    8082                    ret
    # end esp32_init

    20001b9c:    c621                    beqz    a2,0x20001be4
    20001b9e:    1141                    addi    sp,sp,-16
    20001ba0:    00000597              auipc    a1,0x0
    20001ba4:    67458593              addi    a1,a1,1652 # 0x20002214
    20001ba8:    8532                    mv    a0,a2
    20001baa:    c422                    sw    s0,8(sp)
    20001bac:    c606                    sw    ra,12(sp)
    20001bae:    8432                    mv    s0,a2
    20001bb0:    28d1                    jal    0x20001c84
    20001bb2:    c105                    beqz    a0,0x20001bd2
    20001bb4:    00000597              auipc    a1,0x0
    20001bb8:    65c58593              addi    a1,a1,1628 # 0x20002210
    20001bbc:    8522                    mv    a0,s0
    20001bbe:    20d9                    jal    0x20001c84
    20001bc0:    c909                    beqz    a0,0x20001bd2
    20001bc2:    00000597              auipc    a1,0x0
    20001bc6:    42658593              addi    a1,a1,1062 # 0x20001fe8
    20001bca:    8522                    mv    a0,s0
    20001bcc:    2865                    jal    0x20001c84
    20001bce:    4781                    li    a5,0
    20001bd0:    e509                    bnez    a0,0x20001bda
    20001bd2:    00000797              auipc    a5,0x0
    20001bd6:    63e78793              addi    a5,a5,1598 # 0x20002210
    20001bda:    40b2                    lw    ra,12(sp)
    20001bdc:    4422                    lw    s0,8(sp)
    20001bde:    853e                    mv    a0,a5
    20001be0:    0141                    addi    sp,sp,16
    20001be2:    8082                    ret
    20001be4:    00000797              auipc    a5,0x0
    20001be8:    62c78793              addi    a5,a5,1580 # 0x20002210
    20001bec:    853e                    mv    a0,a5
    20001bee:    8082                    ret
    20001bf0:    84c18793              addi    a5,gp,-1972
    20001bf4:    439c                    lw    a5,0(a5)
    20001bf6:    5bdc                    lw    a5,52(a5)
    20001bf8:    e789                    bnez    a5,0x20001c02
    20001bfa:    5fffe797              auipc    a5,0x5fffe
    20001bfe:    40678793              addi    a5,a5,1030 # 0x80000000
    20001c02:    1287c503              lbu    a0,296(a5)
    20001c06:    8082                    ret
    20001c08:    0ec52503              lw    a0,236(a0) # 0x100240ec
    20001c0c:    8082                    ret
    20001c0e:    84c18793              addi    a5,gp,-1972
    20001c12:    439c                    lw    a5,0(a5)
    20001c14:    5bdc                    lw    a5,52(a5)
    20001c16:    e789                    bnez    a5,0x20001c20
    20001c18:    5fffe797              auipc    a5,0x5fffe
    20001c1c:    3e878793              addi    a5,a5,1000 # 0x80000000
    20001c20:    0ec7a503              lw    a0,236(a5)
    20001c24:    8082                    ret
    20001c26:    84c18793              addi    a5,gp,-1972
    20001c2a:    862e                    mv    a2,a1
    20001c2c:    85aa                    mv    a1,a0
    20001c2e:    4388                    lw    a0,0(a5)
    20001c30:    b7b5                    j    0x20001b9c
    20001c32:    84c18793              addi    a5,gp,-1972
    20001c36:    439c                    lw    a5,0(a5)
    20001c38:    5bdc                    lw    a5,52(a5)
    20001c3a:    e789                    bnez    a5,0x20001c44
    20001c3c:    5fffe797              auipc    a5,0x5fffe
    20001c40:    3c478793              addi    a5,a5,964 # 0x80000000
    20001c44:    0e47a303              lw    t1,228(a5)
    20001c48:    8302                    jr    t1
    20001c4a:    e185                    bnez    a1,0x20001c6a
    20001c4c:    1141                    addi    sp,sp,-16
    20001c4e:    006c                    addi    a1,sp,12
    20001c50:    4501                    li    a0,0
    20001c52:    ca11                    beqz    a2,0x20001c66
    20001c54:    5579                    li    a0,-2
    20001c56:    ca81                    beqz    a3,0x20001c66
    20001c58:    00064783              lbu    a5,0(a2) # 0x30000
    20001c5c:    c19c                    sw    a5,0(a1)
    20001c5e:    00064503              lbu    a0,0(a2)
    20001c62:    00a03533              snez    a0,a0
    20001c66:    0141                    addi    sp,sp,16
    20001c68:    8082                    ret
    20001c6a:    4501                    li    a0,0
    20001c6c:    ca19                    beqz    a2,0x20001c82
    20001c6e:    5579                    li    a0,-2
    20001c70:    ca89                    beqz    a3,0x20001c82
    20001c72:    00064783              lbu    a5,0(a2)
    20001c76:    c19c                    sw    a5,0(a1)
    20001c78:    00064503              lbu    a0,0(a2)
    20001c7c:    00a03533              snez    a0,a0
    20001c80:    8082                    ret
    20001c82:    8082                    ret
    20001c84:    00b56733              or    a4,a0,a1
    20001c88:    53fd                    li    t2,-1
    20001c8a:    8b0d                    andi    a4,a4,3
    20001c8c:    e779                    bnez    a4,0x20001d5a
    20001c8e:    7f7f87b7              lui    a5,0x7f7f8
    20001c92:    f7f78793              addi    a5,a5,-129 # 0x7f7f7f7f
    20001c96:    4110                    lw    a2,0(a0)
    20001c98:    4194                    lw    a3,0(a1)
    20001c9a:    00f672b3              and    t0,a2,a5
    20001c9e:    00f66333              or    t1,a2,a5
    20001ca2:    92be                    add    t0,t0,a5
    20001ca4:    0062e2b3              or    t0,t0,t1
    20001ca8:    0c729763              bne    t0,t2,0x20001d76
    20001cac:    06d61863              bne    a2,a3,0x20001d1c
    20001cb0:    4150                    lw    a2,4(a0)
    20001cb2:    41d4                    lw    a3,4(a1)
    20001cb4:    00f672b3              and    t0,a2,a5
    20001cb8:    00f66333              or    t1,a2,a5
    20001cbc:    92be                    add    t0,t0,a5
    20001cbe:    0062e2b3              or    t0,t0,t1
    20001cc2:    0a729863              bne    t0,t2,0x20001d72
    20001cc6:    04d61b63              bne    a2,a3,0x20001d1c
    20001cca:    4510                    lw    a2,8(a0)
    20001ccc:    4594                    lw    a3,8(a1)
    20001cce:    00f672b3              and    t0,a2,a5
    20001cd2:    00f66333              or    t1,a2,a5
    20001cd6:    92be                    add    t0,t0,a5
    20001cd8:    0062e2b3              or    t0,t0,t1
    20001cdc:    0a729163              bne    t0,t2,0x20001d7e
    20001ce0:    02d61e63              bne    a2,a3,0x20001d1c
    20001ce4:    4550                    lw    a2,12(a0)
    20001ce6:    45d4                    lw    a3,12(a1)
    20001ce8:    00f672b3              and    t0,a2,a5
    20001cec:    00f66333              or    t1,a2,a5
    20001cf0:    92be                    add    t0,t0,a5
    20001cf2:    0062e2b3              or    t0,t0,t1
    20001cf6:    08729a63              bne    t0,t2,0x20001d8a
    20001cfa:    02d61163              bne    a2,a3,0x20001d1c
    20001cfe:    4910                    lw    a2,16(a0)
    20001d00:    4994                    lw    a3,16(a1)
    20001d02:    00f672b3              and    t0,a2,a5
    20001d06:    00f66333              or    t1,a2,a5
    20001d0a:    92be                    add    t0,t0,a5
    20001d0c:    0062e2b3              or    t0,t0,t1
    20001d10:    08729363              bne    t0,t2,0x20001d96
    20001d14:    0551                    addi    a0,a0,20
    20001d16:    05d1                    addi    a1,a1,20
    20001d18:    f6d60fe3              beq    a2,a3,0x20001c96
    20001d1c:    01061713              slli    a4,a2,0x10
    20001d20:    01069793              slli    a5,a3,0x10
    20001d24:    00f71c63              bne    a4,a5,0x20001d3c
    20001d28:    01065713              srli    a4,a2,0x10
    20001d2c:    0106d793              srli    a5,a3,0x10
    20001d30:    40f70533              sub    a0,a4,a5
    20001d34:    0ff57593              andi    a1,a0,255
    20001d38:    e991                    bnez    a1,0x20001d4c
    20001d3a:    8082                    ret
    20001d3c:    8341                    srli    a4,a4,0x10
    20001d3e:    83c1                    srli    a5,a5,0x10
    20001d40:    40f70533              sub    a0,a4,a5
    20001d44:    0ff57593              andi    a1,a0,255
    20001d48:    e191                    bnez    a1,0x20001d4c
    20001d4a:    8082                    ret
    20001d4c:    0ff77713              andi    a4,a4,255
    20001d50:    0ff7f793              andi    a5,a5,255
    20001d54:    40f70533              sub    a0,a4,a5
    20001d58:    8082                    ret
    20001d5a:    00054603              lbu    a2,0(a0)
    20001d5e:    0005c683              lbu    a3,0(a1)
    20001d62:    0505                    addi    a0,a0,1
    20001d64:    0585                    addi    a1,a1,1
    20001d66:    00d61363              bne    a2,a3,0x20001d6c
    20001d6a:    fa65                    bnez    a2,0x20001d5a
    20001d6c:    40d60533              sub    a0,a2,a3
    20001d70:    8082                    ret
    20001d72:    0511                    addi    a0,a0,4
    20001d74:    0591                    addi    a1,a1,4
    20001d76:    fed612e3              bne    a2,a3,0x20001d5a
    20001d7a:    4501                    li    a0,0
    20001d7c:    8082                    ret
    20001d7e:    0521                    addi    a0,a0,8
    20001d80:    05a1                    addi    a1,a1,8
    20001d82:    fcd61ce3              bne    a2,a3,0x20001d5a
    20001d86:    4501                    li    a0,0
    20001d88:    8082                    ret
    20001d8a:    0531                    addi    a0,a0,12
    20001d8c:    05b1                    addi    a1,a1,12
    20001d8e:    fcd616e3              bne    a2,a3,0x20001d5a
    20001d92:    4501                    li    a0,0
    20001d94:    8082                    ret
    20001d96:    0541                    addi    a0,a0,16
    20001d98:    05c1                    addi    a1,a1,16
    20001d9a:    fcd610e3              bne    a2,a3,0x20001d5a
    20001d9e:    4501                    li    a0,0
    20001da0:    8082                    ret
    20001da2:    87aa                    mv    a5,a0
    20001da4:    0785                    addi    a5,a5,1
    20001da6:    fff7c703              lbu    a4,-1(a5)
    20001daa:    ff6d                    bnez    a4,0x20001da4
    20001dac:    40a78533              sub    a0,a5,a0
    20001db0:    157d                    addi    a0,a0,-1
    20001db2:    8082                    ret
    20001db4:    c21d                    beqz    a2,0x20001dda
    20001db6:    00150713              addi    a4,a0,1
    20001dba:    9532                    add    a0,a0,a2
    20001dbc:    fff74783              lbu    a5,-1(a4)
    20001dc0:    0005c683              lbu    a3,0(a1)
    20001dc4:    00d78563              beq    a5,a3,0x20001dce
    20001dc8:    40d78533              sub    a0,a5,a3
    20001dcc:    8082                    ret
    20001dce:    fea70de3              beq    a4,a0,0x20001dc8
    20001dd2:    0705                    addi    a4,a4,1
    20001dd4:    dbf5                    beqz    a5,0x20001dc8
    20001dd6:    0585                    addi    a1,a1,1
    20001dd8:    b7d5                    j    0x20001dbc
    20001dda:    4501                    li    a0,0
    20001ddc:    8082                    ret
    20001dde:    872a                    mv    a4,a0
    20001de0:    e211                    bnez    a2,0x20001de4
    20001de2:    8082                    ret
    20001de4:    0585                    addi    a1,a1,1
    20001de6:    fff5c683              lbu    a3,-1(a1)
    20001dea:    00170793              addi    a5,a4,1
    20001dee:    fff60813              addi    a6,a2,-1
    20001df2:    fed78fa3              sb    a3,-1(a5)
    20001df6:    e689                    bnez    a3,0x20001e00
    20001df8:    9732                    add    a4,a4,a2
    20001dfa:    00e79663              bne    a5,a4,0x20001e06
    20001dfe:    8082                    ret
    20001e00:    873e                    mv    a4,a5
    20001e02:    8642                    mv    a2,a6
    20001e04:    bff1                    j    0x20001de0
    20001e06:    0785                    addi    a5,a5,1
    20001e08:    fe078fa3              sb    zero,-1(a5)
    20001e0c:    b7fd                    j    0x20001dfa
    20001e0e:    84c18793              addi    a5,gp,-1972
    20001e12:    439c                    lw    a5,0(a5)
    20001e14:    5bdc                    lw    a5,52(a5)
    20001e16:    e789                    bnez    a5,0x20001e20
    20001e18:    5fffe797              auipc    a5,0x5fffe
    20001e1c:    1e878793              addi    a5,a5,488 # 0x80000000
    20001e20:    0e07a303              lw    t1,224(a5)
    20001e24:    8302                    jr    t1
    20001e26:    cd91                    beqz    a1,0x20001e42
    20001e28:    0ff00793              li    a5,255
    20001e2c:    00c7f763              bgeu    a5,a2,0x20001e3a
    20001e30:    08a00793              li    a5,138
    20001e34:    c11c                    sw    a5,0(a0)
    20001e36:    557d                    li    a0,-1
    20001e38:    8082                    ret
    20001e3a:    00c58023              sb    a2,0(a1)
    20001e3e:    4505                    li    a0,1
    20001e40:    8082                    ret
    20001e42:    4501                    li    a0,0
    20001e44:    8082                    ret
    ...

### data
Disassembly of section .sec2:

0000000020001ec0 <.sec2>:
    20001ec0:    0000                    unimp
    20001ec2:    0048                    addi    a0,sp,4
    20001ec4:    0000                    unimp
    20001ec6:    0060                    addi    s0,sp,12
    20001ec8:    0000                    unimp
    20001eca:    0068                    addi    a0,sp,12
    20001ecc:    5020                    lw    s0,96(s0)
    20001ece:    5341                    li    t1,-16
    20001ed0:    0d444553              0xd444553
    20001ed4:    000a                    c.slli    zero,0x2
    20001ed6:    0000                    unimp
    20001ed8:    0a0d                    addi    s4,s4,3
    20001eda:    5245                    li    tp,-15
    20001edc:    4f52                    lw    t5,20(sp)
    20001ede:    3a52                    fld    fs4,304(sp)
    20001ee0:    0020                    addi    s0,sp,8
    20001ee2:    0000                    unimp

    #  FAILED WITH CODE 
    20001ee4:    4620                    lw    s0,72(a2)
    20001ee6:    4941                    li    s2,16
    20001ee8:    454c                    lw    a1,12(a0)
    20001eea:    2044                    fld    fs1,128(s0)
    20001eec:    48544957              0x48544957
    20001ef0:    4320                    lw    s0,64(a4)
    20001ef2:    2045444f              fnmadd.s    fs0,fa0,ft4,ft4,rmm
    20001ef6:    0000                    unimp

    # .[1F
    20001ef8:    46315b1b              0x46315b1b
    20001efc:    0000                    unimp
    20001efe:    0000                    unimp

    # .[0J
    20001f00:    4a305b1b              0x4a305b1b
    20001f04:    0000                    unimp
    20001f06:    0000                    unimp

    # .[?25h
    20001f08:    323f5b1b              0x323f5b1b
    20001f0c:    6835                    lui    a6,0xd
    20001f0e:    0000                    unimp

    # .[0;39;49m
    20001f10:    3b305b1b              0x3b305b1b
    20001f14:    343b3933              0x343b3933
    20001f18:    6d39                    lui    s10,0xe
    20001f1a:    0000                    unimp
    
    # Bench Clock Reset Complete\r\n
    20001f1c:    6542                    flw    fa0,16(sp)
    20001f1e:    636e                    flw    ft6,216(sp)
    20001f20:    2068                    fld    fa0,192(s0)
    20001f22:    636f6c43              fmadd.d    fs8,ft10,fs6,fa2,unknown
    20001f26:    6552206b              0x6552206b
    20001f2a:    20746573              csrrsi    a0,0x207,8
    20001f2e:    706d6f43              fmadd.s    ft10,fs10,ft6,fa4,unknown
    20001f32:    656c                    flw    fa1,76(a0)
    20001f34:    6574                    flw    fa3,76(a0)
    20001f36:    0a0d                    addi    s4,s4,3
    
    20001f38:    0000                    unimp
    20001f3a:    0000                    unimp
    20001f3c:    646e6553              0x646e6553
    20001f40:    6e69                    lui    t3,0x1a
    20001f42:    6c462067              0x6c462067
    20001f46:    6761                    lui    a4,0x18
    20001f48:    203a                    fld    ft0,392(sp)
    20001f4a:    0000                    unimp
    20001f4c:    646e6553              0x646e6553
    20001f50:    4620                    lw    s0,72(a2)
    20001f52:    616c                    flw    fa1,68(a0)
    20001f54:    69542067              0x69542067
    20001f58:    656d                    lui    a0,0x1b
    20001f5a:    2064                    fld    fs1,192(s0)
    20001f5c:    2074754f              fnmadd.s    fa0,fs0,ft7,ft4
    20001f60:    74696157              0x74696157
    20001f64:    6e69                    lui    t3,0x1a
    20001f66:    6f662067              0x6f662067
    20001f6a:    2072                    fld    ft0,280(sp)
    20001f6c:    6552                    flw    fa0,20(sp)
    20001f6e:    6461                    lui    s0,0x18
    20001f70:    0d79                    addi    s10,s10,30
    20001f72:    000a                    c.slli    zero,0x2
    20001f74:    646e6553              0x646e6553
    20001f78:    4620                    lw    s0,72(a2)
    20001f7a:    616c                    flw    fa1,68(a0)
    20001f7c:    74532067              0x74532067
    20001f80:    7261                    lui    tp,0xffff8
    20001f82:    6574                    flw    fa3,76(a0)
    20001f84:    0d64                    addi    s1,sp,668
    20001f86:    000a                    c.slli    zero,0x2
    20001f88:    646e6553              0x646e6553
    20001f8c:    4620                    lw    s0,72(a2)
    20001f8e:    616c                    flw    fa1,68(a0)
    20001f90:    69542067              0x69542067
    20001f94:    656d                    lui    a0,0x1b
    20001f96:    2064                    fld    fs1,192(s0)
    20001f98:    2074754f              fnmadd.s    fa0,fs0,ft7,ft4
    20001f9c:    7542                    flw    fa0,48(sp)
    20001f9e:    202e7973              csrrci    s2,hedeleg,28
    20001fa2:    6552                    flw    fa0,20(sp)
    20001fa4:    7274                    flw    fa3,100(a2)
    20001fa6:    6979                    lui    s2,0x1e
    20001fa8:    676e                    flw    fa4,216(sp)
    20001faa:    0d2e                    slli    s10,s10,0xb
    20001fac:    000a                    c.slli    zero,0x2
    20001fae:    0000                    unimp
    20001fb0:    646e6553              0x646e6553
    20001fb4:    4620                    lw    s0,72(a2)
    20001fb6:    616c                    flw    fa1,68(a0)
    20001fb8:    69542067              0x69542067
    20001fbc:    656d                    lui    a0,0x1b
    20001fbe:    2064                    fld    fs1,192(s0)
    20001fc0:    2074754f              fnmadd.s    fa0,fs0,ft7,ft4
    20001fc4:    7542                    flw    fa0,48(sp)
    20001fc6:    202e7973              csrrci    s2,hedeleg,28
    20001fca:    69766947              fmsub.s    fs2,fa2,fs7,fa3,unknown
    20001fce:    676e                    flw    fa4,216(sp)
    20001fd0:    5520                    lw    s0,104(a0)
    20001fd2:    2e70                    fld    fa2,216(a2)
    20001fd4:    0a0d                    addi    s4,s4,3
    20001fd6:    0000                    unimp
    20001fd8:    646e6553              0x646e6553
    20001fdc:    4620                    lw    s0,72(a2)
    20001fde:    616c                    flw    fa1,68(a0)
    20001fe0:    6f442067              0x6f442067
    20001fe4:    656e                    flw    fa0,216(sp)
    20001fe6:    0a0d                    addi    s4,s4,3
    20001fe8:    0000                    unimp
    20001fea:    0000                    unimp
    20001fec:    6c46                    flw    fs8,80(sp)
    20001fee:    6761                    lui    a4,0x18
    20001ff0:    5220                    lw    s0,96(a2)
    20001ff2:    6365                    lui    t1,0x19
    20001ff4:    6965                    lui    s2,0x19
    20001ff6:    6576                    flw    fa0,92(sp)
    20001ff8:    3a64                    fld    fs1,240(a2)
    20001ffa:    0020                    addi    s0,sp,8
    20001ffc:    5320                    lw    s0,96(a4)
    20001ffe:    6e65                    lui    t3,0x19
    20002000:    2064                    fld    fs1,192(s0)
    20002002:    6c46                    flw    fs8,80(sp)
    20002004:    6761                    lui    a4,0x18
    20002006:    6520                    flw    fs0,72(a0)
    20002008:    7272                    flw    ft4,60(sp)
    2000200a:    203a726f              jal    tp,0x200a9a0c
    2000200e:    0000                    unimp
    20002010:    5220                    lw    s0,96(a2)
    20002012:    6365                    lui    t1,0x19
    20002014:    2076                    fld    ft0,344(sp)
    20002016:    6c46                    flw    fs8,80(sp)
    20002018:    6761                    lui    a4,0x18
    2000201a:    6520                    flw    fs0,72(a0)
    2000201c:    7272                    flw    ft4,60(sp)
    2000201e:    203a726f              jal    tp,0x200a9a20
    20002022:    0000                    unimp
    20002024:    2d2d                    jal    0x2000265e
    20002026:    003e                    c.slli    zero,0xf
    20002028:    6c46                    flw    fs8,80(sp)
    2000202a:    6761                    lui    a4,0x18
    2000202c:    5320                    lw    s0,96(a4)
    2000202e:    6e65                    lui    t3,0x19
    20002030:    0d74                    addi    a3,sp,668
    20002032:    000a                    c.slli    zero,0x2
    20002034:    20444d43              fmadd.s    fs10,fs0,ft4,ft4,rmm
    20002038:    654c                    flw    fa1,12(a0)
    2000203a:    676e                    flw    fa4,216(sp)
    2000203c:    6874                    flw    fa3,84(s0)
    2000203e:    5420                    lw    s0,104(s0)
    20002040:    6d69                    lui    s10,0x1a
    20002042:    6465                    lui    s0,0x19
    20002044:    4f20                    lw    s0,88(a4)
    20002046:    7475                    lui    s0,0xffffd
    20002048:    4220                    lw    s0,64(a2)
    2000204a:    7375                    lui    t1,0xffffd
    2000204c:    0d79                    addi    s10,s10,30
    2000204e:    000a                    c.slli    zero,0x2
    20002050:    20444d43              fmadd.s    fs10,fs0,ft4,ft4,rmm
    20002054:    654c                    flw    fa1,12(a0)
    20002056:    676e                    flw    fa4,216(sp)
    20002058:    6874                    flw    fa3,84(s0)
    2000205a:    5320                    lw    s0,96(a4)
    2000205c:    6e65                    lui    t3,0x19
    2000205e:    0d74                    addi    a3,sp,668
    20002060:    000a                    c.slli    zero,0x2
    20002062:    0000                    unimp
    20002064:    646e6553              0x646e6553
    20002068:    6c20                    flw    fs0,88(s0)
    2000206a:    6e65                    lui    t3,0x19
    2000206c:    20687467              0x20687467
    20002070:    7265                    lui    tp,0xffff9
    20002072:    6f72                    flw    ft10,28(sp)
    20002074:    3a72                    fld    fs4,312(sp)
    20002076:    0020                    addi    s0,sp,8
    20002078:    5320                    lw    s0,96(a4)
    2000207a:    6e65                    lui    t3,0x19
    2000207c:    2064                    fld    fs1,192(s0)
    2000207e:    636e7973              csrrci    s2,0x636,28
    20002082:    6520                    flw    fs0,72(a0)
    20002084:    7272                    flw    ft4,60(sp)
    20002086:    0020726f              jal    tp,0x20009088
    2000208a:    0000                    unimp
    2000208c:    20444d43              fmadd.s    fs10,fs0,ft4,ft4,rmm
    20002090:    6954                    flw    fa3,20(a0)
    20002092:    656d                    lui    a0,0x1b
    20002094:    2064                    fld    fs1,192(s0)
    20002096:    2074754f              fnmadd.s    fa0,fs0,ft7,ft4
    2000209a:    7542                    flw    fa0,48(sp)
    2000209c:    0a0d7973              csrrci    s2,0xa0,26
    200020a0:    0000                    unimp
    200020a2:    0000                    unimp
    200020a4:    20444d43              fmadd.s    fs10,fs0,ft4,ft4,rmm
    200020a8:    6f44                    flw    fs1,28(a4)
    200020aa:    656e                    flw    fa0,216(sp)
    200020ac:    0a0d                    addi    s4,s4,3
    200020ae:    0000                    unimp
    200020b0:    4552                    lw    a0,20(sp)
    200020b2:    46205643              fmadd.q    fa2,ft0,ft2,fs0,unknown
    200020b6:    616c                    flw    fa1,68(a0)
    200020b8:    68432067              0x68432067
    200020bc:    6365                    lui    t1,0x19
    200020be:    000a0d6b              0xa0d6b
    200020c2:    0000                    unimp
    200020c4:    4552                    lw    a0,20(sp)
    200020c6:    46205643              fmadd.q    fa2,ft0,ft2,fs0,unknown
    200020ca:    616c                    flw    fa1,68(a0)
    200020cc:    4b4f2067              0x4b4f2067
    200020d0:    0a0d                    addi    s4,s4,3
    200020d2:    0000                    unimp
    200020d4:    6552                    flw    fa0,20(sp)
    200020d6:    76696563              bltu    s2,t1,0x20002840
    200020da:    2065                    jal    0x20002182
    200020dc:    654c                    flw    fa1,12(a0)
    200020de:    676e                    flw    fa4,216(sp)
    200020e0:    6874                    flw    fa3,84(s0)
    200020e2:    5420                    lw    s0,104(s0)
    200020e4:    6d69                    lui    s10,0x1a
    200020e6:    6465                    lui    s0,0x19
    200020e8:    4f20                    lw    s0,88(a4)
    200020ea:    7475                    lui    s0,0xffffd
    200020ec:    4220                    lw    s0,64(a2)
    200020ee:    7375                    lui    t1,0xffffd
    200020f0:    0d79                    addi    s10,s10,30
    200020f2:    000a                    c.slli    zero,0x2
    200020f4:    6552                    flw    fa0,20(sp)
    200020f6:    76696563              bltu    s2,t1,0x20002860
    200020fa:    2065                    jal    0x200021a2
    200020fc:    654c                    flw    fa1,12(a0)
    200020fe:    676e                    flw    fa4,216(sp)
    20002100:    6874                    flw    fa3,84(s0)
    20002102:    4f20                    lw    s0,88(a4)
    20002104:    000a0d4b              fnmsub.s    fs10,fs4,ft0,ft0,rne
    20002108:    654c                    flw    fa1,12(a0)
    2000210a:    676e                    flw    fa4,216(sp)
    2000210c:    6874                    flw    fa3,84(s0)
    2000210e:    5220                    lw    s0,96(a2)
    20002110:    6365                    lui    t1,0x19
    20002112:    6965                    lui    s2,0x19
    20002114:    6576                    flw    fa0,92(sp)
    20002116:    3a64                    fld    fs1,240(a2)
    20002118:    0020                    addi    s0,sp,8
    2000211a:    0000                    unimp
    2000211c:    6552                    flw    fa0,20(sp)
    2000211e:    6c207663              bgeu    zero,sp,0x200027ea
    20002122:    6e65                    lui    t3,0x19
    20002124:    20687467              0x20687467
    20002128:    7265                    lui    tp,0xffff9
    2000212a:    6f72                    flw    ft10,28(sp)
    2000212c:    3a72                    fld    fs4,312(sp)
    2000212e:    0020                    addi    s0,sp,8
    20002130:    6552                    flw    fa0,20(sp)
    20002132:    7274                    flw    fa3,100(a2)
    20002134:    6979                    lui    s2,0x1e
    20002136:    676e                    flw    fa4,216(sp)
    20002138:    2e2e                    fld    ft8,200(sp)
    2000213a:    0d2e                    slli    s10,s10,0xb
    2000213c:    000a                    c.slli    zero,0x2
    2000213e:    0000                    unimp
    20002140:    6552                    flw    fa0,20(sp)
    20002142:    4c207663              bgeu    zero,sp,0x2000260e
    20002146:    6e65                    lui    t3,0x19
    20002148:    20687467              0x20687467
    2000214c:    7369                    lui    t1,0xffffa
    2000214e:    203a                    fld    ft0,392(sp)
    20002150:    0000                    unimp
    20002152:    0000                    unimp
    20002154:    7872                    flw    fa6,60(sp)
    20002156:    625f 6675 6320          0x63206675625f
    2000215c:    65746e6f              jal    t3,0x20048fb2
    20002160:    746e                    flw    fs0,248(sp)
    20002162:    00203a73              csrrc    s4,frm,zero
    20002166:    0000                    unimp
    20002168:    20746f67              0x20746f67
    2000216c:    6572                    flw    fa0,28(sp)
    2000216e:    65207663              bgeu    zero,s2,0x200027ba
    20002172:    7272                    flw    ft4,60(sp)
    20002174:    0020726f              jal    tp,0x20009176
    20002178:    6568744f              0x6568744f
    2000217c:    2072                    fld    ft0,280(sp)
    2000217e:    6552                    flw    fa0,20(sp)
    20002180:    6d207663              bgeu    zero,s2,0x2000284c
    20002184:    7365                    lui    t1,0xffff9
    20002186:    65676173              csrrsi    sp,0x656,14
    2000218a:    00002023              sw    zero,0(zero) # 0x0
    2000218e:    0000                    unimp
    20002190:    0a0d                    addi    s4,s4,3
    20002192:    0a0d4b4f              fnmadd.d    fs6,fs10,ft0,ft1,rmm
    20002196:    0000                    unimp
    20002198:    20746f67              0x20746f67
    2000219c:    0a0d6b6f              jal    s6,0x200d823c
    200021a0:    0000                    unimp
    200021a2:    0000                    unimp
    200021a4:    0a0d                    addi    s4,s4,3
    200021a6:    6572                    flw    fa0,28(sp)
    200021a8:    6461                    lui    s0,0x18
    200021aa:    0d79                    addi    s10,s10,30
    200021ac:    000a                    c.slli    zero,0x2
    200021ae:    0000                    unimp
    200021b0:    20746f67              0x20746f67
    200021b4:    6572                    flw    fa0,28(sp)
    200021b6:    6461                    lui    s0,0x18
    200021b8:    0d79                    addi    s10,s10,30
    200021ba:    000a                    c.slli    zero,0x2
    200021bc:    0a0d                    addi    s4,s4,3
    200021be:    5245                    li    tp,-15
    200021c0:    4f52                    lw    t5,20(sp)
    200021c2:    0d52                    slli    s10,s10,0x14
    200021c4:    000a                    c.slli    zero,0x2
    200021c6:    0000                    unimp
    200021c8:    20746f67              0x20746f67
    200021cc:    7265                    lui    tp,0xffff9
    200021ce:    6f72                    flw    ft10,28(sp)
    200021d0:    0d72                    slli    s10,s10,0x1c
    200021d2:    000a                    c.slli    zero,0x2
    200021d4:    5441                    li    s0,-16
    200021d6:    3045                    jal    0x20001a76
    200021d8:    0a0d                    addi    s4,s4,3
    200021da:    0000                    unimp
    200021dc:    5441                    li    s0,-16
    200021de:    454c422b              0x454c422b
    200021e2:    4e49                    li    t3,18
    200021e4:    5449                    li    s0,-14
    200021e6:    303d                    jal    0x20001a14
    200021e8:    0a0d                    addi    s4,s4,3
    200021ea:    0000                    unimp
    200021ec:    5441                    li    s0,-16
    200021ee:    4d57432b              0x4d57432b
    200021f2:    3d45444f              0x3d45444f
    200021f6:    0d30                    addi    a2,sp,664
    200021f8:    000a                    c.slli    zero,0x2
    200021fa:    5552                    lw    a0,52(sp)
    200021fc:    0d4e                    slli    s10,s10,0x13
    200021fe:    000a                    c.slli    zero,0x2
    20002200:    4150                    lw    a2,4(a0)
    20002202:    46005353              0x46005353
    20002206:    4941                    li    s2,16
    20002208:    204c                    fld    fa1,128(s0)
    2000220a:    0d00                    addi    s0,sp,656
    2000220c:    000a                    c.slli    zero,0x2
    2000220e:    0000                    unimp
    20002210:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    20002214:    4f50                    lw    a2,28(a4)
    20002216:    00584953              fadd.s    fs2,fa6,ft5,rmm
    2000221a:    0000                    unimp
    2000221c:    002e                    c.slli    zero,0xb
    2000221e:    0000                    unimp
    20002220:    2000                    fld    fs0,0(s0)
    20002222:    2020                    fld    fs0,64(s0)
    20002224:    2020                    fld    fs0,64(s0)
    20002226:    2020                    fld    fs0,64(s0)
    20002228:    2020                    fld    fs0,64(s0)
    2000222a:    2828                    fld    fa0,80(s0)
    2000222c:    2828                    fld    fa0,80(s0)
    2000222e:    2028                    fld    fa0,64(s0)
    20002230:    2020                    fld    fs0,64(s0)
    20002232:    2020                    fld    fs0,64(s0)
    20002234:    2020                    fld    fs0,64(s0)
    20002236:    2020                    fld    fs0,64(s0)
    20002238:    2020                    fld    fs0,64(s0)
    2000223a:    2020                    fld    fs0,64(s0)
    2000223c:    2020                    fld    fs0,64(s0)
    2000223e:    2020                    fld    fs0,64(s0)
    20002240:    8820                    0x8820
    20002242:    1010                    addi    a2,sp,32
    20002244:    1010                    addi    a2,sp,32
    20002246:    1010                    addi    a2,sp,32
    20002248:    1010                    addi    a2,sp,32
    2000224a:    1010                    addi    a2,sp,32
    2000224c:    1010                    addi    a2,sp,32
    2000224e:    1010                    addi    a2,sp,32
    20002250:    0410                    addi    a2,sp,512
    20002252:    0404                    addi    s1,sp,512
    20002254:    0404                    addi    s1,sp,512
    20002256:    0404                    addi    s1,sp,512
    20002258:    0404                    addi    s1,sp,512
    2000225a:    1004                    addi    s1,sp,32
    2000225c:    1010                    addi    a2,sp,32
    2000225e:    1010                    addi    a2,sp,32
    20002260:    1010                    addi    a2,sp,32
    20002262:    4141                    li    sp,16
    20002264:    4141                    li    sp,16
    20002266:    4141                    li    sp,16
    20002268:    0101                    addi    sp,sp,0
    2000226a:    0101                    addi    sp,sp,0
    2000226c:    0101                    addi    sp,sp,0
    2000226e:    0101                    addi    sp,sp,0
    20002270:    0101                    addi    sp,sp,0
    20002272:    0101                    addi    sp,sp,0
    20002274:    0101                    addi    sp,sp,0
    20002276:    0101                    addi    sp,sp,0
    20002278:    0101                    addi    sp,sp,0
    2000227a:    0101                    addi    sp,sp,0
    2000227c:    1010                    addi    a2,sp,32
    2000227e:    1010                    addi    a2,sp,32
    20002280:    1010                    addi    a2,sp,32
    20002282:    4242                    lw    tp,16(sp)
    20002284:    4242                    lw    tp,16(sp)
    20002286:    4242                    lw    tp,16(sp)
    20002288:    0202                    c.slli64    tp
    2000228a:    0202                    c.slli64    tp
    2000228c:    0202                    c.slli64    tp
    2000228e:    0202                    c.slli64    tp
    20002290:    0202                    c.slli64    tp
    20002292:    0202                    c.slli64    tp
    20002294:    0202                    c.slli64    tp
    20002296:    0202                    c.slli64    tp
    20002298:    0202                    c.slli64    tp
    2000229a:    0202                    c.slli64    tp
    2000229c:    1010                    addi    a2,sp,32
    2000229e:    1010                    addi    a2,sp,32
    200022a0:    0020                    addi    s0,sp,8
    ...

Disassembly of section .sec3:

0000000020002340 <.sec3>:
    20002340:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    20002360:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    20002380:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    200023a0:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    200023c0:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    200023e0:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    20002400:    00000043              fmadd.s    ft0,ft0,ft0,ft0,rne
    ...
    20002420:    1e26                    slli    t3,t3,0x29
    20002422:    2000                    fld    fs0,0(s0)
    20002424:    1c4a                    slli    s8,s8,0x32
    20002426:    2000                    fld    fs0,0(s0)
    20002428:    0000                    unimp
    2000242a:    0000                    unimp
    2000242c:    2220                    fld    fs0,64(a2)
    2000242e:    2000                    fld    fs0,0(s0)
    20002430:    221c                    fld    fa5,0(a2)
    20002432:    2000                    fld    fs0,0(s0)
    20002434:    1fe8                    addi    a0,sp,1020
    20002436:    2000                    fld    fs0,0(s0)
    20002438:    1fe8                    addi    a0,sp,1020
    2000243a:    2000                    fld    fs0,0(s0)
    2000243c:    1fe8                    addi    a0,sp,1020
    2000243e:    2000                    fld    fs0,0(s0)
    20002440:    1fe8                    addi    a0,sp,1020
    20002442:    2000                    fld    fs0,0(s0)
    20002444:    1fe8                    addi    a0,sp,1020
    20002446:    2000                    fld    fs0,0(s0)
    20002448:    1fe8                    addi    a0,sp,1020
    2000244a:    2000                    fld    fs0,0(s0)
    2000244c:    1fe8                    addi    a0,sp,1020
    2000244e:    2000                    fld    fs0,0(s0)
    20002450:    1fe8                    addi    a0,sp,1020
    20002452:    2000                    fld    fs0,0(s0)
    20002454:    1fe8                    addi    a0,sp,1020
    20002456:    2000                    fld    fs0,0(s0)
    20002458:    ffff                    0xffff
    2000245a:    ffff                    0xffff
    2000245c:    ffff                    0xffff
    2000245e:    ffff                    0xffff
    20002460:    ffff                    0xffff
    20002462:    ffff                    0xffff
    20002464:    ffff                    0xffff
    20002466:    0000                    unimp
    20002468:    0001                    nop
    2000246a:    5341                    li    t1,-16
    2000246c:    00494943              fmadd.s    fs2,fs2,ft4,ft0,rmm
    ...
    20002488:    0000                    unimp
    2000248a:    5341                    li    t1,-16
    2000248c:    00494943              fmadd.s    fs2,fs2,ft4,ft0,rmm
    ...
    200024b4:    045c                    addi    a5,sp,516
    200024b6:    8000                    0x8000
    200024b8:    04c4                    addi    s1,sp,580
    200024ba:    8000                    0x8000
    200024bc:    052c                    addi    a1,sp,648
    200024be:    8000                    0x8000
    ...
    20002558:    0001                    nop
    2000255a:    0000                    unimp
    2000255c:    0000                    unimp
    2000255e:    0000                    unimp
    20002560:    330e                    fld    ft6,224(sp)
    20002562:    abcd                    j    0x20002b54
    20002564:    1234                    addi    a3,sp,296
    20002566:    e66d                    bnez    a2,0x20002650
    20002568:    deec                    sw    a1,124(a3)
    2000256a:    0005                    c.nop    1
    2000256c:    0000000b              0xb
    ...

Disassembly of section .sec4:

0000000020002900 <.sec4>:
    20002900:    8000                    0x8000
    20002902:    0000                    unimp
    20002904:    0001                    nop
    20002906:    0000                    unimp
    20002908:    0170                    addi    a2,sp,140
    2000290a:    8000                    0x8000
    2000290c:    0170                    addi    a2,sp,140
    2000290e:    8000                    0x8000
