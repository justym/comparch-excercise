
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
main:  or     $t0, $0, $0    #初期化
       lw     $t1, ADDRESS_A #t1に配列Aの先頭アドレスを格納
       lw     $t2, FOUR      #t2に4を格納
       lw     $t3, N         #t3に8を格納
       lw     $t4, ONE       #t4に１を格納
       or     $t5, $0, $0    #t5を初期化

loop:  beq    $t0, $t3, loopend 
       lw     $t6, 0($t1)       #配列Aの各要素を格納
       add    $t5, $t5, $t6     #要素の演算結果をt5に格納
       add    $t1, $t1, $t2     #配列Aのアドレスをインクリメント
       add    $t0, $t0, $t4     #ループをインクリメント

       j      loop

loopend: sw $t5, S              #演算結果をSに格納

exit: j exit
        
#使用しているレジスタ #データまたはアドレス #用途
#t0 データ インクリメント用のデータを格納
#t1 アドレス 配列Aの先頭アドレスを格納
#t2 データ 4を格納(アドレスのインクリメントに使用)
#t3 データ 8を格納(ループの上限に使用)
#t4 データ 1を格納(ループのインクリメントに使用)
#t5 データ 演算結果を格納
#t6 アドレス 演算用の配列Aのアドレスを格納

    


