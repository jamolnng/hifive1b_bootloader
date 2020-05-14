
/mnt/e/Users/Jesse Laning/Documents/GitHub/hifive1b_bootloader/build/release/hifive1_revb_bootloader:     file format elf32-littleriscv


Disassembly of section .init:

20000000 <_enter>:
20000000:	4081                	li	ra,0
20000002:	4101                	li	sp,0
20000004:	4181                	li	gp,0
20000006:	4201                	li	tp,0
20000008:	4281                	li	t0,0
2000000a:	4301                	li	t1,0
2000000c:	4381                	li	t2,0
2000000e:	4401                	li	s0,0
20000010:	4481                	li	s1,0
20000012:	4501                	li	a0,0
20000014:	4581                	li	a1,0
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
20000046:	30505073          	csrwi	mtvec,0

2000004a <data_init>:
2000004a:	00000297          	auipc	t0,0x0
2000004e:	5ae28293          	addi	t0,t0,1454 # 200005f8 <_data_lma>
20000052:	60000317          	auipc	t1,0x60000
20000056:	fae30313          	addi	t1,t1,-82 # 80000000 <_data>
2000005a:	60000397          	auipc	t2,0x60000
2000005e:	fae38393          	addi	t2,t2,-82 # 80000008 <print_to_uart1>
20000062:	00628c63          	beq	t0,t1,2000007a <bss_init>
20000066:	00737a63          	bgeu	t1,t2,2000007a <bss_init>

2000006a <data_init_loop>:
2000006a:	0002a503          	lw	a0,0(t0)
2000006e:	0291                	addi	t0,t0,4
20000070:	00a32023          	sw	a0,0(t1)
20000074:	0311                	addi	t1,t1,4
20000076:	fe736ae3          	bltu	t1,t2,2000006a <data_init_loop>

2000007a <bss_init>:
2000007a:	60000297          	auipc	t0,0x60000
2000007e:	f8e28293          	addi	t0,t0,-114 # 80000008 <print_to_uart1>
20000082:	60000317          	auipc	t1,0x60000
20000086:	04e30313          	addi	t1,t1,78 # 800000d0 <_ebss>
2000008a:	0062f763          	bgeu	t0,t1,20000098 <bss_init_end>

2000008e <bss_init_loop>:
2000008e:	0002a023          	sw	zero,0(t0)
20000092:	0291                	addi	t0,t0,4
20000094:	fe537de3          	bgeu	t1,t0,2000008e <bss_init_loop>

20000098 <bss_init_end>:
20000098:	60004117          	auipc	sp,0x60004
2000009c:	f6810113          	addi	sp,sp,-152 # 80004000 <_sp>
200000a0:	2011                	jal	200000a4 <main>

200000a2 <end_pgm>:
200000a2:	a001                	j	200000a2 <end_pgm>

Disassembly of section .text:

