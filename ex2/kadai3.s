	.data
A:	.word 12
	.word 34
	.word 56
	.word 78
	.word 90
	.word 20
	.word 20
ADDRESS_A:	.word 20480
N:	.word 7
B:	.space 28
ONE:	.word 1
FOUR:	.word 4
ADDRESS_B: 	.word 20516

	.text
main:	or $t0, $0, $0

	lw $t1, ONE
	lw $t2,	ADDRESS_A
	lw $t3, ADDRESS_B
	lw $t4, FOUR
	lw $t5, N

loop:	beq $t0, $t5, exit
	lw $t6, 0($t2)
	sw $t6, 0($t3)
	add $t2, $t2, $t4
	add $t3, $t3, $t4
	add $t0, $t0, $t1
	j loop

exit:	j exit 

	
