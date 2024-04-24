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
	.global	drawRect
	.type	drawRect, %function
drawRect:
	@ Function supports interworking.
	@ args = 4, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@,
	subs	r3, r3, r1	@ height, bottom, top
	rsb	fp, r0, r2	@ width, left, right
	ldrh	r8, [sp, #40]	@ clr, clr
	beq	.L5	@,
	mov	r9, r0	@ left, left
	mov	r5, r1	@ ivtmp.72, top
	ldr	r7, .L18	@ tmp134,
	add	r10, r3, r1	@ D.6487, height, ivtmp.72
	add	r6, r0, fp	@ D.6487, left, width
.L9:
	cmp	fp, #0	@ width,
	beq	.L10	@,
	mov	r4, r9	@ ivtmp.68, left
.L8:
	mov	r0, r4	@, ivtmp.68
	mov	r1, r5	@, ivtmp.72
	mov	lr, pc
	bx	r7	@ tmp134
	add	r4, r4, #1	@ ivtmp.68, ivtmp.68,
	mov	r0, r0, asl #1	@ tmp130,,
	add	r0, r0, #100663296	@ tmp131, tmp130,
	cmp	r6, r4	@ D.6487, ivtmp.68
	strh	r8, [r0]	@ movhi	@ clr, *_26
	bne	.L8	@,
.L10:
	add	r5, r5, #1	@ ivtmp.72, ivtmp.72,
	cmp	r5, r10	@ ivtmp.72, D.6487
	bne	.L9	@,
.L5:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	bx	lr	@
.L19:
	.align	2
.L18:
	.word	calc_pixel_location
	.size	drawRect, .-drawRect
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
	ble	.L20	@,
	mov	r10, r2	@ width, width
	mov	fp, r0	@ left, left
	mov	r5, r1	@ ivtmp.80, top
	ldr	r7, .L29	@ tmp132,
	add	r9, r3, r1	@ D.6499, height, ivtmp.80
	add	r6, r2, r0	@ D.6499, width, left
.L24:
	cmp	r10, #0	@ width,
	ble	.L25	@,
	mov	r4, fp	@ ivtmp.77, left
.L23:
	mov	r0, r4	@, ivtmp.77
	mov	r1, r5	@, ivtmp.80
	mov	lr, pc
	bx	r7	@ tmp132
	add	r4, r4, #1	@ ivtmp.77, ivtmp.77,
	mov	r0, r0, asl #1	@ tmp128,,
	add	r0, r0, #100663296	@ tmp129, tmp128,
	cmp	r6, r4	@ D.6499, ivtmp.77
	strh	r8, [r0]	@ movhi	@ clr, *_20
	bne	.L23	@,
.L25:
	add	r5, r5, #1	@ ivtmp.80, ivtmp.80,
	cmp	r5, r9	@ ivtmp.80, D.6499
	bne	.L24	@,
.L20:
	ldmfd	sp!, {r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}	@
	bx	lr	@
.L30:
	.align	2
.L29:
	.word	calc_pixel_location
	.size	drawRect2, .-drawRect2
	.align	2
	.global	drawString
	.type	drawString, %function
drawString:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}	@,
	rsb	r3, r3, r3, lsl #4	@ tmp219, y, y,
	mov	r7, r3, asl #4	@ tmp203, tmp219,
	ldrb	r3, [r0]	@ zero_extendqisi2	@ c, *msg_15(D)
	cmp	r3, #0	@ c,
	add	r4, r7, r2	@ D.6532, tmp203, x
	beq	.L31	@,
	mov	r4, r4, asl #1	@ D.6535, D.6532,
	ldr	r8, .L52	@ tmp222,
	add	r4, r4, #100663296	@ dst, D.6535,
	add	r6, r0, #1	@ msg, msg,
	add	r5, r7, #1920	@ D.6539, tmp209,
.L41:
	cmp	r3, #10	@ c,
	addeq	r4, r4, #3840	@ dst, dst,
	moveq	r2, #0	@ x,
	beq	.L34	@,
	mov	ip, r7	@ ivtmp.98, tmp209
	add	r3, r8, r3, lsl #3	@ glyphBytes, tmp222, c,
	sub	lr, r3, #256	@ ivtmp.94, glyphBytes,
	sub	lr, lr, #1	@ ivtmp.94, ivtmp.94,
	mov	r9, r2, asl #1	@ D.6532, x,
.L36:
	ldrb	r3, [lr, #1]!	@ zero_extendqisi2	@ row, MEM[base: _72, offset: 0B]
	cmp	r3, #0	@ row,
	addne	r0, r9, ip	@ D.6532, D.6532, ivtmp.98
	addne	r0, r4, r0, lsl #1	@ ivtmp.86, dst, D.6532,
	beq	.L40	@,
.L39:
	tst	r3, #1	@ row,
	strneh	r1, [r0]	@ movhi	@ textCol, MEM[base: _70, offset: 0B]
	movs	r3, r3, lsr #1	@ row, row,
	add	r0, r0, #2	@ ivtmp.86, ivtmp.86,
	bne	.L39	@,
.L40:
	add	ip, ip, #240	@ ivtmp.98, ivtmp.98,
	cmp	ip, r5	@ ivtmp.98, D.6539
	bne	.L36	@,
	add	r2, r2, #4	@ x, x,
.L34:
	ldrb	r3, [r6], #1	@ zero_extendqisi2	@ c, MEM[base: msg_49, offset: 4294967295B]
	cmp	r3, #0	@ c,
	bne	.L41	@,
.L31:
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, lr}	@
	bx	lr	@
.L53:
	.align	2
.L52:
	.word	.LANCHOR0
	.size	drawString, .-drawString
	.align	2
	.global	drawSprite
	.type	drawSprite, %function
