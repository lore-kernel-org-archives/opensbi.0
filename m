From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 Oct 2021 09:53:49 +0530
Subject: [PATCH] lib: sbi: sbi_system_reset() if not supported
In-Reply-To: <20211015135041.36009-1-heinrich.schuchardt@canonical.com>
References: <20211015135041.36009-1-heinrich.schuchardt@canonical.com>
Message-ID: <CAAhSdy2ATJuoLftEWmrP52d8j1udTAohjq525oJ24Swo6q67qg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Oct 15, 2021 at 7:49 PM Heinrich Schuchardt
<heinrich.schuchardt@canonical.com> wrote:
>
> The SBI specification requires that if a reset type or reason is not
> supported the system reset function returns SBI_ERR_NOT_SUPPORTED.
>
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

This patch is not required because the sbi_ecall_srst_handler() will only
call sbi_system_reset() if sbi_system_reset_supported() returns true.

Regards,
Anup

> ---
> Yet another patch will be needed to return SBI_ERR_FAILED if the reset
> did not succeed.
> ---
>  include/sbi/sbi_system.h |  2 +-
>  lib/sbi/sbi_system.c     | 22 ++++++++++++++--------
>  2 files changed, 15 insertions(+), 9 deletions(-)
>
> diff --git a/include/sbi/sbi_system.h b/include/sbi/sbi_system.h
> index 84c2813..3c98133 100644
> --- a/include/sbi/sbi_system.h
> +++ b/include/sbi/sbi_system.h
> @@ -41,6 +41,6 @@ void sbi_system_reset_add_device(struct sbi_system_reset_device *dev);
>
>  bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason);
>
> -void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason);
> +void sbi_system_reset(u32 reset_type, u32 reset_reason);
>
>  #endif
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> index 9cea3c0..5c328fb 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -62,12 +62,23 @@ bool sbi_system_reset_supported(u32 reset_type, u32 reset_reason)
>         return !!sbi_system_reset_get_device(reset_type, reset_reason);
>  }
>
> -void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
> +void sbi_system_reset(u32 reset_type, u32 reset_reason)
>  {
>         ulong hbase = 0, hmask;
>         u32 cur_hartid = current_hartid();
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> +       const struct sbi_system_reset_device *dev =
> +               sbi_system_reset_get_device(reset_type, reset_reason);
> +
> +       /* Check if domain allows system reset */
> +       if (!dom->system_reset_allowed)
> +               return;
> +
> +       /* Check if we have a reset device supporting the reset type */
> +       dev = sbi_system_reset_get_device(reset_type, reset_reason);
> +       if (!dev)
> +               return;
>
>         /* Send HALT IPI to every hart other than the current hart */
>         while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &hmask)) {
> @@ -81,13 +92,8 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
>         /* Stop current HART */
>         sbi_hsm_hart_stop(scratch, FALSE);
>
> -       /* Platform specific reset if domain allowed system reset */
> -       if (dom->system_reset_allowed) {
> -               const struct sbi_system_reset_device *dev =
> -                       sbi_system_reset_get_device(reset_type, reset_reason);
> -               if (dev)
> -                       dev->system_reset(reset_type, reset_reason);
> -       }
> +       /* Execute platform specific reset */
> +       dev->system_reset(reset_type, reset_reason);
>
>         /* If platform specific reset did not work then do sbi_exit() */
>         sbi_exit(scratch);
> --
> 2.32.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

