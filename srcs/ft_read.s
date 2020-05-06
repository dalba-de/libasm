section .text
    global ft_read
    extern __errno_location

ft_read:
    mov rax, 0
    syscall
    cmp rax, 0
    jnge error
    ret

error:
    mov rdx, rax
    neg rdx
    call __errno_location
    mov [rax], rdx
    mov rax, -1
    ret