200000a4 <main>:
200000a4:	10000737          	lui	a4,0x10000
200000a8:	0bc72783          	lw	a5,188(a4) # 100000bc <__stack_size+0xffff8bc>
200000ac:	d027b6b7          	lui	a3,0xd027b
200000b0:	069d                	addi	a3,a3,7
200000b2:	06d79c63          	bne	a5,a3,2000012a <main+0x86>
200000b6:	0a072e23          	sw	zero,188(a4)
200000ba:	100127b7          	lui	a5,0x10012
200000be:	4798                	lw	a4,8(a5)
200000c0:	004006b7          	lui	a3,0x400
200000c4:	ffc00637          	lui	a2,0xffc00
200000c8:	8f55                	or	a4,a4,a3
200000ca:	c798                	sw	a4,8(a5)
200000cc:	43b8                	lw	a4,64(a5)
200000ce:	167d                	addi	a2,a2,-1
200000d0:	0200c5b7          	lui	a1,0x200c
200000d4:	8f55                	or	a4,a4,a3
200000d6:	c3b8                	sw	a4,64(a5)
200000d8:	5f98                	lw	a4,56(a5)
200000da:	6311                	lui	t1,0x4
200000dc:	004008b7          	lui	a7,0x400
200000e0:	8f71                	and	a4,a4,a2
200000e2:	df98                	sw	a4,56(a5)
200000e4:	47d8                	lw	a4,12(a5)
200000e6:	8f55                	or	a4,a4,a3
200000e8:	c7d8                	sw	a4,12(a5)
200000ea:	4798                	lw	a4,8(a5)
200000ec:	fff806b7          	lui	a3,0xfff80
200000f0:	16fd                	addi	a3,a3,-1
200000f2:	8f75                	and	a4,a4,a3
200000f4:	c798                	sw	a4,8(a5)
200000f6:	10012737          	lui	a4,0x10012
200000fa:	ff85a603          	lw	a2,-8(a1) # 200bff8 <__stack_size+0x200b7f8>
200000fe:	ffc5a683          	lw	a3,-4(a1)
20000102:	00660533          	add	a0,a2,t1
20000106:	00c537b3          	sltu	a5,a0,a2
2000010a:	97b6                	add	a5,a5,a3
2000010c:	ff85a603          	lw	a2,-8(a1)
20000110:	ffc5a683          	lw	a3,-4(a1)
20000114:	fef6ece3          	bltu	a3,a5,2000010c <main+0x68>
20000118:	00d79463          	bne	a5,a3,20000120 <main+0x7c>
2000011c:	fea668e3          	bltu	a2,a0,2000010c <main+0x68>
20000120:	433c                	lw	a5,64(a4)
20000122:	0117c7b3          	xor	a5,a5,a7
20000126:	c33c                	sw	a5,64(a4)
20000128:	bfc9                	j	200000fa <main+0x56>
2000012a:	100127b7          	lui	a5,0x10012
2000012e:	4790                	lw	a2,8(a5)
20000130:	000805b7          	lui	a1,0x80
20000134:	1141                	addi	sp,sp,-16
20000136:	c606                	sw	ra,12(sp)
20000138:	8e4d                	or	a2,a2,a1
2000013a:	c790                	sw	a2,8(a5)
2000013c:	43b0                	lw	a2,64(a5)
2000013e:	fff80537          	lui	a0,0xfff80
20000142:	157d                	addi	a0,a0,-1
20000144:	8e4d                	or	a2,a2,a1
20000146:	c3b0                	sw	a2,64(a5)
20000148:	5f90                	lw	a2,56(a5)
2000014a:	0200c837          	lui	a6,0x200c
2000014e:	8e49                	or	a2,a2,a0
20000150:	df90                	sw	a2,56(a5)
20000152:	47d0                	lw	a2,12(a5)
20000154:	8e4d                	or	a2,a2,a1
20000156:	c7d0                	sw	a2,12(a5)
20000158:	478c                	lw	a1,8(a5)
2000015a:	ffc00637          	lui	a2,0xffc00
2000015e:	167d                	addi	a2,a2,-1
20000160:	8df1                	and	a1,a1,a2
20000162:	c78c                	sw	a1,8(a5)
20000164:	5f8c                	lw	a1,56(a5)
20000166:	8e6d                	and	a2,a2,a1
20000168:	df90                	sw	a2,56(a5)
2000016a:	0bc72603          	lw	a2,188(a4) # 100120bc <__stack_size+0x100118bc>
2000016e:	0200c7b7          	lui	a5,0x200c
20000172:	0ad72e23          	sw	a3,188(a4)
20000176:	ff87a503          	lw	a0,-8(a5) # 200bff8 <__stack_size+0x200b7f8>
2000017a:	ffc7a583          	lw	a1,-4(a5)
2000017e:	6791                	lui	a5,0x4
20000180:	97aa                	add	a5,a5,a0
20000182:	00a7b733          	sltu	a4,a5,a0
20000186:	972e                	add	a4,a4,a1
20000188:	ff882503          	lw	a0,-8(a6) # 200bff8 <__stack_size+0x200b7f8>
2000018c:	ffc82583          	lw	a1,-4(a6)
20000190:	fee5ece3          	bltu	a1,a4,20000188 <main+0xe4>
20000194:	00b71463          	bne	a4,a1,2000019c <main+0xf8>
20000198:	fef568e3          	bltu	a0,a5,20000188 <main+0xe4>
2000019c:	100007b7          	lui	a5,0x10000
200001a0:	0ac7ae23          	sw	a2,188(a5) # 100000bc <__stack_size+0xffff8bc>
200001a4:	10012737          	lui	a4,0x10012
200001a8:	00072423          	sw	zero,8(a4) # 10012008 <__stack_size+0x10011808>
200001ac:	00072623          	sw	zero,12(a4)
200001b0:	bed0c6b7          	lui	a3,0xbed0c
200001b4:	04072023          	sw	zero,64(a4)
200001b8:	ed068693          	addi	a3,a3,-304 # bed0bed0 <_sp+0x3ed07ed0>
200001bc:	00d60763          	beq	a2,a3,200001ca <main+0x126>
200001c0:	d027b737          	lui	a4,0xd027b
200001c4:	071d                	addi	a4,a4,7
200001c6:	04e61963          	bne	a2,a4,20000218 <main+0x174>
200001ca:	100007b7          	lui	a5,0x10000
200001ce:	0a07ae23          	sw	zero,188(a5) # 100000bc <__stack_size+0xffff8bc>
200001d2:	0200c7b7          	lui	a5,0x200c
200001d6:	ff87a603          	lw	a2,-8(a5) # 200bff8 <__stack_size+0x200b7f8>
200001da:	ffc7a683          	lw	a3,-4(a5)
200001de:	6791                	lui	a5,0x4
200001e0:	97b2                	add	a5,a5,a2
200001e2:	00c7b733          	sltu	a4,a5,a2
200001e6:	9736                	add	a4,a4,a3
200001e8:	0200c537          	lui	a0,0x200c
200001ec:	ff852603          	lw	a2,-8(a0) # 200bff8 <__stack_size+0x200b7f8>
200001f0:	ffc52683          	lw	a3,-4(a0)
200001f4:	fee6ece3          	bltu	a3,a4,200001ec <main+0x148>
200001f8:	00d71463          	bne	a4,a3,20000200 <main+0x15c>
200001fc:	fef668e3          	bltu	a2,a5,200001ec <main+0x148>
20000200:	20fd                	jal	200002ee <bench_rstclk>
20000202:	2c75                	jal	200004be <esp32_init>
20000204:	200107b7          	lui	a5,0x20010
20000208:	9782                	jalr	a5
2000020a:	40b2                	lw	ra,12(sp)
2000020c:	0012d537          	lui	a0,0x12d
20000210:	68750513          	addi	a0,a0,1671 # 12d687 <__stack_size+0x12ce87>
20000214:	0141                	addi	sp,sp,16
20000216:	8082                	ret
20000218:	0051f737          	lui	a4,0x51f
2000021c:	15e70713          	addi	a4,a4,350 # 51f15e <__stack_size+0x51e95e>
20000220:	14e7a623          	sw	a4,332(a5) # 2001014c <_data_lma+0xfb54>
20000224:	4661                	li	a2,24
20000226:	12c7a023          	sw	a2,288(a5)
2000022a:	14e7a623          	sw	a4,332(a5)
2000022e:	12c7a223          	sw	a2,292(a5)
20000232:	14e7a623          	sw	a4,332(a5)
20000236:	12c7a423          	sw	a2,296(a5)
2000023a:	14e7a623          	sw	a4,332(a5)
2000023e:	12c7a623          	sw	a2,300(a5)
20000242:	14e7a623          	sw	a4,332(a5)
20000246:	03800613          	li	a2,56
2000024a:	12c7a823          	sw	a2,304(a5)
2000024e:	14e7a623          	sw	a4,332(a5)
20000252:	12c7aa23          	sw	a2,308(a5)
20000256:	14e7a623          	sw	a4,332(a5)
2000025a:	12c7ac23          	sw	a2,312(a5)
2000025e:	14e7a623          	sw	a4,332(a5)
20000262:	12c7ae23          	sw	a2,316(a5)
20000266:	0ad7ae23          	sw	a3,188(a5)
2000026a:	0807a223          	sw	zero,132(a5)
2000026e:	14e7a623          	sw	a4,332(a5)
20000272:	1407a423          	sw	zero,328(a5)
20000276:	bfb1                	j	200001d2 <main+0x12e>

