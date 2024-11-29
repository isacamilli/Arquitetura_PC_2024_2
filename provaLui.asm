.data


.text
main: lui $8, 0x1001
      addi $9, $0, 1
for1: beq $9, $0, fimleit    
      addi $2, $0, 5
      syscall
      sw $2, 0($8)
      addi $8, $8, 4
      addi $9, $9, -1
      j for1
fimleit:
      addi $8 $0 0x1001
      addi $9, $0, 10
for2: beq $9, $0, fimescri    
      lw $4, 0($8)
      addi $2, $0, 1
      syscall
      addi $4, $0, ' '
      addi $2, $0, 11
      syscall
     
      addi $8, $8, 4
      addi $9, $9, -1
      j for2

fimescri: addi $2, $0, 10
      syscall