
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
2000004e:	3be28293          	addi	t0,t0,958 # 20000408 <_data_lma>
20000052:	60000317          	auipc	t1,0x60000
20000056:	fae30313          	addi	t1,t1,-82 # 80000000 <_data>
2000005a:	60000397          	auipc	t2,0x60000
2000005e:	fa638393          	addi	t2,t2,-90 # 80000000 <_data>
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
2000007e:	f8628293          	addi	t0,t0,-122 # 80000000 <_data>
20000082:	60000317          	auipc	t1,0x60000
20000086:	f8630313          	addi	t1,t1,-122 # 80000008 <_ebss>
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
20000202:	2ab5                	jal	2000037e <esp32_init>
20000204:	200107b7          	lui	a5,0x20010
20000208:	9782                	jalr	a5
2000020a:	40b2                	lw	ra,12(sp)
2000020c:	0012d537          	lui	a0,0x12d
20000210:	68750513          	addi	a0,a0,1671 # 12d687 <__stack_size+0x12ce87>
20000214:	0141                	addi	sp,sp,16
20000216:	8082                	ret
20000218:	0051f737          	lui	a4,0x51f
2000021c:	15e70713          	addi	a4,a4,350 # 51f15e <__stack_size+0x51e95e>
20000220:	14e7a623          	sw	a4,332(a5) # 2001014c <_data_lma+0xfd44>
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
200002ca:	d3a68693          	addi	a3,a3,-710 # 80000000 <_data>
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
20000318:	cec78793          	addi	a5,a5,-788 # 80000000 <_data>
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
20000376:	07250513          	addi	a0,a0,114 # 200003e4 <esp32_init+0x66>
2000037a:	0141                	addi	sp,sp,16
2000037c:	b7a9                	j	200002c6 <_puts>

2000037e <esp32_init>:
2000037e:	100127b7          	lui	a5,0x10012
20000382:	5fd8                	lw	a4,60(a5)
20000384:	1141                	addi	sp,sp,-16
20000386:	c606                	sw	ra,12(sp)
20000388:	dc777713          	andi	a4,a4,-569
2000038c:	dfd8                	sw	a4,60(a5)
2000038e:	5f98                	lw	a4,56(a5)
20000390:	23877713          	andi	a4,a4,568
20000394:	df98                	sw	a4,56(a5)
20000396:	43d8                	lw	a4,4(a5)
20000398:	40076713          	ori	a4,a4,1024
2000039c:	c3d8                	sw	a4,4(a5)
2000039e:	100247b7          	lui	a5,0x10024
200003a2:	06400713          	li	a4,100
200003a6:	c398                	sw	a4,0(a5)
200003a8:	00080737          	lui	a4,0x80
200003ac:	c3b8                	sw	a4,64(a5)
200003ae:	4709                	li	a4,2
200003b0:	cb98                	sw	a4,16(a5)
200003b2:	53b8                	lw	a4,96(a5)
200003b4:	9b79                	andi	a4,a4,-2
200003b6:	d3b8                	sw	a4,96(a5)
200003b8:	02078423          	sb	zero,40(a5) # 10024028 <__stack_size+0x10023828>
200003bc:	4f98                	lw	a4,24(a5)
200003be:	9b71                	andi	a4,a4,-4
200003c0:	cf98                	sw	a4,24(a5)
200003c2:	10024737          	lui	a4,0x10024
200003c6:	477c                	lw	a5,76(a4)
200003c8:	fffd                	bnez	a5,200003c6 <esp32_init+0x48>
200003ca:	00000517          	auipc	a0,0x0
200003ce:	03a50513          	addi	a0,a0,58 # 20000404 <esp32_init+0x86>
200003d2:	3dd5                	jal	200002c6 <_puts>
200003d4:	40b2                	lw	ra,12(sp)
200003d6:	00000517          	auipc	a0,0x0
200003da:	02e50513          	addi	a0,a0,46 # 20000404 <esp32_init+0x86>
200003de:	0141                	addi	sp,sp,16
200003e0:	b5dd                	j	200002c6 <_puts>
