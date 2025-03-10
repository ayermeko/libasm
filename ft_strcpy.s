section .text
    global ft_strcpy

ft_strcpy:
    mov rax, rdi    ; Save the destination pointer (return value)

.loop:
    mov dl, [rsi]   ; Load byte from source into DL
    mov [rdi], dl   ; Store byte into destination
    inc rsi         ; Move to the next source byte
    inc rdi         ; Move to the next destination byte
    test dl, dl     ; Check if null terminator (DL == 0)
    jnz .loop       ; Continue the loop
    ret             ; Return destination pointer in RAX