20000278 <measure_lfosc_freq>:
20000278:	0200c7b7          	lui	a5,0x200c
2000027c:	fe07ac23          	sw	zero,-8(a5) # 200bff8 <__stack_size+0x200b7f8>
20000280:	ff87a583          	lw	a1,-8(a5)
20000284:	b0002673          	csrr	a2,mcycle
20000288:	6705                	lui	a4,0x1
2000028a:	0200c537          	lui	a0,0x200c
2000028e:	bb770793          	addi	a5,a4,-1097 # bb7 <__stack_size+0x3b7>
20000292:	ff852683          	lw	a3,-8(a0) # 200bff8 <__stack_size+0x200b7f8>
20000296:	8e8d                	sub	a3,a3,a1
20000298:	fed7fde3          	bgeu	a5,a3,20000292 <measure_lfosc_freq+0x1a>
2000029c:	b00027f3          	csrr	a5,mcycle
200002a0:	bb870713          	addi	a4,a4,-1096
200002a4:	8f91                	sub	a5,a5,a2
200002a6:	02e7d7b3          	divu	a5,a5,a4
200002aa:	3e800713          	li	a4,1000
200002ae:	07be                	slli	a5,a5,0xf
200002b0:	02e7d7b3          	divu	a5,a5,a4
200002b4:	1f400737          	lui	a4,0x1f400
200002b8:	02f757b3          	divu	a5,a4,a5
200002bc:	60000717          	auipc	a4,0x60000
200002c0:	d4f72423          	sw	a5,-696(a4) # 80000004 <lfosc_freq>
200002c4:	8082                	ret

