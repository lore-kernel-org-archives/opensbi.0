From: Anup Patel <anup@brainfault.org>
Date: Sun, 4 Jun 2023 15:22:46 +0530
Subject: [PATCH] lib: sbi: Align system suspend errors with spec
In-Reply-To: <20230601074810.798131-1-ajones@ventanamicro.com>
References: <20230601074810.798131-1-ajones@ventanamicro.com>
Message-ID: <CAAhSdy33+k2MyV_kZtL6VvVvUXka+pZmY0SOtbZNSMALkgpa5g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jun 1, 2023 at 1:18?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> The spec says sbi_system_suspend() will return SBI_ERR_INVALID_PARAM
> when "sleep_type is reserved or is platform-specific and unimplemented"
> and SBI_ERR_NOT_SUPPORTED when sleep_type "is not reserved and is
> implemented, but the platform does not support it due to one or more
> missing dependencies." Ensure SBI_ERR_INVALID_PARAM is returned for
> reserved sleep types and that the system suspend driver can choose
> which of the two error types to return itself by returning an error
> from its check function rather than a boolean.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/sbi_system.h |  9 ++++++++-
>  lib/sbi/sbi_system.c     | 14 ++++++++------
>  2 files changed, 16 insertions(+), 7 deletions(-)
>
> diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
> index 33ff7f1a44a6..0fdcc98cce5d 100644
> --- a/include/sbi/sbi_system.h
> +++ b/include/sbi/sbi_system.h
> @@ -48,7 +48,14 @@ struct sbi_system_suspend_device {
>         /** Name of the system suspend device */
>         char name[32];
>
> -       /* Check whether sleep type is supported by the device */
> +       /**
> +        * Check whether sleep type is supported by the device
> +        *
> +        * Returns 0 when @sleep_type supported, SBI_ERR_INVALID_PARAM
> +        * when @sleep_type is reserved, or SBI_ERR_NOT_SUPPORTED when
> +        * @sleep_type is not reserved and is implemented, but the
> +        * platform doesn't support it due to missing dependencies.
> +        */
>         int (*system_suspend_check)(u32 sleep_type);
>
>         /**
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> index 6933915a12ed..d803ffa84189 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -111,7 +111,7 @@ void sbi_system_suspend_set_device(struct sbi_system_suspend_device *dev)
>
>  static int sbi_system_suspend_test_check(u32 sleep_type)
>  {
> -       return sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND;
> +       return sleep_type == SBI_SUSP_SLEEP_TYPE_SUSPEND ? 0 : SBI_EINVAL;
>  }
>
>  static int sbi_system_suspend_test_suspend(u32 sleep_type,
> @@ -142,27 +142,29 @@ void sbi_system_suspend_test_enable(void)
>  bool sbi_system_suspend_supported(u32 sleep_type)
>  {
>         return suspend_dev && suspend_dev->system_suspend_check &&
> -              suspend_dev->system_suspend_check(sleep_type);
> +              suspend_dev->system_suspend_check(sleep_type) == 0;
>  }
>
>  int sbi_system_suspend(u32 sleep_type, ulong resume_addr, ulong opaque)
>  {
> -       int ret = SBI_ENOTSUPP;
>         const struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         void (*jump_warmboot)(void) = (void (*)(void))scratch->warmboot_addr;
>         unsigned int hartid = current_hartid();
>         unsigned long prev_mode;
>         unsigned long i;
> +       int ret;
>
>         if (!dom || !dom->system_suspend_allowed)
>                 return SBI_EFAIL;
>
> -       if (!suspend_dev || !suspend_dev->system_suspend)
> +       if (!suspend_dev || !suspend_dev->system_suspend ||
> +           !suspend_dev->system_suspend_check)
>                 return SBI_EFAIL;
>
> -       if (!sbi_system_suspend_supported(sleep_type))
> -               return SBI_ENOTSUPP;
> +       ret = suspend_dev->system_suspend_check(sleep_type);
> +       if (ret != SBI_OK)
> +               return ret;
>
>         prev_mode = (csr_read(CSR_MSTATUS) & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
>         if (prev_mode != PRV_S && prev_mode != PRV_U)
> --
> 2.40.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

