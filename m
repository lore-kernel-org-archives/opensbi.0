From: Anup Patel <anup@brainfault.org>
Date: Tue, 17 Jan 2023 09:06:58 +0530
Subject: [RFC PATCH 02/11] lib: sbi_hsm: Don't try to restore state on
 failed change
In-Reply-To: <20230106112209.441825-3-ajones@ventanamicro.com>
References: <20230106112209.441825-1-ajones@ventanamicro.com> <20230106112209.441825-3-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0eOuGn52Zp8fqFYYs_-YsLRBc=QSqAqi6QFmxZaLcD3g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 6, 2023 at 4:52 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When a state change fails there's no need to restore the original
> state as it remains the same.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_hsm.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index 1896f52c2ab2..6ef6c5bdd4a7 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -429,10 +429,8 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>
>         /* Directly move from STARTED to SUSPENDED state */
>         if (!__sbi_hsm_hart_change_state(hdata, SBI_HSM_STATE_STARTED,
> -                                        SBI_HSM_STATE_SUSPENDED)) {
> -               ret = SBI_EDENIED;
> -               goto fail_restore_state;
> -       }
> +                                        SBI_HSM_STATE_SUSPENDED))
> +               return SBI_EDENIED;
>
>         /* Save the suspend type */
>         hdata->suspend_type = suspend_type;
> @@ -467,7 +465,6 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>                 jump_warmboot();
>         }
>
> -fail_restore_state:
>         /*
>          * We might have successfully resumed from retentive suspend
>          * or suspend failed. In both cases, we restore state of hart.
> --
> 2.39.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

