section .text
    global ft_strcmp

ft_strcmp:
    test rdi, rdi       ; Check if rdi (s1) is NULL
    jz .null_case       ; If s1 is NULL, check if s2 is also NULL
    test rsi, rsi       ; Check if rsi (s2) is NULL
    jz .null_case       ; If s2 is NULL, but s1 is not, they are different

.loop:
    mov al, [rdi]       ; Load byte from s1 into AL
    mov bl, [rsi]       ; Load byte from s2 into BL
    inc rdi             ; Move to the next character in s1
    inc rsi             ; Move to the next character in s2
    cmp al, bl          ; Compare the two characters
    jne .diff           ; If they are not equal, jump to .diff
    test al, al         ; Check if AL is the null terminator
    jz .null_case       ; If AL is 0, jump to .null_case
    jmp .loop           ; Otherwise, continue the loop

.diff:
    sub al, bl          ; Calculate the difference (AL - BL)
    movsx eax, al       ; Sign-extend AL to 32 bits and store in EAX (lower 32 bits of RAX)
    ret                 ; Return the difference

.null_case:
    xor eax, eax        ; Set RAX to 0 (strings are equal)
    ret                 ; Return 0