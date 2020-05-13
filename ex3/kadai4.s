#s1260249 森下裕平
#8 A(乗数)
#9 B(被乗数)
#10 論理演算用レジスタ
#11 (i)loop用
#12 N
#14 積
#24 右シフトするための一時的なレジスタ

    .data
A:  .word 1234
B:  .word 8765
C:  .word 0

    .text
main:
  lw      $8, A #load A
  lw      $9, B #load B
  addi    $10, $0, 1 #bit演算用レジスタ
  addi    $11, $0, 0 # i
  addi    $12, $0, 16 # N
  addi    $14, $0, 0 # 積

loop:
  beq     $11, $12, loopend
  and     $24, $8, $10
  beq     $24, $0, inc
  add     $14, $14, $9
  j       cal

cal:
  addi    $11, $11, 1
  add     $10, $10, $10
  add     $9, $9, $9
  j       loop

loopend:
  sw      $14, C #結果代入
    
exit:
  j       exit


