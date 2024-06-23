.global _boot
.text

_boot:
	addi x10, x0, 60
	addi x11, x0, -13
	addi x12, x0, 10
	addi x13, x0, 1
	addi x14, x0, 2
	addi x15, x0, 8
	add x0, x10, x11
	sub x0, x10, x11
	sll x0, x10, x14
	slt x0, x10, x11
	slt x0, x11, x10	
	sltu x0, x10, x11
	sltu x0, x11, x10
	xor x0, x10, x11
	srl x0, x11, x14
	sra x0, x11, x14
	or x0, x10, x11
	and x0, x10, x11
	slti x0, x11, -6
	slti x0, x11, -13	
	sltiu x0, x11, -6
	sltiu x0, x11, -13
	xori x0, x10, 42
	ori x0, x11, 34
	andi x0, x11, 34
	slli x0, x11, 2
	srli x0, x11, 2
	srai x0, x11, 2	
	srli x0, x10, 2
	srai x0, x10, 2
	mul x0, x10, x11
	mulh x0, x10, x11
	mulhsu x0, x10, x11
	mulhu x0, x10, x11
	div x0, x10, x11
	div x0, x10, x0
	divu x0, x10, x11
	divu x0, x10, 0
	rem x0, x10, x11
	rem x0, x10, x0
	remu x0, x10, x11
	remu x0, x10, x11
	
	fin:
		beq x0, x0, fin 