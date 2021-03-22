        #0000 0000 0000 0000 0000 0000 1001 0110 (input) -> 150
        #0000 0000 0000 0000 0000 0000 0110 1001 (expected output)

    .data
    .text
    .globl main

main:
    #addi $s0, $s0, 150  #load $t0 with a number
    #addi $s1, $s1, 0    #load $t1 with a number

    addi $t1, $t1, 1    #i = 1              INSTRUCTION 1

    Loop:
    andi $t3, $s0, 0x0001 #check if number is 1 or 0 INSTRUCTION 2

    sll $s1, $s1, 1     #shift 1 bit left   #INSTRUCTION 3
    add $s1, $s1, $t3   #add the first bit into $s1 #INSTRUCTION 4

    srl $s0, $s0, 1     #shift 1 bit right  #INSTRUCTION 5

    addi $t1, $t1, 1    #i++                #INSTRUCTION 6
    bne $t1, 9, Loop  #if not equal go to loop  #INSTRUCTION 7-8                                      
end:
done:
    li $v0, 10  #return 0;
    syscall



