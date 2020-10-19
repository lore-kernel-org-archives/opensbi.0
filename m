From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 19 Oct 2020 16:16:02 -0700
Subject: [PATCH v3 10/16] lib: sbi: Extend sbi_system_reset() for domains
In-Reply-To: <20201019125453.2460105-11-anup.patel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
 <20201019125453.2460105-11-anup.patel@wdc.com>
Message-ID: <CAOnJCUJjvdZDETbGLA8jW__Yj6BbOzQ2vMekqmoC0emzd8mEQw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 19, 2020 at 5:56 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The sbi_system_reset() should issue platform system reset only if
> domain of current HART is allowed to do system reset.
>
> This patch extends sbi_system_reset() as-per above.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/sbi/sbi_system.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> index a938003..96290b3 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -37,9 +37,10 @@ void __noreturn sbi_system_reset(u32 platform_reset_type)
>         /* Stop current HART */
>         sbi_hsm_hart_stop(scratch, FALSE);
>
> -       /* Platform specific reset */
> -       sbi_platform_system_reset(sbi_platform_ptr(scratch),
> -                                 platform_reset_type);
> +       /* Platform specific reset if domain allowed system reset */
> +       if (dom->system_reset_allowed)
> +               sbi_platform_system_reset(sbi_platform_ptr(scratch),
> +                                         platform_reset_type);
>
>         /* If platform specific reset did not work then do sbi_exit() */
>         sbi_exit(scratch);
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

