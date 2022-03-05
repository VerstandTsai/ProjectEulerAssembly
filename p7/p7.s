    .intel_syntax noprefix
    .set n, 1000000
    .set size, (n*4)
    .data
f:  .string "%d\n"
    .text
    .global main
main:
    push rbp
    mov rbp, rsp
    sub rsp, size
    mov rax, 2                          # i = 2
loop_init:
    cmp rax, n                          # while i < n
    jge endloop_init
    mov DWORD PTR [rbp+rax*4-size], 1   #   a[i] = true
    inc rax                             #   i++
    jmp loop_init
endloop_init:
    mov rax, 2                          # i = 2
loop_num:
    cmp rax, n                          # while i < n
    jge endloop_num
    cmp DWORD PTR [rbp+rax*4-size], 0   #   if a[i] == false
    je  endloop_filter                  #       continue
    mov rbx, rax                        #   j = i
loop_filter:                            #   do
    add rbx, rax                        #       j += i
    cmp rbx, n                          #   while j < n
    jge endloop_filter
    mov DWORD PTR [rbp+rbx*4-size], 0   #       a[j] = false
    jmp loop_filter
endloop_filter:
    inc rax                             #   i++
    jmp loop_num
endloop_num:
    mov rax, 0                          # count = 0
    mov rbx, 2                          # i = 2
loop_count:
    cmp rax, 10001                      # while i < 10001
    jge endloop_count
    cmp DWORD PTR [rbp+rbx*4-size], 0   #   if a[i] == 0
    je  not_prime                       #       continue
    inc rax                             #   count++
not_prime:
    inc rbx                             #   i++
    jmp loop_count
endloop_count:
    dec rbx                             # count--
    lea rdi, [rip+f]
    mov rsi, rbx
    mov rax, 0
    call printf
    mov rax, 0
    leave
    ret
