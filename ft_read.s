section .text
    global ft_read
    extern __errno_location         ; Declare external function to get errno address
        
ft_read:                            ; ft_read(rdi, rsi, rdx)
    mov rax, 0                      ; syscall number for read (0)
    syscall                         ; invoke the system call
    cmp rax, 0                      ; check if the return value is negative (error)
    jl .error                       ; if rax < 0, jump to .error
    ret                             ; return the number of bytes read (success)
        
.error:     
    neg rax                         ; convert negative error code to positive
    mov rdi, rax                    ; save the error code in rdi
    call __errno_location           ; get the address of errno
    mov [rax], rdi                  ; set errno to the error code
    mov rax, -1                     ; return -1 to indicate an error
    ret                             ; return