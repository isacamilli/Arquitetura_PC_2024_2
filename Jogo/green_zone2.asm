.text

main:
	lui $8 0x1001
	ori $9 $0 0x1D009F #azul ceu
	ori $10 $0 0x0082E0 #azul mar
	ori $11 $0 0x250000 #marrom escuro
	ori $12 $0 0x6A1B00 #marrom claro
	
	#addi $25 $0 8192 #mÃ¡ximo da tela
	
	addi $25 $0 3328
	
ceu:
	beq $25 $0 mar_prep
	
	sw $9 0($8)
	
	addi $8 $8 4
	addi $25 $25 -1
	j ceu



mar_prep:
	addi $25 $0 2304
	
mar:
	beq $25 $0 solo_prep
	
	sw $10 0($8)
	
	addi $8 $8 4
	addi $25 $25 -1
	j mar


solo_prep: addi $25 $25 10
           addi $8 $8 -512

solo_laco1:beq $25 $0 fim
           addi $24 $0 64
           
           addi $8 $8 512
           addi $25 $25 -1

solo_laco2: beq $24 $0 solo_laco1
           
           jal solo
           
           addi $24 $24 -1
           addi $8 $8 8
           j solo_laco2


fim: addi $2 $0 10
     syscall



#----------------------func-----------------------

#função solo para prencher o solo de jeito alternado

solo: lw $23 -4($8)
      bne $23 $11 marr_esc
      
marr_claro: sw $12 0($8)
            sw $12 4($8)
            sw $12 512($8)
            sw $12 516($8)
            j fim_func_solo
                   
marr_esc: sw $11 0($8)
          sw $11 4($8)
          sw $11 512($8)
          sw $11 516($8)
          j fim_func_solo

fim_func_solo: jr $31









