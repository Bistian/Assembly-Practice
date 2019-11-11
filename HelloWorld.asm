.data
label:
.asciiz "hello world"
.text

main:
la $a0, label
addi $v0, $0, 4 
syscall

   li $v0, 10
      syscall
