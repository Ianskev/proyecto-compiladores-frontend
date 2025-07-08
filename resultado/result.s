.data
print_fmt: .string "%ld\n"
print_str_fmt: .string "%s\n"
print_bool_true: .string "true\n"
print_bool_false: .string "false\n"
.text
.globl main
main:
  pushq %rbp
  movq %rsp, %rbp
  subq $16, %rsp
  movq $10, %rax
  movq %rax, -8(%rbp)
  movq -8(%rbp), %rax
  movq %rax, %rsi
  leaq print_fmt(%rip), %rdi
  movl $0, %eax
  call printf@PLT
L0:
  movq $0, %rax
  leave
  ret
.section .note.GNU-stack,"",@progbits
