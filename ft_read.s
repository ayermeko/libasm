extern __errno_location             ; Declare external function to get errno address

section .text
    global ft_read

ft_read:                            ; ft_read(fd, buf, count)
    mov rax, 0                      ; syscall number for read (0)
    syscall                         ; invoke the system call
    cmp rax, 0                      ; check if the return value is negative
    jl .error                       ; if rax < 0, jump to error handling
    ret                             ; return number of bytes read (success)

.error:     
    neg rax                         ; Convert negative error code to positive
    mov rdi, rax                    ; Move positive error code into rdi
    call __errno_location wrt ..plt ; Get address of errno, use plt to fetch the libc
    mov [rax], rdi                  ; Store positive error code in errno
    mov rax, -1                     ; Return -1 (standard for syscalls on failure)
    ret
