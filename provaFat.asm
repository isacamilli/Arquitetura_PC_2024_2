.text

main: addi $2 $0 5
      syscall
      add $4 $2 $0
      jal fat
      add $4 $2 $0
      addi $2 $0 1
      syscall
      
      addi $2 $0 10
      syscall
      
#==========================
#Funcao fat
# entrada: $4 
# saida: $2
# reg nao preservados
# rotulos usados: fat
fat: sw $31 0($29)
     addi $29 $29 -4
     
     jal oper
     
     addi $29 $29 4
     lw $31 0($29)
     jr $31
#==================
# funcao oper
# entrada: $4
# saida: $2
# reg sujos:
# rotulos usados: oper, lacoFat, fimFunc

oper: addi $23 $0 1
      add $22 $4 $0
      
lacoFat: beq $23 $22 fimFunc
         mul $4 $23 $4
         addi $23 $23 1
         j lacoFat
         
         
fimFunc: add $2 $0 $4
         jr $31         
         