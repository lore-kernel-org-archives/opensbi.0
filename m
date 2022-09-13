From: Anup Patel <anup@brainfault.org>
Date: Tue, 13 Sep 2022 16:41:41 +0530
Subject: [PATCH 2/2] lib: sbi_misaligned_ldst: Set GVA if not emulating
In-Reply-To: <OSZP286MB14356E709DECF9996FA02E9FC67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
References: <OSZP286MB1435E0C79F99B144BC99F8F2C67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
 <OSZP286MB14356E709DECF9996FA02E9FC67A9@OSZP286MB1435.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy0gB9haD22qaMbKnFkLt1=spt19ZDJvtrpFFmV_hxUS6A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 2, 2022 at 9:21 PM Vivian Wang <dramforever@live.com> wrote:
>
> If a particular misaligned load or store cannot be emulated at all, for
> the redirected trap, trap.gva is set to 0, but it should be the same as
> mstatus[h].GVA of the original trap. Fix this so that if the trap is
> destined for HS-mode, hstatus.GVA is then set correctly.
>
> Fixes: 1c4ce74f5128 ("lib: sbi: Set gva when creating sbi_trap_info")
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_misaligned_ldst.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
> index 92a2393..4b91e07 100644
> --- a/lib/sbi/sbi_misaligned_ldst.c
> +++ b/lib/sbi/sbi_misaligned_ldst.c
> @@ -129,7 +129,7 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>                 uptrap.tval = addr;
>                 uptrap.tval2 = tval2;
>                 uptrap.tinst = tinst;
> -               uptrap.gva   = 0;
> +               uptrap.gva   = sbi_regs_gva(regs);
>                 return sbi_trap_redirect(regs, &uptrap);
>         }
>
> @@ -245,7 +245,7 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
>                 uptrap.tval = addr;
>                 uptrap.tval2 = tval2;
>                 uptrap.tinst = tinst;
> -               uptrap.gva   = 0;
> +               uptrap.gva   = sbi_regs_gva(regs);
>                 return sbi_trap_redirect(regs, &uptrap);
>         }
>
> --
> 2.37.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

