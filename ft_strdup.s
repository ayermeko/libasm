extern __errno_location
extern malloc
extern ft_strlen
extern ft_strcpy

section .text
    global ft_strdup

ft_strdup:
    push rdi                ; Save the original string pointer
    call ft_strlen
    mov rdi, rax            ; Move the length into rdi
    inc rdi                 ; For the \0 terminator

    call malloc
    test rax, rax           ; Check if malloc returns NULL
    jz .malloc_failed       ; if malloc failed, handle the error

    pop rsi                 ; Pop the original string pointer into rsi
    mov rdi, rax            ; Move the allocated memory pointer into rdi
    call ft_strcpy
    ret

.malloc_failed:
    pop rdi
    call __errno_location
    mov dword [rax], 12     ; Set errno to ENOMEM (12)
    xor rax, rax
    ret