200002c6 <_puts>:
200002c6:	60000697          	auipc	a3,0x60000
200002ca:	d4268693          	addi	a3,a3,-702 # 80000008 <print_to_uart1>
200002ce:	00054703          	lbu	a4,0(a0)
200002d2:	e311                	bnez	a4,200002d6 <_puts+0x10>
200002d4:	8082                	ret
200002d6:	4290                	lw	a2,0(a3)
200002d8:	100237b7          	lui	a5,0x10023
200002dc:	e219                	bnez	a2,200002e2 <_puts+0x1c>
200002de:	100137b7          	lui	a5,0x10013
200002e2:	4390                	lw	a2,0(a5)
200002e4:	fe064fe3          	bltz	a2,200002e2 <_puts+0x1c>
200002e8:	c398                	sw	a4,0(a5)
200002ea:	0505                	addi	a0,a0,1
200002ec:	b7cd                	j	200002ce <_puts+0x8>

200002ee <bench_rstclk>:
200002ee:	10014737          	lui	a4,0x10014
200002f2:	433c                	lw	a5,64(a4)
200002f4:	1141                	addi	sp,sp,-16
200002f6:	c606                	sw	ra,12(sp)
200002f8:	9bf1                	andi	a5,a5,-4
200002fa:	c33c                	sw	a5,64(a4)
200002fc:	30047073          	csrci	mstatus,8
20000300:	100127b7          	lui	a5,0x10012
20000304:	0007a423          	sw	zero,8(a5) # 10012008 <__stack_size+0x10011808>
20000308:	0207ac23          	sw	zero,56(a5)
2000030c:	0007a623          	sw	zero,12(a5)
20000310:	0407a023          	sw	zero,64(a5)
20000314:	60000797          	auipc	a5,0x60000
20000318:	cf478793          	addi	a5,a5,-780 # 80000008 <print_to_uart1>
2000031c:	4398                	lw	a4,0(a5)
2000031e:	008407b7          	lui	a5,0x840
20000322:	e319                	bnez	a4,20000328 <bench_rstclk+0x3a>
20000324:	000307b7          	lui	a5,0x30
20000328:	10012737          	lui	a4,0x10012
2000032c:	4754                	lw	a3,12(a4)
2000032e:	8edd                	or	a3,a3,a5
20000330:	c754                	sw	a3,12(a4)
20000332:	4714                	lw	a3,8(a4)
20000334:	8edd                	or	a3,a3,a5
20000336:	c714                	sw	a3,8(a4)
20000338:	5f54                	lw	a3,60(a4)
2000033a:	fff7c793          	not	a5,a5
2000033e:	8efd                	and	a3,a3,a5
20000340:	df54                	sw	a3,60(a4)
20000342:	5f14                	lw	a3,56(a4)
20000344:	8fd5                	or	a5,a5,a3
20000346:	df1c                	sw	a5,56(a4)
20000348:	66c1                	lui	a3,0x10
2000034a:	100137b7          	lui	a5,0x10013
2000034e:	08a00713          	li	a4,138
20000352:	cf98                	sw	a4,24(a5)
20000354:	00168713          	addi	a4,a3,1 # 10001 <__stack_size+0xf801>
20000358:	c798                	sw	a4,8(a5)
2000035a:	4705                	li	a4,1
2000035c:	c7d8                	sw	a4,12(a5)
2000035e:	100087b7          	lui	a5,0x10008
20000362:	00060737          	lui	a4,0x60
20000366:	c798                	sw	a4,8(a5)
20000368:	4798                	lw	a4,8(a5)
2000036a:	8f55                	or	a4,a4,a3
2000036c:	c798                	sw	a4,8(a5)
2000036e:	3729                	jal	20000278 <measure_lfosc_freq>
20000370:	40b2                	lw	ra,12(sp)
20000372:	00000517          	auipc	a0,0x0
20000376:	23e50513          	addi	a0,a0,574 # 200005b0 <esp32_init+0xf2>
2000037a:	0141                	addi	sp,sp,16
2000037c:	b7a9                	j	200002c6 <_puts>

