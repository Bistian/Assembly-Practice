 .text
    li $t0, 0  #counter
    li  $t1, 0 #first loop count
    li  $t2, 0 #second loop count
    
    top:
    bgt $t1, 2, exit
    li  $t2, 0
    add $t1, $t1, 1
    add $t0, $t0, 1
    
    bottom:
    bgt $t2, 1, top
    add $t0, $t0, 2
    add $t2, $t2, 1
    blt $t2, 3, bottom
    
    exit:
     move $a0, $t0
     li $v0, 1
       syscall
       
          li $v0, 10
      syscall
