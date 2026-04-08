/* 目标架构为 RISC-V */
OUTPUT_ARCH(riscv)
/* 程序入口点为 _start 符号（在 entry.asm 中定义） */
ENTRY(_start)
/* 内核加载的起始物理地址 */
BASE_ADDRESS = 0x80200000;

SECTIONS
{
    /* 设置当前地址为起始地址 */
    . = BASE_ADDRESS;
    /* 整个内核开始的符号 */
    skernel = .;

    /* 代码段开始符号 */
    stext = .;
    .text : {
        /* 确保启动汇编代码排在最前面，CPU 启动后首先执行它 */
        *(.text.entry)
        /* 包含所有其他的代码段 */
        *(.text .text.*)
    }

    /* 将地址对齐到 4KB（页大小） */
    . = ALIGN(4K);
    /* 代码段结束符号 */
    etext = .;
    /* 只读数据段开始符号 */
    srodata = .;
    .rodata : {
        /* 包含所有只读数据（常量、字符串等） */
        *(.rodata .rodata.*)
        *(.srodata .srodata.*)
    }

    /* 对齐到下一页 */
    . = ALIGN(4K);
    /* 只读数据段结束符号 */
    erodata = .;
    /* 已初始化数据段开始符号 */
    sdata = .;
    .data : {
        /* 包含所有有初始值的全局变量 */
        *(.data .data.*)
        *(.sdata .sdata.*)
    }

    /* 对齐到下一页 */
    . = ALIGN(4K);
    /* 已初始化数据段结束符号 */
    edata = .;
    .bss : {
        /* 包含内核启动栈 */
        *(.bss.stack)
        /* 未初始化数据段开始符号（清零 BSS 时用到） */
        sbss = .;
        /* 包含所有未初始化的全局变量 */
        *(.bss .bss.*)
        *(.sbss .sbss.*)
    }

    /* 对齐到下一页 */
    . = ALIGN(4K);
    /* 未初始化数据段结束符号 */
    ebss = .;
    /* 整个内核结束的符号 */
    ekernel = .;

    /* 丢弃不需要的段，减小镜像体积 */
    /DISCARD/ : {
        *(.eh_frame)
    }
}