	.cpu arm7tdmi
	.fpu softvfp
	.eabi_attribute 20, 1	@ Tag_ABI_FP_denormal
	.eabi_attribute 21, 1	@ Tag_ABI_FP_exceptions
	.eabi_attribute 23, 3	@ Tag_ABI_FP_number_model
	.eabi_attribute 24, 1	@ Tag_ABI_align8_needed
	.eabi_attribute 25, 1	@ Tag_ABI_align8_preserved
	.eabi_attribute 26, 1	@ Tag_ABI_enum_size
	.eabi_attribute 30, 2	@ Tag_ABI_optimization_goals
	.eabi_attribute 34, 0	@ Tag_CPU_unaligned_access
	.eabi_attribute 18, 4	@ Tag_ABI_PCS_wchar_t
	.file	"main.c"
@ GNU C11 (GNU Tools for ARM Embedded Processors) version 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589] (arm-none-eabi)
@	compiled by GNU C version 4.7.4, GMP version 4.3.2, MPFR version 2.4.2, MPC version 0.8.1
@ GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
@ options passed:  -fpreprocessed main.i -mthumb-interwork -mlong-calls
@ -auxbase-strip main.o -O2 -Wall -fverbose-asm
@ options enabled:  -faggressive-loop-optimizations -falign-functions
@ -falign-jumps -falign-labels -falign-loops -fauto-inc-dec
@ -fbranch-count-reg -fcaller-saves -fchkp-check-incomplete-type
@ -fchkp-check-read -fchkp-check-write -fchkp-instrument-calls
@ -fchkp-narrow-bounds -fchkp-optimize -fchkp-store-bounds
@ -fchkp-use-static-bounds -fchkp-use-static-const-bounds
@ -fchkp-use-wrappers -fcombine-stack-adjustments -fcommon -fcompare-elim
@ -fcprop-registers -fcrossjumping -fcse-follow-jumps -fdefer-pop
@ -fdelete-null-pointer-checks -fdevirtualize -fdevirtualize-speculatively
@ -fdwarf2-cfi-asm -fearly-inlining -feliminate-unused-debug-types
@ -fexpensive-optimizations -fforward-propagate -ffunction-cse -fgcse
@ -fgcse-lm -fgnu-runtime -fgnu-unique -fguess-branch-probability
@ -fhoist-adjacent-loads -fident -fif-conversion -fif-conversion2
@ -findirect-inlining -finline -finline-atomics
@ -finline-functions-called-once -finline-small-functions -fipa-cp
@ -fipa-cp-alignment -fipa-icf -fipa-icf-functions -fipa-icf-variables
@ -fipa-profile -fipa-pure-const -fipa-ra -fipa-reference -fipa-sra
@ -fira-hoist-pressure -fira-share-save-slots -fira-share-spill-slots
@ -fisolate-erroneous-paths-dereference -fivopts -fkeep-static-consts
@ -fleading-underscore -flifetime-dse -flra-remat -flto-odr-type-merging
@ -fmath-errno -fmerge-constants -fmerge-debug-strings
@ -fmove-loop-invariants -fomit-frame-pointer -foptimize-sibling-calls
@ -foptimize-strlen -fpartial-inlining -fpeephole -fpeephole2
@ -fprefetch-loop-arrays -freg-struct-return -freorder-blocks
@ -freorder-functions -frerun-cse-after-loop
@ -fsched-critical-path-heuristic -fsched-dep-count-heuristic
@ -fsched-group-heuristic -fsched-interblock -fsched-last-insn-heuristic
@ -fsched-pressure -fsched-rank-heuristic -fsched-spec
@ -fsched-spec-insn-heuristic -fsched-stalled-insns-dep -fschedule-insns
@ -fschedule-insns2 -fsection-anchors -fsemantic-interposition
@ -fshow-column -fshrink-wrap -fsigned-zeros -fsplit-ivs-in-unroller
@ -fsplit-wide-types -fssa-phiopt -fstdarg-opt -fstrict-aliasing
@ -fstrict-overflow -fstrict-volatile-bitfields -fsync-libcalls
@ -fthread-jumps -ftoplevel-reorder -ftrapping-math -ftree-bit-ccp
@ -ftree-builtin-call-dce -ftree-ccp -ftree-ch -ftree-coalesce-vars
@ -ftree-copy-prop -ftree-copyrename -ftree-cselim -ftree-dce
@ -ftree-dominator-opts -ftree-dse -ftree-forwprop -ftree-fre
@ -ftree-loop-if-convert -ftree-loop-im -ftree-loop-ivcanon
@ -ftree-loop-optimize -ftree-parallelize-loops= -ftree-phiprop -ftree-pre
@ -ftree-pta -ftree-reassoc -ftree-scev-cprop -ftree-sink -ftree-slsr
@ -ftree-sra -ftree-switch-conversion -ftree-tail-merge -ftree-ter
@ -ftree-vrp -funit-at-a-time -fverbose-asm -fzero-initialized-in-bss -marm
@ -mlittle-endian -mlong-calls -mpic-data-is-text-relative -msched-prolog
@ -mthumb-interwork -mvectorize-with-neon-quad

	.text
	.align	2
	.global	drawPixel
	.type	drawPixel, %function
drawPixel:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}	@,
	ldr	r3, .L3	@ tmp117,
	mov	r4, r2	@ clr, clr
	mov	lr, pc
	bx	r3	@ tmp117
	mov	r0, r0, asl #1	@ tmp118,,
	add	r0, r0, #100663296	@ tmp119, tmp118,
	strh	r4, [r0]	@ movhi	@ clr, *_8
	ldmfd	sp!, {r4, lr}	@
	bx	lr	@
.L4:
	.align	2
.L3:
	.word	calc_pixel_location
	.size	drawPixel, .-drawPixel
	.align	2
	.global	drawRect2
	.type	drawRect2, %function
