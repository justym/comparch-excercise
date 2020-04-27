	.data
A:	.word 123
	.word 234
	.word 345
	.word 456
ADDRES_A:	.word 20480
S:	.word 0

	.text
main:  or     $t0,$0,$0
       lw     $t1,ADDRES_A

       lw     $t2,0($t1)
       add    $t0,$t0,$t2

       lw     $t2,4($t1)
       add    $t0, $t0, $t2

       lw     $t2,8($t1)
       add    $t0, $t0, $t2

       lw     $t2,12($t1)
       add    $t0, $t0, $t2

       sw     $t0, S
exit: j exit
	
