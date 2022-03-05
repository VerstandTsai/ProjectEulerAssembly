    .intel_syntax noprefix
    .section .data
f:  .string "%lld\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, 8
    mov rax, 600851475143
    mov QWORD PTR [rbp - 8], rax
    mov rbx, 2
loop:
    cmp rbx, [rbp - 8]
    jge end_loop
    mov rax, [rbp - 8]
    mov rcx, rbx
    cqo
    idiv rcx
    cmp rdx, 0
    jne not_divable
    mov [rbp - 8], rax
    jmp loop
not_divable:
    inc rbx
    jmp loop
end_loop:
    lea rdi, [rip + f]
    mov rsi, rbx
    mov rax, 0
    call printf
    mov rax, 0
    leave
    ret
