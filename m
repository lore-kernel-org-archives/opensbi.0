From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 23 Feb 2021 15:46:20 -0800
Subject: [RFC PATCH 07/10] include: sbi: Add hart_suspend() platform
 callback
In-Reply-To: <20210221085321.180602-8-anup.patel@wdc.com>
References: <20210221085321.180602-1-anup.patel@wdc.com>
 <20210221085321.180602-8-anup.patel@wdc.com>
Message-ID: <CAOnJCUKE4Vp7iv9ACMyRgOEfhLzrKv4sDwnEsXNwATETDxeWzA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Feb 21, 2021 at 12:54 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add hart_suspend() callback in platform operations which will
> be used by HSM implementation to enter retentive or non-retentive
> suspend state.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  include/sbi/sbi_platform.h | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index cc7e3ff..ede3fb3 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -139,6 +139,11 @@ struct sbi_platform_operations {
>          * return if success.
>          */
>         int (*hart_stop)(void);
> +       /**
> +        * Put the current hart in platform specific suspend (or low-power)
> +        * state.
> +        */
> +       int (*hart_suspend)(u32 suspend_type, ulong raddr);
>

suspend_type should be u32 or XLEN ? The spec mentioned both at
different places.
I noticed that it is defined as unsigned long in the next patch as well.

>         /* Check whether reset type and reason supported by the platform */
>         int (*system_reset_check)(u32 reset_type, u32 reset_reason);
> @@ -370,6 +375,31 @@ static inline int sbi_platform_hart_stop(const struct sbi_platform *plat)
>         return SBI_ENOTSUPP;
>  }
>
> +/**
> + * Put the current hart in platform specific suspend (or low-power) state.
> + *
> + * For successful retentive suspend, the call will return 0 when the hart
> + * resumes normal execution.
> + *
> + * For successful non-retentive suspend, the hart will resume from specified
> + * resume address
> + *
> + * @param plat pointer to struct sbi_platform
> + * @param suspend_type the type of suspend
> + * @param raddr physical address where the hart can resume in M-mode after
> + * non-retantive suspend
> + *
> + * @return 0 if sucessful and negative error code on failure

/s/sucessful/successful


> + */
> +static inline int sbi_platform_hart_suspend(const struct sbi_platform *plat,
> +                                           u32 suspend_type, ulong raddr)
> +{
> +       if (plat && sbi_platform_ops(plat)->hart_suspend)
> +               return sbi_platform_ops(plat)->hart_suspend(suspend_type,
> +                                                           raddr);
> +       return SBI_ENOTSUPP;
> +}
> +
>  /**
>   * Early initialization for current HART
>   *
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Other than that,

Reviewed-by: Atish Patra <atish.patra@wdc.com>

--
Regards,
Atish

