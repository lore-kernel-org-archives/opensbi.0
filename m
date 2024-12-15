From: Inochi Amaoto <inochiama@gmail.com>
Date: Sun, 15 Dec 2024 14:42:57 +0800
Subject: [BUG report] boot fail with V extension
In-Reply-To: <20241215013827.233227-1-inochiama@gmail.com>
References: <20241215013827.233227-1-inochiama@gmail.com>
Message-ID: <ylr6utj6gimzisbjbp7jcwlptazffundun5dvsjuzz6ahkp2vd@6z3z6vjccjqu>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 15, 2024 at 09:38:24AM +0800, Inochi Amaoto wrote:
> I have found a boot failure on qemu platform with the latest OpenSBI:
> 

It was fixed by
5545602 - Makefile: Don't enable V-extension using -march option
74c6ea0 - lib: utils/fdt_cppc_rpmi: Fix compile error with LLVM.

I have tested and everything is fine, so close this report.

Regards,
Inochi.

> Releated commit:
> c2acc5e ("lib: sbi_misaligned_ldst: Add handling of vector load/store")
> 
> Qemu version:
> 9.1.2
> 
> Qemu command:
> qemu-system-riscv64 -M virt -cpu rv64,v=on \
>     -smp cpus=1 -m 4G -monitor stdio -bios fw_payload.bin
> 
> I have got a trap on 0x80021c44 with cause 2 (illegal instruction).
> No log is printed.
> 
> The disassemble code is:
> ```
> 0000000000021c2a <serial_uart8250_init>:
> #include <sbi_utils/serial/fdt_serial.h>
> #include <sbi_utils/serial/uart8250.h>
> 
> static int serial_uart8250_init(const void *fdt, int nodeoff,
>                                 const struct fdt_match *match)
> {
>    21c2a:       7159                    addi     sp,sp,-112
>    21c2c:       f486                    sd       ra,104(sp)
>    21c2e:       f0a2                    sd       s0,96(sp)
>    21c30:       1880                    addi     s0,sp,112
>    21c32:       faa43423                sd       a0,-88(s0)
>    21c36:       87ae                    mv       a5,a1
>    21c38:       f8c43c23                sd       a2,-104(s0)
>    21c3c:       faf42223                sw       a5,-92(s0)
>         int rc;
>         struct platform_uart_data uart = { 0 };
>    21c40:       fb840793                addi     a5,s0,-72
>    21c44:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c48:       5e0030d7                vmv.v.i  v1,0
>    21c4c:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c50:       020780a7                vse8.v   v1,(a5)
>    21c54:       fc040793                addi     a5,s0,-64
>    21c58:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c5c:       020780a7                vse8.v   v1,(a5)
>    21c60:       fc840793                addi     a5,s0,-56
>    21c64:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c68:       020780a7                vse8.v   v1,(a5)
>    21c6c:       fd040793                addi     a5,s0,-48
>    21c70:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c74:       020780a7                vse8.v   v1,(a5)
>    21c78:       fd840793                addi     a5,s0,-40
>    21c7c:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c80:       020780a7                vse8.v   v1,(a5)
>    21c84:       fe040793                addi     a5,s0,-32
>    21c88:       cc747057                vsetivli zero,8,e8,mf2,ta,ma
>    21c8c:       020780a7                vse8.v   v1,(a5)
> ```
> 
> By removing the v extension in the Makefile, I got booted. But on my
> SG2044 (which has v1p0 support) I got an error in kernel:
> 
> ```
> [   50.689589] watchdog: BUG: soft lockup - CPU#42 stuck for 45s! [kworker/42:1:447]
> [   50.697067] Modules linked in:
> [   50.700116] CPU: 42 UID: 0 PID: 447 Comm: kworker/42:1 Tainted: G             L     6.13.0-rc1-00039-gcf93d2c41559 #2
> [   50.710712] Tainted: [L]=SOFTLOCKUP
> [   50.714193] Hardware name: Sophgo SG2044 EVB 1.1 (DT)
> [   50.719235] Workqueue: events check_vector_unaligned_access_emulated
> [   50.725583] epc : check_vector_unaligned_access_emulated+0x44/0x6a
> [   50.731755]  ra : check_vector_unaligned_access_emulated+0x3a/0x6a
> [   50.737928] epc : ffffffff80015f7c ra : ffffffff80015f72 sp : ffff8f80019ebdc0
> [   50.745139]  gp : ffffffff8171a8c8 tp : ffffaf8083998cc0 t0 : 0000000000000000
> [   50.752349]  t1 : ffffaf80826de080 t2 : 0000000000000002 s0 : ffff8f80019ebde0
> [   50.759560]  s1 : ffffaf80826de000 a0 : 0000000000000600 a1 : ffff8f80019ec000
> [   50.766771]  a2 : 0000000000004000 a3 : 0000000000000000 a4 : ffff8f80019e8000
> [   50.773982]  a5 : ffff8f80019ebdc1 a6 : ffff8c8b919a899a a7 : 8080808080808080
> [   50.781192]  s2 : ffffaf9f7ec2c5e0 s3 : ffffaf808006d400 s4 : ffffaf9f7ec26300
> [   50.788403]  s5 : ffffaf808006d405 s6 : ffffaf9f7ec2c5e8 s7 : ffffaf80826de000
> [   50.795614]  s8 : ffffaf9f7ec26300 s9 : 0000000000000000 s10: 0000000000000000
> [   50.802825]  s11: 0000000000000000 t3 : fefefefefefefeff t4 : 0000000000000007
> [   50.810035]  t5 : ffffffff81757558 t6 : 0000000000000000
> [   50.815338] status: 8000000200000720 badaddr: 0000000000000000 cause: 8000000000000005
> [   50.823243] [<ffffffff80015f7c>] check_vector_unaligned_access_emulated+0x44/0x6a
> [   50.830717] [<ffffffff8003d628>] process_one_work+0x120/0x20e
> [   50.836455] [<ffffffff8003de48>] worker_thread+0x210/0x2ec
> [   50.841932] [<ffffffff80045470>] kthread+0xc4/0xde
> [   50.846717] [<ffffffff80a1cf46>] ret_from_fork+0xe/0x18
> ```
> 
> Revert the commit `c2acc5e` and everything will be fine.
> 
> Regards,
> Inochi