2000037e <strlen>:
2000037e:	4781                	li	a5,0
20000380:	00f50733          	add	a4,a0,a5
20000384:	00074703          	lbu	a4,0(a4) # 60000 <__stack_size+0x5f800>
20000388:	e319                	bnez	a4,2000038e <strlen+0x10>
2000038a:	853e                	mv	a0,a5
2000038c:	8082                	ret
2000038e:	0785                	addi	a5,a5,1
20000390:	bfc5                	j	20000380 <strlen+0x2>

20000392 <strncpy>:
20000392:	167d                	addi	a2,a2,-1
20000394:	87aa                	mv	a5,a0
20000396:	587d                	li	a6,-1
20000398:	01060e63          	beq	a2,a6,200003b4 <strncpy+0x22>
2000039c:	0585                	addi	a1,a1,1
2000039e:	fff5c703          	lbu	a4,-1(a1) # 7ffff <__stack_size+0x7f7ff>
200003a2:	0785                	addi	a5,a5,1
200003a4:	fff60693          	addi	a3,a2,-1 # ffbfffff <_sp+0x7fbfbfff>
200003a8:	fee78fa3          	sb	a4,-1(a5) # 10007fff <__stack_size+0x100077ff>
200003ac:	e709                	bnez	a4,200003b6 <strncpy+0x24>
200003ae:	963e                	add	a2,a2,a5
200003b0:	00c79563          	bne	a5,a2,200003ba <strncpy+0x28>
200003b4:	8082                	ret
200003b6:	8636                	mv	a2,a3
200003b8:	b7c5                	j	20000398 <strncpy+0x6>
200003ba:	0785                	addi	a5,a5,1
200003bc:	fe078fa3          	sb	zero,-1(a5)
200003c0:	bfc5                	j	200003b0 <strncpy+0x1e>

