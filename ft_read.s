extern __errno_location             ; Declare external function to get errno address

section .text
    global ft_read
        
ft_read:                            ; ft_read(rdi, rsi, rdx)
    test rsi, rsi
    jz .null_case
    xor rax, rax                    ; syscall number for read (0)
    syscall                         ; invoke the system call
    test rax, rax                   ; check if the return value is negative (error)
    js .error                       ; if rax < 0, jump to .error
    ret                             ; return the number of bytes read (success)
        
.error:     
    neg rax                         ; convert negative error code to positive
    mov rdi, rax                    ; save the error code in rdi
    call __errno_location wrt ..plt ; get the address of errno
    mov [rax], rdi                  ; set errno to the error code
    mov rax, -1
    ret

.null_case:
    xor rax, rax                    ; return -1 to indicate an error
    ret                             ; return
