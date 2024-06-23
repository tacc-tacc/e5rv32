.global _boot
.text

_boot:                    /* x0  = 0    0x000 */
	addi x1, x0, 5
    addi x2, x0, -3
    lui x3, 0x7FFFF
    lui x4, 0xFFFFF
    bge x2, x1, fin
    blt x3, x4, fin
    bgeu x3, x4, fin
    bne x4, x4, fin
    bge x3, x4, fin
    addi x3, x0, 10
    fin:
    	beq x0, x0, fin