200003c2 <at_send>:
200003c2:	1101                	addi	sp,sp,-32
200003c4:	852e                	mv	a0,a1
200003c6:	cc22                	sw	s0,24(sp)
200003c8:	ca26                	sw	s1,20(sp)
200003ca:	c64e                	sw	s3,12(sp)
200003cc:	ce06                	sw	ra,28(sp)
200003ce:	c84a                	sw	s2,16(sp)
200003d0:	84ae                	mv	s1,a1
200003d2:	60000417          	auipc	s0,0x60000
200003d6:	c2e40413          	addi	s0,s0,-978 # 80000000 <_data>
200003da:	3755                	jal	2000037e <strlen>
200003dc:	401c                	lw	a5,0(s0)
200003de:	89aa                	mv	s3,a0
200003e0:	c38d                	beqz	a5,20000402 <at_send+0x40>
200003e2:	8526                	mv	a0,s1
200003e4:	35cd                	jal	200002c6 <_puts>
200003e6:	00000517          	auipc	a0,0x0
200003ea:	17250513          	addi	a0,a0,370 # 20000558 <esp32_init+0x9a>
200003ee:	3de1                	jal	200002c6 <_puts>
200003f0:	4018                	lw	a4,0(s0)
200003f2:	4789                	li	a5,2
200003f4:	00e7f763          	bgeu	a5,a4,20000402 <at_send+0x40>
200003f8:	00000517          	auipc	a0,0x0
200003fc:	16450513          	addi	a0,a0,356 # 2000055c <esp32_init+0x9e>
20000400:	35d9                	jal	200002c6 <_puts>
20000402:	01099913          	slli	s2,s3,0x10
20000406:	01095913          	srli	s2,s2,0x10
2000040a:	00795793          	srli	a5,s2,0x7
2000040e:	60000717          	auipc	a4,0x60000
20000412:	c6f70fa3          	sb	a5,-897(a4) # 8000008d <tx_buf+0x1>
20000416:	60000797          	auipc	a5,0x60000
2000041a:	c6078c23          	sb	zero,-904(a5) # 8000008e <tx_buf+0x2>
2000041e:	04100793          	li	a5,65
20000422:	60000717          	auipc	a4,0x60000
20000426:	c6f706a3          	sb	a5,-915(a4) # 8000008f <tx_buf+0x3>
2000042a:	60000797          	auipc	a5,0x60000
2000042e:	c7378123          	sb	s3,-926(a5) # 8000008c <tx_buf>
20000432:	401c                	lw	a5,0(s0)
20000434:	4989                	li	s3,2
20000436:	00f9ff63          	bgeu	s3,a5,20000454 <at_send+0x92>
2000043a:	00000517          	auipc	a0,0x0
2000043e:	13250513          	addi	a0,a0,306 # 2000056c <esp32_init+0xae>
20000442:	3551                	jal	200002c6 <_puts>
20000444:	401c                	lw	a5,0(s0)
20000446:	00f9f763          	bgeu	s3,a5,20000454 <at_send+0x92>
2000044a:	00000517          	auipc	a0,0x0
2000044e:	11e50513          	addi	a0,a0,286 # 20000568 <esp32_init+0xaa>
20000452:	3d95                	jal	200002c6 <_puts>
20000454:	60000717          	auipc	a4,0x60000
20000458:	bb874703          	lbu	a4,-1096(a4) # 8000000c <rx_buf>
2000045c:	06200793          	li	a5,98
20000460:	00000517          	auipc	a0,0x0
20000464:	11c50513          	addi	a0,a0,284 # 2000057c <esp32_init+0xbe>
20000468:	02f71563          	bne	a4,a5,20000492 <at_send+0xd0>
2000046c:	864a                	mv	a2,s2
2000046e:	85a6                	mv	a1,s1
20000470:	60000517          	auipc	a0,0x60000
20000474:	c1c50513          	addi	a0,a0,-996 # 8000008c <tx_buf>
20000478:	3f29                	jal	20000392 <strncpy>
2000047a:	60000717          	auipc	a4,0x60000
2000047e:	b9274703          	lbu	a4,-1134(a4) # 8000000c <rx_buf>
20000482:	04100793          	li	a5,65
20000486:	02f71063          	bne	a4,a5,200004a6 <at_send+0xe4>
2000048a:	00000517          	auipc	a0,0x0
2000048e:	10650513          	addi	a0,a0,262 # 20000590 <esp32_init+0xd2>
20000492:	3d15                	jal	200002c6 <_puts>
20000494:	4405                	li	s0,1
20000496:	8522                	mv	a0,s0
20000498:	40f2                	lw	ra,28(sp)
2000049a:	4462                	lw	s0,24(sp)
2000049c:	44d2                	lw	s1,20(sp)
2000049e:	4942                	lw	s2,16(sp)
200004a0:	49b2                	lw	s3,12(sp)
200004a2:	6105                	addi	sp,sp,32
200004a4:	8082                	ret
200004a6:	4018                	lw	a4,0(s0)
200004a8:	4789                	li	a5,2
200004aa:	4401                	li	s0,0
200004ac:	fee7f5e3          	bgeu	a5,a4,20000496 <at_send+0xd4>
200004b0:	00000517          	auipc	a0,0x0
200004b4:	0f450513          	addi	a0,a0,244 # 200005a4 <esp32_init+0xe6>
200004b8:	3539                	jal	200002c6 <_puts>
200004ba:	bff1                	j	20000496 <at_send+0xd4>

