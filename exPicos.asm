.text

main: addi $23 $0 0 # numeros de picos

      addi $2 $0 5  # quant laço
      syscall
      add $16 $0 $2
      
      addi $2 $0 5  # primeiro valor
      syscall
      add $17 $0 $2
      
      addi $2 $0 5  # segundo valor
      syscall
      add $18 $0 $2
      
      add $4 $0 $17
      add $5 $0 $18
      
      addi $19 $16 -2 
     
teste: beq $19 $0 fimLaco
       addi $2 $0 5
       syscall
       add $6 $0 $2
       jal pico
       add $23 $23 $2
       add $4 $0 $5
       add $5 $0 $6
       addi $19 $19 -1
       j teste
      
fimLaco: add $6 $0 $17
         jal pico
         add $23 $23 $2
         add $4 $0 $5
         add $5 $0 $6
         add $6 $0 $18
         jal pico
         add $23 $23 $2
         add $4 $0 $23
         addi $2 $0 1
         syscall
         
         addi $2 $0 10
         syscall
     
#=============================
# funcao pico
# entrada: $4 $5 $6
# saida: $2
# Reg usados: $8 $9 $10 $11
# Rotulos usados:

pico: slt $8 $4 $5 # $8 = $4 < $5 ? 1 || 0
      slt $9 $6 $5 # $8 = $6 < $5 ? 1 || 0
      and $10 $8 $9
      slt $8 $5 $4
      slt $9 $5 $6
      and $11 $8 $9
      or $2 $10 $11
      jr $31