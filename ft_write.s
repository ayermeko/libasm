extern __errno_location             ; tells that the funciton is located elsewhere

section .text
    global ft_write

ft_write:
    test rsi, rsi                   ; Check if buf (rsi) is NULL
    jz .null_buf_error              ; If NULL, handle error

    mov rax, 1                      ; Syscall number for write
    syscall                         ; Perform system call

    cmp rax, 0                      ; Check if syscall failed (negative return value)
    jl .error
    ret

.error:
    neg rax                         ; Convert syscall return (-errno) to positive value
    mov rdi, rax                    ; Store error number in rdi
    call __errno_location wrt ..plt ; Get address of errno, plt dynamically linked, in a runtime
    mov [rax], rdi                  ; Store errno value
    mov rax, -1                     ; Return -1 to indicate failure
    ret

.null_buf_error:
    mov rdi, 14                     ; Set errno to EFAULT (Bad Address)
    call __errno_location wrt ..plt ; Get address of errno
    mov [rax], rdi                  ; Store EFAULT in errno
    mov rax, -1                     ; Return -1 to indicate failure
    ret
