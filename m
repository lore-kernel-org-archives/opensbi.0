From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 17:41:37 +0530
Subject: [RFC PATCH v2 2/9] lib: sbi_hsm: Assume a consistent resume address
In-Reply-To: <20220530033738.27127-3-samuel@sholland.org>
References: <20220530033738.27127-1-samuel@sholland.org> <20220530033738.27127-3-samuel@sholland.org>
Message-ID: <CAAhSdy1fE4j2q9EBWmwcrT2dH8ExTfCnpVuAyNhJAYEP3rabwA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 9:07 AM Samuel Holland <samuel@sholland.org> wrote:
>
> The suspend code needs to know the resume address for two reasons:
>   1) Programing some hardware register or management firmware. Here we
>      assume the hardware/firmware maintains its state between suspends,
>      so it only needs to be programmed once at startup.

s/Programing/Programming/

>   2) When a non-retentive suspend request ends up being retentive, due
>      to lack of hardware support, pending interrupt, or for some other
>      reason. However, the behavior here is not platform-dependent, and
>      this can be handled in the generic hart suspend function.
>
> Since neither situation requires the platform-level suspend function to
> know the resume address, stop passing it to that function. Instead,
> handle the non-retentive to retentive situation generically.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
> Changes in v2:
>  - New patch for v2
>
>  include/sbi/sbi_hsm.h |  4 ++--
>  lib/sbi/sbi_hsm.c     | 46 +++++++++++++++++++------------------------
>  2 files changed, 22 insertions(+), 28 deletions(-)
>
> diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
> index 6da8cee..d6cc468 100644
> --- a/include/sbi/sbi_hsm.h
> +++ b/include/sbi/sbi_hsm.h
> @@ -34,9 +34,9 @@ struct sbi_hsm_device {
>          * the hart resumes normal execution.
>          *
>          * For successful non-retentive suspend, the hart will resume from
> -        * specified resume address
> +        * the warm boot entry point.
>          */
> -       int (*hart_suspend)(u32 suspend_type, ulong raddr);
> +       int (*hart_suspend)(u32 suspend_type);
>
>         /**
>          * Perform platform-specific actions to resume from a suspended state.
> diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
> index a7b6a80..1165acc 100644
> --- a/lib/sbi/sbi_hsm.c
> +++ b/lib/sbi/sbi_hsm.c
> @@ -171,10 +171,10 @@ static int hsm_device_hart_stop(void)
>         return SBI_ENOTSUPP;
>  }
>
> -static int hsm_device_hart_suspend(u32 suspend_type, ulong raddr)
> +static int hsm_device_hart_suspend(u32 suspend_type)
>  {
>         if (hsm_dev && hsm_dev->hart_suspend)
> -               return hsm_dev->hart_suspend(suspend_type, raddr);
> +               return hsm_dev->hart_suspend(suspend_type);
>         return SBI_ENOTSUPP;
>  }
>
> @@ -319,7 +319,7 @@ int sbi_hsm_hart_stop(struct sbi_scratch *scratch, bool exitnow)
>         return 0;
>  }
>
> -static int __sbi_hsm_suspend_ret_default(struct sbi_scratch *scratch)
> +static int __sbi_hsm_suspend_default(struct sbi_scratch *scratch)
>  {
>         /* Wait for interrupt */
>         wfi();
> @@ -359,23 +359,6 @@ static void __sbi_hsm_suspend_non_ret_restore(struct sbi_scratch *scratch)
>         csr_write(CSR_MIP, (hdata->saved_mip & (MIP_SSIP | MIP_STIP)));
>  }
>
> -static int __sbi_hsm_suspend_non_ret_default(struct sbi_scratch *scratch,
> -                                            ulong raddr)
> -{
> -       void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
> -
> -       /* Wait for interrupt */
> -       wfi();
> -
> -       /*
> -        * Directly jump to warm reboot to simulate resume from a
> -        * non-retentive suspend.
> -        */
> -       jump_warmboot();
> -
> -       return 0;
> -}
> -
>  void sbi_hsm_hart_resume_start(struct sbi_scratch *scratch)
>  {
>         int oldstate;
> @@ -473,17 +456,28 @@ int sbi_hsm_hart_suspend(struct sbi_scratch *scratch, u32 suspend_type,
>                 __sbi_hsm_suspend_non_ret_save(scratch);
>
>         /* Try platform specific suspend */
> -       ret = hsm_device_hart_suspend(suspend_type, scratch->warmboot_addr);
> +       ret = hsm_device_hart_suspend(suspend_type);
>         if (ret == SBI_ENOTSUPP) {
>                 /* Try generic implementation of default suspend types */
> -               if (suspend_type == SBI_HSM_SUSPEND_RET_DEFAULT) {
> -                       ret = __sbi_hsm_suspend_ret_default(scratch);
> -               } else if (suspend_type == SBI_HSM_SUSPEND_NON_RET_DEFAULT) {
> -                       ret = __sbi_hsm_suspend_non_ret_default(scratch,
> -                                               scratch->warmboot_addr);
> +               if (suspend_type == SBI_HSM_SUSPEND_RET_DEFAULT ||
> +                   suspend_type == SBI_HSM_SUSPEND_NON_RET_DEFAULT) {
> +                       ret = __sbi_hsm_suspend_default(scratch);
>                 }
>         }
>
> +       /*
> +        * The platform may have coordinated a retentive suspend, or it may
> +        * have exited early from a non-retentive suspend. Either way, the
> +        * caller is not expecting a successful return, so jump to the warm
> +        * boot entry point to simulate resume from a non-retentive suspend.
> +        */
> +       if (ret == 0 && (suspend_type & SBI_HSM_SUSP_NON_RET_BIT)) {
> +               void (*jump_warmboot)(void) =
> +                       (void (*)(void))scratch->warmboot_addr;
> +
> +               jump_warmboot();
> +       }
> +
>  fail_restore_state:
>         /*
>          * We might have successfully resumed from retentive suspend
> --
> 2.35.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

