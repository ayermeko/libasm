section .text
    global ft_strcmp

ft_strcmp:
    test rdi, rdi       ; Check if s1 is NULL
    jz .s1_null         ; If s1 is NULL, handle the special case
    test rsi, rsi       ; Check if s2 is NULL
    jz .s2_null         ; If s2 is NULL, handle the special case

.loop:
    mov al, [rdi]       ; Load byte from s1 into AL
    mov bl, [rsi]       ; Load byte from s2 into BL
    inc rdi             ; Move to the next character in s1
    inc rsi             ; Move to the next character in s2
    cmp al, bl          ; Compare the two characters
    jne .diff           ; If they are not equal, jump to .diff
    test al, al         ; Check if AL is the null terminator
    jnz .loop           ; If AL is not 0, continue the loop

    ; If we reach here, both strings are equal
    xor eax, eax        ; Set RAX to 0 (strings are equal)
    ret

.diff:
    sub al, bl          ; Calculate the difference (AL - BL)
    movsx eax, al       ; Sign-extend AL to 32 bits and store in EAX (lower 32 bits of RAX)
    ret

.s1_null:
    test rsi, rsi       ; Check if s2 is also NULL
    jz .equal           ; If both are NULL, they are equal
    mov eax, -1         ; If s1 is NULL and s2 is not, s1 is less than s2
    ret

.s2_null:
    mov eax, 1          ; If s2 is NULL and s1 is not, s1 is greater than s2
    ret

.equal:
    xor eax, eax        ; Set RAX to 0 (strings are equal)
    ret