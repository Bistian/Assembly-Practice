.data 
fizz: .asciiz "Fizz"
buzz: .asciiz "Buzz"

.text 
main:
	li $t0, 0
	la $t1, fizz
	la $t2, buzz 
	li $t3, 3
	li $t5, 5
	li $t7, 100
	
startloop:
	addi $t0, $t0, 1 	
	div $t0, $t3 		
	mfhi $t8	
	beqz $t8, DivBy5		
	div $t0, $t5		
	mfhi $t8
	beqz $t8, printBuzz		 	
	resumeloop:
														
		beq $t0, $t7, endloop
		j startloop	
	
	DivBy5:
	div $t0, $t5
	mfhi $t8
	beqz $t8 printFizzBuzz	
	j printFizz
	
	printFizz:
	la $a0, fizz	
	li $v0, 4 
	syscall
	j resumeloop
		
	printBuzz:
	la $a0, buzz	
	li $v0, 4 
	syscall
	j resumeloop
	
	printFizzBuzz:
	la $a0, fizz	
	li $v0, 4
	syscall
	la $a0, buzz 
	syscall
	j resumeloop
		
	
endloop:
      li $v0, 10
      syscall
	