drawRect2:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@,
	cmp	r3, #0	@ height
	ldrh	r8, [sp, #40]	@ clr, clr
	ble	.L5	@,
	mov	r10, r2	@ width, width
	mov	fp, r0	@ left, left
	mov	r5, r1	@ ivtmp.71, top
	ldr	r7, .L15	@ tmp132,
	add	r9, r3, r1	@ D.6569, height, ivtmp.71
	add	r6, r2, r0	@ D.6569, width, left
.L9:
	cmp	r10, #0	@ width,
	ble	.L10	@,
	mov	r4, fp	@ ivtmp.67, left
.L8:
	mov	r0, r4	@, ivtmp.67
	mov	r1, r5	@, ivtmp.71
	mov	lr, pc
	bx	r7	@ tmp132
	add	r4, r4, #1	@ ivtmp.67, ivtmp.67,
	mov	r0, r0, asl #1	@ tmp128,,
	add	r0, r0, #100663296	@ tmp129, tmp128,
	cmp	r6, r4	@ D.6569, ivtmp.67
	strh	r8, [r0]	@ movhi	@ clr, *_20
	bne	.L8	@,
.L10:
	add	r5, r5, #1	@ ivtmp.71, ivtmp.71,
	cmp	r5, r9	@ ivtmp.71, D.6569
	bne	.L9	@,
.L5:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	bx	lr	@
.L16:
	.align	2
.L15:
	.word	calc_pixel_location
	.size	drawRect2, .-drawRect2
	.align	2
	.global	fillPalette
	.type	fillPalette, %function
fillPalette:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L20	@ ivtmp.80,
	ldr	r3, .L20+4	@ ivtmp.86,
	ldr	r0, .L20+8	@ tmp174,
.L18:
	ldr	r1, [r2, #4]!	@ MEM[base: _19, offset: 0B], MEM[base: _19, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _19, offset: 0B], MEM[base: 0B, index: ivtmp.86_15, offset: 0B]
	cmp	r3, r0	@ ivtmp.86, tmp174
	bne	.L18	@,
	bx	lr	@
.L21:
	.align	2
.L20:
	.word	.LANCHOR0-4
	.word	83886590
	.word	83886630
	.size	fillPalette, .-fillPalette
	.align	2
	.global	drawSprite
	.type	drawSprite, %function
drawSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, #14680064	@ D.6597, N,
	mov	r1, r1, asl #3	@ D.6597, D.6597,
	orr	r3, r3, #8192	@ tmp130, y,
	mov	r0, r0, asl #1	@ tmp132, numb,
	strh	r2, [r1, #2]	@ movhi	@ x, *_13
	strh	r3, [r1]	@ movhi	@ tmp130, *_4
	strh	r0, [r1, #4]	@ movhi	@ tmp132, *_18
	bx	lr	@
	.size	drawSprite, .-drawSprite
	.align	2
	.global	fillSprites
	.type	fillSprites, %function
fillSprites:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L28	@ ivtmp.109,
	ldr	r1, .L28+4	@ ivtmp.113,
	ldr	ip, .L28+8	@ tmp139,
.L24:
	ldrh	r0, [r3]	@ MEM[base: _43, offset: 0B], MEM[base: _43, offset: 0B]
	ldrh	r2, [r3, #-2]	@ MEM[base: _43, offset: 4294967294B], MEM[base: _43, offset: 4294967294B]
	add	r2, r2, r0, lsl #8	@ tmp126, MEM[base: _43, offset: 4294967294B], MEM[base: _43, offset: 0B],
	strh	r2, [r1, #2]!	@ movhi	@ tmp126, MEM[base: 0B, index: ivtmp.113_21, offset: 0B]
	cmp	r1, ip	@ ivtmp.113, tmp139
	add	r3, r3, #4	@ ivtmp.109, ivtmp.109,
	bne	.L24	@,
	mov	r3, #117440512	@ ivtmp.100,
	mov	ip, #240	@ tmp136,
	mov	r0, #0	@ tmp137,
	ldr	r1, .L28+12	@ tmp135,
	ldr	r2, .L28+16	@ tmp138,
.L25:
	strh	r1, [r3]	@ movhi	@ tmp135, MEM[base: 0B, index: ivtmp.100_39, offset: 0B]
	strh	ip, [r3, #2]	@ movhi	@ tmp136, MEM[base: 0B, index: ivtmp.100_39, offset: 2B]
	strh	r0, [r3, #4]	@ movhi	@ tmp137, MEM[base: 0B, index: ivtmp.100_39, offset: 4B]
	add	r3, r3, #8	@ ivtmp.100, ivtmp.100,
	cmp	r3, r2	@ ivtmp.100, tmp138
	bne	.L25	@,
	bx	lr	@
.L29:
	.align	2
.L28:
	.word	.LANCHOR0+74
	.word	100728830
	.word	100794366
	.word	8352
	.word	117441536
	.size	fillSprites, .-fillSprites
	.align	2
	.global	key_poll
	.type	key_poll, %function
key_poll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864	@ tmp119,
	ldr	r3, [r3, #304]	@ D.6631, MEM[(volatile uint32 *)67109168B]
	mvn	r3, r3	@ tmp122, D.6631
	ldr	r2, .L31	@ tmp116,
	ldr	r1, .L31+4	@ tmp115,
	ldrh	r0, [r2]	@ key_cur, key_cur
	bic	r3, r3, #64512	@ tmp124, tmp122,
	strh	r0, [r1]	@ movhi	@ key_cur, key_prev
	strh	r3, [r2]	@ movhi	@ tmp124, key_cur
	bx	lr	@
.L32:
	.align	2
.L31:
	.word	key_cur
	.word	key_prev
	.size	key_poll, .-key_poll
	.align	2
	.global	getCellValue
	.type	getCellValue, %function
getCellValue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L34	@ tmp117,
	rsb	r1, r1, r1, lsl #3	@ tmp120, y, y,
	add	r3, r3, r1, lsl #2	@ tmp122, tmp117, tmp120,
	ldrb	r0, [r3, r0]	@ zero_extendqisi2	@, grid
	bx	lr	@
.L35:
	.align	2
.L34:
	.word	grid
	.size	getCellValue, .-getCellValue
	.align	2
	.global	setCellValue
	.type	setCellValue, %function
setCellValue:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L37	@ tmp115,
	rsb	r1, r1, r1, lsl #3	@ tmp118, y, y,
	add	r3, r3, r1, lsl #2	@ tmp120, tmp115, tmp118,
	strb	r2, [r3, r0]	@ value, grid
	bx	lr	@
.L38:
	.align	2
.L37:
	.word	grid
	.size	setCellValue, .-setCellValue
	.align	2
	.global	getTitleScreenState
	.type	getTitleScreenState, %function
getTitleScreenState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L40	@ tmp114,
	ldrb	r0, [r3]	@ zero_extendqisi2	@, state
	bx	lr	@
.L41:
	.align	2
.L40:
	.word	.LANCHOR1
	.size	getTitleScreenState, .-getTitleScreenState
	.align	2
	.global	beginTitleScreen
	.type	beginTitleScreen, %function
beginTitleScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0	@ tmp116,
	ldr	r3, .L46	@ tmp115,
	ldr	r2, .L46+4	@ ivtmp.134,
	strb	r1, [r3]	@ tmp116, state
	ldr	r0, .L46+8	@ tmp166,
	ldr	r3, .L46+12	@ ivtmp.140,
.L43:
	ldr	r1, [r2, #4]!	@ MEM[base: _39, offset: 0B], MEM[base: _39, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _39, offset: 0B], MEM[base: 0B, index: ivtmp.140_35, offset: 0B]
	cmp	r3, r0	@ ivtmp.140, tmp166
	bne	.L43	@,
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}	@,
	bl	fillSprites	@
	mov	r2, #88	@ tmp135,
	mov	r8, #80	@ tmp126,
	mov	r7, #0	@ tmp129,
	mov	r6, #2	@ tmp138,
	mov	r5, #96	@ tmp144,
	mov	r4, #4	@ tmp147,
	mov	lr, #104	@ tmp153,
	mov	ip, #6	@ tmp156,
	mov	r0, #112	@ tmp162,
	mov	r1, #8	@ tmp165,
	ldr	r3, .L46+16	@ tmp121,
	strh	r2, [r3, #138]	@ movhi	@ tmp135, MEM[(short unsigned int *)117440906B]
	ldr	r2, .L46+20	@ tmp123,
	strh	r8, [r3, #130]	@ movhi	@ tmp126, MEM[(short unsigned int *)117440898B]
	strh	r7, [r3, #132]	@ movhi	@ tmp129, MEM[(short unsigned int *)117440900B]
	strh	r6, [r3, #140]	@ movhi	@ tmp138, MEM[(short unsigned int *)117440908B]
	strh	r5, [r3, #146]	@ movhi	@ tmp144, MEM[(short unsigned int *)117440914B]
	strh	r4, [r3, #148]	@ movhi	@ tmp147, MEM[(short unsigned int *)117440916B]
	strh	lr, [r3, #154]	@ movhi	@ tmp153, MEM[(short unsigned int *)117440922B]
	strh	ip, [r3, #156]	@ movhi	@ tmp156, MEM[(short unsigned int *)117440924B]
	strh	r0, [r3, #162]	@ movhi	@ tmp162, MEM[(short unsigned int *)117440930B]
	strh	r1, [r3, #164]	@ movhi	@ tmp165, MEM[(short unsigned int *)117440932B]
	strh	r2, [r3, #128]	@ movhi	@ tmp123, MEM[(short unsigned int *)117440896B]
	strh	r2, [r3, #136]	@ movhi	@ tmp123, MEM[(short unsigned int *)117440904B]
	strh	r2, [r3, #144]	@ movhi	@ tmp123, MEM[(short unsigned int *)117440912B]
	strh	r2, [r3, #152]	@ movhi	@ tmp123, MEM[(short unsigned int *)117440920B]
	strh	r2, [r3, #160]	@ movhi	@ tmp123, MEM[(short unsigned int *)117440928B]
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}	@
	bx	lr	@
.L47:
	.align	2
.L46:
	.word	.LANCHOR1
	.word	.LANCHOR0-4
	.word	83886630
	.word	83886590
	.word	117440768
	.word	8272
	.size	beginTitleScreen, .-beginTitleScreen
	.align	2
	.global	handleTitleInput
	.type	handleTitleInput, %function
handleTitleInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L53	@ tmp113,
	ldr	r2, .L53+4	@ tmp114,
	ldrh	r3, [r3]	@ D.6668, key_cur
	ldrh	r2, [r2]	@ key_prev, key_prev
	cmp	r2, r3	@ key_prev, D.6668
	bxeq	lr	@
	tst	r3, #8	@ D.6668,
	movne	r2, #1	@ tmp121,
	ldrne	r3, .L53+8	@ tmp120,
	strneb	r2, [r3]	@ tmp121, state
	bx	lr	@
.L54:
	.align	2
.L53:
	.word	key_cur
	.word	key_prev
	.word	.LANCHOR1
	.size	handleTitleInput, .-handleTitleInput
	.align	2
	.global	getGameState
	.type	getGameState, %function
getGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L56	@ tmp114,
	ldrb	r0, [r3]	@ zero_extendqisi2	@, gameState
	bx	lr	@
.L57:
	.align	2
.L56:
	.word	gameState
	.size	getGameState, .-getGameState
	.align	2
	.global	getFinalScore
	.type	getFinalScore, %function
getFinalScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L59	@ tmp115,
	ldr	r0, [r3, #1968]	@, snake.length
	bx	lr	@
.L60:
	.align	2
.L59:
	.word	snake+4096
	.size	getFinalScore, .-getFinalScore
	.align	2
	.global	spawnTargetNode
	.type	spawnTargetNode, %function
spawnTargetNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	ip, #0	@ lastR,
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}	@,
	mov	r0, ip	@ tY, lastR
	mov	r4, ip	@ tX, lastR
	mov	r5, #0	@ tY,
	ldr	r7, .L73	@ tmp207,
	ldr	r6, .L73+4	@ ivtmp.170,
	ldr	r8, [r7, #2888]	@ D.6702, next
.L62:
	mov	lr, r6	@ ivtmp.161, ivtmp.170
	mov	r1, #0	@ tX,
.L64:
	rsb	r3, r8, r8, lsl #9	@ tmp169, D.6702, D.6702,
	add	r3, r8, r3, lsl #2	@ tmp171, D.6702, tmp169,
	rsb	r2, r3, r3, lsl #9	@ tmp173, tmp171, tmp171,
	add	r3, r8, r2, lsl #1	@ tmp175, D.6702, tmp173,
	add	r2, r3, r3, lsl #5	@ tmp177, tmp175, tmp175,
	rsb	r2, r8, r2, lsl #2	@ tmp179, D.6702, tmp177,
	add	r3, r8, r2, lsl #2	@ D.6702, D.6702, tmp179,
	add	r3, r3, #12288	@ tmp182, D.6702,
	ldrb	r9, [lr, #1]!	@ zero_extendqisi2	@ MEM[base: _13, offset: 0B], MEM[base: _13, offset: 0B]
	add	r8, r3, #57	@ D.6702, tmp182,
	mov	r3, r8, asl #1	@ tmp185, D.6702,
	cmp	r9, #1	@ MEM[base: _13, offset: 0B],
	mov	r3, r3, lsr #17	@ lastR, tmp185,
	beq	.L63	@,
	cmn	r0, #1	@ tY,
	movne	r2, #0	@ tmp187,
	moveq	r2, #1	@ tmp187,
	cmp	r3, ip	@ lastR, lastR
	orrgt	r2, r2, #1	@,, tmp192, tmp187
	cmp	r2, #0	@ tmp192,
	movne	ip, r3	@ lastR, lastR
	movne	r0, r5	@ tY, tY
	movne	r4, r1	@ tX, tX
.L63:
	add	r1, r1, #1	@ tX, tX,
	cmp	r1, #28	@ tX,
	bne	.L64	@,
	add	r5, r5, #1	@ tY, tY,
	cmp	r5, #18	@ tY,
	add	r6, r6, #28	@ ivtmp.170, ivtmp.170,
	bne	.L62	@,
	mov	lr, #30	@ tmp206,
	add	r3, r0, #1	@ D.6701, tY,
	ldr	r2, .L73+8	@ tmp196,
	add	r1, r4, #1	@ D.6701, tX,
	ldr	ip, .L73+12	@ tmp194,
	mov	r3, r3, asl #3	@ D.6701, D.6701,
	orr	r3, r3, #8192	@ tmp200, D.6701,
	mov	r1, r1, asl #3	@ D.6701, D.6701,
	str	r8, [r7, #2888]	@ D.6702, next
	strh	lr, [r2, #252]	@ movhi	@ tmp206, MEM[(short unsigned int *)117441020B]
	strh	r3, [r2, #248]	@ movhi	@ tmp200, MEM[(short unsigned int *)117441016B]
	strh	r1, [r2, #250]	@ movhi	@ D.6701, MEM[(short unsigned int *)117441018B]
	str	r4, [ip, #4]	@ tX, targetNode.x
	str	r0, [ip, #8]	@ tY, targetNode.y
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}	@
	bx	lr	@
.L74:
	.align	2
.L73:
	.word	.LANCHOR0
	.word	grid-1
	.word	117440768
	.word	targetNode
	.size	spawnTargetNode, .-spawnTargetNode
	.align	2
	.global	renderGame
	.type	renderGame, %function
renderGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L79	@ ivtmp.181,
	ldr	r3, .L79+4	@ ivtmp.187,
	ldr	r0, .L79+8	@ tmp118,
.L76:
	ldr	r1, [r2, #4]!	@ MEM[base: _21, offset: 0B], MEM[base: _21, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _21, offset: 0B], MEM[base: 0B, index: ivtmp.187_17, offset: 0B]
	cmp	r3, r0	@ ivtmp.187, tmp118
	bne	.L76	@,
	stmfd	sp!, {r4, lr}	@,
	bl	fillSprites	@
	ldmfd	sp!, {r4, lr}	@
	b	spawnTargetNode	@
.L80:
	.align	2
.L79:
	.word	.LANCHOR0-4
	.word	83886590
	.word	83886630
	.size	renderGame, .-renderGame
	.align	2
	.global	restartGame
	.type	restartGame, %function
restartGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0	@ tmp118,
	mov	r0, r2	@ tmp165, tmp118
	ldr	r1, .L89	@ tmp117,
	ldr	r3, .L89+4	@ ptr,
	strb	r2, [r1]	@ tmp118, gameState
	add	r1, r3, #504	@ tmp161, ptr,
.L82:
	strb	r0, [r3], #1	@ tmp165, MEM[base: ptr_22, offset: 4294967295B]
	cmp	r3, r1	@ ptr, tmp161
	mov	r2, #0	@ tmp120,
	bne	.L82	@,
	ldr	r0, .L89+8	@ tmp123,
	mov	ip, #13	@ tmp124,
	stmfd	sp!, {r4, r5, lr}	@,
	mov	lr, #1	@ tmp130,
	mov	r4, #2	@ tmp134,
	mov	r5, #8	@ tmp126,
	mov	r3, r0	@ ptr, tmp123
	str	ip, [r0, #4]	@ tmp124, snake.head.x
	add	ip, r0, #4096	@ tmp129, tmp123,
	str	r0, [r0, #12]	@ tmp123, snake.tail
	str	r5, [r0, #8]	@ tmp126, snake.head.y
	str	lr, [ip, #1968]	@ tmp130, snake.length
	str	lr, [ip, #1976]	@ tmp130, snake.yVel
	str	lr, [ip, #1984]	@ tmp130, snake.lastYMov
	str	r4, [ip, #1972]	@ tmp134, snake.xVel
	str	r4, [ip, #1980]	@ tmp134, snake.lastXMov
	mov	r1, r2	@ tmp164, tmp120
	str	r2, [r3], #16	@ tmp120, MEM[(struct SnakeNode *)&snake].prev
	sub	sp, sp, #12	@,,
	add	r2, ip, #1968	@ tmp162,,
.L83:
	strb	r1, [r3], #1	@ tmp164, MEM[base: ptr_19, offset: 4294967295B]
	cmp	r3, r2	@ ptr, tmp162
	bne	.L83	@,
	ldr	r2, .L89+12	@ ivtmp.200,
	ldr	r3, .L89+16	@ ivtmp.206,
	ldr	r0, .L89+20	@ tmp163,
.L84:
	ldr	r1, [r2, #4]!	@ MEM[base: _4, offset: 0B], MEM[base: _4, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _4, offset: 0B], MEM[base: 0B, index: ivtmp.206_3, offset: 0B]
	cmp	r3, r0	@ ivtmp.206, tmp163
	bne	.L84	@,
	bl	fillSprites	@
	mov	r4, #992	@ tmp157,
	mov	r1, #6	@,
	str	r4, [sp]	@ tmp157,
	mov	r0, r1	@,
	mov	r3, #2	@,
	mov	r2, #228	@,
	bl	drawRect2	@
	str	r4, [sp]	@ tmp157,
	mov	r3, #148	@,
	mov	r2, #2	@,
	mov	r1, #6	@,
	mov	r0, #232	@,
	bl	drawRect2	@
	mov	r1, #6	@,
	str	r4, [sp]	@ tmp157,
	mov	r0, r1	@,
	mov	r3, #148	@,
	mov	r2, #2	@,
	bl	drawRect2	@
	str	r4, [sp]	@ tmp157,
	mov	r3, #2	@,
	mov	r2, #228	@,
	mov	r1, #152	@,
	mov	r0, #6	@,
	bl	drawRect2	@
	add	sp, sp, #12	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, r5, lr}	@
	b	spawnTargetNode	@
.L90:
	.align	2
.L89:
	.word	gameState
	.word	grid
	.word	snake
	.word	.LANCHOR0-4
	.word	83886590
	.word	83886630
	.size	restartGame, .-restartGame
	.align	2
	.global	handleGameInput
	.type	handleGameInput, %function
handleGameInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L117	@ tmp127,
	ldr	r2, .L117+4	@ tmp128,
	ldrh	r3, [r3]	@ D.6778, key_cur
	ldrh	r2, [r2]	@ key_prev, key_prev
	cmp	r2, r3	@ key_prev, D.6778
	str	lr, [sp, #-4]!	@,
	beq	.L91	@,
	tst	r3, #4	@ D.6778,
	ldr	r2, .L117+8	@ tmp262,
	bne	.L114	@,
	ldrb	r2, [r2]	@ zero_extendqisi2	@ state, state
	cmp	r2, #4	@ state,
	beq	.L91	@,
.L96:
	ands	r2, r3, #16	@ tmp188, D.6778,
	beq	.L100	@,
	ldr	r3, .L117+12	@ tmp192,
	ldr	r2, [r3, #1980]	@ snake.lastXMov, snake.lastXMov
	cmp	r2, #1	@ snake.lastXMov,
	moveq	r1, #2	@ tmp197,
	streq	r2, [r3, #1976]	@ snake.lastXMov, snake.yVel
	mov	r2, #1	@ tmp203,
	streq	r1, [r3, #1972]	@ tmp197, snake.xVel
	ldr	r3, .L117+16	@ tmp202,
	strb	r2, [r3]	@ tmp203, currentDirection
.L91:
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L114:
	ldrb	r1, [r2]	@ zero_extendqisi2	@ state, state
	cmp	r1, #4	@ state,
	beq	.L115	@,
	ldr	r3, .L117+12	@ tmp263,
	ldr	r0, [r3, #1972]	@ D.6777, snake.xVel
	ldr	r1, [r3, #1976]	@ D.6777, snake.yVel
	cmp	r0, #1	@ D.6777,
	streq	r0, [r3, #1976]	@ D.6777, snake.yVel
	cmp	r1, #1	@ D.6777,
	str	r0, [r3, #1980]	@ D.6777, snake.lastXMov
	str	r1, [r3, #1984]	@ D.6777, snake.lastYMov
	streq	r1, [r3, #1972]	@ D.6777, snake.xVel
	streq	r1, [r3, #1976]	@ D.6777, snake.yVel
	mov	r3, #4	@ tmp182,
	strb	r3, [r2]	@ tmp182, state
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L100:
	ands	r1, r3, #32	@ tmp207, D.6778,
	bne	.L116	@,
	tst	r3, #64	@ D.6778,
	beq	.L104	@,
	ldr	r3, .L117+12	@ tmp230,
	ldr	r2, [r3, #1984]	@ snake.lastYMov, snake.lastYMov
	cmp	r2, #1	@ snake.lastYMov,
	streq	r2, [r3, #1972]	@ snake.lastYMov, snake.xVel
	mov	r2, #2	@ tmp241,
	streq	r1, [r3, #1976]	@ tmp207, snake.yVel
	ldr	r3, .L117+16	@ tmp240,
	strb	r2, [r3]	@ tmp241, currentDirection
	b	.L91	@
.L116:
	ldr	r3, .L117+12	@ tmp211,
	ldr	r1, [r3, #1980]	@ snake.lastXMov, snake.lastXMov
	cmp	r1, #1	@ snake.lastXMov,
	streq	r2, [r3, #1972]	@ tmp188, snake.xVel
	mov	r2, #0	@ tmp222,
	streq	r1, [r3, #1976]	@ snake.lastXMov, snake.yVel
	ldr	r3, .L117+16	@ tmp221,
	strb	r2, [r3]	@ tmp222, currentDirection
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L115:
	mov	r0, #2	@ tmp137,
	ldr	r1, .L117+12	@ tmp141,
	ldr	lr, [r1, #1980]	@ snake.lastXMov, snake.lastXMov
	ldr	ip, [r1, #1984]	@ snake.lastYMov, snake.lastYMov
	str	lr, [r1, #1972]	@ snake.lastXMov, snake.xVel
	str	ip, [r1, #1976]	@ snake.lastYMov, snake.yVel
	strb	r0, [r2]	@ tmp137, state
	b	.L96	@
.L104:
	tst	r3, #128	@ D.6778,
	beq	.L91	@,
	ldr	r3, .L117+12	@ tmp249,
	ldr	r2, [r3, #1984]	@ snake.lastYMov, snake.lastYMov
	cmp	r2, #1	@ snake.lastYMov,
	moveq	r1, #2	@ tmp258,
	streq	r2, [r3, #1972]	@ snake.lastYMov, snake.xVel
	mov	r2, #3	@ tmp260,
	streq	r1, [r3, #1976]	@ tmp258, snake.yVel
	ldr	r3, .L117+16	@ tmp259,
	strb	r2, [r3]	@ tmp260, currentDirection
	b	.L91	@
.L118:
	.align	2
.L117:
	.word	key_cur
	.word	key_prev
	.word	.LANCHOR1
	.word	snake+4096
	.word	currentDirection
	.size	handleGameInput, .-handleGameInput
	.align	2
	.global	beginGameOverScreen
	.type	beginGameOverScreen, %function
beginGameOverScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0	@ tmp129,
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@,
	ldr	r3, .L139	@ tmp128,
	ldr	r2, [r3, #4]	@ D.6832, result
	cmp	r2, #15	@ D.6832,
	strb	r1, [r3]	@ tmp129, state
	ble	.L120	@,
	ldr	r3, [r3, #8]	@ lvl2, lvl2
	cmp	r3, r1	@ lvl2,
	beq	.L121	@,
	ldr	r2, .L139+4	@ ivtmp.246,
	ldr	r3, .L139+8	@ ivtmp.252,
	ldr	r0, .L139+12	@ tmp370,
.L122:
	ldr	r1, [r2, #4]!	@ MEM[base: _692, offset: 0B], MEM[base: _692, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _692, offset: 0B], MEM[base: 0B, index: ivtmp.252_33, offset: 0B]
	cmp	r3, r0	@ ivtmp.252, tmp370
	bne	.L122	@,
	bl	fillSprites	@
	mov	fp, #70	@ tmp142,
	mov	r3, #117440512	@ tmp137,
	mov	r10, #10	@ tmp145,
	mov	r9, #78	@ tmp151,
	mov	r8, #12	@ tmp154,
	mov	r7, #86	@ tmp160,
	mov	r6, #14	@ tmp163,
	mov	r5, #102	@ tmp169,
	mov	r4, #16	@ tmp172,
	mov	lr, #110	@ tmp178,
	mov	ip, #142	@ tmp205,
	mov	r0, #38	@ tmp208,
	mov	r1, #150	@ tmp214,
	mov	r2, #42	@ tmp217,
.L137:
	strh	lr, [r3, #50]	@ movhi	@ tmp265, MEM[(short unsigned int *)117440562B]
	mov	lr, #18	@ movhi	@ tmp387,
	strh	lr, [r3, #52]	@ movhi	@ tmp387, MEM[(short unsigned int *)117440564B]
	mov	lr, #118	@ movhi	@ tmp388,
	strh	r4, [r3, #44]	@ movhi	@ tmp259, MEM[(short unsigned int *)117440556B]
	mov	r4, #134	@ movhi	@ tmp390,
	strh	lr, [r3, #58]	@ movhi	@ tmp388, MEM[(short unsigned int *)117440570B]
	mov	lr, #20	@ movhi	@ tmp389,
	strh	r4, [r3, #82]	@ movhi	@ tmp390, MEM[(short unsigned int *)117440594B]
	mov	r4, #36	@ movhi	@ tmp391,
	strh	lr, [r3, #60]	@ movhi	@ tmp389, MEM[(short unsigned int *)117440572B]
	ldr	lr, .L139+16	@ tmp226,
	strh	fp, [r3, #2]	@ movhi	@ tmp229, MEM[(short unsigned int *)117440514B]
	strh	r10, [r3, #4]	@ movhi	@ tmp232, MEM[(short unsigned int *)117440516B]
	strh	r9, [r3, #10]	@ movhi	@ tmp238, MEM[(short unsigned int *)117440522B]
	strh	r8, [r3, #12]	@ movhi	@ tmp241, MEM[(short unsigned int *)117440524B]
	strh	r7, [r3, #18]	@ movhi	@ tmp247, MEM[(short unsigned int *)117440530B]
	strh	r6, [r3, #20]	@ movhi	@ tmp250, MEM[(short unsigned int *)117440532B]
	strh	r5, [r3, #42]	@ movhi	@ tmp256, MEM[(short unsigned int *)117440554B]
	strh	r4, [r3, #84]	@ movhi	@ tmp391, MEM[(short unsigned int *)117440596B]
	strh	ip, [r3, #90]	@ movhi	@ tmp292, MEM[(short unsigned int *)117440602B]
	strh	r0, [r3, #92]	@ movhi	@ tmp295, MEM[(short unsigned int *)117440604B]
	strh	r1, [r3, #98]	@ movhi	@ tmp301, MEM[(short unsigned int *)117440610B]
	strh	r2, [r3, #100]	@ movhi	@ tmp304, MEM[(short unsigned int *)117440612B]
	strh	lr, [r3]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440512B]
	strh	lr, [r3, #8]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440520B]
	strh	lr, [r3, #16]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440528B]
	strh	lr, [r3, #40]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440552B]
	strh	lr, [r3, #48]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440560B]
	strh	lr, [r3, #56]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440568B]
	strh	lr, [r3, #80]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440592B]
	strh	lr, [r3, #88]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440600B]
	strh	lr, [r3, #96]	@ movhi	@ tmp226, MEM[(short unsigned int *)117440608B]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	bx	lr	@
.L120:
	cmp	r2, #7	@ D.6832,
	bgt	.L138	@,
.L124:
	ldr	r2, .L139+4	@ ivtmp.280,
	ldr	r3, .L139+8	@ ivtmp.286,
	ldr	r0, .L139+12	@ tmp372,
.L125:
	ldr	r1, [r2, #4]!	@ MEM[base: _135, offset: 0B], MEM[base: _135, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _135, offset: 0B], MEM[base: 0B, index: ivtmp.286_138, offset: 0B]
	cmp	r3, r0	@ ivtmp.286, tmp372
	bne	.L125	@,
	bl	fillSprites	@
	mov	r3, #117440512	@ tmp307,
	mov	r2, #126	@ tmp366,
	mov	r4, #22	@ tmp342,
	mov	fp, #70	@ tmp312,
	mov	r10, #10	@ tmp315,
	mov	r9, #78	@ tmp321,
	mov	r8, #12	@ tmp324,
	mov	r7, #86	@ tmp330,
	mov	r6, #14	@ tmp333,
	mov	r5, #102	@ tmp339,
	mov	lr, #110	@ tmp348,
	strh	r2, [r3, #66]	@ movhi	@ tmp366, MEM[(short unsigned int *)117440578B]
	mov	ip, #24	@ tmp351,
	mov	r0, #118	@ tmp357,
	mov	r1, #26	@ tmp360,
	mov	r2, #28	@ movhi	@ tmp392,
	strh	r4, [r3, #44]	@ movhi	@ tmp342, MEM[(short unsigned int *)117440556B]
	ldr	r4, .L139+16	@ tmp309,
	strh	fp, [r3, #2]	@ movhi	@ tmp312, MEM[(short unsigned int *)117440514B]
	strh	r10, [r3, #4]	@ movhi	@ tmp315, MEM[(short unsigned int *)117440516B]
	strh	r9, [r3, #10]	@ movhi	@ tmp321, MEM[(short unsigned int *)117440522B]
	strh	r8, [r3, #12]	@ movhi	@ tmp324, MEM[(short unsigned int *)117440524B]
	strh	r7, [r3, #18]	@ movhi	@ tmp330, MEM[(short unsigned int *)117440530B]
	strh	r6, [r3, #20]	@ movhi	@ tmp333, MEM[(short unsigned int *)117440532B]
	strh	r5, [r3, #42]	@ movhi	@ tmp339, MEM[(short unsigned int *)117440554B]
	strh	lr, [r3, #50]	@ movhi	@ tmp348, MEM[(short unsigned int *)117440562B]
	strh	ip, [r3, #52]	@ movhi	@ tmp351, MEM[(short unsigned int *)117440564B]
	strh	r0, [r3, #58]	@ movhi	@ tmp357, MEM[(short unsigned int *)117440570B]
	strh	r1, [r3, #60]	@ movhi	@ tmp360, MEM[(short unsigned int *)117440572B]
	strh	r2, [r3, #68]	@ movhi	@ tmp392, MEM[(short unsigned int *)117440580B]
	strh	r4, [r3]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440512B]
	strh	r4, [r3, #8]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440520B]
	strh	r4, [r3, #16]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440528B]
	strh	r4, [r3, #40]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440552B]
	strh	r4, [r3, #48]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440560B]
	strh	r4, [r3, #56]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440568B]
	strh	r4, [r3, #64]	@ movhi	@ tmp309, MEM[(short unsigned int *)117440576B]
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	bx	lr	@
.L138:
	ldr	r3, [r3, #8]	@ lvl2, lvl2
	cmp	r3, #0	@ lvl2,
	bne	.L124	@,
.L121:
	ldr	r2, .L139+4	@ ivtmp.263,
	ldr	r3, .L139+8	@ ivtmp.269,
	ldr	r0, .L139+12	@ tmp371,
.L126:
	ldr	r1, [r2, #4]!	@ MEM[base: _93, offset: 0B], MEM[base: _93, offset: 0B]
	strh	r1, [r3, #2]!	@ movhi	@ MEM[base: _93, offset: 0B], MEM[base: 0B, index: ivtmp.269_96, offset: 0B]
	cmp	r3, r0	@ ivtmp.269, tmp371
	bne	.L126	@,
	bl	fillSprites	@
	mov	fp, #70	@ tmp229,
	mov	r3, #117440512	@ tmp224,
	mov	r10, #10	@ tmp232,
	mov	r9, #78	@ tmp238,
	mov	r8, #12	@ tmp241,
	mov	r7, #86	@ tmp247,
	mov	r6, #14	@ tmp250,
	mov	r5, #102	@ tmp256,
	mov	r4, #16	@ tmp259,
	mov	lr, #110	@ tmp265,
	mov	ip, #142	@ tmp292,
	mov	r0, #38	@ tmp295,
	mov	r1, #150	@ tmp301,
	mov	r2, #40	@ tmp304,
	b	.L137	@
.L140:
	.align	2
.L139:
	.word	.LANCHOR1
	.word	.LANCHOR0-4
	.word	83886590
	.word	83886630
	.word	8272
	.size	beginGameOverScreen, .-beginGameOverScreen
	.align	2
	.global	handleGameOverInput
	.type	handleGameOverInput, %function
handleGameOverInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L148	@ tmp114,
	ldr	r2, .L148+4	@ tmp115,
	ldrh	r3, [r3]	@ D.6841, key_cur
	ldrh	r2, [r2]	@ key_prev, key_prev
	cmp	r2, r3	@ key_prev, D.6841
	bxeq	lr	@
	tst	r3, #8	@ D.6841,
	bxeq	lr	@
	ldr	r3, .L148+8	@ tmp121,
	ldr	r2, [r3, #4]	@ result, result
	cmp	r2, #7	@ result,
	bgt	.L147	@,
	mov	r2, #0	@ tmp131,
	mov	r1, #1	@ tmp135,
	str	r2, [r3, #8]	@ tmp131, lvl2
	str	r2, [r3, #4]	@ tmp131, result
	strb	r1, [r3]	@ tmp135, state
	bx	lr	@
.L147:
	mov	r0, #1	@ tmp124,
	mov	r1, #0	@ tmp126,
	mov	r2, #2	@ tmp128,
	str	r0, [r3, #8]	@ tmp124, lvl2
	str	r1, [r3, #4]	@ tmp126, result
	strb	r2, [r3]	@ tmp128, state
	bx	lr	@
.L149:
	.align	2
.L148:
	.word	key_cur
	.word	key_prev
	.word	.LANCHOR1
	.size	handleGameOverInput, .-handleGameOverInput
	.align	2
	.global	getGameOverState
	.type	getGameOverState, %function
getGameOverState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L151	@ tmp114,
	ldrb	r0, [r3]	@ zero_extendqisi2	@, state
	bx	lr	@
.L152:
	.align	2
.L151:
	.word	.LANCHOR1
	.size	getGameOverState, .-getGameOverState
	.align	2
	.global	InitSnake
	.type	InitSnake, %function
InitSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, lr}	@,
	mov	r4, #0	@ tmp132,
	mov	lr, #1	@ tmp119,
	mov	r5, #2	@ tmp122,
	mov	r3, r0	@ ptr, snake
	mov	ip, r4	@ tmp136, tmp132
	str	r1, [r0, #4]	@ startX, snake_2(D)->head.x
	add	r1, r0, #4096	@ tmp118, ptr,
	str	r2, [r0, #8]	@ startY, snake_2(D)->head.y
	str	lr, [r1, #1968]	@ tmp119, snake_2(D)->length
	str	lr, [r1, #1976]	@ tmp119, snake_2(D)->yVel
	str	lr, [r1, #1984]	@ tmp119, snake_2(D)->lastYMov
	str	r5, [r1, #1972]	@ tmp122, snake_2(D)->xVel
	str	r5, [r1, #1980]	@ tmp122, snake_2(D)->lastXMov
	add	r2, r0, #6016	@ tmp133, ptr,
	str	r0, [r0, #12]	@ snake, snake_2(D)->tail
	str	r4, [r3], #16	@ tmp132, MEM[(struct SnakeNode *)snake_2(D)].prev
	add	r2, r2, #48	@ D.6861, tmp133,
.L154:
	strb	ip, [r3], #1	@ tmp136, MEM[base: ptr_18, offset: 4294967295B]
	cmp	r2, r3	@ D.6861, ptr
	bne	.L154	@,
	ldmfd	sp!, {r4, r5, lr}	@
	bx	lr	@
	.size	InitSnake, .-InitSnake
	.align	2
	.global	UpdateSnake
	.type	UpdateSnake, %function
UpdateSnake:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, lr}	@,
	ldr	r3, .L172	@ tmp132,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ state, state
	cmp	r3, #4	@ state,
	beq	.L163	@,
	ldr	r3, [r0, #12]	@ curNode, s_7(D)->tail
	cmp	r3, #0	@ curNode,
	beq	.L163	@,
	ldr	r2, [r3]	@ curNode, curNode_8->prev
	cmp	r2, #0	@ curNode,
	moveq	r2, r3	@ curNode, curNode
	beq	.L160	@,
	ldr	ip, [r2, #4]	@ D.6864, curNode_33->x
	ldr	r1, [r2, #8]	@ D.6864, curNode_33->y
	str	ip, [r3, #4]	@ D.6864, curNode_8->x
	str	r1, [r3, #8]	@ D.6864, curNode_8->y
	b	.L161	@
.L170:
	ldr	ip, [r3, #4]	@ D.6864, curNode_9->x
	ldr	r1, [r3, #8]	@ D.6864, curNode_9->y
	str	ip, [r2, #4]	@ D.6864, curNode_45->x
	str	r1, [r2, #8]	@ D.6864, curNode_45->y
	mov	r2, r3	@ curNode, curNode
.L161:
	ldr	r3, [r2]	@ curNode, curNode_45->prev
	cmp	r3, #0	@ curNode,
	bne	.L170	@,
.L160:
	add	r3, r0, #4096	@ tmp135, s,
	ldr	r4, [r3, #1976]	@ D.6864, s_7(D)->yVel
	ldr	r0, [r2, #8]	@ curNode_32->y, curNode_32->y
	ldr	r5, [r3, #1972]	@ D.6864, s_7(D)->xVel
	ldr	lr, [r2, #4]	@ curNode_32->x, curNode_32->x
	sub	r1, r4, #1	@ D.6864, D.6864,
	add	r1, r1, r0	@ newY, D.6864, curNode_32->y
	sub	r0, r5, #1	@ D.6864, D.6864,
	add	r0, r0, lr	@ newX, D.6864, curNode_32->x
	rsb	ip, r1, r1, lsl #3	@ D.6864, newY, newY,
	ldr	lr, .L172+4	@ tmp146,
	add	ip, r0, ip, lsl #2	@ D.6864, newX, D.6864,
	ldrb	r6, [lr, ip]	@ zero_extendqisi2	@ tmp147, grid
	cmp	r6, #0	@ tmp147,
	movne	r0, #0	@ D.6864,
	beq	.L171	@,
	ldmfd	sp!, {r4, r5, r6, lr}	@
	bx	lr	@
.L163:
	mov	r0, #1	@ D.6864,
	ldmfd	sp!, {r4, r5, r6, lr}	@
	bx	lr	@
.L171:
	mov	r6, #1	@ tmp153,
	stmib	r2, {r0, r1}	@ curNode,,
	strb	r6, [lr, ip]	@ tmp153, grid
	mov	r0, r6	@ D.6864, tmp153
	str	r5, [r3, #1980]	@ D.6864, s_7(D)->lastXMov
	str	r4, [r3, #1984]	@ D.6864, s_7(D)->lastYMov
	ldmfd	sp!, {r4, r5, r6, lr}	@
	bx	lr	@
.L173:
	.align	2
.L172:
	.word	.LANCHOR1
	.word	grid
	.size	UpdateSnake, .-UpdateSnake
	.align	2
	.global	tickAndDrawGame
	.type	tickAndDrawGame, %function
tickAndDrawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}	@,
	ldr	r4, .L192	@ tmp301,
	ldr	r3, [r4, #4]	@ D.6876, snake.head.x
	cmp	r3, #27	@ D.6876,
	bhi	.L175	@,
	ldr	r2, [r4, #8]	@ D.6876, snake.head.y
	cmp	r2, #17	@ D.6876,
	bhi	.L175	@,
	add	r0, r4, #4096	@ tmp302, tmp301,
	ldr	r1, [r0, #1968]	@ D.6876, snake.length
	cmp	r1, #7	@ D.6876,
	bgt	.L190	@,
.L178:
	ldr	ip, .L192+4	@ tmp181,
	ldr	lr, [ip, #4]	@ targetNode.x, targetNode.x
	cmp	r3, lr	@ D.6876, targetNode.x
	beq	.L191	@,
.L180:
	mov	r6, #32	@ tmp258,
	mov	lr, #0	@ tmp266,
	ldr	r2, [r4, #12]	@ D.6878, snake.tail
	ldr	r3, [r2, #8]	@ D.6876, _21->y
	ldr	ip, [r2, #4]	@ D.6876, _21->x
	add	r2, r3, #2	@ D.6876, D.6876,
	ldr	r1, .L192+8	@ tmp248,
	add	r0, ip, #2	@ D.6876, D.6876,
	mov	r2, r2, asl #3	@ D.6876, D.6876,
	ldr	r5, .L192+12	@ tmp303,
	ldr	r7, .L192	@ tmp247,
	orr	r2, r2, #8192	@ tmp252, D.6876,
	mov	r0, r0, asl #3	@ D.6876, D.6876,
	rsb	r3, r3, r3, lsl #3	@ tmp262, D.6876, D.6876,
	strh	r0, [r1, #2]	@ movhi	@ D.6876, MEM[(short unsigned int *)117441026B]
	strh	r2, [r1]	@ movhi	@ tmp252, MEM[(short unsigned int *)117441024B]
	strh	r6, [r1, #4]	@ movhi	@ tmp258, MEM[(short unsigned int *)117441028B]
	add	r3, r5, r3, lsl #2	@ tmp264, tmp303, tmp262,
	mov	r0, r7	@, tmp247
	strb	lr, [r3, ip]	@ tmp266, grid
	bl	UpdateSnake	@
	cmp	r0, #0	@,
	beq	.L175	@,
	ldr	r1, [r7, #12]	@ currentNode, snake.tail
	cmp	r1, #0	@ currentNode,
	movne	ip, #34	@ tmp304,
	ldrne	r0, .L192+16	@ ivtmp.315,
	beq	.L183	@,
.L182:
	ldmib	r1, {r2, r3}	@ currentNode,,
	ldr	r1, [r1]	@ currentNode, currentNode_106->prev
	add	r3, r3, #1	@ D.6876, currentNode_106->y,
	mov	r3, r3, asl #3	@ D.6876, D.6876,
	add	r2, r2, #1	@ D.6876, currentNode_106->x,
	orr	r3, r3, #8192	@ tmp298, D.6876,
	mov	r2, r2, asl #3	@ D.6876, D.6876,
	cmp	r1, #0	@ currentNode,
	strh	r3, [r0]	@ movhi	@ tmp298, MEM[base: 0B, index: ivtmp.315_101, offset: 0B]
	strh	r2, [r0, #2]	@ movhi	@ D.6876, MEM[base: 0B, index: ivtmp.315_101, offset: 2B]
	strh	ip, [r0, #4]	@ movhi	@ tmp304, MEM[base: 0B, index: ivtmp.315_101, offset: 4B]
	add	r0, r0, #8	@ ivtmp.315, ivtmp.315,
	bne	.L182	@,
.L183:
	mov	lr, #1	@ tmp290,
	mov	r6, #34	@ tmp282,
	ldr	r3, [r4, #8]	@ D.6876, snake.head.y
	ldr	ip, [r4, #4]	@ D.6876, snake.head.x
	add	r2, r3, lr	@ D.6876, D.6876,
	ldr	r1, .L192+8	@ tmp272,
	rsb	r3, r3, r3, lsl #3	@ tmp286, D.6876, D.6876,
	add	r0, ip, lr	@ D.6876, D.6876,
	mov	r2, r2, asl #3	@ D.6876, D.6876,
	add	r5, r5, r3, lsl #2	@ tmp288, tmp303, tmp286,
	orr	r2, r2, #8192	@ tmp276, D.6876,
	mov	r3, r0, asl #3	@ D.6876, D.6876,
	strh	r6, [r1, #20]	@ movhi	@ tmp282, MEM[(short unsigned int *)117441044B]
	strh	r2, [r1, #16]	@ movhi	@ tmp276, MEM[(short unsigned int *)117441040B]
	strh	r3, [r1, #18]	@ movhi	@ D.6876, MEM[(short unsigned int *)117441042B]
	strb	lr, [r5, ip]	@ tmp290, grid
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}	@
	bx	lr	@
.L175:
	mov	r2, #2	@ tmp166,
	ldr	r3, .L192+20	@ tmp165,
	strb	r2, [r3]	@ tmp166, gameState
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}	@
	bx	lr	@
.L190:
	ldr	ip, .L192+24	@ tmp171,
	ldr	lr, [ip, #8]	@ lvl2, lvl2
	cmp	lr, #0	@ lvl2,
	beq	.L189	@,
	cmp	r1, #15	@ D.6876,
	ble	.L178	@,
.L189:
	mov	r2, #1	@ tmp178,
	ldr	r3, .L192+20	@ tmp177,
	strb	r2, [r3]	@ tmp178, gameState
	str	r1, [ip, #4]	@ D.6876, result
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}	@
	bx	lr	@
.L191:
	ldr	r3, [ip, #8]	@ targetNode.y, targetNode.y
	cmp	r2, r3	@ D.6876, targetNode.y
	bne	.L180	@,
	sub	r3, r1, #1	@ D.6876, D.6876,
	ldr	ip, [r4, #12]	@ D.6878, snake.tail
	add	r3, r3, r3, lsl #1	@ tmp189, D.6876, D.6876,
	add	r2, r1, r1, lsl #1	@ tmp210, D.6876, D.6876,
	mov	r3, r3, asl #2	@ tmp190, tmp189,
	ldr	r6, [ip, #4]	@ D.6876, _56->x
	ldr	r5, [ip, #8]	@ D.6876, _56->y
	mov	r2, r2, asl #2	@ tmp211, tmp210,
	add	lr, r3, #16	@ tmp232, tmp190,
	add	r3, r4, r3	@ tmp191, tmp301, tmp190
	str	ip, [r3, #16]	@ D.6878, MEM[(struct SnakeNode *)&snake].freeNodes[_54].prev
	add	lr, r4, lr	@ newTail, tmp301, tmp232
	add	ip, r2, #16	@ tmp240, tmp211,
	add	r2, r4, r2	@ tmp212, tmp301, tmp211
	add	r1, r1, #2	@ D.6876, D.6876,
	str	r6, [r3, #20]	@ D.6876, MEM[(struct SnakeNode *)&snake].freeNodes[_54].x
	add	ip, r4, ip	@ newTail, tmp301, tmp240
	str	r5, [r3, #24]	@ D.6876, MEM[(struct SnakeNode *)&snake].freeNodes[_54].y
	str	lr, [r2, #16]	@ newTail, MEM[(struct SnakeNode *)&snake].freeNodes[_10].prev
	str	r6, [r2, #20]	@ D.6876, MEM[(struct SnakeNode *)&snake].freeNodes[_10].x
	str	r5, [r2, #24]	@ D.6876, MEM[(struct SnakeNode *)&snake].freeNodes[_10].y
	str	r1, [r0, #1968]	@ D.6876, snake.length
	str	ip, [r4, #12]	@ newTail, snake.tail
	bl	spawnTargetNode	@
	b	.L180	@
.L193:
	.align	2
.L192:
	.word	snake
	.word	targetNode
	.word	117441024
	.word	grid
	.word	117441232
	.word	gameState
	.word	.LANCHOR1
	.size	tickAndDrawGame, .-tickAndDrawGame
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #67108864	@ tmp128,
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@,
	mov	r3, #1	@ tmp133,
	ldr	r8, .L224	@ tmp206,
	mov	r4, r2	@ tmp212, tmp128
	mov	r6, r8	@ tmp213, tmp206
	ldr	ip, .L224+4	@ tmp130,
	ldr	r1, .L224+8	@ tmp131,
	strh	ip, [r2]	@ movhi	@ tmp130, MEM[(short unsigned int *)67108864B]
	ldr	r7, .L224+12	@ tmp205,
	strh	r3, [r1, #8]	@ movhi	@ tmp133, MEM[(volatile u16 *)67109384B]
	ldr	r10, .L224+16	@ tmp199,
	ldr	r5, .L224+20	@ tmp202,
	ldr	r9, .L224+24	@ tmp197,
.L195:
	mov	fp, #4	@ D.6895,
.L197:
	ldrh	r3, [r4, #6]	@ MEM[(volatile u16 *)67108870B], MEM[(volatile u16 *)67108870B]
	cmp	r3, #159	@ MEM[(volatile u16 *)67108870B],
	bhi	.L197	@,
.L215:
	ldrh	r3, [r4, #6]	@ MEM[(volatile u16 *)67108870B], MEM[(volatile u16 *)67108870B]
	cmp	r3, #159	@ MEM[(volatile u16 *)67108870B],
	mov	r3, #67108864	@ tmp139,
	bls	.L215	@,
	ldr	r3, [r3, #304]	@ D.6898, MEM[(volatile uint32 *)67109168B]
	mvn	r3, r3	@ tmp148, D.6898
	mov	r3, r3, asl #16	@ tmp149, tmp148,
	mov	r3, r3, lsr #16	@ D.6897, tmp149,
	ldrb	r0, [r8, #12]	@ zero_extendqisi2	@ AppState, AppState
	ldrh	r2, [r10]	@ D.6897, key_cur
	mov	r1, r3, asl #22	@ tmp151, D.6897,
	mov	r1, r1, lsr #22	@ D.6897, tmp151,
	cmp	r0, #2	@ AppState,
	strh	r2, [r5]	@ movhi	@ D.6897, key_prev
	strh	r1, [r10]	@ movhi	@ D.6897, key_cur
	beq	.L200	@,
	cmp	r0, #3	@ AppState,
	beq	.L201	@,
	cmp	r0, #1	@ AppState,
	beq	.L221	@,
.L199:
	subs	fp, fp, #1	@ D.6895, D.6895,
	bne	.L197	@,
	ldrb	r3, [r7, #2892]	@ zero_extendqisi2	@ D.6896, TargetState
	ldrb	r2, [r8, #12]	@ zero_extendqisi2	@ AppState, AppState
	cmp	r2, r3	@ AppState, D.6896
	beq	.L204	@,
	cmp	r3, #2	@ D.6896,
	strb	r3, [r6, #12]	@ D.6896, AppState
	beq	.L205	@,
	cmp	r3, #3	@ D.6896,
	beq	.L206	@,
	cmp	r3, #1	@ D.6896,
	bne	.L195	@,
	ldr	r3, .L224+28	@ tmp223,
	mov	lr, pc
	bx	r3	@ tmp223
	b	.L195	@
.L221:
	cmp	r2, r1	@ D.6897, D.6897
	beq	.L199	@,
	tst	r3, #8	@ D.6897,
	strneb	r0, [r6]	@ AppState, state
	b	.L199	@
.L201:
	ldr	r3, .L224+32	@ tmp222,
	mov	lr, pc
	bx	r3	@ tmp222
	b	.L199	@
.L200:
	mov	lr, pc
	bx	r9	@ tmp197
	b	.L199	@
.L204:
	cmp	r2, #2	@ AppState,
	beq	.L208	@,
	cmp	r2, #3	@ AppState,
	beq	.L209	@,
	cmp	r2, #1	@ AppState,
	bne	.L195	@,
	ldrb	r3, [r6]	@ zero_extendqisi2	@ state, state
	cmp	r3, #1	@ state,
	moveq	r2, #2	@ tmp227,
	ldreq	r3, .L224+12	@ tmp226,
	streqb	r2, [r3, #2892]	@ tmp227, TargetState
	b	.L195	@
.L206:
	ldr	r3, .L224+36	@ tmp225,
	mov	lr, pc
	bx	r3	@ tmp225
	b	.L195	@
.L205:
	ldr	r3, .L224+40	@ tmp224,
	mov	lr, pc
	bx	r3	@ tmp224
	b	.L195	@
.L209:
	ldrb	r3, [r6]	@ zero_extendqisi2	@ D.6899, state
	cmp	r3, #1	@ D.6899,
	beq	.L222	@,
	cmp	r3, #2	@ D.6899,
	moveq	r2, #1	@ tmp234,
	streq	r2, [r6, #8]	@ tmp234, lvl2
	ldreq	r2, .L224+12	@ tmp235,
	streqb	r3, [r2, #2892]	@ D.6899, TargetState
	b	.L195	@
.L208:
	ldr	r3, .L224+44	@ tmp228,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ D.6896, gameState
	sub	r2, r3, #1	@ tmp180, D.6896,
	cmp	r2, #1	@ tmp180,
	bls	.L223	@,
	cmp	r3, #0	@ D.6896,
	bne	.L195	@,
	ldr	r3, .L224+48	@ tmp231,
	mov	lr, pc
	bx	r3	@ tmp231
	b	.L195	@
.L223:
	mov	r2, #3	@ tmp230,
	ldr	r3, .L224+12	@ tmp229,
	strb	r2, [r3, #2892]	@ tmp230, TargetState
	b	.L195	@
.L222:
	mov	r2, #2	@ tmp233,
	ldr	r3, .L224+12	@ tmp232,
	str	fp, [r6, #8]	@ D.6895, lvl2
	strb	r2, [r3, #2892]	@ tmp233, TargetState
	b	.L195	@
.L225:
	.align	2
.L224:
	.word	.LANCHOR1
	.word	4162
	.word	67109376
	.word	.LANCHOR0
	.word	key_cur
	.word	key_prev
	.word	handleGameInput
	.word	beginTitleScreen
	.word	handleGameOverInput
	.word	beginGameOverScreen
	.word	restartGame
	.word	gameState
	.word	tickAndDrawGame
	.size	main, .-main
	.text
	.align	2
	.global	AddNode
	.type	AddNode, %function
AddNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}	@,
	add	lr, r0, #4096	@ tmp119, s,
	ldr	r2, [lr, #1968]	@ D.6902, s_2(D)->length
	ldr	ip, [r0, #12]	@ D.6903, s_2(D)->tail
	sub	r3, r2, #1	@ D.6902, D.6902,
	add	r3, r3, r3, lsl #1	@ tmp122, D.6902, D.6902,
	ldr	r4, [ip, #4]	@ D.6902, _6->x
	mov	r3, r3, asl #2	@ tmp123, tmp122,
	add	r1, r0, r3	@ tmp124, s, tmp123
	str	r4, [r1, #20]	@ D.6902, MEM[(struct SnakeNode *)s_2(D)].freeNodes[_4].x
	add	r3, r3, #16	@ tmp142, tmp123,
	ldr	r4, [ip, #8]	@ D.6902, _6->y
	add	r2, r2, #1	@ D.6902, D.6902,
	add	r3, r0, r3	@ newTail, s, tmp142
	str	r4, [r1, #24]	@ D.6902, MEM[(struct SnakeNode *)s_2(D)].freeNodes[_4].y
	str	ip, [r1, #16]	@ D.6903, MEM[(struct SnakeNode *)s_2(D)].freeNodes[_4].prev
	str	r3, [r0, #12]	@ newTail, s_2(D)->tail
	str	r2, [lr, #1968]	@ D.6902, s_2(D)->length
	ldmfd	sp!, {r4, lr}	@
	bx	lr	@
	.size	AddNode, .-AddNode
	.align	2
	.global	IsCollidingWithNode
	.type	IsCollidingWithNode, %function
IsCollidingWithNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #4]	@ s_3(D)->head.x, s_3(D)->head.x
	ldr	r3, [r1, #4]	@ node_5(D)->x, node_5(D)->x
	cmp	r2, r3	@ s_3(D)->head.x, node_5(D)->x
	beq	.L231	@,
	mov	r0, #0	@ D.6906,
	bx	lr	@
.L231:
	ldr	r3, [r0, #8]	@ s_3(D)->head.y, s_3(D)->head.y
	ldr	r0, [r1, #8]	@ node_5(D)->y, node_5(D)->y
	rsb	r3, r0, r3	@, node_5(D)->y, s_3(D)->head.y
	rsbs	r0, r3, #0	@ D.6906,,
	adc	r0, r0, r3	@ D.6906, D.6906,
	bx	lr	@
	.size	IsCollidingWithNode, .-IsCollidingWithNode
	.align	2
	.global	UpdateVelocityX
	.type	UpdateVelocityX, %function
UpdateVelocityX:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #4096	@ tmp114, s,
	ldr	r3, [r0, #1980]	@ s_3(D)->lastXMov, s_3(D)->lastXMov
	cmp	r3, #1	@ s_3(D)->lastXMov,
	streq	r1, [r0, #1972]	@ vel, s_3(D)->xVel
	streq	r3, [r0, #1976]	@ s_3(D)->lastXMov, s_3(D)->yVel
	bx	lr	@
	.size	UpdateVelocityX, .-UpdateVelocityX
	.align	2
	.global	UpdateVelocityY
	.type	UpdateVelocityY, %function
UpdateVelocityY:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r0, r0, #4096	@ tmp114, s,
	ldr	r3, [r0, #1984]	@ s_3(D)->lastYMov, s_3(D)->lastYMov
	cmp	r3, #1	@ s_3(D)->lastYMov,
	streq	r3, [r0, #1972]	@ s_3(D)->lastYMov, s_3(D)->xVel
	streq	r1, [r0, #1976]	@ vel, s_3(D)->yVel
	bx	lr	@
	.size	UpdateVelocityY, .-UpdateVelocityY
	.align	2
	.global	memset
	.type	memset, %function
memset:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	cmp	r2, #0	@ num
	bxeq	lr	@
	mov	r3, r0	@ ptr, ptr
	and	r1, r1, #255	@ D.6927, value,
	add	r2, r0, r2	@ D.6928, ptr, num
.L238:
	strb	r1, [r3], #1	@ D.6927, MEM[base: ptr_8, offset: 4294967295B]
	cmp	r3, r2	@ ptr, D.6928
	bne	.L238	@,
	bx	lr	@
	.size	memset, .-memset
	.align	2
	.global	ha_rand
	.type	ha_rand, %function
ha_rand:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r1, .L243	@ tmp117,
	ldr	r3, [r1, #2888]	@ next, next
	rsb	r2, r3, r3, lsl #9	@ tmp121, next, next,
	add	r2, r3, r2, lsl #2	@ tmp123, next, tmp121,
	rsb	r2, r2, r2, lsl #9	@ tmp125, tmp123, tmp123,
	add	r2, r3, r2, lsl #1	@ tmp127, next, tmp125,
	add	r2, r2, r2, lsl #5	@ tmp129, tmp127, tmp127,
	rsb	r2, r3, r2, lsl #2	@ tmp131, next, tmp129,
	add	r3, r3, r2, lsl #2	@ D.6931, next, tmp131,
	add	r3, r3, #12288	@ tmp134, D.6931,
	add	r3, r3, #57	@ D.6931, tmp134,
	mov	r0, r3, asl #1	@ tmp138, D.6931,
	str	r3, [r1, #2888]	@ D.6931, next
	mov	r0, r0, lsr #17	@, tmp138,
	bx	lr	@
.L244:
	.align	2
.L243:
	.word	.LANCHOR0
	.size	ha_rand, .-ha_rand
	.comm	targetNode,12,4
	.comm	snake,6084,4
	.global	lvl2
	.global	gridStart
	.comm	grid,504,4
	.comm	currentDirection,1,1
	.global	TargetState
	.global	AppState
	.comm	gameState,1,1
	.global	state
	.comm	key_prev,2,2
	.comm	key_cur,2,2
	.global	sprites
	.global	palette
	.section	.rodata
	.align	2
	.type	gridStart, %object
	.size	gridStart, 4
gridStart:
	.word	8
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	palette, %object
	.size	palette, 72
palette:
	.word	0
	.word	32767
	.word	3168
	.word	3171
	.word	1057
	.word	99
	.word	3
	.word	3072
	.word	33
	.word	3171
	.word	2114
	.word	2115
	.word	3171
	.word	3
	.word	64
	.word	512
	.word	2146
	.word	2146
	.type	sprites, %object
	.size	sprites, 2816
sprites:
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	15
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.type	next, %object
	.size	next, 4
next:
	.word	1
	.type	TargetState, %object
	.size	TargetState, 1
TargetState:
	.byte	1
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	state, %object
	.size	state, 1
state:
	.space	1
	.space	3
	.type	result, %object
	.size	result, 4
result:
	.space	4
	.type	lvl2, %object
	.size	lvl2, 4
lvl2:
	.space	4
	.type	AppState, %object
	.size	AppState, 1
AppState:
	.space	1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589]"
