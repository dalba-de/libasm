section .text
    global ft_strcpy

ft_strcpy:
    mov rax, 0
    mov rcx, 0
    push rsi
    cmp rsi, 0
    je fin
    while:
        cmp byte [rsi + rcx], 0
        je fin
        mov bl, byte [rsi + rcx]
        mov byte [rdi + rcx], bl
        inc rcx
        jmp while
fin:
    pop rsi
    mov rax, rdi
    ret