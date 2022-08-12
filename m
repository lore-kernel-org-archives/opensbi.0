From: Xiang W <wxjstz@126.com>
Date: Sat, 13 Aug 2022 01:04:24 +0800
Subject: [PATCH v1] lib: sbi_illegal_insn: Fix FENCE.TSO emulation
 infinite trap loop
In-Reply-To: <20220812135442.3771496-1-rpathak@ventanamicro.com>
References: <20220812135442.3771496-1-rpathak@ventanamicro.com>
Message-ID: <d5c902ef7939c41f1f5ea97e28012bbd37bf343f.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-08-12???? 19:24 +0530?Rahul Pathak???
> In case of missing "FENCE.TSO" instruction implementation,
> opensbi can emulate the "FENCE.TSO" with "FENCE RW,RW", but
> mepc was not incremented to continue from the next instruction
> causing infinite trap.
> 
> Fixes: cb8271c8 ("lib: sbi_illegal_insn: Add emulation for fence.tso")
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Look good to me.

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?lib/sbi/sbi_illegal_insn.c | 1 +
> ?1 file changed, 1 insertion(+)
> 
> diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> index 84c04f8..53e9320 100644
> --- a/lib/sbi/sbi_illegal_insn.c
> +++ b/lib/sbi/sbi_illegal_insn.c
> @@ -39,6 +39,7 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
> ????????/* Errata workaround: emulate `fence.tso` as `fence rw, rw`. */
> ????????if ((insn & INSN_MASK_FENCE_TSO) == INSN_MATCH_FENCE_TSO) {
> ????????????????smp_mb();
> +???????????????regs->mepc += 4;
> ????????????????return 0;
> ????????}
> ?
> -- 
> 2.34.1
> 
> 



