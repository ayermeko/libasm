section .text
    global ft_strcmp

ft_strcmp:
.loop:
    mov al, [rdi]           ; Load byte from s1 into AL
    mov bl, [rsi]           ; Load byte from s2 into BL
    inc rdi                 ; Move to next character in s1
    inc rsi                 ; Move to next character in s2
    cmp al, bl              ; Compare the two characters
    jne .diff               ; If not equal, jump to .diff
    test al, al             ; Check if AL is null terminator
    jnz .loop               ; If AL is not 0, continue looping

    xor eax, eax            ; Both strings are equal, set eax to 0
    ret

.diff:
    sub al, bl              ; Calculate difference (AL - BL)
    movsx eax, al           ; Sign-extend AL to 32 bits and store in EAX
    ret
