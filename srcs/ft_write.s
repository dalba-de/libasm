section .text
    global ft_write
    extern __errno_location

ft_write:
    mov rax, 1
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