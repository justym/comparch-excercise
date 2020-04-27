        .data
A:      .word 58     
        .word 41     
        .word 22
        .word 20
        .word 19
        .word 45
        .word 54
        .word 87    
ADDRESS_A:  .word 20480   
N:      .word 8   
S:      .word 0
ONE:    .word 1
FOUR:   .word 4

        .text   
main:  or     $t0, $0, $0
       lw     $t1, ADDRESS_A
       lw     $t2, FOUR   
       lw     $t3, N      
       lw     $t4, ONE    
       or     $t5, $0, $0 

loop:  beq    $t0, $t3, loopend
	lw    $t6, 0($t1)
       add    $t5, $t5, $t6
       add    $t1, $t1, $t2
       add    $t0, $t0, $t4

       j      loop

loopend: sw $t5, S

exit: j exit
        


    


