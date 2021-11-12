From: Anup Patel <anup@brainfault.org>
Date: Fri, 12 Nov 2021 12:22:05 +0530
Subject: [PATCH] lib: sbi: fix pmp_set: clear A befor setting
In-Reply-To: <20211108094303.76907-1-wxjstz@126.com>
References: <20211108094303.76907-1-wxjstz@126.com>
Message-ID: <CAAhSdy29p9aNX279SgJYeognii9qfeHV3LOAVsiKpwUhmP3Sag@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 8, 2021 at 3:13 PM Xiang W <wxjstz@126.com> wrote:
>
> Signed-off-by: Xiang W <wxjstz@126.com>

Overall patch looks good but I have updated the patch subject and
added a one line commit description.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  lib/sbi/riscv_asm.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index f6b8c8e..845039c 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -255,6 +255,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
>                 return SBI_ENOTSUPP;
>
>         /* encode PMP config */
> +       prot &= ~PMP_A;
>         prot |= (log2len == PMP_SHIFT) ? PMP_A_NA4 : PMP_A_NAPOT;
>         cfgmask = ~(0xffUL << pmpcfg_shift);
>         pmpcfg  = (csr_read_num(pmpcfg_csr) & cfgmask);
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

