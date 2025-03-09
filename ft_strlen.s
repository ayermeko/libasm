section .text
    global ft_strlen

ft_strlen:
    test rdi, rdi
    jz .null_case
    xor rax, rax

.loop_count:
    cmp byte [rdi], 0 ; works as a strcmp() then set zero flag if the result is 0
    jz .done
    inc rdi
    inc rax
    jmp .loop_count


.null_case:
    xor rax, rax

.done:
    ret
