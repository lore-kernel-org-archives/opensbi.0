From: Anup Patel <anup@brainfault.org>
Date: Mon, 27 Feb 2023 19:52:07 +0530
Subject: [PATCH v2 02/11] lib: sbi_hsm: Don't try to restore state on
 failed change
In-Reply-To: <20230227103106.137995-3-ajones@ventanamicro.com>
References: <20230227103106.137995-1-ajones@ventanamicro.com> <20230227103106.137995-3-ajones@ventanamicro.com>
Message-ID: <CAAhSdy3SAeOT8rY6b0cOc+COAdPapXGEjtH8H_gMdLMLkHK+-g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 4:01 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> When a state change fails there's no need to restore the original
> state as it remains the same.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_hsm.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index b71ee6ba4e80..7ee4159256be 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -428,10 +428,8 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
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
> @@ -466,7 +464,6 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>                 jump_warmboot();
>         }
>
> -fail_restore_state:
>         /*
>          * We might have successfully resumed from retentive suspend
>          * or suspend failed. In both cases, we restore state of hart.
> --
> 2.39.1
>

