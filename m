From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Aug 2022 09:01:11 +0530
Subject: [PATCH v1] lib: sbi_illegal_insn: Fix FENCE.TSO emulation
 infinite trap loop
In-Reply-To: <20220812135442.3771496-1-rpathak@ventanamicro.com>
References: <20220812135442.3771496-1-rpathak@ventanamicro.com>
Message-ID: <CAAhSdy1ie8nV6mR=RMTQVwc3Oc4fxzGedX7TLkT__Q4SJ+Jr5w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Aug 12, 2022 at 7:25 PM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> In case of missing "FENCE.TSO" instruction implementation,
> opensbi can emulate the "FENCE.TSO" with "FENCE RW,RW", but
> mepc was not incremented to continue from the next instruction
> causing infinite trap.
>
> Fixes: cb8271c8 ("lib: sbi_illegal_insn: Add emulation for fence.tso")
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_illegal_insn.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index 84c04f8..53e9320 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -39,6 +39,7 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
>         /* Errata workaround: emulate `fence.tso` as `fence rw, rw`. */
>         if ((insn & INSN_MASK_FENCE_TSO) == INSN_MATCH_FENCE_TSO) {
>                 smp_mb();
> +               regs->mepc += 4;
>                 return 0;
>         }
>
> --
> 2.34.1
>