drawSprite:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	add	r1, r1, #14680064	@ D.6542, N,
	mov	r1, r1, asl #3	@ D.6542, D.6542,
	orr	r3, r3, #8192	@ tmp132, y,
	orr	r2, r2, #16384	@ tmp134, x,
	mov	r0, r0, asl #3	@ tmp136, numb,
	strh	r3, [r1]	@ movhi	@ tmp132, *_4
	strh	r2, [r1, #2]	@ movhi	@ tmp134, *_13
	strh	r0, [r1, #4]	@ movhi	@ tmp136, *_20
	bx	lr	@
	.size	drawSprite, .-drawSprite
	.align	2
	.global	key_poll
	.type	key_poll, %function
key_poll:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864	@ tmp119,
	ldr	r3, [r3, #304]	@ D.6549, MEM[(volatile uint32 *)67109168B]
	mvn	r3, r3	@ tmp122, D.6549
	ldr	r2, .L56	@ tmp116,
	ldr	r1, .L56+4	@ tmp115,
	ldrh	r0, [r2]	@ key_cur, key_cur
	bic	r3, r3, #64512	@ tmp124, tmp122,
	strh	r0, [r1]	@ movhi	@ key_cur, key_prev
	strh	r3, [r2]	@ movhi	@ tmp124, key_cur
	bx	lr	@
.L57:
	.align	2
.L56:
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
	add	r2, r1, r1, lsl #2	@ tmp120, y, y,
	ldr	r3, .L59	@ tmp117,
	add	r1, r1, r2, lsl #1	@ tmp122, y, tmp120,
	add	r3, r3, r1, lsl #1	@ tmp124, tmp117, tmp122,
	ldrb	r0, [r3, r0]	@ zero_extendqisi2	@, grid
	bx	lr	@
.L60:
	.align	2
.L59:
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
	add	ip, r1, r1, lsl #2	@ tmp118, y, y,
	ldr	r3, .L62	@ tmp115,
	add	r1, r1, ip, lsl #1	@ tmp120, y, tmp118,
	add	r3, r3, r1, lsl #1	@ tmp122, tmp115, tmp120,
	strb	r2, [r3, r0]	@ value, grid
	bx	lr	@
.L63:
	.align	2
.L62:
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
	ldr	r3, .L65	@ tmp114,
	ldrb	r0, [r3]	@ zero_extendqisi2	@, state
	bx	lr	@
.L66:
	.align	2
.L65:
	.word	.LANCHOR1
	.size	getTitleScreenState, .-getTitleScreenState
	.align	2
	.global	beginTitleScreen
	.type	beginTitleScreen, %function
beginTitleScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, lr}	@,
	mov	r3, #992	@ tmp113,
	mov	r4, #0	@ tmp111,
	sub	sp, sp, #8	@,,
	ldr	ip, .L69	@ tmp110,
	mov	r1, r4	@, tmp111
	mov	r0, r4	@, tmp111
	str	r3, [sp]	@ tmp113,
	mov	r2, #240	@,
	mov	r3, #160	@,
	strb	r4, [ip]	@ tmp111, state
	bl	drawRect	@
	mov	r3, #40	@,
	mov	r1, r4	@, tmp111
	mov	r2, r3	@,
	ldr	r0, .L69+4	@,
	add	sp, sp, #8	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, lr}	@
	b	drawString	@
.L70:
	.align	2
.L69:
	.word	.LANCHOR1
	.word	.LC0
	.size	beginTitleScreen, .-beginTitleScreen
	.align	2
	.global	getGameState
	.type	getGameState, %function
getGameState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L72	@ tmp114,
	ldrb	r0, [r3]	@ zero_extendqisi2	@, gameState
	bx	lr	@
.L73:
	.align	2
.L72:
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
	ldr	r3, .L75	@ tmp113,
	ldr	r0, [r3, #3712]	@, snake.length
	bx	lr	@
.L76:
	.align	2
.L75:
	.word	snake
	.size	getFinalScore, .-getFinalScore
	.align	2
	.global	spawnTargetNode
	.type	spawnTargetNode, %function
spawnTargetNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mvn	r0, #0	@ lastR,
	stmfd	sp!, {r4, r5, r6, r7, r8, lr}	@,
	mov	ip, r0	@ tY, lastR
	mov	lr, r0	@ tX, lastR
	mov	r6, #0	@ tY,
	ldr	r4, .L89	@ tmp187,
	ldr	r7, .L89+4	@ ivtmp.145,
	ldr	r2, [r4]	@ D.6597, next
	sub	sp, sp, #8	@,,
.L78:
	mov	r5, r7	@ ivtmp.136, ivtmp.145
	mov	r1, #0	@ tX,
.L80:
	rsb	r3, r2, r2, lsl #9	@ tmp140, D.6597, D.6597,
	add	r3, r2, r3, lsl #2	@ tmp142, D.6597, tmp140,
	rsb	r3, r3, r3, lsl #9	@ tmp144, tmp142, tmp142,
	add	r3, r2, r3, lsl #1	@ tmp146, D.6597, tmp144,
	add	r3, r3, r3, lsl #5	@ tmp148, tmp146, tmp146,
	rsb	r3, r2, r3, lsl #2	@ tmp150, D.6597, tmp148,
	add	r3, r2, r3, lsl #2	@ D.6597, D.6597, tmp150,
	add	r3, r3, #12288	@ tmp153, D.6597,
	ldrb	r8, [r5, #1]!	@ zero_extendqisi2	@ MEM[base: _54, offset: 0B], MEM[base: _54, offset: 0B]
	add	r2, r3, #57	@ D.6597, tmp153,
	mov	r3, r2, asl #1	@ tmp156, D.6597,
	cmp	r8, #1	@ MEM[base: _54, offset: 0B],
	mov	r3, r3, lsr #17	@ lastR, tmp156,
	beq	.L79	@,
	cmn	ip, #1	@ tY,
	movne	r8, #0	@ tmp158,
	moveq	r8, #1	@ tmp158,
	cmp	r3, r0	@ lastR, lastR
	orrgt	r8, r8, #1	@,, tmp163, tmp158
	cmp	r8, #0	@ tmp163,
	movne	r0, r3	@ lastR, lastR
	movne	ip, r6	@ tY, tY
	movne	lr, r1	@ tX, tX
.L79:
	add	r1, r1, #1	@ tX, tX,
	cmp	r1, #22	@ tX,
	bne	.L80	@,
	add	r6, r6, #1	@ tY, tY,
	cmp	r6, #14	@ tY,
	add	r7, r7, #22	@ ivtmp.145, ivtmp.145,
	bne	.L78	@,
	mov	r3, #10	@,
	mov	r1, #31	@ tmp177,
	add	r5, lr, #1	@ D.6596, tX,
	add	r6, ip, #1	@ D.6596, tY,
	ldr	r7, .L89+8	@ tmp165,
	add	r5, r5, r5, lsl #2	@ tmp170, D.6596, D.6596,
	add	r6, r6, r6, lsl #2	@ tmp175, D.6596, D.6596,
	mov	r5, r5, asl #1	@ tmp171, tmp170,
	mov	r6, r6, asl #1	@ tmp176, tmp175,
	str	r1, [sp]	@ tmp177,
	mov	r0, r5	@, tmp171
	mov	r1, r6	@, tmp176
	str	r2, [r4]	@ D.6597, next
	str	lr, [r7, #4]	@ tX, targetNode.x
	mov	r2, r3	@,
	str	ip, [r7, #8]	@ tY, targetNode.y
	bl	drawRect2	@
	mov	r3, #117440512	@ tmp178,
	mov	r2, #0	@ tmp186,
	orr	r6, r6, #8192	@ tmp180, tmp176,
	orr	r5, r5, #16384	@ tmp183, tmp171,
	strh	r6, [r3, #32]	@ movhi	@ tmp180, MEM[(short unsigned int *)117440544B]
	strh	r5, [r3, #34]	@ movhi	@ tmp183, MEM[(short unsigned int *)117440546B]
	strh	r2, [r3, #36]	@ movhi	@ tmp186, MEM[(short unsigned int *)117440548B]
	add	sp, sp, #8	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, r5, r6, r7, r8, lr}	@
	bx	lr	@
.L90:
	.align	2
.L89:
	.word	.LANCHOR2
	.word	grid-1
	.word	targetNode
	.size	spawnTargetNode, .-spawnTargetNode
	.align	2
	.global	renderGame
	.type	renderGame, %function
renderGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	spawnTargetNode	@
	.size	renderGame, .-renderGame
	.align	2
	.global	restartGame
	.type	restartGame, %function
restartGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0	@ tmp113,
	ldr	r1, .L98	@ tmp112,
	ldr	r3, .L98+4	@ ptr,
	mov	r0, r2	@ tmp147, tmp113
	strb	r2, [r1]	@ tmp113, gameState
	add	r2, r3, #308	@ tmp144, ptr,
.L93:
	strb	r0, [r3], #1	@ tmp147, MEM[base: ptr_15, offset: 4294967295B]
	cmp	r3, r2	@ ptr, tmp144
	mov	r1, #0	@ tmp115,
	bne	.L93	@,
	ldr	r2, .L98+8	@ tmp118,
	mov	r3, r2	@ ptr, tmp118
	stmfd	sp!, {r4, r5, lr}	@,
	mov	ip, #1	@ tmp123,
	mov	lr, #2	@ tmp125,
	mov	r5, #10	@ tmp119,
	mov	r4, #6	@ tmp121,
	mov	r0, r1	@ tmp146, tmp115
	str	r1, [r3], #16	@ tmp115, MEM[(struct SnakeNode *)&snake].prev
	str	r2, [r2, #12]	@ tmp118, snake.tail
	str	r5, [r2, #4]	@ tmp119, snake.head.x
	str	r4, [r2, #8]	@ tmp121, snake.head.y
	str	ip, [r2, #3712]	@ tmp123, snake.length
	str	ip, [r2, #3720]	@ tmp123, snake.yVel
	str	ip, [r2, #3728]	@ tmp123, snake.lastYMov
	str	lr, [r2, #3716]	@ tmp125, snake.xVel
	str	lr, [r2, #3724]	@ tmp125, snake.lastXMov
	sub	sp, sp, #12	@,,
	add	r2, r2, #3712	@ tmp145, tmp118,
.L94:
	strb	r0, [r3], #1	@ tmp146, MEM[base: ptr_12, offset: 4294967295B]
	cmp	r3, r2	@ ptr, tmp145
	mov	r1, #0	@ tmp136,
	bne	.L94	@,
	str	r1, [sp]	@ tmp136,
	mov	r0, r1	@,
	mov	r3, #160	@,
	mov	r2, #240	@,
	bl	drawRect2	@
	mov	r4, #992	@ tmp140,
	mov	r1, #8	@,
	str	r4, [sp]	@ tmp140,
	mov	r0, r1	@,
	mov	r3, #2	@,
	mov	r2, #224	@,
	bl	drawRect2	@
	str	r4, [sp]	@ tmp140,
	mov	r3, #144	@,
	mov	r2, #2	@,
	mov	r1, #8	@,
	mov	r0, #230	@,
	bl	drawRect2	@
	mov	r1, #8	@,
	str	r4, [sp]	@ tmp140,
	mov	r0, r1	@,
	mov	r3, #144	@,
	mov	r2, #2	@,
	bl	drawRect2	@
	str	r4, [sp]	@ tmp140,
	mov	r3, #2	@,
	mov	r2, #224	@,
	mov	r1, #150	@,
	mov	r0, #8	@,
	bl	drawRect2	@
	add	sp, sp, #12	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, r5, lr}	@
	b	spawnTargetNode	@
.L99:
	.align	2
.L98:
	.word	gameState
	.word	grid
	.word	snake
	.size	restartGame, .-restartGame
	.align	2
	.global	handleGameInput
	.type	handleGameInput, %function
handleGameInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L126	@ tmp127,
	ldr	r2, .L126+4	@ tmp128,
	ldrh	r3, [r3]	@ D.6634, key_cur
	ldrh	r2, [r2]	@ key_prev, key_prev
	cmp	r2, r3	@ key_prev, D.6634
	str	lr, [sp, #-4]!	@,
	beq	.L100	@,
	tst	r3, #4	@ D.6634,
	ldr	r2, .L126+8	@ tmp214,
	bne	.L123	@,
	ldrb	r2, [r2]	@ zero_extendqisi2	@ state, state
	cmp	r2, #4	@ state,
	beq	.L100	@,
.L105:
	ands	r2, r3, #16	@ tmp164, D.6634,
	beq	.L109	@,
	ldr	r3, .L126+12	@ tmp166,
	ldr	r2, [r3, #3724]	@ snake.lastXMov, snake.lastXMov
	cmp	r2, #1	@ snake.lastXMov,
	moveq	r1, #2	@ tmp169,
	streq	r2, [r3, #3720]	@ snake.lastXMov, snake.yVel
	mov	r2, #1	@ tmp173,
	streq	r1, [r3, #3716]	@ tmp169, snake.xVel
	ldr	r3, .L126+16	@ tmp172,
	strb	r2, [r3]	@ tmp173, currentDirection
.L100:
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L123:
	ldrb	r1, [r2]	@ zero_extendqisi2	@ state, state
	cmp	r1, #4	@ state,
	beq	.L124	@,
	ldr	r3, .L126+12	@ tmp215,
	ldr	r0, [r3, #3716]	@ D.6633, snake.xVel
	ldr	r1, [r3, #3720]	@ D.6633, snake.yVel
	cmp	r0, #1	@ D.6633,
	streq	r0, [r3, #3720]	@ D.6633, snake.yVel
	cmp	r1, #1	@ D.6633,
	str	r0, [r3, #3724]	@ D.6633, snake.lastXMov
	str	r1, [r3, #3728]	@ D.6633, snake.lastYMov
	streq	r1, [r3, #3716]	@ D.6633, snake.xVel
	streq	r1, [r3, #3720]	@ D.6633, snake.yVel
	mov	r3, #4	@ tmp158,
	strb	r3, [r2]	@ tmp158, state
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L109:
	ands	r1, r3, #32	@ tmp177, D.6634,
	bne	.L125	@,
	tst	r3, #64	@ D.6634,
	beq	.L113	@,
	ldr	r3, .L126+12	@ tmp192,
	ldr	r2, [r3, #3728]	@ snake.lastYMov, snake.lastYMov
	cmp	r2, #1	@ snake.lastYMov,
	streq	r2, [r3, #3716]	@ snake.lastYMov, snake.xVel
	mov	r2, #2	@ tmp199,
	streq	r1, [r3, #3720]	@ tmp177, snake.yVel
	ldr	r3, .L126+16	@ tmp198,
	strb	r2, [r3]	@ tmp199, currentDirection
	b	.L100	@
.L125:
	ldr	r3, .L126+12	@ tmp179,
	ldr	r1, [r3, #3724]	@ snake.lastXMov, snake.lastXMov
	cmp	r1, #1	@ snake.lastXMov,
	streq	r2, [r3, #3716]	@ tmp164, snake.xVel
	mov	r2, #0	@ tmp186,
	streq	r1, [r3, #3720]	@ snake.lastXMov, snake.yVel
	ldr	r3, .L126+16	@ tmp185,
	strb	r2, [r3]	@ tmp186, currentDirection
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L124:
	mov	r0, #2	@ tmp137,
	ldr	r1, .L126+12	@ tmp139,
	ldr	lr, [r1, #3724]	@ snake.lastXMov, snake.lastXMov
	ldr	ip, [r1, #3728]	@ snake.lastYMov, snake.lastYMov
	str	lr, [r1, #3716]	@ snake.lastXMov, snake.xVel
	str	ip, [r1, #3720]	@ snake.lastYMov, snake.yVel
	strb	r0, [r2]	@ tmp137, state
	b	.L105	@
.L113:
	tst	r3, #128	@ D.6634,
	beq	.L100	@,
	ldr	r3, .L126+12	@ tmp205,
	ldr	r2, [r3, #3728]	@ snake.lastYMov, snake.lastYMov
	cmp	r2, #1	@ snake.lastYMov,
	moveq	r1, #2	@ tmp210,
	streq	r2, [r3, #3716]	@ snake.lastYMov, snake.xVel
	mov	r2, #3	@ tmp212,
	streq	r1, [r3, #3720]	@ tmp210, snake.yVel
	ldr	r3, .L126+16	@ tmp211,
	strb	r2, [r3]	@ tmp212, currentDirection
	b	.L100	@
.L127:
	.align	2
.L126:
	.word	key_cur
	.word	key_prev
	.word	.LANCHOR1
	.word	snake
	.word	currentDirection
	.size	handleGameInput, .-handleGameInput
	.align	2
	.global	SetMatchResult
	.type	SetMatchResult, %function
SetMatchResult:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L129	@ tmp111,
	str	r0, [r3, #4]	@ didPlayerWin, result
	bx	lr	@
.L130:
	.align	2
.L129:
	.word	.LANCHOR1
	.size	SetMatchResult, .-SetMatchResult
	.align	2
	.global	beginGameOverScreen
	.type	beginGameOverScreen, %function
beginGameOverScreen:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0	@ tmp112,
	stmfd	sp!, {r4, lr}	@,
	ldr	r3, .L136	@ tmp111,
	ldr	r4, [r3, #4]	@ result, result
	cmp	r4, r1	@ result,
	sub	sp, sp, #8	@,,
	strb	r1, [r3]	@ tmp112, state
	bne	.L135	@,
	mov	r2, #31	@ tmp119,
	mov	r1, r4	@, result
	str	r2, [sp]	@ tmp119,
	mov	r0, r4	@, result
	mov	r3, #160	@,
	mov	r2, #240	@,
	bl	drawRect	@
	mov	r3, #25	@,
	mov	r1, r4	@, result
	mov	r2, r3	@,
	ldr	r0, .L136+4	@,
	bl	drawString	@
	mov	r1, r4	@, result
	mov	r3, #35	@,
	mov	r2, #13	@,
	ldr	r0, .L136+8	@,
	add	sp, sp, #8	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, lr}	@
	b	drawString	@
.L135:
	str	r1, [sp]	@ tmp112,
	mov	r0, r1	@,
	mov	r3, #160	@,
	mov	r2, #240	@,
	bl	drawRect	@
	mov	r3, #25	@,
	mov	r1, #992	@,
	mov	r2, r3	@,
	ldr	r0, .L136+12	@,
	bl	drawString	@
	mov	r3, #35	@,
	mov	r2, #13	@,
	mov	r1, #992	@,
	ldr	r0, .L136+8	@,
	add	sp, sp, #8	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, lr}	@
	b	drawString	@
.L137:
	.align	2
.L136:
	.word	.LANCHOR1
	.word	.LC3
	.word	.LC2
	.word	.LC1
	.size	beginGameOverScreen, .-beginGameOverScreen
	.align	2
	.global	handleGameOverInput
	.type	handleGameOverInput, %function
handleGameOverInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L143	@ tmp113,
	ldr	r2, .L143+4	@ tmp114,
	ldrh	r3, [r3]	@ D.6645, key_cur
	ldrh	r2, [r2]	@ key_prev, key_prev
	cmp	r2, r3	@ key_prev, D.6645
	bxeq	lr	@
	tst	r3, #8	@ D.6645,
	movne	r2, #1	@ tmp121,
	ldrne	r3, .L143+8	@ tmp120,
	strneb	r2, [r3]	@ tmp121, state
	bx	lr	@
.L144:
	.align	2
.L143:
	.word	key_cur
	.word	key_prev
	.word	.LANCHOR1
	.size	handleGameOverInput, .-handleGameOverInput
	.align	2
	.global	handleTitleInput
	.type	handleTitleInput, %function
handleTitleInput:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	handleGameOverInput	@
	.size	handleTitleInput, .-handleTitleInput
	.align	2
	.global	getGameOverState
	.type	getGameOverState, %function
getGameOverState:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L147	@ tmp114,
	ldrb	r0, [r3]	@ zero_extendqisi2	@, state
	bx	lr	@
.L148:
	.align	2
.L147:
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
	mov	r4, #0	@ tmp122,
	mov	lr, #1	@ tmp117,
	mov	r5, #2	@ tmp118,
	mov	r3, r0	@ ptr, snake
	mov	ip, r4	@ tmp125, tmp122
	stmib	r0, {r1, r2}	@ snake,,
	str	r0, [r0, #12]	@ snake, snake_2(D)->tail
	str	lr, [r0, #3712]	@ tmp117, snake_2(D)->length
	str	lr, [r0, #3720]	@ tmp117, snake_2(D)->yVel
	str	lr, [r0, #3728]	@ tmp117, snake_2(D)->lastYMov
	str	r5, [r0, #3716]	@ tmp118, snake_2(D)->xVel
	str	r5, [r0, #3724]	@ tmp118, snake_2(D)->lastXMov
	str	r4, [r3], #16	@ tmp122, MEM[(struct SnakeNode *)snake_2(D)].prev
	add	r2, r0, #3712	@ D.6666, snake,
.L150:
	strb	ip, [r3], #1	@ tmp125, MEM[base: ptr_18, offset: 4294967295B]
	cmp	r2, r3	@ D.6666, ptr
	bne	.L150	@,
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
	ldr	r3, .L168	@ tmp132,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ state, state
	cmp	r3, #4	@ state,
	beq	.L159	@,
	ldr	r3, [r0, #12]	@ curNode, s_7(D)->tail
	cmp	r3, #0	@ curNode,
	beq	.L159	@,
	ldr	r2, [r3]	@ curNode, curNode_8->prev
	cmp	r2, #0	@ curNode,
	moveq	r2, r3	@ curNode, curNode
	beq	.L156	@,
	ldr	ip, [r2, #4]	@ D.6669, curNode_33->x
	ldr	r1, [r2, #8]	@ D.6669, curNode_33->y
	str	ip, [r3, #4]	@ D.6669, curNode_8->x
	str	r1, [r3, #8]	@ D.6669, curNode_8->y
	b	.L157	@
.L166:
	ldr	ip, [r3, #4]	@ D.6669, curNode_9->x
	ldr	r1, [r3, #8]	@ D.6669, curNode_9->y
	str	ip, [r2, #4]	@ D.6669, curNode_45->x
	str	r1, [r2, #8]	@ D.6669, curNode_45->y
	mov	r2, r3	@ curNode, curNode
.L157:
	ldr	r3, [r2]	@ curNode, curNode_45->prev
	cmp	r3, #0	@ curNode,
	bne	.L166	@,
.L156:
	ldr	r4, [r0, #3720]	@ D.6669, s_7(D)->yVel
	ldr	r1, [r2, #8]	@ curNode_32->y, curNode_32->y
	sub	r3, r4, #1	@ D.6669, D.6669,
	ldr	r5, [r0, #3716]	@ D.6669, s_7(D)->xVel
	ldr	lr, [r2, #4]	@ curNode_32->x, curNode_32->x
	add	r1, r3, r1	@ newY, D.6669, curNode_32->y
	add	r3, r1, r1, lsl #2	@ tmp140, newY, newY,
	sub	ip, r5, #1	@ D.6669, D.6669,
	add	ip, ip, lr	@ newX, D.6669, curNode_32->x
	add	r3, r1, r3, lsl #1	@ D.6669, newY, tmp140,
	ldr	lr, .L168+4	@ tmp144,
	add	r3, ip, r3, lsl #1	@ D.6669, newX, D.6669,
	ldrb	r6, [lr, r3]	@ zero_extendqisi2	@ tmp145, grid
	cmp	r6, #0	@ tmp145,
	movne	r2, #0	@ D.6669,
	beq	.L167	@,
	mov	r0, r2	@, D.6669
	ldmfd	sp!, {r4, r5, r6, lr}	@
	bx	lr	@
.L159:
	mov	r2, #1	@ D.6669,
	ldmfd	sp!, {r4, r5, r6, lr}	@
	mov	r0, r2	@, D.6669
	bx	lr	@
.L167:
	mov	r6, #1	@ tmp147,
	str	ip, [r2, #4]	@ newX, curNode_32->x
	str	r1, [r2, #8]	@ newY, curNode_32->y
	mov	r2, r6	@ D.6669, tmp147
	strb	r6, [lr, r3]	@ tmp147, grid
	str	r5, [r0, #3724]	@ D.6669, s_7(D)->lastXMov
	str	r4, [r0, #3728]	@ D.6669, s_7(D)->lastYMov
	mov	r0, r2	@, D.6669
	ldmfd	sp!, {r4, r5, r6, lr}	@
	bx	lr	@
.L169:
	.align	2
.L168:
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
	stmfd	sp!, {r4, r5, r6, lr}	@,
	ldr	r4, .L183	@ tmp279,
	ldr	r3, [r4, #4]	@ D.6674, snake.head.x
	cmp	r3, #21	@ D.6674,
	sub	sp, sp, #8	@,,
	bhi	.L171	@,
	ldr	r2, [r4, #8]	@ D.6674, snake.head.y
	cmp	r2, #13	@ D.6674,
	bhi	.L171	@,
	ldr	r1, [r4, #3712]	@ D.6674, snake.length
	cmp	r1, #308	@ D.6674,
	beq	.L180	@,
	ldr	r0, .L183+4	@ tmp156,
	ldr	ip, [r0, #4]	@ targetNode.x, targetNode.x
	cmp	r3, ip	@ D.6674, targetNode.x
	beq	.L181	@,
.L175:
	mov	r5, #0	@ tmp233,
	mov	r3, #10	@,
	ldr	r2, [r4, #12]	@ D.6676, snake.tail
	ldmib	r2, {r0, r1}	@ D.6676,,
	add	r1, r1, #1	@ D.6674, _13->y,
	add	r0, r0, #1	@ D.6674, _13->x,
	add	r1, r1, r1, lsl #2	@ D.6674, D.6674, D.6674,
	add	r0, r0, r0, lsl #2	@ D.6674, D.6674, D.6674,
	mov	r2, r3	@,
	mov	r1, r1, asl #1	@, D.6674,
	mov	r0, r0, asl #1	@, D.6674,
	str	r5, [sp]	@ tmp233,
	bl	drawRect2	@
	ldr	r2, [r4, #12]	@ D.6676, snake.tail
	ldr	r3, [r2, #8]	@ _21->y, _21->y
	ldr	r6, .L183+8	@ tmp235,
	add	r1, r3, r3, lsl #2	@ tmp240, _21->y, _21->y,
	ldr	r4, .L183	@ tmp220,
	ldr	r2, [r2, #4]	@ _21->x, _21->x
	add	r3, r3, r1, lsl #1	@ tmp242, _21->y, tmp240,
	add	r3, r6, r3, lsl #1	@ tmp244, tmp235, tmp242,
	mov	r0, r4	@, tmp220
	strb	r5, [r3, r2]	@ tmp233, grid
	bl	UpdateSnake	@
	cmp	r0, r5	@,
	bne	.L182	@,
.L171:
	mov	r2, #2	@ tmp150,
	ldr	r3, .L183+12	@ tmp149,
	strb	r2, [r3]	@ tmp150, gameState
.L170:
	add	sp, sp, #8	@,,
	@ sp needed	@
	ldmfd	sp!, {r4, r5, r6, lr}	@
	bx	lr	@
.L182:
	mov	r3, #10	@,
	ldmib	r4, {r0, r1}	@ tmp220,,
	ldr	ip, .L183+16	@ tmp263,
	add	r1, r1, #1	@ D.6674, snake.head.y,
	add	r0, r0, #1	@ D.6674, snake.head.x,
	add	r1, r1, r1, lsl #2	@ D.6674, D.6674, D.6674,
	add	r0, r0, r0, lsl #2	@ D.6674, D.6674, D.6674,
	mov	r2, r3	@,
	mov	r1, r1, asl #1	@, D.6674,
	mov	r0, r0, asl #1	@, D.6674,
	str	ip, [sp]	@ tmp263,
	bl	drawRect2	@
	mov	r1, #1	@ tmp277,
	ldr	r3, [r4, #8]	@ snake.head.y, snake.head.y
	add	r0, r3, r3, lsl #2	@ tmp271, snake.head.y, snake.head.y,
	ldr	r2, [r4, #4]	@ snake.head.x, snake.head.x
	add	r3, r3, r0, lsl #1	@ tmp273, snake.head.y, tmp271,
	add	r6, r6, r3, lsl #1	@ tmp275, tmp235, tmp273,
	strb	r1, [r6, r2]	@ tmp277, grid
	b	.L170	@
.L181:
	ldr	r3, [r0, #8]	@ targetNode.y, targetNode.y
	cmp	r2, r3	@ D.6674, targetNode.y
	bne	.L175	@,
	sub	r3, r1, #1	@ D.6674, D.6674,
	ldr	r0, [r4, #12]	@ D.6676, snake.tail
	add	r3, r3, r3, lsl #1	@ tmp164, D.6674, D.6674,
	add	r2, r1, r1, lsl #1	@ tmp185, D.6674, D.6674,
	mov	r3, r3, asl #2	@ tmp165, tmp164,
	ldmib	r0, {r5, lr}	@ D.6676,,
	mov	r2, r2, asl #2	@ tmp186, tmp185,
	add	ip, r3, #16	@ tmp207, tmp165,
	add	r3, r4, r3	@ tmp166, tmp279, tmp165
	str	r0, [r3, #16]	@ D.6676, MEM[(struct SnakeNode *)&snake].freeNodes[_43].prev
	add	ip, ip, r4	@ newTail, tmp207, tmp279
	add	r0, r2, #16	@ tmp215, tmp186,
	add	r2, r4, r2	@ tmp187, tmp279, tmp186
	add	r1, r1, #2	@ D.6674, D.6674,
	str	r5, [r3, #20]	@ D.6674, MEM[(struct SnakeNode *)&snake].freeNodes[_43].x
	add	r0, r0, r4	@ newTail, tmp215, tmp279
	str	lr, [r3, #24]	@ D.6674, MEM[(struct SnakeNode *)&snake].freeNodes[_43].y
	str	ip, [r2, #16]	@ newTail, MEM[(struct SnakeNode *)&snake].freeNodes[_7].prev
	str	r5, [r2, #20]	@ D.6674, MEM[(struct SnakeNode *)&snake].freeNodes[_7].x
	str	lr, [r2, #24]	@ D.6674, MEM[(struct SnakeNode *)&snake].freeNodes[_7].y
	str	r1, [r4, #3712]	@ D.6674, snake.length
	str	r0, [r4, #12]	@ newTail, snake.tail
	bl	spawnTargetNode	@
	b	.L175	@
.L180:
	mov	r2, #1	@ tmp154,
	ldr	r3, .L183+12	@ tmp153,
	strb	r2, [r3]	@ tmp154, gameState
	b	.L170	@
.L184:
	.align	2
.L183:
	.word	snake
	.word	targetNode
	.word	grid
	.word	gameState
	.word	32767
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
	mov	r3, #1	@ tmp132,
	ldr	r8, .L222	@ tmp189,
	mov	r4, r2	@ tmp203, tmp128
	mov	r7, r8	@ tmp206, tmp189
	ldr	ip, .L222+4	@ tmp129,
	ldr	r0, .L222+8	@ tmp130,
	str	ip, [r2]	@ tmp129, MEM[(volatile u32 *)67108864B]
	ldr	r5, .L222+12	@ tmp191,
	ldr	fp, .L222+16	@ tmp196,
	strh	r3, [r0, #8]	@ movhi	@ tmp132, MEM[(volatile u16 *)67109384B]
	ldr	r9, .L222+20	@ tmp195,
	ldr	r6, .L222+24	@ tmp192,
.L186:
	mov	r10, #4	@ D.6693,
.L188:
	ldrh	r3, [r4, #6]	@ MEM[(volatile u16 *)67108870B], MEM[(volatile u16 *)67108870B]
	cmp	r3, #159	@ MEM[(volatile u16 *)67108870B],
	bhi	.L188	@,
.L209:
	ldrh	r3, [r4, #6]	@ MEM[(volatile u16 *)67108870B], MEM[(volatile u16 *)67108870B]
	cmp	r3, #159	@ MEM[(volatile u16 *)67108870B],
	mov	r3, #67108864	@ tmp138,
	bls	.L209	@,
	ldr	r3, [r3, #304]	@ D.6694, MEM[(volatile uint32 *)67109168B]
	mvn	r3, r3	@ tmp147, D.6694
	mov	r3, r3, asl #16	@ tmp148, tmp147,
	mov	r3, r3, lsr #16	@ D.6692, tmp148,
	ldrb	r0, [r8, #8]	@ zero_extendqisi2	@ AppState, AppState
	ldrh	r2, [fp]	@ D.6692, key_cur
	mov	r1, r3, asl #22	@ tmp150, D.6692,
	mov	r1, r1, lsr #22	@ D.6692, tmp150,
	cmp	r0, #2	@ AppState,
	strh	r2, [r9]	@ movhi	@ D.6692, key_prev
	strh	r1, [fp]	@ movhi	@ D.6692, key_cur
	beq	.L191	@,
	cmp	r0, #3	@ AppState,
	beq	.L220	@,
	cmp	r0, #1	@ AppState,
	beq	.L220	@,
.L190:
	subs	r10, r10, #1	@ D.6693, D.6693,
	bne	.L188	@,
	ldrb	r3, [r5, #4]	@ zero_extendqisi2	@ D.6691, TargetState
	ldrb	r2, [r8, #8]	@ zero_extendqisi2	@ AppState, AppState
	cmp	r2, r3	@ AppState, D.6691
	beq	.L196	@,
	cmp	r3, #2	@ D.6691,
	strb	r3, [r7, #8]	@ D.6691, AppState
	beq	.L197	@,
	cmp	r3, #3	@ D.6691,
	beq	.L198	@,
	cmp	r3, #1	@ D.6691,
	bne	.L186	@,
	ldr	r3, .L222+28	@ tmp212,
	mov	lr, pc
	bx	r3	@ tmp212
	b	.L186	@
.L220:
	cmp	r2, r1	@ D.6692, D.6692
	beq	.L190	@,
	tst	r3, #8	@ D.6692,
	movne	r3, #1	@ tmp211,
	strneb	r3, [r8]	@ tmp211, state
	b	.L190	@
.L191:
	mov	lr, pc
	bx	r6	@ tmp192
	b	.L190	@
.L196:
	cmp	r2, #2	@ AppState,
	beq	.L200	@,
	cmp	r2, #3	@ AppState,
	beq	.L218	@,
	cmp	r2, #1	@ AppState,
	bne	.L186	@,
.L218:
	ldrb	r3, [r7]	@ zero_extendqisi2	@ state, state
	cmp	r3, #1	@ state,
	moveq	r3, #2	@ tmp215,
	streqb	r3, [r5, #4]	@ tmp215, TargetState
	b	.L186	@
.L198:
	ldr	r3, .L222+32	@ tmp214,
	mov	lr, pc
	bx	r3	@ tmp214
	b	.L186	@
.L197:
	ldr	r3, .L222+36	@ tmp213,
	mov	lr, pc
	bx	r3	@ tmp213
	b	.L186	@
.L200:
	ldr	r3, .L222+40	@ tmp216,
	ldrb	r3, [r3]	@ zero_extendqisi2	@ D.6691, gameState
	sub	r2, r3, #1	@ tmp182, D.6691,
	cmp	r2, #1	@ tmp182,
	bls	.L221	@,
	cmp	r3, #0	@ D.6691,
	bne	.L186	@,
	ldr	r3, .L222+44	@ tmp219,
	mov	lr, pc
	bx	r3	@ tmp219
	b	.L186	@
.L221:
	mov	r2, #3	@ tmp218,
	ldr	r3, .L222+12	@ tmp217,
	strb	r2, [r3, #4]	@ tmp218, TargetState
	b	.L186	@
.L223:
	.align	2
.L222:
	.word	.LANCHOR1
	.word	1027
	.word	67109376
	.word	.LANCHOR2
	.word	key_cur
	.word	key_prev
	.word	handleGameInput
	.word	beginTitleScreen
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
	ldr	r2, [r0, #3712]	@ D.6697, s_2(D)->length
	ldr	ip, [r0, #12]	@ D.6698, s_2(D)->tail
	sub	r3, r2, #1	@ D.6697, D.6697,
	add	r3, r3, r3, lsl #1	@ tmp120, D.6697, D.6697,
	str	lr, [sp, #-4]!	@,
	mov	r3, r3, asl #2	@ tmp121, tmp120,
	ldr	lr, [ip, #4]	@ D.6697, _6->x
	add	r1, r0, r3	@ tmp122, s, tmp121
	str	lr, [r1, #20]	@ D.6697, MEM[(struct SnakeNode *)s_2(D)].freeNodes[_4].x
	add	r3, r3, #16	@ tmp140, tmp121,
	ldr	lr, [ip, #8]	@ D.6697, _6->y
	add	r2, r2, #1	@ D.6697, D.6697,
	add	r3, r0, r3	@ newTail, s, tmp140
	str	lr, [r1, #24]	@ D.6697, MEM[(struct SnakeNode *)s_2(D)].freeNodes[_4].y
	str	ip, [r1, #16]	@ D.6698, MEM[(struct SnakeNode *)s_2(D)].freeNodes[_4].prev
	ldr	lr, [sp], #4	@,
	str	r3, [r0, #12]	@ newTail, s_2(D)->tail
	str	r2, [r0, #3712]	@ D.6697, s_2(D)->length
	bx	lr	@
	.size	AddNode, .-AddNode
	.align	2
	.global	DrawLooseNode
	.type	DrawLooseNode, %function
DrawLooseNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r1	@ gridOffset, gridOffset
	str	lr, [sp, #-4]!	@,
	ldmib	r0, {r0, r1}	@ n,,
	ldr	lr, .L228	@ tmp125,
	sub	sp, sp, #12	@,,
	mov	r3, r2	@ nodeSize, nodeSize
	mla	r1, r2, r1, ip	@, nodeSize, n_2(D)->y, gridOffset
	mla	r0, r2, r0, ip	@, nodeSize, n_2(D)->x, gridOffset
	str	lr, [sp]	@ tmp125,
	bl	drawRect2	@
	add	sp, sp, #12	@,,
	@ sp needed	@
	ldr	lr, [sp], #4	@,
	bx	lr	@
.L229:
	.align	2
.L228:
	.word	1023
	.size	DrawLooseNode, .-DrawLooseNode
	.align	2
	.global	ClearLooseNode
	.type	ClearLooseNode, %function
ClearLooseNode:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	ip, r1	@ gridOffset, gridOffset
	str	lr, [sp, #-4]!	@,
	mov	lr, #0	@ tmp125,
	ldmib	r0, {r0, r1}	@ n,,
	sub	sp, sp, #12	@,,
	mov	r3, r2	@ nodeSize, nodeSize
	mla	r1, r2, r1, ip	@, nodeSize, n_2(D)->y, gridOffset
	mla	r0, r2, r0, ip	@, nodeSize, n_2(D)->x, gridOffset
	str	lr, [sp]	@ tmp125,
	bl	drawRect2	@
	add	sp, sp, #12	@,,
	@ sp needed	@
	ldr	lr, [sp], #4	@,
	bx	lr	@
	.size	ClearLooseNode, .-ClearLooseNode
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
	beq	.L235	@,
	mov	r0, #0	@ D.6707,
	bx	lr	@
.L235:
	ldr	r3, [r0, #8]	@ s_3(D)->head.y, s_3(D)->head.y
	ldr	r0, [r1, #8]	@ node_5(D)->y, node_5(D)->y
	rsb	r3, r0, r3	@, node_5(D)->y, s_3(D)->head.y
	rsbs	r0, r3, #0	@ D.6707,,
	adc	r0, r0, r3	@ D.6707, D.6707,
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
	ldr	r3, [r0, #3724]	@ s_3(D)->lastXMov, s_3(D)->lastXMov
	cmp	r3, #1	@ s_3(D)->lastXMov,
	streq	r1, [r0, #3716]	@ vel, s_3(D)->xVel
	streq	r3, [r0, #3720]	@ s_3(D)->lastXMov, s_3(D)->yVel
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
	ldr	r3, [r0, #3728]	@ s_3(D)->lastYMov, s_3(D)->lastYMov
	cmp	r3, #1	@ s_3(D)->lastYMov,
	streq	r3, [r0, #3716]	@ s_3(D)->lastYMov, s_3(D)->xVel
	streq	r1, [r0, #3720]	@ vel, s_3(D)->yVel
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
	and	r1, r1, #255	@ D.6728, value,
	add	r2, r0, r2	@ D.6729, ptr, num
.L242:
	strb	r1, [r3], #1	@ D.6728, MEM[base: ptr_8, offset: 4294967295B]
	cmp	r3, r2	@ ptr, D.6729
	bne	.L242	@,
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
	ldr	r1, .L247	@ tmp117,
	ldr	r3, [r1]	@ next, next
	rsb	r2, r3, r3, lsl #9	@ tmp121, next, next,
	add	r2, r3, r2, lsl #2	@ tmp123, next, tmp121,
	rsb	r2, r2, r2, lsl #9	@ tmp125, tmp123, tmp123,
	add	r2, r3, r2, lsl #1	@ tmp127, next, tmp125,
	add	r2, r2, r2, lsl #5	@ tmp129, tmp127, tmp127,
	rsb	r2, r3, r2, lsl #2	@ tmp131, next, tmp129,
	add	r3, r3, r2, lsl #2	@ D.6732, next, tmp131,
	add	r3, r3, #12288	@ tmp134, D.6732,
	add	r3, r3, #57	@ D.6732, tmp134,
	mov	r0, r3, asl #1	@ tmp138, D.6732,
	str	r3, [r1]	@ D.6732, next
	mov	r0, r0, lsr #17	@, tmp138,
	bx	lr	@
.L248:
	.align	2
.L247:
	.word	.LANCHOR2
	.size	ha_rand, .-ha_rand
	.comm	targetNode,12,4
	.comm	snake,3732,4
	.global	gridStart
	.comm	grid,308,4
	.comm	currentDirection,1,1
	.global	TargetState
	.global	AppState
	.comm	gameState,1,1
	.global	state
	.comm	key_prev,2,2
	.comm	key_cur,2,2
	.global	fontTiles
	.global	sprites
	.global	palette
	.section	.rodata
	.align	2
	.set	.LANCHOR0,. + 0
	.type	fontTiles, %object
	.size	fontTiles, 768
fontTiles:
	.word	0
	.word	0
	.word	404232216
	.word	1572888
	.word	13878
	.word	0
	.word	914306614
	.word	3552895
	.word	1007057944
	.word	1588832
	.word	456484352
	.word	3364460
	.word	1846949404
	.word	14578491
	.word	792600
	.word	0
	.word	202119216
	.word	3151884
	.word	808458252
	.word	792624
	.word	-12818944
	.word	26172
	.word	2115508224
	.word	6168
	.word	0
	.word	202905600
	.word	2113929216
	.word	0
	.word	0
	.word	1579008
	.word	405823680
	.word	198156
	.word	2121688636
	.word	3958382
	.word	404626456
	.word	1579032
	.word	811623996
	.word	8260632
	.word	945841724
	.word	3958368
	.word	859192376
	.word	3158143
	.word	1614677630
	.word	3958368
	.word	1040583736
	.word	3958374
	.word	811622526
	.word	1579032
	.word	1013343804
	.word	3958374
	.word	2087085628
	.word	1847392
	.word	1579008
	.word	1579008
	.word	1579008
	.word	202905600
	.word	102260736
	.word	24600
	.word	8257536
	.word	126
	.word	1612187136
	.word	1560
	.word	811623996
	.word	1572888
	.word	1515873852
	.word	3933818
	.word	2120640060
	.word	6710886
	.word	1046898238
	.word	4089446
	.word	101059704
	.word	7867398
	.word	1717974558
	.word	1980006
	.word	503711358
	.word	8259078
	.word	503711358
	.word	394758
	.word	1980130876
	.word	8152678
	.word	2120640102
	.word	6710886
	.word	404232252
	.word	3938328
	.word	1616928864
	.word	3958368
	.word	253440867
	.word	6501147
	.word	101058054
	.word	8259078
	.word	1803515747
	.word	6513507
	.word	2070898531
	.word	6513523
	.word	1717986876
	.word	3958374
	.word	1046898238
	.word	394758
	.word	858993438
	.word	8272691
	.word	1046898238
	.word	6710838
	.word	1007576636
	.word	3958384
	.word	404232318
	.word	1579032
	.word	1717986918
	.word	3958374
	.word	1717986918
	.word	1588284
	.word	1801675619
	.word	6518655
	.word	406611651
	.word	12805692
	.word	406611651
	.word	1579032
	.word	202911871
	.word	8323846
	.word	202116156
	.word	3935244
	.word	403441155
	.word	12607536
	.word	808464444
	.word	3944496
	.word	6700056
	.word	0
	.word	0
	.word	4128768
	.word	3151896
	.word	0
	.word	1614544896
	.word	8152700
	.word	1715340806
	.word	4089446
	.word	104595456
	.word	3933702
	.word	1719427168
	.word	8152678
	.word	1715208192
	.word	3933822
	.word	205392952
	.word	789516
	.word	1719402496
	.word	1012956262
	.word	1715340806
	.word	6710886
	.word	404226072
	.word	3151896
	.word	808452144
	.word	506474544
	.word	912655878
	.word	6698526
	.word	404232216
	.word	3151896
	.word	2134310912
	.word	6513515
	.word	1715339264
	.word	6710886
	.word	1715208192
	.word	3958374
	.word	1715339264
	.word	101072486
	.word	1719402496
	.word	1616936038
	.word	1715339264
	.word	394758
	.word	104595456
	.word	4087868
	.word	205392908
	.word	3673100
	.word	1717960704
	.word	8152678
	.word	1717960704
	.word	1588326
	.word	1667432448
	.word	3571563
	.word	912457728
	.word	6501916
	.word	1717960704
	.word	202914918
	.word	813563904
	.word	8260632
	.word	202905648
	.word	3151896
	.word	404232216
	.word	1579032
	.word	806885388
	.word	792600
	.word	3894784
	.word	0
	.word	0
	.word	0
	.type	gridStart, %object
	.size	gridStart, 4
gridStart:
	.word	10
	.data
	.align	2
	.set	.LANCHOR2,. + 0
	.type	next, %object
	.size	next, 4
next:
	.word	1
	.type	TargetState, %object
	.size	TargetState, 1
TargetState:
	.byte	1
	.space	3
	.type	sprites, %object
	.size	sprites, 12800
sprites:
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
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
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
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
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
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
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
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
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
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	2
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	2
	.short	2
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	4
	.short	3
	.short	4
	.short	3
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
	.short	2
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
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
	.short	1
	.short	1
	.short	3
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
	.short	4
	.short	3
	.short	4
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	5
	.short	6
	.short	5
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	5
	.short	6
	.short	5
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	5
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	5
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
	.short	3
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
	.short	2
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
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
	.short	3
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
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
	.short	2
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
	.short	3
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	4
	.short	3
	.short	4
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
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	4
	.short	3
	.short	4
	.short	0
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
	.short	1
	.short	1
	.short	3
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
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
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
	.short	3
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
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	2
	.short	2
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
	.short	3
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	4
	.short	3
	.short	4
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
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	4
	.short	3
	.short	4
	.short	0
	.short	1
	.short	1
	.short	1
	.short	5
	.short	6
	.short	5
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	5
	.short	6
	.short	5
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	5
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	0
	.short	5
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
	.short	3
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
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	12
	.short	12
	.short	11
	.short	6
	.short	0
	.short	0
	.short	6
	.short	12
	.short	11
	.short	11
	.short	6
	.short	6
	.short	6
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	6
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
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	12
	.short	12
	.short	11
	.short	6
	.short	0
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	6
	.short	11
	.short	11
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	12
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	12
	.short	11
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	11
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
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
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	4
	.short	10
	.short	3
	.short	0
	.short	0
	.short	3
	.short	4
	.short	10
	.short	10
	.short	3
	.short	3
	.short	3
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
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
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	4
	.short	10
	.short	3
	.short	0
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	3
	.short	10
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	10
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	10
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
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
	.short	14
	.short	14
	.short	15
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
	.short	15
	.short	15
	.short	17
	.short	15
	.short	0
	.short	0
	.short	14
	.short	15
	.short	17
	.short	15
	.short	17
	.short	17
	.short	15
	.short	0
	.short	14
	.short	15
	.short	15
	.short	17
	.short	17
	.short	17
	.short	17
	.short	0
	.short	14
	.short	15
	.short	17
	.short	15
	.short	17
	.short	17
	.short	17
	.short	0
	.short	14
	.short	15
	.short	17
	.short	17
	.short	17
	.short	17
	.short	17
	.short	0
	.short	14
	.short	15
	.short	15
	.short	15
	.short	17
	.short	17
	.short	17
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
	.short	16
	.short	16
	.short	16
	.short	0
	.short	0
	.short	0
	.short	0
	.short	16
	.short	16
	.short	17
	.short	16
	.short	16
	.short	0
	.short	0
	.short	15
	.short	16
	.short	17
	.short	16
	.short	17
	.short	16
	.short	16
	.short	0
	.short	17
	.short	17
	.short	17
	.short	16
	.short	17
	.short	16
	.short	16
	.short	0
	.short	17
	.short	17
	.short	17
	.short	17
	.short	16
	.short	17
	.short	16
	.short	0
	.short	17
	.short	17
	.short	17
	.short	17
	.short	17
	.short	16
	.short	16
	.short	0
	.short	17
	.short	17
	.short	17
	.short	17
	.short	16
	.short	17
	.short	16
	.short	0
	.short	0
	.short	0
	.short	14
	.short	15
	.short	17
	.short	15
	.short	17
	.short	17
	.short	0
	.short	0
	.short	0
	.short	14
	.short	15
	.short	15
	.short	15
	.short	17
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
	.short	15
	.short	17
	.short	15
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
	.short	15
	.short	15
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
	.short	15
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
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
	.short	17
	.short	17
	.short	17
	.short	16
	.short	17
	.short	16
	.short	0
	.short	0
	.short	17
	.short	17
	.short	16
	.short	17
	.short	16
	.short	0
	.short	0
	.short	0
	.short	17
	.short	16
	.short	17
	.short	16
	.short	0
	.short	0
	.short	0
	.short	0
	.short	16
	.short	17
	.short	16
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	17
	.short	16
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	16
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
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	6
	.short	13
	.short	0
	.short	0
	.short	0
	.short	13
	.short	13
	.short	13
	.short	6
	.short	13
	.short	0
	.short	0
	.short	0
	.short	13
	.short	13
	.short	13
	.short	6
	.short	13
	.short	0
	.short	0
	.short	13
	.short	13
	.short	13
	.short	13
	.short	6
	.short	13
	.short	0
	.short	0
	.short	13
	.short	13
	.short	13
	.short	13
	.short	6
	.short	13
	.short	0
	.short	6
	.short	13
	.short	13
	.short	13
	.short	0
	.short	0
	.short	13
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	6
	.short	13
	.short	0
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	13
	.short	13
	.short	13
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	13
	.short	13
	.short	13
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	13
	.short	13
	.short	13
	.short	13
	.short	0
	.short	0
	.short	13
	.short	6
	.short	13
	.short	13
	.short	13
	.short	13
	.short	0
	.short	0
	.short	13
	.short	0
	.short	0
	.short	13
	.short	13
	.short	13
	.short	6
	.short	0
	.short	0
	.short	6
	.short	13
	.short	13
	.short	0
	.short	0
	.short	0
	.short	13
	.short	0
	.short	6
	.short	6
	.short	13
	.short	0
	.short	0
	.short	0
	.short	13
	.short	0
	.short	6
	.short	6
	.short	13
	.short	0
	.short	0
	.short	0
	.short	6
	.short	0
	.short	6
	.short	6
	.short	13
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	13
	.short	0
	.short	0
	.short	13
	.short	13
	.short	13
	.short	6
	.short	0
	.short	6
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	6
	.short	0
	.short	6
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	6
	.short	0
	.short	6
	.short	0
	.short	0
	.short	0
	.short	13
	.short	6
	.short	6
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	1
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	6
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
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
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
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
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	1
	.short	6
	.short	6
	.short	6
	.short	6
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	3
	.short	1
	.short	7
	.short	7
	.short	7
	.short	3
	.short	0
	.short	4
	.short	1
	.short	3
	.short	7
	.short	7
	.short	7
	.short	3
	.short	0
	.short	4
	.short	1
	.short	3
	.short	7
	.short	7
	.short	4
	.short	1
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	3
	.short	0
	.short	0
	.short	3
	.short	1
	.short	1
	.short	7
	.short	4
	.short	1
	.short	3
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	4
	.short	1
	.short	3
	.short	0
	.short	0
	.short	4
	.short	4
	.short	1
	.short	3
	.short	7
	.short	4
	.short	1
	.short	1
	.short	1
	.short	4
	.short	1
	.short	3
	.short	7
	.short	4
	.short	1
	.short	1
	.short	1
	.short	1
	.short	4
	.short	3
	.short	7
	.short	4
	.short	1
	.short	0
	.short	4
	.short	4
	.short	4
	.short	0
	.short	0
	.short	4
	.short	4
	.short	0
	.short	0
	.short	0
	.short	8
	.short	0
	.short	0
	.short	0
	.short	8
	.short	0
	.short	0
	.short	8
	.short	8
	.short	0
	.short	0
	.short	0
	.short	8
	.short	0
	.short	8
	.short	8
	.short	8
	.short	8
	.short	0
	.short	8
	.short	8
	.short	0
	.short	8
	.short	8
	.short	8
	.short	8
	.short	0
	.short	8
	.short	8
	.short	1
	.short	3
	.short	1
	.short	4
	.short	1
	.short	4
	.short	3
	.short	0
	.short	1
	.short	3
	.short	1
	.short	4
	.short	1
	.short	4
	.short	1
	.short	3
	.short	1
	.short	3
	.short	1
	.short	4
	.short	4
	.short	1
	.short	1
	.short	3
	.short	4
	.short	4
	.short	0
	.short	0
	.short	4
	.short	4
	.short	4
	.short	0
	.short	8
	.short	0
	.short	0
	.short	0
	.short	8
	.short	0
	.short	0
	.short	0
	.short	8
	.short	0
	.short	0
	.short	0
	.short	8
	.short	8
	.short	0
	.short	0
	.short	8
	.short	8
	.short	0
	.short	8
	.short	8
	.short	8
	.short	8
	.short	0
	.short	8
	.short	8
	.short	0
	.short	8
	.short	8
	.short	8
	.short	8
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	6
	.short	1
	.short	3
	.short	1
	.short	1
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	1
	.short	7
	.short	0
	.short	0
	.short	6
	.short	1
	.short	3
	.short	1
	.short	1
	.short	6
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	6
	.short	6
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	7
	.short	6
	.short	6
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	7
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	6
	.short	6
	.short	6
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
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	6
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
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
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	6
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
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
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	3
	.short	1
	.short	3
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	3
	.short	1
	.short	3
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	1
	.short	1
	.short	1
	.short	6
	.short	1
	.short	1
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	3
	.short	1
	.short	3
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	3
	.short	1
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
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
	.short	3
	.short	1
	.short	0
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
	.short	0
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
	.short	3
	.short	1
	.short	3
	.short	1
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
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
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	1
	.short	3
	.short	1
	.short	0
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
	.short	3
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	1
	.short	3
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	1
	.short	3
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	1
	.short	3
	.short	0
	.short	0
	.short	7
	.short	7
	.short	0
	.short	7
	.short	1
	.short	3
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	3
	.short	3
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
	.short	1
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
	.short	0
	.short	1
	.short	1
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
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
	.short	0
	.short	1
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	3
	.short	1
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	7
	.short	7
	.short	7
	.short	7
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	3
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	1
	.short	3
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
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
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
	.short	3
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
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	4
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
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	4
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	3
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
	.short	4
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
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
	.short	3
	.short	3
	.short	9
	.short	9
	.short	3
	.short	0
	.short	4
	.short	0
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	4
	.short	4
	.short	4
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	10
	.short	4
	.short	4
	.short	10
	.short	10
	.short	3
	.short	3
	.short	10
	.short	10
	.short	4
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	4
	.short	10
	.short	4
	.short	4
	.short	10
	.short	3
	.short	3
	.short	3
	.short	4
	.short	10
	.short	9
	.short	9
	.short	9
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	9
	.short	9
	.short	9
	.short	0
	.short	0
	.short	0
	.short	9
	.short	3
	.short	3
	.short	9
	.short	9
	.short	9
	.short	0
	.short	0
	.short	10
	.short	9
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	10
	.short	10
	.short	9
	.short	3
	.short	3
	.short	9
	.short	0
	.short	0
	.short	4
	.short	10
	.short	10
	.short	9
	.short	3
	.short	9
	.short	9
	.short	0
	.short	3
	.short	4
	.short	10
	.short	9
	.short	9
	.short	3
	.short	9
	.short	0
	.short	10
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	9
	.short	0
	.short	10
	.short	10
	.short	3
	.short	10
	.short	3
	.short	3
	.short	3
	.short	4
	.short	4
	.short	10
	.short	3
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	4
	.short	4
	.short	10
	.short	3
	.short	10
	.short	3
	.short	3
	.short	3
	.short	0
	.short	4
	.short	10
	.short	10
	.short	3
	.short	3
	.short	10
	.short	3
	.short	0
	.short	4
	.short	10
	.short	10
	.short	10
	.short	10
	.short	3
	.short	10
	.short	0
	.short	0
	.short	4
	.short	4
	.short	4
	.short	10
	.short	10
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	4
	.short	4
	.short	10
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	4
	.short	4
	.short	10
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	9
	.short	9
	.short	4
	.short	4
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	10
	.short	3
	.short	3
	.short	9
	.short	0
	.short	3
	.short	3
	.short	10
	.short	3
	.short	3
	.short	9
	.short	3
	.short	0
	.short	10
	.short	3
	.short	3
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	3
	.short	4
	.short	3
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	4
	.short	4
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
	.short	14
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
	.short	0
	.short	14
	.short	15
	.short	15
	.short	0
	.short	0
	.short	0
	.short	14
	.short	0
	.short	0
	.short	0
	.short	16
	.short	16
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	16
	.short	0
	.short	0
	.short	9
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	10
	.short	3
	.short	9
	.short	0
	.short	14
	.short	15
	.short	16
	.short	0
	.short	10
	.short	3
	.short	3
	.short	0
	.short	14
	.short	15
	.short	16
	.short	16
	.short	1
	.short	1
	.short	1
	.short	14
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	15
	.short	15
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	17
	.short	17
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	17
	.short	17
	.short	0
	.short	0
	.short	0
	.short	16
	.short	15
	.short	15
	.short	1
	.short	0
	.short	0
	.short	17
	.short	16
	.short	16
	.short	15
	.short	14
	.short	1
	.short	10
	.short	3
	.short	9
	.short	17
	.short	0
	.short	14
	.short	14
	.short	1
	.short	10
	.short	3
	.short	3
	.short	0
	.short	0
	.short	0
	.short	0
	.short	1
	.short	0
	.short	10
	.short	10
	.short	0
	.short	0
	.short	3
	.short	0
	.short	0
	.short	0
	.short	15
	.short	0
	.short	1
	.short	1
	.short	9
	.short	1
	.short	0
	.short	0
	.short	17
	.short	17
	.short	17
	.short	10
	.short	1
	.short	1
	.short	0
	.short	0
	.short	17
	.short	0
	.short	10
	.short	0
	.short	1
	.short	0
	.short	0
	.short	17
	.short	17
	.short	0
	.short	17
	.short	0
	.short	1
	.short	3
	.short	14
	.short	15
	.short	17
	.short	17
	.short	17
	.short	0
	.short	0
	.short	0
	.short	15
	.short	15
	.short	16
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	14
	.short	15
	.short	14
	.short	0
	.short	0
	.short	0
	.short	10
	.short	0
	.short	0
	.short	14
	.short	0
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
	.short	10
	.short	10
	.short	0
	.short	3
	.short	3
	.short	1
	.short	10
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	0
	.short	1
	.short	1
	.short	0
	.short	0
	.short	0
	.short	0
	.short	3
	.short	3
	.short	17
	.short	17
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	17
	.short	0
	.short	17
	.short	17
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	16
	.short	16
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	16
	.short	15
	.short	14
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	0
	.short	14
	.short	14
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
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
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
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
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
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
	.short	6
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
	.type	palette, %object
	.size	palette, 72
palette:
	.word	0
	.word	3171
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
	.word	96
	.word	2146
	.word	2146
	.section	.rodata.str1.4,"aMS",%progbits,1
	.align	2
.LC0:
	.ascii	"GBA SNAKE\000"
	.space	2
.LC1:
	.ascii	"A WINNER IS YOU\000"
.LC2:
	.ascii	"Press Start To Retry \000"
	.space	2
.LC3:
	.ascii	"You Lost\000"
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
	.type	AppState, %object
	.size	AppState, 1
AppState:
	.space	1
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.3.1 20160307 (release) [ARM/embedded-5-branch revision 234589]"
