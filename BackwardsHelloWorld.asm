.data
label:
.asciiz "hello world\n"
.text

main:
    li $t1, 11
    la $t0, label
  loop:
  add $t1, $t1, -1
  lb $a0, label($t1)
  li $v0, 11
  syscall

    bgt $t1, 0, loop
    
    
     li $v0, 10
      syscall
