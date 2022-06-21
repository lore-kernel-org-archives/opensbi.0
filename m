From: Xiang W <wxjstz@126.com>
Date: Tue, 21 Jun 2022 23:53:16 +0800
Subject: [PATCH v4] lib: sbi: Improve csr read and write
In-Reply-To: <81DE08C6-50D4-4CC2-AE63-266D727F083F@jrtc27.com>
References: <20220526144214.308921-1-wxjstz@126.com>
	 <CAK9=C2U9KyVTJhXN9jOqqR7JMYz0Mn9ar=seXbPg1+UdHhhbpg@mail.gmail.com>
	 <1e615125574b838bc99dd58239874fa2e1685bdb.camel@126.com>
	 <81DE08C6-50D4-4CC2-AE63-266D727F083F@jrtc27.com>
Message-ID: <eb75c146d4657e71ca67dce5517438e80f4af962.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-05-26???? 16:28 +0100?Jessica Clarke???
> On 26 May 2022, at 16:19, Xiang W <wxjstz@126.com> wrote:
> > 
> > ? 2022-05-26???? 20:35 +0530?Anup Patel???
> > > On Thu, May 26, 2022 at 8:12 PM Xiang W <wxjstz@126.com> wrote:
> > > > 
> > > > Reduce the overhead of csr read and write code by producing a small
> > > > piece of code to perform csr read and write.
> > > > 
> > > > Signed-off-by: Xiang W <wxjstz@126.com>
> > > > ---
> > > > Changes in v4:
> > > > - add fence.i sync instruction memory
> > > > 
> > > > Changes in v3:
> > > > - Prevent unnecessary optimizations by the compiler
> > > > 
> > > > Changes in v2:
> > > > - Fix thread safety related bugs as suggested by Anup
> > > > 
> > > > lib/sbi/riscv_asm.c | 145 ++++----------------------------------------
> > > > 1 file changed, 13 insertions(+), 132 deletions(-)
> > > > 
> > > > diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> > > > index a09cf78..452cb19 100644
> > > > --- a/lib/sbi/riscv_asm.c
> > > > +++ b/lib/sbi/riscv_asm.c
> > > > @@ -9,6 +9,7 @@
> > > > 
> > > > #include <sbi/riscv_asm.h>
> > > > #include <sbi/riscv_encoding.h>
> > > > +#include <sbi/riscv_barrier.h>
> > > > #include <sbi/sbi_error.h>
> > > > #include <sbi/sbi_platform.h>
> > > > #include <sbi/sbi_console.h>
> > > > @@ -93,142 +94,22 @@ void misa_string(int xlen, char *out, unsigned int out_sz)
> > > > 
> > > > unsigned long csr_read_num(int csr_num)
> > > > {
> > > > -#define switchcase_csr_read(__csr_num, __val)? \
> > > > -? case __csr_num:? \
> > > > -? __val = csr_read(__csr_num);? \
> > > > -? break;
> > > > -#define switchcase_csr_read_2(__csr_num, __val)? \
> > > > -? switchcase_csr_read(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_read(__csr_num + 1, __val)
> > > > -#define switchcase_csr_read_4(__csr_num, __val)? \
> > > > -? switchcase_csr_read_2(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_read_2(__csr_num + 2, __val)
> > > > -#define switchcase_csr_read_8(__csr_num, __val)? \
> > > > -? switchcase_csr_read_4(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_read_4(__csr_num + 4, __val)
> > > > -#define switchcase_csr_read_16(__csr_num, __val)? \
> > > > -? switchcase_csr_read_8(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_read_8(__csr_num + 8, __val)
> > > > -#define switchcase_csr_read_32(__csr_num, __val)? \
> > > > -? switchcase_csr_read_16(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_read_16(__csr_num + 16, __val)
> > > > -#define switchcase_csr_read_64(__csr_num, __val)? \
> > > > -? switchcase_csr_read_32(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_read_32(__csr_num + 32, __val)
> > > > -
> > > > -? unsigned long ret = 0;
> > > > -
> > > > -? switch (csr_num) {
> > > > -? switchcase_csr_read_16(CSR_PMPCFG0, ret)
> > > > -? switchcase_csr_read_64(CSR_PMPADDR0, ret)
> > > > -? switchcase_csr_read(CSR_MCYCLE, ret)
> > > > -? switchcase_csr_read(CSR_MINSTRET, ret)
> > > > -? switchcase_csr_read(CSR_MHPMCOUNTER3, ret)
> > > > -? switchcase_csr_read_4(CSR_MHPMCOUNTER4, ret)
> > > > -? switchcase_csr_read_8(CSR_MHPMCOUNTER8, ret)
> > > > -? switchcase_csr_read_16(CSR_MHPMCOUNTER16, ret)
> > > > -? switchcase_csr_read(CSR_MCOUNTINHIBIT, ret)
> > > > -? switchcase_csr_read(CSR_MHPMEVENT3, ret)
> > > > -? switchcase_csr_read_4(CSR_MHPMEVENT4, ret)
> > > > -? switchcase_csr_read_8(CSR_MHPMEVENT8, ret)
> > > > -? switchcase_csr_read_16(CSR_MHPMEVENT16, ret)
> > > > -#if __riscv_xlen == 32
> > > > -? switchcase_csr_read(CSR_MCYCLEH, ret)
> > > > -? switchcase_csr_read(CSR_MINSTRETH, ret)
> > > > -? switchcase_csr_read(CSR_MHPMCOUNTER3H, ret)
> > > > -? switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
> > > > -? switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
> > > > -? switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
> > > > -? /**
> > > > -? * The CSR range MHPMEVENT[3-16]H are available only if sscofpmf
> > > > -? * extension is present. The caller must ensure that.
> > > > -? */
> > > > -? switchcase_csr_read(CSR_MHPMEVENT3H, ret)
> > > > -? switchcase_csr_read_4(CSR_MHPMEVENT4H, ret)
> > > > -? switchcase_csr_read_8(CSR_MHPMEVENT8H, ret)
> > > > -? switchcase_csr_read_16(CSR_MHPMEVENT16H, ret)
> > > > -#endif
> > > > -
> > > > -? default:
> > > > -? sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
> > > > -? break;
> > > > -? };
> > > > -
> > > > -? return ret;
> > > > -
> > > > -#undef switchcase_csr_read_64
> > > > -#undef switchcase_csr_read_32
> > > > -#undef switchcase_csr_read_16
> > > > -#undef switchcase_csr_read_8
> > > > -#undef switchcase_csr_read_4
> > > > -#undef switchcase_csr_read_2
> > > > -#undef switchcase_csr_read
> > > > +? volatile uint32_t opcode_buff[2];
> > > > +? typedef unsigned long (*read_f)(void);
> > > > +? opcode_buff[0] = (csr_num << 20) | 0x00002573; /* csrr a0, csr */
> > > > +? opcode_buff[1] = 0x00008067; /* ret */
> > > > +? RISCV_FENCE_I;
> > > > +? return ((read_f)opcode_buff)();
> > > > }
> > > > 
> > > > void csr_write_num(int csr_num, unsigned long val)
> > > > {
> > > > -#define switchcase_csr_write(__csr_num, __val)? \
> > > > -? case __csr_num:? \
> > > > -? csr_write(__csr_num, __val);? \
> > > > -? break;
> > > > -#define switchcase_csr_write_2(__csr_num, __val)? \
> > > > -? switchcase_csr_write(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_write(__csr_num + 1, __val)
> > > > -#define switchcase_csr_write_4(__csr_num, __val)? \
> > > > -? switchcase_csr_write_2(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_write_2(__csr_num + 2, __val)
> > > > -#define switchcase_csr_write_8(__csr_num, __val)? \
> > > > -? switchcase_csr_write_4(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_write_4(__csr_num + 4, __val)
> > > > -#define switchcase_csr_write_16(__csr_num, __val)? \
> > > > -? switchcase_csr_write_8(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_write_8(__csr_num + 8, __val)
> > > > -#define switchcase_csr_write_32(__csr_num, __val)? \
> > > > -? switchcase_csr_write_16(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_write_16(__csr_num + 16, __val)
> > > > -#define switchcase_csr_write_64(__csr_num, __val)? \
> > > > -? switchcase_csr_write_32(__csr_num + 0, __val)? \
> > > > -? switchcase_csr_write_32(__csr_num + 32, __val)
> > > > -
> > > > -? switch (csr_num) {
> > > > -? switchcase_csr_write_16(CSR_PMPCFG0, val)
> > > > -? switchcase_csr_write_64(CSR_PMPADDR0, val)
> > > > -? switchcase_csr_write(CSR_MCYCLE, val)
> > > > -? switchcase_csr_write(CSR_MINSTRET, val)
> > > > -? switchcase_csr_write(CSR_MHPMCOUNTER3, val)
> > > > -? switchcase_csr_write_4(CSR_MHPMCOUNTER4, val)
> > > > -? switchcase_csr_write_8(CSR_MHPMCOUNTER8, val)
> > > > -? switchcase_csr_write_16(CSR_MHPMCOUNTER16, val)
> > > > -#if __riscv_xlen == 32
> > > > -? switchcase_csr_write(CSR_MCYCLEH, val)
> > > > -? switchcase_csr_write(CSR_MINSTRETH, val)
> > > > -? switchcase_csr_write(CSR_MHPMCOUNTER3H, val)
> > > > -? switchcase_csr_write_4(CSR_MHPMCOUNTER4H, val)
> > > > -? switchcase_csr_write_8(CSR_MHPMCOUNTER8H, val)
> > > > -? switchcase_csr_write_16(CSR_MHPMCOUNTER16H, val)
> > > > -? switchcase_csr_write(CSR_MHPMEVENT3H, val)
> > > > -? switchcase_csr_write_4(CSR_MHPMEVENT4H, val)
> > > > -? switchcase_csr_write_8(CSR_MHPMEVENT8H, val)
> > > > -? switchcase_csr_write_16(CSR_MHPMEVENT16H, val)
> > > > -#endif
> > > > -? switchcase_csr_write(CSR_MCOUNTINHIBIT, val)
> > > > -? switchcase_csr_write(CSR_MHPMEVENT3, val)
> > > > -? switchcase_csr_write_4(CSR_MHPMEVENT4, val)
> > > > -? switchcase_csr_write_8(CSR_MHPMEVENT8, val)
> > > > -? switchcase_csr_write_16(CSR_MHPMEVENT16, val)
> > > > -
> > > > -? default:
> > > > -? sbi_panic("%s: Unknown CSR %#x", __func__, csr_num);
> > > > -? break;
> > > > -? };
> > > > -
> > > > -#undef switchcase_csr_write_64
> > > > -#undef switchcase_csr_write_32
> > > > -#undef switchcase_csr_write_16
> > > > -#undef switchcase_csr_write_8
> > > > -#undef switchcase_csr_write_4
> > > > -#undef switchcase_csr_write_2
> > > > -#undef switchcase_csr_write
> > > > +? volatile uint32_t opcode_buff[2];
> > > > +? typedef void (*write_f)(unsigned long val);
> > > > +? opcode_buff[0] = (csr_num << 20) | 0x00051073; /* csrw csr, a0 */
> > > > +? opcode_buff[1] = 0x00008067; /* ret */
> > > > +? RISCV_FENCE_I;
> > > 
> > > I agree we need FENCE.I in the path but this is
> > > like a big hammer in the execution path.
> > > 
> > > This is now much slower compared to the existing
> > > approach because every CSR access using this
> > > function will execute FENCE.I
> > I passed the qemu test, and it can be run normally with
> > or without fence.i. But I'm not sure if the exception
> > happens on other platform or we have a more lightweight
> > way.
> 
> There is not. Optimising this kind of bad practice code is not a goal
> of modern architectures. After all, it totally precludes having W^X
> protection in OpenSBI (e.g. via the PMP, or via CHERI), especially
> executable stacks form a key part of *the* classic buffer overflow
> shell code attack.
> 
> Jess

Currently opensbi does not have strict RWX permission control. We only?
need W and X permissions not to exist at the same time to avoid security
risks. If opensbi has RWX permission control, we only need to change the
permission of opcode_buff before and after running. The stack default is
RW permission, we can change the permission of opcode_buff to RX before
the call, and change the permission to RW after the call is completed.

I think these jobs can be put after opensbi has rwx permission control.

Regards,
Xiang W
> 
> 



