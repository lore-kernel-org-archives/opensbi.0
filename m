From: Anup Patel <anup@brainfault.org>
Date: Sat, 18 Jun 2022 11:28:44 +0530
Subject: [PATCH 3/3] lib: sbi: Fix tval and tinst for sbi_get_insn()
In-Reply-To: <TYYP286MB14393C382F94A378E9F529CDC6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14393C382F94A378E9F529CDC6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy3oT8JNB2X8TG_xWE9qVuX-k4BRo-JHP3s_uiKnRKP11Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 9, 2022 at 12:38 PM dramforever <dramforever@live.com> wrote:
>
> We should not change trap->tval to mepc because mtval already points to
> the faulting portion of the emulated instruction fetch, which is also
> what stval is expected to be.
>
> In addition, htinst is only allowed to be zero for instruction access
> faults or page faults, and is only allowed to be zero or a
> psuedoinstruction for instruction guest-page faults. Fix trap->tinst for
> these cases.
>
> Signed-off-by: dramforever <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_unpriv.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_unpriv.c b/lib/sbi/sbi_unpriv.c
> index 73b530c..9a34a71 100644
> --- a/lib/sbi/sbi_unpriv.c
> +++ b/lib/sbi/sbi_unpriv.c
> @@ -149,15 +149,17 @@ ulong sbi_get_insn(ulong mepc, struct sbi_trap_info *trap)
>         switch (trap->cause) {
>         case CAUSE_LOAD_ACCESS:
>                 trap->cause = CAUSE_FETCH_ACCESS;
> -               trap->tval = mepc;
> +               trap->tinst = 0UL;
>                 break;
>         case CAUSE_LOAD_PAGE_FAULT:
>                 trap->cause = CAUSE_FETCH_PAGE_FAULT;
> -               trap->tval = mepc;
> +               trap->tinst = 0UL;
>                 break;
>         case CAUSE_LOAD_GUEST_PAGE_FAULT:
>                 trap->cause = CAUSE_FETCH_GUEST_PAGE_FAULT;
> -               trap->tval = mepc;
> +               if (trap->tinst != INSN_PSEUDO_VS_LOAD &&
> +                   trap->tinst != INSN_PSEUDO_VS_STORE)
> +                       trap->tinst = 0UL;
>                 break;
>         default:
>                 break;
> --
> 2.36.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

