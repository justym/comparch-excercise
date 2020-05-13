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
main:  or     $t0, $0, $0

       lw     $t1, ONE 		  #t1に1を格納
       lw     $t2, ADDRESS_A  #t2に配列Aの先頭アドレスを格納
       lw     $t3, ADDRESS_B  #t3に配列Bの先頭アドレスを格納
       lw     $t4, FOUR       #t4に4を格納
       lw     $t5, N		  #t5にNを格納

loop:  beq    $t0, $t5, exit 
       lw     $t6, 0($t2)     #t6に配列Aの各要素を格納
       sw     $t6, 0($t3)     #t6の値を配列Bの各要素に格納
       add    $t2, $t2, $t4	  #配列Aのアドレスを4つ進める
       add    $t3, $t3, $t4   #配列Bのアドレスを4つ進める
       add    $t0, $t0, $t1   #インクリメント
       j      loop

exit:	j exit 

#使用しているレジスタ #データまたはアドレス #用途
#t0 データ インクリメント用のデータを格納
#t1 データ 1を格納(ループのインクリメントに使用)
#t2 アドレス 配列Aの先頭アドレスを格納
#t3 アドレス 配列Bの先頭アドレスを格納
#t4 データ 4を格納(アドレスのインクリメントに使用)
#t5 データ ７を格納(ループの上限に使用)
#t6 アドレス 配列Aの各要素を配列Bにコピーするために格納