200004bc <at_sendrecv>:
200004bc:	b719                	j	200003c2 <at_send>

200004be <esp32_init>:
200004be:	100127b7          	lui	a5,0x10012
200004c2:	5fd8                	lw	a4,60(a5)
200004c4:	1141                	addi	sp,sp,-16
200004c6:	c606                	sw	ra,12(sp)
200004c8:	dc777713          	andi	a4,a4,-569
200004cc:	dfd8                	sw	a4,60(a5)
200004ce:	5f98                	lw	a4,56(a5)
200004d0:	23877713          	andi	a4,a4,568
200004d4:	df98                	sw	a4,56(a5)
200004d6:	43d8                	lw	a4,4(a5)
200004d8:	40076713          	ori	a4,a4,1024
200004dc:	c3d8                	sw	a4,4(a5)
200004de:	100247b7          	lui	a5,0x10024
200004e2:	06400713          	li	a4,100
200004e6:	c398                	sw	a4,0(a5)
200004e8:	00080737          	lui	a4,0x80
200004ec:	c3b8                	sw	a4,64(a5)
200004ee:	4709                	li	a4,2
200004f0:	cb98                	sw	a4,16(a5)
200004f2:	53b8                	lw	a4,96(a5)
200004f4:	9b79                	andi	a4,a4,-2
200004f6:	d3b8                	sw	a4,96(a5)
200004f8:	02078423          	sb	zero,40(a5) # 10024028 <__stack_size+0x10023828>
200004fc:	4f98                	lw	a4,24(a5)
200004fe:	9b71                	andi	a4,a4,-4
20000500:	cf98                	sw	a4,24(a5)
20000502:	10024737          	lui	a4,0x10024
20000506:	477c                	lw	a5,76(a4)
20000508:	fffd                	bnez	a5,20000506 <esp32_init+0x48>
2000050a:	00000517          	auipc	a0,0x0
2000050e:	0da50513          	addi	a0,a0,218 # 200005e4 <esp32_init+0x126>
20000512:	3b55                	jal	200002c6 <_puts>
20000514:	06400613          	li	a2,100
20000518:	00000597          	auipc	a1,0x0
2000051c:	0b858593          	addi	a1,a1,184 # 200005d0 <esp32_init+0x112>
20000520:	10024537          	lui	a0,0x10024
20000524:	3f61                	jal	200004bc <at_sendrecv>
20000526:	06400613          	li	a2,100
2000052a:	00000597          	auipc	a1,0x0
2000052e:	0ae58593          	addi	a1,a1,174 # 200005d8 <esp32_init+0x11a>
20000532:	10024537          	lui	a0,0x10024
20000536:	3759                	jal	200004bc <at_sendrecv>
20000538:	06400613          	li	a2,100
2000053c:	00000597          	auipc	a1,0x0
20000540:	0ac58593          	addi	a1,a1,172 # 200005e8 <esp32_init+0x12a>
20000544:	10024537          	lui	a0,0x10024
20000548:	3f95                	jal	200004bc <at_sendrecv>
2000054a:	40b2                	lw	ra,12(sp)
2000054c:	00000517          	auipc	a0,0x0
20000550:	09850513          	addi	a0,a0,152 # 200005e4 <esp32_init+0x126>
20000554:	0141                	addi	sp,sp,16
20000556:	bb85                	j	200002c6 <_puts>
