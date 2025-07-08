.data
print_fmt: .string "%ld\n"
print_str_fmt: .string "%s\n"
print_bool_true: .string "true\n"
print_bool_false: .string "false\n"
string_1: .string "Length:"
string_0: .string "hola"
.text
.globl main
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  leaq string_0(%rip), %rax
  movq %rax, -8(%rbp)
  leaq string_1(%rip), %rax
  movq %rax, %rsi
  leaq print_str_fmt(%rip), %rdi
  movl $0, %eax
  call printf@PLT
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call strlen@PLT
  movq %rax, %rsi
  leaq print_fmt(%rip), %rdi
  movl $0, %eax
  call printf@PLT
  movq $0, %rax
  movq %rax, -16(%rbp)
L1:
  movq -16(%rbp), %rax
  pushq %rax
  movq -8(%rbp), %rax
  movq %rax, %rdi
  call strlen@PLT
  movq %rax, %rbx
  popq %rax
  cmpq %rbx, %rax
  setl %al
  movzbq %al, %rax
  cmpq $0, %rax
  je L2
  movq -16(%rbp), %rax
  movq %rax, %rsi
  leaq print_fmt(%rip), %rdi
  movl $0, %eax
  call printf@PLT
  movq -16(%rbp), %rax
  incq %rax
  movq %rax, -16(%rbp)
  jmp L1
L2:
L0:
  movq $0, %rax
  leave
  ret
.section .note.GNU-stack,"",@progbits
