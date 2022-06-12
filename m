From: Anup Patel <anup@brainfault.org>
Date: Sun, 12 Jun 2022 10:00:11 +0530
Subject: [PATCH] lib: sbi_trap: Redirect exception based on hedeleg
In-Reply-To: <TYYP286MB14397827A57ED2BA6AA100E3C6A49@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB14397827A57ED2BA6AA100E3C6A49@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy1ip6n5B7yjnEQWAKv7m1AYA36--S4U79FBf3UU_NoDUQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 8, 2022 at 3:01 PM dramforever <dramforever@live.com> wrote:
>
> HS-mode software can choose what exceptions to delegate to VS-mode using
> the hedeleg CSR. Synthetic VS/VU-mode exceptions should also honor
> hedeleg. They should be redirected to VS-mode if and only if delegated
> by HS-mode.
>
> Signed-off-by: dramforever <dramforever@live.com>
> ---
>  lib/sbi/sbi_trap.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/lib/sbi/sbi_trap.c b/lib/sbi/sbi_trap.c
> index 2c509e5..effd456 100644
> --- a/lib/sbi/sbi_trap.c
> +++ b/lib/sbi/sbi_trap.c
> @@ -99,17 +99,14 @@ int sbi_trap_redirect(struct sbi_trap_regs *regs,
>         if (prev_mode != PRV_S && prev_mode != PRV_U)
>                 return SBI_ENOTSUPP;
>
> -       /* For certain exceptions from VS/VU-mode we redirect to VS-mode */
> +       /* If exceptions came from VS/VU-mode, redirect to VS-mode if
> +        * delegated in hedeleg
> +        */
>         if (misa_extension('H') && prev_virt) {
> -               switch (trap->cause) {
> -               case CAUSE_FETCH_PAGE_FAULT:
> -               case CAUSE_LOAD_PAGE_FAULT:
> -               case CAUSE_STORE_PAGE_FAULT:
> +               if (trap->cause < __riscv_xlen &&
> +                   csr_read(CSR_HEDELEG) & (1 << trap->cause)) {

Use BIT(trap->cause) here.

>                         next_virt = TRUE;
> -                       break;
> -               default:
> -                       break;
> -               };
> +               }
>         }
>
>         /* Update MSTATUS MPV bits */
> --
> 2.36.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Apart from a minor comment above, this looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

