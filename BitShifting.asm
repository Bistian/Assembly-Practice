.text
	li $t0, 8
	li $t1, 40
	li $v0, 1
	
	sll $a0, $t0, 4
    	 syscall
	
	srl $a0, $t1, 3
   	 syscall
   	 
      li $v0, 10
      syscall
