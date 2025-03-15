extern __errno_location             ; Declare external function to get errno address

section .text
    global ft_read
        
ft_read:                            ; ft_read(rdi, rsi, rdx)
    test rsi, 0
    jz .done
    mov rax, 0                      ; syscall number for read (0)
    syscall                         ; invoke the system call
    test rax, rax                   ; check if the return value is negative (error)
    js .error                       ; if rax < 0, jump to .error
    ret                             ; return the number of bytes read (success)
        
.error:     
    neg rax                         ; convert negative error code to positive
    mov rdx, rax                    ; save the error code in rdi
    call __errno_location wrt ..plt ; get the address of errno
    mov [rax], rdx                  ; set errno to the error code

.done:
    mov rax, -1                     ; return -1 to indicate an error
    ret                             ; return