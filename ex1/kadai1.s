	.data
A:	.word 216
B:	.word 34
SAB:	.word 0
C:	.word 153
ACAB:	.word 0
FF:	.word 2020
S:	.word 0
	
	.text
main:	lw $t0,A
	lw $t1,B	 
	sub $t2,$t0,$t1
	sw $t2,SAB
	lw $t3,C
	add $t4,$t2,$t3
	sw $t4,ACAB
	lw $t5,FF
	or $t6,$t4,$t5
	sw $t6,S
exit:	j exit
