
original/hifive_revb_bootloader:     file format elf32-littleriscv


Disassembly of section .text:

20000000 <_prog_start>:
20000000:	a011                	j	20000004 <exit+0x2>

20000002 <exit>:
20000002:	8082                	ret

20000004:	4081                	li	ra,0
20000006:	4101                	li	sp,0
20000008:	4181                	li	gp,0
2000000a:	4201                	li	tp,0
2000000c:	4281                	li	t0,0
2000000e:	4301                	li	t1,0
20000010:	4381                	li	t2,0
20000012:	4401                	li	s0,0
20000014:	4481                	li	s1,0
20000016:	4601                	li	a2,0
20000018:	4681                	li	a3,0
2000001a:	4701                	li	a4,0
2000001c:	4781                	li	a5,0
2000001e:	4801                	li	a6,0
20000020:	4881                	li	a7,0
20000022:	4901                	li	s2,0
20000024:	4981                	li	s3,0
20000026:	4a01                	li	s4,0
20000028:	4a81                	li	s5,0
2000002a:	4b01                	li	s6,0
2000002c:	4b81                	li	s7,0
2000002e:	4c01                	li	s8,0
20000030:	4c81                	li	s9,0
20000032:	4d01                	li	s10,0
20000034:	4d81                	li	s11,0
20000036:	4e01                	li	t3,0
20000038:	4e81                	li	t4,0
2000003a:	4f01                	li	t5,0
2000003c:	4f81                	li	t6,0
2000003e:	60001197          	auipc	gp,0x60001
20000042:	d4218193          	addi	gp,gp,-702 # 80000d80 <__global_pointer$>
20000046:	00000297          	auipc	t0,0x0
2000004a:	13a28293          	addi	t0,t0,314 # 20000180 <trap_entry>
2000004e:	30529073          	csrw	mtvec,t0
20000052:	4921                	li	s2,8
20000054:	30491073          	csrw	mie,s2
20000058:	4481                	li	s1,0
2000005a:	f1402973          	csrr	s2,mhartid
2000005e:	05249f63          	bne	s1,s2,200000bc <exit+0xba>
20000062:	00002297          	auipc	t0,0x2
20000066:	2de28293          	addi	t0,t0,734 # 20002340 <_data_lma>
2000006a:	60000317          	auipc	t1,0x60000
2000006e:	f9630313          	addi	t1,t1,-106 # 80000000 <__global_locale>
20000072:	00628e63          	beq	t0,t1,2000008e <exit+0x8c>
20000076:	85018393          	addi	t2,gp,-1968 # 800005d0 <_edata>
2000007a:	00737a63          	bgeu	t1,t2,2000008e <exit+0x8c>
2000007e:	0002ae03          	lw	t3,0(t0)
20000082:	01c32023          	sw	t3,0(t1)
20000086:	0291                	addi	t0,t0,4
20000088:	0311                	addi	t1,t1,4
2000008a:	fe736ae3          	bltu	t1,t2,2000007e <exit+0x7c>

2000008e:	88018293          	addi	t0,gp,-1920 # 80000600 <print_to_uart1>
20000092:	94818313          	addi	t1,gp,-1720 # 800006c8 <_ebss>
20000096:	0062f763          	bgeu	t0,t1,200000a4 <exit+0xa2>

2000009a:	0002a023          	sw	zero,0(t0)
2000009e:	0291                	addi	t0,t0,4
200000a0:	fe62ede3          	bltu	t0,t1,2000009a <exit+0x98>

200000a4:	020004b7          	lui	s1,0x2000
200000a8:	4905                	li	s2,1
200000aa:	0124a023          	sw	s2,0(s1) # 2000000 <_prog_start-0x1e000000>
200000ae:	0491                	addi	s1,s1,4
200000b0:	02000937          	lui	s2,0x2000
200000b4:	08090913          	addi	s2,s2,128 # 2000080 <_prog_start-0x1dffff80>
200000b8:	ff24c8e3          	blt	s1,s2,200000a8 <exit+0xa6>
200000bc:	10500073          	wfi
200000c0:	34402973          	csrr	s2,mip
200000c4:	00897913          	andi	s2,s2,8
200000c8:	fe090ae3          	beqz	s2,200000bc <exit+0xba>
200000cc:	020004b7          	lui	s1,0x2000
200000d0:	f1402973          	csrr	s2,mhartid
200000d4:	090a                	slli	s2,s2,0x2
200000d6:	9926                	add	s2,s2,s1
200000d8:	00092023          	sw	zero,0(s2)
200000dc:	0004a903          	lw	s2,0(s1) # 2000000 <_prog_start-0x1e000000>
200000e0:	fe091ee3          	bnez	s2,200000dc <exit+0xda>
200000e4:	0491                	addi	s1,s1,4
200000e6:	02000937          	lui	s2,0x2000
200000ea:	08090913          	addi	s2,s2,128 # 2000080 <_prog_start-0x1dffff80>
200000ee:	ff24c7e3          	blt	s1,s2,200000dc <exit+0xda>
200000f2:	60004117          	auipc	sp,0x60004
200000f6:	f0e10113          	addi	sp,sp,-242 # 80004000 <_sp>
200000fa:	f14022f3          	csrr	t0,mhartid
200000fe:	00a29313          	slli	t1,t0,0xa
20000102:	40610133          	sub	sp,sp,t1
20000106:	4301                	li	t1,0
20000108:	04629063          	bne	t0,t1,20000148 <_pass+0x18>
2000010c:	2a15                	jal	20000240 <main>
2000010e:	a011                	j	20000112 <exit_>

20000110 <abort>:
20000110:	557d                	li	a0,-1

20000112 <exit_>:
20000112:	cd19                	beqz	a0,20000130 <_pass>
20000114:	8e2a                	mv	t3,a0

20000116 <_fail>:
20000116:	e111                	bnez	a0,2000011a <_fail+0x4>
20000118:	4505                	li	a0,1
2000011a:	35e5                	jal	20000002 <exit>
2000011c:	6291                	lui	t0,0x4
2000011e:	00003337          	lui	t1,0x3
20000122:	33330313          	addi	t1,t1,819 # 3333 <_prog_start-0x1fffcccd>
20000126:	0542                	slli	a0,a0,0x10
20000128:	951a                	add	a0,a0,t1
2000012a:	00a2a023          	sw	a0,0(t0) # 4000 <_prog_start-0x1fffc000>
2000012e:	a001                	j	2000012e <_fail+0x18>

20000130 <_pass>:
20000130:	0ff0000f          	fence
20000134:	4501                	li	a0,0
20000136:	35f1                	jal	20000002 <exit>
20000138:	6291                	lui	t0,0x4
2000013a:	00005337          	lui	t1,0x5
2000013e:	55530313          	addi	t1,t1,1365 # 5555 <_prog_start-0x1fffaaab>
20000142:	0062a023          	sw	t1,0(t0) # 4000 <_prog_start-0x1fffc000>
20000146:	a001                	j	20000146 <_pass+0x16>
20000148:	f1402573          	csrr	a0,mhartid
2000014c:	2005                	jal	2000016c <slave_main>
2000014e:	cd19                	beqz	a0,2000016c <slave_main>
20000150:	8e2a                	mv	t3,a0
20000152:	e111                	bnez	a0,20000156 <_pass+0x26>
20000154:	4505                	li	a0,1
20000156:	3575                	jal	20000002 <exit>
20000158:	6291                	lui	t0,0x4
2000015a:	00003337          	lui	t1,0x3
2000015e:	33330313          	addi	t1,t1,819 # 3333 <_prog_start-0x1fffcccd>
20000162:	0542                	slli	a0,a0,0x10
20000164:	951a                	add	a0,a0,t1
20000166:	00a2a023          	sw	a0,0(t0) # 4000 <_prog_start-0x1fffc000>
2000016a:	a001                	j	2000016a <_pass+0x3a>

2000016c <slave_main>:
2000016c:	10500073          	wfi
20000170:	bff5                	j	2000016c <slave_main>
20000172:	00000013          	nop
20000176:	00000013          	nop
2000017a:	00000013          	nop
2000017e:	0001                	nop

20000180 <trap_entry>:
20000180:	7119                	addi	sp,sp,-128
20000182:	c206                	sw	ra,4(sp)
20000184:	c60e                	sw	gp,12(sp)
20000186:	c812                	sw	tp,16(sp)
20000188:	ca16                	sw	t0,20(sp)
2000018a:	cc1a                	sw	t1,24(sp)
2000018c:	ce1e                	sw	t2,28(sp)
2000018e:	d022                	sw	s0,32(sp)
20000190:	d226                	sw	s1,36(sp)
20000192:	d42a                	sw	a0,40(sp)
20000194:	d62e                	sw	a1,44(sp)
20000196:	d832                	sw	a2,48(sp)
20000198:	da36                	sw	a3,52(sp)
2000019a:	dc3a                	sw	a4,56(sp)
2000019c:	de3e                	sw	a5,60(sp)
2000019e:	c0c2                	sw	a6,64(sp)
200001a0:	c2c6                	sw	a7,68(sp)
200001a2:	c4ca                	sw	s2,72(sp)
200001a4:	c6ce                	sw	s3,76(sp)
200001a6:	c8d2                	sw	s4,80(sp)
200001a8:	cad6                	sw	s5,84(sp)
200001aa:	ccda                	sw	s6,88(sp)
200001ac:	cede                	sw	s7,92(sp)
200001ae:	d0e2                	sw	s8,96(sp)
200001b0:	d2e6                	sw	s9,100(sp)
200001b2:	d4ea                	sw	s10,104(sp)
200001b4:	d6ee                	sw	s11,108(sp)
200001b6:	d8f2                	sw	t3,112(sp)
200001b8:	daf6                	sw	t4,116(sp)
200001ba:	dcfa                	sw	t5,120(sp)
200001bc:	defe                	sw	t6,124(sp)
200001be:	850a                	mv	a0,sp
200001c0:	046000ef          	jal	ra,20000206 <handle_trap>
200001c4:	4092                	lw	ra,4(sp)
200001c6:	41b2                	lw	gp,12(sp)
200001c8:	4242                	lw	tp,16(sp)
200001ca:	42d2                	lw	t0,20(sp)
200001cc:	4362                	lw	t1,24(sp)
200001ce:	43f2                	lw	t2,28(sp)
200001d0:	5402                	lw	s0,32(sp)
200001d2:	5492                	lw	s1,36(sp)
200001d4:	5522                	lw	a0,40(sp)
200001d6:	55b2                	lw	a1,44(sp)
200001d8:	5642                	lw	a2,48(sp)
200001da:	56d2                	lw	a3,52(sp)
200001dc:	5762                	lw	a4,56(sp)
200001de:	57f2                	lw	a5,60(sp)
200001e0:	4806                	lw	a6,64(sp)
200001e2:	4896                	lw	a7,68(sp)
200001e4:	4926                	lw	s2,72(sp)
200001e6:	49b6                	lw	s3,76(sp)
200001e8:	4a46                	lw	s4,80(sp)
200001ea:	4ad6                	lw	s5,84(sp)
200001ec:	4b66                	lw	s6,88(sp)
200001ee:	4bf6                	lw	s7,92(sp)
200001f0:	5c06                	lw	s8,96(sp)
200001f2:	5c96                	lw	s9,100(sp)
200001f4:	5d26                	lw	s10,104(sp)
200001f6:	5db6                	lw	s11,108(sp)
200001f8:	5e46                	lw	t3,112(sp)
200001fa:	5ed6                	lw	t4,116(sp)
200001fc:	5f66                	lw	t5,120(sp)
200001fe:	5ff6                	lw	t6,124(sp)
20000200:	6109                	addi	sp,sp,128
20000202:	30200073          	mret

20000206 <handle_trap>:
20000206:	342022f3          	csrr	t0,mcause
2000020a:	00500533          	add	a0,zero,t0
2000020e:	b721                	j	20000116 <_fail>
	...

20000240 <main>:
20000240:	1101                	addi	sp,sp,-32
20000242:	ce06                	sw	ra,28(sp)
20000244:	30505073          	csrwi	mtvec,0
20000248:	10000737          	lui	a4,0x10000
2000024c:	0bc72783          	lw	a5,188(a4) # 100000bc <_prog_start-0xfffff44>
20000250:	d027b6b7          	lui	a3,0xd027b
20000254:	069d                	addi	a3,a3,7
20000256:	18d78b63          	beq	a5,a3,200003ec <main+0x1ac>
2000025a:	100127b7          	lui	a5,0x10012
2000025e:	4790                	lw	a2,8(a5)
20000260:	00080537          	lui	a0,0x80
20000264:	fff80837          	lui	a6,0xfff80
20000268:	8e49                	or	a2,a2,a0
2000026a:	c790                	sw	a2,8(a5)
2000026c:	43b0                	lw	a2,64(a5)
2000026e:	187d                	addi	a6,a6,-1
20000270:	0200c8b7          	lui	a7,0x200c
20000274:	8e49                	or	a2,a2,a0
20000276:	c3b0                	sw	a2,64(a5)
20000278:	5f8c                	lw	a1,56(a5)
2000027a:	ffc00637          	lui	a2,0xffc00
2000027e:	167d                	addi	a2,a2,-1
20000280:	0105f5b3          	and	a1,a1,a6
20000284:	df8c                	sw	a1,56(a5)
20000286:	47cc                	lw	a1,12(a5)
20000288:	8dc9                	or	a1,a1,a0
2000028a:	c7cc                	sw	a1,12(a5)
2000028c:	478c                	lw	a1,8(a5)
2000028e:	8df1                	and	a1,a1,a2
20000290:	c78c                	sw	a1,8(a5)
20000292:	5f8c                	lw	a1,56(a5)
20000294:	8e6d                	and	a2,a2,a1
20000296:	df90                	sw	a2,56(a5)
20000298:	0bc72803          	lw	a6,188(a4)
2000029c:	0ad72e23          	sw	a3,188(a4)
200002a0:	ff88a703          	lw	a4,-8(a7) # 200bff8 <_prog_start-0x1dff4008>
200002a4:	ffc8a783          	lw	a5,-4(a7)
200002a8:	c03a                	sw	a4,0(sp)
200002aa:	c23e                	sw	a5,4(sp)
200002ac:	4502                	lw	a0,0(sp)
200002ae:	6791                	lui	a5,0x4
200002b0:	4592                	lw	a1,4(sp)
200002b2:	97aa                	add	a5,a5,a0
200002b4:	00a7b733          	sltu	a4,a5,a0
200002b8:	c43e                	sw	a5,8(sp)
200002ba:	00b706b3          	add	a3,a4,a1
200002be:	c636                	sw	a3,12(sp)
200002c0:	ff88a603          	lw	a2,-8(a7)
200002c4:	ffc8a683          	lw	a3,-4(a7)
200002c8:	4722                	lw	a4,8(sp)
200002ca:	47b2                	lw	a5,12(sp)
200002cc:	1cf6f063          	bgeu	a3,a5,2000048c <main+0x24c>
200002d0:	0200c8b7          	lui	a7,0x200c
200002d4:	ff88a603          	lw	a2,-8(a7) # 200bff8 <_prog_start-0x1dff4008>
200002d8:	ffc8a683          	lw	a3,-4(a7)
200002dc:	4722                	lw	a4,8(sp)
200002de:	47b2                	lw	a5,12(sp)
200002e0:	fef6eae3          	bltu	a3,a5,200002d4 <main+0x94>
200002e4:	00d79463          	bne	a5,a3,200002ec <main+0xac>
200002e8:	fee666e3          	bltu	a2,a4,200002d4 <main+0x94>
200002ec:	100007b7          	lui	a5,0x10000
200002f0:	0b07ae23          	sw	a6,188(a5) # 100000bc <_prog_start-0xfffff44>
200002f4:	10012737          	lui	a4,0x10012
200002f8:	00072623          	sw	zero,12(a4) # 1001200c <_prog_start-0xffedff4>
200002fc:	04072023          	sw	zero,64(a4)
20000300:	00072423          	sw	zero,8(a4)
20000304:	0bc7a703          	lw	a4,188(a5)
20000308:	bed0c6b7          	lui	a3,0xbed0c
2000030c:	ed068693          	addi	a3,a3,-304 # bed0bed0 <_sp+0x3ed07ed0>
20000310:	18d70363          	beq	a4,a3,20000496 <main+0x256>
20000314:	0bc7a603          	lw	a2,188(a5)
20000318:	d027b737          	lui	a4,0xd027b
2000031c:	071d                	addi	a4,a4,7
2000031e:	16e60c63          	beq	a2,a4,20000496 <main+0x256>
20000322:	0051f737          	lui	a4,0x51f
20000326:	15e70713          	addi	a4,a4,350 # 51f15e <_prog_start-0x1fae0ea2>
2000032a:	14e7a623          	sw	a4,332(a5)
2000032e:	4661                	li	a2,24
20000330:	12c7a023          	sw	a2,288(a5)
20000334:	14e7a623          	sw	a4,332(a5)
20000338:	12c7a223          	sw	a2,292(a5)
2000033c:	14e7a623          	sw	a4,332(a5)
20000340:	12c7a423          	sw	a2,296(a5)
20000344:	14e7a623          	sw	a4,332(a5)
20000348:	12c7a623          	sw	a2,300(a5)
2000034c:	14e7a623          	sw	a4,332(a5)
20000350:	03800613          	li	a2,56
20000354:	12c7a823          	sw	a2,304(a5)
20000358:	14e7a623          	sw	a4,332(a5)
2000035c:	12c7aa23          	sw	a2,308(a5)
20000360:	14e7a623          	sw	a4,332(a5)
20000364:	12c7ac23          	sw	a2,312(a5)
20000368:	14e7a623          	sw	a4,332(a5)
2000036c:	12c7ae23          	sw	a2,316(a5)
20000370:	0ad7ae23          	sw	a3,188(a5)
20000374:	0807a223          	sw	zero,132(a5)
20000378:	14e7a623          	sw	a4,332(a5)
2000037c:	1407a423          	sw	zero,328(a5)
20000380:	0200c737          	lui	a4,0x200c
20000384:	ff872603          	lw	a2,-8(a4) # 200bff8 <_prog_start-0x1dff4008>
20000388:	ffc72683          	lw	a3,-4(a4)
2000038c:	6791                	lui	a5,0x4
2000038e:	c032                	sw	a2,0(sp)
20000390:	c236                	sw	a3,4(sp)
20000392:	4802                	lw	a6,0(sp)
20000394:	4892                	lw	a7,4(sp)
20000396:	97c2                	add	a5,a5,a6
20000398:	0107b533          	sltu	a0,a5,a6
2000039c:	c43e                	sw	a5,8(sp)
2000039e:	011506b3          	add	a3,a0,a7
200003a2:	c636                	sw	a3,12(sp)
200003a4:	ff872603          	lw	a2,-8(a4)
200003a8:	ffc72683          	lw	a3,-4(a4)
200003ac:	4722                	lw	a4,8(sp)
200003ae:	47b2                	lw	a5,12(sp)
200003b0:	0ef6f863          	bgeu	a3,a5,200004a0 <main+0x260>
200003b4:	0200c837          	lui	a6,0x200c
200003b8:	ff882603          	lw	a2,-8(a6) # 200bff8 <_prog_start-0x1dff4008>
200003bc:	ffc82683          	lw	a3,-4(a6)
200003c0:	4722                	lw	a4,8(sp)
200003c2:	47b2                	lw	a5,12(sp)
200003c4:	fef6eae3          	bltu	a3,a5,200003b8 <main+0x178>
200003c8:	00d79463          	bne	a5,a3,200003d0 <main+0x190>
200003cc:	fee666e3          	bltu	a2,a4,200003b8 <main+0x178>
200003d0:	53f000ef          	jal	ra,2000110e <bench_rstclk>
200003d4:	6f8010ef          	jal	ra,20001acc <esp32_init>
200003d8:	200107b7          	lui	a5,0x20010
200003dc:	9782                	jalr	a5
200003de:	40f2                	lw	ra,28(sp)
200003e0:	0012d537          	lui	a0,0x12d
200003e4:	68750513          	addi	a0,a0,1671 # 12d687 <_prog_start-0x1fed2979>
200003e8:	6105                	addi	sp,sp,32
200003ea:	8082                	ret

200003ec:	0a072e23          	sw	zero,188(a4)
200003f0:	100127b7          	lui	a5,0x10012
200003f4:	4798                	lw	a4,8(a5)
200003f6:	00400637          	lui	a2,0x400
200003fa:	ffc005b7          	lui	a1,0xffc00
200003fe:	8f51                	or	a4,a4,a2
20000400:	c798                	sw	a4,8(a5)
20000402:	43b8                	lw	a4,64(a5)
20000404:	15fd                	addi	a1,a1,-1
20000406:	0200c837          	lui	a6,0x200c
2000040a:	8f51                	or	a4,a4,a2
2000040c:	c3b8                	sw	a4,64(a5)
2000040e:	5f94                	lw	a3,56(a5)
20000410:	fff80737          	lui	a4,0xfff80
20000414:	177d                	addi	a4,a4,-1
20000416:	8eed                	and	a3,a3,a1
20000418:	df94                	sw	a3,56(a5)
2000041a:	47d4                	lw	a3,12(a5)
2000041c:	6e11                	lui	t3,0x4
2000041e:	100128b7          	lui	a7,0x10012
20000422:	8ed1                	or	a3,a3,a2
20000424:	c7d4                	sw	a3,12(a5)
20000426:	4794                	lw	a3,8(a5)
20000428:	00400337          	lui	t1,0x400
2000042c:	8ef9                	and	a3,a3,a4
2000042e:	c794                	sw	a3,8(a5)
20000430:	5f94                	lw	a3,56(a5)
20000432:	8f75                	and	a4,a4,a3
20000434:	df98                	sw	a4,56(a5)
20000436:	ff882703          	lw	a4,-8(a6) # 200bff8 <_prog_start-0x1dff4008>
2000043a:	ffc82783          	lw	a5,-4(a6)
2000043e:	c03a                	sw	a4,0(sp)
20000440:	c23e                	sw	a5,4(sp)
20000442:	4e82                	lw	t4,0(sp)
20000444:	4f12                	lw	t5,4(sp)
20000446:	01ce85b3          	add	a1,t4,t3
2000044a:	01d5b633          	sltu	a2,a1,t4
2000044e:	c42e                	sw	a1,8(sp)
20000450:	01e607b3          	add	a5,a2,t5
20000454:	c63e                	sw	a5,12(sp)
20000456:	ff882503          	lw	a0,-8(a6)
2000045a:	ffc82583          	lw	a1,-4(a6)
2000045e:	4622                	lw	a2,8(sp)
20000460:	46b2                	lw	a3,12(sp)
20000462:	00d5fa63          	bgeu	a1,a3,20000476 <main+0x236>
20000466:	ff882503          	lw	a0,-8(a6)
2000046a:	ffc82583          	lw	a1,-4(a6)
2000046e:	4622                	lw	a2,8(sp)
20000470:	46b2                	lw	a3,12(sp)
20000472:	fed5eae3          	bltu	a1,a3,20000466 <main+0x226>
20000476:	00b69463          	bne	a3,a1,2000047e <main+0x23e>
2000047a:	fec566e3          	bltu	a0,a2,20000466 <main+0x226>
2000047e:	0408a783          	lw	a5,64(a7) # 10012040 <_prog_start-0xffedfc0>
20000482:	0067c7b3          	xor	a5,a5,t1
20000486:	04f8a023          	sw	a5,64(a7)
2000048a:	b775                	j	20000436 <main+0x1f6>

2000048c:	e6d790e3          	bne	a5,a3,200002ec <main+0xac>
20000490:	e4e660e3          	bltu	a2,a4,200002d0 <main+0x90>
20000494:	bda1                	j	200002ec <main+0xac>

20000496:	100007b7          	lui	a5,0x10000
2000049a:	0a07ae23          	sw	zero,188(a5) # 100000bc <_prog_start-0xfffff44>
2000049e:	b5cd                	j	20000380 <main+0x140>

200004a0:	f2d798e3          	bne	a5,a3,200003d0 <main+0x190>
200004a4:	f0e668e3          	bltu	a2,a4,200003b4 <main+0x174>
200004a8:	b725                	j	200003d0 <main+0x190>

200004aa <ate_outputset>:
200004aa:	100126b7          	lui	a3,0x10012
200004ae:	46cc                	lw	a1,12(a3)
200004b0:	00680637          	lui	a2,0x680
200004b4:	00c577b3          	and	a5,a0,a2
200004b8:	fff7c793          	not	a5,a5
200004bc:	fff54713          	not	a4,a0
200004c0:	00b7f533          	and	a0,a5,a1
200004c4:	00c777b3          	and	a5,a4,a2
200004c8:	8d5d                	or	a0,a0,a5
200004ca:	c6c8                	sw	a0,12(a3)
200004cc:	8082                	ret

200004ce <ate_setup>:
200004ce:	1141                	addi	sp,sp,-16
200004d0:	00680737          	lui	a4,0x680
200004d4:	c606                	sw	ra,12(sp)
200004d6:	100127b7          	lui	a5,0x10012
200004da:	03070713          	addi	a4,a4,48 # 680030 <_prog_start-0x1f97ffd0>
200004de:	c798                	sw	a4,8(a5)
200004e0:	0207ac23          	sw	zero,56(a5) # 10012038 <_prog_start-0xffedfc8>
200004e4:	c7d8                	sw	a4,12(a5)
200004e6:	577d                	li	a4,-1
200004e8:	00200537          	lui	a0,0x200
200004ec:	cbd8                	sw	a4,20(a5)
200004ee:	3f75                	jal	200004aa <ate_outputset>
200004f0:	40b2                	lw	ra,12(sp)
200004f2:	4501                	li	a0,0
200004f4:	0141                	addi	sp,sp,16
200004f6:	8082                	ret

200004f8 <ate_fail>:
200004f8:	1141                	addi	sp,sp,-16
200004fa:	c606                	sw	ra,12(sp)
200004fc:	157d                	addi	a0,a0,-1
200004fe:	4789                	li	a5,2
20000500:	00a7ee63          	bltu	a5,a0,2000051c <ate_fail+0x24>
20000504:	200027b7          	lui	a5,0x20002
20000508:	ec078793          	addi	a5,a5,-320 # 20001ec0 <CSWTCH.4>
2000050c:	050a                	slli	a0,a0,0x2
2000050e:	953e                	add	a0,a0,a5
20000510:	4108                	lw	a0,0(a0)
20000512:	3f61                	jal	200004aa <ate_outputset>
20000514:	40b2                	lw	ra,12(sp)
20000516:	4505                	li	a0,1
20000518:	0141                	addi	sp,sp,16
2000051a:	8082                	ret
2000051c:	00400537          	lui	a0,0x400
20000520:	3769                	jal	200004aa <ate_outputset>
20000522:	40b2                	lw	ra,12(sp)
20000524:	4505                	li	a0,1
20000526:	0141                	addi	sp,sp,16
20000528:	8082                	ret

2000052a <ate_pass>:
2000052a:	1141                	addi	sp,sp,-16
2000052c:	00080537          	lui	a0,0x80
20000530:	c606                	sw	ra,12(sp)
20000532:	3fa5                	jal	200004aa <ate_outputset>
20000534:	40b2                	lw	ra,12(sp)
20000536:	4501                	li	a0,0
20000538:	0141                	addi	sp,sp,16
2000053a:	8082                	ret

2000053c <_putc.part.0>:
2000053c:	10023737          	lui	a4,0x10023
20000540:	431c                	lw	a5,0(a4)
20000542:	fe07cfe3          	bltz	a5,20000540 <_putc.part.0+0x4>
20000546:	c308                	sw	a0,0(a4)
20000548:	8082                	ret

2000054a <otp_write_word.part.1>:
2000054a:	100107b7          	lui	a5,0x10010
2000054e:	d788                	sw	a0,40(a5)
20000550:	b00027f3          	csrr	a5,mcycle
20000554:	b8002773          	csrr	a4,mcycleh
20000558:	00178513          	addi	a0,a5,1 # 10010001 <_prog_start-0xffeffff>
2000055c:	00f537b3          	sltu	a5,a0,a5
20000560:	973e                	add	a4,a4,a5
20000562:	b00026f3          	csrr	a3,mcycle
20000566:	b80027f3          	csrr	a5,mcycleh
2000056a:	fee7ece3          	bltu	a5,a4,20000562 <otp_write_word.part.1+0x18>
2000056e:	00f71463          	bne	a4,a5,20000576 <otp_write_word.part.1+0x2c>
20000572:	fea6e8e3          	bltu	a3,a0,20000562 <otp_write_word.part.1+0x18>
20000576:	fff60e13          	addi	t3,a2,-1 # 67ffff <_prog_start-0x1f980001>
2000057a:	03e00793          	li	a5,62
2000057e:	02fe5e33          	divu	t3,t3,a5
20000582:	4681                	li	a3,0
20000584:	4305                	li	t1,1
20000586:	10010537          	lui	a0,0x10010
2000058a:	02000813          	li	a6,32
2000058e:	0e05                	addi	t3,t3,1
20000590:	a021                	j	20000598 <otp_write_word.part.1+0x4e>
20000592:	0685                	addi	a3,a3,1
20000594:	09068963          	beq	a3,a6,20000626 <otp_write_word.part.1+0xdc>
20000598:	00d5d7b3          	srl	a5,a1,a3
2000059c:	8b85                	andi	a5,a5,1
2000059e:	dbf5                	beqz	a5,20000592 <otp_write_word.part.1+0x48>
200005a0:	00d317b3          	sll	a5,t1,a3
200005a4:	d55c                	sw	a5,44(a0)
200005a6:	b00027f3          	csrr	a5,mcycle
200005aa:	b8002773          	csrr	a4,mcycleh
200005ae:	00178893          	addi	a7,a5,1
200005b2:	00f8b7b3          	sltu	a5,a7,a5
200005b6:	973e                	add	a4,a4,a5
200005b8:	b0002673          	csrr	a2,mcycle
200005bc:	b80027f3          	csrr	a5,mcycleh
200005c0:	fee7ece3          	bltu	a5,a4,200005b8 <otp_write_word.part.1+0x6e>
200005c4:	00f71463          	bne	a4,a5,200005cc <otp_write_word.part.1+0x82>
200005c8:	ff1668e3          	bltu	a2,a7,200005b8 <otp_write_word.part.1+0x6e>
200005cc:	00652223          	sw	t1,4(a0) # 10010004 <_prog_start-0xffefffc>
200005d0:	b00027f3          	csrr	a5,mcycle
200005d4:	b8002773          	csrr	a4,mcycleh
200005d8:	01c788b3          	add	a7,a5,t3
200005dc:	00f8b7b3          	sltu	a5,a7,a5
200005e0:	973e                	add	a4,a4,a5
200005e2:	b0002673          	csrr	a2,mcycle
200005e6:	b80027f3          	csrr	a5,mcycleh
200005ea:	fee7ece3          	bltu	a5,a4,200005e2 <otp_write_word.part.1+0x98>
200005ee:	00f71463          	bne	a4,a5,200005f6 <otp_write_word.part.1+0xac>
200005f2:	ff1668e3          	bltu	a2,a7,200005e2 <otp_write_word.part.1+0x98>
200005f6:	00052223          	sw	zero,4(a0)
200005fa:	b00027f3          	csrr	a5,mcycle
200005fe:	b8002773          	csrr	a4,mcycleh
20000602:	00778893          	addi	a7,a5,7
20000606:	00f8b7b3          	sltu	a5,a7,a5
2000060a:	973e                	add	a4,a4,a5
2000060c:	b0002673          	csrr	a2,mcycle
20000610:	b80027f3          	csrr	a5,mcycleh
20000614:	fee7ece3          	bltu	a5,a4,2000060c <otp_write_word.part.1+0xc2>
20000618:	f6f71de3          	bne	a4,a5,20000592 <otp_write_word.part.1+0x48>
2000061c:	ff1668e3          	bltu	a2,a7,2000060c <otp_write_word.part.1+0xc2>
20000620:	0685                	addi	a3,a3,1
20000622:	f7069be3          	bne	a3,a6,20000598 <otp_write_word.part.1+0x4e>
20000626:	8082                	ret

20000628 <rd64cycle>:
20000628:	b0002573          	csrr	a0,mcycle
2000062c:	b80025f3          	csrr	a1,mcycleh
20000630:	8082                	ret

20000632 <measure_cpu_freq>:
20000632:	0200c7b7          	lui	a5,0x200c
20000636:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
2000063a:	ff87a683          	lw	a3,-8(a5)
2000063e:	b0002673          	csrr	a2,mcycle
20000642:	b80027f3          	csrr	a5,mcycleh
20000646:	0200c737          	lui	a4,0x200c
2000064a:	ff872783          	lw	a5,-8(a4) # 200bff8 <_prog_start-0x1dff4008>
2000064e:	8f95                	sub	a5,a5,a3
20000650:	fea7ede3          	bltu	a5,a0,2000064a <measure_cpu_freq+0x18>
20000654:	b00027f3          	csrr	a5,mcycle
20000658:	b8002773          	csrr	a4,mcycleh
2000065c:	8f91                	sub	a5,a5,a2
2000065e:	02a7d533          	divu	a0,a5,a0
20000662:	02b50533          	mul	a0,a0,a1
20000666:	8082                	ret

20000668 <_putc>:
20000668:	8801a783          	lw	a5,-1920(gp) # 80000600 <print_to_uart1>
2000066c:	86aa                	mv	a3,a0
2000066e:	10013737          	lui	a4,0x10013
20000672:	c391                	beqz	a5,20000676 <_putc+0xe>
20000674:	b5e1                	j	2000053c <_putc.part.0>
20000676:	431c                	lw	a5,0(a4)
20000678:	fe07cfe3          	bltz	a5,20000676 <_putc+0xe>
2000067c:	c314                	sw	a3,0(a4)
2000067e:	8082                	ret

20000680 <lfsr32>:
20000680:	e509                	bnez	a0,2000068a <lfsr32+0xa>
20000682:	b0002573          	csrr	a0,mcycle
20000686:	b80027f3          	csrr	a5,mcycleh
2000068a:	01e55713          	srli	a4,a0,0x1e
2000068e:	00a55793          	srli	a5,a0,0xa
20000692:	8fb9                	xor	a5,a5,a4
20000694:	8fa9                	xor	a5,a5,a0
20000696:	01f55713          	srli	a4,a0,0x1f
2000069a:	8fb9                	xor	a5,a5,a4
2000069c:	07fe                	slli	a5,a5,0x1f
2000069e:	8105                	srli	a0,a0,0x1
200006a0:	8d5d                	or	a0,a0,a5
200006a2:	8082                	ret

200006a4 <hang_hfout>:
200006a4:	10012737          	lui	a4,0x10012
200006a8:	471c                	lw	a5,8(a4)
200006aa:	100126b7          	lui	a3,0x10012
200006ae:	0207e793          	ori	a5,a5,32
200006b2:	c71c                	sw	a5,8(a4)
200006b4:	b00027f3          	csrr	a5,mcycle
200006b8:	b8002773          	csrr	a4,mcycleh
200006bc:	2007f793          	andi	a5,a5,512
200006c0:	fbf5                	bnez	a5,200006b4 <hang_hfout+0x10>
200006c2:	46dc                	lw	a5,12(a3)
200006c4:	0207e793          	ori	a5,a5,32
200006c8:	c6dc                	sw	a5,12(a3)
200006ca:	b00027f3          	csrr	a5,mcycle
200006ce:	b8002773          	csrr	a4,mcycleh
200006d2:	2007f793          	andi	a5,a5,512
200006d6:	dbf5                	beqz	a5,200006ca <hang_hfout+0x26>
200006d8:	46dc                	lw	a5,12(a3)
200006da:	fdf7f793          	andi	a5,a5,-33
200006de:	c6dc                	sw	a5,12(a3)
200006e0:	bfd1                	j	200006b4 <hang_hfout+0x10>

200006e2 <_getc>:
200006e2:	8801a883          	lw	a7,-1920(gp) # 80000600 <print_to_uart1>
200006e6:	0a088a63          	beqz	a7,2000079a <_getc+0xb8>
200006ea:	100237b7          	lui	a5,0x10023
200006ee:	0047a803          	lw	a6,4(a5) # 10023004 <_prog_start-0xffdcffc>
200006f2:	c94d                	beqz	a0,200007a4 <_getc+0xc2>
200006f4:	01005b63          	blez	a6,2000070a <_getc+0x28>
200006f8:	100136b7          	lui	a3,0x10013
200006fc:	10023737          	lui	a4,0x10023
20000700:	0a088663          	beqz	a7,200007ac <_getc+0xca>
20000704:	435c                	lw	a5,4(a4)
20000706:	fef04de3          	bgtz	a5,20000700 <_getc+0x1e>
2000070a:	fff04e37          	lui	t3,0xfff04
2000070e:	4301                	li	t1,0
20000710:	4601                	li	a2,0
20000712:	10013f37          	lui	t5,0x10013
20000716:	10023eb7          	lui	t4,0x10023
2000071a:	100126b7          	lui	a3,0x10012
2000071e:	1f400513          	li	a0,500
20000722:	1e7d                	addi	t3,t3,-1
20000724:	000fcfb7          	lui	t6,0xfc
20000728:	06088663          	beqz	a7,20000794 <_getc+0xb2>
2000072c:	004ea803          	lw	a6,4(t4) # 10023004 <_prog_start-0xffdcffc>
20000730:	b00027f3          	csrr	a5,mcycle
20000734:	b8002773          	csrr	a4,mcycleh
20000738:	2007f793          	andi	a5,a5,512
2000073c:	fbf5                	bnez	a5,20000730 <_getc+0x4e>
2000073e:	46dc                	lw	a5,12(a3)
20000740:	0207e793          	ori	a5,a5,32
20000744:	c6dc                	sw	a5,12(a3)
20000746:	b00027f3          	csrr	a5,mcycle
2000074a:	b8002773          	csrr	a4,mcycleh
2000074e:	2007f793          	andi	a5,a5,512
20000752:	dbf5                	beqz	a5,20000746 <_getc+0x64>
20000754:	46dc                	lw	a5,12(a3)
20000756:	00160713          	addi	a4,a2,1
2000075a:	fdf7f793          	andi	a5,a5,-33
2000075e:	c6dc                	sw	a5,12(a3)
20000760:	02c57663          	bgeu	a0,a2,2000078c <_getc+0xaa>
20000764:	863a                	mv	a2,a4
20000766:	cd91                	beqz	a1,20000782 <_getc+0xa0>
20000768:	46d8                	lw	a4,12(a3)
2000076a:	0305                	addi	t1,t1,1
2000076c:	00e31793          	slli	a5,t1,0xe
20000770:	01c77733          	and	a4,a4,t3
20000774:	c6d8                	sw	a4,12(a3)
20000776:	46d8                	lw	a4,12(a3)
20000778:	01f7f7b3          	and	a5,a5,t6
2000077c:	4601                	li	a2,0
2000077e:	8fd9                	or	a5,a5,a4
20000780:	c6dc                	sw	a5,12(a3)
20000782:	fb0053e3          	blez	a6,20000728 <_getc+0x46>
20000786:	0ff87513          	andi	a0,a6,255
2000078a:	8082                	ret
2000078c:	863a                	mv	a2,a4
2000078e:	f9005de3          	blez	a6,20000728 <_getc+0x46>
20000792:	bfd5                	j	20000786 <_getc+0xa4>
20000794:	004f2803          	lw	a6,4(t5) # 10013004 <_prog_start-0xffecffc>
20000798:	bf61                	j	20000730 <_getc+0x4e>
2000079a:	100137b7          	lui	a5,0x10013
2000079e:	0047a803          	lw	a6,4(a5) # 10013004 <_prog_start-0xffecffc>
200007a2:	f929                	bnez	a0,200006f4 <_getc+0x12>
200007a4:	4501                	li	a0,0
200007a6:	ff0040e3          	bgtz	a6,20000786 <_getc+0xa4>
200007aa:	8082                	ret
200007ac:	42dc                	lw	a5,4(a3)
200007ae:	f4f049e3          	bgtz	a5,20000700 <_getc+0x1e>
200007b2:	bfa1                	j	2000070a <_getc+0x28>

200007b4 <_puts>:
200007b4:	1141                	addi	sp,sp,-16
200007b6:	c422                	sw	s0,8(sp)
200007b8:	c226                	sw	s1,4(sp)
200007ba:	c04a                	sw	s2,0(sp)
200007bc:	c606                	sw	ra,12(sp)
200007be:	84aa                	mv	s1,a0
200007c0:	10013437          	lui	s0,0x10013 # 0x10013000 uart0
200007c4:	0004c503          	lbu	a0,0(s1) # load first character of string
200007c8:	c909                	beqz	a0,200007da <_puts+0x26> #
200007ca:	8801a783          	lw	a5,-1920(gp) # 80000600 <print_to_uart1>
200007ce:	0485                	addi	s1,s1,1
200007d0:	cb99                	beqz	a5,200007e6 <_puts+0x32>
200007d2:	33ad                	jal	2000053c <_putc.part.0>
200007d4:	0004c503          	lbu	a0,0(s1)
200007d8:	f96d                	bnez	a0,200007ca <_puts+0x16>
200007da:	40b2                	lw	ra,12(sp)
200007dc:	4422                	lw	s0,8(sp)
200007de:	4492                	lw	s1,4(sp)
200007e0:	4902                	lw	s2,0(sp)
200007e2:	0141                	addi	sp,sp,16
200007e4:	8082                	ret
200007e6:	401c                	lw	a5,0(s0)
200007e8:	fe07cfe3          	bltz	a5,200007e6 <_puts+0x32>
200007ec:	c008                	sw	a0,0(s0)
200007ee:	bfd9                	j	200007c4 <_puts+0x10>

200007f0 <_puti>:
200007f0:	1101                	addi	sp,sp,-32
200007f2:	c84a                	sw	s2,16(sp)
200007f4:	c452                	sw	s4,8(sp)
200007f6:	ce06                	sw	ra,28(sp)
200007f8:	cc22                	sw	s0,24(sp)
200007fa:	ca26                	sw	s1,20(sp)
200007fc:	c64e                	sw	s3,12(sp)
200007fe:	c256                	sw	s5,4(sp)
20000800:	892a                	mv	s2,a0
20000802:	8801a683          	lw	a3,-1920(gp) # 80000600 <print_to_uart1>
20000806:	06054b63          	bltz	a0,2000087c <_puti+0x8c>
2000080a:	c549                	beqz	a0,20000894 <_puti+0xa4>
2000080c:	4481                	li	s1,0
2000080e:	4401                	li	s0,0
20000810:	4729                	li	a4,10
20000812:	a011                	j	20000816 <_puti+0x26>
20000814:	84be                	mv	s1,a5
20000816:	02e97633          	remu	a2,s2,a4
2000081a:	00241793          	slli	a5,s0,0x2
2000081e:	943e                	add	s0,s0,a5
20000820:	0406                	slli	s0,s0,0x1
20000822:	00148793          	addi	a5,s1,1
20000826:	02e95933          	divu	s2,s2,a4
2000082a:	9432                	add	s0,s0,a2
2000082c:	fe0914e3          	bnez	s2,20000814 <_puti+0x24>
20000830:	49a9                	li	s3,10
20000832:	10013937          	lui	s2,0x10013
20000836:	5afd                	li	s5,-1
20000838:	a809                	j	2000084a <_puti+0x5a>
2000083a:	14fd                	addi	s1,s1,-1
2000083c:	3301                	jal	2000053c <_putc.part.0>
2000083e:	03345433          	divu	s0,s0,s3
20000842:	03548463          	beq	s1,s5,2000086a <_puti+0x7a>
20000846:	8801a683          	lw	a3,-1920(gp) # 80000600 <print_to_uart1>
2000084a:	03347533          	remu	a0,s0,s3
2000084e:	03050513          	addi	a0,a0,48
20000852:	f6e5                	bnez	a3,2000083a <_puti+0x4a>
20000854:	00092783          	lw	a5,0(s2) # 10013000 <_prog_start-0xffed000>
20000858:	fe07cee3          	bltz	a5,20000854 <_puti+0x64>
2000085c:	00a92023          	sw	a0,0(s2)
20000860:	14fd                	addi	s1,s1,-1
20000862:	03345433          	divu	s0,s0,s3
20000866:	ff5490e3          	bne	s1,s5,20000846 <_puti+0x56>
2000086a:	40f2                	lw	ra,28(sp)
2000086c:	4462                	lw	s0,24(sp)
2000086e:	44d2                	lw	s1,20(sp)
20000870:	4942                	lw	s2,16(sp)
20000872:	49b2                	lw	s3,12(sp)
20000874:	4a22                	lw	s4,8(sp)
20000876:	4a92                	lw	s5,4(sp)
20000878:	6105                	addi	sp,sp,32
2000087a:	8082                	ret
2000087c:	10013737          	lui	a4,0x10013
20000880:	ee89                	bnez	a3,2000089a <_puti+0xaa>
20000882:	431c                	lw	a5,0(a4)
20000884:	fe07cfe3          	bltz	a5,20000882 <_puti+0x92>
20000888:	02d00793          	li	a5,45
2000088c:	c31c                	sw	a5,0(a4)
2000088e:	41200933          	neg	s2,s2
20000892:	bfad                	j	2000080c <_puti+0x1c>
20000894:	4401                	li	s0,0
20000896:	4481                	li	s1,0
20000898:	bf61                	j	20000830 <_puti+0x40>
2000089a:	02d00513          	li	a0,45
2000089e:	3979                	jal	2000053c <_putc.part.0>
200008a0:	8801a683          	lw	a3,-1920(gp) # 80000600 <print_to_uart1>
200008a4:	41200933          	neg	s2,s2
200008a8:	b795                	j	2000080c <_puti+0x1c>

200008aa <_puti1k>:
200008aa:	1101                	addi	sp,sp,-32
200008ac:	cc22                	sw	s0,24(sp)
200008ae:	842a                	mv	s0,a0
200008b0:	3e800513          	li	a0,1000
200008b4:	02a45533          	divu	a0,s0,a0
200008b8:	c64e                	sw	s3,12(sp)
200008ba:	ce06                	sw	ra,28(sp)
200008bc:	ca26                	sw	s1,20(sp)
200008be:	c84a                	sw	s2,16(sp)
200008c0:	c452                	sw	s4,8(sp)
200008c2:	c256                	sw	s5,4(sp)
200008c4:	3735                	jal	200007f0 <_puti>
200008c6:	8801a703          	lw	a4,-1920(gp) # 80000600 <print_to_uart1>
200008ca:	100136b7          	lui	a3,0x10013
200008ce:	eb35                	bnez	a4,20000942 <_puti1k+0x98>
200008d0:	429c                	lw	a5,0(a3)
200008d2:	fe07cfe3          	bltz	a5,200008d0 <_puti1k+0x26>
200008d6:	02e00793          	li	a5,46
200008da:	c29c                	sw	a5,0(a3)
200008dc:	3e800a93          	li	s5,1000
200008e0:	03547433          	remu	s0,s0,s5
200008e4:	06400a13          	li	s4,100
200008e8:	490d                	li	s2,3
200008ea:	100134b7          	lui	s1,0x10013
200008ee:	03445533          	divu	a0,s0,s4
200008f2:	03050513          	addi	a0,a0,48
200008f6:	0ff57513          	andi	a0,a0,255
200008fa:	c705                	beqz	a4,20000922 <_puti1k+0x78>
200008fc:	197d                	addi	s2,s2,-1
200008fe:	393d                	jal	2000053c <_putc.part.0>
20000900:	02090863          	beqz	s2,20000930 <_puti1k+0x86>
20000904:	00241793          	slli	a5,s0,0x2
20000908:	943e                	add	s0,s0,a5
2000090a:	0406                	slli	s0,s0,0x1
2000090c:	03547433          	remu	s0,s0,s5
20000910:	8801a703          	lw	a4,-1920(gp) # 80000600 <print_to_uart1>
20000914:	03445533          	divu	a0,s0,s4
20000918:	03050513          	addi	a0,a0,48
2000091c:	0ff57513          	andi	a0,a0,255
20000920:	ff71                	bnez	a4,200008fc <_puti1k+0x52>
20000922:	409c                	lw	a5,0(s1)
20000924:	fe07cfe3          	bltz	a5,20000922 <_puti1k+0x78>
20000928:	c088                	sw	a0,0(s1)
2000092a:	197d                	addi	s2,s2,-1
2000092c:	fc091ce3          	bnez	s2,20000904 <_puti1k+0x5a>
20000930:	40f2                	lw	ra,28(sp)
20000932:	4462                	lw	s0,24(sp)
20000934:	44d2                	lw	s1,20(sp)
20000936:	4942                	lw	s2,16(sp)
20000938:	49b2                	lw	s3,12(sp)
2000093a:	4a22                	lw	s4,8(sp)
2000093c:	4a92                	lw	s5,4(sp)
2000093e:	6105                	addi	sp,sp,32
20000940:	8082                	ret
20000942:	02e00513          	li	a0,46
20000946:	3edd                	jal	2000053c <_putc.part.0>
20000948:	8801a703          	lw	a4,-1920(gp) # 80000600 <print_to_uart1>
2000094c:	bf41                	j	200008dc <_puti1k+0x32>

2000094e <_puth>:
2000094e:	1101                	addi	sp,sp,-32
20000950:	c64e                	sw	s3,12(sp)
20000952:	8801a783          	lw	a5,-1920(gp) # 80000600 <print_to_uart1>
20000956:	cc22                	sw	s0,24(sp)
20000958:	ce06                	sw	ra,28(sp)
2000095a:	ca26                	sw	s1,20(sp)
2000095c:	c84a                	sw	s2,16(sp)
2000095e:	c452                	sw	s4,8(sp)
20000960:	842a                	mv	s0,a0
20000962:	10013737          	lui	a4,0x10013
20000966:	efad                	bnez	a5,200009e0 <_puth+0x92>
20000968:	431c                	lw	a5,0(a4)
2000096a:	fe07cfe3          	bltz	a5,20000968 <_puth+0x1a>
2000096e:	03000793          	li	a5,48
20000972:	c31c                	sw	a5,0(a4)
20000974:	10013737          	lui	a4,0x10013
20000978:	431c                	lw	a5,0(a4)
2000097a:	fe07cfe3          	bltz	a5,20000978 <_puth+0x2a>
2000097e:	07800793          	li	a5,120
20000982:	c31c                	sw	a5,0(a4)
20000984:	4921                	li	s2,8
20000986:	a0000a37          	lui	s4,0xa0000
2000098a:	100134b7          	lui	s1,0x10013
2000098e:	a809                	j	200009a0 <_puth+0x52>
20000990:	03050513          	addi	a0,a0,48
20000994:	cf9d                	beqz	a5,200009d2 <_puth+0x84>
20000996:	197d                	addi	s2,s2,-1
20000998:	3655                	jal	2000053c <_putc.part.0>
2000099a:	0412                	slli	s0,s0,0x4
2000099c:	02090363          	beqz	s2,200009c2 <_puth+0x74>
200009a0:	01c45513          	srli	a0,s0,0x1c
200009a4:	8801a783          	lw	a5,-1920(gp) # 80000600 <print_to_uart1>
200009a8:	ff4464e3          	bltu	s0,s4,20000990 <_puth+0x42>
200009ac:	05750513          	addi	a0,a0,87
200009b0:	f3fd                	bnez	a5,20000996 <_puth+0x48>
200009b2:	409c                	lw	a5,0(s1)
200009b4:	fe07cfe3          	bltz	a5,200009b2 <_puth+0x64>
200009b8:	c088                	sw	a0,0(s1)
200009ba:	197d                	addi	s2,s2,-1
200009bc:	0412                	slli	s0,s0,0x4
200009be:	fe0911e3          	bnez	s2,200009a0 <_puth+0x52>
200009c2:	40f2                	lw	ra,28(sp)
200009c4:	4462                	lw	s0,24(sp)
200009c6:	44d2                	lw	s1,20(sp)
200009c8:	4942                	lw	s2,16(sp)
200009ca:	49b2                	lw	s3,12(sp)
200009cc:	4a22                	lw	s4,8(sp)
200009ce:	6105                	addi	sp,sp,32
200009d0:	8082                	ret
200009d2:	409c                	lw	a5,0(s1)
200009d4:	fe07d2e3          	bgez	a5,200009b8 <_puth+0x6a>
200009d8:	409c                	lw	a5,0(s1)
200009da:	fe07cce3          	bltz	a5,200009d2 <_puth+0x84>
200009de:	bfe9                	j	200009b8 <_puth+0x6a>
200009e0:	03000513          	li	a0,48
200009e4:	3ea1                	jal	2000053c <_putc.part.0>
200009e6:	8801a783          	lw	a5,-1920(gp) # 80000600 <print_to_uart1>
200009ea:	d7c9                	beqz	a5,20000974 <_puth+0x26>
200009ec:	07800513          	li	a0,120
200009f0:	36b1                	jal	2000053c <_putc.part.0>
200009f2:	bf49                	j	20000984 <_puth+0x36>

200009f4 <errpt>:
200009f4:	1141                	addi	sp,sp,-16
200009f6:	c422                	sw	s0,8(sp)
200009f8:	c226                	sw	s1,4(sp)
200009fa:	c606                	sw	ra,12(sp)
200009fc:	842a                	mv	s0,a0
200009fe:	84ae                	mv	s1,a1
20000a00:	c915                	beqz	a0,20000a34 <errpt+0x40>
20000a02:	20002537          	lui	a0,0x20002
20000a06:	ed850513          	addi	a0,a0,-296 # 20001ed8 <CSWTCH.4+0x18>
20000a0a:	336d                	jal	200007b4 <_puts>
20000a0c:	8526                	mv	a0,s1
20000a0e:	335d                	jal	200007b4 <_puts>
20000a10:	20002537          	lui	a0,0x20002
20000a14:	ee450513          	addi	a0,a0,-284 # 20001ee4 <CSWTCH.4+0x24>
20000a18:	3b71                	jal	200007b4 <_puts>
20000a1a:	8522                	mv	a0,s0
20000a1c:	3bd1                	jal	200007f0 <_puti>
20000a1e:	20002537          	lui	a0,0x20002
20000a22:	fd450513          	addi	a0,a0,-44 # 20001fd4 <CSWTCH.4+0x114>
20000a26:	3379                	jal	200007b4 <_puts>
20000a28:	8522                	mv	a0,s0
20000a2a:	40b2                	lw	ra,12(sp)
20000a2c:	4422                	lw	s0,8(sp)
20000a2e:	4492                	lw	s1,4(sp)
20000a30:	0141                	addi	sp,sp,16
20000a32:	8082                	ret
20000a34:	852e                	mv	a0,a1
20000a36:	3bbd                	jal	200007b4 <_puts>
20000a38:	20002537          	lui	a0,0x20002
20000a3c:	ecc50513          	addi	a0,a0,-308 # 20001ecc <CSWTCH.4+0xc>
20000a40:	3b95                	jal	200007b4 <_puts>
20000a42:	8522                	mv	a0,s0
20000a44:	40b2                	lw	ra,12(sp)
20000a46:	4422                	lw	s0,8(sp)
20000a48:	4492                	lw	s1,4(sp)
20000a4a:	0141                	addi	sp,sp,16
20000a4c:	8082                	ret

20000a4e <nanosleep>:
20000a4e:	b0002673          	csrr	a2,mcycle
20000a52:	b8002773          	csrr	a4,mcycleh
20000a56:	fff50793          	addi	a5,a0,-1
20000a5a:	03e00513          	li	a0,62
20000a5e:	02a7d7b3          	divu	a5,a5,a0
20000a62:	0785                	addi	a5,a5,1
20000a64:	963e                	add	a2,a2,a5
20000a66:	00f637b3          	sltu	a5,a2,a5
20000a6a:	97ba                	add	a5,a5,a4
20000a6c:	b00026f3          	csrr	a3,mcycle
20000a70:	b8002773          	csrr	a4,mcycleh
20000a74:	fef76ce3          	bltu	a4,a5,20000a6c <nanosleep+0x1e>
20000a78:	00e79463          	bne	a5,a4,20000a80 <nanosleep+0x32>
20000a7c:	fec6e8e3          	bltu	a3,a2,20000a6c <nanosleep+0x1e>
20000a80:	8082                	ret

20000a82 <wait_ms>:
20000a82:	00551793          	slli	a5,a0,0x5
20000a86:	0200c737          	lui	a4,0x200c
20000a8a:	fe072c23          	sw	zero,-8(a4) # 200bff8 <_prog_start-0x1dff4008>
20000a8e:	953e                	add	a0,a0,a5
20000a90:	ff872783          	lw	a5,-8(a4)
20000a94:	fea7eee3          	bltu	a5,a0,20000a90 <wait_ms+0xe>
20000a98:	8082                	ret

20000a9a <wait_lfclicks>:
20000a9a:	0200c7b7          	lui	a5,0x200c
20000a9e:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000aa2:	0200c737          	lui	a4,0x200c
20000aa6:	ff872783          	lw	a5,-8(a4) # 200bff8 <_prog_start-0x1dff4008>
20000aaa:	fea7eee3          	bltu	a5,a0,20000aa6 <wait_lfclicks+0xc>
20000aae:	8082                	ret

20000ab0 <uart_set>:
20000ab0:	0200c7b7          	lui	a5,0x200c
20000ab4:	6685                	lui	a3,0x1
20000ab6:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000aba:	ce368693          	addi	a3,a3,-797 # ce3 <_prog_start-0x1ffff31d>
20000abe:	ff87a703          	lw	a4,-8(a5)
20000ac2:	ff878613          	addi	a2,a5,-8
20000ac6:	fee6fce3          	bgeu	a3,a4,20000abe <uart_set+0xe>
20000aca:	8801a783          	lw	a5,-1920(gp) # 80000600 <print_to_uart1>
20000ace:	c7c9                	beqz	a5,20000b58 <uart_set+0xa8>
20000ad0:	100127b7          	lui	a5,0x10012
20000ad4:	5fd8                	lw	a4,60(a5)
20000ad6:	ff7c06b7          	lui	a3,0xff7c0
20000ada:	16fd                	addi	a3,a3,-1
20000adc:	8f75                	and	a4,a4,a3
20000ade:	dfd8                	sw	a4,60(a5)
20000ae0:	5f98                	lw	a4,56(a5)
20000ae2:	008406b7          	lui	a3,0x840
20000ae6:	8f55                	or	a4,a4,a3
20000ae8:	df98                	sw	a4,56(a5)
20000aea:	8401a803          	lw	a6,-1984(gp) # 800005c0 <lfosc_freq>
20000aee:	00062023          	sw	zero,0(a2)
20000af2:	4210                	lw	a2,0(a2)
20000af4:	b00028f3          	csrr	a7,mcycle
20000af8:	b80027f3          	csrr	a5,mcycleh
20000afc:	6585                	lui	a1,0x1
20000afe:	0200c6b7          	lui	a3,0x200c
20000b02:	bb758713          	addi	a4,a1,-1097 # bb7 <_prog_start-0x1ffff449>
20000b06:	ff86a783          	lw	a5,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000b0a:	8f91                	sub	a5,a5,a2
20000b0c:	fef77de3          	bgeu	a4,a5,20000b06 <uart_set+0x56>
20000b10:	b00027f3          	csrr	a5,mcycle
20000b14:	b8002773          	csrr	a4,mcycleh
20000b18:	411787b3          	sub	a5,a5,a7
20000b1c:	bb858593          	addi	a1,a1,-1096
20000b20:	02b7d7b3          	divu	a5,a5,a1
20000b24:	10023737          	lui	a4,0x10023
20000b28:	0200c6b7          	lui	a3,0x200c
20000b2c:	030787b3          	mul	a5,a5,a6
20000b30:	02a7d533          	divu	a0,a5,a0
20000b34:	157d                	addi	a0,a0,-1
20000b36:	cf08                	sw	a0,24(a4)
20000b38:	471c                	lw	a5,8(a4)
20000b3a:	0017e793          	ori	a5,a5,1
20000b3e:	c71c                	sw	a5,8(a4)
20000b40:	0200c7b7          	lui	a5,0x200c
20000b44:	6705                	lui	a4,0x1
20000b46:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000b4a:	ce370713          	addi	a4,a4,-797 # ce3 <_prog_start-0x1ffff31d>
20000b4e:	ff86a783          	lw	a5,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000b52:	fef77ee3          	bgeu	a4,a5,20000b4e <uart_set+0x9e>
20000b56:	8082                	ret
20000b58:	100127b7          	lui	a5,0x10012
20000b5c:	5fd8                	lw	a4,60(a5)
20000b5e:	fffd06b7          	lui	a3,0xfffd0
20000b62:	16fd                	addi	a3,a3,-1
20000b64:	8f75                	and	a4,a4,a3
20000b66:	dfd8                	sw	a4,60(a5)
20000b68:	5f98                	lw	a4,56(a5)
20000b6a:	000306b7          	lui	a3,0x30
20000b6e:	8f55                	or	a4,a4,a3
20000b70:	df98                	sw	a4,56(a5)
20000b72:	8401a803          	lw	a6,-1984(gp) # 800005c0 <lfosc_freq>
20000b76:	00062023          	sw	zero,0(a2)
20000b7a:	4210                	lw	a2,0(a2)
20000b7c:	b00028f3          	csrr	a7,mcycle
20000b80:	b80027f3          	csrr	a5,mcycleh
20000b84:	6585                	lui	a1,0x1
20000b86:	0200c6b7          	lui	a3,0x200c
20000b8a:	bb758713          	addi	a4,a1,-1097 # bb7 <_prog_start-0x1ffff449>
20000b8e:	ff86a783          	lw	a5,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000b92:	8f91                	sub	a5,a5,a2
20000b94:	fef77de3          	bgeu	a4,a5,20000b8e <uart_set+0xde>
20000b98:	b00027f3          	csrr	a5,mcycle
20000b9c:	b8002773          	csrr	a4,mcycleh
20000ba0:	411787b3          	sub	a5,a5,a7
20000ba4:	bb858593          	addi	a1,a1,-1096
20000ba8:	02b7d7b3          	divu	a5,a5,a1
20000bac:	10013737          	lui	a4,0x10013
20000bb0:	bfa5                	j	20000b28 <uart_set+0x78>

20000bb2 <setringbits>:
20000bb2:	100087b7          	lui	a5,0x10008
20000bb6:	43d8                	lw	a4,4(a5)
20000bb8:	00171693          	slli	a3,a4,0x1
20000bbc:	0206c263          	bltz	a3,20000be0 <setringbits+0x2e>
20000bc0:	43d8                	lw	a4,4(a5)
20000bc2:	400006b7          	lui	a3,0x40000
20000bc6:	8f55                	or	a4,a4,a3
20000bc8:	c3d8                	sw	a4,4(a5)
20000bca:	6685                	lui	a3,0x1
20000bcc:	0200c7b7          	lui	a5,0x200c
20000bd0:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000bd4:	ce368693          	addi	a3,a3,-797 # ce3 <_prog_start-0x1ffff31d>
20000bd8:	ff87a703          	lw	a4,-8(a5)
20000bdc:	fee6fee3          	bgeu	a3,a4,20000bd8 <setringbits+0x26>
20000be0:	10008737          	lui	a4,0x10008
20000be4:	471c                	lw	a5,8(a4)
20000be6:	000406b7          	lui	a3,0x40
20000bea:	8fd5                	or	a5,a5,a3
20000bec:	c71c                	sw	a5,8(a4)
20000bee:	0200c7b7          	lui	a5,0x200c
20000bf2:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000bf6:	67100693          	li	a3,1649
20000bfa:	ff87a703          	lw	a4,-8(a5)
20000bfe:	ff878613          	addi	a2,a5,-8
20000c02:	fee6fce3          	bgeu	a3,a4,20000bfa <setringbits+0x48>
20000c06:	10008737          	lui	a4,0x10008
20000c0a:	431c                	lw	a5,0(a4)
20000c0c:	00179693          	slli	a3,a5,0x1
20000c10:	0206c363          	bltz	a3,20000c36 <setringbits+0x84>
20000c14:	4314                	lw	a3,0(a4)
20000c16:	40000837          	lui	a6,0x40000
20000c1a:	0200c7b7          	lui	a5,0x200c
20000c1e:	0106e6b3          	or	a3,a3,a6
20000c22:	c314                	sw	a3,0(a4)
20000c24:	6685                	lui	a3,0x1
20000c26:	00062023          	sw	zero,0(a2)
20000c2a:	ce368693          	addi	a3,a3,-797 # ce3 <_prog_start-0x1ffff31d>
20000c2e:	ff87a703          	lw	a4,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000c32:	fee6fee3          	bgeu	a3,a4,20000c2e <setringbits+0x7c>
20000c36:	01051793          	slli	a5,a0,0x10
20000c3a:	001f0537          	lui	a0,0x1f0
20000c3e:	8fe9                	and	a5,a5,a0
20000c40:	02f5f593          	andi	a1,a1,47
20000c44:	40000737          	lui	a4,0x40000
20000c48:	8fcd                	or	a5,a5,a1
20000c4a:	97ba                	add	a5,a5,a4
20000c4c:	10008737          	lui	a4,0x10008
20000c50:	c31c                	sw	a5,0(a4)
20000c52:	0200c7b7          	lui	a5,0x200c
20000c56:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000c5a:	67100613          	li	a2,1649
20000c5e:	ff87a703          	lw	a4,-8(a5)
20000c62:	ff878693          	addi	a3,a5,-8
20000c66:	fee67ce3          	bgeu	a2,a4,20000c5e <setringbits+0xac>
20000c6a:	10008637          	lui	a2,0x10008
20000c6e:	461c                	lw	a5,8(a2)
20000c70:	7741                	lui	a4,0xffff0
20000c72:	177d                	addi	a4,a4,-1
20000c74:	8ff9                	and	a5,a5,a4
20000c76:	c61c                	sw	a5,8(a2)
20000c78:	0006a023          	sw	zero,0(a3)
20000c7c:	67100713          	li	a4,1649
20000c80:	0200c6b7          	lui	a3,0x200c
20000c84:	ff86a783          	lw	a5,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000c88:	fef77ee3          	bgeu	a4,a5,20000c84 <setringbits+0xd2>
20000c8c:	10008737          	lui	a4,0x10008
20000c90:	471c                	lw	a5,8(a4)
20000c92:	000406b7          	lui	a3,0x40
20000c96:	6571                	lui	a0,0x1c
20000c98:	8fd5                	or	a5,a5,a3
20000c9a:	c71c                	sw	a5,8(a4)
20000c9c:	20050513          	addi	a0,a0,512 # 1c200 <_prog_start-0x1ffe3e00>
20000ca0:	bd01                	j	20000ab0 <uart_set>

20000ca2 <setpllbits>:
20000ca2:	100087b7          	lui	a5,0x10008
20000ca6:	43d8                	lw	a4,4(a5)
20000ca8:	00171693          	slli	a3,a4,0x1
20000cac:	0206c463          	bltz	a3,20000cd4 <setpllbits+0x32>
20000cb0:	43d8                	lw	a4,4(a5)
20000cb2:	40000837          	lui	a6,0x40000
20000cb6:	0200c6b7          	lui	a3,0x200c
20000cba:	01076733          	or	a4,a4,a6
20000cbe:	c3d8                	sw	a4,4(a5)
20000cc0:	0200c7b7          	lui	a5,0x200c
20000cc4:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000cc8:	14900793          	li	a5,329
20000ccc:	ff86a703          	lw	a4,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000cd0:	fee7fee3          	bgeu	a5,a4,20000ccc <setpllbits+0x2a>
20000cd4:	10008737          	lui	a4,0x10008
20000cd8:	471c                	lw	a5,8(a4)
20000cda:	000406b7          	lui	a3,0x40
20000cde:	0a400813          	li	a6,164
20000ce2:	8fd5                	or	a5,a5,a3
20000ce4:	c71c                	sw	a5,8(a4)
20000ce6:	0200c7b7          	lui	a5,0x200c
20000cea:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000cee:	ff87a703          	lw	a4,-8(a5)
20000cf2:	ff878693          	addi	a3,a5,-8
20000cf6:	fee87ce3          	bgeu	a6,a4,20000cee <setpllbits+0x4c>
20000cfa:	10008737          	lui	a4,0x10008
20000cfe:	471c                	lw	a5,8(a4)
20000d00:	00020837          	lui	a6,0x20
20000d04:	062a                	slli	a2,a2,0xa
20000d06:	0107e7b3          	or	a5,a5,a6
20000d0a:	c71c                	sw	a5,8(a4)
20000d0c:	00872803          	lw	a6,8(a4) # 10008008 <_prog_start-0xfff7ff8>
20000d10:	00459793          	slli	a5,a1,0x4
20000d14:	65c1                	lui	a1,0x10
20000d16:	00b865b3          	or	a1,a6,a1
20000d1a:	c70c                	sw	a1,8(a4)
20000d1c:	470c                	lw	a1,8(a4)
20000d1e:	6805                	lui	a6,0x1
20000d20:	c0080813          	addi	a6,a6,-1024 # c00 <_prog_start-0x1ffff400>
20000d24:	01067833          	and	a6,a2,a6
20000d28:	7641                	lui	a2,0xffff0
20000d2a:	3f07f793          	andi	a5,a5,1008
20000d2e:	8e6d                	and	a2,a2,a1
20000d30:	891d                	andi	a0,a0,7
20000d32:	0107e7b3          	or	a5,a5,a6
20000d36:	8d51                	or	a0,a0,a2
20000d38:	97aa                	add	a5,a5,a0
20000d3a:	c71c                	sw	a5,8(a4)
20000d3c:	0006a023          	sw	zero,0(a3) # 40000 <_prog_start-0x1ffc0000>
20000d40:	0200c7b7          	lui	a5,0x200c
20000d44:	14900693          	li	a3,329
20000d48:	ff87a703          	lw	a4,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000d4c:	ff878613          	addi	a2,a5,-8
20000d50:	fee6fce3          	bgeu	a3,a4,20000d48 <setpllbits+0xa6>
20000d54:	100087b7          	lui	a5,0x10008
20000d58:	479c                	lw	a5,8(a5)
20000d5a:	0007cb63          	bltz	a5,20000d70 <setpllbits+0xce>
20000d5e:	100086b7          	lui	a3,0x10008
20000d62:	469c                	lw	a5,8(a3)
20000d64:	fffc0737          	lui	a4,0xfffc0
20000d68:	177d                	addi	a4,a4,-1
20000d6a:	8ff9                	and	a5,a5,a4
20000d6c:	c69c                	sw	a5,8(a3)
20000d6e:	8082                	ret
20000d70:	6711                	lui	a4,0x4
20000d72:	00062023          	sw	zero,0(a2) # ffff0000 <_sp+0x7ffec000>
20000d76:	0200c6b7          	lui	a3,0x200c
20000d7a:	07370713          	addi	a4,a4,115 # 4073 <_prog_start-0x1fffbf8d>
20000d7e:	ff86a783          	lw	a5,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000d82:	fef77ee3          	bgeu	a4,a5,20000d7e <setpllbits+0xdc>
20000d86:	100086b7          	lui	a3,0x10008
20000d8a:	469c                	lw	a5,8(a3)
20000d8c:	fffc0737          	lui	a4,0xfffc0
20000d90:	177d                	addi	a4,a4,-1
20000d92:	8ff9                	and	a5,a5,a4
20000d94:	c69c                	sw	a5,8(a3)
20000d96:	8082                	ret

20000d98 <setpll>:
20000d98:	0007a5b7          	lui	a1,0x7a
20000d9c:	12058593          	addi	a1,a1,288 # 7a120 <_prog_start-0x1ff85ee0>
20000da0:	02b555b3          	divu	a1,a0,a1
20000da4:	100087b7          	lui	a5,0x10008
20000da8:	4798                	lw	a4,8(a5)
20000daa:	4798                	lw	a4,8(a5)
20000dac:	479c                	lw	a5,8(a5)
20000dae:	1141                	addi	sp,sp,-16
20000db0:	c606                	sw	ra,12(sp)
20000db2:	08000793          	li	a5,128
20000db6:	04b7ff63          	bgeu	a5,a1,20000e14 <setpll+0x7c>
20000dba:	00159513          	slli	a0,a1,0x1
20000dbe:	95aa                	add	a1,a1,a0
20000dc0:	8589                	srai	a1,a1,0x2
20000dc2:	08b7d663          	bge	a5,a1,20000e4e <setpll+0xb6>
20000dc6:	0586                	slli	a1,a1,0x1
20000dc8:	450d                	li	a0,3
20000dca:	02a5c533          	div	a0,a1,a0
20000dce:	40155593          	srai	a1,a0,0x1
20000dd2:	06a7d963          	bge	a5,a0,20000e44 <setpll+0xac>
20000dd6:	06b7d363          	bge	a5,a1,20000e3c <setpll+0xa4>
20000dda:	40255693          	srai	a3,a0,0x2
20000dde:	40355593          	srai	a1,a0,0x3
20000de2:	4601                	li	a2,0
20000de4:	4505                	li	a0,1
20000de6:	04d7d663          	bge	a5,a3,20000e32 <setpll+0x9a>
20000dea:	8585                	srai	a1,a1,0x1
20000dec:	0200c7b7          	lui	a5,0x200c
20000df0:	15fd                	addi	a1,a1,-1
20000df2:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <_prog_start-0x1dff4008>
20000df6:	0200c6b7          	lui	a3,0x200c
20000dfa:	14900713          	li	a4,329
20000dfe:	ff86a783          	lw	a5,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
20000e02:	fef77ee3          	bgeu	a4,a5,20000dfe <setpll+0x66>
20000e06:	3d71                	jal	20000ca2 <setpllbits>
20000e08:	40b2                	lw	ra,12(sp)
20000e0a:	6571                	lui	a0,0x1c
20000e0c:	20050513          	addi	a0,a0,512 # 1c200 <_prog_start-0x1ffe3e00>
20000e10:	0141                	addi	sp,sp,16
20000e12:	b979                	j	20000ab0 <uart_set>
20000e14:	4791                	li	a5,4
20000e16:	450d                	li	a0,3
20000e18:	460d                	li	a2,3
20000e1a:	4015d713          	srai	a4,a1,0x1
20000e1e:	02e787b3          	mul	a5,a5,a4
20000e22:	30000693          	li	a3,768
20000e26:	0786                	slli	a5,a5,0x1
20000e28:	fcf6d1e3          	bge	a3,a5,20000dea <setpll+0x52>
20000e2c:	167d                	addi	a2,a2,-1
20000e2e:	85ba                	mv	a1,a4
20000e30:	bf6d                	j	20000dea <setpll+0x52>
20000e32:	872e                	mv	a4,a1
20000e34:	47a1                	li	a5,8
20000e36:	85b6                	mv	a1,a3
20000e38:	4605                	li	a2,1
20000e3a:	b7d5                	j	20000e1e <setpll+0x86>
20000e3c:	47a1                	li	a5,8
20000e3e:	4505                	li	a0,1
20000e40:	4609                	li	a2,2
20000e42:	bfe1                	j	20000e1a <setpll+0x82>
20000e44:	85aa                	mv	a1,a0
20000e46:	47a1                	li	a5,8
20000e48:	4505                	li	a0,1
20000e4a:	460d                	li	a2,3
20000e4c:	b7f9                	j	20000e1a <setpll+0x82>
20000e4e:	4795                	li	a5,5
20000e50:	4509                	li	a0,2
20000e52:	460d                	li	a2,3
20000e54:	b7d9                	j	20000e1a <setpll+0x82>

20000e56 <otp_get_lock>:
20000e56:	100107b7          	lui	a5,0x10010
20000e5a:	4685                	li	a3,1
20000e5c:	c394                	sw	a3,0(a5)
20000e5e:	4398                	lw	a4,0(a5)
20000e60:	df75                	beqz	a4,20000e5c <otp_get_lock+0x6>
20000e62:	8082                	ret

20000e64 <otp_release_lock>:
20000e64:	100107b7          	lui	a5,0x10010
20000e68:	0007a023          	sw	zero,0(a5) # 10010000 <_prog_start-0xfff0000>
20000e6c:	8082                	ret

20000e6e <otp_begin_write>:
20000e6e:	100107b7          	lui	a5,0x10010
20000e72:	4605                	li	a2,1
20000e74:	4685                	li	a3,1
20000e76:	c394                	sw	a3,0(a5)
20000e78:	4398                	lw	a4,0(a5)
20000e7a:	df75                	beqz	a4,20000e76 <otp_begin_write+0x8>
20000e7c:	d3d0                	sw	a2,36(a5)
20000e7e:	cb90                	sw	a2,16(a5)
20000e80:	4711                	li	a4,4
20000e82:	cf98                	sw	a4,24(a5)
20000e84:	b00027f3          	csrr	a5,mcycle
20000e88:	b8002773          	csrr	a4,mcycleh
20000e8c:	00978613          	addi	a2,a5,9 # 10010009 <_prog_start-0xffefff7>
20000e90:	00f637b3          	sltu	a5,a2,a5
20000e94:	973e                	add	a4,a4,a5
20000e96:	b00026f3          	csrr	a3,mcycle
20000e9a:	b80027f3          	csrr	a5,mcycleh
20000e9e:	fee7ece3          	bltu	a5,a4,20000e96 <otp_begin_write+0x28>
20000ea2:	00f71463          	bne	a4,a5,20000eaa <otp_begin_write+0x3c>
20000ea6:	fec6e8e3          	bltu	a3,a2,20000e96 <otp_begin_write+0x28>
20000eaa:	8082                	ret

20000eac <otp_end_write>:
20000eac:	100107b7          	lui	a5,0x10010
20000eb0:	0007ac23          	sw	zero,24(a5) # 10010018 <_prog_start-0xffeffe8>
20000eb4:	0007a823          	sw	zero,16(a5)
20000eb8:	0207a223          	sw	zero,36(a5)
20000ebc:	b00027f3          	csrr	a5,mcycle
20000ec0:	b8002773          	csrr	a4,mcycleh
20000ec4:	03178613          	addi	a2,a5,49
20000ec8:	00f637b3          	sltu	a5,a2,a5
20000ecc:	973e                	add	a4,a4,a5
20000ece:	b00026f3          	csrr	a3,mcycle
20000ed2:	b80027f3          	csrr	a5,mcycleh
20000ed6:	fee7ece3          	bltu	a5,a4,20000ece <otp_end_write+0x22>
20000eda:	00f71463          	bne	a4,a5,20000ee2 <otp_end_write+0x36>
20000ede:	fec6e8e3          	bltu	a3,a2,20000ece <otp_end_write+0x22>
20000ee2:	100107b7          	lui	a5,0x10010
20000ee6:	0007a023          	sw	zero,0(a5) # 10010000 <_prog_start-0xfff0000>
20000eea:	8082                	ret

20000eec <otp_write_word>:
20000eec:	c199                	beqz	a1,20000ef2 <otp_write_word+0x6>
20000eee:	e5cff06f          	j	2000054a <otp_write_word.part.1>
20000ef2:	8082                	ret

20000ef4 <otp_read_word>:
20000ef4:	000207b7          	lui	a5,0x20
20000ef8:	050a                	slli	a0,a0,0x2
20000efa:	953e                	add	a0,a0,a5
20000efc:	4108                	lw	a0,0(a0)
20000efe:	8082                	ret

20000f00 <zap_ones>:
20000f00:	02c05763          	blez	a2,20000f2e <zap_ones+0x2e>
20000f04:	00251713          	slli	a4,a0,0x2
20000f08:	060a                	slli	a2,a2,0x2
20000f0a:	8f0d                	sub	a4,a4,a1
20000f0c:	000207b7          	lui	a5,0x20
20000f10:	962e                	add	a2,a2,a1
20000f12:	4501                	li	a0,0
20000f14:	973e                	add	a4,a4,a5
20000f16:	00b707b3          	add	a5,a4,a1
20000f1a:	439c                	lw	a5,0(a5)
20000f1c:	4194                	lw	a3,0(a1)
20000f1e:	0591                	addi	a1,a1,4
20000f20:	fff7c793          	not	a5,a5
20000f24:	8ff5                	and	a5,a5,a3
20000f26:	8d5d                	or	a0,a0,a5
20000f28:	fec597e3          	bne	a1,a2,20000f16 <zap_ones+0x16>
20000f2c:	8082                	ret
20000f2e:	4501                	li	a0,0
20000f30:	8082                	ret

20000f32 <otp_write_array_once>:
20000f32:	1101                	addi	sp,sp,-32
20000f34:	c64e                	sw	s3,12(sp)
20000f36:	89b2                	mv	s3,a2
20000f38:	cc22                	sw	s0,24(sp)
20000f3a:	c452                	sw	s4,8(sp)
20000f3c:	ce06                	sw	ra,28(sp)
20000f3e:	ca26                	sw	s1,20(sp)
20000f40:	c84a                	sw	s2,16(sp)
20000f42:	c256                	sw	s5,4(sp)
20000f44:	c05a                	sw	s6,0(sp)
20000f46:	8a2a                	mv	s4,a0
20000f48:	842e                	mv	s0,a1
20000f4a:	3715                	jal	20000e6e <otp_begin_write>
20000f4c:	03305863          	blez	s3,20000f7c <otp_write_array_once+0x4a>
20000f50:	00299a93          	slli	s5,s3,0x2
20000f54:	6b31                	lui	s6,0xc
20000f56:	84a2                	mv	s1,s0
20000f58:	8952                	mv	s2,s4
20000f5a:	9aa2                	add	s5,s5,s0
20000f5c:	350b0b13          	addi	s6,s6,848 # c350 <_prog_start-0x1fff3cb0>
20000f60:	a021                	j	20000f68 <otp_write_array_once+0x36>
20000f62:	0905                	addi	s2,s2,1
20000f64:	01548c63          	beq	s1,s5,20000f7c <otp_write_array_once+0x4a>
20000f68:	408c                	lw	a1,0(s1)
20000f6a:	0491                	addi	s1,s1,4
20000f6c:	d9fd                	beqz	a1,20000f62 <otp_write_array_once+0x30>
20000f6e:	854a                	mv	a0,s2
20000f70:	865a                	mv	a2,s6
20000f72:	dd8ff0ef          	jal	ra,2000054a <otp_write_word.part.1>
20000f76:	0905                	addi	s2,s2,1
20000f78:	ff5498e3          	bne	s1,s5,20000f68 <otp_write_array_once+0x36>
20000f7c:	100107b7          	lui	a5,0x10010
20000f80:	0007ac23          	sw	zero,24(a5) # 10010018 <_prog_start-0xffeffe8>
20000f84:	0007a823          	sw	zero,16(a5)
20000f88:	0207a223          	sw	zero,36(a5)
20000f8c:	b00027f3          	csrr	a5,mcycle
20000f90:	b8002773          	csrr	a4,mcycleh
20000f94:	03178613          	addi	a2,a5,49
20000f98:	00f637b3          	sltu	a5,a2,a5
20000f9c:	973e                	add	a4,a4,a5
20000f9e:	b00026f3          	csrr	a3,mcycle
20000fa2:	b80027f3          	csrr	a5,mcycleh
20000fa6:	fee7ece3          	bltu	a5,a4,20000f9e <otp_write_array_once+0x6c>
20000faa:	00f71463          	bne	a4,a5,20000fb2 <otp_write_array_once+0x80>
20000fae:	fec6e8e3          	bltu	a3,a2,20000f9e <otp_write_array_once+0x6c>
20000fb2:	100107b7          	lui	a5,0x10010
20000fb6:	0007a023          	sw	zero,0(a5) # 10010000 <_prog_start-0xfff0000>
20000fba:	05305263          	blez	s3,20000ffe <otp_write_array_once+0xcc>
20000fbe:	002a1693          	slli	a3,s4,0x2
20000fc2:	00299713          	slli	a4,s3,0x2
20000fc6:	8e81                	sub	a3,a3,s0
20000fc8:	000207b7          	lui	a5,0x20
20000fcc:	85a2                	mv	a1,s0
20000fce:	9722                	add	a4,a4,s0
20000fd0:	4501                	li	a0,0
20000fd2:	96be                	add	a3,a3,a5
20000fd4:	00b687b3          	add	a5,a3,a1
20000fd8:	439c                	lw	a5,0(a5)
20000fda:	4190                	lw	a2,0(a1)
20000fdc:	0591                	addi	a1,a1,4
20000fde:	fff7c793          	not	a5,a5
20000fe2:	8ff1                	and	a5,a5,a2
20000fe4:	8d5d                	or	a0,a0,a5
20000fe6:	fee597e3          	bne	a1,a4,20000fd4 <otp_write_array_once+0xa2>
20000fea:	40f2                	lw	ra,28(sp)
20000fec:	4462                	lw	s0,24(sp)
20000fee:	44d2                	lw	s1,20(sp)
20000ff0:	4942                	lw	s2,16(sp)
20000ff2:	49b2                	lw	s3,12(sp)
20000ff4:	4a22                	lw	s4,8(sp)
20000ff6:	4a92                	lw	s5,4(sp)
20000ff8:	4b02                	lw	s6,0(sp)
20000ffa:	6105                	addi	sp,sp,32
20000ffc:	8082                	ret
20000ffe:	4501                	li	a0,0
20001000:	b7ed                	j	20000fea <otp_write_array_once+0xb8>

20001002 <otp_write_array>:
20001002:	04c05263          	blez	a2,20001046 <otp_write_array+0x44>
20001006:	00251793          	slli	a5,a0,0x2
2000100a:	000208b7          	lui	a7,0x20
2000100e:	00f886b3          	add	a3,a7,a5
20001012:	4198                	lw	a4,0(a1)
20001014:	4294                	lw	a3,0(a3)
20001016:	fff74713          	not	a4,a4
2000101a:	8f75                	and	a4,a4,a3
2000101c:	e749                	bnez	a4,200010a6 <otp_write_array+0xa4>
2000101e:	8f8d                	sub	a5,a5,a1
20001020:	00458713          	addi	a4,a1,4
20001024:	4681                	li	a3,0
20001026:	98be                	add	a7,a7,a5
20001028:	a811                	j	2000103c <otp_write_array+0x3a>
2000102a:	431c                	lw	a5,0(a4)
2000102c:	00082803          	lw	a6,0(a6)
20001030:	0711                	addi	a4,a4,4
20001032:	fff7c793          	not	a5,a5
20001036:	0107f7b3          	and	a5,a5,a6
2000103a:	e7b5                	bnez	a5,200010a6 <otp_write_array+0xa4>
2000103c:	0685                	addi	a3,a3,1
2000103e:	00e88833          	add	a6,a7,a4
20001042:	fed614e3          	bne	a2,a3,2000102a <otp_write_array+0x28>
20001046:	66b1                	lui	a3,0xc
20001048:	1101                	addi	sp,sp,-32
2000104a:	35068693          	addi	a3,a3,848 # c350 <_prog_start-0x1fff3cb0>
2000104e:	cc22                	sw	s0,24(sp)
20001050:	ca26                	sw	s1,20(sp)
20001052:	c84a                	sw	s2,16(sp)
20001054:	c64e                	sw	s3,12(sp)
20001056:	ce06                	sw	ra,28(sp)
20001058:	c452                	sw	s4,8(sp)
2000105a:	84ae                	mv	s1,a1
2000105c:	89aa                	mv	s3,a0
2000105e:	8432                	mv	s0,a2
20001060:	3dc9                	jal	20000f32 <otp_write_array_once>
20001062:	4929                	li	s2,10
20001064:	c905                	beqz	a0,20001094 <otp_write_array+0x92>
20001066:	00062a37          	lui	s4,0x62
2000106a:	a80a0a13          	addi	s4,s4,-1408 # 61a80 <_prog_start-0x1ff9e580>
2000106e:	86d2                	mv	a3,s4
20001070:	8622                	mv	a2,s0
20001072:	85a6                	mv	a1,s1
20001074:	854e                	mv	a0,s3
20001076:	3d75                	jal	20000f32 <otp_write_array_once>
20001078:	197d                	addi	s2,s2,-1
2000107a:	cd09                	beqz	a0,20001094 <otp_write_array+0x92>
2000107c:	fe0919e3          	bnez	s2,2000106e <otp_write_array+0x6c>
20001080:	40f2                	lw	ra,28(sp)
20001082:	4462                	lw	s0,24(sp)
20001084:	44d2                	lw	s1,20(sp)
20001086:	4942                	lw	s2,16(sp)
20001088:	49b2                	lw	s3,12(sp)
2000108a:	4a22                	lw	s4,8(sp)
2000108c:	21400513          	li	a0,532
20001090:	6105                	addi	sp,sp,32
20001092:	8082                	ret
20001094:	40f2                	lw	ra,28(sp)
20001096:	4462                	lw	s0,24(sp)
20001098:	44d2                	lw	s1,20(sp)
2000109a:	4942                	lw	s2,16(sp)
2000109c:	49b2                	lw	s3,12(sp)
2000109e:	4a22                	lw	s4,8(sp)
200010a0:	4501                	li	a0,0
200010a2:	6105                	addi	sp,sp,32
200010a4:	8082                	ret
200010a6:	20500513          	li	a0,517
200010aa:	8082                	ret

200010ac <measure_lfosc_freq>:
200010ac:	100087b7          	lui	a5,0x10008
200010b0:	00060737          	lui	a4,0x60
200010b4:	c798                	sw	a4,8(a5)
200010b6:	4798                	lw	a4,8(a5)
200010b8:	6641                	lui	a2,0x10
200010ba:	0200c6b7          	lui	a3,0x200c
200010be:	8f51                	or	a4,a4,a2
200010c0:	c798                	sw	a4,8(a5)
200010c2:	fe06ac23          	sw	zero,-8(a3) # 200bff8 <_prog_start-0x1dff4008>
200010c6:	ff86a603          	lw	a2,-8(a3)
200010ca:	b0002873          	csrr	a6,mcycle
200010ce:	b80027f3          	csrr	a5,mcycleh
200010d2:	6585                	lui	a1,0x1
200010d4:	bb758713          	addi	a4,a1,-1097 # bb7 <_prog_start-0x1ffff449>
200010d8:	ff86a783          	lw	a5,-8(a3)
200010dc:	8f91                	sub	a5,a5,a2
200010de:	fef77de3          	bgeu	a4,a5,200010d8 <measure_lfosc_freq+0x2c>
200010e2:	b0002573          	csrr	a0,mcycle
200010e6:	b80027f3          	csrr	a5,mcycleh
200010ea:	41050533          	sub	a0,a0,a6
200010ee:	bb858593          	addi	a1,a1,-1096
200010f2:	02b55533          	divu	a0,a0,a1
200010f6:	3e800793          	li	a5,1000
200010fa:	053e                	slli	a0,a0,0xf
200010fc:	02f55533          	divu	a0,a0,a5
20001100:	1f4007b7          	lui	a5,0x1f400
20001104:	02a7d533          	divu	a0,a5,a0
20001108:	84a1a023          	sw	a0,-1984(gp) # 800005c0 <lfosc_freq>
2000110c:	8082                	ret

2000110e <bench_rstclk>:
2000110e:	10014737          	lui	a4,0x10014 # 0x10014000 (QSPI0)
20001112:	433c                	lw	a5,64(a4) # load frame format (fmt)
20001114:	1101                	addi	sp,sp,-32 # function stuff
20001116:	ce06                	sw	ra,28(sp) # function stuff
20001118:	9bf1                	andi	a5,a5,-4 # fmt & ~(0x00000003)
2000111a:	c33c                	sw	a5,64(a4) # set protocol to single
2000111c:	300477f3          	csrrci	a5,mstatus,8
20001120:	100127b7          	lui	a5,0x10012
20001124:	0007a423          	sw	zero,8(a5) # 10012008 <_prog_start-0xffedff8>
20001128:	0207ac23          	sw	zero,56(a5)
2000112c:	8801a703          	lw	a4,-1920(gp) # 80000600 <print_to_uart1>
20001130:	0007a623          	sw	zero,12(a5)
20001134:	0407a023          	sw	zero,64(a5)
20001138:	c35d                	beqz	a4,200011de <bench_rstclk+0xd0>
2000113a:	47d8                	lw	a4,12(a5)
2000113c:	00840637          	lui	a2,0x840
20001140:	ff7c05b7          	lui	a1,0xff7c0
20001144:	8f51                	or	a4,a4,a2
20001146:	c7d8                	sw	a4,12(a5)
20001148:	4794                	lw	a3,8(a5)
2000114a:	10023737          	lui	a4,0x10023
2000114e:	8ed1                	or	a3,a3,a2
20001150:	c794                	sw	a3,8(a5)
20001152:	5fd4                	lw	a3,60(a5)

20001154:	15fd                	addi	a1,a1,-1
20001156:	8eed                	and	a3,a3,a1
20001158:	dfd4                	sw	a3,60(a5)
2000115a:	5f94                	lw	a3,56(a5)
2000115c:	8ed1                	or	a3,a3,a2
2000115e:	df94                	sw	a3,56(a5)
20001160:	08a00793          	li	a5,138
20001164:	cf1c                	sw	a5,24(a4)
20001166:	67c1                	lui	a5,0x10
20001168:	0785                	addi	a5,a5,1
2000116a:	c71c                	sw	a5,8(a4)
2000116c:	4785                	li	a5,1
2000116e:	c75c                	sw	a5,12(a4)
20001170:	c602                	sw	zero,12(sp)
20001172:	47b2                	lw	a5,12(sp)
20001174:	6709                	lui	a4,0x2
20001176:	70f70713          	addi	a4,a4,1807 # 270f <_prog_start-0x1fffd8f1>
2000117a:	00f74863          	blt	a4,a5,2000118a <bench_rstclk+0x7c>
2000117e:	47b2                	lw	a5,12(sp)
20001180:	0785                	addi	a5,a5,1
20001182:	c63e                	sw	a5,12(sp)
20001184:	47b2                	lw	a5,12(sp)
20001186:	fef75ce3          	bge	a4,a5,2000117e <bench_rstclk+0x70>
2000118a:	100087b7          	lui	a5,0x10008
2000118e:	00060737          	lui	a4,0x60
20001192:	c798                	sw	a4,8(a5)
20001194:	4798                	lw	a4,8(a5)
20001196:	66c1                	lui	a3,0x10
20001198:	8f55                	or	a4,a4,a3
2000119a:	c798                	sw	a4,8(a5)
2000119c:	3f01                	jal	200010ac <measure_lfosc_freq>
2000119e:	20002537          	lui	a0,0x20002
200011a2:	ef850513          	addi	a0,a0,-264 # 20001ef8 <CSWTCH.4+0x38>
200011a6:	e0eff0ef          	jal	ra,200007b4 <_puts>
200011aa:	20002537          	lui	a0,0x20002
200011ae:	f0050513          	addi	a0,a0,-256 # 20001f00 <CSWTCH.4+0x40>
200011b2:	e02ff0ef          	jal	ra,200007b4 <_puts>
200011b6:	20002537          	lui	a0,0x20002
200011ba:	f0850513          	addi	a0,a0,-248 # 20001f08 <CSWTCH.4+0x48>
200011be:	df6ff0ef          	jal	ra,200007b4 <_puts>
200011c2:	20002537          	lui	a0,0x20002
200011c6:	f1050513          	addi	a0,a0,-240 # 20001f10 <CSWTCH.4+0x50>
200011ca:	deaff0ef          	jal	ra,200007b4 <_puts>
200011ce:	40f2                	lw	ra,28(sp)
200011d0:	20002537          	lui	a0,0x20002
200011d4:	f1c50513          	addi	a0,a0,-228 # 20001f1c <CSWTCH.4+0x5c>
200011d8:	6105                	addi	sp,sp,32
200011da:	ddaff06f          	j	200007b4 <_puts>

200011de:	47d8                	lw	a4,12(a5)
200011e0:	00030637          	lui	a2,0x30
200011e4:	fffd05b7          	lui	a1,0xfffd0
200011e8:	8f51                	or	a4,a4,a2
200011ea:	c7d8                	sw	a4,12(a5)
200011ec:	4794                	lw	a3,8(a5)
200011ee:	10013737          	lui	a4,0x10013
200011f2:	8ed1                	or	a3,a3,a2
200011f4:	c794                	sw	a3,8(a5)
200011f6:	5fd4                	lw	a3,60(a5)
200011f8:	bfb1                	j	20001154 <bench_rstclk+0x46>
# end bench_rstclk

200011fa <spi_min_clk_divisor>:
200011fa:	0586                	slli	a1,a1,0x1
200011fc:	157d                	addi	a0,a0,-1
200011fe:	952e                	add	a0,a0,a1
20001200:	02b555b3          	divu	a1,a0,a1
20001204:	00b03533          	snez	a0,a1
20001208:	40a58533          	sub	a0,a1,a0
2000120c:	8082                	ret

2000120e <spi_tx>:
2000120e:	04850793          	addi	a5,a0,72
20001212:	40b7a7af          	amoor.w	a5,a1,(a5)
20001216:	fe07cce3          	bltz	a5,2000120e <spi_tx>
2000121a:	8082                	ret

2000121c <spi_rx>:
2000121c:	457c                	lw	a5,76(a0)
2000121e:	fe07cfe3          	bltz	a5,2000121c <spi_rx>
20001222:	0ff7f513          	andi	a0,a5,255
20001226:	8082                	ret

20001228 <spi_txrx>:
20001228:	04850793          	addi	a5,a0,72
2000122c:	40b7a7af          	amoor.w	a5,a1,(a5)
20001230:	fe07cce3          	bltz	a5,20001228 <spi_txrx>
20001234:	457c                	lw	a5,76(a0)
20001236:	fe07cfe3          	bltz	a5,20001234 <spi_txrx+0xc>
2000123a:	0ff7f513          	andi	a0,a5,255
2000123e:	8082                	ret

20001240 <spi_copy>:
20001240:	4d18                	lw	a4,24(a0)
20001242:	87aa                	mv	a5,a0
20001244:	9b71                	andi	a4,a4,-4
20001246:	00276713          	ori	a4,a4,2
2000124a:	cd18                	sw	a4,24(a0)
2000124c:	470d                	li	a4,3
2000124e:	04878513          	addi	a0,a5,72 # 10008048 <_prog_start-0xfff7fb8>
20001252:	40e5252f          	amoor.w	a0,a4,(a0)
20001256:	fe054ce3          	bltz	a0,2000124e <spi_copy+0xe>
2000125a:	47f8                	lw	a4,76(a5)
2000125c:	fe074fe3          	bltz	a4,2000125a <spi_copy+0x1a>
20001260:	01065713          	srli	a4,a2,0x10
20001264:	0ff77713          	andi	a4,a4,255
20001268:	04878513          	addi	a0,a5,72
2000126c:	40e5252f          	amoor.w	a0,a4,(a0)
20001270:	fe054ce3          	bltz	a0,20001268 <spi_copy+0x28>
20001274:	47f8                	lw	a4,76(a5)
20001276:	fe074fe3          	bltz	a4,20001274 <spi_copy+0x34>
2000127a:	00865713          	srli	a4,a2,0x8
2000127e:	0ff77713          	andi	a4,a4,255
20001282:	04878513          	addi	a0,a5,72
20001286:	40e5252f          	amoor.w	a0,a4,(a0)
2000128a:	fe054ce3          	bltz	a0,20001282 <spi_copy+0x42>
2000128e:	47f8                	lw	a4,76(a5)
20001290:	fe074fe3          	bltz	a4,2000128e <spi_copy+0x4e>
20001294:	0ff67613          	andi	a2,a2,255
20001298:	04878713          	addi	a4,a5,72
2000129c:	40c7272f          	amoor.w	a4,a2,(a4)
200012a0:	fe074ce3          	bltz	a4,20001298 <spi_copy+0x58>
200012a4:	47f8                	lw	a4,76(a5)
200012a6:	fe074fe3          	bltz	a4,200012a4 <spi_copy+0x64>
200012aa:	c295                	beqz	a3,200012ce <spi_copy+0x8e>
200012ac:	00d58633          	add	a2,a1,a3
200012b0:	4681                	li	a3,0
200012b2:	04878713          	addi	a4,a5,72
200012b6:	40d7272f          	amoor.w	a4,a3,(a4)
200012ba:	fe074ce3          	bltz	a4,200012b2 <spi_copy+0x72>
200012be:	47f8                	lw	a4,76(a5)
200012c0:	fe074fe3          	bltz	a4,200012be <spi_copy+0x7e>
200012c4:	00e58023          	sb	a4,0(a1) # fffd0000 <_sp+0x7ffcc000>
200012c8:	0585                	addi	a1,a1,1
200012ca:	fec594e3          	bne	a1,a2,200012b2 <spi_copy+0x72>
200012ce:	4f98                	lw	a4,24(a5)
200012d0:	4501                	li	a0,0
200012d2:	9b71                	andi	a4,a4,-4
200012d4:	cf98                	sw	a4,24(a5)
200012d6:	8082                	ret

200012d8 <_putx>:
200012d8:	1141                	addi	sp,sp,-16
200012da:	c422                	sw	s0,8(sp)
200012dc:	c606                	sw	ra,12(sp)
200012de:	842a                	mv	s0,a0
200012e0:	12f000ef          	jal	ra,20001c0e <__locale_ctype_ptr>
200012e4:	9522                	add	a0,a0,s0
200012e6:	00154783          	lbu	a5,1(a0)
200012ea:	8522                	mv	a0,s0
200012ec:	0977f793          	andi	a5,a5,151
200012f0:	eb91                	bnez	a5,20001304 <_putx+0x2c>
200012f2:	02300513          	li	a0,35
200012f6:	b72ff0ef          	jal	ra,20000668 <_putc>
200012fa:	8522                	mv	a0,s0
200012fc:	cf4ff0ef          	jal	ra,200007f0 <_puti>
20001300:	02000513          	li	a0,32
20001304:	4422                	lw	s0,8(sp)
20001306:	40b2                	lw	ra,12(sp)
20001308:	0141                	addi	sp,sp,16
2000130a:	b5eff06f          	j	20000668 <_putc>

2000130e <_putnps>:
2000130e:	00054783          	lbu	a5,0(a0)
20001312:	cf95                	beqz	a5,2000134e <_putnps+0x40>
20001314:	1141                	addi	sp,sp,-16
20001316:	c422                	sw	s0,8(sp)
20001318:	c606                	sw	ra,12(sp)
2000131a:	842a                	mv	s0,a0
2000131c:	a021                	j	20001324 <_putnps+0x16>
2000131e:	00044783          	lbu	a5,0(s0) # 10013000 <_prog_start-0xffed000>
20001322:	c395                	beqz	a5,20001346 <_putnps+0x38>
20001324:	0eb000ef          	jal	ra,20001c0e <__locale_ctype_ptr>
20001328:	00044703          	lbu	a4,0(s0)
2000132c:	0405                	addi	s0,s0,1
2000132e:	953a                	add	a0,a0,a4
20001330:	00154783          	lbu	a5,1(a0)
20001334:	0977f793          	andi	a5,a5,151
20001338:	d3fd                	beqz	a5,2000131e <_putnps+0x10>
2000133a:	853a                	mv	a0,a4
2000133c:	b2cff0ef          	jal	ra,20000668 <_putc>
20001340:	00044783          	lbu	a5,0(s0)
20001344:	f3e5                	bnez	a5,20001324 <_putnps+0x16>
20001346:	40b2                	lw	ra,12(sp)
20001348:	4422                	lw	s0,8(sp)
2000134a:	0141                	addi	sp,sp,16
2000134c:	8082                	ret
2000134e:	8082                	ret

20001350 <at_wait_done>:
20001350:	100127b7          	lui	a5,0x10012
20001354:	439c                	lw	a5,0(a5)
20001356:	1141                	addi	sp,sp,-16
20001358:	c422                	sw	s0,8(sp)
2000135a:	c226                	sw	s1,4(sp)
2000135c:	c606                	sw	ra,12(sp)
2000135e:	c04a                	sw	s2,0(sp)
20001360:	4007f793          	andi	a5,a5,1024
20001364:	84aa                	mv	s1,a0
20001366:	4401                	li	s0,0
20001368:	e38d                	bnez	a5,2000138a <at_wait_done+0x3a>
2000136a:	02a05063          	blez	a0,2000138a <at_wait_done+0x3a>
2000136e:	10012937          	lui	s2,0x10012
20001372:	a019                	j	20001378 <at_wait_done+0x28>
20001374:	00848e63          	beq	s1,s0,20001390 <at_wait_done+0x40>
20001378:	4529                	li	a0,10
2000137a:	f08ff0ef          	jal	ra,20000a82 <wait_ms>
2000137e:	00092783          	lw	a5,0(s2) # 10012000 <_prog_start-0xffee000>
20001382:	0405                	addi	s0,s0,1
20001384:	4007f793          	andi	a5,a5,1024
20001388:	d7f5                	beqz	a5,20001374 <at_wait_done+0x24>
2000138a:	00848363          	beq	s1,s0,20001390 <at_wait_done+0x40>
2000138e:	4401                	li	s0,0
20001390:	8522                	mv	a0,s0
20001392:	40b2                	lw	ra,12(sp)
20001394:	4422                	lw	s0,8(sp)
20001396:	4492                	lw	s1,4(sp)
20001398:	4902                	lw	s2,0(sp)
2000139a:	0141                	addi	sp,sp,16
2000139c:	8082                	ret

2000139e <spi_transceive_one>:
2000139e:	1141                	addi	sp,sp,-16
200013a0:	c422                	sw	s0,8(sp)
200013a2:	842a                	mv	s0,a0
200013a4:	4515                	li	a0,5
200013a6:	c226                	sw	s1,4(sp)
200013a8:	c606                	sw	ra,12(sp)
200013aa:	84ae                	mv	s1,a1
200013ac:	ed6ff0ef          	jal	ra,20000a82 <wait_ms>
200013b0:	4c1c                	lw	a5,24(s0)
200013b2:	9bf1                	andi	a5,a5,-4
200013b4:	0027e793          	ori	a5,a5,2
200013b8:	cc1c                	sw	a5,24(s0)
200013ba:	04905063          	blez	s1,200013fa <spi_transceive_one+0x5c>
200013be:	88818693          	addi	a3,gp,-1912 # 80000608 <tx_buf>
200013c2:	04068513          	addi	a0,a3,64 # 10040 <_prog_start-0x1ffeffc0>
200013c6:	fff48813          	addi	a6,s1,-1 # 10012fff <_prog_start-0xffed001>
200013ca:	00a485b3          	add	a1,s1,a0
200013ce:	872a                	mv	a4,a0
200013d0:	0006c603          	lbu	a2,0(a3)
200013d4:	47f9                	li	a5,30
200013d6:	04c40423          	sb	a2,72(s0)
200013da:	0001                	nop
200013dc:	17fd                	addi	a5,a5,-1
200013de:	fff5                	bnez	a5,200013da <spi_transceive_one+0x3c>
200013e0:	40a707b3          	sub	a5,a4,a0
200013e4:	02f80163          	beq	a6,a5,20001406 <spi_transceive_one+0x68>
200013e8:	447c                	lw	a5,76(s0)
200013ea:	fe07cfe3          	bltz	a5,200013e8 <spi_transceive_one+0x4a>
200013ee:	00f70023          	sb	a5,0(a4) # 10013000 <_prog_start-0xffed000>
200013f2:	0705                	addi	a4,a4,1
200013f4:	0685                	addi	a3,a3,1
200013f6:	fcb71de3          	bne	a4,a1,200013d0 <spi_transceive_one+0x32>
200013fa:	40b2                	lw	ra,12(sp)
200013fc:	4422                	lw	s0,8(sp)
200013fe:	4492                	lw	s1,4(sp)
20001400:	4501                	li	a0,0
20001402:	0141                	addi	sp,sp,16
20001404:	8082                	ret
20001406:	4c1c                	lw	a5,24(s0)
20001408:	9bf1                	andi	a5,a5,-4
2000140a:	cc1c                	sw	a5,24(s0)
2000140c:	bff1                	j	200013e8 <spi_transceive_one+0x4a>

2000140e <spi_transceive>:
2000140e:	1141                	addi	sp,sp,-16
20001410:	c606                	sw	ra,12(sp)
20001412:	3771                	jal	2000139e <spi_transceive_one>
20001414:	40b2                	lw	ra,12(sp)
20001416:	4501                	li	a0,0
20001418:	0141                	addi	sp,sp,16
2000141a:	8082                	ret

2000141c <at_sendflag>:
2000141c:	7179                	addi	sp,sp,-48
2000141e:	d422                	sw	s0,40(sp)
20001420:	88818413          	addi	s0,gp,-1912 # 80000608 <tx_buf>
20001424:	ce4e                	sw	s3,28(sp)
20001426:	cc52                	sw	s4,24(sp)
20001428:	c65e                	sw	s7,12(sp)
2000142a:	d606                	sw	ra,44(sp)
2000142c:	d226                	sw	s1,36(sp)
2000142e:	d04a                	sw	s2,32(sp)
20001430:	ca56                	sw	s5,20(sp)
20001432:	c85a                	sw	s6,16(sp)
20001434:	c462                	sw	s8,8(sp)
20001436:	04040993          	addi	s3,s0,64
2000143a:	8bae                	mv	s7,a1
2000143c:	8a2a                	mv	s4,a0
2000143e:	00b40023          	sb	a1,0(s0)
20001442:	000400a3          	sb	zero,1(s0)
20001446:	00040123          	sb	zero,2(s0)
2000144a:	000401a3          	sb	zero,3(s0)
2000144e:	0c040713          	addi	a4,s0,192
20001452:	87ce                	mv	a5,s3
20001454:	00078023          	sb	zero,0(a5) # 10012000 <_prog_start-0xffee000>
20001458:	0785                	addi	a5,a5,1
2000145a:	fee79de3          	bne	a5,a4,20001454 <at_sendflag+0x38>
2000145e:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001462:	4789                	li	a5,2
20001464:	12e7e063          	bltu	a5,a4,20001584 <at_sendflag+0x168>
20001468:	4529                	li	a0,10
2000146a:	35dd                	jal	20001350 <at_wait_done>
2000146c:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001470:	c545                	beqz	a0,20001518 <at_sendflag+0xfc>
20001472:	4785                	li	a5,1
20001474:	10e7e163          	bltu	a5,a4,20001576 <at_sendflag+0x15a>
20001478:	4605                	li	a2,1
2000147a:	4591                	li	a1,4
2000147c:	8552                	mv	a0,s4
2000147e:	3705                	jal	2000139e <spi_transceive_one>
20001480:	4529                	li	a0,10
20001482:	35f9                	jal	20001350 <at_wait_done>
20001484:	c545                	beqz	a0,2000152c <at_sendflag+0x110>
20001486:	44a9                	li	s1,10
20001488:	04300c13          	li	s8,67
2000148c:	4b05                	li	s6,1
2000148e:	20002ab7          	lui	s5,0x20002
20001492:	4529                	li	a0,10
20001494:	3d75                	jal	20001350 <at_wait_done>
20001496:	14fd                	addi	s1,s1,-1
20001498:	e509                	bnez	a0,200014a2 <at_sendflag+0x86>
2000149a:	04044783          	lbu	a5,64(s0)
2000149e:	01878f63          	beq	a5,s8,200014bc <at_sendflag+0xa0>
200014a2:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
200014a6:	f88a8513          	addi	a0,s5,-120 # 20001f88 <CSWTCH.4+0xc8>
200014aa:	00fb7463          	bgeu	s6,a5,200014b2 <at_sendflag+0x96>
200014ae:	b06ff0ef          	jal	ra,200007b4 <_puts>
200014b2:	4605                	li	a2,1
200014b4:	4591                	li	a1,4
200014b6:	8552                	mv	a0,s4
200014b8:	35dd                	jal	2000139e <spi_transceive_one>
200014ba:	fce1                	bnez	s1,20001492 <at_sendflag+0x76>
200014bc:	4529                	li	a0,10
200014be:	3d49                	jal	20001350 <at_wait_done>
200014c0:	0e051863          	bnez	a0,200015b0 <at_sendflag+0x194>
200014c4:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
200014c8:	4789                	li	a5,2
200014ca:	08e7e163          	bltu	a5,a4,2000154c <at_sendflag+0x130>
200014ce:	04044783          	lbu	a5,64(s0)
200014d2:	04300713          	li	a4,67
200014d6:	4501                	li	a0,0
200014d8:	02e78463          	beq	a5,a4,20001500 <at_sendflag+0xe4>
200014dc:	4709                	li	a4,2
200014de:	0eeb8e63          	beq	s7,a4,200015da <at_sendflag+0x1be>
200014e2:	4705                	li	a4,1
200014e4:	0eeb8263          	beq	s7,a4,200015c8 <at_sendflag+0x1ac>
200014e8:	853e                	mv	a0,a5
200014ea:	33fd                	jal	200012d8 <_putx>
200014ec:	04144503          	lbu	a0,65(s0)
200014f0:	33e5                	jal	200012d8 <_putx>
200014f2:	04244503          	lbu	a0,66(s0)
200014f6:	33cd                	jal	200012d8 <_putx>
200014f8:	04344503          	lbu	a0,67(s0)
200014fc:	3bf1                	jal	200012d8 <_putx>
200014fe:	4505                	li	a0,1
20001500:	50b2                	lw	ra,44(sp)
20001502:	5422                	lw	s0,40(sp)
20001504:	5492                	lw	s1,36(sp)
20001506:	5902                	lw	s2,32(sp)
20001508:	49f2                	lw	s3,28(sp)
2000150a:	4a62                	lw	s4,24(sp)
2000150c:	4ad2                	lw	s5,20(sp)
2000150e:	4b42                	lw	s6,16(sp)
20001510:	4bb2                	lw	s7,12(sp)
20001512:	4c22                	lw	s8,8(sp)
20001514:	6145                	addi	sp,sp,48
20001516:	8082                	ret
20001518:	4789                	li	a5,2
2000151a:	f4e7ffe3          	bgeu	a5,a4,20001478 <at_sendflag+0x5c>
2000151e:	20002537          	lui	a0,0x20002
20001522:	f7450513          	addi	a0,a0,-140 # 20001f74 <CSWTCH.4+0xb4>
20001526:	a8eff0ef          	jal	ra,200007b4 <_puts>
2000152a:	b7b9                	j	20001478 <at_sendflag+0x5c>
2000152c:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001530:	4789                	li	a5,2
20001532:	f8e7fee3          	bgeu	a5,a4,200014ce <at_sendflag+0xb2>
20001536:	20002537          	lui	a0,0x20002
2000153a:	fd850513          	addi	a0,a0,-40 # 20001fd8 <CSWTCH.4+0x118>
2000153e:	a76ff0ef          	jal	ra,200007b4 <_puts>
20001542:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001546:	4789                	li	a5,2
20001548:	f8e7f3e3          	bgeu	a5,a4,200014ce <at_sendflag+0xb2>
2000154c:	20002537          	lui	a0,0x20002
20001550:	fec50513          	addi	a0,a0,-20 # 20001fec <CSWTCH.4+0x12c>
20001554:	a60ff0ef          	jal	ra,200007b4 <_puts>
20001558:	00498493          	addi	s1,s3,4
2000155c:	0009c503          	lbu	a0,0(s3)
20001560:	0985                	addi	s3,s3,1
20001562:	3b9d                	jal	200012d8 <_putx>
20001564:	fe999ce3          	bne	s3,s1,2000155c <at_sendflag+0x140>
20001568:	20002537          	lui	a0,0x20002
2000156c:	fd450513          	addi	a0,a0,-44 # 20001fd4 <CSWTCH.4+0x114>
20001570:	a44ff0ef          	jal	ra,200007b4 <_puts>
20001574:	bfa9                	j	200014ce <at_sendflag+0xb2>
20001576:	20002537          	lui	a0,0x20002
2000157a:	f4c50513          	addi	a0,a0,-180 # 20001f4c <CSWTCH.4+0x8c>
2000157e:	a36ff0ef          	jal	ra,200007b4 <_puts>
20001582:	bddd                	j	20001478 <at_sendflag+0x5c>
20001584:	20002537          	lui	a0,0x20002
20001588:	f3c50513          	addi	a0,a0,-196 # 20001f3c <CSWTCH.4+0x7c>
2000158c:	a28ff0ef          	jal	ra,200007b4 <_puts>
20001590:	84a2                	mv	s1,s0
20001592:	00440a93          	addi	s5,s0,4
20001596:	0004c503          	lbu	a0,0(s1)
2000159a:	0485                	addi	s1,s1,1
2000159c:	3b35                	jal	200012d8 <_putx>
2000159e:	fe9a9ce3          	bne	s5,s1,20001596 <at_sendflag+0x17a>
200015a2:	20002537          	lui	a0,0x20002
200015a6:	fd450513          	addi	a0,a0,-44 # 20001fd4 <CSWTCH.4+0x114>
200015aa:	a0aff0ef          	jal	ra,200007b4 <_puts>
200015ae:	bd6d                	j	20001468 <at_sendflag+0x4c>
200015b0:	20002537          	lui	a0,0x20002
200015b4:	fb050513          	addi	a0,a0,-80 # 20001fb0 <CSWTCH.4+0xf0>
200015b8:	9fcff0ef          	jal	ra,200007b4 <_puts>
200015bc:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
200015c0:	4789                	li	a5,2
200015c2:	f0e7f6e3          	bgeu	a5,a4,200014ce <at_sendflag+0xb2>
200015c6:	b759                	j	2000154c <at_sendflag+0x130>
200015c8:	20002537          	lui	a0,0x20002
200015cc:	01050513          	addi	a0,a0,16 # 20002010 <CSWTCH.4+0x150>
200015d0:	9e4ff0ef          	jal	ra,200007b4 <_puts>
200015d4:	04044783          	lbu	a5,64(s0)
200015d8:	bf01                	j	200014e8 <at_sendflag+0xcc>
200015da:	20002537          	lui	a0,0x20002
200015de:	ffc50513          	addi	a0,a0,-4 # 20001ffc <CSWTCH.4+0x13c>
200015e2:	9d2ff0ef          	jal	ra,200007b4 <_puts>
200015e6:	04044783          	lbu	a5,64(s0)
200015ea:	bdfd                	j	200014e8 <at_sendflag+0xcc>

200015ec <at_send>:
200015ec:	7179                	addi	sp,sp,-48
200015ee:	cc52                	sw	s4,24(sp)
200015f0:	8a2a                	mv	s4,a0
200015f2:	852e                	mv	a0,a1
200015f4:	d422                	sw	s0,40(sp)
200015f6:	ce4e                	sw	s3,28(sp)
200015f8:	ca56                	sw	s5,20(sp)
200015fa:	c85a                	sw	s6,16(sp)
200015fc:	d606                	sw	ra,44(sp)
200015fe:	d226                	sw	s1,36(sp)
20001600:	d04a                	sw	s2,32(sp)
20001602:	c65e                	sw	s7,12(sp)
20001604:	c462                	sw	s8,8(sp)
20001606:	8aae                	mv	s5,a1
20001608:	8b32                	mv	s6,a2
2000160a:	798000ef          	jal	ra,20001da2 <strlen>
2000160e:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
20001612:	89aa                	mv	s3,a0
20001614:	e3dd                	bnez	a5,200016ba <at_send+0xce>
20001616:	4589                	li	a1,2
20001618:	8552                	mv	a0,s4
2000161a:	3509                	jal	2000141c <at_sendflag>
2000161c:	892a                	mv	s2,a0
2000161e:	e149                	bnez	a0,200016a0 <at_send+0xb4>
20001620:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001624:	4789                	li	a5,2
20001626:	0ee7ef63          	bltu	a5,a4,20001724 <at_send+0x138>
2000162a:	01099b93          	slli	s7,s3,0x10
2000162e:	410bdb93          	srai	s7,s7,0x10
20001632:	88818493          	addi	s1,gp,-1912 # 80000608 <tx_buf>
20001636:	407bd793          	srai	a5,s7,0x7
2000163a:	00f480a3          	sb	a5,1(s1)
2000163e:	6791                	lui	a5,0x4
20001640:	10078793          	addi	a5,a5,256 # 4100 <_prog_start-0x1fffbf00>
20001644:	00f49123          	sh	a5,2(s1)
20001648:	07f9f993          	andi	s3,s3,127
2000164c:	4605                	li	a2,1
2000164e:	4591                	li	a1,4
20001650:	8552                	mv	a0,s4
20001652:	01348023          	sb	s3,0(s1)
20001656:	33a1                	jal	2000139e <spi_transceive_one>
20001658:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
2000165c:	4789                	li	a5,2
2000165e:	0ce7ea63          	bltu	a5,a4,20001732 <at_send+0x146>
20001662:	855a                	mv	a0,s6
20001664:	31f5                	jal	20001350 <at_wait_done>
20001666:	e13d                	bnez	a0,200016cc <at_send+0xe0>
20001668:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
2000166c:	4789                	li	a5,2
2000166e:	0ce7ed63          	bltu	a5,a4,20001748 <at_send+0x15c>
20001672:	0404c703          	lbu	a4,64(s1)
20001676:	06200793          	li	a5,98
2000167a:	06f70563          	beq	a4,a5,200016e4 <at_send+0xf8>
2000167e:	20002537          	lui	a0,0x20002
20001682:	06450513          	addi	a0,a0,100 # 20002064 <CSWTCH.4+0x1a4>
20001686:	04048413          	addi	s0,s1,64
2000168a:	92aff0ef          	jal	ra,200007b4 <_puts>
2000168e:	04448493          	addi	s1,s1,68
20001692:	00044503          	lbu	a0,0(s0)
20001696:	0405                	addi	s0,s0,1
20001698:	3181                	jal	200012d8 <_putx>
2000169a:	fe941ce3          	bne	s0,s1,20001692 <at_send+0xa6>
2000169e:	4905                	li	s2,1
200016a0:	50b2                	lw	ra,44(sp)
200016a2:	5422                	lw	s0,40(sp)
200016a4:	854a                	mv	a0,s2
200016a6:	5492                	lw	s1,36(sp)
200016a8:	5902                	lw	s2,32(sp)
200016aa:	49f2                	lw	s3,28(sp)
200016ac:	4a62                	lw	s4,24(sp)
200016ae:	4ad2                	lw	s5,20(sp)
200016b0:	4b42                	lw	s6,16(sp)
200016b2:	4bb2                	lw	s7,12(sp)
200016b4:	4c22                	lw	s8,8(sp)
200016b6:	6145                	addi	sp,sp,48
200016b8:	8082                	ret
200016ba:	8556                	mv	a0,s5
200016bc:	3989                	jal	2000130e <_putnps>
200016be:	20002537          	lui	a0,0x20002
200016c2:	02450513          	addi	a0,a0,36 # 20002024 <CSWTCH.4+0x164>
200016c6:	8eeff0ef          	jal	ra,200007b4 <_puts>
200016ca:	b7b1                	j	20001616 <at_send+0x2a>
200016cc:	20002537          	lui	a0,0x20002
200016d0:	03450513          	addi	a0,a0,52 # 20002034 <CSWTCH.4+0x174>
200016d4:	8e0ff0ef          	jal	ra,200007b4 <_puts>
200016d8:	0404c703          	lbu	a4,64(s1)
200016dc:	06200793          	li	a5,98
200016e0:	f8f71fe3          	bne	a4,a5,2000167e <at_send+0x92>
200016e4:	865e                	mv	a2,s7
200016e6:	85d6                	mv	a1,s5
200016e8:	88818513          	addi	a0,gp,-1912 # 80000608 <tx_buf>
200016ec:	6f2000ef          	jal	ra,20001dde <strncpy>
200016f0:	4605                	li	a2,1
200016f2:	85de                	mv	a1,s7
200016f4:	8552                	mv	a0,s4
200016f6:	3165                	jal	2000139e <spi_transceive_one>
200016f8:	0404c703          	lbu	a4,64(s1)
200016fc:	04300793          	li	a5,67
20001700:	04f70b63          	beq	a4,a5,20001756 <at_send+0x16a>
20001704:	855a                	mv	a0,s6
20001706:	31a9                	jal	20001350 <at_wait_done>
20001708:	ed39                	bnez	a0,20001766 <at_send+0x17a>
2000170a:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
2000170e:	4789                	li	a5,2
20001710:	4901                	li	s2,0
20001712:	f8e7f7e3          	bgeu	a5,a4,200016a0 <at_send+0xb4>
20001716:	20002537          	lui	a0,0x20002
2000171a:	0a450513          	addi	a0,a0,164 # 200020a4 <CSWTCH.4+0x1e4>
2000171e:	896ff0ef          	jal	ra,200007b4 <_puts>
20001722:	bfbd                	j	200016a0 <at_send+0xb4>
20001724:	20002537          	lui	a0,0x20002
20001728:	02850513          	addi	a0,a0,40 # 20002028 <CSWTCH.4+0x168>
2000172c:	888ff0ef          	jal	ra,200007b4 <_puts>
20001730:	bded                	j	2000162a <at_send+0x3e>
20001732:	20002537          	lui	a0,0x20002
20001736:	05450513          	addi	a0,a0,84 # 20002054 <CSWTCH.4+0x194>
2000173a:	87aff0ef          	jal	ra,200007b4 <_puts>
2000173e:	855a                	mv	a0,s6
20001740:	3901                	jal	20001350 <at_wait_done>
20001742:	f20503e3          	beqz	a0,20001668 <at_send+0x7c>
20001746:	b759                	j	200016cc <at_send+0xe0>
20001748:	20002537          	lui	a0,0x20002
2000174c:	05050513          	addi	a0,a0,80 # 20002050 <CSWTCH.4+0x190>
20001750:	864ff0ef          	jal	ra,200007b4 <_puts>
20001754:	bf39                	j	20001672 <at_send+0x86>
20001756:	20002537          	lui	a0,0x20002
2000175a:	07850513          	addi	a0,a0,120 # 20002078 <CSWTCH.4+0x1b8>
2000175e:	856ff0ef          	jal	ra,200007b4 <_puts>
20001762:	4905                	li	s2,1
20001764:	bf35                	j	200016a0 <at_send+0xb4>
20001766:	20002537          	lui	a0,0x20002
2000176a:	08c50513          	addi	a0,a0,140 # 2000208c <CSWTCH.4+0x1cc>
2000176e:	846ff0ef          	jal	ra,200007b4 <_puts>
20001772:	b73d                	j	200016a0 <at_send+0xb4>

20001774 <at_recv_one>:
20001774:	7139                	addi	sp,sp,-64
20001776:	da26                	sw	s1,52(sp)
20001778:	88818493          	addi	s1,gp,-1912 # 80000608 <tx_buf>
2000177c:	d84a                	sw	s2,48(sp)
2000177e:	d64e                	sw	s3,44(sp)
20001780:	d256                	sw	s5,36(sp)
20001782:	ce5e                	sw	s7,28(sp)
20001784:	cc62                	sw	s8,24(sp)
20001786:	c86a                	sw	s10,16(sp)
20001788:	c66e                	sw	s11,12(sp)
2000178a:	de06                	sw	ra,60(sp)
2000178c:	dc22                	sw	s0,56(sp)
2000178e:	d452                	sw	s4,40(sp)
20001790:	d05a                	sw	s6,32(sp)
20001792:	ca66                	sw	s9,20(sp)
20001794:	8aaa                	mv	s5,a0
20001796:	4981                	li	s3,0
20001798:	20002d37          	lui	s10,0x20002
2000179c:	04048d93          	addi	s11,s1,64
200017a0:	04448b93          	addi	s7,s1,68
200017a4:	20002c37          	lui	s8,0x20002
200017a8:	8441a683          	lw	a3,-1980(gp) # 800005c4 <esp32_diag_mode>
200017ac:	4789                	li	a5,2
200017ae:	00d7f663          	bgeu	a5,a3,200017ba <at_recv_one+0x46>
200017b2:	0b0d0513          	addi	a0,s10,176 # 200020b0 <CSWTCH.4+0x1f0>
200017b6:	ffffe0ef          	jal	ra,200007b4 <_puts>
200017ba:	4585                	li	a1,1
200017bc:	8556                	mv	a0,s5
200017be:	39b9                	jal	2000141c <at_sendflag>
200017c0:	8a2a                	mv	s4,a0
200017c2:	14051a63          	bnez	a0,20001916 <at_recv_one+0x1a2>
200017c6:	8441a683          	lw	a3,-1980(gp) # 800005c4 <esp32_diag_mode>
200017ca:	4789                	li	a5,2
200017cc:	16d7e563          	bltu	a5,a3,20001936 <at_recv_one+0x1c2>
200017d0:	8b6e                	mv	s6,s11
200017d2:	0c048793          	addi	a5,s1,192
200017d6:	846e                	mv	s0,s11
200017d8:	00040023          	sb	zero,0(s0)
200017dc:	0405                	addi	s0,s0,1
200017de:	fef41de3          	bne	s0,a5,200017d8 <at_recv_one+0x64>
200017e2:	87a6                	mv	a5,s1
200017e4:	00078023          	sb	zero,0(a5)
200017e8:	0785                	addi	a5,a5,1
200017ea:	ffb79de3          	bne	a5,s11,200017e4 <at_recv_one+0x70>
200017ee:	4605                	li	a2,1
200017f0:	4591                	li	a1,4
200017f2:	8556                	mv	a0,s5
200017f4:	366d                	jal	2000139e <spi_transceive_one>
200017f6:	06400513          	li	a0,100
200017fa:	3e99                	jal	20001350 <at_wait_done>
200017fc:	e525                	bnez	a0,20001864 <at_recv_one+0xf0>
200017fe:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
20001802:	4689                	li	a3,2
20001804:	14f6e063          	bltu	a3,a5,20001944 <at_recv_one+0x1d0>
20001808:	0434c603          	lbu	a2,67(s1)
2000180c:	04200693          	li	a3,66
20001810:	08d60e63          	beq	a2,a3,200018ac <at_recv_one+0x138>
20001814:	4405                	li	s0,1
20001816:	00f46b63          	bltu	s0,a5,2000182c <at_recv_one+0xb8>
2000181a:	47a5                	li	a5,9
2000181c:	12f98b63          	beq	s3,a5,20001952 <at_recv_one+0x1de>
20001820:	06400513          	li	a0,100
20001824:	a5eff0ef          	jal	ra,20000a82 <wait_ms>
20001828:	0985                	addi	s3,s3,1
2000182a:	bfbd                	j	200017a8 <at_recv_one+0x34>
2000182c:	20002537          	lui	a0,0x20002
20001830:	11c50513          	addi	a0,a0,284 # 2000211c <CSWTCH.4+0x25c>
20001834:	f81fe0ef          	jal	ra,200007b4 <_puts>
20001838:	0434c503          	lbu	a0,67(s1)
2000183c:	e2dfe0ef          	jal	ra,20000668 <_putc>
20001840:	fd4c0513          	addi	a0,s8,-44 # 20001fd4 <CSWTCH.4+0x114>
20001844:	f71fe0ef          	jal	ra,200007b4 <_puts>
20001848:	47a5                	li	a5,9
2000184a:	10f98463          	beq	s3,a5,20001952 <at_recv_one+0x1de>
2000184e:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
20001852:	fcf477e3          	bgeu	s0,a5,20001820 <at_recv_one+0xac>
20001856:	20002537          	lui	a0,0x20002
2000185a:	13050513          	addi	a0,a0,304 # 20002130 <CSWTCH.4+0x270>
2000185e:	f57fe0ef          	jal	ra,200007b4 <_puts>
20001862:	bf7d                	j	20001820 <at_recv_one+0xac>
20001864:	20002537          	lui	a0,0x20002
20001868:	0d450513          	addi	a0,a0,212 # 200020d4 <CSWTCH.4+0x214>
2000186c:	f49fe0ef          	jal	ra,200007b4 <_puts>
20001870:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
20001874:	4689                	li	a3,2
20001876:	f8f6f9e3          	bgeu	a3,a5,20001808 <at_recv_one+0x94>
2000187a:	200027b7          	lui	a5,0x20002
2000187e:	10878513          	addi	a0,a5,264 # 20002108 <CSWTCH.4+0x248>
20001882:	f33fe0ef          	jal	ra,200007b4 <_puts>
20001886:	8cee                	mv	s9,s11
20001888:	000cc503          	lbu	a0,0(s9)
2000188c:	0c85                	addi	s9,s9,1
2000188e:	34a9                	jal	200012d8 <_putx>
20001890:	ff7c9ce3          	bne	s9,s7,20001888 <at_recv_one+0x114>
20001894:	fd4c0513          	addi	a0,s8,-44
20001898:	f1dfe0ef          	jal	ra,200007b4 <_puts>
2000189c:	0434c603          	lbu	a2,67(s1)
200018a0:	04200693          	li	a3,66
200018a4:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
200018a8:	f6d616e3          	bne	a2,a3,20001814 <at_recv_one+0xa0>
200018ac:	0414c983          	lbu	s3,65(s1)
200018b0:	0404c603          	lbu	a2,64(s1)
200018b4:	4685                	li	a3,1
200018b6:	099e                	slli	s3,s3,0x7
200018b8:	99b2                	add	s3,s3,a2
200018ba:	08f6ee63          	bltu	a3,a5,20001956 <at_recv_one+0x1e2>
200018be:	87ee                	mv	a5,s11
200018c0:	00078023          	sb	zero,0(a5)
200018c4:	0785                	addi	a5,a5,1
200018c6:	fe879de3          	bne	a5,s0,200018c0 <at_recv_one+0x14c>
200018ca:	4601                	li	a2,0
200018cc:	85ce                	mv	a1,s3
200018ce:	8556                	mv	a0,s5
200018d0:	34f9                	jal	2000139e <spi_transceive_one>
200018d2:	8441a683          	lw	a3,-1980(gp) # 800005c4 <esp32_diag_mode>
200018d6:	94ce                	add	s1,s1,s3
200018d8:	04048023          	sb	zero,64(s1)
200018dc:	4785                	li	a5,1
200018de:	02d7fc63          	bgeu	a5,a3,20001916 <at_recv_one+0x1a2>
200018e2:	20002537          	lui	a0,0x20002
200018e6:	15450513          	addi	a0,a0,340 # 20002154 <CSWTCH.4+0x294>
200018ea:	ecbfe0ef          	jal	ra,200007b4 <_puts>
200018ee:	00098e63          	beqz	s3,2000190a <at_recv_one+0x196>
200018f2:	99ee                	add	s3,s3,s11
200018f4:	000b4503          	lbu	a0,0(s6)
200018f8:	0b05                	addi	s6,s6,1
200018fa:	ef7fe0ef          	jal	ra,200007f0 <_puti>
200018fe:	02000513          	li	a0,32
20001902:	d67fe0ef          	jal	ra,20000668 <_putc>
20001906:	ff3b17e3          	bne	s6,s3,200018f4 <at_recv_one+0x180>
2000190a:	20002537          	lui	a0,0x20002
2000190e:	fd450513          	addi	a0,a0,-44 # 20001fd4 <CSWTCH.4+0x114>
20001912:	ea3fe0ef          	jal	ra,200007b4 <_puts>
20001916:	50f2                	lw	ra,60(sp)
20001918:	5462                	lw	s0,56(sp)
2000191a:	8552                	mv	a0,s4
2000191c:	54d2                	lw	s1,52(sp)
2000191e:	5942                	lw	s2,48(sp)
20001920:	59b2                	lw	s3,44(sp)
20001922:	5a22                	lw	s4,40(sp)
20001924:	5a92                	lw	s5,36(sp)
20001926:	5b02                	lw	s6,32(sp)
20001928:	4bf2                	lw	s7,28(sp)
2000192a:	4c62                	lw	s8,24(sp)
2000192c:	4cd2                	lw	s9,20(sp)
2000192e:	4d42                	lw	s10,16(sp)
20001930:	4db2                	lw	s11,12(sp)
20001932:	6121                	addi	sp,sp,64
20001934:	8082                	ret
20001936:	200027b7          	lui	a5,0x20002
2000193a:	0c478513          	addi	a0,a5,196 # 200020c4 <CSWTCH.4+0x204>
2000193e:	e77fe0ef          	jal	ra,200007b4 <_puts>
20001942:	b579                	j	200017d0 <at_recv_one+0x5c>
20001944:	20002537          	lui	a0,0x20002
20001948:	0f450513          	addi	a0,a0,244 # 200020f4 <CSWTCH.4+0x234>
2000194c:	e69fe0ef          	jal	ra,200007b4 <_puts>
20001950:	b705                	j	20001870 <at_recv_one+0xfc>
20001952:	4a05                	li	s4,1
20001954:	b7c9                	j	20001916 <at_recv_one+0x1a2>
20001956:	20002537          	lui	a0,0x20002
2000195a:	14050513          	addi	a0,a0,320 # 20002140 <CSWTCH.4+0x280>
2000195e:	e57fe0ef          	jal	ra,200007b4 <_puts>
20001962:	854e                	mv	a0,s3
20001964:	e8dfe0ef          	jal	ra,200007f0 <_puti>
20001968:	02000513          	li	a0,32
2000196c:	cfdfe0ef          	jal	ra,20000668 <_putc>
20001970:	20002537          	lui	a0,0x20002
20001974:	fd450513          	addi	a0,a0,-44 # 20001fd4 <CSWTCH.4+0x114>
20001978:	e3dfe0ef          	jal	ra,200007b4 <_puts>
2000197c:	b789                	j	200018be <at_recv_one+0x14a>

2000197e <at_recv>:
2000197e:	7179                	addi	sp,sp,-48
20001980:	ce4e                	sw	s3,28(sp)
20001982:	cc52                	sw	s4,24(sp)
20001984:	d226                	sw	s1,36(sp)
20001986:	ca56                	sw	s5,20(sp)
20001988:	c85a                	sw	s6,16(sp)
2000198a:	c65e                	sw	s7,12(sp)
2000198c:	c462                	sw	s8,8(sp)
2000198e:	d606                	sw	ra,44(sp)
20001990:	d422                	sw	s0,40(sp)
20001992:	d04a                	sw	s2,32(sp)
20001994:	8baa                	mv	s7,a0
20001996:	03100493          	li	s1,49
2000199a:	8c818993          	addi	s3,gp,-1848 # 80000648 <rx_buf>
2000199e:	20002c37          	lui	s8,0x20002
200019a2:	8c818a13          	addi	s4,gp,-1848 # 80000648 <rx_buf>
200019a6:	20002b37          	lui	s6,0x20002
200019aa:	a835                	j	200019e6 <at_recv+0x68>
200019ac:	e3c1                	bnez	a5,20001a2c <at_recv+0xae>
200019ae:	200025b7          	lui	a1,0x20002
200019b2:	4619                	li	a2,6
200019b4:	19058593          	addi	a1,a1,400 # 20002190 <CSWTCH.4+0x2d0>
200019b8:	8522                	mv	a0,s0
200019ba:	2eed                	jal	20001db4 <strncmp>
200019bc:	200025b7          	lui	a1,0x20002
200019c0:	4619                	li	a2,6
200019c2:	1a458593          	addi	a1,a1,420 # 200021a4 <CSWTCH.4+0x2e4>
200019c6:	14fd                	addi	s1,s1,-1
200019c8:	cd49                	beqz	a0,20001a62 <at_recv+0xe4>
200019ca:	8522                	mv	a0,s0
200019cc:	26e5                	jal	20001db4 <strncmp>
200019ce:	200025b7          	lui	a1,0x20002
200019d2:	4619                	li	a2,6
200019d4:	1bc58593          	addi	a1,a1,444 # 200021bc <CSWTCH.4+0x2fc>
200019d8:	c14d                	beqz	a0,20001a7a <at_recv+0xfc>
200019da:	8522                	mv	a0,s0
200019dc:	2ee1                	jal	20001db4 <strncmp>
200019de:	57fd                	li	a5,-1
200019e0:	c955                	beqz	a0,20001a94 <at_recv+0x116>
200019e2:	06f48363          	beq	s1,a5,20001a48 <at_recv+0xca>
200019e6:	855e                	mv	a0,s7
200019e8:	3371                	jal	20001774 <at_recv_one>
200019ea:	892a                	mv	s2,a0
200019ec:	4705                	li	a4,1
200019ee:	178b0513          	addi	a0,s6,376 # 20002178 <CSWTCH.4+0x2b8>
200019f2:	04091563          	bnez	s2,20001a3c <at_recv+0xbe>
200019f6:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
200019fa:	8452                	mv	s0,s4
200019fc:	faf778e3          	bgeu	a4,a5,200019ac <at_recv+0x2e>
20001a00:	db5fe0ef          	jal	ra,200007b4 <_puts>
20001a04:	8526                	mv	a0,s1
20001a06:	debfe0ef          	jal	ra,200007f0 <_puti>
20001a0a:	03a00513          	li	a0,58
20001a0e:	c5bfe0ef          	jal	ra,20000668 <_putc>
20001a12:	02000513          	li	a0,32
20001a16:	c53fe0ef          	jal	ra,20000668 <_putc>
20001a1a:	854e                	mv	a0,s3
20001a1c:	d99fe0ef          	jal	ra,200007b4 <_puts>
20001a20:	fd4c0513          	addi	a0,s8,-44 # 20001fd4 <CSWTCH.4+0x114>
20001a24:	844e                	mv	s0,s3
20001a26:	d8ffe0ef          	jal	ra,200007b4 <_puts>
20001a2a:	b751                	j	200019ae <at_recv+0x30>
20001a2c:	854e                	mv	a0,s3
20001a2e:	30c5                	jal	2000130e <_putnps>
20001a30:	fd4c0513          	addi	a0,s8,-44
20001a34:	844e                	mv	s0,s3
20001a36:	d7ffe0ef          	jal	ra,200007b4 <_puts>
20001a3a:	bf95                	j	200019ae <at_recv+0x30>
20001a3c:	20002537          	lui	a0,0x20002
20001a40:	16850513          	addi	a0,a0,360 # 20002168 <CSWTCH.4+0x2a8>
20001a44:	d71fe0ef          	jal	ra,200007b4 <_puts>
20001a48:	50b2                	lw	ra,44(sp)
20001a4a:	5422                	lw	s0,40(sp)
20001a4c:	854a                	mv	a0,s2
20001a4e:	5492                	lw	s1,36(sp)
20001a50:	5902                	lw	s2,32(sp)
20001a52:	49f2                	lw	s3,28(sp)
20001a54:	4a62                	lw	s4,24(sp)
20001a56:	4ad2                	lw	s5,20(sp)
20001a58:	4b42                	lw	s6,16(sp)
20001a5a:	4bb2                	lw	s7,12(sp)
20001a5c:	4c22                	lw	s8,8(sp)
20001a5e:	6145                	addi	sp,sp,48
20001a60:	8082                	ret
20001a62:	8441a783          	lw	a5,-1980(gp) # 800005c4 <esp32_diag_mode>
20001a66:	4905                	li	s2,1
20001a68:	fef970e3          	bgeu	s2,a5,20001a48 <at_recv+0xca>
20001a6c:	20002537          	lui	a0,0x20002
20001a70:	19850513          	addi	a0,a0,408 # 20002198 <CSWTCH.4+0x2d8>
20001a74:	d41fe0ef          	jal	ra,200007b4 <_puts>
20001a78:	bfc1                	j	20001a48 <at_recv+0xca>
20001a7a:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001a7e:	4785                	li	a5,1
20001a80:	4909                	li	s2,2
20001a82:	fce7f3e3          	bgeu	a5,a4,20001a48 <at_recv+0xca>
20001a86:	20002537          	lui	a0,0x20002
20001a8a:	1b050513          	addi	a0,a0,432 # 200021b0 <CSWTCH.4+0x2f0>
20001a8e:	d27fe0ef          	jal	ra,200007b4 <_puts>
20001a92:	bf5d                	j	20001a48 <at_recv+0xca>
20001a94:	8441a703          	lw	a4,-1980(gp) # 800005c4 <esp32_diag_mode>
20001a98:	4785                	li	a5,1
20001a9a:	597d                	li	s2,-1
20001a9c:	fae7f6e3          	bgeu	a5,a4,20001a48 <at_recv+0xca>
20001aa0:	20002537          	lui	a0,0x20002
20001aa4:	1c850513          	addi	a0,a0,456 # 200021c8 <CSWTCH.4+0x308>
20001aa8:	d0dfe0ef          	jal	ra,200007b4 <_puts>
20001aac:	bf71                	j	20001a48 <at_recv+0xca>

20001aae <at_sendrecv>:
20001aae:	1141                	addi	sp,sp,-16
20001ab0:	c422                	sw	s0,8(sp)
20001ab2:	c606                	sw	ra,12(sp)
20001ab4:	842a                	mv	s0,a0
20001ab6:	3e1d                	jal	200015ec <at_send>
20001ab8:	c509                	beqz	a0,20001ac2 <at_sendrecv+0x14>
20001aba:	40b2                	lw	ra,12(sp)
20001abc:	4422                	lw	s0,8(sp)
20001abe:	0141                	addi	sp,sp,16
20001ac0:	8082                	ret
20001ac2:	8522                	mv	a0,s0
20001ac4:	4422                	lw	s0,8(sp)
20001ac6:	40b2                	lw	ra,12(sp)
20001ac8:	0141                	addi	sp,sp,16
20001aca:	bd55                	j	2000197e <at_recv>

20001acc <esp32_init>:
# gpio
20001acc:	100127b7          	lui	a5,0x10012 # 0x10012000 GPIO
20001ad0:	5fd4                	lw	a3,60(a5) # iof_sel
20001ad2:	1141                	addi	sp,sp,-16 # function stuff
20001ad4:	c606                	sw	ra,12(sp) # function stuff
20001ad6:	c422                	sw	s0,8(sp) # function stuff
20001ad8:	9add                	andi	a3,a3,-9 # iof_sel & ~(SPI1_DQ0)
20001ada:	dfd4                	sw	a3,60(a5) # iof_sel & ~(SPI1_DQ0) write
20001adc:	5fd4                	lw	a3,60(a5) # iof_sel
20001ade:	10024737          	lui	a4,0x10024 # 0x10024000 SPI1
20001ae2:	9abd                	andi	a3,a3,-17 # iof_sel & ~(SPI1_DQ1)
20001ae4:	dfd4                	sw	a3,60(a5) # iof_sel & ~(SPI1_DQ1) write
20001ae6:	5fd0                	lw	a2,60(a5) # iof_sel
20001ae8:	100246b7          	lui	a3,0x10024 # 0x10024000 SPI1
20001aec:	fdf67613          	andi	a2,a2,-33 # iof_setl & ~(SPI1_SCK)
20001af0:	dfd0                	sw	a2,60(a5) # iof_setl & ~(SPI1_SCK) write
20001af2:	5fd0                	lw	a2,60(a5) # iof_sel
20001af4:	dff67613          	andi	a2,a2,-513 # iof_setl & ~(SPI1_CS2)
20001af8:	dfd0                	sw	a2,60(a5) # iof_setl & ~(SPI1_CS2) write
20001afa:	5f90                	lw	a2,56(a5) # iof_en
20001afc:	00866613          	ori	a2,a2,8 # enable iof on pin 3 (SPI1_DQ0)
20001b00:	df90                	sw	a2,56(a5) # enable iof on pin 3 (SPI1_DQ0) write
20001b02:	5f90                	lw	a2,56(a5) # iof_en
20001b04:	01066613          	ori	a2,a2,16 # enable iof on pin 4 (SPI1_DQ1)
20001b08:	df90                	sw	a2,56(a5) # enable iof on pin 4 (SPI1_DQ1)
20001b0a:	5f90                	lw	a2,56(a5) # iof_en
20001b0c:	02066613          	ori	a2,a2,32 # enable iof on pin 5 (SPI1_SCK)
20001b10:	df90                	sw	a2,56(a5) # enable iof on pin 5 (SPI1_SCK)
20001b12:	5f90                	lw	a2,56(a5) # iof_en
20001b14:	20066613          	ori	a2,a2,512 # enable iof on pin 9 (SPI1_CS2)
20001b18:	df90                	sw	a2,56(a5) # enable iof on pin 9 (SPI1_CS2)
20001b1a:	43d0                	lw	a2,4(a5) # input_en
20001b1c:	40066613          	ori	a2,a2,1024 # enable input on pin 10
20001b20:	c3d0                	sw	a2,4(a5) # enable input on pin 10 write
# spi
20001b22:	06400793          	li	a5,100 # sckdiv
20001b26:	c31c                	sw	a5,0(a4) # set sckdiv to 100
20001b28:	000807b7          	lui	a5,0x80
20001b2c:	c33c                	sw	a5,64(a4)
20001b2e:	4789                	li	a5,2
20001b30:	cb1c                	sw	a5,16(a4)
20001b32:	533c                	lw	a5,96(a4)
20001b34:	9bf9                	andi	a5,a5,-2
20001b36:	d33c                	sw	a5,96(a4)
20001b38:	02070623          	sb	zero,44(a4) # 1002402c <_prog_start-0xffdbfd4>
20001b3c:	4f1c                	lw	a5,24(a4)
20001b3e:	9bf1                	andi	a5,a5,-4
20001b40:	cf1c                	sw	a5,24(a4)
20001b42:	46fc                	lw	a5,76(a3)
20001b44:	fef04fe3          	bgtz	a5,20001b42 <esp32_init+0x76>
20001b48:	20002437          	lui	s0,0x20002
20001b4c:	fd440513          	addi	a0,s0,-44 # 20001fd4 <CSWTCH.4+0x114>
20001b50:	c65fe0ef          	jal	ra,200007b4 <_puts>
20001b54:	200025b7          	lui	a1,0x20002
20001b58:	06400613          	li	a2,100
20001b5c:	1d458593          	addi	a1,a1,468 # 200021d4 <CSWTCH.4+0x314>
20001b60:	10024537          	lui	a0,0x10024
20001b64:	37a9                	jal	20001aae <at_sendrecv>
20001b66:	200025b7          	lui	a1,0x20002
20001b6a:	06400613          	li	a2,100
20001b6e:	1dc58593          	addi	a1,a1,476 # 200021dc <CSWTCH.4+0x31c>
20001b72:	10024537          	lui	a0,0x10024
20001b76:	3f25                	jal	20001aae <at_sendrecv>
20001b78:	200025b7          	lui	a1,0x20002
20001b7c:	06400613          	li	a2,100
20001b80:	1ec58593          	addi	a1,a1,492 # 200021ec <CSWTCH.4+0x32c>
20001b84:	10024537          	lui	a0,0x10024
20001b88:	371d                	jal	20001aae <at_sendrecv>
20001b8a:	fd440513          	addi	a0,s0,-44
20001b8e:	c27fe0ef          	jal	ra,200007b4 <_puts>
20001b92:	40b2                	lw	ra,12(sp)
20001b94:	4422                	lw	s0,8(sp)
20001b96:	4501                	li	a0,0
20001b98:	0141                	addi	sp,sp,16
20001b9a:	8082                	ret

20001b9c <_setlocale_r>:
20001b9c:	c621                	beqz	a2,20001be4 <_setlocale_r+0x48>
20001b9e:	1141                	addi	sp,sp,-16
20001ba0:	00000597          	auipc	a1,0x0
20001ba4:	67458593          	addi	a1,a1,1652 # 20002214 <_msg_end+0x9>
20001ba8:	8532                	mv	a0,a2
20001baa:	c422                	sw	s0,8(sp)
20001bac:	c606                	sw	ra,12(sp)
20001bae:	8432                	mv	s0,a2
20001bb0:	28d1                	jal	20001c84 <strcmp>
20001bb2:	c105                	beqz	a0,20001bd2 <_setlocale_r+0x36>
20001bb4:	00000597          	auipc	a1,0x0
20001bb8:	65c58593          	addi	a1,a1,1628 # 20002210 <_msg_end+0x5>
20001bbc:	8522                	mv	a0,s0
20001bbe:	20d9                	jal	20001c84 <strcmp>
20001bc0:	c909                	beqz	a0,20001bd2 <_setlocale_r+0x36>
20001bc2:	00000597          	auipc	a1,0x0
20001bc6:	42658593          	addi	a1,a1,1062 # 20001fe8 <CSWTCH.4+0x128>
20001bca:	8522                	mv	a0,s0
20001bcc:	2865                	jal	20001c84 <strcmp>
20001bce:	4781                	li	a5,0
20001bd0:	e509                	bnez	a0,20001bda <_setlocale_r+0x3e>
20001bd2:	00000797          	auipc	a5,0x0
20001bd6:	63e78793          	addi	a5,a5,1598 # 20002210 <_msg_end+0x5>
20001bda:	40b2                	lw	ra,12(sp)
20001bdc:	4422                	lw	s0,8(sp)
20001bde:	853e                	mv	a0,a5
20001be0:	0141                	addi	sp,sp,16
20001be2:	8082                	ret
20001be4:	00000797          	auipc	a5,0x0
20001be8:	62c78793          	addi	a5,a5,1580 # 20002210 <_msg_end+0x5>
20001bec:	853e                	mv	a0,a5
20001bee:	8082                	ret

20001bf0 <__locale_mb_cur_max>:
20001bf0:	84c18793          	addi	a5,gp,-1972 # 800005cc <_impure_ptr>
20001bf4:	439c                	lw	a5,0(a5)
20001bf6:	5bdc                	lw	a5,52(a5)
20001bf8:	e789                	bnez	a5,20001c02 <__locale_mb_cur_max+0x12>
20001bfa:	5fffe797          	auipc	a5,0x5fffe
20001bfe:	40678793          	addi	a5,a5,1030 # 80000000 <__global_locale>
20001c02:	1287c503          	lbu	a0,296(a5)
20001c06:	8082                	ret

20001c08 <__locale_ctype_ptr_l>:
20001c08:	0ec52503          	lw	a0,236(a0) # 100240ec <_prog_start-0xffdbf14>
20001c0c:	8082                	ret

20001c0e <__locale_ctype_ptr>:
20001c0e:	84c18793          	addi	a5,gp,-1972 # 800005cc <_impure_ptr>
20001c12:	439c                	lw	a5,0(a5)
20001c14:	5bdc                	lw	a5,52(a5)
20001c16:	e789                	bnez	a5,20001c20 <__locale_ctype_ptr+0x12>
20001c18:	5fffe797          	auipc	a5,0x5fffe
20001c1c:	3e878793          	addi	a5,a5,1000 # 80000000 <__global_locale>
20001c20:	0ec7a503          	lw	a0,236(a5)
20001c24:	8082                	ret

20001c26 <setlocale>:
20001c26:	84c18793          	addi	a5,gp,-1972 # 800005cc <_impure_ptr>
20001c2a:	862e                	mv	a2,a1
20001c2c:	85aa                	mv	a1,a0
20001c2e:	4388                	lw	a0,0(a5)
20001c30:	b7b5                	j	20001b9c <_setlocale_r>

20001c32 <_mbtowc_r>:
20001c32:	84c18793          	addi	a5,gp,-1972 # 800005cc <_impure_ptr>
20001c36:	439c                	lw	a5,0(a5)
20001c38:	5bdc                	lw	a5,52(a5)
20001c3a:	e789                	bnez	a5,20001c44 <_mbtowc_r+0x12>
20001c3c:	5fffe797          	auipc	a5,0x5fffe
20001c40:	3c478793          	addi	a5,a5,964 # 80000000 <__global_locale>
20001c44:	0e47a303          	lw	t1,228(a5)
20001c48:	8302                	jr	t1

20001c4a <__ascii_mbtowc>:
20001c4a:	e185                	bnez	a1,20001c6a <__ascii_mbtowc+0x20>
20001c4c:	1141                	addi	sp,sp,-16
20001c4e:	006c                	addi	a1,sp,12
20001c50:	4501                	li	a0,0
20001c52:	ca11                	beqz	a2,20001c66 <__ascii_mbtowc+0x1c>
20001c54:	5579                	li	a0,-2
20001c56:	ca81                	beqz	a3,20001c66 <__ascii_mbtowc+0x1c>
20001c58:	00064783          	lbu	a5,0(a2) # 30000 <_prog_start-0x1ffd0000>
20001c5c:	c19c                	sw	a5,0(a1)
20001c5e:	00064503          	lbu	a0,0(a2)
20001c62:	00a03533          	snez	a0,a0
20001c66:	0141                	addi	sp,sp,16
20001c68:	8082                	ret
20001c6a:	4501                	li	a0,0
20001c6c:	ca19                	beqz	a2,20001c82 <__ascii_mbtowc+0x38>
20001c6e:	5579                	li	a0,-2
20001c70:	ca89                	beqz	a3,20001c82 <__ascii_mbtowc+0x38>
20001c72:	00064783          	lbu	a5,0(a2)
20001c76:	c19c                	sw	a5,0(a1)
20001c78:	00064503          	lbu	a0,0(a2)
20001c7c:	00a03533          	snez	a0,a0
20001c80:	8082                	ret
20001c82:	8082                	ret

20001c84 <strcmp>:
20001c84:	00b56733          	or	a4,a0,a1
20001c88:	53fd                	li	t2,-1
20001c8a:	8b0d                	andi	a4,a4,3
20001c8c:	e779                	bnez	a4,20001d5a <strcmp+0xd6>
20001c8e:	7f7f87b7          	lui	a5,0x7f7f8
20001c92:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_data_lma+0x5f7f5c3f>
20001c96:	4110                	lw	a2,0(a0)
20001c98:	4194                	lw	a3,0(a1)
20001c9a:	00f672b3          	and	t0,a2,a5
20001c9e:	00f66333          	or	t1,a2,a5
20001ca2:	92be                	add	t0,t0,a5
20001ca4:	0062e2b3          	or	t0,t0,t1
20001ca8:	0c729763          	bne	t0,t2,20001d76 <strcmp+0xf2>
20001cac:	06d61863          	bne	a2,a3,20001d1c <strcmp+0x98>
20001cb0:	4150                	lw	a2,4(a0)
20001cb2:	41d4                	lw	a3,4(a1)
20001cb4:	00f672b3          	and	t0,a2,a5
20001cb8:	00f66333          	or	t1,a2,a5
20001cbc:	92be                	add	t0,t0,a5
20001cbe:	0062e2b3          	or	t0,t0,t1
20001cc2:	0a729863          	bne	t0,t2,20001d72 <strcmp+0xee>
20001cc6:	04d61b63          	bne	a2,a3,20001d1c <strcmp+0x98>
20001cca:	4510                	lw	a2,8(a0)
20001ccc:	4594                	lw	a3,8(a1)
20001cce:	00f672b3          	and	t0,a2,a5
20001cd2:	00f66333          	or	t1,a2,a5
20001cd6:	92be                	add	t0,t0,a5
20001cd8:	0062e2b3          	or	t0,t0,t1
20001cdc:	0a729163          	bne	t0,t2,20001d7e <strcmp+0xfa>
20001ce0:	02d61e63          	bne	a2,a3,20001d1c <strcmp+0x98>
20001ce4:	4550                	lw	a2,12(a0)
20001ce6:	45d4                	lw	a3,12(a1)
20001ce8:	00f672b3          	and	t0,a2,a5
20001cec:	00f66333          	or	t1,a2,a5
20001cf0:	92be                	add	t0,t0,a5
20001cf2:	0062e2b3          	or	t0,t0,t1
20001cf6:	08729a63          	bne	t0,t2,20001d8a <strcmp+0x106>
20001cfa:	02d61163          	bne	a2,a3,20001d1c <strcmp+0x98>
20001cfe:	4910                	lw	a2,16(a0)
20001d00:	4994                	lw	a3,16(a1)
20001d02:	00f672b3          	and	t0,a2,a5
20001d06:	00f66333          	or	t1,a2,a5
20001d0a:	92be                	add	t0,t0,a5
20001d0c:	0062e2b3          	or	t0,t0,t1
20001d10:	08729363          	bne	t0,t2,20001d96 <strcmp+0x112>
20001d14:	0551                	addi	a0,a0,20
20001d16:	05d1                	addi	a1,a1,20
20001d18:	f6d60fe3          	beq	a2,a3,20001c96 <strcmp+0x12>
20001d1c:	01061713          	slli	a4,a2,0x10
20001d20:	01069793          	slli	a5,a3,0x10
20001d24:	00f71c63          	bne	a4,a5,20001d3c <strcmp+0xb8>
20001d28:	01065713          	srli	a4,a2,0x10
20001d2c:	0106d793          	srli	a5,a3,0x10
20001d30:	40f70533          	sub	a0,a4,a5
20001d34:	0ff57593          	andi	a1,a0,255
20001d38:	e991                	bnez	a1,20001d4c <strcmp+0xc8>
20001d3a:	8082                	ret
20001d3c:	8341                	srli	a4,a4,0x10
20001d3e:	83c1                	srli	a5,a5,0x10
20001d40:	40f70533          	sub	a0,a4,a5
20001d44:	0ff57593          	andi	a1,a0,255
20001d48:	e191                	bnez	a1,20001d4c <strcmp+0xc8>
20001d4a:	8082                	ret
20001d4c:	0ff77713          	andi	a4,a4,255
20001d50:	0ff7f793          	andi	a5,a5,255
20001d54:	40f70533          	sub	a0,a4,a5
20001d58:	8082                	ret
20001d5a:	00054603          	lbu	a2,0(a0)
20001d5e:	0005c683          	lbu	a3,0(a1)
20001d62:	0505                	addi	a0,a0,1
20001d64:	0585                	addi	a1,a1,1
20001d66:	00d61363          	bne	a2,a3,20001d6c <strcmp+0xe8>
20001d6a:	fa65                	bnez	a2,20001d5a <strcmp+0xd6>
20001d6c:	40d60533          	sub	a0,a2,a3
20001d70:	8082                	ret
20001d72:	0511                	addi	a0,a0,4
20001d74:	0591                	addi	a1,a1,4
20001d76:	fed612e3          	bne	a2,a3,20001d5a <strcmp+0xd6>
20001d7a:	4501                	li	a0,0
20001d7c:	8082                	ret
20001d7e:	0521                	addi	a0,a0,8
20001d80:	05a1                	addi	a1,a1,8
20001d82:	fcd61ce3          	bne	a2,a3,20001d5a <strcmp+0xd6>
20001d86:	4501                	li	a0,0
20001d88:	8082                	ret
20001d8a:	0531                	addi	a0,a0,12
20001d8c:	05b1                	addi	a1,a1,12
20001d8e:	fcd616e3          	bne	a2,a3,20001d5a <strcmp+0xd6>
20001d92:	4501                	li	a0,0
20001d94:	8082                	ret
20001d96:	0541                	addi	a0,a0,16
20001d98:	05c1                	addi	a1,a1,16
20001d9a:	fcd610e3          	bne	a2,a3,20001d5a <strcmp+0xd6>
20001d9e:	4501                	li	a0,0
20001da0:	8082                	ret

20001da2 <strlen>:
20001da2:	87aa                	mv	a5,a0
20001da4:	0785                	addi	a5,a5,1
20001da6:	fff7c703          	lbu	a4,-1(a5)
20001daa:	ff6d                	bnez	a4,20001da4 <strlen+0x2>
20001dac:	40a78533          	sub	a0,a5,a0
20001db0:	157d                	addi	a0,a0,-1
20001db2:	8082                	ret

20001db4 <strncmp>:
20001db4:	c21d                	beqz	a2,20001dda <strncmp+0x26>
20001db6:	00150713          	addi	a4,a0,1
20001dba:	9532                	add	a0,a0,a2
20001dbc:	fff74783          	lbu	a5,-1(a4)
20001dc0:	0005c683          	lbu	a3,0(a1)
20001dc4:	00d78563          	beq	a5,a3,20001dce <strncmp+0x1a>
20001dc8:	40d78533          	sub	a0,a5,a3
20001dcc:	8082                	ret
20001dce:	fea70de3          	beq	a4,a0,20001dc8 <strncmp+0x14>
20001dd2:	0705                	addi	a4,a4,1
20001dd4:	dbf5                	beqz	a5,20001dc8 <strncmp+0x14>
20001dd6:	0585                	addi	a1,a1,1
20001dd8:	b7d5                	j	20001dbc <strncmp+0x8>
20001dda:	4501                	li	a0,0
20001ddc:	8082                	ret

20001dde <strncpy>:
20001dde:	872a                	mv	a4,a0
20001de0:	e211                	bnez	a2,20001de4 <strncpy+0x6>
20001de2:	8082                	ret
20001de4:	0585                	addi	a1,a1,1
20001de6:	fff5c683          	lbu	a3,-1(a1)
20001dea:	00170793          	addi	a5,a4,1
20001dee:	fff60813          	addi	a6,a2,-1
20001df2:	fed78fa3          	sb	a3,-1(a5)
20001df6:	e689                	bnez	a3,20001e00 <strncpy+0x22>
20001df8:	9732                	add	a4,a4,a2
20001dfa:	00e79663          	bne	a5,a4,20001e06 <strncpy+0x28>
20001dfe:	8082                	ret
20001e00:	873e                	mv	a4,a5
20001e02:	8642                	mv	a2,a6
20001e04:	bff1                	j	20001de0 <strncpy+0x2>
20001e06:	0785                	addi	a5,a5,1
20001e08:	fe078fa3          	sb	zero,-1(a5)
20001e0c:	b7fd                	j	20001dfa <strncpy+0x1c>

20001e0e <_wctomb_r>:
20001e0e:	84c18793          	addi	a5,gp,-1972 # 800005cc <_impure_ptr>
20001e12:	439c                	lw	a5,0(a5)
20001e14:	5bdc                	lw	a5,52(a5)
20001e16:	e789                	bnez	a5,20001e20 <_wctomb_r+0x12>
20001e18:	5fffe797          	auipc	a5,0x5fffe
20001e1c:	1e878793          	addi	a5,a5,488 # 80000000 <__global_locale>
20001e20:	0e07a303          	lw	t1,224(a5)
20001e24:	8302                	jr	t1

20001e26 <__ascii_wctomb>:
20001e26:	cd91                	beqz	a1,20001e42 <__ascii_wctomb+0x1c>
20001e28:	0ff00793          	li	a5,255
20001e2c:	00c7f763          	bgeu	a5,a2,20001e3a <__ascii_wctomb+0x14>
20001e30:	08a00793          	li	a5,138
20001e34:	c11c                	sw	a5,0(a0)
20001e36:	557d                	li	a0,-1
20001e38:	8082                	ret
20001e3a:	00c58023          	sb	a2,0(a1)
20001e3e:	4505                	li	a0,1
20001e40:	8082                	ret
20001e42:	4501                	li	a0,0
20001e44:	8082                	ret
	...

Disassembly of section .rodata:

20001ec0 <CSWTCH.4>:
20001ec0:	0000                	unimp
20001ec2:	0048                	addi	a0,sp,4
20001ec4:	0000                	unimp
20001ec6:	0060                	addi	s0,sp,12
20001ec8:	0000                	unimp
20001eca:	0068                	addi	a0,sp,12
20001ecc:	5020                	lw	s0,96(s0)
20001ece:	5341                	li	t1,-16
20001ed0:	0d444553          	0xd444553
20001ed4:	000a                	c.slli	zero,0x2
20001ed6:	0000                	unimp
20001ed8:	0a0d                	addi	s4,s4,3
20001eda:	5245                	li	tp,-15
20001edc:	4f52                	lw	t5,20(sp)
20001ede:	3a52                	fld	fs4,304(sp)
20001ee0:	0020                	addi	s0,sp,8
20001ee2:	0000                	unimp
20001ee4:	4620                	lw	s0,72(a2)
20001ee6:	4941                	li	s2,16
20001ee8:	454c                	lw	a1,12(a0)
20001eea:	2044                	fld	fs1,128(s0)
20001eec:	48544957          	0x48544957
20001ef0:	4320                	lw	s0,64(a4)
20001ef2:	2045444f          	fnmadd.s	fs0,fa0,ft4,ft4,rmm
20001ef6:	0000                	unimp
20001ef8:	46315b1b          	0x46315b1b
20001efc:	0000                	unimp
20001efe:	0000                	unimp
20001f00:	4a305b1b          	0x4a305b1b
20001f04:	0000                	unimp
20001f06:	0000                	unimp
20001f08:	323f5b1b          	0x323f5b1b
20001f0c:	6835                	lui	a6,0xd
20001f0e:	0000                	unimp
20001f10:	3b305b1b          	0x3b305b1b
20001f14:	343b3933          	0x343b3933
20001f18:	6d39                	lui	s10,0xe
20001f1a:	0000                	unimp
20001f1c:	6542                	flw	fa0,16(sp)
20001f1e:	636e                	flw	ft6,216(sp)
20001f20:	2068                	fld	fa0,192(s0)
20001f22:	636f6c43          	fmadd.d	fs8,ft10,fs6,fa2,unknown
20001f26:	6552206b          	0x6552206b
20001f2a:	20746573          	csrrsi	a0,0x207,8
20001f2e:	706d6f43          	fmadd.s	ft10,fs10,ft6,fa4,unknown
20001f32:	656c                	flw	fa1,76(a0)
20001f34:	6574                	flw	fa3,76(a0)
20001f36:	0a0d                	addi	s4,s4,3
20001f38:	0000                	unimp
20001f3a:	0000                	unimp
20001f3c:	646e6553          	0x646e6553
20001f40:	6e69                	lui	t3,0x1a
20001f42:	6c462067          	0x6c462067
20001f46:	6761                	lui	a4,0x18
20001f48:	203a                	fld	ft0,392(sp)
20001f4a:	0000                	unimp
20001f4c:	646e6553          	0x646e6553
20001f50:	4620                	lw	s0,72(a2)
20001f52:	616c                	flw	fa1,68(a0)
20001f54:	69542067          	0x69542067
20001f58:	656d                	lui	a0,0x1b
20001f5a:	2064                	fld	fs1,192(s0)
20001f5c:	2074754f          	fnmadd.s	fa0,fs0,ft7,ft4
20001f60:	74696157          	0x74696157
20001f64:	6e69                	lui	t3,0x1a
20001f66:	6f662067          	0x6f662067
20001f6a:	2072                	fld	ft0,280(sp)
20001f6c:	6552                	flw	fa0,20(sp)
20001f6e:	6461                	lui	s0,0x18
20001f70:	0d79                	addi	s10,s10,30
20001f72:	000a                	c.slli	zero,0x2
20001f74:	646e6553          	0x646e6553
20001f78:	4620                	lw	s0,72(a2)
20001f7a:	616c                	flw	fa1,68(a0)
20001f7c:	74532067          	0x74532067
20001f80:	7261                	lui	tp,0xffff8
20001f82:	6574                	flw	fa3,76(a0)
20001f84:	0d64                	addi	s1,sp,668
20001f86:	000a                	c.slli	zero,0x2
20001f88:	646e6553          	0x646e6553
20001f8c:	4620                	lw	s0,72(a2)
20001f8e:	616c                	flw	fa1,68(a0)
20001f90:	69542067          	0x69542067
20001f94:	656d                	lui	a0,0x1b
20001f96:	2064                	fld	fs1,192(s0)
20001f98:	2074754f          	fnmadd.s	fa0,fs0,ft7,ft4
20001f9c:	7542                	flw	fa0,48(sp)
20001f9e:	202e7973          	csrrci	s2,hedeleg,28
20001fa2:	6552                	flw	fa0,20(sp)
20001fa4:	7274                	flw	fa3,100(a2)
20001fa6:	6979                	lui	s2,0x1e
20001fa8:	676e                	flw	fa4,216(sp)
20001faa:	0d2e                	slli	s10,s10,0xb
20001fac:	000a                	c.slli	zero,0x2
20001fae:	0000                	unimp
20001fb0:	646e6553          	0x646e6553
20001fb4:	4620                	lw	s0,72(a2)
20001fb6:	616c                	flw	fa1,68(a0)
20001fb8:	69542067          	0x69542067
20001fbc:	656d                	lui	a0,0x1b
20001fbe:	2064                	fld	fs1,192(s0)
20001fc0:	2074754f          	fnmadd.s	fa0,fs0,ft7,ft4
20001fc4:	7542                	flw	fa0,48(sp)
20001fc6:	202e7973          	csrrci	s2,hedeleg,28
20001fca:	69766947          	fmsub.s	fs2,fa2,fs7,fa3,unknown
20001fce:	676e                	flw	fa4,216(sp)
20001fd0:	5520                	lw	s0,104(a0)
20001fd2:	2e70                	fld	fa2,216(a2)
20001fd4:	0a0d                	addi	s4,s4,3
20001fd6:	0000                	unimp
20001fd8:	646e6553          	0x646e6553
20001fdc:	4620                	lw	s0,72(a2)
20001fde:	616c                	flw	fa1,68(a0)
20001fe0:	6f442067          	0x6f442067
20001fe4:	656e                	flw	fa0,216(sp)
20001fe6:	0a0d                	addi	s4,s4,3
20001fe8:	0000                	unimp
20001fea:	0000                	unimp
20001fec:	6c46                	flw	fs8,80(sp)
20001fee:	6761                	lui	a4,0x18
20001ff0:	5220                	lw	s0,96(a2)
20001ff2:	6365                	lui	t1,0x19
20001ff4:	6965                	lui	s2,0x19
20001ff6:	6576                	flw	fa0,92(sp)
20001ff8:	3a64                	fld	fs1,240(a2)
20001ffa:	0020                	addi	s0,sp,8
20001ffc:	5320                	lw	s0,96(a4)
20001ffe:	6e65                	lui	t3,0x19
20002000:	2064                	fld	fs1,192(s0)
20002002:	6c46                	flw	fs8,80(sp)
20002004:	6761                	lui	a4,0x18
20002006:	6520                	flw	fs0,72(a0)
20002008:	7272                	flw	ft4,60(sp)
2000200a:	203a726f          	jal	tp,200a9a0c <_data_lma+0xa76cc>
2000200e:	0000                	unimp
20002010:	5220                	lw	s0,96(a2)
20002012:	6365                	lui	t1,0x19
20002014:	2076                	fld	ft0,344(sp)
20002016:	6c46                	flw	fs8,80(sp)
20002018:	6761                	lui	a4,0x18
2000201a:	6520                	flw	fs0,72(a0)
2000201c:	7272                	flw	ft4,60(sp)
2000201e:	203a726f          	jal	tp,200a9a20 <_data_lma+0xa76e0>
20002022:	0000                	unimp
20002024:	2d2d                	jal	2000265e <_data_lma+0x31e>
20002026:	003e                	c.slli	zero,0xf
20002028:	6c46                	flw	fs8,80(sp)
2000202a:	6761                	lui	a4,0x18
2000202c:	5320                	lw	s0,96(a4)
2000202e:	6e65                	lui	t3,0x19
20002030:	0d74                	addi	a3,sp,668
20002032:	000a                	c.slli	zero,0x2
20002034:	20444d43          	fmadd.s	fs10,fs0,ft4,ft4,rmm
20002038:	654c                	flw	fa1,12(a0)
2000203a:	676e                	flw	fa4,216(sp)
2000203c:	6874                	flw	fa3,84(s0)
2000203e:	5420                	lw	s0,104(s0)
20002040:	6d69                	lui	s10,0x1a
20002042:	6465                	lui	s0,0x19
20002044:	4f20                	lw	s0,88(a4)
20002046:	7475                	lui	s0,0xffffd
20002048:	4220                	lw	s0,64(a2)
2000204a:	7375                	lui	t1,0xffffd
2000204c:	0d79                	addi	s10,s10,30
2000204e:	000a                	c.slli	zero,0x2
20002050:	20444d43          	fmadd.s	fs10,fs0,ft4,ft4,rmm
20002054:	654c                	flw	fa1,12(a0)
20002056:	676e                	flw	fa4,216(sp)
20002058:	6874                	flw	fa3,84(s0)
2000205a:	5320                	lw	s0,96(a4)
2000205c:	6e65                	lui	t3,0x19
2000205e:	0d74                	addi	a3,sp,668
20002060:	000a                	c.slli	zero,0x2
20002062:	0000                	unimp
20002064:	646e6553          	0x646e6553
20002068:	6c20                	flw	fs0,88(s0)
2000206a:	6e65                	lui	t3,0x19
2000206c:	20687467          	0x20687467
20002070:	7265                	lui	tp,0xffff9
20002072:	6f72                	flw	ft10,28(sp)
20002074:	3a72                	fld	fs4,312(sp)
20002076:	0020                	addi	s0,sp,8
20002078:	5320                	lw	s0,96(a4)
2000207a:	6e65                	lui	t3,0x19
2000207c:	2064                	fld	fs1,192(s0)
2000207e:	636e7973          	csrrci	s2,0x636,28
20002082:	6520                	flw	fs0,72(a0)
20002084:	7272                	flw	ft4,60(sp)
20002086:	0020726f          	jal	tp,20009088 <_data_lma+0x6d48>
2000208a:	0000                	unimp
2000208c:	20444d43          	fmadd.s	fs10,fs0,ft4,ft4,rmm
20002090:	6954                	flw	fa3,20(a0)
20002092:	656d                	lui	a0,0x1b
20002094:	2064                	fld	fs1,192(s0)
20002096:	2074754f          	fnmadd.s	fa0,fs0,ft7,ft4
2000209a:	7542                	flw	fa0,48(sp)
2000209c:	0a0d7973          	csrrci	s2,0xa0,26
200020a0:	0000                	unimp
200020a2:	0000                	unimp
200020a4:	20444d43          	fmadd.s	fs10,fs0,ft4,ft4,rmm
200020a8:	6f44                	flw	fs1,28(a4)
200020aa:	656e                	flw	fa0,216(sp)
200020ac:	0a0d                	addi	s4,s4,3
200020ae:	0000                	unimp
200020b0:	4552                	lw	a0,20(sp)
200020b2:	46205643          	fmadd.q	fa2,ft0,ft2,fs0,unknown
200020b6:	616c                	flw	fa1,68(a0)
200020b8:	68432067          	0x68432067
200020bc:	6365                	lui	t1,0x19
200020be:	000a0d6b          	0xa0d6b
200020c2:	0000                	unimp
200020c4:	4552                	lw	a0,20(sp)
200020c6:	46205643          	fmadd.q	fa2,ft0,ft2,fs0,unknown
200020ca:	616c                	flw	fa1,68(a0)
200020cc:	4b4f2067          	0x4b4f2067
200020d0:	0a0d                	addi	s4,s4,3
200020d2:	0000                	unimp
200020d4:	6552                	flw	fa0,20(sp)
200020d6:	76696563          	bltu	s2,t1,20002840 <_data_lma+0x500>
200020da:	2065                	jal	20002182 <CSWTCH.4+0x2c2>
200020dc:	654c                	flw	fa1,12(a0)
200020de:	676e                	flw	fa4,216(sp)
200020e0:	6874                	flw	fa3,84(s0)
200020e2:	5420                	lw	s0,104(s0)
200020e4:	6d69                	lui	s10,0x1a
200020e6:	6465                	lui	s0,0x19
200020e8:	4f20                	lw	s0,88(a4)
200020ea:	7475                	lui	s0,0xffffd
200020ec:	4220                	lw	s0,64(a2)
200020ee:	7375                	lui	t1,0xffffd
200020f0:	0d79                	addi	s10,s10,30
200020f2:	000a                	c.slli	zero,0x2
200020f4:	6552                	flw	fa0,20(sp)
200020f6:	76696563          	bltu	s2,t1,20002860 <_data_lma+0x520>
200020fa:	2065                	jal	200021a2 <CSWTCH.4+0x2e2>
200020fc:	654c                	flw	fa1,12(a0)
200020fe:	676e                	flw	fa4,216(sp)
20002100:	6874                	flw	fa3,84(s0)
20002102:	4f20                	lw	s0,88(a4)
20002104:	000a0d4b          	fnmsub.s	fs10,fs4,ft0,ft0,rne
20002108:	654c                	flw	fa1,12(a0)
2000210a:	676e                	flw	fa4,216(sp)
2000210c:	6874                	flw	fa3,84(s0)
2000210e:	5220                	lw	s0,96(a2)
20002110:	6365                	lui	t1,0x19
20002112:	6965                	lui	s2,0x19
20002114:	6576                	flw	fa0,92(sp)
20002116:	3a64                	fld	fs1,240(a2)
20002118:	0020                	addi	s0,sp,8
2000211a:	0000                	unimp
2000211c:	6552                	flw	fa0,20(sp)
2000211e:	6c207663          	bgeu	zero,sp,200027ea <_data_lma+0x4aa>
20002122:	6e65                	lui	t3,0x19
20002124:	20687467          	0x20687467
20002128:	7265                	lui	tp,0xffff9
2000212a:	6f72                	flw	ft10,28(sp)
2000212c:	3a72                	fld	fs4,312(sp)
2000212e:	0020                	addi	s0,sp,8
20002130:	6552                	flw	fa0,20(sp)
20002132:	7274                	flw	fa3,100(a2)
20002134:	6979                	lui	s2,0x1e
20002136:	676e                	flw	fa4,216(sp)
20002138:	2e2e                	fld	ft8,200(sp)
2000213a:	0d2e                	slli	s10,s10,0xb
2000213c:	000a                	c.slli	zero,0x2
2000213e:	0000                	unimp
20002140:	6552                	flw	fa0,20(sp)
20002142:	4c207663          	bgeu	zero,sp,2000260e <_data_lma+0x2ce>
20002146:	6e65                	lui	t3,0x19
20002148:	20687467          	0x20687467
2000214c:	7369                	lui	t1,0xffffa
2000214e:	203a                	fld	ft0,392(sp)
20002150:	0000                	unimp
20002152:	0000                	unimp
20002154:	7872                	flw	fa6,60(sp)
20002156:	625f 6675 6320      	0x63206675625f
2000215c:	65746e6f          	jal	t3,20048fb2 <_data_lma+0x46c72>
20002160:	746e                	flw	fs0,248(sp)
20002162:	00203a73          	csrrc	s4,frm,zero
20002166:	0000                	unimp
20002168:	20746f67          	0x20746f67
2000216c:	6572                	flw	fa0,28(sp)
2000216e:	65207663          	bgeu	zero,s2,200027ba <_data_lma+0x47a>
20002172:	7272                	flw	ft4,60(sp)
20002174:	0020726f          	jal	tp,20009176 <_data_lma+0x6e36>
20002178:	6568744f          	0x6568744f
2000217c:	2072                	fld	ft0,280(sp)
2000217e:	6552                	flw	fa0,20(sp)
20002180:	6d207663          	bgeu	zero,s2,2000284c <_data_lma+0x50c>
20002184:	7365                	lui	t1,0xffff9
20002186:	65676173          	csrrsi	sp,0x656,14
2000218a:	00002023          	sw	zero,0(zero) # 0 <_prog_start-0x20000000>
2000218e:	0000                	unimp
20002190:	0a0d                	addi	s4,s4,3
20002192:	0a0d4b4f          	fnmadd.d	fs6,fs10,ft0,ft1,rmm
20002196:	0000                	unimp
20002198:	20746f67          	0x20746f67
2000219c:	0a0d6b6f          	jal	s6,200d823c <_data_lma+0xd5efc>
200021a0:	0000                	unimp
200021a2:	0000                	unimp
200021a4:	0a0d                	addi	s4,s4,3
200021a6:	6572                	flw	fa0,28(sp)
200021a8:	6461                	lui	s0,0x18
200021aa:	0d79                	addi	s10,s10,30
200021ac:	000a                	c.slli	zero,0x2
200021ae:	0000                	unimp
200021b0:	20746f67          	0x20746f67
200021b4:	6572                	flw	fa0,28(sp)
200021b6:	6461                	lui	s0,0x18
200021b8:	0d79                	addi	s10,s10,30
200021ba:	000a                	c.slli	zero,0x2
200021bc:	0a0d                	addi	s4,s4,3
200021be:	5245                	li	tp,-15
200021c0:	4f52                	lw	t5,20(sp)
200021c2:	0d52                	slli	s10,s10,0x14
200021c4:	000a                	c.slli	zero,0x2
200021c6:	0000                	unimp
200021c8:	20746f67          	0x20746f67
200021cc:	7265                	lui	tp,0xffff9
200021ce:	6f72                	flw	ft10,28(sp)
200021d0:	0d72                	slli	s10,s10,0x1c
200021d2:	000a                	c.slli	zero,0x2
200021d4:	5441                	li	s0,-16
200021d6:	3045                	jal	20001a76 <at_recv+0xf8>
200021d8:	0a0d                	addi	s4,s4,3
200021da:	0000                	unimp
200021dc:	5441                	li	s0,-16
200021de:	454c422b          	0x454c422b
200021e2:	4e49                	li	t3,18
200021e4:	5449                	li	s0,-14
200021e6:	303d                	jal	20001a14 <at_recv+0x96>
200021e8:	0a0d                	addi	s4,s4,3
200021ea:	0000                	unimp
200021ec:	5441                	li	s0,-16
200021ee:	4d57432b          	0x4d57432b
200021f2:	3d45444f          	0x3d45444f
200021f6:	0d30                	addi	a2,sp,664
200021f8:	000a                	c.slli	zero,0x2

200021fa <_msg_init>:
200021fa:	5552                	lw	a0,52(sp)
200021fc:	0d4e                	slli	s10,s10,0x13
200021fe:	000a                	c.slli	zero,0x2

20002200 <_msg_pass>:
20002200:	4150                	lw	a2,4(a0)
20002202:	          	0x46005353

20002205 <_msg_fail>:
20002205:	4146                	lw	sp,80(sp)
20002207:	4c49                	li	s8,18
20002209:	0020                	addi	s0,sp,8

2000220b <_msg_end>:
2000220b:	0a0d                	addi	s4,s4,3
2000220d:	0000                	unimp
2000220f:	4300                	lw	s0,0(a4)
20002211:	0000                	unimp
20002213:	5000                	lw	s0,32(s0)
20002215:	5849534f          	fnmadd.s	ft6,fs2,ft4,fa1,unknown
20002219:	0000                	unimp
2000221b:	2e00                	fld	fs0,24(a2)
2000221d:	0000                	unimp
	...

20002220 <_ctype_>:
20002220:	2000                	fld	fs0,0(s0)
20002222:	2020                	fld	fs0,64(s0)
20002224:	2020                	fld	fs0,64(s0)
20002226:	2020                	fld	fs0,64(s0)
20002228:	2020                	fld	fs0,64(s0)
2000222a:	2828                	fld	fa0,80(s0)
2000222c:	2828                	fld	fa0,80(s0)
2000222e:	2028                	fld	fa0,64(s0)
20002230:	2020                	fld	fs0,64(s0)
20002232:	2020                	fld	fs0,64(s0)
20002234:	2020                	fld	fs0,64(s0)
20002236:	2020                	fld	fs0,64(s0)
20002238:	2020                	fld	fs0,64(s0)
2000223a:	2020                	fld	fs0,64(s0)
2000223c:	2020                	fld	fs0,64(s0)
2000223e:	2020                	fld	fs0,64(s0)
20002240:	8820                	0x8820
20002242:	1010                	addi	a2,sp,32
20002244:	1010                	addi	a2,sp,32
20002246:	1010                	addi	a2,sp,32
20002248:	1010                	addi	a2,sp,32
2000224a:	1010                	addi	a2,sp,32
2000224c:	1010                	addi	a2,sp,32
2000224e:	1010                	addi	a2,sp,32
20002250:	0410                	addi	a2,sp,512
20002252:	0404                	addi	s1,sp,512
20002254:	0404                	addi	s1,sp,512
20002256:	0404                	addi	s1,sp,512
20002258:	0404                	addi	s1,sp,512
2000225a:	1004                	addi	s1,sp,32
2000225c:	1010                	addi	a2,sp,32
2000225e:	1010                	addi	a2,sp,32
20002260:	1010                	addi	a2,sp,32
20002262:	4141                	li	sp,16
20002264:	4141                	li	sp,16
20002266:	4141                	li	sp,16
20002268:	0101                	addi	sp,sp,0
2000226a:	0101                	addi	sp,sp,0
2000226c:	0101                	addi	sp,sp,0
2000226e:	0101                	addi	sp,sp,0
20002270:	0101                	addi	sp,sp,0
20002272:	0101                	addi	sp,sp,0
20002274:	0101                	addi	sp,sp,0
20002276:	0101                	addi	sp,sp,0
20002278:	0101                	addi	sp,sp,0
2000227a:	0101                	addi	sp,sp,0
2000227c:	1010                	addi	a2,sp,32
2000227e:	1010                	addi	a2,sp,32
20002280:	1010                	addi	a2,sp,32
20002282:	4242                	lw	tp,16(sp)
20002284:	4242                	lw	tp,16(sp)
20002286:	4242                	lw	tp,16(sp)
20002288:	0202                	c.slli64	tp
2000228a:	0202                	c.slli64	tp
2000228c:	0202                	c.slli64	tp
2000228e:	0202                	c.slli64	tp
20002290:	0202                	c.slli64	tp
20002292:	0202                	c.slli64	tp
20002294:	0202                	c.slli64	tp
20002296:	0202                	c.slli64	tp
20002298:	0202                	c.slli64	tp
2000229a:	0202                	c.slli64	tp
2000229c:	1010                	addi	a2,sp,32
2000229e:	1010                	addi	a2,sp,32
200022a0:	0020                	addi	s0,sp,8
	...

Disassembly of section .data:

80000000 <__global_locale>:
80000000:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
80000020:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
80000040:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
80000060:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
80000080:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
800000a0:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
800000c0:	00000043          	fmadd.s	ft0,ft0,ft0,ft0,rne
	...
800000e0:	1e26                	slli	t3,t3,0x29
800000e2:	2000                	fld	fs0,0(s0)
800000e4:	1c4a                	slli	s8,s8,0x32
800000e6:	2000                	fld	fs0,0(s0)
800000e8:	0000                	unimp
800000ea:	0000                	unimp
800000ec:	2220                	fld	fs0,64(a2)
800000ee:	2000                	fld	fs0,0(s0)
800000f0:	221c                	fld	fa5,0(a2)
800000f2:	2000                	fld	fs0,0(s0)
800000f4:	1fe8                	addi	a0,sp,1020
800000f6:	2000                	fld	fs0,0(s0)
800000f8:	1fe8                	addi	a0,sp,1020
800000fa:	2000                	fld	fs0,0(s0)
800000fc:	1fe8                	addi	a0,sp,1020
800000fe:	2000                	fld	fs0,0(s0)
80000100:	1fe8                	addi	a0,sp,1020
80000102:	2000                	fld	fs0,0(s0)
80000104:	1fe8                	addi	a0,sp,1020
80000106:	2000                	fld	fs0,0(s0)
80000108:	1fe8                	addi	a0,sp,1020
8000010a:	2000                	fld	fs0,0(s0)
8000010c:	1fe8                	addi	a0,sp,1020
8000010e:	2000                	fld	fs0,0(s0)
80000110:	1fe8                	addi	a0,sp,1020
80000112:	2000                	fld	fs0,0(s0)
80000114:	1fe8                	addi	a0,sp,1020
80000116:	2000                	fld	fs0,0(s0)
80000118:	ffff                	0xffff
8000011a:	ffff                	0xffff
8000011c:	ffff                	0xffff
8000011e:	ffff                	0xffff
80000120:	ffff                	0xffff
80000122:	ffff                	0xffff
80000124:	ffff                	0xffff
80000126:	0000                	unimp
80000128:	0001                	nop
8000012a:	5341                	li	t1,-16
8000012c:	00494943          	fmadd.s	fs2,fs2,ft4,ft0,rmm
	...
80000148:	0000                	unimp
8000014a:	5341                	li	t1,-16
8000014c:	00494943          	fmadd.s	fs2,fs2,ft4,ft0,rmm
	...

80000170 <impure_data>:
80000170:	0000                	unimp
80000172:	0000                	unimp
80000174:	045c                	addi	a5,sp,516
80000176:	8000                	0x8000
80000178:	04c4                	addi	s1,sp,580
8000017a:	8000                	0x8000
8000017c:	052c                	addi	a1,sp,648
8000017e:	8000                	0x8000
	...
80000218:	0001                	nop
8000021a:	0000                	unimp
8000021c:	0000                	unimp
8000021e:	0000                	unimp
80000220:	330e                	fld	ft6,224(sp)
80000222:	abcd                	j	80000814 <_ebss+0x14c>
80000224:	1234                	addi	a3,sp,296
80000226:	e66d                	bnez	a2,80000310 <impure_data+0x1a0>
80000228:	deec                	sw	a1,124(a3)
8000022a:	0005                	c.nop	1
8000022c:	0000000b          	0xb
	...

Disassembly of section .sdata:

800005c0 <lfosc_freq>:
800005c0:	8000                	0x8000
	...

800005c4 <esp32_diag_mode>:
800005c4:	0001                	nop
	...

800005c8 <_global_impure_ptr>:
800005c8:	0170                	addi	a2,sp,140
800005ca:	8000                	0x8000

800005cc <_impure_ptr>:
800005cc:	0170                	addi	a2,sp,140
800005ce:	8000                	0x8000

Disassembly of section .bss:

80000600 <print_to_uart1>:
80000600:	0000                	unimp
	...

80000604 <_PathLocale>:
80000604:	0000                	unimp
	...

80000608 <tx_buf>:
	...

80000648 <rx_buf>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	000009d3          	fadd.s	fs3,ft0,ft0,rne
       4:	0004                	0x4
       6:	0000                	unimp
       8:	0000                	unimp
       a:	0104                	addi	s1,sp,128
       c:	0471                	addi	s0,s0,28
       e:	0000                	unimp
      10:	9f0c                	0x9f0c
      12:	0000                	unimp
      14:	2900                	fld	fs0,16(a0)
      16:	0002                	c.slli64	zero
      18:	1800                	addi	s0,sp,48
	...
      22:	0000                	unimp
      24:	0200                	addi	s0,sp,256
      26:	0601                	addi	a2,a2,0
      28:	0441                	addi	s0,s0,16
      2a:	0000                	unimp
      2c:	0102                	c.slli64	sp
      2e:	3f08                	fld	fa0,56(a4)
      30:	0004                	0x4
      32:	0200                	addi	s0,sp,256
      34:	0502                	c.slli64	a0
      36:	0000038b          	0x38b
      3a:	0202                	c.slli64	tp
      3c:	00051207          	0x51207
      40:	0200                	addi	s0,sp,256
      42:	0504                	addi	s1,sp,640
      44:	02d1                	addi	t0,t0,20
      46:	0000                	unimp
      48:	00044d03          	lbu	s10,0(s0) # 18000 <_prog_start-0x1ffe8000>
      4c:	0200                	addi	s0,sp,256
      4e:	0000534f          	fnmadd.s	ft6,ft0,ft0,ft0,unknown
      52:	0200                	addi	s0,sp,256
      54:	0704                	addi	s1,sp,896
      56:	0170                	addi	a2,sp,140
      58:	0000                	unimp
      5a:	0802                	c.slli64	a6
      5c:	cc05                	beqz	s0,94 <_prog_start-0x1fffff6c>
      5e:	0002                	c.slli64	zero
      60:	0300                	addi	s0,sp,384
      62:	01ee                	slli	gp,gp,0x1b
      64:	0000                	unimp
      66:	6902                	flw	fs2,0(sp)
      68:	006c                	addi	a1,sp,12
      6a:	0000                	unimp
      6c:	0802                	c.slli64	a6
      6e:	00016b07          	0x16b07
      72:	0400                	addi	s0,sp,512
      74:	0504                	addi	s1,sp,640
      76:	6e69                	lui	t3,0x1a
      78:	0074                	addi	a3,sp,12
      7a:	0402                	c.slli64	s0
      7c:	00017507          	0x17507
      80:	0300                	addi	s0,sp,384
      82:	0000044f          	fnmadd.s	fs0,ft0,ft0,ft0,rne
      86:	00483003          	0x483003
      8a:	0000                	unimp
      8c:	0001f003          	0x1f003
      90:	0300                	addi	s0,sp,384
      92:	613c                	flw	fa5,64(a0)
      94:	0000                	unimp
      96:	0500                	addi	s0,sp,640
      98:	008c                	addi	a1,sp,64
      9a:	0000                	unimp
      9c:	0102                	c.slli64	sp
      9e:	d702                	sw	zero,172(sp)
      a0:	0001                	nop
      a2:	0200                	addi	s0,sp,256
      a4:	0801                	addi	a6,a6,0
      a6:	0448                	addi	a0,sp,516
      a8:	0000                	unimp
      aa:	a306                	fsd	ft1,384(sp)
      ac:	0000                	unimp
      ae:	0700                	addi	s0,sp,896
      b0:	00000673          	0x673
      b4:	0804                	addi	s1,sp,16
      b6:	0081                	addi	ra,ra,0
      b8:	0000                	unimp
      ba:	00041e07          	0x41e07
      be:	0400                	addi	s0,sp,512
      c0:	7309                	lui	t1,0xfffe2
      c2:	0000                	unimp
      c4:	0200                	addi	s0,sp,256
      c6:	0410                	addi	a2,sp,512
      c8:	0351                	addi	t1,t1,20
      ca:	0000                	unimp
      cc:	00004903          	lbu	s2,0(zero) # 0 <_prog_start-0x20000000>
      d0:	0500                	addi	s0,sp,640
      d2:	00007307          	0x7307
      d6:	0300                	addi	s0,sp,384
      d8:	0534                	addi	a3,sp,648
      da:	0000                	unimp
      dc:	2c06                	fld	fs8,64(sp)
      de:	0041                	c.nop	16
      e0:	0000                	unimp
      e2:	00007703          	0x7703
      e6:	0600                	addi	s0,sp,768
      e8:	4172                	lw	sp,28(sp)
      ea:	0000                	unimp
      ec:	0300                	addi	s0,sp,384
      ee:	0502                	c.slli64	a0
      f0:	0000                	unimp
      f2:	9106                	add	sp,sp,ra
      f4:	00000073          	ecall
      f8:	0b08                	addi	a0,sp,400
      fa:	0004                	0x4
      fc:	0700                	addi	s0,sp,896
      fe:	0165                	addi	sp,sp,25
     100:	007a                	c.slli	zero,0x1e
     102:	0000                	unimp
     104:	0409                	addi	s0,s0,2
     106:	a606                	fsd	ft1,264(sp)
     108:	00000123          	sb	zero,2(zero) # 2 <_prog_start-0x1ffffffe>
     10c:	980a                	add	a6,a6,sp
     10e:	0002                	c.slli64	zero
     110:	0600                	addi	s0,sp,768
     112:	f8a8                	fsw	fa0,112(s1)
     114:	0000                	unimp
     116:	0a00                	addi	s0,sp,272
     118:	000003af          	0x3af
     11c:	a906                	fsd	ft1,144(sp)
     11e:	00000123          	sb	zero,2(zero) # 2 <_prog_start-0x1ffffffe>
     122:	0b00                	addi	s0,sp,400
     124:	002c                	addi	a1,sp,8
     126:	0000                	unimp
     128:	00000133          	add	sp,zero,zero
     12c:	7a0c                	flw	fa1,48(a2)
     12e:	0000                	unimp
     130:	0300                	addi	s0,sp,384
     132:	0d00                	addi	s0,sp,656
     134:	0608                	addi	a0,sp,768
     136:	000154a3          	0x154a3
     13a:	0e00                	addi	s0,sp,784
     13c:	013a                	slli	sp,sp,0xe
     13e:	0000                	unimp
     140:	a506                	fsd	ft1,136(sp)
     142:	00000073          	ecall
     146:	0e00                	addi	s0,sp,784
     148:	01fe                	slli	gp,gp,0x1f
     14a:	0000                	unimp
     14c:	aa06                	fsd	ft1,272(sp)
     14e:	0104                	addi	s1,sp,128
     150:	0000                	unimp
     152:	0004                	0x4
     154:	00031e03          	lh	t3,0(t1) # fffe2000 <_sp+0x7ffde000>
     158:	0600                	addi	s0,sp,768
     15a:	000133ab          	0x133ab
     15e:	0300                	addi	s0,sp,384
     160:	0000028f          	0x28f
     164:	af06                	fsd	ft1,408(sp)
     166:	00cc                	addi	a1,sp,68
     168:	0000                	unimp
     16a:	0410040f          	0x410040f
     16e:	000000a3          	sb	zero,1(zero) # 1 <_prog_start-0x1fffffff>
     172:	00028707          	0x28707
     176:	0800                	addi	s0,sp,16
     178:	7d10                	flw	fa2,56(a0)
     17a:	0001                	nop
     17c:	1000                	addi	s0,sp,32
     17e:	6c04                	flw	fs1,24(s0)
     180:	0001                	nop
     182:	0700                	addi	s0,sp,896
     184:	034a                	slli	t1,t1,0x12
     186:	0000                	unimp
     188:	e208                	fsw	fa0,0(a2)
     18a:	016c                	addi	a1,sp,140
     18c:	0000                	unimp
     18e:	00030d07          	0x30d07
     192:	0800                	addi	s0,sp,16
     194:	000073e3          	bgeu	zero,zero,99a <_prog_start-0x1ffff666>
     198:	0700                	addi	s0,sp,896
     19a:	0142                	slli	sp,sp,0x10
     19c:	0000                	unimp
     19e:	e308                	fsw	fa0,0(a4)
     1a0:	00000073          	ecall
     1a4:	00001c07          	0x1c07
     1a8:	0800                	addi	s0,sp,16
     1aa:	000073e3          	bgeu	zero,zero,9b0 <_prog_start-0x1ffff650>
     1ae:	0700                	addi	s0,sp,896
     1b0:	0395                	addi	t2,t2,5
     1b2:	0000                	unimp
     1b4:	e508                	fsw	fa0,8(a0)
     1b6:	00000073          	ecall
     1ba:	0002f003          	0x2f003
     1be:	0900                	addi	s0,sp,144
     1c0:	5316                	lw	t1,100(sp)
     1c2:	0000                	unimp
     1c4:	1100                	addi	s0,sp,160
     1c6:	0116                	slli	sp,sp,0x5
     1c8:	0000                	unimp
     1ca:	0918                	addi	a4,sp,144
     1cc:	0002182f          	0x2182f
     1d0:	0e00                	addi	s0,sp,784
     1d2:	0582                	c.slli64	a1
     1d4:	0000                	unimp
     1d6:	3109                	jal	fffffdd8 <_sp+0x7fffbdd8>
     1d8:	0218                	addi	a4,sp,256
     1da:	0000                	unimp
     1dc:	1200                	addi	s0,sp,288
     1de:	6b5f 0900 7332      	0x733209006b5f
     1e4:	0000                	unimp
     1e6:	0400                	addi	s0,sp,512
     1e8:	e40e                	fsw	ft3,8(sp)
     1ea:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     1ee:	7332                	flw	ft6,44(sp)
     1f0:	0000                	unimp
     1f2:	0800                	addi	s0,sp,16
     1f4:	a30e                	fsd	ft3,384(sp)
     1f6:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     1fa:	7332                	flw	ft6,44(sp)
     1fc:	0000                	unimp
     1fe:	0c00                	addi	s0,sp,528
     200:	970e                	add	a4,a4,gp
     202:	0001                	nop
     204:	0900                	addi	s0,sp,144
     206:	7332                	flw	ft6,44(sp)
     208:	0000                	unimp
     20a:	1000                	addi	s0,sp,32
     20c:	5f12                	lw	t5,36(sp)
     20e:	0078                	addi	a4,sp,12
     210:	3309                	jal	ffffff12 <_sp+0x7fffbf12>
     212:	021e                	slli	tp,tp,0x7
     214:	0000                	unimp
     216:	0014                	0x14
     218:	0410                	addi	a2,sp,512
     21a:	01c5                	addi	gp,gp,17
     21c:	0000                	unimp
     21e:	0001ba0b          	0x1ba0b
     222:	2e00                	fld	fs0,24(a2)
     224:	0002                	c.slli64	zero
     226:	0c00                	addi	s0,sp,528
     228:	007a                	c.slli	zero,0x1e
     22a:	0000                	unimp
     22c:	0000                	unimp
     22e:	ff11                	bnez	a4,14a <_prog_start-0x1ffffeb6>
     230:	24000003          	lb	zero,576(zero) # 240 <_prog_start-0x1ffffdc0>
     234:	3709                	jal	136 <_prog_start-0x1ffffeca>
     236:	000002a7          	0x2a7
     23a:	bf0e                	fsd	ft3,440(sp)
     23c:	0001                	nop
     23e:	0900                	addi	s0,sp,144
     240:	7339                	lui	t1,0xfffee
     242:	0000                	unimp
     244:	0000                	unimp
     246:	490e                	lw	s2,192(sp)
     248:	0001                	nop
     24a:	0900                	addi	s0,sp,144
     24c:	733a                	flw	ft6,172(sp)
     24e:	0000                	unimp
     250:	0400                	addi	s0,sp,512
     252:	300e                	fld	ft0,224(sp)
     254:	0001                	nop
     256:	0900                	addi	s0,sp,144
     258:	0000733b          	0x733b
     25c:	0800                	addi	s0,sp,16
     25e:	5b0e                	lw	s6,224(sp)
     260:	0002                	c.slli64	zero
     262:	0900                	addi	s0,sp,144
     264:	733c                	flw	fa5,96(a4)
     266:	0000                	unimp
     268:	0c00                	addi	s0,sp,528
     26a:	410e                	lw	sp,192(sp)
     26c:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     270:	733d                	lui	t1,0xfffef
     272:	0000                	unimp
     274:	1000                	addi	s0,sp,32
     276:	b60e                	fsd	ft3,296(sp)
     278:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     27c:	733e                	flw	ft6,236(sp)
     27e:	0000                	unimp
     280:	1400                	addi	s0,sp,544
     282:	1e0e                	slli	t3,t3,0x23
     284:	0001                	nop
     286:	0900                	addi	s0,sp,144
     288:	0000733f c80e1800 	0xc80e18000000733f
     290:	0001                	nop
     292:	0900                	addi	s0,sp,144
     294:	7340                	flw	fs0,36(a4)
     296:	0000                	unimp
     298:	1c00                	addi	s0,sp,560
     29a:	310e                	fld	ft2,224(sp)
     29c:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     2a0:	7341                	lui	t1,0xffff0
     2a2:	0000                	unimp
     2a4:	2000                	fld	fs0,0(s0)
     2a6:	1300                	addi	s0,sp,416
     2a8:	0000                	unimp
     2aa:	0000                	unimp
     2ac:	0108                	addi	a0,sp,128
     2ae:	4a09                	li	s4,2
     2b0:	000002e7          	jalr	t0,zero # 0 <_prog_start-0x20000000>
     2b4:	290e                	fld	fs2,192(sp)
     2b6:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     2ba:	0002e74b          	fnmsub.s	fa4,ft5,ft0,ft0,unknown
     2be:	0000                	unimp
     2c0:	120e                	slli	tp,tp,0x23
     2c2:	0004                	0x4
     2c4:	0900                	addi	s0,sp,144
     2c6:	e74c                	fsw	fa1,12(a4)
     2c8:	0002                	c.slli64	zero
     2ca:	8000                	0x8000
     2cc:	2514                	fld	fa3,8(a0)
     2ce:	0005                	c.nop	1
     2d0:	0900                	addi	s0,sp,144
     2d2:	ba4e                	fsd	fs3,304(sp)
     2d4:	0001                	nop
     2d6:	0000                	unimp
     2d8:	1401                	addi	s0,s0,-32
     2da:	0000056f          	jal	a0,2da <_prog_start-0x1ffffd26>
     2de:	5109                	li	sp,-30
     2e0:	01ba                	slli	gp,gp,0xe
     2e2:	0000                	unimp
     2e4:	0104                	addi	s1,sp,128
     2e6:	0b00                	addi	s0,sp,400
     2e8:	016a                	slli	sp,sp,0x1a
     2ea:	0000                	unimp
     2ec:	000002f7          	0x2f7
     2f0:	7a0c                	flw	fa1,48(a2)
     2f2:	0000                	unimp
     2f4:	1f00                	addi	s0,sp,944
     2f6:	1300                	addi	s0,sp,416
     2f8:	037a                	slli	t1,t1,0x1e
     2fa:	0000                	unimp
     2fc:	0190                	addi	a2,sp,192
     2fe:	5d09                	li	s10,-30
     300:	0335                	addi	t1,t1,13
     302:	0000                	unimp
     304:	820e                	mv	tp,gp
     306:	0005                	c.nop	1
     308:	0900                	addi	s0,sp,144
     30a:	355e                	fld	fa0,496(sp)
     30c:	00000003          	lb	zero,0(zero) # 0 <_prog_start-0x20000000>
     310:	3c0e                	fld	fs8,224(sp)
     312:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     316:	735f 0000 0400      	0x4000000735f
     31c:	7f0e                	flw	ft10,224(sp)
     31e:	0000                	unimp
     320:	0900                	addi	s0,sp,144
     322:	3b61                	jal	ba <_prog_start-0x1fffff46>
     324:	08000003          	lb	zero,128(zero) # 80 <_prog_start-0x1fffff80>
     328:	000e                	c.slli	zero,0x3
     32a:	0000                	unimp
     32c:	0900                	addi	s0,sp,144
     32e:	a762                	fsd	fs8,392(sp)
     330:	0002                	c.slli64	zero
     332:	8800                	0x8800
     334:	1000                	addi	s0,sp,32
     336:	f704                	fsw	fs1,40(a4)
     338:	0002                	c.slli64	zero
     33a:	0b00                	addi	s0,sp,400
     33c:	0000034b          	fnmsub.s	ft6,ft0,ft0,ft0,rne
     340:	0000034b          	fnmsub.s	ft6,ft0,ft0,ft0,rne
     344:	7a0c                	flw	fa1,48(a2)
     346:	0000                	unimp
     348:	1f00                	addi	s0,sp,944
     34a:	1000                	addi	s0,sp,32
     34c:	5104                	lw	s1,32(a0)
     34e:	15000003          	lb	zero,336(zero) # 150 <_prog_start-0x1ffffeb0>
     352:	6a11                	lui	s4,0x4
     354:	0004                	0x4
     356:	0800                	addi	s0,sp,16
     358:	7509                	lui	a0,0xfffe2
     35a:	00000377          	0x377
     35e:	da0e                	sw	gp,52(sp)
     360:	0002                	c.slli64	zero
     362:	0900                	addi	s0,sp,144
     364:	7776                	flw	fa4,124(sp)
     366:	00000003          	lb	zero,0(zero) # 0 <_prog_start-0x20000000>
     36a:	2e0e                	fld	ft8,192(sp)
     36c:	0005                	c.nop	1
     36e:	0900                	addi	s0,sp,144
     370:	00007377          	0x7377
     374:	0400                	addi	s0,sp,512
     376:	1000                	addi	s0,sp,32
     378:	2c04                	fld	fs1,24(s0)
     37a:	0000                	unimp
     37c:	1100                	addi	s0,sp,160
     37e:	0000018f          	0x18f
     382:	0968                	addi	a0,sp,156
     384:	a7b5                	j	af0 <_prog_start-0x1ffff510>
     386:	0004                	0x4
     388:	1200                	addi	s0,sp,288
     38a:	705f 0900 77b6      	0x77b60900705f
     390:	00000003          	lb	zero,0(zero) # 0 <_prog_start-0x20000000>
     394:	5f12                	lw	t5,36(sp)
     396:	0072                	c.slli	zero,0x1c
     398:	b709                	j	29a <_prog_start-0x1ffffd66>
     39a:	00000073          	ecall
     39e:	1204                	addi	s1,sp,288
     3a0:	775f 0900 73b8      	0x73b80900775f
     3a6:	0000                	unimp
     3a8:	0800                	addi	s0,sp,16
     3aa:	3d0e                	fld	fs10,224(sp)
     3ac:	0000                	unimp
     3ae:	0900                	addi	s0,sp,144
     3b0:	33b9                	jal	fe <_prog_start-0x1fffff02>
     3b2:	0000                	unimp
     3b4:	0c00                	addi	s0,sp,528
     3b6:	070e                	slli	a4,a4,0x3
     3b8:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     3bc:	33ba                	fld	ft7,424(sp)
     3be:	0000                	unimp
     3c0:	0e00                	addi	s0,sp,784
     3c2:	5f12                	lw	t5,36(sp)
     3c4:	6662                	flw	fa2,24(sp)
     3c6:	0900                	addi	s0,sp,144
     3c8:	000352bb          	0x352bb
     3cc:	1000                	addi	s0,sp,32
     3ce:	340e                	fld	fs0,224(sp)
     3d0:	0000                	unimp
     3d2:	0900                	addi	s0,sp,144
     3d4:	73bc                	flw	fa5,96(a5)
     3d6:	0000                	unimp
     3d8:	1800                	addi	s0,sp,48
     3da:	840e                	mv	s0,gp
     3dc:	0000                	unimp
     3de:	0900                	addi	s0,sp,144
     3e0:	00016ac3          	fmadd.s	fs5,ft2,ft0,ft0,unknown
     3e4:	1c00                	addi	s0,sp,560
     3e6:	5b0e                	lw	s6,224(sp)
     3e8:	0000                	unimp
     3ea:	0900                	addi	s0,sp,144
     3ec:	02c5                	addi	t0,t0,17
     3ee:	0006                	c.slli	zero,0x1
     3f0:	2000                	fld	fs0,0(s0)
     3f2:	520e                	lw	tp,224(sp)
     3f4:	09000007          	0x9000007
     3f8:	00062cc7          	fmsub.s	fs9,fa2,ft0,ft0,rdn
     3fc:	2400                	fld	fs0,8(s0)
     3fe:	930e                	add	t1,t1,gp
     400:	0005                	c.nop	1
     402:	0900                	addi	s0,sp,144
     404:	50ca                	lw	ra,176(sp)
     406:	0006                	c.slli	zero,0x1
     408:	2800                	fld	fs0,16(s0)
     40a:	a40e                	fsd	ft3,8(sp)
     40c:	0002                	c.slli64	zero
     40e:	0900                	addi	s0,sp,144
     410:	00066acb          	fnmsub.s	fs5,fa2,ft0,ft0,unknown
     414:	2c00                	fld	fs0,24(s0)
     416:	5f12                	lw	t5,36(sp)
     418:	6275                	lui	tp,0x1d
     41a:	0900                	addi	s0,sp,144
     41c:	52ce                	lw	t0,240(sp)
     41e:	30000003          	lb	zero,768(zero) # 300 <_prog_start-0x1ffffd00>
     422:	5f12                	lw	t5,36(sp)
     424:	7075                	c.lui	zero,0xffffd
     426:	0900                	addi	s0,sp,144
     428:	000377cf          	fnmadd.s	fa5,ft6,ft0,ft0
     42c:	3800                	fld	fs0,48(s0)
     42e:	5f12                	lw	t5,36(sp)
     430:	7275                	lui	tp,0xffffd
     432:	0900                	addi	s0,sp,144
     434:	73d0                	flw	fa2,36(a5)
     436:	0000                	unimp
     438:	3c00                	fld	fs0,56(s0)
     43a:	aa0e                	fsd	ft3,272(sp)
     43c:	0005                	c.nop	1
     43e:	0900                	addi	s0,sp,144
     440:	000670d3          	fadd.s	ft1,fa2,ft0
     444:	4000                	lw	s0,0(s0)
     446:	3b0e                	fld	fs6,224(sp)
     448:	0005                	c.nop	1
     44a:	0900                	addi	s0,sp,144
     44c:	80d4                	0x80d4
     44e:	0006                	c.slli	zero,0x1
     450:	4300                	lw	s0,0(a4)
     452:	5f12                	lw	t5,36(sp)
     454:	626c                	flw	fa1,68(a2)
     456:	0900                	addi	s0,sp,144
     458:	000352d7          	0x352d7
     45c:	4400                	lw	s0,8(s0)
     45e:	f60e                	fsw	ft3,44(sp)
     460:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     464:	73da                	flw	ft7,180(sp)
     466:	0000                	unimp
     468:	4c00                	lw	s0,24(s0)
     46a:	ac0e                	fsd	ft3,24(sp)
     46c:	0001                	nop
     46e:	0900                	addi	s0,sp,144
     470:	0000d7db          	0xd7db
     474:	5000                	lw	s0,32(s0)
     476:	a90e                	fsd	ft3,144(sp)
     478:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     47c:	c5de                	sw	s7,200(sp)
     47e:	0004                	0x4
     480:	5400                	lw	s0,40(s0)
     482:	8a0e                	mv	s4,gp
     484:	09000007          	0x9000007
     488:	5fe2                	lw	t6,56(sp)
     48a:	0001                	nop
     48c:	5800                	lw	s0,48(s0)
     48e:	820e                	mv	tp,gp
     490:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     494:	54e4                	lw	s1,108(s1)
     496:	0001                	nop
     498:	5c00                	lw	s0,56(s0)
     49a:	670e                	flw	fa4,192(sp)
     49c:	0005                	c.nop	1
     49e:	0900                	addi	s0,sp,144
     4a0:	73e5                	lui	t2,0xffff9
     4a2:	0000                	unimp
     4a4:	6400                	flw	fs0,8(s0)
     4a6:	1600                	addi	s0,sp,800
     4a8:	00ed                	addi	ra,ra,27
     4aa:	0000                	unimp
     4ac:	04c5                	addi	s1,s1,17
     4ae:	0000                	unimp
     4b0:	0004c517          	auipc	a0,0x4c
     4b4:	1700                	addi	s0,sp,928
     4b6:	016a                	slli	sp,sp,0x1a
     4b8:	0000                	unimp
     4ba:	00016c17          	auipc	s8,0x16
     4be:	1700                	addi	s0,sp,928
     4c0:	00000073          	ecall
     4c4:	1000                	addi	s0,sp,32
     4c6:	d004                	sw	s1,32(s0)
     4c8:	0004                	0x4
     4ca:	0600                	addi	s0,sp,768
     4cc:	04c5                	addi	s1,s1,17
     4ce:	0000                	unimp
     4d0:	0b18                	addi	a4,sp,400
     4d2:	0005                	c.nop	1
     4d4:	2800                	fld	fs0,16(s0)
     4d6:	0904                	addi	s1,sp,144
     4d8:	0239                	addi	tp,tp,14
     4da:	0602                	c.slli64	a2
     4dc:	0000                	unimp
     4de:	a519                	j	ae4 <_prog_start-0x1ffff51c>
     4e0:	0001                	nop
     4e2:	0900                	addi	s0,sp,144
     4e4:	0073023b          	0x73023b
     4e8:	0000                	unimp
     4ea:	1900                	addi	s0,sp,176
     4ec:	02b6                	slli	t0,t0,0xd
     4ee:	0000                	unimp
     4f0:	4009                	c.li	zero,2
     4f2:	d702                	sw	zero,172(sp)
     4f4:	0006                	c.slli	zero,0x1
     4f6:	0400                	addi	s0,sp,512
     4f8:	6f19                	lui	t5,0x6
     4fa:	0000                	unimp
     4fc:	0900                	addi	s0,sp,144
     4fe:	0240                	addi	s0,sp,260
     500:	000006d7          	0x6d7
     504:	1908                	addi	a0,sp,176
     506:	0599                	addi	a1,a1,6
     508:	0000                	unimp
     50a:	4009                	c.li	zero,2
     50c:	d702                	sw	zero,172(sp)
     50e:	0006                	c.slli	zero,0x1
     510:	0c00                	addi	s0,sp,528
     512:	d219                	beqz	a2,418 <_prog_start-0x1ffffbe8>
     514:	0001                	nop
     516:	0900                	addi	s0,sp,144
     518:	0242                	slli	tp,tp,0x10
     51a:	00000073          	ecall
     51e:	1910                	addi	a2,sp,176
     520:	01b4                	addi	a3,sp,200
     522:	0000                	unimp
     524:	4309                	li	t1,2
     526:	b902                	fsd	ft0,176(sp)
     528:	0008                	0x8
     52a:	1400                	addi	s0,sp,544
     52c:	4e19                	li	t3,6
     52e:	0005                	c.nop	1
     530:	0900                	addi	s0,sp,144
     532:	0246                	slli	tp,tp,0x11
     534:	00000073          	ecall
     538:	1930                	addi	a2,sp,184
     53a:	04f2                	slli	s1,s1,0x1c
     53c:	0000                	unimp
     53e:	4709                	li	a4,2
     540:	ce02                	sw	zero,28(sp)
     542:	0008                	0x8
     544:	3400                	fld	fs0,40(s0)
     546:	ab19                	j	a5c <_prog_start-0x1ffff5a4>
     548:	0002                	c.slli64	zero
     54a:	0900                	addi	s0,sp,144
     54c:	0249                	addi	tp,tp,18
     54e:	00000073          	ecall
     552:	1938                	addi	a4,sp,184
     554:	0314                	addi	a3,sp,384
     556:	0000                	unimp
     558:	4b09                	li	s6,2
     55a:	df02                	sw	zero,188(sp)
     55c:	0008                	0x8
     55e:	3c00                	fld	fs0,56(s0)
     560:	2819                	jal	576 <_prog_start-0x1ffffa8a>
     562:	0001                	nop
     564:	0900                	addi	s0,sp,144
     566:	024e                	slli	tp,tp,0x13
     568:	0218                	addi	a4,sp,256
     56a:	0000                	unimp
     56c:	1940                	addi	s0,sp,180
     56e:	0161                	addi	sp,sp,24
     570:	0000                	unimp
     572:	4f09                	li	t5,2
     574:	7302                	flw	ft6,32(sp)
     576:	0000                	unimp
     578:	4400                	lw	s0,8(s0)
     57a:	0619                	addi	a2,a2,6
     57c:	0002                	c.slli64	zero
     57e:	0900                	addi	s0,sp,144
     580:	0250                	addi	a2,sp,260
     582:	0218                	addi	a4,sp,256
     584:	0000                	unimp
     586:	1948                	addi	a0,sp,180
     588:	02e0                	addi	s0,sp,332
     58a:	0000                	unimp
     58c:	5109                	li	sp,-30
     58e:	e502                	fsw	ft0,136(sp)
     590:	0008                	0x8
     592:	4c00                	lw	s0,24(s0)
     594:	dc19                	beqz	s0,4b2 <_prog_start-0x1ffffb4e>
     596:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     59a:	0254                	addi	a3,sp,260
     59c:	00000073          	ecall
     5a0:	1950                	addi	a2,sp,180
     5a2:	00000437          	lui	s0,0x0
     5a6:	5509                	li	a0,-30
     5a8:	6c02                	flw	fs8,0(sp)
     5aa:	0001                	nop
     5ac:	5400                	lw	s0,40(s0)
     5ae:	d719                	beqz	a4,4bc <_prog_start-0x1ffffb44>
     5b0:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     5b4:	0278                	addi	a4,sp,268
     5b6:	00000897          	auipc	a7,0x0
     5ba:	1a58                	addi	a4,sp,308
     5bc:	037a                	slli	t1,t1,0x1e
     5be:	0000                	unimp
     5c0:	7c09                	lui	s8,0xfffe2
     5c2:	3502                	fld	fa0,32(sp)
     5c4:	48000003          	lb	zero,1152(zero) # 480 <_prog_start-0x1ffffb80>
     5c8:	1a01                	addi	s4,s4,-32
     5ca:	027e                	slli	tp,tp,0x1f
     5cc:	0000                	unimp
     5ce:	7d09                	lui	s10,0xfffe2
     5d0:	f702                	fsw	ft0,172(sp)
     5d2:	0002                	c.slli64	zero
     5d4:	4c00                	lw	s0,24(s0)
     5d6:	1a01                	addi	s4,s4,-32
     5d8:	0265                	addi	tp,tp,25
     5da:	0000                	unimp
     5dc:	8109                	srli	a0,a0,0x2
     5de:	f602                	fsw	ft0,44(sp)
     5e0:	0008                	0x8
     5e2:	dc00                	sw	s0,56(s0)
     5e4:	1a02                	slli	s4,s4,0x20
     5e6:	000004cf          	fnmadd.s	fs1,ft0,ft0,ft0,rne
     5ea:	8609                	srai	a2,a2,0x2
     5ec:	9c02                	jalr	s8
     5ee:	0006                	c.slli	zero,0x1
     5f0:	e000                	fsw	fs0,0(s0)
     5f2:	1a02                	slli	s4,s4,0x20
     5f4:	039e                	slli	t2,t2,0x7
     5f6:	0000                	unimp
     5f8:	8709                	srai	a4,a4,0x2
     5fa:	0202                	c.slli64	tp
     5fc:	0009                	c.nop	2
     5fe:	ec00                	fsw	fs0,24(s0)
     600:	0002                	c.slli64	zero
     602:	0410                	addi	a2,sp,512
     604:	000004a7          	0x4a7
     608:	ed16                	fsw	ft5,152(sp)
     60a:	0000                	unimp
     60c:	2600                	fld	fs0,8(a2)
     60e:	0006                	c.slli	zero,0x1
     610:	1700                	addi	s0,sp,928
     612:	04c5                	addi	s1,s1,17
     614:	0000                	unimp
     616:	00016a17          	auipc	s4,0x16
     61a:	1700                	addi	s0,sp,928
     61c:	0626                	slli	a2,a2,0x9
     61e:	0000                	unimp
     620:	00007317          	auipc	t1,0x7
     624:	0000                	unimp
     626:	0410                	addi	a2,sp,512
     628:	00aa                	slli	ra,ra,0xa
     62a:	0000                	unimp
     62c:	0410                	addi	a2,sp,512
     62e:	0608                	addi	a0,sp,768
     630:	0000                	unimp
     632:	e216                	fsw	ft5,4(sp)
     634:	0000                	unimp
     636:	5000                	lw	s0,32(s0)
     638:	0006                	c.slli	zero,0x1
     63a:	1700                	addi	s0,sp,928
     63c:	04c5                	addi	s1,s1,17
     63e:	0000                	unimp
     640:	00016a17          	auipc	s4,0x16
     644:	1700                	addi	s0,sp,928
     646:	00e2                	slli	ra,ra,0x18
     648:	0000                	unimp
     64a:	00007317          	auipc	t1,0x7
     64e:	0000                	unimp
     650:	0410                	addi	a2,sp,512
     652:	0632                	slli	a2,a2,0xc
     654:	0000                	unimp
     656:	7316                	flw	ft6,100(sp)
     658:	0000                	unimp
     65a:	6a00                	flw	fs0,16(a2)
     65c:	0006                	c.slli	zero,0x1
     65e:	1700                	addi	s0,sp,928
     660:	04c5                	addi	s1,s1,17
     662:	0000                	unimp
     664:	00016a17          	auipc	s4,0x16
     668:	0000                	unimp
     66a:	0410                	addi	a2,sp,512
     66c:	0656                	slli	a2,a2,0x15
     66e:	0000                	unimp
     670:	00002c0b          	0x2c0b
     674:	8000                	0x8000
     676:	0006                	c.slli	zero,0x1
     678:	0c00                	addi	s0,sp,528
     67a:	007a                	c.slli	zero,0x1e
     67c:	0000                	unimp
     67e:	0002                	c.slli64	zero
     680:	00002c0b          	0x2c0b
     684:	9000                	0x9000
     686:	0006                	c.slli	zero,0x1
     688:	0c00                	addi	s0,sp,528
     68a:	007a                	c.slli	zero,0x1e
     68c:	0000                	unimp
     68e:	0000                	unimp
     690:	9c08                	0x9c08
     692:	0001                	nop
     694:	0900                	addi	s0,sp,144
     696:	011f 037d 0000      	0x37d011f
     69c:	0004c91b          	0x4c91b
     6a0:	0c00                	addi	s0,sp,528
     6a2:	2309                	jal	ba4 <_prog_start-0x1ffff45c>
     6a4:	d101                	beqz	a0,5a4 <_prog_start-0x1ffffa5c>
     6a6:	0006                	c.slli	zero,0x1
     6a8:	1900                	addi	s0,sp,176
     6aa:	0582                	c.slli64	a1
     6ac:	0000                	unimp
     6ae:	2509                	jal	cb0 <_prog_start-0x1ffff350>
     6b0:	d101                	beqz	a0,5b0 <_prog_start-0x1ffffa50>
     6b2:	0006                	c.slli	zero,0x1
     6b4:	0000                	unimp
     6b6:	0419                	addi	s0,s0,6
     6b8:	0004                	0x4
     6ba:	0900                	addi	s0,sp,144
     6bc:	0126                	slli	sp,sp,0x9
     6be:	00000073          	ecall
     6c2:	1904                	addi	s1,sp,176
     6c4:	029e                	slli	t0,t0,0x7
     6c6:	0000                	unimp
     6c8:	2709                	jal	dca <_prog_start-0x1ffff236>
     6ca:	d701                	beqz	a4,5d2 <_prog_start-0x1ffffa2e>
     6cc:	0006                	c.slli	zero,0x1
     6ce:	0800                	addi	s0,sp,16
     6d0:	1000                	addi	s0,sp,32
     6d2:	9c04                	0x9c04
     6d4:	0006                	c.slli	zero,0x1
     6d6:	1000                	addi	s0,sp,32
     6d8:	9004                	0x9004
     6da:	0006                	c.slli	zero,0x1
     6dc:	1b00                	addi	s0,sp,432
     6de:	0159                	addi	sp,sp,22
     6e0:	0000                	unimp
     6e2:	090e                	slli	s2,s2,0x3
     6e4:	0712013f 77190000 	0x771900000712013f
     6ec:	0005                	c.nop	1
     6ee:	0900                	addi	s0,sp,144
     6f0:	0140                	addi	s0,sp,132
     6f2:	0712                	slli	a4,a4,0x4
     6f4:	0000                	unimp
     6f6:	1900                	addi	s0,sp,176
     6f8:	02ea                	slli	t0,t0,0x1a
     6fa:	0000                	unimp
     6fc:	4109                	li	sp,2
     6fe:	1201                	addi	tp,tp,-32
     700:	06000007          	0x6000007
     704:	6519                	lui	a0,0x6
     706:	0004                	0x4
     708:	0900                	addi	s0,sp,144
     70a:	0142                	slli	sp,sp,0x10
     70c:	003a                	c.slli	zero,0xe
     70e:	0000                	unimp
     710:	000c                	0xc
     712:	00003a0b          	0x3a0b
     716:	2200                	fld	fs0,0(a2)
     718:	0c000007          	0xc000007
     71c:	007a                	c.slli	zero,0x1e
     71e:	0000                	unimp
     720:	0002                	c.slli64	zero
     722:	d01c                	sw	a5,32(s0)
     724:	5909                	li	s2,-30
     726:	2302                	fld	ft6,0(sp)
     728:	0008                	0x8
     72a:	1900                	addi	s0,sp,176
     72c:	0541                	addi	a0,a0,16
     72e:	0000                	unimp
     730:	5b09                	li	s6,-30
     732:	7a02                	flw	fs4,32(sp)
     734:	0000                	unimp
     736:	0000                	unimp
     738:	d719                	beqz	a4,646 <_prog_start-0x1ffff9ba>
     73a:	0004                	0x4
     73c:	0900                	addi	s0,sp,144
     73e:	025c                	addi	a5,sp,260
     740:	016c                	addi	a1,sp,140
     742:	0000                	unimp
     744:	1904                	addi	s1,sp,176
     746:	0182                	c.slli64	gp
     748:	0000                	unimp
     74a:	5d09                	li	s10,-30
     74c:	2302                	fld	ft6,0(sp)
     74e:	0008                	0x8
     750:	0800                	addi	s0,sp,16
     752:	c019                	beqz	s0,758 <_prog_start-0x1ffff8a8>
     754:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     758:	025e                	slli	tp,tp,0x17
     75a:	022e                	slli	tp,tp,0xb
     75c:	0000                	unimp
     75e:	1924                	addi	s1,sp,184
     760:	02bd                	addi	t0,t0,15
     762:	0000                	unimp
     764:	5f09                	li	t5,-30
     766:	7302                	flw	ft6,32(sp)
     768:	0000                	unimp
     76a:	4800                	lw	s0,16(s0)
     76c:	7d19                	lui	s10,0xfffe6
     76e:	0005                	c.nop	1
     770:	0900                	addi	s0,sp,144
     772:	0260                	addi	s0,sp,268
     774:	006c                	addi	a1,sp,12
     776:	0000                	unimp
     778:	1950                	addi	a2,sp,180
     77a:	00000023          	sb	zero,0(zero) # 0 <_prog_start-0x20000000>
     77e:	6109                	addi	sp,sp,128
     780:	dd02                	sw	zero,184(sp)
     782:	0006                	c.slli	zero,0x1
     784:	5800                	lw	s0,48(s0)
     786:	1c19                	addi	s8,s8,-26
     788:	0002                	c.slli64	zero
     78a:	0900                	addi	s0,sp,144
     78c:	0262                	slli	tp,tp,0x18
     78e:	0154                	addi	a3,sp,132
     790:	0000                	unimp
     792:	1968                	addi	a0,sp,188
     794:	04e4                	addi	s1,sp,588
     796:	0000                	unimp
     798:	6309                	lui	t1,0x2
     79a:	5402                	lw	s0,32(sp)
     79c:	0001                	nop
     79e:	7000                	flw	fs0,32(s0)
     7a0:	0e19                	addi	t3,t3,6
     7a2:	0000                	unimp
     7a4:	0900                	addi	s0,sp,144
     7a6:	0264                	addi	s1,sp,268
     7a8:	0154                	addi	a3,sp,132
     7aa:	0000                	unimp
     7ac:	1978                	addi	a4,sp,188
     7ae:	03ec                	addi	a1,sp,460
     7b0:	0000                	unimp
     7b2:	6509                	lui	a0,0x2
     7b4:	3302                	fld	ft6,32(sp)
     7b6:	0008                	0x8
     7b8:	8000                	0x8000
     7ba:	2819                	jal	7d0 <_prog_start-0x1ffff830>
     7bc:	0000                	unimp
     7be:	0900                	addi	s0,sp,144
     7c0:	0266                	slli	tp,tp,0x19
     7c2:	00000843          	fmadd.s	fa6,ft0,ft0,ft0,rne
     7c6:	1988                	addi	a0,sp,240
     7c8:	0458                	addi	a4,sp,516
     7ca:	0000                	unimp
     7cc:	6709                	lui	a4,0x2
     7ce:	7302                	flw	ft6,32(sp)
     7d0:	0000                	unimp
     7d2:	a000                	fsd	fs0,0(s0)
     7d4:	6119                	addi	sp,sp,384
     7d6:	0000                	unimp
     7d8:	0900                	addi	s0,sp,144
     7da:	0268                	addi	a0,sp,268
     7dc:	0154                	addi	a3,sp,132
     7de:	0000                	unimp
     7e0:	19a4                	addi	s1,sp,248
     7e2:	0000026f          	jal	tp,7e2 <_prog_start-0x1ffff81e>
     7e6:	6909                	lui	s2,0x2
     7e8:	5402                	lw	s0,32(sp)
     7ea:	0001                	nop
     7ec:	ac00                	fsd	fs0,24(s0)
     7ee:	dd19                	beqz	a0,70c <_prog_start-0x1ffff8f4>
     7f0:	0001                	nop
     7f2:	0900                	addi	s0,sp,144
     7f4:	026a                	slli	tp,tp,0x1a
     7f6:	0154                	addi	a3,sp,132
     7f8:	0000                	unimp
     7fa:	19b4                	addi	a3,sp,248
     7fc:	02f8                	addi	a4,sp,332
     7fe:	0000                	unimp
     800:	6b09                	lui	s6,0x2
     802:	5402                	lw	s0,32(sp)
     804:	0001                	nop
     806:	bc00                	fsd	fs0,56(s0)
     808:	0b19                	addi	s6,s6,6
     80a:	0002                	c.slli64	zero
     80c:	0900                	addi	s0,sp,144
     80e:	026c                	addi	a1,sp,268
     810:	0154                	addi	a3,sp,132
     812:	0000                	unimp
     814:	19c4                	addi	s1,sp,244
     816:	000001a3          	sb	zero,3(zero) # 3 <_prog_start-0x1ffffffd>
     81a:	6d09                	lui	s10,0x2
     81c:	7302                	flw	ft6,32(sp)
     81e:	0000                	unimp
     820:	cc00                	sw	s0,24(s0)
     822:	0b00                	addi	s0,sp,400
     824:	000000a3          	sb	zero,1(zero) # 1 <_prog_start-0x1fffffff>
     828:	00000833          	add	a6,zero,zero
     82c:	7a0c                	flw	fa1,48(a2)
     82e:	0000                	unimp
     830:	1900                	addi	s0,sp,176
     832:	0b00                	addi	s0,sp,400
     834:	000000a3          	sb	zero,1(zero) # 1 <_prog_start-0x1fffffff>
     838:	00000843          	fmadd.s	fa6,ft0,ft0,ft0,rne
     83c:	7a0c                	flw	fa1,48(a2)
     83e:	0000                	unimp
     840:	0700                	addi	s0,sp,896
     842:	0b00                	addi	s0,sp,400
     844:	000000a3          	sb	zero,1(zero) # 1 <_prog_start-0x1fffffff>
     848:	00000853          	fadd.s	fa6,ft0,ft0,rne
     84c:	7a0c                	flw	fa1,48(a2)
     84e:	0000                	unimp
     850:	1700                	addi	s0,sp,928
     852:	1c00                	addi	s0,sp,560
     854:	09f0                	addi	a2,sp,220
     856:	0272                	slli	tp,tp,0x1c
     858:	00000877          	0x877
     85c:	5219                	li	tp,-26
     85e:	0001                	nop
     860:	0900                	addi	s0,sp,144
     862:	0275                	addi	tp,tp,29
     864:	00000877          	0x877
     868:	1900                	addi	s0,sp,176
     86a:	05a1                	addi	a1,a1,8
     86c:	0000                	unimp
     86e:	7609                	lui	a2,0xfffe2
     870:	8702                	jr	a4
     872:	0008                	0x8
     874:	7800                	flw	fs0,48(s0)
     876:	0b00                	addi	s0,sp,400
     878:	00000377          	0x377
     87c:	00000887          	0x887
     880:	7a0c                	flw	fa1,48(a2)
     882:	0000                	unimp
     884:	1d00                	addi	s0,sp,688
     886:	0b00                	addi	s0,sp,400
     888:	007a                	c.slli	zero,0x1e
     88a:	0000                	unimp
     88c:	00000897          	auipc	a7,0x0
     890:	7a0c                	flw	fa1,48(a2)
     892:	0000                	unimp
     894:	1d00                	addi	s0,sp,688
     896:	1d00                	addi	s0,sp,688
     898:	09f0                	addi	a2,sp,220
     89a:	08b90257          	0x8b90257
     89e:	0000                	unimp
     8a0:	0b1e                	slli	s6,s6,0x7
     8a2:	0005                	c.nop	1
     8a4:	0900                	addi	s0,sp,144
     8a6:	026e                	slli	tp,tp,0x1b
     8a8:	0722                	slli	a4,a4,0x8
     8aa:	0000                	unimp
     8ac:	cf1e                	sw	t2,156(sp)
     8ae:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
     8b2:	08530277          	0x8530277
     8b6:	0000                	unimp
     8b8:	0b00                	addi	s0,sp,400
     8ba:	000000a3          	sb	zero,1(zero) # 1 <_prog_start-0x1fffffff>
     8be:	08c9                	addi	a7,a7,18
     8c0:	0000                	unimp
     8c2:	7a0c                	flw	fa1,48(a2)
     8c4:	0000                	unimp
     8c6:	1800                	addi	s0,sp,48
     8c8:	1f00                	addi	s0,sp,944
     8ca:	0588                	addi	a0,sp,704
     8cc:	0000                	unimp
     8ce:	0410                	addi	a2,sp,512
     8d0:	08c9                	addi	a7,a7,18
     8d2:	0000                	unimp
     8d4:	df20                	sw	s0,120(a4)
     8d6:	0008                	0x8
     8d8:	1700                	addi	s0,sp,928
     8da:	04c5                	addi	s1,s1,17
     8dc:	0000                	unimp
     8de:	1000                	addi	s0,sp,32
     8e0:	d404                	sw	s1,40(s0)
     8e2:	0008                	0x8
     8e4:	1000                	addi	s0,sp,32
     8e6:	1804                	addi	s1,sp,48
     8e8:	0002                	c.slli64	zero
     8ea:	2000                	fld	fs0,0(s0)
     8ec:	08f6                	slli	a7,a7,0x1d
     8ee:	0000                	unimp
     8f0:	00007317          	auipc	t1,0x7
     8f4:	0000                	unimp
     8f6:	0410                	addi	a2,sp,512
     8f8:	08fc                	addi	a5,sp,92
     8fa:	0000                	unimp
     8fc:	0410                	addi	a2,sp,512
     8fe:	000008eb          	0x8eb
     902:	0006900b          	0x6900b
     906:	1200                	addi	s0,sp,288
     908:	0009                	c.nop	2
     90a:	0c00                	addi	s0,sp,528
     90c:	007a                	c.slli	zero,0x1e
     90e:	0000                	unimp
     910:	0002                	c.slli64	zero
     912:	9321                	srli	a4,a4,0x28
     914:	0000                	unimp
     916:	0900                	addi	s0,sp,144
     918:	02fe                	slli	t0,t0,0x1f
     91a:	04c5                	addi	s1,s1,17
     91c:	0000                	unimp
     91e:	8c21                	xor	s0,s0,s0
     920:	0000                	unimp
     922:	0900                	addi	s0,sp,144
     924:	02ff                	0x2ff
     926:	000004cb          	fnmsub.s	fs1,ft0,ft0,ft0,rne
     92a:	0000aa0b          	0xaa0b
     92e:	3500                	fld	fs0,40(a0)
     930:	0009                	c.nop	2
     932:	2200                	fld	fs0,0(a2)
     934:	0600                	addi	s0,sp,768
     936:	092a                	slli	s2,s2,0xa
     938:	0000                	unimp
     93a:	0004fa07          	0x4fa07
     93e:	0a00                	addi	s0,sp,272
     940:	35a5                	jal	7a8 <_prog_start-0x1ffff858>
     942:	0009                	c.nop	2
     944:	2300                	fld	fs0,0(a4)
     946:	036a                	slli	t1,t1,0x1a
     948:	0000                	unimp
     94a:	1e01                	addi	t3,t3,-32
     94c:	00000073          	ecall
     950:	0240                	addi	s0,sp,260
     952:	2000                	fld	fs0,0(s0)
     954:	026a                	slli	tp,tp,0x1a
     956:	0000                	unimp
     958:	9c01                	0x9c01
     95a:	09c0                	addi	s0,sp,212
     95c:	0000                	unimp
     95e:	6e24                	flw	fs1,88(a2)
     960:	0100776f          	jal	a4,7970 <_prog_start-0x1fff8690>
     964:	9720                	0x9720
     966:	0000                	unimp
     968:	0200                	addi	s0,sp,256
     96a:	6091                	lui	ra,0x4
     96c:	f925                	bnez	a0,8dc <_prog_start-0x1ffff724>
     96e:	0001                	nop
     970:	0100                	addi	s0,sp,128
     972:	9721                	srai	a4,a4,0x28
     974:	0000                	unimp
     976:	0200                	addi	s0,sp,256
     978:	6891                	lui	a7,0x4
     97a:	2d26                	fld	fs10,72(sp)
     97c:	0004                	0x4
     97e:	0100                	addi	s0,sp,128
     980:	00034baf          	0x34baf
     984:	0000                	unimp
     986:	0000                	unimp
     988:	2700                	fld	fs0,8(a4)
     98a:	0000                	unimp
     98c:	0000                	unimp
     98e:	09a2                	slli	s3,s3,0x8
     990:	0000                	unimp
     992:	4426                	lw	s0,72(sp)
     994:	0000                	unimp
     996:	0100                	addi	s0,sp,128
     998:	8154                	0x8154
     99a:	0000                	unimp
     99c:	1800                	addi	s0,sp,48
     99e:	0000                	unimp
     9a0:	0000                	unimp
     9a2:	d428                	sw	a0,104(s0)
     9a4:	c0200003          	lb	zero,-1022(zero) # fffffc02 <_sp+0x7fffbc02>
     9a8:	0009                	c.nop	2
     9aa:	2800                	fld	fs0,16(s0)
     9ac:	03d8                	addi	a4,sp,452
     9ae:	2000                	fld	fs0,0(s0)
     9b0:	000009cb          	fnmsub.s	fs3,ft0,ft0,ft0,rne
     9b4:	de29                	beqz	a2,90e <_prog_start-0x1ffff6f2>
     9b6:	05200003          	lb	zero,82(zero) # 52 <_prog_start-0x1fffffae>
     9ba:	000c                	0xc
     9bc:	0100                	addi	s0,sp,128
     9be:	0020                	addi	s0,sp,8
     9c0:	5d2a                	lw	s10,168(sp)
     9c2:	5d000003          	lb	zero,1488(zero) # 5d0 <_prog_start-0x1ffffa30>
     9c6:	04000003          	lb	zero,64(zero) # 40 <_prog_start-0x1fffffc0>
     9ca:	2a25                	jal	b02 <_prog_start-0x1ffff4fe>
     9cc:	0000036f          	jal	t1,9cc <_prog_start-0x1ffff634>
     9d0:	0000036f          	jal	t1,9d0 <_prog_start-0x1ffff630>
     9d4:	6d00360b          	0x6d00360b
     9d8:	0001                	nop
     9da:	0400                	addi	s0,sp,512
     9dc:	1500                	addi	s0,sp,672
     9de:	0002                	c.slli64	zero
     9e0:	0400                	addi	s0,sp,512
     9e2:	7101                	addi	sp,sp,-512
     9e4:	0004                	0x4
     9e6:	0c00                	addi	s0,sp,528
     9e8:	000005c7          	fmsub.s	fa1,ft0,ft0,ft0,rne
     9ec:	0229                	addi	tp,tp,10
     9ee:	0000                	unimp
     9f0:	04aa                	slli	s1,s1,0xa
     9f2:	2000                	fld	fs0,0(s0)
     9f4:	0092                	slli	ra,ra,0x4
     9f6:	0000                	unimp
     9f8:	00000553          	fadd.s	fa0,ft0,ft0,rne
     9fc:	0102                	c.slli64	sp
     9fe:	4106                	lw	sp,64(sp)
     a00:	0004                	0x4
     a02:	0200                	addi	s0,sp,256
     a04:	0801                	addi	a6,a6,0
     a06:	0000043f 8b050202 	0x8b0502020000043f
     a0e:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
     a12:	0702                	c.slli64	a4
     a14:	0512                	slli	a0,a0,0x4
     a16:	0000                	unimp
     a18:	0402                	c.slli64	s0
     a1a:	d105                	beqz	a0,93a <_prog_start-0x1ffff6c6>
     a1c:	0002                	c.slli64	zero
     a1e:	0300                	addi	s0,sp,384
     a20:	044d                	addi	s0,s0,19
     a22:	0000                	unimp
     a24:	4f02                	lw	t5,0(sp)
     a26:	00000053          	fadd.s	ft0,ft0,ft0,rne
     a2a:	0402                	c.slli64	s0
     a2c:	00017007          	0x17007
     a30:	0200                	addi	s0,sp,256
     a32:	0508                	addi	a0,sp,640
     a34:	02cc                	addi	a1,sp,324
     a36:	0000                	unimp
     a38:	0802                	c.slli64	a6
     a3a:	00016b07          	0x16b07
     a3e:	0400                	addi	s0,sp,512
     a40:	0504                	addi	s1,sp,640
     a42:	6e69                	lui	t3,0x1a
     a44:	0074                	addi	a3,sp,12
     a46:	0402                	c.slli64	s0
     a48:	00017507          	0x17507
     a4c:	0300                	addi	s0,sp,384
     a4e:	0000044f          	fnmadd.s	fs0,ft0,ft0,ft0,rne
     a52:	00483003          	0x483003
     a56:	0000                	unimp
     a58:	0e05                	addi	t3,t3,1
     a5a:	0006                	c.slli	zero,0x1
     a5c:	0100                	addi	s0,sp,128
     a5e:	683a                	flw	fa6,140(sp)
     a60:	0000                	unimp
     a62:	2a00                	fld	fs0,16(a2)
     a64:	0005                	c.nop	1
     a66:	1220                	addi	s0,sp,296
     a68:	0000                	unimp
     a6a:	0100                	addi	s0,sp,128
     a6c:	ac9c                	fsd	fa5,24(s1)
     a6e:	0000                	unimp
     a70:	0600                	addi	s0,sp,768
     a72:	0534                	addi	a3,sp,648
     a74:	2000                	fld	fs0,0(s0)
     a76:	0000014f          	fnmadd.s	ft2,ft0,ft0,ft0,rne
     a7a:	035a0107          	0x35a0107
     a7e:	3f40                	fld	fs0,184(a4)
     a80:	0024                	addi	s1,sp,8
     a82:	0800                	addi	s0,sp,16
     a84:	05b0                	addi	a2,sp,712
     a86:	0000                	unimp
     a88:	2401                	jal	c88 <_prog_start-0x1ffff378>
     a8a:	0068                	addi	a0,sp,12
     a8c:	0000                	unimp
     a8e:	04f8                	addi	a4,sp,588
     a90:	2000                	fld	fs0,0(s0)
     a92:	0032                	c.slli	zero,0xc
     a94:	0000                	unimp
     a96:	9c01                	0x9c01
     a98:	0115                	addi	sp,sp,5
     a9a:	0000                	unimp
     a9c:	6609                	lui	a2,0x2
     a9e:	6f6e                	flw	ft10,216(sp)
     aa0:	0100                	addi	s0,sp,128
     aa2:	6824                	flw	fs1,80(s0)
     aa4:	0000                	unimp
     aa6:	3600                	fld	fs0,40(a2)
     aa8:	0000                	unimp
     aaa:	0a00                	addi	s0,sp,272
     aac:	6772                	flw	fa4,28(sp)
     aae:	0062                	c.slli	zero,0x18
     ab0:	2601                	jal	db0 <_prog_start-0x1ffff250>
     ab2:	0068                	addi	a0,sp,12
     ab4:	0000                	unimp
     ab6:	0064                	addi	s1,sp,12
     ab8:	0000                	unimp
     aba:	0005140b          	0x5140b
     abe:	4f20                	lw	s0,88(a4)
     ac0:	0001                	nop
     ac2:	0300                	addi	s0,sp,384
     ac4:	0001                	nop
     ac6:	0700                	addi	s0,sp,896
     ac8:	5a01                	li	s4,-32
     aca:	f30e                	fsw	ft3,164(sp)
     acc:	5a01                	li	s4,-32
     ace:	1c31                	addi	s8,s8,-20
     ad0:	2432                	fld	fs0,264(sp)
     ad2:	001ec003          	lbu	zero,1(t4)
     ad6:	2220                	fld	fs0,64(a2)
     ad8:	0006                	c.slli	zero,0x1
     ada:	2206                	fld	ft4,64(sp)
     adc:	0005                	c.nop	1
     ade:	4f20                	lw	s0,88(a4)
     ae0:	0001                	nop
     ae2:	0700                	addi	s0,sp,896
     ae4:	5a01                	li	s4,-32
     ae6:	24424003          	lbu	zero,580(tp) # ffffd244 <_sp+0x7fff9244>
     aea:	0000                	unimp
     aec:	1705                	addi	a4,a4,-31
     aee:	0006                	c.slli	zero,0x1
     af0:	0100                	addi	s0,sp,128
     af2:	00006813          	ori	a6,zero,0
     af6:	ce00                	sw	s0,24(a2)
     af8:	0004                	0x4
     afa:	2a20                	fld	fs0,80(a2)
     afc:	0000                	unimp
     afe:	0100                	addi	s0,sp,128
     b00:	4f9c                	lw	a5,24(a5)
     b02:	0001                	nop
     b04:	0c00                	addi	s0,sp,528
     b06:	0604                	addi	s1,sp,768
     b08:	0000                	unimp
     b0a:	1701                	addi	a4,a4,-32
     b0c:	0076                	c.slli	zero,0x1d
     b0e:	0000                	unimp
     b10:	0030                	addi	a2,sp,8
     b12:	0068                	addi	a0,sp,12
     b14:	f006                	fsw	ft1,32(sp)
     b16:	0004                	0x4
     b18:	4f20                	lw	s0,88(a4)
     b1a:	0001                	nop
     b1c:	0700                	addi	s0,sp,896
     b1e:	5a01                	li	s4,-32
     b20:	24414003          	lbu	zero,580(sp)
     b24:	0000                	unimp
     b26:	b90d                	j	758 <_prog_start-0x1ffff8a8>
     b28:	0005                	c.nop	1
     b2a:	0100                	addi	s0,sp,128
     b2c:	aa08                	fsd	fa0,16(a2)
     b2e:	0004                	0x4
     b30:	2420                	fld	fs0,72(s0)
     b32:	0000                	unimp
     b34:	0100                	addi	s0,sp,128
     b36:	099c                	addi	a5,sp,208
     b38:	6772                	flw	fa4,28(sp)
     b3a:	0062                	c.slli	zero,0x18
     b3c:	0801                	addi	a6,a6,0
     b3e:	0076                	c.slli	zero,0x1d
     b40:	0000                	unimp
     b42:	0088                	addi	a0,sp,64
     b44:	0000                	unimp
     b46:	0000                	unimp
     b48:	1528                	addi	a0,sp,680
     b4a:	0000                	unimp
     b4c:	0004                	0x4
     b4e:	000002eb          	0x2eb
     b52:	0104                	addi	s1,sp,128
     b54:	0471                	addi	s0,s0,28
     b56:	0000                	unimp
     b58:	ba0c                	fsd	fa1,48(a2)
     b5a:	29000007          	0x29000007
     b5e:	0002                	c.slli64	zero
     b60:	3c00                	fld	fs0,56(s0)
     b62:	0005                	c.nop	1
     b64:	be20                	fsd	fs0,120(a2)
     b66:	000c                	0xc
     b68:	5900                	lw	s0,48(a0)
     b6a:	02000007          	0x2000007
     b6e:	0704                	addi	s1,sp,896
     b70:	0175                	addi	sp,sp,29
     b72:	0000                	unimp
     b74:	0102                	c.slli64	sp
     b76:	4106                	lw	sp,64(sp)
     b78:	0004                	0x4
     b7a:	0200                	addi	s0,sp,256
     b7c:	0801                	addi	a6,a6,0
     b7e:	0000043f 8b050202 	0x8b0502020000043f
     b86:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
     b8a:	0702                	c.slli64	a4
     b8c:	0512                	slli	a0,a0,0x4
     b8e:	0000                	unimp
     b90:	0007b003          	0x7b003
     b94:	0200                	addi	s0,sp,256
     b96:	534d                	li	t1,-13
     b98:	0000                	unimp
     b9a:	0200                	addi	s0,sp,256
     b9c:	0504                	addi	s1,sp,640
     b9e:	02d1                	addi	t0,t0,20
     ba0:	0000                	unimp
     ba2:	00044d03          	lbu	s10,0(s0) # 0 <_prog_start-0x20000000>
     ba6:	0200                	addi	s0,sp,256
     ba8:	0000654f          	fnmadd.s	fa0,ft0,ft0,ft0,unknown
     bac:	0200                	addi	s0,sp,256
     bae:	0704                	addi	s1,sp,896
     bb0:	0170                	addi	a2,sp,140
     bb2:	0000                	unimp
     bb4:	0802                	c.slli64	a6
     bb6:	cc05                	beqz	s0,bee <_prog_start-0x1ffff412>
     bb8:	0002                	c.slli64	zero
     bba:	0300                	addi	s0,sp,384
     bbc:	01ee                	slli	gp,gp,0x1b
     bbe:	0000                	unimp
     bc0:	6902                	flw	fs2,0(sp)
     bc2:	007e                	c.slli	zero,0x1f
     bc4:	0000                	unimp
     bc6:	0802                	c.slli64	a6
     bc8:	00016b07          	0x16b07
     bcc:	0400                	addi	s0,sp,512
     bce:	0504                	addi	s1,sp,640
     bd0:	6e69                	lui	t3,0x1a
     bd2:	0074                	addi	a3,sp,12
     bd4:	8505                	srai	a0,a0,0x1
     bd6:	0000                	unimp
     bd8:	0600                	addi	s0,sp,768
     bda:	0025                	c.nop	9
     bdc:	0000                	unimp
     bde:	0007b203          	0x7b203
     be2:	0300                	addi	s0,sp,384
     be4:	482c                	lw	a1,80(s0)
     be6:	0000                	unimp
     be8:	0300                	addi	s0,sp,384
     bea:	0000044f          	fnmadd.s	fs0,ft0,ft0,ft0,rne
     bee:	005a3003          	0x5a3003
     bf2:	0000                	unimp
     bf4:	0001f003          	0x1f003
     bf8:	0300                	addi	s0,sp,384
     bfa:	733c                	flw	fa5,96(a4)
     bfc:	0000                	unimp
     bfe:	0600                	addi	s0,sp,768
     c00:	00ac                	addi	a1,sp,72
     c02:	0000                	unimp
     c04:	00050403          	lb	s0,0(a0) # 2000 <_prog_start-0x1fffe000>
     c08:	0400                	addi	s0,sp,512
     c0a:	25d8                	fld	fa4,136(a1)
     c0c:	0000                	unimp
     c0e:	0200                	addi	s0,sp,256
     c10:	0410                	addi	a2,sp,512
     c12:	0351                	addi	t1,t1,20
     c14:	0000                	unimp
     c16:	00d40407          	0xd40407
     c1a:	0000                	unimp
     c1c:	0102                	c.slli64	sp
     c1e:	4808                	lw	a0,16(s0)
     c20:	0004                	0x4
     c22:	0600                	addi	s0,sp,768
     c24:	00d4                	addi	a3,sp,68
     c26:	0000                	unimp
     c28:	8708                	0x8708
     c2a:	0002                	c.slli64	zero
     c2c:	0500                	addi	s0,sp,640
     c2e:	eb10                	fsw	fa2,16(a4)
     c30:	0000                	unimp
     c32:	0700                	addi	s0,sp,896
     c34:	ce04                	sw	s1,24(a2)
     c36:	0000                	unimp
     c38:	0800                	addi	s0,sp,16
     c3a:	034a                	slli	t1,t1,0x12
     c3c:	0000                	unimp
     c3e:	e205                	bnez	a2,c5e <_prog_start-0x1ffff3a2>
     c40:	00ce                	slli	ra,ra,0x13
     c42:	0000                	unimp
     c44:	0d08                	addi	a0,sp,656
     c46:	05000003          	lb	zero,80(zero) # 50 <_prog_start-0x1fffffb0>
     c4a:	000085e3          	beqz	ra,1454 <_prog_start-0x1fffebac>
     c4e:	0800                	addi	s0,sp,16
     c50:	0142                	slli	sp,sp,0x10
     c52:	0000                	unimp
     c54:	e305                	bnez	a4,c74 <_prog_start-0x1ffff38c>
     c56:	0085                	addi	ra,ra,1
     c58:	0000                	unimp
     c5a:	1c08                	addi	a0,sp,560
     c5c:	0000                	unimp
     c5e:	0500                	addi	s0,sp,640
     c60:	000085e3          	beqz	ra,146a <_prog_start-0x1fffeb96>
     c64:	0800                	addi	s0,sp,16
     c66:	0395                	addi	t2,t2,5
     c68:	0000                	unimp
     c6a:	e505                	bnez	a0,c92 <_prog_start-0x1ffff36e>
     c6c:	0085                	addi	ra,ra,1
     c6e:	0000                	unimp
     c70:	1e09                	addi	t3,t3,-30
     c72:	0004                	0x4
     c74:	0100                	addi	s0,sp,128
     c76:	853c                	0x853c
     c78:	0000                	unimp
     c7a:	0500                	addi	s0,sp,640
     c7c:	00060003          	lb	zero,0(a2) # 2000 <_prog_start-0x1fffe000>
     c80:	0980                	addi	s0,sp,208
     c82:	00000673          	0x673
     c86:	3e01                	jal	796 <_prog_start-0x1ffff86a>
     c88:	00a1                	addi	ra,ra,8
     c8a:	0000                	unimp
     c8c:	0305                	addi	t1,t1,1
     c8e:	05c0                	addi	s0,sp,708
     c90:	8000                	0x8000
     c92:	5d0a                	lw	s10,160(sp)
     c94:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     c98:	022e                	slli	tp,tp,0xb
     c9a:	110e                	slli	sp,sp,0x23
     c9c:	2000                	fld	fs0,0(s0)
     c9e:	00ec                	addi	a1,sp,76
     ca0:	0000                	unimp
     ca2:	9c01                	0x9c01
     ca4:	0200                	addi	s0,sp,256
     ca6:	0000                	unimp
     ca8:	0100690b          	0x100690b
     cac:	025a                	slli	tp,tp,0x16
     cae:	008c                	addi	a1,sp,64
     cb0:	0000                	unimp
     cb2:	9102                	jalr	sp
     cb4:	0c6c                	addi	a1,sp,540
     cb6:	111c                	addi	a5,sp,160
     cb8:	2000                	fld	fs0,0(s0)
     cba:	0004                	0x4
     cbc:	0000                	unimp
     cbe:	00000187          	0x187
     cc2:	d40d                	beqz	s0,bec <_prog_start-0x1ffff414>
     cc4:	0006                	c.slli	zero,0x1
     cc6:	0100                	addi	s0,sp,128
     cc8:	0235                	addi	tp,tp,13
     cca:	0065                	c.nop	25
     ccc:	0000                	unimp
     cce:	0e00                	addi	s0,sp,784
     cd0:	119e                	slli	gp,gp,0x27
     cd2:	2000                	fld	fs0,0(s0)
     cd4:	0200                	addi	s0,sp,256
     cd6:	0000                	unimp
     cd8:	0011aa0f          	0x11aa0f
     cdc:	9020                	0x9020
     cde:	000d                	c.nop	3
     ce0:	a700                	fsd	fs0,8(a4)
     ce2:	0001                	nop
     ce4:	1000                	addi	s0,sp,32
     ce6:	5a01                	li	s4,-32
     ce8:	0305                	addi	t1,t1,1
     cea:	1ef8                	addi	a4,sp,892
     cec:	2000                	fld	fs0,0(s0)
     cee:	0f00                	addi	s0,sp,912
     cf0:	11b6                	slli	gp,gp,0x2d
     cf2:	2000                	fld	fs0,0(s0)
     cf4:	0d90                	addi	a2,sp,720
     cf6:	0000                	unimp
     cf8:	01be                	slli	gp,gp,0xf
     cfa:	0000                	unimp
     cfc:	0110                	addi	a2,sp,128
     cfe:	055a                	slli	a0,a0,0x16
     d00:	001f0003          	lb	zero,1(t5) # 6001 <_prog_start-0x1fff9fff>
     d04:	0020                	addi	s0,sp,8
     d06:	0011c20f          	0x11c20f
     d0a:	9020                	0x9020
     d0c:	000d                	c.nop	3
     d0e:	d500                	sw	s0,40(a0)
     d10:	0001                	nop
     d12:	1000                	addi	s0,sp,32
     d14:	5a01                	li	s4,-32
     d16:	0305                	addi	t1,t1,1
     d18:	1f08                	addi	a0,sp,944
     d1a:	2000                	fld	fs0,0(s0)
     d1c:	0f00                	addi	s0,sp,912
     d1e:	11ce                	slli	gp,gp,0x33
     d20:	2000                	fld	fs0,0(s0)
     d22:	0d90                	addi	a2,sp,720
     d24:	0000                	unimp
     d26:	01ec                	addi	a1,sp,204
     d28:	0000                	unimp
     d2a:	0110                	addi	a2,sp,128
     d2c:	055a                	slli	a0,a0,0x16
     d2e:	001f1003          	lh	zero,1(t5)
     d32:	0020                	addi	s0,sp,8
     d34:	de11                	beqz	a2,c50 <_prog_start-0x1ffff3b0>
     d36:	0011                	c.nop	4
     d38:	9020                	0x9020
     d3a:	000d                	c.nop	3
     d3c:	1000                	addi	s0,sp,32
     d3e:	5a01                	li	s4,-32
     d40:	0305                	addi	t1,t1,1
     d42:	1f1c                	addi	a5,sp,944
     d44:	2000                	fld	fs0,0(s0)
     d46:	0000                	unimp
     d48:	6b12                	flw	fs6,4(sp)
     d4a:	0006                	c.slli	zero,0x1
     d4c:	0100                	addi	s0,sp,128
     d4e:	021c                	addi	a5,sp,256
     d50:	00a1                	addi	ra,ra,8
     d52:	0000                	unimp
     d54:	10ac                	addi	a1,sp,104
     d56:	2000                	fld	fs0,0(s0)
     d58:	0062                	c.slli	zero,0x18
     d5a:	0000                	unimp
     d5c:	9c01                	0x9c01
     d5e:	02b0                	addi	a2,sp,328
     d60:	0000                	unimp
     d62:	170d                	addi	a4,a4,-29
     d64:	01000007          	0x1000007
     d68:	0225                	addi	tp,tp,9
     d6a:	00a1                	addi	ra,ra,8
     d6c:	0000                	unimp
     d6e:	000f5813          	srli	a6,t5,0x0
     d72:	ba00                	fsd	fs0,48(a2)
     d74:	0010                	0x10
     d76:	9820                	0x9820
     d78:	0002                	c.slli64	zero
     d7a:	0100                	addi	s0,sp,128
     d7c:	0225                	addi	tp,tp,9
     d7e:	7114                	flw	fa3,32(a0)
     d80:	a900000f          	0xa900000f
     d84:	0000                	unimp
     d86:	1400                	addi	s0,sp,544
     d88:	0f68                	addi	a0,sp,924
     d8a:	0000                	unimp
     d8c:	000000bf 00029815 	0x29815000000bf
     d94:	1600                	addi	s0,sp,800
     d96:	1282                	slli	t0,t0,0x20
     d98:	0000                	unimp
     d9a:	8916                	mv	s2,t0
     d9c:	0012                	c.slli	zero,0x4
     d9e:	1600                	addi	s0,sp,800
     da0:	128e                	slli	t0,t0,0x23
     da2:	0000                	unimp
     da4:	9316                	add	t1,t1,t0
     da6:	0012                	c.slli	zero,0x4
     da8:	1700                	addi	s0,sp,928
     daa:	0fa9                	addi	t6,t6,10
     dac:	0000                	unimp
     dae:	10ca                	slli	ra,ra,0x32
     db0:	2000                	fld	fs0,0(s0)
     db2:	0008                	0x8
     db4:	0000                	unimp
     db6:	5401                	li	s0,-32
     db8:	0289                	addi	t0,t0,2
     dba:	0000                	unimp
     dbc:	ca18                	sw	a4,16(a2)
     dbe:	0010                	0x10
     dc0:	0820                	addi	s0,sp,24
     dc2:	0000                	unimp
     dc4:	1600                	addi	s0,sp,800
     dc6:	1250                	addi	a2,sp,292
     dc8:	0000                	unimp
     dca:	5716                	lw	a4,100(sp)
     dcc:	0012                	c.slli	zero,0x4
     dce:	0000                	unimp
     dd0:	1900                	addi	s0,sp,176
     dd2:	0fa9                	addi	t6,t6,10
     dd4:	0000                	unimp
     dd6:	10e2                	slli	ra,ra,0x38
     dd8:	2000                	fld	fs0,0(s0)
     dda:	0008                	0x8
     ddc:	0000                	unimp
     dde:	5801                	li	a6,-32
     de0:	e218                	fsw	fa4,0(a2)
     de2:	0010                	0x10
     de4:	0820                	addi	s0,sp,24
     de6:	0000                	unimp
     de8:	1600                	addi	s0,sp,800
     dea:	1250                	addi	a2,sp,292
     dec:	0000                	unimp
     dee:	5716                	lw	a4,100(sp)
     df0:	0012                	c.slli	zero,0x4
     df2:	0000                	unimp
     df4:	0000                	unimp
     df6:	0000                	unimp
     df8:	351a                	fld	fa0,416(sp)
     dfa:	01000007          	0x1000007
     dfe:	01fc                	addi	a5,sp,204
     e00:	0085                	addi	ra,ra,1
     e02:	0000                	unimp
     e04:	1002                	c.slli	zero,0x20
     e06:	2000                	fld	fs0,0(s0)
     e08:	00aa                	slli	ra,ra,0xa
     e0a:	0000                	unimp
     e0c:	9c01                	0x9c01
     e0e:	038a                	slli	t2,t2,0x2
     e10:	0000                	unimp
     e12:	0001ad1b          	0x1ad1b
     e16:	0100                	addi	s0,sp,128
     e18:	01fc                	addi	a5,sp,204
     e1a:	00a1                	addi	ra,ra,8
     e1c:	0000                	unimp
     e1e:	00d5                	addi	ra,ra,21
     e20:	0000                	unimp
     e22:	611c                	flw	fa5,0(a0)
     e24:	0100                	addi	s0,sp,128
     e26:	01fd                	addi	gp,gp,31
     e28:	038a                	slli	t2,t2,0x2
     e2a:	0000                	unimp
     e2c:	00000133          	add	sp,zero,zero
     e30:	6e1c                	flw	fa5,24(a2)
     e32:	0100                	addi	s0,sp,128
     e34:	01fe                	slli	gp,gp,0x1f
     e36:	0085                	addi	ra,ra,1
     e38:	0000                	unimp
     e3a:	00000183          	lb	gp,0(zero) # 0 <_prog_start-0x20000000>
     e3e:	601d                	c.lui	zero,0x7
     e40:	0002                	c.slli64	zero
     e42:	2800                	fld	fs0,16(s0)
     e44:	1e000003          	lb	zero,480(zero) # 1e0 <_prog_start-0x1ffffe20>
     e48:	006a                	c.slli	zero,0x1a
     e4a:	0301                	addi	t1,t1,0
     e4c:	8502                	jr	a0
     e4e:	0000                	unimp
     e50:	d300                	sw	s0,32(a4)
     e52:	0001                	nop
     e54:	1300                	addi	s0,sp,416
     e56:	0591                	addi	a1,a1,4
     e58:	0000                	unimp
     e5a:	1006                	c.slli	zero,0x21
     e5c:	2000                	fld	fs0,0(s0)
     e5e:	0278                	addi	a4,sp,268
     e60:	0000                	unimp
     e62:	0401                	addi	s0,s0,0
     e64:	1402                	slli	s0,s0,0x20
     e66:	05a2                	slli	a1,a1,0x8
     e68:	0000                	unimp
     e6a:	01f2                	slli	gp,gp,0x1c
     e6c:	0000                	unimp
     e6e:	0000                	unimp
     e70:	660c                	flw	fa1,8(a2)
     e72:	0010                	0x10
     e74:	1a20                	addi	s0,sp,312
     e76:	0000                	unimp
     e78:	6600                	flw	fs0,8(a2)
     e7a:	1e000003          	lb	zero,480(zero) # 1e0 <_prog_start-0x1ffffe20>
     e7e:	0069                	c.nop	26
     e80:	1001                	c.nop	-32
     e82:	8502                	jr	a0
     e84:	0000                	unimp
     e86:	2500                	fld	fs0,8(a0)
     e88:	0002                	c.slli64	zero
     e8a:	1f00                	addi	s0,sp,944
     e8c:	1078                	addi	a4,sp,44
     e8e:	2000                	fld	fs0,0(s0)
     e90:	0390                	addi	a2,sp,448
     e92:	0000                	unimp
     e94:	0110                	addi	a2,sp,128
     e96:	025a                	slli	tp,tp,0x16
     e98:	01100083          	lb	ra,17(zero) # 11 <_prog_start-0x1fffffef>
     e9c:	0079025b          	0x79025b
     ea0:	0110                	addi	a2,sp,128
     ea2:	025c                	addi	a5,sp,260
     ea4:	0078                	addi	a4,sp,12
     ea6:	0110                	addi	a2,sp,128
     ea8:	025d                	addi	tp,tp,23
     eaa:	0084                	addi	s1,sp,64
     eac:	0000                	unimp
     eae:	621f 0010 9020      	0x90200010621f
     eb4:	10000003          	lb	zero,256(zero) # 100 <_prog_start-0x1fffff00>
     eb8:	5a01                	li	s4,-32
     eba:	8302                	jr	t1
     ebc:	1000                	addi	s0,sp,32
     ebe:	5b01                	li	s6,-32
     ec0:	7902                	flw	fs2,32(sp)
     ec2:	1000                	addi	s0,sp,32
     ec4:	5c01                	li	s8,-32
     ec6:	7802                	flw	fa6,32(sp)
     ec8:	1000                	addi	s0,sp,32
     eca:	5d01                	li	s10,-32
     ecc:	c3500a03          	lb	s4,-971(zero) # fffffc35 <_sp+0x7fffbc35>
     ed0:	0000                	unimp
     ed2:	00a10407          	0xa10407
     ed6:	0000                	unimp
     ed8:	7e1a                	flw	ft8,164(sp)
     eda:	0006                	c.slli	zero,0x1
     edc:	0100                	addi	s0,sp,128
     ede:	00a101ef          	jal	gp,10ee8 <_prog_start-0x1ffef118>
     ee2:	0000                	unimp
     ee4:	0f32                	slli	t5,t5,0xc
     ee6:	2000                	fld	fs0,0(s0)
     ee8:	00d0                	addi	a2,sp,68
     eea:	0000                	unimp
     eec:	9c01                	0x9c01
     eee:	00000547          	fmsub.s	fa0,ft0,ft0,ft0,rne
     ef2:	0001ad1b          	0x1ad1b
     ef6:	0100                	addi	s0,sp,128
     ef8:	008501ef          	jal	gp,50f00 <_prog_start-0x1ffaf100>
     efc:	0000                	unimp
     efe:	025a                	slli	tp,tp,0x16
     f00:	0000                	unimp
     f02:	611c                	flw	fa5,0(a0)
     f04:	0100                	addi	s0,sp,128
     f06:	01f0                	addi	a2,sp,204
     f08:	038a                	slli	t2,t2,0x2
     f0a:	0000                	unimp
     f0c:	0291                	addi	t0,t0,4
     f0e:	0000                	unimp
     f10:	6e1c                	flw	fa5,24(a2)
     f12:	0100                	addi	s0,sp,128
     f14:	01f1                	addi	gp,gp,28
     f16:	0085                	addi	ra,ra,1
     f18:	0000                	unimp
     f1a:	02c8                	addi	a0,sp,324
     f1c:	0000                	unimp
     f1e:	741c                	flw	fa5,40(s0)
     f20:	7070                	flw	fa2,100(s0)
     f22:	0100                	addi	s0,sp,128
     f24:	01f2                	slli	gp,gp,0x1c
     f26:	0025                	c.nop	9
     f28:	0000                	unimp
     f2a:	02ff                	0x2ff
     f2c:	0000                	unimp
     f2e:	4c0c                	lw	a1,24(s0)
     f30:	3020000f          	0x3020000f
     f34:	0000                	unimp
     f36:	4400                	lw	s0,8(s0)
     f38:	0004                	0x4
     f3a:	1e00                	addi	s0,sp,816
     f3c:	0069                	c.nop	26
     f3e:	f501                	bnez	a0,e46 <_prog_start-0x1ffff1ba>
     f40:	8501                	c.srai64	a0
     f42:	0000                	unimp
     f44:	2000                	fld	fs0,0(s0)
     f46:	13000003          	lb	zero,304(zero) # 130 <_prog_start-0x1ffffed0>
     f4a:	000005af          	0x5af
     f4e:	0f54                	addi	a3,sp,916
     f50:	2000                	fld	fs0,0(s0)
     f52:	0218                	addi	a4,sp,256
     f54:	0000                	unimp
     f56:	f601                	bnez	a2,e5e <_prog_start-0x1ffff1a2>
     f58:	1401                	addi	s0,s0,-32
     f5a:	05d4                	addi	a3,sp,708
     f5c:	0000                	unimp
     f5e:	0378                	addi	a4,sp,396
     f60:	0000                	unimp
     f62:	c814                	sw	a3,16(s0)
     f64:	0005                	c.nop	1
     f66:	8e00                	0x8e00
     f68:	14000003          	lb	zero,320(zero) # 140 <_prog_start-0x1ffffec0>
     f6c:	05bc                	addi	a5,sp,712
     f6e:	0000                	unimp
     f70:	03a1                	addi	t2,t2,8
     f72:	0000                	unimp
     f74:	761f 000f e920      	0xe920000f761f
     f7a:	1000000f          	0x1000000f
     f7e:	5a01                	li	s4,-32
     f80:	8202                	jr	tp
     f82:	1000                	addi	s0,sp,32
     f84:	5c01                	li	s8,-32
     f86:	8602                	jr	a2
     f88:	0000                	unimp
     f8a:	0000                	unimp
     f8c:	ed20                	fsw	fs0,88(a0)
     f8e:	0005                	c.nop	1
     f90:	7c00                	flw	fs0,56(s0)
     f92:	3e20000f          	0x3e20000f
     f96:	0000                	unimp
     f98:	0100                	addi	s0,sp,128
     f9a:	04e901f7          	0x4e901f7
     f9e:	0000                	unimp
     fa0:	9d20                	0x9d20
     fa2:	000a                	c.slli	zero,0x2
     fa4:	8c00                	0x8c00
     fa6:	2620000f          	0x2620000f
     faa:	0000                	unimp
     fac:	0100                	addi	s0,sp,128
     fae:	01c6                	slli	gp,gp,0x11
     fb0:	04d8                	addi	a4,sp,580
     fb2:	0000                	unimp
     fb4:	aa14                	fsd	fa3,16(a2)
     fb6:	000a                	c.slli	zero,0x2
     fb8:	b400                	fsd	fs0,40(s0)
     fba:	18000003          	lb	zero,384(zero) # 180 <_prog_start-0x1ffffe80>
     fbe:	0f8c                	addi	a1,sp,976
     fc0:	2000                	fld	fs0,0(s0)
     fc2:	0026                	c.slli	zero,0x9
     fc4:	0000                	unimp
     fc6:	2716                	fld	fa4,320(sp)
     fc8:	16000013          	li	zero,352
     fcc:	132d                	addi	t1,t1,-21
     fce:	0000                	unimp
     fd0:	a920                	fsd	fs0,80(a0)
     fd2:	8c00000f          	0x8c00000f
     fd6:	0820000f          	fence	i,r
     fda:	0000                	unimp
     fdc:	0100                	addi	s0,sp,128
     fde:	0108                	addi	a0,sp,128
     fe0:	04b1                	addi	s1,s1,12
     fe2:	0000                	unimp
     fe4:	8c18                	0x8c18
     fe6:	0820000f          	fence	i,r
     fea:	0000                	unimp
     fec:	1600                	addi	s0,sp,800
     fee:	1250                	addi	a2,sp,292
     ff0:	0000                	unimp
     ff2:	5716                	lw	a4,100(sp)
     ff4:	0012                	c.slli	zero,0x4
     ff6:	0000                	unimp
     ff8:	2100                	fld	fs0,0(a0)
     ffa:	0fa9                	addi	t6,t6,10
     ffc:	0000                	unimp
     ffe:	0f9e                	slli	t6,t6,0x7
    1000:	2000                	fld	fs0,0(s0)
    1002:	0008                	0x8
    1004:	0000                	unimp
    1006:	0a01                	addi	s4,s4,0
    1008:	1801                	addi	a6,a6,-32
    100a:	0f9e                	slli	t6,t6,0x7
    100c:	2000                	fld	fs0,0(s0)
    100e:	0008                	0x8
    1010:	0000                	unimp
    1012:	5016                	0x5016
    1014:	0012                	c.slli	zero,0x4
    1016:	1600                	addi	s0,sp,800
    1018:	00001257          	0x1257
    101c:	0000                	unimp
    101e:	0000                	unimp
    1020:	9722                	add	a4,a4,s0
    1022:	0006                	c.slli	zero,0x1
    1024:	b200                	fsd	fs0,32(a2)
    1026:	0820000f          	fence	i,r
    102a:	0000                	unimp
    102c:	0100                	addi	s0,sp,128
    102e:	230001c7          	fmsub.d	ft3,ft0,fa6,ft4,rne
    1032:	00000547          	fmsub.s	fa0,ft0,ft0,ft0,rne
    1036:	0fba                	slli	t6,t6,0xe
    1038:	2000                	fld	fs0,0(s0)
    103a:	0230                	addi	a2,sp,264
    103c:	0000                	unimp
    103e:	f901                	bnez	a0,f4e <_prog_start-0x1ffff0b2>
    1040:	3d01                	jal	e50 <_prog_start-0x1ffff1b0>
    1042:	0005                	c.nop	1
    1044:	2400                	fld	fs0,8(s0)
    1046:	056e                	slli	a0,a0,0x1b
    1048:	0000                	unimp
    104a:	6424                	flw	fs1,72(s0)
    104c:	0005                	c.nop	1
    104e:	2400                	fld	fs0,8(s0)
    1050:	0558                	addi	a4,sp,644
    1052:	0000                	unimp
    1054:	3015                	jal	878 <_prog_start-0x1ffff788>
    1056:	0002                	c.slli64	zero
    1058:	1600                	addi	s0,sp,800
    105a:	14fc                	addi	a5,sp,620
    105c:	0000                	unimp
    105e:	0525                	addi	a0,a0,9
    1060:	0015                	c.nop	5
    1062:	4800                	lw	s0,16(s0)
    1064:	0002                	c.slli64	zero
    1066:	1600                	addi	s0,sp,800
    1068:	150a                	slli	a0,a0,0x22
    106a:	0000                	unimp
    106c:	9121                	srli	a0,a0,0x28
    106e:	0005                	c.nop	1
    1070:	d800                	sw	s0,48(s0)
    1072:	0220000f          	fence	r,r
    1076:	0000                	unimp
    1078:	0100                	addi	s0,sp,128
    107a:	01ea                	slli	gp,gp,0x1a
    107c:	a224                	fsd	fs1,64(a2)
    107e:	0005                	c.nop	1
    1080:	0000                	unimp
    1082:	0000                	unimp
    1084:	0e00                	addi	s0,sp,784
    1086:	0f4c                	addi	a1,sp,916
    1088:	2000                	fld	fs0,0(s0)
    108a:	05f6                	slli	a1,a1,0x1d
    108c:	0000                	unimp
    108e:	2600                	fld	fs0,8(a2)
    1090:	0722                	slli	a4,a4,0x8
    1092:	0000                	unimp
    1094:	e601                	bnez	a2,109c <_prog_start-0x1fffef64>
    1096:	a101                	j	1496 <_prog_start-0x1fffeb6a>
    1098:	0000                	unimp
    109a:	0100                	addi	s0,sp,128
    109c:	0591                	addi	a1,a1,4
    109e:	0000                	unimp
    10a0:	0001ad27          	fsw	ft0,26(gp) # 80000d9a <__global_pointer$+0x1a>
    10a4:	0100                	addi	s0,sp,128
    10a6:	01e6                	slli	gp,gp,0x19
    10a8:	0085                	addi	ra,ra,1
    10aa:	0000                	unimp
    10ac:	6128                	flw	fa0,64(a0)
    10ae:	0100                	addi	s0,sp,128
    10b0:	01e6                	slli	gp,gp,0x19
    10b2:	038a                	slli	t2,t2,0x2
    10b4:	0000                	unimp
    10b6:	6e28                	flw	fa0,88(a2)
    10b8:	0100                	addi	s0,sp,128
    10ba:	01e6                	slli	gp,gp,0x19
    10bc:	0085                	addi	ra,ra,1
    10be:	0000                	unimp
    10c0:	7229                	lui	tp,0xfffea
    10c2:	7365                	lui	t1,0xffff9
    10c4:	0100                	addi	s0,sp,128
    10c6:	01e8                	addi	a0,sp,204
    10c8:	00a1                	addi	ra,ra,8
    10ca:	0000                	unimp
    10cc:	292a                	fld	fs2,136(sp)
    10ce:	0069                	c.nop	26
    10d0:	e901                	bnez	a0,10e0 <_prog_start-0x1fffef20>
    10d2:	8501                	c.srai64	a0
    10d4:	0000                	unimp
    10d6:	0000                	unimp
    10d8:	2600                	fld	fs0,8(a2)
    10da:	0704                	addi	s1,sp,896
    10dc:	0000                	unimp
    10de:	de01                	beqz	a2,ff6 <_prog_start-0x1ffff00a>
    10e0:	a101                	j	14e0 <_prog_start-0x1fffeb20>
    10e2:	0000                	unimp
    10e4:	0100                	addi	s0,sp,128
    10e6:	000005af          	0x5af
    10ea:	6928                	flw	fa0,80(a0)
    10ec:	7864                	flw	fs1,116(s0)
    10ee:	0100                	addi	s0,sp,128
    10f0:	01de                	slli	gp,gp,0x17
    10f2:	0085                	addi	ra,ra,1
    10f4:	0000                	unimp
    10f6:	2b00                	fld	fs0,16(a4)
    10f8:	0796                	slli	a5,a5,0x5
    10fa:	0000                	unimp
    10fc:	ca01                	beqz	a2,110c <_prog_start-0x1fffeef4>
    10fe:	0101                	addi	sp,sp,0
    1100:	05ed                	addi	a1,a1,27
    1102:	0000                	unimp
    1104:	6928                	flw	fa0,80(a0)
    1106:	7864                	flw	fs1,116(s0)
    1108:	0100                	addi	s0,sp,128
    110a:	01ca                	slli	gp,gp,0x12
    110c:	0085                	addi	ra,ra,1
    110e:	0000                	unimp
    1110:	0003aa27          	fsw	ft0,20(t2) # ffff9014 <_sp+0x7fff5014>
    1114:	0100                	addi	s0,sp,128
    1116:	01ca                	slli	gp,gp,0x12
    1118:	00a1                	addi	ra,ra,8
    111a:	0000                	unimp
    111c:	7428                	flw	fa0,104(s0)
    111e:	7070                	flw	fa2,100(s0)
    1120:	0100                	addi	s0,sp,128
    1122:	01ca                	slli	gp,gp,0x12
    1124:	0025                	c.nop	9
    1126:	0000                	unimp
    1128:	292a                	fld	fs2,136(sp)
    112a:	0069                	c.nop	26
    112c:	d201                	beqz	a2,102c <_prog_start-0x1fffefd4>
    112e:	8501                	c.srai64	a0
    1130:	0000                	unimp
    1132:	0000                	unimp
    1134:	2c00                	fld	fs0,24(s0)
    1136:	0000074b          	fnmsub.s	fa4,ft0,ft0,ft0,rne
    113a:	c101                	beqz	a0,113a <_prog_start-0x1fffeec6>
    113c:	0101                	addi	sp,sp,0
    113e:	210a                	fld	ft2,128(sp)
    1140:	0008                	0x8
    1142:	0100                	addi	s0,sp,128
    1144:	01b8                	addi	a4,sp,200
    1146:	0e6e                	slli	t3,t3,0x1b
    1148:	2000                	fld	fs0,0(s0)
    114a:	003e                	c.slli	zero,0xf
    114c:	0000                	unimp
    114e:	9c01                	0x9c01
    1150:	00000697          	auipc	a3,0x0
    1154:	a022                	fsd	fs0,0(sp)
    1156:	0006                	c.slli	zero,0x1
    1158:	6e00                	flw	fs0,24(a2)
    115a:	000e                	c.slli	zero,0x3
    115c:	0e20                	addi	s0,sp,792
    115e:	0000                	unimp
    1160:	0100                	addi	s0,sp,128
    1162:	01ba                	slli	gp,gp,0xe
    1164:	9d21                	0x9d21
    1166:	000a                	c.slli	zero,0x2
    1168:	8400                	0x8400
    116a:	000e                	c.slli	zero,0x3
    116c:	2620                	fld	fs0,72(a2)
    116e:	0000                	unimp
    1170:	0100                	addi	s0,sp,128
    1172:	01be                	slli	gp,gp,0xf
    1174:	aa2d                	j	12ae <_prog_start-0x1fffed52>
    1176:	000a                	c.slli	zero,0x2
    1178:	f400                	fsw	fs0,40(s0)
    117a:	1801                	addi	a6,a6,-32
    117c:	0e84                	addi	s1,sp,848
    117e:	2000                	fld	fs0,0(s0)
    1180:	0026                	c.slli	zero,0x9
    1182:	0000                	unimp
    1184:	2716                	fld	fa4,320(sp)
    1186:	16000013          	li	zero,352
    118a:	132d                	addi	t1,t1,-21
    118c:	0000                	unimp
    118e:	a920                	fsd	fs0,80(a0)
    1190:	8400000f          	0x8400000f
    1194:	000e                	c.slli	zero,0x3
    1196:	0820                	addi	s0,sp,24
    1198:	0000                	unimp
    119a:	0100                	addi	s0,sp,128
    119c:	0108                	addi	a0,sp,128
    119e:	0000066f          	jal	a2,119e <_prog_start-0x1fffee62>
    11a2:	8418                	0x8418
    11a4:	000e                	c.slli	zero,0x3
    11a6:	0820                	addi	s0,sp,24
    11a8:	0000                	unimp
    11aa:	1600                	addi	s0,sp,800
    11ac:	1250                	addi	a2,sp,292
    11ae:	0000                	unimp
    11b0:	5716                	lw	a4,100(sp)
    11b2:	0012                	c.slli	zero,0x4
    11b4:	0000                	unimp
    11b6:	2100                	fld	fs0,0(a0)
    11b8:	0fa9                	addi	t6,t6,10
    11ba:	0000                	unimp
    11bc:	0e96                	slli	t4,t4,0x5
    11be:	2000                	fld	fs0,0(s0)
    11c0:	0008                	0x8
    11c2:	0000                	unimp
    11c4:	0a01                	addi	s4,s4,0
    11c6:	1801                	addi	a6,a6,-32
    11c8:	0e96                	slli	t4,t4,0x5
    11ca:	2000                	fld	fs0,0(s0)
    11cc:	0008                	0x8
    11ce:	0000                	unimp
    11d0:	5016                	0x5016
    11d2:	0012                	c.slli	zero,0x4
    11d4:	1600                	addi	s0,sp,800
    11d6:	00001257          	0x1257
    11da:	0000                	unimp
    11dc:	0000                	unimp
    11de:	2c00                	fld	fs0,24(s0)
    11e0:	077f                	0x77f
    11e2:	0000                	unimp
    11e4:	b301                	j	ee4 <_prog_start-0x1ffff11c>
    11e6:	0101                	addi	sp,sp,0
    11e8:	0d2c                	addi	a1,sp,664
    11ea:	0008                	0x8
    11ec:	0100                	addi	s0,sp,128
    11ee:	01ac                	addi	a1,sp,200
    11f0:	2e01                	jal	1500 <_prog_start-0x1fffeb00>
    11f2:	081a                	slli	a6,a6,0x6
    11f4:	0000                	unimp
    11f6:	8501                	c.srai64	a0
    11f8:	9801                	andi	s0,s0,-32
    11fa:	000d                	c.nop	3
    11fc:	be20                	fsd	fs0,120(a2)
    11fe:	0000                	unimp
    1200:	0100                	addi	s0,sp,128
    1202:	499c                	lw	a5,16(a1)
    1204:	1b000007          	0x1b000007
    1208:	0679                	addi	a2,a2,30
    120a:	0000                	unimp
    120c:	8501                	c.srai64	a0
    120e:	6501                	0x6501
    1210:	0000                	unimp
    1212:	ca00                	sw	s0,16(a2)
    1214:	2f000003          	lb	zero,752(zero) # 2f0 <_prog_start-0x1ffffd10>
    1218:	06a5                	addi	a3,a3,9
    121a:	0000                	unimp
    121c:	8e01                	sub	a2,a2,s0
    121e:	8501                	c.srai64	a0
    1220:	0000                	unimp
    1222:	0400                	addi	s0,sp,512
    1224:	0004                	0x4
    1226:	2f00                	fld	fs0,24(a4)
    1228:	00000693          	li	a3,0
    122c:	8f01                	sub	a4,a4,s0
    122e:	8501                	c.srai64	a0
    1230:	0000                	unimp
    1232:	5400                	lw	s0,40(s0)
    1234:	0004                	0x4
    1236:	2f00                	fld	fs0,24(a4)
    1238:	069f 0000 9001      	0x90010000069f
    123e:	8501                	c.srai64	a0
    1240:	0000                	unimp
    1242:	9b00                	0x9b00
    1244:	0004                	0x4
    1246:	2f00                	fld	fs0,24(a4)
    1248:	000006ab          	0x6ab
    124c:	9401                	srai	s0,s0,0x20
    124e:	8501                	c.srai64	a0
    1250:	0000                	unimp
    1252:	1a00                	addi	s0,sp,304
    1254:	0005                	c.nop	1
    1256:	2300                	fld	fs0,0(a4)
    1258:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    125c:	0dec                	addi	a1,sp,732
    125e:	2000                	fld	fs0,0(s0)
    1260:	01e8                	addi	a0,sp,204
    1262:	0000                	unimp
    1264:	a201                	j	1364 <_prog_start-0x1fffec9c>
    1266:	2d01                	jal	1876 <_prog_start-0x1fffe78a>
    1268:	14000007          	0x14000007
    126c:	0a90                	addi	a2,sp,336
    126e:	0000                	unimp
    1270:	05f2                	slli	a1,a1,0x1c
    1272:	0000                	unimp
    1274:	0e00                	addi	s0,sp,784
    1276:	0e08                	addi	a0,sp,784
    1278:	2000                	fld	fs0,0(s0)
    127a:	0749                	addi	a4,a4,18
    127c:	0000                	unimp
    127e:	1411                	addi	s0,s0,-28
    1280:	000e                	c.slli	zero,0x3
    1282:	e120                	fsw	fs0,64(a0)
    1284:	0008                	0x8
    1286:	1000                	addi	s0,sp,32
    1288:	5a01                	li	s4,-32
    128a:	0804                	addi	s1,sp,16
    128c:	39e1                	jal	f64 <_prog_start-0x1ffff09c>
    128e:	0024                	addi	s1,sp,8
    1290:	2e00                	fld	fs0,24(a2)
    1292:	0831                	addi	a6,a6,12
    1294:	0000                	unimp
    1296:	5501                	li	a0,-32
    1298:	a201                	j	1398 <_prog_start-0x1fffec68>
    129a:	000c                	0xc
    129c:	f620                	fsw	fs0,104(a2)
    129e:	0000                	unimp
    12a0:	0100                	addi	s0,sp,128
    12a2:	029c                	addi	a5,sp,320
    12a4:	0008                	0x8
    12a6:	1b00                	addi	s0,sp,432
    12a8:	06a5                	addi	a3,a3,9
    12aa:	0000                	unimp
    12ac:	5501                	li	a0,-32
    12ae:	8501                	c.srai64	a0
    12b0:	0000                	unimp
    12b2:	0600                	addi	s0,sp,768
    12b4:	0006                	c.slli	zero,0x1
    12b6:	1b00                	addi	s0,sp,432
    12b8:	00000693          	li	a3,0
    12bc:	5501                	li	a0,-32
    12be:	8501                	c.srai64	a0
    12c0:	0000                	unimp
    12c2:	2700                	fld	fs0,8(a4)
    12c4:	0006                	c.slli	zero,0x1
    12c6:	1b00                	addi	s0,sp,432
    12c8:	069f 0000 5501      	0x55010000069f
    12ce:	8501                	c.srai64	a0
    12d0:	0000                	unimp
    12d2:	4800                	lw	s0,16(s0)
    12d4:	0006                	c.slli	zero,0x1
    12d6:	2300                	fld	fs0,0(a4)
    12d8:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    12dc:	0cb6                	slli	s9,s9,0xd
    12de:	2000                	fld	fs0,0(s0)
    12e0:	01b8                	addi	a4,sp,200
    12e2:	0000                	unimp
    12e4:	6601                	0x6601
    12e6:	ad01                	j	18f6 <_prog_start-0x1fffe70a>
    12e8:	14000007          	0x14000007
    12ec:	0a90                	addi	a2,sp,336
    12ee:	0000                	unimp
    12f0:	0669                	addi	a2,a2,26
    12f2:	0000                	unimp
    12f4:	2300                	fld	fs0,0(a4)
    12f6:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    12fa:	0cde                	slli	s9,s9,0x17
    12fc:	2000                	fld	fs0,0(s0)
    12fe:	01d0                	addi	a2,sp,196
    1300:	0000                	unimp
    1302:	6b01                	0x6b01
    1304:	cb01                	beqz	a4,1314 <_prog_start-0x1fffecec>
    1306:	14000007          	0x14000007
    130a:	0a90                	addi	a2,sp,336
    130c:	0000                	unimp
    130e:	067d                	addi	a2,a2,31
    1310:	0000                	unimp
    1312:	2000                	fld	fs0,0(s0)
    1314:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    1318:	0d3c                	addi	a5,sp,664
    131a:	2000                	fld	fs0,0(s0)
    131c:	0018                	0x18
    131e:	0000                	unimp
    1320:	7401                	lui	s0,0xfffe0
    1322:	e901                	bnez	a0,1332 <_prog_start-0x1fffecce>
    1324:	14000007          	0x14000007
    1328:	0a90                	addi	a2,sp,336
    132a:	0000                	unimp
    132c:	0691                	addi	a3,a3,4
    132e:	0000                	unimp
    1330:	2100                	fld	fs0,0(a0)
    1332:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    1336:	0d70                	addi	a2,sp,668
    1338:	2000                	fld	fs0,0(s0)
    133a:	0016                	c.slli	zero,0x5
    133c:	0000                	unimp
    133e:	7701                	lui	a4,0xfffe0
    1340:	2d01                	jal	1950 <_prog_start-0x1fffe6b0>
    1342:	0a90                	addi	a2,sp,336
    1344:	0000                	unimp
    1346:	01f4                	addi	a3,sp,204
    1348:	0000                	unimp
    134a:	732e                	flw	ft6,232(sp)
    134c:	01000007          	0x1000007
    1350:	0bb20137          	lui	sp,0xbb20
    1354:	2000                	fld	fs0,0(s0)
    1356:	00f0                	addi	a2,sp,76
    1358:	0000                	unimp
    135a:	9c01                	0x9c01
    135c:	08e1                	addi	a7,a7,24
    135e:	0000                	unimp
    1360:	0007121b          	0x7121b
    1364:	0100                	addi	s0,sp,128
    1366:	00850137          	lui	sp,0x850
    136a:	0000                	unimp
    136c:	06a5                	addi	a3,a3,9
    136e:	0000                	unimp
    1370:	641c                	flw	fa5,8(s0)
    1372:	7669                	lui	a2,0xffffa
    1374:	0100                	addi	s0,sp,128
    1376:	00850137          	lui	sp,0x850
    137a:	0000                	unimp
    137c:	06c6                	slli	a3,a3,0x11
    137e:	0000                	unimp
    1380:	8320                	0x8320
    1382:	000a                	c.slli	zero,0x2
    1384:	ca00                	sw	s0,16(a2)
    1386:	1620000b          	0x1620000b
    138a:	0000                	unimp
    138c:	0100                	addi	s0,sp,128
    138e:	013c                	addi	a5,sp,136
    1390:	0856                	slli	a6,a6,0x15
    1392:	0000                	unimp
    1394:	9014                	0x9014
    1396:	000a                	c.slli	zero,0x2
    1398:	e700                	fsw	fs0,8(a4)
    139a:	0006                	c.slli	zero,0x1
    139c:	0000                	unimp
    139e:	8320                	0x8320
    13a0:	000a                	c.slli	zero,0x2
    13a2:	ee00                	fsw	fs0,24(a2)
    13a4:	1820000b          	0x1820000b
    13a8:	0000                	unimp
    13aa:	0100                	addi	s0,sp,128
    13ac:	0141                	addi	sp,sp,16
    13ae:	0874                	addi	a3,sp,28
    13b0:	0000                	unimp
    13b2:	9014                	0x9014
    13b4:	000a                	c.slli	zero,0x2
    13b6:	fc00                	fsw	fs0,56(s0)
    13b8:	0006                	c.slli	zero,0x1
    13ba:	0000                	unimp
    13bc:	000a8323          	sb	zero,6(s5)
    13c0:	1a00                	addi	s0,sp,304
    13c2:	000c                	0xc
    13c4:	a020                	fsd	fs0,64(s0)
    13c6:	0001                	nop
    13c8:	0100                	addi	s0,sp,128
    13ca:	0146                	slli	sp,sp,0x11
    13cc:	0892                	slli	a7,a7,0x4
    13ce:	0000                	unimp
    13d0:	9014                	0x9014
    13d2:	000a                	c.slli	zero,0x2
    13d4:	1100                	addi	s0,sp,160
    13d6:	00000007          	0x7
    13da:	8320                	0x8320
    13dc:	000a                	c.slli	zero,0x2
    13de:	5200                	lw	s0,32(a2)
    13e0:	000c                	0xc
    13e2:	1820                	addi	s0,sp,56
    13e4:	0000                	unimp
    13e6:	0100                	addi	s0,sp,128
    13e8:	014a                	slli	sp,sp,0x12
    13ea:	08b0                	addi	a2,sp,88
    13ec:	0000                	unimp
    13ee:	9014                	0x9014
    13f0:	000a                	c.slli	zero,0x2
    13f2:	2600                	fld	fs0,8(a2)
    13f4:	00000007          	0x7
    13f8:	8320                	0x8320
    13fa:	000a                	c.slli	zero,0x2
    13fc:	7800                	flw	fs0,48(s0)
    13fe:	000c                	0xc
    1400:	1420                	addi	s0,sp,552
    1402:	0000                	unimp
    1404:	0100                	addi	s0,sp,128
    1406:	014d                	addi	sp,sp,19
    1408:	08ce                	slli	a7,a7,0x13
    140a:	0000                	unimp
    140c:	9014                	0x9014
    140e:	000a                	c.slli	zero,0x2
    1410:	3b00                	fld	fs0,48(a4)
    1412:	00000007          	0x7
    1416:	a211                	j	151a <_prog_start-0x1fffeae6>
    1418:	000c                	0xc
    141a:	e120                	fsw	fs0,64(a0)
    141c:	0008                	0x8
    141e:	1000                	addi	s0,sp,32
    1420:	5a01                	li	s4,-32
    1422:	0804                	addi	s1,sp,16
    1424:	39e1                	jal	10fc <_prog_start-0x1fffef04>
    1426:	0024                	addi	s1,sp,8
    1428:	2e00                	fld	fs0,24(a2)
    142a:	06da                	slli	a3,a3,0x16
    142c:	0000                	unimp
    142e:	2101                	jal	182e <_prog_start-0x1fffe7d2>
    1430:	b001                	j	c30 <_prog_start-0x1ffff3d0>
    1432:	000a                	c.slli	zero,0x2
    1434:	0220                	addi	s0,sp,264
    1436:	0001                	nop
    1438:	0100                	addi	s0,sp,128
    143a:	5e9c                	lw	a5,56(a3)
    143c:	000a                	c.slli	zero,0x2
    143e:	1b00                	addi	s0,sp,432
    1440:	0650                	addi	a2,sp,772
    1442:	0000                	unimp
    1444:	2101                	jal	1844 <_prog_start-0x1fffe7bc>
    1446:	bc01                	j	e56 <_prog_start-0x1ffff1aa>
    1448:	0000                	unimp
    144a:	5000                	lw	s0,32(s0)
    144c:	20000007          	0x20000007
    1450:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    1454:	0ab0                	addi	a2,sp,344
    1456:	2000                	fld	fs0,0(s0)
    1458:	001a                	c.slli	zero,0x6
    145a:	0000                	unimp
    145c:	2301                	jal	195c <_prog_start-0x1fffe6a4>
    145e:	2501                	jal	1a5e <_prog_start-0x1fffe5a2>
    1460:	0009                	c.nop	2
    1462:	1400                	addi	s0,sp,544
    1464:	0a90                	addi	a2,sp,336
    1466:	0000                	unimp
    1468:	077c                	addi	a5,sp,908
    146a:	0000                	unimp
    146c:	2000                	fld	fs0,0(s0)
    146e:	0f58                	addi	a4,sp,916
    1470:	0000                	unimp
    1472:	0aee                	slli	s5,s5,0x1b
    1474:	2000                	fld	fs0,0(s0)
    1476:	0036                	c.slli	zero,0xd
    1478:	0000                	unimp
    147a:	2801                	jal	148a <_prog_start-0x1fffeb76>
    147c:	b601                	j	f7c <_prog_start-0x1ffff084>
    147e:	0009                	c.nop	2
    1480:	1400                	addi	s0,sp,544
    1482:	0f71                	addi	t5,t5,28
    1484:	0000                	unimp
    1486:	0791                	addi	a5,a5,4
    1488:	0000                	unimp
    148a:	6814                	flw	fa3,16(s0)
    148c:	a400000f          	0xa400000f
    1490:	18000007          	0x18000007
    1494:	0aee                	slli	s5,s5,0x1b
    1496:	2000                	fld	fs0,0(s0)
    1498:	0036                	c.slli	zero,0xd
    149a:	0000                	unimp
    149c:	8216                	mv	tp,t0
    149e:	0012                	c.slli	zero,0x4
    14a0:	1600                	addi	s0,sp,800
    14a2:	1289                	addi	t0,t0,-30
    14a4:	0000                	unimp
    14a6:	8e16                	mv	t3,t0
    14a8:	0012                	c.slli	zero,0x4
    14aa:	1600                	addi	s0,sp,800
    14ac:	00001293          	slli	t0,zero,0x0
    14b0:	000fa917          	auipc	s2,0xfa
    14b4:	f400                	fsw	fs0,40(s0)
    14b6:	000a                	c.slli	zero,0x2
    14b8:	0820                	addi	s0,sp,24
    14ba:	0000                	unimp
    14bc:	0100                	addi	s0,sp,128
    14be:	9054                	0x9054
    14c0:	0009                	c.nop	2
    14c2:	1800                	addi	s0,sp,48
    14c4:	0af4                	addi	a3,sp,348
    14c6:	2000                	fld	fs0,0(s0)
    14c8:	0008                	0x8
    14ca:	0000                	unimp
    14cc:	5016                	0x5016
    14ce:	0012                	c.slli	zero,0x4
    14d0:	1600                	addi	s0,sp,800
    14d2:	00001257          	0x1257
    14d6:	0000                	unimp
    14d8:	a919                	j	18ee <_prog_start-0x1fffe712>
    14da:	1000000f          	0x1000000f
    14de:	0820000b          	0x820000b
    14e2:	0000                	unimp
    14e4:	0100                	addi	s0,sp,128
    14e6:	1858                	addi	a4,sp,52
    14e8:	0b10                	addi	a2,sp,400
    14ea:	2000                	fld	fs0,0(s0)
    14ec:	0008                	0x8
    14ee:	0000                	unimp
    14f0:	5016                	0x5016
    14f2:	0012                	c.slli	zero,0x4
    14f4:	1600                	addi	s0,sp,800
    14f6:	00001257          	0x1257
    14fa:	0000                	unimp
    14fc:	0000                	unimp
    14fe:	000a8323          	sb	zero,6(s5)
    1502:	2800                	fld	fs0,16(s0)
    1504:	7020000b          	0x7020000b
    1508:	0001                	nop
    150a:	0100                	addi	s0,sp,128
    150c:	09d40133          	0x9d40133
    1510:	0000                	unimp
    1512:	9014                	0x9014
    1514:	000a                	c.slli	zero,0x2
    1516:	ba00                	fsd	fs0,48(a2)
    1518:	00000007          	0x7
    151c:	000f5813          	srli	a6,t5,0x0
    1520:	2c00                	fld	fs0,24(s0)
    1522:	8820000b          	0x8820000b
    1526:	0001                	nop
    1528:	0100                	addi	s0,sp,128
    152a:	012e                	slli	sp,sp,0xb
    152c:	7114                	flw	fa3,32(a0)
    152e:	cf00000f          	0xcf00000f
    1532:	14000007          	0x14000007
    1536:	0f68                	addi	a0,sp,924
    1538:	0000                	unimp
    153a:	07e2                	slli	a5,a5,0x18
    153c:	0000                	unimp
    153e:	8815                	andi	s0,s0,5
    1540:	0001                	nop
    1542:	1600                	addi	s0,sp,800
    1544:	1282                	slli	t0,t0,0x20
    1546:	0000                	unimp
    1548:	8916                	mv	s2,t0
    154a:	0012                	c.slli	zero,0x4
    154c:	1600                	addi	s0,sp,800
    154e:	128e                	slli	t0,t0,0x23
    1550:	0000                	unimp
    1552:	9316                	add	t1,t1,t0
    1554:	0012                	c.slli	zero,0x4
    1556:	1700                	addi	s0,sp,928
    1558:	0fa9                	addi	t6,t6,10
    155a:	0000                	unimp
    155c:	0b7c                	addi	a5,sp,412
    155e:	2000                	fld	fs0,0(s0)
    1560:	0008                	0x8
    1562:	0000                	unimp
    1564:	5401                	li	s0,-32
    1566:	00000a37          	lui	s4,0x0
    156a:	7c18                	flw	fa4,56(s0)
    156c:	0820000b          	0x820000b
    1570:	0000                	unimp
    1572:	1600                	addi	s0,sp,800
    1574:	1250                	addi	a2,sp,292
    1576:	0000                	unimp
    1578:	5716                	lw	a4,100(sp)
    157a:	0012                	c.slli	zero,0x4
    157c:	0000                	unimp
    157e:	1900                	addi	s0,sp,176
    1580:	0fa9                	addi	t6,t6,10
    1582:	0000                	unimp
    1584:	0b98                	addi	a4,sp,464
    1586:	2000                	fld	fs0,0(s0)
    1588:	0008                	0x8
    158a:	0000                	unimp
    158c:	5801                	li	a6,-32
    158e:	9818                	0x9818
    1590:	0820000b          	0x820000b
    1594:	0000                	unimp
    1596:	1600                	addi	s0,sp,800
    1598:	1250                	addi	a2,sp,292
    159a:	0000                	unimp
    159c:	5716                	lw	a4,100(sp)
    159e:	0012                	c.slli	zero,0x4
    15a0:	0000                	unimp
    15a2:	0000                	unimp
    15a4:	0000                	unimp
    15a6:	f62e                	fsw	fa1,44(sp)
    15a8:	0006                	c.slli	zero,0x1
    15aa:	0100                	addi	s0,sp,128
    15ac:	0119                	addi	sp,sp,6
    15ae:	0a9a                	slli	s5,s5,0x6
    15b0:	2000                	fld	fs0,0(s0)
    15b2:	0016                	c.slli	zero,0x5
    15b4:	0000                	unimp
    15b6:	9c01                	0x9c01
    15b8:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    15bc:	e330                	fsw	fa2,64(a4)
    15be:	0006                	c.slli	zero,0x1
    15c0:	0100                	addi	s0,sp,128
    15c2:	0119                	addi	sp,sp,6
    15c4:	0085                	addi	ra,ra,1
    15c6:	0000                	unimp
    15c8:	5a01                	li	s4,-32
    15ca:	2b00                	fld	fs0,16(a4)
    15cc:	0852                	slli	a6,a6,0x14
    15ce:	0000                	unimp
    15d0:	1001                	c.nop	-32
    15d2:	0101                	addi	sp,sp,0
    15d4:	0a9d                	addi	s5,s5,7
    15d6:	0000                	unimp
    15d8:	0006e327          	0x6e327
    15dc:	0100                	addi	s0,sp,128
    15de:	0110                	addi	a2,sp,128
    15e0:	0085                	addi	ra,ra,1
    15e2:	0000                	unimp
    15e4:	2b00                	fld	fs0,16(a4)
    15e6:	0646                	slli	a2,a2,0x11
    15e8:	0000                	unimp
    15ea:	0501                	addi	a0,a0,0
    15ec:	0101                	addi	sp,sp,0
    15ee:	00000acf          	fnmadd.s	fs5,ft0,ft0,ft0,rne
    15f2:	00062727          	fsw	ft0,14(a2) # ffffa00e <_sp+0x7fff600e>
    15f6:	0100                	addi	s0,sp,128
    15f8:	0105                	addi	sp,sp,1
    15fa:	0025                	c.nop	9
    15fc:	0000                	unimp
    15fe:	370d                	jal	1520 <_prog_start-0x1fffeae0>
    1600:	0006                	c.slli	zero,0x1
    1602:	0100                	addi	s0,sp,128
    1604:	00910107          	0x910107
    1608:	0000                	unimp
    160a:	6529                	lui	a0,0xa
    160c:	646e                	flw	fs0,216(sp)
    160e:	0100                	addi	s0,sp,128
    1610:	0108                	addi	a0,sp,128
    1612:	000000b7          	lui	ra,0x0
    1616:	3100                	fld	fs0,32(a0)
    1618:	0790                	addi	a2,sp,960
    161a:	0000                	unimp
    161c:	f401                	bnez	s0,1524 <_prog_start-0x1fffeadc>
    161e:	0085                	addi	ra,ra,1
    1620:	0000                	unimp
    1622:	09f4                	addi	a3,sp,220
    1624:	2000                	fld	fs0,0(s0)
    1626:	005a                	c.slli	zero,0x16
    1628:	0000                	unimp
    162a:	9c01                	0x9c01
    162c:	00000b9b          	0xb9b
    1630:	4532                	lw	a0,12(sp)
    1632:	01000007          	0x1000007
    1636:	85f4                	0x85f4
    1638:	0000                	unimp
    163a:	f800                	fsw	fs0,48(s0)
    163c:	32000007          	0x32000007
    1640:	0666                	slli	a2,a2,0x19
    1642:	0000                	unimp
    1644:	f401                	bnez	s0,154c <_prog_start-0x1fffeab4>
    1646:	00ce                	slli	ra,ra,0x13
    1648:	0000                	unimp
    164a:	00000837          	lui	a6,0x0
    164e:	000a0c0f          	0xa0c0f
    1652:	9020                	0x9020
    1654:	000d                	c.nop	3
    1656:	1d00                	addi	s0,sp,688
    1658:	1000000b          	0x1000000b
    165c:	5a01                	li	s4,-32
    165e:	0305                	addi	t1,t1,1
    1660:	1ed8                	addi	a4,sp,884
    1662:	2000                	fld	fs0,0(s0)
    1664:	0f00                	addi	s0,sp,912
    1666:	0a10                	addi	a2,sp,272
    1668:	2000                	fld	fs0,0(s0)
    166a:	0d90                	addi	a2,sp,720
    166c:	0000                	unimp
    166e:	0b31                	addi	s6,s6,12
    1670:	0000                	unimp
    1672:	0110                	addi	a2,sp,128
    1674:	025a                	slli	tp,tp,0x16
    1676:	0079                	c.nop	30
    1678:	0f00                	addi	s0,sp,912
    167a:	0a1a                	slli	s4,s4,0x6
    167c:	2000                	fld	fs0,0(s0)
    167e:	0d90                	addi	a2,sp,720
    1680:	0000                	unimp
    1682:	0b48                	addi	a0,sp,404
    1684:	0000                	unimp
    1686:	0110                	addi	a2,sp,128
    1688:	055a                	slli	a0,a0,0x16
    168a:	001ee403          	0x1ee403
    168e:	0020                	addi	s0,sp,8
    1690:	000a1e0f          	0xa1e0f
    1694:	0420                	addi	s0,sp,520
    1696:	000d                	c.nop	3
    1698:	5c00                	lw	s0,56(s0)
    169a:	1000000b          	0x1000000b
    169e:	5a01                	li	s4,-32
    16a0:	7802                	flw	fa6,32(sp)
    16a2:	0000                	unimp
    16a4:	000a280f          	0xa280f
    16a8:	9020                	0x9020
    16aa:	000d                	c.nop	3
    16ac:	7300                	flw	fs0,32(a4)
    16ae:	1000000b          	0x1000000b
    16b2:	5a01                	li	s4,-32
    16b4:	0305                	addi	t1,t1,1
    16b6:	1fd4                	addi	a3,sp,1012
    16b8:	2000                	fld	fs0,0(s0)
    16ba:	0f00                	addi	s0,sp,912
    16bc:	0a38                	addi	a4,sp,280
    16be:	2000                	fld	fs0,0(s0)
    16c0:	0d90                	addi	a2,sp,720
    16c2:	0000                	unimp
    16c4:	00000b87          	0xb87
    16c8:	0110                	addi	a2,sp,128
    16ca:	025a                	slli	tp,tp,0x16
    16cc:	0079                	c.nop	30
    16ce:	1f00                	addi	s0,sp,944
    16d0:	0a42                	slli	s4,s4,0x10
    16d2:	2000                	fld	fs0,0(s0)
    16d4:	0d90                	addi	a2,sp,720
    16d6:	0000                	unimp
    16d8:	0110                	addi	a2,sp,128
    16da:	055a                	slli	a0,a0,0x16
    16dc:	001ecc03          	lbu	s8,1(t4)
    16e0:	0020                	addi	s0,sp,8
    16e2:	3300                	fld	fs0,32(a4)
    16e4:	06c0                	addi	s0,sp,836
    16e6:	0000                	unimp
    16e8:	e701                	bnez	a4,16f0 <_prog_start-0x1fffe910>
    16ea:	094e                	slli	s2,s2,0x13
    16ec:	2000                	fld	fs0,0(s0)
    16ee:	00a6                	slli	ra,ra,0x9
    16f0:	0000                	unimp
    16f2:	9c01                	0x9c01
    16f4:	0c64                	addi	s1,sp,540
    16f6:	0000                	unimp
    16f8:	6934                	flw	fa3,80(a0)
    16fa:	0100                	addi	s0,sp,128
    16fc:	000065e7          	0x65e7
    1700:	7c00                	flw	fs0,56(s0)
    1702:	0008                	0x8
    1704:	3500                	fld	fs0,40(a0)
    1706:	006a                	c.slli	zero,0x1a
    1708:	e801                	bnez	s0,1718 <_prog_start-0x1fffe8e8>
    170a:	0085                	addi	ra,ra,1
    170c:	0000                	unimp
    170e:	08a5                	addi	a7,a7,9
    1710:	0000                	unimp
    1712:	4236                	lw	tp,76(sp)
    1714:	5200000f          	0x5200000f
    1718:	0009                	c.nop	2
    171a:	0020                	addi	s0,sp,8
    171c:	0001                	nop
    171e:	0100                	addi	s0,sp,128
    1720:	f7e9                	bnez	a5,16ea <_prog_start-0x1fffe916>
    1722:	1400000b          	0x1400000b
    1726:	0f4e                	slli	t5,t5,0x13
    1728:	0000                	unimp
    172a:	08f8                	addi	a4,sp,92
    172c:	0000                	unimp
    172e:	e61f 0009 ce20      	0xce200009e61f
    1734:	1000000f          	0x1000000f
    1738:	5a01                	li	s4,-32
    173a:	0802                	c.slli64	a6
    173c:	0030                	addi	a2,sp,8
    173e:	3600                	fld	fs0,40(a2)
    1740:	0f42                	slli	t5,t5,0x10
    1742:	0000                	unimp
    1744:	0974                	addi	a3,sp,156
    1746:	2000                	fld	fs0,0(s0)
    1748:	0120                	addi	s0,sp,136
    174a:	0000                	unimp
    174c:	ea01                	bnez	a2,175c <_prog_start-0x1fffe8a4>
    174e:	0c24                	addi	s1,sp,536
    1750:	0000                	unimp
    1752:	4e14                	lw	a3,24(a2)
    1754:	1a00000f          	0x1a00000f
    1758:	0009                	c.nop	2
    175a:	1f00                	addi	s0,sp,944
    175c:	09f2                	slli	s3,s3,0x1c
    175e:	2000                	fld	fs0,0(s0)
    1760:	0fce                	slli	t6,t6,0x13
    1762:	0000                	unimp
    1764:	0110                	addi	a2,sp,128
    1766:	025a                	slli	tp,tp,0x16
    1768:	7808                	flw	fa0,48(s0)
    176a:	0000                	unimp
    176c:	4236                	lw	tp,76(sp)
    176e:	8a00000f          	0x8a00000f
    1772:	0009                	c.nop	2
    1774:	3820                	fld	fs0,112(s0)
    1776:	0001                	nop
    1778:	0100                	addi	s0,sp,128
    177a:	4aed                	li	s5,27
    177c:	000c                	0xc
    177e:	1400                	addi	s0,sp,544
    1780:	0f4e                	slli	t5,t5,0x13
    1782:	0000                	unimp
    1784:	093c                	addi	a5,sp,152
    1786:	0000                	unimp
    1788:	9a0e                	add	s4,s4,gp
    178a:	0009                	c.nop	2
    178c:	ce20                	sw	s0,88(a2)
    178e:	0000000f          	fence	unknown,unknown
    1792:	000f4237          	lui	tp,0xf4
    1796:	9400                	0x9400
    1798:	0009                	c.nop	2
    179a:	5820                	lw	s0,112(s0)
    179c:	0001                	nop
    179e:	0100                	addi	s0,sp,128
    17a0:	14ec                	addi	a1,sp,620
    17a2:	0f4e                	slli	t5,t5,0x13
    17a4:	0000                	unimp
    17a6:	0000094f          	fnmadd.s	fs2,ft0,ft0,ft0,rne
    17aa:	0000                	unimp
    17ac:	0006cc33          	xor	s8,a3,zero
    17b0:	0100                	addi	s0,sp,128
    17b2:	aada                	fsd	fs6,336(sp)
    17b4:	0008                	0x8
    17b6:	a420                	fsd	fs0,72(s0)
    17b8:	0000                	unimp
    17ba:	0100                	addi	s0,sp,128
    17bc:	049c                	addi	a5,sp,576
    17be:	000d                	c.nop	3
    17c0:	3400                	fld	fs0,40(s0)
    17c2:	0069                	c.nop	26
    17c4:	da01                	beqz	a2,16d4 <_prog_start-0x1fffe92c>
    17c6:	0065                	c.nop	25
    17c8:	0000                	unimp
    17ca:	096d                	addi	s2,s2,27
    17cc:	0000                	unimp
    17ce:	c81d                	beqz	s0,1804 <_prog_start-0x1fffe7fc>
    17d0:	0000                	unimp
    17d2:	bf00                	fsd	fs0,56(a4)
    17d4:	000c                	0xc
    17d6:	3500                	fld	fs0,40(a0)
    17d8:	df01006b          	0xdf01006b
    17dc:	0085                	addi	ra,ra,1
    17de:	0000                	unimp
    17e0:	09d8                	addi	a4,sp,212
    17e2:	0000                	unimp
    17e4:	000f4237          	lui	tp,0xf4
    17e8:	ea00                	fsw	fs0,16(a2)
    17ea:	0008                	0x8
    17ec:	e020                	fsw	fs0,64(s0)
    17ee:	0000                	unimp
    17f0:	0100                	addi	s0,sp,128
    17f2:	14e1                	addi	s1,s1,-8
    17f4:	0f4e                	slli	t5,t5,0x13
    17f6:	0000                	unimp
    17f8:	0a1c                	addi	a5,sp,272
    17fa:	0000                	unimp
    17fc:	000e                	c.slli	zero,0x3
    17fe:	0009                	c.nop	2
    1800:	ce20                	sw	s0,88(a2)
    1802:	0000000f          	fence	unknown,unknown
    1806:	3600                	fld	fs0,40(a2)
    1808:	0f42                	slli	t5,t5,0x10
    180a:	0000                	unimp
    180c:	08c4                	addi	s1,sp,84
    180e:	2000                	fld	fs0,0(s0)
    1810:	00a8                	addi	a0,sp,72
    1812:	0000                	unimp
    1814:	dc01                	beqz	s0,172c <_prog_start-0x1fffe8d4>
    1816:	0ce9                	addi	s9,s9,26
    1818:	0000                	unimp
    181a:	4e38                	lw	a4,88(a2)
    181c:	2e00000f          	0x2e00000f
    1820:	481f 0009 ce20      	0xce200009481f
    1826:	1000000f          	0x1000000f
    182a:	5a01                	li	s4,-32
    182c:	0802                	c.slli64	a6
    182e:	002e                	c.slli	zero,0xb
    1830:	1f00                	addi	s0,sp,944
    1832:	08c6                	slli	a7,a7,0x11
    1834:	2000                	fld	fs0,0(s0)
    1836:	0d04                	addi	s1,sp,656
    1838:	0000                	unimp
    183a:	0110                	addi	a2,sp,128
    183c:	0c5a                	slli	s8,s8,0x16
    183e:	0078                	addi	a4,sp,12
    1840:	e80a25f7          	0xe80a25f7
    1844:	1b25f703          	0x1b25f703
    1848:	000000f7          	0xf7
    184c:	0006c633          	xor	a2,a3,zero
    1850:	0100                	addi	s0,sp,128
    1852:	f0c4                	fsw	fs1,36(s1)
    1854:	ba200007          	0xba200007
    1858:	0000                	unimp
    185a:	0100                	addi	s0,sp,128
    185c:	909c                	0x909c
    185e:	000d                	c.nop	3
    1860:	3400                	fld	fs0,40(s0)
    1862:	0069                	c.nop	26
    1864:	c401                	beqz	s0,186c <_prog_start-0x1fffe794>
    1866:	00a1                	addi	ra,ra,8
    1868:	0000                	unimp
    186a:	0a3a                	slli	s4,s4,0xe
    186c:	0000                	unimp
    186e:	6a35                	lui	s4,0xd
    1870:	0100                	addi	s0,sp,128
    1872:	a1c5                	j	1d52 <_prog_start-0x1fffe2ae>
    1874:	0000                	unimp
    1876:	8f00                	0x8f00
    1878:	000a                	c.slli	zero,0x2
    187a:	3500                	fld	fs0,40(a0)
    187c:	cb01006b          	0xcb01006b
    1880:	0085                	addi	ra,ra,1
    1882:	0000                	unimp
    1884:	0ac5                	addi	s5,s5,17
    1886:	0000                	unimp
    1888:	4236                	lw	tp,76(sp)
    188a:	3200000f          	0x3200000f
    188e:	0008                	0x8
    1890:	7020                	flw	fs0,96(s0)
    1892:	0000                	unimp
    1894:	0100                	addi	s0,sp,128
    1896:	66d4                	flw	fa3,12(a3)
    1898:	000d                	c.nop	3
    189a:	1400                	addi	s0,sp,544
    189c:	0f4e                	slli	t5,t5,0x13
    189e:	0000                	unimp
    18a0:	0b4d                	addi	s6,s6,19
    18a2:	0000                	unimp
    18a4:	3e0e                	fld	ft8,224(sp)
    18a6:	0008                	0x8
    18a8:	ce20                	sw	s0,88(a2)
    18aa:	0000000f          	fence	unknown,unknown
    18ae:	000f4237          	lui	tp,0xf4
    18b2:	7c00                	flw	fs0,56(s0)
    18b4:	0008                	0x8
    18b6:	9020                	0x9020
    18b8:	0000                	unimp
    18ba:	0100                	addi	s0,sp,128
    18bc:	14c8                	addi	a0,sp,612
    18be:	0f4e                	slli	t5,t5,0x13
    18c0:	0000                	unimp
    18c2:	0b7d                	addi	s6,s6,31
    18c4:	0000                	unimp
    18c6:	a01f 0008 ce20      	0xce200008a01f
    18cc:	1000000f          	0x1000000f
    18d0:	5a01                	li	s4,-32
    18d2:	0802                	c.slli64	a6
    18d4:	002d                	c.nop	11
    18d6:	0000                	unimp
    18d8:	0006b333          	sltu	t1,a3,zero
    18dc:	0100                	addi	s0,sp,128
    18de:	b4ba                	fsd	fa4,104(sp)
    18e0:	3c200007          	0x3c200007
    18e4:	0000                	unimp
    18e6:	0100                	addi	s0,sp,128
    18e8:	d59c                	sw	a5,40(a1)
    18ea:	000d                	c.nop	3
    18ec:	3400                	fld	fs0,40(s0)
    18ee:	ba010073          	0xba010073
    18f2:	0dd5                	addi	s11,s11,21
    18f4:	0000                	unimp
    18f6:	0b9f 0000 4237      	0x423700000b9f
    18fc:	c000000f          	0xc000000f
    1900:	48200007          	0x48200007
    1904:	0000                	unimp
    1906:	0100                	addi	s0,sp,128
    1908:	14bc                	addi	a5,sp,616
    190a:	0f4e                	slli	t5,t5,0x13
    190c:	0000                	unimp
    190e:	0bc8                	addi	a0,sp,468
    1910:	0000                	unimp
    1912:	d40e                	sw	gp,40(sp)
    1914:	ce200007          	0xce200007
    1918:	0000000f          	fence	unknown,unknown
    191c:	0700                	addi	s0,sp,896
    191e:	db04                	sw	s1,48(a4)
    1920:	0000                	unimp
    1922:	3100                	fld	fs0,32(a0)
    1924:	0621                	addi	a2,a2,8
    1926:	0000                	unimp
    1928:	8701                	c.srai64	a4
    192a:	00d4                	addi	a3,sp,68
    192c:	0000                	unimp
    192e:	06e2                	slli	a3,a3,0x18
    1930:	2000                	fld	fs0,0(s0)
    1932:	00d2                	slli	ra,ra,0x14
    1934:	0000                	unimp
    1936:	9c01                	0x9c01
    1938:	0e86                	slli	t4,t4,0x1
    193a:	0000                	unimp
    193c:	5932                	lw	s2,44(sp)
    193e:	01000007          	0x1000007
    1942:	00008587          	0x8587
    1946:	e600                	fsw	fs0,8(a2)
    1948:	3900000b          	0x3900000b
    194c:	0805                	addi	a6,a6,1
    194e:	0000                	unimp
    1950:	8701                	c.srai64	a4
    1952:	0085                	addi	ra,ra,1
    1954:	0000                	unimp
    1956:	5b01                	li	s6,-32
    1958:	7635                	lui	a2,0xfffed
    195a:	6c61                	lui	s8,0x18
    195c:	0100                	addi	s0,sp,128
    195e:	9688                	0x9688
    1960:	0000                	unimp
    1962:	2b00                	fld	fs0,16(a4)
    1964:	000c                	0xc
    1966:	3500                	fld	fs0,40(a0)
    1968:	0069                	c.nop	26
    196a:	8901                	andi	a0,a0,0
    196c:	0065                	c.nop	25
    196e:	0000                	unimp
    1970:	0c49                	addi	s8,s8,18
    1972:	0000                	unimp
    1974:	6b35                	lui	s6,0xd
    1976:	0100                	addi	s0,sp,128
    1978:	6589                	lui	a1,0x2
    197a:	0000                	unimp
    197c:	b700                	fsd	fs0,40(a4)
    197e:	000c                	0xc
    1980:	1700                	addi	s0,sp,928
    1982:	0fa9                	addi	t6,t6,10
    1984:	0000                	unimp
    1986:	0730                	addi	a2,sp,904
    1988:	2000                	fld	fs0,0(s0)
    198a:	0008                	0x8
    198c:	0000                	unimp
    198e:	a501                	j	1f8e <_prog_start-0x1fffe072>
    1990:	0e61                	addi	t3,t3,24
    1992:	0000                	unimp
    1994:	3018                	fld	fa4,32(s0)
    1996:	08200007          	0x8200007
    199a:	0000                	unimp
    199c:	1600                	addi	s0,sp,800
    199e:	1250                	addi	a2,sp,292
    19a0:	0000                	unimp
    19a2:	5716                	lw	a4,100(sp)
    19a4:	0012                	c.slli	zero,0x4
    19a6:	0000                	unimp
    19a8:	1900                	addi	s0,sp,176
    19aa:	0fa9                	addi	t6,t6,10
    19ac:	0000                	unimp
    19ae:	0746                	slli	a4,a4,0x11
    19b0:	2000                	fld	fs0,0(s0)
    19b2:	0008                	0x8
    19b4:	0000                	unimp
    19b6:	a801                	j	19c6 <_prog_start-0x1fffe63a>
    19b8:	4618                	lw	a4,8(a2)
    19ba:	08200007          	0x8200007
    19be:	0000                	unimp
    19c0:	1600                	addi	s0,sp,800
    19c2:	1250                	addi	a2,sp,292
    19c4:	0000                	unimp
    19c6:	5716                	lw	a4,100(sp)
    19c8:	0012                	c.slli	zero,0x4
    19ca:	0000                	unimp
    19cc:	0000                	unimp
    19ce:	a53a                	fsd	fa4,136(sp)
    19d0:	01000007          	0x1000007
    19d4:	a478                	fsd	fa4,200(s0)
    19d6:	0006                	c.slli	zero,0x1
    19d8:	3e20                	fld	fs0,120(a2)
    19da:	0000                	unimp
    19dc:	0100                	addi	s0,sp,128
    19de:	e89c                	fsw	fa5,16(s1)
    19e0:	000e                	c.slli	zero,0x3
    19e2:	1700                	addi	s0,sp,928
    19e4:	0fa9                	addi	t6,t6,10
    19e6:	0000                	unimp
    19e8:	06b4                	addi	a3,sp,840
    19ea:	2000                	fld	fs0,0(s0)
    19ec:	0008                	0x8
    19ee:	0000                	unimp
    19f0:	7c01                	lui	s8,0xfffe0
    19f2:	00000ec3          	fmadd.s	ft9,ft0,ft0,ft0,rne
    19f6:	b418                	fsd	fa4,40(s0)
    19f8:	0006                	c.slli	zero,0x1
    19fa:	0820                	addi	s0,sp,24
    19fc:	0000                	unimp
    19fe:	1600                	addi	s0,sp,800
    1a00:	1250                	addi	a2,sp,292
    1a02:	0000                	unimp
    1a04:	5716                	lw	a4,100(sp)
    1a06:	0012                	c.slli	zero,0x4
    1a08:	0000                	unimp
    1a0a:	1900                	addi	s0,sp,176
    1a0c:	0fa9                	addi	t6,t6,10
    1a0e:	0000                	unimp
    1a10:	06ca                	slli	a3,a3,0x12
    1a12:	2000                	fld	fs0,0(s0)
    1a14:	0008                	0x8
    1a16:	0000                	unimp
    1a18:	7e01                	lui	t3,0xfffe0
    1a1a:	ca18                	sw	a4,16(a2)
    1a1c:	0006                	c.slli	zero,0x1
    1a1e:	0820                	addi	s0,sp,24
    1a20:	0000                	unimp
    1a22:	1600                	addi	s0,sp,800
    1a24:	1250                	addi	a2,sp,292
    1a26:	0000                	unimp
    1a28:	5716                	lw	a4,100(sp)
    1a2a:	0012                	c.slli	zero,0x4
    1a2c:	0000                	unimp
    1a2e:	0000                	unimp
    1a30:	b931                	j	164c <_prog_start-0x1fffe9b4>
    1a32:	0006                	c.slli	zero,0x1
    1a34:	0100                	addi	s0,sp,128
    1a36:	0000a16f          	jal	sp,ba36 <_prog_start-0x1fff45ca>
    1a3a:	8000                	0x8000
    1a3c:	0006                	c.slli	zero,0x1
    1a3e:	2420                	fld	fs0,72(s0)
    1a40:	0000                	unimp
    1a42:	0100                	addi	s0,sp,128
    1a44:	429c                	lw	a5,0(a3)
    1a46:	3400000f          	0x3400000f
    1a4a:	0078                	addi	a4,sp,12
    1a4c:	6f01                	0x6f01
    1a4e:	00a1                	addi	ra,ra,8
    1a50:	0000                	unimp
    1a52:	0ced                	addi	s9,s9,27
    1a54:	0000                	unimp
    1a56:	6235                	lui	tp,0xd
    1a58:	7469                	lui	s0,0xffffa
    1a5a:	0100                	addi	s0,sp,128
    1a5c:	a172                	fsd	ft8,128(sp)
    1a5e:	0000                	unimp
    1a60:	0b00                	addi	s0,sp,400
    1a62:	000d                	c.nop	3
    1a64:	1900                	addi	s0,sp,176
    1a66:	0fa9                	addi	t6,t6,10
    1a68:	0000                	unimp
    1a6a:	0682                	c.slli64	a3
    1a6c:	2000                	fld	fs0,0(s0)
    1a6e:	0008                	0x8
    1a70:	0000                	unimp
    1a72:	7101                	addi	sp,sp,-512
    1a74:	8218                	0x8218
    1a76:	0006                	c.slli	zero,0x1
    1a78:	0820                	addi	s0,sp,24
    1a7a:	0000                	unimp
    1a7c:	1600                	addi	s0,sp,800
    1a7e:	1250                	addi	a2,sp,292
    1a80:	0000                	unimp
    1a82:	5716                	lw	a4,100(sp)
    1a84:	0012                	c.slli	zero,0x4
    1a86:	0000                	unimp
    1a88:	0000                	unimp
    1a8a:	0006993b          	0x6993b
    1a8e:	0100                	addi	s0,sp,128
    1a90:	0161                	addi	sp,sp,24
    1a92:	0f58                	addi	a4,sp,916
    1a94:	0000                	unimp
    1a96:	633c                	flw	fa5,64(a4)
    1a98:	0100                	addi	s0,sp,128
    1a9a:	d461                	beqz	s0,1a62 <_prog_start-0x1fffe59e>
    1a9c:	0000                	unimp
    1a9e:	0000                	unimp
    1aa0:	623d                	lui	tp,0xf
    1aa2:	01000007          	0x1000007
    1aa6:	a14e                	fsd	fs3,128(sp)
    1aa8:	0000                	unimp
    1aaa:	0100                	addi	s0,sp,128
    1aac:	0fa9                	addi	t6,t6,10
    1aae:	0000                	unimp
    1ab0:	6e3c                	flw	fa5,88(a2)
    1ab2:	0100                	addi	s0,sp,128
    1ab4:	a14e                	fsd	fs3,128(sp)
    1ab6:	0000                	unimp
    1ab8:	3e00                	fld	fs0,56(a2)
    1aba:	00000847          	fmsub.s	fa6,ft0,ft0,ft0,rne
    1abe:	4e01                	li	t3,0
    1ac0:	00a1                	addi	ra,ra,8
    1ac2:	0000                	unimp
    1ac4:	00065a3f a1530100 	0xa153010000065a3f
    1acc:	0000                	unimp
    1ace:	3f00                	fld	fs0,56(a4)
    1ad0:	06e9                	addi	a3,a3,26
    1ad2:	0000                	unimp
    1ad4:	5401                	li	s0,-32
    1ad6:	00ac                	addi	a1,sp,72
    1ad8:	0000                	unimp
    1ada:	00083c3f ac580100 	0xac58010000083c3f
    1ae2:	0000                	unimp
    1ae4:	3f00                	fld	fs0,56(a4)
    1ae6:	062c                	addi	a1,sp,776
    1ae8:	0000                	unimp
    1aea:	5901                	li	s2,-32
    1aec:	00a1                	addi	ra,ra,8
    1aee:	0000                	unimp
    1af0:	4000                	lw	s0,0(s0)
    1af2:	0000072b          	0x72b
    1af6:	4101                	li	sp,0
    1af8:	00ac                	addi	a1,sp,72
    1afa:	0000                	unimp
    1afc:	ce01                	beqz	a2,1b14 <_prog_start-0x1fffe4ec>
    1afe:	4100000f          	0x4100000f
    1b02:	6f6c                	flw	fa1,92(a4)
    1b04:	0100                	addi	s0,sp,128
    1b06:	0000a143          	fmadd.s	ft2,ft1,ft0,ft0,rdn
    1b0a:	4100                	lw	s0,0(a0)
    1b0c:	6968                	flw	fa0,84(a0)
    1b0e:	0100                	addi	s0,sp,128
    1b10:	0000a143          	fmadd.s	ft2,ft1,ft0,ft0,rdn
    1b14:	0000                	unimp
    1b16:	4242                	lw	tp,16(sp)
    1b18:	3c00000f          	0x3c00000f
    1b1c:	0005                	c.nop	1
    1b1e:	0e20                	addi	s0,sp,792
    1b20:	0000                	unimp
    1b22:	0100                	addi	s0,sp,128
    1b24:	e99c                	fsw	fa5,16(a1)
    1b26:	4300000f          	0x4300000f
    1b2a:	0f4e                	slli	t5,t5,0x13
    1b2c:	0000                	unimp
    1b2e:	5a01                	li	s4,-32
    1b30:	4200                	lw	s0,0(a2)
    1b32:	000005af          	0x5af
    1b36:	054a                	slli	a0,a0,0x12
    1b38:	2000                	fld	fs0,0(s0)
    1b3a:	00de                	slli	ra,ra,0x17
    1b3c:	0000                	unimp
    1b3e:	9c01                	0x9c01
    1b40:	123d                	addi	tp,tp,-17
    1b42:	0000                	unimp
    1b44:	bc14                	fsd	fa3,56(s0)
    1b46:	0005                	c.nop	1
    1b48:	a100                	fsd	fs0,0(a0)
    1b4a:	000d                	c.nop	3
    1b4c:	4300                	lw	s0,0(a4)
    1b4e:	05c8                	addi	a0,sp,708
    1b50:	0000                	unimp
    1b52:	5b01                	li	s6,-32
    1b54:	d414                	sw	a3,40(s0)
    1b56:	0005                	c.nop	1
    1b58:	dd00                	sw	s0,56(a0)
    1b5a:	000d                	c.nop	3
    1b5c:	2000                	fld	fs0,0(s0)
    1b5e:	0a9d                	addi	s5,s5,7
    1b60:	0000                	unimp
    1b62:	0550                	addi	a2,sp,644
    1b64:	2000                	fld	fs0,0(s0)
    1b66:	0026                	c.slli	zero,0x9
    1b68:	0000                	unimp
    1b6a:	d001                	beqz	s0,1a6a <_prog_start-0x1fffe596>
    1b6c:	9701                	srai	a4,a4,0x20
    1b6e:	0010                	0x10
    1b70:	3800                	fld	fs0,48(s0)
    1b72:	0aaa                	slli	s5,s5,0xa
    1b74:	0000                	unimp
    1b76:	1809                	addi	a6,a6,-30
    1b78:	0550                	addi	a2,sp,644
    1b7a:	2000                	fld	fs0,0(s0)
    1b7c:	0026                	c.slli	zero,0x9
    1b7e:	0000                	unimp
    1b80:	b644                	fsd	fs1,168(a2)
    1b82:	000a                	c.slli	zero,0x2
    1b84:	3e00                	fld	fs0,56(a2)
    1b86:	c245                	beqz	a2,1c26 <_prog_start-0x1fffe3da>
    1b88:	000a                	c.slli	zero,0x2
    1b8a:	fe00                	fsw	fs0,56(a2)
    1b8c:	000d                	c.nop	3
    1b8e:	2000                	fld	fs0,0(s0)
    1b90:	0fa9                	addi	t6,t6,10
    1b92:	0000                	unimp
    1b94:	0550                	addi	a2,sp,644
    1b96:	2000                	fld	fs0,0(s0)
    1b98:	0008                	0x8
    1b9a:	0000                	unimp
    1b9c:	0801                	addi	a6,a6,0
    1b9e:	7001                	c.lui	zero,0xfffe0
    1ba0:	0010                	0x10
    1ba2:	1800                	addi	s0,sp,48
    1ba4:	0550                	addi	a2,sp,644
    1ba6:	2000                	fld	fs0,0(s0)
    1ba8:	0008                	0x8
    1baa:	0000                	unimp
    1bac:	b916                	fsd	ft5,176(sp)
    1bae:	1600000f          	0x1600000f
    1bb2:	00000fc3          	fmadd.s	ft11,ft0,ft0,ft0,rne
    1bb6:	0000                	unimp
    1bb8:	a921                	j	1fd0 <_prog_start-0x1fffe030>
    1bba:	6200000f          	0x6200000f
    1bbe:	0005                	c.nop	1
    1bc0:	0820                	addi	s0,sp,24
    1bc2:	0000                	unimp
    1bc4:	0100                	addi	s0,sp,128
    1bc6:	010a                	slli	sp,sp,0x2
    1bc8:	6218                	flw	fa4,0(a2)
    1bca:	0005                	c.nop	1
    1bcc:	0820                	addi	s0,sp,24
    1bce:	0000                	unimp
    1bd0:	1600                	addi	s0,sp,800
    1bd2:	0fb9                	addi	t6,t6,14
    1bd4:	0000                	unimp
    1bd6:	c316                	sw	t0,132(sp)
    1bd8:	0000000f          	fence	unknown,unknown
    1bdc:	0000                	unimp
    1bde:	4600                	lw	s0,8(a2)
    1be0:	05e0                	addi	s0,sp,716
    1be2:	0000                	unimp
    1be4:	0576                	slli	a0,a0,0x1d
    1be6:	2000                	fld	fs0,0(s0)
    1be8:	00b0                	addi	a2,sp,72
    1bea:	0000                	unimp
    1bec:	0005e147          	fmsub.s	ft2,fa1,ft0,ft0,unknown
    1bf0:	0100                	addi	s0,sp,128
    1bf2:	235d                	jal	2198 <_prog_start-0x1fffde68>
    1bf4:	0a9d                	addi	s5,s5,7
    1bf6:	0000                	unimp
    1bf8:	0576                	slli	a0,a0,0x1d
    1bfa:	2000                	fld	fs0,0(s0)
    1bfc:	0028                	addi	a0,sp,8
    1bfe:	0000                	unimp
    1c00:	d701                	beqz	a4,1b08 <_prog_start-0x1fffe4f8>
    1c02:	2f01                	jal	2312 <_prog_start-0x1fffdcee>
    1c04:	0011                	c.nop	4
    1c06:	1400                	addi	s0,sp,544
    1c08:	0aaa                	slli	s5,s5,0xa
    1c0a:	0000                	unimp
    1c0c:	0e16                	slli	t3,t3,0x5
    1c0e:	0000                	unimp
    1c10:	2815                	jal	1c44 <_prog_start-0x1fffe3bc>
    1c12:	0000                	unimp
    1c14:	4500                	lw	s0,8(a0)
    1c16:	0ab6                	slli	s5,s5,0xd
    1c18:	0000                	unimp
    1c1a:	0e2c                	addi	a1,sp,792
    1c1c:	0000                	unimp
    1c1e:	c245                	beqz	a2,1cbe <_prog_start-0x1fffe342>
    1c20:	000a                	c.slli	zero,0x2
    1c22:	4100                	lw	s0,0(a0)
    1c24:	000e                	c.slli	zero,0x3
    1c26:	2000                	fld	fs0,0(s0)
    1c28:	0fa9                	addi	t6,t6,10
    1c2a:	0000                	unimp
    1c2c:	05d0                	addi	a2,sp,708
    1c2e:	2000                	fld	fs0,0(s0)
    1c30:	0008                	0x8
    1c32:	0000                	unimp
    1c34:	0801                	addi	a6,a6,0
    1c36:	0801                	addi	a6,a6,0
    1c38:	0011                	c.nop	4
    1c3a:	1800                	addi	s0,sp,48
    1c3c:	05d0                	addi	a2,sp,708
    1c3e:	2000                	fld	fs0,0(s0)
    1c40:	0008                	0x8
    1c42:	0000                	unimp
    1c44:	b916                	fsd	ft5,176(sp)
    1c46:	1600000f          	0x1600000f
    1c4a:	00000fc3          	fmadd.s	ft11,ft0,ft0,ft0,rne
    1c4e:	0000                	unimp
    1c50:	a921                	j	2068 <_prog_start-0x1fffdf98>
    1c52:	e200000f          	0xe200000f
    1c56:	0005                	c.nop	1
    1c58:	0820                	addi	s0,sp,24
    1c5a:	0000                	unimp
    1c5c:	0100                	addi	s0,sp,128
    1c5e:	010a                	slli	sp,sp,0x2
    1c60:	e218                	fsw	fa4,0(a2)
    1c62:	0005                	c.nop	1
    1c64:	0820                	addi	s0,sp,24
    1c66:	0000                	unimp
    1c68:	1600                	addi	s0,sp,800
    1c6a:	0fb9                	addi	t6,t6,14
    1c6c:	0000                	unimp
    1c6e:	c316                	sw	t0,132(sp)
    1c70:	0000000f          	fence	unknown,unknown
    1c74:	0000                	unimp
    1c76:	2000                	fld	fs0,0(s0)
    1c78:	0a9d                	addi	s5,s5,7
    1c7a:	0000                	unimp
    1c7c:	05a6                	slli	a1,a1,0x9
    1c7e:	2000                	fld	fs0,0(s0)
    1c80:	0026                	c.slli	zero,0x9
    1c82:	0000                	unimp
    1c84:	d501                	beqz	a0,1b8c <_prog_start-0x1fffe474>
    1c86:	b701                	j	1b86 <_prog_start-0x1fffe47a>
    1c88:	0011                	c.nop	4
    1c8a:	1400                	addi	s0,sp,544
    1c8c:	0aaa                	slli	s5,s5,0xa
    1c8e:	0000                	unimp
    1c90:	0e59                	addi	t3,t3,22
    1c92:	0000                	unimp
    1c94:	a618                	fsd	fa4,8(a2)
    1c96:	0005                	c.nop	1
    1c98:	2620                	fld	fs0,72(a2)
    1c9a:	0000                	unimp
    1c9c:	4500                	lw	s0,8(a0)
    1c9e:	0ab6                	slli	s5,s5,0xd
    1ca0:	0000                	unimp
    1ca2:	0e6d                	addi	t3,t3,27
    1ca4:	0000                	unimp
    1ca6:	c245                	beqz	a2,1d46 <_prog_start-0x1fffe2ba>
    1ca8:	000a                	c.slli	zero,0x2
    1caa:	8200                	0x8200
    1cac:	000e                	c.slli	zero,0x3
    1cae:	2000                	fld	fs0,0(s0)
    1cb0:	0fa9                	addi	t6,t6,10
    1cb2:	0000                	unimp
    1cb4:	05a6                	slli	a1,a1,0x9
    1cb6:	2000                	fld	fs0,0(s0)
    1cb8:	0008                	0x8
    1cba:	0000                	unimp
    1cbc:	0801                	addi	a6,a6,0
    1cbe:	9001                	srli	s0,s0,0x20
    1cc0:	0011                	c.nop	4
    1cc2:	1800                	addi	s0,sp,48
    1cc4:	05a6                	slli	a1,a1,0x9
    1cc6:	2000                	fld	fs0,0(s0)
    1cc8:	0008                	0x8
    1cca:	0000                	unimp
    1ccc:	b916                	fsd	ft5,176(sp)
    1cce:	1600000f          	0x1600000f
    1cd2:	00000fc3          	fmadd.s	ft11,ft0,ft0,ft0,rne
    1cd6:	0000                	unimp
    1cd8:	a921                	j	20f0 <_prog_start-0x1fffdf10>
    1cda:	b800000f          	0xb800000f
    1cde:	0005                	c.nop	1
    1ce0:	0820                	addi	s0,sp,24
    1ce2:	0000                	unimp
    1ce4:	0100                	addi	s0,sp,128
    1ce6:	010a                	slli	sp,sp,0x2
    1ce8:	b818                	fsd	fa4,48(s0)
    1cea:	0005                	c.nop	1
    1cec:	0820                	addi	s0,sp,24
    1cee:	0000                	unimp
    1cf0:	1600                	addi	s0,sp,800
    1cf2:	0fb9                	addi	t6,t6,14
    1cf4:	0000                	unimp
    1cf6:	c316                	sw	t0,132(sp)
    1cf8:	0000000f          	fence	unknown,unknown
    1cfc:	0000                	unimp
    1cfe:	2100                	fld	fs0,0(a0)
    1d00:	0a9d                	addi	s5,s5,7
    1d02:	0000                	unimp
    1d04:	05fa                	slli	a1,a1,0x1e
    1d06:	2000                	fld	fs0,0(s0)
    1d08:	0026                	c.slli	zero,0x9
    1d0a:	0000                	unimp
    1d0c:	d901                	beqz	a0,1c1c <_prog_start-0x1fffe3e4>
    1d0e:	1401                	addi	s0,s0,-32
    1d10:	0aaa                	slli	s5,s5,0xa
    1d12:	0000                	unimp
    1d14:	0e9a                	slli	t4,t4,0x6
    1d16:	0000                	unimp
    1d18:	fa18                	fsw	fa4,48(a2)
    1d1a:	0005                	c.nop	1
    1d1c:	2620                	fld	fs0,72(a2)
    1d1e:	0000                	unimp
    1d20:	4500                	lw	s0,8(a0)
    1d22:	0ab6                	slli	s5,s5,0xd
    1d24:	0000                	unimp
    1d26:	0eb0                	addi	a2,sp,856
    1d28:	0000                	unimp
    1d2a:	c245                	beqz	a2,1dca <_prog_start-0x1fffe236>
    1d2c:	000a                	c.slli	zero,0x2
    1d2e:	c500                	sw	s0,8(a0)
    1d30:	000e                	c.slli	zero,0x3
    1d32:	2000                	fld	fs0,0(s0)
    1d34:	0fa9                	addi	t6,t6,10
    1d36:	0000                	unimp
    1d38:	05fa                	slli	a1,a1,0x1e
    1d3a:	2000                	fld	fs0,0(s0)
    1d3c:	0008                	0x8
    1d3e:	0000                	unimp
    1d40:	0801                	addi	a6,a6,0
    1d42:	1401                	addi	s0,s0,-32
    1d44:	0012                	c.slli	zero,0x4
    1d46:	1800                	addi	s0,sp,48
    1d48:	05fa                	slli	a1,a1,0x1e
    1d4a:	2000                	fld	fs0,0(s0)
    1d4c:	0008                	0x8
    1d4e:	0000                	unimp
    1d50:	b916                	fsd	ft5,176(sp)
    1d52:	1600000f          	0x1600000f
    1d56:	00000fc3          	fmadd.s	ft11,ft0,ft0,ft0,rne
    1d5a:	0000                	unimp
    1d5c:	a921                	j	2174 <_prog_start-0x1fffde8c>
    1d5e:	0c00000f          	fence	io,unknown
    1d62:	0006                	c.slli	zero,0x1
    1d64:	0820                	addi	s0,sp,24
    1d66:	0000                	unimp
    1d68:	0100                	addi	s0,sp,128
    1d6a:	010a                	slli	sp,sp,0x2
    1d6c:	0c18                	addi	a4,sp,528
    1d6e:	0006                	c.slli	zero,0x1
    1d70:	0820                	addi	s0,sp,24
    1d72:	0000                	unimp
    1d74:	1600                	addi	s0,sp,800
    1d76:	0fb9                	addi	t6,t6,14
    1d78:	0000                	unimp
    1d7a:	c316                	sw	t0,132(sp)
    1d7c:	0000000f          	fence	unknown,unknown
    1d80:	0000                	unimp
    1d82:	0000                	unimp
    1d84:	4200                	lw	s0,0(a2)
    1d86:	0fa9                	addi	t6,t6,10
    1d88:	0000                	unimp
    1d8a:	0628                	addi	a0,sp,776
    1d8c:	2000                	fld	fs0,0(s0)
    1d8e:	000a                	c.slli	zero,0x2
    1d90:	0000                	unimp
    1d92:	9c01                	0x9c01
    1d94:	125f 0000 b947      	0xb9470000125f
    1d9a:	0100000f          	fence	w,unknown
    1d9e:	475a                	lw	a4,148(sp)
    1da0:	00000fc3          	fmadd.s	ft11,ft0,ft0,ft0,rne
    1da4:	5b01                	li	s6,-32
    1da6:	4200                	lw	s0,0(a2)
    1da8:	0f58                	addi	a4,sp,916
    1daa:	0000                	unimp
    1dac:	0632                	slli	a2,a2,0xc
    1dae:	2000                	fld	fs0,0(s0)
    1db0:	0036                	c.slli	zero,0xd
    1db2:	0000                	unimp
    1db4:	9c01                	0x9c01
    1db6:	12e5                	addi	t0,t0,-7
    1db8:	0000                	unimp
    1dba:	6814                	flw	fa3,16(s0)
    1dbc:	dd00000f          	0xdd00000f
    1dc0:	000e                	c.slli	zero,0x3
    1dc2:	4300                	lw	s0,0(a4)
    1dc4:	0f71                	addi	t5,t5,28
    1dc6:	0000                	unimp
    1dc8:	5b01                	li	s6,-32
    1dca:	000f7c47          	fmsub.s	fs8,ft10,ft0,ft0
    1dce:	0100                	addi	s0,sp,128
    1dd0:	165d                	addi	a2,a2,-9
    1dd2:	00000f87          	0xf87
    1dd6:	9216                	add	tp,tp,t0
    1dd8:	1600000f          	0x1600000f
    1ddc:	0f9d                	addi	t6,t6,7
    1dde:	0000                	unimp
    1de0:	000fa917          	auipc	s2,0xfa
    1de4:	3e00                	fld	fs0,56(a2)
    1de6:	0006                	c.slli	zero,0x1
    1de8:	0820                	addi	s0,sp,24
    1dea:	0000                	unimp
    1dec:	0100                	addi	s0,sp,128
    1dee:	c054                	sw	a3,4(s0)
    1df0:	0012                	c.slli	zero,0x4
    1df2:	1800                	addi	s0,sp,48
    1df4:	063e                	slli	a2,a2,0xf
    1df6:	2000                	fld	fs0,0(s0)
    1df8:	0008                	0x8
    1dfa:	0000                	unimp
    1dfc:	5016                	0x5016
    1dfe:	0012                	c.slli	zero,0x4
    1e00:	1600                	addi	s0,sp,800
    1e02:	00001257          	0x1257
    1e06:	0000                	unimp
    1e08:	a919                	j	221e <_prog_start-0x1fffdde2>
    1e0a:	5400000f          	0x5400000f
    1e0e:	0006                	c.slli	zero,0x1
    1e10:	0820                	addi	s0,sp,24
    1e12:	0000                	unimp
    1e14:	0100                	addi	s0,sp,128
    1e16:	1858                	addi	a4,sp,52
    1e18:	0654                	addi	a3,sp,772
    1e1a:	2000                	fld	fs0,0(s0)
    1e1c:	0008                	0x8
    1e1e:	0000                	unimp
    1e20:	5016                	0x5016
    1e22:	0012                	c.slli	zero,0x4
    1e24:	1600                	addi	s0,sp,800
    1e26:	00001257          	0x1257
    1e2a:	0000                	unimp
    1e2c:	4200                	lw	s0,0(a2)
    1e2e:	0f42                	slli	t5,t5,0x10
    1e30:	0000                	unimp
    1e32:	0668                	addi	a0,sp,780
    1e34:	2000                	fld	fs0,0(s0)
    1e36:	0018                	0x18
    1e38:	0000                	unimp
    1e3a:	9c01                	0x9c01
    1e3c:	0000130b          	0x130b
    1e40:	4e14                	lw	a3,24(a2)
    1e42:	fe00000f          	0xfe00000f
    1e46:	000e                	c.slli	zero,0x3
    1e48:	4800                	lw	s0,16(s0)
    1e4a:	0676                	slli	a2,a2,0x1d
    1e4c:	2000                	fld	fs0,0(s0)
    1e4e:	0fce                	slli	t6,t6,0x13
    1e50:	0000                	unimp
    1e52:	4200                	lw	s0,0(a2)
    1e54:	0a9d                	addi	s5,s5,7
    1e56:	0000                	unimp
    1e58:	0a4e                	slli	s4,s4,0x13
    1e5a:	2000                	fld	fs0,0(s0)
    1e5c:	0034                	addi	a3,sp,8
    1e5e:	0000                	unimp
    1e60:	9c01                	0x9c01
    1e62:	1388                	addi	a0,sp,480
    1e64:	0000                	unimp
    1e66:	aa14                	fsd	fa3,16(a2)
    1e68:	000a                	c.slli	zero,0x2
    1e6a:	2a00                	fld	fs0,16(a2)
    1e6c:	4400000f          	0x4400000f
    1e70:	0ab6                	slli	s5,s5,0xd
    1e72:	0000                	unimp
    1e74:	473e                	lw	a4,204(sp)
    1e76:	0ac2                	slli	s5,s5,0x10
    1e78:	0000                	unimp
    1e7a:	5c06                	lw	s8,96(sp)
    1e7c:	935f0493          	addi	s1,t5,-1739
    1e80:	2004                	fld	fs1,0(s0)
    1e82:	0fa9                	addi	t6,t6,10
    1e84:	0000                	unimp
    1e86:	0a4e                	slli	s4,s4,0x13
    1e88:	2000                	fld	fs0,0(s0)
    1e8a:	0008                	0x8
    1e8c:	0000                	unimp
    1e8e:	0801                	addi	a6,a6,0
    1e90:	6201                	0x6201
    1e92:	18000013          	li	zero,384
    1e96:	0a4e                	slli	s4,s4,0x13
    1e98:	2000                	fld	fs0,0(s0)
    1e9a:	0008                	0x8
    1e9c:	0000                	unimp
    1e9e:	5016                	0x5016
    1ea0:	0012                	c.slli	zero,0x4
    1ea2:	1600                	addi	s0,sp,800
    1ea4:	00001257          	0x1257
    1ea8:	0000                	unimp
    1eaa:	a921                	j	22c2 <_prog_start-0x1fffdd3e>
    1eac:	6c00000f          	0x6c00000f
    1eb0:	000a                	c.slli	zero,0x2
    1eb2:	0820                	addi	s0,sp,24
    1eb4:	0000                	unimp
    1eb6:	0100                	addi	s0,sp,128
    1eb8:	010a                	slli	sp,sp,0x2
    1eba:	6c18                	flw	fa4,24(s0)
    1ebc:	000a                	c.slli	zero,0x2
    1ebe:	0820                	addi	s0,sp,24
    1ec0:	0000                	unimp
    1ec2:	1600                	addi	s0,sp,800
    1ec4:	1250                	addi	a2,sp,292
    1ec6:	0000                	unimp
    1ec8:	5716                	lw	a4,100(sp)
    1eca:	0012                	c.slli	zero,0x4
    1ecc:	0000                	unimp
    1ece:	0000                	unimp
    1ed0:	8342                	mv	t1,a6
    1ed2:	000a                	c.slli	zero,0x2
    1ed4:	8200                	0x8200
    1ed6:	000a                	c.slli	zero,0x2
    1ed8:	1820                	addi	s0,sp,56
    1eda:	0000                	unimp
    1edc:	0100                	addi	s0,sp,128
    1ede:	a59c                	fsd	fa5,8(a1)
    1ee0:	14000013          	li	zero,320
    1ee4:	0a90                	addi	a2,sp,336
    1ee6:	0000                	unimp
    1ee8:	0f58                	addi	a4,sp,916
    1eea:	0000                	unimp
    1eec:	4900                	lw	s0,16(a0)
    1eee:	06a0                	addi	s0,sp,840
    1ef0:	0000                	unimp
    1ef2:	0e56                	slli	t3,t3,0x15
    1ef4:	2000                	fld	fs0,0(s0)
    1ef6:	000e                	c.slli	zero,0x3
    1ef8:	0000                	unimp
    1efa:	9c01                	0x9c01
    1efc:	9749                	srai	a4,a4,0x32
    1efe:	0006                	c.slli	zero,0x1
    1f00:	6400                	flw	fs0,8(s0)
    1f02:	000e                	c.slli	zero,0x3
    1f04:	0a20                	addi	s0,sp,280
    1f06:	0000                	unimp
    1f08:	0100                	addi	s0,sp,128
    1f0a:	429c                	lw	a5,0(a3)
    1f0c:	05ed                	addi	a1,a1,27
    1f0e:	0000                	unimp
    1f10:	0eac                	addi	a1,sp,856
    1f12:	2000                	fld	fs0,0(s0)
    1f14:	0040                	addi	s0,sp,4
    1f16:	0000                	unimp
    1f18:	9c01                	0x9c01
    1f1a:	00001467          	0x1467
    1f1e:	9d20                	0x9d20
    1f20:	000a                	c.slli	zero,0x2
    1f22:	bc00                	fsd	fs0,56(s0)
    1f24:	000e                	c.slli	zero,0x3
    1f26:	2620                	fld	fs0,72(a2)
    1f28:	0000                	unimp
    1f2a:	0100                	addi	s0,sp,128
    1f2c:	01c6                	slli	gp,gp,0x11
    1f2e:	1456                	slli	s0,s0,0x35
    1f30:	0000                	unimp
    1f32:	aa14                	fsd	fa3,16(a2)
    1f34:	000a                	c.slli	zero,0x2
    1f36:	7900                	flw	fs0,48(a0)
    1f38:	1800000f          	0x1800000f
    1f3c:	0ebc                	addi	a5,sp,856
    1f3e:	2000                	fld	fs0,0(s0)
    1f40:	0026                	c.slli	zero,0x9
    1f42:	0000                	unimp
    1f44:	2716                	fld	fa4,320(sp)
    1f46:	16000013          	li	zero,352
    1f4a:	132d                	addi	t1,t1,-21
    1f4c:	0000                	unimp
    1f4e:	a920                	fsd	fs0,80(a0)
    1f50:	bc00000f          	0xbc00000f
    1f54:	000e                	c.slli	zero,0x3
    1f56:	0820                	addi	s0,sp,24
    1f58:	0000                	unimp
    1f5a:	0100                	addi	s0,sp,128
    1f5c:	0108                	addi	a0,sp,128
    1f5e:	0000142f          	0x142f
    1f62:	bc18                	fsd	fa4,56(s0)
    1f64:	000e                	c.slli	zero,0x3
    1f66:	0820                	addi	s0,sp,24
    1f68:	0000                	unimp
    1f6a:	1600                	addi	s0,sp,800
    1f6c:	1250                	addi	a2,sp,292
    1f6e:	0000                	unimp
    1f70:	5716                	lw	a4,100(sp)
    1f72:	0012                	c.slli	zero,0x4
    1f74:	0000                	unimp
    1f76:	2100                	fld	fs0,0(a0)
    1f78:	0fa9                	addi	t6,t6,10
    1f7a:	0000                	unimp
    1f7c:	0ece                	slli	t4,t4,0x13
    1f7e:	2000                	fld	fs0,0(s0)
    1f80:	0008                	0x8
    1f82:	0000                	unimp
    1f84:	0a01                	addi	s4,s4,0
    1f86:	1801                	addi	a6,a6,-32
    1f88:	0ece                	slli	t4,t4,0x13
    1f8a:	2000                	fld	fs0,0(s0)
    1f8c:	0008                	0x8
    1f8e:	0000                	unimp
    1f90:	5016                	0x5016
    1f92:	0012                	c.slli	zero,0x4
    1f94:	1600                	addi	s0,sp,800
    1f96:	00001257          	0x1257
    1f9a:	0000                	unimp
    1f9c:	0000                	unimp
    1f9e:	9722                	add	a4,a4,s0
    1fa0:	0006                	c.slli	zero,0x1
    1fa2:	e200                	fsw	fs0,0(a2)
    1fa4:	000e                	c.slli	zero,0x3
    1fa6:	0820                	addi	s0,sp,24
    1fa8:	0000                	unimp
    1faa:	0100                	addi	s0,sp,128
    1fac:	420001c7          	fmsub.d	ft3,ft0,ft0,fs0,rne
    1fb0:	000005af          	0x5af
    1fb4:	0eec                	addi	a1,sp,860
    1fb6:	2000                	fld	fs0,0(s0)
    1fb8:	0008                	0x8
    1fba:	0000                	unimp
    1fbc:	9c01                	0x9c01
    1fbe:	14b5                	addi	s1,s1,-19
    1fc0:	0000                	unimp
    1fc2:	bc14                	fsd	fa3,56(s0)
    1fc4:	0005                	c.nop	1
    1fc6:	8f00                	0x8f00
    1fc8:	1400000f          	0x1400000f
    1fcc:	05c8                	addi	a0,sp,708
    1fce:	0000                	unimp
    1fd0:	00000fbb          	0xfbb
    1fd4:	d414                	sw	a3,40(s0)
    1fd6:	0005                	c.nop	1
    1fd8:	e700                	fsw	fs0,8(a4)
    1fda:	1100000f          	0x1100000f
    1fde:	0ef2                	slli	t4,t4,0x1c
    1fe0:	2000                	fld	fs0,0(s0)
    1fe2:	0fe9                	addi	t6,t6,26
    1fe4:	0000                	unimp
    1fe6:	0110                	addi	a2,sp,128
    1fe8:	035a                	slli	t1,t1,0x16
    1fea:	105a01f3          	0x105a01f3
    1fee:	5b01                	li	s6,-32
    1ff0:	5b01f303          	0x5b01f303
    1ff4:	0110                	addi	a2,sp,128
    1ff6:	035c                	addi	a5,sp,388
    1ff8:	005c01f3          	0x5c01f3
    1ffc:	4200                	lw	s0,0(a2)
    1ffe:	0591                	addi	a1,a1,4
    2000:	0000                	unimp
    2002:	0ef4                	addi	a3,sp,860
    2004:	2000                	fld	fs0,0(s0)
    2006:	000c                	0xc
    2008:	0000                	unimp
    200a:	9c01                	0x9c01
    200c:	14d2                	slli	s1,s1,0x34
    200e:	0000                	unimp
    2010:	a214                	fsd	fa3,0(a2)
    2012:	0005                	c.nop	1
    2014:	1300                	addi	s0,sp,416
    2016:	0010                	0x10
    2018:	0000                	unimp
    201a:	474a                	lw	a4,144(sp)
    201c:	0005                	c.nop	1
    201e:	0000                	unimp
    2020:	3220000f          	0x3220000f
    2024:	0000                	unimp
    2026:	0100                	addi	s0,sp,128
    2028:	149c                	addi	a5,sp,608
    202a:	0558                	addi	a4,sp,644
    202c:	0000                	unimp
    202e:	1034                	addi	a3,sp,40
    2030:	0000                	unimp
    2032:	6414                	flw	fa3,8(s0)
    2034:	0005                	c.nop	1
    2036:	6e00                	flw	fs0,24(a2)
    2038:	0010                	0x10
    203a:	1400                	addi	s0,sp,544
    203c:	056e                	slli	a0,a0,0x1b
    203e:	0000                	unimp
    2040:	109a                	slli	ra,ra,0x26
    2042:	0000                	unimp
    2044:	7845                	lui	a6,0xffff1
    2046:	0005                	c.nop	1
    2048:	c600                	sw	s0,8(a2)
    204a:	0010                	0x10
    204c:	1500                	addi	s0,sp,672
    204e:	0200                	addi	s0,sp,256
    2050:	0000                	unimp
    2052:	8545                	srai	a0,a0,0x11
    2054:	0005                	c.nop	1
    2056:	f100                	fsw	fs0,32(a0)
    2058:	0010                	0x10
    205a:	2100                	fld	fs0,0(a0)
    205c:	0591                	addi	a1,a1,4
    205e:	0000                	unimp
    2060:	0f1a                	slli	t5,t5,0x6
    2062:	2000                	fld	fs0,0(s0)
    2064:	0002                	c.slli64	zero
    2066:	0000                	unimp
    2068:	ea01                	bnez	a2,2078 <_prog_start-0x1fffdf88>
    206a:	2401                	jal	226a <_prog_start-0x1fffdd96>
    206c:	05a2                	slli	a1,a1,0x8
    206e:	0000                	unimp
    2070:	0000                	unimp
    2072:	0000                	unimp
    2074:	0bc9                	addi	s7,s7,18
    2076:	0000                	unimp
    2078:	0004                	0x4
    207a:	00000717          	auipc	a4,0x0
    207e:	0104                	addi	s1,sp,128
    2080:	0471                	addi	s0,s0,28
    2082:	0000                	unimp
    2084:	c90c                	sw	a1,16(a0)
    2086:	0009                	c.nop	2
    2088:	2900                	fld	fs0,16(a0)
    208a:	0002                	c.slli64	zero
    208c:	fa00                	fsw	fs0,48(a2)
    208e:	0011                	c.nop	4
    2090:	de20                	sw	s0,120(a2)
    2092:	0000                	unimp
    2094:	f000                	fsw	fs0,32(s0)
    2096:	0016                	c.slli	zero,0x5
    2098:	0200                	addi	s0,sp,256
    209a:	0601                	addi	a2,a2,0
    209c:	0441                	addi	s0,s0,16
    209e:	0000                	unimp
    20a0:	0009a003          	lw	zero,0(s3)
    20a4:	0300                	addi	s0,sp,384
    20a6:	0000372b          	0x372b
    20aa:	0200                	addi	s0,sp,256
    20ac:	0801                	addi	a6,a6,0
    20ae:	0000043f 8b050202 	0x8b0502020000043f
    20b6:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
    20ba:	0702                	c.slli64	a4
    20bc:	0512                	slli	a0,a0,0x4
    20be:	0000                	unimp
    20c0:	0007b003          	0x7b003
    20c4:	0300                	addi	s0,sp,384
    20c6:	574d                	li	a4,-13
    20c8:	0000                	unimp
    20ca:	0200                	addi	s0,sp,256
    20cc:	0504                	addi	s1,sp,640
    20ce:	02d1                	addi	t0,t0,20
    20d0:	0000                	unimp
    20d2:	00044d03          	lbu	s10,0(s0) # ffffa000 <_sp+0x7fff6000>
    20d6:	0300                	addi	s0,sp,384
    20d8:	0000694f          	fnmadd.s	fs2,ft0,ft0,ft0,unknown
    20dc:	0200                	addi	s0,sp,256
    20de:	0704                	addi	s1,sp,896
    20e0:	0170                	addi	a2,sp,140
    20e2:	0000                	unimp
    20e4:	0802                	c.slli64	a6
    20e6:	cc05                	beqz	s0,211e <_prog_start-0x1fffdee2>
    20e8:	0002                	c.slli64	zero
    20ea:	0200                	addi	s0,sp,256
    20ec:	0708                	addi	a0,sp,896
    20ee:	0000016b          	0x16b
    20f2:	0404                	addi	s1,sp,512
    20f4:	6905                	lui	s2,0x1
    20f6:	746e                	flw	fs0,248(sp)
    20f8:	0200                	addi	s0,sp,256
    20fa:	0704                	addi	s1,sp,896
    20fc:	0175                	addi	sp,sp,29
    20fe:	0000                	unimp
    2100:	0009a203          	lw	tp,0(s3)
    2104:	0400                	addi	s0,sp,512
    2106:	2c18                	fld	fa4,24(s0)
    2108:	0000                	unimp
    210a:	0300                	addi	s0,sp,384
    210c:	07b2                	slli	a5,a5,0xc
    210e:	0000                	unimp
    2110:	2c04                	fld	fs1,24(s0)
    2112:	004c                	addi	a1,sp,4
    2114:	0000                	unimp
    2116:	00044f03          	lbu	t5,0(s0)
    211a:	0400                	addi	s0,sp,512
    211c:	5e30                	lw	a2,120(a2)
    211e:	0000                	unimp
    2120:	0500                	addi	s0,sp,640
    2122:	0104                	addi	s1,sp,128
    2124:	e30c                	fsw	fa1,0(a4)
    2126:	0000                	unimp
    2128:	0600                	addi	s0,sp,768
    212a:	6870                	flw	fa2,84(s0)
    212c:	0061                	c.nop	24
    212e:	0e01                	addi	t3,t3,0
    2130:	00a2                	slli	ra,ra,0x8
    2132:	0000                	unimp
    2134:	0104                	addi	s1,sp,128
    2136:	001f 7006 6c6f      	0x6c6f7006001f
    213c:	0100                	addi	s0,sp,128
    213e:	0000a20f          	0xa20f
    2142:	0400                	addi	s0,sp,512
    2144:	1e01                	addi	t3,t3,-32
    2146:	0700                	addi	s0,sp,896
    2148:	00000b33          	add	s6,zero,zero
    214c:	1001                	c.nop	-32
    214e:	00a2                	slli	ra,ra,0x8
    2150:	0000                	unimp
    2152:	1e04                	addi	s1,sp,816
    2154:	0000                	unimp
    2156:	0800                	addi	s0,sp,16
    2158:	0104                	addi	s1,sp,128
    215a:	fc0a                	fsw	ft2,56(sp)
    215c:	0000                	unimp
    215e:	0900                	addi	s0,sp,144
    2160:	00ad                	addi	ra,ra,11
    2162:	0000                	unimp
    2164:	b30a                	fsd	ft2,416(sp)
    2166:	0008                	0x8
    2168:	0100                	addi	s0,sp,128
    216a:	a212                	fsd	ft4,256(sp)
    216c:	0000                	unimp
    216e:	0000                	unimp
    2170:	0008e303          	0x8e303
    2174:	0100                	addi	s0,sp,128
    2176:	0000e313          	ori	t1,ra,0
    217a:	0500                	addi	s0,sp,640
    217c:	0104                	addi	s1,sp,128
    217e:	2e19                	jal	2494 <_prog_start-0x1fffdb6c>
    2180:	0001                	nop
    2182:	0700                	addi	s0,sp,896
    2184:	00000c13          	li	s8,0
    2188:	1b01                	addi	s6,s6,-32
    218a:	00a2                	slli	ra,ra,0x8
    218c:	0000                	unimp
    218e:	0204                	addi	s1,sp,256
    2190:	001e                	c.slli	zero,0x7
    2192:	000b3307          	fld	ft6,0(s6) # d000 <_prog_start-0x1fff3000>
    2196:	0100                	addi	s0,sp,128
    2198:	a21c                	fsd	fa5,0(a2)
    219a:	0000                	unimp
    219c:	0400                	addi	s0,sp,512
    219e:	001e                	c.slli	zero,0x7
    21a0:	0000                	unimp
    21a2:	0408                	addi	a0,sp,512
    21a4:	1701                	addi	a4,a4,-32
    21a6:	00000147          	fmsub.s	ft2,ft0,ft0,ft0,rne
    21aa:	0709                	addi	a4,a4,2
    21ac:	0001                	nop
    21ae:	0a00                	addi	s0,sp,272
    21b0:	000008b3          	add	a7,zero,zero
    21b4:	1e01                	addi	t3,t3,-32
    21b6:	00a2                	slli	ra,ra,0x8
    21b8:	0000                	unimp
    21ba:	0300                	addi	s0,sp,384
    21bc:	08a4                	addi	s1,sp,88
    21be:	0000                	unimp
    21c0:	1f01                	addi	t5,t5,-32
    21c2:	012e                	slli	sp,sp,0xb
    21c4:	0000                	unimp
    21c6:	0405                	addi	s0,s0,1
    21c8:	2501                	jal	27c8 <_prog_start-0x1fffd838>
    21ca:	00000197          	auipc	gp,0x0
    21ce:	00087d07          	0x87d07
    21d2:	0100                	addi	s0,sp,128
    21d4:	0000a227          	fsw	ft0,4(ra) # 4 <_prog_start-0x1ffffffc>
    21d8:	0400                	addi	s0,sp,512
    21da:	1808                	addi	a0,sp,48
    21dc:	0700                	addi	s0,sp,896
    21de:	00000973          	0x973
    21e2:	2801                	jal	21f2 <_prog_start-0x1fffde0e>
    21e4:	00a2                	slli	ra,ra,0x8
    21e6:	0000                	unimp
    21e8:	0804                	addi	s1,sp,16
    21ea:	0010                	0x10
    21ec:	00086907          	0x86907
    21f0:	0100                	addi	s0,sp,128
    21f2:	a229                	j	22fc <_prog_start-0x1fffdd04>
    21f4:	0000                	unimp
    21f6:	0400                	addi	s0,sp,512
    21f8:	0808                	addi	a0,sp,16
    21fa:	0700                	addi	s0,sp,896
    21fc:	097d                	addi	s2,s2,31
    21fe:	0000                	unimp
    2200:	2a01                	jal	2310 <_prog_start-0x1fffdcf0>
    2202:	00a2                	slli	ra,ra,0x8
    2204:	0000                	unimp
    2206:	0804                	addi	s1,sp,16
    2208:	0000                	unimp
    220a:	0800                	addi	s0,sp,16
    220c:	0104                	addi	s1,sp,128
    220e:	0001b023          	0x1b023
    2212:	0900                	addi	s0,sp,144
    2214:	0152                	slli	sp,sp,0x14
    2216:	0000                	unimp
    2218:	b30a                	fsd	ft2,416(sp)
    221a:	0008                	0x8
    221c:	0100                	addi	s0,sp,128
    221e:	a22c                	fsd	fa1,64(a2)
    2220:	0000                	unimp
    2222:	0000                	unimp
    2224:	000a2b03          	lw	s6,0(s4) # d000 <_prog_start-0x1fff3000>
    2228:	0100                	addi	s0,sp,128
    222a:	972d                	srai	a4,a4,0x2b
    222c:	0001                	nop
    222e:	0500                	addi	s0,sp,640
    2230:	0104                	addi	s1,sp,128
    2232:	00020033          	add	zero,tp,zero
    2236:	0700                	addi	s0,sp,896
    2238:	00000937          	lui	s2,0x0
    223c:	3501                	jal	203c <_prog_start-0x1fffdfc4>
    223e:	00a2                	slli	ra,ra,0x8
    2240:	0000                	unimp
    2242:	0804                	addi	s1,sp,16
    2244:	0018                	0x18
    2246:	00097307          	0x97307
    224a:	0100                	addi	s0,sp,128
    224c:	a236                	fsd	fa3,256(sp)
    224e:	0000                	unimp
    2250:	0400                	addi	s0,sp,512
    2252:	1008                	addi	a0,sp,32
    2254:	0700                	addi	s0,sp,896
    2256:	00000b23          	sb	zero,22(zero) # 16 <_prog_start-0x1fffffea>
    225a:	3701                	jal	215a <_prog_start-0x1fffdea6>
    225c:	00a2                	slli	ra,ra,0x8
    225e:	0000                	unimp
    2260:	0804                	addi	s1,sp,16
    2262:	0008                	0x8
    2264:	00097d07          	0x97d07
    2268:	0100                	addi	s0,sp,128
    226a:	a238                	fsd	fa4,64(a2)
    226c:	0000                	unimp
    226e:	0400                	addi	s0,sp,512
    2270:	0008                	0x8
    2272:	0000                	unimp
    2274:	0408                	addi	a0,sp,512
    2276:	3101                	jal	1e76 <_prog_start-0x1fffe18a>
    2278:	0219                	addi	tp,tp,6
    227a:	0000                	unimp
    227c:	bb09                	j	1f8e <_prog_start-0x1fffe072>
    227e:	0001                	nop
    2280:	0a00                	addi	s0,sp,272
    2282:	000008b3          	add	a7,zero,zero
    2286:	3a01                	jal	1b96 <_prog_start-0x1fffe46a>
    2288:	00a2                	slli	ra,ra,0x8
    228a:	0000                	unimp
    228c:	0300                	addi	s0,sp,384
    228e:	0b3c                	addi	a5,sp,408
    2290:	0000                	unimp
    2292:	3b01                	jal	1fa2 <_prog_start-0x1fffe05e>
    2294:	0200                	addi	s0,sp,256
    2296:	0000                	unimp
    2298:	0405                	addi	s0,s0,1
    229a:	4101                	li	sp,0
    229c:	00000287          	0x287
    22a0:	000a9d07          	0xa9d07
    22a4:	0100                	addi	s0,sp,128
    22a6:	0000a243          	fmadd.s	ft4,ft1,ft0,ft0,rdn
    22aa:	0400                	addi	s0,sp,512
    22ac:	1e02                	slli	t3,t3,0x20
    22ae:	0700                	addi	s0,sp,896
    22b0:	0000093f 00a24401 	0xa244010000093f
    22b8:	0000                	unimp
    22ba:	0104                	addi	s1,sp,128
    22bc:	001d                	c.nop	7
    22be:	6406                	flw	fs0,64(sp)
    22c0:	7269                	lui	tp,0xffffa
    22c2:	0100                	addi	s0,sp,128
    22c4:	a245                	j	2464 <_prog_start-0x1fffdb9c>
    22c6:	0000                	unimp
    22c8:	0400                	addi	s0,sp,512
    22ca:	1c01                	addi	s8,s8,-32
    22cc:	0700                	addi	s0,sp,896
    22ce:	00000973          	0x973
    22d2:	4601                	li	a2,0
    22d4:	00a2                	slli	ra,ra,0x8
    22d6:	0000                	unimp
    22d8:	0c04                	addi	s1,sp,528
    22da:	0010                	0x10
    22dc:	6c06                	flw	fs8,64(sp)
    22de:	6e65                	lui	t3,0x19
    22e0:	0100                	addi	s0,sp,128
    22e2:	0000a247          	fmsub.s	ft4,ft1,ft0,ft0,rdn
    22e6:	0400                	addi	s0,sp,512
    22e8:	0c04                	addi	s1,sp,528
    22ea:	0700                	addi	s0,sp,896
    22ec:	097d                	addi	s2,s2,31
    22ee:	0000                	unimp
    22f0:	4801                	li	a6,0
    22f2:	00a2                	slli	ra,ra,0x8
    22f4:	0000                	unimp
    22f6:	0c04                	addi	s1,sp,528
    22f8:	0000                	unimp
    22fa:	0800                	addi	s0,sp,16
    22fc:	0104                	addi	s1,sp,128
    22fe:	0002a03f 02240900 	0x22409000002a03f
    2306:	0000                	unimp
    2308:	b30a                	fsd	ft2,416(sp)
    230a:	0008                	0x8
    230c:	0100                	addi	s0,sp,128
    230e:	a24a                	fsd	fs2,256(sp)
    2310:	0000                	unimp
    2312:	0000                	unimp
    2314:	000a8c03          	lb	s8,0(s5)
    2318:	0100                	addi	s0,sp,128
    231a:	0002874b          	fnmsub.s	fa4,ft5,ft0,ft0,rne
    231e:	0500                	addi	s0,sp,640
    2320:	0104                	addi	s1,sp,128
    2322:	e151                	bnez	a0,23a6 <_prog_start-0x1fffdc5a>
    2324:	0002                	c.slli64	zero
    2326:	0700                	addi	s0,sp,896
    2328:	03aa                	slli	t2,t2,0xa
    232a:	0000                	unimp
    232c:	5301                	li	t1,-32
    232e:	00a2                	slli	ra,ra,0x8
    2330:	0000                	unimp
    2332:	0804                	addi	s1,sp,16
    2334:	0018                	0x18
    2336:	000b3307          	fld	ft6,0(s6)
    233a:	0100                	addi	s0,sp,128
    233c:	a254                	fsd	fa3,128(a2)
    233e:	0000                	unimp
    2340:	0400                	addi	s0,sp,512
    2342:	07000117          	auipc	sp,0x7000
    2346:	0a4c                	addi	a1,sp,276
    2348:	0000                	unimp
    234a:	5501                	li	a0,-32
    234c:	00a2                	slli	ra,ra,0x8
    234e:	0000                	unimp
    2350:	0104                	addi	s1,sp,128
    2352:	0000                	unimp
    2354:	0800                	addi	s0,sp,16
    2356:	0104                	addi	s1,sp,128
    2358:	0002fa4f          	fnmadd.s	fs4,ft5,ft0,ft0
    235c:	0900                	addi	s0,sp,144
    235e:	000002ab          	0x2ab
    2362:	b30a                	fsd	ft2,416(sp)
    2364:	0008                	0x8
    2366:	0100                	addi	s0,sp,128
    2368:	0000a257          	0xa257
    236c:	0000                	unimp
    236e:	00094603          	lbu	a2,0(s2) # 0 <_prog_start-0x20000000>
    2372:	0100                	addi	s0,sp,128
    2374:	e158                	fsw	fa4,4(a0)
    2376:	0002                	c.slli64	zero
    2378:	0500                	addi	s0,sp,640
    237a:	0104                	addi	s1,sp,128
    237c:	3b5e                	fld	fs6,496(sp)
    237e:	07000003          	lb	zero,112(zero) # 70 <_prog_start-0x1fffff90>
    2382:	03aa                	slli	t2,t2,0xa
    2384:	0000                	unimp
    2386:	6001                	0x6001
    2388:	00a2                	slli	ra,ra,0x8
    238a:	0000                	unimp
    238c:	0804                	addi	s1,sp,16
    238e:	0018                	0x18
    2390:	000b3307          	fld	ft6,0(s6)
    2394:	0100                	addi	s0,sp,128
    2396:	a261                	j	251e <_prog_start-0x1fffdae2>
    2398:	0000                	unimp
    239a:	0400                	addi	s0,sp,512
    239c:	07000117          	auipc	sp,0x7000
    23a0:	08dd                	addi	a7,a7,23
    23a2:	0000                	unimp
    23a4:	6201                	0x6201
    23a6:	00a2                	slli	ra,ra,0x8
    23a8:	0000                	unimp
    23aa:	0104                	addi	s1,sp,128
    23ac:	0000                	unimp
    23ae:	0800                	addi	s0,sp,16
    23b0:	0104                	addi	s1,sp,128
    23b2:	545c                	lw	a5,44(s0)
    23b4:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
    23b8:	0305                	addi	t1,t1,1
    23ba:	0000                	unimp
    23bc:	b30a                	fsd	ft2,416(sp)
    23be:	0008                	0x8
    23c0:	0100                	addi	s0,sp,128
    23c2:	a264                	fsd	fs1,192(a2)
    23c4:	0000                	unimp
    23c6:	0000                	unimp
    23c8:	00095e03          	lhu	t3,0(s2)
    23cc:	0100                	addi	s0,sp,128
    23ce:	3b65                	jal	2186 <_prog_start-0x1fffde7a>
    23d0:	05000003          	lb	zero,80(zero) # 50 <_prog_start-0x1fffffb0>
    23d4:	0104                	addi	s1,sp,128
    23d6:	0003866b          	0x3866b
    23da:	0700                	addi	s0,sp,896
    23dc:	0a64                	addi	s1,sp,284
    23de:	0000                	unimp
    23e0:	6d01                	0x6d01
    23e2:	00a2                	slli	ra,ra,0x8
    23e4:	0000                	unimp
    23e6:	0304                	addi	s1,sp,384
    23e8:	001d                	c.nop	7
    23ea:	000b3307          	fld	ft6,0(s6)
    23ee:	0100                	addi	s0,sp,128
    23f0:	a26e                	fsd	fs11,256(sp)
    23f2:	0000                	unimp
    23f4:	0400                	addi	s0,sp,512
    23f6:	001d                	c.nop	7
    23f8:	0000                	unimp
    23fa:	0408                	addi	a0,sp,512
    23fc:	6901                	0x6901
    23fe:	039f 0000 5f09      	0x5f090000039f
    2404:	0a000003          	lb	zero,160(zero) # a0 <_prog_start-0x1fffff60>
    2408:	000008b3          	add	a7,zero,zero
    240c:	7001                	c.lui	zero,0xfffe0
    240e:	00a2                	slli	ra,ra,0x8
    2410:	0000                	unimp
    2412:	0300                	addi	s0,sp,384
    2414:	0a5c                	addi	a5,sp,276
    2416:	0000                	unimp
    2418:	7101                	addi	sp,sp,-512
    241a:	0386                	slli	t2,t2,0x1
    241c:	0000                	unimp
    241e:	0405                	addi	s0,s0,1
    2420:	7701                	lui	a4,0xfffe0
    2422:	03d1                	addi	t2,t2,20
    2424:	0000                	unimp
    2426:	0008d607          	0x8d607
    242a:	0100                	addi	s0,sp,128
    242c:	a279                	j	25ba <_prog_start-0x1fffda46>
    242e:	0000                	unimp
    2430:	0400                	addi	s0,sp,512
    2432:	07001d03          	lh	s10,112(zero) # 70 <_prog_start-0x1fffff90>
    2436:	00000b33          	add	s6,zero,zero
    243a:	7a01                	lui	s4,0xfffe0
    243c:	00a2                	slli	ra,ra,0x8
    243e:	0000                	unimp
    2440:	1d04                	addi	s1,sp,688
    2442:	0000                	unimp
    2444:	0800                	addi	s0,sp,16
    2446:	0104                	addi	s1,sp,128
    2448:	ea75                	bnez	a2,253c <_prog_start-0x1fffdac4>
    244a:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
    244e:	03aa                	slli	t2,t2,0xa
    2450:	0000                	unimp
    2452:	b30a                	fsd	ft2,416(sp)
    2454:	0008                	0x8
    2456:	0100                	addi	s0,sp,128
    2458:	a27c                	fsd	fa5,192(a2)
    245a:	0000                	unimp
    245c:	0000                	unimp
    245e:	0008ce03          	lbu	t3,0(a7) # 4000 <_prog_start-0x1fffc000>
    2462:	0100                	addi	s0,sp,128
    2464:	d17d                	beqz	a0,244a <_prog_start-0x1fffdbb6>
    2466:	05000003          	lb	zero,80(zero) # 50 <_prog_start-0x1fffffb0>
    246a:	0104                	addi	s1,sp,128
    246c:	00041b83          	lh	s7,0(s0)
    2470:	0600                	addi	s0,sp,768
    2472:	6e65                	lui	t3,0x19
    2474:	0100                	addi	s0,sp,128
    2476:	a285                	j	25d6 <_prog_start-0x1fffda2a>
    2478:	0000                	unimp
    247a:	0400                	addi	s0,sp,512
    247c:	1f01                	addi	t5,t5,-32
    247e:	0700                	addi	s0,sp,896
    2480:	00000b33          	add	s6,zero,zero
    2484:	8601                	c.srai64	a2
    2486:	00a2                	slli	ra,ra,0x8
    2488:	0000                	unimp
    248a:	1f04                	addi	s1,sp,944
    248c:	0000                	unimp
    248e:	0800                	addi	s0,sp,16
    2490:	0104                	addi	s1,sp,128
    2492:	3481                	jal	1ed2 <_prog_start-0x1fffe12e>
    2494:	0004                	0x4
    2496:	0900                	addi	s0,sp,144
    2498:	03f5                	addi	t2,t2,29
    249a:	0000                	unimp
    249c:	b30a                	fsd	ft2,416(sp)
    249e:	0008                	0x8
    24a0:	0100                	addi	s0,sp,128
    24a2:	a288                	fsd	fa0,0(a3)
    24a4:	0000                	unimp
    24a6:	0000                	unimp
    24a8:	00086f03          	0x86f03
    24ac:	0100                	addi	s0,sp,128
    24ae:	1b89                	addi	s7,s7,-30
    24b0:	0004                	0x4
    24b2:	0500                	addi	s0,sp,640
    24b4:	0104                	addi	s1,sp,128
    24b6:	0004cf8f          	0x4cf8f
    24ba:	0700                	addi	s0,sp,896
    24bc:	0ac1                	addi	s5,s5,16
    24be:	0000                	unimp
    24c0:	9101                	srli	a0,a0,0x20
    24c2:	00a2                	slli	ra,ra,0x8
    24c4:	0000                	unimp
    24c6:	0104                	addi	s1,sp,128
    24c8:	001f 7807 000a      	0xa7807001f
    24ce:	0100                	addi	s0,sp,128
    24d0:	a292                	fsd	ft4,320(sp)
    24d2:	0000                	unimp
    24d4:	0400                	addi	s0,sp,512
    24d6:	07001c03          	lh	s8,112(zero) # 70 <_prog_start-0x1fffff90>
    24da:	00000a6b          	0xa6b
    24de:	9301                	srli	a4,a4,0x20
    24e0:	00a2                	slli	ra,ra,0x8
    24e2:	0000                	unimp
    24e4:	0404                	addi	s1,sp,512
    24e6:	0018                	0x18
    24e8:	000af607          	0xaf607
    24ec:	0100                	addi	s0,sp,128
    24ee:	a294                	fsd	fa3,0(a3)
    24f0:	0000                	unimp
    24f2:	0400                	addi	s0,sp,512
    24f4:	1602                	slli	a2,a2,0x20
    24f6:	0700                	addi	s0,sp,896
    24f8:	0a81                	addi	s5,s5,0
    24fa:	0000                	unimp
    24fc:	9501                	srai	a0,a0,0x20
    24fe:	00a2                	slli	ra,ra,0x8
    2500:	0000                	unimp
    2502:	0204                	addi	s1,sp,256
    2504:	0014                	0x14
    2506:	000a9807          	0xa9807
    250a:	0100                	addi	s0,sp,128
    250c:	a296                	fsd	ft5,320(sp)
    250e:	0000                	unimp
    2510:	0400                	addi	s0,sp,512
    2512:	1202                	slli	tp,tp,0x20
    2514:	0700                	addi	s0,sp,896
    2516:	00000b33          	add	s6,zero,zero
    251a:	9701                	srai	a4,a4,0x20
    251c:	00a2                	slli	ra,ra,0x8
    251e:	0000                	unimp
    2520:	0204                	addi	s1,sp,256
    2522:	0010                	0x10
    2524:	0008f307          	0x8f307
    2528:	0100                	addi	s0,sp,128
    252a:	a298                	fsd	fa4,0(a3)
    252c:	0000                	unimp
    252e:	0400                	addi	s0,sp,512
    2530:	0808                	addi	a0,sp,16
    2532:	0700                	addi	s0,sp,896
    2534:	0955                	addi	s2,s2,21
    2536:	0000                	unimp
    2538:	9901                	andi	a0,a0,-32
    253a:	00a2                	slli	ra,ra,0x8
    253c:	0000                	unimp
    253e:	0804                	addi	s1,sp,16
    2540:	0000                	unimp
    2542:	0800                	addi	s0,sp,16
    2544:	0104                	addi	s1,sp,128
    2546:	e88d                	bnez	s1,2578 <_prog_start-0x1fffda88>
    2548:	0004                	0x4
    254a:	0900                	addi	s0,sp,144
    254c:	0000043f 0008b30a 	0x8b30a0000043f
    2554:	0100                	addi	s0,sp,128
    2556:	0000a29b          	0xa29b
    255a:	0000                	unimp
    255c:	00092a03          	lw	s4,0(s2)
    2560:	0100                	addi	s0,sp,128
    2562:	cf9c                	sw	a5,24(a5)
    2564:	0004                	0x4
    2566:	0500                	addi	s0,sp,640
    2568:	0104                	addi	s1,sp,128
    256a:	29a2                	fld	fs3,8(sp)
    256c:	0005                	c.nop	1
    256e:	0700                	addi	s0,sp,896
    2570:	00000a73          	0xa73
    2574:	a401                	j	2774 <_prog_start-0x1fffd88c>
    2576:	00a2                	slli	ra,ra,0x8
    2578:	0000                	unimp
    257a:	0104                	addi	s1,sp,128
    257c:	001f 6407 0008      	0x86407001f
    2582:	0100                	addi	s0,sp,128
    2584:	a2a5                	j	26ec <_prog_start-0x1fffd914>
    2586:	0000                	unimp
    2588:	0400                	addi	s0,sp,512
    258a:	1e01                	addi	t3,t3,-32
    258c:	0700                	addi	s0,sp,896
    258e:	00000b33          	add	s6,zero,zero
    2592:	a601                	j	2892 <_prog_start-0x1fffd76e>
    2594:	00a2                	slli	ra,ra,0x8
    2596:	0000                	unimp
    2598:	1e04                	addi	s1,sp,816
    259a:	0000                	unimp
    259c:	0800                	addi	s0,sp,16
    259e:	0104                	addi	s1,sp,128
    25a0:	42a0                	lw	s0,64(a3)
    25a2:	0005                	c.nop	1
    25a4:	0900                	addi	s0,sp,144
    25a6:	000004f3          	0x4f3
    25aa:	b30a                	fsd	ft2,416(sp)
    25ac:	0008                	0x8
    25ae:	0100                	addi	s0,sp,128
    25b0:	a2a8                	fsd	fa0,64(a3)
    25b2:	0000                	unimp
    25b4:	0000                	unimp
    25b6:	000aeb03          	0xaeb03
    25ba:	0100                	addi	s0,sp,128
    25bc:	29a9                	jal	2a16 <_prog_start-0x1fffd5ea>
    25be:	0005                	c.nop	1
    25c0:	0300                	addi	s0,sp,384
    25c2:	00000b0f          	0xb0f
    25c6:	aa01                	j	26d6 <_prog_start-0x1fffd92a>
    25c8:	0542                	slli	a0,a0,0x10
    25ca:	0000                	unimp
    25cc:	0405                	addi	s0,s0,1
    25ce:	b101                	j	21ce <_prog_start-0x1fffde32>
    25d0:	058e                	slli	a1,a1,0x3
    25d2:	0000                	unimp
    25d4:	00088307          	0x88307
    25d8:	0100                	addi	s0,sp,128
    25da:	0000a2b3          	sltz	t0,ra
    25de:	0400                	addi	s0,sp,512
    25e0:	1010                	addi	a2,sp,32
    25e2:	0700                	addi	s0,sp,896
    25e4:	00000ad3          	fadd.s	fs5,ft0,ft0,rne
    25e8:	b401                	j	1fe8 <_prog_start-0x1fffe018>
    25ea:	00a2                	slli	ra,ra,0x8
    25ec:	0000                	unimp
    25ee:	0504                	addi	s1,sp,640
    25f0:	3307000b          	0x3307000b
    25f4:	0100000b          	0x100000b
    25f8:	a2b5                	j	2764 <_prog_start-0x1fffd89c>
    25fa:	0000                	unimp
    25fc:	0400                	addi	s0,sp,512
    25fe:	0000000b          	0xb
    2602:	0408                	addi	a0,sp,512
    2604:	af01                	j	2d14 <_prog_start-0x1fffd2ec>
    2606:	000005a7          	0x5a7
    260a:	5809                	li	a6,-30
    260c:	0005                	c.nop	1
    260e:	0a00                	addi	s0,sp,272
    2610:	000008b3          	add	a7,zero,zero
    2614:	b701                	j	2514 <_prog_start-0x1fffdaec>
    2616:	00a2                	slli	ra,ra,0x8
    2618:	0000                	unimp
    261a:	0300                	addi	s0,sp,384
    261c:	09b8                	addi	a4,sp,216
    261e:	0000                	unimp
    2620:	b801                	j	1e30 <_prog_start-0x1fffe1d0>
    2622:	058e                	slli	a1,a1,0x3
    2624:	0000                	unimp
    2626:	0405                	addi	s0,s0,1
    2628:	bd01                	j	2438 <_prog_start-0x1fffdbc8>
    262a:	05d8                	addi	a4,sp,708
    262c:	0000                	unimp
    262e:	7306                	flw	ft6,96(sp)
    2630:	0064                	addi	s1,sp,12
    2632:	bf01                	j	2542 <_prog_start-0x1fffdabe>
    2634:	00a2                	slli	ra,ra,0x8
    2636:	0000                	unimp
    2638:	0504                	addi	s1,sp,640
    263a:	3307001b          	0x3307001b
    263e:	0100000b          	0x100000b
    2642:	a2c0                	fsd	fs0,128(a3)
    2644:	0000                	unimp
    2646:	0400                	addi	s0,sp,512
    2648:	0000001b          	0x1b
    264c:	0408                	addi	a0,sp,512
    264e:	bb01                	j	235e <_prog_start-0x1fffdca2>
    2650:	05f1                	addi	a1,a1,28
    2652:	0000                	unimp
    2654:	b209                	j	1f56 <_prog_start-0x1fffe0aa>
    2656:	0005                	c.nop	1
    2658:	0a00                	addi	s0,sp,272
    265a:	000008b3          	add	a7,zero,zero
    265e:	c201                	beqz	a2,265e <_prog_start-0x1fffd9a2>
    2660:	00a2                	slli	ra,ra,0x8
    2662:	0000                	unimp
    2664:	0300                	addi	s0,sp,384
    2666:	0a3a                	slli	s4,s4,0xe
    2668:	0000                	unimp
    266a:	c301                	beqz	a4,266a <_prog_start-0x1fffd996>
    266c:	05d8                	addi	a4,sp,708
    266e:	0000                	unimp
    2670:	7805                	lui	a6,0xfffe1
    2672:	ce01                	beqz	a2,268a <_prog_start-0x1fffd976>
    2674:	0000076b          	0x76b
    2678:	0008bc0b          	0x8bc0b
    267c:	0100                	addi	s0,sp,128
    267e:	a2d0                	fsd	fa2,128(a3)
    2680:	0000                	unimp
    2682:	0000                	unimp
    2684:	0008eb0b          	0x8eb0b
    2688:	0100                	addi	s0,sp,128
    268a:	fcd1                	bnez	s1,2626 <_prog_start-0x1fffd9da>
    268c:	0000                	unimp
    268e:	0400                	addi	s0,sp,512
    2690:	000ac80b          	0xac80b
    2694:	0100                	addi	s0,sp,128
    2696:	a2d2                	fsd	fs4,320(sp)
    2698:	0000                	unimp
    269a:	0800                	addi	s0,sp,16
    269c:	000b040b          	0xb040b
    26a0:	0100                	addi	s0,sp,128
    26a2:	0000a2d3          	fadd.s	ft5,ft1,ft0,rdn
    26a6:	0c00                	addi	s0,sp,528
    26a8:	0009b30b          	0x9b30b
    26ac:	0100                	addi	s0,sp,128
    26ae:	a2d5                	j	2892 <_prog_start-0x1fffd76e>
    26b0:	0000                	unimp
    26b2:	1000                	addi	s0,sp,32
    26b4:	00096d0b          	0x96d0b
    26b8:	0100                	addi	s0,sp,128
    26ba:	a2d6                	fsd	fs5,320(sp)
    26bc:	0000                	unimp
    26be:	1400                	addi	s0,sp,544
    26c0:	0008ac0b          	0x8ac0b
    26c4:	0100                	addi	s0,sp,128
    26c6:	000147d7          	0x147d7
    26ca:	1800                	addi	s0,sp,48
    26cc:	0008990b          	0x8990b
    26d0:	0100                	addi	s0,sp,128
    26d2:	a2d8                	fsd	fa4,128(a3)
    26d4:	0000                	unimp
    26d6:	1c00                	addi	s0,sp,560
    26d8:	0009000b          	0x9000b
    26dc:	0100                	addi	s0,sp,128
    26de:	a2da                	fsd	fs6,320(sp)
    26e0:	0000                	unimp
    26e2:	2000                	fld	fs0,0(s0)
    26e4:	0009160b          	0x9160b
    26e8:	0100                	addi	s0,sp,128
    26ea:	0000a2db          	0xa2db
    26ee:	2400                	fld	fs0,8(s0)
    26f0:	000a330b          	0xa330b
    26f4:	0100                	addi	s0,sp,128
    26f6:	b0dc                	fsd	fa5,160(s1)
    26f8:	0001                	nop
    26fa:	2800                	fld	fs0,16(s0)
    26fc:	000b440b          	0xb440b
    2700:	0100                	addi	s0,sp,128
    2702:	19dd                	addi	s3,s3,-9
    2704:	0002                	c.slli64	zero
    2706:	2c00                	fld	fs0,24(s0)
    2708:	000a150b          	0xa150b
    270c:	0100                	addi	s0,sp,128
    270e:	a2df 0000 3000      	0x30000000a2df
    2714:	000a510b          	0xa510b
    2718:	0100                	addi	s0,sp,128
    271a:	a2e0                	fsd	fs0,192(a3)
    271c:	0000                	unimp
    271e:	3400                	fld	fs0,40(s0)
    2720:	0009c00b          	0x9c00b
    2724:	0100                	addi	s0,sp,128
    2726:	a7e1                	j	2eee <_prog_start-0x1fffd112>
    2728:	0005                	c.nop	1
    272a:	3800                	fld	fs0,48(s0)
    272c:	000a420b          	0xa420b
    2730:	0100                	addi	s0,sp,128
    2732:	f1e2                	fsw	fs8,224(sp)
    2734:	0005                	c.nop	1
    2736:	3c00                	fld	fs0,56(s0)
    2738:	660c                	flw	fa1,8(a2)
    273a:	746d                	lui	s0,0xffffb
    273c:	0100                	addi	s0,sp,128
    273e:	0002a0e3          	0x2a0e3
    2742:	4000                	lw	s0,0(s0)
    2744:	000ad80b          	0xad80b
    2748:	0100                	addi	s0,sp,128
    274a:	a2e4                	fsd	fs1,192(a3)
    274c:	0000                	unimp
    274e:	4400                	lw	s0,8(s0)
    2750:	00094e0b          	0x94e0b
    2754:	0100                	addi	s0,sp,128
    2756:	fae5                	bnez	a3,2746 <_prog_start-0x1fffd8ba>
    2758:	0002                	c.slli64	zero
    275a:	4800                	lw	s0,16(s0)
    275c:	0009660b          	0x9660b
    2760:	0100                	addi	s0,sp,128
    2762:	54e6                	lw	s1,120(sp)
    2764:	4c000003          	lb	zero,1216(zero) # 4c0 <_prog_start-0x1ffffb40>
    2768:	000a640b          	0xa640b
    276c:	0100                	addi	s0,sp,128
    276e:	9fe8                	0x9fe8
    2770:	50000003          	lb	zero,1280(zero) # 500 <_prog_start-0x1ffffb00>
    2774:	0008d60b          	0x8d60b
    2778:	0100                	addi	s0,sp,128
    277a:	eae9                	bnez	a3,284c <_prog_start-0x1fffd7b4>
    277c:	54000003          	lb	zero,1344(zero) # 540 <_prog_start-0x1ffffac0>
    2780:	0008c30b          	0x8c30b
    2784:	0100                	addi	s0,sp,128
    2786:	a2ea                	fsd	fs10,320(sp)
    2788:	0000                	unimp
    278a:	5800                	lw	s0,48(s0)
    278c:	00090b0b          	0x90b0b
    2790:	0100                	addi	s0,sp,128
    2792:	0000a2eb          	0xa2eb
    2796:	5c00                	lw	s0,56(s0)
    2798:	0008770b          	0x8770b
    279c:	0100                	addi	s0,sp,128
    279e:	34ed                	jal	2288 <_prog_start-0x1fffdd78>
    27a0:	0004                	0x4
    27a2:	6000                	flw	fs0,0(s0)
    27a4:	0009320b          	0x9320b
    27a8:	0100                	addi	s0,sp,128
    27aa:	e8ee                	fsw	fs11,80(sp)
    27ac:	0004                	0x4
    27ae:	6400                	flw	fs0,8(s0)
    27b0:	000aa30b          	0xaa30b
    27b4:	0100                	addi	s0,sp,128
    27b6:	0000a2ef          	jal	t0,c7b6 <_prog_start-0x1fff384a>
    27ba:	6800                	flw	fs0,16(s0)
    27bc:	000a200b          	0xa200b
    27c0:	0100                	addi	s0,sp,128
    27c2:	a2f0                	fsd	fa2,192(a3)
    27c4:	0000                	unimp
    27c6:	6c00                	flw	fs0,24(s0)
    27c8:	690c                	flw	fa1,16(a0)
    27ca:	0065                	c.nop	25
    27cc:	f201                	bnez	a2,26cc <_prog_start-0x1fffd934>
    27ce:	0542                	slli	a0,a0,0x10
    27d0:	0000                	unimp
    27d2:	0c70                	addi	a2,sp,540
    27d4:	7069                	c.lui	zero,0xffffa
    27d6:	0100                	addi	s0,sp,128
    27d8:	00054df3          	0x54df3
    27dc:	7400                	flw	fs0,40(s0)
    27de:	0d00                	addi	s0,sp,656
    27e0:	05fc                	addi	a5,sp,716
    27e2:	0000                	unimp
    27e4:	000b1a03          	lh	s4,0(s6)
    27e8:	0100                	addi	s0,sp,128
    27ea:	6bf4                	flw	fa3,84(a5)
    27ec:	0e000007          	0xe000007
    27f0:	09aa                	slli	s3,s3,0xa
    27f2:	0000                	unimp
    27f4:	3802                	fld	fa6,32(sp)
    27f6:	007e                	c.slli	zero,0x1f
    27f8:	0000                	unimp
    27fa:	1240                	addi	s0,sp,292
    27fc:	2000                	fld	fs0,0(s0)
    27fe:	0098                	addi	a4,sp,64
    2800:	0000                	unimp
    2802:	9c01                	0x9c01
    2804:	00000a3f 000ae30f 	0xae30f00000a3f
    280c:	0200                	addi	s0,sp,256
    280e:	3f38                	fld	fa4,120(a4)
    2810:	000a                	c.slli	zero,0x2
    2812:	1100                	addi	s0,sp,160
    2814:	0011                	c.nop	4
    2816:	1000                	addi	s0,sp,32
    2818:	7562                	flw	fa0,56(sp)
    281a:	0066                	c.slli	zero,0x19
    281c:	3802                	fld	fa6,32(sp)
    281e:	0a45                	addi	s4,s4,17
    2820:	0000                	unimp
    2822:	0000112f          	0x112f
    2826:	0009870f          	0x9870f
    282a:	0200                	addi	s0,sp,256
    282c:	a238                	fsd	fa4,64(a2)
    282e:	0000                	unimp
    2830:	5000                	lw	s0,32(s0)
    2832:	0011                	c.nop	4
    2834:	0f00                	addi	s0,sp,912
    2836:	0000052f          	0x52f
    283a:	3802                	fld	fa6,32(sp)
    283c:	00a2                	slli	ra,ra,0x8
    283e:	0000                	unimp
    2840:	1171                	addi	sp,sp,-4
    2842:	0000                	unimp
    2844:	5a11                	li	s4,-28
    2846:	0008                	0x8
    2848:	0200                	addi	s0,sp,256
    284a:	473a                	lw	a4,140(sp)
    284c:	000a                	c.slli	zero,0x2
    284e:	0100                	addi	s0,sp,128
    2850:	12aa125b          	0x12aa125b
    2854:	2000                	fld	fs0,0(s0)
    2856:	0024                	addi	s1,sp,8
    2858:	0000                	unimp
    285a:	00000863          	beqz	zero,286a <_prog_start-0x1fffd796>
    285e:	02006913          	ori	s2,zero,32
    2862:	8542                	mv	a0,a6
    2864:	0000                	unimp
    2866:	9200                	0x9200
    2868:	0011                	c.nop	4
    286a:	1400                	addi	s0,sp,544
    286c:	0a4d                	addi	s4,s4,19
    286e:	0000                	unimp
    2870:	12b0                	addi	a2,sp,360
    2872:	2000                	fld	fs0,0(s0)
    2874:	0018                	0x18
    2876:	0000                	unimp
    2878:	4302                	lw	t1,0(sp)
    287a:	6815                	lui	a6,0x5
    287c:	000a                	c.slli	zero,0x2
    287e:	1500                	addi	s0,sp,672
    2880:	0a5d                	addi	s4,s4,23
    2882:	0000                	unimp
    2884:	9a16                	add	s4,s4,t0
    2886:	000a                	c.slli	zero,0x2
    2888:	b000                	fsd	fs0,32(s0)
    288a:	0012                	c.slli	zero,0x4
    288c:	0e20                	addi	s0,sp,792
    288e:	0000                	unimp
    2890:	0200                	addi	s0,sp,256
    2892:	00083d2b          	0x83d2b
    2896:	1500                	addi	s0,sp,672
    2898:	0ab1                	addi	s5,s5,12
    289a:	0000                	unimp
    289c:	a615                	j	2bc0 <_prog_start-0x1fffd440>
    289e:	000a                	c.slli	zero,0x2
    28a0:	1700                	addi	s0,sp,928
    28a2:	12b0                	addi	a2,sp,360
    28a4:	2000                	fld	fs0,0(s0)
    28a6:	000e                	c.slli	zero,0x3
    28a8:	0000                	unimp
    28aa:	2f18                	fld	fa4,24(a4)
    28ac:	0000000b          	0xb
    28b0:	1400                	addi	s0,sp,544
    28b2:	00000a73          	0xa73
    28b6:	12be                	slli	t0,t0,0x2f
    28b8:	2000                	fld	fs0,0(s0)
    28ba:	000a                	c.slli	zero,0x2
    28bc:	0000                	unimp
    28be:	2c02                	fld	fs8,0(sp)
    28c0:	8315                	srli	a4,a4,0x5
    28c2:	000a                	c.slli	zero,0x2
    28c4:	1700                	addi	s0,sp,928
    28c6:	12be                	slli	t0,t0,0x2f
    28c8:	2000                	fld	fs0,0(s0)
    28ca:	000a                	c.slli	zero,0x2
    28cc:	0000                	unimp
    28ce:	5318                	lw	a4,32(a4)
    28d0:	0000000b          	0xb
    28d4:	0000                	unimp
    28d6:	1600                	addi	s0,sp,800
    28d8:	0a4d                	addi	s4,s4,19
    28da:	0000                	unimp
    28dc:	124c                	addi	a1,sp,292
    28de:	2000                	fld	fs0,0(s0)
    28e0:	0014                	0x14
    28e2:	0000                	unimp
    28e4:	3d02                	fld	fs10,32(sp)
    28e6:	08df 0000 6819      	0x6819000008df
    28ec:	000a                	c.slli	zero,0x2
    28ee:	b200                	fsd	fs0,32(a2)
    28f0:	0011                	c.nop	4
    28f2:	1900                	addi	s0,sp,176
    28f4:	0a5d                	addi	s4,s4,23
    28f6:	0000                	unimp
    28f8:	11c6                	slli	gp,gp,0x31
    28fa:	0000                	unimp
    28fc:	9a16                	add	s4,s4,t0
    28fe:	000a                	c.slli	zero,0x2
    2900:	4c00                	lw	s0,24(s0)
    2902:	0012                	c.slli	zero,0x4
    2904:	0e20                	addi	s0,sp,792
    2906:	0000                	unimp
    2908:	0200                	addi	s0,sp,256
    290a:	0008ba2b          	0x8ba2b
    290e:	1a00                	addi	s0,sp,304
    2910:	0ab1                	addi	s5,s5,12
    2912:	0000                	unimp
    2914:	0aa61903          	lh	s2,170(a2) # fffed0aa <_sp+0x7ffe90aa>
    2918:	0000                	unimp
    291a:	11e4                	addi	s1,sp,236
    291c:	0000                	unimp
    291e:	00124c17          	auipc	s8,0x124
    2922:	0e20                	addi	s0,sp,792
    2924:	0000                	unimp
    2926:	1800                	addi	s0,sp,48
    2928:	00000b2f          	0xb2f
    292c:	0000                	unimp
    292e:	7314                	flw	fa3,32(a4)
    2930:	000a                	c.slli	zero,0x2
    2932:	5a00                	lw	s0,48(a2)
    2934:	0012                	c.slli	zero,0x4
    2936:	0620                	addi	s0,sp,776
    2938:	0000                	unimp
    293a:	0200                	addi	s0,sp,256
    293c:	152c                	addi	a1,sp,680
    293e:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    2942:	00125a17          	auipc	s4,0x125
    2946:	0620                	addi	s0,sp,776
    2948:	0000                	unimp
    294a:	1800                	addi	s0,sp,48
    294c:	00000b53          	fadd.s	fs6,ft0,ft0,rne
    2950:	0000                	unimp
    2952:	1600                	addi	s0,sp,800
    2954:	0a4d                	addi	s4,s4,19
    2956:	0000                	unimp
    2958:	1268                	addi	a0,sp,300
    295a:	2000                	fld	fs0,0(s0)
    295c:	0012                	c.slli	zero,0x4
    295e:	0000                	unimp
    2960:	3e02                	fld	ft8,32(sp)
    2962:	0956                	slli	s2,s2,0x15
    2964:	0000                	unimp
    2966:	6819                	lui	a6,0x6
    2968:	000a                	c.slli	zero,0x2
    296a:	0200                	addi	s0,sp,256
    296c:	0012                	c.slli	zero,0x4
    296e:	1900                	addi	s0,sp,176
    2970:	0a5d                	addi	s4,s4,23
    2972:	0000                	unimp
    2974:	1224                	addi	s1,sp,296
    2976:	0000                	unimp
    2978:	9a16                	add	s4,s4,t0
    297a:	000a                	c.slli	zero,0x2
    297c:	6800                	flw	fs0,16(s0)
    297e:	0012                	c.slli	zero,0x4
    2980:	0c20                	addi	s0,sp,536
    2982:	0000                	unimp
    2984:	0200                	addi	s0,sp,256
    2986:	0009312b          	0x9312b
    298a:	1500                	addi	s0,sp,672
    298c:	0ab1                	addi	s5,s5,12
    298e:	0000                	unimp
    2990:	a615                	j	2cb4 <_prog_start-0x1fffd34c>
    2992:	000a                	c.slli	zero,0x2
    2994:	1700                	addi	s0,sp,928
    2996:	1268                	addi	a0,sp,300
    2998:	2000                	fld	fs0,0(s0)
    299a:	000c                	0xc
    299c:	0000                	unimp
    299e:	2f18                	fld	fa4,24(a4)
    29a0:	0000000b          	0xb
    29a4:	1400                	addi	s0,sp,544
    29a6:	00000a73          	0xa73
    29aa:	1274                	addi	a3,sp,300
    29ac:	2000                	fld	fs0,0(s0)
    29ae:	0006                	c.slli	zero,0x1
    29b0:	0000                	unimp
    29b2:	2c02                	fld	fs8,0(sp)
    29b4:	8315                	srli	a4,a4,0x5
    29b6:	000a                	c.slli	zero,0x2
    29b8:	1700                	addi	s0,sp,928
    29ba:	1274                	addi	a3,sp,300
    29bc:	2000                	fld	fs0,0(s0)
    29be:	0006                	c.slli	zero,0x1
    29c0:	0000                	unimp
    29c2:	5318                	lw	a4,32(a4)
    29c4:	0000000b          	0xb
    29c8:	0000                	unimp
    29ca:	4d16                	lw	s10,68(sp)
    29cc:	000a                	c.slli	zero,0x2
    29ce:	8200                	0x8200
    29d0:	0012                	c.slli	zero,0x4
    29d2:	1220                	addi	s0,sp,296
    29d4:	0000                	unimp
    29d6:	0200                	addi	s0,sp,256
    29d8:	0009cd3f 0a681900 	0xa6819000009cd3f
    29e0:	0000                	unimp
    29e2:	00001237          	lui	tp,0x1
    29e6:	5d19                	li	s10,-26
    29e8:	000a                	c.slli	zero,0x2
    29ea:	5900                	lw	s0,48(a0)
    29ec:	0012                	c.slli	zero,0x4
    29ee:	1600                	addi	s0,sp,800
    29f0:	0a9a                	slli	s5,s5,0x6
    29f2:	0000                	unimp
    29f4:	1282                	slli	t0,t0,0x20
    29f6:	2000                	fld	fs0,0(s0)
    29f8:	000c                	0xc
    29fa:	0000                	unimp
    29fc:	2b02                	fld	fs6,0(sp)
    29fe:	09a8                	addi	a0,sp,216
    2a00:	0000                	unimp
    2a02:	b115                	j	2626 <_prog_start-0x1fffd9da>
    2a04:	000a                	c.slli	zero,0x2
    2a06:	1500                	addi	s0,sp,672
    2a08:	0aa6                	slli	s5,s5,0x9
    2a0a:	0000                	unimp
    2a0c:	00128217          	auipc	tp,0x128
    2a10:	0c20                	addi	s0,sp,536
    2a12:	0000                	unimp
    2a14:	1800                	addi	s0,sp,48
    2a16:	00000b2f          	0xb2f
    2a1a:	0000                	unimp
    2a1c:	7314                	flw	fa3,32(a4)
    2a1e:	000a                	c.slli	zero,0x2
    2a20:	8e00                	0x8e00
    2a22:	0012                	c.slli	zero,0x4
    2a24:	0620                	addi	s0,sp,776
    2a26:	0000                	unimp
    2a28:	0200                	addi	s0,sp,256
    2a2a:	152c                	addi	a1,sp,680
    2a2c:	00000a83          	lb	s5,0(zero) # 0 <_prog_start-0x20000000>
    2a30:	00128e17          	auipc	t3,0x128
    2a34:	0620                	addi	s0,sp,776
    2a36:	0000                	unimp
    2a38:	1800                	addi	s0,sp,48
    2a3a:	00000b53          	fadd.s	fs6,ft0,ft0,rne
    2a3e:	0000                	unimp
    2a40:	1400                	addi	s0,sp,544
    2a42:	0a4d                	addi	s4,s4,19
    2a44:	0000                	unimp
    2a46:	1298                	addi	a4,sp,352
    2a48:	2000                	fld	fs0,0(s0)
    2a4a:	0012                	c.slli	zero,0x4
    2a4c:	0000                	unimp
    2a4e:	4002                	0x4002
    2a50:	6819                	lui	a6,0x6
    2a52:	000a                	c.slli	zero,0x2
    2a54:	6c00                	flw	fs0,24(s0)
    2a56:	0012                	c.slli	zero,0x4
    2a58:	1b00                	addi	s0,sp,432
    2a5a:	0a5d                	addi	s4,s4,23
    2a5c:	0000                	unimp
    2a5e:	5f01                	li	t5,-32
    2a60:	9a16                	add	s4,s4,t0
    2a62:	000a                	c.slli	zero,0x2
    2a64:	9800                	0x9800
    2a66:	0012                	c.slli	zero,0x4
    2a68:	0c20                	addi	s0,sp,536
    2a6a:	0000                	unimp
    2a6c:	0200                	addi	s0,sp,256
    2a6e:	000a192b          	0xa192b
    2a72:	1500                	addi	s0,sp,672
    2a74:	0ab1                	addi	s5,s5,12
    2a76:	0000                	unimp
    2a78:	a615                	j	2d9c <_prog_start-0x1fffd264>
    2a7a:	000a                	c.slli	zero,0x2
    2a7c:	1700                	addi	s0,sp,928
    2a7e:	1298                	addi	a4,sp,352
    2a80:	2000                	fld	fs0,0(s0)
    2a82:	000c                	0xc
    2a84:	0000                	unimp
    2a86:	2f18                	fld	fa4,24(a4)
    2a88:	0000000b          	0xb
    2a8c:	1400                	addi	s0,sp,544
    2a8e:	00000a73          	0xa73
    2a92:	12a4                	addi	s1,sp,360
    2a94:	2000                	fld	fs0,0(s0)
    2a96:	0006                	c.slli	zero,0x1
    2a98:	0000                	unimp
    2a9a:	2c02                	fld	fs8,0(sp)
    2a9c:	8315                	srli	a4,a4,0x5
    2a9e:	000a                	c.slli	zero,0x2
    2aa0:	1700                	addi	s0,sp,928
    2aa2:	12a4                	addi	s1,sp,360
    2aa4:	2000                	fld	fs0,0(s0)
    2aa6:	0006                	c.slli	zero,0x1
    2aa8:	0000                	unimp
    2aaa:	5318                	lw	a4,32(a4)
    2aac:	0000000b          	0xb
    2ab0:	0000                	unimp
    2ab2:	1c00                	addi	s0,sp,560
    2ab4:	7004                	flw	fs1,32(s0)
    2ab6:	1d000007          	0x1d000007
    2aba:	1c04                	addi	s1,sp,560
    2abc:	8c04                	0x8c04
    2abe:	0000                	unimp
    2ac0:	1e00                	addi	s0,sp,816
    2ac2:	0aae                	slli	s5,s5,0xb
    2ac4:	0000                	unimp
    2ac6:	2902                	fld	fs2,0(sp)
    2ac8:	008c                	addi	a1,sp,64
    2aca:	0000                	unimp
    2acc:	7301                	lui	t1,0xfffe0
    2ace:	000a                	c.slli	zero,0x2
    2ad0:	1f00                	addi	s0,sp,944
    2ad2:	00000ae3          	beqz	zero,32e6 <_prog_start-0x1fffcd1a>
    2ad6:	2902                	fld	fs2,0(sp)
    2ad8:	00000a3f 006e6920 	0x6e692000000a3f
    2ae0:	2902                	fld	fs2,0(sp)
    2ae2:	008c                	addi	a1,sp,64
    2ae4:	0000                	unimp
    2ae6:	1e00                	addi	s0,sp,816
    2ae8:	0b2c                	addi	a1,sp,408
    2aea:	0000                	unimp
    2aec:	1e02                	slli	t3,t3,0x20
    2aee:	008c                	addi	a1,sp,64
    2af0:	0000                	unimp
    2af2:	9a01                	andi	a2,a2,-32
    2af4:	000a                	c.slli	zero,0x2
    2af6:	1f00                	addi	s0,sp,944
    2af8:	00000ae3          	beqz	zero,330c <_prog_start-0x1fffccf4>
    2afc:	1e02                	slli	t3,t3,0x20
    2afe:	00000a3f 74756f21 	0x74756f2100000a3f
    2b06:	0200                	addi	s0,sp,256
    2b08:	9720                	0x9720
    2b0a:	0000                	unimp
    2b0c:	0000                	unimp
    2b0e:	0e22                	slli	t3,t3,0x8
    2b10:	000a                	c.slli	zero,0x2
    2b12:	0200                	addi	s0,sp,256
    2b14:	0109                	addi	sp,sp,2
    2b16:	0ac5                	addi	s5,s5,17
    2b18:	0000                	unimp
    2b1a:	e31f 000a 0200      	0x200000ae31f
    2b20:	3f09                	jal	2a32 <_prog_start-0x1fffd5ce>
    2b22:	000a                	c.slli	zero,0x2
    2b24:	2000                	fld	fs0,0(s0)
    2b26:	6e69                	lui	t3,0x1a
    2b28:	0200                	addi	s0,sp,256
    2b2a:	8c09                	sub	s0,s0,a0
    2b2c:	0000                	unimp
    2b2e:	2100                	fld	fs0,0(a0)
    2b30:	0072                	c.slli	zero,0x1c
    2b32:	0c02                	c.slli64	s8
    2b34:	00000097          	auipc	ra,0x0
    2b38:	2300                	fld	fs0,0(a4)
    2b3a:	098c                	addi	a1,sp,208
    2b3c:	0000                	unimp
    2b3e:	0401                	addi	s0,s0,0
    2b40:	8501                	c.srai64	a0
    2b42:	0000                	unimp
    2b44:	fa00                	fsw	fs0,48(a2)
    2b46:	0011                	c.nop	4
    2b48:	1420                	addi	s0,sp,552
    2b4a:	0000                	unimp
    2b4c:	0100                	addi	s0,sp,128
    2b4e:	0e9c                	addi	a5,sp,848
    2b50:	2400000b          	0x2400000b
    2b54:	00000ab7          	lui	s5,0x0
    2b58:	0401                	addi	s0,s0,0
    2b5a:	8501                	c.srai64	a0
    2b5c:	0000                	unimp
    2b5e:	7f00                	flw	fs0,56(a4)
    2b60:	0012                	c.slli	zero,0x4
    2b62:	2400                	fld	fs0,8(s0)
    2b64:	088a                	slli	a7,a7,0x2
    2b66:	0000                	unimp
    2b68:	0401                	addi	s0,s0,0
    2b6a:	8501                	c.srai64	a0
    2b6c:	0000                	unimp
    2b6e:	ad00                	fsd	fs0,24(a0)
    2b70:	0012                	c.slli	zero,0x4
    2b72:	2500                	fld	fs0,8(a0)
    2b74:	0921                	addi	s2,s2,8
    2b76:	0000                	unimp
    2b78:	1001                	c.nop	-32
    2b7a:	8501                	c.srai64	a0
    2b7c:	0000                	unimp
    2b7e:	0100                	addi	s0,sp,128
    2b80:	9a26005b          	0x9a26005b
    2b84:	000a                	c.slli	zero,0x2
    2b86:	0e00                	addi	s0,sp,784
    2b88:	0012                	c.slli	zero,0x4
    2b8a:	0e20                	addi	s0,sp,792
    2b8c:	0000                	unimp
    2b8e:	0100                	addi	s0,sp,128
    2b90:	379c                	fld	fa5,40(a5)
    2b92:	1b00000b          	0x1b00000b
    2b96:	0aa6                	slli	s5,s5,0x9
    2b98:	0000                	unimp
    2b9a:	5a01                	li	s4,-32
    2b9c:	000ab11b          	0xab11b
    2ba0:	0100                	addi	s0,sp,128
    2ba2:	0abb275b          	0xabb275b
    2ba6:	0000                	unimp
    2ba8:	5f01                	li	t5,-32
    2baa:	2600                	fld	fs0,8(a2)
    2bac:	00000a73          	0xa73
    2bb0:	121c                	addi	a5,sp,288
    2bb2:	2000                	fld	fs0,0(s0)
    2bb4:	000c                	0xc
    2bb6:	0000                	unimp
    2bb8:	9c01                	0x9c01
    2bba:	00000b5b          	0xb5b
    2bbe:	8319                	srli	a4,a4,0x6
    2bc0:	000a                	c.slli	zero,0x2
    2bc2:	ce00                	sw	s0,24(a2)
    2bc4:	0012                	c.slli	zero,0x4
    2bc6:	2700                	fld	fs0,8(a4)
    2bc8:	0a8e                	slli	s5,s5,0x3
    2bca:	0000                	unimp
    2bcc:	5f01                	li	t5,-32
    2bce:	2800                	fld	fs0,16(s0)
    2bd0:	0a4d                	addi	s4,s4,19
    2bd2:	0000                	unimp
    2bd4:	1228                	addi	a0,sp,296
    2bd6:	2000                	fld	fs0,0(s0)
    2bd8:	0018                	0x18
    2bda:	0000                	unimp
    2bdc:	9c01                	0x9c01
    2bde:	5d19                	li	s10,-26
    2be0:	000a                	c.slli	zero,0x2
    2be2:	ef00                	fsw	fs0,24(a4)
    2be4:	0012                	c.slli	zero,0x4
    2be6:	1b00                	addi	s0,sp,432
    2be8:	0a68                	addi	a0,sp,284
    2bea:	0000                	unimp
    2bec:	5b01                	li	s6,-32
    2bee:	9a16                	add	s4,s4,t0
    2bf0:	000a                	c.slli	zero,0x2
    2bf2:	2800                	fld	fs0,16(s0)
    2bf4:	0012                	c.slli	zero,0x4
    2bf6:	0c20                	addi	s0,sp,536
    2bf8:	0000                	unimp
    2bfa:	0200                	addi	s0,sp,256
    2bfc:	000ba72b          	0xba72b
    2c00:	1500                	addi	s0,sp,672
    2c02:	0ab1                	addi	s5,s5,12
    2c04:	0000                	unimp
    2c06:	a615                	j	2f2a <_prog_start-0x1fffd0d6>
    2c08:	000a                	c.slli	zero,0x2
    2c0a:	1700                	addi	s0,sp,928
    2c0c:	1228                	addi	a0,sp,296
    2c0e:	2000                	fld	fs0,0(s0)
    2c10:	000c                	0xc
    2c12:	0000                	unimp
    2c14:	2f18                	fld	fa4,24(a4)
    2c16:	0000000b          	0xb
    2c1a:	1400                	addi	s0,sp,544
    2c1c:	00000a73          	0xa73
    2c20:	1234                	addi	a3,sp,296
    2c22:	2000                	fld	fs0,0(s0)
    2c24:	0006                	c.slli	zero,0x1
    2c26:	0000                	unimp
    2c28:	2c02                	fld	fs8,0(sp)
    2c2a:	8315                	srli	a4,a4,0x5
    2c2c:	000a                	c.slli	zero,0x2
    2c2e:	1700                	addi	s0,sp,928
    2c30:	1234                	addi	a3,sp,296
    2c32:	2000                	fld	fs0,0(s0)
    2c34:	0006                	c.slli	zero,0x1
    2c36:	0000                	unimp
    2c38:	5318                	lw	a4,32(a4)
    2c3a:	0000000b          	0xb
    2c3e:	0000                	unimp
    2c40:	8200                	0x8200
    2c42:	001d                	c.nop	7
    2c44:	0400                	addi	s0,sp,512
    2c46:	4400                	lw	s0,8(s0)
    2c48:	0009                	c.nop	2
    2c4a:	0400                	addi	s0,sp,512
    2c4c:	7101                	addi	sp,sp,-512
    2c4e:	0004                	0x4
    2c50:	0c00                	addi	s0,sp,528
    2c52:	00000b4b          	fnmsub.s	fs6,ft0,ft0,ft0,rne
    2c56:	0229                	addi	tp,tp,10
    2c58:	0000                	unimp
    2c5a:	12d8                	addi	a4,sp,356
    2c5c:	2000                	fld	fs0,0(s0)
    2c5e:	08c4                	addi	s1,sp,84
    2c60:	0000                	unimp
    2c62:	00001973          	csrrw	s2,ustatus,zero
    2c66:	0102                	c.slli64	sp
    2c68:	4106                	lw	sp,64(sp)
    2c6a:	0004                	0x4
    2c6c:	0200                	addi	s0,sp,256
    2c6e:	0801                	addi	a6,a6,0
    2c70:	0000043f 8b050202 	0x8b0502020000043f
    2c78:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
    2c7c:	0702                	c.slli64	a4
    2c7e:	0512                	slli	a0,a0,0x4
    2c80:	0000                	unimp
    2c82:	0007b003          	0x7b003
    2c86:	0200                	addi	s0,sp,256
    2c88:	4c4d                	li	s8,19
    2c8a:	0000                	unimp
    2c8c:	0200                	addi	s0,sp,256
    2c8e:	0504                	addi	s1,sp,640
    2c90:	02d1                	addi	t0,t0,20
    2c92:	0000                	unimp
    2c94:	00044d03          	lbu	s10,0(s0) # ffffb000 <_sp+0x7fff7000>
    2c98:	0200                	addi	s0,sp,256
    2c9a:	00005e4f          	fnmadd.s	ft8,ft0,ft0,ft0,unknown
    2c9e:	0200                	addi	s0,sp,256
    2ca0:	0704                	addi	s1,sp,896
    2ca2:	0170                	addi	a2,sp,140
    2ca4:	0000                	unimp
    2ca6:	0802                	c.slli64	a6
    2ca8:	cc05                	beqz	s0,2ce0 <_prog_start-0x1fffd320>
    2caa:	0002                	c.slli64	zero
    2cac:	0200                	addi	s0,sp,256
    2cae:	0708                	addi	a0,sp,896
    2cb0:	0000016b          	0x16b
    2cb4:	0404                	addi	s1,sp,512
    2cb6:	6905                	lui	s2,0x1
    2cb8:	746e                	flw	fs0,248(sp)
    2cba:	0200                	addi	s0,sp,256
    2cbc:	0704                	addi	s1,sp,896
    2cbe:	0175                	addi	sp,sp,29
    2cc0:	0000                	unimp
    2cc2:	0007b203          	0x7b203
    2cc6:	0300                	addi	s0,sp,384
    2cc8:	412c                	lw	a1,64(a0)
    2cca:	0000                	unimp
    2ccc:	0300                	addi	s0,sp,384
    2cce:	0000044f          	fnmadd.s	fs0,ft0,ft0,ft0,rne
    2cd2:	00533003          	0x533003
    2cd6:	0000                	unimp
    2cd8:	1002                	c.slli	zero,0x20
    2cda:	5104                	lw	s1,32(a0)
    2cdc:	03000003          	lb	zero,48(zero) # 30 <_prog_start-0x1fffffd0>
    2ce0:	0049                	c.nop	18
    2ce2:	0000                	unimp
    2ce4:	0704                	addi	s1,sp,896
    2ce6:	00000073          	ecall
    2cea:	00053403          	0x53403
    2cee:	0500                	addi	s0,sp,640
    2cf0:	4c2c                	lw	a1,88(s0)
    2cf2:	0000                	unimp
    2cf4:	0300                	addi	s0,sp,384
    2cf6:	00000077          	0x77
    2cfa:	7205                	lui	tp,0xfffe1
    2cfc:	004c                	addi	a1,sp,4
    2cfe:	0000                	unimp
    2d00:	00050203          	lb	tp,0(a0) # a000 <_prog_start-0x1fff6000>
    2d04:	0500                	addi	s0,sp,640
    2d06:	7391                	lui	t2,0xfffe4
    2d08:	0000                	unimp
    2d0a:	0500                	addi	s0,sp,640
    2d0c:	0000040b          	0x40b
    2d10:	6506                	flw	fa0,64(sp)
    2d12:	7a01                	lui	s4,0xfffe0
    2d14:	0000                	unimp
    2d16:	0600                	addi	s0,sp,768
    2d18:	0504                	addi	s1,sp,640
    2d1a:	f5a6                	fsw	fs1,232(sp)
    2d1c:	0000                	unimp
    2d1e:	0700                	addi	s0,sp,896
    2d20:	0298                	addi	a4,sp,320
    2d22:	0000                	unimp
    2d24:	a805                	j	2d54 <_prog_start-0x1fffd2ac>
    2d26:	00ca                	slli	ra,ra,0x12
    2d28:	0000                	unimp
    2d2a:	0003af07          	flw	ft10,0(t2) # fffe4000 <_sp+0x7ffe0000>
    2d2e:	0500                	addi	s0,sp,640
    2d30:	f5a9                	bnez	a1,2c7a <_prog_start-0x1fffd386>
    2d32:	0000                	unimp
    2d34:	0000                	unimp
    2d36:	2c08                	fld	fa0,24(s0)
    2d38:	0000                	unimp
    2d3a:	0500                	addi	s0,sp,640
    2d3c:	0001                	nop
    2d3e:	0900                	addi	s0,sp,144
    2d40:	007a                	c.slli	zero,0x1e
    2d42:	0000                	unimp
    2d44:	080a0003          	lb	zero,128(s4) # fffe0080 <_sp+0x7ffdc080>
    2d48:	a305                	j	3268 <_prog_start-0x1fffcd98>
    2d4a:	0126                	slli	sp,sp,0x9
    2d4c:	0000                	unimp
    2d4e:	00013a0b          	0x13a0b
    2d52:	0500                	addi	s0,sp,640
    2d54:	73a5                	lui	t2,0xfffe9
    2d56:	0000                	unimp
    2d58:	0000                	unimp
    2d5a:	0001fe0b          	0x1fe0b
    2d5e:	0500                	addi	s0,sp,640
    2d60:	d6aa                	sw	a0,108(sp)
    2d62:	0000                	unimp
    2d64:	0400                	addi	s0,sp,512
    2d66:	0300                	addi	s0,sp,384
    2d68:	031e                	slli	t1,t1,0x7
    2d6a:	0000                	unimp
    2d6c:	ab05                	j	329c <_prog_start-0x1fffcd64>
    2d6e:	0105                	addi	sp,sp,1
    2d70:	0000                	unimp
    2d72:	00028f03          	lb	t5,0(t0)
    2d76:	0500                	addi	s0,sp,640
    2d78:	00009eaf          	0x9eaf
    2d7c:	0c00                	addi	s0,sp,528
    2d7e:	0d04                	addi	s1,sp,656
    2d80:	4404                	lw	s1,8(s0)
    2d82:	0001                	nop
    2d84:	0200                	addi	s0,sp,256
    2d86:	0801                	addi	a6,a6,0
    2d88:	0448                	addi	a0,sp,516
    2d8a:	0000                	unimp
    2d8c:	440e                	lw	s0,192(sp)
    2d8e:	0001                	nop
    2d90:	0f00                	addi	s0,sp,912
    2d92:	00000287          	0x287
    2d96:	015b1007          	0x15b1007
    2d9a:	0000                	unimp
    2d9c:	040d                	addi	s0,s0,3
    2d9e:	013e                	slli	sp,sp,0xf
    2da0:	0000                	unimp
    2da2:	00034a0f          	0x34a0f
    2da6:	0700                	addi	s0,sp,896
    2da8:	3ee2                	fld	ft9,56(sp)
    2daa:	0001                	nop
    2dac:	0f00                	addi	s0,sp,912
    2dae:	030d                	addi	t1,t1,3
    2db0:	0000                	unimp
    2db2:	0073e307          	0x73e307
    2db6:	0000                	unimp
    2db8:	0001420f          	0x1420f
    2dbc:	0700                	addi	s0,sp,896
    2dbe:	000073e3          	bgeu	zero,zero,35c4 <_prog_start-0x1fffca3c>
    2dc2:	0f00                	addi	s0,sp,912
    2dc4:	001c                	0x1c
    2dc6:	0000                	unimp
    2dc8:	0073e307          	0x73e307
    2dcc:	0000                	unimp
    2dce:	0003950f          	0x3950f
    2dd2:	0700                	addi	s0,sp,896
    2dd4:	73e5                	lui	t2,0xffff9
    2dd6:	0000                	unimp
    2dd8:	0300                	addi	s0,sp,384
    2dda:	02f0                	addi	a2,sp,332
    2ddc:	0000                	unimp
    2dde:	1608                	addi	a0,sp,800
    2de0:	005e                	c.slli	zero,0x17
    2de2:	0000                	unimp
    2de4:	1610                	addi	a2,sp,800
    2de6:	0001                	nop
    2de8:	1800                	addi	s0,sp,48
    2dea:	2f08                	fld	fa0,24(a4)
    2dec:	01f6                	slli	gp,gp,0x1d
    2dee:	0000                	unimp
    2df0:	0005820b          	0x5820b
    2df4:	0800                	addi	s0,sp,16
    2df6:	f631                	bnez	a2,2d42 <_prog_start-0x1fffd2be>
    2df8:	0001                	nop
    2dfa:	0000                	unimp
    2dfc:	5f11                	li	t5,-28
    2dfe:	3208006b          	0x3208006b
    2e02:	00000073          	ecall
    2e06:	0b04                	addi	s1,sp,400
    2e08:	03e4                	addi	s1,sp,460
    2e0a:	0000                	unimp
    2e0c:	3208                	fld	fa0,32(a2)
    2e0e:	00000073          	ecall
    2e12:	0b08                	addi	a0,sp,400
    2e14:	000003a3          	sb	zero,7(zero) # 7 <_prog_start-0x1ffffff9>
    2e18:	3208                	fld	fa0,32(a2)
    2e1a:	00000073          	ecall
    2e1e:	0b0c                	addi	a1,sp,400
    2e20:	00000197          	auipc	gp,0x0
    2e24:	3208                	fld	fa0,32(a2)
    2e26:	00000073          	ecall
    2e2a:	1110                	addi	a2,sp,160
    2e2c:	785f 0800 fc33      	0xfc330800785f
    2e32:	0001                	nop
    2e34:	1400                	addi	s0,sp,544
    2e36:	0d00                	addi	s0,sp,656
    2e38:	a304                	fsd	fs1,0(a4)
    2e3a:	0001                	nop
    2e3c:	0800                	addi	s0,sp,16
    2e3e:	0198                	addi	a4,sp,192
    2e40:	0000                	unimp
    2e42:	020c                	addi	a1,sp,256
    2e44:	0000                	unimp
    2e46:	7a09                	lui	s4,0xfffe2
    2e48:	0000                	unimp
    2e4a:	0000                	unimp
    2e4c:	1000                	addi	s0,sp,32
    2e4e:	03ff                	0x3ff
    2e50:	0000                	unimp
    2e52:	0824                	addi	s1,sp,24
    2e54:	00028537          	lui	a0,0x28
    2e58:	0b00                	addi	s0,sp,400
    2e5a:	000001bf 00733908 	0x733908000001bf
    2e62:	0000                	unimp
    2e64:	0b00                	addi	s0,sp,400
    2e66:	0149                	addi	sp,sp,18
    2e68:	0000                	unimp
    2e6a:	3a08                	fld	fa0,48(a2)
    2e6c:	00000073          	ecall
    2e70:	0b04                	addi	s1,sp,400
    2e72:	0130                	addi	a2,sp,136
    2e74:	0000                	unimp
    2e76:	3b08                	fld	fa0,48(a4)
    2e78:	00000073          	ecall
    2e7c:	0b08                	addi	a0,sp,400
    2e7e:	0000025b          	0x25b
    2e82:	3c08                	fld	fa0,56(s0)
    2e84:	00000073          	ecall
    2e88:	0b0c                	addi	a1,sp,400
    2e8a:	0341                	addi	t1,t1,16
    2e8c:	0000                	unimp
    2e8e:	3d08                	fld	fa0,56(a0)
    2e90:	00000073          	ecall
    2e94:	0b10                	addi	a2,sp,400
    2e96:	03b6                	slli	t2,t2,0xd
    2e98:	0000                	unimp
    2e9a:	3e08                	fld	fa0,56(a2)
    2e9c:	00000073          	ecall
    2ea0:	0b14                	addi	a3,sp,400
    2ea2:	011e                	slli	sp,sp,0x7
    2ea4:	0000                	unimp
    2ea6:	3f08                	fld	fa0,56(a4)
    2ea8:	00000073          	ecall
    2eac:	0b18                	addi	a4,sp,400
    2eae:	01c8                	addi	a0,sp,196
    2eb0:	0000                	unimp
    2eb2:	4008                	lw	a0,0(s0)
    2eb4:	00000073          	ecall
    2eb8:	0b1c                	addi	a5,sp,400
    2eba:	0331                	addi	t1,t1,12
    2ebc:	0000                	unimp
    2ebe:	4108                	lw	a0,0(a0)
    2ec0:	00000073          	ecall
    2ec4:	0020                	addi	s0,sp,8
    2ec6:	0012                	c.slli	zero,0x4
    2ec8:	0000                	unimp
    2eca:	0800                	addi	s0,sp,16
    2ecc:	0801                	addi	a6,a6,0
    2ece:	c54a                	sw	s2,136(sp)
    2ed0:	0002                	c.slli64	zero
    2ed2:	0b00                	addi	s0,sp,400
    2ed4:	0329                	addi	t1,t1,10
    2ed6:	0000                	unimp
    2ed8:	4b08                	lw	a0,16(a4)
    2eda:	02c5                	addi	t0,t0,17
    2edc:	0000                	unimp
    2ede:	0b00                	addi	s0,sp,400
    2ee0:	0412                	slli	s0,s0,0x4
    2ee2:	0000                	unimp
    2ee4:	4c08                	lw	a0,24(s0)
    2ee6:	02c5                	addi	t0,t0,17
    2ee8:	0000                	unimp
    2eea:	1380                	addi	s0,sp,480
    2eec:	0525                	addi	a0,a0,9
    2eee:	0000                	unimp
    2ef0:	4e08                	lw	a0,24(a2)
    2ef2:	0198                	addi	a4,sp,192
    2ef4:	0000                	unimp
    2ef6:	0100                	addi	s0,sp,128
    2ef8:	00056f13          	ori	t5,a0,0
    2efc:	0800                	addi	s0,sp,16
    2efe:	9851                	andi	s0,s0,-12
    2f00:	0001                	nop
    2f02:	0400                	addi	s0,sp,512
    2f04:	0001                	nop
    2f06:	3c08                	fld	fa0,56(s0)
    2f08:	0001                	nop
    2f0a:	d500                	sw	s0,40(a0)
    2f0c:	0002                	c.slli64	zero
    2f0e:	0900                	addi	s0,sp,144
    2f10:	007a                	c.slli	zero,0x1e
    2f12:	0000                	unimp
    2f14:	001f 7a12 0003      	0x37a12001f
    2f1a:	9000                	0x9000
    2f1c:	0801                	addi	a6,a6,0
    2f1e:	135d                	addi	t1,t1,-9
    2f20:	0b000003          	lb	zero,176(zero) # b0 <_prog_start-0x1fffff50>
    2f24:	0582                	c.slli64	a1
    2f26:	0000                	unimp
    2f28:	5e08                	lw	a0,56(a2)
    2f2a:	00000313          	li	t1,0
    2f2e:	0b00                	addi	s0,sp,400
    2f30:	033c                	addi	a5,sp,392
    2f32:	0000                	unimp
    2f34:	5f08                	lw	a0,56(a4)
    2f36:	00000073          	ecall
    2f3a:	0b04                	addi	s1,sp,400
    2f3c:	007f                	0x7f
    2f3e:	0000                	unimp
    2f40:	6108                	flw	fa0,0(a0)
    2f42:	0319                	addi	t1,t1,6
    2f44:	0000                	unimp
    2f46:	0b08                	addi	a0,sp,400
    2f48:	0000                	unimp
    2f4a:	0000                	unimp
    2f4c:	6208                	flw	fa0,0(a2)
    2f4e:	0285                	addi	t0,t0,1
    2f50:	0000                	unimp
    2f52:	0088                	addi	a0,sp,64
    2f54:	040d                	addi	s0,s0,3
    2f56:	02d5                	addi	t0,t0,21
    2f58:	0000                	unimp
    2f5a:	2908                	fld	fa0,16(a0)
    2f5c:	29000003          	lb	zero,656(zero) # 290 <_prog_start-0x1ffffd70>
    2f60:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
    2f64:	007a                	c.slli	zero,0x1e
    2f66:	0000                	unimp
    2f68:	001f 040d 032f      	0x32f040d001f
    2f6e:	0000                	unimp
    2f70:	1014                	addi	a3,sp,32
    2f72:	046a                	slli	s0,s0,0x1a
    2f74:	0000                	unimp
    2f76:	0808                	addi	a0,sp,16
    2f78:	5575                	li	a0,-3
    2f7a:	0b000003          	lb	zero,176(zero) # b0 <_prog_start-0x1fffff50>
    2f7e:	02da                	slli	t0,t0,0x16
    2f80:	0000                	unimp
    2f82:	7608                	flw	fa0,40(a2)
    2f84:	0355                	addi	t1,t1,21
    2f86:	0000                	unimp
    2f88:	0b00                	addi	s0,sp,400
    2f8a:	052e                	slli	a0,a0,0xb
    2f8c:	0000                	unimp
    2f8e:	7708                	flw	fa0,40(a4)
    2f90:	00000073          	ecall
    2f94:	0004                	0x4
    2f96:	040d                	addi	s0,s0,3
    2f98:	002c                	addi	a1,sp,8
    2f9a:	0000                	unimp
    2f9c:	8f10                	0x8f10
    2f9e:	0001                	nop
    2fa0:	6800                	flw	fs0,16(s0)
    2fa2:	b508                	fsd	fa0,40(a0)
    2fa4:	0485                	addi	s1,s1,1
    2fa6:	0000                	unimp
    2fa8:	5f11                	li	t5,-28
    2faa:	0070                	addi	a2,sp,12
    2fac:	b608                	fsd	fa0,40(a2)
    2fae:	0355                	addi	t1,t1,21
    2fb0:	0000                	unimp
    2fb2:	1100                	addi	s0,sp,160
    2fb4:	725f 0800 73b7      	0x73b70800725f
    2fba:	0000                	unimp
    2fbc:	0400                	addi	s0,sp,512
    2fbe:	5f11                	li	t5,-28
    2fc0:	b8080077          	0xb8080077
    2fc4:	00000073          	ecall
    2fc8:	0b08                	addi	a0,sp,400
    2fca:	003d                	c.nop	15
    2fcc:	0000                	unimp
    2fce:	b908                	fsd	fa0,48(a0)
    2fd0:	00000033          	add	zero,zero,zero
    2fd4:	0b0c                	addi	a1,sp,400
    2fd6:	00000307          	0x307
    2fda:	ba08                	fsd	fa0,48(a2)
    2fdc:	00000033          	add	zero,zero,zero
    2fe0:	110e                	slli	sp,sp,0x23
    2fe2:	625f 0066 bb08      	0xbb080066625f
    2fe8:	0330                	addi	a2,sp,392
    2fea:	0000                	unimp
    2fec:	0b10                	addi	a2,sp,400
    2fee:	0034                	addi	a3,sp,8
    2ff0:	0000                	unimp
    2ff2:	bc08                	fsd	fa0,56(s0)
    2ff4:	00000073          	ecall
    2ff8:	0b18                	addi	a4,sp,400
    2ffa:	0084                	addi	s1,sp,64
    2ffc:	0000                	unimp
    2ffe:	c308                	sw	a0,0(a4)
    3000:	013c                	addi	a5,sp,136
    3002:	0000                	unimp
    3004:	0b1c                	addi	a5,sp,400
    3006:	0000005b          	0x5b
    300a:	c508                	sw	a0,8(a0)
    300c:	05e0                	addi	s0,sp,716
    300e:	0000                	unimp
    3010:	0b20                	addi	s0,sp,408
    3012:	0752                	slli	a4,a4,0x14
    3014:	0000                	unimp
    3016:	c708                	sw	a0,8(a4)
    3018:	060a                	slli	a2,a2,0x2
    301a:	0000                	unimp
    301c:	0b24                	addi	s1,sp,408
    301e:	00000593          	li	a1,0
    3022:	ca08                	sw	a0,16(a2)
    3024:	062e                	slli	a2,a2,0xb
    3026:	0000                	unimp
    3028:	0b28                	addi	a0,sp,408
    302a:	02a4                	addi	s1,sp,328
    302c:	0000                	unimp
    302e:	cb08                	sw	a0,16(a4)
    3030:	0648                	addi	a0,sp,772
    3032:	0000                	unimp
    3034:	112c                	addi	a1,sp,168
    3036:	755f 0062 ce08      	0xce080062755f
    303c:	0330                	addi	a2,sp,392
    303e:	0000                	unimp
    3040:	1130                	addi	a2,sp,168
    3042:	755f 0070 cf08      	0xcf080070755f
    3048:	0355                	addi	t1,t1,21
    304a:	0000                	unimp
    304c:	1138                	addi	a4,sp,168
    304e:	755f 0072 d008      	0xd0080072755f
    3054:	00000073          	ecall
    3058:	0b3c                	addi	a5,sp,408
    305a:	05aa                	slli	a1,a1,0xa
    305c:	0000                	unimp
    305e:	d308                	sw	a0,32(a4)
    3060:	064e                	slli	a2,a2,0x13
    3062:	0000                	unimp
    3064:	0b40                	addi	s0,sp,404
    3066:	0000053b          	0x53b
    306a:	d408                	sw	a0,40(s0)
    306c:	065e                	slli	a2,a2,0x17
    306e:	0000                	unimp
    3070:	6c5f1143          	0x6c5f1143
    3074:	0062                	c.slli	zero,0x18
    3076:	d708                	sw	a0,40(a4)
    3078:	0330                	addi	a2,sp,392
    307a:	0000                	unimp
    307c:	0b44                	addi	s1,sp,404
    307e:	03f6                	slli	t2,t2,0x1d
    3080:	0000                	unimp
    3082:	da08                	sw	a0,48(a2)
    3084:	00000073          	ecall
    3088:	0b4c                	addi	a1,sp,404
    308a:	01ac                	addi	a1,sp,200
    308c:	0000                	unimp
    308e:	db08                	sw	a0,48(a4)
    3090:	00a9                	addi	ra,ra,10
    3092:	0000                	unimp
    3094:	0b50                	addi	a2,sp,404
    3096:	03a9                	addi	t2,t2,10
    3098:	0000                	unimp
    309a:	de08                	sw	a0,56(a2)
    309c:	000004a3          	sb	zero,9(zero) # 9 <_prog_start-0x1ffffff7>
    30a0:	0b54                	addi	a3,sp,404
    30a2:	078a                	slli	a5,a5,0x2
    30a4:	0000                	unimp
    30a6:	e208                	fsw	fa0,0(a2)
    30a8:	0131                	addi	sp,sp,12
    30aa:	0000                	unimp
    30ac:	0b58                	addi	a4,sp,404
    30ae:	0382                	c.slli64	t2
    30b0:	0000                	unimp
    30b2:	e408                	fsw	fa0,8(s0)
    30b4:	0126                	slli	sp,sp,0x9
    30b6:	0000                	unimp
    30b8:	0b5c                	addi	a5,sp,404
    30ba:	00000567          	jalr	a0,zero # 0 <_prog_start-0x20000000>
    30be:	e508                	fsw	fa0,8(a0)
    30c0:	00000073          	ecall
    30c4:	0064                	addi	s1,sp,12
    30c6:	bf15                	j	2ffa <_prog_start-0x1fffd006>
    30c8:	0000                	unimp
    30ca:	a300                	fsd	fs0,0(a4)
    30cc:	0004                	0x4
    30ce:	1600                	addi	s0,sp,800
    30d0:	000004a3          	sb	zero,9(zero) # 9 <_prog_start-0x1ffffff7>
    30d4:	3c16                	fld	fs8,352(sp)
    30d6:	0001                	nop
    30d8:	1600                	addi	s0,sp,800
    30da:	013e                	slli	sp,sp,0xf
    30dc:	0000                	unimp
    30de:	7316                	flw	ft6,100(sp)
    30e0:	0000                	unimp
    30e2:	0000                	unimp
    30e4:	040d                	addi	s0,s0,3
    30e6:	04ae                	slli	s1,s1,0xb
    30e8:	0000                	unimp
    30ea:	a30e                	fsd	ft3,384(sp)
    30ec:	0004                	0x4
    30ee:	1700                	addi	s0,sp,928
    30f0:	0000050b          	0x50b
    30f4:	0428                	addi	a0,sp,520
    30f6:	3908                	fld	fa0,48(a0)
    30f8:	e002                	fsw	ft0,0(sp)
    30fa:	0005                	c.nop	1
    30fc:	1800                	addi	s0,sp,48
    30fe:	01a5                	addi	gp,gp,9
    3100:	0000                	unimp
    3102:	3b08                	fld	fa0,48(a4)
    3104:	7302                	flw	ft6,32(sp)
    3106:	0000                	unimp
    3108:	0000                	unimp
    310a:	b618                	fsd	fa4,40(a2)
    310c:	0002                	c.slli64	zero
    310e:	0800                	addi	s0,sp,16
    3110:	0240                	addi	s0,sp,260
    3112:	06b5                	addi	a3,a3,13
    3114:	0000                	unimp
    3116:	1804                	addi	s1,sp,48
    3118:	0000006f          	j	3118 <_prog_start-0x1fffcee8>
    311c:	4008                	lw	a0,0(s0)
    311e:	b502                	fsd	ft0,168(sp)
    3120:	0006                	c.slli	zero,0x1
    3122:	0800                	addi	s0,sp,16
    3124:	9918                	0x9918
    3126:	0005                	c.nop	1
    3128:	0800                	addi	s0,sp,16
    312a:	0240                	addi	s0,sp,260
    312c:	06b5                	addi	a3,a3,13
    312e:	0000                	unimp
    3130:	180c                	addi	a1,sp,48
    3132:	01d2                	slli	gp,gp,0x14
    3134:	0000                	unimp
    3136:	4208                	lw	a0,0(a2)
    3138:	7302                	flw	ft6,32(sp)
    313a:	0000                	unimp
    313c:	1000                	addi	s0,sp,32
    313e:	b418                	fsd	fa4,40(s0)
    3140:	0001                	nop
    3142:	0800                	addi	s0,sp,16
    3144:	08970243          	fmadd.s	ft4,fa4,fs1,ft1,rne
    3148:	0000                	unimp
    314a:	1814                	addi	a3,sp,48
    314c:	054e                	slli	a0,a0,0x13
    314e:	0000                	unimp
    3150:	4608                	lw	a0,8(a2)
    3152:	7302                	flw	ft6,32(sp)
    3154:	0000                	unimp
    3156:	3000                	fld	fs0,32(s0)
    3158:	f218                	fsw	fa4,32(a2)
    315a:	0004                	0x4
    315c:	0800                	addi	s0,sp,16
    315e:	08ac0247          	fmsub.s	ft4,fs8,fa0,ft1,rne
    3162:	0000                	unimp
    3164:	1834                	addi	a3,sp,56
    3166:	000002ab          	0x2ab
    316a:	4908                	lw	a0,16(a0)
    316c:	7302                	flw	ft6,32(sp)
    316e:	0000                	unimp
    3170:	3800                	fld	fs0,48(s0)
    3172:	1418                	addi	a4,sp,544
    3174:	08000003          	lb	zero,128(zero) # 80 <_prog_start-0x1fffff80>
    3178:	08bd024b          	fnmsub.s	ft4,fs10,fa1,ft1,rne
    317c:	0000                	unimp
    317e:	183c                	addi	a5,sp,56
    3180:	0128                	addi	a0,sp,136
    3182:	0000                	unimp
    3184:	4e08                	lw	a0,24(a2)
    3186:	f602                	fsw	ft0,44(sp)
    3188:	0001                	nop
    318a:	4000                	lw	s0,0(s0)
    318c:	6118                	flw	fa4,0(a0)
    318e:	0001                	nop
    3190:	0800                	addi	s0,sp,16
    3192:	0073024f          	fnmadd.s	ft4,ft6,ft7,ft0,rne
    3196:	0000                	unimp
    3198:	1844                	addi	s1,sp,52
    319a:	0206                	slli	tp,tp,0x1
    319c:	0000                	unimp
    319e:	5008                	lw	a0,32(s0)
    31a0:	f602                	fsw	ft0,44(sp)
    31a2:	0001                	nop
    31a4:	4800                	lw	s0,16(s0)
    31a6:	e018                	fsw	fa4,0(s0)
    31a8:	0002                	c.slli64	zero
    31aa:	0800                	addi	s0,sp,16
    31ac:	0251                	addi	tp,tp,20
    31ae:	000008c3          	fmadd.s	fa7,ft0,ft0,ft0,rne
    31b2:	184c                	addi	a1,sp,52
    31b4:	03dc                	addi	a5,sp,452
    31b6:	0000                	unimp
    31b8:	5408                	lw	a0,40(s0)
    31ba:	7302                	flw	ft6,32(sp)
    31bc:	0000                	unimp
    31be:	5000                	lw	s0,32(s0)
    31c0:	3718                	fld	fa4,40(a4)
    31c2:	0004                	0x4
    31c4:	0800                	addi	s0,sp,16
    31c6:	0255                	addi	tp,tp,21
    31c8:	013e                	slli	sp,sp,0xf
    31ca:	0000                	unimp
    31cc:	1854                	addi	a3,sp,52
    31ce:	000003d7          	0x3d7
    31d2:	7808                	flw	fa0,48(s0)
    31d4:	7502                	flw	fa0,32(sp)
    31d6:	0008                	0x8
    31d8:	5800                	lw	s0,48(s0)
    31da:	7a19                	lui	s4,0xfffe6
    31dc:	08000003          	lb	zero,128(zero) # 80 <_prog_start-0x1fffff80>
    31e0:	027c                	addi	a5,sp,268
    31e2:	00000313          	li	t1,0
    31e6:	0148                	addi	a0,sp,132
    31e8:	7e19                	lui	t3,0xfffe6
    31ea:	0002                	c.slli64	zero
    31ec:	0800                	addi	s0,sp,16
    31ee:	027d                	addi	tp,tp,31
    31f0:	02d5                	addi	t0,t0,21
    31f2:	0000                	unimp
    31f4:	014c                	addi	a1,sp,132
    31f6:	6519                	lui	a0,0x6
    31f8:	0002                	c.slli64	zero
    31fa:	0800                	addi	s0,sp,16
    31fc:	0281                	addi	t0,t0,0
    31fe:	08d4                	addi	a3,sp,84
    3200:	0000                	unimp
    3202:	02dc                	addi	a5,sp,324
    3204:	cf19                	beqz	a4,3222 <_prog_start-0x1fffcdde>
    3206:	0004                	0x4
    3208:	0800                	addi	s0,sp,16
    320a:	0286                	slli	t0,t0,0x1
    320c:	067a                	slli	a2,a2,0x1e
    320e:	0000                	unimp
    3210:	02e0                	addi	s0,sp,332
    3212:	9e19                	0x9e19
    3214:	08000003          	lb	zero,128(zero) # 80 <_prog_start-0x1fffff80>
    3218:	08e00287          	0x8e00287
    321c:	0000                	unimp
    321e:	02ec                	addi	a1,sp,332
    3220:	0d00                	addi	s0,sp,656
    3222:	8504                	0x8504
    3224:	0004                	0x4
    3226:	1500                	addi	s0,sp,672
    3228:	000000bf 00000604 	0x604000000bf
    3230:	a316                	fsd	ft5,384(sp)
    3232:	0004                	0x4
    3234:	1600                	addi	s0,sp,800
    3236:	013c                	addi	a5,sp,136
    3238:	0000                	unimp
    323a:	0416                	slli	s0,s0,0x5
    323c:	0006                	c.slli	zero,0x1
    323e:	1600                	addi	s0,sp,800
    3240:	00000073          	ecall
    3244:	0d00                	addi	s0,sp,656
    3246:	4b04                	lw	s1,16(a4)
    3248:	0001                	nop
    324a:	0d00                	addi	s0,sp,656
    324c:	e604                	fsw	fs1,8(a2)
    324e:	0005                	c.nop	1
    3250:	1500                	addi	s0,sp,672
    3252:	00b4                	addi	a3,sp,72
    3254:	0000                	unimp
    3256:	062e                	slli	a2,a2,0xb
    3258:	0000                	unimp
    325a:	a316                	fsd	ft5,384(sp)
    325c:	0004                	0x4
    325e:	1600                	addi	s0,sp,800
    3260:	013c                	addi	a5,sp,136
    3262:	0000                	unimp
    3264:	b416                	fsd	ft5,40(sp)
    3266:	0000                	unimp
    3268:	1600                	addi	s0,sp,800
    326a:	00000073          	ecall
    326e:	0d00                	addi	s0,sp,656
    3270:	1004                	addi	s1,sp,32
    3272:	0006                	c.slli	zero,0x1
    3274:	1500                	addi	s0,sp,672
    3276:	00000073          	ecall
    327a:	0648                	addi	a0,sp,772
    327c:	0000                	unimp
    327e:	a316                	fsd	ft5,384(sp)
    3280:	0004                	0x4
    3282:	1600                	addi	s0,sp,800
    3284:	013c                	addi	a5,sp,136
    3286:	0000                	unimp
    3288:	0d00                	addi	s0,sp,656
    328a:	3404                	fld	fs1,40(s0)
    328c:	0006                	c.slli	zero,0x1
    328e:	0800                	addi	s0,sp,16
    3290:	002c                	addi	a1,sp,8
    3292:	0000                	unimp
    3294:	065e                	slli	a2,a2,0x17
    3296:	0000                	unimp
    3298:	7a09                	lui	s4,0xfffe2
    329a:	0000                	unimp
    329c:	0200                	addi	s0,sp,256
    329e:	0800                	addi	s0,sp,16
    32a0:	002c                	addi	a1,sp,8
    32a2:	0000                	unimp
    32a4:	066e                	slli	a2,a2,0x1b
    32a6:	0000                	unimp
    32a8:	7a09                	lui	s4,0xfffe2
    32aa:	0000                	unimp
    32ac:	0000                	unimp
    32ae:	0500                	addi	s0,sp,640
    32b0:	019c                	addi	a5,sp,192
    32b2:	0000                	unimp
    32b4:	1f08                	addi	a0,sp,944
    32b6:	5b01                	li	s6,-32
    32b8:	1a000003          	lb	zero,416(zero) # 1a0 <_prog_start-0x1ffffe60>
    32bc:	04c9                	addi	s1,s1,18
    32be:	0000                	unimp
    32c0:	080c                	addi	a1,sp,16
    32c2:	06af0123          	sb	a0,98(t5)
    32c6:	0000                	unimp
    32c8:	8218                	0x8218
    32ca:	0005                	c.nop	1
    32cc:	0800                	addi	s0,sp,16
    32ce:	0125                	addi	sp,sp,9
    32d0:	000006af          	0x6af
    32d4:	1800                	addi	s0,sp,48
    32d6:	0404                	addi	s1,sp,512
    32d8:	0000                	unimp
    32da:	2608                	fld	fa0,8(a2)
    32dc:	7301                	lui	t1,0xfffe0
    32de:	0000                	unimp
    32e0:	0400                	addi	s0,sp,512
    32e2:	9e18                	0x9e18
    32e4:	0002                	c.slli64	zero
    32e6:	0800                	addi	s0,sp,16
    32e8:	06b50127          	0x6b50127
    32ec:	0000                	unimp
    32ee:	0008                	0x8
    32f0:	040d                	addi	s0,s0,3
    32f2:	067a                	slli	a2,a2,0x1e
    32f4:	0000                	unimp
    32f6:	040d                	addi	s0,s0,3
    32f8:	066e                	slli	a2,a2,0x1b
    32fa:	0000                	unimp
    32fc:	591a                	lw	s2,164(sp)
    32fe:	0001                	nop
    3300:	0e00                	addi	s0,sp,784
    3302:	3f08                	fld	fa0,56(a4)
    3304:	f001                	bnez	s0,3204 <_prog_start-0x1fffcdfc>
    3306:	0006                	c.slli	zero,0x1
    3308:	1800                	addi	s0,sp,48
    330a:	00000577          	0x577
    330e:	4008                	lw	a0,0(s0)
    3310:	f001                	bnez	s0,3210 <_prog_start-0x1fffcdf0>
    3312:	0006                	c.slli	zero,0x1
    3314:	0000                	unimp
    3316:	ea18                	fsw	fa4,16(a2)
    3318:	0002                	c.slli64	zero
    331a:	0800                	addi	s0,sp,16
    331c:	0141                	addi	sp,sp,16
    331e:	06f0                	addi	a2,sp,844
    3320:	0000                	unimp
    3322:	1806                	slli	a6,a6,0x21
    3324:	0465                	addi	s0,s0,25
    3326:	0000                	unimp
    3328:	4208                	lw	a0,0(a2)
    332a:	3a01                	jal	2c3a <_prog_start-0x1fffd3c6>
    332c:	0000                	unimp
    332e:	0c00                	addi	s0,sp,528
    3330:	0800                	addi	s0,sp,16
    3332:	003a                	c.slli	zero,0xe
    3334:	0000                	unimp
    3336:	0700                	addi	s0,sp,896
    3338:	0000                	unimp
    333a:	7a09                	lui	s4,0xfffe2
    333c:	0000                	unimp
    333e:	0200                	addi	s0,sp,256
    3340:	1b00                	addi	s0,sp,432
    3342:	08d0                	addi	a2,sp,84
    3344:	0259                	addi	tp,tp,22
    3346:	0801                	addi	a6,a6,0
    3348:	0000                	unimp
    334a:	4118                	lw	a4,0(a0)
    334c:	0005                	c.nop	1
    334e:	0800                	addi	s0,sp,16
    3350:	007a025b          	0x7a025b
    3354:	0000                	unimp
    3356:	1800                	addi	s0,sp,48
    3358:	000004d7          	0x4d7
    335c:	5c08                	lw	a0,56(s0)
    335e:	3e02                	fld	ft8,32(sp)
    3360:	0001                	nop
    3362:	0400                	addi	s0,sp,512
    3364:	8218                	0x8218
    3366:	0001                	nop
    3368:	0800                	addi	s0,sp,16
    336a:	025d                	addi	tp,tp,23
    336c:	0801                	addi	a6,a6,0
    336e:	0000                	unimp
    3370:	1808                	addi	a0,sp,48
    3372:	03c0                	addi	s0,sp,452
    3374:	0000                	unimp
    3376:	5e08                	lw	a0,56(a2)
    3378:	0c02                	c.slli64	s8
    337a:	0002                	c.slli64	zero
    337c:	2400                	fld	fs0,8(s0)
    337e:	bd18                	fsd	fa4,56(a0)
    3380:	0002                	c.slli64	zero
    3382:	0800                	addi	s0,sp,16
    3384:	025f 0073 0000      	0x73025f
    338a:	1848                	addi	a0,sp,52
    338c:	057d                	addi	a0,a0,31
    338e:	0000                	unimp
    3390:	6008                	flw	fa0,0(s0)
    3392:	6c02                	flw	fs8,0(sp)
    3394:	0000                	unimp
    3396:	5000                	lw	s0,32(s0)
    3398:	2318                	fld	fa4,0(a4)
    339a:	0000                	unimp
    339c:	0800                	addi	s0,sp,16
    339e:	0261                	addi	tp,tp,24
    33a0:	000006bb          	0x6bb
    33a4:	1858                	addi	a4,sp,52
    33a6:	021c                	addi	a5,sp,256
    33a8:	0000                	unimp
    33aa:	6208                	flw	fa0,0(a2)
    33ac:	2602                	fld	fa2,0(sp)
    33ae:	0001                	nop
    33b0:	6800                	flw	fs0,16(s0)
    33b2:	e418                	fsw	fa4,8(s0)
    33b4:	0004                	0x4
    33b6:	0800                	addi	s0,sp,16
    33b8:	01260263          	beq	a2,s2,33bc <_prog_start-0x1fffcc44>
    33bc:	0000                	unimp
    33be:	1870                	addi	a2,sp,60
    33c0:	000e                	c.slli	zero,0x3
    33c2:	0000                	unimp
    33c4:	6408                	flw	fa0,8(s0)
    33c6:	2602                	fld	fa2,0(sp)
    33c8:	0001                	nop
    33ca:	7800                	flw	fs0,48(s0)
    33cc:	ec18                	fsw	fa4,24(s0)
    33ce:	08000003          	lb	zero,128(zero) # 80 <_prog_start-0x1fffff80>
    33d2:	0265                	addi	tp,tp,25
    33d4:	0811                	addi	a6,a6,4
    33d6:	0000                	unimp
    33d8:	1880                	addi	s0,sp,112
    33da:	0028                	addi	a0,sp,8
    33dc:	0000                	unimp
    33de:	6608                	flw	fa0,8(a2)
    33e0:	2102                	fld	ft2,0(sp)
    33e2:	0008                	0x8
    33e4:	8800                	0x8800
    33e6:	5818                	lw	a4,48(s0)
    33e8:	0004                	0x4
    33ea:	0800                	addi	s0,sp,16
    33ec:	00730267          	jalr	tp,7(t1) # fffe0007 <_sp+0x7ffdc007>
    33f0:	0000                	unimp
    33f2:	18a0                	addi	s0,sp,120
    33f4:	0061                	c.nop	24
    33f6:	0000                	unimp
    33f8:	6808                	flw	fa0,16(s0)
    33fa:	2602                	fld	fa2,0(sp)
    33fc:	0001                	nop
    33fe:	a400                	fsd	fs0,8(s0)
    3400:	6f18                	flw	fa4,24(a4)
    3402:	0002                	c.slli64	zero
    3404:	0800                	addi	s0,sp,16
    3406:	0269                	addi	tp,tp,26
    3408:	0126                	slli	sp,sp,0x9
    340a:	0000                	unimp
    340c:	18ac                	addi	a1,sp,120
    340e:	01dd                	addi	gp,gp,23
    3410:	0000                	unimp
    3412:	6a08                	flw	fa0,16(a2)
    3414:	2602                	fld	fa2,0(sp)
    3416:	0001                	nop
    3418:	b400                	fsd	fs0,40(s0)
    341a:	f818                	fsw	fa4,48(s0)
    341c:	0002                	c.slli64	zero
    341e:	0800                	addi	s0,sp,16
    3420:	0126026b          	0x126026b
    3424:	0000                	unimp
    3426:	18bc                	addi	a5,sp,120
    3428:	0000020b          	0x20b
    342c:	6c08                	flw	fa0,24(s0)
    342e:	2602                	fld	fa2,0(sp)
    3430:	0001                	nop
    3432:	c400                	sw	s0,8(s0)
    3434:	a318                	fsd	fa4,0(a4)
    3436:	0001                	nop
    3438:	0800                	addi	s0,sp,16
    343a:	026d                	addi	tp,tp,27
    343c:	00000073          	ecall
    3440:	00cc                	addi	a1,sp,68
    3442:	4408                	lw	a0,8(s0)
    3444:	0001                	nop
    3446:	1100                	addi	s0,sp,160
    3448:	0008                	0x8
    344a:	0900                	addi	s0,sp,144
    344c:	007a                	c.slli	zero,0x1e
    344e:	0000                	unimp
    3450:	0019                	c.nop	6
    3452:	4408                	lw	a0,8(s0)
    3454:	0001                	nop
    3456:	2100                	fld	fs0,0(a0)
    3458:	0008                	0x8
    345a:	0900                	addi	s0,sp,144
    345c:	007a                	c.slli	zero,0x1e
    345e:	0000                	unimp
    3460:	44080007          	0x44080007
    3464:	0001                	nop
    3466:	3100                	fld	fs0,32(a0)
    3468:	0008                	0x8
    346a:	0900                	addi	s0,sp,144
    346c:	007a                	c.slli	zero,0x1e
    346e:	0000                	unimp
    3470:	f01b0017          	auipc	zero,0xf01b0
    3474:	7208                	flw	fa0,32(a2)
    3476:	5502                	lw	a0,32(sp)
    3478:	0008                	0x8
    347a:	1800                	addi	s0,sp,48
    347c:	0152                	slli	sp,sp,0x14
    347e:	0000                	unimp
    3480:	7508                	flw	fa0,40(a0)
    3482:	5502                	lw	a0,32(sp)
    3484:	0008                	0x8
    3486:	0000                	unimp
    3488:	a118                	fsd	fa4,0(a0)
    348a:	0005                	c.nop	1
    348c:	0800                	addi	s0,sp,16
    348e:	0276                	slli	tp,tp,0x1d
    3490:	0865                	addi	a6,a6,25
    3492:	0000                	unimp
    3494:	0078                	addi	a4,sp,12
    3496:	5508                	lw	a0,40(a0)
    3498:	65000003          	lb	zero,1616(zero) # 650 <_prog_start-0x1ffff9b0>
    349c:	0008                	0x8
    349e:	0900                	addi	s0,sp,144
    34a0:	007a                	c.slli	zero,0x1e
    34a2:	0000                	unimp
    34a4:	001d                	c.nop	7
    34a6:	7a08                	flw	fa0,48(a2)
    34a8:	0000                	unimp
    34aa:	7500                	flw	fs0,40(a0)
    34ac:	0008                	0x8
    34ae:	0900                	addi	s0,sp,144
    34b0:	007a                	c.slli	zero,0x1e
    34b2:	0000                	unimp
    34b4:	001d                	c.nop	7
    34b6:	f01c                	fsw	fa5,32(s0)
    34b8:	5708                	lw	a0,40(a4)
    34ba:	9702                	jalr	a4
    34bc:	0008                	0x8
    34be:	1d00                	addi	s0,sp,688
    34c0:	0000050b          	0x50b
    34c4:	6e08                	flw	fa0,24(a2)
    34c6:	0002                	c.slli64	zero
    34c8:	1d000007          	0x1d000007
    34cc:	000003cf          	fnmadd.s	ft7,ft0,ft0,ft0,rne
    34d0:	7708                	flw	fa0,40(a4)
    34d2:	3102                	fld	ft2,32(sp)
    34d4:	0008                	0x8
    34d6:	0000                	unimp
    34d8:	4408                	lw	a0,8(s0)
    34da:	0001                	nop
    34dc:	a700                	fsd	fs0,8(a4)
    34de:	0008                	0x8
    34e0:	0900                	addi	s0,sp,144
    34e2:	007a                	c.slli	zero,0x1e
    34e4:	0000                	unimp
    34e6:	0018                	0x18
    34e8:	881e                	mv	a6,t2
    34ea:	0005                	c.nop	1
    34ec:	0d00                	addi	s0,sp,656
    34ee:	a704                	fsd	fs1,8(a4)
    34f0:	0008                	0x8
    34f2:	1f00                	addi	s0,sp,944
    34f4:	08bd                	addi	a7,a7,15
    34f6:	0000                	unimp
    34f8:	a316                	fsd	ft5,384(sp)
    34fa:	0004                	0x4
    34fc:	0000                	unimp
    34fe:	040d                	addi	s0,s0,3
    3500:	08b2                	slli	a7,a7,0xc
    3502:	0000                	unimp
    3504:	040d                	addi	s0,s0,3
    3506:	01f6                	slli	gp,gp,0x1d
    3508:	0000                	unimp
    350a:	d41f 0008 1600      	0x16000008d41f
    3510:	00000073          	ecall
    3514:	0d00                	addi	s0,sp,656
    3516:	da04                	sw	s1,48(a2)
    3518:	0008                	0x8
    351a:	0d00                	addi	s0,sp,656
    351c:	c904                	sw	s1,16(a0)
    351e:	0008                	0x8
    3520:	0800                	addi	s0,sp,16
    3522:	066e                	slli	a2,a2,0x1b
    3524:	0000                	unimp
    3526:	08f0                	addi	a2,sp,92
    3528:	0000                	unimp
    352a:	7a09                	lui	s4,0xfffe2
    352c:	0000                	unimp
    352e:	0200                	addi	s0,sp,256
    3530:	2000                	fld	fs0,0(s0)
    3532:	00000093          	li	ra,0
    3536:	fe08                	fsw	fa0,56(a2)
    3538:	a302                	fsd	ft0,384(sp)
    353a:	0004                	0x4
    353c:	2000                	fld	fs0,0(s0)
    353e:	008c                	addi	a1,sp,64
    3540:	0000                	unimp
    3542:	ff08                	fsw	fa0,56(a4)
    3544:	a902                	fsd	ft0,144(sp)
    3546:	0004                	0x4
    3548:	0800                	addi	s0,sp,16
    354a:	0000014b          	fnmsub.s	ft2,ft0,ft0,ft0,rne
    354e:	00000913          	li	s2,0
    3552:	0021                	c.nop	8
    3554:	080e                	slli	a6,a6,0x3
    3556:	0009                	c.nop	2
    3558:	0f00                	addi	s0,sp,912
    355a:	04fa                	slli	s1,s1,0x1e
    355c:	0000                	unimp
    355e:	a509                	j	3b60 <_prog_start-0x1fffc4a0>
    3560:	00000913          	li	s2,0
    3564:	0006730f          	0x6730f
    3568:	0a00                	addi	s0,sp,272
    356a:	8c08                	0x8c08
    356c:	0000                	unimp
    356e:	0f00                	addi	s0,sp,912
    3570:	041e                	slli	s0,s0,0x7
    3572:	0000                	unimp
    3574:	090a                	slli	s2,s2,0x2
    3576:	00000073          	ecall
    357a:	040a                	slli	s0,s0,0x2
    357c:	096f0c0b          	0x96f0c0b
    3580:	0000                	unimp
    3582:	7022                	flw	ft0,40(sp)
    3584:	6168                	flw	fa0,68(a0)
    3586:	0b00                	addi	s0,sp,400
    3588:	8c0e                	mv	s8,gp
    358a:	0000                	unimp
    358c:	0400                	addi	s0,sp,512
    358e:	1f01                	addi	t5,t5,-32
    3590:	2200                	fld	fs0,0(a2)
    3592:	6f70                	flw	fa2,92(a4)
    3594:	006c                	addi	a1,sp,12
    3596:	008c0f0b          	0x8c0f0b
    359a:	0000                	unimp
    359c:	0104                	addi	s1,sp,128
    359e:	001e                	c.slli	zero,0x7
    35a0:	000b3323          	0xb3323
    35a4:	0b00                	addi	s0,sp,400
    35a6:	8c10                	0x8c10
    35a8:	0000                	unimp
    35aa:	0400                	addi	s0,sp,512
    35ac:	001e                	c.slli	zero,0x7
    35ae:	0000                	unimp
    35b0:	0406                	slli	s0,s0,0x1
    35b2:	09880a0b          	0x9880a0b
    35b6:	0000                	unimp
    35b8:	3924                	fld	fs1,112(a0)
    35ba:	0009                	c.nop	2
    35bc:	0700                	addi	s0,sp,896
    35be:	000008b3          	add	a7,zero,zero
    35c2:	008c120b          	0x8c120b
    35c6:	0000                	unimp
    35c8:	0300                	addi	s0,sp,384
    35ca:	000008e3          	beqz	zero,3dda <_prog_start-0x1fffc226>
    35ce:	096f130b          	0x96f130b
    35d2:	0000                	unimp
    35d4:	040a                	slli	s0,s0,0x2
    35d6:	09ba190b          	0x9ba190b
    35da:	0000                	unimp
    35dc:	000c1323          	sh	zero,6(s8) # 126924 <_prog_start-0x1fed96dc>
    35e0:	0b00                	addi	s0,sp,400
    35e2:	00008c1b          	0x8c1b
    35e6:	0400                	addi	s0,sp,512
    35e8:	1e02                	slli	t3,t3,0x20
    35ea:	2300                	fld	fs0,0(a4)
    35ec:	00000b33          	add	s6,zero,zero
    35f0:	008c1c0b          	0x8c1c0b
    35f4:	0000                	unimp
    35f6:	1e04                	addi	s1,sp,816
    35f8:	0000                	unimp
    35fa:	0600                	addi	s0,sp,768
    35fc:	0b04                	addi	s1,sp,400
    35fe:	0009d317          	auipc	t1,0x9d
    3602:	2400                	fld	fs0,8(s0)
    3604:	00000993          	li	s3,0
    3608:	0008b307          	fld	ft6,0(a7)
    360c:	0b00                	addi	s0,sp,400
    360e:	8c1e                	mv	s8,t2
    3610:	0000                	unimp
    3612:	0000                	unimp
    3614:	0008a403          	lw	s0,0(a7)
    3618:	0b00                	addi	s0,sp,400
    361a:	ba1f 0009 0a00      	0xa000009ba1f
    3620:	0b04                	addi	s1,sp,400
    3622:	2325                	jal	3b4a <_prog_start-0x1fffc4b6>
    3624:	000a                	c.slli	zero,0x2
    3626:	2300                	fld	fs0,0(a4)
    3628:	087d                	addi	a6,a6,31
    362a:	0000                	unimp
    362c:	008c270b          	0x8c270b
    3630:	0000                	unimp
    3632:	0804                	addi	s1,sp,16
    3634:	0018                	0x18
    3636:	00097323          	0x97323
    363a:	0b00                	addi	s0,sp,400
    363c:	8c28                	0x8c28
    363e:	0000                	unimp
    3640:	0400                	addi	s0,sp,512
    3642:	1008                	addi	a0,sp,32
    3644:	2300                	fld	fs0,0(a4)
    3646:	0869                	addi	a6,a6,26
    3648:	0000                	unimp
    364a:	008c290b          	0x8c290b
    364e:	0000                	unimp
    3650:	0804                	addi	s1,sp,16
    3652:	0008                	0x8
    3654:	00097d23          	0x97d23
    3658:	0b00                	addi	s0,sp,400
    365a:	8c2a                	mv	s8,a0
    365c:	0000                	unimp
    365e:	0400                	addi	s0,sp,512
    3660:	0008                	0x8
    3662:	0000                	unimp
    3664:	0406                	slli	s0,s0,0x1
    3666:	0a3c230b          	0xa3c230b
    366a:	0000                	unimp
    366c:	de24                	sw	s1,120(a2)
    366e:	0009                	c.nop	2
    3670:	0700                	addi	s0,sp,896
    3672:	000008b3          	add	a7,zero,zero
    3676:	008c2c0b          	0x8c2c0b
    367a:	0000                	unimp
    367c:	0300                	addi	s0,sp,384
    367e:	00000a2b          	0xa2b
    3682:	0a232d0b          	0xa232d0b
    3686:	0000                	unimp
    3688:	040a                	slli	s0,s0,0x2
    368a:	0a8c330b          	0xa8c330b
    368e:	0000                	unimp
    3690:	00093723          	0x93723
    3694:	0b00                	addi	s0,sp,400
    3696:	8c35                	xor	s0,s0,a3
    3698:	0000                	unimp
    369a:	0400                	addi	s0,sp,512
    369c:	1808                	addi	a0,sp,48
    369e:	2300                	fld	fs0,0(a4)
    36a0:	00000973          	0x973
    36a4:	008c360b          	0x8c360b
    36a8:	0000                	unimp
    36aa:	0804                	addi	s1,sp,16
    36ac:	0010                	0x10
    36ae:	000b2323          	sw	zero,6(s6)
    36b2:	0b00                	addi	s0,sp,400
    36b4:	00008c37          	lui	s8,0x8
    36b8:	0400                	addi	s0,sp,512
    36ba:	0808                	addi	a0,sp,16
    36bc:	2300                	fld	fs0,0(a4)
    36be:	097d                	addi	s2,s2,31
    36c0:	0000                	unimp
    36c2:	008c380b          	0x8c380b
    36c6:	0000                	unimp
    36c8:	0804                	addi	s1,sp,16
    36ca:	0000                	unimp
    36cc:	0600                	addi	s0,sp,768
    36ce:	0b04                	addi	s1,sp,400
    36d0:	a531                	j	3cdc <_prog_start-0x1fffc324>
    36d2:	000a                	c.slli	zero,0x2
    36d4:	2400                	fld	fs0,8(s0)
    36d6:	00000a47          	fmsub.s	fs4,ft0,ft0,ft0,rne
    36da:	0008b307          	fld	ft6,0(a7)
    36de:	0b00                	addi	s0,sp,400
    36e0:	8c3a                	mv	s8,a4
    36e2:	0000                	unimp
    36e4:	0000                	unimp
    36e6:	000b3c03          	0xb3c03
    36ea:	0b00                	addi	s0,sp,400
    36ec:	000a8c3b          	0xa8c3b
    36f0:	0a00                	addi	s0,sp,272
    36f2:	0b04                	addi	s1,sp,400
    36f4:	1341                	addi	t1,t1,-16
    36f6:	2300000b          	0x2300000b
    36fa:	0a9d                	addi	s5,s5,7
    36fc:	0000                	unimp
    36fe:	008c430b          	0x8c430b
    3702:	0000                	unimp
    3704:	0204                	addi	s1,sp,256
    3706:	001e                	c.slli	zero,0x7
    3708:	00093f23          	0x93f23
    370c:	0b00                	addi	s0,sp,400
    370e:	8c44                	0x8c44
    3710:	0000                	unimp
    3712:	0400                	addi	s0,sp,512
    3714:	1d01                	addi	s10,s10,-32
    3716:	2200                	fld	fs0,0(a2)
    3718:	6964                	flw	fs1,84(a0)
    371a:	0072                	c.slli	zero,0x1c
    371c:	008c450b          	0x8c450b
    3720:	0000                	unimp
    3722:	0104                	addi	s1,sp,128
    3724:	001c                	0x1c
    3726:	00097323          	0x97323
    372a:	0b00                	addi	s0,sp,400
    372c:	8c46                	mv	s8,a7
    372e:	0000                	unimp
    3730:	0400                	addi	s0,sp,512
    3732:	100c                	addi	a1,sp,32
    3734:	2200                	fld	fs0,0(a2)
    3736:	656c                	flw	fa1,76(a0)
    3738:	006e                	c.slli	zero,0x1b
    373a:	008c470b          	0x8c470b
    373e:	0000                	unimp
    3740:	0404                	addi	s1,sp,512
    3742:	000c                	0xc
    3744:	00097d23          	0x97d23
    3748:	0b00                	addi	s0,sp,400
    374a:	8c48                	0x8c48
    374c:	0000                	unimp
    374e:	0400                	addi	s0,sp,512
    3750:	000c                	0xc
    3752:	0000                	unimp
    3754:	0406                	slli	s0,s0,0x1
    3756:	0b2c3f0b          	0xb2c3f0b
    375a:	0000                	unimp
    375c:	b024                	fsd	fs1,96(s0)
    375e:	000a                	c.slli	zero,0x2
    3760:	0700                	addi	s0,sp,896
    3762:	000008b3          	add	a7,zero,zero
    3766:	008c4a0b          	0x8c4a0b
    376a:	0000                	unimp
    376c:	0300                	addi	s0,sp,384
    376e:	0a8c                	addi	a1,sp,336
    3770:	0000                	unimp
    3772:	0b134b0b          	0xb134b0b
    3776:	0000                	unimp
    3778:	040a                	slli	s0,s0,0x2
    377a:	0b6d510b          	0xb6d510b
    377e:	0000                	unimp
    3780:	0003aa23          	sw	zero,20(t2) # ffff9014 <_sp+0x7fff5014>
    3784:	0b00                	addi	s0,sp,400
    3786:	00008c53          	fadd.s	fs8,ft1,ft0,rne
    378a:	0400                	addi	s0,sp,512
    378c:	1808                	addi	a0,sp,48
    378e:	2300                	fld	fs0,0(a4)
    3790:	00000b33          	add	s6,zero,zero
    3794:	008c540b          	0x8c540b
    3798:	0000                	unimp
    379a:	1704                	addi	s1,sp,928
    379c:	0001                	nop
    379e:	000a4c23          	0xa4c23
    37a2:	0b00                	addi	s0,sp,400
    37a4:	8c55                	or	s0,s0,a3
    37a6:	0000                	unimp
    37a8:	0400                	addi	s0,sp,512
    37aa:	0001                	nop
    37ac:	0000                	unimp
    37ae:	0406                	slli	s0,s0,0x1
    37b0:	0b864f0b          	0xb864f0b
    37b4:	0000                	unimp
    37b6:	3724                	fld	fs1,104(a4)
    37b8:	0700000b          	0x700000b
    37bc:	000008b3          	add	a7,zero,zero
    37c0:	008c570b          	0x8c570b
    37c4:	0000                	unimp
    37c6:	0300                	addi	s0,sp,384
    37c8:	0946                	slli	s2,s2,0x11
    37ca:	0000                	unimp
    37cc:	0b6d580b          	0xb6d580b
    37d0:	0000                	unimp
    37d2:	040a                	slli	s0,s0,0x2
    37d4:	0bc75e0b          	0xbc75e0b
    37d8:	0000                	unimp
    37da:	0003aa23          	sw	zero,20(t2)
    37de:	0b00                	addi	s0,sp,400
    37e0:	8c60                	0x8c60
    37e2:	0000                	unimp
    37e4:	0400                	addi	s0,sp,512
    37e6:	1808                	addi	a0,sp,48
    37e8:	2300                	fld	fs0,0(a4)
    37ea:	00000b33          	add	s6,zero,zero
    37ee:	008c610b          	0x8c610b
    37f2:	0000                	unimp
    37f4:	1704                	addi	s1,sp,928
    37f6:	0001                	nop
    37f8:	0008dd23          	0x8dd23
    37fc:	0b00                	addi	s0,sp,400
    37fe:	8c62                	mv	s8,s8
    3800:	0000                	unimp
    3802:	0400                	addi	s0,sp,512
    3804:	0001                	nop
    3806:	0000                	unimp
    3808:	0406                	slli	s0,s0,0x1
    380a:	0be05c0b          	0xbe05c0b
    380e:	0000                	unimp
    3810:	9124                	0x9124
    3812:	0700000b          	0x700000b
    3816:	000008b3          	add	a7,zero,zero
    381a:	008c640b          	0x8c640b
    381e:	0000                	unimp
    3820:	0300                	addi	s0,sp,384
    3822:	095e                	slli	s2,s2,0x17
    3824:	0000                	unimp
    3826:	0bc7650b          	0xbc7650b
    382a:	0000                	unimp
    382c:	040a                	slli	s0,s0,0x2
    382e:	0c126b0b          	0xc126b0b
    3832:	0000                	unimp
    3834:	000a6423          	0xa6423
    3838:	0b00                	addi	s0,sp,400
    383a:	8c6d                	and	s0,s0,a1
    383c:	0000                	unimp
    383e:	0400                	addi	s0,sp,512
    3840:	23001d03          	lh	s10,560(zero) # 230 <_prog_start-0x1ffffdd0>
    3844:	00000b33          	add	s6,zero,zero
    3848:	008c6e0b          	0x8c6e0b
    384c:	0000                	unimp
    384e:	1d04                	addi	s1,sp,688
    3850:	0000                	unimp
    3852:	0600                	addi	s0,sp,768
    3854:	0b04                	addi	s1,sp,400
    3856:	2b69                	jal	3df0 <_prog_start-0x1fffc210>
    3858:	000c                	0xc
    385a:	2400                	fld	fs0,8(s0)
    385c:	00000beb          	0xbeb
    3860:	0008b307          	fld	ft6,0(a7)
    3864:	0b00                	addi	s0,sp,400
    3866:	8c70                	0x8c70
    3868:	0000                	unimp
    386a:	0000                	unimp
    386c:	000a5c03          	lhu	s8,0(s4) # fffe2000 <_sp+0x7ffde000>
    3870:	0b00                	addi	s0,sp,400
    3872:	1271                	addi	tp,tp,-4
    3874:	000c                	0xc
    3876:	0a00                	addi	s0,sp,272
    3878:	0b04                	addi	s1,sp,400
    387a:	000c5d77          	0xc5d77
    387e:	2300                	fld	fs0,0(a4)
    3880:	08d6                	slli	a7,a7,0x15
    3882:	0000                	unimp
    3884:	008c790b          	0x8c790b
    3888:	0000                	unimp
    388a:	0304                	addi	s1,sp,384
    388c:	001d                	c.nop	7
    388e:	000b3323          	0xb3323
    3892:	0b00                	addi	s0,sp,400
    3894:	8c7a                	mv	s8,t5
    3896:	0000                	unimp
    3898:	0400                	addi	s0,sp,512
    389a:	001d                	c.nop	7
    389c:	0000                	unimp
    389e:	0406                	slli	s0,s0,0x1
    38a0:	0c76750b          	0xc76750b
    38a4:	0000                	unimp
    38a6:	3624                	fld	fs1,104(a2)
    38a8:	000c                	0xc
    38aa:	0700                	addi	s0,sp,896
    38ac:	000008b3          	add	a7,zero,zero
    38b0:	008c7c0b          	0x8c7c0b
    38b4:	0000                	unimp
    38b6:	0300                	addi	s0,sp,384
    38b8:	08ce                	slli	a7,a7,0x13
    38ba:	0000                	unimp
    38bc:	0c5d7d0b          	0xc5d7d0b
    38c0:	0000                	unimp
    38c2:	040a                	slli	s0,s0,0x2
    38c4:	0ca7830b          	0xca7830b
    38c8:	0000                	unimp
    38ca:	6522                	flw	fa0,8(sp)
    38cc:	006e                	c.slli	zero,0x1b
    38ce:	008c850b          	0x8c850b
    38d2:	0000                	unimp
    38d4:	0104                	addi	s1,sp,128
    38d6:	001f 3323 000b      	0xb3323001f
    38dc:	0b00                	addi	s0,sp,400
    38de:	8c86                	mv	s9,ra
    38e0:	0000                	unimp
    38e2:	0400                	addi	s0,sp,512
    38e4:	001f 0000 0406      	0x4060000001f
    38ea:	0cc0810b          	0xcc0810b
    38ee:	0000                	unimp
    38f0:	8124                	0x8124
    38f2:	000c                	0xc
    38f4:	0700                	addi	s0,sp,896
    38f6:	000008b3          	add	a7,zero,zero
    38fa:	008c880b          	0x8c880b
    38fe:	0000                	unimp
    3900:	0300                	addi	s0,sp,384
    3902:	0000086f          	jal	a6,3902 <_prog_start-0x1fffc6fe>
    3906:	0ca7890b          	0xca7890b
    390a:	0000                	unimp
    390c:	040a                	slli	s0,s0,0x2
    390e:	0d5b8f0b          	0xd5b8f0b
    3912:	0000                	unimp
    3914:	000ac123          	0xac123
    3918:	0b00                	addi	s0,sp,400
    391a:	8c91                	sub	s1,s1,a2
    391c:	0000                	unimp
    391e:	0400                	addi	s0,sp,512
    3920:	1f01                	addi	t5,t5,-32
    3922:	2300                	fld	fs0,0(a4)
    3924:	0a78                	addi	a4,sp,284
    3926:	0000                	unimp
    3928:	008c920b          	0x8c920b
    392c:	0000                	unimp
    392e:	0304                	addi	s1,sp,384
    3930:	001c                	0x1c
    3932:	000a6b23          	0xa6b23
    3936:	0b00                	addi	s0,sp,400
    3938:	00008c93          	mv	s9,ra
    393c:	0400                	addi	s0,sp,512
    393e:	1804                	addi	s1,sp,48
    3940:	2300                	fld	fs0,0(a4)
    3942:	0af6                	slli	s5,s5,0x1d
    3944:	0000                	unimp
    3946:	008c940b          	0x8c940b
    394a:	0000                	unimp
    394c:	0204                	addi	s1,sp,256
    394e:	0016                	c.slli	zero,0x5
    3950:	000a8123          	sb	zero,2(s5) # 2 <_prog_start-0x1ffffffe>
    3954:	0b00                	addi	s0,sp,400
    3956:	8c95                	sub	s1,s1,a3
    3958:	0000                	unimp
    395a:	0400                	addi	s0,sp,512
    395c:	1402                	slli	s0,s0,0x20
    395e:	2300                	fld	fs0,0(a4)
    3960:	0a98                	addi	a4,sp,336
    3962:	0000                	unimp
    3964:	008c960b          	0x8c960b
    3968:	0000                	unimp
    396a:	0204                	addi	s1,sp,256
    396c:	0012                	c.slli	zero,0x4
    396e:	000b3323          	0xb3323
    3972:	0b00                	addi	s0,sp,400
    3974:	00008c97          	auipc	s9,0x8
    3978:	0400                	addi	s0,sp,512
    397a:	1002                	c.slli	zero,0x20
    397c:	2300                	fld	fs0,0(a4)
    397e:	000008f3          	0x8f3
    3982:	008c980b          	0x8c980b
    3986:	0000                	unimp
    3988:	0804                	addi	s1,sp,16
    398a:	0008                	0x8
    398c:	00095523          	0x95523
    3990:	0b00                	addi	s0,sp,400
    3992:	8c99                	sub	s1,s1,a4
    3994:	0000                	unimp
    3996:	0400                	addi	s0,sp,512
    3998:	0008                	0x8
    399a:	0000                	unimp
    399c:	0406                	slli	s0,s0,0x1
    399e:	0d748d0b          	0xd748d0b
    39a2:	0000                	unimp
    39a4:	cb24                	sw	s1,80(a4)
    39a6:	000c                	0xc
    39a8:	0700                	addi	s0,sp,896
    39aa:	000008b3          	add	a7,zero,zero
    39ae:	008c9b0b          	0x8c9b0b
    39b2:	0000                	unimp
    39b4:	0300                	addi	s0,sp,384
    39b6:	092a                	slli	s2,s2,0xa
    39b8:	0000                	unimp
    39ba:	0d5b9c0b          	0xd5b9c0b
    39be:	0000                	unimp
    39c0:	040a                	slli	s0,s0,0x2
    39c2:	0db5a20b          	0xdb5a20b
    39c6:	0000                	unimp
    39c8:	000a7323          	0xa7323
    39cc:	0b00                	addi	s0,sp,400
    39ce:	8ca4                	0x8ca4
    39d0:	0000                	unimp
    39d2:	0400                	addi	s0,sp,512
    39d4:	1f01                	addi	t5,t5,-32
    39d6:	2300                	fld	fs0,0(a4)
    39d8:	0864                	addi	s1,sp,28
    39da:	0000                	unimp
    39dc:	008ca50b          	0x8ca50b
    39e0:	0000                	unimp
    39e2:	0104                	addi	s1,sp,128
    39e4:	001e                	c.slli	zero,0x7
    39e6:	000b3323          	0xb3323
    39ea:	0b00                	addi	s0,sp,400
    39ec:	8ca6                	mv	s9,s1
    39ee:	0000                	unimp
    39f0:	0400                	addi	s0,sp,512
    39f2:	001e                	c.slli	zero,0x7
    39f4:	0000                	unimp
    39f6:	0406                	slli	s0,s0,0x1
    39f8:	0dcea00b          	0xdcea00b
    39fc:	0000                	unimp
    39fe:	7f24                	flw	fs1,120(a4)
    3a00:	000d                	c.nop	3
    3a02:	0700                	addi	s0,sp,896
    3a04:	000008b3          	add	a7,zero,zero
    3a08:	008ca80b          	0x8ca80b
    3a0c:	0000                	unimp
    3a0e:	0300                	addi	s0,sp,384
    3a10:	00000aeb          	0xaeb
    3a14:	0db5a90b          	0xdb5a90b
    3a18:	0000                	unimp
    3a1a:	000b0f03          	lb	t5,0(s6)
    3a1e:	0b00                	addi	s0,sp,400
    3a20:	ceaa                	sw	a0,92(sp)
    3a22:	000d                	c.nop	3
    3a24:	0a00                	addi	s0,sp,272
    3a26:	0b04                	addi	s1,sp,400
    3a28:	1ab1                	addi	s5,s5,-20
    3a2a:	000e                	c.slli	zero,0x3
    3a2c:	2300                	fld	fs0,0(a4)
    3a2e:	00000883          	lb	a7,0(zero) # 0 <_prog_start-0x20000000>
    3a32:	008cb30b          	0x8cb30b
    3a36:	0000                	unimp
    3a38:	1004                	addi	s1,sp,32
    3a3a:	0010                	0x10
    3a3c:	000ad323          	0xad323
    3a40:	0b00                	addi	s0,sp,400
    3a42:	8cb4                	0x8cb4
    3a44:	0000                	unimp
    3a46:	0400                	addi	s0,sp,512
    3a48:	0b05                	addi	s6,s6,1
    3a4a:	2300                	fld	fs0,0(a4)
    3a4c:	00000b33          	add	s6,zero,zero
    3a50:	008cb50b          	0x8cb50b
    3a54:	0000                	unimp
    3a56:	0b04                	addi	s1,sp,400
    3a58:	0000                	unimp
    3a5a:	0600                	addi	s0,sp,768
    3a5c:	0b04                	addi	s1,sp,400
    3a5e:	000e33af          	0xe33af
    3a62:	2400                	fld	fs0,8(s0)
    3a64:	0de4                	addi	s1,sp,732
    3a66:	0000                	unimp
    3a68:	0008b307          	fld	ft6,0(a7)
    3a6c:	0b00                	addi	s0,sp,400
    3a6e:	00008cb7          	lui	s9,0x8
    3a72:	0000                	unimp
    3a74:	0009b803          	0x9b803
    3a78:	0b00                	addi	s0,sp,400
    3a7a:	1ab8                	addi	a4,sp,376
    3a7c:	000e                	c.slli	zero,0x3
    3a7e:	0a00                	addi	s0,sp,272
    3a80:	0b04                	addi	s1,sp,400
    3a82:	64bd                	lui	s1,0xf
    3a84:	000e                	c.slli	zero,0x3
    3a86:	2200                	fld	fs0,0(a2)
    3a88:	0b006473          	csrrsi	s0,0xb0,0
    3a8c:	00008cbf 1b050400 	0x1b05040000008cbf
    3a94:	2300                	fld	fs0,0(a4)
    3a96:	00000b33          	add	s6,zero,zero
    3a9a:	008cc00b          	0x8cc00b
    3a9e:	0000                	unimp
    3aa0:	1b04                	addi	s1,sp,432
    3aa2:	0000                	unimp
    3aa4:	0600                	addi	s0,sp,768
    3aa6:	0b04                	addi	s1,sp,400
    3aa8:	000e7dbb          	0xe7dbb
    3aac:	2400                	fld	fs0,8(s0)
    3aae:	0e3e                	slli	t3,t3,0xf
    3ab0:	0000                	unimp
    3ab2:	0008b307          	fld	ft6,0(a7)
    3ab6:	0b00                	addi	s0,sp,400
    3ab8:	8cc2                	mv	s9,a6
    3aba:	0000                	unimp
    3abc:	0000                	unimp
    3abe:	000a3a03          	0xa3a03
    3ac2:	0b00                	addi	s0,sp,400
    3ac4:	000e64c3          	fmadd.s	fs1,ft8,ft0,ft0,unknown
    3ac8:	0a00                	addi	s0,sp,272
    3aca:	0b78                	addi	a4,sp,412
    3acc:	f7ce                	fsw	fs3,236(sp)
    3ace:	0b00000f          	fence	irw,unknown
    3ad2:	08bc                	addi	a5,sp,88
    3ad4:	0000                	unimp
    3ad6:	008cd00b          	0x8cd00b
    3ada:	0000                	unimp
    3adc:	0b00                	addi	s0,sp,400
    3ade:	000008eb          	0x8eb
    3ae2:	0988d10b          	0x988d10b
    3ae6:	0000                	unimp
    3ae8:	0b04                	addi	s1,sp,400
    3aea:	0ac8                	addi	a0,sp,340
    3aec:	0000                	unimp
    3aee:	008cd20b          	0x8cd20b
    3af2:	0000                	unimp
    3af4:	0b08                	addi	a0,sp,400
    3af6:	0b04                	addi	s1,sp,400
    3af8:	0000                	unimp
    3afa:	008cd30b          	0x8cd30b
    3afe:	0000                	unimp
    3b00:	0b0c                	addi	a1,sp,400
    3b02:	000009b3          	add	s3,zero,zero
    3b06:	008cd50b          	0x8cd50b
    3b0a:	0000                	unimp
    3b0c:	0b10                	addi	a2,sp,400
    3b0e:	096d                	addi	s2,s2,27
    3b10:	0000                	unimp
    3b12:	008cd60b          	0x8cd60b
    3b16:	0000                	unimp
    3b18:	0b14                	addi	a3,sp,400
    3b1a:	08ac                	addi	a1,sp,88
    3b1c:	0000                	unimp
    3b1e:	09d3d70b          	0x9d3d70b
    3b22:	0000                	unimp
    3b24:	0b18                	addi	a4,sp,400
    3b26:	0899                	addi	a7,a7,6
    3b28:	0000                	unimp
    3b2a:	008cd80b          	0x8cd80b
    3b2e:	0000                	unimp
    3b30:	0b1c                	addi	a5,sp,400
    3b32:	0900                	addi	s0,sp,144
    3b34:	0000                	unimp
    3b36:	008cda0b          	0x8cda0b
    3b3a:	0000                	unimp
    3b3c:	0b20                	addi	s0,sp,408
    3b3e:	0916                	slli	s2,s2,0x5
    3b40:	0000                	unimp
    3b42:	008cdb0b          	0x8cdb0b
    3b46:	0000                	unimp
    3b48:	0b24                	addi	s1,sp,408
    3b4a:	00000a33          	add	s4,zero,zero
    3b4e:	0a3cdc0b          	0xa3cdc0b
    3b52:	0000                	unimp
    3b54:	0b28                	addi	a0,sp,408
    3b56:	0b44                	addi	s1,sp,404
    3b58:	0000                	unimp
    3b5a:	0aa5dd0b          	0xaa5dd0b
    3b5e:	0000                	unimp
    3b60:	0b2c                	addi	a1,sp,408
    3b62:	0a15                	addi	s4,s4,5
    3b64:	0000                	unimp
    3b66:	008cdf0b          	0x8cdf0b
    3b6a:	0000                	unimp
    3b6c:	0b30                	addi	a2,sp,408
    3b6e:	0a51                	addi	s4,s4,20
    3b70:	0000                	unimp
    3b72:	008ce00b          	0x8ce00b
    3b76:	0000                	unimp
    3b78:	0b34                	addi	a3,sp,408
    3b7a:	09c0                	addi	s0,sp,212
    3b7c:	0000                	unimp
    3b7e:	0e33e10b          	0xe33e10b
    3b82:	0000                	unimp
    3b84:	0b38                	addi	a4,sp,408
    3b86:	0a42                	slli	s4,s4,0x10
    3b88:	0000                	unimp
    3b8a:	0e7de20b          	0xe7de20b
    3b8e:	0000                	unimp
    3b90:	113c                	addi	a5,sp,168
    3b92:	6d66                	flw	fs10,88(sp)
    3b94:	0074                	addi	a3,sp,12
    3b96:	0b2ce30b          	0xb2ce30b
    3b9a:	0000                	unimp
    3b9c:	0b40                	addi	s0,sp,404
    3b9e:	0ad8                	addi	a4,sp,340
    3ba0:	0000                	unimp
    3ba2:	008ce40b          	0x8ce40b
    3ba6:	0000                	unimp
    3ba8:	0b44                	addi	s1,sp,404
    3baa:	094e                	slli	s2,s2,0x13
    3bac:	0000                	unimp
    3bae:	0b86e50b          	0xb86e50b
    3bb2:	0000                	unimp
    3bb4:	0b48                	addi	a0,sp,404
    3bb6:	0966                	slli	s2,s2,0x19
    3bb8:	0000                	unimp
    3bba:	0be0e60b          	0xbe0e60b
    3bbe:	0000                	unimp
    3bc0:	0b4c                	addi	a1,sp,404
    3bc2:	0a64                	addi	s1,sp,284
    3bc4:	0000                	unimp
    3bc6:	0c2be80b          	0xc2be80b
    3bca:	0000                	unimp
    3bcc:	0b50                	addi	a2,sp,404
    3bce:	08d6                	slli	a7,a7,0x15
    3bd0:	0000                	unimp
    3bd2:	0c76e90b          	0xc76e90b
    3bd6:	0000                	unimp
    3bd8:	0b54                	addi	a3,sp,404
    3bda:	000008c3          	fmadd.s	fa7,ft0,ft0,ft0,rne
    3bde:	008cea0b          	0x8cea0b
    3be2:	0000                	unimp
    3be4:	0b58                	addi	a4,sp,404
    3be6:	0000090b          	0x90b
    3bea:	008ceb0b          	0x8ceb0b
    3bee:	0000                	unimp
    3bf0:	0b5c                	addi	a5,sp,404
    3bf2:	00000877          	0x877
    3bf6:	0cc0ed0b          	0xcc0ed0b
    3bfa:	0000                	unimp
    3bfc:	0b60                	addi	s0,sp,412
    3bfe:	0932                	slli	s2,s2,0xc
    3c00:	0000                	unimp
    3c02:	0d74ee0b          	0xd74ee0b
    3c06:	0000                	unimp
    3c08:	0b64                	addi	s1,sp,412
    3c0a:	00000aa3          	sb	zero,21(zero) # 15 <_prog_start-0x1fffffeb>
    3c0e:	008cef0b          	0x8cef0b
    3c12:	0000                	unimp
    3c14:	0b68                	addi	a0,sp,412
    3c16:	0a20                	addi	s0,sp,280
    3c18:	0000                	unimp
    3c1a:	008cf00b          	0x8cf00b
    3c1e:	0000                	unimp
    3c20:	116c                	addi	a1,sp,172
    3c22:	6569                	lui	a0,0x1a
    3c24:	0b00                	addi	s0,sp,400
    3c26:	cef2                	sw	t3,92(sp)
    3c28:	000d                	c.nop	3
    3c2a:	7000                	flw	fs0,32(s0)
    3c2c:	6911                	lui	s2,0x4
    3c2e:	0070                	addi	a2,sp,12
    3c30:	0dd9f30b          	0xdd9f30b
    3c34:	0000                	unimp
    3c36:	0074                	addi	a3,sp,12
    3c38:	8825                	andi	s0,s0,9
    3c3a:	000e                	c.slli	zero,0x3
    3c3c:	0300                	addi	s0,sp,384
    3c3e:	0b1a                	slli	s6,s6,0x6
    3c40:	0000                	unimp
    3c42:	0ff7f40b          	0xff7f40b
    3c46:	0000                	unimp
    3c48:	0826                	slli	a6,a6,0x9
    3c4a:	000c                	0xc
    3c4c:	0100                	addi	s0,sp,128
    3c4e:	7a0a                	flw	fs4,160(sp)
    3c50:	0000                	unimp
    3c52:	0500                	addi	s0,sp,640
    3c54:	0005c403          	lbu	s0,0(a1) # 2000 <_prog_start-0x1fffe000>
    3c58:	0880                	addi	s0,sp,80
    3c5a:	0144                	addi	s1,sp,132
    3c5c:	0000                	unimp
    3c5e:	1028                	addi	a0,sp,40
    3c60:	0000                	unimp
    3c62:	7a09                	lui	s4,0xfffe2
    3c64:	0000                	unimp
    3c66:	3f00                	fld	fs0,56(a4)
    3c68:	2700                	fld	fs0,8(a4)
    3c6a:	00000c2b          	0xc2b
    3c6e:	0c01                	addi	s8,s8,0
    3c70:	1018                	addi	a4,sp,32
    3c72:	0000                	unimp
    3c74:	0305                	addi	t1,t1,1
    3c76:	0608                	addi	a0,sp,768
    3c78:	8000                	0x8000
    3c7a:	4408                	lw	a0,8(s0)
    3c7c:	0001                	nop
    3c7e:	4900                	lw	s0,16(a0)
    3c80:	0010                	0x10
    3c82:	0900                	addi	s0,sp,144
    3c84:	007a                	c.slli	zero,0x1e
    3c86:	0000                	unimp
    3c88:	007f                	0x7f
    3c8a:	000bf527          	0xbf527
    3c8e:	0100                	addi	s0,sp,128
    3c90:	390d                	jal	38c2 <_prog_start-0x1fffc73e>
    3c92:	0010                	0x10
    3c94:	0500                	addi	s0,sp,640
    3c96:	00064803          	lbu	a6,0(a2)
    3c9a:	2880                	fld	fs0,16(s1)
    3c9c:	0000036f          	jal	t1,3c9c <_prog_start-0x1fffc364>
    3ca0:	5601                	li	a2,-32
    3ca2:	7301                	lui	t1,0xfffe0
    3ca4:	0000                	unimp
    3ca6:	cc00                	sw	s0,24(s0)
    3ca8:	001a                	c.slli	zero,0x6
    3caa:	d020                	sw	s0,96(s0)
    3cac:	0000                	unimp
    3cae:	0100                	addi	s0,sp,128
    3cb0:	219c                	fld	fa5,0(a1)
    3cb2:	0011                	c.nop	4
    3cb4:	2900                	fld	fs0,16(a0)
    3cb6:	00000ae3          	beqz	zero,44ca <_prog_start-0x1fffbb36>
    3cba:	5701                	li	a4,-32
    3cbc:	2101                	jal	40bc <_prog_start-0x1fffbf44>
    3cbe:	0011                	c.nop	4
    3cc0:	0000                	unimp
    3cc2:	0240                	addi	s0,sp,260
    3cc4:	2a10                	fld	fa2,16(a2)
    3cc6:	1b54                	addi	a3,sp,436
    3cc8:	2000                	fld	fs0,0(s0)
    3cca:	1d2d                	addi	s10,s10,-21
    3ccc:	0000                	unimp
    3cce:	0000109b          	0x109b
    3cd2:	055a012b          	0x55a012b
    3cd6:	001fd403          	lhu	s0,1(t6) # fc001 <_prog_start-0x1ff03fff>
    3cda:	0020                	addi	s0,sp,8
    3cdc:	662a                	flw	fa2,136(sp)
    3cde:	2720001b          	0x2720001b
    3ce2:	0011                	c.nop	4
    3ce4:	c100                	sw	s0,0(a0)
    3ce6:	0010                	0x10
    3ce8:	2b00                	fld	fs0,16(a4)
    3cea:	5a01                	li	s4,-32
    3cec:	0c05                	addi	s8,s8,1
    3cee:	4000                	lw	s0,0(s0)
    3cf0:	1002                	c.slli	zero,0x20
    3cf2:	055b012b          	0x55b012b
    3cf6:	0021d403          	lhu	s0,2(gp) # 2e22 <_prog_start-0x1fffd1de>
    3cfa:	2b20                	fld	fs0,80(a4)
    3cfc:	5c01                	li	s8,-32
    3cfe:	0802                	c.slli64	a6
    3d00:	0064                	addi	s1,sp,12
    3d02:	782a                	flw	fa6,168(sp)
    3d04:	2720001b          	0x2720001b
    3d08:	0011                	c.nop	4
    3d0a:	e700                	fsw	fs0,8(a4)
    3d0c:	0010                	0x10
    3d0e:	2b00                	fld	fs0,16(a4)
    3d10:	5a01                	li	s4,-32
    3d12:	0c05                	addi	s8,s8,1
    3d14:	4000                	lw	s0,0(s0)
    3d16:	1002                	c.slli	zero,0x20
    3d18:	055b012b          	0x55b012b
    3d1c:	0021dc03          	lhu	s8,2(gp) # 80000d82 <__global_pointer$+0x2>
    3d20:	2b20                	fld	fs0,80(a4)
    3d22:	5c01                	li	s8,-32
    3d24:	0802                	c.slli64	a6
    3d26:	0064                	addi	s1,sp,12
    3d28:	8a2a                	mv	s4,a0
    3d2a:	2720001b          	0x2720001b
    3d2e:	0011                	c.nop	4
    3d30:	0d00                	addi	s0,sp,656
    3d32:	0011                	c.nop	4
    3d34:	2b00                	fld	fs0,16(a4)
    3d36:	5a01                	li	s4,-32
    3d38:	0c05                	addi	s8,s8,1
    3d3a:	4000                	lw	s0,0(s0)
    3d3c:	1002                	c.slli	zero,0x20
    3d3e:	055b012b          	0x55b012b
    3d42:	0021ec03          	0x21ec03
    3d46:	2b20                	fld	fs0,80(a4)
    3d48:	5c01                	li	s8,-32
    3d4a:	0802                	c.slli64	a6
    3d4c:	0064                	addi	s1,sp,12
    3d4e:	922c                	0x922c
    3d50:	2d20001b          	0x2d20001b
    3d54:	001d                	c.nop	7
    3d56:	2b00                	fld	fs0,16(a4)
    3d58:	5a01                	li	s4,-32
    3d5a:	0305                	addi	t1,t1,1
    3d5c:	1fd4                	addi	a3,sp,1012
    3d5e:	2000                	fld	fs0,0(s0)
    3d60:	0000                	unimp
    3d62:	040d                	addi	s0,s0,3
    3d64:	0ffc                	addi	a5,sp,988
    3d66:	0000                	unimp
    3d68:	4a2d                	li	s4,11
    3d6a:	000c                	0xc
    3d6c:	0100                	addi	s0,sp,128
    3d6e:	014a                	slli	sp,sp,0x12
    3d70:	00000073          	ecall
    3d74:	1aae                	slli	s5,s5,0x2b
    3d76:	2000                	fld	fs0,0(s0)
    3d78:	001e                	c.slli	zero,0x7
    3d7a:	0000                	unimp
    3d7c:	9c01                	0x9c01
    3d7e:	11b4                	addi	a3,sp,232
    3d80:	0000                	unimp
    3d82:	e32e                	fsw	fa1,132(sp)
    3d84:	000a                	c.slli	zero,0x2
    3d86:	0100                	addi	s0,sp,128
    3d88:	014a                	slli	sp,sp,0x12
    3d8a:	1121                	addi	sp,sp,-24
    3d8c:	0000                	unimp
    3d8e:	1310                	addi	a2,sp,416
    3d90:	0000                	unimp
    3d92:	c32e                	sw	a1,132(sp)
    3d94:	0100000b          	0x100000b
    3d98:	014a                	slli	sp,sp,0x12
    3d9a:	013e                	slli	sp,sp,0xf
    3d9c:	0000                	unimp
    3d9e:	1360                	addi	s0,sp,428
    3da0:	0000                	unimp
    3da2:	322e                	fld	ft4,232(sp)
    3da4:	000c                	0xc
    3da6:	0100                	addi	s0,sp,128
    3da8:	014a                	slli	sp,sp,0x12
    3daa:	00000073          	ecall
    3dae:	1381                	addi	t2,t2,-32
    3db0:	0000                	unimp
    3db2:	0063722f          	0x63722f
    3db6:	4c01                	li	s8,0
    3db8:	7301                	lui	t1,0xfffe0
    3dba:	0000                	unimp
    3dbc:	a200                	fsd	fs0,0(a2)
    3dbe:	2a000013          	li	zero,672
    3dc2:	1ab8                	addi	a4,sp,376
    3dc4:	2000                	fld	fs0,0(s0)
    3dc6:	1630                	addi	a2,sp,808
    3dc8:	0000                	unimp
    3dca:	11a2                	slli	gp,gp,0x28
    3dcc:	0000                	unimp
    3dce:	025a012b          	0x25a012b
    3dd2:	0078                	addi	a4,sp,12
    3dd4:	035b012b          	0x35b012b
    3dd8:	2b5b01f3          	0x2b5b01f3
    3ddc:	5c01                	li	s8,-32
    3dde:	5c01f303          	0x5c01f303
    3de2:	3000                	fld	fs0,32(s0)
    3de4:	1acc                	addi	a1,sp,372
    3de6:	2000                	fld	fs0,0(s0)
    3de8:	11b4                	addi	a3,sp,232
    3dea:	0000                	unimp
    3dec:	035a012b          	0x35a012b
    3df0:	005a01f3          	0x5a01f3
    3df4:	2d00                	fld	fs0,24(a0)
    3df6:	0bdd                	addi	s7,s7,23
    3df8:	0000                	unimp
    3dfa:	1301                	addi	t1,t1,-32
    3dfc:	7301                	lui	t1,0xfffe0
    3dfe:	0000                	unimp
    3e00:	7e00                	flw	fs0,56(a2)
    3e02:	0019                	c.nop	6
    3e04:	3020                	fld	fs0,96(s0)
    3e06:	0001                	nop
    3e08:	0100                	addi	s0,sp,128
    3e0a:	779c                	flw	fa5,40(a5)
    3e0c:	2e000013          	li	zero,736
    3e10:	00000ae3          	beqz	zero,4624 <_prog_start-0x1fffb9dc>
    3e14:	1301                	addi	t1,t1,-32
    3e16:	2101                	jal	4216 <_prog_start-0x1fffbdea>
    3e18:	0011                	c.nop	4
    3e1a:	c100                	sw	s0,0(a0)
    3e1c:	2f000013          	li	zero,752
    3e20:	0069                	c.nop	26
    3e22:	1501                	addi	a0,a0,-32
    3e24:	7301                	lui	t1,0xfffe0
    3e26:	0000                	unimp
    3e28:	f800                	fsw	fs0,48(s0)
    3e2a:	2f000013          	li	zero,752
    3e2e:	6372                	flw	ft6,28(sp)
    3e30:	0100                	addi	s0,sp,128
    3e32:	0116                	slli	sp,sp,0x5
    3e34:	00000073          	ecall
    3e38:	1448                	addi	a0,sp,548
    3e3a:	0000                	unimp
    3e3c:	bc2a                	fsd	fa0,56(sp)
    3e3e:	0019                	c.nop	6
    3e40:	3820                	fld	fs0,112(s0)
    3e42:	001d                	c.nop	7
    3e44:	1d00                	addi	s0,sp,688
    3e46:	0012                	c.slli	zero,0x4
    3e48:	2b00                	fld	fs0,16(a4)
    3e4a:	5a01                	li	s4,-32
    3e4c:	7802                	flw	fa6,32(sp)
    3e4e:	2b00                	fld	fs0,16(a4)
    3e50:	5b01                	li	s6,-32
    3e52:	0305                	addi	t1,t1,1
    3e54:	2190                	fld	fa2,0(a1)
    3e56:	2000                	fld	fs0,0(s0)
    3e58:	015c012b          	0x15c012b
    3e5c:	0036                	c.slli	zero,0xd
    3e5e:	ce2a                	sw	a0,28(sp)
    3e60:	0019                	c.nop	6
    3e62:	3820                	fld	fs0,112(s0)
    3e64:	001d                	c.nop	7
    3e66:	3f00                	fld	fs0,56(a4)
    3e68:	0012                	c.slli	zero,0x4
    3e6a:	2b00                	fld	fs0,16(a4)
    3e6c:	5a01                	li	s4,-32
    3e6e:	7802                	flw	fa6,32(sp)
    3e70:	2b00                	fld	fs0,16(a4)
    3e72:	5b01                	li	s6,-32
    3e74:	0305                	addi	t1,t1,1
    3e76:	21a4                	fld	fs1,64(a1)
    3e78:	2000                	fld	fs0,0(s0)
    3e7a:	015c012b          	0x15c012b
    3e7e:	0036                	c.slli	zero,0xd
    3e80:	de2a                	sw	a0,60(sp)
    3e82:	0019                	c.nop	6
    3e84:	3820                	fld	fs0,112(s0)
    3e86:	001d                	c.nop	7
    3e88:	6100                	flw	fs0,0(a0)
    3e8a:	0012                	c.slli	zero,0x4
    3e8c:	2b00                	fld	fs0,16(a4)
    3e8e:	5a01                	li	s4,-32
    3e90:	7802                	flw	fa6,32(sp)
    3e92:	2b00                	fld	fs0,16(a4)
    3e94:	5b01                	li	s6,-32
    3e96:	0305                	addi	t1,t1,1
    3e98:	21bc                	fld	fa5,64(a1)
    3e9a:	2000                	fld	fs0,0(s0)
    3e9c:	015c012b          	0x15c012b
    3ea0:	0036                	c.slli	zero,0xd
    3ea2:	ea2a                	fsw	fa0,20(sp)
    3ea4:	0019                	c.nop	6
    3ea6:	7720                	flw	fs0,104(a4)
    3ea8:	75000013          	li	zero,1872
    3eac:	0012                	c.slli	zero,0x4
    3eae:	2b00                	fld	fs0,16(a4)
    3eb0:	5a01                	li	s4,-32
    3eb2:	8702                	jr	a4
    3eb4:	0000                	unimp
    3eb6:	042a                	slli	s0,s0,0xa
    3eb8:	001a                	c.slli	zero,0x6
    3eba:	2d20                	fld	fs0,88(a0)
    3ebc:	001d                	c.nop	7
    3ebe:	8c00                	0x8c00
    3ec0:	0012                	c.slli	zero,0x4
    3ec2:	2b00                	fld	fs0,16(a4)
    3ec4:	5a01                	li	s4,-32
    3ec6:	0305                	addi	t1,t1,1
    3ec8:	2178                	fld	fa4,192(a0)
    3eca:	2000                	fld	fs0,0(s0)
    3ecc:	2a00                	fld	fs0,16(a2)
    3ece:	1a0a                	slli	s4,s4,0x22
    3ed0:	2000                	fld	fs0,0(s0)
    3ed2:	00001d43          	fmadd.s	fs10,ft0,ft0,ft0,rtz
    3ed6:	12a0                	addi	s0,sp,360
    3ed8:	0000                	unimp
    3eda:	025a012b          	0x25a012b
    3ede:	0079                	c.nop	30
    3ee0:	2a00                	fld	fs0,16(a2)
    3ee2:	1a12                	slli	s4,s4,0x24
    3ee4:	2000                	fld	fs0,0(s0)
    3ee6:	1d4e                	slli	s10,s10,0x33
    3ee8:	0000                	unimp
    3eea:	12b4                	addi	a3,sp,360
    3eec:	0000                	unimp
    3eee:	025a012b          	0x25a012b
    3ef2:	3a08                	fld	fa0,48(a2)
    3ef4:	2a00                	fld	fs0,16(a2)
    3ef6:	1a1a                	slli	s4,s4,0x26
    3ef8:	2000                	fld	fs0,0(s0)
    3efa:	1d4e                	slli	s10,s10,0x33
    3efc:	0000                	unimp
    3efe:	12c8                	addi	a0,sp,356
    3f00:	0000                	unimp
    3f02:	025a012b          	0x25a012b
    3f06:	2008                	fld	fa0,0(s0)
    3f08:	2a00                	fld	fs0,16(a2)
    3f0a:	1a20                	addi	s0,sp,312
    3f0c:	2000                	fld	fs0,0(s0)
    3f0e:	1d2d                	addi	s10,s10,-21
    3f10:	0000                	unimp
    3f12:	12dc                	addi	a5,sp,356
    3f14:	0000                	unimp
    3f16:	025a012b          	0x25a012b
    3f1a:	0078                	addi	a4,sp,12
    3f1c:	2a00                	fld	fs0,16(a2)
    3f1e:	1a2a                	slli	s4,s4,0x2a
    3f20:	2000                	fld	fs0,0(s0)
    3f22:	1d2d                	addi	s10,s10,-21
    3f24:	0000                	unimp
    3f26:	000012f3          	csrrw	t0,ustatus,zero
    3f2a:	055a012b          	0x55a012b
    3f2e:	001fd403          	lhu	s0,1(t6)
    3f32:	0020                	addi	s0,sp,8
    3f34:	302a                	fld	ft0,168(sp)
    3f36:	001a                	c.slli	zero,0x6
    3f38:	1720                	addi	s0,sp,936
    3f3a:	001c                	0x1c
    3f3c:	0700                	addi	s0,sp,896
    3f3e:	2b000013          	li	zero,688
    3f42:	5a01                	li	s4,-32
    3f44:	7802                	flw	fa6,32(sp)
    3f46:	0000                	unimp
    3f48:	3a2a                	fld	fs4,168(sp)
    3f4a:	001a                	c.slli	zero,0x6
    3f4c:	2d20                	fld	fs0,88(a0)
    3f4e:	001d                	c.nop	7
    3f50:	1e00                	addi	s0,sp,816
    3f52:	2b000013          	li	zero,688
    3f56:	5a01                	li	s4,-32
    3f58:	0305                	addi	t1,t1,1
    3f5a:	1fd4                	addi	a3,sp,1012
    3f5c:	2000                	fld	fs0,0(s0)
    3f5e:	2a00                	fld	fs0,16(a2)
    3f60:	1a48                	addi	a0,sp,308
    3f62:	2000                	fld	fs0,0(s0)
    3f64:	1d2d                	addi	s10,s10,-21
    3f66:	0000                	unimp
    3f68:	1335                	addi	t1,t1,-19
    3f6a:	0000                	unimp
    3f6c:	055a012b          	0x55a012b
    3f70:	00216803          	0x216803
    3f74:	0020                	addi	s0,sp,8
    3f76:	782a                	flw	fa6,168(sp)
    3f78:	001a                	c.slli	zero,0x6
    3f7a:	2d20                	fld	fs0,88(a0)
    3f7c:	001d                	c.nop	7
    3f7e:	4c00                	lw	s0,24(s0)
    3f80:	2b000013          	li	zero,688
    3f84:	5a01                	li	s4,-32
    3f86:	0305                	addi	t1,t1,1
    3f88:	2198                	fld	fa4,0(a1)
    3f8a:	2000                	fld	fs0,0(s0)
    3f8c:	2a00                	fld	fs0,16(a2)
    3f8e:	1a92                	slli	s5,s5,0x24
    3f90:	2000                	fld	fs0,0(s0)
    3f92:	1d2d                	addi	s10,s10,-21
    3f94:	0000                	unimp
    3f96:	00001363          	bnez	zero,3f9c <_prog_start-0x1fffc064>
    3f9a:	055a012b          	0x55a012b
    3f9e:	0021b003          	0x21b003
    3fa2:	0020                	addi	s0,sp,8
    3fa4:	ac2c                	fsd	fa1,88(s0)
    3fa6:	001a                	c.slli	zero,0x6
    3fa8:	2d20                	fld	fs0,88(a0)
    3faa:	001d                	c.nop	7
    3fac:	2b00                	fld	fs0,16(a4)
    3fae:	5a01                	li	s4,-32
    3fb0:	0305                	addi	t1,t1,1
    3fb2:	21c8                	fld	fa0,128(a1)
    3fb4:	2000                	fld	fs0,0(s0)
    3fb6:	0000                	unimp
    3fb8:	fc31                	bnez	s0,3f14 <_prog_start-0x1fffc0ec>
    3fba:	0100000b          	0x100000b
    3fbe:	73c6                	flw	ft7,112(sp)
    3fc0:	0000                	unimp
    3fc2:	7400                	flw	fs0,40(s0)
    3fc4:	0a200017          	auipc	zero,0xa200
    3fc8:	0002                	c.slli64	zero
    3fca:	0100                	addi	s0,sp,128
    3fcc:	309c                	fld	fa5,32(s1)
    3fce:	0016                	c.slli	zero,0x5
    3fd0:	3200                	fld	fs0,32(a2)
    3fd2:	00000ae3          	beqz	zero,47e6 <_prog_start-0x1fffb81a>
    3fd6:	c601                	beqz	a2,3fde <_prog_start-0x1fffc022>
    3fd8:	1121                	addi	sp,sp,-24
    3fda:	0000                	unimp
    3fdc:	000014ab          	0x14ab
    3fe0:	01006933          	or	s2,zero,a6
    3fe4:	73c8                	flw	fa0,36(a5)
    3fe6:	0000                	unimp
    3fe8:	e200                	fsw	fs0,0(a2)
    3fea:	0014                	0x14
    3fec:	3300                	fld	fs0,32(a4)
    3fee:	6372                	flw	ft6,28(sp)
    3ff0:	0100                	addi	s0,sp,128
    3ff2:	73c9                	lui	t2,0xffff2
    3ff4:	0000                	unimp
    3ff6:	f900                	fsw	fs0,48(a0)
    3ff8:	0015                	c.nop	5
    3ffa:	3400                	fld	fs0,40(s0)
    3ffc:	0bad                	addi	s7,s7,11
    3ffe:	0000                	unimp
    4000:	ca01                	beqz	a2,4010 <_prog_start-0x1fffbff0>
    4002:	00000073          	ecall
    4006:	1644                	addi	s1,sp,804
    4008:	0000                	unimp
    400a:	e835                	bnez	s0,407e <_prog_start-0x1fffbf82>
    400c:	0002                	c.slli64	zero
    400e:	4700                	lw	s0,8(a4)
    4010:	0015                	c.nop	5
    4012:	3300                	fld	fs0,32(a4)
    4014:	006a                	c.slli	zero,0x1a
    4016:	cd01                	beqz	a0,402e <_prog_start-0x1fffbfd2>
    4018:	00000073          	ecall
    401c:	00001687          	0x1687
    4020:	1236                	slli	tp,tp,0x2d
    4022:	ee00001b          	0xee00001b
    4026:	08200017          	auipc	zero,0x8200
    402a:	0000                	unimp
    402c:	0100                	addi	s0,sp,128
    402e:	28d9                	jal	4104 <_prog_start-0x1fffbefc>
    4030:	0014                	0x14
    4032:	3700                	fld	fs0,40(a4)
    4034:	1b38                	addi	a4,sp,440
    4036:	0000                	unimp
    4038:	16b1                	addi	a3,a3,-20
    403a:	0000                	unimp
    403c:	001b2d37          	lui	s10,0x1b2
    4040:	c500                	sw	s0,8(a0)
    4042:	0016                	c.slli	zero,0x5
    4044:	3700                	fld	fs0,40(a4)
    4046:	1b22                	slli	s6,s6,0x28
    4048:	0000                	unimp
    404a:	16d9                	addi	a3,a3,-10
    404c:	0000                	unimp
    404e:	f62c                	fsw	fa1,104(a2)
    4050:	44200017          	auipc	zero,0x44200
    4054:	2b00001b          	0x2b00001b
    4058:	5a01                	li	s4,-32
    405a:	8502                	jr	a0
    405c:	2b00                	fld	fs0,16(a4)
    405e:	5b01                	li	s6,-32
    4060:	3401                	jal	3a60 <_prog_start-0x1fffc5a0>
    4062:	015c012b          	0x15c012b
    4066:	0031                	c.nop	12
    4068:	2a00                	fld	fs0,16(a2)
    406a:	17ba                	slli	a5,a5,0x2e
    406c:	2000                	fld	fs0,0(s0)
    406e:	1d2d                	addi	s10,s10,-21
    4070:	0000                	unimp
    4072:	0000143f 055a012b 	0x55a012b0000143f
    407a:	0020b003          	0x20b003
    407e:	0020                	addi	s0,sp,8
    4080:	c02a                	sw	a0,0(sp)
    4082:	a8200017          	auipc	zero,0xa8200
    4086:	0018                	0x18
    4088:	5800                	lw	s0,48(s0)
    408a:	0014                	0x14
    408c:	2b00                	fld	fs0,16(a4)
    408e:	5a01                	li	s4,-32
    4090:	8502                	jr	a0
    4092:	2b00                	fld	fs0,16(a4)
    4094:	5b01                	li	s6,-32
    4096:	3101                	jal	3c96 <_prog_start-0x1fffc36a>
    4098:	2a00                	fld	fs0,16(a2)
    409a:	17fc                	addi	a5,sp,1004
    409c:	2000                	fld	fs0,0(s0)
    409e:	1bd0                	addi	a2,sp,500
    40a0:	0000                	unimp
    40a2:	146c                	addi	a1,sp,556
    40a4:	0000                	unimp
    40a6:	025a012b          	0x25a012b
    40aa:	6408                	flw	fa0,8(s0)
    40ac:	2a00                	fld	fs0,16(a2)
    40ae:	1828                	addi	a0,sp,56
    40b0:	2000                	fld	fs0,0(s0)
    40b2:	1d59                	addi	s10,s10,-10
    40b4:	0000                	unimp
    40b6:	1480                	addi	s0,sp,608
    40b8:	0000                	unimp
    40ba:	025a012b          	0x25a012b
    40be:	6408                	flw	fa0,8(s0)
    40c0:	2a00                	fld	fs0,16(a2)
    40c2:	1838                	addi	a4,sp,56
    40c4:	2000                	fld	fs0,0(s0)
    40c6:	1d2d                	addi	s10,s10,-21
    40c8:	0000                	unimp
    40ca:	00001497          	auipc	s1,0x1
    40ce:	055a012b          	0x55a012b
    40d2:	00211c03          	lh	s8,2(sp) # 700239e <_prog_start-0x18ffdc62>
    40d6:	0020                	addi	s0,sp,8
    40d8:	4038                	lw	a4,64(s0)
    40da:	0018                	0x18
    40dc:	4e20                	lw	s0,88(a2)
    40de:	001d                	c.nop	7
    40e0:	2a00                	fld	fs0,16(a2)
    40e2:	1848                	addi	a0,sp,52
    40e4:	2000                	fld	fs0,0(s0)
    40e6:	1d2d                	addi	s10,s10,-21
    40e8:	0000                	unimp
    40ea:	000014b7          	lui	s1,0x1
    40ee:	055a012b          	0x55a012b
    40f2:	001fd403          	lhu	s0,1(t6)
    40f6:	0020                	addi	s0,sp,8
    40f8:	622a                	flw	ft4,136(sp)
    40fa:	0018                	0x18
    40fc:	2d20                	fld	fs0,88(a0)
    40fe:	001d                	c.nop	7
    4100:	ce00                	sw	s0,24(a2)
    4102:	0014                	0x14
    4104:	2b00                	fld	fs0,16(a4)
    4106:	5a01                	li	s4,-32
    4108:	0305                	addi	t1,t1,1
    410a:	2130                	fld	fa2,64(a0)
    410c:	2000                	fld	fs0,0(s0)
    410e:	2a00                	fld	fs0,16(a2)
    4110:	1870                	addi	a2,sp,60
    4112:	2000                	fld	fs0,0(s0)
    4114:	1d2d                	addi	s10,s10,-21
    4116:	0000                	unimp
    4118:	14e5                	addi	s1,s1,-7
    411a:	0000                	unimp
    411c:	055a012b          	0x55a012b
    4120:	0020d403          	lhu	s0,2(ra) # 2b36 <_prog_start-0x1fffd4ca>
    4124:	0020                	addi	s0,sp,8
    4126:	862a                	mv	a2,a0
    4128:	0018                	0x18
    412a:	2d20                	fld	fs0,88(a0)
    412c:	001d                	c.nop	7
    412e:	fc00                	fsw	fs0,56(s0)
    4130:	0014                	0x14
    4132:	2b00                	fld	fs0,16(a4)
    4134:	5a01                	li	s4,-32
    4136:	0305                	addi	t1,t1,1
    4138:	2108                	fld	fa0,0(a0)
    413a:	2000                	fld	fs0,0(s0)
    413c:	3800                	fld	fs0,48(s0)
    413e:	1890                	addi	a2,sp,112
    4140:	2000                	fld	fs0,0(s0)
    4142:	00001c5b          	0x1c5b
    4146:	9c2a                	add	s8,s8,a0
    4148:	0018                	0x18
    414a:	2d20                	fld	fs0,88(a0)
    414c:	001d                	c.nop	7
    414e:	1c00                	addi	s0,sp,560
    4150:	0015                	c.nop	5
    4152:	2b00                	fld	fs0,16(a4)
    4154:	5a01                	li	s4,-32
    4156:	0305                	addi	t1,t1,1
    4158:	1fd4                	addi	a3,sp,1012
    415a:	2000                	fld	fs0,0(s0)
    415c:	2a00                	fld	fs0,16(a2)
    415e:	1942                	slli	s2,s2,0x30
    4160:	2000                	fld	fs0,0(s0)
    4162:	1d2d                	addi	s10,s10,-21
    4164:	0000                	unimp
    4166:	00001533          	sll	a0,zero,zero
    416a:	055a012b          	0x55a012b
    416e:	0020c403          	lbu	s0,2(ra)
    4172:	0020                	addi	s0,sp,8
    4174:	502c                	lw	a1,96(s0)
    4176:	0019                	c.nop	6
    4178:	2d20                	fld	fs0,88(a0)
    417a:	001d                	c.nop	7
    417c:	2b00                	fld	fs0,16(a4)
    417e:	5a01                	li	s4,-32
    4180:	0305                	addi	t1,t1,1
    4182:	20f4                	fld	fa3,192(s1)
    4184:	2000                	fld	fs0,0(s0)
    4186:	0000                	unimp
    4188:	1239                	addi	tp,tp,-18
    418a:	ca00001b          	0xca00001b
    418e:	0018                	0x18
    4190:	0820                	addi	s0,sp,24
    4192:	0000                	unimp
    4194:	0100                	addi	s0,sp,128
    4196:	0100                	addi	s0,sp,128
    4198:	1592                	slli	a1,a1,0x24
    419a:	0000                	unimp
    419c:	001b3837          	lui	a6,0x1b3
    41a0:	ec00                	fsw	fs0,24(s0)
    41a2:	0016                	c.slli	zero,0x5
    41a4:	3700                	fld	fs0,40(a4)
    41a6:	1b2d                	addi	s6,s6,-21
    41a8:	0000                	unimp
    41aa:	1700                	addi	s0,sp,928
    41ac:	0000                	unimp
    41ae:	001b2237          	lui	tp,0x1b2
    41b2:	1300                	addi	s0,sp,416
    41b4:	2c000017          	auipc	zero,0x2c000
    41b8:	18d2                	slli	a7,a7,0x34
    41ba:	2000                	fld	fs0,0(s0)
    41bc:	1b44                	addi	s1,sp,436
    41be:	0000                	unimp
    41c0:	025a012b          	0x25a012b
    41c4:	0085                	addi	ra,ra,1
    41c6:	025b012b          	0x25b012b
    41ca:	012b0083          	lb	ra,18(s6)
    41ce:	015c                	addi	a5,sp,132
    41d0:	0030                	addi	a2,sp,8
    41d2:	2a00                	fld	fs0,16(a2)
    41d4:	18ee                	slli	a7,a7,0x3b
    41d6:	2000                	fld	fs0,0(s0)
    41d8:	1d2d                	addi	s10,s10,-21
    41da:	0000                	unimp
    41dc:	15a9                	addi	a1,a1,-22
    41de:	0000                	unimp
    41e0:	055a012b          	0x55a012b
    41e4:	00215403          	lhu	s0,2(sp)
    41e8:	0020                	addi	s0,sp,8
    41ea:	fe38                	fsw	fa4,120(a2)
    41ec:	0018                	0x18
    41ee:	4320                	lw	s0,64(a4)
    41f0:	001d                	c.nop	7
    41f2:	2a00                	fld	fs0,16(a2)
    41f4:	1906                	slli	s2,s2,0x21
    41f6:	2000                	fld	fs0,0(s0)
    41f8:	1d4e                	slli	s10,s10,0x33
    41fa:	0000                	unimp
    41fc:	15c6                	slli	a1,a1,0x31
    41fe:	0000                	unimp
    4200:	025a012b          	0x25a012b
    4204:	2008                	fld	fa0,0(s0)
    4206:	2a00                	fld	fs0,16(a2)
    4208:	1916                	slli	s2,s2,0x25
    420a:	2000                	fld	fs0,0(s0)
    420c:	1d2d                	addi	s10,s10,-21
    420e:	0000                	unimp
    4210:	15dd                	addi	a1,a1,-9
    4212:	0000                	unimp
    4214:	055a012b          	0x55a012b
    4218:	001fd403          	lhu	s0,1(t6)
    421c:	0020                	addi	s0,sp,8
    421e:	622a                	flw	ft4,136(sp)
    4220:	0019                	c.nop	6
    4222:	2d20                	fld	fs0,88(a0)
    4224:	001d                	c.nop	7
    4226:	f400                	fsw	fs0,40(s0)
    4228:	0015                	c.nop	5
    422a:	2b00                	fld	fs0,16(a4)
    422c:	5a01                	li	s4,-32
    422e:	0305                	addi	t1,t1,1
    4230:	2140                	fld	fs0,128(a0)
    4232:	2000                	fld	fs0,0(s0)
    4234:	2a00                	fld	fs0,16(a2)
    4236:	1968                	addi	a0,sp,188
    4238:	2000                	fld	fs0,0(s0)
    423a:	00001d43          	fmadd.s	fs10,ft0,ft0,ft0,rtz
    423e:	1608                	addi	a0,sp,800
    4240:	0000                	unimp
    4242:	025a012b          	0x25a012b
    4246:	2a000083          	lb	ra,672(zero) # 2a0 <_prog_start-0x1ffffd60>
    424a:	1970                	addi	a2,sp,188
    424c:	2000                	fld	fs0,0(s0)
    424e:	1d4e                	slli	s10,s10,0x33
    4250:	0000                	unimp
    4252:	161c                	addi	a5,sp,800
    4254:	0000                	unimp
    4256:	025a012b          	0x25a012b
    425a:	2008                	fld	fa0,0(s0)
    425c:	2c00                	fld	fs0,24(s0)
    425e:	197c                	addi	a5,sp,188
    4260:	2000                	fld	fs0,0(s0)
    4262:	1d2d                	addi	s10,s10,-21
    4264:	0000                	unimp
    4266:	055a012b          	0x55a012b
    426a:	001fd403          	lhu	s0,1(t6)
    426e:	0020                	addi	s0,sp,8
    4270:	3100                	fld	fs0,32(a0)
    4272:	0c3a                	slli	s8,s8,0xe
    4274:	0000                	unimp
    4276:	8801                	andi	s0,s0,0
    4278:	00000073          	ecall
    427c:	15ec                	addi	a1,sp,748
    427e:	2000                	fld	fs0,0(s0)
    4280:	0188                	addi	a0,sp,192
    4282:	0000                	unimp
    4284:	9c01                	0x9c01
    4286:	18a8                	addi	a0,sp,120
    4288:	0000                	unimp
    428a:	e332                	fsw	fa2,132(sp)
    428c:	000a                	c.slli	zero,0x2
    428e:	0100                	addi	s0,sp,128
    4290:	2188                	fld	fa0,0(a1)
    4292:	0011                	c.nop	4
    4294:	2600                	fld	fs0,8(a2)
    4296:	32000017          	auipc	zero,0x32000
    429a:	00000bc3          	fmadd.s	fs7,ft0,ft0,ft0,rne
    429e:	8801                	andi	s0,s0,0
    42a0:	013e                	slli	sp,sp,0xf
    42a2:	0000                	unimp
    42a4:	175d                	addi	a4,a4,-9
    42a6:	0000                	unimp
    42a8:	3232                	fld	ft4,296(sp)
    42aa:	000c                	0xc
    42ac:	0100                	addi	s0,sp,128
    42ae:	7388                	flw	fa0,32(a5)
    42b0:	0000                	unimp
    42b2:	9400                	0x9400
    42b4:	33000017          	auipc	zero,0x33000
    42b8:	6372                	flw	ft6,28(sp)
    42ba:	0100                	addi	s0,sp,128
    42bc:	738a                	flw	ft7,160(sp)
    42be:	0000                	unimp
    42c0:	cb00                	sw	s0,16(a4)
    42c2:	33000017          	auipc	zero,0x33000
    42c6:	0069                	c.nop	26
    42c8:	8b01                	andi	a4,a4,0
    42ca:	00000073          	ecall
    42ce:	182d                	addi	a6,a6,-21
    42d0:	0000                	unimp
    42d2:	e534                	fsw	fa3,72(a0)
    42d4:	0100000b          	0x100000b
    42d8:	338d                	jal	403a <_prog_start-0x1fffbfc6>
    42da:	0000                	unimp
    42dc:	6700                	flw	fs0,8(a4)
    42de:	0018                	0x18
    42e0:	3a00                	fld	fs0,48(a2)
    42e2:	1b12                	slli	s6,s6,0x24
    42e4:	0000                	unimp
    42e6:	164c                	addi	a1,sp,804
    42e8:	2000                	fld	fs0,0(s0)
    42ea:	02d0                	addi	a2,sp,324
    42ec:	0000                	unimp
    42ee:	a301                	j	47ee <_prog_start-0x1fffb812>
    42f0:	16e9                	addi	a3,a3,-6
    42f2:	0000                	unimp
    42f4:	001b3837          	lui	a6,0x1b3
    42f8:	9000                	0x9000
    42fa:	0018                	0x18
    42fc:	3700                	fld	fs0,40(a4)
    42fe:	1b2d                	addi	s6,s6,-21
    4300:	0000                	unimp
    4302:	18a4                	addi	s1,sp,120
    4304:	0000                	unimp
    4306:	001b2237          	lui	tp,0x1b2
    430a:	b800                	fsd	fs0,48(s0)
    430c:	0018                	0x18
    430e:	2c00                	fld	fs0,24(s0)
    4310:	1658                	addi	a4,sp,804
    4312:	2000                	fld	fs0,0(s0)
    4314:	1b44                	addi	s1,sp,436
    4316:	0000                	unimp
    4318:	025a012b          	0x25a012b
    431c:	0084                	addi	s1,sp,64
    431e:	015b012b          	0x15b012b
    4322:	2b34                	fld	fa3,80(a4)
    4324:	5c01                	li	s8,-32
    4326:	3101                	jal	3f26 <_prog_start-0x1fffc0da>
    4328:	0000                	unimp
    432a:	1236                	slli	tp,tp,0x2d
    432c:	f000001b          	0xf000001b
    4330:	0016                	c.slli	zero,0x5
    4332:	0820                	addi	s0,sp,24
    4334:	0000                	unimp
    4336:	0100                	addi	s0,sp,128
    4338:	33b5                	jal	40a4 <_prog_start-0x1fffbf5c>
    433a:	37000017          	auipc	zero,0x37000
    433e:	1b38                	addi	a4,sp,440
    4340:	0000                	unimp
    4342:	000018cb          	fnmsub.s	fa7,ft0,ft0,ft0,rtz
    4346:	001b2d37          	lui	s10,0x1b2
    434a:	df00                	sw	s0,56(a4)
    434c:	0018                	0x18
    434e:	3700                	fld	fs0,40(a4)
    4350:	1b22                	slli	s6,s6,0x28
    4352:	0000                	unimp
    4354:	18f8                	addi	a4,sp,124
    4356:	0000                	unimp
    4358:	f82c                	fsw	fa1,112(s0)
    435a:	0016                	c.slli	zero,0x5
    435c:	4420                	lw	s0,72(s0)
    435e:	2b00001b          	0x2b00001b
    4362:	5a01                	li	s4,-32
    4364:	8402                	jr	s0
    4366:	2b00                	fld	fs0,16(a4)
    4368:	5b01                	li	s6,-32
    436a:	8702                	jr	a4
    436c:	2b00                	fld	fs0,16(a4)
    436e:	5c01                	li	s8,-32
    4370:	3101                	jal	3f70 <_prog_start-0x1fffc090>
    4372:	0000                	unimp
    4374:	0e2a                	slli	t3,t3,0xa
    4376:	0016                	c.slli	zero,0x5
    4378:	6420                	flw	fs0,72(s0)
    437a:	001d                	c.nop	7
    437c:	4700                	lw	s0,8(a4)
    437e:	2b000017          	auipc	zero,0x2b000
    4382:	5a01                	li	s4,-32
    4384:	8502                	jr	a0
    4386:	0000                	unimp
    4388:	1c2a                	slli	s8,s8,0x2a
    438a:	0016                	c.slli	zero,0x5
    438c:	a820                	fsd	fs0,80(s0)
    438e:	0018                	0x18
    4390:	6000                	flw	fs0,0(s0)
    4392:	2b000017          	auipc	zero,0x2b000
    4396:	5a01                	li	s4,-32
    4398:	8402                	jr	s0
    439a:	2b00                	fld	fs0,16(a4)
    439c:	5b01                	li	s6,-32
    439e:	3201                	jal	3c9e <_prog_start-0x1fffc362>
    43a0:	2a00                	fld	fs0,16(a2)
    43a2:	1666                	slli	a2,a2,0x39
    43a4:	2000                	fld	fs0,0(s0)
    43a6:	1bd0                	addi	a2,sp,500
    43a8:	0000                	unimp
    43aa:	1774                	addi	a3,sp,940
    43ac:	0000                	unimp
    43ae:	025a012b          	0x25a012b
    43b2:	0086                	slli	ra,ra,0x1
    43b4:	2a00                	fld	fs0,16(a2)
    43b6:	168e                	slli	a3,a3,0x23
    43b8:	2000                	fld	fs0,0(s0)
    43ba:	1d2d                	addi	s10,s10,-21
    43bc:	0000                	unimp
    43be:	0000178b          	0x178b
    43c2:	055a012b          	0x55a012b
    43c6:	00206403          	0x206403
    43ca:	0020                	addi	s0,sp,8
    43cc:	9a38                	0x9a38
    43ce:	0016                	c.slli	zero,0x5
    43d0:	5b20                	lw	s0,112(a4)
    43d2:	001c                	0x1c
    43d4:	2a00                	fld	fs0,16(a2)
    43d6:	16be                	slli	a3,a3,0x2f
    43d8:	2000                	fld	fs0,0(s0)
    43da:	00001c17          	auipc	s8,0x1
    43de:	17a8                	addi	a0,sp,1000
    43e0:	0000                	unimp
    43e2:	025a012b          	0x25a012b
    43e6:	0085                	addi	ra,ra,1
    43e8:	2a00                	fld	fs0,16(a2)
    43ea:	16ca                	slli	a3,a3,0x32
    43ec:	2000                	fld	fs0,0(s0)
    43ee:	1d2d                	addi	s10,s10,-21
    43f0:	0000                	unimp
    43f2:	000017bf 055a012b 	0x55a012b000017bf
    43fa:	00202403          	lw	s0,2(zero) # 2 <_prog_start-0x1ffffffe>
    43fe:	0020                	addi	s0,sp,8
    4400:	d82a                	sw	a0,48(sp)
    4402:	0016                	c.slli	zero,0x5
    4404:	2d20                	fld	fs0,88(a0)
    4406:	001d                	c.nop	7
    4408:	d600                	sw	s0,40(a2)
    440a:	2b000017          	auipc	zero,0x2b000
    440e:	5a01                	li	s4,-32
    4410:	0305                	addi	t1,t1,1
    4412:	2034                	fld	fa3,64(s0)
    4414:	2000                	fld	fs0,0(s0)
    4416:	2a00                	fld	fs0,16(a2)
    4418:	16f0                	addi	a2,sp,876
    441a:	2000                	fld	fs0,0(s0)
    441c:	00001d6f          	jal	s10,541c <_prog_start-0x1fffabe4>
    4420:	17f9                	addi	a5,a5,-2
    4422:	0000                	unimp
    4424:	055a012b          	0x55a012b
    4428:	00060803          	lb	a6,0(a2)
    442c:	2b80                	fld	fs0,16(a5)
    442e:	5b01                	li	s6,-32
    4430:	8502                	jr	a0
    4432:	2b00                	fld	fs0,16(a4)
    4434:	5c01                	li	s8,-32
    4436:	8702                	jr	a4
    4438:	0000                	unimp
    443a:	082a                	slli	a6,a6,0xa
    443c:	d0200017          	auipc	zero,0xd0200
    4440:	0d00001b          	0xd00001b
    4444:	0018                	0x18
    4446:	2b00                	fld	fs0,16(a4)
    4448:	5a01                	li	s4,-32
    444a:	8602                	jr	a2
    444c:	0000                	unimp
    444e:	222a                	fld	ft4,136(sp)
    4450:	2d200017          	auipc	zero,0x2d200
    4454:	001d                	c.nop	7
    4456:	2400                	fld	fs0,8(s0)
    4458:	0018                	0x18
    445a:	2b00                	fld	fs0,16(a4)
    445c:	5a01                	li	s4,-32
    445e:	0305                	addi	t1,t1,1
    4460:	20a4                	fld	fs1,64(s1)
    4462:	2000                	fld	fs0,0(s0)
    4464:	2a00                	fld	fs0,16(a2)
    4466:	1730                	addi	a2,sp,936
    4468:	2000                	fld	fs0,0(s0)
    446a:	1d2d                	addi	s10,s10,-21
    446c:	0000                	unimp
    446e:	0000183b          	0x183b
    4472:	055a012b          	0x55a012b
    4476:	00202803          	lw	a6,2(zero) # 2 <_prog_start-0x1ffffffe>
    447a:	0020                	addi	s0,sp,8
    447c:	3e2a                	fld	ft8,168(sp)
    447e:	2d200017          	auipc	zero,0x2d200
    4482:	001d                	c.nop	7
    4484:	5200                	lw	s0,32(a2)
    4486:	0018                	0x18
    4488:	2b00                	fld	fs0,16(a4)
    448a:	5a01                	li	s4,-32
    448c:	0305                	addi	t1,t1,1
    448e:	2054                	fld	fa3,128(s0)
    4490:	2000                	fld	fs0,0(s0)
    4492:	2a00                	fld	fs0,16(a2)
    4494:	1742                	slli	a4,a4,0x30
    4496:	2000                	fld	fs0,0(s0)
    4498:	1bd0                	addi	a2,sp,500
    449a:	0000                	unimp
    449c:	1866                	slli	a6,a6,0x39
    449e:	0000                	unimp
    44a0:	025a012b          	0x25a012b
    44a4:	0086                	slli	ra,ra,0x1
    44a6:	2a00                	fld	fs0,16(a2)
    44a8:	1754                	addi	a3,sp,932
    44aa:	2000                	fld	fs0,0(s0)
    44ac:	1d2d                	addi	s10,s10,-21
    44ae:	0000                	unimp
    44b0:	187d                	addi	a6,a6,-1
    44b2:	0000                	unimp
    44b4:	055a012b          	0x55a012b
    44b8:	00205003          	lhu	zero,2(zero) # 2 <_prog_start-0x1ffffffe>
    44bc:	0020                	addi	s0,sp,8
    44be:	622a                	flw	ft4,136(sp)
    44c0:	2d200017          	auipc	zero,0x2d200
    44c4:	001d                	c.nop	7
    44c6:	9400                	0x9400
    44c8:	0018                	0x18
    44ca:	2b00                	fld	fs0,16(a4)
    44cc:	5a01                	li	s4,-32
    44ce:	0305                	addi	t1,t1,1
    44d0:	2078                	fld	fa4,192(s0)
    44d2:	2000                	fld	fs0,0(s0)
    44d4:	2c00                	fld	fs0,24(s0)
    44d6:	1772                	slli	a4,a4,0x3c
    44d8:	2000                	fld	fs0,0(s0)
    44da:	1d2d                	addi	s10,s10,-21
    44dc:	0000                	unimp
    44de:	055a012b          	0x55a012b
    44e2:	00208c03          	lb	s8,2(ra)
    44e6:	0020                	addi	s0,sp,8
    44e8:	3100                	fld	fs0,32(a0)
    44ea:	00000c6b          	0xc6b
    44ee:	5101                	li	sp,-32
    44f0:	00000073          	ecall
    44f4:	141c                	addi	a5,sp,544
    44f6:	2000                	fld	fs0,0(s0)
    44f8:	01d0                	addi	a2,sp,196
    44fa:	0000                	unimp
    44fc:	9c01                	0x9c01
    44fe:	1b12                	slli	s6,s6,0x24
    4500:	0000                	unimp
    4502:	e332                	fsw	fa2,132(sp)
    4504:	000a                	c.slli	zero,0x2
    4506:	0100                	addi	s0,sp,128
    4508:	2151                	jal	498c <_prog_start-0x1fffb674>
    450a:	0011                	c.nop	4
    450c:	0b00                	addi	s0,sp,400
    450e:	0019                	c.nop	6
    4510:	3200                	fld	fs0,32(a2)
    4512:	00000c77          	0xc77
    4516:	5101                	li	sp,-32
    4518:	0144                	addi	s1,sp,132
    451a:	0000                	unimp
    451c:	1958                	addi	a4,sp,180
    451e:	0000                	unimp
    4520:	01006933          	or	s2,zero,a6
    4524:	00007353          	fadd.s	ft6,ft0,ft0
    4528:	9200                	0x9200
    452a:	0019                	c.nop	6
    452c:	3b00                	fld	fs0,48(a4)
    452e:	1488                	addi	a0,sp,608
    4530:	2000                	fld	fs0,0(s0)
    4532:	0034                	addi	a3,sp,8
    4534:	0000                	unimp
    4536:	00001977          	0x1977
    453a:	01006a33          	or	s4,zero,a6
    453e:	736a                	flw	ft6,184(sp)
    4540:	0000                	unimp
    4542:	7f00                	flw	fs0,56(a4)
    4544:	001a                	c.slli	zero,0x6
    4546:	3600                	fld	fs0,40(a2)
    4548:	1b12                	slli	s6,s6,0x24
    454a:	0000                	unimp
    454c:	14b2                	slli	s1,s1,0x2c
    454e:	2000                	fld	fs0,0(s0)
    4550:	0008                	0x8
    4552:	0000                	unimp
    4554:	6d01                	0x6d01
    4556:	1950                	addi	a2,sp,180
    4558:	0000                	unimp
    455a:	001b3837          	lui	a6,0x1b3
    455e:	a500                	fsd	fs0,8(a0)
    4560:	001a                	c.slli	zero,0x6
    4562:	3700                	fld	fs0,40(a4)
    4564:	1b2d                	addi	s6,s6,-21
    4566:	0000                	unimp
    4568:	1ab9                	addi	s5,s5,-18
    456a:	0000                	unimp
    456c:	001b2237          	lui	tp,0x1b2
    4570:	cd00                	sw	s0,24(a0)
    4572:	001a                	c.slli	zero,0x6
    4574:	2c00                	fld	fs0,24(s0)
    4576:	14ba                	slli	s1,s1,0x2e
    4578:	2000                	fld	fs0,0(s0)
    457a:	1b44                	addi	s1,sp,436
    457c:	0000                	unimp
    457e:	025a012b          	0x25a012b
    4582:	0084                	addi	s1,sp,64
    4584:	015b012b          	0x15b012b
    4588:	2b34                	fld	fa3,80(a4)
    458a:	5c01                	li	s8,-32
    458c:	8602                	jr	a2
    458e:	0000                	unimp
    4590:	2a00                	fld	fs0,16(a2)
    4592:	1496                	slli	s1,s1,0x25
    4594:	2000                	fld	fs0,0(s0)
    4596:	1bd0                	addi	a2,sp,500
    4598:	0000                	unimp
    459a:	00001963          	bnez	zero,45ac <_prog_start-0x1fffba54>
    459e:	015a012b          	0x15a012b
    45a2:	003a                	c.slli	zero,0xe
    45a4:	b22c                	fsd	fa1,96(a2)
    45a6:	0014                	0x14
    45a8:	2d20                	fld	fs0,88(a0)
    45aa:	001d                	c.nop	7
    45ac:	2b00                	fld	fs0,16(a4)
    45ae:	5a01                	li	s4,-32
    45b0:	0305                	addi	t1,t1,1
    45b2:	1f88                	addi	a0,sp,1008
    45b4:	2000                	fld	fs0,0(s0)
    45b6:	0000                	unimp
    45b8:	1236                	slli	tp,tp,0x2d
    45ba:	7800001b          	0x7800001b
    45be:	0014                	0x14
    45c0:	0820                	addi	s0,sp,24
    45c2:	0000                	unimp
    45c4:	0100                	addi	s0,sp,128
    45c6:	c066                	sw	s9,0(sp)
    45c8:	0019                	c.nop	6
    45ca:	3700                	fld	fs0,40(a4)
    45cc:	1b38                	addi	a4,sp,440
    45ce:	0000                	unimp
    45d0:	1ae0                	addi	s0,sp,380
    45d2:	0000                	unimp
    45d4:	001b2d37          	lui	s10,0x1b2
    45d8:	f400                	fsw	fs0,40(s0)
    45da:	001a                	c.slli	zero,0x6
    45dc:	3700                	fld	fs0,40(a4)
    45de:	1b22                	slli	s6,s6,0x28
    45e0:	0000                	unimp
    45e2:	1b08                	addi	a0,sp,432
    45e4:	0000                	unimp
    45e6:	802c                	0x802c
    45e8:	0014                	0x14
    45ea:	4420                	lw	s0,72(s0)
    45ec:	2b00001b          	0x2b00001b
    45f0:	5a01                	li	s4,-32
    45f2:	8402                	jr	s0
    45f4:	2b00                	fld	fs0,16(a4)
    45f6:	5b01                	li	s6,-32
    45f8:	3401                	jal	3ff8 <_prog_start-0x1fffc008>
    45fa:	015c012b          	0x15c012b
    45fe:	0031                	c.nop	12
    4600:	2a00                	fld	fs0,16(a2)
    4602:	146c                	addi	a1,sp,556
    4604:	2000                	fld	fs0,0(s0)
    4606:	1bd0                	addi	a2,sp,500
    4608:	0000                	unimp
    460a:	000019d3          	fadd.s	fs3,ft0,ft0,rtz
    460e:	015a012b          	0x15a012b
    4612:	003a                	c.slli	zero,0xe
    4614:	842a                	mv	s0,a0
    4616:	0014                	0x14
    4618:	d020                	sw	s0,96(s0)
    461a:	e600001b          	0xe600001b
    461e:	0019                	c.nop	6
    4620:	2b00                	fld	fs0,16(a4)
    4622:	5a01                	li	s4,-32
    4624:	3a01                	jal	3f34 <_prog_start-0x1fffc0cc>
    4626:	2a00                	fld	fs0,16(a2)
    4628:	14c0                	addi	s0,sp,612
    462a:	2000                	fld	fs0,0(s0)
    462c:	1bd0                	addi	a2,sp,500
    462e:	0000                	unimp
    4630:	19f9                	addi	s3,s3,-2
    4632:	0000                	unimp
    4634:	015a012b          	0x15a012b
    4638:	003a                	c.slli	zero,0xe
    463a:	ec38                	fsw	fa4,88(s0)
    463c:	0014                	0x14
    463e:	5b20                	lw	s0,112(a4)
    4640:	001c                	0x1c
    4642:	3800                	fld	fs0,48(s0)
    4644:	14f2                	slli	s1,s1,0x3c
    4646:	2000                	fld	fs0,0(s0)
    4648:	00001c5b          	0x1c5b
    464c:	f838                	fsw	fa4,112(s0)
    464e:	0014                	0x14
    4650:	5b20                	lw	s0,112(a4)
    4652:	001c                	0x1c
    4654:	3800                	fld	fs0,48(s0)
    4656:	14fe                	slli	s1,s1,0x3f
    4658:	2000                	fld	fs0,0(s0)
    465a:	00001c5b          	0x1c5b
    465e:	2a2a                	fld	fs4,136(sp)
    4660:	0015                	c.nop	5
    4662:	2d20                	fld	fs0,88(a0)
    4664:	001d                	c.nop	7
    4666:	3400                	fld	fs0,40(s0)
    4668:	001a                	c.slli	zero,0x6
    466a:	2b00                	fld	fs0,16(a4)
    466c:	5a01                	li	s4,-32
    466e:	0305                	addi	t1,t1,1
    4670:	1f74                	addi	a3,sp,956
    4672:	2000                	fld	fs0,0(s0)
    4674:	2a00                	fld	fs0,16(a2)
    4676:	1542                	slli	a0,a0,0x30
    4678:	2000                	fld	fs0,0(s0)
    467a:	1d2d                	addi	s10,s10,-21
    467c:	0000                	unimp
    467e:	00001a4b          	fnmsub.s	fs4,ft0,ft0,ft0,rtz
    4682:	055a012b          	0x55a012b
    4686:	001fd803          	lhu	a6,1(t6)
    468a:	0020                	addi	s0,sp,8
    468c:	582a                	lw	a6,168(sp)
    468e:	0015                	c.nop	5
    4690:	2d20                	fld	fs0,88(a0)
    4692:	001d                	c.nop	7
    4694:	6200                	flw	fs0,0(a2)
    4696:	001a                	c.slli	zero,0x6
    4698:	2b00                	fld	fs0,16(a4)
    469a:	5a01                	li	s4,-32
    469c:	0305                	addi	t1,t1,1
    469e:	1fec                	addi	a1,sp,1020
    46a0:	2000                	fld	fs0,0(s0)
    46a2:	3800                	fld	fs0,48(s0)
    46a4:	1564                	addi	s1,sp,684
    46a6:	2000                	fld	fs0,0(s0)
    46a8:	00001c5b          	0x1c5b
    46ac:	742a                	flw	fs0,168(sp)
    46ae:	0015                	c.nop	5
    46b0:	2d20                	fld	fs0,88(a0)
    46b2:	001d                	c.nop	7
    46b4:	8200                	0x8200
    46b6:	001a                	c.slli	zero,0x6
    46b8:	2b00                	fld	fs0,16(a4)
    46ba:	5a01                	li	s4,-32
    46bc:	0305                	addi	t1,t1,1
    46be:	1fd4                	addi	a3,sp,1012
    46c0:	2000                	fld	fs0,0(s0)
    46c2:	2a00                	fld	fs0,16(a2)
    46c4:	1582                	slli	a1,a1,0x20
    46c6:	2000                	fld	fs0,0(s0)
    46c8:	1d2d                	addi	s10,s10,-21
    46ca:	0000                	unimp
    46cc:	1a99                	addi	s5,s5,-26
    46ce:	0000                	unimp
    46d0:	055a012b          	0x55a012b
    46d4:	001f4c03          	lbu	s8,1(t5)
    46d8:	0020                	addi	s0,sp,8
    46da:	902a                	c.add	zero,a0
    46dc:	0015                	c.nop	5
    46de:	2d20                	fld	fs0,88(a0)
    46e0:	001d                	c.nop	7
    46e2:	b000                	fsd	fs0,32(s0)
    46e4:	001a                	c.slli	zero,0x6
    46e6:	2b00                	fld	fs0,16(a4)
    46e8:	5a01                	li	s4,-32
    46ea:	0305                	addi	t1,t1,1
    46ec:	1f3c                	addi	a5,sp,952
    46ee:	2000                	fld	fs0,0(s0)
    46f0:	3800                	fld	fs0,48(s0)
    46f2:	159e                	slli	a1,a1,0x27
    46f4:	2000                	fld	fs0,0(s0)
    46f6:	00001c5b          	0x1c5b
    46fa:	ae2a                	fsd	fa0,280(sp)
    46fc:	0015                	c.nop	5
    46fe:	2d20                	fld	fs0,88(a0)
    4700:	001d                	c.nop	7
    4702:	d000                	sw	s0,32(s0)
    4704:	001a                	c.slli	zero,0x6
    4706:	2b00                	fld	fs0,16(a4)
    4708:	5a01                	li	s4,-32
    470a:	0305                	addi	t1,t1,1
    470c:	1fd4                	addi	a3,sp,1012
    470e:	2000                	fld	fs0,0(s0)
    4710:	2a00                	fld	fs0,16(a2)
    4712:	15bc                	addi	a5,sp,744
    4714:	2000                	fld	fs0,0(s0)
    4716:	1d2d                	addi	s10,s10,-21
    4718:	0000                	unimp
    471a:	00001ae7          	0x1ae7
    471e:	055a012b          	0x55a012b
    4722:	001fb003          	0x1fb003
    4726:	0020                	addi	s0,sp,8
    4728:	d42a                	sw	a0,40(sp)
    472a:	0015                	c.nop	5
    472c:	2d20                	fld	fs0,88(a0)
    472e:	001d                	c.nop	7
    4730:	fe00                	fsw	fs0,56(a2)
    4732:	001a                	c.slli	zero,0x6
    4734:	2b00                	fld	fs0,16(a4)
    4736:	5a01                	li	s4,-32
    4738:	0305                	addi	t1,t1,1
    473a:	2010                	fld	fa2,0(s0)
    473c:	2000                	fld	fs0,0(s0)
    473e:	2c00                	fld	fs0,24(s0)
    4740:	15e6                	slli	a1,a1,0x39
    4742:	2000                	fld	fs0,0(s0)
    4744:	1d2d                	addi	s10,s10,-21
    4746:	0000                	unimp
    4748:	055a012b          	0x55a012b
    474c:	001ffc03          	0x1ffc03
    4750:	0020                	addi	s0,sp,8
    4752:	3c00                	fld	fs0,56(s0)
    4754:	0c5c                	addi	a5,sp,532
    4756:	0000                	unimp
    4758:	4a01                	li	s4,0
    475a:	00000073          	ecall
    475e:	4401                	li	s0,0
    4760:	3d00001b          	0x3d00001b
    4764:	00000ae3          	beqz	zero,4f78 <_prog_start-0x1fffb088>
    4768:	4a01                	li	s4,0
    476a:	1121                	addi	sp,sp,-24
    476c:	0000                	unimp
    476e:	a33d                	j	4c9c <_prog_start-0x1fffb364>
    4770:	0100000b          	0x100000b
    4774:	734a                	flw	ft6,176(sp)
    4776:	0000                	unimp
    4778:	3d00                	fld	fs0,56(a0)
    477a:	0bca                	slli	s7,s7,0x12
    477c:	0000                	unimp
    477e:	4a01                	li	s4,0
    4780:	00000073          	ecall
    4784:	3100                	fld	fs0,32(a0)
    4786:	0c18                	addi	a4,sp,528
    4788:	0000                	unimp
    478a:	2b01                	jal	4c9a <_prog_start-0x1fffb366>
    478c:	00000073          	ecall
    4790:	139e                	slli	t2,t2,0x27
    4792:	2000                	fld	fs0,0(s0)
    4794:	0070                	addi	a2,sp,12
    4796:	0000                	unimp
    4798:	9c01                	0x9c01
    479a:	1bd0                	addi	a2,sp,500
    479c:	0000                	unimp
    479e:	e332                	fsw	fa2,132(sp)
    47a0:	000a                	c.slli	zero,0x2
    47a2:	0100                	addi	s0,sp,128
    47a4:	0011212b          	0x11212b
    47a8:	1b00                	addi	s0,sp,432
    47aa:	3200001b          	0x3200001b
    47ae:	00000ba3          	sb	zero,23(zero) # 17 <_prog_start-0x1fffffe9>
    47b2:	2b01                	jal	4cc2 <_prog_start-0x1fffb33e>
    47b4:	00000073          	ecall
    47b8:	1b52                	slli	s6,s6,0x34
    47ba:	0000                	unimp
    47bc:	ca32                	sw	a2,20(sp)
    47be:	0100000b          	0x100000b
    47c2:	0000732b          	0x732b
    47c6:	8900                	0x8900
    47c8:	3300001b          	0x3300001b
    47cc:	0069                	c.nop	26
    47ce:	2d01                	jal	4dde <_prog_start-0x1fffb222>
    47d0:	00000073          	ecall
    47d4:	1baa                	slli	s7,s7,0x2a
    47d6:	0000                	unimp
    47d8:	006e6933          	or	s2,t3,t1
    47dc:	2e01                	jal	4aec <_prog_start-0x1fffb514>
    47de:	0081                	addi	ra,ra,0
    47e0:	0000                	unimp
    47e2:	1c0a                	slli	s8,s8,0x22
    47e4:	0000                	unimp
    47e6:	0013da3b          	0x13da3b
    47ea:	0620                	addi	s0,sp,776
    47ec:	0000                	unimp
    47ee:	c000                	sw	s0,0(s0)
    47f0:	3300001b          	0x3300001b
    47f4:	006a                	c.slli	zero,0x1a
    47f6:	3e01                	jal	4306 <_prog_start-0x1fffbcfa>
    47f8:	00000073          	ecall
    47fc:	1c1d                	addi	s8,s8,-25
    47fe:	0000                	unimp
    4800:	2c00                	fld	fs0,24(s0)
    4802:	13b0                	addi	a2,sp,488
    4804:	2000                	fld	fs0,0(s0)
    4806:	1d59                	addi	s10,s10,-10
    4808:	0000                	unimp
    480a:	015a012b          	0x15a012b
    480e:	0035                	c.nop	13
    4810:	3100                	fld	fs0,32(a0)
    4812:	0bb6                	slli	s7,s7,0xd
    4814:	0000                	unimp
    4816:	2101                	jal	4c16 <_prog_start-0x1fffb3ea>
    4818:	00000073          	ecall
    481c:	1350                	addi	a2,sp,420
    481e:	2000                	fld	fs0,0(s0)
    4820:	004e                	c.slli	zero,0x13
    4822:	0000                	unimp
    4824:	9c01                	0x9c01
    4826:	00001c17          	auipc	s8,0x1
    482a:	3232                	fld	ft4,296(sp)
    482c:	000c                	0xc
    482e:	0100                	addi	s0,sp,128
    4830:	7321                	lui	t1,0xfffe8
    4832:	0000                	unimp
    4834:	5200                	lw	s0,32(a2)
    4836:	001c                	0x1c
    4838:	3300                	fld	fs0,32(a4)
    483a:	6470                	flw	fa2,76(s0)
    483c:	0071                	c.nop	28
    483e:	2401                	jal	4a3e <_prog_start-0x1fffb5c2>
    4840:	00000073          	ecall
    4844:	1c7e                	slli	s8,s8,0x3f
    4846:	0000                	unimp
    4848:	7e2c                	flw	fa1,120(a2)
    484a:	59200013          	li	zero,1426
    484e:	001d                	c.nop	7
    4850:	2b00                	fld	fs0,16(a4)
    4852:	5a01                	li	s4,-32
    4854:	3a01                	jal	4164 <_prog_start-0x1fffbe9c>
    4856:	0000                	unimp
    4858:	423e                	lw	tp,204(sp)
    485a:	000c                	0xc
    485c:	0100                	addi	s0,sp,128
    485e:	0e18                	addi	a4,sp,784
    4860:	42200013          	li	zero,1058
    4864:	0000                	unimp
    4866:	0100                	addi	s0,sp,128
    4868:	5b9c                	lw	a5,48(a5)
    486a:	001c                	0x1c
    486c:	3200                	fld	fs0,32(a2)
    486e:	0bd6                	slli	s7,s7,0x15
    4870:	0000                	unimp
    4872:	1801                	addi	a6,a6,-32
    4874:	013e                	slli	sp,sp,0xf
    4876:	0000                	unimp
    4878:	1c9d                	addi	s9,s9,-25
    487a:	0000                	unimp
    487c:	01006933          	or	s2,zero,a6
    4880:	7319                	lui	t1,0xfffe6
    4882:	0000                	unimp
    4884:	c900                	sw	s0,16(a0)
    4886:	001c                	0x1c
    4888:	3800                	fld	fs0,48(s0)
    488a:	1328                	addi	a0,sp,424
    488c:	2000                	fld	fs0,0(s0)
    488e:	1d7a                	slli	s10,s10,0x3e
    4890:	0000                	unimp
    4892:	4038                	lw	a4,64(s0)
    4894:	4e200013          	li	zero,1250
    4898:	001d                	c.nop	7
    489a:	0000                	unimp
    489c:	000c563f 010f0100 	0x10f0100000c563f
    48a4:	1c71                	addi	s8,s8,-4
    48a6:	0000                	unimp
    48a8:	6340                	flw	fs0,4(a4)
    48aa:	0100                	addi	s0,sp,128
    48ac:	0001440f          	0x1440f
    48b0:	0000                	unimp
    48b2:	5b41                	li	s6,-16
    48b4:	001c                	0x1c
    48b6:	d800                	sw	s0,48(s0)
    48b8:	0012                	c.slli	zero,0x4
    48ba:	3620                	fld	fs0,104(a2)
    48bc:	0000                	unimp
    48be:	0100                	addi	s0,sp,128
    48c0:	df9c                	sw	a5,56(a5)
    48c2:	001c                	0x1c
    48c4:	3700                	fld	fs0,40(a4)
    48c6:	00001c67          	0x1c67
    48ca:	1d0d                	addi	s10,s10,-29
    48cc:	0000                	unimp
    48ce:	5b42                	lw	s6,48(sp)
    48d0:	001c                	0x1c
    48d2:	b800                	fsd	fs0,48(s0)
    48d4:	0002                	c.slli64	zero
    48d6:	d500                	sw	s0,40(a0)
    48d8:	001c                	0x1c
    48da:	3700                	fld	fs0,40(a4)
    48dc:	00001c67          	0x1c67
    48e0:	1d2e                	slli	s10,s10,0x2b
    48e2:	0000                	unimp
    48e4:	fa2a                	fsw	fa0,52(sp)
    48e6:	0012                	c.slli	zero,0x4
    48e8:	4e20                	lw	s0,88(a2)
    48ea:	001d                	c.nop	7
    48ec:	b700                	fsd	fs0,40(a4)
    48ee:	001c                	0x1c
    48f0:	2b00                	fld	fs0,16(a4)
    48f2:	5a01                	li	s4,-32
    48f4:	0802                	c.slli64	a6
    48f6:	002a0023          	sb	sp,0(s4) # fffe2000 <_sp+0x7ffde000>
    48fa:	43200013          	li	zero,1074
    48fe:	001d                	c.nop	7
    4900:	cb00                	sw	s0,16(a4)
    4902:	001c                	0x1c
    4904:	2b00                	fld	fs0,16(a4)
    4906:	5a01                	li	s4,-32
    4908:	7802                	flw	fa6,32(sp)
    490a:	0000                	unimp
    490c:	00130e43          	fmadd.s	ft8,ft6,ft1,ft0,rne
    4910:	4e20                	lw	s0,88(a2)
    4912:	001d                	c.nop	7
    4914:	0000                	unimp
    4916:	e438                	fsw	fa4,72(s0)
    4918:	0012                	c.slli	zero,0x4
    491a:	7a20                	flw	fs0,112(a2)
    491c:	001d                	c.nop	7
    491e:	0000                	unimp
    4920:	1241                	addi	tp,tp,-16
    4922:	0e00001b          	0xe00001b
    4926:	0014                	0x14
    4928:	0e20                	addi	s0,sp,792
    492a:	0000                	unimp
    492c:	0100                	addi	s0,sp,128
    492e:	2d9c                	fld	fa5,24(a1)
    4930:	001d                	c.nop	7
    4932:	3700                	fld	fs0,40(a4)
    4934:	1b22                	slli	s6,s6,0x28
    4936:	0000                	unimp
    4938:	1d41                	addi	s10,s10,-16
    493a:	0000                	unimp
    493c:	001b2d37          	lui	s10,0x1b2
    4940:	6200                	flw	fs0,0(a2)
    4942:	001d                	c.nop	7
    4944:	3700                	fld	fs0,40(a4)
    4946:	1b38                	addi	a4,sp,440
    4948:	0000                	unimp
    494a:	00001d83          	lh	s11,0(zero) # 0 <_prog_start-0x20000000>
    494e:	142c                	addi	a1,sp,552
    4950:	0014                	0x14
    4952:	4420                	lw	s0,72(s0)
    4954:	2b00001b          	0x2b00001b
    4958:	5a01                	li	s4,-32
    495a:	5a01f303          	0x5a01f303
    495e:	035b012b          	0x35b012b
    4962:	2b5b01f3          	0x2b5b01f3
    4966:	5c01                	li	s8,-32
    4968:	5c01f303          	0x5c01f303
    496c:	0000                	unimp
    496e:	b344                	fsd	fs1,160(a4)
    4970:	0006                	c.slli	zero,0x1
    4972:	b300                	fsd	fs0,32(a4)
    4974:	0006                	c.slli	zero,0x1
    4976:	0a00                	addi	s0,sp,272
    4978:	4410                	lw	a2,8(s0)
    497a:	00000b9b          	0xb9b
    497e:	00000b9b          	0xb9b
    4982:	270c                	fld	fa1,8(a4)
    4984:	c644                	sw	s1,12(a2)
    4986:	0006                	c.slli	zero,0x1
    4988:	c600                	sw	s0,8(a2)
    498a:	0006                	c.slli	zero,0x1
    498c:	0a00                	addi	s0,sp,272
    498e:	4411                	li	s0,4
    4990:	0699                	addi	a3,a3,6
    4992:	0000                	unimp
    4994:	0699                	addi	a3,a3,6
    4996:	0000                	unimp
    4998:	0a0a                	slli	s4,s4,0x2
    499a:	5244                	lw	s1,36(a2)
    499c:	0008                	0x8
    499e:	5200                	lw	s0,32(a2)
    49a0:	0008                	0x8
    49a2:	0a00                	addi	s0,sp,272
    49a4:	4416                	lw	s0,68(sp)
    49a6:	0b94                	addi	a3,sp,464
    49a8:	0000                	unimp
    49aa:	0b94                	addi	a3,sp,464
    49ac:	0000                	unimp
    49ae:	250c                	fld	fa1,8(a0)
    49b0:	ed44                	fsw	fs1,28(a0)
    49b2:	ed00000b          	0xed00000b
    49b6:	0c00000b          	0xc00000b
    49ba:	4428                	lw	a0,72(s0)
    49bc:	0c7f                	0xc7f
    49be:	0000                	unimp
    49c0:	0c7f                	0xc7f
    49c2:	0000                	unimp
    49c4:	4509                	li	a0,2
    49c6:	2200                	fld	fs0,0(a2)
    49c8:	0000                	unimp
    49ca:	0200                	addi	s0,sp,256
    49cc:	0100                	addi	s0,sp,128
    49ce:	000d                	c.nop	3
    49d0:	0400                	addi	s0,sp,512
    49d2:	1d01                	addi	s10,s10,-32
    49d4:	0024                	addi	s1,sp,8
    49d6:	0000                	unimp
    49d8:	0000                	unimp
    49da:	1220                	addi	s0,sp,296
    49dc:	0002                	c.slli64	zero
    49de:	9220                	0x9220
    49e0:	000c                	0xc
    49e2:	2900                	fld	fs0,16(a0)
    49e4:	0002                	c.slli64	zero
    49e6:	ce00                	sw	s0,24(a2)
    49e8:	000c                	0xc
    49ea:	0100                	addi	s0,sp,128
    49ec:	80              	Address 0x00000000000049ec is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	1101                	addi	sp,sp,-32
   2:	2501                	jal	602 <_prog_start-0x1ffff9fe>
   4:	130e                	slli	t1,t1,0x23
   6:	1b0e030b          	0x1b0e030b
   a:	550e                	lw	a0,224(sp)
   c:	10011117          	auipc	sp,0x10011
  10:	02000017          	auipc	zero,0x2000
  14:	0024                	addi	s1,sp,8
  16:	0b3e0b0b          	0xb3e0b0b
  1a:	00000e03          	lb	t3,0(zero) # 0 <_prog_start-0x20000000>
  1e:	03001603          	lh	a2,48(zero) # 30 <_prog_start-0x1fffffd0>
  22:	3a0e                	fld	fs4,224(sp)
  24:	490b3b0b          	0x490b3b0b
  28:	04000013          	li	zero,64
  2c:	0024                	addi	s1,sp,8
  2e:	0b3e0b0b          	0xb3e0b0b
  32:	00000803          	lb	a6,0(zero) # 0 <_prog_start-0x20000000>
  36:	3505                	jal	fffffe56 <_sp+0x7fffbe56>
  38:	4900                	lw	s0,16(a0)
  3a:	06000013          	li	zero,96
  3e:	0026                	c.slli	zero,0x9
  40:	1349                	addi	t1,t1,-14
  42:	0000                	unimp
  44:	03003407          	fld	fs0,48(zero) # 30 <_prog_start-0x1fffffd0>
  48:	3a0e                	fld	fs4,224(sp)
  4a:	490b3b0b          	0x490b3b0b
  4e:	3c193f13          	sltiu	t5,s2,961
  52:	0019                	c.nop	6
  54:	0800                	addi	s0,sp,16
  56:	0016                	c.slli	zero,0x5
  58:	0b3a0e03          	lb	t3,179(s4)
  5c:	1349053b          	0x1349053b
  60:	0000                	unimp
  62:	1709                	addi	a4,a4,-30
  64:	0b01                	addi	s6,s6,0
  66:	3b0b3a0b          	0x3b0b3a0b
  6a:	0013010b          	0x13010b
  6e:	0a00                	addi	s0,sp,272
  70:	000d                	c.nop	3
  72:	0b3a0e03          	lb	t3,179(s4)
  76:	13490b3b          	0x13490b3b
  7a:	0000                	unimp
  7c:	4901010b          	0x4901010b
  80:	00130113          	addi	sp,t1,1 # fffe6001 <_sp+0x7ffe2001>
  84:	0c00                	addi	s0,sp,528
  86:	0021                	c.nop	8
  88:	1349                	addi	t1,t1,-14
  8a:	00000b2f          	0xb2f
  8e:	130d                	addi	t1,t1,-29
  90:	0b01                	addi	s6,s6,0
  92:	3b0b3a0b          	0x3b0b3a0b
  96:	0013010b          	0x13010b
  9a:	0e00                	addi	s0,sp,784
  9c:	000d                	c.nop	3
  9e:	0b3a0e03          	lb	t3,179(s4)
  a2:	13490b3b          	0x13490b3b
  a6:	0b38                	addi	a4,sp,408
  a8:	0000                	unimp
  aa:	0b000f0f          	0xb000f0f
  ae:	1000000b          	0x1000000b
  b2:	0b0b000f          	0xb0b000f
  b6:	1349                	addi	t1,t1,-14
  b8:	0000                	unimp
  ba:	1311                	addi	t1,t1,-28
  bc:	0301                	addi	t1,t1,0
  be:	0b0e                	slli	s6,s6,0x3
  c0:	3b0b3a0b          	0x3b0b3a0b
  c4:	0013010b          	0x13010b
  c8:	1200                	addi	s0,sp,288
  ca:	000d                	c.nop	3
  cc:	0b3a0803          	lb	a6,179(s4)
  d0:	13490b3b          	0x13490b3b
  d4:	0b38                	addi	a4,sp,408
  d6:	0000                	unimp
  d8:	03011313          	slli	t1,sp,0x30
  dc:	0b0e                	slli	s6,s6,0x3
  de:	3a05                	jal	fffffa0e <_sp+0x7fffba0e>
  e0:	010b3b0b          	0x10b3b0b
  e4:	14000013          	li	zero,320
  e8:	000d                	c.nop	3
  ea:	0b3a0e03          	lb	t3,179(s4)
  ee:	13490b3b          	0x13490b3b
  f2:	0538                	addi	a4,sp,648
  f4:	0000                	unimp
  f6:	1515                	addi	a0,a0,-27
  f8:	2700                	fld	fs0,8(a4)
  fa:	0019                	c.nop	6
  fc:	1600                	addi	s0,sp,800
  fe:	0115                	addi	sp,sp,5
 100:	13491927          	0x13491927
 104:	1301                	addi	t1,t1,-32
 106:	0000                	unimp
 108:	49000517          	auipc	a0,0x49000
 10c:	18000013          	li	zero,384
 110:	0e030113          	addi	sp,t1,224
 114:	0b3a050b          	0xb3a050b
 118:	1301053b          	0x1301053b
 11c:	0000                	unimp
 11e:	0d19                	addi	s10,s10,6
 120:	0300                	addi	s0,sp,384
 122:	3a0e                	fld	fs4,224(sp)
 124:	49053b0b          	0x49053b0b
 128:	000b3813          	sltiu	a6,s6,0
 12c:	1a00                	addi	s0,sp,304
 12e:	000d                	c.nop	3
 130:	0b3a0e03          	lb	t3,179(s4)
 134:	1349053b          	0x1349053b
 138:	0538                	addi	a4,sp,648
 13a:	0000                	unimp
 13c:	0301131b          	0x301131b
 140:	0b0e                	slli	s6,s6,0x3
 142:	3b0b3a0b          	0x3b0b3a0b
 146:	0105                	addi	sp,sp,1
 148:	1c000013          	li	zero,448
 14c:	0b0b0113          	addi	sp,s6,176
 150:	0b3a                	slli	s6,s6,0xe
 152:	1301053b          	0x1301053b
 156:	0000                	unimp
 158:	171d                	addi	a4,a4,-25
 15a:	0b01                	addi	s6,s6,0
 15c:	3b0b3a0b          	0x3b0b3a0b
 160:	0105                	addi	sp,sp,1
 162:	1e000013          	li	zero,480
 166:	000d                	c.nop	3
 168:	0b3a0e03          	lb	t3,179(s4)
 16c:	1349053b          	0x1349053b
 170:	0000                	unimp
 172:	131f 0300 3c0e      	0x3c0e0300131f
 178:	0019                	c.nop	6
 17a:	2000                	fld	fs0,0(s0)
 17c:	0115                	addi	sp,sp,5
 17e:	13011927          	0x13011927
 182:	0000                	unimp
 184:	3421                	jal	fffffb8c <_sp+0x7fffbb8c>
 186:	0300                	addi	s0,sp,384
 188:	3a0e                	fld	fs4,224(sp)
 18a:	49053b0b          	0x49053b0b
 18e:	3c193f13          	sltiu	t5,s2,961
 192:	0019                	c.nop	6
 194:	2200                	fld	fs0,0(a2)
 196:	0021                	c.nop	8
 198:	0000                	unimp
 19a:	3f012e23          	sw	a6,1020(sp) # 10011408 <_prog_start-0xffeebf8>
 19e:	0319                	addi	t1,t1,6
 1a0:	3a0e                	fld	fs4,224(sp)
 1a2:	270b3b0b          	0x270b3b0b
 1a6:	4919                	li	s2,6
 1a8:	12011113          	0x12011113
 1ac:	4006                	0x4006
 1ae:	9718                	0x9718
 1b0:	1942                	slli	s2,s2,0x30
 1b2:	1301                	addi	t1,t1,-32
 1b4:	0000                	unimp
 1b6:	3424                	fld	fs1,104(s0)
 1b8:	0300                	addi	s0,sp,384
 1ba:	3a08                	fld	fa0,48(a2)
 1bc:	490b3b0b          	0x490b3b0b
 1c0:	00180213          	addi	tp,a6,1 # 1b3001 <_prog_start-0x1fe4cfff>
 1c4:	2500                	fld	fs0,8(a0)
 1c6:	0034                	addi	a3,sp,8
 1c8:	0b3a0e03          	lb	t3,179(s4)
 1cc:	13490b3b          	0x13490b3b
 1d0:	1802                	slli	a6,a6,0x20
 1d2:	0000                	unimp
 1d4:	3426                	fld	fs0,104(sp)
 1d6:	0300                	addi	s0,sp,384
 1d8:	3a0e                	fld	fs4,224(sp)
 1da:	490b3b0b          	0x490b3b0b
 1de:	00170213          	addi	tp,a4,1 # fffe0001 <_sp+0x7ffdc001>
 1e2:	2700                	fld	fs0,8(a4)
 1e4:	1755010b          	0x1755010b
 1e8:	1301                	addi	t1,t1,-32
 1ea:	0000                	unimp
 1ec:	8928                	0x8928
 1ee:	0182                	c.slli64	gp
 1f0:	1100                	addi	s0,sp,160
 1f2:	3101                	jal	fffffdf2 <_sp+0x7fffbdf2>
 1f4:	29000013          	li	zero,656
 1f8:	8289                	srli	a3,a3,0x2
 1fa:	0001                	nop
 1fc:	0111                	addi	sp,sp,4
 1fe:	00184293          	xori	t0,a6,1
 202:	2a00                	fld	fs0,16(a2)
 204:	002e                	c.slli	zero,0xb
 206:	193c193f 0e030e6e 	0xe030e6e193c193f
 20e:	0b3a                	slli	s6,s6,0xe
 210:	00000b3b          	0xb3b
 214:	0100                	addi	s0,sp,128
 216:	0111                	addi	sp,sp,4
 218:	0e25                	addi	t3,t3,9
 21a:	0e030b13          	addi	s6,t1,224
 21e:	01110e1b          	0x1110e1b
 222:	0612                	slli	a2,a2,0x4
 224:	1710                	addi	a2,sp,928
 226:	0000                	unimp
 228:	2402                	fld	fs0,0(sp)
 22a:	0b00                	addi	s0,sp,400
 22c:	030b3e0b          	0x30b3e0b
 230:	000e                	c.slli	zero,0x3
 232:	0300                	addi	s0,sp,384
 234:	0016                	c.slli	zero,0x5
 236:	0b3a0e03          	lb	t3,179(s4)
 23a:	13490b3b          	0x13490b3b
 23e:	0000                	unimp
 240:	2404                	fld	fs1,8(s0)
 242:	0b00                	addi	s0,sp,400
 244:	030b3e0b          	0x30b3e0b
 248:	0008                	0x8
 24a:	0500                	addi	s0,sp,640
 24c:	012e                	slli	sp,sp,0xb
 24e:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 256:	1349                	addi	t1,t1,-14
 258:	0111                	addi	sp,sp,4
 25a:	0612                	slli	a2,a2,0x4
 25c:	1840                	addi	s0,sp,52
 25e:	01194297          	auipc	t0,0x1194
 262:	06000013          	li	zero,96
 266:	8289                	srli	a3,a3,0x2
 268:	0101                	addi	sp,sp,0
 26a:	0111                	addi	sp,sp,4
 26c:	1331                	addi	t1,t1,-20
 26e:	0000                	unimp
 270:	01828a07          	0x1828a07
 274:	0200                	addi	s0,sp,256
 276:	9118                	0x9118
 278:	1842                	slli	a6,a6,0x30
 27a:	0000                	unimp
 27c:	2e08                	fld	fa0,24(a2)
 27e:	3f01                	jal	18e <_prog_start-0x1ffffe72>
 280:	0319                	addi	t1,t1,6
 282:	3a0e                	fld	fs4,224(sp)
 284:	270b3b0b          	0x270b3b0b
 288:	4919                	li	s2,6
 28a:	12011113          	0x12011113
 28e:	4006                	0x4006
 290:	9718                	0x9718
 292:	1942                	slli	s2,s2,0x30
 294:	1301                	addi	t1,t1,-32
 296:	0000                	unimp
 298:	0509                	addi	a0,a0,2
 29a:	0300                	addi	s0,sp,384
 29c:	3a08                	fld	fa0,48(a2)
 29e:	490b3b0b          	0x490b3b0b
 2a2:	00170213          	addi	tp,a4,1
 2a6:	0a00                	addi	s0,sp,272
 2a8:	0034                	addi	a3,sp,8
 2aa:	0b3a0803          	lb	a6,179(s4)
 2ae:	13490b3b          	0x13490b3b
 2b2:	1702                	slli	a4,a4,0x20
 2b4:	0000                	unimp
 2b6:	0182890b          	0x182890b
 2ba:	1101                	addi	sp,sp,-32
 2bc:	3101                	jal	fffffebc <_sp+0x7fffbebc>
 2be:	00130113          	addi	sp,t1,1
 2c2:	0c00                	addi	s0,sp,528
 2c4:	0034                	addi	a3,sp,8
 2c6:	0b3a0e03          	lb	t3,179(s4)
 2ca:	13490b3b          	0x13490b3b
 2ce:	061c                	addi	a5,sp,768
 2d0:	0000                	unimp
 2d2:	2e0d                	jal	604 <_prog_start-0x1ffff9fc>
 2d4:	3f01                	jal	1e4 <_prog_start-0x1ffffe1c>
 2d6:	0319                	addi	t1,t1,6
 2d8:	3a0e                	fld	fs4,224(sp)
 2da:	270b3b0b          	0x270b3b0b
 2de:	1119                	addi	sp,sp,-26
 2e0:	1201                	addi	tp,tp,-32
 2e2:	4006                	0x4006
 2e4:	9718                	0x9718
 2e6:	1942                	slli	s2,s2,0x30
 2e8:	0000                	unimp
 2ea:	0100                	addi	s0,sp,128
 2ec:	0111                	addi	sp,sp,4
 2ee:	0e25                	addi	t3,t3,9
 2f0:	0e030b13          	addi	s6,t1,224
 2f4:	01110e1b          	0x1110e1b
 2f8:	0612                	slli	a2,a2,0x4
 2fa:	1710                	addi	a2,sp,928
 2fc:	0000                	unimp
 2fe:	2402                	fld	fs0,0(sp)
 300:	0b00                	addi	s0,sp,400
 302:	030b3e0b          	0x30b3e0b
 306:	000e                	c.slli	zero,0x3
 308:	0300                	addi	s0,sp,384
 30a:	0016                	c.slli	zero,0x5
 30c:	0b3a0e03          	lb	t3,179(s4)
 310:	13490b3b          	0x13490b3b
 314:	0000                	unimp
 316:	2404                	fld	fs1,8(s0)
 318:	0b00                	addi	s0,sp,400
 31a:	030b3e0b          	0x30b3e0b
 31e:	0008                	0x8
 320:	0500                	addi	s0,sp,640
 322:	0035                	c.nop	13
 324:	1349                	addi	t1,t1,-14
 326:	0000                	unimp
 328:	2606                	fld	fa2,64(sp)
 32a:	4900                	lw	s0,16(a0)
 32c:	07000013          	li	zero,112
 330:	0b0b000f          	0xb0b000f
 334:	1349                	addi	t1,t1,-14
 336:	0000                	unimp
 338:	3408                	fld	fa0,40(s0)
 33a:	0300                	addi	s0,sp,384
 33c:	3a0e                	fld	fs4,224(sp)
 33e:	490b3b0b          	0x490b3b0b
 342:	3c193f13          	sltiu	t5,s2,961
 346:	0019                	c.nop	6
 348:	0900                	addi	s0,sp,144
 34a:	0034                	addi	a3,sp,8
 34c:	0b3a0e03          	lb	t3,179(s4)
 350:	13490b3b          	0x13490b3b
 354:	1802193f 2e0a0000 	0x2e0a00001802193f
 35c:	3f01                	jal	26c <_prog_start-0x1ffffd94>
 35e:	0319                	addi	t1,t1,6
 360:	3a0e                	fld	fs4,224(sp)
 362:	11053b0b          	0x11053b0b
 366:	1201                	addi	tp,tp,-32
 368:	4006                	0x4006
 36a:	9718                	0x9718
 36c:	1942                	slli	s2,s2,0x30
 36e:	1301                	addi	t1,t1,-32
 370:	0000                	unimp
 372:	0300340b          	0x300340b
 376:	3a08                	fld	fa0,48(a2)
 378:	49053b0b          	0x49053b0b
 37c:	00180213          	addi	tp,a6,1
 380:	0c00                	addi	s0,sp,528
 382:	0111010b          	0x111010b
 386:	0612                	slli	a2,a2,0x4
 388:	1301                	addi	t1,t1,-32
 38a:	0000                	unimp
 38c:	340d                	jal	fffffdae <_sp+0x7fffbdae>
 38e:	0300                	addi	s0,sp,384
 390:	3a0e                	fld	fs4,224(sp)
 392:	49053b0b          	0x49053b0b
 396:	0e000013          	li	zero,224
 39a:	8289                	srli	a3,a3,0x2
 39c:	0001                	nop
 39e:	0111                	addi	sp,sp,4
 3a0:	1331                	addi	t1,t1,-20
 3a2:	0000                	unimp
 3a4:	0182890f          	0x182890f
 3a8:	1101                	addi	sp,sp,-32
 3aa:	3101                	jal	ffffffaa <_sp+0x7fffbfaa>
 3ac:	00130113          	addi	sp,t1,1
 3b0:	1000                	addi	s0,sp,32
 3b2:	828a                	mv	t0,sp
 3b4:	0001                	nop
 3b6:	1802                	slli	a6,a6,0x20
 3b8:	4291                	li	t0,4
 3ba:	0018                	0x18
 3bc:	1100                	addi	s0,sp,160
 3be:	8289                	srli	a3,a3,0x2
 3c0:	0101                	addi	sp,sp,0
 3c2:	0111                	addi	sp,sp,4
 3c4:	4295                	li	t0,5
 3c6:	3119                	jal	ffffffcc <_sp+0x7fffbfcc>
 3c8:	12000013          	li	zero,288
 3cc:	012e                	slli	sp,sp,0xb
 3ce:	0e03193f 053b0b3a 	0x53b0b3a0e03193f
 3d6:	1349                	addi	t1,t1,-14
 3d8:	0111                	addi	sp,sp,4
 3da:	0612                	slli	a2,a2,0x4
 3dc:	1840                	addi	s0,sp,52
 3de:	01194297          	auipc	t0,0x1194
 3e2:	13000013          	li	zero,304
 3e6:	011d                	addi	sp,sp,7
 3e8:	1331                	addi	t1,t1,-20
 3ea:	0152                	slli	sp,sp,0x14
 3ec:	1755                	addi	a4,a4,-11
 3ee:	0b58                	addi	a4,sp,404
 3f0:	0559                	addi	a0,a0,22
 3f2:	0000                	unimp
 3f4:	0514                	addi	a3,sp,640
 3f6:	3100                	fld	fs0,32(a0)
 3f8:	00170213          	addi	tp,a4,1
 3fc:	1500                	addi	s0,sp,672
 3fe:	1755010b          	0x1755010b
 402:	0000                	unimp
 404:	3416                	fld	fs0,352(sp)
 406:	3100                	fld	fs0,32(a0)
 408:	17000013          	li	zero,368
 40c:	011d                	addi	sp,sp,7
 40e:	1331                	addi	t1,t1,-20
 410:	0111                	addi	sp,sp,4
 412:	0612                	slli	a2,a2,0x4
 414:	0b58                	addi	a4,sp,404
 416:	0b59                	addi	s6,s6,22
 418:	1301                	addi	t1,t1,-32
 41a:	0000                	unimp
 41c:	0b18                	addi	a4,sp,400
 41e:	1101                	addi	sp,sp,-32
 420:	1201                	addi	tp,tp,-32
 422:	0006                	c.slli	zero,0x1
 424:	1900                	addi	s0,sp,176
 426:	011d                	addi	sp,sp,7
 428:	1331                	addi	t1,t1,-20
 42a:	0111                	addi	sp,sp,4
 42c:	0612                	slli	a2,a2,0x4
 42e:	0b58                	addi	a4,sp,404
 430:	0b59                	addi	s6,s6,22
 432:	0000                	unimp
 434:	2e1a                	fld	ft8,384(sp)
 436:	3f01                	jal	346 <_prog_start-0x1ffffcba>
 438:	0319                	addi	t1,t1,6
 43a:	3a0e                	fld	fs4,224(sp)
 43c:	27053b0b          	0x27053b0b
 440:	4919                	li	s2,6
 442:	12011113          	0x12011113
 446:	4006                	0x4006
 448:	9718                	0x9718
 44a:	1942                	slli	s2,s2,0x30
 44c:	1301                	addi	t1,t1,-32
 44e:	0000                	unimp
 450:	0300051b          	0x300051b
 454:	3a0e                	fld	fs4,224(sp)
 456:	49053b0b          	0x49053b0b
 45a:	00170213          	addi	tp,a4,1
 45e:	1c00                	addi	s0,sp,560
 460:	0005                	c.nop	1
 462:	0b3a0803          	lb	a6,179(s4)
 466:	1349053b          	0x1349053b
 46a:	1702                	slli	a4,a4,0x20
 46c:	0000                	unimp
 46e:	0b1d                	addi	s6,s6,7
 470:	5501                	li	a0,-32
 472:	00130117          	auipc	sp,0x130
 476:	1e00                	addi	s0,sp,816
 478:	0034                	addi	a3,sp,8
 47a:	0b3a0803          	lb	a6,179(s4)
 47e:	1349053b          	0x1349053b
 482:	1702                	slli	a4,a4,0x20
 484:	0000                	unimp
 486:	891f 0182 1101      	0x11010182891f
 48c:	3101                	jal	8c <_prog_start-0x1fffff74>
 48e:	20000013          	li	zero,512
 492:	011d                	addi	sp,sp,7
 494:	1331                	addi	t1,t1,-20
 496:	0111                	addi	sp,sp,4
 498:	0612                	slli	a2,a2,0x4
 49a:	0b58                	addi	a4,sp,404
 49c:	0559                	addi	a0,a0,22
 49e:	1301                	addi	t1,t1,-32
 4a0:	0000                	unimp
 4a2:	1d21                	addi	s10,s10,-24
 4a4:	3101                	jal	a4 <_prog_start-0x1fffff5c>
 4a6:	12011113          	0x12011113
 4aa:	5806                	lw	a6,96(sp)
 4ac:	0005590b          	0x5590b
 4b0:	2200                	fld	fs0,0(a2)
 4b2:	001d                	c.nop	7
 4b4:	1331                	addi	t1,t1,-20
 4b6:	0111                	addi	sp,sp,4
 4b8:	0612                	slli	a2,a2,0x4
 4ba:	0b58                	addi	a4,sp,404
 4bc:	0559                	addi	a0,a0,22
 4be:	0000                	unimp
 4c0:	31011d23          	sh	a6,794(sp) # 13078c <_prog_start-0x1fecf874>
 4c4:	55015213          	0x55015213
 4c8:	590b5817          	auipc	a6,0x590b5
 4cc:	0105                	addi	sp,sp,1
 4ce:	24000013          	li	zero,576
 4d2:	0005                	c.nop	1
 4d4:	1331                	addi	t1,t1,-20
 4d6:	0000                	unimp
 4d8:	0b25                	addi	s6,s6,9
 4da:	3101                	jal	da <_prog_start-0x1fffff26>
 4dc:	00175513          	srli	a0,a4,0x1
 4e0:	2600                	fld	fs0,8(a2)
 4e2:	012e                	slli	sp,sp,0xb
 4e4:	0e03193f 053b0b3a 	0x53b0b3a0e03193f
 4ec:	13491927          	0x13491927
 4f0:	0b20                	addi	s0,sp,408
 4f2:	1301                	addi	t1,t1,-32
 4f4:	0000                	unimp
 4f6:	03000527          	0x3000527
 4fa:	3a0e                	fld	fs4,224(sp)
 4fc:	49053b0b          	0x49053b0b
 500:	28000013          	li	zero,640
 504:	0005                	c.nop	1
 506:	0b3a0803          	lb	a6,179(s4)
 50a:	1349053b          	0x1349053b
 50e:	0000                	unimp
 510:	3429                	jal	ffffff1a <_sp+0x7fffbf1a>
 512:	0300                	addi	s0,sp,384
 514:	3a08                	fld	fa0,48(a2)
 516:	49053b0b          	0x49053b0b
 51a:	2a000013          	li	zero,672
 51e:	0000010b          	0x10b
 522:	3f012e2b          	0x3f012e2b
 526:	0319                	addi	t1,t1,6
 528:	3a0e                	fld	fs4,224(sp)
 52a:	27053b0b          	0x27053b0b
 52e:	2019                	jal	534 <_prog_start-0x1ffffacc>
 530:	0013010b          	0x13010b
 534:	2c00                	fld	fs0,24(s0)
 536:	002e                	c.slli	zero,0xb
 538:	0e03193f 053b0b3a 	0x53b0b3a0e03193f
 540:	0b20                	addi	s0,sp,408
 542:	0000                	unimp
 544:	052d                	addi	a0,a0,11
 546:	3100                	fld	fs0,32(a0)
 548:	00051c13          	slli	s8,a0,0x0
 54c:	2e00                	fld	fs0,24(a2)
 54e:	012e                	slli	sp,sp,0xb
 550:	0e03193f 053b0b3a 	0x53b0b3a0e03193f
 558:	01111927          	0x1111927
 55c:	0612                	slli	a2,a2,0x4
 55e:	1840                	addi	s0,sp,52
 560:	01194297          	auipc	t0,0x1194
 564:	2f000013          	li	zero,752
 568:	0034                	addi	a3,sp,8
 56a:	0b3a0e03          	lb	t3,179(s4)
 56e:	1349053b          	0x1349053b
 572:	1702                	slli	a4,a4,0x20
 574:	0000                	unimp
 576:	0530                	addi	a2,sp,648
 578:	0300                	addi	s0,sp,384
 57a:	3a0e                	fld	fs4,224(sp)
 57c:	49053b0b          	0x49053b0b
 580:	00180213          	addi	tp,a6,1 # 590b54c9 <_data_lma+0x390b3189>
 584:	3100                	fld	fs0,32(a0)
 586:	012e                	slli	sp,sp,0xb
 588:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 590:	13491927          	0x13491927
 594:	0111                	addi	sp,sp,4
 596:	0612                	slli	a2,a2,0x4
 598:	1840                	addi	s0,sp,52
 59a:	01194297          	auipc	t0,0x1194
 59e:	32000013          	li	zero,800
 5a2:	0005                	c.nop	1
 5a4:	0b3a0e03          	lb	t3,179(s4)
 5a8:	13490b3b          	0x13490b3b
 5ac:	1702                	slli	a4,a4,0x20
 5ae:	0000                	unimp
 5b0:	3f012e33          	0x3f012e33
 5b4:	0319                	addi	t1,t1,6
 5b6:	3a0e                	fld	fs4,224(sp)
 5b8:	270b3b0b          	0x270b3b0b
 5bc:	1119                	addi	sp,sp,-26
 5be:	1201                	addi	tp,tp,-32
 5c0:	4006                	0x4006
 5c2:	9718                	0x9718
 5c4:	1942                	slli	s2,s2,0x30
 5c6:	1301                	addi	t1,t1,-32
 5c8:	0000                	unimp
 5ca:	0534                	addi	a3,sp,648
 5cc:	0300                	addi	s0,sp,384
 5ce:	3a08                	fld	fa0,48(a2)
 5d0:	490b3b0b          	0x490b3b0b
 5d4:	00170213          	addi	tp,a4,1
 5d8:	3500                	fld	fs0,40(a0)
 5da:	0034                	addi	a3,sp,8
 5dc:	0b3a0803          	lb	a6,179(s4)
 5e0:	13490b3b          	0x13490b3b
 5e4:	1702                	slli	a4,a4,0x20
 5e6:	0000                	unimp
 5e8:	1d36                	slli	s10,s10,0x2d
 5ea:	3101                	jal	1ea <_prog_start-0x1ffffe16>
 5ec:	55015213          	0x55015213
 5f0:	590b5817          	auipc	a6,0x590b5
 5f4:	0013010b          	0x13010b
 5f8:	3700                	fld	fs0,40(a4)
 5fa:	011d                	addi	sp,sp,7
 5fc:	1331                	addi	t1,t1,-20
 5fe:	0152                	slli	sp,sp,0x14
 600:	1755                	addi	a4,a4,-11
 602:	0b58                	addi	a4,sp,404
 604:	0b59                	addi	s6,s6,22
 606:	0000                	unimp
 608:	0538                	addi	a4,sp,648
 60a:	3100                	fld	fs0,32(a0)
 60c:	000b1c13          	slli	s8,s6,0x0
 610:	3900                	fld	fs0,48(a0)
 612:	0005                	c.nop	1
 614:	0b3a0e03          	lb	t3,179(s4)
 618:	13490b3b          	0x13490b3b
 61c:	1802                	slli	a6,a6,0x20
 61e:	0000                	unimp
 620:	2e3a                	fld	ft8,392(sp)
 622:	3f01                	jal	532 <_prog_start-0x1fffface>
 624:	0319                	addi	t1,t1,6
 626:	3a0e                	fld	fs4,224(sp)
 628:	110b3b0b          	0x110b3b0b
 62c:	1201                	addi	tp,tp,-32
 62e:	4006                	0x4006
 630:	9718                	0x9718
 632:	1942                	slli	s2,s2,0x30
 634:	1301                	addi	t1,t1,-32
 636:	0000                	unimp
 638:	3f012e3b          	0x3f012e3b
 63c:	0319                	addi	t1,t1,6
 63e:	3a0e                	fld	fs4,224(sp)
 640:	270b3b0b          	0x270b3b0b
 644:	2019                	jal	64a <_prog_start-0x1ffff9b6>
 646:	0013010b          	0x13010b
 64a:	3c00                	fld	fs0,56(s0)
 64c:	0005                	c.nop	1
 64e:	0b3a0803          	lb	a6,179(s4)
 652:	13490b3b          	0x13490b3b
 656:	0000                	unimp
 658:	2e3d                	jal	996 <_prog_start-0x1ffff66a>
 65a:	3f01                	jal	56a <_prog_start-0x1ffffa96>
 65c:	0319                	addi	t1,t1,6
 65e:	3a0e                	fld	fs4,224(sp)
 660:	270b3b0b          	0x270b3b0b
 664:	4919                	li	s2,6
 666:	010b2013          	slti	zero,s6,16
 66a:	3e000013          	li	zero,992
 66e:	0005                	c.nop	1
 670:	0b3a0e03          	lb	t3,179(s4)
 674:	13490b3b          	0x13490b3b
 678:	0000                	unimp
 67a:	0300343f 3b0b3a0e 	0x3b0b3a0e0300343f
 682:	0013490b          	0x13490b
 686:	4000                	lw	s0,0(s0)
 688:	012e                	slli	sp,sp,0xb
 68a:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 692:	1349                	addi	t1,t1,-14
 694:	0b20                	addi	s0,sp,408
 696:	1301                	addi	t1,t1,-32
 698:	0000                	unimp
 69a:	3441                	jal	11a <_prog_start-0x1ffffee6>
 69c:	0300                	addi	s0,sp,384
 69e:	3a08                	fld	fa0,48(a2)
 6a0:	490b3b0b          	0x490b3b0b
 6a4:	42000013          	li	zero,1056
 6a8:	012e                	slli	sp,sp,0xb
 6aa:	1331                	addi	t1,t1,-20
 6ac:	0111                	addi	sp,sp,4
 6ae:	0612                	slli	a2,a2,0x4
 6b0:	1840                	addi	s0,sp,52
 6b2:	01194297          	auipc	t0,0x1194
 6b6:	43000013          	li	zero,1072
 6ba:	0005                	c.nop	1
 6bc:	1331                	addi	t1,t1,-20
 6be:	1802                	slli	a6,a6,0x20
 6c0:	0000                	unimp
 6c2:	3444                	fld	fs1,168(s0)
 6c4:	3100                	fld	fs0,32(a0)
 6c6:	000b1c13          	slli	s8,s6,0x0
 6ca:	4500                	lw	s0,8(a0)
 6cc:	0034                	addi	a3,sp,8
 6ce:	1331                	addi	t1,t1,-20
 6d0:	1702                	slli	a4,a4,0x20
 6d2:	0000                	unimp
 6d4:	0b46                	slli	s6,s6,0x11
 6d6:	3101                	jal	2d6 <_prog_start-0x1ffffd2a>
 6d8:	12011113          	0x12011113
 6dc:	0006                	c.slli	zero,0x1
 6de:	4700                	lw	s0,8(a4)
 6e0:	0034                	addi	a3,sp,8
 6e2:	1331                	addi	t1,t1,-20
 6e4:	1802                	slli	a6,a6,0x20
 6e6:	0000                	unimp
 6e8:	8948                	0x8948
 6ea:	0182                	c.slli64	gp
 6ec:	1100                	addi	s0,sp,160
 6ee:	9501                	srai	a0,a0,0x20
 6f0:	1942                	slli	s2,s2,0x30
 6f2:	1331                	addi	t1,t1,-20
 6f4:	0000                	unimp
 6f6:	2e49                	jal	a88 <_prog_start-0x1ffff578>
 6f8:	3100                	fld	fs0,32(a0)
 6fa:	12011113          	0x12011113
 6fe:	4006                	0x4006
 700:	9718                	0x9718
 702:	1942                	slli	s2,s2,0x30
 704:	0000                	unimp
 706:	2e4a                	fld	ft8,144(sp)
 708:	3101                	jal	308 <_prog_start-0x1ffffcf8>
 70a:	12011113          	0x12011113
 70e:	4006                	0x4006
 710:	9718                	0x9718
 712:	1942                	slli	s2,s2,0x30
 714:	0000                	unimp
 716:	0100                	addi	s0,sp,128
 718:	0111                	addi	sp,sp,4
 71a:	0e25                	addi	t3,t3,9
 71c:	0e030b13          	addi	s6,t1,224
 720:	01110e1b          	0x1110e1b
 724:	0612                	slli	a2,a2,0x4
 726:	1710                	addi	a2,sp,928
 728:	0000                	unimp
 72a:	2402                	fld	fs0,0(sp)
 72c:	0b00                	addi	s0,sp,400
 72e:	030b3e0b          	0x30b3e0b
 732:	000e                	c.slli	zero,0x3
 734:	0300                	addi	s0,sp,384
 736:	0016                	c.slli	zero,0x5
 738:	0b3a0e03          	lb	t3,179(s4)
 73c:	13490b3b          	0x13490b3b
 740:	0000                	unimp
 742:	2404                	fld	fs1,8(s0)
 744:	0b00                	addi	s0,sp,400
 746:	030b3e0b          	0x30b3e0b
 74a:	0008                	0x8
 74c:	0500                	addi	s0,sp,640
 74e:	0b0b0113          	addi	sp,s6,176
 752:	0b3a                	slli	s6,s6,0xe
 754:	13010b3b          	0x13010b3b
 758:	0000                	unimp
 75a:	0d06                	slli	s10,s10,0x1
 75c:	0300                	addi	s0,sp,384
 75e:	3a08                	fld	fa0,48(a2)
 760:	490b3b0b          	0x490b3b0b
 764:	0d0b0b13          	addi	s6,s6,208
 768:	380b0c0b          	0x380b0c0b
 76c:	0700000b          	0x700000b
 770:	000d                	c.nop	3
 772:	0b3a0e03          	lb	t3,179(s4)
 776:	13490b3b          	0x13490b3b
 77a:	0b0d0b0b          	0xb0d0b0b
 77e:	0b0c                	addi	a1,sp,400
 780:	0b38                	addi	a4,sp,408
 782:	0000                	unimp
 784:	1708                	addi	a0,sp,928
 786:	0b01                	addi	s6,s6,0
 788:	3b0b3a0b          	0x3b0b3a0b
 78c:	0013010b          	0x13010b
 790:	0900                	addi	s0,sp,144
 792:	000d                	c.nop	3
 794:	1349                	addi	t1,t1,-14
 796:	0000                	unimp
 798:	0d0a                	slli	s10,s10,0x2
 79a:	0300                	addi	s0,sp,384
 79c:	3a0e                	fld	fs4,224(sp)
 79e:	490b3b0b          	0x490b3b0b
 7a2:	0b000013          	li	zero,176
 7a6:	000d                	c.nop	3
 7a8:	0b3a0e03          	lb	t3,179(s4)
 7ac:	13490b3b          	0x13490b3b
 7b0:	0b38                	addi	a4,sp,408
 7b2:	0000                	unimp
 7b4:	0d0c                	addi	a1,sp,656
 7b6:	0300                	addi	s0,sp,384
 7b8:	3a08                	fld	fa0,48(a2)
 7ba:	490b3b0b          	0x490b3b0b
 7be:	000b3813          	sltiu	a6,s6,0
 7c2:	0d00                	addi	s0,sp,656
 7c4:	0035                	c.nop	13
 7c6:	1349                	addi	t1,t1,-14
 7c8:	0000                	unimp
 7ca:	2e0e                	fld	ft8,192(sp)
 7cc:	3f01                	jal	6dc <_prog_start-0x1ffff924>
 7ce:	0319                	addi	t1,t1,6
 7d0:	3a0e                	fld	fs4,224(sp)
 7d2:	270b3b0b          	0x270b3b0b
 7d6:	4919                	li	s2,6
 7d8:	12011113          	0x12011113
 7dc:	4006                	0x4006
 7de:	9718                	0x9718
 7e0:	1942                	slli	s2,s2,0x30
 7e2:	1301                	addi	t1,t1,-32
 7e4:	0000                	unimp
 7e6:	0300050f          	0x300050f
 7ea:	3a0e                	fld	fs4,224(sp)
 7ec:	490b3b0b          	0x490b3b0b
 7f0:	00170213          	addi	tp,a4,1
 7f4:	1000                	addi	s0,sp,32
 7f6:	0005                	c.nop	1
 7f8:	0b3a0803          	lb	a6,179(s4)
 7fc:	13490b3b          	0x13490b3b
 800:	1702                	slli	a4,a4,0x20
 802:	0000                	unimp
 804:	3411                	jal	208 <_prog_start-0x1ffffdf8>
 806:	0300                	addi	s0,sp,384
 808:	3a0e                	fld	fs4,224(sp)
 80a:	490b3b0b          	0x490b3b0b
 80e:	00180213          	addi	tp,a6,1 # 590b55f1 <_data_lma+0x390b32b1>
 812:	1200                	addi	s0,sp,288
 814:	0111010b          	0x111010b
 818:	0612                	slli	a2,a2,0x4
 81a:	1301                	addi	t1,t1,-32
 81c:	0000                	unimp
 81e:	03003413          	sltiu	s0,zero,48
 822:	3a08                	fld	fa0,48(a2)
 824:	490b3b0b          	0x490b3b0b
 828:	00170213          	addi	tp,a4,1
 82c:	1400                	addi	s0,sp,544
 82e:	011d                	addi	sp,sp,7
 830:	1331                	addi	t1,t1,-20
 832:	0111                	addi	sp,sp,4
 834:	0612                	slli	a2,a2,0x4
 836:	0b58                	addi	a4,sp,404
 838:	0b59                	addi	s6,s6,22
 83a:	0000                	unimp
 83c:	0515                	addi	a0,a0,5
 83e:	3100                	fld	fs0,32(a0)
 840:	16000013          	li	zero,352
 844:	011d                	addi	sp,sp,7
 846:	1331                	addi	t1,t1,-20
 848:	0111                	addi	sp,sp,4
 84a:	0612                	slli	a2,a2,0x4
 84c:	0b58                	addi	a4,sp,404
 84e:	0b59                	addi	s6,s6,22
 850:	1301                	addi	t1,t1,-32
 852:	0000                	unimp
 854:	11010b17          	auipc	s6,0x11010
 858:	1201                	addi	tp,tp,-32
 85a:	0006                	c.slli	zero,0x1
 85c:	1800                	addi	s0,sp,48
 85e:	0034                	addi	a3,sp,8
 860:	1331                	addi	t1,t1,-20
 862:	0000                	unimp
 864:	0519                	addi	a0,a0,6
 866:	3100                	fld	fs0,32(a0)
 868:	00170213          	addi	tp,a4,1
 86c:	1a00                	addi	s0,sp,304
 86e:	0005                	c.nop	1
 870:	1331                	addi	t1,t1,-20
 872:	0b1c                	addi	a5,sp,400
 874:	0000                	unimp
 876:	3100051b          	0x3100051b
 87a:	00180213          	addi	tp,a6,1
 87e:	1c00                	addi	s0,sp,560
 880:	0b0b000f          	0xb0b000f
 884:	1349                	addi	t1,t1,-14
 886:	0000                	unimp
 888:	0f1d                	addi	t5,t5,7
 88a:	0b00                	addi	s0,sp,400
 88c:	1e00000b          	0x1e00000b
 890:	012e                	slli	sp,sp,0xb
 892:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 89a:	13491927          	0x13491927
 89e:	0b20                	addi	s0,sp,408
 8a0:	1301                	addi	t1,t1,-32
 8a2:	0000                	unimp
 8a4:	051f 0300 3a0e      	0x3a0e0300051f
 8aa:	490b3b0b          	0x490b3b0b
 8ae:	20000013          	li	zero,512
 8b2:	0005                	c.nop	1
 8b4:	0b3a0803          	lb	a6,179(s4)
 8b8:	13490b3b          	0x13490b3b
 8bc:	0000                	unimp
 8be:	3421                	jal	2c6 <_prog_start-0x1ffffd3a>
 8c0:	0300                	addi	s0,sp,384
 8c2:	3a08                	fld	fa0,48(a2)
 8c4:	490b3b0b          	0x490b3b0b
 8c8:	22000013          	li	zero,544
 8cc:	012e                	slli	sp,sp,0xb
 8ce:	0e03193f 0b3b0b3a 	0xb3b0b3a0e03193f
 8d6:	0b201927          	0xb201927
 8da:	1301                	addi	t1,t1,-32
 8dc:	0000                	unimp
 8de:	3f012e23          	sw	a6,1020(sp)
 8e2:	0319                	addi	t1,t1,6
 8e4:	3a0e                	fld	fs4,224(sp)
 8e6:	27053b0b          	0x27053b0b
 8ea:	4919                	li	s2,6
 8ec:	12011113          	0x12011113
 8f0:	4006                	0x4006
 8f2:	9718                	0x9718
 8f4:	1942                	slli	s2,s2,0x30
 8f6:	1301                	addi	t1,t1,-32
 8f8:	0000                	unimp
 8fa:	0524                	addi	s1,sp,648
 8fc:	0300                	addi	s0,sp,384
 8fe:	3a0e                	fld	fs4,224(sp)
 900:	49053b0b          	0x49053b0b
 904:	00170213          	addi	tp,a4,1
 908:	2500                	fld	fs0,8(a0)
 90a:	0034                	addi	a3,sp,8
 90c:	0b3a0e03          	lb	t3,179(s4)
 910:	1349053b          	0x1349053b
 914:	1802                	slli	a6,a6,0x20
 916:	0000                	unimp
 918:	2e26                	fld	ft8,72(sp)
 91a:	3101                	jal	51a <_prog_start-0x1ffffae6>
 91c:	12011113          	0x12011113
 920:	4006                	0x4006
 922:	9718                	0x9718
 924:	1942                	slli	s2,s2,0x30
 926:	1301                	addi	t1,t1,-32
 928:	0000                	unimp
 92a:	31003427          	fsd	fa6,776(zero) # 308 <_prog_start-0x1ffffcf8>
 92e:	00180213          	addi	tp,a6,1
 932:	2800                	fld	fs0,16(s0)
 934:	012e                	slli	sp,sp,0xb
 936:	1331                	addi	t1,t1,-20
 938:	0111                	addi	sp,sp,4
 93a:	0612                	slli	a2,a2,0x4
 93c:	1840                	addi	s0,sp,52
 93e:	00194297          	auipc	t0,0x194
 942:	0000                	unimp
 944:	1101                	addi	sp,sp,-32
 946:	2501                	jal	f46 <_prog_start-0x1ffff0ba>
 948:	130e                	slli	t1,t1,0x23
 94a:	1b0e030b          	0x1b0e030b
 94e:	110e                	slli	sp,sp,0x23
 950:	1201                	addi	tp,tp,-32
 952:	1006                	c.slli	zero,0x21
 954:	02000017          	auipc	zero,0x2000
 958:	0024                	addi	s1,sp,8
 95a:	0b3e0b0b          	0xb3e0b0b
 95e:	00000e03          	lb	t3,0(zero) # 0 <_prog_start-0x20000000>
 962:	03001603          	lh	a2,48(zero) # 30 <_prog_start-0x1fffffd0>
 966:	3a0e                	fld	fs4,224(sp)
 968:	490b3b0b          	0x490b3b0b
 96c:	04000013          	li	zero,64
 970:	0024                	addi	s1,sp,8
 972:	0b3e0b0b          	0xb3e0b0b
 976:	00000803          	lb	a6,0(zero) # 0 <_prog_start-0x20000000>
 97a:	1605                	addi	a2,a2,-31
 97c:	0300                	addi	s0,sp,384
 97e:	3a0e                	fld	fs4,224(sp)
 980:	49053b0b          	0x49053b0b
 984:	06000013          	li	zero,96
 988:	0b0b0117          	auipc	sp,0xb0b0
 98c:	0b3a                	slli	s6,s6,0xe
 98e:	13010b3b          	0x13010b3b
 992:	0000                	unimp
 994:	03000d07          	0x3000d07
 998:	3a0e                	fld	fs4,224(sp)
 99a:	490b3b0b          	0x490b3b0b
 99e:	08000013          	li	zero,128
 9a2:	0101                	addi	sp,sp,0
 9a4:	1349                	addi	t1,t1,-14
 9a6:	1301                	addi	t1,t1,-32
 9a8:	0000                	unimp
 9aa:	2109                	jal	dac <_prog_start-0x1ffff254>
 9ac:	4900                	lw	s0,16(a0)
 9ae:	000b2f13          	slti	t5,s6,0
 9b2:	0a00                	addi	s0,sp,272
 9b4:	0b0b0113          	addi	sp,s6,176 # 11010904 <_prog_start-0xefef6fc>
 9b8:	0b3a                	slli	s6,s6,0xe
 9ba:	13010b3b          	0x13010b3b
 9be:	0000                	unimp
 9c0:	03000d0b          	0x3000d0b
 9c4:	3a0e                	fld	fs4,224(sp)
 9c6:	490b3b0b          	0x490b3b0b
 9ca:	000b3813          	sltiu	a6,s6,0
 9ce:	0c00                	addi	s0,sp,528
 9d0:	0b0b000f          	0xb0b000f
 9d4:	0000                	unimp
 9d6:	0f0d                	addi	t5,t5,3
 9d8:	0b00                	addi	s0,sp,400
 9da:	0013490b          	0x13490b
 9de:	0e00                	addi	s0,sp,784
 9e0:	0026                	c.slli	zero,0x9
 9e2:	1349                	addi	t1,t1,-14
 9e4:	0000                	unimp
 9e6:	0300340f          	0x300340f
 9ea:	3a0e                	fld	fs4,224(sp)
 9ec:	490b3b0b          	0x490b3b0b
 9f0:	3c193f13          	sltiu	t5,s2,961
 9f4:	0019                	c.nop	6
 9f6:	1000                	addi	s0,sp,32
 9f8:	0e030113          	addi	sp,t1,224
 9fc:	0b3a0b0b          	0xb3a0b0b
 a00:	13010b3b          	0x13010b3b
 a04:	0000                	unimp
 a06:	0d11                	addi	s10,s10,4
 a08:	0300                	addi	s0,sp,384
 a0a:	3a08                	fld	fa0,48(a2)
 a0c:	490b3b0b          	0x490b3b0b
 a10:	000b3813          	sltiu	a6,s6,0
 a14:	1200                	addi	s0,sp,288
 a16:	0e030113          	addi	sp,t1,224
 a1a:	0b3a050b          	0xb3a050b
 a1e:	13010b3b          	0x13010b3b
 a22:	0000                	unimp
 a24:	03000d13          	li	s10,48
 a28:	3a0e                	fld	fs4,224(sp)
 a2a:	490b3b0b          	0x490b3b0b
 a2e:	00053813          	sltiu	a6,a0,0
 a32:	1400                	addi	s0,sp,544
 a34:	0015                	c.nop	5
 a36:	00001927          	0x1927
 a3a:	1515                	addi	a0,a0,-27
 a3c:	2701                	jal	113c <_prog_start-0x1fffeec4>
 a3e:	4919                	li	s2,6
 a40:	00130113          	addi	sp,t1,1
 a44:	1600                	addi	s0,sp,800
 a46:	0005                	c.nop	1
 a48:	1349                	addi	t1,t1,-14
 a4a:	0000                	unimp
 a4c:	03011317          	auipc	t1,0x3011
 a50:	0b0e                	slli	s6,s6,0x3
 a52:	3a05                	jal	382 <_prog_start-0x1ffffc7e>
 a54:	01053b0b          	0x1053b0b
 a58:	18000013          	li	zero,384
 a5c:	000d                	c.nop	3
 a5e:	0b3a0e03          	lb	t3,179(s4)
 a62:	1349053b          	0x1349053b
 a66:	0b38                	addi	a4,sp,408
 a68:	0000                	unimp
 a6a:	0d19                	addi	s10,s10,6
 a6c:	0300                	addi	s0,sp,384
 a6e:	3a0e                	fld	fs4,224(sp)
 a70:	49053b0b          	0x49053b0b
 a74:	00053813          	sltiu	a6,a0,0
 a78:	1a00                	addi	s0,sp,304
 a7a:	0e030113          	addi	sp,t1,224 # 3011b2c <_prog_start-0x1cfee4d4>
 a7e:	0b3a0b0b          	0xb3a0b0b
 a82:	1301053b          	0x1301053b
 a86:	0000                	unimp
 a88:	0b01131b          	0xb01131b
 a8c:	3b0b3a0b          	0x3b0b3a0b
 a90:	0105                	addi	sp,sp,1
 a92:	1c000013          	li	zero,448
 a96:	0b0b0117          	auipc	sp,0xb0b0
 a9a:	0b3a                	slli	s6,s6,0xe
 a9c:	1301053b          	0x1301053b
 aa0:	0000                	unimp
 aa2:	0d1d                	addi	s10,s10,7
 aa4:	0300                	addi	s0,sp,384
 aa6:	3a0e                	fld	fs4,224(sp)
 aa8:	49053b0b          	0x49053b0b
 aac:	1e000013          	li	zero,480
 ab0:	0e030013          	addi	zero,t1,224
 ab4:	193c                	addi	a5,sp,184
 ab6:	0000                	unimp
 ab8:	151f 2701 0119      	0x1192701151f
 abe:	20000013          	li	zero,512
 ac2:	0034                	addi	a3,sp,8
 ac4:	0b3a0e03          	lb	t3,179(s4)
 ac8:	1349053b          	0x1349053b
 acc:	193c193f 21210000 	0x21210000193c193f
 ad4:	0000                	unimp
 ad6:	2200                	fld	fs0,0(a2)
 ad8:	000d                	c.nop	3
 ada:	0b3a0803          	lb	a6,179(s4)
 ade:	13490b3b          	0x13490b3b
 ae2:	0b0d0b0b          	0xb0d0b0b
 ae6:	0b0c                	addi	a1,sp,400
 ae8:	0b38                	addi	a4,sp,408
 aea:	0000                	unimp
 aec:	03000d23          	sb	a6,58(zero) # 3a <_prog_start-0x1fffffc6>
 af0:	3a0e                	fld	fs4,224(sp)
 af2:	490b3b0b          	0x490b3b0b
 af6:	0d0b0b13          	addi	s6,s6,208
 afa:	380b0c0b          	0x380b0c0b
 afe:	2400000b          	0x2400000b
 b02:	000d                	c.nop	3
 b04:	1349                	addi	t1,t1,-14
 b06:	0000                	unimp
 b08:	3525                	jal	930 <_prog_start-0x1ffff6d0>
 b0a:	4900                	lw	s0,16(a0)
 b0c:	26000013          	li	zero,608
 b10:	0034                	addi	a3,sp,8
 b12:	0b3a0e03          	lb	t3,179(s4)
 b16:	13490b3b          	0x13490b3b
 b1a:	1802193f 34270000 	0x342700001802193f
 b22:	0300                	addi	s0,sp,384
 b24:	3a0e                	fld	fs4,224(sp)
 b26:	490b3b0b          	0x490b3b0b
 b2a:	00180213          	addi	tp,a6,1
 b2e:	2800                	fld	fs0,16(s0)
 b30:	012e                	slli	sp,sp,0xb
 b32:	0e03193f 053b0b3a 	0x53b0b3a0e03193f
 b3a:	1349                	addi	t1,t1,-14
 b3c:	0111                	addi	sp,sp,4
 b3e:	0612                	slli	a2,a2,0x4
 b40:	1840                	addi	s0,sp,52
 b42:	01194297          	auipc	t0,0x1194
 b46:	29000013          	li	zero,656
 b4a:	0034                	addi	a3,sp,8
 b4c:	0b3a0e03          	lb	t3,179(s4)
 b50:	1349053b          	0x1349053b
 b54:	061c                	addi	a5,sp,768
 b56:	0000                	unimp
 b58:	892a                	mv	s2,a0
 b5a:	0182                	c.slli64	gp
 b5c:	1101                	addi	sp,sp,-32
 b5e:	3101                	jal	75e <_prog_start-0x1ffff8a2>
 b60:	00130113          	addi	sp,t1,1
 b64:	2b00                	fld	fs0,16(a4)
 b66:	828a                	mv	t0,sp
 b68:	0001                	nop
 b6a:	1802                	slli	a6,a6,0x20
 b6c:	4291                	li	t0,4
 b6e:	0018                	0x18
 b70:	2c00                	fld	fs0,24(s0)
 b72:	8289                	srli	a3,a3,0x2
 b74:	0101                	addi	sp,sp,0
 b76:	0111                	addi	sp,sp,4
 b78:	1331                	addi	t1,t1,-20
 b7a:	0000                	unimp
 b7c:	2e2d                	jal	eb6 <_prog_start-0x1ffff14a>
 b7e:	3f01                	jal	a8e <_prog_start-0x1ffff572>
 b80:	0319                	addi	t1,t1,6
 b82:	3a0e                	fld	fs4,224(sp)
 b84:	27053b0b          	0x27053b0b
 b88:	4919                	li	s2,6
 b8a:	12011113          	0x12011113
 b8e:	4006                	0x4006
 b90:	9718                	0x9718
 b92:	1942                	slli	s2,s2,0x30
 b94:	1301                	addi	t1,t1,-32
 b96:	0000                	unimp
 b98:	052e                	slli	a0,a0,0xb
 b9a:	0300                	addi	s0,sp,384
 b9c:	3a0e                	fld	fs4,224(sp)
 b9e:	49053b0b          	0x49053b0b
 ba2:	00170213          	addi	tp,a4,1
 ba6:	2f00                	fld	fs0,24(a4)
 ba8:	0034                	addi	a3,sp,8
 baa:	0b3a0803          	lb	a6,179(s4)
 bae:	1349053b          	0x1349053b
 bb2:	1702                	slli	a4,a4,0x20
 bb4:	0000                	unimp
 bb6:	8930                	0x8930
 bb8:	0182                	c.slli64	gp
 bba:	1101                	addi	sp,sp,-32
 bbc:	9501                	srai	a0,a0,0x20
 bbe:	1942                	slli	s2,s2,0x30
 bc0:	1331                	addi	t1,t1,-20
 bc2:	0000                	unimp
 bc4:	2e31                	jal	ee0 <_prog_start-0x1ffff120>
 bc6:	3f01                	jal	ad6 <_prog_start-0x1ffff52a>
 bc8:	0319                	addi	t1,t1,6
 bca:	3a0e                	fld	fs4,224(sp)
 bcc:	270b3b0b          	0x270b3b0b
 bd0:	4919                	li	s2,6
 bd2:	12011113          	0x12011113
 bd6:	4006                	0x4006
 bd8:	9718                	0x9718
 bda:	1942                	slli	s2,s2,0x30
 bdc:	1301                	addi	t1,t1,-32
 bde:	0000                	unimp
 be0:	0532                	slli	a0,a0,0xc
 be2:	0300                	addi	s0,sp,384
 be4:	3a0e                	fld	fs4,224(sp)
 be6:	490b3b0b          	0x490b3b0b
 bea:	00170213          	addi	tp,a4,1
 bee:	3300                	fld	fs0,32(a4)
 bf0:	0034                	addi	a3,sp,8
 bf2:	0b3a0803          	lb	a6,179(s4)
 bf6:	13490b3b          	0x13490b3b
 bfa:	1702                	slli	a4,a4,0x20
 bfc:	0000                	unimp
 bfe:	3434                	fld	fa3,104(s0)
 c00:	0300                	addi	s0,sp,384
 c02:	3a0e                	fld	fs4,224(sp)
 c04:	490b3b0b          	0x490b3b0b
 c08:	00170213          	addi	tp,a4,1
 c0c:	3500                	fld	fs0,40(a0)
 c0e:	1755010b          	0x1755010b
 c12:	1301                	addi	t1,t1,-32
 c14:	0000                	unimp
 c16:	1d36                	slli	s10,s10,0x2d
 c18:	3101                	jal	818 <_prog_start-0x1ffff7e8>
 c1a:	12011113          	0x12011113
 c1e:	5806                	lw	a6,96(sp)
 c20:	010b590b          	0x10b590b
 c24:	37000013          	li	zero,880
 c28:	0005                	c.nop	1
 c2a:	1331                	addi	t1,t1,-20
 c2c:	1702                	slli	a4,a4,0x20
 c2e:	0000                	unimp
 c30:	8938                	0x8938
 c32:	0182                	c.slli64	gp
 c34:	1100                	addi	s0,sp,160
 c36:	3101                	jal	836 <_prog_start-0x1ffff7ca>
 c38:	39000013          	li	zero,912
 c3c:	011d                	addi	sp,sp,7
 c3e:	1331                	addi	t1,t1,-20
 c40:	0111                	addi	sp,sp,4
 c42:	0612                	slli	a2,a2,0x4
 c44:	0b58                	addi	a4,sp,404
 c46:	0559                	addi	a0,a0,22
 c48:	1301                	addi	t1,t1,-32
 c4a:	0000                	unimp
 c4c:	1d3a                	slli	s10,s10,0x2e
 c4e:	3101                	jal	84e <_prog_start-0x1ffff7b2>
 c50:	55015213          	0x55015213
 c54:	590b5817          	auipc	a6,0x590b5
 c58:	0013010b          	0x13010b
 c5c:	3b00                	fld	fs0,48(a4)
 c5e:	0111010b          	0x111010b
 c62:	0612                	slli	a2,a2,0x4
 c64:	1301                	addi	t1,t1,-32
 c66:	0000                	unimp
 c68:	2e3c                	fld	fa5,88(a2)
 c6a:	3f01                	jal	b7a <_prog_start-0x1ffff486>
 c6c:	0319                	addi	t1,t1,6
 c6e:	3a0e                	fld	fs4,224(sp)
 c70:	270b3b0b          	0x270b3b0b
 c74:	4919                	li	s2,6
 c76:	010b2013          	slti	zero,s6,16
 c7a:	3d000013          	li	zero,976
 c7e:	0005                	c.nop	1
 c80:	0b3a0e03          	lb	t3,179(s4)
 c84:	13490b3b          	0x13490b3b
 c88:	0000                	unimp
 c8a:	2e3e                	fld	ft8,456(sp)
 c8c:	3f01                	jal	b9c <_prog_start-0x1ffff464>
 c8e:	0319                	addi	t1,t1,6
 c90:	3a0e                	fld	fs4,224(sp)
 c92:	270b3b0b          	0x270b3b0b
 c96:	1119                	addi	sp,sp,-26
 c98:	1201                	addi	tp,tp,-32
 c9a:	4006                	0x4006
 c9c:	9718                	0x9718
 c9e:	1942                	slli	s2,s2,0x30
 ca0:	1301                	addi	t1,t1,-32
 ca2:	0000                	unimp
 ca4:	3f012e3f 3a0e0319 	0x3a0e03193f012e3f
 cac:	270b3b0b          	0x270b3b0b
 cb0:	2019                	jal	cb6 <_prog_start-0x1ffff34a>
 cb2:	0013010b          	0x13010b
 cb6:	4000                	lw	s0,0(s0)
 cb8:	0005                	c.nop	1
 cba:	0b3a0803          	lb	a6,179(s4)
 cbe:	13490b3b          	0x13490b3b
 cc2:	0000                	unimp
 cc4:	2e41                	jal	1054 <_prog_start-0x1fffefac>
 cc6:	3101                	jal	8c6 <_prog_start-0x1ffff73a>
 cc8:	12011113          	0x12011113
 ccc:	4006                	0x4006
 cce:	9718                	0x9718
 cd0:	1942                	slli	s2,s2,0x30
 cd2:	1301                	addi	t1,t1,-32
 cd4:	0000                	unimp
 cd6:	0b42                	slli	s6,s6,0x10
 cd8:	3101                	jal	8d8 <_prog_start-0x1ffff728>
 cda:	01175513          	srli	a0,a4,0x11
 cde:	43000013          	li	zero,1072
 ce2:	8289                	srli	a3,a3,0x2
 ce4:	0001                	nop
 ce6:	0111                	addi	sp,sp,4
 ce8:	4295                	li	t0,5
 cea:	3119                	jal	8f0 <_prog_start-0x1ffff710>
 cec:	44000013          	li	zero,1088
 cf0:	002e                	c.slli	zero,0xb
 cf2:	193c193f 0e030e6e 	0xe030e6e193c193f
 cfa:	0b3a                	slli	s6,s6,0xe
 cfc:	00000b3b          	0xb3b
 d00:	0100                	addi	s0,sp,128
 d02:	0011                	c.nop	4
 d04:	0610                	addi	a2,sp,768
 d06:	0111                	addi	sp,sp,4
 d08:	0112                	slli	sp,sp,0x4
 d0a:	0e1b0e03          	lb	t3,225(s6)
 d0e:	0e25                	addi	t3,t3,9
 d10:	00000513          	li	a0,0
	...

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
       0:	03d8                	addi	a4,sp,452
       2:	2000                	fld	fs0,0(s0)
       4:	03ec                	addi	a1,sp,460
       6:	2000                	fld	fs0,0(s0)
       8:	0006                	c.slli	zero,0x1
       a:	000c                	0xc
       c:	0100                	addi	s0,sp,128
       e:	9f20                	0x9f20
	...
      18:	029c                	addi	a5,sp,320
      1a:	2000                	fld	fs0,0(s0)
      1c:	0394                	addi	a3,sp,448
      1e:	2000                	fld	fs0,0(s0)
      20:	0001                	nop
      22:	8c60                	0x8c60
      24:	0004                	0x4
      26:	a020                	fsd	fs0,64(s0)
      28:	0004                	0x4
      2a:	0120                	addi	s0,sp,136
      2c:	6000                	flw	fs0,0(s0)
	...
      36:	004e                	c.slli	zero,0x13
      38:	0000                	unimp
      3a:	0054                	addi	a3,sp,4
      3c:	0000                	unimp
      3e:	0001                	nop
      40:	545a                	lw	s0,180(sp)
      42:	0000                	unimp
      44:	6400                	flw	fs0,8(s0)
      46:	0000                	unimp
      48:	0300                	addi	s0,sp,384
      4a:	7a00                	flw	fs0,48(a2)
      4c:	9f01                	0x9f01
      4e:	0064                	addi	s1,sp,12
      50:	0000                	unimp
      52:	0080                	addi	s0,sp,64
      54:	0000                	unimp
      56:	0004                	0x4
      58:	9f5a01f3          	0x9f5a01f3
	...
      64:	004e                	c.slli	zero,0x13
      66:	0000                	unimp
      68:	0068                	addi	a0,sp,12
      6a:	0000                	unimp
      6c:	0004                	0x4
      6e:	4240                	lw	s0,4(a2)
      70:	9f24                	0x9f24
      72:	0072                	c.slli	zero,0x1c
      74:	0000                	unimp
      76:	0076                	c.slli	zero,0x1d
      78:	0000                	unimp
      7a:	0004                	0x4
      7c:	4240                	lw	s0,4(a2)
      7e:	9f24                	0x9f24
	...
      8c:	001a                	c.slli	zero,0x6
      8e:	0000                	unimp
      90:	0001                	nop
      92:	1a5a                	slli	s4,s4,0x36
      94:	0000                	unimp
      96:	2400                	fld	fs0,8(s0)
      98:	0000                	unimp
      9a:	0400                	addi	s0,sp,512
      9c:	7e00                	flw	fs0,56(a2)
      9e:	2000                	fld	fs0,0(s0)
      a0:	009f 0000 0000      	0x9f
      a6:	0000                	unimp
      a8:	8600                	0x8600
      aa:	ae00000b          	0xae00000b
      ae:	0400000b          	0x400000b
      b2:	0a00                	addi	s0,sp,272
      b4:	8000                	0x8000
      b6:	009f 0000 0000      	0x9f
      bc:	0000                	unimp
      be:	8600                	0x8600
      c0:	ae00000b          	0xae00000b
      c4:	0400000b          	0x400000b
      c8:	0a00                	addi	s0,sp,272
      ca:	0bb8                	addi	a4,sp,472
      cc:	009f 0000 0000      	0x9f
      d2:	0000                	unimp
      d4:	c600                	sw	s0,8(a2)
      d6:	000a                	c.slli	zero,0x2
      d8:	2500                	fld	fs0,8(a0)
      da:	0100000b          	0x100000b
      de:	5a00                	lw	s0,48(a2)
      e0:	0b25                	addi	s6,s6,9
      e2:	0000                	unimp
      e4:	0b4e                	slli	s6,s6,0x13
      e6:	0000                	unimp
      e8:	0001                	nop
      ea:	000b4e63          	bltz	s6,106 <_prog_start-0x1ffffefa>
      ee:	5800                	lw	s0,48(s0)
      f0:	0400000b          	0x400000b
      f4:	f300                	fsw	fs0,32(a4)
      f6:	5a01                	li	s4,-32
      f8:	589f 000b 6200      	0x6200000b589f
      fe:	0100000b          	0x100000b
     102:	6300                	flw	fs0,0(a4)
     104:	0b62                	slli	s6,s6,0x18
     106:	0000                	unimp
     108:	0b6a                	slli	s6,s6,0x1a
     10a:	0000                	unimp
     10c:	0004                	0x4
     10e:	9f5a01f3          	0x9f5a01f3
     112:	0b6a                	slli	s6,s6,0x1a
     114:	0000                	unimp
     116:	0b6e                	slli	s6,s6,0x1b
     118:	0000                	unimp
     11a:	0001                	nop
     11c:	6e5a                	flw	ft8,148(sp)
     11e:	7000000b          	0x7000000b
     122:	0400000b          	0x400000b
     126:	f300                	fsw	fs0,32(a4)
     128:	5a01                	li	s4,-32
     12a:	009f 0000 0000      	0x9f
     130:	0000                	unimp
     132:	c600                	sw	s0,8(a2)
     134:	000a                	c.slli	zero,0x2
     136:	2500                	fld	fs0,8(a0)
     138:	0100000b          	0x100000b
     13c:	5b00                	lw	s0,48(a4)
     13e:	0b25                	addi	s6,s6,9
     140:	0000                	unimp
     142:	0b4a                	slli	s6,s6,0x12
     144:	0000                	unimp
     146:	0001                	nop
     148:	4a59                	li	s4,22
     14a:	5800000b          	0x5800000b
     14e:	0400000b          	0x400000b
     152:	f300                	fsw	fs0,32(a4)
     154:	5b01                	li	s6,-32
     156:	589f 000b 5e00      	0x5e00000b589f
     15c:	0100000b          	0x100000b
     160:	5900                	lw	s0,48(a0)
     162:	0b5e                	slli	s6,s6,0x17
     164:	0000                	unimp
     166:	0b6a                	slli	s6,s6,0x1a
     168:	0000                	unimp
     16a:	0004                	0x4
     16c:	9f5b01f3          	0x9f5b01f3
     170:	0b6a                	slli	s6,s6,0x1a
     172:	0000                	unimp
     174:	0b70                	addi	a2,sp,412
     176:	0000                	unimp
     178:	0001                	nop
     17a:	0000005b          	0x5b
     17e:	0000                	unimp
     180:	0000                	unimp
     182:	c600                	sw	s0,8(a2)
     184:	000a                	c.slli	zero,0x2
     186:	2500                	fld	fs0,8(a0)
     188:	0100000b          	0x100000b
     18c:	5c00                	lw	s0,56(s0)
     18e:	0b25                	addi	s6,s6,9
     190:	0000                	unimp
     192:	0b48                	addi	a0,sp,404
     194:	0000                	unimp
     196:	0001                	nop
     198:	4858                	lw	a4,20(s0)
     19a:	5800000b          	0x5800000b
     19e:	0400000b          	0x400000b
     1a2:	f300                	fsw	fs0,32(a4)
     1a4:	5c01                	li	s8,-32
     1a6:	589f 000b 5c00      	0x5c00000b589f
     1ac:	0100000b          	0x100000b
     1b0:	5800                	lw	s0,48(s0)
     1b2:	0b5c                	addi	a5,sp,404
     1b4:	0000                	unimp
     1b6:	0b6a                	slli	s6,s6,0x1a
     1b8:	0000                	unimp
     1ba:	0004                	0x4
     1bc:	9f5c01f3          	0x9f5c01f3
     1c0:	0b6a                	slli	s6,s6,0x1a
     1c2:	0000                	unimp
     1c4:	0b70                	addi	a2,sp,412
     1c6:	0000                	unimp
     1c8:	0001                	nop
     1ca:	005c                	addi	a5,sp,4
     1cc:	0000                	unimp
     1ce:	0000                	unimp
     1d0:	0000                	unimp
     1d2:	c600                	sw	s0,8(a2)
     1d4:	000a                	c.slli	zero,0x2
     1d6:	ee00                	fsw	fs0,24(a2)
     1d8:	000a                	c.slli	zero,0x2
     1da:	0200                	addi	s0,sp,256
     1dc:	3000                	fld	fs0,32(s0)
     1de:	ee9f 000a 0a00      	0xa00000aee9f
     1e4:	0100000b          	0x100000b
     1e8:	5d00                	lw	s0,56(a0)
	...
     1f2:	0aca                	slli	s5,s5,0x12
     1f4:	0000                	unimp
     1f6:	0ada                	slli	s5,s5,0x16
     1f8:	0000                	unimp
     1fa:	0001                	nop
     1fc:	ee5a                	fsw	fs6,28(sp)
     1fe:	000a                	c.slli	zero,0x2
     200:	f400                	fsw	fs0,40(s0)
     202:	000a                	c.slli	zero,0x2
     204:	0600                	addi	s0,sp,768
     206:	7a00                	flw	fs0,48(a2)
     208:	7d00                	flw	fs0,56(a0)
     20a:	2200                	fld	fs0,0(a2)
     20c:	029f 000b 0a00      	0xa00000b029f
     212:	0600000b          	0x600000b
     216:	7a00                	flw	fs0,48(a2)
     218:	7d00                	flw	fs0,56(a0)
     21a:	2200                	fld	fs0,0(a2)
     21c:	009f 0000 0000      	0x9f
     222:	0000                	unimp
     224:	3200                	fld	fs0,32(a2)
     226:	3c00000b          	0x3c00000b
     22a:	0500000b          	0x500000b
     22e:	3a00                	fld	fs0,48(a2)
     230:	0082                	c.slli64	ra
     232:	9f1c                	0x9f1c
     234:	0b3c                	addi	a5,sp,408
     236:	0000                	unimp
     238:	0b3e                	slli	s6,s6,0xf
     23a:	0000                	unimp
     23c:	0005                	c.nop	1
     23e:	1c00823b          	0x1c00823b
     242:	3e9f 000b 4c00      	0x4c00000b3e9f
     248:	0500000b          	0x500000b
     24c:	3a00                	fld	fs0,48(a2)
     24e:	0082                	c.slli64	ra
     250:	9f1c                	0x9f1c
	...
     25a:	09f6                	slli	s3,s3,0x1d
     25c:	0000                	unimp
     25e:	00000a0f          	0xa0f
     262:	0001                	nop
     264:	0f5a                	slli	t5,t5,0x16
     266:	000a                	c.slli	zero,0x2
     268:	ba00                	fsd	fs0,48(a2)
     26a:	000a                	c.slli	zero,0x2
     26c:	0100                	addi	s0,sp,128
     26e:	6400                	flw	fs0,8(s0)
     270:	0aba                	slli	s5,s5,0xe
     272:	0000                	unimp
     274:	0ac2                	slli	s5,s5,0x10
     276:	0000                	unimp
     278:	0004                	0x4
     27a:	9f5a01f3          	0x9f5a01f3
     27e:	0ac2                	slli	s5,s5,0x10
     280:	0000                	unimp
     282:	0ac6                	slli	s5,s5,0x11
     284:	0000                	unimp
     286:	0001                	nop
     288:	0064                	addi	s1,sp,12
     28a:	0000                	unimp
     28c:	0000                	unimp
     28e:	0000                	unimp
     290:	f600                	fsw	fs0,40(a2)
     292:	0009                	c.nop	2
     294:	0f00                	addi	s0,sp,912
     296:	000a                	c.slli	zero,0x2
     298:	0100                	addi	s0,sp,128
     29a:	5b00                	lw	s0,48(a4)
     29c:	00000a0f          	0xa0f
     2a0:	0ab2                	slli	s5,s5,0xc
     2a2:	0000                	unimp
     2a4:	0001                	nop
     2a6:	b258                	fsd	fa4,160(a2)
     2a8:	000a                	c.slli	zero,0x2
     2aa:	c200                	sw	s0,0(a2)
     2ac:	000a                	c.slli	zero,0x2
     2ae:	0400                	addi	s0,sp,512
     2b0:	f300                	fsw	fs0,32(a4)
     2b2:	5b01                	li	s6,-32
     2b4:	c29f 000a c600      	0xc600000ac29f
     2ba:	000a                	c.slli	zero,0x2
     2bc:	0100                	addi	s0,sp,128
     2be:	5800                	lw	s0,48(s0)
	...
     2c8:	09f6                	slli	s3,s3,0x1d
     2ca:	0000                	unimp
     2cc:	00000a0f          	0xa0f
     2d0:	0001                	nop
     2d2:	0f5c                	addi	a5,sp,916
     2d4:	000a                	c.slli	zero,0x2
     2d6:	b800                	fsd	fs0,48(s0)
     2d8:	000a                	c.slli	zero,0x2
     2da:	0100                	addi	s0,sp,128
     2dc:	6300                	flw	fs0,0(a4)
     2de:	0ab8                	addi	a4,sp,344
     2e0:	0000                	unimp
     2e2:	0ac2                	slli	s5,s5,0x10
     2e4:	0000                	unimp
     2e6:	0004                	0x4
     2e8:	9f5c01f3          	0x9f5c01f3
     2ec:	0ac2                	slli	s5,s5,0x10
     2ee:	0000                	unimp
     2f0:	0ac6                	slli	s5,s5,0x11
     2f2:	0000                	unimp
     2f4:	0001                	nop
     2f6:	00000063          	beqz	zero,2f6 <_prog_start-0x1ffffd0a>
     2fa:	0000                	unimp
     2fc:	0000                	unimp
     2fe:	f600                	fsw	fs0,40(a2)
     300:	0009                	c.nop	2
     302:	0f00                	addi	s0,sp,912
     304:	000a                	c.slli	zero,0x2
     306:	0100                	addi	s0,sp,128
     308:	5d00                	lw	s0,56(a0)
     30a:	00000a0f          	0xa0f
     30e:	0ac6                	slli	s5,s5,0x11
     310:	0000                	unimp
     312:	0004                	0x4
     314:	9f5d01f3          	0x9f5d01f3
	...
     320:	0a10                	addi	a2,sp,272
     322:	0000                	unimp
     324:	0a26                	slli	s4,s4,0x9
     326:	0000                	unimp
     328:	0002                	c.slli64	zero
     32a:	9f30                	0x9f30
     32c:	0a26                	slli	s4,s4,0x9
     32e:	0000                	unimp
     330:	0a28                	addi	a0,sp,280
     332:	0000                	unimp
     334:	0008                	0x8
     336:	0082                	c.slli64	ra
     338:	0084                	addi	s1,sp,64
     33a:	231c                	fld	fa5,0(a4)
     33c:	9f01                	0x9f01
     33e:	0a28                	addi	a0,sp,280
     340:	0000                	unimp
     342:	0a3a                	slli	s4,s4,0xe
     344:	0000                	unimp
     346:	0006                	c.slli	zero,0x1
     348:	0082                	c.slli64	ra
     34a:	0084                	addi	s1,sp,64
     34c:	9f1c                	0x9f1c
     34e:	0a3a                	slli	s4,s4,0xe
     350:	0000                	unimp
     352:	0a3c                	addi	a5,sp,280
     354:	0000                	unimp
     356:	0008                	0x8
     358:	0082                	c.slli64	ra
     35a:	0084                	addi	s1,sp,64
     35c:	231c                	fld	fa5,0(a4)
     35e:	9f01                	0x9f01
     360:	0a3c                	addi	a5,sp,280
     362:	0000                	unimp
     364:	0a40                	addi	s0,sp,276
     366:	0000                	unimp
     368:	0006                	c.slli	zero,0x1
     36a:	0082                	c.slli64	ra
     36c:	0084                	addi	s1,sp,64
     36e:	9f1c                	0x9f1c
	...
     378:	0a2e                	slli	s4,s4,0xb
     37a:	0000                	unimp
     37c:	0a3a                	slli	s4,s4,0xe
     37e:	0000                	unimp
     380:	0004                	0x4
     382:	500a                	0x500a
     384:	00009fc3          	fmadd.s	ft11,ft1,ft0,ft0,rtz
     388:	0000                	unimp
     38a:	0000                	unimp
     38c:	0000                	unimp
     38e:	0a2e                	slli	s4,s4,0xb
     390:	0000                	unimp
     392:	0a39                	addi	s4,s4,14
     394:	0000                	unimp
     396:	0001                	nop
     398:	0000005b          	0x5b
     39c:	0000                	unimp
     39e:	0000                	unimp
     3a0:	2e00                	fld	fs0,24(a2)
     3a2:	000a                	c.slli	zero,0x2
     3a4:	3a00                	fld	fs0,48(a2)
     3a6:	000a                	c.slli	zero,0x2
     3a8:	0100                	addi	s0,sp,128
     3aa:	6200                	flw	fs0,0(a2)
	...
     3b4:	0a50                	addi	a2,sp,276
     3b6:	0000                	unimp
     3b8:	0a76                	slli	s4,s4,0x1d
     3ba:	0000                	unimp
     3bc:	0004                	0x4
     3be:	b80a                	fsd	ft2,48(sp)
     3c0:	00009f0b          	0x9f0b
     3c4:	0000                	unimp
     3c6:	0000                	unimp
     3c8:	0000                	unimp
     3ca:	085c                	addi	a5,sp,20
     3cc:	0000                	unimp
     3ce:	0882                	c.slli64	a7
     3d0:	0000                	unimp
     3d2:	0001                	nop
     3d4:	825a                	mv	tp,s6
     3d6:	0008                	0x8
     3d8:	d800                	sw	s0,48(s0)
     3da:	0008                	0x8
     3dc:	0400                	addi	s0,sp,512
     3de:	f300                	fsw	fs0,32(a4)
     3e0:	5a01                	li	s4,-32
     3e2:	d89f 0008 dc00      	0xdc000008d89f
     3e8:	0008                	0x8
     3ea:	0100                	addi	s0,sp,128
     3ec:	5a00                	lw	s0,48(a2)
     3ee:	08dc                	addi	a5,sp,84
     3f0:	0000                	unimp
     3f2:	091a                	slli	s2,s2,0x6
     3f4:	0000                	unimp
     3f6:	0004                	0x4
     3f8:	9f5a01f3          	0x9f5a01f3
	...
     404:	0872                	slli	a6,a6,0x1c
     406:	0000                	unimp
     408:	087e                	slli	a6,a6,0x1f
     40a:	0000                	unimp
     40c:	0002                	c.slli64	zero
     40e:	087e9f33          	0x87e9f33
     412:	0000                	unimp
     414:	088a                	slli	a7,a7,0x2
     416:	0000                	unimp
     418:	0002                	c.slli64	zero
     41a:	9f32                	add	t5,t5,a2
     41c:	088a                	slli	a7,a7,0x2
     41e:	0000                	unimp
     420:	08ae                	slli	a7,a7,0xb
     422:	0000                	unimp
     424:	0002                	c.slli64	zero
     426:	9f31                	0x9f31
     428:	08d8                	addi	a4,sp,84
     42a:	0000                	unimp
     42c:	08de                	slli	a7,a7,0x17
     42e:	0000                	unimp
     430:	0002                	c.slli64	zero
     432:	08f69f33          	0x8f69f33
     436:	0000                	unimp
     438:	0912                	slli	s2,s2,0x4
     43a:	0000                	unimp
     43c:	0002                	c.slli64	zero
     43e:	9f31                	0x9f31
     440:	0912                	slli	s2,s2,0x4
     442:	0000                	unimp
     444:	091a                	slli	s2,s2,0x6
     446:	0000                	unimp
     448:	0002                	c.slli64	zero
     44a:	9f32                	add	t5,t5,a2
	...
     454:	08a6                	slli	a7,a7,0x9
     456:	0000                	unimp
     458:	08ae                	slli	a7,a7,0xb
     45a:	0000                	unimp
     45c:	7f7b0003          	lb	zero,2039(s6)
     460:	b69f 0008 cb00      	0xcb000008b69f
     466:	0008                	0x8
     468:	0100                	addi	s0,sp,128
     46a:	5b00                	lw	s0,48(a4)
     46c:	08e2                	slli	a7,a7,0x18
     46e:	0000                	unimp
     470:	08f6                	slli	a7,a7,0x1d
     472:	0000                	unimp
     474:	7f7e0003          	lb	zero,2039(t3) # fffe67f7 <_sp+0x7ffe27f7>
     478:	f69f 0008 fc00      	0xfc000008f69f
     47e:	0008                	0x8
     480:	0300                	addi	s0,sp,384
     482:	7b00                	flw	fs0,48(a4)
     484:	9f7f                	0x9f7f
     486:	08fc                	addi	a5,sp,92
     488:	0000                	unimp
     48a:	0900                	addi	s0,sp,144
     48c:	0000                	unimp
     48e:	7f7e0003          	lb	zero,2039(t3)
     492:	009f 0000 0000      	0x9f
     498:	0000                	unimp
     49a:	7200                	flw	fs0,32(a2)
     49c:	0008                	0x8
     49e:	9a00                	0x9a00
     4a0:	0008                	0x8
     4a2:	0200                	addi	s0,sp,256
     4a4:	3300                	fld	fs0,32(a4)
     4a6:	9a9f 0008 9e00      	0x9e0000089a9f
     4ac:	0008                	0x8
     4ae:	0200                	addi	s0,sp,256
     4b0:	3200                	fld	fs0,32(a2)
     4b2:	9e9f 0008 ae00      	0xae0000089e9f
     4b8:	0008                	0x8
     4ba:	0200                	addi	s0,sp,256
     4bc:	3100                	fld	fs0,32(a0)
     4be:	ae9f 0008 cb00      	0xcb000008ae9f
     4c4:	0008                	0x8
     4c6:	0100                	addi	s0,sp,128
     4c8:	5c00                	lw	s0,56(s0)
     4ca:	08d8                	addi	a4,sp,84
     4cc:	0000                	unimp
     4ce:	08de                	slli	a7,a7,0x17
     4d0:	0000                	unimp
     4d2:	0002                	c.slli64	zero
     4d4:	08de9f33          	0x8de9f33
     4d8:	0000                	unimp
     4da:	08f2                	slli	a7,a7,0x1c
     4dc:	0000                	unimp
     4de:	0001                	nop
     4e0:	f25c                	fsw	fa5,36(a2)
     4e2:	0008                	0x8
     4e4:	f600                	fsw	fs0,40(a2)
     4e6:	0008                	0x8
     4e8:	0300                	addi	s0,sp,384
     4ea:	7c00                	flw	fs0,56(s0)
     4ec:	9f01                	0x9f01
     4ee:	08f6                	slli	a7,a7,0x1d
     4f0:	0000                	unimp
     4f2:	0900                	addi	s0,sp,144
     4f4:	0000                	unimp
     4f6:	0002                	c.slli64	zero
     4f8:	9f31                	0x9f31
     4fa:	0900                	addi	s0,sp,144
     4fc:	0000                	unimp
     4fe:	0908                	addi	a0,sp,144
     500:	0000                	unimp
     502:	0002                	c.slli64	zero
     504:	9f32                	add	t5,t5,a2
     506:	0908                	addi	a0,sp,144
     508:	0000                	unimp
     50a:	091a                	slli	s2,s2,0x6
     50c:	0000                	unimp
     50e:	0002                	c.slli64	zero
     510:	00009f33          	sll	t5,ra,zero
     514:	0000                	unimp
     516:	0000                	unimp
     518:	0000                	unimp
     51a:	0872                	slli	a6,a6,0x1c
     51c:	0000                	unimp
     51e:	0884                	addi	s1,sp,80
     520:	0000                	unimp
     522:	0001                	nop
     524:	0008845b          	0x8845b
     528:	8600                	0x8600
     52a:	0008                	0x8
     52c:	1000                	addi	s0,sp,32
     52e:	f300                	fsw	fs0,32(a4)
     530:	5a01                	li	s4,-32
     532:	200c25f7          	0x200c25f7
     536:	07a1                	addi	a5,a5,8
     538:	f700                	fsw	fs0,40(a4)
     53a:	1b25                	addi	s6,s6,-23
     53c:	869f00f7          	0x869f00f7
     540:	0008                	0x8
     542:	8c00                	0x8c00
     544:	0008                	0x8
     546:	0100                	addi	s0,sp,128
     548:	5b00                	lw	s0,48(a4)
     54a:	088c                	addi	a1,sp,80
     54c:	0000                	unimp
     54e:	088e                	slli	a7,a7,0x3
     550:	0000                	unimp
     552:	0015                	c.nop	5
     554:	f75a01f3          	0xf75a01f3
     558:	0c25                	addi	s8,s8,9
     55a:	a120                	fsd	fs0,64(a0)
     55c:	25f70007          	0x25f70007
     560:	7a00f71b          	0x7a00f71b
     564:	2200                	fld	fs0,0(a2)
     566:	2632                	fld	fa2,264(sp)
     568:	8e9f 0008 9200      	0x920000088e9f
     56e:	0008                	0x8
     570:	1400                	addi	s0,sp,544
     572:	f300                	fsw	fs0,32(a4)
     574:	5a01                	li	s4,-32
     576:	200c25f7          	0x200c25f7
     57a:	07a1                	addi	a5,a5,8
     57c:	f700                	fsw	fs0,40(a4)
     57e:	1b25                	addi	s6,s6,-23
     580:	1e3300f7          	0x1e3300f7
     584:	2632                	fld	fa2,264(sp)
     586:	929f 0008 9a00      	0x9a000008929f
     58c:	0008                	0x8
     58e:	0100                	addi	s0,sp,128
     590:	5a00                	lw	s0,48(a2)
     592:	089a                	slli	a7,a7,0x6
     594:	0000                	unimp
     596:	08a2                	slli	a7,a7,0x8
     598:	0000                	unimp
     59a:	0001                	nop
     59c:	0008a25b          	0x8a25b
     5a0:	ae00                	fsd	fs0,24(a2)
     5a2:	0008                	0x8
     5a4:	0100                	addi	s0,sp,128
     5a6:	5d00                	lw	s0,56(a0)
     5a8:	08ae                	slli	a7,a7,0xb
     5aa:	0000                	unimp
     5ac:	08b0                	addi	a2,sp,88
     5ae:	0000                	unimp
     5b0:	0001                	nop
     5b2:	0008d85b          	0x8d85b
     5b6:	f400                	fsw	fs0,40(s0)
     5b8:	0008                	0x8
     5ba:	0100                	addi	s0,sp,128
     5bc:	5b00                	lw	s0,48(a4)
     5be:	08f6                	slli	a7,a7,0x1d
     5c0:	0000                	unimp
     5c2:	0900                	addi	s0,sp,144
     5c4:	0000                	unimp
     5c6:	0001                	nop
     5c8:	005d                	c.nop	23
     5ca:	0009                	c.nop	2
     5cc:	0800                	addi	s0,sp,16
     5ce:	0009                	c.nop	2
     5d0:	0100                	addi	s0,sp,128
     5d2:	5b00                	lw	s0,48(a4)
     5d4:	0908                	addi	a0,sp,144
     5d6:	0000                	unimp
     5d8:	090e                	slli	s2,s2,0x3
     5da:	0000                	unimp
     5dc:	0001                	nop
     5de:	0e5a                	slli	t3,t3,0x16
     5e0:	0009                	c.nop	2
     5e2:	1a00                	addi	s0,sp,304
     5e4:	0009                	c.nop	2
     5e6:	0100                	addi	s0,sp,128
     5e8:	5b00                	lw	s0,48(a4)
	...
     5f2:	08b6                	slli	a7,a7,0xd
     5f4:	0000                	unimp
     5f6:	08ca                	slli	a7,a7,0x12
     5f8:	0000                	unimp
     5fa:	0002                	c.slli64	zero
     5fc:	9f3a                	add	t5,t5,a4
	...
     606:	0766                	slli	a4,a4,0x19
     608:	0000                	unimp
     60a:	07f6                	slli	a5,a5,0x1d
     60c:	0000                	unimp
     60e:	0001                	nop
     610:	f65a                	fsw	fs6,44(sp)
     612:	5c000007          	0x5c000007
     616:	0008                	0x8
     618:	0400                	addi	s0,sp,512
     61a:	f300                	fsw	fs0,32(a4)
     61c:	5a01                	li	s4,-32
     61e:	009f 0000 0000      	0x9f
     624:	0000                	unimp
     626:	6600                	flw	fs0,8(a2)
     628:	da000007          	0xda000007
     62c:	01000007          	0x1000007
     630:	5b00                	lw	s0,48(a4)
     632:	07da                	slli	a5,a5,0x16
     634:	0000                	unimp
     636:	085c                	addi	a5,sp,20
     638:	0000                	unimp
     63a:	0004                	0x4
     63c:	9f5b01f3          	0x9f5b01f3
	...
     648:	0766                	slli	a4,a4,0x19
     64a:	0000                	unimp
     64c:	07ca                	slli	a5,a5,0x12
     64e:	0000                	unimp
     650:	0001                	nop
     652:	ca5c                	sw	a5,20(a2)
     654:	5c000007          	0x5c000007
     658:	0008                	0x8
     65a:	0400                	addi	s0,sp,512
     65c:	f300                	fsw	fs0,32(a4)
     65e:	5c01                	li	s8,-32
     660:	009f 0000 0000      	0x9f
     666:	0000                	unimp
     668:	8400                	0x8400
     66a:	98000007          	0x98000007
     66e:	02000007          	0x2000007
     672:	3a00                	fld	fs0,48(a2)
     674:	009f 0000 0000      	0x9f
     67a:	0000                	unimp
     67c:	aa00                	fsd	fs0,16(a2)
     67e:	be000007          	0xbe000007
     682:	02000007          	0x2000007
     686:	3500                	fld	fs0,40(a0)
     688:	009f 0000 0000      	0x9f
     68e:	0000                	unimp
     690:	0000                	unimp
     692:	0008                	0x8
     694:	1800                	addi	s0,sp,48
     696:	0008                	0x8
     698:	0200                	addi	s0,sp,256
     69a:	3a00                	fld	fs0,48(a2)
     69c:	009f 0000 0000      	0x9f
     6a2:	0000                	unimp
     6a4:	7600                	flw	fs0,40(a2)
     6a6:	0006                	c.slli	zero,0x1
     6a8:	0200                	addi	s0,sp,256
     6aa:	01000007          	0x1000007
     6ae:	5a00                	lw	s0,48(a2)
     6b0:	0702                	c.slli64	a4
     6b2:	0000                	unimp
     6b4:	0766                	slli	a4,a4,0x19
     6b6:	0000                	unimp
     6b8:	0004                	0x4
     6ba:	9f5a01f3          	0x9f5a01f3
	...
     6c6:	0676                	slli	a2,a2,0x1d
     6c8:	0000                	unimp
     6ca:	0708                	addi	a0,sp,896
     6cc:	0000                	unimp
     6ce:	0001                	nop
     6d0:	0007085b          	0x7085b
     6d4:	6600                	flw	fs0,8(a2)
     6d6:	04000007          	0x4000007
     6da:	f300                	fsw	fs0,32(a4)
     6dc:	5b01                	li	s6,-32
     6de:	009f 0000 0000      	0x9f
     6e4:	0000                	unimp
     6e6:	8e00                	0x8e00
     6e8:	0006                	c.slli	zero,0x1
     6ea:	a400                	fsd	fs0,8(s0)
     6ec:	0006                	c.slli	zero,0x1
     6ee:	0300                	addi	s0,sp,384
     6f0:	0800                	addi	s0,sp,16
     6f2:	9f64                	0x9f64
	...
     6fc:	06b2                	slli	a3,a3,0xc
     6fe:	0000                	unimp
     700:	06ca                	slli	a3,a3,0x12
     702:	0000                	unimp
     704:	32080003          	lb	zero,800(a6) # 590b5f74 <_data_lma+0x390b3c34>
     708:	009f 0000 0000      	0x9f
     70e:	0000                	unimp
     710:	e800                	fsw	fs0,16(s0)
     712:	0006                	c.slli	zero,0x1
     714:	fa00                	fsw	fs0,48(a2)
     716:	0006                	c.slli	zero,0x1
     718:	0300                	addi	s0,sp,384
     71a:	0800                	addi	s0,sp,16
     71c:	9f64                	0x9f64
	...
     726:	0716                	slli	a4,a4,0x5
     728:	0000                	unimp
     72a:	072e                	slli	a4,a4,0xb
     72c:	0000                	unimp
     72e:	32080003          	lb	zero,800(a6)
     732:	009f 0000 0000      	0x9f
     738:	0000                	unimp
     73a:	3c00                	fld	fs0,56(s0)
     73c:	50000007          	0x50000007
     740:	03000007          	0x3000007
     744:	0800                	addi	s0,sp,16
     746:	9f32                	add	t5,t5,a2
	...
     750:	0574                	addi	a3,sp,652
     752:	0000                	unimp
     754:	05f8                	addi	a4,sp,716
     756:	0000                	unimp
     758:	0001                	nop
     75a:	f85a                	fsw	fs6,48(sp)
     75c:	0005                	c.nop	1
     75e:	1c00                	addi	s0,sp,560
     760:	0006                	c.slli	zero,0x1
     762:	0400                	addi	s0,sp,512
     764:	f300                	fsw	fs0,32(a4)
     766:	5a01                	li	s4,-32
     768:	1c9f 0006 7600      	0x760000061c9f
     76e:	0006                	c.slli	zero,0x1
     770:	0100                	addi	s0,sp,128
     772:	5a00                	lw	s0,48(a2)
	...
     77c:	0574                	addi	a3,sp,652
     77e:	0000                	unimp
     780:	058e                	slli	a1,a1,0x3
     782:	0000                	unimp
     784:	64080003          	lb	zero,1600(a6)
     788:	009f 0000 0000      	0x9f
     78e:	0000                	unimp
     790:	b200                	fsd	fs0,32(a2)
     792:	0005                	c.nop	1
     794:	dc00                	sw	s0,56(s0)
     796:	0005                	c.nop	1
     798:	0100                	addi	s0,sp,128
     79a:	6000                	flw	fs0,0(s0)
	...
     7a4:	05b2                	slli	a1,a1,0xc
     7a6:	0000                	unimp
     7a8:	05dc                	addi	a5,sp,708
     7aa:	0000                	unimp
     7ac:	0004                	0x4
     7ae:	b80a                	fsd	ft2,48(sp)
     7b0:	00009f0b          	0x9f0b
     7b4:	0000                	unimp
     7b6:	0000                	unimp
     7b8:	0000                	unimp
     7ba:	0604                	addi	s1,sp,768
     7bc:	0000                	unimp
     7be:	061c                	addi	a5,sp,768
     7c0:	0000                	unimp
     7c2:	64080003          	lb	zero,1600(a6)
     7c6:	009f 0000 0000      	0x9f
     7cc:	0000                	unimp
     7ce:	3a00                	fld	fs0,48(a2)
     7d0:	0006                	c.slli	zero,0x1
     7d2:	6400                	flw	fs0,8(s0)
     7d4:	0006                	c.slli	zero,0x1
     7d6:	0100                	addi	s0,sp,128
     7d8:	6000                	flw	fs0,0(s0)
	...
     7e2:	063a                	slli	a2,a2,0xe
     7e4:	0000                	unimp
     7e6:	0664                	addi	s1,sp,780
     7e8:	0000                	unimp
     7ea:	0004                	0x4
     7ec:	b80a                	fsd	ft2,48(sp)
     7ee:	00009f0b          	0x9f0b
     7f2:	0000                	unimp
     7f4:	0000                	unimp
     7f6:	0000                	unimp
     7f8:	04b8                	addi	a4,sp,584
     7fa:	0000                	unimp
     7fc:	04ca                	slli	s1,s1,0x12
     7fe:	0000                	unimp
     800:	0001                	nop
     802:	ca5a                	sw	s6,20(sp)
     804:	0004                	0x4
     806:	f200                	fsw	fs0,32(a2)
     808:	0004                	0x4
     80a:	0100                	addi	s0,sp,128
     80c:	5800                	lw	s0,48(s0)
     80e:	04f2                	slli	s1,s1,0x1c
     810:	0000                	unimp
     812:	04f8                	addi	a4,sp,588
     814:	0000                	unimp
     816:	0001                	nop
     818:	f85a                	fsw	fs6,48(sp)
     81a:	0004                	0x4
     81c:	0c00                	addi	s0,sp,528
     81e:	0005                	c.nop	1
     820:	0100                	addi	s0,sp,128
     822:	5800                	lw	s0,48(s0)
     824:	050c                	addi	a1,sp,640
     826:	0000                	unimp
     828:	0512                	slli	a0,a0,0x4
     82a:	0000                	unimp
     82c:	0001                	nop
     82e:	005a                	c.slli	zero,0x16
     830:	0000                	unimp
     832:	0000                	unimp
     834:	0000                	unimp
     836:	b800                	fsd	fs0,48(s0)
     838:	0004                	0x4
     83a:	cf00                	sw	s0,24(a4)
     83c:	0004                	0x4
     83e:	0100                	addi	s0,sp,128
     840:	5b00                	lw	s0,48(a4)
     842:	000004cf          	fnmadd.s	fs1,ft0,ft0,ft0,rne
     846:	04f4                	addi	a3,sp,588
     848:	0000                	unimp
     84a:	0001                	nop
     84c:	f459                	bnez	s0,7da <_prog_start-0x1ffff826>
     84e:	0004                	0x4
     850:	f800                	fsw	fs0,48(s0)
     852:	0004                	0x4
     854:	0400                	addi	s0,sp,512
     856:	f300                	fsw	fs0,32(a4)
     858:	5b01                	li	s6,-32
     85a:	f89f 0004 0e00      	0xe000004f89f
     860:	0005                	c.nop	1
     862:	0100                	addi	s0,sp,128
     864:	5900                	lw	s0,48(a0)
     866:	050e                	slli	a0,a0,0x3
     868:	0000                	unimp
     86a:	0512                	slli	a0,a0,0x4
     86c:	0000                	unimp
     86e:	0004                	0x4
     870:	9f5b01f3          	0x9f5b01f3
	...
     87c:	0412                	slli	s0,s0,0x4
     87e:	0000                	unimp
     880:	0438                	addi	a4,sp,520
     882:	0000                	unimp
     884:	0001                	nop
     886:	385a                	fld	fa6,432(sp)
     888:	0004                	0x4
     88a:	8a00                	0x8a00
     88c:	0004                	0x4
     88e:	0100                	addi	s0,sp,128
     890:	5800                	lw	s0,48(s0)
     892:	0496                	slli	s1,s1,0x5
     894:	0000                	unimp
     896:	04b8                	addi	a4,sp,584
     898:	0000                	unimp
     89a:	0001                	nop
     89c:	0058                	addi	a4,sp,4
     89e:	0000                	unimp
     8a0:	0000                	unimp
     8a2:	0000                	unimp
     8a4:	5400                	lw	s0,40(s0)
     8a6:	0004                	0x4
     8a8:	5c00                	lw	s0,56(s0)
     8aa:	0004                	0x4
     8ac:	0500                	addi	s0,sp,640
     8ae:	3800                	fld	fs0,48(s0)
     8b0:	0082                	c.slli64	ra
     8b2:	9f1c                	0x9f1c
     8b4:	045c                	addi	a5,sp,516
     8b6:	0000                	unimp
     8b8:	0460                	addi	s0,sp,524
     8ba:	0000                	unimp
     8bc:	0005                	c.nop	1
     8be:	1c008237          	lui	tp,0x1c008
     8c2:	649f 0004 8000      	0x80000004649f
     8c8:	0004                	0x4
     8ca:	0500                	addi	s0,sp,640
     8cc:	3800                	fld	fs0,48(s0)
     8ce:	0082                	c.slli64	ra
     8d0:	9f1c                	0x9f1c
     8d2:	0480                	addi	s0,sp,576
     8d4:	0000                	unimp
     8d6:	0482                	c.slli64	s1
     8d8:	0000                	unimp
     8da:	0005                	c.nop	1
     8dc:	1c008237          	lui	tp,0x1c008
     8e0:	969f 0004 a400      	0xa4000004969f
     8e6:	0004                	0x4
     8e8:	0500                	addi	s0,sp,640
     8ea:	3800                	fld	fs0,48(s0)
     8ec:	0082                	c.slli64	ra
     8ee:	9f1c                	0x9f1c
	...
     8f8:	0412                	slli	s0,s0,0x4
     8fa:	0000                	unimp
     8fc:	0438                	addi	a4,sp,520
     8fe:	0000                	unimp
     900:	30080003          	lb	zero,768(a6)
     904:	a49f 0004 aa00      	0xaa000004a49f
     90a:	0004                	0x4
     90c:	0300                	addi	s0,sp,384
     90e:	0800                	addi	s0,sp,16
     910:	9f30                	0x9f30
	...
     91a:	0438                	addi	a4,sp,520
     91c:	0000                	unimp
     91e:	04a4                	addi	s1,sp,584
     920:	0000                	unimp
     922:	78080003          	lb	zero,1920(a6)
     926:	aa9f 0004 b800      	0xb8000004aa9f
     92c:	0004                	0x4
     92e:	0300                	addi	s0,sp,384
     930:	0800                	addi	s0,sp,16
     932:	9f78                	0x9f78
	...
     93c:	0474                	addi	a3,sp,524
     93e:	0000                	unimp
     940:	047c                	addi	a5,sp,524
     942:	0000                	unimp
     944:	0001                	nop
     946:	005a                	c.slli	zero,0x16
     948:	0000                	unimp
     94a:	0000                	unimp
     94c:	0000                	unimp
     94e:	5800                	lw	s0,48(s0)
     950:	0004                	0x4
     952:	5a00                	lw	s0,48(a2)
     954:	0004                	0x4
     956:	0100                	addi	s0,sp,128
     958:	5a00                	lw	s0,48(a2)
     95a:	0496                	slli	s1,s1,0x5
     95c:	0000                	unimp
     95e:	04a4                	addi	s1,sp,584
     960:	0000                	unimp
     962:	0001                	nop
     964:	005a                	c.slli	zero,0x16
     966:	0000                	unimp
     968:	0000                	unimp
     96a:	0000                	unimp
     96c:	6e00                	flw	fs0,24(a2)
     96e:	78000003          	lb	zero,1920(zero) # 780 <_prog_start-0x1ffff880>
     972:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     976:	5a00                	lw	s0,48(a2)
     978:	0378                	addi	a4,sp,396
     97a:	0000                	unimp
     97c:	03a8                	addi	a0,sp,456
     97e:	0000                	unimp
     980:	0001                	nop
     982:	a858                	fsd	fa4,144(s0)
     984:	b2000003          	lb	zero,-1248(zero) # fffffb20 <_sp+0x7fffbb20>
     988:	04000003          	lb	zero,64(zero) # 40 <_prog_start-0x1fffffc0>
     98c:	f300                	fsw	fs0,32(a4)
     98e:	5a01                	li	s4,-32
     990:	b29f 0003 c400      	0xc4000003b29f
     996:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     99a:	5800                	lw	s0,48(s0)
     99c:	03c4                	addi	s1,sp,452
     99e:	0000                	unimp
     9a0:	03c8                	addi	a0,sp,452
     9a2:	0000                	unimp
     9a4:	0005                	c.nop	1
     9a6:	0078                	addi	a4,sp,12
     9a8:	1e3a                	slli	t3,t3,0x2e
     9aa:	d89f 0003 ee00      	0xee000003d89f
     9b0:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     9b4:	5800                	lw	s0,48(s0)
     9b6:	03ee                	slli	t2,t2,0x1b
     9b8:	0000                	unimp
     9ba:	03f4                	addi	a3,sp,460
     9bc:	0000                	unimp
     9be:	0005                	c.nop	1
     9c0:	0078                	addi	a4,sp,12
     9c2:	1e3a                	slli	t3,t3,0x2e
     9c4:	069f 0004 1200      	0x12000004069f
     9ca:	0004                	0x4
     9cc:	0100                	addi	s0,sp,128
     9ce:	5800                	lw	s0,48(s0)
	...
     9d8:	03b2                	slli	t2,t2,0xc
     9da:	0000                	unimp
     9dc:	03c0                	addi	s0,sp,452
     9de:	0000                	unimp
     9e0:	0005                	c.nop	1
     9e2:	1c008233          	0x1c008233
     9e6:	d89f 0003 e600      	0xe6000003d89f
     9ec:	05000003          	lb	zero,80(zero) # 50 <_prog_start-0x1fffffb0>
     9f0:	3300                	fld	fs0,32(a4)
     9f2:	0082                	c.slli64	ra
     9f4:	9f1c                	0x9f1c
     9f6:	03ee                	slli	t2,t2,0x1b
     9f8:	0000                	unimp
     9fa:	03f0                	addi	a2,sp,460
     9fc:	0000                	unimp
     9fe:	0005                	c.nop	1
     a00:	8234                	0x8234
     a02:	1c00                	addi	s0,sp,560
     a04:	f09f 0003 f400      	0xf4000003f09f
     a0a:	05000003          	lb	zero,80(zero) # 50 <_prog_start-0x1fffffb0>
     a0e:	3300                	fld	fs0,32(a4)
     a10:	0082                	c.slli64	ra
     a12:	9f1c                	0x9f1c
	...
     a1c:	03be                	slli	t2,t2,0xf
     a1e:	0000                	unimp
     a20:	000003c3          	fmadd.s	ft7,ft0,ft0,ft0,rne
     a24:	0001                	nop
     a26:	e45a                	fsw	fs6,8(sp)
     a28:	ee000003          	lb	zero,-288(zero) # fffffee0 <_sp+0x7fffbee0>
     a2c:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     a30:	5a00                	lw	s0,48(a2)
	...
     a3a:	02b4                	addi	a3,sp,328
     a3c:	0000                	unimp
     a3e:	02d0                	addi	a2,sp,324
     a40:	0000                	unimp
     a42:	0001                	nop
     a44:	d05a                	sw	s6,32(sp)
     a46:	0002                	c.slli64	zero
     a48:	ee00                	fsw	fs0,24(a2)
     a4a:	0002                	c.slli64	zero
     a4c:	0100                	addi	s0,sp,128
     a4e:	6200                	flw	fs0,0(a2)
     a50:	02f0                	addi	a2,sp,332
     a52:	0000                	unimp
     a54:	02fa                	slli	t0,t0,0x1e
     a56:	0000                	unimp
     a58:	0001                	nop
     a5a:	4062                	0x4062
     a5c:	56000003          	lb	zero,1376(zero) # 560 <_prog_start-0x1ffffaa0>
     a60:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     a64:	5a00                	lw	s0,48(a2)
     a66:	0356                	slli	t1,t1,0x15
     a68:	0000                	unimp
     a6a:	0358                	addi	a4,sp,388
     a6c:	0000                	unimp
     a6e:	0001                	nop
     a70:	5862                	lw	a6,56(sp)
     a72:	62000003          	lb	zero,1568(zero) # 620 <_prog_start-0x1ffff9e0>
     a76:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     a7a:	5a00                	lw	s0,48(a2)
     a7c:	0362                	slli	t1,t1,0x18
     a7e:	0000                	unimp
     a80:	036e                	slli	t1,t1,0x1b
     a82:	0000                	unimp
     a84:	0001                	nop
     a86:	0062                	c.slli	zero,0x18
     a88:	0000                	unimp
     a8a:	0000                	unimp
     a8c:	0000                	unimp
     a8e:	b400                	fsd	fs0,40(s0)
     a90:	0002                	c.slli64	zero
     a92:	d800                	sw	s0,48(s0)
     a94:	0002                	c.slli64	zero
     a96:	0200                	addi	s0,sp,256
     a98:	3000                	fld	fs0,32(s0)
     a9a:	d89f 0002 e400      	0xe4000002d89f
     aa0:	0002                	c.slli64	zero
     aa2:	0100                	addi	s0,sp,128
     aa4:	5800                	lw	s0,48(s0)
     aa6:	02e6                	slli	t0,t0,0x19
     aa8:	0000                	unimp
     aaa:	0332                	slli	t1,t1,0xc
     aac:	0000                	unimp
     aae:	0001                	nop
     ab0:	4058                	lw	a4,4(s0)
     ab2:	6e000003          	lb	zero,1760(zero) # 6e0 <_prog_start-0x1ffff920>
     ab6:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
     aba:	3000                	fld	fs0,32(s0)
     abc:	009f 0000 0000      	0x9f
     ac2:	0000                	unimp
     ac4:	ce00                	sw	s0,24(a2)
     ac6:	0002                	c.slli64	zero
     ac8:	d800                	sw	s0,48(s0)
     aca:	0002                	c.slli64	zero
     acc:	0200                	addi	s0,sp,256
     ace:	3000                	fld	fs0,32(s0)
     ad0:	d89f 0002 da00      	0xda000002d89f
     ad6:	0002                	c.slli64	zero
     ad8:	0100                	addi	s0,sp,128
     ada:	5f00                	lw	s0,56(a4)
     adc:	02da                	slli	t0,t0,0x16
     ade:	0000                	unimp
     ae0:	02f0                	addi	a2,sp,332
     ae2:	0000                	unimp
     ae4:	0001                	nop
     ae6:	f059                	bnez	s0,a6c <_prog_start-0x1ffff594>
     ae8:	0002                	c.slli64	zero
     aea:	f400                	fsw	fs0,40(s0)
     aec:	0002                	c.slli64	zero
     aee:	0100                	addi	s0,sp,128
     af0:	5f00                	lw	s0,56(a4)
     af2:	02fe                	slli	t0,t0,0x1f
     af4:	0000                	unimp
     af6:	0300                	addi	s0,sp,384
     af8:	0000                	unimp
     afa:	0001                	nop
     afc:	0059                	c.nop	22
     afe:	06000003          	lb	zero,96(zero) # 60 <_prog_start-0x1fffffa0>
     b02:	03000003          	lb	zero,48(zero) # 30 <_prog_start-0x1fffffd0>
     b06:	7900                	flw	fs0,48(a0)
     b08:	9f01                	0x9f01
     b0a:	0306                	slli	t1,t1,0x1
     b0c:	0000                	unimp
     b0e:	0326                	slli	t1,t1,0x9
     b10:	0000                	unimp
     b12:	0001                	nop
     b14:	2659                	jal	e9a <_prog_start-0x1ffff166>
     b16:	2a000003          	lb	zero,672(zero) # 2a0 <_prog_start-0x1ffffd60>
     b1a:	03000003          	lb	zero,48(zero) # 30 <_prog_start-0x1fffffd0>
     b1e:	7900                	flw	fs0,48(a0)
     b20:	9f01                	0x9f01
     b22:	032a                	slli	t1,t1,0xa
     b24:	0000                	unimp
     b26:	0334                	addi	a3,sp,392
     b28:	0000                	unimp
     b2a:	0001                	nop
     b2c:	5659                	li	a2,-10
     b2e:	5e000003          	lb	zero,1504(zero) # 5e0 <_prog_start-0x1ffffa20>
     b32:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
     b36:	3000                	fld	fs0,32(s0)
     b38:	6c9f 0003 6e00      	0x6e0000036c9f
     b3e:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
     b42:	3000                	fld	fs0,32(s0)
     b44:	009f 0000 0000      	0x9f
     b4a:	0000                	unimp
     b4c:	fe00                	fsw	fs0,56(a2)
     b4e:	0002                	c.slli64	zero
     b50:	0100                	addi	s0,sp,128
     b52:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
     b56:	5a00                	lw	s0,48(a2)
     b58:	0301                	addi	t1,t1,0
     b5a:	0000                	unimp
     b5c:	0302                	c.slli64	t1
     b5e:	0000                	unimp
     b60:	0008                	0x8
     b62:	0078                	addi	a4,sp,12
     b64:	231d0083          	lb	ra,561(s10) # 1b2231 <_prog_start-0x1fe4ddcf>
     b68:	9f30                	0x9f30
     b6a:	0316                	slli	t1,t1,0x5
     b6c:	0000                	unimp
     b6e:	0324                	addi	s1,sp,392
     b70:	0000                	unimp
     b72:	0001                	nop
     b74:	005a                	c.slli	zero,0x16
     b76:	0000                	unimp
     b78:	0000                	unimp
     b7a:	0000                	unimp
     b7c:	4000                	lw	s0,0(s0)
     b7e:	52000003          	lb	zero,1312(zero) # 520 <_prog_start-0x1ffffae0>
     b82:	03000003          	lb	zero,48(zero) # 30 <_prog_start-0x1fffffd0>
     b86:	0800                	addi	s0,sp,16
     b88:	9f2d                	0x9f2d
     b8a:	035e                	slli	t1,t1,0x17
     b8c:	0000                	unimp
     b8e:	0368                	addi	a0,sp,396
     b90:	0000                	unimp
     b92:	2d080003          	lb	zero,720(a6)
     b96:	009f 0000 0000      	0x9f
     b9c:	0000                	unimp
     b9e:	7800                	flw	fs0,48(s0)
     ba0:	0002                	c.slli64	zero
     ba2:	8800                	0x8800
     ba4:	0002                	c.slli64	zero
     ba6:	0100                	addi	s0,sp,128
     ba8:	5a00                	lw	s0,48(a2)
     baa:	0288                	addi	a0,sp,320
     bac:	0000                	unimp
     bae:	02a4                	addi	s1,sp,328
     bb0:	0000                	unimp
     bb2:	0001                	nop
     bb4:	aa59                	j	d4a <_prog_start-0x1ffff2b6>
     bb6:	0002                	c.slli64	zero
     bb8:	b400                	fsd	fs0,40(s0)
     bba:	0002                	c.slli64	zero
     bbc:	0100                	addi	s0,sp,128
     bbe:	5900                	lw	s0,48(a0)
	...
     bc8:	0294                	addi	a3,sp,320
     bca:	0000                	unimp
     bcc:	00000297          	auipc	t0,0x0
     bd0:	0001                	nop
     bd2:	aa5a                	fsd	fs6,272(sp)
     bd4:	0002                	c.slli64	zero
     bd6:	b400                	fsd	fs0,40(s0)
     bd8:	0002                	c.slli64	zero
     bda:	0100                	addi	s0,sp,128
     bdc:	5a00                	lw	s0,48(a2)
	...
     be6:	01a6                	slli	gp,gp,0x9
     be8:	0000                	unimp
     bea:	01e6                	slli	gp,gp,0x19
     bec:	0000                	unimp
     bee:	0001                	nop
     bf0:	e65a                	fsw	fs6,12(sp)
     bf2:	0001                	nop
     bf4:	5e00                	lw	s0,56(a2)
     bf6:	0002                	c.slli64	zero
     bf8:	0400                	addi	s0,sp,512
     bfa:	f300                	fsw	fs0,32(a4)
     bfc:	5a01                	li	s4,-32
     bfe:	5e9f 0002 6a00      	0x6a0000025e9f
     c04:	0002                	c.slli64	zero
     c06:	0100                	addi	s0,sp,128
     c08:	5a00                	lw	s0,48(a2)
     c0a:	026a                	slli	tp,tp,0x1a
     c0c:	0000                	unimp
     c0e:	0270                	addi	a2,sp,268
     c10:	0000                	unimp
     c12:	0004                	0x4
     c14:	9f5a01f3          	0x9f5a01f3
     c18:	0270                	addi	a2,sp,268
     c1a:	0000                	unimp
     c1c:	0278                	addi	a4,sp,268
     c1e:	0000                	unimp
     c20:	0001                	nop
     c22:	005a                	c.slli	zero,0x16
     c24:	0000                	unimp
     c26:	0000                	unimp
     c28:	0000                	unimp
     c2a:	ca00                	sw	s0,16(a2)
     c2c:	0001                	nop
     c2e:	ce00                	sw	s0,24(a2)
     c30:	0001                	nop
     c32:	0100                	addi	s0,sp,128
     c34:	5f00                	lw	s0,56(a4)
     c36:	0272                	slli	tp,tp,0x1c
     c38:	0000                	unimp
     c3a:	0278                	addi	a4,sp,268
     c3c:	0000                	unimp
     c3e:	0001                	nop
     c40:	005f 0000 0000      	0x5f
     c46:	0000                	unimp
     c48:	a600                	fsd	fs0,8(a2)
     c4a:	0001                	nop
     c4c:	ec00                	fsw	fs0,24(s0)
     c4e:	0001                	nop
     c50:	0200                	addi	s0,sp,256
     c52:	3000                	fld	fs0,32(s0)
     c54:	ec9f 0001 1e00      	0x1e000001ec9f
     c5a:	0002                	c.slli64	zero
     c5c:	0100                	addi	s0,sp,128
     c5e:	5c00                	lw	s0,56(s0)
     c60:	021e                	slli	tp,tp,0x7
     c62:	0000                	unimp
     c64:	022e                	slli	tp,tp,0xb
     c66:	0000                	unimp
     c68:	0001                	nop
     c6a:	2e5e                	fld	ft8,464(sp)
     c6c:	0002                	c.slli64	zero
     c6e:	3000                	fld	fs0,32(s0)
     c70:	0002                	c.slli64	zero
     c72:	0100                	addi	s0,sp,128
     c74:	5c00                	lw	s0,56(s0)
     c76:	0230                	addi	a2,sp,264
     c78:	0000                	unimp
     c7a:	0246                	slli	tp,tp,0x11
     c7c:	0000                	unimp
     c7e:	0002                	c.slli64	zero
     c80:	9f30                	0x9f30
     c82:	0246                	slli	tp,tp,0x11
     c84:	0000                	unimp
     c86:	024a                	slli	tp,tp,0x12
     c88:	0000                	unimp
     c8a:	0001                	nop
     c8c:	505c                	lw	a5,36(s0)
     c8e:	0002                	c.slli64	zero
     c90:	5200                	lw	s0,32(a2)
     c92:	0002                	c.slli64	zero
     c94:	0100                	addi	s0,sp,128
     c96:	5e00                	lw	s0,56(a2)
     c98:	0252                	slli	tp,tp,0x14
     c9a:	0000                	unimp
     c9c:	025e                	slli	tp,tp,0x17
     c9e:	0000                	unimp
     ca0:	0001                	nop
     ca2:	5e5c                	lw	a5,60(a2)
     ca4:	0002                	c.slli64	zero
     ca6:	7800                	flw	fs0,48(s0)
     ca8:	0002                	c.slli64	zero
     caa:	0200                	addi	s0,sp,256
     cac:	3000                	fld	fs0,32(s0)
     cae:	009f 0000 0000      	0x9f
     cb4:	0000                	unimp
     cb6:	a600                	fsd	fs0,8(a2)
     cb8:	0001                	nop
     cba:	ec00                	fsw	fs0,24(s0)
     cbc:	0001                	nop
     cbe:	0200                	addi	s0,sp,256
     cc0:	3000                	fld	fs0,32(s0)
     cc2:	ec9f 0001 4a00      	0x4a000001ec9f
     cc8:	0002                	c.slli64	zero
     cca:	0100                	addi	s0,sp,128
     ccc:	5600                	lw	s0,40(a2)
     cce:	0250                	addi	a2,sp,260
     cd0:	0000                	unimp
     cd2:	025e                	slli	tp,tp,0x17
     cd4:	0000                	unimp
     cd6:	0001                	nop
     cd8:	5e56                	lw	t3,116(sp)
     cda:	0002                	c.slli64	zero
     cdc:	7800                	flw	fs0,48(s0)
     cde:	0002                	c.slli64	zero
     ce0:	0200                	addi	s0,sp,256
     ce2:	3000                	fld	fs0,32(s0)
     ce4:	009f 0000 0000      	0x9f
     cea:	0000                	unimp
     cec:	4400                	lw	s0,8(s0)
     cee:	0001                	nop
     cf0:	4e00                	lw	s0,24(a2)
     cf2:	0001                	nop
     cf4:	0100                	addi	s0,sp,128
     cf6:	5a00                	lw	s0,48(a2)
     cf8:	014e                	slli	sp,sp,0x13
     cfa:	0000                	unimp
     cfc:	0164                	addi	s1,sp,140
     cfe:	0000                	unimp
     d00:	0001                	nop
     d02:	005a                	c.slli	zero,0x16
     d04:	0000                	unimp
     d06:	0000                	unimp
     d08:	0000                	unimp
     d0a:	4e00                	lw	s0,24(a2)
     d0c:	0001                	nop
     d0e:	5200                	lw	s0,32(a2)
     d10:	0001                	nop
     d12:	1400                	addi	s0,sp,544
     d14:	7a00                	flw	fs0,48(a2)
     d16:	3a00                	fld	fs0,48(a2)
     d18:	7a25                	lui	s4,0xfffe9
     d1a:	4e00                	lw	s0,24(a2)
     d1c:	2725                	jal	1444 <_prog_start-0x1fffebbc>
     d1e:	007a                	c.slli	zero,0x1e
     d20:	7a27254f          	fnmadd.d	fa0,fa4,ft2,fa5,rdn
     d24:	2700                	fld	fs0,8(a4)
     d26:	1a31                	addi	s4,s4,-20
     d28:	529f 0001 5600      	0x56000001529f
     d2e:	0001                	nop
     d30:	1200                	addi	s0,sp,288
     d32:	7a00                	flw	fs0,48(a2)
     d34:	3a00                	fld	fs0,48(a2)
     d36:	7a25                	lui	s4,0xfffe9
     d38:	4f00                	lw	s0,24(a4)
     d3a:	2725                	jal	1462 <_prog_start-0x1fffeb9e>
     d3c:	007e                	c.slli	zero,0x1f
     d3e:	27007a27          	0x27007a27
     d42:	1a31                	addi	s4,s4,-20
     d44:	569f 0001 5800      	0x58000001569f
     d4a:	0001                	nop
     d4c:	1000                	addi	s0,sp,32
     d4e:	7a00                	flw	fs0,48(a2)
     d50:	4f00                	lw	s0,24(a4)
     d52:	7f25                	lui	t5,0xfffe9
     d54:	2700                	fld	fs0,8(a4)
     d56:	007e                	c.slli	zero,0x1f
     d58:	27007a27          	0x27007a27
     d5c:	1a31                	addi	s4,s4,-20
     d5e:	589f 0001 5e00      	0x5e000001589f
     d64:	0001                	nop
     d66:	1200                	addi	s0,sp,288
     d68:	7a00                	flw	fs0,48(a2)
     d6a:	3a00                	fld	fs0,48(a2)
     d6c:	7a25                	lui	s4,0xfffe9
     d6e:	4f00                	lw	s0,24(a4)
     d70:	2725                	jal	1498 <_prog_start-0x1fffeb68>
     d72:	007e                	c.slli	zero,0x1f
     d74:	27007a27          	0x27007a27
     d78:	1a31                	addi	s4,s4,-20
     d7a:	5e9f 0001 6400      	0x640000015e9f
     d80:	0001                	nop
     d82:	1400                	addi	s0,sp,544
     d84:	7a00                	flw	fs0,48(a2)
     d86:	3a00                	fld	fs0,48(a2)
     d88:	7a25                	lui	s4,0xfffe9
     d8a:	4e00                	lw	s0,24(a2)
     d8c:	2725                	jal	14b4 <_prog_start-0x1fffeb4c>
     d8e:	007a                	c.slli	zero,0x1e
     d90:	7a27254f          	fnmadd.d	fa0,fa4,ft2,fa5,rdn
     d94:	2700                	fld	fs0,8(a4)
     d96:	1a31                	addi	s4,s4,-20
     d98:	009f 0000 0000      	0x9f
     d9e:	0000                	unimp
     da0:	0e00                	addi	s0,sp,784
     da2:	0000                	unimp
     da4:	2000                	fld	fs0,0(s0)
     da6:	0000                	unimp
     da8:	0100                	addi	s0,sp,128
     daa:	5a00                	lw	s0,48(a2)
     dac:	0020                	addi	s0,sp,8
     dae:	0000                	unimp
     db0:	004e                	c.slli	zero,0x13
     db2:	0000                	unimp
     db4:	0005                	c.nop	1
     db6:	280c                	fld	fa1,16(s0)
     db8:	0100                	addi	s0,sp,128
     dba:	4e10                	lw	a2,24(a2)
     dbc:	0000                	unimp
     dbe:	5600                	lw	s0,40(a2)
     dc0:	0000                	unimp
     dc2:	0200                	addi	s0,sp,256
     dc4:	7a00                	flw	fs0,48(a2)
     dc6:	5628                	lw	a0,104(a2)
     dc8:	0000                	unimp
     dca:	ec00                	fsw	fs0,24(s0)
     dcc:	0000                	unimp
     dce:	0400                	addi	s0,sp,512
     dd0:	f300                	fsw	fs0,32(a4)
     dd2:	5a01                	li	s4,-32
     dd4:	009f 0000 0000      	0x9f
     dda:	0000                	unimp
     ddc:	0e00                	addi	s0,sp,784
     dde:	0000                	unimp
     de0:	5600                	lw	s0,40(a2)
     de2:	0000                	unimp
     de4:	0100                	addi	s0,sp,128
     de6:	5c00                	lw	s0,56(s0)
     de8:	0056                	c.slli	zero,0x15
     dea:	0000                	unimp
     dec:	00ec                	addi	a1,sp,76
     dee:	0000                	unimp
     df0:	0004                	0x4
     df2:	9f5c01f3          	0x9f5c01f3
	...
     dfe:	0026                	c.slli	zero,0x9
     e00:	0000                	unimp
     e02:	004e                	c.slli	zero,0x13
     e04:	0000                	unimp
     e06:	0006                	c.slli	zero,0x1
     e08:	935a                	add	t1,t1,s6
     e0a:	5e04                	lw	s1,56(a2)
     e0c:	00000493          	li	s1,0
     e10:	0000                	unimp
     e12:	0000                	unimp
     e14:	0000                	unimp
     e16:	0094                	addi	a3,sp,64
     e18:	0000                	unimp
     e1a:	00ba                	slli	ra,ra,0xe
     e1c:	0000                	unimp
     e1e:	0004                	0x4
     e20:	9f5c01f3          	0x9f5c01f3
	...
     e2c:	0094                	addi	a3,sp,64
     e2e:	0000                	unimp
     e30:	00ea                	slli	ra,ra,0x1a
     e32:	0000                	unimp
     e34:	3e080003          	lb	zero,992(a6)
     e38:	009f 0000 0000      	0x9f
     e3e:	0000                	unimp
     e40:	a600                	fsd	fs0,8(a2)
     e42:	0000                	unimp
     e44:	ba00                	fsd	fs0,48(a2)
     e46:	0000                	unimp
     e48:	0600                	addi	s0,sp,768
     e4a:	6100                	flw	fs0,0(a0)
     e4c:	935e0493          	addi	s1,t3,-1739
     e50:	0004                	0x4
     e52:	0000                	unimp
     e54:	0000                	unimp
     e56:	0000                	unimp
     e58:	6a00                	flw	fs0,16(a2)
     e5a:	0000                	unimp
     e5c:	9000                	0x9000
     e5e:	0000                	unimp
     e60:	0200                	addi	s0,sp,256
     e62:	3100                	fld	fs0,32(a0)
     e64:	009f 0000 0000      	0x9f
     e6a:	0000                	unimp
     e6c:	6a00                	flw	fs0,16(a2)
     e6e:	0000                	unimp
     e70:	ea00                	fsw	fs0,16(a2)
     e72:	0000                	unimp
     e74:	0300                	addi	s0,sp,384
     e76:	0800                	addi	s0,sp,16
     e78:	9f3e                	add	t5,t5,a5
	...
     e82:	007c                	addi	a5,sp,12
     e84:	0000                	unimp
     e86:	0090                	addi	a2,sp,64
     e88:	0000                	unimp
     e8a:	0006                	c.slli	zero,0x1
     e8c:	9361                	srli	a4,a4,0x38
     e8e:	5e04                	lw	s1,56(a2)
     e90:	00000493          	li	s1,0
     e94:	0000                	unimp
     e96:	0000                	unimp
     e98:	0000                	unimp
     e9a:	00be                	slli	ra,ra,0xf
     e9c:	0000                	unimp
     e9e:	00ea                	slli	ra,ra,0x1a
     ea0:	0000                	unimp
     ea2:	0004                	0x4
     ea4:	900a                	c.add	zero,sp
     ea6:	9f01                	0x9f01
	...
     eb0:	00be                	slli	ra,ra,0xf
     eb2:	0000                	unimp
     eb4:	00ea                	slli	ra,ra,0x1a
     eb6:	0000                	unimp
     eb8:	3e080003          	lb	zero,992(a6)
     ebc:	009f 0000 0000      	0x9f
     ec2:	0000                	unimp
     ec4:	d000                	sw	s0,32(s0)
     ec6:	0000                	unimp
     ec8:	ea00                	fsw	fs0,16(a2)
     eca:	0000                	unimp
     ecc:	0600                	addi	s0,sp,768
     ece:	6100                	flw	fs0,0(a0)
     ed0:	935e0493          	addi	s1,t3,-1739
     ed4:	0004                	0x4
     ed6:	0000                	unimp
     ed8:	0000                	unimp
     eda:	0000                	unimp
     edc:	f600                	fsw	fs0,40(a2)
     ede:	0000                	unimp
     ee0:	2600                	fld	fs0,8(a2)
     ee2:	0001                	nop
     ee4:	0100                	addi	s0,sp,128
     ee6:	5a00                	lw	s0,48(a2)
     ee8:	0126                	slli	sp,sp,0x9
     eea:	0000                	unimp
     eec:	012c                	addi	a1,sp,136
     eee:	0000                	unimp
     ef0:	0004                	0x4
     ef2:	9f5a01f3          	0x9f5a01f3
	...
     efe:	012c                	addi	a1,sp,136
     f00:	0000                	unimp
     f02:	0139                	addi	sp,sp,14
     f04:	0000                	unimp
     f06:	0001                	nop
     f08:	395a                	fld	fs2,432(sp)
     f0a:	0001                	nop
     f0c:	3a00                	fld	fs0,48(a2)
     f0e:	0001                	nop
     f10:	0400                	addi	s0,sp,512
     f12:	f300                	fsw	fs0,32(a4)
     f14:	5a01                	li	s4,-32
     f16:	3a9f 0001 4400      	0x440000013a9f
     f1c:	0001                	nop
     f1e:	0100                	addi	s0,sp,128
     f20:	5a00                	lw	s0,48(a2)
	...
     f2a:	0512                	slli	a0,a0,0x4
     f2c:	0000                	unimp
     f2e:	0522                	slli	a0,a0,0x8
     f30:	0000                	unimp
     f32:	0001                	nop
     f34:	225a                	fld	ft4,400(sp)
     f36:	0005                	c.nop	1
     f38:	2600                	fld	fs0,8(a2)
     f3a:	0005                	c.nop	1
     f3c:	0300                	addi	s0,sp,384
     f3e:	7f00                	flw	fs0,56(a4)
     f40:	9f01                	0x9f01
     f42:	0526                	slli	a0,a0,0x9
     f44:	0000                	unimp
     f46:	0546                	slli	a0,a0,0x11
     f48:	0000                	unimp
     f4a:	0004                	0x4
     f4c:	9f5a01f3          	0x9f5a01f3
	...
     f58:	0546                	slli	a0,a0,0x11
     f5a:	0000                	unimp
     f5c:	0554                	addi	a3,sp,644
     f5e:	0000                	unimp
     f60:	0001                	nop
     f62:	545a                	lw	s0,180(sp)
     f64:	0005                	c.nop	1
     f66:	5e00                	lw	s0,56(a2)
     f68:	0005                	c.nop	1
     f6a:	0400                	addi	s0,sp,512
     f6c:	f300                	fsw	fs0,32(a4)
     f6e:	5a01                	li	s4,-32
     f70:	009f 0000 0000      	0x9f
     f76:	0000                	unimp
     f78:	8000                	0x8000
     f7a:	0009                	c.nop	2
     f7c:	a600                	fsd	fs0,8(a2)
     f7e:	0009                	c.nop	2
     f80:	0400                	addi	s0,sp,512
     f82:	0a00                	addi	s0,sp,272
     f84:	0bb8                	addi	a4,sp,472
     f86:	009f 0000 0000      	0x9f
     f8c:	0000                	unimp
     f8e:	b000                	fsd	fs0,32(s0)
     f90:	0009                	c.nop	2
     f92:	b500                	fsd	fs0,40(a0)
     f94:	0009                	c.nop	2
     f96:	0100                	addi	s0,sp,128
     f98:	5a00                	lw	s0,48(a2)
     f9a:	09b5                	addi	s3,s3,13
     f9c:	0000                	unimp
     f9e:	09b6                	slli	s3,s3,0xd
     fa0:	0000                	unimp
     fa2:	0004                	0x4
     fa4:	9f5a01f3          	0x9f5a01f3
     fa8:	09b6                	slli	s3,s3,0xd
     faa:	0000                	unimp
     fac:	09b8                	addi	a4,sp,216
     fae:	0000                	unimp
     fb0:	0001                	nop
     fb2:	005a                	c.slli	zero,0x16
     fb4:	0000                	unimp
     fb6:	0000                	unimp
     fb8:	0000                	unimp
     fba:	b000                	fsd	fs0,32(s0)
     fbc:	0009                	c.nop	2
     fbe:	b500                	fsd	fs0,40(a0)
     fc0:	0009                	c.nop	2
     fc2:	0100                	addi	s0,sp,128
     fc4:	5b00                	lw	s0,48(a4)
     fc6:	09b5                	addi	s3,s3,13
     fc8:	0000                	unimp
     fca:	09b6                	slli	s3,s3,0xd
     fcc:	0000                	unimp
     fce:	0004                	0x4
     fd0:	9f5b01f3          	0x9f5b01f3
     fd4:	09b6                	slli	s3,s3,0xd
     fd6:	0000                	unimp
     fd8:	09b8                	addi	a4,sp,216
     fda:	0000                	unimp
     fdc:	0001                	nop
     fde:	0000005b          	0x5b
     fe2:	0000                	unimp
     fe4:	0000                	unimp
     fe6:	b000                	fsd	fs0,32(s0)
     fe8:	0009                	c.nop	2
     fea:	b500                	fsd	fs0,40(a0)
     fec:	0009                	c.nop	2
     fee:	0100                	addi	s0,sp,128
     ff0:	5c00                	lw	s0,56(s0)
     ff2:	09b5                	addi	s3,s3,13
     ff4:	0000                	unimp
     ff6:	09b6                	slli	s3,s3,0xd
     ff8:	0000                	unimp
     ffa:	0004                	0x4
     ffc:	9f5c01f3          	0x9f5c01f3
    1000:	09b6                	slli	s3,s3,0xd
    1002:	0000                	unimp
    1004:	09b8                	addi	a4,sp,216
    1006:	0000                	unimp
    1008:	0001                	nop
    100a:	005c                	addi	a5,sp,4
    100c:	0000                	unimp
    100e:	0000                	unimp
    1010:	0000                	unimp
    1012:	b800                	fsd	fs0,48(s0)
    1014:	0009                	c.nop	2
    1016:	be00                	fsd	fs0,56(a2)
    1018:	0009                	c.nop	2
    101a:	0100                	addi	s0,sp,128
    101c:	5a00                	lw	s0,48(a2)
    101e:	09be                	slli	s3,s3,0xf
    1020:	0000                	unimp
    1022:	09c4                	addi	s1,sp,212
    1024:	0000                	unimp
    1026:	0004                	0x4
    1028:	9f5a01f3          	0x9f5a01f3
	...
    1034:	09c4                	addi	s1,sp,212
    1036:	0000                	unimp
    1038:	09d8                	addi	a4,sp,212
    103a:	0000                	unimp
    103c:	0001                	nop
    103e:	d85a                	sw	s6,48(sp)
    1040:	0009                	c.nop	2
    1042:	f200                	fsw	fs0,32(a2)
    1044:	0009                	c.nop	2
    1046:	0400                	addi	s0,sp,512
    1048:	f300                	fsw	fs0,32(a4)
    104a:	5a01                	li	s4,-32
    104c:	f29f 0009 f400      	0xf4000009f29f
    1052:	0009                	c.nop	2
    1054:	0100                	addi	s0,sp,128
    1056:	5a00                	lw	s0,48(a2)
    1058:	09f4                	addi	a3,sp,220
    105a:	0000                	unimp
    105c:	09f6                	slli	s3,s3,0x1d
    105e:	0000                	unimp
    1060:	0004                	0x4
    1062:	9f5a01f3          	0x9f5a01f3
	...
    106e:	09c4                	addi	s1,sp,212
    1070:	0000                	unimp
    1072:	09da                	slli	s3,s3,0x16
    1074:	0000                	unimp
    1076:	0001                	nop
    1078:	0009da5b          	0x9da5b
    107c:	f200                	fsw	fs0,32(a2)
    107e:	0009                	c.nop	2
    1080:	0400                	addi	s0,sp,512
    1082:	f300                	fsw	fs0,32(a4)
    1084:	5b01                	li	s6,-32
    1086:	f29f 0009 f600      	0xf6000009f29f
    108c:	0009                	c.nop	2
    108e:	0100                	addi	s0,sp,128
    1090:	5b00                	lw	s0,48(a4)
	...
    109a:	09c4                	addi	s1,sp,212
    109c:	0000                	unimp
    109e:	09ce                	slli	s3,s3,0x13
    10a0:	0000                	unimp
    10a2:	0001                	nop
    10a4:	ce5c                	sw	a5,28(a2)
    10a6:	0009                	c.nop	2
    10a8:	f200                	fsw	fs0,32(a2)
    10aa:	0009                	c.nop	2
    10ac:	0400                	addi	s0,sp,512
    10ae:	f300                	fsw	fs0,32(a4)
    10b0:	5c01                	li	s8,-32
    10b2:	f29f 0009 f600      	0xf6000009f29f
    10b8:	0009                	c.nop	2
    10ba:	0100                	addi	s0,sp,128
    10bc:	5c00                	lw	s0,56(s0)
	...
    10c6:	09c4                	addi	s1,sp,212
    10c8:	0000                	unimp
    10ca:	09da                	slli	s3,s3,0x16
    10cc:	0000                	unimp
    10ce:	0002                	c.slli64	zero
    10d0:	9f30                	0x9f30
    10d2:	09da                	slli	s3,s3,0x16
    10d4:	0000                	unimp
    10d6:	09f2                	slli	s3,s3,0x1c
    10d8:	0000                	unimp
    10da:	0001                	nop
    10dc:	f25a                	fsw	fs6,36(sp)
    10de:	0009                	c.nop	2
    10e0:	f600                	fsw	fs0,40(a2)
    10e2:	0009                	c.nop	2
    10e4:	0200                	addi	s0,sp,256
    10e6:	3000                	fld	fs0,32(s0)
    10e8:	009f 0000 0000      	0x9f
    10ee:	0000                	unimp
    10f0:	c400                	sw	s0,8(s0)
    10f2:	0009                	c.nop	2
    10f4:	da00                	sw	s0,48(a2)
    10f6:	0009                	c.nop	2
    10f8:	0200                	addi	s0,sp,256
    10fa:	3000                	fld	fs0,32(s0)
    10fc:	f29f 0009 f600      	0xf6000009f29f
    1102:	0009                	c.nop	2
    1104:	0200                	addi	s0,sp,256
    1106:	3000                	fld	fs0,32(s0)
    1108:	009f 0000 0000      	0x9f
    110e:	0000                	unimp
    1110:	4600                	lw	s0,8(a2)
    1112:	0000                	unimp
    1114:	5400                	lw	s0,40(s0)
    1116:	0000                	unimp
    1118:	0100                	addi	s0,sp,128
    111a:	5a00                	lw	s0,48(a2)
    111c:	0054                	addi	a3,sp,4
    111e:	0000                	unimp
    1120:	00de                	slli	ra,ra,0x17
    1122:	0000                	unimp
    1124:	0001                	nop
    1126:	005f 0000 0000      	0x5f
    112c:	0000                	unimp
    112e:	4600                	lw	s0,8(a2)
    1130:	0000                	unimp
    1132:	b800                	fsd	fs0,48(s0)
    1134:	0000                	unimp
    1136:	0100                	addi	s0,sp,128
    1138:	5b00                	lw	s0,48(a4)
    113a:	00b8                	addi	a4,sp,72
    113c:	0000                	unimp
    113e:	00de                	slli	ra,ra,0x17
    1140:	0000                	unimp
    1142:	0004                	0x4
    1144:	9f5b01f3          	0x9f5b01f3
	...
    1150:	0046                	c.slli	zero,0x11
    1152:	0000                	unimp
    1154:	009e                	slli	ra,ra,0x7
    1156:	0000                	unimp
    1158:	0001                	nop
    115a:	9e5c                	0x9e5c
    115c:	0000                	unimp
    115e:	de00                	sw	s0,56(a2)
    1160:	0000                	unimp
    1162:	0400                	addi	s0,sp,512
    1164:	f300                	fsw	fs0,32(a4)
    1166:	5c01                	li	s8,-32
    1168:	009f 0000 0000      	0x9f
    116e:	0000                	unimp
    1170:	4600                	lw	s0,8(a2)
    1172:	0000                	unimp
    1174:	b800                	fsd	fs0,48(s0)
    1176:	0000                	unimp
    1178:	0100                	addi	s0,sp,128
    117a:	5d00                	lw	s0,56(a0)
    117c:	00b8                	addi	a4,sp,72
    117e:	0000                	unimp
    1180:	00de                	slli	ra,ra,0x17
    1182:	0000                	unimp
    1184:	0004                	0x4
    1186:	9f5d01f3          	0x9f5d01f3
	...
    1192:	00b0                	addi	a2,sp,72
    1194:	0000                	unimp
    1196:	00b8                	addi	a4,sp,72
    1198:	0000                	unimp
    119a:	0002                	c.slli64	zero
    119c:	9f30                	0x9f30
    119e:	00d0                	addi	a2,sp,68
    11a0:	0000                	unimp
    11a2:	00d4                	addi	a3,sp,68
    11a4:	0000                	unimp
    11a6:	0002                	c.slli64	zero
    11a8:	9f30                	0x9f30
	...
    11b2:	0052                	c.slli	zero,0x14
    11b4:	0000                	unimp
    11b6:	0066                	c.slli	zero,0x19
    11b8:	0000                	unimp
    11ba:	0002                	c.slli64	zero
    11bc:	00009f33          	sll	t5,ra,zero
    11c0:	0000                	unimp
    11c2:	0000                	unimp
    11c4:	0000                	unimp
    11c6:	0052                	c.slli	zero,0x14
    11c8:	0000                	unimp
    11ca:	0054                	addi	a3,sp,4
    11cc:	0000                	unimp
    11ce:	0001                	nop
    11d0:	545a                	lw	s0,180(sp)
    11d2:	0000                	unimp
    11d4:	6600                	flw	fs0,8(a2)
    11d6:	0000                	unimp
    11d8:	0100                	addi	s0,sp,128
    11da:	5f00                	lw	s0,56(a4)
	...
    11e4:	0052                	c.slli	zero,0x14
    11e6:	0000                	unimp
    11e8:	0054                	addi	a3,sp,4
    11ea:	0000                	unimp
    11ec:	0001                	nop
    11ee:	545a                	lw	s0,180(sp)
    11f0:	0000                	unimp
    11f2:	de00                	sw	s0,56(a2)
    11f4:	0000                	unimp
    11f6:	0100                	addi	s0,sp,128
    11f8:	5f00                	lw	s0,56(a4)
	...
    1202:	006e                	c.slli	zero,0x1b
    1204:	0000                	unimp
    1206:	007a                	c.slli	zero,0x1e
    1208:	0000                	unimp
    120a:	0001                	nop
    120c:	7a5e                	flw	fs4,244(sp)
    120e:	0000                	unimp
    1210:	8000                	0x8000
    1212:	0000                	unimp
    1214:	0500                	addi	s0,sp,640
    1216:	7c00                	flw	fs0,56(s0)
    1218:	4000                	lw	s0,0(s0)
    121a:	9f25                	0x9f25
	...
    1224:	006e                	c.slli	zero,0x1b
    1226:	0000                	unimp
    1228:	0080                	addi	s0,sp,64
    122a:	0000                	unimp
    122c:	0001                	nop
    122e:	005f 0000 0000      	0x5f
    1234:	0000                	unimp
    1236:	8800                	0x8800
    1238:	0000                	unimp
    123a:	9400                	0x9400
    123c:	0000                	unimp
    123e:	0100                	addi	s0,sp,128
    1240:	5e00                	lw	s0,56(a2)
    1242:	0094                	addi	a3,sp,64
    1244:	0000                	unimp
    1246:	009a                	slli	ra,ra,0x6
    1248:	0000                	unimp
    124a:	0005                	c.nop	1
    124c:	007c                	addi	a5,sp,12
    124e:	2538                	fld	fa4,72(a0)
    1250:	009f 0000 0000      	0x9f
    1256:	0000                	unimp
    1258:	8800                	0x8800
    125a:	0000                	unimp
    125c:	9a00                	0x9a00
    125e:	0000                	unimp
    1260:	0100                	addi	s0,sp,128
    1262:	5f00                	lw	s0,56(a4)
	...
    126c:	009e                	slli	ra,ra,0x7
    126e:	0000                	unimp
    1270:	00b6                	slli	ra,ra,0xd
    1272:	0000                	unimp
    1274:	0001                	nop
    1276:	005c                	addi	a5,sp,4
	...
    1280:	0000                	unimp
    1282:	0400                	addi	s0,sp,512
    1284:	0000                	unimp
    1286:	0100                	addi	s0,sp,128
    1288:	5a00                	lw	s0,48(a2)
    128a:	0004                	0x4
    128c:	0000                	unimp
    128e:	0006                	c.slli	zero,0x1
    1290:	0000                	unimp
    1292:	017a0003          	lb	zero,23(s4) # fffe9017 <_sp+0x7ffe5017>
    1296:	069f 0000 1400      	0x14000000069f
    129c:	0000                	unimp
    129e:	0400                	addi	s0,sp,512
    12a0:	f300                	fsw	fs0,32(a4)
    12a2:	5a01                	li	s4,-32
    12a4:	009f 0000 0000      	0x9f
    12aa:	0000                	unimp
    12ac:	0000                	unimp
    12ae:	0000                	unimp
    12b0:	0200                	addi	s0,sp,256
    12b2:	0000                	unimp
    12b4:	0100                	addi	s0,sp,128
    12b6:	5b00                	lw	s0,48(a4)
    12b8:	0002                	c.slli64	zero
    12ba:	0000                	unimp
    12bc:	0014                	0x14
    12be:	0000                	unimp
    12c0:	0004                	0x4
    12c2:	9f5b01f3          	0x9f5b01f3
	...
    12ce:	0022                	c.slli	zero,0x8
    12d0:	0000                	unimp
    12d2:	002c                	addi	a1,sp,8
    12d4:	0000                	unimp
    12d6:	0001                	nop
    12d8:	2c5a                	fld	fs8,400(sp)
    12da:	0000                	unimp
    12dc:	2e00                	fld	fs0,24(a2)
    12de:	0000                	unimp
    12e0:	0400                	addi	s0,sp,512
    12e2:	f300                	fsw	fs0,32(a4)
    12e4:	5a01                	li	s4,-32
    12e6:	009f 0000 0000      	0x9f
    12ec:	0000                	unimp
    12ee:	2e00                	fld	fs0,24(a2)
    12f0:	0000                	unimp
    12f2:	4400                	lw	s0,8(s0)
    12f4:	0000                	unimp
    12f6:	0100                	addi	s0,sp,128
    12f8:	5a00                	lw	s0,48(a2)
    12fa:	0044                	addi	s1,sp,4
    12fc:	0000                	unimp
    12fe:	0046                	c.slli	zero,0x11
    1300:	0000                	unimp
    1302:	0004                	0x4
    1304:	9f5a01f3          	0x9f5a01f3
	...
    1310:	07d6                	slli	a5,a5,0x15
    1312:	0000                	unimp
    1314:	07df 0000 0001      	0x1000007df
    131a:	df5a                	sw	s6,188(sp)
    131c:	e6000007          	0xe6000007
    1320:	01000007          	0x1000007
    1324:	5800                	lw	s0,48(s0)
    1326:	07e6                	slli	a5,a5,0x19
    1328:	0000                	unimp
    132a:	07ea                	slli	a5,a5,0x1a
    132c:	0000                	unimp
    132e:	0004                	0x4
    1330:	9f5a01f3          	0x9f5a01f3
    1334:	07ea                	slli	a5,a5,0x1a
    1336:	0000                	unimp
    1338:	07ee                	slli	a5,a5,0x1b
    133a:	0000                	unimp
    133c:	0001                	nop
    133e:	ee58                	fsw	fa4,28(a2)
    1340:	f3000007          	0xf3000007
    1344:	01000007          	0x1000007
    1348:	5a00                	lw	s0,48(a2)
    134a:	000007f3          	0x7f3
    134e:	07f4                	addi	a3,sp,972
    1350:	0000                	unimp
    1352:	0004                	0x4
    1354:	9f5a01f3          	0x9f5a01f3
	...
    1360:	07d6                	slli	a5,a5,0x15
    1362:	0000                	unimp
    1364:	07df 0000 0001      	0x1000007df
    136a:	0007df5b          	0x7df5b
    136e:	f400                	fsw	fs0,40(s0)
    1370:	04000007          	0x4000007
    1374:	f300                	fsw	fs0,32(a4)
    1376:	5b01                	li	s6,-32
    1378:	009f 0000 0000      	0x9f
    137e:	0000                	unimp
    1380:	d600                	sw	s0,40(a2)
    1382:	df000007          	0xdf000007
    1386:	01000007          	0x1000007
    138a:	5c00                	lw	s0,56(s0)
    138c:	07df 0000 07f4      	0x7f4000007df
    1392:	0000                	unimp
    1394:	0004                	0x4
    1396:	9f5c01f3          	0x9f5c01f3
	...
    13a2:	07d6                	slli	a5,a5,0x15
    13a4:	0000                	unimp
    13a6:	07e0                	addi	s0,sp,972
    13a8:	0000                	unimp
    13aa:	0002                	c.slli64	zero
    13ac:	9f30                	0x9f30
    13ae:	07e0                	addi	s0,sp,972
    13b0:	0000                	unimp
    13b2:	07ec                	addi	a1,sp,972
    13b4:	0000                	unimp
    13b6:	0001                	nop
    13b8:	005a                	c.slli	zero,0x16
    13ba:	0000                	unimp
    13bc:	0000                	unimp
    13be:	0000                	unimp
    13c0:	a600                	fsd	fs0,8(a2)
    13c2:	0006                	c.slli	zero,0x1
    13c4:	d400                	sw	s0,40(s0)
    13c6:	0006                	c.slli	zero,0x1
    13c8:	0100                	addi	s0,sp,128
    13ca:	5a00                	lw	s0,48(a2)
    13cc:	06d4                	addi	a3,sp,836
    13ce:	0000                	unimp
    13d0:	0784                	addi	s1,sp,960
    13d2:	0000                	unimp
    13d4:	0001                	nop
    13d6:	00078467          	jalr	s0,a5
    13da:	8a00                	0x8a00
    13dc:	04000007          	0x4000007
    13e0:	f300                	fsw	fs0,32(a4)
    13e2:	5a01                	li	s4,-32
    13e4:	8a9f 0007 d600      	0xd60000078a9f
    13ea:	01000007          	0x1000007
    13ee:	6700                	flw	fs0,8(a4)
	...
    13f8:	06a6                	slli	a3,a3,0x9
    13fa:	0000                	unimp
    13fc:	06d4                	addi	a3,sp,836
    13fe:	0000                	unimp
    1400:	31080003          	lb	zero,784(a6)
    1404:	d49f 0006 f000      	0xf0000006d49f
    140a:	0006                	c.slli	zero,0x1
    140c:	0100                	addi	s0,sp,128
    140e:	5900                	lw	s0,48(a0)
    1410:	06f0                	addi	a2,sp,844
    1412:	0000                	unimp
    1414:	0706                	slli	a4,a4,0x1
    1416:	0000                	unimp
    1418:	01790003          	lb	zero,23(s2) # 4017 <_prog_start-0x1fffbfe9>
    141c:	069f 0007 7000      	0x70000007069f
    1422:	01000007          	0x1000007
    1426:	5900                	lw	s0,48(a0)
    1428:	078a                	slli	a5,a5,0x2
    142a:	0000                	unimp
    142c:	07bc                	addi	a5,sp,968
    142e:	0000                	unimp
    1430:	01790003          	lb	zero,23(s2)
    1434:	bc9f 0007 d600      	0xd6000007bc9f
    143a:	01000007          	0x1000007
    143e:	5900                	lw	s0,48(a0)
	...
    1448:	06a6                	slli	a3,a3,0x9
    144a:	0000                	unimp
    144c:	06d4                	addi	a3,sp,836
    144e:	0000                	unimp
    1450:	0002                	c.slli64	zero
    1452:	9f30                	0x9f30
    1454:	06d4                	addi	a3,sp,836
    1456:	0000                	unimp
    1458:	0706                	slli	a4,a4,0x1
    145a:	0000                	unimp
    145c:	0001                	nop
    145e:	0662                	slli	a2,a2,0x18
    1460:	14000007          	0x14000007
    1464:	02000007          	0x2000007
    1468:	3000                	fld	fs0,32(s0)
    146a:	149f 0007 1a00      	0x1a000007149f
    1470:	01000007          	0x1000007
    1474:	5a00                	lw	s0,48(a2)
    1476:	071a                	slli	a4,a4,0x6
    1478:	0000                	unimp
    147a:	0770                	addi	a2,sp,908
    147c:	0000                	unimp
    147e:	0001                	nop
    1480:	8a62                	mv	s4,s8
    1482:	90000007          	0x90000007
    1486:	01000007          	0x1000007
    148a:	6200                	flw	fs0,0(a2)
    148c:	07a2                	slli	a5,a5,0x8
    148e:	0000                	unimp
    1490:	07aa                	slli	a5,a5,0xa
    1492:	0000                	unimp
    1494:	0001                	nop
    1496:	bc62                	fsd	fs8,56(sp)
    1498:	d6000007          	0xd6000007
    149c:	02000007          	0x2000007
    14a0:	3000                	fld	fs0,32(s0)
    14a2:	009f 0000 0000      	0x9f
    14a8:	0000                	unimp
    14aa:	9c00                	0x9c00
    14ac:	0004                	0x4
    14ae:	d000                	sw	s0,32(s0)
    14b0:	0004                	0x4
    14b2:	0100                	addi	s0,sp,128
    14b4:	5a00                	lw	s0,48(a2)
    14b6:	04d0                	addi	a2,sp,580
    14b8:	0000                	unimp
    14ba:	064e                	slli	a2,a2,0x13
    14bc:	0000                	unimp
    14be:	0001                	nop
    14c0:	4e65                	li	t3,25
    14c2:	0006                	c.slli	zero,0x1
    14c4:	5e00                	lw	s0,56(a2)
    14c6:	0006                	c.slli	zero,0x1
    14c8:	0400                	addi	s0,sp,512
    14ca:	f300                	fsw	fs0,32(a4)
    14cc:	5a01                	li	s4,-32
    14ce:	5e9f 0006 a600      	0xa60000065e9f
    14d4:	0006                	c.slli	zero,0x1
    14d6:	0100                	addi	s0,sp,128
    14d8:	6500                	flw	fs0,8(a0)
	...
    14e2:	0500                	addi	s0,sp,640
    14e4:	0000                	unimp
    14e6:	0504                	addi	s1,sp,640
    14e8:	0000                	unimp
    14ea:	0009                	c.nop	2
    14ec:	0078                	addi	a4,sp,12
    14ee:	00064803          	lbu	a6,0(a2)
    14f2:	1c80                	addi	s0,sp,624
    14f4:	049f 0005 0600      	0x6000005049f
    14fa:	0005                	c.nop	1
    14fc:	0900                	addi	s0,sp,144
    14fe:	7800                	flw	fs0,48(s0)
    1500:	0300                	addi	s0,sp,384
    1502:	80000647          	fmsub.s	fa2,ft0,ft0,fa6,rne
    1506:	9f1c                	0x9f1c
    1508:	0506                	slli	a0,a0,0x1
    150a:	0000                	unimp
    150c:	050c                	addi	a1,sp,640
    150e:	0000                	unimp
    1510:	0009                	c.nop	2
    1512:	0078                	addi	a4,sp,12
    1514:	00064803          	lbu	a6,0(a2)
    1518:	1c80                	addi	s0,sp,624
    151a:	0c9f 0005 1000      	0x100000050c9f
    1520:	0005                	c.nop	1
    1522:	0900                	addi	s0,sp,144
    1524:	7f00                	flw	fs0,56(a4)
    1526:	0300                	addi	s0,sp,384
    1528:	0608                	addi	a0,sp,768
    152a:	8000                	0x8000
    152c:	9f1c                	0x9f1c
    152e:	0510                	addi	a2,sp,640
    1530:	0000                	unimp
    1532:	0512                	slli	a0,a0,0x4
    1534:	0000                	unimp
    1536:	0009                	c.nop	2
    1538:	007f                	0x7f
    153a:	00060703          	lb	a4,0(a2)
    153e:	1c80                	addi	s0,sp,624
    1540:	129f 0005 1d00      	0x1d000005129f
    1546:	0005                	c.nop	1
    1548:	0900                	addi	s0,sp,144
    154a:	7f00                	flw	fs0,56(a4)
    154c:	0300                	addi	s0,sp,384
    154e:	0608                	addi	a0,sp,768
    1550:	8000                	0x8000
    1552:	9f1c                	0x9f1c
    1554:	05ae                	slli	a1,a1,0xb
    1556:	0000                	unimp
    1558:	05b0                	addi	a2,sp,712
    155a:	0000                	unimp
    155c:	0002                	c.slli64	zero
    155e:	9f30                	0x9f30
    1560:	05b0                	addi	a2,sp,712
    1562:	0000                	unimp
    1564:	05b6                	slli	a1,a1,0xd
    1566:	0000                	unimp
    1568:	0009                	c.nop	2
    156a:	0089                	addi	ra,ra,2
    156c:	00064803          	lbu	a6,0(a2)
    1570:	1c80                	addi	s0,sp,624
    1572:	b69f 0005 b800      	0xb8000005b69f
    1578:	0005                	c.nop	1
    157a:	0900                	addi	s0,sp,144
    157c:	8900                	0x8900
    157e:	0300                	addi	s0,sp,384
    1580:	0649                	addi	a2,a2,18
    1582:	8000                	0x8000
    1584:	9f1c                	0x9f1c
    1586:	05e8                	addi	a0,sp,716
    1588:	0000                	unimp
    158a:	05ec                	addi	a1,sp,716
    158c:	0000                	unimp
    158e:	0009                	c.nop	2
    1590:	007f                	0x7f
    1592:	00064803          	lbu	a6,0(a2)
    1596:	1c80                	addi	s0,sp,624
    1598:	ec9f 0005 ee00      	0xee000005ec9f
    159e:	0005                	c.nop	1
    15a0:	0900                	addi	s0,sp,144
    15a2:	7f00                	flw	fs0,56(a4)
    15a4:	0300                	addi	s0,sp,384
    15a6:	80000647          	fmsub.s	fa2,ft0,ft0,fa6,rne
    15aa:	9f1c                	0x9f1c
    15ac:	05ee                	slli	a1,a1,0x1b
    15ae:	0000                	unimp
    15b0:	05f9                	addi	a1,a1,30
    15b2:	0000                	unimp
    15b4:	0009                	c.nop	2
    15b6:	007f                	0x7f
    15b8:	00064803          	lbu	a6,0(a2)
    15bc:	1c80                	addi	s0,sp,624
    15be:	169f 0006 1c00      	0x1c000006169f
    15c4:	0006                	c.slli	zero,0x1
    15c6:	0200                	addi	s0,sp,256
    15c8:	3000                	fld	fs0,32(s0)
    15ca:	1c9f 0006 2200      	0x220000061c9f
    15d0:	0006                	c.slli	zero,0x1
    15d2:	0900                	addi	s0,sp,144
    15d4:	8600                	0x8600
    15d6:	0300                	addi	s0,sp,384
    15d8:	80000647          	fmsub.s	fa2,ft0,ft0,fa6,rne
    15dc:	9f1c                	0x9f1c
    15de:	0622                	slli	a2,a2,0x8
    15e0:	0000                	unimp
    15e2:	0632                	slli	a2,a2,0xc
    15e4:	0000                	unimp
    15e6:	0009                	c.nop	2
    15e8:	0086                	slli	ra,ra,0x1
    15ea:	00064803          	lbu	a6,0(a2)
    15ee:	1c80                	addi	s0,sp,624
    15f0:	009f 0000 0000      	0x9f
    15f6:	0000                	unimp
    15f8:	9c00                	0x9c00
    15fa:	0004                	0x4
    15fc:	d000                	sw	s0,32(s0)
    15fe:	0004                	0x4
    1600:	0200                	addi	s0,sp,256
    1602:	3000                	fld	fs0,32(s0)
    1604:	ea9f 0004 f800      	0xf8000004ea9f
    160a:	0004                	0x4
    160c:	0100                	addi	s0,sp,128
    160e:	5a00                	lw	s0,48(a2)
    1610:	04f8                	addi	a4,sp,588
    1612:	0000                	unimp
    1614:	063e                	slli	a2,a2,0xf
    1616:	0000                	unimp
    1618:	0001                	nop
    161a:	5e64                	lw	s1,124(a2)
    161c:	0006                	c.slli	zero,0x1
    161e:	6600                	flw	fs0,8(a2)
    1620:	0006                	c.slli	zero,0x1
    1622:	0100                	addi	s0,sp,128
    1624:	5a00                	lw	s0,48(a2)
    1626:	0666                	slli	a2,a2,0x19
    1628:	0000                	unimp
    162a:	067c                	addi	a5,sp,780
    162c:	0000                	unimp
    162e:	0001                	nop
    1630:	7e64                	flw	fs1,124(a2)
    1632:	0006                	c.slli	zero,0x1
    1634:	a600                	fsd	fs0,8(a2)
    1636:	0006                	c.slli	zero,0x1
    1638:	0100                	addi	s0,sp,128
    163a:	6400                	flw	fs0,8(s0)
	...
    1644:	049c                	addi	a5,sp,576
    1646:	0000                	unimp
    1648:	05e2                	slli	a1,a1,0x18
    164a:	0000                	unimp
    164c:	0002                	c.slli64	zero
    164e:	9f30                	0x9f30
    1650:	05e2                	slli	a1,a1,0x18
    1652:	0000                	unimp
    1654:	0616                	slli	a2,a2,0x5
    1656:	0000                	unimp
    1658:	0001                	nop
    165a:	00061663          	bnez	a2,1666 <_prog_start-0x1fffe99a>
    165e:	1c00                	addi	s0,sp,560
    1660:	0006                	c.slli	zero,0x1
    1662:	0300                	addi	s0,sp,384
    1664:	8300                	0x8300
    1666:	9f7f                	0x9f7f
    1668:	065e                	slli	a2,a2,0x17
    166a:	0000                	unimp
    166c:	067e                	slli	a2,a2,0x1f
    166e:	0000                	unimp
    1670:	0002                	c.slli64	zero
    1672:	9f30                	0x9f30
    1674:	067e                	slli	a2,a2,0x1f
    1676:	0000                	unimp
    1678:	06a6                	slli	a3,a3,0x9
    167a:	0000                	unimp
    167c:	0001                	nop
    167e:	00000063          	beqz	zero,167e <_prog_start-0x1fffe982>
    1682:	0000                	unimp
    1684:	0000                	unimp
    1686:	9c00                	0x9c00
    1688:	0004                	0x4
    168a:	d000                	sw	s0,32(s0)
    168c:	0004                	0x4
    168e:	0200                	addi	s0,sp,256
    1690:	3000                	fld	fs0,32(s0)
    1692:	d09f 0004 d800      	0xd8000004d09f
    1698:	0005                	c.nop	1
    169a:	0100                	addi	s0,sp,128
    169c:	6300                	flw	fs0,0(a4)
    169e:	065e                	slli	a2,a2,0x17
    16a0:	0000                	unimp
    16a2:	067e                	slli	a2,a2,0x1f
    16a4:	0000                	unimp
    16a6:	0001                	nop
    16a8:	00000063          	beqz	zero,16a8 <_prog_start-0x1fffe958>
    16ac:	0000                	unimp
    16ae:	0000                	unimp
    16b0:	1600                	addi	s0,sp,800
    16b2:	0005                	c.nop	1
    16b4:	1e00                	addi	s0,sp,816
    16b6:	0005                	c.nop	1
    16b8:	0200                	addi	s0,sp,256
    16ba:	3100                	fld	fs0,32(a0)
    16bc:	009f 0000 0000      	0x9f
    16c2:	0000                	unimp
    16c4:	1600                	addi	s0,sp,800
    16c6:	0005                	c.nop	1
    16c8:	1e00                	addi	s0,sp,816
    16ca:	0005                	c.nop	1
    16cc:	0200                	addi	s0,sp,256
    16ce:	3400                	fld	fs0,40(s0)
    16d0:	009f 0000 0000      	0x9f
    16d6:	0000                	unimp
    16d8:	1600                	addi	s0,sp,800
    16da:	0005                	c.nop	1
    16dc:	1e00                	addi	s0,sp,816
    16de:	0005                	c.nop	1
    16e0:	0100                	addi	s0,sp,128
    16e2:	6500                	flw	fs0,8(a0)
	...
    16ec:	05f2                	slli	a1,a1,0x1c
    16ee:	0000                	unimp
    16f0:	05fa                	slli	a1,a1,0x1e
    16f2:	0000                	unimp
    16f4:	0002                	c.slli64	zero
    16f6:	9f30                	0x9f30
	...
    1700:	05f2                	slli	a1,a1,0x1c
    1702:	0000                	unimp
    1704:	05fa                	slli	a1,a1,0x1e
    1706:	0000                	unimp
    1708:	0001                	nop
    170a:	00000063          	beqz	zero,170a <_prog_start-0x1fffe8f6>
    170e:	0000                	unimp
    1710:	0000                	unimp
    1712:	f200                	fsw	fs0,32(a2)
    1714:	0005                	c.nop	1
    1716:	fa00                	fsw	fs0,48(a2)
    1718:	0005                	c.nop	1
    171a:	0100                	addi	s0,sp,128
    171c:	6500                	flw	fs0,8(a0)
	...
    1726:	0314                	addi	a3,sp,384
    1728:	0000                	unimp
    172a:	031c                	addi	a5,sp,384
    172c:	0000                	unimp
    172e:	0001                	nop
    1730:	1c5a                	slli	s8,s8,0x36
    1732:	d6000003          	lb	zero,-672(zero) # fffffd60 <_sp+0x7fffbd60>
    1736:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
    173a:	6400                	flw	fs0,8(s0)
    173c:	03d6                	slli	t2,t2,0x15
    173e:	0000                	unimp
    1740:	03e2                	slli	t2,t2,0x18
    1742:	0000                	unimp
    1744:	0004                	0x4
    1746:	9f5a01f3          	0x9f5a01f3
    174a:	03e2                	slli	t2,t2,0x18
    174c:	0000                	unimp
    174e:	049c                	addi	a5,sp,576
    1750:	0000                	unimp
    1752:	0001                	nop
    1754:	0064                	addi	s1,sp,12
    1756:	0000                	unimp
    1758:	0000                	unimp
    175a:	0000                	unimp
    175c:	1400                	addi	s0,sp,544
    175e:	35000003          	lb	zero,848(zero) # 350 <_prog_start-0x1ffffcb0>
    1762:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
    1766:	5b00                	lw	s0,48(a4)
    1768:	0335                	addi	t1,t1,13
    176a:	0000                	unimp
    176c:	03d8                	addi	a4,sp,452
    176e:	0000                	unimp
    1770:	0001                	nop
    1772:	d865                	beqz	s0,1762 <_prog_start-0x1fffe89e>
    1774:	e2000003          	lb	zero,-480(zero) # fffffe20 <_sp+0x7fffbe20>
    1778:	04000003          	lb	zero,64(zero) # 40 <_prog_start-0x1fffffc0>
    177c:	f300                	fsw	fs0,32(a4)
    177e:	5b01                	li	s6,-32
    1780:	e29f 0003 9c00      	0x9c000003e29f
    1786:	0004                	0x4
    1788:	0100                	addi	s0,sp,128
    178a:	6500                	flw	fs0,8(a0)
	...
    1794:	0314                	addi	a3,sp,384
    1796:	0000                	unimp
    1798:	0335                	addi	t1,t1,13
    179a:	0000                	unimp
    179c:	0001                	nop
    179e:	355c                	fld	fa5,168(a0)
    17a0:	da000003          	lb	zero,-608(zero) # fffffda0 <_sp+0x7fffbda0>
    17a4:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
    17a8:	6600                	flw	fs0,8(a2)
    17aa:	03da                	slli	t2,t2,0x16
    17ac:	0000                	unimp
    17ae:	03e2                	slli	t2,t2,0x18
    17b0:	0000                	unimp
    17b2:	0004                	0x4
    17b4:	9f5c01f3          	0x9f5c01f3
    17b8:	03e2                	slli	t2,t2,0x18
    17ba:	0000                	unimp
    17bc:	049c                	addi	a5,sp,576
    17be:	0000                	unimp
    17c0:	0001                	nop
    17c2:	0066                	c.slli	zero,0x19
    17c4:	0000                	unimp
    17c6:	0000                	unimp
    17c8:	0000                	unimp
    17ca:	1400                	addi	s0,sp,544
    17cc:	46000003          	lb	zero,1120(zero) # 460 <_prog_start-0x1ffffba0>
    17d0:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
    17d4:	3000                	fld	fs0,32(s0)
    17d6:	469f 0003 5200      	0x52000003469f
    17dc:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
    17e0:	5a00                	lw	s0,48(a2)
    17e2:	0352                	slli	t1,t1,0x14
    17e4:	0000                	unimp
    17e6:	03c8                	addi	a0,sp,452
    17e8:	0000                	unimp
    17ea:	0001                	nop
    17ec:	e262                	fsw	fs8,4(sp)
    17ee:	f4000003          	lb	zero,-192(zero) # ffffff40 <_sp+0x7fffbf40>
    17f2:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
    17f6:	3000                	fld	fs0,32(s0)
    17f8:	f49f 0003 3a00      	0x3a000003f49f
    17fe:	0004                	0x4
    1800:	0100                	addi	s0,sp,128
    1802:	6200                	flw	fs0,0(a2)
    1804:	044c                	addi	a1,sp,516
    1806:	0000                	unimp
    1808:	0450                	addi	a2,sp,516
    180a:	0000                	unimp
    180c:	0001                	nop
    180e:	505a                	0x505a
    1810:	0004                	0x4
    1812:	8c00                	0x8c00
    1814:	0004                	0x4
    1816:	0100                	addi	s0,sp,128
    1818:	6200                	flw	fs0,0(a2)
    181a:	048e                	slli	s1,s1,0x3
    181c:	0000                	unimp
    181e:	049c                	addi	a5,sp,576
    1820:	0000                	unimp
    1822:	0001                	nop
    1824:	0062                	c.slli	zero,0x18
    1826:	0000                	unimp
    1828:	0000                	unimp
    182a:	0000                	unimp
    182c:	b600                	fsd	fs0,40(a2)
    182e:	ba000003          	lb	zero,-1120(zero) # fffffba0 <_sp+0x7fffbba0>
    1832:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
    1836:	3000                	fld	fs0,32(s0)
    1838:	ba9f 0003 c000      	0xc0000003ba9f
    183e:	09000003          	lb	zero,144(zero) # 90 <_prog_start-0x1fffff70>
    1842:	7800                	flw	fs0,48(s0)
    1844:	0300                	addi	s0,sp,384
    1846:	0648                	addi	a0,sp,772
    1848:	8000                	0x8000
    184a:	9f1c                	0x9f1c
    184c:	03c0                	addi	s0,sp,452
    184e:	0000                	unimp
    1850:	03c2                	slli	t2,t2,0x10
    1852:	0000                	unimp
    1854:	0009                	c.nop	2
    1856:	0078                	addi	a4,sp,12
    1858:	00064903          	lbu	s2,0(a2)
    185c:	1c80                	addi	s0,sp,624
    185e:	009f 0000 0000      	0x9f
    1864:	0000                	unimp
    1866:	3c00                	fld	fs0,56(s0)
    1868:	74000003          	lb	zero,1856(zero) # 740 <_prog_start-0x1ffff8c0>
    186c:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
    1870:	6300                	flw	fs0,0(a4)
    1872:	03e2                	slli	t2,t2,0x18
    1874:	0000                	unimp
    1876:	03f4                	addi	a3,sp,460
    1878:	0000                	unimp
    187a:	0001                	nop
    187c:	00044c63          	bltz	s0,1894 <_prog_start-0x1fffe76c>
    1880:	5a00                	lw	s0,48(a2)
    1882:	0004                	0x4
    1884:	0100                	addi	s0,sp,128
    1886:	6300                	flw	fs0,0(a4)
	...
    1890:	0370                	addi	a2,sp,396
    1892:	0000                	unimp
    1894:	0380                	addi	s0,sp,448
    1896:	0000                	unimp
    1898:	0002                	c.slli64	zero
    189a:	9f31                	0x9f31
	...
    18a4:	0370                	addi	a2,sp,396
    18a6:	0000                	unimp
    18a8:	0380                	addi	s0,sp,448
    18aa:	0000                	unimp
    18ac:	0002                	c.slli64	zero
    18ae:	9f34                	0x9f34
	...
    18b8:	0370                	addi	a2,sp,396
    18ba:	0000                	unimp
    18bc:	0380                	addi	s0,sp,448
    18be:	0000                	unimp
    18c0:	0001                	nop
    18c2:	0064                	addi	s1,sp,12
    18c4:	0000                	unimp
    18c6:	0000                	unimp
    18c8:	0000                	unimp
    18ca:	1800                	addi	s0,sp,48
    18cc:	0004                	0x4
    18ce:	2000                	fld	fs0,0(s0)
    18d0:	0004                	0x4
    18d2:	0200                	addi	s0,sp,256
    18d4:	3100                	fld	fs0,32(a0)
    18d6:	009f 0000 0000      	0x9f
    18dc:	0000                	unimp
    18de:	1800                	addi	s0,sp,48
    18e0:	0004                	0x4
    18e2:	2000                	fld	fs0,0(s0)
    18e4:	0004                	0x4
    18e6:	0700                	addi	s0,sp,896
    18e8:	8700                	0x8700
    18ea:	4000                	lw	s0,0(s0)
    18ec:	4024                	lw	s1,64(s0)
    18ee:	9f26                	add	t5,t5,s1
	...
    18f8:	0418                	addi	a4,sp,512
    18fa:	0000                	unimp
    18fc:	0420                	addi	s0,sp,520
    18fe:	0000                	unimp
    1900:	0001                	nop
    1902:	0064                	addi	s1,sp,12
    1904:	0000                	unimp
    1906:	0000                	unimp
    1908:	0000                	unimp
    190a:	4400                	lw	s0,8(s0)
    190c:	0001                	nop
    190e:	9000                	0x9000
    1910:	0001                	nop
    1912:	0100                	addi	s0,sp,128
    1914:	5a00                	lw	s0,48(a2)
    1916:	0190                	addi	a2,sp,192
    1918:	0000                	unimp
    191a:	0234                	addi	a3,sp,264
    191c:	0000                	unimp
    191e:	0001                	nop
    1920:	3464                	fld	fs1,232(s0)
    1922:	0002                	c.slli64	zero
    1924:	4000                	lw	s0,0(s0)
    1926:	0002                	c.slli64	zero
    1928:	0400                	addi	s0,sp,512
    192a:	f300                	fsw	fs0,32(a4)
    192c:	5a01                	li	s4,-32
    192e:	409f 0002 ac00      	0xac000002409f
    1934:	0002                	c.slli64	zero
    1936:	0100                	addi	s0,sp,128
    1938:	6400                	flw	fs0,8(s0)
    193a:	02ac                	addi	a1,sp,328
    193c:	0000                	unimp
    193e:	02b0                	addi	a2,sp,328
    1940:	0000                	unimp
    1942:	0001                	nop
    1944:	b05a                	fsd	fs6,32(sp)
    1946:	0002                	c.slli64	zero
    1948:	1400                	addi	s0,sp,544
    194a:	01000003          	lb	zero,16(zero) # 10 <_prog_start-0x1ffffff0>
    194e:	6400                	flw	fs0,8(s0)
	...
    1958:	0144                	addi	s1,sp,132
    195a:	0000                	unimp
    195c:	0190                	addi	a2,sp,192
    195e:	0000                	unimp
    1960:	0001                	nop
    1962:	0001905b          	0x1905b
    1966:	ac00                	fsd	fs0,24(s0)
    1968:	0002                	c.slli64	zero
    196a:	0400                	addi	s0,sp,512
    196c:	f300                	fsw	fs0,32(a4)
    196e:	5b01                	li	s6,-32
    1970:	ac9f 0002 b700      	0xb7000002ac9f
    1976:	0002                	c.slli64	zero
    1978:	0100                	addi	s0,sp,128
    197a:	5b00                	lw	s0,48(a4)
    197c:	000002b7          	lui	t0,0x0
    1980:	0314                	addi	a3,sp,384
    1982:	0000                	unimp
    1984:	0004                	0x4
    1986:	9f5b01f3          	0x9f5b01f3
	...
    1992:	0176                	slli	sp,sp,0x1d
    1994:	0000                	unimp
    1996:	017c                	addi	a5,sp,140
    1998:	0000                	unimp
    199a:	0002                	c.slli64	zero
    199c:	9f30                	0x9f30
    199e:	017c                	addi	a5,sp,140
    19a0:	0000                	unimp
    19a2:	0180                	addi	s0,sp,192
    19a4:	0000                	unimp
    19a6:	0009                	c.nop	2
    19a8:	007f                	0x7f
    19aa:	00064803          	lbu	a6,0(a2)
    19ae:	1c80                	addi	s0,sp,624
    19b0:	809f 0001 8200      	0x82000001809f
    19b6:	0001                	nop
    19b8:	0900                	addi	s0,sp,144
    19ba:	7f00                	flw	fs0,56(a4)
    19bc:	0300                	addi	s0,sp,384
    19be:	80000647          	fmsub.s	fa2,ft0,ft0,fa6,rne
    19c2:	9f1c                	0x9f1c
    19c4:	0182                	c.slli64	gp
    19c6:	0000                	unimp
    19c8:	018c                	addi	a1,sp,192
    19ca:	0000                	unimp
    19cc:	0009                	c.nop	2
    19ce:	007f                	0x7f
    19d0:	00064803          	lbu	a6,0(a2)
    19d4:	1c80                	addi	s0,sp,624
    19d6:	109f 0002 1400      	0x14000002109f
    19dc:	0002                	c.slli64	zero
    19de:	0200                	addi	s0,sp,256
    19e0:	3000                	fld	fs0,32(s0)
    19e2:	149f 0002 1a00      	0x1a000002149f
    19e8:	0002                	c.slli64	zero
    19ea:	0200                	addi	s0,sp,256
    19ec:	3100                	fld	fs0,32(a0)
    19ee:	1a9f 0002 2000      	0x200000021a9f
    19f4:	0002                	c.slli64	zero
    19f6:	0200                	addi	s0,sp,256
    19f8:	3200                	fld	fs0,32(a2)
    19fa:	209f 0002 2600      	0x26000002209f
    1a00:	0002                	c.slli64	zero
    1a02:	0200                	addi	s0,sp,256
    1a04:	3300                	fld	fs0,32(a4)
    1a06:	269f 0002 2800      	0x28000002269f
    1a0c:	0002                	c.slli64	zero
    1a0e:	0200                	addi	s0,sp,256
    1a10:	3400                	fld	fs0,40(s0)
    1a12:	809f 0002 8400      	0x84000002809f
    1a18:	0002                	c.slli64	zero
    1a1a:	0200                	addi	s0,sp,256
    1a1c:	3000                	fld	fs0,32(s0)
    1a1e:	849f 0002 8a00      	0x8a000002849f
    1a24:	0002                	c.slli64	zero
    1a26:	0900                	addi	s0,sp,144
    1a28:	8300                	0x8300
    1a2a:	0300                	addi	s0,sp,384
    1a2c:	0648                	addi	a0,sp,772
    1a2e:	8000                	0x8000
    1a30:	9f1c                	0x9f1c
    1a32:	028a                	slli	t0,t0,0x2
    1a34:	0000                	unimp
    1a36:	028c                	addi	a1,sp,320
    1a38:	0000                	unimp
    1a3a:	0009                	c.nop	2
    1a3c:	49030083          	lb	ra,1168(t1)
    1a40:	0006                	c.slli	zero,0x1
    1a42:	1c80                	addi	s0,sp,624
    1a44:	b89f 0002 be00      	0xbe000002b89f
    1a4a:	0002                	c.slli64	zero
    1a4c:	0200                	addi	s0,sp,256
    1a4e:	3000                	fld	fs0,32(s0)
    1a50:	be9f 0002 c400      	0xc4000002be9f
    1a56:	0002                	c.slli64	zero
    1a58:	0900                	addi	s0,sp,144
    1a5a:	7900                	flw	fs0,48(a0)
    1a5c:	0300                	addi	s0,sp,384
    1a5e:	0608                	addi	a0,sp,768
    1a60:	8000                	0x8000
    1a62:	9f1c                	0x9f1c
    1a64:	02c4                	addi	s1,sp,324
    1a66:	0000                	unimp
    1a68:	02c6                	slli	t0,t0,0x11
    1a6a:	0000                	unimp
    1a6c:	0009                	c.nop	2
    1a6e:	0079                	c.nop	30
    1a70:	00060903          	lb	s2,0(a2)
    1a74:	1c80                	addi	s0,sp,624
    1a76:	009f 0000 0000      	0x9f
    1a7c:	0000                	unimp
    1a7e:	ba00                	fsd	fs0,48(a2)
    1a80:	0001                	nop
    1a82:	c000                	sw	s0,0(s0)
    1a84:	0001                	nop
    1a86:	0500                	addi	s0,sp,640
    1a88:	3a00                	fld	fs0,48(a2)
    1a8a:	0079                	c.nop	30
    1a8c:	9f1c                	0x9f1c
    1a8e:	01c0                	addi	s0,sp,196
    1a90:	0000                	unimp
    1a92:	01e2                	slli	gp,gp,0x18
    1a94:	0000                	unimp
    1a96:	0005                	c.nop	1
    1a98:	7939                	lui	s2,0xfffee
    1a9a:	1c00                	addi	s0,sp,560
    1a9c:	009f 0000 0000      	0x9f
    1aa2:	0000                	unimp
    1aa4:	da00                	sw	s0,48(a2)
    1aa6:	0001                	nop
    1aa8:	e200                	fsw	fs0,0(a2)
    1aaa:	0001                	nop
    1aac:	0200                	addi	s0,sp,256
    1aae:	3100                	fld	fs0,32(a0)
    1ab0:	009f 0000 0000      	0x9f
    1ab6:	0000                	unimp
    1ab8:	da00                	sw	s0,48(a2)
    1aba:	0001                	nop
    1abc:	e200                	fsw	fs0,0(a2)
    1abe:	0001                	nop
    1ac0:	0200                	addi	s0,sp,256
    1ac2:	3400                	fld	fs0,40(s0)
    1ac4:	009f 0000 0000      	0x9f
    1aca:	0000                	unimp
    1acc:	da00                	sw	s0,48(a2)
    1ace:	0001                	nop
    1ad0:	e200                	fsw	fs0,0(a2)
    1ad2:	0001                	nop
    1ad4:	0100                	addi	s0,sp,128
    1ad6:	6400                	flw	fs0,8(s0)
	...
    1ae0:	01a0                	addi	s0,sp,200
    1ae2:	0000                	unimp
    1ae4:	01a8                	addi	a0,sp,200
    1ae6:	0000                	unimp
    1ae8:	0002                	c.slli64	zero
    1aea:	9f31                	0x9f31
	...
    1af4:	01a0                	addi	s0,sp,200
    1af6:	0000                	unimp
    1af8:	01a8                	addi	a0,sp,200
    1afa:	0000                	unimp
    1afc:	0002                	c.slli64	zero
    1afe:	9f34                	0x9f34
	...
    1b08:	01a0                	addi	s0,sp,200
    1b0a:	0000                	unimp
    1b0c:	01a8                	addi	a0,sp,200
    1b0e:	0000                	unimp
    1b10:	0001                	nop
    1b12:	0064                	addi	s1,sp,12
    1b14:	0000                	unimp
    1b16:	0000                	unimp
    1b18:	0000                	unimp
    1b1a:	c600                	sw	s0,8(a2)
    1b1c:	0000                	unimp
    1b1e:	ce00                	sw	s0,24(a2)
    1b20:	0000                	unimp
    1b22:	0100                	addi	s0,sp,128
    1b24:	5a00                	lw	s0,48(a2)
    1b26:	00ce                	slli	ra,ra,0x13
    1b28:	0000                	unimp
    1b2a:	0126                	slli	sp,sp,0x9
    1b2c:	0000                	unimp
    1b2e:	0001                	nop
    1b30:	2658                	fld	fa4,136(a2)
    1b32:	0001                	nop
    1b34:	2e00                	fld	fs0,24(a2)
    1b36:	0001                	nop
    1b38:	0400                	addi	s0,sp,512
    1b3a:	f300                	fsw	fs0,32(a4)
    1b3c:	5a01                	li	s4,-32
    1b3e:	2e9f 0001 3600      	0x360000012e9f
    1b44:	0001                	nop
    1b46:	0100                	addi	s0,sp,128
    1b48:	5800                	lw	s0,48(s0)
	...
    1b52:	00c6                	slli	ra,ra,0x11
    1b54:	0000                	unimp
    1b56:	000000d7          	0xd7
    1b5a:	0001                	nop
    1b5c:	0000d75b          	0xd75b
    1b60:	2800                	fld	fs0,16(s0)
    1b62:	0001                	nop
    1b64:	0100                	addi	s0,sp,128
    1b66:	5900                	lw	s0,48(a0)
    1b68:	0128                	addi	a0,sp,136
    1b6a:	0000                	unimp
    1b6c:	012e                	slli	sp,sp,0xb
    1b6e:	0000                	unimp
    1b70:	0004                	0x4
    1b72:	9f5b01f3          	0x9f5b01f3
    1b76:	012e                	slli	sp,sp,0xb
    1b78:	0000                	unimp
    1b7a:	0136                	slli	sp,sp,0xd
    1b7c:	0000                	unimp
    1b7e:	0001                	nop
    1b80:	0059                	c.nop	22
    1b82:	0000                	unimp
    1b84:	0000                	unimp
    1b86:	0000                	unimp
    1b88:	c600                	sw	s0,8(a2)
    1b8a:	0000                	unimp
    1b8c:	d700                	sw	s0,40(a4)
    1b8e:	0000                	unimp
    1b90:	0100                	addi	s0,sp,128
    1b92:	5c00                	lw	s0,56(s0)
    1b94:	000000d7          	0xd7
    1b98:	0136                	slli	sp,sp,0xd
    1b9a:	0000                	unimp
    1b9c:	0004                	0x4
    1b9e:	9f5c01f3          	0x9f5c01f3
	...
    1baa:	00e2                	slli	ra,ra,0x18
    1bac:	0000                	unimp
    1bae:	00f8                	addi	a4,sp,76
    1bb0:	0000                	unimp
    1bb2:	0002                	c.slli64	zero
    1bb4:	9f30                	0x9f30
    1bb6:	00f8                	addi	a4,sp,76
    1bb8:	0000                	unimp
    1bba:	011a                	slli	sp,sp,0x6
    1bbc:	0000                	unimp
    1bbe:	0009                	c.nop	2
    1bc0:	007d                	c.nop	31
    1bc2:	00060803          	lb	a6,0(a2)
    1bc6:	1c80                	addi	s0,sp,624
    1bc8:	1a9f 0001 1e00      	0x1e0000011a9f
    1bce:	0001                	nop
    1bd0:	0900                	addi	s0,sp,144
    1bd2:	7d00                	flw	fs0,56(a0)
    1bd4:	0300                	addi	s0,sp,384
    1bd6:	80000607          	0x80000607
    1bda:	9f1c                	0x9f1c
    1bdc:	011e                	slli	sp,sp,0x7
    1bde:	0000                	unimp
    1be0:	0122                	slli	sp,sp,0x8
    1be2:	0000                	unimp
    1be4:	0009                	c.nop	2
    1be6:	007d                	c.nop	31
    1be8:	00060803          	lb	a6,0(a2)
    1bec:	1c80                	addi	s0,sp,624
    1bee:	2e9f 0001 3600      	0x360000012e9f
    1bf4:	0001                	nop
    1bf6:	0900                	addi	s0,sp,144
    1bf8:	7d00                	flw	fs0,56(a0)
    1bfa:	0300                	addi	s0,sp,384
    1bfc:	0608                	addi	a0,sp,768
    1bfe:	8000                	0x8000
    1c00:	9f1c                	0x9f1c
	...
    1c0a:	0112                	slli	sp,sp,0x4
    1c0c:	0000                	unimp
    1c0e:	0122                	slli	sp,sp,0x8
    1c10:	0000                	unimp
    1c12:	0001                	nop
    1c14:	005f 0000 0000      	0x5f
    1c1a:	0000                	unimp
    1c1c:	0200                	addi	s0,sp,256
    1c1e:	0001                	nop
    1c20:	0400                	addi	s0,sp,512
    1c22:	0001                	nop
    1c24:	0500                	addi	s0,sp,640
    1c26:	4e00                	lw	s0,24(a2)
    1c28:	007f                	0x7f
    1c2a:	9f1c                	0x9f1c
    1c2c:	0104                	addi	s1,sp,128
    1c2e:	0000                	unimp
    1c30:	0106                	slli	sp,sp,0x1
    1c32:	0000                	unimp
    1c34:	0005                	c.nop	1
    1c36:	1c007f4f          	0x1c007f4f
    1c3a:	069f 0001 0c00      	0xc000001069f
    1c40:	0001                	nop
    1c42:	0500                	addi	s0,sp,640
    1c44:	4e00                	lw	s0,24(a2)
    1c46:	007f                	0x7f
    1c48:	9f1c                	0x9f1c
	...
    1c52:	0078                	addi	a4,sp,12
    1c54:	0000                	unimp
    1c56:	009c                	addi	a5,sp,64
    1c58:	0000                	unimp
    1c5a:	0001                	nop
    1c5c:	9c5a                	add	s8,s8,s6
    1c5e:	0000                	unimp
    1c60:	c000                	sw	s0,0(s0)
    1c62:	0000                	unimp
    1c64:	0100                	addi	s0,sp,128
    1c66:	5900                	lw	s0,48(a0)
    1c68:	00c0                	addi	s0,sp,68
    1c6a:	0000                	unimp
    1c6c:	00c6                	slli	ra,ra,0x11
    1c6e:	0000                	unimp
    1c70:	0004                	0x4
    1c72:	9f5a01f3          	0x9f5a01f3
	...
    1c7e:	0078                	addi	a4,sp,12
    1c80:	0000                	unimp
    1c82:	009c                	addi	a5,sp,64
    1c84:	0000                	unimp
    1c86:	0002                	c.slli64	zero
    1c88:	9f30                	0x9f30
    1c8a:	009c                	addi	a5,sp,64
    1c8c:	0000                	unimp
    1c8e:	00b2                	slli	ra,ra,0xc
    1c90:	0000                	unimp
    1c92:	0001                	nop
    1c94:	0058                	addi	a4,sp,4
    1c96:	0000                	unimp
    1c98:	0000                	unimp
    1c9a:	0000                	unimp
    1c9c:	3600                	fld	fs0,40(a2)
    1c9e:	0000                	unimp
    1ca0:	4600                	lw	s0,8(a2)
    1ca2:	0000                	unimp
    1ca4:	0100                	addi	s0,sp,128
    1ca6:	5a00                	lw	s0,48(a2)
    1ca8:	0046                	c.slli	zero,0x11
    1caa:	0000                	unimp
    1cac:	0076                	c.slli	zero,0x1d
    1cae:	0000                	unimp
    1cb0:	0004                	0x4
    1cb2:	9f5a01f3          	0x9f5a01f3
    1cb6:	0076                	c.slli	zero,0x1d
    1cb8:	0000                	unimp
    1cba:	0078                	addi	a4,sp,12
    1cbc:	0000                	unimp
    1cbe:	0001                	nop
    1cc0:	005a                	c.slli	zero,0x16
    1cc2:	0000                	unimp
    1cc4:	0000                	unimp
    1cc6:	0000                	unimp
    1cc8:	3600                	fld	fs0,40(a2)
    1cca:	0000                	unimp
    1ccc:	4600                	lw	s0,8(a2)
    1cce:	0000                	unimp
    1cd0:	0200                	addi	s0,sp,256
    1cd2:	3000                	fld	fs0,32(s0)
    1cd4:	469f 0000 4c00      	0x4c000000469f
    1cda:	0000                	unimp
    1cdc:	0200                	addi	s0,sp,256
    1cde:	3100                	fld	fs0,32(a0)
    1ce0:	4c9f 0000 6800      	0x680000004c9f
    1ce6:	0000                	unimp
    1ce8:	0200                	addi	s0,sp,256
    1cea:	3000                	fld	fs0,32(s0)
    1cec:	689f 0000 7600      	0x76000000689f
    1cf2:	0000                	unimp
    1cf4:	0200                	addi	s0,sp,256
    1cf6:	3100                	fld	fs0,32(a0)
    1cf8:	769f 0000 7800      	0x78000000769f
    1cfe:	0000                	unimp
    1d00:	0200                	addi	s0,sp,256
    1d02:	3000                	fld	fs0,32(s0)
    1d04:	009f 0000 0000      	0x9f
    1d0a:	0000                	unimp
    1d0c:	0000                	unimp
    1d0e:	0000                	unimp
    1d10:	0b00                	addi	s0,sp,400
    1d12:	0000                	unimp
    1d14:	0100                	addi	s0,sp,128
    1d16:	5a00                	lw	s0,48(a2)
    1d18:	0000000b          	0xb
    1d1c:	0036                	c.slli	zero,0xd
    1d1e:	0000                	unimp
    1d20:	0004                	0x4
    1d22:	9f5a01f3          	0x9f5a01f3
	...
    1d2e:	001a                	c.slli	zero,0x6
    1d30:	0000                	unimp
    1d32:	002c                	addi	a1,sp,8
    1d34:	0000                	unimp
    1d36:	0001                	nop
    1d38:	0058                	addi	a4,sp,4
    1d3a:	0000                	unimp
    1d3c:	0000                	unimp
    1d3e:	0000                	unimp
    1d40:	3600                	fld	fs0,40(a2)
    1d42:	0001                	nop
    1d44:	3b00                	fld	fs0,48(a4)
    1d46:	0001                	nop
    1d48:	0100                	addi	s0,sp,128
    1d4a:	5a00                	lw	s0,48(a2)
    1d4c:	0000013b          	0x13b
    1d50:	0144                	addi	s1,sp,132
    1d52:	0000                	unimp
    1d54:	0004                	0x4
    1d56:	9f5a01f3          	0x9f5a01f3
	...
    1d62:	0136                	slli	sp,sp,0xd
    1d64:	0000                	unimp
    1d66:	0000013b          	0x13b
    1d6a:	0001                	nop
    1d6c:	00013b5b          	0x13b5b
    1d70:	4400                	lw	s0,8(s0)
    1d72:	0001                	nop
    1d74:	0400                	addi	s0,sp,512
    1d76:	f300                	fsw	fs0,32(a4)
    1d78:	5b01                	li	s6,-32
    1d7a:	009f 0000 0000      	0x9f
    1d80:	0000                	unimp
    1d82:	3600                	fld	fs0,40(a2)
    1d84:	0001                	nop
    1d86:	3b00                	fld	fs0,48(a4)
    1d88:	0001                	nop
    1d8a:	0100                	addi	s0,sp,128
    1d8c:	5c00                	lw	s0,56(s0)
    1d8e:	0000013b          	0x13b
    1d92:	0144                	addi	s1,sp,132
    1d94:	0000                	unimp
    1d96:	0004                	0x4
    1d98:	9f5c01f3          	0x9f5c01f3
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	001c                	0x1c
   2:	0000                	unimp
   4:	0002                	c.slli64	zero
   6:	0000                	unimp
   8:	0000                	unimp
   a:	0004                	0x4
   c:	0000                	unimp
   e:	0000                	unimp
  10:	0240                	addi	s0,sp,260
  12:	2000                	fld	fs0,0(s0)
  14:	026a                	slli	tp,tp,0x1a
	...
  1e:	0000                	unimp
  20:	001c                	0x1c
  22:	0000                	unimp
  24:	0002                	c.slli64	zero
  26:	000009d7          	0x9d7
  2a:	0004                	0x4
  2c:	0000                	unimp
  2e:	0000                	unimp
  30:	04aa                	slli	s1,s1,0xa
  32:	2000                	fld	fs0,0(s0)
  34:	0092                	slli	ra,ra,0x4
	...
  3e:	0000                	unimp
  40:	001c                	0x1c
  42:	0000                	unimp
  44:	0002                	c.slli64	zero
  46:	0b48                	addi	a0,sp,404
  48:	0000                	unimp
  4a:	0004                	0x4
  4c:	0000                	unimp
  4e:	0000                	unimp
  50:	053c                	addi	a5,sp,648
  52:	2000                	fld	fs0,0(s0)
  54:	0cbe                	slli	s9,s9,0xf
	...
  5e:	0000                	unimp
  60:	001c                	0x1c
  62:	0000                	unimp
  64:	0002                	c.slli64	zero
  66:	2074                	fld	fa3,192(s0)
  68:	0000                	unimp
  6a:	0004                	0x4
  6c:	0000                	unimp
  6e:	0000                	unimp
  70:	11fa                	slli	gp,gp,0x3e
  72:	2000                	fld	fs0,0(s0)
  74:	00de                	slli	ra,ra,0x17
	...
  7e:	0000                	unimp
  80:	001c                	0x1c
  82:	0000                	unimp
  84:	0002                	c.slli64	zero
  86:	2c41                	jal	316 <_prog_start-0x1ffffcea>
  88:	0000                	unimp
  8a:	0004                	0x4
  8c:	0000                	unimp
  8e:	0000                	unimp
  90:	12d8                	addi	a4,sp,356
  92:	2000                	fld	fs0,0(s0)
  94:	08c4                	addi	s1,sp,84
	...
  9e:	0000                	unimp
  a0:	001c                	0x1c
  a2:	0000                	unimp
  a4:	0002                	c.slli64	zero
  a6:	000049c7          	fmsub.s	fs3,ft0,ft0,ft0,rmm
  aa:	0004                	0x4
  ac:	0000                	unimp
  ae:	0000                	unimp
  b0:	0000                	unimp
  b2:	2000                	fld	fs0,0(s0)
  b4:	0212                	slli	tp,tp,0x4
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	0248                	addi	a0,sp,260
   2:	2000                	fld	fs0,0(s0)
   4:	02f4                	addi	a3,sp,332
   6:	2000                	fld	fs0,0(s0)
   8:	03ec                	addi	a1,sp,460
   a:	2000                	fld	fs0,0(s0)
   c:	0496                	slli	s1,s1,0x5
   e:	2000                	fld	fs0,0(s0)
	...
  18:	0240                	addi	s0,sp,260
  1a:	2000                	fld	fs0,0(s0)
  1c:	04aa                	slli	s1,s1,0xa
  1e:	2000                	fld	fs0,0(s0)
	...
  28:	003a                	c.slli	zero,0xe
  2a:	0000                	unimp
  2c:	0046                	c.slli	zero,0x11
  2e:	0000                	unimp
  30:	0052                	c.slli	zero,0x14
  32:	0000                	unimp
  34:	0056                	c.slli	zero,0x15
  36:	0000                	unimp
  38:	0094                	addi	a3,sp,64
  3a:	0000                	unimp
  3c:	00ba                	slli	ra,ra,0xe
	...
  46:	0000                	unimp
  48:	0284                	addi	s1,sp,320
  4a:	0000                	unimp
  4c:	0288                	addi	a0,sp,320
  4e:	0000                	unimp
  50:	028e                	slli	t0,t0,0x3
  52:	0000                	unimp
  54:	0292                	slli	t0,t0,0x4
  56:	0000                	unimp
  58:	0294                	addi	a3,sp,320
  5a:	0000                	unimp
  5c:	0298                	addi	a4,sp,320
  5e:	0000                	unimp
  60:	02aa                	slli	t0,t0,0xa
  62:	0000                	unimp
  64:	02b4                	addi	a3,sp,328
	...
  6e:	0000                	unimp
  70:	02f6                	slli	t0,t0,0x1d
  72:	0000                	unimp
  74:	02fa                	slli	t0,t0,0x1e
  76:	0000                	unimp
  78:	0300                	addi	s0,sp,384
  7a:	0000                	unimp
  7c:	0302                	c.slli64	t1
  7e:	0000                	unimp
  80:	0316                	slli	t1,t1,0x5
  82:	0000                	unimp
  84:	0324                	addi	s1,sp,392
	...
  8e:	0000                	unimp
  90:	0340                	addi	s0,sp,388
  92:	0000                	unimp
  94:	0352                	slli	t1,t1,0x14
  96:	0000                	unimp
  98:	035e                	slli	t1,t1,0x17
  9a:	0000                	unimp
  9c:	0368                	addi	a0,sp,396
	...
  a6:	0000                	unimp
  a8:	0388                	addi	a0,sp,448
  aa:	0000                	unimp
  ac:	0388                	addi	a0,sp,448
  ae:	0000                	unimp
  b0:	038a                	slli	t2,t2,0x2
  b2:	0000                	unimp
  b4:	03a0                	addi	s0,sp,456
  b6:	0000                	unimp
  b8:	0406                	slli	s0,s0,0x1
  ba:	0000                	unimp
  bc:	0412                	slli	s0,s0,0x4
	...
  c6:	0000                	unimp
  c8:	03a0                	addi	s0,sp,456
  ca:	0000                	unimp
  cc:	03ac                	addi	a1,sp,456
  ce:	0000                	unimp
  d0:	03ae                	slli	t2,t2,0xb
  d2:	0000                	unimp
  d4:	03f4                	addi	a3,sp,460
	...
  de:	0000                	unimp
  e0:	03ae                	slli	t2,t2,0xb
  e2:	0000                	unimp
  e4:	03b2                	slli	t2,t2,0xc
  e6:	0000                	unimp
  e8:	03be                	slli	t2,t2,0xf
  ea:	0000                	unimp
  ec:	03c4                	addi	s1,sp,452
  ee:	0000                	unimp
  f0:	03e4                	addi	s1,sp,460
  f2:	0000                	unimp
  f4:	03f0                	addi	a2,sp,460
	...
  fe:	0000                	unimp
 100:	0416                	slli	s0,s0,0x5
 102:	0000                	unimp
 104:	041a                	slli	s0,s0,0x6
 106:	0000                	unimp
 108:	042a                	slli	s0,s0,0xa
 10a:	0000                	unimp
 10c:	0438                	addi	a4,sp,520
 10e:	0000                	unimp
 110:	04a4                	addi	s1,sp,584
 112:	0000                	unimp
 114:	04aa                	slli	s1,s1,0xa
	...
 11e:	0000                	unimp
 120:	0438                	addi	a4,sp,520
 122:	0000                	unimp
 124:	0448                	addi	a0,sp,516
 126:	0000                	unimp
 128:	04aa                	slli	s1,s1,0xa
 12a:	0000                	unimp
 12c:	04b8                	addi	a4,sp,584
	...
 136:	0000                	unimp
 138:	044e                	slli	s0,s0,0x13
 13a:	0000                	unimp
 13c:	0454                	addi	a3,sp,516
 13e:	0000                	unimp
 140:	045c                	addi	a5,sp,516
 142:	0000                	unimp
 144:	045e                	slli	s0,s0,0x17
 146:	0000                	unimp
 148:	0474                	addi	a3,sp,524
 14a:	0000                	unimp
 14c:	0480                	addi	s0,sp,576
	...
 156:	0000                	unimp
 158:	0458                	addi	a4,sp,516
 15a:	0000                	unimp
 15c:	045c                	addi	a5,sp,516
 15e:	0000                	unimp
 160:	0496                	slli	s1,s1,0x5
 162:	0000                	unimp
 164:	04a4                	addi	s1,sp,584
	...
 16e:	0000                	unimp
 170:	05ec                	addi	a1,sp,716
 172:	0000                	unimp
 174:	05f0                	addi	a2,sp,716
 176:	0000                	unimp
 178:	0604                	addi	s1,sp,768
 17a:	0000                	unimp
 17c:	061a                	slli	a2,a2,0x6
	...
 186:	0000                	unimp
 188:	05f0                	addi	a2,sp,716
 18a:	0000                	unimp
 18c:	05f4                	addi	a3,sp,716
 18e:	0000                	unimp
 190:	063a                	slli	a2,a2,0xe
 192:	0000                	unimp
 194:	0670                	addi	a2,sp,780
	...
 19e:	0000                	unimp
 1a0:	06de                	slli	a3,a3,0x17
 1a2:	0000                	unimp
 1a4:	06e2                	slli	a3,a3,0x18
 1a6:	0000                	unimp
 1a8:	06e8                	addi	a0,sp,844
 1aa:	0000                	unimp
 1ac:	06fa                	slli	a3,a3,0x1e
	...
 1b6:	0000                	unimp
 1b8:	077a                	slli	a4,a4,0x1e
 1ba:	0000                	unimp
 1bc:	077e                	slli	a4,a4,0x1f
 1be:	0000                	unimp
 1c0:	0784                	addi	s1,sp,960
 1c2:	0000                	unimp
 1c4:	0798                	addi	a4,sp,960
	...
 1ce:	0000                	unimp
 1d0:	07a2                	slli	a5,a5,0x8
 1d2:	0000                	unimp
 1d4:	07a6                	slli	a5,a5,0x9
 1d6:	0000                	unimp
 1d8:	07aa                	slli	a5,a5,0xa
 1da:	0000                	unimp
 1dc:	07be                	slli	a5,a5,0xf
	...
 1e6:	0000                	unimp
 1e8:	08b0                	addi	a2,sp,88
 1ea:	0000                	unimp
 1ec:	08b4                	addi	a3,sp,88
 1ee:	0000                	unimp
 1f0:	08b6                	slli	a7,a7,0xd
 1f2:	0000                	unimp
 1f4:	08ca                	slli	a7,a7,0x12
	...
 1fe:	0000                	unimp
 200:	09c4                	addi	s1,sp,212
 202:	0000                	unimp
 204:	09d6                	slli	s3,s3,0x15
 206:	0000                	unimp
 208:	09de                	slli	s3,s3,0x17
 20a:	0000                	unimp
 20c:	09f2                	slli	s3,s3,0x1c
	...
 216:	0000                	unimp
 218:	0a18                	addi	a4,sp,272
 21a:	0000                	unimp
 21c:	0a28                	addi	a0,sp,280
 21e:	0000                	unimp
 220:	0a30                	addi	a2,sp,280
 222:	0000                	unimp
 224:	0a3c                	addi	a5,sp,280
	...
 22e:	0000                	unimp
 230:	0a7e                	slli	s4,s4,0x1f
 232:	0000                	unimp
 234:	0aae                	slli	s5,s5,0xb
 236:	0000                	unimp
 238:	0ac2                	slli	s5,s5,0x10
 23a:	0000                	unimp
 23c:	0ac4                	addi	s1,sp,340
	...
 246:	0000                	unimp
 248:	0a7e                	slli	s4,s4,0x1f
 24a:	0000                	unimp
 24c:	0a94                	addi	a3,sp,336
 24e:	0000                	unimp
 250:	0a9c                	addi	a5,sp,336
 252:	0000                	unimp
 254:	0aae                	slli	s5,s5,0xb
	...
 25e:	0000                	unimp
 260:	0ac6                	slli	s5,s5,0x11
 262:	0000                	unimp
 264:	0b0a                	slli	s6,s6,0x2
 266:	0000                	unimp
 268:	0b6a                	slli	s6,s6,0x1a
 26a:	0000                	unimp
 26c:	0b6e                	slli	s6,s6,0x1b
	...
 276:	0000                	unimp
 278:	0aca                	slli	s5,s5,0x12
 27a:	0000                	unimp
 27c:	0ad6                	slli	s5,s5,0x15
 27e:	0000                	unimp
 280:	0ad8                	addi	a4,sp,340
 282:	0000                	unimp
 284:	0ada                	slli	s5,s5,0x16
 286:	0000                	unimp
 288:	0af0                	addi	a2,sp,348
 28a:	0000                	unimp
 28c:	0af6                	slli	s5,s5,0x1d
	...
 296:	0000                	unimp
 298:	0b7e                	slli	s6,s6,0x1f
 29a:	0000                	unimp
 29c:	0b82                	c.slli64	s7
 29e:	0000                	unimp
 2a0:	0b86                	slli	s7,s7,0x1
 2a2:	0000                	unimp
 2a4:	0bba                	slli	s7,s7,0xe
 2a6:	0000                	unimp
 2a8:	0bbe                	slli	s7,s7,0xf
 2aa:	0000                	unimp
 2ac:	0bc0                	addi	s0,sp,468
	...
 2b6:	0000                	unimp
 2b8:	001a                	c.slli	zero,0x6
 2ba:	0000                	unimp
 2bc:	002c                	addi	a1,sp,8
 2be:	0000                	unimp
 2c0:	0032                	c.slli	zero,0xc
 2c2:	0000                	unimp
 2c4:	0036                	c.slli	zero,0xd
	...
 2ce:	0000                	unimp
 2d0:	0374                	addi	a3,sp,396
 2d2:	0000                	unimp
 2d4:	037a                	slli	t1,t1,0x1e
 2d6:	0000                	unimp
 2d8:	037e                	slli	t1,t1,0x1f
 2da:	0000                	unimp
 2dc:	0380                	addi	s0,sp,448
	...
 2e6:	0000                	unimp
 2e8:	04be                	slli	s1,s1,0xf
 2ea:	0000                	unimp
 2ec:	05d4                	addi	a3,sp,708
 2ee:	0000                	unimp
 2f0:	05e6                	slli	a1,a1,0x19
 2f2:	0000                	unimp
 2f4:	05e8                	addi	a0,sp,716
 2f6:	0000                	unimp
 2f8:	065e                	slli	a2,a2,0x17
 2fa:	0000                	unimp
 2fc:	067e                	slli	a2,a2,0x1f
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
       0:	0000054f          	fnmadd.s	fa0,ft0,ft0,ft0,rne
       4:	0002                	c.slli64	zero
       6:	031a                	slli	t1,t1,0x6
       8:	0000                	unimp
       a:	0101                	addi	sp,sp,0
       c:	000d0efb          	0xd0efb
      10:	0101                	addi	sp,sp,0
      12:	0101                	addi	sp,sp,0
      14:	0000                	unimp
      16:	0100                	addi	s0,sp,128
      18:	0000                	unimp
      1a:	2f01                	jal	72a <_prog_start-0x1ffff8d6>
      1c:	61726373          	csrrsi	t1,0x617,4
      20:	6374                	flw	fa3,68(a4)
      22:	2f68                	fld	fa0,216(a4)
      24:	6861                	lui	a6,0x18
      26:	6e75                	lui	t3,0x1d
      28:	6974                	flw	fa3,84(a0)
      2a:	676e                	flw	fa4,216(sp)
      2c:	6f74                	flw	fa3,92(a4)
      2e:	2f6e                	fld	ft10,216(sp)
      30:	6566                	flw	fa0,88(sp)
      32:	6564                	flw	fs1,76(a0)
      34:	6172                	flw	ft2,28(sp)
      36:	6974                	flw	fa3,84(a0)
      38:	622f6e6f          	jal	t3,f665a <_prog_start-0x1ff099a6>
      3c:	6975                	lui	s2,0x1d
      3e:	646c                	flw	fa1,76(s0)
      40:	75672f73          	csrrs	t5,0x756,a4
      44:	7661                	lui	a2,0xffff8
      46:	5f61                	li	t5,-8
      48:	7361                	lui	t1,0xffff8
      4a:	6369                	lui	t1,0x1a
      4c:	2f2e2e2f          	0x2f2e2e2f
      50:	2e2e                	fld	ft8,200(sp)
      52:	666f732f          	0x666f732f
      56:	7774                	flw	fa3,108(a4)
      58:	7261                	lui	tp,0xffff8
      5a:	2f65                	jal	812 <_prog_start-0x1ffff7ee>
      5c:	6574                	flw	fa3,76(a0)
      5e:	2f737473          	csrrci	s0,0x2f7,6
      62:	6968                	flw	fa0,84(a0)
      64:	6966                	flw	fs2,88(sp)
      66:	6576                	flw	fa0,92(sp)
      68:	725f 7665 5f62      	0x5f627665725f
      6e:	6f62                	flw	ft10,24(sp)
      70:	6f6c746f          	jal	s0,c7766 <_prog_start-0x1ff3889a>
      74:	6461                	lui	s0,0x18
      76:	7265                	lui	tp,0xffff9
      78:	2f00                	fld	fs0,24(a4)
      7a:	6b726f77          	0x6b726f77
      7e:	6f6f742f          	0x6f6f742f
      82:	736c                	flw	fa1,100(a4)
      84:	7369722f          	0x7369722f
      88:	742d7663          	bgeu	s10,sp,7d4 <_prog_start-0x1ffff82c>
      8c:	736c6f6f          	jal	t5,c67c2 <_prog_start-0x1ff3983e>
      90:	3236392f          	0x3236392f
      94:	6362                	flw	ft6,24(sp)
      96:	3930                	fld	fa2,112(a0)
      98:	3738                	fld	fa4,104(a4)
      9a:	31373033          	0x31373033
      9e:	6161                	addi	sp,sp,80
      a0:	36313837          	lui	a6,0x36313
      a4:	3564                	fld	fs1,232(a0)
      a6:	3866                	fld	fa6,120(sp)
      a8:	3530                	fld	fa2,104(a0)
      aa:	35653663          	0x35653663
      ae:	61373937          	lui	s2,0x61373
      b2:	62356233          	0x62356233
      b6:	2f376663          	bltu	a4,s3,3a2 <_prog_start-0x1ffffc5e>
      ba:	6972                	flw	fs2,28(sp)
      bc:	36766373          	csrrsi	t1,0x367,12
      c0:	2d34                	fld	fa3,88(a0)
      c2:	6e75                	lui	t3,0x1d
      c4:	776f6e6b          	0x776f6e6b
      c8:	2d6e                	fld	fs10,216(sp)
      ca:	6c65                	lui	s8,0x19
      cc:	2f66                	fld	ft10,88(sp)
      ce:	6e69                	lui	t3,0x1a
      d0:	64756c63          	bltu	a0,t2,728 <_prog_start-0x1ffff8d8>
      d4:	2f65                	jal	88c <_prog_start-0x1ffff774>
      d6:	616d                	addi	sp,sp,240
      d8:	6e696863          	bltu	s2,t1,7c8 <_prog_start-0x1ffff838>
      dc:	0065                	c.nop	25
      de:	726f772f          	0x726f772f
      e2:	6f742f6b          	0x6f742f6b
      e6:	2f736c6f          	jal	s8,36bdc <_prog_start-0x1ffc9424>
      ea:	6972                	flw	fs2,28(sp)
      ec:	2d766373          	csrrsi	t1,0x2d7,12
      f0:	6f74                	flw	fa3,92(a4)
      f2:	2f736c6f          	jal	s8,36be8 <_prog_start-0x1ffc9418>
      f6:	3639                	jal	fffffc04 <_sp+0x7fffbc04>
      f8:	6232                	flw	ft4,12(sp)
      fa:	38393063          	0x38393063
      fe:	37303337          	lui	t1,0x37303
     102:	6131                	addi	sp,sp,320
     104:	3761                	jal	8c <_prog_start-0x1fffff74>
     106:	3138                	fld	fa4,96(a0)
     108:	6436                	flw	fs0,76(sp)
     10a:	6635                	lui	a2,0xd
     10c:	3038                	fld	fa4,96(s0)
     10e:	6335                	lui	t1,0xd
     110:	6536                	flw	fa0,76(sp)
     112:	3735                	jal	3e <_prog_start-0x1fffffc2>
     114:	3739                	jal	22 <_prog_start-0x1fffffde>
     116:	3361                	jal	fffffe9e <_sp+0x7fffbe9e>
     118:	3562                	fld	fa0,56(sp)
     11a:	6362                	flw	ft6,24(sp)
     11c:	3766                	fld	fa4,120(sp)
     11e:	7369722f          	0x7369722f
     122:	34367663          	bgeu	a2,gp,46e <_prog_start-0x1ffffb92>
     126:	752d                	lui	a0,0xfffeb
     128:	6b6e                	flw	fs6,216(sp)
     12a:	6f6e                	flw	ft10,216(sp)
     12c:	652d6e77          	0x652d6e77
     130:	666c                	flw	fa1,76(a2)
     132:	636e692f          	0x636e692f
     136:	756c                	flw	fa1,108(a0)
     138:	6564                	flw	fs1,76(a0)
     13a:	7379732f          	0x7379732f
     13e:	2f00                	fld	fs0,24(a4)
     140:	61726373          	csrrsi	t1,0x617,4
     144:	6374                	flw	fa3,68(a4)
     146:	2f68                	fld	fa0,216(a4)
     148:	6861                	lui	a6,0x18
     14a:	6e75                	lui	t3,0x1d
     14c:	6974                	flw	fa3,84(a0)
     14e:	676e                	flw	fa4,216(sp)
     150:	6f74                	flw	fa3,92(a4)
     152:	2f6e                	fld	ft10,216(sp)
     154:	6566                	flw	fa0,88(sp)
     156:	6564                	flw	fs1,76(a0)
     158:	6172                	flw	ft2,28(sp)
     15a:	6974                	flw	fa3,84(a0)
     15c:	732f6e6f          	jal	t3,f688e <_prog_start-0x1ff09772>
     160:	7774666f          	jal	a2,470d6 <_prog_start-0x1ffb8f2a>
     164:	7261                	lui	tp,0xffff8
     166:	2f65                	jal	91e <_prog_start-0x1ffff6e2>
     168:	696c                	flw	fa1,84(a0)
     16a:	7262                	flw	ft4,56(sp)
     16c:	7261                	lui	tp,0xffff8
     16e:	6569                	lui	a0,0x1a
     170:	65622f73          	csrrs	t5,0x656,tp
     174:	636e                	flw	ft6,216(sp)
     176:	7568                	flw	fa0,108(a0)
     178:	6974                	flw	fa3,84(a0)
     17a:	736c                	flw	fa1,100(a4)
     17c:	2f00                	fld	fs0,24(a4)
     17e:	6b726f77          	0x6b726f77
     182:	6f6f742f          	0x6f6f742f
     186:	736c                	flw	fa1,100(a4)
     188:	7369722f          	0x7369722f
     18c:	742d7663          	bgeu	s10,sp,8d8 <_prog_start-0x1ffff728>
     190:	736c6f6f          	jal	t5,c68c6 <_prog_start-0x1ff3973a>
     194:	3236392f          	0x3236392f
     198:	6362                	flw	ft6,24(sp)
     19a:	3930                	fld	fa2,112(a0)
     19c:	3738                	fld	fa4,104(a4)
     19e:	31373033          	0x31373033
     1a2:	6161                	addi	sp,sp,80
     1a4:	36313837          	lui	a6,0x36313
     1a8:	3564                	fld	fs1,232(a0)
     1aa:	3866                	fld	fa6,120(sp)
     1ac:	3530                	fld	fa2,104(a0)
     1ae:	35653663          	0x35653663
     1b2:	61373937          	lui	s2,0x61373
     1b6:	62356233          	0x62356233
     1ba:	2f376663          	bltu	a4,s3,4a6 <_prog_start-0x1ffffb5a>
     1be:	696c                	flw	fa1,84(a0)
     1c0:	2f62                	fld	ft10,24(sp)
     1c2:	2f636367          	0x2f636367
     1c6:	6972                	flw	fs2,28(sp)
     1c8:	36766373          	csrrsi	t1,0x367,12
     1cc:	2d34                	fld	fa3,88(a0)
     1ce:	6e75                	lui	t3,0x1d
     1d0:	776f6e6b          	0x776f6e6b
     1d4:	2d6e                	fld	fs10,216(sp)
     1d6:	6c65                	lui	s8,0x19
     1d8:	2f66                	fld	ft10,88(sp)
     1da:	2e322e37          	lui	t3,0x2e322
     1de:	2f30                	fld	fa2,88(a4)
     1e0:	6e69                	lui	t3,0x1a
     1e2:	64756c63          	bltu	a0,t2,83a <_prog_start-0x1ffff7c6>
     1e6:	0065                	c.nop	25
     1e8:	726f772f          	0x726f772f
     1ec:	6f742f6b          	0x6f742f6b
     1f0:	2f736c6f          	jal	s8,36ce6 <_prog_start-0x1ffc931a>
     1f4:	6972                	flw	fs2,28(sp)
     1f6:	2d766373          	csrrsi	t1,0x2d7,12
     1fa:	6f74                	flw	fa3,92(a4)
     1fc:	2f736c6f          	jal	s8,36cf2 <_prog_start-0x1ffc930e>
     200:	3639                	jal	fffffd0e <_sp+0x7fffbd0e>
     202:	6232                	flw	ft4,12(sp)
     204:	38393063          	0x38393063
     208:	37303337          	lui	t1,0x37303
     20c:	6131                	addi	sp,sp,320
     20e:	3761                	jal	196 <_prog_start-0x1ffffe6a>
     210:	3138                	fld	fa4,96(a0)
     212:	6436                	flw	fs0,76(sp)
     214:	6635                	lui	a2,0xd
     216:	3038                	fld	fa4,96(s0)
     218:	6335                	lui	t1,0xd
     21a:	6536                	flw	fa0,76(sp)
     21c:	3735                	jal	148 <_prog_start-0x1ffffeb8>
     21e:	3739                	jal	12c <_prog_start-0x1ffffed4>
     220:	3361                	jal	ffffffa8 <_sp+0x7fffbfa8>
     222:	3562                	fld	fa0,56(sp)
     224:	6362                	flw	ft6,24(sp)
     226:	3766                	fld	fa4,120(sp)
     228:	7369722f          	0x7369722f
     22c:	34367663          	bgeu	a2,gp,578 <_prog_start-0x1ffffa88>
     230:	752d                	lui	a0,0xfffeb
     232:	6b6e                	flw	fs6,216(sp)
     234:	6f6e                	flw	ft10,216(sp)
     236:	652d6e77          	0x652d6e77
     23a:	666c                	flw	fa1,76(a2)
     23c:	636e692f          	0x636e692f
     240:	756c                	flw	fa1,108(a0)
     242:	6564                	flw	fs1,76(a0)
     244:	2f00                	fld	fs0,24(a4)
     246:	61726373          	csrrsi	t1,0x617,4
     24a:	6374                	flw	fa3,68(a4)
     24c:	2f68                	fld	fa0,216(a4)
     24e:	6861                	lui	a6,0x18
     250:	6e75                	lui	t3,0x1d
     252:	6974                	flw	fa3,84(a0)
     254:	676e                	flw	fa4,216(sp)
     256:	6f74                	flw	fa3,92(a4)
     258:	2f6e                	fld	ft10,216(sp)
     25a:	6566                	flw	fa0,88(sp)
     25c:	6564                	flw	fs1,76(a0)
     25e:	6172                	flw	ft2,28(sp)
     260:	6974                	flw	fa3,84(a0)
     262:	732f6e6f          	jal	t3,f6994 <_prog_start-0x1ff0966c>
     266:	7774666f          	jal	a2,471dc <_prog_start-0x1ffb8e24>
     26a:	7261                	lui	tp,0xffff8
     26c:	2f65                	jal	a24 <_prog_start-0x1ffff5dc>
     26e:	6f74                	flw	fa3,92(a4)
     270:	68636c6f          	jal	s8,368f6 <_prog_start-0x1ffc970a>
     274:	6961                	lui	s2,0x18
     276:	2f6e                	fld	ft10,216(sp)
     278:	7264                	flw	fs1,100(a2)
     27a:	7669                	lui	a2,0xffffa
     27c:	7265                	lui	tp,0xffff9
     27e:	73652f73          	csrrs	t5,0x736,a0
     282:	3370                	fld	fa2,224(a4)
     284:	0032                	c.slli	zero,0xc
     286:	6800                	flw	fs0,16(s0)
     288:	6669                	lui	a2,0x1a
     28a:	7669                	lui	a2,0xffffa
     28c:	5f65                	li	t5,-7
     28e:	6572                	flw	fa0,28(sp)
     290:	6276                	flw	ft4,92(sp)
     292:	625f 6f6f 6c74      	0x6c746f6f625f
     298:	6564616f          	jal	sp,468ee <_prog_start-0x1ffb9712>
     29c:	2e72                	fld	ft8,280(sp)
     29e:	00010063          	beqz	sp,29e <_prog_start-0x1ffffd62>
     2a2:	5f00                	lw	s0,56(a4)
     2a4:	6564                	flw	fs1,76(a0)
     2a6:	6166                	flw	ft2,88(sp)
     2a8:	6c75                	lui	s8,0x1d
     2aa:	5f74                	lw	a3,124(a4)
     2ac:	7974                	flw	fa3,116(a0)
     2ae:	6570                	flw	fa2,76(a0)
     2b0:	00682e73          	csrrs	t3,0x6,a6
     2b4:	0002                	c.slli64	zero
     2b6:	5f00                	lw	s0,56(a4)
     2b8:	69647473          	csrrci	s0,0x696,8
     2bc:	746e                	flw	fs0,248(sp)
     2be:	682e                	flw	fa6,200(sp)
     2c0:	0300                	addi	s0,sp,384
     2c2:	0000                	unimp
     2c4:	6562                	flw	fa0,24(sp)
     2c6:	636e                	flw	ft6,216(sp)
     2c8:	7568                	flw	fa0,108(a0)
     2ca:	6974                	flw	fa3,84(a0)
     2cc:	736c                	flw	fa1,100(a4)
     2ce:	682e                	flw	fa6,200(sp)
     2d0:	0400                	addi	s0,sp,512
     2d2:	0000                	unimp
     2d4:	6f6c                	flw	fa1,92(a4)
     2d6:	682e6b63          	bltu	t3,sp,96c <_prog_start-0x1ffff694>
     2da:	0300                	addi	s0,sp,384
     2dc:	0000                	unimp
     2de:	745f 7079 7365      	0x73657079745f
     2e4:	682e                	flw	fa6,200(sp)
     2e6:	0300                	addi	s0,sp,384
     2e8:	0000                	unimp
     2ea:	64647473          	csrrci	s0,0x646,8
     2ee:	6665                	lui	a2,0x19
     2f0:	682e                	flw	fa6,200(sp)
     2f2:	0500                	addi	s0,sp,640
     2f4:	0000                	unimp
     2f6:	6e75                	lui	t3,0x1d
     2f8:	7369                	lui	t1,0xffffa
     2fa:	6474                	flw	fa3,76(s0)
     2fc:	682e                	flw	fa6,200(sp)
     2fe:	0300                	addi	s0,sp,384
     300:	0000                	unimp
     302:	6572                	flw	fa0,28(sp)
     304:	6e65                	lui	t3,0x19
     306:	2e74                	fld	fa3,216(a2)
     308:	0068                	addi	a0,sp,12
     30a:	63000003          	lb	zero,1584(zero) # 630 <_prog_start-0x1ffff9d0>
     30e:	7974                	flw	fa3,116(a0)
     310:	6570                	flw	fa2,76(a0)
     312:	682e                	flw	fa6,200(sp)
     314:	0600                	addi	s0,sp,768
     316:	0000                	unimp
     318:	7365                	lui	t1,0xffff9
     31a:	3370                	fld	fa2,224(a4)
     31c:	2e32                	fld	ft8,264(sp)
     31e:	0068                	addi	a0,sp,12
     320:	00000007          	0x7
     324:	0500                	addi	s0,sp,640
     326:	4002                	0x4002
     328:	0002                	c.slli64	zero
     32a:	0320                	addi	s0,sp,392
     32c:	011e                	slli	sp,sp,0x7
     32e:	04090903          	lb	s2,64(s2) # 18040 <_prog_start-0x1ffe7fc0>
     332:	0100                	addi	s0,sp,128
     334:	04090803          	lb	a6,64(s2)
     338:	0100                	addi	s0,sp,128
     33a:	12091c03          	lh	s8,288(s2)
     33e:	0100                	addi	s0,sp,128
     340:	0a090203          	lb	tp,160(s2)
     344:	0100                	addi	s0,sp,128
     346:	04097e03          	0x4097e03
     34a:	0100                	addi	s0,sp,128
     34c:	04090103          	lb	sp,64(s2)
     350:	0100                	addi	s0,sp,128
     352:	02090103          	lb	sp,32(s2)
     356:	0100                	addi	s0,sp,128
     358:	02090a03          	lb	s4,32(s2)
     35c:	0100                	addi	s0,sp,128
     35e:	04097503          	0x4097503
     362:	0100                	addi	s0,sp,128
     364:	04090103          	lb	sp,64(s2)
     368:	0100                	addi	s0,sp,128
     36a:	02090203          	lb	tp,32(s2)
     36e:	0100                	addi	s0,sp,128
     370:	06097e03          	0x6097e03
     374:	0100                	addi	s0,sp,128
     376:	06090103          	lb	sp,96(s2)
     37a:	0100                	addi	s0,sp,128
     37c:	06090103          	lb	sp,96(s2)
     380:	0100                	addi	s0,sp,128
     382:	06090103          	lb	sp,96(s2)
     386:	0100                	addi	s0,sp,128
     388:	06090303          	lb	t1,96(s2)
     38c:	0100                	addi	s0,sp,128
     38e:	04090103          	lb	sp,64(s2)
     392:	0100                	addi	s0,sp,128
     394:	04090303          	lb	t1,64(s2)
     398:	0100                	addi	s0,sp,128
     39a:	0c090103          	lb	sp,192(s2)
     39e:	0100                	addi	s0,sp,128
     3a0:	14090103          	lb	sp,320(s2)
     3a4:	0100                	addi	s0,sp,128
     3a6:	14090103          	lb	sp,320(s2)
     3aa:	0100                	addi	s0,sp,128
     3ac:	00097f03          	0x97f03
     3b0:	0100                	addi	s0,sp,128
     3b2:	18090503          	lb	a0,384(s2)
     3b6:	0100                	addi	s0,sp,128
     3b8:	08090503          	lb	a0,128(s2)
     3bc:	0100                	addi	s0,sp,128
     3be:	08090103          	lb	sp,128(s2)
     3c2:	0100                	addi	s0,sp,128
     3c4:	04090103          	lb	sp,64(s2)
     3c8:	0100                	addi	s0,sp,128
     3ca:	04090703          	lb	a4,64(s2)
     3ce:	0100                	addi	s0,sp,128
     3d0:	0200                	addi	s0,sp,256
     3d2:	0104                	addi	s1,sp,128
     3d4:	10090103          	lb	sp,256(s2)
     3d8:	0100                	addi	s0,sp,128
     3da:	0200                	addi	s0,sp,256
     3dc:	0104                	addi	s1,sp,128
     3de:	04097f03          	0x4097f03
     3e2:	0100                	addi	s0,sp,128
     3e4:	0a090903          	lb	s2,160(s2)
     3e8:	0100                	addi	s0,sp,128
     3ea:	0c090103          	lb	sp,192(s2)
     3ee:	0100                	addi	s0,sp,128
     3f0:	06090103          	lb	sp,96(s2)
     3f4:	0100                	addi	s0,sp,128
     3f6:	04090103          	lb	sp,64(s2)
     3fa:	0100                	addi	s0,sp,128
     3fc:	04090103          	lb	sp,64(s2)
     400:	0100                	addi	s0,sp,128
     402:	04090103          	lb	sp,64(s2)
     406:	0100                	addi	s0,sp,128
     408:	04090103          	lb	sp,64(s2)
     40c:	0100                	addi	s0,sp,128
     40e:	04090103          	lb	sp,64(s2)
     412:	0100                	addi	s0,sp,128
     414:	04090103          	lb	sp,64(s2)
     418:	0100                	addi	s0,sp,128
     41a:	04090103          	lb	sp,64(s2)
     41e:	0100                	addi	s0,sp,128
     420:	08090103          	lb	sp,128(s2)
     424:	0100                	addi	s0,sp,128
     426:	04090103          	lb	sp,64(s2)
     42a:	0100                	addi	s0,sp,128
     42c:	04090103          	lb	sp,64(s2)
     430:	0100                	addi	s0,sp,128
     432:	04090103          	lb	sp,64(s2)
     436:	0100                	addi	s0,sp,128
     438:	04090103          	lb	sp,64(s2)
     43c:	0100                	addi	s0,sp,128
     43e:	04090103          	lb	sp,64(s2)
     442:	0100                	addi	s0,sp,128
     444:	04090303          	lb	t1,64(s2)
     448:	0100                	addi	s0,sp,128
     44a:	04090103          	lb	sp,64(s2)
     44e:	0100                	addi	s0,sp,128
     450:	04091003          	lh	zero,64(s2)
     454:	0100                	addi	s0,sp,128
     456:	04090103          	lb	sp,64(s2)
     45a:	0100                	addi	s0,sp,128
     45c:	04090603          	lb	a2,64(s2)
     460:	0100                	addi	s0,sp,128
     462:	0c090103          	lb	sp,192(s2)
     466:	0100                	addi	s0,sp,128
     468:	02097f03          	0x2097f03
     46c:	0100                	addi	s0,sp,128
     46e:	04090103          	lb	sp,64(s2)
     472:	0100                	addi	s0,sp,128
     474:	12090103          	lb	sp,288(s2)
     478:	0100                	addi	s0,sp,128
     47a:	14090103          	lb	sp,320(s2)
     47e:	0100                	addi	s0,sp,128
     480:	00097f03          	0x97f03
     484:	0100                	addi	s0,sp,128
     486:	18090403          	lb	s0,384(s2)
     48a:	0100                	addi	s0,sp,128
     48c:	04090403          	lb	s0,64(s2)
     490:	0100                	addi	s0,sp,128
     492:	04090603          	lb	a2,64(s2)
     496:	0100                	addi	s0,sp,128
     498:	06090303          	lb	t1,96(s2)
     49c:	0100                	addi	s0,sp,128
     49e:	097f8003          	lb	zero,151(t6)
     4a2:	000e                	c.slli	zero,0x3
     4a4:	0301                	addi	t1,t1,0
     4a6:	00040903          	lb	s2,0(s0) # 18000 <_prog_start-0x1ffe8000>
     4aa:	0301                	addi	t1,t1,0
     4ac:	0902                	c.slli64	s2
     4ae:	000a                	c.slli	zero,0x2
     4b0:	0301                	addi	t1,t1,0
     4b2:	097e                	slli	s2,s2,0x1f
     4b4:	0004                	0x4
     4b6:	0301                	addi	t1,t1,0
     4b8:	0901                	addi	s2,s2,0
     4ba:	0004                	0x4
     4bc:	0301                	addi	t1,t1,0
     4be:	0901                	addi	s2,s2,0
     4c0:	0002                	c.slli64	zero
     4c2:	0301                	addi	t1,t1,0
     4c4:	0908                	addi	a0,sp,144
     4c6:	0002                	c.slli64	zero
     4c8:	0301                	addi	t1,t1,0
     4ca:	00040977          	0x40977
     4ce:	0301                	addi	t1,t1,0
     4d0:	0901                	addi	s2,s2,0
     4d2:	0004                	0x4
     4d4:	0301                	addi	t1,t1,0
     4d6:	0902                	c.slli64	s2
     4d8:	0002                	c.slli64	zero
     4da:	0301                	addi	t1,t1,0
     4dc:	097e                	slli	s2,s2,0x1f
     4de:	0006                	c.slli	zero,0x1
     4e0:	0301                	addi	t1,t1,0
     4e2:	0901                	addi	s2,s2,0
     4e4:	0004                	0x4
     4e6:	0301                	addi	t1,t1,0
     4e8:	0908                	addi	a0,sp,144
     4ea:	0002                	c.slli64	zero
     4ec:	0301                	addi	t1,t1,0
     4ee:	0904                	addi	s1,sp,144
     4f0:	0002                	c.slli64	zero
     4f2:	0301                	addi	t1,t1,0
     4f4:	0974                	addi	a3,sp,156
     4f6:	0004                	0x4
     4f8:	0301                	addi	t1,t1,0
     4fa:	0901                	addi	s2,s2,0
     4fc:	0004                	0x4
     4fe:	0301                	addi	t1,t1,0
     500:	0002090b          	0x2090b
     504:	0301                	addi	t1,t1,0
     506:	0975                	addi	s2,s2,29
     508:	0004                	0x4
     50a:	0301                	addi	t1,t1,0
     50c:	0901                	addi	s2,s2,0
     50e:	0004                	0x4
     510:	0301                	addi	t1,t1,0
     512:	0905                	addi	s2,s2,1
     514:	0006                	c.slli	zero,0x1
     516:	0301                	addi	t1,t1,0
     518:	0901                	addi	s2,s2,0
     51a:	000c                	0xc
     51c:	0301                	addi	t1,t1,0
     51e:	0901                	addi	s2,s2,0
     520:	0014                	0x14
     522:	0301                	addi	t1,t1,0
     524:	0901                	addi	s2,s2,0
     526:	0010                	0x10
     528:	0301                	addi	t1,t1,0
     52a:	097f                	0x97f
     52c:	0000                	unimp
     52e:	0301                	addi	t1,t1,0
     530:	00180903          	lb	s2,1(a6) # 18001 <_prog_start-0x1ffe7fff>
     534:	0301                	addi	t1,t1,0
     536:	000c097b          	0xc097b
     53a:	0301                	addi	t1,t1,0
     53c:	091a                	slli	s2,s2,0x6
     53e:	0002                	c.slli64	zero
     540:	0301                	addi	t1,t1,0
     542:	0915                	addi	s2,s2,5
     544:	000a                	c.slli	zero,0x2
     546:	0301                	addi	t1,t1,0
     548:	000a0933          	add	s2,s4,zero
     54c:	0901                	addi	s2,s2,0
     54e:	000a                	c.slli	zero,0x2
     550:	0100                	addi	s0,sp,128
     552:	0201                	addi	tp,tp,0
     554:	0002                	c.slli64	zero
     556:	0200                	addi	s0,sp,256
     558:	3a00                	fld	fs0,48(a2)
     55a:	0001                	nop
     55c:	0100                	addi	s0,sp,128
     55e:	fb01                	bnez	a4,46e <_prog_start-0x1ffffb92>
     560:	0d0e                	slli	s10,s10,0x3
     562:	0100                	addi	s0,sp,128
     564:	0101                	addi	sp,sp,0
     566:	0001                	nop
     568:	0000                	unimp
     56a:	0001                	nop
     56c:	0100                	addi	s0,sp,128
     56e:	7263732f          	0x7263732f
     572:	7461                	lui	s0,0xffff8
     574:	612f6863          	bltu	t5,s2,b84 <_prog_start-0x1ffff47c>
     578:	7568                	flw	fa0,108(a0)
     57a:	746e                	flw	fs0,248(sp)
     57c:	6e69                	lui	t3,0x1a
     57e:	6e6f7467          	0x6e6f7467
     582:	6465662f          	0x6465662f
     586:	7265                	lui	tp,0xffff9
     588:	7461                	lui	s0,0xffff8
     58a:	6f69                	lui	t5,0x1a
     58c:	2f6e                	fld	ft10,216(sp)
     58e:	74666f73          	csrrsi	t5,0x746,12
     592:	65726177          	0x65726177
     596:	62696c2f          	0x62696c2f
     59a:	6172                	flw	ft2,28(sp)
     59c:	6972                	flw	fs2,28(sp)
     59e:	7365                	lui	t1,0xffff9
     5a0:	6574612f          	0x6574612f
     5a4:	2f00                	fld	fs0,24(a4)
     5a6:	6b726f77          	0x6b726f77
     5aa:	6f6f742f          	0x6f6f742f
     5ae:	736c                	flw	fa1,100(a4)
     5b0:	7369722f          	0x7369722f
     5b4:	742d7663          	bgeu	s10,sp,d00 <_prog_start-0x1ffff300>
     5b8:	736c6f6f          	jal	t5,c6cee <_prog_start-0x1ff39312>
     5bc:	3236392f          	0x3236392f
     5c0:	6362                	flw	ft6,24(sp)
     5c2:	3930                	fld	fa2,112(a0)
     5c4:	3738                	fld	fa4,104(a4)
     5c6:	31373033          	0x31373033
     5ca:	6161                	addi	sp,sp,80
     5cc:	36313837          	lui	a6,0x36313
     5d0:	3564                	fld	fs1,232(a0)
     5d2:	3866                	fld	fa6,120(sp)
     5d4:	3530                	fld	fa2,104(a0)
     5d6:	35653663          	0x35653663
     5da:	61373937          	lui	s2,0x61373
     5de:	62356233          	0x62356233
     5e2:	2f376663          	bltu	a4,s3,8ce <_prog_start-0x1ffff732>
     5e6:	6972                	flw	fs2,28(sp)
     5e8:	36766373          	csrrsi	t1,0x367,12
     5ec:	2d34                	fld	fa3,88(a0)
     5ee:	6e75                	lui	t3,0x1d
     5f0:	776f6e6b          	0x776f6e6b
     5f4:	2d6e                	fld	fs10,216(sp)
     5f6:	6c65                	lui	s8,0x19
     5f8:	2f66                	fld	ft10,88(sp)
     5fa:	6e69                	lui	t3,0x1a
     5fc:	64756c63          	bltu	a0,t2,c54 <_prog_start-0x1ffff3ac>
     600:	2f65                	jal	db8 <_prog_start-0x1ffff248>
     602:	616d                	addi	sp,sp,240
     604:	6e696863          	bltu	s2,t1,cf4 <_prog_start-0x1ffff30c>
     608:	0065                	c.nop	25
     60a:	726f772f          	0x726f772f
     60e:	6f742f6b          	0x6f742f6b
     612:	2f736c6f          	jal	s8,37108 <_prog_start-0x1ffc8ef8>
     616:	6972                	flw	fs2,28(sp)
     618:	2d766373          	csrrsi	t1,0x2d7,12
     61c:	6f74                	flw	fa3,92(a4)
     61e:	2f736c6f          	jal	s8,37114 <_prog_start-0x1ffc8eec>
     622:	3639                	jal	130 <_prog_start-0x1ffffed0>
     624:	6232                	flw	ft4,12(sp)
     626:	38393063          	0x38393063
     62a:	37303337          	lui	t1,0x37303
     62e:	6131                	addi	sp,sp,320
     630:	3761                	jal	5b8 <_prog_start-0x1ffffa48>
     632:	3138                	fld	fa4,96(a0)
     634:	6436                	flw	fs0,76(sp)
     636:	6635                	lui	a2,0xd
     638:	3038                	fld	fa4,96(s0)
     63a:	6335                	lui	t1,0xd
     63c:	6536                	flw	fa0,76(sp)
     63e:	3735                	jal	56a <_prog_start-0x1ffffa96>
     640:	3739                	jal	54e <_prog_start-0x1ffffab2>
     642:	3361                	jal	3ca <_prog_start-0x1ffffc36>
     644:	3562                	fld	fa0,56(sp)
     646:	6362                	flw	ft6,24(sp)
     648:	3766                	fld	fa4,120(sp)
     64a:	7369722f          	0x7369722f
     64e:	34367663          	bgeu	a2,gp,99a <_prog_start-0x1ffff666>
     652:	752d                	lui	a0,0xfffeb
     654:	6b6e                	flw	fs6,216(sp)
     656:	6f6e                	flw	ft10,216(sp)
     658:	652d6e77          	0x652d6e77
     65c:	666c                	flw	fa1,76(a2)
     65e:	636e692f          	0x636e692f
     662:	756c                	flw	fa1,108(a0)
     664:	6564                	flw	fs1,76(a0)
     666:	7379732f          	0x7379732f
     66a:	0000                	unimp
     66c:	7461                	lui	s0,0xffff8
     66e:	2e65                	jal	a26 <_prog_start-0x1ffff5da>
     670:	00010063          	beqz	sp,670 <_prog_start-0x1ffff990>
     674:	5f00                	lw	s0,56(a4)
     676:	6564                	flw	fs1,76(a0)
     678:	6166                	flw	ft2,88(sp)
     67a:	6c75                	lui	s8,0x1d
     67c:	5f74                	lw	a3,124(a4)
     67e:	7974                	flw	fa3,116(a0)
     680:	6570                	flw	fa2,76(a0)
     682:	00682e73          	csrrs	t3,0x6,a6
     686:	0002                	c.slli64	zero
     688:	5f00                	lw	s0,56(a4)
     68a:	69647473          	csrrci	s0,0x696,8
     68e:	746e                	flw	fs0,248(sp)
     690:	682e                	flw	fa6,200(sp)
     692:	0300                	addi	s0,sp,384
     694:	0000                	unimp
     696:	0000                	unimp
     698:	0205                	addi	tp,tp,1
     69a:	04aa                	slli	s1,s1,0xa
     69c:	2000                	fld	fs0,0(s0)
     69e:	031a                	slli	t1,t1,0x6
     6a0:	0905                	addi	s2,s2,1
     6a2:	0000                	unimp
     6a4:	0301                	addi	t1,t1,0
     6a6:	0901                	addi	s2,s2,0
     6a8:	0006                	c.slli	zero,0x1
     6aa:	0301                	addi	t1,t1,0
     6ac:	0901                	addi	s2,s2,0
     6ae:	000c                	0xc
     6b0:	0301                	addi	t1,t1,0
     6b2:	097e                	slli	s2,s2,0x1f
     6b4:	0004                	0x4
     6b6:	0301                	addi	t1,t1,0
     6b8:	0902                	c.slli64	s2
     6ba:	0004                	0x4
     6bc:	0301                	addi	t1,t1,0
     6be:	097f                	0x97f
     6c0:	0004                	0x4
     6c2:	0301                	addi	t1,t1,0
     6c4:	097f                	0x97f
     6c6:	0002                	c.slli64	zero
     6c8:	0301                	addi	t1,t1,0
     6ca:	00020903          	lb	s2,0(tp) # ffff9000 <_sp+0x7fff5000>
     6ce:	0301                	addi	t1,t1,0
     6d0:	00020903          	lb	s2,0(tp) # 0 <_prog_start-0x20000000>
     6d4:	0301                	addi	t1,t1,0
     6d6:	0906                	slli	s2,s2,0x1
     6d8:	0002                	c.slli64	zero
     6da:	0301                	addi	t1,t1,0
     6dc:	097a                	slli	s2,s2,0x1e
     6de:	0004                	0x4
     6e0:	0301                	addi	t1,t1,0
     6e2:	0906                	slli	s2,s2,0x1
     6e4:	0002                	c.slli64	zero
     6e6:	0301                	addi	t1,t1,0
     6e8:	0901                	addi	s2,s2,0
     6ea:	000a                	c.slli	zero,0x2
     6ec:	0301                	addi	t1,t1,0
     6ee:	0901                	addi	s2,s2,0
     6f0:	0004                	0x4
     6f2:	0301                	addi	t1,t1,0
     6f4:	0901                	addi	s2,s2,0
     6f6:	0002                	c.slli64	zero
     6f8:	0301                	addi	t1,t1,0
     6fa:	0902                	c.slli64	s2
     6fc:	0002                	c.slli64	zero
     6fe:	0301                	addi	t1,t1,0
     700:	097e                	slli	s2,s2,0x1f
     702:	0004                	0x4
     704:	0301                	addi	t1,t1,0
     706:	0902                	c.slli64	s2
     708:	0002                	c.slli64	zero
     70a:	0301                	addi	t1,t1,0
     70c:	00020903          	lb	s2,0(tp) # 0 <_prog_start-0x20000000>
     710:	0301                	addi	t1,t1,0
     712:	00080903          	lb	s2,0(a6) # 36313000 <_data_lma+0x16310cc0>
     716:	0301                	addi	t1,t1,0
     718:	0911                	addi	s2,s2,4
     71a:	001a                	c.slli	zero,0x6
     71c:	0301                	addi	t1,t1,0
     71e:	0902                	c.slli64	s2
     720:	0002                	c.slli64	zero
     722:	0301                	addi	t1,t1,0
     724:	00080973          	0x80973
     728:	0301                	addi	t1,t1,0
     72a:	0004090b          	0x4090b
     72e:	0301                	addi	t1,t1,0
     730:	0902                	c.slli64	s2
     732:	0002                	c.slli64	zero
     734:	0301                	addi	t1,t1,0
     736:	00080903          	lb	s2,0(a6)
     73a:	0301                	addi	t1,t1,0
     73c:	0902                	c.slli64	s2
     73e:	0002                	c.slli64	zero
     740:	0301                	addi	t1,t1,0
     742:	097e                	slli	s2,s2,0x1f
     744:	0004                	0x4
     746:	0301                	addi	t1,t1,0
     748:	0902                	c.slli64	s2
     74a:	0002                	c.slli64	zero
     74c:	0301                	addi	t1,t1,0
     74e:	0902                	c.slli64	s2
     750:	0002                	c.slli64	zero
     752:	0901                	addi	s2,s2,0
     754:	0008                	0x8
     756:	0100                	addi	s0,sp,128
     758:	9301                	srli	a4,a4,0x20
     75a:	0200000f          	fence	r,unknown
     75e:	cb00                	sw	s0,16(a4)
     760:	0001                	nop
     762:	0100                	addi	s0,sp,128
     764:	fb01                	bnez	a4,674 <_prog_start-0x1ffff98c>
     766:	0d0e                	slli	s10,s10,0x3
     768:	0100                	addi	s0,sp,128
     76a:	0101                	addi	sp,sp,0
     76c:	0001                	nop
     76e:	0000                	unimp
     770:	0001                	nop
     772:	0100                	addi	s0,sp,128
     774:	7263732f          	0x7263732f
     778:	7461                	lui	s0,0xffff8
     77a:	612f6863          	bltu	t5,s2,d8a <_prog_start-0x1ffff276>
     77e:	7568                	flw	fa0,108(a0)
     780:	746e                	flw	fs0,248(sp)
     782:	6e69                	lui	t3,0x1a
     784:	6e6f7467          	0x6e6f7467
     788:	6465662f          	0x6465662f
     78c:	7265                	lui	tp,0xffff9
     78e:	7461                	lui	s0,0xffff8
     790:	6f69                	lui	t5,0x1a
     792:	2f6e                	fld	ft10,216(sp)
     794:	74666f73          	csrrsi	t5,0x746,12
     798:	65726177          	0x65726177
     79c:	62696c2f          	0x62696c2f
     7a0:	6172                	flw	ft2,28(sp)
     7a2:	6972                	flw	fs2,28(sp)
     7a4:	7365                	lui	t1,0xffff9
     7a6:	6e65622f          	0x6e65622f
     7aa:	74756863          	bltu	a0,t2,efa <_prog_start-0x1ffff106>
     7ae:	6c69                	lui	s8,0x1a
     7b0:	772f0073          	0x772f0073
     7b4:	2f6b726f          	jal	tp,b7aaa <_prog_start-0x1ff48556>
     7b8:	6f74                	flw	fa3,92(a4)
     7ba:	2f736c6f          	jal	s8,372b0 <_prog_start-0x1ffc8d50>
     7be:	6972                	flw	fs2,28(sp)
     7c0:	2d766373          	csrrsi	t1,0x2d7,12
     7c4:	6f74                	flw	fa3,92(a4)
     7c6:	2f736c6f          	jal	s8,372bc <_prog_start-0x1ffc8d44>
     7ca:	3639                	jal	2d8 <_prog_start-0x1ffffd28>
     7cc:	6232                	flw	ft4,12(sp)
     7ce:	38393063          	0x38393063
     7d2:	37303337          	lui	t1,0x37303
     7d6:	6131                	addi	sp,sp,320
     7d8:	3761                	jal	760 <_prog_start-0x1ffff8a0>
     7da:	3138                	fld	fa4,96(a0)
     7dc:	6436                	flw	fs0,76(sp)
     7de:	6635                	lui	a2,0xd
     7e0:	3038                	fld	fa4,96(s0)
     7e2:	6335                	lui	t1,0xd
     7e4:	6536                	flw	fa0,76(sp)
     7e6:	3735                	jal	712 <_prog_start-0x1ffff8ee>
     7e8:	3739                	jal	6f6 <_prog_start-0x1ffff90a>
     7ea:	3361                	jal	572 <_prog_start-0x1ffffa8e>
     7ec:	3562                	fld	fa0,56(sp)
     7ee:	6362                	flw	ft6,24(sp)
     7f0:	3766                	fld	fa4,120(sp)
     7f2:	7369722f          	0x7369722f
     7f6:	34367663          	bgeu	a2,gp,b42 <_prog_start-0x1ffff4be>
     7fa:	752d                	lui	a0,0xfffeb
     7fc:	6b6e                	flw	fs6,216(sp)
     7fe:	6f6e                	flw	ft10,216(sp)
     800:	652d6e77          	0x652d6e77
     804:	666c                	flw	fa1,76(a2)
     806:	636e692f          	0x636e692f
     80a:	756c                	flw	fa1,108(a0)
     80c:	6564                	flw	fs1,76(a0)
     80e:	63616d2f          	0x63616d2f
     812:	6968                	flw	fa0,84(a0)
     814:	656e                	flw	fa0,216(sp)
     816:	2f00                	fld	fs0,24(a4)
     818:	6b726f77          	0x6b726f77
     81c:	6f6f742f          	0x6f6f742f
     820:	736c                	flw	fa1,100(a4)
     822:	7369722f          	0x7369722f
     826:	742d7663          	bgeu	s10,sp,f72 <_prog_start-0x1ffff08e>
     82a:	736c6f6f          	jal	t5,c6f60 <_prog_start-0x1ff390a0>
     82e:	3236392f          	0x3236392f
     832:	6362                	flw	ft6,24(sp)
     834:	3930                	fld	fa2,112(a0)
     836:	3738                	fld	fa4,104(a4)
     838:	31373033          	0x31373033
     83c:	6161                	addi	sp,sp,80
     83e:	36313837          	lui	a6,0x36313
     842:	3564                	fld	fs1,232(a0)
     844:	3866                	fld	fa6,120(sp)
     846:	3530                	fld	fa2,104(a0)
     848:	35653663          	0x35653663
     84c:	61373937          	lui	s2,0x61373
     850:	62356233          	0x62356233
     854:	2f376663          	bltu	a4,s3,b40 <_prog_start-0x1ffff4c0>
     858:	6972                	flw	fs2,28(sp)
     85a:	36766373          	csrrsi	t1,0x367,12
     85e:	2d34                	fld	fa3,88(a0)
     860:	6e75                	lui	t3,0x1d
     862:	776f6e6b          	0x776f6e6b
     866:	2d6e                	fld	fs10,216(sp)
     868:	6c65                	lui	s8,0x19
     86a:	2f66                	fld	ft10,88(sp)
     86c:	6e69                	lui	t3,0x1a
     86e:	64756c63          	bltu	a0,t2,ec6 <_prog_start-0x1ffff13a>
     872:	2f65                	jal	102a <_prog_start-0x1fffefd6>
     874:	00737973          	csrrci	s2,0x7,6
     878:	726f772f          	0x726f772f
     87c:	6f742f6b          	0x6f742f6b
     880:	2f736c6f          	jal	s8,37376 <_prog_start-0x1ffc8c8a>
     884:	6972                	flw	fs2,28(sp)
     886:	2d766373          	csrrsi	t1,0x2d7,12
     88a:	6f74                	flw	fa3,92(a4)
     88c:	2f736c6f          	jal	s8,37382 <_prog_start-0x1ffc8c7e>
     890:	3639                	jal	39e <_prog_start-0x1ffffc62>
     892:	6232                	flw	ft4,12(sp)
     894:	38393063          	0x38393063
     898:	37303337          	lui	t1,0x37303
     89c:	6131                	addi	sp,sp,320
     89e:	3761                	jal	826 <_prog_start-0x1ffff7da>
     8a0:	3138                	fld	fa4,96(a0)
     8a2:	6436                	flw	fs0,76(sp)
     8a4:	6635                	lui	a2,0xd
     8a6:	3038                	fld	fa4,96(s0)
     8a8:	6335                	lui	t1,0xd
     8aa:	6536                	flw	fa0,76(sp)
     8ac:	3735                	jal	7d8 <_prog_start-0x1ffff828>
     8ae:	3739                	jal	7bc <_prog_start-0x1ffff844>
     8b0:	3361                	jal	638 <_prog_start-0x1ffff9c8>
     8b2:	3562                	fld	fa0,56(sp)
     8b4:	6362                	flw	ft6,24(sp)
     8b6:	3766                	fld	fa4,120(sp)
     8b8:	62696c2f          	0x62696c2f
     8bc:	6363672f          	0x6363672f
     8c0:	7369722f          	0x7369722f
     8c4:	34367663          	bgeu	a2,gp,c10 <_prog_start-0x1ffff3f0>
     8c8:	752d                	lui	a0,0xfffeb
     8ca:	6b6e                	flw	fs6,216(sp)
     8cc:	6f6e                	flw	ft10,216(sp)
     8ce:	652d6e77          	0x652d6e77
     8d2:	666c                	flw	fa1,76(a2)
     8d4:	322e372f          	0x322e372f
     8d8:	302e                	fld	ft0,232(sp)
     8da:	636e692f          	0x636e692f
     8de:	756c                	flw	fa1,108(a0)
     8e0:	6564                	flw	fs1,76(a0)
     8e2:	0000                	unimp
     8e4:	6562                	flw	fa0,24(sp)
     8e6:	636e                	flw	ft6,216(sp)
     8e8:	7568                	flw	fa0,108(a0)
     8ea:	6974                	flw	fa3,84(a0)
     8ec:	736c                	flw	fa1,100(a4)
     8ee:	632e                	flw	ft6,200(sp)
     8f0:	0100                	addi	s0,sp,128
     8f2:	0000                	unimp
     8f4:	645f 6665 7561      	0x75616665645f
     8fa:	746c                	flw	fa1,108(s0)
     8fc:	745f 7079 7365      	0x73657079745f
     902:	682e                	flw	fa6,200(sp)
     904:	0200                	addi	s0,sp,256
     906:	0000                	unimp
     908:	735f 6474 6e69      	0x6e696474735f
     90e:	2e74                	fld	fa3,216(a2)
     910:	0068                	addi	a0,sp,12
     912:	73000003          	lb	zero,1840(zero) # 730 <_prog_start-0x1ffff8d0>
     916:	6474                	flw	fa3,76(s0)
     918:	6564                	flw	fs1,76(a0)
     91a:	2e66                	fld	ft8,88(sp)
     91c:	0068                	addi	a0,sp,12
     91e:	0004                	0x4
     920:	7500                	flw	fs0,40(a0)
     922:	696e                	flw	fs2,216(sp)
     924:	2e647473          	csrrci	s0,0x2e6,8
     928:	0068                	addi	a0,sp,12
     92a:	00000003          	lb	zero,0(zero) # 0 <_prog_start-0x20000000>
     92e:	0500                	addi	s0,sp,640
     930:	3c02                	fld	fs8,32(sp)
     932:	0005                	c.nop	1
     934:	0320                	addi	s0,sp,392
     936:	00e0                	addi	s0,sp,76
     938:	0301                	addi	t1,t1,0
     93a:	00000903          	lb	s2,0(zero) # 0 <_prog_start-0x20000000>
     93e:	0301                	addi	t1,t1,0
     940:	0901                	addi	s2,s2,0
     942:	000a                	c.slli	zero,0x2
     944:	0301                	addi	t1,t1,0
     946:	0906                	slli	s2,s2,0x1
     948:	0002                	c.slli64	zero
     94a:	0301                	addi	t1,t1,0
     94c:	02df 0209 0100      	0x100020902df
     952:	00090503          	lb	a0,0(s2) # 61373000 <_data_lma+0x41370cc0>
     956:	0100                	addi	s0,sp,128
     958:	097cf503          	0x97cf503
     95c:	0006                	c.slli	zero,0x1
     95e:	0301                	addi	t1,t1,0
     960:	01c4                	addi	s1,sp,196
     962:	0809                	addi	a6,a6,2
     964:	0100                	addi	s0,sp,128
     966:	097ebc03          	0x97ebc03
     96a:	000a                	c.slli	zero,0x2
     96c:	0301                	addi	t1,t1,0
     96e:	01c6                	slli	gp,gp,0x11
     970:	0809                	addi	a6,a6,2
     972:	0100                	addi	s0,sp,128
     974:	0c097e03          	0xc097e03
     978:	0100                	addi	s0,sp,128
     97a:	0901ca03          	lbu	s4,144(gp) # 80000e10 <__global_pointer$+0x90>
     97e:	000c                	0xc
     980:	0301                	addi	t1,t1,0
     982:	0902                	c.slli64	s2
     984:	0002                	c.slli64	zero
     986:	0301                	addi	t1,t1,0
     988:	097e                	slli	s2,s2,0x1f
     98a:	0006                	c.slli	zero,0x1
     98c:	0301                	addi	t1,t1,0
     98e:	7eb6                	flw	ft9,108(sp)
     990:	0409                	addi	s0,s0,2
     992:	0100                	addi	s0,sp,128
     994:	0901ca03          	lbu	s4,144(gp) # 80000e10 <__global_pointer$+0x90>
     998:	0004                	0x4
     99a:	0301                	addi	t1,t1,0
     99c:	0901                	addi	s2,s2,0
     99e:	0006                	c.slli	zero,0x1
     9a0:	0301                	addi	t1,t1,0
     9a2:	0901                	addi	s2,s2,0
     9a4:	0008                	0x8
     9a6:	0301                	addi	t1,t1,0
     9a8:	7cf0                	flw	fa2,124(s1)
     9aa:	0609                	addi	a2,a2,2
     9ac:	0100                	addi	s0,sp,128
     9ae:	0901c403          	lbu	s0,144(gp) # 80000e10 <__global_pointer$+0x90>
     9b2:	0008                	0x8
     9b4:	0301                	addi	t1,t1,0
     9b6:	7ebc                	flw	fa5,120(a3)
     9b8:	0a09                	addi	s4,s4,2
     9ba:	0100                	addi	s0,sp,128
     9bc:	0901c603          	lbu	a2,144(gp) # 80000e10 <__global_pointer$+0x90>
     9c0:	0008                	0x8
     9c2:	0301                	addi	t1,t1,0
     9c4:	01cc                	addi	a1,sp,196
     9c6:	0c09                	addi	s8,s8,2
     9c8:	0100                	addi	s0,sp,128
     9ca:	097cee03          	0x97cee03
     9ce:	0004                	0x4
     9d0:	0301                	addi	t1,t1,0
     9d2:	01c4                	addi	s1,sp,196
     9d4:	0809                	addi	a6,a6,2
     9d6:	0100                	addi	s0,sp,128
     9d8:	097ebc03          	0x97ebc03
     9dc:	000a                	c.slli	zero,0x2
     9de:	0301                	addi	t1,t1,0
     9e0:	01c6                	slli	gp,gp,0x11
     9e2:	0809                	addi	a6,a6,2
     9e4:	0100                	addi	s0,sp,128
     9e6:	0901ce03          	lbu	t3,144(gp) # 80000e10 <__global_pointer$+0x90>
     9ea:	000c                	0xc
     9ec:	0301                	addi	t1,t1,0
     9ee:	7cec                	flw	fa1,124(s1)
     9f0:	0409                	addi	s0,s0,2
     9f2:	0100                	addi	s0,sp,128
     9f4:	0901c403          	lbu	s0,144(gp) # 80000e10 <__global_pointer$+0x90>
     9f8:	0008                	0x8
     9fa:	0301                	addi	t1,t1,0
     9fc:	7ebc                	flw	fa5,120(a3)
     9fe:	0a09                	addi	s4,s4,2
     a00:	0100                	addi	s0,sp,128
     a02:	0901c603          	lbu	a2,144(gp) # 80000e10 <__global_pointer$+0x90>
     a06:	0008                	0x8
     a08:	0301                	addi	t1,t1,0
     a0a:	01c8                	addi	a0,sp,196
     a0c:	0c09                	addi	s8,s8,2
     a0e:	0100                	addi	s0,sp,128
     a10:	06090a03          	lb	s4,96(s2)
     a14:	0100                	addi	s0,sp,128
     a16:	097ce603          	0x97ce603
     a1a:	0002                	c.slli64	zero
     a1c:	0301                	addi	t1,t1,0
     a1e:	0902                	c.slli64	s2
     a20:	0000                	unimp
     a22:	0301                	addi	t1,t1,0
     a24:	0904                	addi	s1,sp,144
     a26:	0008                	0x8
     a28:	0301                	addi	t1,t1,0
     a2a:	00020907          	0x20907
     a2e:	0301                	addi	t1,t1,0
     a30:	0902                	c.slli64	s2
     a32:	0000                	unimp
     a34:	0301                	addi	t1,t1,0
     a36:	0902                	c.slli64	s2
     a38:	0008                	0x8
     a3a:	0301                	addi	t1,t1,0
     a3c:	0971                	addi	s2,s2,28
     a3e:	0004                	0x4
     a40:	0301                	addi	t1,t1,0
     a42:	0912                	slli	s2,s2,0x4
     a44:	0008                	0x8
     a46:	0001                	nop
     a48:	0402                	c.slli64	s0
     a4a:	0601                	addi	a2,a2,0
     a4c:	04090003          	lb	zero,64(s2)
     a50:	0100                	addi	s0,sp,128
     a52:	0306                	slli	t1,t1,0x1
     a54:	096e                	slli	s2,s2,0x1b
     a56:	000a                	c.slli	zero,0x2
     a58:	0301                	addi	t1,t1,0
     a5a:	0915                	addi	s2,s2,5
     a5c:	0008                	0x8
     a5e:	0301                	addi	t1,t1,0
     a60:	0902                	c.slli64	s2
     a62:	0002                	c.slli64	zero
     a64:	0301                	addi	t1,t1,0
     a66:	0901                	addi	s2,s2,0
     a68:	0004                	0x4
     a6a:	0301                	addi	t1,t1,0
     a6c:	0905                	addi	s2,s2,1
     a6e:	0006                	c.slli	zero,0x1
     a70:	0301                	addi	t1,t1,0
     a72:	0901                	addi	s2,s2,0
     a74:	0000                	unimp
     a76:	0301                	addi	t1,t1,0
     a78:	097f                	0x97f
     a7a:	0004                	0x4
     a7c:	0301                	addi	t1,t1,0
     a7e:	00020907          	0x20907
     a82:	0301                	addi	t1,t1,0
     a84:	097a                	slli	s2,s2,0x1e
     a86:	0004                	0x4
     a88:	0001                	nop
     a8a:	0402                	c.slli64	s0
     a8c:	0301                	addi	t1,t1,0
     a8e:	0906                	slli	s2,s2,0x1
     a90:	0004                	0x4
     a92:	0301                	addi	t1,t1,0
     a94:	0901                	addi	s2,s2,0
     a96:	0006                	c.slli	zero,0x1
     a98:	0301                	addi	t1,t1,0
     a9a:	0902                	c.slli64	s2
     a9c:	0002                	c.slli64	zero
     a9e:	0301                	addi	t1,t1,0
     aa0:	0905                	addi	s2,s2,1
     aa2:	0002                	c.slli64	zero
     aa4:	0301                	addi	t1,t1,0
     aa6:	0901                	addi	s2,s2,0
     aa8:	0000                	unimp
     aaa:	0301                	addi	t1,t1,0
     aac:	00020953          	fadd.s	fs2,ft4,ft0,rne
     ab0:	0301                	addi	t1,t1,0
     ab2:	092e                	slli	s2,s2,0xb
     ab4:	0008                	0x8
     ab6:	0301                	addi	t1,t1,0
     ab8:	0901                	addi	s2,s2,0
     aba:	0012                	c.slli	zero,0x4
     abc:	0301                	addi	t1,t1,0
     abe:	0901                	addi	s2,s2,0
     ac0:	0004                	0x4
     ac2:	0301                	addi	t1,t1,0
     ac4:	0905                	addi	s2,s2,1
     ac6:	0004                	0x4
     ac8:	0301                	addi	t1,t1,0
     aca:	0901                	addi	s2,s2,0
     acc:	0000                	unimp
     ace:	0301                	addi	t1,t1,0
     ad0:	00060903          	lb	s2,0(a2) # d000 <_prog_start-0x1fff3000>
     ad4:	0301                	addi	t1,t1,0
     ad6:	097d                	addi	s2,s2,31
     ad8:	0004                	0x4
     ada:	0001                	nop
     adc:	0402                	c.slli64	s0
     ade:	0301                	addi	t1,t1,0
     ae0:	094a                	slli	s2,s2,0x12
     ae2:	0006                	c.slli	zero,0x1
     ae4:	0001                	nop
     ae6:	0402                	c.slli64	s0
     ae8:	0301                	addi	t1,t1,0
     aea:	0938                	addi	a4,sp,152
     aec:	0008                	0x8
     aee:	0301                	addi	t1,t1,0
     af0:	0901                	addi	s2,s2,0
     af2:	0006                	c.slli	zero,0x1
     af4:	0001                	nop
     af6:	0402                	c.slli64	s0
     af8:	0301                	addi	t1,t1,0
     afa:	00080947          	fmsub.s	fs2,fa6,ft0,ft0,rne
     afe:	0001                	nop
     b00:	0402                	c.slli64	s0
     b02:	0301                	addi	t1,t1,0
     b04:	093a                	slli	s2,s2,0xe
     b06:	0008                	0x8
     b08:	0301                	addi	t1,t1,0
     b0a:	0901                	addi	s2,s2,0
     b0c:	0006                	c.slli	zero,0x1
     b0e:	0301                	addi	t1,t1,0
     b10:	097d                	addi	s2,s2,31
     b12:	0008                	0x8
     b14:	0301                	addi	t1,t1,0
     b16:	0002090b          	0x2090b
     b1a:	0301                	addi	t1,t1,0
     b1c:	0904                	addi	s1,sp,144
     b1e:	0000                	unimp
     b20:	0301                	addi	t1,t1,0
     b22:	0901                	addi	s2,s2,0
     b24:	0008                	0x8
     b26:	0301                	addi	t1,t1,0
     b28:	0905                	addi	s2,s2,1
     b2a:	0008                	0x8
     b2c:	0301                	addi	t1,t1,0
     b2e:	0901                	addi	s2,s2,0
     b30:	0002                	c.slli64	zero
     b32:	0301                	addi	t1,t1,0
     b34:	0906                	slli	s2,s2,0x1
     b36:	0004                	0x4
     b38:	0301                	addi	t1,t1,0
     b3a:	097d                	addi	s2,s2,31
     b3c:	0004                	0x4
     b3e:	0301                	addi	t1,t1,0
     b40:	097f                	0x97f
     b42:	0004                	0x4
     b44:	0301                	addi	t1,t1,0
     b46:	0901                	addi	s2,s2,0
     b48:	0004                	0x4
     b4a:	0301                	addi	t1,t1,0
     b4c:	097d                	addi	s2,s2,31
     b4e:	0002                	c.slli64	zero
     b50:	0301                	addi	t1,t1,0
     b52:	0004091b          	0x4091b
     b56:	0301                	addi	t1,t1,0
     b58:	0965                	addi	s2,s2,25
     b5a:	0004                	0x4
     b5c:	0301                	addi	t1,t1,0
     b5e:	0911                	addi	s2,s2,4
     b60:	0004                	0x4
     b62:	0301                	addi	t1,t1,0
     b64:	097d                	addi	s2,s2,31
     b66:	0004                	0x4
     b68:	0301                	addi	t1,t1,0
     b6a:	0906                	slli	s2,s2,0x1
     b6c:	0004                	0x4
     b6e:	0301                	addi	t1,t1,0
     b70:	0905                	addi	s2,s2,1
     b72:	0004                	0x4
     b74:	0301                	addi	t1,t1,0
     b76:	0902                	c.slli64	s2
     b78:	0004                	0x4
     b7a:	0301                	addi	t1,t1,0
     b7c:	0901                	addi	s2,s2,0
     b7e:	0002                	c.slli64	zero
     b80:	0301                	addi	t1,t1,0
     b82:	0971                	addi	s2,s2,28
     b84:	0004                	0x4
     b86:	0301                	addi	t1,t1,0
     b88:	0901                	addi	s2,s2,0
     b8a:	0004                	0x4
     b8c:	0001                	nop
     b8e:	0402                	c.slli64	s0
     b90:	0301                	addi	t1,t1,0
     b92:	7fa4                	flw	fs1,120(a5)
     b94:	0409                	addi	s0,s0,2
     b96:	0100                	addi	s0,sp,128
     b98:	0200                	addi	s0,sp,256
     b9a:	0104                	addi	s1,sp,128
     b9c:	0900e103          	0x900e103
     ba0:	0008                	0x8
     ba2:	0301                	addi	t1,t1,0
     ba4:	0901                	addi	s2,s2,0
     ba6:	0006                	c.slli	zero,0x1
     ba8:	0001                	nop
     baa:	0402                	c.slli64	s0
     bac:	0301                	addi	t1,t1,0
     bae:	7f9e                	flw	ft11,228(sp)
     bb0:	0809                	addi	a6,a6,2
     bb2:	0100                	addi	s0,sp,128
     bb4:	0200                	addi	s0,sp,256
     bb6:	0104                	addi	s1,sp,128
     bb8:	0900e403          	0x900e403
     bbc:	0008                	0x8
     bbe:	0001                	nop
     bc0:	0402                	c.slli64	s0
     bc2:	0301                	addi	t1,t1,0
     bc4:	0901                	addi	s2,s2,0
     bc6:	0006                	c.slli	zero,0x1
     bc8:	0001                	nop
     bca:	0402                	c.slli64	s0
     bcc:	0301                	addi	t1,t1,0
     bce:	0902                	c.slli64	s2
     bd0:	0002                	c.slli64	zero
     bd2:	0001                	nop
     bd4:	0402                	c.slli64	s0
     bd6:	0301                	addi	t1,t1,0
     bd8:	097e                	slli	s2,s2,0x1f
     bda:	0004                	0x4
     bdc:	0001                	nop
     bde:	0402                	c.slli64	s0
     be0:	0301                	addi	t1,t1,0
     be2:	0902                	c.slli64	s2
     be4:	0006                	c.slli	zero,0x1
     be6:	0301                	addi	t1,t1,0
     be8:	0902                	c.slli64	s2
     bea:	0008                	0x8
     bec:	0301                	addi	t1,t1,0
     bee:	097f                	0x97f
     bf0:	0002                	c.slli64	zero
     bf2:	0301                	addi	t1,t1,0
     bf4:	0902                	c.slli64	s2
     bf6:	0002                	c.slli64	zero
     bf8:	0301                	addi	t1,t1,0
     bfa:	097f                	0x97f
     bfc:	0004                	0x4
     bfe:	0301                	addi	t1,t1,0
     c00:	0901                	addi	s2,s2,0
     c02:	0006                	c.slli	zero,0x1
     c04:	0301                	addi	t1,t1,0
     c06:	097e                	slli	s2,s2,0x1f
     c08:	0006                	c.slli	zero,0x1
     c0a:	0301                	addi	t1,t1,0
     c0c:	0902                	c.slli64	s2
     c0e:	0002                	c.slli64	zero
     c10:	0301                	addi	t1,t1,0
     c12:	096d                	addi	s2,s2,27
     c14:	0004                	0x4
     c16:	0301                	addi	t1,t1,0
     c18:	0918                	addi	a4,sp,144
     c1a:	0004                	0x4
     c1c:	0301                	addi	t1,t1,0
     c1e:	00040903          	lb	s2,0(s0) # ffff8000 <_sp+0x7fff4000>
     c22:	0301                	addi	t1,t1,0
     c24:	0975                	addi	s2,s2,29
     c26:	0002                	c.slli64	zero
     c28:	0301                	addi	t1,t1,0
     c2a:	0970                	addi	a2,sp,156
     c2c:	0002                	c.slli64	zero
     c2e:	0301                	addi	t1,t1,0
     c30:	0908                	addi	a0,sp,144
     c32:	0006                	c.slli	zero,0x1
     c34:	0301                	addi	t1,t1,0
     c36:	096c                	addi	a1,sp,156
     c38:	0006                	c.slli	zero,0x1
     c3a:	0301                	addi	t1,t1,0
     c3c:	0902                	c.slli64	s2
     c3e:	0008                	0x8
     c40:	0301                	addi	t1,t1,0
     c42:	0924                	addi	s1,sp,152
     c44:	0002                	c.slli64	zero
     c46:	0301                	addi	t1,t1,0
     c48:	097d                	addi	s2,s2,31
     c4a:	0002                	c.slli64	zero
     c4c:	0301                	addi	t1,t1,0
     c4e:	0904                	addi	s1,sp,144
     c50:	0004                	0x4
     c52:	0301                	addi	t1,t1,0
     c54:	0962                	slli	s2,s2,0x18
     c56:	0002                	c.slli64	zero
     c58:	0301                	addi	t1,t1,0
     c5a:	097a                	slli	s2,s2,0x1e
     c5c:	0002                	c.slli64	zero
     c5e:	0301                	addi	t1,t1,0
     c60:	0928                	addi	a0,sp,152
     c62:	0006                	c.slli	zero,0x1
     c64:	0301                	addi	t1,t1,0
     c66:	0900                	addi	s0,sp,144
     c68:	000a                	c.slli	zero,0x2
     c6a:	0301                	addi	t1,t1,0
     c6c:	7fa8                	flw	fa0,120(a5)
     c6e:	0209                	addi	tp,tp,2
     c70:	0100                	addi	s0,sp,128
     c72:	00090603          	lb	a2,0(s2)
     c76:	0100                	addi	s0,sp,128
     c78:	0900d303          	lhu	t1,144(ra)
     c7c:	0004                	0x4
     c7e:	0301                	addi	t1,t1,0
     c80:	06097fa7          	0x6097fa7
     c84:	0100                	addi	s0,sp,128
     c86:	0900da03          	lhu	s4,144(ra)
     c8a:	0004                	0x4
     c8c:	0301                	addi	t1,t1,0
     c8e:	7fa6                	flw	ft11,104(sp)
     c90:	0209                	addi	tp,tp,2
     c92:	0100                	addi	s0,sp,128
     c94:	0900d903          	lhu	s2,144(ra)
     c98:	0004                	0x4
     c9a:	0301                	addi	t1,t1,0
     c9c:	00060903          	lb	s2,0(a2)
     ca0:	0301                	addi	t1,t1,0
     ca2:	7faa                	flw	ft11,168(sp)
     ca4:	0c09                	addi	s8,s8,2
     ca6:	0100                	addi	s0,sp,128
     ca8:	06090103          	lb	sp,96(s2)
     cac:	0100                	addi	s0,sp,128
     cae:	0900db03          	lhu	s6,144(ra)
     cb2:	0004                	0x4
     cb4:	0301                	addi	t1,t1,0
     cb6:	0900                	addi	s0,sp,144
     cb8:	0010                	0x10
     cba:	0301                	addi	t1,t1,0
     cbc:	00060903          	lb	s2,0(a2)
     cc0:	0301                	addi	t1,t1,0
     cc2:	0905                	addi	s2,s2,1
     cc4:	0004                	0x4
     cc6:	0301                	addi	t1,t1,0
     cc8:	0978                	addi	a4,sp,156
     cca:	0002                	c.slli64	zero
     ccc:	0301                	addi	t1,t1,0
     cce:	090a                	slli	s2,s2,0x2
     cd0:	0004                	0x4
     cd2:	0301                	addi	t1,t1,0
     cd4:	0902                	c.slli64	s2
     cd6:	0004                	0x4
     cd8:	0301                	addi	t1,t1,0
     cda:	097e                	slli	s2,s2,0x1f
     cdc:	0002                	c.slli64	zero
     cde:	0301                	addi	t1,t1,0
     ce0:	097f                	0x97f
     ce2:	0004                	0x4
     ce4:	0301                	addi	t1,t1,0
     ce6:	00080903          	lb	s2,0(a6) # 36313000 <_data_lma+0x16310cc0>
     cea:	0301                	addi	t1,t1,0
     cec:	097f                	0x97f
     cee:	0004                	0x4
     cf0:	0301                	addi	t1,t1,0
     cf2:	097f                	0x97f
     cf4:	0004                	0x4
     cf6:	0301                	addi	t1,t1,0
     cf8:	097e                	slli	s2,s2,0x1f
     cfa:	0002                	c.slli64	zero
     cfc:	0301                	addi	t1,t1,0
     cfe:	0908                	addi	a0,sp,144
     d00:	0004                	0x4
     d02:	0301                	addi	t1,t1,0
     d04:	7f94                	flw	fa3,56(a5)
     d06:	0209                	addi	tp,tp,2
     d08:	0100                	addi	s0,sp,128
     d0a:	0900eb03          	0x900eb03
     d0e:	0004                	0x4
     d10:	0301                	addi	t1,t1,0
     d12:	0902                	c.slli64	s2
     d14:	0008                	0x8
     d16:	0301                	addi	t1,t1,0
     d18:	097e                	slli	s2,s2,0x1f
     d1a:	0004                	0x4
     d1c:	0301                	addi	t1,t1,0
     d1e:	0901                	addi	s2,s2,0
     d20:	0008                	0x8
     d22:	0301                	addi	t1,t1,0
     d24:	7f8e                	flw	ft11,224(sp)
     d26:	0809                	addi	a6,a6,2
     d28:	0100                	addi	s0,sp,128
     d2a:	02090603          	lb	a2,32(s2)
     d2e:	0100                	addi	s0,sp,128
     d30:	08090103          	lb	sp,128(s2)
     d34:	0100                	addi	s0,sp,128
     d36:	0900ea03          	0x900ea03
     d3a:	0004                	0x4
     d3c:	0301                	addi	t1,t1,0
     d3e:	0902                	c.slli64	s2
     d40:	0002                	c.slli64	zero
     d42:	0301                	addi	t1,t1,0
     d44:	097e                	slli	s2,s2,0x1f
     d46:	0004                	0x4
     d48:	0301                	addi	t1,t1,0
     d4a:	0904                	addi	s1,sp,144
     d4c:	0004                	0x4
     d4e:	0301                	addi	t1,t1,0
     d50:	7f91                	lui	t6,0xfffe4
     d52:	1209                	addi	tp,tp,-30
     d54:	0100                	addi	s0,sp,128
     d56:	04097a03          	0x4097a03
     d5a:	0100                	addi	s0,sp,128
     d5c:	02090603          	lb	a2,32(s2)
     d60:	0100                	addi	s0,sp,128
     d62:	06090103          	lb	sp,96(s2)
     d66:	0100                	addi	s0,sp,128
     d68:	0900e003          	0x900e003
     d6c:	0006                	c.slli	zero,0x1
     d6e:	0301                	addi	t1,t1,0
     d70:	097c                	addi	a5,sp,156
     d72:	0006                	c.slli	zero,0x1
     d74:	0301                	addi	t1,t1,0
     d76:	00020907          	0x20907
     d7a:	0301                	addi	t1,t1,0
     d7c:	097d                	addi	s2,s2,31
     d7e:	000e                	c.slli	zero,0x3
     d80:	0301                	addi	t1,t1,0
     d82:	0911                	addi	s2,s2,4
     d84:	0006                	c.slli	zero,0x1
     d86:	0301                	addi	t1,t1,0
     d88:	0901                	addi	s2,s2,0
     d8a:	0006                	c.slli	zero,0x1
     d8c:	0301                	addi	t1,t1,0
     d8e:	097f                	0x97f
     d90:	0008                	0x8
     d92:	0301                	addi	t1,t1,0
     d94:	7f88                	flw	fa0,56(a5)
     d96:	0c09                	addi	s8,s8,2
     d98:	0100                	addi	s0,sp,128
     d9a:	0900f903          	0x900f903
     d9e:	0000                	unimp
     da0:	0301                	addi	t1,t1,0
     da2:	02097f87          	0x2097f87
     da6:	0100                	addi	s0,sp,128
     da8:	0a090603          	lb	a2,160(s2)
     dac:	0100                	addi	s0,sp,128
     dae:	06090103          	lb	sp,96(s2)
     db2:	0100                	addi	s0,sp,128
     db4:	0200                	addi	s0,sp,256
     db6:	0304                	addi	s1,sp,384
     db8:	0900f703          	0x900f703
     dbc:	0006                	c.slli	zero,0x1
     dbe:	0001                	nop
     dc0:	0402                	c.slli64	s0
     dc2:	09010303          	lb	t1,144(sp) # b0b0b26 <_prog_start-0x14f4f4da>
     dc6:	0008                	0x8
     dc8:	0001                	nop
     dca:	0402                	c.slli64	s0
     dcc:	09790303          	lb	t1,151(s2)
     dd0:	0004                	0x4
     dd2:	0001                	nop
     dd4:	0402                	c.slli64	s0
     dd6:	7f8e0303          	lb	t1,2040(t3) # 1a7f8 <_prog_start-0x1ffe5808>
     dda:	0209                	addi	tp,tp,2
     ddc:	0100                	addi	s0,sp,128
     dde:	0200                	addi	s0,sp,256
     de0:	0304                	addi	s1,sp,384
     de2:	0900f903          	0x900f903
     de6:	0004                	0x4
     de8:	0001                	nop
     dea:	0402                	c.slli64	s0
     dec:	7f810303          	lb	t1,2040(sp)
     df0:	0c09                	addi	s8,s8,2
     df2:	0100                	addi	s0,sp,128
     df4:	0900fd03          	0x900fd03
     df8:	0006                	c.slli	zero,0x1
     dfa:	0301                	addi	t1,t1,0
     dfc:	00040903          	lb	s2,0(s0)
     e00:	0301                	addi	t1,t1,0
     e02:	097e                	slli	s2,s2,0x1f
     e04:	0008                	0x8
     e06:	0301                	addi	t1,t1,0
     e08:	0901                	addi	s2,s2,0
     e0a:	0008                	0x8
     e0c:	0301                	addi	t1,t1,0
     e0e:	7f81                	lui	t6,0xfffe0
     e10:	0c09                	addi	s8,s8,2
     e12:	0100                	addi	s0,sp,128
     e14:	02090603          	lb	a2,32(s2)
     e18:	0100                	addi	s0,sp,128
     e1a:	06090103          	lb	sp,96(s2)
     e1e:	0100                	addi	s0,sp,128
     e20:	0900f603          	0x900f603
     e24:	0004                	0x4
     e26:	0301                	addi	t1,t1,0
     e28:	0905                	addi	s2,s2,1
     e2a:	0004                	0x4
     e2c:	0301                	addi	t1,t1,0
     e2e:	001e0903          	lb	s2,1(t3)
     e32:	0301                	addi	t1,t1,0
     e34:	04097efb          	0x4097efb
     e38:	0100                	addi	s0,sp,128
     e3a:	09018503          	lb	a0,144(gp) # 80000e10 <__global_pointer$+0x90>
     e3e:	0004                	0x4
     e40:	0301                	addi	t1,t1,0
     e42:	0900                	addi	s0,sp,144
     e44:	000a                	c.slli	zero,0x2
     e46:	0301                	addi	t1,t1,0
     e48:	06097efb          	0x6097efb
     e4c:	0100                	addi	s0,sp,128
     e4e:	02090603          	lb	a2,32(s2)
     e52:	0100                	addi	s0,sp,128
     e54:	06090103          	lb	sp,96(s2)
     e58:	0100                	addi	s0,sp,128
     e5a:	06097f03          	0x6097f03
     e5e:	0100                	addi	s0,sp,128
     e60:	0a090103          	lb	sp,160(s2)
     e64:	0100                	addi	s0,sp,128
     e66:	0900fe03          	0x900fe03
     e6a:	0006                	c.slli	zero,0x1
     e6c:	0301                	addi	t1,t1,0
     e6e:	0905                	addi	s2,s2,1
     e70:	0002                	c.slli64	zero
     e72:	0301                	addi	t1,t1,0
     e74:	7efc                	flw	fa5,124(a3)
     e76:	0409                	addi	s0,s0,2
     e78:	0100                	addi	s0,sp,128
     e7a:	0200                	addi	s0,sp,256
     e7c:	0104                	addi	s1,sp,128
     e7e:	09018403          	lb	s0,144(gp) # 80000e10 <__global_pointer$+0x90>
     e82:	0006                	c.slli	zero,0x1
     e84:	0001                	nop
     e86:	0402                	c.slli64	s0
     e88:	0301                	addi	t1,t1,0
     e8a:	7ef6                	flw	ft9,124(sp)
     e8c:	0409                	addi	s0,s0,2
     e8e:	0100                	addi	s0,sp,128
     e90:	09018c03          	lb	s8,144(gp) # 80000e10 <__global_pointer$+0x90>
     e94:	0006                	c.slli	zero,0x1
     e96:	0301                	addi	t1,t1,0
     e98:	097d                	addi	s2,s2,31
     e9a:	0002                	c.slli64	zero
     e9c:	0301                	addi	t1,t1,0
     e9e:	0901                	addi	s2,s2,0
     ea0:	000c                	0xc
     ea2:	0301                	addi	t1,t1,0
     ea4:	0901                	addi	s2,s2,0
     ea6:	0004                	0x4
     ea8:	0301                	addi	t1,t1,0
     eaa:	7ef5                	lui	t4,0xffffd
     eac:	0409                	addi	s0,s0,2
     eae:	0100                	addi	s0,sp,128
     eb0:	02090603          	lb	a2,32(s2)
     eb4:	0100                	addi	s0,sp,128
     eb6:	06090103          	lb	sp,96(s2)
     eba:	0100                	addi	s0,sp,128
     ebc:	09018503          	lb	a0,144(gp) # 80000e10 <__global_pointer$+0x90>
     ec0:	0004                	0x4
     ec2:	0301                	addi	t1,t1,0
     ec4:	097d                	addi	s2,s2,31
     ec6:	0002                	c.slli64	zero
     ec8:	0301                	addi	t1,t1,0
     eca:	0905                	addi	s2,s2,1
     ecc:	0004                	0x4
     ece:	0301                	addi	t1,t1,0
     ed0:	7ef8                	flw	fa4,124(a3)
     ed2:	1009                	c.nop	-30
     ed4:	0100                	addi	s0,sp,128
     ed6:	14097a03          	0x14097a03
     eda:	0100                	addi	s0,sp,128
     edc:	09019303          	lh	t1,144(gp) # 80000e10 <__global_pointer$+0x90>
     ee0:	000e                	c.slli	zero,0x3
     ee2:	0301                	addi	t1,t1,0
     ee4:	0900                	addi	s0,sp,144
     ee6:	0008                	0x8
     ee8:	0301                	addi	t1,t1,0
     eea:	0901                	addi	s2,s2,0
     eec:	0004                	0x4
     eee:	0301                	addi	t1,t1,0
     ef0:	0904                	addi	s1,sp,144
     ef2:	0002                	c.slli64	zero
     ef4:	0301                	addi	t1,t1,0
     ef6:	0901                	addi	s2,s2,0
     ef8:	000a                	c.slli	zero,0x2
     efa:	0301                	addi	t1,t1,0
     efc:	0901                	addi	s2,s2,0
     efe:	0004                	0x4
     f00:	0301                	addi	t1,t1,0
     f02:	0901                	addi	s2,s2,0
     f04:	000a                	c.slli	zero,0x2
     f06:	0301                	addi	t1,t1,0
     f08:	0901                	addi	s2,s2,0
     f0a:	0004                	0x4
     f0c:	0301                	addi	t1,t1,0
     f0e:	000a0903          	lb	s2,0(s4)
     f12:	0301                	addi	t1,t1,0
     f14:	0976                	slli	s2,s2,0x1d
     f16:	000c                	0xc
     f18:	0301                	addi	t1,t1,0
     f1a:	0901                	addi	s2,s2,0
     f1c:	0004                	0x4
     f1e:	0301                	addi	t1,t1,0
     f20:	0909                	addi	s2,s2,2
     f22:	000a                	c.slli	zero,0x2
     f24:	0301                	addi	t1,t1,0
     f26:	0905                	addi	s2,s2,1
     f28:	000c                	0xc
     f2a:	0301                	addi	t1,t1,0
     f2c:	7ebe                	flw	ft9,236(sp)
     f2e:	0009                	c.nop	2
     f30:	0100                	addi	s0,sp,128
     f32:	0901c403          	lbu	s0,144(gp) # 80000e10 <__global_pointer$+0x90>
     f36:	0008                	0x8
     f38:	0001                	nop
     f3a:	0402                	c.slli64	s0
     f3c:	0301                	addi	t1,t1,0
     f3e:	7ebc                	flw	fa5,120(a3)
     f40:	1609                	addi	a2,a2,-30
     f42:	0100                	addi	s0,sp,128
     f44:	0200                	addi	s0,sp,256
     f46:	0104                	addi	s1,sp,128
     f48:	0901c603          	lbu	a2,144(gp) # 80000e10 <__global_pointer$+0x90>
     f4c:	0008                	0x8
     f4e:	0301                	addi	t1,t1,0
     f50:	0902                	c.slli64	s2
     f52:	000c                	0xc
     f54:	0301                	addi	t1,t1,0
     f56:	0905                	addi	s2,s2,1
     f58:	0002                	c.slli64	zero
     f5a:	0301                	addi	t1,t1,0
     f5c:	00000903          	lb	s2,0(zero) # 0 <_prog_start-0x20000000>
     f60:	0301                	addi	t1,t1,0
     f62:	097f                	0x97f
     f64:	0004                	0x4
     f66:	0301                	addi	t1,t1,0
     f68:	0901                	addi	s2,s2,0
     f6a:	0008                	0x8
     f6c:	0001                	nop
     f6e:	0402                	c.slli64	s0
     f70:	0601                	addi	a2,a2,0
     f72:	02090003          	lb	zero,32(s2)
     f76:	0100                	addi	s0,sp,128
     f78:	0306                	slli	t1,t1,0x1
     f7a:	0901                	addi	s2,s2,0
     f7c:	0008                	0x8
     f7e:	0301                	addi	t1,t1,0
     f80:	0905                	addi	s2,s2,1
     f82:	0002                	c.slli64	zero
     f84:	0301                	addi	t1,t1,0
     f86:	0902                	c.slli64	s2
     f88:	0000                	unimp
     f8a:	0301                	addi	t1,t1,0
     f8c:	0901                	addi	s2,s2,0
     f8e:	0008                	0x8
     f90:	0001                	nop
     f92:	0402                	c.slli64	s0
     f94:	0601                	addi	a2,a2,0
     f96:	04090003          	lb	zero,64(s2)
     f9a:	0100                	addi	s0,sp,128
     f9c:	0306                	slli	t1,t1,0x1
     f9e:	0901                	addi	s2,s2,0
     fa0:	0008                	0x8
     fa2:	0301                	addi	t1,t1,0
     fa4:	0904                	addi	s1,sp,144
     fa6:	0002                	c.slli64	zero
     fa8:	0301                	addi	t1,t1,0
     faa:	0971                	addi	s2,s2,28
     fac:	0000                	unimp
     fae:	0301                	addi	t1,t1,0
     fb0:	0901                	addi	s2,s2,0
     fb2:	0004                	0x4
     fb4:	0301                	addi	t1,t1,0
     fb6:	097f                	0x97f
     fb8:	0002                	c.slli64	zero
     fba:	0301                	addi	t1,t1,0
     fbc:	0901                	addi	s2,s2,0
     fbe:	0004                	0x4
     fc0:	0301                	addi	t1,t1,0
     fc2:	0911                	addi	s2,s2,4
     fc4:	0010                	0x10
     fc6:	0301                	addi	t1,t1,0
     fc8:	0901                	addi	s2,s2,0
     fca:	0006                	c.slli	zero,0x1
     fcc:	0301                	addi	t1,t1,0
     fce:	0901                	addi	s2,s2,0
     fd0:	0010                	0x10
     fd2:	0301                	addi	t1,t1,0
     fd4:	0901                	addi	s2,s2,0
     fd6:	000a                	c.slli	zero,0x2
     fd8:	0301                	addi	t1,t1,0
     fda:	7ea9                	lui	t4,0xfffea
     fdc:	0409                	addi	s0,s0,2
     fde:	0100                	addi	s0,sp,128
     fe0:	04090203          	lb	tp,64(s2)
     fe4:	0100                	addi	s0,sp,128
     fe6:	02097103          	0x2097103
     fea:	0100                	addi	s0,sp,128
     fec:	08091203          	lh	tp,128(s2)
     ff0:	0100                	addi	s0,sp,128
     ff2:	14096e03          	0x14096e03
     ff6:	0100                	addi	s0,sp,128
     ff8:	08091503          	lh	a0,128(s2)
     ffc:	0100                	addi	s0,sp,128
     ffe:	04090203          	lb	tp,64(s2)
    1002:	0100                	addi	s0,sp,128
    1004:	0901cd03          	lbu	s10,144(gp) # 80000e10 <__global_pointer$+0x90>
    1008:	0008                	0x8
    100a:	0301                	addi	t1,t1,0
    100c:	096c                	addi	a1,sp,156
    100e:	0004                	0x4
    1010:	0301                	addi	t1,t1,0
    1012:	04097ec7          	0x4097ec7
    1016:	0100                	addi	s0,sp,128
    1018:	0901d303          	lhu	t1,144(gp) # 80000e10 <__global_pointer$+0x90>
    101c:	0004                	0x4
    101e:	0301                	addi	t1,t1,0
    1020:	0901                	addi	s2,s2,0
    1022:	0008                	0x8
    1024:	0301                	addi	t1,t1,0
    1026:	0964                	addi	s1,sp,156
    1028:	0008                	0x8
    102a:	0301                	addi	t1,t1,0
    102c:	0901                	addi	s2,s2,0
    102e:	0004                	0x4
    1030:	0301                	addi	t1,t1,0
    1032:	097f                	0x97f
    1034:	0002                	c.slli64	zero
    1036:	0301                	addi	t1,t1,0
    1038:	0901                	addi	s2,s2,0
    103a:	0004                	0x4
    103c:	0301                	addi	t1,t1,0
    103e:	0920                	addi	s0,sp,152
    1040:	000c                	0xc
    1042:	0301                	addi	t1,t1,0
    1044:	0978                	addi	a4,sp,156
    1046:	0002                	c.slli64	zero
    1048:	0301                	addi	t1,t1,0
    104a:	0901                	addi	s2,s2,0
    104c:	0010                	0x10
    104e:	0301                	addi	t1,t1,0
    1050:	0901                	addi	s2,s2,0
    1052:	000a                	c.slli	zero,0x2
    1054:	0301                	addi	t1,t1,0
    1056:	04097ea3          	0x4097ea3
    105a:	0100                	addi	s0,sp,128
    105c:	04090203          	lb	tp,64(s2)
    1060:	0100                	addi	s0,sp,128
    1062:	02097103          	0x2097103
    1066:	0100                	addi	s0,sp,128
    1068:	08091203          	lh	tp,128(s2)
    106c:	0100                	addi	s0,sp,128
    106e:	14096e03          	0x14096e03
    1072:	0100                	addi	s0,sp,128
    1074:	08091503          	lh	a0,128(s2)
    1078:	0100                	addi	s0,sp,128
    107a:	04090203          	lb	tp,64(s2)
    107e:	0100                	addi	s0,sp,128
    1080:	0901d303          	lhu	t1,144(gp) # 80000e10 <__global_pointer$+0x90>
    1084:	0008                	0x8
    1086:	0301                	addi	t1,t1,0
    1088:	090a                	slli	s2,s2,0x2
    108a:	0006                	c.slli	zero,0x1
    108c:	0301                	addi	t1,t1,0
    108e:	0902                	c.slli64	s2
    1090:	0000                	unimp
    1092:	0301                	addi	t1,t1,0
    1094:	0901                	addi	s2,s2,0
    1096:	000e                	c.slli	zero,0x3
    1098:	0301                	addi	t1,t1,0
    109a:	0959                	addi	s2,s2,22
    109c:	000a                	c.slli	zero,0x2
    109e:	0301                	addi	t1,t1,0
    10a0:	097f                	0x97f
    10a2:	0002                	c.slli64	zero
    10a4:	0301                	addi	t1,t1,0
    10a6:	0901                	addi	s2,s2,0
    10a8:	0008                	0x8
    10aa:	0301                	addi	t1,t1,0
    10ac:	092c                	addi	a1,sp,152
    10ae:	000c                	0xc
    10b0:	0301                	addi	t1,t1,0
    10b2:	000e0953          	fadd.s	fs2,ft8,ft0,rne
    10b6:	0301                	addi	t1,t1,0
    10b8:	0901                	addi	s2,s2,0
    10ba:	0008                	0x8
    10bc:	0301                	addi	t1,t1,0
    10be:	0930                	addi	a2,sp,152
    10c0:	0010                	0x10
    10c2:	0301                	addi	t1,t1,0
    10c4:	0901                	addi	s2,s2,0
    10c6:	000e                	c.slli	zero,0x3
    10c8:	0301                	addi	t1,t1,0
    10ca:	0006094f          	fnmadd.s	fs2,fa2,ft0,ft0,rne
    10ce:	0301                	addi	t1,t1,0
    10d0:	0931                	addi	s2,s2,12
    10d2:	0004                	0x4
    10d4:	0301                	addi	t1,t1,0
    10d6:	0006094f          	fnmadd.s	fs2,fa2,ft0,ft0,rne
    10da:	0301                	addi	t1,t1,0
    10dc:	097f                	0x97f
    10de:	0002                	c.slli64	zero
    10e0:	0301                	addi	t1,t1,0
    10e2:	0901                	addi	s2,s2,0
    10e4:	0004                	0x4
    10e6:	0301                	addi	t1,t1,0
    10e8:	0935                	addi	s2,s2,13
    10ea:	000c                	0xc
    10ec:	0301                	addi	t1,t1,0
    10ee:	094a                	slli	s2,s2,0x12
    10f0:	001c                	0x1c
    10f2:	0301                	addi	t1,t1,0
    10f4:	0901                	addi	s2,s2,0
    10f6:	0008                	0x8
    10f8:	0301                	addi	t1,t1,0
    10fa:	0938                	addi	a4,sp,152
    10fc:	0010                	0x10
    10fe:	0301                	addi	t1,t1,0
    1100:	000e0947          	fmsub.s	fs2,ft8,ft0,ft0,rne
    1104:	0301                	addi	t1,t1,0
    1106:	0901                	addi	s2,s2,0
    1108:	0004                	0x4
    110a:	0301                	addi	t1,t1,0
    110c:	093c                	addi	a5,sp,152
    110e:	0010                	0x10
    1110:	0301                	addi	t1,t1,0
    1112:	0901                	addi	s2,s2,0
    1114:	000a                	c.slli	zero,0x2
    1116:	0301                	addi	t1,t1,0
    1118:	097f                	0x97f
    111a:	0002                	c.slli64	zero
    111c:	0301                	addi	t1,t1,0
    111e:	0901                	addi	s2,s2,0
    1120:	0004                	0x4
    1122:	0301                	addi	t1,t1,0
    1124:	0905                	addi	s2,s2,1
    1126:	0006                	c.slli	zero,0x1
    1128:	0301                	addi	t1,t1,0
    112a:	090e                	slli	s2,s2,0x3
    112c:	0000                	unimp
    112e:	0301                	addi	t1,t1,0
    1130:	0901                	addi	s2,s2,0
    1132:	000e                	c.slli	zero,0x3
    1134:	0301                	addi	t1,t1,0
    1136:	06097faf          	0x6097faf
    113a:	0100                	addi	s0,sp,128
    113c:	0900d103          	lhu	sp,144(ra)
    1140:	0004                	0x4
    1142:	0301                	addi	t1,t1,0
    1144:	7fae                	flw	ft11,232(sp)
    1146:	0609                	addi	a2,a2,2
    1148:	0100                	addi	s0,sp,128
    114a:	08090103          	lb	sp,128(s2)
    114e:	0100                	addi	s0,sp,128
    1150:	0900d603          	lhu	a2,144(ra)
    1154:	000c                	0xc
    1156:	0301                	addi	t1,t1,0
    1158:	7faa                	flw	ft11,168(sp)
    115a:	0a09                	addi	s4,s4,2
    115c:	0100                	addi	s0,sp,128
    115e:	0900d603          	lhu	a2,144(ra)
    1162:	0004                	0x4
    1164:	0301                	addi	t1,t1,0
    1166:	7fa9                	lui	t6,0xfffea
    1168:	0409                	addi	s0,s0,2
    116a:	0100                	addi	s0,sp,128
    116c:	08090103          	lb	sp,128(s2)
    1170:	0100                	addi	s0,sp,128
    1172:	0900da03          	lhu	s4,144(ra)
    1176:	000c                	0xc
    1178:	0301                	addi	t1,t1,0
    117a:	0905                	addi	s2,s2,1
    117c:	000a                	c.slli	zero,0x2
    117e:	0301                	addi	t1,t1,0
    1180:	0002097b          	0x2097b
    1184:	0301                	addi	t1,t1,0
    1186:	0902                	c.slli64	s2
    1188:	0006                	c.slli	zero,0x1
    118a:	0301                	addi	t1,t1,0
    118c:	00040903          	lb	s2,0(s0)
    1190:	0301                	addi	t1,t1,0
    1192:	097d                	addi	s2,s2,31
    1194:	0004                	0x4
    1196:	0301                	addi	t1,t1,0
    1198:	00080903          	lb	s2,0(a6)
    119c:	0301                	addi	t1,t1,0
    119e:	7fa0                	flw	fs0,120(a5)
    11a0:	2009                	jal	11a2 <_prog_start-0x1fffee5e>
    11a2:	0100                	addi	s0,sp,128
    11a4:	04090103          	lb	sp,64(s2)
    11a8:	0100                	addi	s0,sp,128
    11aa:	0900e303          	0x900e303
    11ae:	0014                	0x14
    11b0:	0301                	addi	t1,t1,0
    11b2:	000a0903          	lb	s2,0(s4)
    11b6:	0301                	addi	t1,t1,0
    11b8:	0908                	addi	a0,sp,144
    11ba:	0010                	0x10
    11bc:	0301                	addi	t1,t1,0
    11be:	7f92                	flw	ft11,36(sp)
    11c0:	0209                	addi	tp,tp,2
    11c2:	0100                	addi	s0,sp,128
    11c4:	02097f03          	0x2097f03
    11c8:	0100                	addi	s0,sp,128
    11ca:	04090103          	lb	sp,64(s2)
    11ce:	0100                	addi	s0,sp,128
    11d0:	0900e603          	0x900e603
    11d4:	0010                	0x10
    11d6:	0301                	addi	t1,t1,0
    11d8:	0908                	addi	a0,sp,144
    11da:	0010                	0x10
    11dc:	0301                	addi	t1,t1,0
    11de:	0904                	addi	s1,sp,144
    11e0:	0002                	c.slli64	zero
    11e2:	0301                	addi	t1,t1,0
    11e4:	090e                	slli	s2,s2,0x3
    11e6:	0000                	unimp
    11e8:	0301                	addi	t1,t1,0
    11ea:	097a                	slli	s2,s2,0x1e
    11ec:	000c                	0xc
    11ee:	0301                	addi	t1,t1,0
    11f0:	0901                	addi	s2,s2,0
    11f2:	0006                	c.slli	zero,0x1
    11f4:	0301                	addi	t1,t1,0
    11f6:	0901                	addi	s2,s2,0
    11f8:	0002                	c.slli64	zero
    11fa:	0301                	addi	t1,t1,0
    11fc:	0976                	slli	s2,s2,0x1d
    11fe:	0002                	c.slli64	zero
    1200:	0301                	addi	t1,t1,0
    1202:	0912                	slli	s2,s2,0x4
    1204:	0004                	0x4
    1206:	0001                	nop
    1208:	0402                	c.slli64	s0
    120a:	0601                	addi	a2,a2,0
    120c:	08090003          	lb	zero,128(s2)
    1210:	0100                	addi	s0,sp,128
    1212:	0200                	addi	s0,sp,256
    1214:	0104                	addi	s1,sp,128
    1216:	0306                	slli	t1,t1,0x1
    1218:	0901                	addi	s2,s2,0
    121a:	0008                	0x8
    121c:	0001                	nop
    121e:	0402                	c.slli64	s0
    1220:	0301                	addi	t1,t1,0
    1222:	0901                	addi	s2,s2,0
    1224:	0010                	0x10
    1226:	0001                	nop
    1228:	0402                	c.slli64	s0
    122a:	0301                	addi	t1,t1,0
    122c:	0901                	addi	s2,s2,0
    122e:	0004                	0x4
    1230:	0001                	nop
    1232:	0402                	c.slli64	s0
    1234:	0301                	addi	t1,t1,0
    1236:	0901                	addi	s2,s2,0
    1238:	0008                	0x8
    123a:	0001                	nop
    123c:	0402                	c.slli64	s0
    123e:	0301                	addi	t1,t1,0
    1240:	097d                	addi	s2,s2,31
    1242:	0006                	c.slli	zero,0x1
    1244:	0001                	nop
    1246:	0402                	c.slli64	s0
    1248:	0301                	addi	t1,t1,0
    124a:	0905                	addi	s2,s2,1
    124c:	0002                	c.slli64	zero
    124e:	0301                	addi	t1,t1,0
    1250:	0902                	c.slli64	s2
    1252:	0004                	0x4
    1254:	0301                	addi	t1,t1,0
    1256:	02097ef3          	csrrci	t4,0x20,18
    125a:	0100                	addi	s0,sp,128
    125c:	09018d03          	lb	s10,144(gp) # 80000e10 <__global_pointer$+0x90>
    1260:	0004                	0x4
    1262:	0301                	addi	t1,t1,0
    1264:	02097ef3          	csrrci	t4,0x20,18
    1268:	0100                	addi	s0,sp,128
    126a:	04090103          	lb	sp,64(s2)
    126e:	0100                	addi	s0,sp,128
    1270:	09019003          	lh	zero,144(gp) # 80000e10 <__global_pointer$+0x90>
    1274:	0010                	0x10
    1276:	0301                	addi	t1,t1,0
    1278:	0904                	addi	s1,sp,144
    127a:	0002                	c.slli64	zero
    127c:	0301                	addi	t1,t1,0
    127e:	097f                	0x97f
    1280:	0002                	c.slli64	zero
    1282:	0301                	addi	t1,t1,0
    1284:	0901                	addi	s2,s2,0
    1286:	0002                	c.slli64	zero
    1288:	0301                	addi	t1,t1,0
    128a:	097f                	0x97f
    128c:	0000                	unimp
    128e:	0301                	addi	t1,t1,0
    1290:	0901                	addi	s2,s2,0
    1292:	0004                	0x4
    1294:	0301                	addi	t1,t1,0
    1296:	097f                	0x97f
    1298:	0002                	c.slli64	zero
    129a:	0301                	addi	t1,t1,0
    129c:	096e                	slli	s2,s2,0x1b
    129e:	0004                	0x4
    12a0:	0301                	addi	t1,t1,0
    12a2:	00040907          	0x40907
    12a6:	0001                	nop
    12a8:	0402                	c.slli64	s0
    12aa:	0301                	addi	t1,t1,0
    12ac:	00040903          	lb	s2,0(s0)
    12b0:	0001                	nop
    12b2:	0402                	c.slli64	s0
    12b4:	0301                	addi	t1,t1,0
    12b6:	097f                	0x97f
    12b8:	0004                	0x4
    12ba:	0001                	nop
    12bc:	0402                	c.slli64	s0
    12be:	0301                	addi	t1,t1,0
    12c0:	0901                	addi	s2,s2,0
    12c2:	0004                	0x4
    12c4:	0001                	nop
    12c6:	0402                	c.slli64	s0
    12c8:	0301                	addi	t1,t1,0
    12ca:	097f                	0x97f
    12cc:	0002                	c.slli64	zero
    12ce:	0601                	addi	a2,a2,0
    12d0:	06090003          	lb	zero,96(s2)
    12d4:	0100                	addi	s0,sp,128
    12d6:	0306                	slli	t1,t1,0x1
    12d8:	097e                	slli	s2,s2,0x1f
    12da:	0004                	0x4
    12dc:	0301                	addi	t1,t1,0
    12de:	097f                	0x97f
    12e0:	0006                	c.slli	zero,0x1
    12e2:	0301                	addi	t1,t1,0
    12e4:	097e                	slli	s2,s2,0x1f
    12e6:	0006                	c.slli	zero,0x1
    12e8:	0301                	addi	t1,t1,0
    12ea:	0901                	addi	s2,s2,0
    12ec:	0002                	c.slli64	zero
    12ee:	0301                	addi	t1,t1,0
    12f0:	097f                	0x97f
    12f2:	0008                	0x8
    12f4:	0301                	addi	t1,t1,0
    12f6:	097f                	0x97f
    12f8:	0008                	0x8
    12fa:	0301                	addi	t1,t1,0
    12fc:	0915                	addi	s2,s2,5
    12fe:	0006                	c.slli	zero,0x1
    1300:	0301                	addi	t1,t1,0
    1302:	0902                	c.slli64	s2
    1304:	0000                	unimp
    1306:	0001                	nop
    1308:	0402                	c.slli64	s0
    130a:	0601                	addi	a2,a2,0
    130c:	06090003          	lb	zero,96(s2)
    1310:	0100                	addi	s0,sp,128
    1312:	0200                	addi	s0,sp,256
    1314:	0104                	addi	s1,sp,128
    1316:	0306                	slli	t1,t1,0x1
    1318:	0901                	addi	s2,s2,0
    131a:	0002                	c.slli64	zero
    131c:	0301                	addi	t1,t1,0
    131e:	0901                	addi	s2,s2,0
    1320:	0004                	0x4
    1322:	0301                	addi	t1,t1,0
    1324:	00020903          	lb	s2,0(tp) # ffff9000 <_sp+0x7fff5000>
    1328:	0301                	addi	t1,t1,0
    132a:	0901                	addi	s2,s2,0
    132c:	0000                	unimp
    132e:	0301                	addi	t1,t1,0
    1330:	0901                	addi	s2,s2,0
    1332:	0008                	0x8
    1334:	0301                	addi	t1,t1,0
    1336:	00020903          	lb	s2,0(tp) # 0 <_prog_start-0x20000000>
    133a:	0301                	addi	t1,t1,0
    133c:	0976                	slli	s2,s2,0x1d
    133e:	0000                	unimp
    1340:	0301                	addi	t1,t1,0
    1342:	0901                	addi	s2,s2,0
    1344:	000a                	c.slli	zero,0x2
    1346:	0301                	addi	t1,t1,0
    1348:	0004090b          	0x4090b
    134c:	0301                	addi	t1,t1,0
    134e:	0901                	addi	s2,s2,0
    1350:	0002                	c.slli64	zero
    1352:	0301                	addi	t1,t1,0
    1354:	0901                	addi	s2,s2,0
    1356:	0002                	c.slli64	zero
    1358:	0301                	addi	t1,t1,0
    135a:	04097d87          	0x4097d87
    135e:	0100                	addi	s0,sp,128
    1360:	0901c403          	lbu	s0,144(gp) # 80000e10 <__global_pointer$+0x90>
    1364:	0008                	0x8
    1366:	0301                	addi	t1,t1,0
    1368:	7ebc                	flw	fa5,120(a3)
    136a:	0a09                	addi	s4,s4,2
    136c:	0100                	addi	s0,sp,128
    136e:	0901c603          	lbu	a2,144(gp) # 80000e10 <__global_pointer$+0x90>
    1372:	0008                	0x8
    1374:	0301                	addi	t1,t1,0
    1376:	01b5                	addi	gp,gp,13
    1378:	0c09                	addi	s8,s8,2
    137a:	0100                	addi	s0,sp,128
    137c:	02090303          	lb	t1,32(s2)
    1380:	0100                	addi	s0,sp,128
    1382:	00090103          	lb	sp,0(s2)
    1386:	0100                	addi	s0,sp,128
    1388:	08090103          	lb	sp,128(s2)
    138c:	0100                	addi	s0,sp,128
    138e:	04090103          	lb	sp,64(s2)
    1392:	0100                	addi	s0,sp,128
    1394:	097cff03          	0x97cff03
    1398:	0004                	0x4
    139a:	0301                	addi	t1,t1,0
    139c:	01c4                	addi	s1,sp,196
    139e:	0809                	addi	a6,a6,2
    13a0:	0100                	addi	s0,sp,128
    13a2:	097ebc03          	0x97ebc03
    13a6:	000a                	c.slli	zero,0x2
    13a8:	0301                	addi	t1,t1,0
    13aa:	01c6                	slli	gp,gp,0x11
    13ac:	0809                	addi	a6,a6,2
    13ae:	0100                	addi	s0,sp,128
    13b0:	0901ab03          	lw	s6,144(gp) # 80000e10 <__global_pointer$+0x90>
    13b4:	000c                	0xc
    13b6:	0301                	addi	t1,t1,0
    13b8:	00080913          	mv	s2,a6
    13bc:	0301                	addi	t1,t1,0
    13be:	00020903          	lb	s2,0(tp) # 0 <_prog_start-0x20000000>
    13c2:	0301                	addi	t1,t1,0
    13c4:	0901                	addi	s2,s2,0
    13c6:	0000                	unimp
    13c8:	0301                	addi	t1,t1,0
    13ca:	0910                	addi	a2,sp,144
    13cc:	0006                	c.slli	zero,0x1
    13ce:	0301                	addi	t1,t1,0
    13d0:	00020903          	lb	s2,0(tp) # 0 <_prog_start-0x20000000>
    13d4:	0301                	addi	t1,t1,0
    13d6:	0901                	addi	s2,s2,0
    13d8:	0000                	unimp
    13da:	0301                	addi	t1,t1,0
    13dc:	0901                	addi	s2,s2,0
    13de:	000a                	c.slli	zero,0x2
    13e0:	0301                	addi	t1,t1,0
    13e2:	0906                	slli	s2,s2,0x1
    13e4:	0002                	c.slli64	zero
    13e6:	0301                	addi	t1,t1,0
    13e8:	0902                	c.slli64	s2
    13ea:	0000                	unimp
    13ec:	0301                	addi	t1,t1,0
    13ee:	097f                	0x97f
    13f0:	0012                	c.slli	zero,0x4
    13f2:	0001                	nop
    13f4:	0402                	c.slli64	s0
    13f6:	09780303          	lb	t1,151(a6)
    13fa:	0008                	0x8
    13fc:	0001                	nop
    13fe:	0402                	c.slli64	s0
    1400:	090a0303          	lb	t1,144(s4)
    1404:	0002                	c.slli64	zero
    1406:	0001                	nop
    1408:	0402                	c.slli64	s0
    140a:	097f0303          	lb	t1,151(t5) # 1a097 <_prog_start-0x1ffe5f69>
    140e:	000c                	0xc
    1410:	0301                	addi	t1,t1,0
    1412:	097f                	0x97f
    1414:	0006                	c.slli	zero,0x1
    1416:	0301                	addi	t1,t1,0
    1418:	0905                	addi	s2,s2,1
    141a:	0002                	c.slli64	zero
    141c:	0301                	addi	t1,t1,0
    141e:	0906                	slli	s2,s2,0x1
    1420:	0002                	c.slli64	zero
    1422:	0301                	addi	t1,t1,0
    1424:	0900                	addi	s0,sp,144
    1426:	0014                	0x14
    1428:	0301                	addi	t1,t1,0
    142a:	0901                	addi	s2,s2,0
    142c:	0004                	0x4
    142e:	0301                	addi	t1,t1,0
    1430:	0901                	addi	s2,s2,0
    1432:	0002                	c.slli64	zero
    1434:	0001                	nop
    1436:	0402                	c.slli64	s0
    1438:	00030603          	lb	a2,0(t1) # d000 <_prog_start-0x1fff3000>
    143c:	1809                	addi	a6,a6,-30
    143e:	0100                	addi	s0,sp,128
    1440:	0200                	addi	s0,sp,256
    1442:	0304                	addi	s1,sp,384
    1444:	0306                	slli	t1,t1,0x1
    1446:	0901                	addi	s2,s2,0
    1448:	0004                	0x4
    144a:	0001                	nop
    144c:	0402                	c.slli64	s0
    144e:	09560303          	lb	t1,149(a2)
    1452:	0004                	0x4
    1454:	0301                	addi	t1,t1,0
    1456:	0929                	addi	s2,s2,10
    1458:	000c                	0xc
    145a:	0301                	addi	t1,t1,0
    145c:	094e                	slli	s2,s2,0x13
    145e:	0004                	0x4
    1460:	0301                	addi	t1,t1,0
    1462:	0901                	addi	s2,s2,0
    1464:	0008                	0x8
    1466:	0301                	addi	t1,t1,0
    1468:	0901                	addi	s2,s2,0
    146a:	0004                	0x4
    146c:	0301                	addi	t1,t1,0
    146e:	7cff                	0x7cff
    1470:	0409                	addi	s0,s0,2
    1472:	0100                	addi	s0,sp,128
    1474:	0901c403          	lbu	s0,144(gp) # 80000e10 <__global_pointer$+0x90>
    1478:	0008                	0x8
    147a:	0301                	addi	t1,t1,0
    147c:	7ebc                	flw	fa5,120(a3)
    147e:	0a09                	addi	s4,s4,2
    1480:	0100                	addi	s0,sp,128
    1482:	0901c603          	lbu	a2,144(gp) # 80000e10 <__global_pointer$+0x90>
    1486:	0008                	0x8
    1488:	0301                	addi	t1,t1,0
    148a:	0c0901ab          	0xc0901ab
    148e:	0100                	addi	s0,sp,128
    1490:	08093403          	0x8093403
    1494:	0100                	addi	s0,sp,128
    1496:	16097f03          	0x16097f03
    149a:	0100                	addi	s0,sp,128
    149c:	08097803          	0x8097803
    14a0:	0100                	addi	s0,sp,128
    14a2:	02090a03          	lb	s4,32(s2)
    14a6:	0100                	addi	s0,sp,128
    14a8:	0c097f03          	0xc097f03
    14ac:	0100                	addi	s0,sp,128
    14ae:	04091103          	lh	sp,64(s2)
    14b2:	0100                	addi	s0,sp,128
    14b4:	14096e03          	0x14096e03
    14b8:	0100                	addi	s0,sp,128
    14ba:	02091103          	lh	sp,32(s2)
    14be:	0100                	addi	s0,sp,128
    14c0:	02090603          	lb	a2,32(s2)
    14c4:	0100                	addi	s0,sp,128
    14c6:	00090403          	lb	s0,0(s2)
    14ca:	0100                	addi	s0,sp,128
    14cc:	04095d03          	lhu	s10,64(s2)
    14d0:	0100                	addi	s0,sp,128
    14d2:	0c092403          	lw	s0,192(s2)
    14d6:	0100                	addi	s0,sp,128
    14d8:	02095c03          	lhu	s8,32(s2)
    14dc:	0100                	addi	s0,sp,128
    14de:	02092403          	lw	s0,32(s2)
    14e2:	0100                	addi	s0,sp,128
    14e4:	0e097f03          	0xe097f03
    14e8:	0100                	addi	s0,sp,128
    14ea:	06090103          	lb	sp,96(s2)
    14ee:	0100                	addi	s0,sp,128
    14f0:	02095c03          	lhu	s8,32(s2)
    14f4:	0100                	addi	s0,sp,128
    14f6:	06092403          	lw	s0,96(s2)
    14fa:	0100                	addi	s0,sp,128
    14fc:	0200                	addi	s0,sp,256
    14fe:	0204                	addi	s1,sp,256
    1500:	0a097f03          	0xa097f03
    1504:	0100                	addi	s0,sp,128
    1506:	0a090803          	lb	a6,160(s2)
    150a:	0100                	addi	s0,sp,128
    150c:	02097403          	0x2097403
    1510:	0100                	addi	s0,sp,128
    1512:	02090c03          	lb	s8,32(s2)
    1516:	0100                	addi	s0,sp,128
    1518:	04097403          	0x4097403
    151c:	0100                	addi	s0,sp,128
    151e:	12090c03          	lb	s8,288(s2)
    1522:	0100                	addi	s0,sp,128
    1524:	06090603          	lb	a2,96(s2)
    1528:	0100                	addi	s0,sp,128
    152a:	0200                	addi	s0,sp,256
    152c:	0204                	addi	s1,sp,256
    152e:	16097f03          	0x16097f03
    1532:	0100                	addi	s0,sp,128
    1534:	04090503          	lb	a0,64(s2)
    1538:	0100                	addi	s0,sp,128
    153a:	0c097f03          	0xc097f03
    153e:	0100                	addi	s0,sp,128
    1540:	04090103          	lb	sp,64(s2)
    1544:	0100                	addi	s0,sp,128
    1546:	10097703          	0x10097703
    154a:	0100                	addi	s0,sp,128
    154c:	02090903          	lb	s2,32(s2)
    1550:	0100                	addi	s0,sp,128
    1552:	04097003          	0x4097003
    1556:	0100                	addi	s0,sp,128
    1558:	04091003          	lh	zero,64(s2)
    155c:	0100                	addi	s0,sp,128
    155e:	02090803          	lb	a6,32(s2)
    1562:	0100                	addi	s0,sp,128
    1564:	00090303          	lb	t1,0(s2)
    1568:	0100                	addi	s0,sp,128
    156a:	0a090103          	lb	sp,160(s2)
    156e:	0100                	addi	s0,sp,128
    1570:	097cb003          	0x97cb003
    1574:	0004                	0x4
    1576:	0301                	addi	t1,t1,0
    1578:	03d0                	addi	a2,sp,452
    157a:	0409                	addi	s0,s0,2
    157c:	0100                	addi	s0,sp,128
    157e:	097cb003          	0x97cb003
    1582:	0004                	0x4
    1584:	0301                	addi	t1,t1,0
    1586:	0902                	c.slli64	s2
    1588:	0004                	0x4
    158a:	0301                	addi	t1,t1,0
    158c:	0971                	addi	s2,s2,28
    158e:	0004                	0x4
    1590:	0301                	addi	t1,t1,0
    1592:	0912                	slli	s2,s2,0x4
    1594:	0008                	0x8
    1596:	0301                	addi	t1,t1,0
    1598:	096e                	slli	s2,s2,0x1b
    159a:	0010                	0x10
    159c:	0301                	addi	t1,t1,0
    159e:	0915                	addi	s2,s2,5
    15a0:	0008                	0x8
    15a2:	0301                	addi	t1,t1,0
    15a4:	0902                	c.slli64	s2
    15a6:	0004                	0x4
    15a8:	0301                	addi	t1,t1,0
    15aa:	03ca                	slli	t2,t2,0x12
    15ac:	0809                	addi	a6,a6,2
    15ae:	0100                	addi	s0,sp,128
    15b0:	097cb603          	0x97cb603
    15b4:	0004                	0x4
    15b6:	0301                	addi	t1,t1,0
    15b8:	03ca                	slli	t2,t2,0x12
    15ba:	0209                	addi	tp,tp,2
    15bc:	0100                	addi	s0,sp,128
    15be:	04090303          	lb	t1,64(s2)
    15c2:	0100                	addi	s0,sp,128
    15c4:	0c090303          	lb	t1,192(s2)
    15c8:	0100                	addi	s0,sp,128
    15ca:	02090403          	lb	s0,32(s2)
    15ce:	0100                	addi	s0,sp,128
    15d0:	00090303          	lb	t1,0(s2)
    15d4:	0100                	addi	s0,sp,128
    15d6:	06097d03          	0x6097d03
    15da:	0100                	addi	s0,sp,128
    15dc:	04090303          	lb	t1,64(s2)
    15e0:	0100                	addi	s0,sp,128
    15e2:	04090303          	lb	t1,64(s2)
    15e6:	0100                	addi	s0,sp,128
    15e8:	04090303          	lb	t1,64(s2)
    15ec:	0100                	addi	s0,sp,128
    15ee:	08090803          	lb	a6,128(s2)
    15f2:	0100                	addi	s0,sp,128
    15f4:	00097903          	0x97903
    15f8:	0100                	addi	s0,sp,128
    15fa:	04090703          	lb	a4,64(s2)
    15fe:	0100                	addi	s0,sp,128
    1600:	04097a03          	0x4097a03
    1604:	0100                	addi	s0,sp,128
    1606:	04090103          	lb	sp,64(s2)
    160a:	0100                	addi	s0,sp,128
    160c:	04090503          	lb	a0,64(s2)
    1610:	0100                	addi	s0,sp,128
    1612:	02090103          	lb	sp,32(s2)
    1616:	0100                	addi	s0,sp,128
    1618:	06090203          	lb	tp,96(s2)
    161c:	0100                	addi	s0,sp,128
    161e:	04097e03          	0x4097e03
    1622:	0100                	addi	s0,sp,128
    1624:	04090103          	lb	sp,64(s2)
    1628:	0100                	addi	s0,sp,128
    162a:	02090503          	lb	a0,32(s2)
    162e:	0100                	addi	s0,sp,128
    1630:	04097b03          	0x4097b03
    1634:	0100                	addi	s0,sp,128
    1636:	04090103          	lb	sp,64(s2)
    163a:	0100                	addi	s0,sp,128
    163c:	02090b03          	lb	s6,32(s2)
    1640:	0100                	addi	s0,sp,128
    1642:	06090103          	lb	sp,96(s2)
    1646:	0100                	addi	s0,sp,128
    1648:	06090303          	lb	t1,96(s2)
    164c:	0100                	addi	s0,sp,128
    164e:	06090103          	lb	sp,96(s2)
    1652:	0100                	addi	s0,sp,128
    1654:	06090103          	lb	sp,96(s2)
    1658:	0100                	addi	s0,sp,128
    165a:	04090603          	lb	a2,64(s2)
    165e:	0100                	addi	s0,sp,128
    1660:	02090103          	lb	sp,32(s2)
    1664:	0100                	addi	s0,sp,128
    1666:	0200                	addi	s0,sp,256
    1668:	0204                	addi	s1,sp,256
    166a:	0306                	slli	t1,t1,0x1
    166c:	0900                	addi	s0,sp,144
    166e:	000c                	0xc
    1670:	0601                	addi	a2,a2,0
    1672:	0c090603          	lb	a2,192(s2)
    1676:	0100                	addi	s0,sp,128
    1678:	0a090103          	lb	sp,160(s2)
    167c:	0100                	addi	s0,sp,128
    167e:	08090203          	lb	tp,128(s2)
    1682:	0100                	addi	s0,sp,128
    1684:	02090403          	lb	s0,32(s2)
    1688:	0100                	addi	s0,sp,128
    168a:	0c090103          	lb	sp,192(s2)
    168e:	0100                	addi	s0,sp,128
    1690:	0c090103          	lb	sp,192(s2)
    1694:	0100                	addi	s0,sp,128
    1696:	0c090103          	lb	sp,192(s2)
    169a:	0100                	addi	s0,sp,128
    169c:	0c090403          	lb	s0,192(s2)
    16a0:	0100                	addi	s0,sp,128
    16a2:	02097d03          	0x2097d03
    16a6:	0100                	addi	s0,sp,128
    16a8:	04090303          	lb	t1,64(s2)
    16ac:	0100                	addi	s0,sp,128
    16ae:	00097d03          	0x97d03
    16b2:	0100                	addi	s0,sp,128
    16b4:	04090303          	lb	t1,64(s2)
    16b8:	0100                	addi	s0,sp,128
    16ba:	02097d03          	0x2097d03
    16be:	0100                	addi	s0,sp,128
    16c0:	04096003          	0x4096003
    16c4:	0100                	addi	s0,sp,128
    16c6:	06090203          	lb	tp,96(s2)
    16ca:	0100                	addi	s0,sp,128
    16cc:	04097e03          	0x4097e03
    16d0:	0100                	addi	s0,sp,128
    16d2:	04090103          	lb	sp,64(s2)
    16d6:	0100                	addi	s0,sp,128
    16d8:	02090503          	lb	a0,32(s2)
    16dc:	0100                	addi	s0,sp,128
    16de:	04097b03          	0x4097b03
    16e2:	0100                	addi	s0,sp,128
    16e4:	04090103          	lb	sp,64(s2)
    16e8:	0100                	addi	s0,sp,128
    16ea:	0409                	addi	s0,s0,2
    16ec:	0000                	unimp
    16ee:	0101                	addi	sp,sp,0
    16f0:	027f                	0x27f
    16f2:	0000                	unimp
    16f4:	0002                	c.slli64	zero
    16f6:	0000014b          	fnmsub.s	ft2,ft0,ft0,ft0,rne
    16fa:	0101                	addi	sp,sp,0
    16fc:	000d0efb          	0xd0efb
    1700:	0101                	addi	sp,sp,0
    1702:	0101                	addi	sp,sp,0
    1704:	0000                	unimp
    1706:	0100                	addi	s0,sp,128
    1708:	0000                	unimp
    170a:	2f01                	jal	1e1a <_prog_start-0x1fffe1e6>
    170c:	61726373          	csrrsi	t1,0x617,4
    1710:	6374                	flw	fa3,68(a4)
    1712:	2f68                	fld	fa0,216(a4)
    1714:	6861                	lui	a6,0x18
    1716:	6e75                	lui	t3,0x1d
    1718:	6974                	flw	fa3,84(a0)
    171a:	676e                	flw	fa4,216(sp)
    171c:	6f74                	flw	fa3,92(a4)
    171e:	2f6e                	fld	ft10,216(sp)
    1720:	6566                	flw	fa0,88(sp)
    1722:	6564                	flw	fs1,76(a0)
    1724:	6172                	flw	ft2,28(sp)
    1726:	6974                	flw	fa3,84(a0)
    1728:	732f6e6f          	jal	t3,f7e5a <_prog_start-0x1ff081a6>
    172c:	7774666f          	jal	a2,486a2 <_prog_start-0x1ffb795e>
    1730:	7261                	lui	tp,0xffff8
    1732:	2f65                	jal	1eea <_prog_start-0x1fffe116>
    1734:	6f74                	flw	fa3,92(a4)
    1736:	68636c6f          	jal	s8,37dbc <_prog_start-0x1ffc8244>
    173a:	6961                	lui	s2,0x18
    173c:	2f6e                	fld	ft10,216(sp)
    173e:	7264                	flw	fs1,100(a2)
    1740:	7669                	lui	a2,0xffffa
    1742:	7265                	lui	tp,0xffff9
    1744:	70732f73          	csrrs	t5,0x707,t1
    1748:	0069                	c.nop	26
    174a:	726f772f          	0x726f772f
    174e:	6f742f6b          	0x6f742f6b
    1752:	2f736c6f          	jal	s8,38248 <_prog_start-0x1ffc7db8>
    1756:	6972                	flw	fs2,28(sp)
    1758:	2d766373          	csrrsi	t1,0x2d7,12
    175c:	6f74                	flw	fa3,92(a4)
    175e:	2f736c6f          	jal	s8,38254 <_prog_start-0x1ffc7dac>
    1762:	3639                	jal	1270 <_prog_start-0x1fffed90>
    1764:	6232                	flw	ft4,12(sp)
    1766:	38393063          	0x38393063
    176a:	37303337          	lui	t1,0x37303
    176e:	6131                	addi	sp,sp,320
    1770:	3761                	jal	16f8 <_prog_start-0x1fffe908>
    1772:	3138                	fld	fa4,96(a0)
    1774:	6436                	flw	fs0,76(sp)
    1776:	6635                	lui	a2,0xd
    1778:	3038                	fld	fa4,96(s0)
    177a:	6335                	lui	t1,0xd
    177c:	6536                	flw	fa0,76(sp)
    177e:	3735                	jal	16aa <_prog_start-0x1fffe956>
    1780:	3739                	jal	168e <_prog_start-0x1fffe972>
    1782:	3361                	jal	150a <_prog_start-0x1fffeaf6>
    1784:	3562                	fld	fa0,56(sp)
    1786:	6362                	flw	ft6,24(sp)
    1788:	3766                	fld	fa4,120(sp)
    178a:	7369722f          	0x7369722f
    178e:	34367663          	bgeu	a2,gp,1ada <_prog_start-0x1fffe526>
    1792:	752d                	lui	a0,0xfffeb
    1794:	6b6e                	flw	fs6,216(sp)
    1796:	6f6e                	flw	ft10,216(sp)
    1798:	652d6e77          	0x652d6e77
    179c:	666c                	flw	fa1,76(a2)
    179e:	636e692f          	0x636e692f
    17a2:	756c                	flw	fa1,108(a0)
    17a4:	6564                	flw	fs1,76(a0)
    17a6:	63616d2f          	0x63616d2f
    17aa:	6968                	flw	fa0,84(a0)
    17ac:	656e                	flw	fa0,216(sp)
    17ae:	2f00                	fld	fs0,24(a4)
    17b0:	6b726f77          	0x6b726f77
    17b4:	6f6f742f          	0x6f6f742f
    17b8:	736c                	flw	fa1,100(a4)
    17ba:	7369722f          	0x7369722f
    17be:	742d7663          	bgeu	s10,sp,1f0a <_prog_start-0x1fffe0f6>
    17c2:	736c6f6f          	jal	t5,c7ef8 <_prog_start-0x1ff38108>
    17c6:	3236392f          	0x3236392f
    17ca:	6362                	flw	ft6,24(sp)
    17cc:	3930                	fld	fa2,112(a0)
    17ce:	3738                	fld	fa4,104(a4)
    17d0:	31373033          	0x31373033
    17d4:	6161                	addi	sp,sp,80
    17d6:	36313837          	lui	a6,0x36313
    17da:	3564                	fld	fs1,232(a0)
    17dc:	3866                	fld	fa6,120(sp)
    17de:	3530                	fld	fa2,104(a0)
    17e0:	35653663          	0x35653663
    17e4:	61373937          	lui	s2,0x61373
    17e8:	62356233          	0x62356233
    17ec:	2f376663          	bltu	a4,s3,1ad8 <_prog_start-0x1fffe528>
    17f0:	6972                	flw	fs2,28(sp)
    17f2:	36766373          	csrrsi	t1,0x367,12
    17f6:	2d34                	fld	fa3,88(a0)
    17f8:	6e75                	lui	t3,0x1d
    17fa:	776f6e6b          	0x776f6e6b
    17fe:	2d6e                	fld	fs10,216(sp)
    1800:	6c65                	lui	s8,0x19
    1802:	2f66                	fld	ft10,88(sp)
    1804:	6e69                	lui	t3,0x1a
    1806:	64756c63          	bltu	a0,t2,1e5e <_prog_start-0x1fffe1a2>
    180a:	2f65                	jal	1fc2 <_prog_start-0x1fffe03e>
    180c:	00737973          	csrrci	s2,0x7,6
    1810:	7300                	flw	fs0,32(a4)
    1812:	6970                	flw	fa2,84(a0)
    1814:	682e                	flw	fa6,200(sp)
    1816:	0100                	addi	s0,sp,128
    1818:	0000                	unimp
    181a:	2e697073          	csrci	0x2e6,18
    181e:	00010063          	beqz	sp,181e <_prog_start-0x1fffe7e2>
    1822:	5f00                	lw	s0,56(a4)
    1824:	6564                	flw	fs1,76(a0)
    1826:	6166                	flw	ft2,88(sp)
    1828:	6c75                	lui	s8,0x1d
    182a:	5f74                	lw	a3,124(a4)
    182c:	7974                	flw	fa3,116(a0)
    182e:	6570                	flw	fa2,76(a0)
    1830:	00682e73          	csrrs	t3,0x6,a6
    1834:	0002                	c.slli64	zero
    1836:	5f00                	lw	s0,56(a4)
    1838:	69647473          	csrrci	s0,0x696,8
    183c:	746e                	flw	fs0,248(sp)
    183e:	682e                	flw	fa6,200(sp)
    1840:	0300                	addi	s0,sp,384
    1842:	0000                	unimp
    1844:	0000                	unimp
    1846:	0205                	addi	tp,tp,1
    1848:	11fa                	slli	gp,gp,0x3e
    184a:	2000                	fld	fs0,0(s0)
    184c:	01028403          	lb	s0,16(t0) # 10 <_prog_start-0x1ffffff0>
    1850:	00090b03          	lb	s6,0(s2) # 61373000 <_data_lma+0x41370cc0>
    1854:	0100                	addi	s0,sp,128
    1856:	0a090503          	lb	a0,160(s2)
    185a:	0100                	addi	s0,sp,128
    185c:	04090203          	lb	tp,64(s2)
    1860:	0100                	addi	s0,sp,128
    1862:	0204                	addi	s1,sp,256
    1864:	097df303          	0x97df303
    1868:	0006                	c.slli	zero,0x1
    186a:	0001                	nop
    186c:	0402                	c.slli64	s0
    186e:	0301                	addi	t1,t1,0
    1870:	0904                	addi	s1,sp,144
    1872:	0000                	unimp
    1874:	0001                	nop
    1876:	0402                	c.slli64	s0
    1878:	0301                	addi	t1,t1,0
    187a:	0905                	addi	s2,s2,1
    187c:	0008                	0x8
    187e:	0301                	addi	t1,t1,0
    1880:	0905                	addi	s2,s2,1
    1882:	0004                	0x4
    1884:	0301                	addi	t1,t1,0
    1886:	00020907          	0x20907
    188a:	0001                	nop
    188c:	0402                	c.slli64	s0
    188e:	0301                	addi	t1,t1,0
    1890:	0902                	c.slli64	s2
    1892:	0000                	unimp
    1894:	0301                	addi	t1,t1,0
    1896:	0902                	c.slli64	s2
    1898:	0006                	c.slli	zero,0x1
    189a:	0301                	addi	t1,t1,0
    189c:	00060907          	0x60907
    18a0:	0301                	addi	t1,t1,0
    18a2:	0964                	addi	s1,sp,156
    18a4:	0000                	unimp
    18a6:	0301                	addi	t1,t1,0
    18a8:	0905                	addi	s2,s2,1
    18aa:	0008                	0x8
    18ac:	0301                	addi	t1,t1,0
    18ae:	090e                	slli	s2,s2,0x3
    18b0:	0004                	0x4
    18b2:	0301                	addi	t1,t1,0
    18b4:	090c                	addi	a1,sp,144
    18b6:	0006                	c.slli	zero,0x1
    18b8:	0301                	addi	t1,t1,0
    18ba:	090c                	addi	a1,sp,144
    18bc:	0006                	c.slli	zero,0x1
    18be:	0301                	addi	t1,t1,0
    18c0:	0902                	c.slli64	s2
    18c2:	0000                	unimp
    18c4:	0301                	addi	t1,t1,0
    18c6:	097e                	slli	s2,s2,0x1f
    18c8:	0002                	c.slli64	zero
    18ca:	0301                	addi	t1,t1,0
    18cc:	0902                	c.slli64	s2
    18ce:	0002                	c.slli64	zero
    18d0:	0301                	addi	t1,t1,0
    18d2:	00080953          	fadd.s	fs2,fa6,ft0,rne
    18d6:	0301                	addi	t1,t1,0
    18d8:	0905                	addi	s2,s2,1
    18da:	000a                	c.slli	zero,0x2
    18dc:	0301                	addi	t1,t1,0
    18de:	090e                	slli	s2,s2,0x3
    18e0:	0004                	0x4
    18e2:	0301                	addi	t1,t1,0
    18e4:	091d                	addi	s2,s2,7
    18e6:	0006                	c.slli	zero,0x1
    18e8:	0301                	addi	t1,t1,0
    18ea:	0950                	addi	a2,sp,148
    18ec:	0008                	0x8
    18ee:	0301                	addi	t1,t1,0
    18f0:	0905                	addi	s2,s2,1
    18f2:	0008                	0x8
    18f4:	0301                	addi	t1,t1,0
    18f6:	090e                	slli	s2,s2,0x3
    18f8:	0004                	0x4
    18fa:	0301                	addi	t1,t1,0
    18fc:	091e                	slli	s2,s2,0x7
    18fe:	0006                	c.slli	zero,0x1
    1900:	0301                	addi	t1,t1,0
    1902:	0008094f          	fnmadd.s	fs2,fa6,ft0,ft0,rne
    1906:	0301                	addi	t1,t1,0
    1908:	0905                	addi	s2,s2,1
    190a:	0008                	0x8
    190c:	0301                	addi	t1,t1,0
    190e:	090e                	slli	s2,s2,0x3
    1910:	0004                	0x4
    1912:	0301                	addi	t1,t1,0
    1914:	091f 0006 0301      	0x3010006091f
    191a:	094e                	slli	s2,s2,0x13
    191c:	0004                	0x4
    191e:	0301                	addi	t1,t1,0
    1920:	0905                	addi	s2,s2,1
    1922:	0008                	0x8
    1924:	0301                	addi	t1,t1,0
    1926:	090e                	slli	s2,s2,0x3
    1928:	0004                	0x4
    192a:	0301                	addi	t1,t1,0
    192c:	0921                	addi	s2,s2,8
    192e:	0006                	c.slli	zero,0x1
    1930:	0301                	addi	t1,t1,0
    1932:	094c                	addi	a1,sp,148
    1934:	0006                	c.slli	zero,0x1
    1936:	0301                	addi	t1,t1,0
    1938:	0905                	addi	s2,s2,1
    193a:	000a                	c.slli	zero,0x2
    193c:	0301                	addi	t1,t1,0
    193e:	090e                	slli	s2,s2,0x3
    1940:	0004                	0x4
    1942:	0301                	addi	t1,t1,0
    1944:	0901                	addi	s2,s2,0
    1946:	0006                	c.slli	zero,0x1
    1948:	0301                	addi	t1,t1,0
    194a:	0922                	slli	s2,s2,0x8
    194c:	0004                	0x4
    194e:	0301                	addi	t1,t1,0
    1950:	097e                	slli	s2,s2,0x1f
    1952:	0002                	c.slli64	zero
    1954:	0301                	addi	t1,t1,0
    1956:	0905                	addi	s2,s2,1
    1958:	0004                	0x4
    195a:	0301                	addi	t1,t1,0
    195c:	0902                	c.slli64	s2
    195e:	0002                	c.slli64	zero
    1960:	0301                	addi	t1,t1,0
    1962:	097e                	slli	s2,s2,0x1f
    1964:	0002                	c.slli64	zero
    1966:	0301                	addi	t1,t1,0
    1968:	0902                	c.slli64	s2
    196a:	0004                	0x4
    196c:	0901                	addi	s2,s2,0
    196e:	0002                	c.slli64	zero
    1970:	0100                	addi	s0,sp,128
    1972:	a601                	j	1c72 <_prog_start-0x1fffe38e>
    1974:	000a                	c.slli	zero,0x2
    1976:	0200                	addi	s0,sp,256
    1978:	f400                	fsw	fs0,40(s0)
    197a:	0002                	c.slli64	zero
    197c:	0100                	addi	s0,sp,128
    197e:	fb01                	bnez	a4,188e <_prog_start-0x1fffe772>
    1980:	0d0e                	slli	s10,s10,0x3
    1982:	0100                	addi	s0,sp,128
    1984:	0101                	addi	sp,sp,0
    1986:	0001                	nop
    1988:	0000                	unimp
    198a:	0001                	nop
    198c:	0100                	addi	s0,sp,128
    198e:	7263732f          	0x7263732f
    1992:	7461                	lui	s0,0xffff8
    1994:	612f6863          	bltu	t5,s2,1fa4 <_prog_start-0x1fffe05c>
    1998:	7568                	flw	fa0,108(a0)
    199a:	746e                	flw	fs0,248(sp)
    199c:	6e69                	lui	t3,0x1a
    199e:	6e6f7467          	0x6e6f7467
    19a2:	6465662f          	0x6465662f
    19a6:	7265                	lui	tp,0xffff9
    19a8:	7461                	lui	s0,0xffff8
    19aa:	6f69                	lui	t5,0x1a
    19ac:	2f6e                	fld	ft10,216(sp)
    19ae:	74666f73          	csrrsi	t5,0x746,12
    19b2:	65726177          	0x65726177
    19b6:	6f6f742f          	0x6f6f742f
    19ba:	636c                	flw	fa1,68(a4)
    19bc:	6168                	flw	fa0,68(a0)
    19be:	6e69                	lui	t3,0x1a
    19c0:	6972642f          	0x6972642f
    19c4:	6576                	flw	fa0,92(sp)
    19c6:	7372                	flw	ft6,60(sp)
    19c8:	7073652f          	0x7073652f
    19cc:	2f003233          	0x2f003233
    19d0:	6b726f77          	0x6b726f77
    19d4:	6f6f742f          	0x6f6f742f
    19d8:	736c                	flw	fa1,100(a4)
    19da:	7369722f          	0x7369722f
    19de:	742d7663          	bgeu	s10,sp,212a <_prog_start-0x1fffded6>
    19e2:	736c6f6f          	jal	t5,c8118 <_prog_start-0x1ff37ee8>
    19e6:	3236392f          	0x3236392f
    19ea:	6362                	flw	ft6,24(sp)
    19ec:	3930                	fld	fa2,112(a0)
    19ee:	3738                	fld	fa4,104(a4)
    19f0:	31373033          	0x31373033
    19f4:	6161                	addi	sp,sp,80
    19f6:	36313837          	lui	a6,0x36313
    19fa:	3564                	fld	fs1,232(a0)
    19fc:	3866                	fld	fa6,120(sp)
    19fe:	3530                	fld	fa2,104(a0)
    1a00:	35653663          	0x35653663
    1a04:	61373937          	lui	s2,0x61373
    1a08:	62356233          	0x62356233
    1a0c:	2f376663          	bltu	a4,s3,1cf8 <_prog_start-0x1fffe308>
    1a10:	6972                	flw	fs2,28(sp)
    1a12:	36766373          	csrrsi	t1,0x367,12
    1a16:	2d34                	fld	fa3,88(a0)
    1a18:	6e75                	lui	t3,0x1d
    1a1a:	776f6e6b          	0x776f6e6b
    1a1e:	2d6e                	fld	fs10,216(sp)
    1a20:	6c65                	lui	s8,0x19
    1a22:	2f66                	fld	ft10,88(sp)
    1a24:	6e69                	lui	t3,0x1a
    1a26:	64756c63          	bltu	a0,t2,207e <_prog_start-0x1fffdf82>
    1a2a:	2f65                	jal	21e2 <_prog_start-0x1fffde1e>
    1a2c:	616d                	addi	sp,sp,240
    1a2e:	6e696863          	bltu	s2,t1,211e <_prog_start-0x1fffdee2>
    1a32:	0065                	c.nop	25
    1a34:	726f772f          	0x726f772f
    1a38:	6f742f6b          	0x6f742f6b
    1a3c:	2f736c6f          	jal	s8,38532 <_prog_start-0x1ffc7ace>
    1a40:	6972                	flw	fs2,28(sp)
    1a42:	2d766373          	csrrsi	t1,0x2d7,12
    1a46:	6f74                	flw	fa3,92(a4)
    1a48:	2f736c6f          	jal	s8,3853e <_prog_start-0x1ffc7ac2>
    1a4c:	3639                	jal	155a <_prog_start-0x1fffeaa6>
    1a4e:	6232                	flw	ft4,12(sp)
    1a50:	38393063          	0x38393063
    1a54:	37303337          	lui	t1,0x37303
    1a58:	6131                	addi	sp,sp,320
    1a5a:	3761                	jal	19e2 <_prog_start-0x1fffe61e>
    1a5c:	3138                	fld	fa4,96(a0)
    1a5e:	6436                	flw	fs0,76(sp)
    1a60:	6635                	lui	a2,0xd
    1a62:	3038                	fld	fa4,96(s0)
    1a64:	6335                	lui	t1,0xd
    1a66:	6536                	flw	fa0,76(sp)
    1a68:	3735                	jal	1994 <_prog_start-0x1fffe66c>
    1a6a:	3739                	jal	1978 <_prog_start-0x1fffe688>
    1a6c:	3361                	jal	17f4 <_prog_start-0x1fffe80c>
    1a6e:	3562                	fld	fa0,56(sp)
    1a70:	6362                	flw	ft6,24(sp)
    1a72:	3766                	fld	fa4,120(sp)
    1a74:	7369722f          	0x7369722f
    1a78:	34367663          	bgeu	a2,gp,1dc4 <_prog_start-0x1fffe23c>
    1a7c:	752d                	lui	a0,0xfffeb
    1a7e:	6b6e                	flw	fs6,216(sp)
    1a80:	6f6e                	flw	ft10,216(sp)
    1a82:	652d6e77          	0x652d6e77
    1a86:	666c                	flw	fa1,76(a2)
    1a88:	636e692f          	0x636e692f
    1a8c:	756c                	flw	fa1,108(a0)
    1a8e:	6564                	flw	fs1,76(a0)
    1a90:	7379732f          	0x7379732f
    1a94:	2f00                	fld	fs0,24(a4)
    1a96:	6b726f77          	0x6b726f77
    1a9a:	6f6f742f          	0x6f6f742f
    1a9e:	736c                	flw	fa1,100(a4)
    1aa0:	7369722f          	0x7369722f
    1aa4:	742d7663          	bgeu	s10,sp,21f0 <_prog_start-0x1fffde10>
    1aa8:	736c6f6f          	jal	t5,c81de <_prog_start-0x1ff37e22>
    1aac:	3236392f          	0x3236392f
    1ab0:	6362                	flw	ft6,24(sp)
    1ab2:	3930                	fld	fa2,112(a0)
    1ab4:	3738                	fld	fa4,104(a4)
    1ab6:	31373033          	0x31373033
    1aba:	6161                	addi	sp,sp,80
    1abc:	36313837          	lui	a6,0x36313
    1ac0:	3564                	fld	fs1,232(a0)
    1ac2:	3866                	fld	fa6,120(sp)
    1ac4:	3530                	fld	fa2,104(a0)
    1ac6:	35653663          	0x35653663
    1aca:	61373937          	lui	s2,0x61373
    1ace:	62356233          	0x62356233
    1ad2:	2f376663          	bltu	a4,s3,1dbe <_prog_start-0x1fffe242>
    1ad6:	696c                	flw	fa1,84(a0)
    1ad8:	2f62                	fld	ft10,24(sp)
    1ada:	2f636367          	0x2f636367
    1ade:	6972                	flw	fs2,28(sp)
    1ae0:	36766373          	csrrsi	t1,0x367,12
    1ae4:	2d34                	fld	fa3,88(a0)
    1ae6:	6e75                	lui	t3,0x1d
    1ae8:	776f6e6b          	0x776f6e6b
    1aec:	2d6e                	fld	fs10,216(sp)
    1aee:	6c65                	lui	s8,0x19
    1af0:	2f66                	fld	ft10,88(sp)
    1af2:	2e322e37          	lui	t3,0x2e322
    1af6:	2f30                	fld	fa2,88(a4)
    1af8:	6e69                	lui	t3,0x1a
    1afa:	64756c63          	bltu	a0,t2,2152 <_prog_start-0x1fffdeae>
    1afe:	0065                	c.nop	25
    1b00:	726f772f          	0x726f772f
    1b04:	6f742f6b          	0x6f742f6b
    1b08:	2f736c6f          	jal	s8,385fe <_prog_start-0x1ffc7a02>
    1b0c:	6972                	flw	fs2,28(sp)
    1b0e:	2d766373          	csrrsi	t1,0x2d7,12
    1b12:	6f74                	flw	fa3,92(a4)
    1b14:	2f736c6f          	jal	s8,3860a <_prog_start-0x1ffc79f6>
    1b18:	3639                	jal	1626 <_prog_start-0x1fffe9da>
    1b1a:	6232                	flw	ft4,12(sp)
    1b1c:	38393063          	0x38393063
    1b20:	37303337          	lui	t1,0x37303
    1b24:	6131                	addi	sp,sp,320
    1b26:	3761                	jal	1aae <_prog_start-0x1fffe552>
    1b28:	3138                	fld	fa4,96(a0)
    1b2a:	6436                	flw	fs0,76(sp)
    1b2c:	6635                	lui	a2,0xd
    1b2e:	3038                	fld	fa4,96(s0)
    1b30:	6335                	lui	t1,0xd
    1b32:	6536                	flw	fa0,76(sp)
    1b34:	3735                	jal	1a60 <_prog_start-0x1fffe5a0>
    1b36:	3739                	jal	1a44 <_prog_start-0x1fffe5bc>
    1b38:	3361                	jal	18c0 <_prog_start-0x1fffe740>
    1b3a:	3562                	fld	fa0,56(sp)
    1b3c:	6362                	flw	ft6,24(sp)
    1b3e:	3766                	fld	fa4,120(sp)
    1b40:	7369722f          	0x7369722f
    1b44:	34367663          	bgeu	a2,gp,1e90 <_prog_start-0x1fffe170>
    1b48:	752d                	lui	a0,0xfffeb
    1b4a:	6b6e                	flw	fs6,216(sp)
    1b4c:	6f6e                	flw	ft10,216(sp)
    1b4e:	652d6e77          	0x652d6e77
    1b52:	666c                	flw	fa1,76(a2)
    1b54:	636e692f          	0x636e692f
    1b58:	756c                	flw	fa1,108(a0)
    1b5a:	6564                	flw	fs1,76(a0)
    1b5c:	2f00                	fld	fs0,24(a4)
    1b5e:	61726373          	csrrsi	t1,0x617,4
    1b62:	6374                	flw	fa3,68(a4)
    1b64:	2f68                	fld	fa0,216(a4)
    1b66:	6861                	lui	a6,0x18
    1b68:	6e75                	lui	t3,0x1d
    1b6a:	6974                	flw	fa3,84(a0)
    1b6c:	676e                	flw	fa4,216(sp)
    1b6e:	6f74                	flw	fa3,92(a4)
    1b70:	2f6e                	fld	ft10,216(sp)
    1b72:	6566                	flw	fa0,88(sp)
    1b74:	6564                	flw	fs1,76(a0)
    1b76:	6172                	flw	ft2,28(sp)
    1b78:	6974                	flw	fa3,84(a0)
    1b7a:	732f6e6f          	jal	t3,f82ac <_prog_start-0x1ff07d54>
    1b7e:	7774666f          	jal	a2,48af4 <_prog_start-0x1ffb750c>
    1b82:	7261                	lui	tp,0xffff8
    1b84:	2f65                	jal	233c <_prog_start-0x1fffdcc4>
    1b86:	696c                	flw	fa1,84(a0)
    1b88:	7262                	flw	ft4,56(sp)
    1b8a:	7261                	lui	tp,0xffff8
    1b8c:	6569                	lui	a0,0x1a
    1b8e:	65622f73          	csrrs	t5,0x656,tp
    1b92:	636e                	flw	ft6,216(sp)
    1b94:	7568                	flw	fa0,108(a0)
    1b96:	6974                	flw	fa3,84(a0)
    1b98:	736c                	flw	fa1,100(a4)
    1b9a:	2f00                	fld	fs0,24(a4)
    1b9c:	61726373          	csrrsi	t1,0x617,4
    1ba0:	6374                	flw	fa3,68(a4)
    1ba2:	2f68                	fld	fa0,216(a4)
    1ba4:	6861                	lui	a6,0x18
    1ba6:	6e75                	lui	t3,0x1d
    1ba8:	6974                	flw	fa3,84(a0)
    1baa:	676e                	flw	fa4,216(sp)
    1bac:	6f74                	flw	fa3,92(a4)
    1bae:	2f6e                	fld	ft10,216(sp)
    1bb0:	6566                	flw	fa0,88(sp)
    1bb2:	6564                	flw	fs1,76(a0)
    1bb4:	6172                	flw	ft2,28(sp)
    1bb6:	6974                	flw	fa3,84(a0)
    1bb8:	732f6e6f          	jal	t3,f82ea <_prog_start-0x1ff07d16>
    1bbc:	7774666f          	jal	a2,48b32 <_prog_start-0x1ffb74ce>
    1bc0:	7261                	lui	tp,0xffff8
    1bc2:	2f65                	jal	237a <_prog_start-0x1fffdc86>
    1bc4:	6f74                	flw	fa3,92(a4)
    1bc6:	68636c6f          	jal	s8,3824c <_prog_start-0x1ffc7db4>
    1bca:	6961                	lui	s2,0x18
    1bcc:	2f6e                	fld	ft10,216(sp)
    1bce:	7264                	flw	fs1,100(a2)
    1bd0:	7669                	lui	a2,0xffffa
    1bd2:	7265                	lui	tp,0xffff9
    1bd4:	70732f73          	csrrs	t5,0x707,t1
    1bd8:	0069                	c.nop	26
    1bda:	6500                	flw	fs0,8(a0)
    1bdc:	32337073          	csrci	mhpmevent3,6
    1be0:	632e                	flw	ft6,200(sp)
    1be2:	0100                	addi	s0,sp,128
    1be4:	0000                	unimp
    1be6:	645f 6665 7561      	0x75616665645f
    1bec:	746c                	flw	fa1,108(s0)
    1bee:	745f 7079 7365      	0x73657079745f
    1bf4:	682e                	flw	fa6,200(sp)
    1bf6:	0200                	addi	s0,sp,256
    1bf8:	0000                	unimp
    1bfa:	735f 6474 6e69      	0x6e696474735f
    1c00:	2e74                	fld	fa3,216(a2)
    1c02:	0068                	addi	a0,sp,12
    1c04:	6c000003          	lb	zero,1728(zero) # 6c0 <_prog_start-0x1ffff940>
    1c08:	2e6b636f          	jal	t1,b7eee <_prog_start-0x1ff48112>
    1c0c:	0068                	addi	a0,sp,12
    1c0e:	5f000003          	lb	zero,1520(zero) # 5f0 <_prog_start-0x1ffffa10>
    1c12:	7974                	flw	fa3,116(a0)
    1c14:	6570                	flw	fa2,76(a0)
    1c16:	00682e73          	csrrs	t3,0x6,a6
    1c1a:	73000003          	lb	zero,1840(zero) # 730 <_prog_start-0x1ffff8d0>
    1c1e:	6474                	flw	fa3,76(s0)
    1c20:	6564                	flw	fs1,76(a0)
    1c22:	2e66                	fld	ft8,88(sp)
    1c24:	0068                	addi	a0,sp,12
    1c26:	0004                	0x4
    1c28:	7500                	flw	fs0,40(a0)
    1c2a:	696e                	flw	fs2,216(sp)
    1c2c:	2e647473          	csrrci	s0,0x2e6,8
    1c30:	0068                	addi	a0,sp,12
    1c32:	72000003          	lb	zero,1824(zero) # 720 <_prog_start-0x1ffff8e0>
    1c36:	6565                	lui	a0,0x19
    1c38:	746e                	flw	fs0,248(sp)
    1c3a:	682e                	flw	fa6,200(sp)
    1c3c:	0300                	addi	s0,sp,384
    1c3e:	0000                	unimp
    1c40:	70797463          	bgeu	s2,t2,2348 <_prog_start-0x1fffdcb8>
    1c44:	2e65                	jal	1ffc <_prog_start-0x1fffe004>
    1c46:	0068                	addi	a0,sp,12
    1c48:	0005                	c.nop	1
    1c4a:	6200                	flw	fs0,0(a2)
    1c4c:	6e65                	lui	t3,0x19
    1c4e:	74756863          	bltu	a0,t2,239e <_prog_start-0x1fffdc62>
    1c52:	6c69                	lui	s8,0x1a
    1c54:	00682e73          	csrrs	t3,0x6,a6
    1c58:	0006                	c.slli	zero,0x1
    1c5a:	7300                	flw	fs0,32(a4)
    1c5c:	6970                	flw	fa2,84(a0)
    1c5e:	682e                	flw	fa6,200(sp)
    1c60:	0700                	addi	s0,sp,896
    1c62:	0000                	unimp
    1c64:	69727473          	csrrci	s0,0x697,4
    1c68:	676e                	flw	fa4,216(sp)
    1c6a:	682e                	flw	fa6,200(sp)
    1c6c:	0500                	addi	s0,sp,640
    1c6e:	0000                	unimp
    1c70:	0000                	unimp
    1c72:	0205                	addi	tp,tp,1
    1c74:	12d8                	addi	a4,sp,356
    1c76:	2000                	fld	fs0,0(s0)
    1c78:	03010e03          	lb	t3,48(sp)
    1c7c:	0900                	addi	s0,sp,144
    1c7e:	0006                	c.slli	zero,0x1
    1c80:	0301                	addi	t1,t1,0
    1c82:	0901                	addi	s2,s2,0
    1c84:	0002                	c.slli64	zero
    1c86:	0301                	addi	t1,t1,0
    1c88:	0902                	c.slli64	s2
    1c8a:	0012                	c.slli	zero,0x4
    1c8c:	0301                	addi	t1,t1,0
    1c8e:	0901                	addi	s2,s2,0
    1c90:	0008                	0x8
    1c92:	0301                	addi	t1,t1,0
    1c94:	0901                	addi	s2,s2,0
    1c96:	0006                	c.slli	zero,0x1
    1c98:	0301                	addi	t1,t1,0
    1c9a:	0902                	c.slli64	s2
    1c9c:	0004                	0x4
    1c9e:	0301                	addi	t1,t1,0
    1ca0:	097e                	slli	s2,s2,0x1f
    1ca2:	0006                	c.slli	zero,0x1
    1ca4:	0301                	addi	t1,t1,0
    1ca6:	0904                	addi	s1,sp,144
    1ca8:	0004                	0x4
    1caa:	0301                	addi	t1,t1,0
    1cac:	0902                	c.slli64	s2
    1cae:	0000                	unimp
    1cb0:	0301                	addi	t1,t1,0
    1cb2:	097e                	slli	s2,s2,0x1f
    1cb4:	0006                	c.slli	zero,0x1
    1cb6:	0301                	addi	t1,t1,0
    1cb8:	0902                	c.slli64	s2
    1cba:	000a                	c.slli	zero,0x2
    1cbc:	0301                	addi	t1,t1,0
    1cbe:	0901                	addi	s2,s2,0
    1cc0:	0006                	c.slli	zero,0x1
    1cc2:	0001                	nop
    1cc4:	0402                	c.slli64	s0
    1cc6:	0601                	addi	a2,a2,0
    1cc8:	16090003          	lb	zero,352(s2) # 18160 <_prog_start-0x1ffe7ea0>
    1ccc:	0100                	addi	s0,sp,128
    1cce:	0200                	addi	s0,sp,256
    1cd0:	0104                	addi	s1,sp,128
    1cd2:	0306                	slli	t1,t1,0x1
    1cd4:	097f                	0x97f
    1cd6:	0006                	c.slli	zero,0x1
    1cd8:	0301                	addi	t1,t1,0
    1cda:	0904                	addi	s1,sp,144
    1cdc:	0006                	c.slli	zero,0x1
    1cde:	0301                	addi	t1,t1,0
    1ce0:	0904                	addi	s1,sp,144
    1ce2:	000a                	c.slli	zero,0x2
    1ce4:	0301                	addi	t1,t1,0
    1ce6:	00000903          	lb	s2,0(zero) # 0 <_prog_start-0x20000000>
    1cea:	0301                	addi	t1,t1,0
    1cec:	097d                	addi	s2,s2,31
    1cee:	0006                	c.slli	zero,0x1
    1cf0:	0301                	addi	t1,t1,0
    1cf2:	000a0903          	lb	s2,0(s4)
    1cf6:	0301                	addi	t1,t1,0
    1cf8:	097d                	addi	s2,s2,31
    1cfa:	0004                	0x4
    1cfc:	0301                	addi	t1,t1,0
    1cfe:	0902                	c.slli64	s2
    1d00:	0002                	c.slli64	zero
    1d02:	0301                	addi	t1,t1,0
    1d04:	0901                	addi	s2,s2,0
    1d06:	0002                	c.slli64	zero
    1d08:	0001                	nop
    1d0a:	0402                	c.slli64	s0
    1d0c:	0602                	c.slli64	a2
    1d0e:	0c090003          	lb	zero,192(s2)
    1d12:	0100                	addi	s0,sp,128
    1d14:	0200                	addi	s0,sp,256
    1d16:	0304                	addi	s1,sp,384
    1d18:	04090003          	lb	zero,64(s2)
    1d1c:	0100                	addi	s0,sp,128
    1d1e:	0306                	slli	t1,t1,0x1
    1d20:	0901                	addi	s2,s2,0
    1d22:	0012                	c.slli	zero,0x4
    1d24:	0301                	addi	t1,t1,0
    1d26:	0901                	addi	s2,s2,0
    1d28:	0004                	0x4
    1d2a:	0301                	addi	t1,t1,0
    1d2c:	0902                	c.slli64	s2
    1d2e:	0002                	c.slli64	zero
    1d30:	0301                	addi	t1,t1,0
    1d32:	000e0903          	lb	s2,0(t3) # 19000 <_prog_start-0x1ffe7000>
    1d36:	0301                	addi	t1,t1,0
    1d38:	00060903          	lb	s2,0(a2) # ffffa000 <_sp+0x7fff6000>
    1d3c:	0301                	addi	t1,t1,0
    1d3e:	097d                	addi	s2,s2,31
    1d40:	0002                	c.slli64	zero
    1d42:	0301                	addi	t1,t1,0
    1d44:	0900                	addi	s0,sp,144
    1d46:	0004                	0x4
    1d48:	0301                	addi	t1,t1,0
    1d4a:	00020903          	lb	s2,0(tp) # ffff9000 <_sp+0x7fff5000>
    1d4e:	0301                	addi	t1,t1,0
    1d50:	0901                	addi	s2,s2,0
    1d52:	0004                	0x4
    1d54:	0301                	addi	t1,t1,0
    1d56:	0901                	addi	s2,s2,0
    1d58:	000a                	c.slli	zero,0x2
    1d5a:	0301                	addi	t1,t1,0
    1d5c:	0902                	c.slli64	s2
    1d5e:	0016                	c.slli	zero,0x5
    1d60:	0001                	nop
    1d62:	0402                	c.slli64	s0
    1d64:	090b0303          	lb	t1,144(s6)
    1d68:	000a                	c.slli	zero,0x2
    1d6a:	0301                	addi	t1,t1,0
    1d6c:	0902                	c.slli64	s2
    1d6e:	0006                	c.slli	zero,0x1
    1d70:	0001                	nop
    1d72:	0402                	c.slli64	s0
    1d74:	0301                	addi	t1,t1,0
    1d76:	0902                	c.slli64	s2
    1d78:	0008                	0x8
    1d7a:	0001                	nop
    1d7c:	0402                	c.slli64	s0
    1d7e:	0302                	c.slli64	t1
    1d80:	0901                	addi	s2,s2,0
    1d82:	0006                	c.slli	zero,0x1
    1d84:	0001                	nop
    1d86:	0402                	c.slli64	s0
    1d88:	0302                	c.slli64	t1
    1d8a:	096e                	slli	s2,s2,0x1b
    1d8c:	0008                	0x8
    1d8e:	0301                	addi	t1,t1,0
    1d90:	0916                	slli	s2,s2,0x5
    1d92:	0004                	0x4
    1d94:	0001                	nop
    1d96:	0402                	c.slli64	s0
    1d98:	0301                	addi	t1,t1,0
    1d9a:	0979                	addi	s2,s2,30
    1d9c:	000c                	0xc
    1d9e:	0301                	addi	t1,t1,0
    1da0:	0008090b          	0x8090b
    1da4:	0301                	addi	t1,t1,0
    1da6:	0901                	addi	s2,s2,0
    1da8:	0004                	0x4
    1daa:	0301                	addi	t1,t1,0
    1dac:	0902                	c.slli64	s2
    1dae:	0002                	c.slli64	zero
    1db0:	0301                	addi	t1,t1,0
    1db2:	0904                	addi	s1,sp,144
    1db4:	0008                	0x8
    1db6:	0301                	addi	t1,t1,0
    1db8:	0902                	c.slli64	s2
    1dba:	0004                	0x4
    1dbc:	0301                	addi	t1,t1,0
    1dbe:	097e                	slli	s2,s2,0x1f
    1dc0:	0004                	0x4
    1dc2:	0301                	addi	t1,t1,0
    1dc4:	0900                	addi	s0,sp,144
    1dc6:	0016                	c.slli	zero,0x5
    1dc8:	0301                	addi	t1,t1,0
    1dca:	0902                	c.slli64	s2
    1dcc:	0004                	0x4
    1dce:	0301                	addi	t1,t1,0
    1dd0:	0901                	addi	s2,s2,0
    1dd2:	0004                	0x4
    1dd4:	0301                	addi	t1,t1,0
    1dd6:	0901                	addi	s2,s2,0
    1dd8:	0004                	0x4
    1dda:	0301                	addi	t1,t1,0
    1ddc:	0901                	addi	s2,s2,0
    1dde:	0004                	0x4
    1de0:	0001                	nop
    1de2:	0402                	c.slli64	s0
    1de4:	09020303          	lb	t1,144(tp) # 90 <_prog_start-0x1fffff70>
    1de8:	000a                	c.slli	zero,0x2
    1dea:	0301                	addi	t1,t1,0
    1dec:	0902                	c.slli64	s2
    1dee:	000a                	c.slli	zero,0x2
    1df0:	0301                	addi	t1,t1,0
    1df2:	000a0907          	0xa0907
    1df6:	0301                	addi	t1,t1,0
    1df8:	0901                	addi	s2,s2,0
    1dfa:	0004                	0x4
    1dfc:	0301                	addi	t1,t1,0
    1dfe:	097f                	0x97f
    1e00:	0004                	0x4
    1e02:	0301                	addi	t1,t1,0
    1e04:	0901                	addi	s2,s2,0
    1e06:	0002                	c.slli64	zero
    1e08:	0301                	addi	t1,t1,0
    1e0a:	0969                	addi	s2,s2,26
    1e0c:	0006                	c.slli	zero,0x1
    1e0e:	0301                	addi	t1,t1,0
    1e10:	091d                	addi	s2,s2,7
    1e12:	0008                	0x8
    1e14:	0301                	addi	t1,t1,0
    1e16:	0902                	c.slli64	s2
    1e18:	0008                	0x8
    1e1a:	0301                	addi	t1,t1,0
    1e1c:	0901                	addi	s2,s2,0
    1e1e:	0004                	0x4
    1e20:	0301                	addi	t1,t1,0
    1e22:	097f                	0x97f
    1e24:	0006                	c.slli	zero,0x1
    1e26:	0001                	nop
    1e28:	0402                	c.slli64	s0
    1e2a:	0601                	addi	a2,a2,0
    1e2c:	08090003          	lb	zero,128(s2)
    1e30:	0100                	addi	s0,sp,128
    1e32:	0306                	slli	t1,t1,0x1
    1e34:	0901                	addi	s2,s2,0
    1e36:	0008                	0x8
    1e38:	0001                	nop
    1e3a:	0402                	c.slli64	s0
    1e3c:	0601                	addi	a2,a2,0
    1e3e:	0c090003          	lb	zero,192(s2)
    1e42:	0100                	addi	s0,sp,128
    1e44:	0200                	addi	s0,sp,256
    1e46:	0204                	addi	s1,sp,256
    1e48:	0306                	slli	t1,t1,0x1
    1e4a:	0960                	addi	s0,sp,156
    1e4c:	0004                	0x4
    1e4e:	0001                	nop
    1e50:	0402                	c.slli64	s0
    1e52:	0302                	c.slli64	t1
    1e54:	091e                	slli	s2,s2,0x7
    1e56:	0008                	0x8
    1e58:	0301                	addi	t1,t1,0
    1e5a:	0905                	addi	s2,s2,1
    1e5c:	0002                	c.slli64	zero
    1e5e:	0301                	addi	t1,t1,0
    1e60:	0904                	addi	s1,sp,144
    1e62:	0008                	0x8
    1e64:	0301                	addi	t1,t1,0
    1e66:	000a0907          	0xa0907
    1e6a:	0301                	addi	t1,t1,0
    1e6c:	090a                	slli	s2,s2,0x2
    1e6e:	0008                	0x8
    1e70:	0301                	addi	t1,t1,0
    1e72:	0976                	slli	s2,s2,0x1d
    1e74:	0002                	c.slli64	zero
    1e76:	0301                	addi	t1,t1,0
    1e78:	0902                	c.slli64	s2
    1e7a:	0004                	0x4
    1e7c:	0301                	addi	t1,t1,0
    1e7e:	0902                	c.slli64	s2
    1e80:	0006                	c.slli	zero,0x1
    1e82:	0001                	nop
    1e84:	0402                	c.slli64	s0
    1e86:	09020303          	lb	t1,144(tp) # 90 <_prog_start-0x1fffff70>
    1e8a:	0006                	c.slli	zero,0x1
    1e8c:	0001                	nop
    1e8e:	0402                	c.slli64	s0
    1e90:	09010303          	lb	t1,144(sp)
    1e94:	0016                	c.slli	zero,0x5
    1e96:	0301                	addi	t1,t1,0
    1e98:	0904                	addi	s1,sp,144
    1e9a:	0002                	c.slli64	zero
    1e9c:	0301                	addi	t1,t1,0
    1e9e:	095f 0018 0001      	0x10018095f
    1ea4:	0402                	c.slli64	s0
    1ea6:	0601                	addi	a2,a2,0
    1ea8:	06090003          	lb	zero,96(s2)
    1eac:	0100                	addi	s0,sp,128
    1eae:	0306                	slli	t1,t1,0x1
    1eb0:	090d                	addi	s2,s2,3
    1eb2:	000e                	c.slli	zero,0x3
    1eb4:	0001                	nop
    1eb6:	0402                	c.slli64	s0
    1eb8:	0601                	addi	a2,a2,0
    1eba:	0a090003          	lb	zero,160(s2)
    1ebe:	0100                	addi	s0,sp,128
    1ec0:	0200                	addi	s0,sp,256
    1ec2:	0104                	addi	s1,sp,128
    1ec4:	0306                	slli	t1,t1,0x1
    1ec6:	0902                	c.slli64	s2
    1ec8:	000c                	0xc
    1eca:	0301                	addi	t1,t1,0
    1ecc:	0901                	addi	s2,s2,0
    1ece:	000a                	c.slli	zero,0x2
    1ed0:	0001                	nop
    1ed2:	0402                	c.slli64	s0
    1ed4:	09010303          	lb	t1,144(sp)
    1ed8:	0010                	0x10
    1eda:	0301                	addi	t1,t1,0
    1edc:	0901                	addi	s2,s2,0
    1ede:	000c                	0xc
    1ee0:	0001                	nop
    1ee2:	0402                	c.slli64	s0
    1ee4:	0301                	addi	t1,t1,0
    1ee6:	096d                	addi	s2,s2,27
    1ee8:	000e                	c.slli	zero,0x3
    1eea:	0301                	addi	t1,t1,0
    1eec:	0979                	addi	s2,s2,30
    1eee:	000e                	c.slli	zero,0x3
    1ef0:	0001                	nop
    1ef2:	0402                	c.slli64	s0
    1ef4:	09010303          	lb	t1,144(sp)
    1ef8:	0012                	c.slli	zero,0x4
    1efa:	0301                	addi	t1,t1,0
    1efc:	0901                	addi	s2,s2,0
    1efe:	000c                	0xc
    1f00:	0001                	nop
    1f02:	0402                	c.slli64	s0
    1f04:	0301                	addi	t1,t1,0
    1f06:	0911                	addi	s2,s2,4
    1f08:	000e                	c.slli	zero,0x3
    1f0a:	0001                	nop
    1f0c:	0402                	c.slli64	s0
    1f0e:	0301                	addi	t1,t1,0
    1f10:	0904                	addi	s1,sp,144
    1f12:	000c                	0xc
    1f14:	0301                	addi	t1,t1,0
    1f16:	090c                	addi	a1,sp,144
    1f18:	000c                	0xc
    1f1a:	0301                	addi	t1,t1,0
    1f1c:	097e                	slli	s2,s2,0x1f
    1f1e:	0012                	c.slli	zero,0x4
    1f20:	0301                	addi	t1,t1,0
    1f22:	090c                	addi	a1,sp,144
    1f24:	0012                	c.slli	zero,0x4
    1f26:	0301                	addi	t1,t1,0
    1f28:	0904                	addi	s1,sp,144
    1f2a:	0006                	c.slli	zero,0x1
    1f2c:	0301                	addi	t1,t1,0
    1f2e:	097c                	addi	a5,sp,156
    1f30:	0002                	c.slli64	zero
    1f32:	0301                	addi	t1,t1,0
    1f34:	0900                	addi	s0,sp,144
    1f36:	0012                	c.slli	zero,0x4
    1f38:	0301                	addi	t1,t1,0
    1f3a:	0906                	slli	s2,s2,0x1
    1f3c:	0002                	c.slli64	zero
    1f3e:	0301                	addi	t1,t1,0
    1f40:	097a                	slli	s2,s2,0x1e
    1f42:	0000                	unimp
    1f44:	0301                	addi	t1,t1,0
    1f46:	0904                	addi	s1,sp,144
    1f48:	0002                	c.slli64	zero
    1f4a:	0301                	addi	t1,t1,0
    1f4c:	0902                	c.slli64	s2
    1f4e:	0004                	0x4
    1f50:	0301                	addi	t1,t1,0
    1f52:	097e                	slli	s2,s2,0x1f
    1f54:	0004                	0x4
    1f56:	0301                	addi	t1,t1,0
    1f58:	0902                	c.slli64	s2
    1f5a:	0002                	c.slli64	zero
    1f5c:	0301                	addi	t1,t1,0
    1f5e:	0908                	addi	a0,sp,144
    1f60:	0002                	c.slli64	zero
    1f62:	0301                	addi	t1,t1,0
    1f64:	0902                	c.slli64	s2
    1f66:	0008                	0x8
    1f68:	0301                	addi	t1,t1,0
    1f6a:	0902                	c.slli64	s2
    1f6c:	0002                	c.slli64	zero
    1f6e:	0301                	addi	t1,t1,0
    1f70:	0972                	slli	s2,s2,0x1c
    1f72:	000a                	c.slli	zero,0x2
    1f74:	0301                	addi	t1,t1,0
    1f76:	0911                	addi	s2,s2,4
    1f78:	0008                	0x8
    1f7a:	0301                	addi	t1,t1,0
    1f7c:	0901                	addi	s2,s2,0
    1f7e:	0004                	0x4
    1f80:	0301                	addi	t1,t1,0
    1f82:	0901                	addi	s2,s2,0
    1f84:	0008                	0x8
    1f86:	0301                	addi	t1,t1,0
    1f88:	097e                	slli	s2,s2,0x1f
    1f8a:	000a                	c.slli	zero,0x2
    1f8c:	0301                	addi	t1,t1,0
    1f8e:	7fae                	flw	ft11,232(sp)
    1f90:	0409                	addi	s0,s0,2
    1f92:	0100                	addi	s0,sp,128
    1f94:	0900d203          	lhu	tp,144(ra)
    1f98:	0006                	c.slli	zero,0x1
    1f9a:	0301                	addi	t1,t1,0
    1f9c:	7fae                	flw	ft11,232(sp)
    1f9e:	0409                	addi	s0,s0,2
    1fa0:	0100                	addi	s0,sp,128
    1fa2:	0900d903          	lhu	s2,144(ra)
    1fa6:	0002                	c.slli64	zero
    1fa8:	0301                	addi	t1,t1,0
    1faa:	000a0903          	lb	s2,0(s4)
    1fae:	0301                	addi	t1,t1,0
    1fb0:	0901                	addi	s2,s2,0
    1fb2:	0006                	c.slli	zero,0x1
    1fb4:	0301                	addi	t1,t1,0
    1fb6:	0902                	c.slli64	s2
    1fb8:	000a                	c.slli	zero,0x2
    1fba:	0301                	addi	t1,t1,0
    1fbc:	0902                	c.slli64	s2
    1fbe:	000c                	0xc
    1fc0:	0001                	nop
    1fc2:	0402                	c.slli64	s0
    1fc4:	09010303          	lb	t1,144(sp)
    1fc8:	0014                	0x14
    1fca:	0301                	addi	t1,t1,0
    1fcc:	090d                	addi	s2,s2,3
    1fce:	000c                	0xc
    1fd0:	0301                	addi	t1,t1,0
    1fd2:	0908                	addi	a0,sp,144
    1fd4:	0002                	c.slli64	zero
    1fd6:	0301                	addi	t1,t1,0
    1fd8:	094d                	addi	s2,s2,19
    1fda:	001a                	c.slli	zero,0x6
    1fdc:	0301                	addi	t1,t1,0
    1fde:	0901                	addi	s2,s2,0
    1fe0:	0004                	0x4
    1fe2:	0001                	nop
    1fe4:	0402                	c.slli64	s0
    1fe6:	0301                	addi	t1,t1,0
    1fe8:	000e0917          	auipc	s2,0xe0
    1fec:	0001                	nop
    1fee:	0402                	c.slli64	s0
    1ff0:	0301                	addi	t1,t1,0
    1ff2:	000c0903          	lb	s2,0(s8) # 1a000 <_prog_start-0x1ffe6000>
    1ff6:	0301                	addi	t1,t1,0
    1ff8:	0908                	addi	a0,sp,144
    1ffa:	000c                	0xc
    1ffc:	0301                	addi	t1,t1,0
    1ffe:	7f99                	lui	t6,0xfffe6
    2000:	0c09                	addi	s8,s8,2
    2002:	0100                	addi	s0,sp,128
    2004:	0900ec03          	0x900ec03
    2008:	0008                	0x8
    200a:	0301                	addi	t1,t1,0
    200c:	000c0907          	0xc0907
    2010:	0301                	addi	t1,t1,0
    2012:	0901                	addi	s2,s2,0
    2014:	0006                	c.slli	zero,0x1
    2016:	0301                	addi	t1,t1,0
    2018:	0902                	c.slli64	s2
    201a:	0006                	c.slli	zero,0x1
    201c:	0301                	addi	t1,t1,0
    201e:	097e                	slli	s2,s2,0x1f
    2020:	0002                	c.slli64	zero
    2022:	0001                	nop
    2024:	0402                	c.slli64	s0
    2026:	0601                	addi	a2,a2,0
    2028:	04090003          	lb	zero,64(s2) # e2028 <_prog_start-0x1ff1dfd8>
    202c:	0100                	addi	s0,sp,128
    202e:	0200                	addi	s0,sp,256
    2030:	0104                	addi	s1,sp,128
    2032:	0306                	slli	t1,t1,0x1
    2034:	000e095b          	0xe095b
    2038:	0001                	nop
    203a:	0402                	c.slli64	s0
    203c:	0301                	addi	t1,t1,0
    203e:	090a                	slli	s2,s2,0x2
    2040:	000e                	c.slli	zero,0x3
    2042:	0001                	nop
    2044:	0402                	c.slli64	s0
    2046:	0301                	addi	t1,t1,0
    2048:	000c0903          	lb	s2,0(s8)
    204c:	0001                	nop
    204e:	0402                	c.slli64	s0
    2050:	0301                	addi	t1,t1,0
    2052:	0901                	addi	s2,s2,0
    2054:	000a                	c.slli	zero,0x2
    2056:	0301                	addi	t1,t1,0
    2058:	0911                	addi	s2,s2,4
    205a:	000e                	c.slli	zero,0x3
    205c:	0301                	addi	t1,t1,0
    205e:	0901                	addi	s2,s2,0
    2060:	000c                	0xc
    2062:	0001                	nop
    2064:	0402                	c.slli64	s0
    2066:	0301                	addi	t1,t1,0
    2068:	0904                	addi	s1,sp,144
    206a:	0004                	0x4
    206c:	0301                	addi	t1,t1,0
    206e:	0908                	addi	a0,sp,144
    2070:	000e                	c.slli	zero,0x3
    2072:	0301                	addi	t1,t1,0
    2074:	0900                	addi	s0,sp,144
    2076:	0020                	addi	s0,sp,8
    2078:	0301                	addi	t1,t1,0
    207a:	0906                	slli	s2,s2,0x1
    207c:	0002                	c.slli64	zero
    207e:	0301                	addi	t1,t1,0
    2080:	0901                	addi	s2,s2,0
    2082:	0002                	c.slli64	zero
    2084:	0301                	addi	t1,t1,0
    2086:	0914                	addi	a3,sp,144
    2088:	000c                	0xc
    208a:	0301                	addi	t1,t1,0
    208c:	096c                	addi	a1,sp,156
    208e:	0004                	0x4
    2090:	0001                	nop
    2092:	0402                	c.slli64	s0
    2094:	0601                	addi	a2,a2,0
    2096:	0a090003          	lb	zero,160(s2)
    209a:	0100                	addi	s0,sp,128
    209c:	0306                	slli	t1,t1,0x1
    209e:	0901                	addi	s2,s2,0
    20a0:	0008                	0x8
    20a2:	0301                	addi	t1,t1,0
    20a4:	0901                	addi	s2,s2,0
    20a6:	0008                	0x8
    20a8:	0301                	addi	t1,t1,0
    20aa:	0902                	c.slli64	s2
    20ac:	0004                	0x4
    20ae:	0001                	nop
    20b0:	0402                	c.slli64	s0
    20b2:	097b0303          	lb	t1,151(s6)
    20b6:	0010                	0x10
    20b8:	0001                	nop
    20ba:	0402                	c.slli64	s0
    20bc:	09080303          	lb	t1,144(a6) # 18090 <_prog_start-0x1ffe7f70>
    20c0:	0002                	c.slli64	zero
    20c2:	0001                	nop
    20c4:	0402                	c.slli64	s0
    20c6:	09010303          	lb	t1,144(sp)
    20ca:	000c                	0xc
    20cc:	0301                	addi	t1,t1,0
    20ce:	7ef6                	flw	ft9,124(sp)
    20d0:	0a09                	addi	s4,s4,2
    20d2:	0100                	addi	s0,sp,128
    20d4:	09019003          	lh	zero,144(gp) # 80000e10 <__global_pointer$+0x90>
    20d8:	0008                	0x8
    20da:	0301                	addi	t1,t1,0
    20dc:	0901                	addi	s2,s2,0
    20de:	0008                	0x8
    20e0:	0301                	addi	t1,t1,0
    20e2:	0908                	addi	a0,sp,144
    20e4:	000a                	c.slli	zero,0x2
    20e6:	0301                	addi	t1,t1,0
    20e8:	0902                	c.slli64	s2
    20ea:	000c                	0xc
    20ec:	0301                	addi	t1,t1,0
    20ee:	0905                	addi	s2,s2,1
    20f0:	0006                	c.slli	zero,0x1
    20f2:	0301                	addi	t1,t1,0
    20f4:	00060903          	lb	s2,0(a2)
    20f8:	0301                	addi	t1,t1,0
    20fa:	095e                	slli	s2,s2,0x17
    20fc:	0008                	0x8
    20fe:	0301                	addi	t1,t1,0
    2100:	0901                	addi	s2,s2,0
    2102:	0002                	c.slli64	zero
    2104:	0301                	addi	t1,t1,0
    2106:	091a                	slli	s2,s2,0x6
    2108:	0002                	c.slli64	zero
    210a:	0301                	addi	t1,t1,0
    210c:	0901                	addi	s2,s2,0
    210e:	000c                	0xc
    2110:	0301                	addi	t1,t1,0
    2112:	0901                	addi	s2,s2,0
    2114:	0008                	0x8
    2116:	0301                	addi	t1,t1,0
    2118:	0902                	c.slli64	s2
    211a:	0008                	0x8
    211c:	0301                	addi	t1,t1,0
    211e:	0902                	c.slli64	s2
    2120:	0006                	c.slli	zero,0x1
    2122:	0001                	nop
    2124:	0402                	c.slli64	s0
    2126:	0601                	addi	a2,a2,0
    2128:	08090003          	lb	zero,128(s2)
    212c:	0100                	addi	s0,sp,128
    212e:	0200                	addi	s0,sp,256
    2130:	0104                	addi	s1,sp,128
    2132:	0306                	slli	t1,t1,0x1
    2134:	096e                	slli	s2,s2,0x1b
    2136:	000e                	c.slli	zero,0x3
    2138:	0301                	addi	t1,t1,0
    213a:	000c0903          	lb	s2,0(s8)
    213e:	0301                	addi	t1,t1,0
    2140:	0901                	addi	s2,s2,0
    2142:	000a                	c.slli	zero,0x2
    2144:	0001                	nop
    2146:	0402                	c.slli64	s0
    2148:	09010303          	lb	t1,144(sp)
    214c:	000e                	c.slli	zero,0x3
    214e:	0301                	addi	t1,t1,0
    2150:	0901                	addi	s2,s2,0
    2152:	000c                	0xc
    2154:	0301                	addi	t1,t1,0
    2156:	00080903          	lb	s2,0(a6)
    215a:	0301                	addi	t1,t1,0
    215c:	090e                	slli	s2,s2,0x3
    215e:	0010                	0x10
    2160:	0301                	addi	t1,t1,0
    2162:	0901                	addi	s2,s2,0
    2164:	0008                	0x8
    2166:	0301                	addi	t1,t1,0
    2168:	097f                	0x97f
    216a:	0002                	c.slli64	zero
    216c:	0301                	addi	t1,t1,0
    216e:	0901                	addi	s2,s2,0
    2170:	0004                	0x4
    2172:	0001                	nop
    2174:	0402                	c.slli64	s0
    2176:	096c0303          	lb	t1,150(s8)
    217a:	0004                	0x4
    217c:	0001                	nop
    217e:	0402                	c.slli64	s0
    2180:	091d0303          	lb	t1,145(s10)
    2184:	0002                	c.slli64	zero
    2186:	0301                	addi	t1,t1,0
    2188:	0a097ecf          	fnmadd.d	ft9,fs2,ft0,ft1
    218c:	0100                	addi	s0,sp,128
    218e:	0901b703          	0x901b703
    2192:	0008                	0x8
    2194:	0301                	addi	t1,t1,0
    2196:	097e                	slli	s2,s2,0x1f
    2198:	0004                	0x4
    219a:	0301                	addi	t1,t1,0
    219c:	0902                	c.slli64	s2
    219e:	0006                	c.slli	zero,0x1
    21a0:	0301                	addi	t1,t1,0
    21a2:	0902                	c.slli64	s2
    21a4:	0006                	c.slli	zero,0x1
    21a6:	0301                	addi	t1,t1,0
    21a8:	0902                	c.slli64	s2
    21aa:	000c                	0xc
    21ac:	0301                	addi	t1,t1,0
    21ae:	0902                	c.slli64	s2
    21b0:	0006                	c.slli	zero,0x1
    21b2:	0301                	addi	t1,t1,0
    21b4:	0901                	addi	s2,s2,0
    21b6:	000a                	c.slli	zero,0x2
    21b8:	0301                	addi	t1,t1,0
    21ba:	097d                	addi	s2,s2,31
    21bc:	0008                	0x8
    21be:	0301                	addi	t1,t1,0
    21c0:	0905                	addi	s2,s2,1
    21c2:	0004                	0x4
    21c4:	0301                	addi	t1,t1,0
    21c6:	0904                	addi	s1,sp,144
    21c8:	000c                	0xc
    21ca:	0001                	nop
    21cc:	0402                	c.slli64	s0
    21ce:	0301                	addi	t1,t1,0
    21d0:	0942                	slli	s2,s2,0x10
    21d2:	0020                	addi	s0,sp,8
    21d4:	0001                	nop
    21d6:	0402                	c.slli64	s0
    21d8:	0301                	addi	t1,t1,0
    21da:	000e090b          	0xe090b
    21de:	0301                	addi	t1,t1,0
    21e0:	000e090f          	0xe090f
    21e4:	0301                	addi	t1,t1,0
    21e6:	090a                	slli	s2,s2,0x2
    21e8:	0004                	0x4
    21ea:	0301                	addi	t1,t1,0
    21ec:	0901                	addi	s2,s2,0
    21ee:	000c                	0xc
    21f0:	0301                	addi	t1,t1,0
    21f2:	0901                	addi	s2,s2,0
    21f4:	0006                	c.slli	zero,0x1
    21f6:	0301                	addi	t1,t1,0
    21f8:	0901                	addi	s2,s2,0
    21fa:	0008                	0x8
    21fc:	0301                	addi	t1,t1,0
    21fe:	000e091b          	0xe091b
    2202:	0301                	addi	t1,t1,0
    2204:	0918                	addi	a4,sp,144
    2206:	0006                	c.slli	zero,0x1
    2208:	0301                	addi	t1,t1,0
    220a:	0968                	addi	a0,sp,156
    220c:	0000                	unimp
    220e:	0301                	addi	t1,t1,0
    2210:	0900                	addi	s0,sp,144
    2212:	0010                	0x10
    2214:	0301                	addi	t1,t1,0
    2216:	0908                	addi	a0,sp,144
    2218:	0002                	c.slli64	zero
    221a:	0301                	addi	t1,t1,0
    221c:	0908                	addi	a0,sp,144
    221e:	0004                	0x4
    2220:	0301                	addi	t1,t1,0
    2222:	0908                	addi	a0,sp,144
    2224:	0000                	unimp
    2226:	0301                	addi	t1,t1,0
    2228:	0901                	addi	s2,s2,0
    222a:	0004                	0x4
    222c:	0301                	addi	t1,t1,0
    222e:	0978                	addi	a4,sp,156
    2230:	0008                	0x8
    2232:	0301                	addi	t1,t1,0
    2234:	0906                	slli	s2,s2,0x1
    2236:	0006                	c.slli	zero,0x1
    2238:	0301                	addi	t1,t1,0
    223a:	0905                	addi	s2,s2,1
    223c:	0002                	c.slli64	zero
    223e:	0301                	addi	t1,t1,0
    2240:	000e0907          	0xe0907
    2244:	0301                	addi	t1,t1,0
    2246:	0965                	addi	s2,s2,25
    2248:	000a                	c.slli	zero,0x2
    224a:	0301                	addi	t1,t1,0
    224c:	0914                	addi	a3,sp,144
    224e:	0002                	c.slli64	zero
    2250:	0301                	addi	t1,t1,0
    2252:	00020907          	0x20907
    2256:	0301                	addi	t1,t1,0
    2258:	00040907          	0x40907
    225c:	0301                	addi	t1,t1,0
    225e:	0979                	addi	s2,s2,30
    2260:	000a                	c.slli	zero,0x2
    2262:	0301                	addi	t1,t1,0
    2264:	00020907          	0x20907
    2268:	0301                	addi	t1,t1,0
    226a:	095e                	slli	s2,s2,0x17
    226c:	0004                	0x4
    226e:	0301                	addi	t1,t1,0
    2270:	0922                	slli	s2,s2,0x8
    2272:	0002                	c.slli64	zero
    2274:	0301                	addi	t1,t1,0
    2276:	095e                	slli	s2,s2,0x17
    2278:	0002                	c.slli64	zero
    227a:	0301                	addi	t1,t1,0
    227c:	0901                	addi	s2,s2,0
    227e:	0004                	0x4
    2280:	0301                	addi	t1,t1,0
    2282:	00060907          	0x60907
    2286:	0301                	addi	t1,t1,0
    2288:	0901                	addi	s2,s2,0
    228a:	0002                	c.slli64	zero
    228c:	0301                	addi	t1,t1,0
    228e:	0979                	addi	s2,s2,30
    2290:	0004                	0x4
    2292:	0301                	addi	t1,t1,0
    2294:	0906                	slli	s2,s2,0x1
    2296:	0004                	0x4
    2298:	0301                	addi	t1,t1,0
    229a:	0901                	addi	s2,s2,0
    229c:	000a                	c.slli	zero,0x2
    229e:	0301                	addi	t1,t1,0
    22a0:	0901                	addi	s2,s2,0
    22a2:	0004                	0x4
    22a4:	0301                	addi	t1,t1,0
    22a6:	0901                	addi	s2,s2,0
    22a8:	0006                	c.slli	zero,0x1
    22aa:	0301                	addi	t1,t1,0
    22ac:	0901                	addi	s2,s2,0
    22ae:	0008                	0x8
    22b0:	0301                	addi	t1,t1,0
    22b2:	0901                	addi	s2,s2,0
    22b4:	0008                	0x8
    22b6:	0301                	addi	t1,t1,0
    22b8:	0901                	addi	s2,s2,0
    22ba:	0006                	c.slli	zero,0x1
    22bc:	0301                	addi	t1,t1,0
    22be:	097f                	0x97f
    22c0:	0004                	0x4
    22c2:	0301                	addi	t1,t1,0
    22c4:	0901                	addi	s2,s2,0
    22c6:	0002                	c.slli64	zero
    22c8:	0301                	addi	t1,t1,0
    22ca:	0902                	c.slli64	s2
    22cc:	0006                	c.slli	zero,0x1
    22ce:	0301                	addi	t1,t1,0
    22d0:	0901                	addi	s2,s2,0
    22d2:	0004                	0x4
    22d4:	0301                	addi	t1,t1,0
    22d6:	097f                	0x97f
    22d8:	0004                	0x4
    22da:	0301                	addi	t1,t1,0
    22dc:	0901                	addi	s2,s2,0
    22de:	0002                	c.slli64	zero
    22e0:	0301                	addi	t1,t1,0
    22e2:	00060973          	0x60973
    22e6:	0301                	addi	t1,t1,0
    22e8:	0928                	addi	a0,sp,152
    22ea:	000c                	0xc
    22ec:	0301                	addi	t1,t1,0
    22ee:	096a                	slli	s2,s2,0x1a
    22f0:	001a                	c.slli	zero,0x6
    22f2:	0301                	addi	t1,t1,0
    22f4:	0902                	c.slli64	s2
    22f6:	0004                	0x4
    22f8:	0301                	addi	t1,t1,0
    22fa:	097e                	slli	s2,s2,0x1f
    22fc:	0002                	c.slli64	zero
    22fe:	0301                	addi	t1,t1,0
    2300:	0901                	addi	s2,s2,0
    2302:	0004                	0x4
    2304:	0301                	addi	t1,t1,0
    2306:	0906                	slli	s2,s2,0x1
    2308:	000e                	c.slli	zero,0x3
    230a:	0301                	addi	t1,t1,0
    230c:	0902                	c.slli64	s2
    230e:	0006                	c.slli	zero,0x1
    2310:	0301                	addi	t1,t1,0
    2312:	097e                	slli	s2,s2,0x1f
    2314:	0002                	c.slli64	zero
    2316:	0301                	addi	t1,t1,0
    2318:	0901                	addi	s2,s2,0
    231a:	0004                	0x4
    231c:	0301                	addi	t1,t1,0
    231e:	0906                	slli	s2,s2,0x1
    2320:	000e                	c.slli	zero,0x3
    2322:	0301                	addi	t1,t1,0
    2324:	0902                	c.slli64	s2
    2326:	0006                	c.slli	zero,0x1
    2328:	0301                	addi	t1,t1,0
    232a:	097e                	slli	s2,s2,0x1f
    232c:	0002                	c.slli64	zero
    232e:	0301                	addi	t1,t1,0
    2330:	0901                	addi	s2,s2,0
    2332:	0004                	0x4
    2334:	0301                	addi	t1,t1,0
    2336:	090a                	slli	s2,s2,0x2
    2338:	000e                	c.slli	zero,0x3
    233a:	0301                	addi	t1,t1,0
    233c:	0900                	addi	s0,sp,144
    233e:	0006                	c.slli	zero,0x1
    2340:	0301                	addi	t1,t1,0
    2342:	00020903          	lb	s2,0(tp) # 0 <_prog_start-0x20000000>
    2346:	0301                	addi	t1,t1,0
    2348:	0901                	addi	s2,s2,0
    234a:	0002                	c.slli64	zero
    234c:	0301                	addi	t1,t1,0
    234e:	0904                	addi	s1,sp,144
    2350:	0002                	c.slli64	zero
    2352:	0301                	addi	t1,t1,0
    2354:	097e                	slli	s2,s2,0x1f
    2356:	0008                	0x8
    2358:	0301                	addi	t1,t1,0
    235a:	0902                	c.slli64	s2
    235c:	0002                	c.slli64	zero
    235e:	0301                	addi	t1,t1,0
    2360:	097e                	slli	s2,s2,0x1f
    2362:	0006                	c.slli	zero,0x1
    2364:	0301                	addi	t1,t1,0
    2366:	0905                	addi	s2,s2,1
    2368:	0002                	c.slli64	zero
    236a:	0301                	addi	t1,t1,0
    236c:	0904                	addi	s1,sp,144
    236e:	0000                	unimp
    2370:	0301                	addi	t1,t1,0
    2372:	097c                	addi	a5,sp,156
    2374:	0006                	c.slli	zero,0x1
    2376:	0301                	addi	t1,t1,0
    2378:	0904                	addi	s1,sp,144
    237a:	0006                	c.slli	zero,0x1
    237c:	0301                	addi	t1,t1,0
    237e:	0901                	addi	s2,s2,0
    2380:	0004                	0x4
    2382:	0301                	addi	t1,t1,0
    2384:	0909                	addi	s2,s2,2
    2386:	0002                	c.slli64	zero
    2388:	0301                	addi	t1,t1,0
    238a:	00040977          	0x40977
    238e:	0301                	addi	t1,t1,0
    2390:	0901                	addi	s2,s2,0
    2392:	0004                	0x4
    2394:	0301                	addi	t1,t1,0
    2396:	0915                	addi	s2,s2,5
    2398:	0002                	c.slli64	zero
    239a:	0301                	addi	t1,t1,0
    239c:	0004096b          	0x4096b
    23a0:	0301                	addi	t1,t1,0
    23a2:	0901                	addi	s2,s2,0
    23a4:	0006                	c.slli	zero,0x1
    23a6:	0301                	addi	t1,t1,0
    23a8:	0901                	addi	s2,s2,0
    23aa:	0008                	0x8
    23ac:	0301                	addi	t1,t1,0
    23ae:	0901                	addi	s2,s2,0
    23b0:	0008                	0x8
    23b2:	0301                	addi	t1,t1,0
    23b4:	0901                	addi	s2,s2,0
    23b6:	0008                	0x8
    23b8:	0301                	addi	t1,t1,0
    23ba:	0901                	addi	s2,s2,0
    23bc:	0008                	0x8
    23be:	0301                	addi	t1,t1,0
    23c0:	0901                	addi	s2,s2,0
    23c2:	0008                	0x8
    23c4:	0301                	addi	t1,t1,0
    23c6:	0902                	c.slli64	s2
    23c8:	0008                	0x8
    23ca:	0301                	addi	t1,t1,0
    23cc:	0902                	c.slli64	s2
    23ce:	0006                	c.slli	zero,0x1
    23d0:	0301                	addi	t1,t1,0
    23d2:	0901                	addi	s2,s2,0
    23d4:	0006                	c.slli	zero,0x1
    23d6:	0301                	addi	t1,t1,0
    23d8:	0901                	addi	s2,s2,0
    23da:	0004                	0x4
    23dc:	0301                	addi	t1,t1,0
    23de:	0904                	addi	s1,sp,144
    23e0:	0006                	c.slli	zero,0x1
    23e2:	0301                	addi	t1,t1,0
    23e4:	00040903          	lb	s2,0(s0) # ffff8000 <_sp+0x7fff4000>
    23e8:	0001                	nop
    23ea:	0402                	c.slli64	s0
    23ec:	0301                	addi	t1,t1,0
    23ee:	0902                	c.slli64	s2
    23f0:	0006                	c.slli	zero,0x1
    23f2:	0301                	addi	t1,t1,0
    23f4:	0901                	addi	s2,s2,0
    23f6:	0006                	c.slli	zero,0x1
    23f8:	0301                	addi	t1,t1,0
    23fa:	0901                	addi	s2,s2,0
    23fc:	000c                	0xc
    23fe:	0301                	addi	t1,t1,0
    2400:	0901                	addi	s2,s2,0
    2402:	0012                	c.slli	zero,0x4
    2404:	0301                	addi	t1,t1,0
    2406:	0901                	addi	s2,s2,0
    2408:	0012                	c.slli	zero,0x4
    240a:	0301                	addi	t1,t1,0
    240c:	0901                	addi	s2,s2,0
    240e:	0012                	c.slli	zero,0x4
    2410:	0301                	addi	t1,t1,0
    2412:	00080903          	lb	s2,0(a6)
    2416:	0901                	addi	s2,s2,0
    2418:	000a                	c.slli	zero,0x2
    241a:	0100                	addi	s0,sp,128
    241c:	aa01                	j	252c <_prog_start-0x1fffdad4>
    241e:	02000003          	lb	zero,32(zero) # 20 <_prog_start-0x1fffffe0>
    2422:	5200                	lw	s0,32(a2)
    2424:	0000                	unimp
    2426:	0100                	addi	s0,sp,128
    2428:	fb01                	bnez	a4,2338 <_prog_start-0x1fffdcc8>
    242a:	0d0e                	slli	s10,s10,0x3
    242c:	0100                	addi	s0,sp,128
    242e:	0101                	addi	sp,sp,0
    2430:	0001                	nop
    2432:	0000                	unimp
    2434:	0001                	nop
    2436:	0100                	addi	s0,sp,128
    2438:	7263732f          	0x7263732f
    243c:	7461                	lui	s0,0xffff8
    243e:	612f6863          	bltu	t5,s2,2a4e <_prog_start-0x1fffd5b2>
    2442:	7568                	flw	fa0,108(a0)
    2444:	746e                	flw	fs0,248(sp)
    2446:	6e69                	lui	t3,0x1a
    2448:	6e6f7467          	0x6e6f7467
    244c:	6465662f          	0x6465662f
    2450:	7265                	lui	tp,0xffff9
    2452:	7461                	lui	s0,0xffff8
    2454:	6f69                	lui	t5,0x1a
    2456:	2f6e                	fld	ft10,216(sp)
    2458:	74666f73          	csrrsi	t5,0x746,12
    245c:	65726177          	0x65726177
    2460:	7365742f          	0x7365742f
    2464:	7374                	flw	fa3,100(a4)
    2466:	6d6f632f          	0x6d6f632f
    246a:	6f6d                	lui	t5,0x1b
    246c:	006e                	c.slli	zero,0x1b
    246e:	6300                	flw	fs0,0(a4)
    2470:	7472                	flw	fs0,60(sp)
    2472:	532e                	lw	t1,232(sp)
    2474:	0100                	addi	s0,sp,128
    2476:	0000                	unimp
    2478:	0000                	unimp
    247a:	0205                	addi	tp,tp,1
    247c:	0000                	unimp
    247e:	2000                	fld	fs0,0(s0)
    2480:	03011403          	lh	s0,48(sp)
    2484:	0901                	addi	s2,s2,0
    2486:	0004                	0x4
    2488:	0301                	addi	t1,t1,0
    248a:	0901                	addi	s2,s2,0
    248c:	0002                	c.slli64	zero
    248e:	0301                	addi	t1,t1,0
    2490:	0901                	addi	s2,s2,0
    2492:	0002                	c.slli64	zero
    2494:	0301                	addi	t1,t1,0
    2496:	0901                	addi	s2,s2,0
    2498:	0002                	c.slli64	zero
    249a:	0301                	addi	t1,t1,0
    249c:	0901                	addi	s2,s2,0
    249e:	0002                	c.slli64	zero
    24a0:	0301                	addi	t1,t1,0
    24a2:	0901                	addi	s2,s2,0
    24a4:	0002                	c.slli64	zero
    24a6:	0301                	addi	t1,t1,0
    24a8:	0901                	addi	s2,s2,0
    24aa:	0002                	c.slli64	zero
    24ac:	0301                	addi	t1,t1,0
    24ae:	0901                	addi	s2,s2,0
    24b0:	0002                	c.slli64	zero
    24b2:	0301                	addi	t1,t1,0
    24b4:	0901                	addi	s2,s2,0
    24b6:	0002                	c.slli64	zero
    24b8:	0301                	addi	t1,t1,0
    24ba:	0904                	addi	s1,sp,144
    24bc:	0002                	c.slli64	zero
    24be:	0301                	addi	t1,t1,0
    24c0:	0901                	addi	s2,s2,0
    24c2:	0002                	c.slli64	zero
    24c4:	0301                	addi	t1,t1,0
    24c6:	0901                	addi	s2,s2,0
    24c8:	0002                	c.slli64	zero
    24ca:	0301                	addi	t1,t1,0
    24cc:	0901                	addi	s2,s2,0
    24ce:	0002                	c.slli64	zero
    24d0:	0301                	addi	t1,t1,0
    24d2:	0901                	addi	s2,s2,0
    24d4:	0002                	c.slli64	zero
    24d6:	0301                	addi	t1,t1,0
    24d8:	0901                	addi	s2,s2,0
    24da:	0002                	c.slli64	zero
    24dc:	0301                	addi	t1,t1,0
    24de:	0901                	addi	s2,s2,0
    24e0:	0002                	c.slli64	zero
    24e2:	0301                	addi	t1,t1,0
    24e4:	0901                	addi	s2,s2,0
    24e6:	0002                	c.slli64	zero
    24e8:	0301                	addi	t1,t1,0
    24ea:	0901                	addi	s2,s2,0
    24ec:	0002                	c.slli64	zero
    24ee:	0301                	addi	t1,t1,0
    24f0:	0901                	addi	s2,s2,0
    24f2:	0002                	c.slli64	zero
    24f4:	0301                	addi	t1,t1,0
    24f6:	0901                	addi	s2,s2,0
    24f8:	0002                	c.slli64	zero
    24fa:	0301                	addi	t1,t1,0
    24fc:	0901                	addi	s2,s2,0
    24fe:	0002                	c.slli64	zero
    2500:	0301                	addi	t1,t1,0
    2502:	0901                	addi	s2,s2,0
    2504:	0002                	c.slli64	zero
    2506:	0301                	addi	t1,t1,0
    2508:	0901                	addi	s2,s2,0
    250a:	0002                	c.slli64	zero
    250c:	0301                	addi	t1,t1,0
    250e:	0901                	addi	s2,s2,0
    2510:	0002                	c.slli64	zero
    2512:	0301                	addi	t1,t1,0
    2514:	0901                	addi	s2,s2,0
    2516:	0002                	c.slli64	zero
    2518:	0301                	addi	t1,t1,0
    251a:	0901                	addi	s2,s2,0
    251c:	0002                	c.slli64	zero
    251e:	0301                	addi	t1,t1,0
    2520:	0901                	addi	s2,s2,0
    2522:	0002                	c.slli64	zero
    2524:	0301                	addi	t1,t1,0
    2526:	0901                	addi	s2,s2,0
    2528:	0002                	c.slli64	zero
    252a:	0301                	addi	t1,t1,0
    252c:	0901                	addi	s2,s2,0
    252e:	0002                	c.slli64	zero
    2530:	0301                	addi	t1,t1,0
    2532:	0904                	addi	s1,sp,144
    2534:	0002                	c.slli64	zero
    2536:	0301                	addi	t1,t1,0
    2538:	0908                	addi	a0,sp,144
    253a:	0008                	0x8
    253c:	0301                	addi	t1,t1,0
    253e:	0901                	addi	s2,s2,0
    2540:	0008                	0x8
    2542:	0301                	addi	t1,t1,0
    2544:	0902                	c.slli64	s2
    2546:	0004                	0x4
    2548:	0301                	addi	t1,t1,0
    254a:	0902                	c.slli64	s2
    254c:	0010                	0x10
    254e:	0301                	addi	t1,t1,0
    2550:	0901                	addi	s2,s2,0
    2552:	0008                	0x8
    2554:	0301                	addi	t1,t1,0
    2556:	0901                	addi	s2,s2,0
    2558:	0008                	0x8
    255a:	0301                	addi	t1,t1,0
    255c:	0901                	addi	s2,s2,0
    255e:	0004                	0x4
    2560:	0301                	addi	t1,t1,0
    2562:	0901                	addi	s2,s2,0
    2564:	0004                	0x4
    2566:	0301                	addi	t1,t1,0
    2568:	0902                	c.slli64	s2
    256a:	0004                	0x4
    256c:	0301                	addi	t1,t1,0
    256e:	0901                	addi	s2,s2,0
    2570:	0004                	0x4
    2572:	0301                	addi	t1,t1,0
    2574:	0901                	addi	s2,s2,0
    2576:	0004                	0x4
    2578:	0301                	addi	t1,t1,0
    257a:	0901                	addi	s2,s2,0
    257c:	0002                	c.slli64	zero
    257e:	0301                	addi	t1,t1,0
    2580:	0901                	addi	s2,s2,0
    2582:	0002                	c.slli64	zero
    2584:	0301                	addi	t1,t1,0
    2586:	00040903          	lb	s2,0(s0) # ffff8000 <_sp+0x7fff4000>
    258a:	0301                	addi	t1,t1,0
    258c:	0901                	addi	s2,s2,0
    258e:	0004                	0x4
    2590:	0301                	addi	t1,t1,0
    2592:	0901                	addi	s2,s2,0
    2594:	0004                	0x4
    2596:	0301                	addi	t1,t1,0
    2598:	0902                	c.slli64	s2
    259a:	0004                	0x4
    259c:	0301                	addi	t1,t1,0
    259e:	0901                	addi	s2,s2,0
    25a0:	0004                	0x4
    25a2:	0301                	addi	t1,t1,0
    25a4:	0901                	addi	s2,s2,0
    25a6:	0002                	c.slli64	zero
    25a8:	0301                	addi	t1,t1,0
    25aa:	0902                	c.slli64	s2
    25ac:	0004                	0x4
    25ae:	0301                	addi	t1,t1,0
    25b0:	0901                	addi	s2,s2,0
    25b2:	004e                	c.slli	zero,0x13
    25b4:	0301                	addi	t1,t1,0
    25b6:	0901                	addi	s2,s2,0
    25b8:	0008                	0x8
    25ba:	0301                	addi	t1,t1,0
    25bc:	0901                	addi	s2,s2,0
    25be:	0004                	0x4
    25c0:	0301                	addi	t1,t1,0
    25c2:	0901                	addi	s2,s2,0
    25c4:	0004                	0x4
    25c6:	0301                	addi	t1,t1,0
    25c8:	0902                	c.slli64	s2
    25ca:	0004                	0x4
    25cc:	0301                	addi	t1,t1,0
    25ce:	0901                	addi	s2,s2,0
    25d0:	0002                	c.slli64	zero
    25d2:	0301                	addi	t1,t1,0
    25d4:	0901                	addi	s2,s2,0
    25d6:	0004                	0x4
    25d8:	0301                	addi	t1,t1,0
    25da:	0901                	addi	s2,s2,0
    25dc:	0002                	c.slli64	zero
    25de:	0301                	addi	t1,t1,0
    25e0:	0904                	addi	s1,sp,144
    25e2:	0002                	c.slli64	zero
    25e4:	0301                	addi	t1,t1,0
    25e6:	0905                	addi	s2,s2,1
    25e8:	0002                	c.slli64	zero
    25ea:	0301                	addi	t1,t1,0
    25ec:	0901                	addi	s2,s2,0
    25ee:	0002                	c.slli64	zero
    25f0:	0301                	addi	t1,t1,0
    25f2:	0902                	c.slli64	s2
    25f4:	0002                	c.slli64	zero
    25f6:	0301                	addi	t1,t1,0
    25f8:	0902                	c.slli64	s2
    25fa:	001a                	c.slli	zero,0x6
    25fc:	0301                	addi	t1,t1,0
    25fe:	00180903          	lb	s2,1(a6)
    2602:	0301                	addi	t1,t1,0
    2604:	0901                	addi	s2,s2,0
    2606:	0004                	0x4
    2608:	0301                	addi	t1,t1,0
    260a:	0901                	addi	s2,s2,0
    260c:	0002                	c.slli64	zero
    260e:	0301                	addi	t1,t1,0
    2610:	0901                	addi	s2,s2,0
    2612:	0002                	c.slli64	zero
    2614:	0301                	addi	t1,t1,0
    2616:	0901                	addi	s2,s2,0
    2618:	0002                	c.slli64	zero
    261a:	0301                	addi	t1,t1,0
    261c:	0906                	slli	s2,s2,0x1
    261e:	001a                	c.slli	zero,0x6
    2620:	0301                	addi	t1,t1,0
    2622:	0901                	addi	s2,s2,0
    2624:	0004                	0x4
    2626:	0301                	addi	t1,t1,0
    2628:	0905                	addi	s2,s2,1
    262a:	0010                	0x10
    262c:	0301                	addi	t1,t1,0
    262e:	0901                	addi	s2,s2,0
    2630:	0002                	c.slli64	zero
    2632:	0301                	addi	t1,t1,0
    2634:	0901                	addi	s2,s2,0
    2636:	0002                	c.slli64	zero
    2638:	0301                	addi	t1,t1,0
    263a:	0901                	addi	s2,s2,0
    263c:	0002                	c.slli64	zero
    263e:	0301                	addi	t1,t1,0
    2640:	0901                	addi	s2,s2,0
    2642:	0002                	c.slli64	zero
    2644:	0301                	addi	t1,t1,0
    2646:	0901                	addi	s2,s2,0
    2648:	0002                	c.slli64	zero
    264a:	0301                	addi	t1,t1,0
    264c:	0901                	addi	s2,s2,0
    264e:	0002                	c.slli64	zero
    2650:	0301                	addi	t1,t1,0
    2652:	0901                	addi	s2,s2,0
    2654:	0002                	c.slli64	zero
    2656:	0301                	addi	t1,t1,0
    2658:	0901                	addi	s2,s2,0
    265a:	0002                	c.slli64	zero
    265c:	0301                	addi	t1,t1,0
    265e:	0901                	addi	s2,s2,0
    2660:	0002                	c.slli64	zero
    2662:	0301                	addi	t1,t1,0
    2664:	0901                	addi	s2,s2,0
    2666:	0002                	c.slli64	zero
    2668:	0301                	addi	t1,t1,0
    266a:	0901                	addi	s2,s2,0
    266c:	0002                	c.slli64	zero
    266e:	0301                	addi	t1,t1,0
    2670:	0901                	addi	s2,s2,0
    2672:	0002                	c.slli64	zero
    2674:	0301                	addi	t1,t1,0
    2676:	0901                	addi	s2,s2,0
    2678:	0002                	c.slli64	zero
    267a:	0301                	addi	t1,t1,0
    267c:	0901                	addi	s2,s2,0
    267e:	0002                	c.slli64	zero
    2680:	0301                	addi	t1,t1,0
    2682:	0901                	addi	s2,s2,0
    2684:	0002                	c.slli64	zero
    2686:	0301                	addi	t1,t1,0
    2688:	0901                	addi	s2,s2,0
    268a:	0002                	c.slli64	zero
    268c:	0301                	addi	t1,t1,0
    268e:	0901                	addi	s2,s2,0
    2690:	0002                	c.slli64	zero
    2692:	0301                	addi	t1,t1,0
    2694:	0901                	addi	s2,s2,0
    2696:	0002                	c.slli64	zero
    2698:	0301                	addi	t1,t1,0
    269a:	0901                	addi	s2,s2,0
    269c:	0002                	c.slli64	zero
    269e:	0301                	addi	t1,t1,0
    26a0:	0901                	addi	s2,s2,0
    26a2:	0002                	c.slli64	zero
    26a4:	0301                	addi	t1,t1,0
    26a6:	0901                	addi	s2,s2,0
    26a8:	0002                	c.slli64	zero
    26aa:	0301                	addi	t1,t1,0
    26ac:	0901                	addi	s2,s2,0
    26ae:	0002                	c.slli64	zero
    26b0:	0301                	addi	t1,t1,0
    26b2:	0901                	addi	s2,s2,0
    26b4:	0002                	c.slli64	zero
    26b6:	0301                	addi	t1,t1,0
    26b8:	0901                	addi	s2,s2,0
    26ba:	0002                	c.slli64	zero
    26bc:	0301                	addi	t1,t1,0
    26be:	0901                	addi	s2,s2,0
    26c0:	0002                	c.slli64	zero
    26c2:	0301                	addi	t1,t1,0
    26c4:	0901                	addi	s2,s2,0
    26c6:	0002                	c.slli64	zero
    26c8:	0301                	addi	t1,t1,0
    26ca:	0901                	addi	s2,s2,0
    26cc:	0002                	c.slli64	zero
    26ce:	0301                	addi	t1,t1,0
    26d0:	0901                	addi	s2,s2,0
    26d2:	0002                	c.slli64	zero
    26d4:	0301                	addi	t1,t1,0
    26d6:	0901                	addi	s2,s2,0
    26d8:	0002                	c.slli64	zero
    26da:	0301                	addi	t1,t1,0
    26dc:	0901                	addi	s2,s2,0
    26de:	0002                	c.slli64	zero
    26e0:	0301                	addi	t1,t1,0
    26e2:	0902                	c.slli64	s2
    26e4:	0002                	c.slli64	zero
    26e6:	0301                	addi	t1,t1,0
    26e8:	0901                	addi	s2,s2,0
    26ea:	0002                	c.slli64	zero
    26ec:	0301                	addi	t1,t1,0
    26ee:	0902                	c.slli64	s2
    26f0:	0004                	0x4
    26f2:	0301                	addi	t1,t1,0
    26f4:	0901                	addi	s2,s2,0
    26f6:	0002                	c.slli64	zero
    26f8:	0301                	addi	t1,t1,0
    26fa:	0901                	addi	s2,s2,0
    26fc:	0002                	c.slli64	zero
    26fe:	0301                	addi	t1,t1,0
    2700:	0901                	addi	s2,s2,0
    2702:	0002                	c.slli64	zero
    2704:	0301                	addi	t1,t1,0
    2706:	0901                	addi	s2,s2,0
    2708:	0002                	c.slli64	zero
    270a:	0301                	addi	t1,t1,0
    270c:	0901                	addi	s2,s2,0
    270e:	0002                	c.slli64	zero
    2710:	0301                	addi	t1,t1,0
    2712:	0901                	addi	s2,s2,0
    2714:	0002                	c.slli64	zero
    2716:	0301                	addi	t1,t1,0
    2718:	0901                	addi	s2,s2,0
    271a:	0002                	c.slli64	zero
    271c:	0301                	addi	t1,t1,0
    271e:	0901                	addi	s2,s2,0
    2720:	0002                	c.slli64	zero
    2722:	0301                	addi	t1,t1,0
    2724:	0901                	addi	s2,s2,0
    2726:	0002                	c.slli64	zero
    2728:	0301                	addi	t1,t1,0
    272a:	0901                	addi	s2,s2,0
    272c:	0002                	c.slli64	zero
    272e:	0301                	addi	t1,t1,0
    2730:	0901                	addi	s2,s2,0
    2732:	0002                	c.slli64	zero
    2734:	0301                	addi	t1,t1,0
    2736:	0901                	addi	s2,s2,0
    2738:	0002                	c.slli64	zero
    273a:	0301                	addi	t1,t1,0
    273c:	0901                	addi	s2,s2,0
    273e:	0002                	c.slli64	zero
    2740:	0301                	addi	t1,t1,0
    2742:	0901                	addi	s2,s2,0
    2744:	0002                	c.slli64	zero
    2746:	0301                	addi	t1,t1,0
    2748:	0901                	addi	s2,s2,0
    274a:	0002                	c.slli64	zero
    274c:	0301                	addi	t1,t1,0
    274e:	0901                	addi	s2,s2,0
    2750:	0002                	c.slli64	zero
    2752:	0301                	addi	t1,t1,0
    2754:	0901                	addi	s2,s2,0
    2756:	0002                	c.slli64	zero
    2758:	0301                	addi	t1,t1,0
    275a:	0901                	addi	s2,s2,0
    275c:	0002                	c.slli64	zero
    275e:	0301                	addi	t1,t1,0
    2760:	0901                	addi	s2,s2,0
    2762:	0002                	c.slli64	zero
    2764:	0301                	addi	t1,t1,0
    2766:	0901                	addi	s2,s2,0
    2768:	0002                	c.slli64	zero
    276a:	0301                	addi	t1,t1,0
    276c:	0901                	addi	s2,s2,0
    276e:	0002                	c.slli64	zero
    2770:	0301                	addi	t1,t1,0
    2772:	0901                	addi	s2,s2,0
    2774:	0002                	c.slli64	zero
    2776:	0301                	addi	t1,t1,0
    2778:	0901                	addi	s2,s2,0
    277a:	0002                	c.slli64	zero
    277c:	0301                	addi	t1,t1,0
    277e:	0901                	addi	s2,s2,0
    2780:	0002                	c.slli64	zero
    2782:	0301                	addi	t1,t1,0
    2784:	0901                	addi	s2,s2,0
    2786:	0002                	c.slli64	zero
    2788:	0301                	addi	t1,t1,0
    278a:	0901                	addi	s2,s2,0
    278c:	0002                	c.slli64	zero
    278e:	0301                	addi	t1,t1,0
    2790:	0901                	addi	s2,s2,0
    2792:	0002                	c.slli64	zero
    2794:	0301                	addi	t1,t1,0
    2796:	0901                	addi	s2,s2,0
    2798:	0002                	c.slli64	zero
    279a:	0301                	addi	t1,t1,0
    279c:	0901                	addi	s2,s2,0
    279e:	0002                	c.slli64	zero
    27a0:	0301                	addi	t1,t1,0
    27a2:	0901                	addi	s2,s2,0
    27a4:	0002                	c.slli64	zero
    27a6:	0301                	addi	t1,t1,0
    27a8:	0901                	addi	s2,s2,0
    27aa:	0002                	c.slli64	zero
    27ac:	0301                	addi	t1,t1,0
    27ae:	0906                	slli	s2,s2,0x1
    27b0:	0004                	0x4
    27b2:	0301                	addi	t1,t1,0
    27b4:	0901                	addi	s2,s2,0
    27b6:	0004                	0x4
    27b8:	0301                	addi	t1,t1,0
    27ba:	0901                	addi	s2,s2,0
    27bc:	0004                	0x4
    27be:	0301                	addi	t1,t1,0
    27c0:	0902                	c.slli64	s2
    27c2:	0002                	c.slli64	zero
    27c4:	0901                	addi	s2,s2,0
    27c6:	0002                	c.slli64	zero
    27c8:	0100                	addi	s0,sp,128
    27ca:	01              	Address 0x00000000000027ca is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6f5f 5f6e 7865      	0x78655f6e6f5f
   6:	7469                	lui	s0,0xffffa
   8:	615f 6772 0073      	0x736772615f
   e:	775f 7463 6d6f      	0x6d6f7463775f
  14:	5f62                	lw	t5,56(sp)
  16:	74617473          	csrrci	s0,0x746,2
  1a:	0065                	c.nop	25
  1c:	6f74706f          	j	47f12 <_prog_start-0x1ffb80ee>
  20:	7470                	flw	fa2,108(s0)
  22:	5f00                	lw	s0,56(a4)
  24:	3472                	fld	fs0,312(sp)
  26:	0038                	addi	a4,sp,8
  28:	735f 6769 616e      	0x616e6769735f
  2e:	5f6c                	lw	a1,124(a4)
  30:	7562                	flw	fa0,56(sp)
  32:	0066                	c.slli	zero,0x19
  34:	6c5f 6662 6973      	0x697366626c5f
  3a:	657a                	flw	fa0,156(sp)
  3c:	5f00                	lw	s0,56(a4)
  3e:	6c66                	flw	fs8,88(sp)
  40:	6761                	lui	a4,0x18
  42:	61730073          	0x61730073
  46:	6576                	flw	fa0,92(sp)
  48:	5f00                	lw	s0,56(a4)
  4a:	4f4c                	lw	a1,28(a4)
  4c:	525f4b43          	fmadd.d	fs6,ft10,ft5,fa0,rmm
  50:	4345                	li	t1,17
  52:	5255                	li	tp,-11
  54:	45564953          	0x45564953
  58:	545f 5f00 6572      	0x65725f00545f
  5e:	6461                	lui	s0,0x18
  60:	5f00                	lw	s0,56(a4)
  62:	626d                	lui	tp,0x1b
  64:	6c72                	flw	fs8,28(sp)
  66:	6e65                	lui	t3,0x19
  68:	735f 6174 6574      	0x65746174735f
  6e:	5f00                	lw	s0,56(a4)
  70:	6f647473          	csrrci	s0,0x6f6,8
  74:	7475                	lui	s0,0xffffd
  76:	5f00                	lw	s0,56(a4)
  78:	7066                	flw	ft0,120(sp)
  7a:	745f736f          	jal	t1,f7fbe <_prog_start-0x1ff08042>
  7e:	5f00                	lw	s0,56(a4)
  80:	6e66                	flw	ft8,88(sp)
  82:	635f0073          	0x635f0073
  86:	696b6f6f          	jal	t5,b671c <_prog_start-0x1ff498e4>
  8a:	0065                	c.nop	25
  8c:	675f 6f6c 6162      	0x61626f6c675f
  92:	5f6c                	lw	a1,124(a4)
  94:	6d69                	lui	s10,0x1a
  96:	7570                	flw	fa2,108(a0)
  98:	6572                	flw	fa0,28(sp)
  9a:	705f 7274 2f00      	0x2f007274705f
  a0:	61726373          	csrrsi	t1,0x617,4
  a4:	6374                	flw	fa3,68(a4)
  a6:	2f68                	fld	fa0,216(a4)
  a8:	6861                	lui	a6,0x18
  aa:	6e75                	lui	t3,0x1d
  ac:	6974                	flw	fa3,84(a0)
  ae:	676e                	flw	fa4,216(sp)
  b0:	6f74                	flw	fa3,92(a4)
  b2:	2f6e                	fld	ft10,216(sp)
  b4:	6566                	flw	fa0,88(sp)
  b6:	6564                	flw	fs1,76(a0)
  b8:	6172                	flw	ft2,28(sp)
  ba:	6974                	flw	fa3,84(a0)
  bc:	622f6e6f          	jal	t3,f66de <_prog_start-0x1ff09922>
  c0:	6975                	lui	s2,0x1d
  c2:	646c                	flw	fa1,76(s0)
  c4:	75672f73          	csrrs	t5,0x756,a4
  c8:	7661                	lui	a2,0xffff8
  ca:	5f61                	li	t5,-8
  cc:	7361                	lui	t1,0xffff8
  ce:	6369                	lui	t1,0x1a
  d0:	2f2e2e2f          	0x2f2e2e2f
  d4:	2e2e                	fld	ft8,200(sp)
  d6:	666f732f          	0x666f732f
  da:	7774                	flw	fa3,108(a4)
  dc:	7261                	lui	tp,0xffff8
  de:	2f65                	jal	896 <_prog_start-0x1ffff76a>
  e0:	6574                	flw	fa3,76(a0)
  e2:	2f737473          	csrrci	s0,0x2f7,6
  e6:	6968                	flw	fa0,84(a0)
  e8:	6966                	flw	fs2,88(sp)
  ea:	6576                	flw	fa0,92(sp)
  ec:	725f 7665 5f62      	0x5f627665725f
  f2:	6f62                	flw	ft10,24(sp)
  f4:	6f6c746f          	jal	s0,c77ea <_prog_start-0x1ff38816>
  f8:	6461                	lui	s0,0x18
  fa:	7265                	lui	tp,0xffff9
  fc:	6669682f          	0x6669682f
 100:	7669                	lui	a2,0xffffa
 102:	5f65                	li	t5,-7
 104:	6572                	flw	fa0,28(sp)
 106:	6276                	flw	ft4,92(sp)
 108:	625f 6f6f 6c74      	0x6c746f6f625f
 10e:	6564616f          	jal	sp,46764 <_prog_start-0x1ffb989c>
 112:	2e72                	fld	ft8,280(sp)
 114:	425f0063          	beq	t5,t0,534 <_prog_start-0x1ffffacc>
 118:	6769                	lui	a4,0x1a
 11a:	6e69                	lui	t3,0x1a
 11c:	0074                	addi	a3,sp,12
 11e:	5f5f 6d74 775f      	0x775f6d745f5f
 124:	6164                	flw	fs1,68(a0)
 126:	0079                	c.nop	30
 128:	725f 7365 6c75      	0x6c757365725f
 12e:	0074                	addi	a3,sp,12
 130:	5f5f 6d74 685f      	0x685f6d745f5f
 136:	0072756f          	jal	a0,2793c <_prog_start-0x1ffd86c4>
 13a:	5f5f 6f63 6e75      	0x6e756f635f5f
 140:	0074                	addi	a3,sp,12
 142:	6574706f          	j	47f98 <_prog_start-0x1ffb8068>
 146:	7272                	flw	ft4,60(sp)
 148:	5f00                	lw	s0,56(a4)
 14a:	745f 5f6d 696d      	0x696d5f6d745f
 150:	006e                	c.slli	zero,0x1b
 152:	6e5f 7865 6674      	0x667478656e5f
 158:	5f00                	lw	s0,56(a4)
 15a:	6172                	flw	ft2,28(sp)
 15c:	646e                	flw	fs0,216(sp)
 15e:	3834                	fld	fa3,112(s0)
 160:	5f00                	lw	s0,56(a4)
 162:	6572                	flw	fa0,28(sp)
 164:	746c7573          	csrrci	a0,0x746,24
 168:	6b5f 6c00 6e6f      	0x6e6f6c006b5f
 16e:	6f6c2067          	0x6f6c2067
 172:	676e                	flw	fa4,216(sp)
 174:	7520                	flw	fs0,104(a0)
 176:	736e                	flw	ft6,248(sp)
 178:	6769                	lui	a4,0x1a
 17a:	656e                	flw	fa0,216(sp)
 17c:	2064                	fld	fs1,192(s0)
 17e:	6e69                	lui	t3,0x1a
 180:	0074                	addi	a3,sp,12
 182:	615f 6373 6974      	0x69746373615f
 188:	656d                	lui	a0,0x1b
 18a:	625f 6675 5f00      	0x5f006675625f
 190:	735f 4946 454c      	0x454c4946735f
 196:	5f00                	lw	s0,56(a4)
 198:	00736477          	0x736477
 19c:	5f5f 4946 454c      	0x454c49465f5f
 1a2:	5f00                	lw	s0,56(a4)
 1a4:	5f68                	lw	a0,124(a4)
 1a6:	7265                	lui	tp,0xffff9
 1a8:	6e72                	flw	ft8,28(sp)
 1aa:	6f5f006f          	j	f109e <_prog_start-0x1ff0ef62>
 1ae:	6666                	flw	fa2,88(sp)
 1b0:	00746573          	csrrsi	a0,0x7,8
 1b4:	655f 656d 6772      	0x6772656d655f
 1ba:	6e65                	lui	t3,0x19
 1bc:	5f007963          	bgeu	zero,a6,7ae <_prog_start-0x1ffff852>
 1c0:	745f 5f6d 6573      	0x65735f6d745f
 1c6:	5f5f0063          	beq	t5,s5,7a6 <_prog_start-0x1ffff85a>
 1ca:	6d74                	flw	fa3,92(a0)
 1cc:	795f 6164 0079      	0x796164795f
 1d2:	695f 636e 5f00      	0x5f00636e695f
 1d8:	6f42                	flw	ft10,16(sp)
 1da:	5f006c6f          	jal	s8,67ca <_prog_start-0x1fff9836>
 1de:	626d                	lui	tp,0x1b
 1e0:	6f747273          	csrrci	tp,0x6f7,8
 1e4:	5f736377          	0x5f736377
 1e8:	74617473          	csrrci	s0,0x746,2
 1ec:	0065                	c.nop	25
 1ee:	5f5f 6975 746e      	0x746e69755f5f
 1f4:	3436                	fld	fs0,360(sp)
 1f6:	745f 7400 6568      	0x65687400745f
 1fc:	006e                	c.slli	zero,0x1b
 1fe:	5f5f 6176 756c      	0x756c61765f5f
 204:	0065                	c.nop	25
 206:	705f 7335 5f00      	0x5f007335705f
 20c:	72736377          	0x72736377
 210:	6f74                	flw	fa3,92(a4)
 212:	626d                	lui	tp,0x1b
 214:	74735f73          	csrrwi	t5,0x747,6
 218:	7461                	lui	s0,0xffff8
 21a:	0065                	c.nop	25
 21c:	6d5f 6c62 6e65      	0x6e656c626d5f
 222:	735f 6174 6574      	0x65746174735f
 228:	2f00                	fld	fs0,24(a4)
 22a:	61726373          	csrrsi	t1,0x617,4
 22e:	6374                	flw	fa3,68(a4)
 230:	2f68                	fld	fa0,216(a4)
 232:	6861                	lui	a6,0x18
 234:	6e75                	lui	t3,0x1d
 236:	6974                	flw	fa3,84(a0)
 238:	676e                	flw	fa4,216(sp)
 23a:	6f74                	flw	fa3,92(a4)
 23c:	2f6e                	fld	ft10,216(sp)
 23e:	6566                	flw	fa0,88(sp)
 240:	6564                	flw	fs1,76(a0)
 242:	6172                	flw	ft2,28(sp)
 244:	6974                	flw	fa3,84(a0)
 246:	622f6e6f          	jal	t3,f6868 <_prog_start-0x1ff09798>
 24a:	6975                	lui	s2,0x1d
 24c:	646c                	flw	fa1,76(s0)
 24e:	75672f73          	csrrs	t5,0x756,a4
 252:	7661                	lui	a2,0xffff8
 254:	5f61                	li	t5,-8
 256:	7361                	lui	t1,0xffff8
 258:	6369                	lui	t1,0x1a
 25a:	5f00                	lw	s0,56(a4)
 25c:	745f 5f6d 646d      	0x646d5f6d745f
 262:	7961                	lui	s2,0xffff8
 264:	5f00                	lw	s0,56(a4)
 266:	5f676973          	csrrsi	s2,0x5f6,14
 26a:	7566                	flw	fa0,120(sp)
 26c:	636e                	flw	ft6,216(sp)
 26e:	5f00                	lw	s0,56(a4)
 270:	626d                	lui	tp,0x1b
 272:	7472                	flw	fs0,60(sp)
 274:	5f63776f          	jal	a4,3786a <_prog_start-0x1ffc8796>
 278:	74617473          	csrrci	s0,0x746,2
 27c:	0065                	c.nop	25
 27e:	615f 6574 6978      	0x69786574615f
 284:	3074                	fld	fa3,224(s0)
 286:	6500                	flw	fs0,8(a0)
 288:	766e                	flw	fa2,248(sp)
 28a:	7269                	lui	tp,0xffffa
 28c:	5f006e6f          	jal	t3,687c <_prog_start-0x1fff9784>
 290:	6c66                	flw	fs8,88(sp)
 292:	5f6b636f          	jal	t1,b6888 <_prog_start-0x1ff49778>
 296:	0074                	addi	a3,sp,12
 298:	5f5f 6377 0068      	0x6863775f5f
 29e:	695f 626f 0073      	0x73626f695f
 2a4:	635f 6f6c 6573      	0x65736f6c635f
 2aa:	5f00                	lw	s0,56(a4)
 2ac:	735f 6964 6964      	0x69646964735f
 2b2:	696e                	flw	fs2,216(sp)
 2b4:	0074                	addi	a3,sp,12
 2b6:	735f 6474 6e69      	0x6e696474735f
 2bc:	5f00                	lw	s0,56(a4)
 2be:	6d6d6167          	0x6d6d6167
 2c2:	5f61                	li	t5,-8
 2c4:	6e676973          	csrrsi	s2,0x6e6,14
 2c8:	006d6167          	0x6d6167
 2cc:	6f6c                	flw	fa1,92(a4)
 2ce:	676e                	flw	fa4,216(sp)
 2d0:	6c20                	flw	fs0,88(s0)
 2d2:	20676e6f          	jal	t3,764d8 <_prog_start-0x1ff89b28>
 2d6:	6e69                	lui	t3,0x1a
 2d8:	0074                	addi	a3,sp,12
 2da:	625f 7361 0065      	0x657361625f
 2e0:	665f 6572 6c65      	0x6c656572665f
 2e6:	7369                	lui	t1,0xffffa
 2e8:	0074                	addi	a3,sp,12
 2ea:	6d5f 6c75 0074      	0x746c756d5f
 2f0:	5f5f 4c55 6e6f      	0x6e6f4c555f5f
 2f6:	775f0067          	jr	1909(t5) # 1b775 <_prog_start-0x1ffe488b>
 2fa:	6f747263          	bgeu	s0,s7,9de <_prog_start-0x1ffff622>
 2fe:	626d                	lui	tp,0x1b
 300:	735f 6174 6574      	0x65746174735f
 306:	5f00                	lw	s0,56(a4)
 308:	6966                	flw	fs2,88(sp)
 30a:	656c                	flw	fa1,76(a0)
 30c:	6f00                	flw	fs0,24(a4)
 30e:	7470                	flw	fa2,108(s0)
 310:	6e69                	lui	t3,0x1a
 312:	0064                	addi	s1,sp,12
 314:	5f5f 6c63 6165      	0x61656c635f5f
 31a:	756e                	flw	fa0,248(sp)
 31c:	0070                	addi	a2,sp,12
 31e:	6d5f 7362 6174      	0x617473626d5f
 324:	6574                	flw	fa3,76(a0)
 326:	745f 5f00 6e66      	0x6e665f00745f
 32c:	7261                	lui	tp,0xffff8
 32e:	5f007367          	0x5f007367
 332:	745f 5f6d 7369      	0x73695f6d745f
 338:	7364                	flw	fs1,100(a4)
 33a:	0074                	addi	a3,sp,12
 33c:	695f 646e 5f00      	0x5f00646e695f
 342:	745f 5f6d 6f6d      	0x6f6d5f6d745f
 348:	006e                	c.slli	zero,0x1b
 34a:	6174706f          	j	48160 <_prog_start-0x1ffb7ea0>
 34e:	6772                	flw	fa4,28(sp)
 350:	6c00                	flw	fs0,24(s0)
 352:	20676e6f          	jal	t3,76558 <_prog_start-0x1ff89aa8>
 356:	6f64                	flw	fs1,92(a4)
 358:	6275                	lui	tp,0x1d
 35a:	656c                	flw	fa1,76(a0)
 35c:	6200                	flw	fs0,0(a2)
 35e:	6e65                	lui	t3,0x19
 360:	725f6863          	bltu	t5,t0,a90 <_prog_start-0x1ffff570>
 364:	6c637473          	csrrci	s0,0x6c6,6
 368:	616d006b          	0x616d006b
 36c:	6e69                	lui	t3,0x1a
 36e:	6500                	flw	fs0,8(a0)
 370:	32337073          	csrci	mhpmevent3,6
 374:	695f 696e 0074      	0x74696e695f
 37a:	615f 6574 6978      	0x69786574615f
 380:	0074                	addi	a3,sp,12
 382:	6d5f 7362 6174      	0x617473626d5f
 388:	6574                	flw	fa3,76(a0)
 38a:	7300                	flw	fs0,32(a4)
 38c:	6f68                	flw	fa0,92(a4)
 38e:	7472                	flw	fs0,60(sp)
 390:	6920                	flw	fs0,80(a0)
 392:	746e                	flw	fs0,248(sp)
 394:	6f00                	flw	fs0,24(a4)
 396:	7470                	flw	fa2,108(s0)
 398:	6572                	flw	fa0,28(sp)
 39a:	00746573          	csrrsi	a0,0x7,8
 39e:	5f5f 6673 5f00      	0x5f0066735f5f
 3a4:	6e676973          	csrrsi	s2,0x6e6,14
 3a8:	5f00                	lw	s0,56(a4)
 3aa:	6164                	flw	fs1,68(a0)
 3ac:	6174                	flw	fa3,68(a0)
 3ae:	5f00                	lw	s0,56(a4)
 3b0:	775f 6863 0062      	0x626863775f
 3b6:	5f5f 6d74 795f      	0x795f6d745f5f
 3bc:	6165                	addi	sp,sp,112
 3be:	0072                	c.slli	zero,0x1c
 3c0:	6c5f 636f 6c61      	0x6c61636f6c5f
 3c6:	6974                	flw	fa3,84(a0)
 3c8:	656d                	lui	a0,0x1b
 3ca:	625f 6675 5f00      	0x5f006675625f
 3d0:	6e75                	lui	t3,0x1d
 3d2:	7375                	lui	t1,0xffffd
 3d4:	6465                	lui	s0,0x19
 3d6:	5f00                	lw	s0,56(a4)
 3d8:	656e                	flw	fa0,216(sp)
 3da:	635f0077          	0x635f0077
 3de:	7476                	flw	fs0,124(sp)
 3e0:	656c                	flw	fa1,76(a0)
 3e2:	006e                	c.slli	zero,0x1b
 3e4:	6d5f 7861 6477      	0x647778616d5f
 3ea:	6c5f0073          	0x6c5f0073
 3ee:	3436                	fld	fs0,360(sp)
 3f0:	5f61                	li	t5,-8
 3f2:	7562                	flw	fa0,56(sp)
 3f4:	0066                	c.slli	zero,0x19
 3f6:	625f 6b6c 6973      	0x69736b6c625f
 3fc:	657a                	flw	fa0,156(sp)
 3fe:	5f00                	lw	s0,56(a4)
 400:	745f 006d 6e5f      	0x6e5f006d745f
 406:	6f69                	lui	t5,0x1a
 408:	7362                	flw	ft6,56(sp)
 40a:	7700                	flw	fs0,40(a4)
 40c:	6e69                	lui	t3,0x1a
 40e:	5f74                	lw	a3,124(a4)
 410:	0074                	addi	a3,sp,12
 412:	645f 6f73 685f      	0x685f6f73645f
 418:	6e61                	lui	t3,0x18
 41a:	6c64                	flw	fs1,92(s0)
 41c:	0065                	c.nop	25
 41e:	7270                	flw	fa2,100(a2)
 420:	6e69                	lui	t3,0x1a
 422:	5f74                	lw	a3,124(a4)
 424:	6f74                	flw	fa3,92(a4)
 426:	755f 7261 3174      	0x31747261755f
 42c:	7000                	flw	fs0,32(s0)
 42e:	735f6d67          	0x735f6d67
 432:	6174                	flw	fa3,68(a0)
 434:	7472                	flw	fs0,60(sp)
 436:	5f00                	lw	s0,56(a4)
 438:	62747663          	bgeu	s0,t2,a64 <_prog_start-0x1ffff59c>
 43c:	6675                	lui	a2,0x1d
 43e:	7500                	flw	fs0,40(a0)
 440:	736e                	flw	ft6,248(sp)
 442:	6769                	lui	a4,0x1a
 444:	656e                	flw	fa0,216(sp)
 446:	2064                	fld	fs1,192(s0)
 448:	72616863          	bltu	sp,t1,b78 <_prog_start-0x1ffff488>
 44c:	5f00                	lw	s0,56(a4)
 44e:	755f 6e69 3374      	0x33746e69755f
 454:	5f32                	lw	t5,44(sp)
 456:	0074                	addi	a3,sp,12
 458:	675f 7465 6164      	0x61647465675f
 45e:	6574                	flw	fa3,76(a0)
 460:	655f 7272 5f00      	0x5f007272655f
 466:	6461                	lui	s0,0x18
 468:	0064                	addi	s1,sp,12
 46a:	5f5f 6273 6675      	0x667562735f5f
 470:	4700                	lw	s0,8(a4)
 472:	554e                	lw	a0,240(sp)
 474:	4320                	lw	s0,64(a4)
 476:	3131                	jal	82 <_prog_start-0x1fffff7e>
 478:	3720                	fld	fs0,104(a4)
 47a:	322e                	fld	ft4,232(sp)
 47c:	302e                	fld	ft0,232(sp)
 47e:	2d20                	fld	fs0,88(a0)
 480:	616d                	addi	sp,sp,240
 482:	6372                	flw	ft6,28(sp)
 484:	3d68                	fld	fa0,248(a0)
 486:	7672                	flw	fa2,60(sp)
 488:	6d693233          	0x6d693233
 48c:	6361                	lui	t1,0x18
 48e:	2d20                	fld	fs0,88(a0)
 490:	636d                	lui	t1,0x1b
 492:	6f6d                	lui	t5,0x1b
 494:	6564                	flw	fs1,76(a0)
 496:	3d6c                	fld	fa1,248(a0)
 498:	656d                	lui	a0,0x1b
 49a:	6c64                	flw	fs1,92(s0)
 49c:	2d20776f          	jal	a4,776e <_prog_start-0x1fff8892>
 4a0:	616d                	addi	sp,sp,240
 4a2:	6962                	flw	fs2,24(sp)
 4a4:	693d                	lui	s2,0xf
 4a6:	706c                	flw	fa1,100(s0)
 4a8:	2d203233          	0x2d203233
 4ac:	4f2d2067          	0x4f2d2067
 4b0:	2032                	fld	ft0,264(sp)
 4b2:	732d                	lui	t1,0xfffeb
 4b4:	6474                	flw	fa3,76(s0)
 4b6:	673d                	lui	a4,0xf
 4b8:	756e                	flw	fa0,248(sp)
 4ba:	3131                	jal	c6 <_prog_start-0x1fffff3a>
 4bc:	2d20                	fld	fs0,88(a0)
 4be:	6e66                	flw	ft8,88(sp)
 4c0:	6f632d6f          	jal	s10,32bb6 <_prog_start-0x1ffcd44a>
 4c4:	6d6d                	lui	s10,0x1b
 4c6:	5f006e6f          	jal	t3,6ab6 <_prog_start-0x1fff954a>
 4ca:	65756c67          	0x65756c67
 4ce:	5f00                	lw	s0,56(a4)
 4d0:	735f 6c67 6575      	0x65756c67735f
 4d6:	5f00                	lw	s0,56(a4)
 4d8:	74727473          	csrrci	s0,0x747,4
 4dc:	6c5f6b6f          	jal	s6,f73a0 <_prog_start-0x1ff08c60>
 4e0:	7361                	lui	t1,0xffff8
 4e2:	0074                	addi	a3,sp,12
 4e4:	6d5f 7462 776f      	0x776f74626d5f
 4ea:	74735f63          	bge	t1,t2,c48 <_prog_start-0x1ffff3b8>
 4ee:	7461                	lui	s0,0xffff8
 4f0:	0065                	c.nop	25
 4f2:	6c5f 636f 6c61      	0x6c61636f6c5f
 4f8:	0065                	c.nop	25
 4fa:	635f 7974 6570      	0x65707974635f
 500:	005f 735f 6973      	0x6973735f005f
 506:	657a                	flw	fa0,156(sp)
 508:	745f 5f00 6572      	0x65725f00745f
 50e:	6e65                	lui	t3,0x19
 510:	0074                	addi	a3,sp,12
 512:	726f6873          	csrrsi	a6,0x726,30
 516:	2074                	fld	fa3,192(s0)
 518:	6e75                	lui	t3,0x1d
 51a:	6e676973          	csrrsi	s2,0x6e6,14
 51e:	6465                	lui	s0,0x19
 520:	6920                	flw	fs0,80(a0)
 522:	746e                	flw	fs0,248(sp)
 524:	5f00                	lw	s0,56(a4)
 526:	6e66                	flw	ft8,88(sp)
 528:	7974                	flw	fa3,116(a0)
 52a:	6570                	flw	fa2,76(a0)
 52c:	735f0073          	0x735f0073
 530:	7a69                	lui	s4,0xffffa
 532:	0065                	c.nop	25
 534:	6f5f 6666 745f      	0x745f66666f5f
 53a:	5f00                	lw	s0,56(a4)
 53c:	626e                	flw	ft4,216(sp)
 53e:	6675                	lui	a2,0x1d
 540:	5f00                	lw	s0,56(a4)
 542:	6e75                	lui	t3,0x1d
 544:	7375                	lui	t1,0xffffd
 546:	6465                	lui	s0,0x19
 548:	725f 6e61 0064      	0x646e61725f
 54e:	755f 736e 6570      	0x6570736e755f
 554:	69666963          	bltu	a2,s6,be6 <_prog_start-0x1ffff41a>
 558:	6465                	lui	s0,0x19
 55a:	6c5f 636f 6c61      	0x6c61636f6c5f
 560:	5f65                	li	t5,-7
 562:	6e69                	lui	t3,0x1a
 564:	6f66                	flw	ft10,88(sp)
 566:	5f00                	lw	s0,56(a4)
 568:	6c66                	flw	fs8,88(sp)
 56a:	6761                	lui	a4,0x18
 56c:	5f003273          	csrrc	tp,0x5f0,zero
 570:	7369                	lui	t1,0xffffa
 572:	635f 6178 5f00      	0x5f006178635f
 578:	64656573          	csrrsi	a0,0x646,10
 57c:	5f00                	lw	s0,56(a4)
 57e:	6172                	flw	ft2,28(sp)
 580:	646e                	flw	fs0,216(sp)
 582:	6e5f 7865 0074      	0x7478656e5f
 588:	5f5f 6f6c 6163      	0x61636f6c5f5f
 58e:	656c                	flw	fa1,76(a0)
 590:	745f 5f00 6573      	0x65735f00745f
 596:	6b65                	lui	s6,0x19
 598:	5f00                	lw	s0,56(a4)
 59a:	65647473          	csrrci	s0,0x656,8
 59e:	7272                	flw	ft4,60(sp)
 5a0:	5f00                	lw	s0,56(a4)
 5a2:	6d6e                	flw	fs10,216(sp)
 5a4:	6c61                	lui	s8,0x18
 5a6:	6f6c                	flw	fa1,92(a4)
 5a8:	755f0063          	beq	t5,s5,ce8 <_prog_start-0x1ffff318>
 5ac:	7562                	flw	fa0,56(sp)
 5ae:	0066                	c.slli	zero,0x19
 5b0:	7461                	lui	s0,0xffff8
 5b2:	5f65                	li	t5,-7
 5b4:	6166                	flw	ft2,88(sp)
 5b6:	6c69                	lui	s8,0x1a
 5b8:	6100                	flw	fs0,0(a0)
 5ba:	6574                	flw	fa3,76(a0)
 5bc:	6f5f 7475 7570      	0x757074756f5f
 5c2:	7374                	flw	fa3,100(a4)
 5c4:	7465                	lui	s0,0xffff9
 5c6:	2f00                	fld	fs0,24(a4)
 5c8:	61726373          	csrrsi	t1,0x617,4
 5cc:	6374                	flw	fa3,68(a4)
 5ce:	2f68                	fld	fa0,216(a4)
 5d0:	6861                	lui	a6,0x18
 5d2:	6e75                	lui	t3,0x1d
 5d4:	6974                	flw	fa3,84(a0)
 5d6:	676e                	flw	fa4,216(sp)
 5d8:	6f74                	flw	fa3,92(a4)
 5da:	2f6e                	fld	ft10,216(sp)
 5dc:	6566                	flw	fa0,88(sp)
 5de:	6564                	flw	fs1,76(a0)
 5e0:	6172                	flw	ft2,28(sp)
 5e2:	6974                	flw	fa3,84(a0)
 5e4:	732f6e6f          	jal	t3,f6d16 <_prog_start-0x1ff092ea>
 5e8:	7774666f          	jal	a2,4755e <_prog_start-0x1ffb8aa2>
 5ec:	7261                	lui	tp,0xffff8
 5ee:	2f65                	jal	da6 <_prog_start-0x1ffff25a>
 5f0:	696c                	flw	fa1,84(a0)
 5f2:	7262                	flw	ft4,56(sp)
 5f4:	7261                	lui	tp,0xffff8
 5f6:	6569                	lui	a0,0x1a
 5f8:	74612f73          	csrrs	t5,0x746,sp
 5fc:	2f65                	jal	db4 <_prog_start-0x1ffff24c>
 5fe:	7461                	lui	s0,0xffff8
 600:	2e65                	jal	9b8 <_prog_start-0x1ffff648>
 602:	70670063          	beq	a4,t1,d02 <_prog_start-0x1ffff2fe>
 606:	6f69                	lui	t5,0x1a
 608:	6d5f 7361 006b      	0x6b73616d5f
 60e:	7461                	lui	s0,0xffff8
 610:	5f65                	li	t5,-7
 612:	6170                	flw	fa2,68(a0)
 614:	61007373          	csrrci	t1,0x610,0
 618:	6574                	flw	fa3,76(a0)
 61a:	735f 7465 7075      	0x70757465735f
 620:	5f00                	lw	s0,56(a4)
 622:	63746567          	0x63746567
 626:	6e00                	flw	fs0,24(a2)
 628:	00636573          	csrrsi	a0,0x6,6
 62c:	6964                	flw	fs1,84(a0)
 62e:	6666                	flw	fa2,88(sp)
 630:	7265                	lui	tp,0xffff9
 632:	6e65                	lui	t3,0x19
 634:	6e006563          	bltu	zero,zero,d1e <_prog_start-0x1ffff2e2>
 638:	5f636573          	csrrsi	a0,0x5f6,6
 63c:	6570                	flw	fa2,76(a0)
 63e:	5f72                	lw	t5,60(sp)
 640:	6c637963          	bgeu	t1,t1,d12 <_prog_start-0x1ffff2ee>
 644:	0065                	c.nop	25
 646:	616e                	flw	ft2,216(sp)
 648:	6f6e                	flw	ft10,216(sp)
 64a:	65656c73          	csrrsi	s8,0x656,10
 64e:	0070                	addi	a2,sp,12
 650:	6162                	flw	ft2,24(sp)
 652:	6475                	lui	s0,0x1d
 654:	725f 7461 0065      	0x657461725f
 65a:	72617473          	csrrci	s0,0x726,2
 65e:	5f74                	lw	a3,124(a4)
 660:	746d                	lui	s0,0xffffb
 662:	6d69                	lui	s10,0x1a
 664:	0065                	c.nop	25
 666:	6574                	flw	fa3,76(a0)
 668:	6d007473          	csrrci	s0,0x6d0,0
 66c:	6165                	addi	sp,sp,112
 66e:	65727573          	csrrci	a0,0x657,4
 672:	6c5f 6f66 6373      	0x63736f666c5f
 678:	665f 6572 0071      	0x716572665f
 67e:	5f70746f          	jal	s0,8474 <_prog_start-0x1fff7b8c>
 682:	74697277          	0x74697277
 686:	5f65                	li	t5,-7
 688:	7261                	lui	tp,0xffff8
 68a:	6172                	flw	ft2,28(sp)
 68c:	5f79                	li	t5,-2
 68e:	65636e6f          	jal	t3,36ce4 <_prog_start-0x1ffc931c>
 692:	7000                	flw	fs0,32(s0)
 694:	6c6c                	flw	fa1,92(s0)
 696:	665f 5f00 7570      	0x75705f00665f
 69c:	6374                	flw	fa3,68(a4)
 69e:	7000                	flw	fs0,32(s0)
 6a0:	6c6c                	flw	fa1,92(s0)
 6a2:	715f 7000 6c6c      	0x6c6c7000715f
 6a8:	725f 6600 6166      	0x61666600725f
 6ae:	726f7463          	bgeu	t5,t1,dd6 <_prog_start-0x1ffff22a>
 6b2:	5f00                	lw	s0,56(a4)
 6b4:	7570                	flw	fa2,108(a0)
 6b6:	7374                	flw	fa3,100(a4)
 6b8:	6c00                	flw	fs0,24(s0)
 6ba:	7366                	flw	ft6,120(sp)
 6bc:	3372                	fld	ft6,312(sp)
 6be:	0032                	c.slli	zero,0xc
 6c0:	705f 7475 0068      	0x687475705f
 6c6:	705f 7475 0069      	0x697475705f
 6cc:	705f 7475 3169      	0x31697475705f
 6d2:	5f5f006b          	0x5f5f006b
 6d6:	6d74                	flw	fa3,92(a0)
 6d8:	0070                	addi	a2,sp,12
 6da:	6175                	addi	sp,sp,368
 6dc:	7472                	flw	fs0,60(sp)
 6de:	735f 7465 7700      	0x77007465735f
 6e4:	6974                	flw	fa3,84(a0)
 6e6:	656d                	lui	a0,0x1b
 6e8:	7300                	flw	fs0,32(a4)
 6ea:	6174                	flw	fa3,68(a0)
 6ec:	7472                	flw	fs0,60(sp)
 6ee:	6d5f 7963 6c63      	0x6c6379636d5f
 6f4:	0065                	c.nop	25
 6f6:	74696177          	0x74696177
 6fa:	6c5f 6366 696c      	0x696c63666c5f
 700:	00736b63          	bltu	t1,t2,716 <_prog_start-0x1ffff8ea>
 704:	5f70746f          	jal	s0,84fa <_prog_start-0x1fff7b06>
 708:	6572                	flw	fa0,28(sp)
 70a:	6461                	lui	s0,0x18
 70c:	775f 726f 0064      	0x64726f775f
 712:	7274                	flw	fa3,100(a2)
 714:	6d69                	lui	s10,0x1a
 716:	6600                	flw	fs0,8(a2)
 718:	6572                	flw	fa0,28(sp)
 71a:	5f71                	li	t5,-4
 71c:	6c616373          	csrrsi	t1,0x6c6,2
 720:	0065                	c.nop	25
 722:	617a                	flw	ft2,156(sp)
 724:	5f70                	lw	a2,124(a4)
 726:	73656e6f          	jal	t3,56e5c <_prog_start-0x1ffa91a4>
 72a:	7200                	flw	fs0,32(a2)
 72c:	3664                	fld	fs1,232(a2)
 72e:	6334                	flw	fa3,64(a4)
 730:	6379                	lui	t1,0x1e
 732:	656c                	flw	fa1,76(a0)
 734:	6f00                	flw	fs0,24(a4)
 736:	7074                	flw	fa3,100(s0)
 738:	775f 6972 6574      	0x65746972775f
 73e:	615f 7272 7961      	0x79617272615f
 744:	6500                	flw	fs0,8(a0)
 746:	7272                	flw	ft4,60(sp)
 748:	6f00726f          	jal	tp,7e38 <_prog_start-0x1fff81c8>
 74c:	7074                	flw	fa3,100(s0)
 74e:	655f 646e 775f      	0x775f646e655f
 754:	6972                	flw	fs2,28(sp)
 756:	6574                	flw	fa3,76(a0)
 758:	6200                	flw	fs0,0(a2)
 75a:	6f6c                	flw	fa1,92(a4)
 75c:	6e696b63          	bltu	s2,t1,e52 <_prog_start-0x1ffff1ae>
 760:	656d0067          	jr	1622(s10) # 1a656 <_prog_start-0x1ffe59aa>
 764:	7361                	lui	t1,0xffff8
 766:	7275                	lui	tp,0xffffd
 768:	5f65                	li	t5,-7
 76a:	5f757063          	bgeu	a0,s7,d4a <_prog_start-0x1ffff2b6>
 76e:	7266                	flw	ft4,120(sp)
 770:	7165                	addi	sp,sp,-400
 772:	7300                	flw	fs0,32(a4)
 774:	7465                	lui	s0,0xffff9
 776:	6972                	flw	fs2,28(sp)
 778:	676e                	flw	fa4,216(sp)
 77a:	6962                	flw	fs2,24(sp)
 77c:	7374                	flw	fa3,100(a4)
 77e:	6f00                	flw	fs0,24(a4)
 780:	7074                	flw	fa3,100(s0)
 782:	725f 6c65 6165      	0x61656c65725f
 788:	6c5f6573          	csrrsi	a0,0x6c5,30
 78c:	006b636f          	jal	t1,b6792 <_prog_start-0x1ff4986e>
 790:	7265                	lui	tp,0xffff9
 792:	7072                	flw	ft0,60(sp)
 794:	0074                	addi	a3,sp,12
 796:	5f70746f          	jal	s0,858c <_prog_start-0x1fff7a74>
 79a:	74697277          	0x74697277
 79e:	5f65                	li	t5,-7
 7a0:	64726f77          	0x64726f77
 7a4:	6800                	flw	fs0,16(s0)
 7a6:	6e61                	lui	t3,0x18
 7a8:	66685f67          	0x66685f67
 7ac:	0074756f          	jal	a0,47fb2 <_prog_start-0x1ffb804e>
 7b0:	5f5f 6e69 3374      	0x33746e695f5f
 7b6:	5f32                	lw	t5,44(sp)
 7b8:	0074                	addi	a3,sp,12
 7ba:	7263732f          	0x7263732f
 7be:	7461                	lui	s0,0xffff8
 7c0:	612f6863          	bltu	t5,s2,dd0 <_prog_start-0x1ffff230>
 7c4:	7568                	flw	fa0,108(a0)
 7c6:	746e                	flw	fs0,248(sp)
 7c8:	6e69                	lui	t3,0x1a
 7ca:	6e6f7467          	0x6e6f7467
 7ce:	6465662f          	0x6465662f
 7d2:	7265                	lui	tp,0xffff9
 7d4:	7461                	lui	s0,0xffff8
 7d6:	6f69                	lui	t5,0x1a
 7d8:	2f6e                	fld	ft10,216(sp)
 7da:	74666f73          	csrrsi	t5,0x746,12
 7de:	65726177          	0x65726177
 7e2:	62696c2f          	0x62696c2f
 7e6:	6172                	flw	ft2,28(sp)
 7e8:	6972                	flw	fs2,28(sp)
 7ea:	7365                	lui	t1,0xffff9
 7ec:	6e65622f          	0x6e65622f
 7f0:	74756863          	bltu	a0,t2,f40 <_prog_start-0x1ffff0c0>
 7f4:	6c69                	lui	s8,0x1a
 7f6:	65622f73          	csrrs	t5,0x656,tp
 7fa:	636e                	flw	ft6,216(sp)
 7fc:	7568                	flw	fa0,108(a0)
 7fe:	6974                	flw	fa3,84(a0)
 800:	736c                	flw	fa1,100(a4)
 802:	632e                	flw	ft6,200(sp)
 804:	6700                	flw	fs0,8(a4)
 806:	696c                	flw	fa1,84(a0)
 808:	7474                	flw	fa3,108(s0)
 80a:	7265                	lui	tp,0xffff9
 80c:	6f00                	flw	fs0,24(a4)
 80e:	7074                	flw	fa3,100(s0)
 810:	675f 7465 6c5f      	0x6c5f7465675f
 816:	006b636f          	jal	t1,b681c <_prog_start-0x1ff497e4>
 81a:	70746573          	csrrsi	a0,0x707,8
 81e:	6c6c                	flw	fa1,92(s0)
 820:	6f00                	flw	fs0,24(a4)
 822:	7074                	flw	fa3,100(s0)
 824:	625f 6765 6e69      	0x6e696765625f
 82a:	775f 6972 6574      	0x65746972775f
 830:	7300                	flw	fs0,32(a4)
 832:	7465                	lui	s0,0xffff9
 834:	6c70                	flw	fa2,92(s0)
 836:	626c                	flw	fa1,68(a2)
 838:	7469                	lui	s0,0xffffa
 83a:	6e650073          	0x6e650073
 83e:	5f64                	lw	s1,124(a4)
 840:	636d                	lui	t1,0x1b
 842:	6379                	lui	t1,0x1e
 844:	656c                	flw	fa1,76(a0)
 846:	6d00                	flw	fs0,24(a0)
 848:	6974                	flw	fa3,84(a0)
 84a:	656d                	lui	a0,0x1b
 84c:	665f 6572 0071      	0x716572665f
 852:	74696177          	0x74696177
 856:	6d5f 0073 7562      	0x756200736d5f
 85c:	5f66                	lw	t5,120(sp)
 85e:	7962                	flw	fs2,56(sp)
 860:	6574                	flw	fa3,76(a0)
 862:	78720073          	0x78720073
 866:	73006d77          	0x73006d77
 86a:	73636b63          	bltu	t1,s6,fa0 <_prog_start-0x1ffff060>
 86e:	7300                	flw	fs0,32(a4)
 870:	6970                	flw	fa2,84(a0)
 872:	725f 6765 665f      	0x665f6765725f
 878:	6c727463          	bgeu	tp,t2,f40 <_prog_start-0x1ffff0c0>
 87c:	6300                	flw	fs0,0(a4)
 87e:	6b637373          	csrrci	t1,0x6b6,6
 882:	6300                	flw	fs0,0(a4)
 884:	7372616f          	jal	sp,277ba <_prog_start-0x1ffd8846>
 888:	0065                	c.nop	25
 88a:	616d                	addi	sp,sp,240
 88c:	5f78                	lw	a4,124(a4)
 88e:	6174                	flw	fa3,68(a0)
 890:	6772                	flw	fa4,28(sp)
 892:	7465                	lui	s0,0xffff9
 894:	6b5f 7a68 7200      	0x72007a686b5f
 89a:	7365                	lui	t1,0xffff9
 89c:	7265                	lui	tp,0xffff9
 89e:	6576                	flw	fa0,92(sp)
 8a0:	3164                	fld	fs1,224(a0)
 8a2:	70730063          	beq	t1,t2,fa2 <_prog_start-0x1ffff05e>
 8a6:	5f69                	li	t5,-6
 8a8:	6572                	flw	fa0,28(sp)
 8aa:	73635f67          	0x73635f67
 8ae:	6f6d                	lui	t5,0x1b
 8b0:	6564                	flw	fs1,76(a0)
 8b2:	7200                	flw	fs0,32(a2)
 8b4:	7761                	lui	a4,0xffff8
 8b6:	625f 7469 0073      	0x737469625f
 8bc:	646b6373          	csrrsi	t1,0x646,22
 8c0:	7669                	lui	a2,0xffffa
 8c2:	7200                	flw	fs0,32(a2)
 8c4:	7365                	lui	t1,0xffff9
 8c6:	7265                	lui	tp,0xffff9
 8c8:	6576                	flw	fa0,92(sp)
 8ca:	3564                	fld	fs1,232(a0)
 8cc:	0038                	addi	a4,sp,8
 8ce:	5f697073          	csrci	0x5f6,18
 8d2:	6572                	flw	fa0,28(sp)
 8d4:	78725f67          	0x78725f67
 8d8:	616d                	addi	sp,sp,240
 8da:	6b72                	flw	fs6,28(sp)
 8dc:	6500                	flw	fs0,8(a0)
 8de:	706d                	c.lui	zero,0xffffb
 8e0:	7974                	flw	fa3,116(a0)
 8e2:	7300                	flw	fs0,32(a4)
 8e4:	6970                	flw	fa2,84(a0)
 8e6:	725f 6765 735f      	0x735f6765725f
 8ec:	6f6d6b63          	bltu	s10,s6,fe2 <_prog_start-0x1ffff01e>
 8f0:	6564                	flw	fs1,76(a0)
 8f2:	6300                	flw	fs0,0(a4)
 8f4:	616d6d6f          	jal	s10,d6f0a <_prog_start-0x1ff290f6>
 8f8:	646e                	flw	fs0,216(sp)
 8fa:	635f 646f 0065      	0x65646f635f
 900:	6572                	flw	fa0,28(sp)
 902:	76726573          	csrrsi	a0,0x767,4
 906:	6465                	lui	s0,0x19
 908:	3032                	fld	ft0,296(sp)
 90a:	7200                	flw	fs0,32(a2)
 90c:	7365                	lui	t1,0xffff9
 90e:	7265                	lui	tp,0xffff9
 910:	6576                	flw	fa0,92(sp)
 912:	3564                	fld	fs1,232(a0)
 914:	65720063          	beq	tp,s7,f54 <_prog_start-0x1ffff0ac>
 918:	76726573          	csrrsi	a0,0x767,4
 91c:	6465                	lui	s0,0x19
 91e:	3432                	fld	fs0,296(sp)
 920:	7100                	flw	fs0,32(a0)
 922:	6f75                	lui	t5,0x1d
 924:	6974                	flw	fa3,84(a0)
 926:	6e65                	lui	t3,0x19
 928:	0074                	addi	a3,sp,12
 92a:	5f697073          	csrci	0x5f6,18
 92e:	6572                	flw	fa0,28(sp)
 930:	66665f67          	0x66665f67
 934:	746d                	lui	s0,0xffffb
 936:	6900                	flw	fs0,16(a0)
 938:	746e                	flw	fs0,248(sp)
 93a:	7265                	lui	tp,0xffff9
 93c:	65007363          	bgeu	zero,a6,f82 <_prog_start-0x1ffff07e>
 940:	646e                	flw	fs0,216(sp)
 942:	6169                	addi	sp,sp,208
 944:	006e                	c.slli	zero,0x1b
 946:	5f697073          	csrci	0x5f6,18
 94a:	6572                	flw	fa0,28(sp)
 94c:	78745f67          	0x78745f67
 950:	6164                	flw	fs1,68(a0)
 952:	6174                	flw	fa3,68(a0)
 954:	7000                	flw	fs0,32(s0)
 956:	6461                	lui	s0,0x18
 958:	635f 646f 0065      	0x65646f635f
 95e:	5f697073          	csrci	0x5f6,18
 962:	6572                	flw	fa0,28(sp)
 964:	78725f67          	0x78725f67
 968:	6164                	flw	fs1,68(a0)
 96a:	6174                	flw	fa3,68(a0)
 96c:	6300                	flw	fs0,0(a4)
 96e:	66656473          	csrrsi	s0,0x666,10
 972:	7200                	flw	fs0,32(a2)
 974:	7365                	lui	t1,0xffff9
 976:	7265                	lui	tp,0xffff9
 978:	6576                	flw	fa0,92(sp)
 97a:	3064                	fld	fs1,224(s0)
 97c:	7200                	flw	fs0,32(a2)
 97e:	7365                	lui	t1,0xffff9
 980:	7265                	lui	tp,0xffff9
 982:	6576                	flw	fa0,92(sp)
 984:	3164                	fld	fs1,224(a0)
 986:	6100                	flw	fs0,0(a0)
 988:	6464                	flw	fs1,76(s0)
 98a:	0072                	c.slli	zero,0x1c
 98c:	5f697073          	csrci	0x5f6,18
 990:	696d                	lui	s2,0x1b
 992:	5f6e                	lw	t5,248(sp)
 994:	5f6b6c63          	bltu	s6,s6,f8c <_prog_start-0x1ffff074>
 998:	6964                	flw	fs1,84(a0)
 99a:	6976                	flw	fs2,92(sp)
 99c:	00726f73          	csrrsi	t5,0x7,4
 9a0:	5f5f 6975 746e      	0x746e69755f5f
 9a6:	5f38                	lw	a4,120(a4)
 9a8:	0074                	addi	a3,sp,12
 9aa:	5f697073          	csrci	0x5f6,18
 9ae:	79706f63          	bltu	zero,s7,114c <_prog_start-0x1fffeeb4>
 9b2:	6300                	flw	fs0,0(a4)
 9b4:	00646973          	csrrsi	s2,0x6,8
 9b8:	5f697073          	csrci	0x5f6,18
 9bc:	6572                	flw	fa0,28(sp)
 9be:	78655f67          	0x78655f67
 9c2:	7274                	flw	fa3,100(a2)
 9c4:	6461                	lui	s0,0x18
 9c6:	6c65                	lui	s8,0x19
 9c8:	2f00                	fld	fs0,24(a4)
 9ca:	61726373          	csrrsi	t1,0x617,4
 9ce:	6374                	flw	fa3,68(a4)
 9d0:	2f68                	fld	fa0,216(a4)
 9d2:	6861                	lui	a6,0x18
 9d4:	6e75                	lui	t3,0x1d
 9d6:	6974                	flw	fa3,84(a0)
 9d8:	676e                	flw	fa4,216(sp)
 9da:	6f74                	flw	fa3,92(a4)
 9dc:	2f6e                	fld	ft10,216(sp)
 9de:	6566                	flw	fa0,88(sp)
 9e0:	6564                	flw	fs1,76(a0)
 9e2:	6172                	flw	ft2,28(sp)
 9e4:	6974                	flw	fa3,84(a0)
 9e6:	732f6e6f          	jal	t3,f7118 <_prog_start-0x1ff08ee8>
 9ea:	7774666f          	jal	a2,47960 <_prog_start-0x1ffb86a0>
 9ee:	7261                	lui	tp,0xffff8
 9f0:	2f65                	jal	11a8 <_prog_start-0x1fffee58>
 9f2:	6f74                	flw	fa3,92(a4)
 9f4:	68636c6f          	jal	s8,3707a <_prog_start-0x1ffc8f86>
 9f8:	6961                	lui	s2,0x18
 9fa:	2f6e                	fld	ft10,216(sp)
 9fc:	7264                	flw	fs1,100(a2)
 9fe:	7669                	lui	a2,0xffffa
 a00:	7265                	lui	tp,0xffff9
 a02:	70732f73          	csrrs	t5,0x707,t1
 a06:	2f69                	jal	11a0 <_prog_start-0x1fffee60>
 a08:	2e697073          	csrci	0x2e6,18
 a0c:	70730063          	beq	t1,t2,110c <_prog_start-0x1fffeef4>
 a10:	5f69                	li	t5,-6
 a12:	7874                	flw	fa3,116(s0)
 a14:	7200                	flw	fs0,32(a2)
 a16:	7365                	lui	t1,0xffff9
 a18:	7265                	lui	tp,0xffff9
 a1a:	6576                	flw	fa0,92(sp)
 a1c:	3364                	fld	fs1,224(a4)
 a1e:	0030                	addi	a2,sp,8
 a20:	6572                	flw	fa0,28(sp)
 a22:	76726573          	csrrsi	a0,0x767,4
 a26:	6465                	lui	s0,0x19
 a28:	6336                	flw	ft6,76(sp)
 a2a:	7300                	flw	fs0,32(a4)
 a2c:	6970                	flw	fa2,84(a0)
 a2e:	725f 6765 645f      	0x645f6765725f
 a34:	6c65                	lui	s8,0x19
 a36:	7961                	lui	s2,0xffff8
 a38:	0030                	addi	a2,sp,8
 a3a:	5f697073          	csrci	0x5f6,18
 a3e:	6572                	flw	fa0,28(sp)
 a40:	61735f67          	0x61735f67
 a44:	706d                	c.lui	zero,0xffffb
 a46:	656c                	flw	fa1,76(a0)
 a48:	6564                	flw	fs1,76(a0)
 a4a:	006c                	addi	a1,sp,12
 a4c:	7566                	flw	fa0,120(sp)
 a4e:	6c6c                	flw	fa1,92(s0)
 a50:	7200                	flw	fs0,32(a2)
 a52:	7365                	lui	t1,0xffff9
 a54:	7265                	lui	tp,0xffff9
 a56:	6576                	flw	fa0,92(sp)
 a58:	3364                	fld	fs1,224(a4)
 a5a:	0034                	addi	a3,sp,8
 a5c:	5f697073          	csrci	0x5f6,18
 a60:	6572                	flw	fa0,28(sp)
 a62:	78745f67          	0x78745f67
 a66:	616d                	addi	sp,sp,240
 a68:	6b72                	flw	fs6,28(sp)
 a6a:	7000                	flw	fs0,32(s0)
 a6c:	6461                	lui	s0,0x18
 a6e:	635f 746e 7400      	0x7400746e635f
 a74:	7778                	flw	fa4,108(a4)
 a76:	006d                	c.nop	27
 a78:	6461                	lui	s0,0x18
 a7a:	7264                	flw	fs1,100(a2)
 a7c:	6c5f 6e65 6100      	0x61006e656c5f
 a82:	6464                	flw	fs1,76(s0)
 a84:	5f72                	lw	t5,60(sp)
 a86:	7270                	flw	fa2,100(a2)
 a88:	006f746f          	jal	s0,f7a8e <_prog_start-0x1ff08572>
 a8c:	5f697073          	csrci	0x5f6,18
 a90:	6572                	flw	fa0,28(sp)
 a92:	6d665f67          	0x6d665f67
 a96:	0074                	addi	a3,sp,12
 a98:	6164                	flw	fs1,68(a0)
 a9a:	6174                	flw	fa3,68(a0)
 a9c:	705f 6f72 6f74      	0x6f746f72705f
 aa2:	7200                	flw	fs0,32(a2)
 aa4:	7365                	lui	t1,0xffff9
 aa6:	7265                	lui	tp,0xffff9
 aa8:	6576                	flw	fa0,92(sp)
 aaa:	3664                	fld	fs1,232(a2)
 aac:	0038                	addi	a4,sp,8
 aae:	5f697073          	csrci	0x5f6,18
 ab2:	7874                	flw	fa3,116(s0)
 ab4:	7872                	flw	fa6,60(sp)
 ab6:	6900                	flw	fs0,16(a0)
 ab8:	706e                	flw	ft0,248(sp)
 aba:	7475                	lui	s0,0xffffd
 abc:	6b5f 7a68 6300      	0x63007a686b5f
 ac2:	646d                	lui	s0,0x1b
 ac4:	655f 006e 6572      	0x6572006e655f
 aca:	76726573          	csrrsi	a0,0x767,4
 ace:	6465                	lui	s0,0x19
 ad0:	3830                	fld	fa2,112(s0)
 ad2:	6600                	flw	fs0,8(a2)
 ad4:	6e69                	lui	t3,0x1a
 ad6:	0065                	c.nop	25
 ad8:	6572                	flw	fa0,28(sp)
 ada:	76726573          	csrrsi	a0,0x767,4
 ade:	6465                	lui	s0,0x19
 ae0:	3434                	fld	fa3,104(s0)
 ae2:	7300                	flw	fs0,32(a4)
 ae4:	6970                	flw	fa2,84(a0)
 ae6:	6c727463          	bgeu	tp,t2,11ae <_prog_start-0x1fffee52>
 aea:	7300                	flw	fs0,32(a4)
 aec:	6970                	flw	fa2,84(a0)
 aee:	725f 6765 695f      	0x695f6765725f
 af4:	0065                	c.nop	25
 af6:	6d6d6f63          	bltu	s10,s6,11d4 <_prog_start-0x1fffee2c>
 afa:	6e61                	lui	t3,0x18
 afc:	5f64                	lw	s1,124(a4)
 afe:	7270                	flw	fa2,100(a2)
 b00:	006f746f          	jal	s0,f7b06 <_prog_start-0x1ff084fa>
 b04:	6572                	flw	fa0,28(sp)
 b06:	76726573          	csrrsi	a0,0x767,4
 b0a:	6465                	lui	s0,0x19
 b0c:	6330                	flw	fa2,64(a4)
 b0e:	7300                	flw	fs0,32(a4)
 b10:	6970                	flw	fa2,84(a0)
 b12:	725f 6765 695f      	0x695f6765725f
 b18:	0070                	addi	a2,sp,12
 b1a:	5f697073          	csrci	0x5f6,18
 b1e:	6c727463          	bgeu	tp,t2,11e6 <_prog_start-0x1fffee1a>
 b22:	6900                	flw	fs0,16(a0)
 b24:	746e                	flw	fs0,248(sp)
 b26:	7265                	lui	tp,0xffff9
 b28:	6678                	flw	fa4,76(a2)
 b2a:	0072                	c.slli	zero,0x1c
 b2c:	5f697073          	csrci	0x5f6,18
 b30:	7872                	flw	fa6,60(sp)
 b32:	7200                	flw	fs0,32(a2)
 b34:	7365                	lui	t1,0xffff9
 b36:	7265                	lui	tp,0xffff9
 b38:	6576                	flw	fa0,92(sp)
 b3a:	0064                	addi	s1,sp,12
 b3c:	5f697073          	csrci	0x5f6,18
 b40:	6572                	flw	fa0,28(sp)
 b42:	65645f67          	0x65645f67
 b46:	616c                	flw	fa1,68(a0)
 b48:	3179                	jal	7d6 <_prog_start-0x1ffff82a>
 b4a:	2f00                	fld	fs0,24(a4)
 b4c:	61726373          	csrrsi	t1,0x617,4
 b50:	6374                	flw	fa3,68(a4)
 b52:	2f68                	fld	fa0,216(a4)
 b54:	6861                	lui	a6,0x18
 b56:	6e75                	lui	t3,0x1d
 b58:	6974                	flw	fa3,84(a0)
 b5a:	676e                	flw	fa4,216(sp)
 b5c:	6f74                	flw	fa3,92(a4)
 b5e:	2f6e                	fld	ft10,216(sp)
 b60:	6566                	flw	fa0,88(sp)
 b62:	6564                	flw	fs1,76(a0)
 b64:	6172                	flw	ft2,28(sp)
 b66:	6974                	flw	fa3,84(a0)
 b68:	732f6e6f          	jal	t3,f729a <_prog_start-0x1ff08d66>
 b6c:	7774666f          	jal	a2,47ae2 <_prog_start-0x1ffb851e>
 b70:	7261                	lui	tp,0xffff8
 b72:	2f65                	jal	132a <_prog_start-0x1fffecd6>
 b74:	6f74                	flw	fa3,92(a4)
 b76:	68636c6f          	jal	s8,371fc <_prog_start-0x1ffc8e04>
 b7a:	6961                	lui	s2,0x18
 b7c:	2f6e                	fld	ft10,216(sp)
 b7e:	7264                	flw	fs1,100(a2)
 b80:	7669                	lui	a2,0xffffa
 b82:	7265                	lui	tp,0xffff9
 b84:	73652f73          	csrrs	t5,0x736,a0
 b88:	3370                	fld	fa2,224(a4)
 b8a:	2f32                	fld	ft10,264(sp)
 b8c:	7365                	lui	t1,0xffff9
 b8e:	3370                	fld	fa2,224(a4)
 b90:	2e32                	fld	ft8,264(sp)
 b92:	74730063          	beq	t1,t2,12d2 <_prog_start-0x1fffed2e>
 b96:	6c72                	flw	fs8,28(sp)
 b98:	6e65                	lui	t3,0x19
 b9a:	7300                	flw	fs0,32(a4)
 b9c:	7274                	flw	fa3,100(a2)
 b9e:	636e                	flw	ft6,216(sp)
 ba0:	706d                	c.lui	zero,0xffffb
 ba2:	6e00                	flw	fs0,24(a2)
 ba4:	6d75                	lui	s10,0x1d
 ba6:	785f 6566 7372      	0x73726566785f
 bac:	7200                	flw	fs0,32(a2)
 bae:	7365                	lui	t1,0xffff9
 bb0:	5f70                	lw	a2,124(a4)
 bb2:	656c                	flw	fa1,76(a0)
 bb4:	006e                	c.slli	zero,0x1b
 bb6:	7461                	lui	s0,0xffff8
 bb8:	775f 6961 5f74      	0x5f746961775f
 bbe:	6f64                	flw	fs1,92(a4)
 bc0:	656e                	flw	fa0,216(sp)
 bc2:	6100                	flw	fs0,0(a0)
 bc4:	5f74                	lw	a3,124(a4)
 bc6:	00646d63          	bltu	s0,t1,be0 <_prog_start-0x1ffff420>
 bca:	63656863          	bltu	a0,s6,11fa <_prog_start-0x1fffee06>
 bce:	65725f6b          	0x65725f6b
 bd2:	6461                	lui	s0,0x18
 bd4:	0079                	c.nop	30
 bd6:	796d                	lui	s2,0xffffb
 bd8:	72616863          	bltu	sp,t1,1308 <_prog_start-0x1fffecf8>
 bdc:	6100                	flw	fs0,0(a0)
 bde:	5f74                	lw	a3,124(a4)
 be0:	6572                	flw	fa0,28(sp)
 be2:	63007663          	bgeu	zero,a6,120e <_prog_start-0x1fffedf2>
 be6:	646d                	lui	s0,0x1b
 be8:	6c5f 6e65 7300      	0x73006e656c5f
 bee:	7274                	flw	fa3,100(a2)
 bf0:	636e                	flw	ft6,216(sp)
 bf2:	7970                	flw	fa2,116(a0)
 bf4:	7200                	flw	fs0,32(a2)
 bf6:	5f78                	lw	a4,124(a4)
 bf8:	7562                	flw	fa0,56(sp)
 bfa:	0066                	c.slli	zero,0x19
 bfc:	7461                	lui	s0,0xffff8
 bfe:	725f 6365 5f76      	0x5f766365725f
 c04:	00656e6f          	jal	t3,56c0a <_prog_start-0x1ffa93f6>
 c08:	7365                	lui	t1,0xffff9
 c0a:	3370                	fld	fa2,224(a4)
 c0c:	5f32                	lw	t5,44(sp)
 c0e:	6964                	flw	fs1,84(a0)
 c10:	6761                	lui	a4,0x18
 c12:	6d5f 646f 0065      	0x65646f6d5f
 c18:	5f697073          	csrci	0x5f6,18
 c1c:	7274                	flw	fa3,100(a2)
 c1e:	6e61                	lui	t3,0x18
 c20:	69656373          	csrrsi	t1,0x696,10
 c24:	6576                	flw	fa0,92(sp)
 c26:	6f5f 656e 7400      	0x7400656e6f5f
 c2c:	5f78                	lw	a4,124(a4)
 c2e:	7562                	flw	fa0,56(sp)
 c30:	0066                	c.slli	zero,0x19
 c32:	6974                	flw	fa3,84(a0)
 c34:	656d                	lui	a0,0x1b
 c36:	0074756f          	jal	a0,4843c <_prog_start-0x1ffb7bc4>
 c3a:	7461                	lui	s0,0xffff8
 c3c:	735f 6e65 0064      	0x646e65735f
 c42:	705f 7475 706e      	0x706e7475705f
 c48:	74610073          	0x74610073
 c4c:	735f 6e65 7264      	0x72646e65735f
 c52:	6365                	lui	t1,0x19
 c54:	0076                	c.slli	zero,0x1d
 c56:	705f 7475 0078      	0x787475705f
 c5c:	5f697073          	csrci	0x5f6,18
 c60:	7274                	flw	fa3,100(a2)
 c62:	6e61                	lui	t3,0x18
 c64:	69656373          	csrrsi	t1,0x696,10
 c68:	6576                	flw	fa0,92(sp)
 c6a:	6100                	flw	fs0,0(a0)
 c6c:	5f74                	lw	a3,124(a4)
 c6e:	646e6573          	csrrsi	a0,0x646,28
 c72:	6c66                	flw	fs8,88(sp)
 c74:	6761                	lui	a4,0x18
 c76:	6100                	flw	fs0,0(a0)
 c78:	5f74                	lw	a3,124(a4)
 c7a:	6c66                	flw	fs8,88(sp)
 c7c:	6761                	lui	a4,0x18
 c7e:	5f00                	lw	s0,56(a4)
 c80:	6c5f 636f 6c61      	0x6c61636f6c5f
 c86:	5f65                	li	t5,-7
 c88:	70797463          	bgeu	s2,t2,1390 <_prog_start-0x1fffec70>
 c8c:	5f65                	li	t5,-7
 c8e:	7470                	flw	fa2,108(s0)
 c90:	0072                	c.slli	zero,0x1c
 c92:	7263732f          	0x7263732f
 c96:	7461                	lui	s0,0xffff8
 c98:	612f6863          	bltu	t5,s2,12a8 <_prog_start-0x1fffed58>
 c9c:	7568                	flw	fa0,108(a0)
 c9e:	746e                	flw	fs0,248(sp)
 ca0:	6e69                	lui	t3,0x1a
 ca2:	6e6f7467          	0x6e6f7467
 ca6:	6465662f          	0x6465662f
 caa:	7265                	lui	tp,0xffff9
 cac:	7461                	lui	s0,0xffff8
 cae:	6f69                	lui	t5,0x1a
 cb0:	2f6e                	fld	ft10,216(sp)
 cb2:	74666f73          	csrrsi	t5,0x746,12
 cb6:	65726177          	0x65726177
 cba:	7365742f          	0x7365742f
 cbe:	7374                	flw	fa3,100(a4)
 cc0:	6d6f632f          	0x6d6f632f
 cc4:	6f6d                	lui	t5,0x1b
 cc6:	2f6e                	fld	ft10,216(sp)
 cc8:	2e747263          	bgeu	s0,t2,fac <_prog_start-0x1ffff054>
 ccc:	4e470053          	0x4e470053
 cd0:	2055                	jal	d74 <_prog_start-0x1ffff28c>
 cd2:	5341                	li	t1,-16
 cd4:	3220                	fld	fs0,96(a2)
 cd6:	322e                	fld	ft4,232(sp)
 cd8:	0039                	c.nop	14

Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347          	fmsub.d	ft6,ft6,ft4,ft7,rmm
   4:	2820                	fld	fs0,80(s0)
   6:	29554e47          	fmsub.s	ft8,fa0,fs5,ft5,rmm
   a:	3720                	fld	fs0,104(a4)
   c:	322e                	fld	ft4,232(sp)
   e:	302e                	fld	ft0,232(sp)
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	000c                	0xc
   2:	0000                	unimp
   4:	ffff                	0xffff
   6:	ffff                	0xffff
   8:	0001                	nop
   a:	7c01                	lui	s8,0xfffe0
   c:	0d01                	addi	s10,s10,0
   e:	0002                	c.slli64	zero
  10:	001c                	0x1c
  12:	0000                	unimp
  14:	0000                	unimp
  16:	0000                	unimp
  18:	0240                	addi	s0,sp,260
  1a:	2000                	fld	fs0,0(s0)
  1c:	026a                	slli	tp,tp,0x1a
  1e:	0000                	unimp
  20:	0e42                	slli	t3,t3,0x10
  22:	4220                	lw	s0,64(a2)
  24:	0181                	addi	gp,gp,0
  26:	0a019c03          	lh	s8,160(gp) # 80000e20 <__global_pointer$+0xa0>
  2a:	4ac1                	li	s5,16
  2c:	000e                	c.slli	zero,0x3
  2e:	0b42                	slli	s6,s6,0x10
  30:	000c                	0xc
  32:	0000                	unimp
  34:	ffff                	0xffff
  36:	ffff                	0xffff
  38:	0001                	nop
  3a:	7c01                	lui	s8,0xfffe0
  3c:	0d01                	addi	s10,s10,0
  3e:	0002                	c.slli64	zero
  40:	000c                	0xc
  42:	0000                	unimp
  44:	0030                	addi	a2,sp,8
  46:	0000                	unimp
  48:	04aa                	slli	s1,s1,0xa
  4a:	2000                	fld	fs0,0(s0)
  4c:	0024                	addi	s1,sp,8
  4e:	0000                	unimp
  50:	0018                	0x18
  52:	0000                	unimp
  54:	0030                	addi	a2,sp,8
  56:	0000                	unimp
  58:	04ce                	slli	s1,s1,0x13
  5a:	2000                	fld	fs0,0(s0)
  5c:	002a                	c.slli	zero,0xa
  5e:	0000                	unimp
  60:	0e42                	slli	t3,t3,0x10
  62:	4610                	lw	a2,8(a2)
  64:	0181                	addi	gp,gp,0
  66:	c15c                	sw	a5,4(a0)
  68:	0e44                	addi	s1,sp,788
  6a:	0000                	unimp
  6c:	0020                	addi	s0,sp,8
  6e:	0000                	unimp
  70:	0030                	addi	a2,sp,8
  72:	0000                	unimp
  74:	04f8                	addi	a4,sp,588
  76:	2000                	fld	fs0,0(s0)
  78:	0032                	c.slli	zero,0xc
  7a:	0000                	unimp
  7c:	0e42                	slli	t3,t3,0x10
  7e:	4210                	lw	a2,0(a2)
  80:	0181                	addi	gp,gp,0
  82:	0a5a                	slli	s4,s4,0x16
  84:	44c1                	li	s1,16
  86:	000e                	c.slli	zero,0x3
  88:	0b42                	slli	s6,s6,0x10
  8a:	c148                	sw	a0,4(a0)
  8c:	0e44                	addi	s1,sp,788
  8e:	0000                	unimp
  90:	0018                	0x18
  92:	0000                	unimp
  94:	0030                	addi	a2,sp,8
  96:	0000                	unimp
  98:	052a                	slli	a0,a0,0xa
  9a:	2000                	fld	fs0,0(s0)
  9c:	0012                	c.slli	zero,0x4
  9e:	0000                	unimp
  a0:	0e42                	slli	t3,t3,0x10
  a2:	4610                	lw	a2,8(a2)
  a4:	0181                	addi	gp,gp,0
  a6:	c144                	sw	s1,4(a0)
  a8:	0e44                	addi	s1,sp,788
  aa:	0000                	unimp
  ac:	000c                	0xc
  ae:	0000                	unimp
  b0:	ffff                	0xffff
  b2:	ffff                	0xffff
  b4:	0001                	nop
  b6:	7c01                	lui	s8,0xfffe0
  b8:	0d01                	addi	s10,s10,0
  ba:	0002                	c.slli64	zero
  bc:	000c                	0xc
  be:	0000                	unimp
  c0:	00ac                	addi	a1,sp,72
  c2:	0000                	unimp
  c4:	053c                	addi	a5,sp,648
  c6:	2000                	fld	fs0,0(s0)
  c8:	000e                	c.slli	zero,0x3
  ca:	0000                	unimp
  cc:	000c                	0xc
  ce:	0000                	unimp
  d0:	00ac                	addi	a1,sp,72
  d2:	0000                	unimp
  d4:	054a                	slli	a0,a0,0x12
  d6:	2000                	fld	fs0,0(s0)
  d8:	00de                	slli	ra,ra,0x17
  da:	0000                	unimp
  dc:	000c                	0xc
  de:	0000                	unimp
  e0:	00ac                	addi	a1,sp,72
  e2:	0000                	unimp
  e4:	0628                	addi	a0,sp,776
  e6:	2000                	fld	fs0,0(s0)
  e8:	000a                	c.slli	zero,0x2
  ea:	0000                	unimp
  ec:	000c                	0xc
  ee:	0000                	unimp
  f0:	00ac                	addi	a1,sp,72
  f2:	0000                	unimp
  f4:	0632                	slli	a2,a2,0xc
  f6:	2000                	fld	fs0,0(s0)
  f8:	0036                	c.slli	zero,0xd
  fa:	0000                	unimp
  fc:	000c                	0xc
  fe:	0000                	unimp
 100:	00ac                	addi	a1,sp,72
 102:	0000                	unimp
 104:	0668                	addi	a0,sp,780
 106:	2000                	fld	fs0,0(s0)
 108:	0018                	0x18
 10a:	0000                	unimp
 10c:	000c                	0xc
 10e:	0000                	unimp
 110:	00ac                	addi	a1,sp,72
 112:	0000                	unimp
 114:	0680                	addi	s0,sp,832
 116:	2000                	fld	fs0,0(s0)
 118:	0024                	addi	s1,sp,8
 11a:	0000                	unimp
 11c:	000c                	0xc
 11e:	0000                	unimp
 120:	00ac                	addi	a1,sp,72
 122:	0000                	unimp
 124:	06a4                	addi	s1,sp,840
 126:	2000                	fld	fs0,0(s0)
 128:	003e                	c.slli	zero,0xf
 12a:	0000                	unimp
 12c:	000c                	0xc
 12e:	0000                	unimp
 130:	00ac                	addi	a1,sp,72
 132:	0000                	unimp
 134:	06e2                	slli	a3,a3,0x18
 136:	2000                	fld	fs0,0(s0)
 138:	00d2                	slli	ra,ra,0x14
 13a:	0000                	unimp
 13c:	0028                	addi	a0,sp,8
 13e:	0000                	unimp
 140:	00ac                	addi	a1,sp,72
 142:	0000                	unimp
 144:	07b4                	addi	a3,sp,968
 146:	2000                	fld	fs0,0(s0)
 148:	003c                	addi	a5,sp,8
 14a:	0000                	unimp
 14c:	0e42                	slli	t3,t3,0x10
 14e:	4810                	lw	a2,16(s0)
 150:	0288                	addi	a0,sp,320
 152:	0389                	addi	t2,t2,2
 154:	0492                	slli	s1,s1,0x4
 156:	0181                	addi	gp,gp,0
 158:	0a5e                	slli	s4,s4,0x17
 15a:	42c1                	li	t0,16
 15c:	42c8                	lw	a0,4(a3)
 15e:	42c9                	li	t0,18
 160:	42d2                	lw	t0,20(sp)
 162:	000e                	c.slli	zero,0x3
 164:	0b42                	slli	s6,s6,0x10
 166:	0000                	unimp
 168:	0034                	addi	a3,sp,8
 16a:	0000                	unimp
 16c:	00ac                	addi	a1,sp,72
 16e:	0000                	unimp
 170:	07f0                	addi	a2,sp,972
 172:	2000                	fld	fs0,0(s0)
 174:	00ba                	slli	ra,ra,0xe
 176:	0000                	unimp
 178:	0e42                	slli	t3,t3,0x10
 17a:	4620                	lw	s0,72(a2)
 17c:	0492                	slli	s1,s1,0x4
 17e:	0694                	addi	a3,sp,832
 180:	0181                	addi	gp,gp,0
 182:	8848                	0x8848
 184:	8902                	jr	s2
 186:	95059303          	lh	t1,-1712(a1)
 18a:	0a6c0207          	0xa6c0207
 18e:	42c1                	li	t0,16
 190:	42c8                	lw	a0,4(a3)
 192:	42c9                	li	t0,18
 194:	42d2                	lw	t0,20(sp)
 196:	42d442d3          	0x42d442d3
 19a:	42d5                	li	t0,21
 19c:	000e                	c.slli	zero,0x3
 19e:	0b42                	slli	s6,s6,0x10
 1a0:	0034                	addi	a3,sp,8
 1a2:	0000                	unimp
 1a4:	00ac                	addi	a1,sp,72
 1a6:	0000                	unimp
 1a8:	08aa                	slli	a7,a7,0xa
 1aa:	2000                	fld	fs0,0(s0)
 1ac:	00a4                	addi	s1,sp,72
 1ae:	0000                	unimp
 1b0:	0e42                	slli	t3,t3,0x10
 1b2:	4220                	lw	s0,64(a2)
 1b4:	0288                	addi	a0,sp,320
 1b6:	9356                	add	t1,t1,s5
 1b8:	8105                	srli	a0,a0,0x1
 1ba:	8901                	andi	a0,a0,0
 1bc:	94049203          	lh	tp,-1728(s1) # 940 <_prog_start-0x1ffff6c0>
 1c0:	9506                	add	a0,a0,ra
 1c2:	0a6e0207          	0xa6e0207
 1c6:	42c1                	li	t0,16
 1c8:	42c8                	lw	a0,4(a3)
 1ca:	42c9                	li	t0,18
 1cc:	42d2                	lw	t0,20(sp)
 1ce:	42d442d3          	0x42d442d3
 1d2:	42d5                	li	t0,21
 1d4:	000e                	c.slli	zero,0x3
 1d6:	0b42                	slli	s6,s6,0x10
 1d8:	0030                	addi	a2,sp,8
 1da:	0000                	unimp
 1dc:	00ac                	addi	a1,sp,72
 1de:	0000                	unimp
 1e0:	094e                	slli	s2,s2,0x13
 1e2:	2000                	fld	fs0,0(s0)
 1e4:	00a6                	slli	ra,ra,0x9
 1e6:	0000                	unimp
 1e8:	0e42                	slli	t3,t3,0x10
 1ea:	4220                	lw	s0,64(a2)
 1ec:	884e0593          	addi	a1,t3,-1916 # 19884 <_prog_start-0x1ffe677c>
 1f0:	8102                	jr	sp
 1f2:	8901                	andi	a0,a0,0
 1f4:	94049203          	lh	tp,-1728(s1)
 1f8:	0206                	slli	tp,tp,0x1
 1fa:	0a64                	addi	s1,sp,284
 1fc:	42c1                	li	t0,16
 1fe:	42c8                	lw	a0,4(a3)
 200:	42c9                	li	t0,18
 202:	42d2                	lw	t0,20(sp)
 204:	42d442d3          	0x42d442d3
 208:	000e                	c.slli	zero,0x3
 20a:	0b42                	slli	s6,s6,0x10
 20c:	002c                	addi	a1,sp,8
 20e:	0000                	unimp
 210:	00ac                	addi	a1,sp,72
 212:	0000                	unimp
 214:	09f4                	addi	a3,sp,220
 216:	2000                	fld	fs0,0(s0)
 218:	005a                	c.slli	zero,0x16
 21a:	0000                	unimp
 21c:	0e42                	slli	t3,t3,0x10
 21e:	4610                	lw	a2,8(a2)
 220:	0288                	addi	a0,sp,320
 222:	0389                	addi	t2,t2,2
 224:	0181                	addi	gp,gp,0
 226:	3002                	fld	ft0,32(sp)
 228:	c10a                	sw	sp,128(sp)
 22a:	c842                	sw	a6,16(sp)
 22c:	c942                	sw	a6,144(sp)
 22e:	0e42                	slli	t3,t3,0x10
 230:	4200                	lw	s0,0(a2)
 232:	42c1520b          	0x42c1520b
 236:	42c8                	lw	a0,4(a3)
 238:	42c9                	li	t0,18
 23a:	000e                	c.slli	zero,0x3
 23c:	000c                	0xc
 23e:	0000                	unimp
 240:	00ac                	addi	a1,sp,72
 242:	0000                	unimp
 244:	0a4e                	slli	s4,s4,0x13
 246:	2000                	fld	fs0,0(s0)
 248:	0034                	addi	a3,sp,8
 24a:	0000                	unimp
 24c:	000c                	0xc
 24e:	0000                	unimp
 250:	00ac                	addi	a1,sp,72
 252:	0000                	unimp
 254:	0a82                	c.slli64	s5
 256:	2000                	fld	fs0,0(s0)
 258:	0018                	0x18
 25a:	0000                	unimp
 25c:	000c                	0xc
 25e:	0000                	unimp
 260:	00ac                	addi	a1,sp,72
 262:	0000                	unimp
 264:	0a9a                	slli	s5,s5,0x6
 266:	2000                	fld	fs0,0(s0)
 268:	0016                	c.slli	zero,0x5
 26a:	0000                	unimp
 26c:	000c                	0xc
 26e:	0000                	unimp
 270:	00ac                	addi	a1,sp,72
 272:	0000                	unimp
 274:	0ab0                	addi	a2,sp,344
 276:	2000                	fld	fs0,0(s0)
 278:	0102                	c.slli64	sp
 27a:	0000                	unimp
 27c:	000c                	0xc
 27e:	0000                	unimp
 280:	00ac                	addi	a1,sp,72
 282:	0000                	unimp
 284:	0bb2                	slli	s7,s7,0xc
 286:	2000                	fld	fs0,0(s0)
 288:	00f0                	addi	a2,sp,76
 28a:	0000                	unimp
 28c:	000c                	0xc
 28e:	0000                	unimp
 290:	00ac                	addi	a1,sp,72
 292:	0000                	unimp
 294:	0ca2                	slli	s9,s9,0x8
 296:	2000                	fld	fs0,0(s0)
 298:	00f6                	slli	ra,ra,0x1d
 29a:	0000                	unimp
 29c:	001c                	0x1c
 29e:	0000                	unimp
 2a0:	00ac                	addi	a1,sp,72
 2a2:	0000                	unimp
 2a4:	0d98                	addi	a4,sp,720
 2a6:	2000                	fld	fs0,0(s0)
 2a8:	00be                	slli	ra,ra,0xf
 2aa:	0000                	unimp
 2ac:	0e58                	addi	a4,sp,788
 2ae:	4210                	lw	a2,0(a2)
 2b0:	0181                	addi	gp,gp,0
 2b2:	5802                	lw	a6,32(sp)
 2b4:	c10a                	sw	sp,128(sp)
 2b6:	0e48                	addi	a0,sp,788
 2b8:	4200                	lw	s0,0(a2)
 2ba:	000c000b          	0xc000b
 2be:	0000                	unimp
 2c0:	00ac                	addi	a1,sp,72
 2c2:	0000                	unimp
 2c4:	0e56                	slli	t3,t3,0x15
 2c6:	2000                	fld	fs0,0(s0)
 2c8:	000e                	c.slli	zero,0x3
 2ca:	0000                	unimp
 2cc:	000c                	0xc
 2ce:	0000                	unimp
 2d0:	00ac                	addi	a1,sp,72
 2d2:	0000                	unimp
 2d4:	0e64                	addi	s1,sp,796
 2d6:	2000                	fld	fs0,0(s0)
 2d8:	000a                	c.slli	zero,0x2
 2da:	0000                	unimp
 2dc:	000c                	0xc
 2de:	0000                	unimp
 2e0:	00ac                	addi	a1,sp,72
 2e2:	0000                	unimp
 2e4:	0e6e                	slli	t3,t3,0x1b
 2e6:	2000                	fld	fs0,0(s0)
 2e8:	003e                	c.slli	zero,0xf
 2ea:	0000                	unimp
 2ec:	000c                	0xc
 2ee:	0000                	unimp
 2f0:	00ac                	addi	a1,sp,72
 2f2:	0000                	unimp
 2f4:	0eac                	addi	a1,sp,856
 2f6:	2000                	fld	fs0,0(s0)
 2f8:	0040                	addi	s0,sp,4
 2fa:	0000                	unimp
 2fc:	000c                	0xc
 2fe:	0000                	unimp
 300:	00ac                	addi	a1,sp,72
 302:	0000                	unimp
 304:	0eec                	addi	a1,sp,860
 306:	2000                	fld	fs0,0(s0)
 308:	0008                	0x8
 30a:	0000                	unimp
 30c:	000c                	0xc
 30e:	0000                	unimp
 310:	00ac                	addi	a1,sp,72
 312:	0000                	unimp
 314:	0ef4                	addi	a3,sp,860
 316:	2000                	fld	fs0,0(s0)
 318:	000c                	0xc
 31a:	0000                	unimp
 31c:	000c                	0xc
 31e:	0000                	unimp
 320:	00ac                	addi	a1,sp,72
 322:	0000                	unimp
 324:	0f00                	addi	s0,sp,912
 326:	2000                	fld	fs0,0(s0)
 328:	0032                	c.slli	zero,0xc
 32a:	0000                	unimp
 32c:	0038                	addi	a4,sp,8
 32e:	0000                	unimp
 330:	00ac                	addi	a1,sp,72
 332:	0000                	unimp
 334:	0f32                	slli	t5,t5,0xc
 336:	2000                	fld	fs0,0(s0)
 338:	00d0                	addi	a2,sp,68
 33a:	0000                	unimp
 33c:	0e42                	slli	t3,t3,0x10
 33e:	4220                	lw	s0,64(a2)
 340:	88500593          	li	a1,-1915
 344:	9402                	jalr	s0
 346:	8106                	mv	sp,ra
 348:	8901                	andi	a0,a0,0
 34a:	95049203          	lh	tp,-1712(s1)
 34e:	02089607          	0x2089607
 352:	0aa6                	slli	s5,s5,0x9
 354:	42c1                	li	t0,16
 356:	42c8                	lw	a0,4(a3)
 358:	42c9                	li	t0,18
 35a:	42d2                	lw	t0,20(sp)
 35c:	42d442d3          	0x42d442d3
 360:	42d5                	li	t0,21
 362:	42d6                	lw	t0,84(sp)
 364:	000e                	c.slli	zero,0x3
 366:	0b42                	slli	s6,s6,0x10
 368:	0040                	addi	s0,sp,4
 36a:	0000                	unimp
 36c:	00ac                	addi	a1,sp,72
 36e:	0000                	unimp
 370:	1002                	c.slli	zero,0x20
 372:	2000                	fld	fs0,0(s0)
 374:	00aa                	slli	ra,ra,0xa
 376:	0000                	unimp
 378:	4802                	lw	a6,0(sp)
 37a:	200e                	fld	ft0,192(sp)
 37c:	8850                	0x8850
 37e:	8902                	jr	s2
 380:	93049203          	lh	tp,-1744(s1)
 384:	8105                	srli	a0,a0,0x1
 386:	9401                	srai	s0,s0,0x20
 388:	6806                	flw	fa6,64(sp)
 38a:	c10a                	sw	sp,128(sp)
 38c:	c842                	sw	a6,16(sp)
 38e:	c942                	sw	a6,144(sp)
 390:	d242                	sw	a6,36(sp)
 392:	d342                	sw	a6,164(sp)
 394:	d442                	sw	a6,40(sp)
 396:	0e46                	slli	t3,t3,0x11
 398:	4200                	lw	s0,0(a2)
 39a:	42c1420b          	0x42c1420b
 39e:	42c8                	lw	a0,4(a3)
 3a0:	42c9                	li	t0,18
 3a2:	42d2                	lw	t0,20(sp)
 3a4:	44d442d3          	0x44d442d3
 3a8:	000e                	c.slli	zero,0x3
 3aa:	0000                	unimp
 3ac:	000c                	0xc
 3ae:	0000                	unimp
 3b0:	00ac                	addi	a1,sp,72
 3b2:	0000                	unimp
 3b4:	10ac                	addi	a1,sp,104
 3b6:	2000                	fld	fs0,0(s0)
 3b8:	0062                	c.slli	zero,0x18
 3ba:	0000                	unimp
 3bc:	001c                	0x1c
 3be:	0000                	unimp
 3c0:	00ac                	addi	a1,sp,72
 3c2:	0000                	unimp
 3c4:	110e                	slli	sp,sp,0x23
 3c6:	2000                	fld	fs0,0(s0)
 3c8:	00ec                	addi	a1,sp,76
 3ca:	0000                	unimp
 3cc:	0e48                	addi	a0,sp,788
 3ce:	4220                	lw	s0,64(a2)
 3d0:	0181                	addi	gp,gp,0
 3d2:	b802                	fsd	ft0,48(sp)
 3d4:	c10a                	sw	sp,128(sp)
 3d6:	0e4a                	slli	t3,t3,0x12
 3d8:	4400                	lw	s0,8(s0)
 3da:	000c000b          	0xc000b
 3de:	0000                	unimp
 3e0:	ffff                	0xffff
 3e2:	ffff                	0xffff
 3e4:	0001                	nop
 3e6:	7c01                	lui	s8,0xfffe0
 3e8:	0d01                	addi	s10,s10,0
 3ea:	0002                	c.slli64	zero
 3ec:	000c                	0xc
 3ee:	0000                	unimp
 3f0:	03dc                	addi	a5,sp,452
 3f2:	0000                	unimp
 3f4:	11fa                	slli	gp,gp,0x3e
 3f6:	2000                	fld	fs0,0(s0)
 3f8:	0014                	0x14
 3fa:	0000                	unimp
 3fc:	000c                	0xc
 3fe:	0000                	unimp
 400:	03dc                	addi	a5,sp,452
 402:	0000                	unimp
 404:	120e                	slli	tp,tp,0x23
 406:	2000                	fld	fs0,0(s0)
 408:	000e                	c.slli	zero,0x3
 40a:	0000                	unimp
 40c:	000c                	0xc
 40e:	0000                	unimp
 410:	03dc                	addi	a5,sp,452
 412:	0000                	unimp
 414:	121c                	addi	a5,sp,288
 416:	2000                	fld	fs0,0(s0)
 418:	000c                	0xc
 41a:	0000                	unimp
 41c:	000c                	0xc
 41e:	0000                	unimp
 420:	03dc                	addi	a5,sp,452
 422:	0000                	unimp
 424:	1228                	addi	a0,sp,296
 426:	2000                	fld	fs0,0(s0)
 428:	0018                	0x18
 42a:	0000                	unimp
 42c:	000c                	0xc
 42e:	0000                	unimp
 430:	03dc                	addi	a5,sp,452
 432:	0000                	unimp
 434:	1240                	addi	s0,sp,292
 436:	2000                	fld	fs0,0(s0)
 438:	0098                	addi	a4,sp,64
 43a:	0000                	unimp
 43c:	000c                	0xc
 43e:	0000                	unimp
 440:	ffff                	0xffff
 442:	ffff                	0xffff
 444:	0001                	nop
 446:	7c01                	lui	s8,0xfffe0
 448:	0d01                	addi	s10,s10,0
 44a:	0002                	c.slli64	zero
 44c:	001c                	0x1c
 44e:	0000                	unimp
 450:	043c                	addi	a5,sp,520
 452:	0000                	unimp
 454:	12d8                	addi	a4,sp,356
 456:	2000                	fld	fs0,0(s0)
 458:	0036                	c.slli	zero,0xd
 45a:	0000                	unimp
 45c:	0e42                	slli	t3,t3,0x10
 45e:	4410                	lw	a2,8(s0)
 460:	0288                	addi	a0,sp,320
 462:	0181                	addi	gp,gp,0
 464:	c868                	sw	a0,84(s0)
 466:	c142                	sw	a6,128(sp)
 468:	0e42                	slli	t3,t3,0x10
 46a:	0000                	unimp
 46c:	001c                	0x1c
 46e:	0000                	unimp
 470:	043c                	addi	a5,sp,520
 472:	0000                	unimp
 474:	130e                	slli	t1,t1,0x23
 476:	2000                	fld	fs0,0(s0)
 478:	0042                	c.slli	zero,0x10
 47a:	0000                	unimp
 47c:	0e48                	addi	a0,sp,788
 47e:	4410                	lw	a2,8(s0)
 480:	0288                	addi	a0,sp,320
 482:	0181                	addi	gp,gp,0
 484:	c16e                	sw	s11,128(sp)
 486:	c842                	sw	a6,16(sp)
 488:	0e42                	slli	t3,t3,0x10
 48a:	0000                	unimp
 48c:	0024                	addi	s1,sp,8
 48e:	0000                	unimp
 490:	043c                	addi	a5,sp,520
 492:	0000                	unimp
 494:	1350                	addi	a2,sp,420
 496:	2000                	fld	fs0,0(s0)
 498:	004e                	c.slli	zero,0x13
 49a:	0000                	unimp
 49c:	0e48                	addi	a0,sp,788
 49e:	4810                	lw	a2,16(s0)
 4a0:	0288                	addi	a0,sp,320
 4a2:	0389                	addi	t2,t2,2
 4a4:	0181                	addi	gp,gp,0
 4a6:	0492                	slli	s1,s1,0x4
 4a8:	c174                	sw	a3,68(a0)
 4aa:	c842                	sw	a6,16(sp)
 4ac:	c942                	sw	a6,144(sp)
 4ae:	d242                	sw	a6,36(sp)
 4b0:	0e42                	slli	t3,t3,0x10
 4b2:	0000                	unimp
 4b4:	0024                	addi	s1,sp,8
 4b6:	0000                	unimp
 4b8:	043c                	addi	a5,sp,520
 4ba:	0000                	unimp
 4bc:	139e                	slli	t2,t2,0x27
 4be:	2000                	fld	fs0,0(s0)
 4c0:	0070                	addi	a2,sp,12
 4c2:	0000                	unimp
 4c4:	0e42                	slli	t3,t3,0x10
 4c6:	4210                	lw	a2,0(a2)
 4c8:	0288                	addi	a0,sp,320
 4ca:	8948                	0x8948
 4cc:	02018103          	lb	sp,32(gp) # 80000da0 <__global_pointer$+0x20>
 4d0:	0a52                	slli	s4,s4,0x14
 4d2:	42c1                	li	t0,16
 4d4:	42c8                	lw	a0,4(a3)
 4d6:	44c9                	li	s1,18
 4d8:	000e                	c.slli	zero,0x3
 4da:	0b42                	slli	s6,s6,0x10
 4dc:	0018                	0x18
 4de:	0000                	unimp
 4e0:	043c                	addi	a5,sp,520
 4e2:	0000                	unimp
 4e4:	140e                	slli	s0,s0,0x23
 4e6:	2000                	fld	fs0,0(s0)
 4e8:	000e                	c.slli	zero,0x3
 4ea:	0000                	unimp
 4ec:	0e42                	slli	t3,t3,0x10
 4ee:	4210                	lw	a2,0(a2)
 4f0:	0181                	addi	gp,gp,0
 4f2:	c144                	sw	s1,4(a0)
 4f4:	0e44                	addi	s1,sp,788
 4f6:	0000                	unimp
 4f8:	0044                	addi	s1,sp,4
 4fa:	0000                	unimp
 4fc:	043c                	addi	a5,sp,520
 4fe:	0000                	unimp
 500:	141c                	addi	a5,sp,544
 502:	2000                	fld	fs0,0(s0)
 504:	01d0                	addi	a2,sp,196
 506:	0000                	unimp
 508:	0e42                	slli	t3,t3,0x10
 50a:	4230                	lw	a2,64(a2)
 50c:	0288                	addi	a0,sp,320
 50e:	9356                	add	t1,t1,s5
 510:	9405                	srai	s0,s0,0x21
 512:	9706                	add	a4,a4,ra
 514:	8109                	srli	a0,a0,0x2
 516:	8901                	andi	a0,a0,0
 518:	95049203          	lh	tp,-1712(s1)
 51c:	98089607          	0x98089607
 520:	030a                	slli	t1,t1,0x2
 522:	00cc                	addi	a1,sp,68
 524:	c10a                	sw	sp,128(sp)
 526:	c842                	sw	a6,16(sp)
 528:	c942                	sw	a6,144(sp)
 52a:	d242                	sw	a6,36(sp)
 52c:	d342                	sw	a6,164(sp)
 52e:	d442                	sw	a6,40(sp)
 530:	d542                	sw	a6,168(sp)
 532:	d642                	sw	a6,44(sp)
 534:	d742                	sw	a6,172(sp)
 536:	d842                	sw	a6,48(sp)
 538:	0e42                	slli	t3,t3,0x10
 53a:	4200                	lw	s0,0(a2)
 53c:	0000000b          	0xb
 540:	0040                	addi	s0,sp,4
 542:	0000                	unimp
 544:	043c                	addi	a5,sp,520
 546:	0000                	unimp
 548:	15ec                	addi	a1,sp,748
 54a:	2000                	fld	fs0,0(s0)
 54c:	0188                	addi	a0,sp,192
 54e:	0000                	unimp
 550:	0e42                	slli	t3,t3,0x10
 552:	4230                	lw	a2,64(a2)
 554:	0694                	addi	a3,sp,832
 556:	8856                	mv	a6,s5
 558:	9302                	jalr	t1
 55a:	9505                	srai	a0,a0,0x21
 55c:	81089607          	0x81089607
 560:	8901                	andi	a0,a0,0
 562:	97049203          	lh	tp,-1680(s1)
 566:	9809                	andi	s0,s0,-30
 568:	020a                	slli	tp,tp,0x2
 56a:	0a9c                	addi	a5,sp,336
 56c:	42c1                	li	t0,16
 56e:	44c8                	lw	a0,12(s1)
 570:	42c9                	li	t0,18
 572:	42d2                	lw	t0,20(sp)
 574:	42d442d3          	0x42d442d3
 578:	42d5                	li	t0,21
 57a:	42d6                	lw	t0,84(sp)
 57c:	42d842d7          	0x42d842d7
 580:	000e                	c.slli	zero,0x3
 582:	0b42                	slli	s6,s6,0x10
 584:	0050                	addi	a2,sp,4
 586:	0000                	unimp
 588:	043c                	addi	a5,sp,520
 58a:	0000                	unimp
 58c:	1774                	addi	a3,sp,940
 58e:	2000                	fld	fs0,0(s0)
 590:	020a                	slli	tp,tp,0x2
 592:	0000                	unimp
 594:	0e42                	slli	t3,t3,0x10
 596:	4240                	lw	s0,4(a2)
 598:	0389                	addi	t2,t2,2
 59a:	925c                	0x925c
 59c:	9304                	0x9304
 59e:	9505                	srai	a0,a0,0x21
 5a0:	98099707          	0x98099707
 5a4:	9a0a                	add	s4,s4,sp
 5a6:	9b0c                	0x9b0c
 5a8:	810d                	srli	a0,a0,0x3
 5aa:	8801                	andi	s0,s0,0
 5ac:	9402                	jalr	s0
 5ae:	9606                	add	a2,a2,ra
 5b0:	9908                	0x9908
 5b2:	0184030b          	0x184030b
 5b6:	c10a                	sw	sp,128(sp)
 5b8:	c842                	sw	a6,16(sp)
 5ba:	c944                	sw	s1,20(a0)
 5bc:	d242                	sw	a6,36(sp)
 5be:	d342                	sw	a6,164(sp)
 5c0:	d442                	sw	a6,40(sp)
 5c2:	d542                	sw	a6,168(sp)
 5c4:	d642                	sw	a6,44(sp)
 5c6:	d742                	sw	a6,172(sp)
 5c8:	d842                	sw	a6,48(sp)
 5ca:	d942                	sw	a6,176(sp)
 5cc:	da42                	sw	a6,52(sp)
 5ce:	db42                	sw	a6,180(sp)
 5d0:	0e42                	slli	t3,t3,0x10
 5d2:	4200                	lw	s0,0(a2)
 5d4:	0000000b          	0xb
 5d8:	0040                	addi	s0,sp,4
 5da:	0000                	unimp
 5dc:	043c                	addi	a5,sp,520
 5de:	0000                	unimp
 5e0:	197e                	slli	s2,s2,0x3f
 5e2:	2000                	fld	fs0,0(s0)
 5e4:	0130                	addi	a2,sp,136
 5e6:	0000                	unimp
 5e8:	0e42                	slli	t3,t3,0x10
 5ea:	4430                	lw	a2,72(s0)
 5ec:	06940593          	addi	a1,s0,105 # ffff8069 <_sp+0x7fff4069>
 5f0:	8950                	0x8950
 5f2:	96079503          	lh	a0,-1696(a5)
 5f6:	9708                	0x9708
 5f8:	9809                	andi	s0,s0,-30
 5fa:	810a                	mv	sp,sp
 5fc:	8801                	andi	s0,s0,0
 5fe:	9202                	jalr	tp
 600:	0204                	addi	s1,sp,256
 602:	0ab6                	slli	s5,s5,0xd
 604:	42c1                	li	t0,16
 606:	44c8                	lw	a0,12(s1)
 608:	42c9                	li	t0,18
 60a:	42d2                	lw	t0,20(sp)
 60c:	42d442d3          	0x42d442d3
 610:	42d5                	li	t0,21
 612:	42d6                	lw	t0,84(sp)
 614:	42d842d7          	0x42d842d7
 618:	000e                	c.slli	zero,0x3
 61a:	0b42                	slli	s6,s6,0x10
 61c:	0028                	addi	a0,sp,8
 61e:	0000                	unimp
 620:	043c                	addi	a5,sp,520
 622:	0000                	unimp
 624:	1aae                	slli	s5,s5,0x2b
 626:	2000                	fld	fs0,0(s0)
 628:	001e                	c.slli	zero,0x7
 62a:	0000                	unimp
 62c:	0e42                	slli	t3,t3,0x10
 62e:	4410                	lw	a2,8(s0)
 630:	0288                	addi	a0,sp,320
 632:	0181                	addi	gp,gp,0
 634:	0a48                	addi	a0,sp,276
 636:	42c1                	li	t0,16
 638:	42c8                	lw	a0,4(a3)
 63a:	000e                	c.slli	zero,0x3
 63c:	0b42                	slli	s6,s6,0x10
 63e:	c844                	sw	s1,20(s0)
 640:	c142                	sw	a6,128(sp)
 642:	0e42                	slli	t3,t3,0x10
 644:	0000                	unimp
 646:	0000                	unimp
 648:	001c                	0x1c
 64a:	0000                	unimp
 64c:	043c                	addi	a5,sp,520
 64e:	0000                	unimp
 650:	1acc                	addi	a1,sp,372
 652:	2000                	fld	fs0,0(s0)
 654:	00d0                	addi	a2,sp,68
 656:	0000                	unimp
 658:	0e48                	addi	a0,sp,788
 65a:	4410                	lw	a2,8(s0)
 65c:	0181                	addi	gp,gp,0
 65e:	0288                	addi	a0,sp,320
 660:	bc02                	fsd	ft0,56(sp)
 662:	42c1                	li	t0,16
 664:	44c8                	lw	a0,12(s1)
 666:	000e                	c.slli	zero,0x3
