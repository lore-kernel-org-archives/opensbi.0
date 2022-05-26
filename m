From: Anup Patel <anup@brainfault.org>
Date: Thu, 26 May 2022 18:49:22 +0530
Subject: [PATCH v3] lib: sbi: fix system_opcode_insn
In-Reply-To: <20220526112403.280401-1-wxjstz@126.com>
References: <20220526112403.280401-1-wxjstz@126.com>
Message-ID: <CAAhSdy0-3UEz-=GqoBi1SoLZ=fE2uHn96KcGtnOWvLZ+D5zaNQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 26, 2022 at 4:54 PM Xiang W <wxjstz@126.com> wrote:
>
> If the csr's operation comes from M mode, it should not be forwarded
> to low-privilege processing, this patch fixes this problem.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> Changes in v3:
> - move checking prev_mode before sbi_emulate_csr_read and return
> failure by Anup's suggestion
>
> Changes in v2:
> - add missing head file
>
>  lib/sbi/sbi_illegal_insn.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index bfe7d61..7976957 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -16,6 +16,7 @@
>  #include <sbi/sbi_pmu.h>
>  #include <sbi/sbi_trap.h>
>  #include <sbi/sbi_unpriv.h>
> +#include <sbi/sbi_console.h>
>
>  typedef int (*illegal_insn_func)(ulong insn, struct sbi_trap_regs *regs);
>
> @@ -37,8 +38,14 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>         int do_write, rs1_num = (insn >> 15) & 0x1f;
>         ulong rs1_val = GET_RS1(insn, regs);
>         int csr_num   = (u32)insn >> 20;
> +       ulong prev_mode = (regs->mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>         ulong csr_val, new_csr_val;
>
> +       if (prev_mode == PRV_M) {
> +               sbi_printf("%s: Unknown CSR %#x", __func__, csr_num);

This print statement is a bit misleading.

Maybe something like below is better:
sbi_printf("%s: CSR %#x access from M-mode", __func__, csr_num);

> +               return SBI_EFAIL;
> +       }
> +
>         /* TODO: Ensure that we got CSR read/write instruction */
>
>         if (sbi_emulate_csr_read(csr_num, regs, &csr_val))
> --
> 2.30.2
>

Apart from above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

