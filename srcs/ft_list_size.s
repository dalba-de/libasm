section .text
    global ft_list_size

ft_list_size:
    mov rcx, 0
    while:
        cmp rdi, 0
        je fin
        inc rcx
        mov rdi, [rdi + 8]
        jmp while

fin:
    mov rax, rcx
    ret
