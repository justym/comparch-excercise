

	.data
A:	.word 216 
B:	.word 34
SAB:	.word 0
C:	.word 153
ACAB:	.word 0
FF:	.word 2020
S:	.word 0
	
	.text
main:	lw $t0,A 	 #t0にAの値を格納
  lw     $t1,B	 	 #t1にBの値を格納
  sub    $t2,$t0,$t1 #t2にA-Bの結果を格納
  sw     $t2,SAB	 #SABのアドレスにA-Bの結果を格納
  lw     $t3,C       #t3にCの値を格納
  add    $t4,$t2,$t3 #t4にA-B+Cの結果を格納
  sw     $t4,ACAB    #ACABのアドレスにA-B+Cの結果を格納
  lw     $t5,FF		 #t5に2020を格納
  or     $t6,$t4,$t5 #t6にA-B+C と 2020 との論理和の結果を格納
  sw     $t6,S       #SのアドレスにA-B+C と 2020 との論理和の結果を転送
exit:	j exit 

#使用しているレジスタ #データまたはアドレス #用途
t0 データ Aのデータを格納
t1 データ Bのデータを格納
t2 データ A-Bのデータを格納
t3 データ Cのデータを格納
t4 データ A-B+Cのデータを格納
t5 データ FFのデータを格納
t6 データ Sに転送するデータを格納
