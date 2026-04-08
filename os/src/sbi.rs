//! SBI 调用封装
//!
//! SBI (Supervisor Binary Interface) 是 RISC-V 架构中，运行在 S 模式的内核
//! 与运行在 M 模式的固件（如 RustSBI）之间的标准接口。

use core::arch::asm;

/// SBI 服务 ID: 向控制台打印一个字符
const SBI_CONSOLE_PUTCHAR: usize = 1;

/// 通用的 SBI 调用接口
///
/// 根据 RISC-V SBI 标准，调用参数通过寄存器 a0-a2 传递，
/// 服务 ID (Extension ID) 通过 a7 传递。
/// 返回值存放在 a0 中。
#[inline(always)]
fn sbi_call(which: usize, arg0: usize, arg1: usize, arg2: usize) -> usize {
    let mut ret;
    unsafe {
        asm!(
            "li x16, 0", // 部分环境下的特殊处理，通常不影响标准调用
            "ecall",     // 触发环境调用异常，跳转到 M 模式的 RustSBI 处理
            inlateout("x10") arg0 => ret, // a0 既是第一个参数，也是返回值
            in("x11") arg1,               // a1: 第二个参数
            in("x12") arg2,               // a2: 第三个参数
            in("x17") which,              // a7: 服务 ID (Extension ID)
        );
    }
    ret
}

/// 使用 SBI 调用在控制台输出一个字符
///
/// 实际上是调用了 QEMU 的 UART 驱动来实现字符显示。
pub fn console_putchar(c: usize) {
    sbi_call(SBI_CONSOLE_PUTCHAR, c, 0, 0);
}

use crate::board::QEMUExit;
/// 使用 SBI 调用来关闭内核并退出 QEMU
pub fn shutdown() -> ! {
    // 调用板级支持包中的退出接口，告知 QEMU 运行结束
    crate::board::QEMU_EXIT_HANDLE.exit_failure();
}
