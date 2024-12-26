.text

main:
	lui $8 0x1001
	ori $9 $0 0x1D009F #azul ceu
	ori $10 $0 0x0082E0 #azul mar
	ori $11 $0 0x250000 #marrom escuro
	ori $12 $0 0x6A1B00 #marrom claro
	
	#addi $25 $0 8192 #mÃ¡ximo da tela
	
	addi $25 $0 4096
	
ceu:
	beq $25 $0 mar_prep
	
	sw $9 0($8)
	
	addi $8 $8 4
	addi $25 $25 -1
	j ceu



mar_prep:
	addi $25 $0 2816
	
mar:
	beq $25 $0 solo_prep
	
	sw $10 0($8)
	
	addi $8 $8 4
	addi $25 $25 -1
	j mar




solo_prep:
	addi $25 $0 1536
	add $13 $8 $0
	
	addi $9 $9 8	#pular 2 para ficar 2 claros 2 escuros
	addi $24 $0 2 #contador padrÃ£o solo
	
solo:
	beq $25 $0 fim
	
	sw $11 0($8)
	sw $12 0($13)
	
	addi $8 $8 4
	addi $13 $13 4
	addi $24 $24 -1
	jal padrao_solo
	addi $25 $25 -1
	j solo
		
		
		
fim:
	addi $2 $0 10
	syscall
	
#=================================================== funcao =========================================================================
padrao_solo:
	beq $24 $0 pular_padrao_solo
	
	jr $31
	
pular_padrao_solo:
	addi $8 $8 12
	addi $13 $13 12
	addi $24 $0 2
	
	jr $31
