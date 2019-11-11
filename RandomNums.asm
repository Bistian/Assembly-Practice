.text
#get first random number
    li $a1, 50
    li $v0, 42 
    syscall
    
    #move first to different register
    move $t0, $a0
    
    #get second random number
     li $a1, 50
    li $v0, 42 
    syscall
    #add two together
    add $a0, $t0, $a0
    
    #add 50 to account for second range
    add $a0, $a0, $a1

    li $v0, 1  
    syscall
    
       li $v0, 10
      syscall

    
    
