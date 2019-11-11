.data
TakeInput1: .asciiz "Enter Number Right Of Decimal "
TakeInput2: .asciiz "Enter Number Left Decimal "
space: .asciiz "\n"
.text
##counters and powers
 li  $t3, 0 
 li  $a2, 2 
 li  $a3, 10
  li  $t6, 2

##input for right side
li $v0, 4
la $a0, TakeInput1
syscall

li $v0, 5
syscall
move $t1, $v0
##t1 is the right of the decimal

##input for left side
li $v0, 4
la $a0, TakeInput2
syscall
li $t8, 2

li $v0, 5
syscall
move $t2, $v0
##t2 is the whole number

add $t5, $t5, $t1

   sll $t9, $t2, 16
   or  $t5, $t9, $t5
 

##loop for finding n power
li  $t4, 1 
	loop:
		beq $t4, 0, loopEnd
		div $t1, $t8
		mflo $t1
		mfhi $t4 
		add $t3, $t3, 1

	j loop

loopEnd:
#reset counter
li $t7, 0
		#loop for 2 ^ 16
	loop2:
		beq $t7, 15, loopEnd2
		mult $t6, $a2
		mflo $t6
		add $t7, $t7, 1
	j loop2
loopEnd2:

mult $t5, $t6
mflo $t5
li $t7, 1
li $t6, 10

#loop for variable to divide by
	loop3:
		beq $t7, $t3, loopEnd3
		mult $t6, $a3
		mflo $t6
		add $t7, $t7, 1
	j loop3
loopEnd3:

div $t5, $t6
 mflo $t1
li $v0, 1
add $t5, $t5, $t1

#print decimal value
 move $a0, $t1
syscall
addi $v0, $zero, 4  
la $a0, space      
syscall
  ##t5 = right of decimal
  ##t3 = n
  ##t6 = power1
  
  #setting counters
li $t7, 0
li $t6, 32

#t5 is decimal value
#t6 is amount to shift
   li $t1, 0
   srl $t5, $t5, 1
   #loop for printing binary
  	loop4:
  		# Break if the incr register(t6) == 0
		beq $t7, $t6, loopEnd4
		# Shift t5 left by t6, store in t1
		srlv $t1, $t5, $t6
		# and with 1 and print
		andi $a0, $t1, 1
		li $v0, 1
		syscall
		subi $t6, $t6, 1
	j loop4
	
	
	
loopEnd4:
