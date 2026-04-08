    # 将后续代码放入 .text.entry 段中，
    # 链接脚本 linker.ld 会确保这个段被放在内核镜像的最开头
    .section .text.entry
    # 导出全局符号 _start，作为整个内核的入口点
    .globl _start
_start:
    # 加载启动栈的栈顶地址到 sp (Stack Pointer) 寄存器
    # RISC-V 的栈是从高地址向低地址增长的
    la sp, boot_stack_top
    # 调用 Rust 入口函数 rust_main
    call rust_main

    # 将后续数据放入 .bss.stack 段中
    .section .bss.stack
    # 导出栈底和栈顶符号，供 Rust 代码打印内存布局使用
    .globl boot_stack_lower_bound
boot_stack_lower_bound:
    # 预留 16KB (4096 * 4 字节) 的空间作为启动栈
    .space 4096 * 16
    .globl boot_stack_top
boot_stack_top:






