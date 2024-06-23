.global _boot
.text

_boot:
	addi x10, x0, 10
	jal x1, subrutina	
	addi x10, x0, 234
	fin:
        	beq x0, x0, fin

subrutina:
	addi x2, x0, 100
	addi x2, x0, -456
	addi x2, x0, 231
    	jalr x0, x1, 0