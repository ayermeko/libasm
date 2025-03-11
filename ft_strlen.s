section .text
    global ft_strlen

ft_strlen:
    xor   rax, rax          ; Clear RAX (length counter)
    test  rdi, rdi          ; Check if the input pointer is NULL
    jz    .done             ; If NULL, return 0

.loop:
    cmp   byte [rdi + rax], 0 ; Compare the current byte with 0
    je    .done              ; If null terminator is found, exit
    inc   rax               ; Increment the length counter
    jmp   .loop             ; Continue the loop

.done:
    ret                     ; Return the length in RAX