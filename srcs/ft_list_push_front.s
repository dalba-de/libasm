section .text
    global ft_list_push_front
    extern malloc

ft_list_push_front:
    mov rax, 0
    push rdi
    push rsi
    mov rdi, 16
    call malloc
    pop rsi
    pop rdi
    cmp rax, 0
    je error
    mov [rax], rsi
    mov rcx, [rdi]
    mov [rax + 8], rcx
    mov [rdi], rax
    ret

error:
    ret