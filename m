From: Anup Patel <anup@brainfault.org>
Date: Thu, 30 Sep 2021 09:21:01 +0530
Subject: [RFC PATCH 2/2] lib: sbi: add priority for reset handler
In-Reply-To: <20210929094151.26639-3-nikita.shubin@maquefel.me>
References: <20210929094151.26639-1-nikita.shubin@maquefel.me>
 <20210929094151.26639-3-nikita.shubin@maquefel.me>
Message-ID: <CAAhSdy1TVSyQs3kDqHo5277PSmxYzyeGVRmNF2=bzZoZm56A1Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 29, 2021 at 3:12 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Let's make system_reset_check returning priority instead of only
> true/false. In that case 0 - means not supported, and anything above
> means priority that makes existing reset handlers being used in first
> place, unless it is decided to lower their priority.
>
> The handler with the least priority wins.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>
> ---
>  lib/sbi/sbi_system.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> index 92bc0ac..a82c4ef 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -55,6 +55,8 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)

Instead of changing sbi_system_reset(), the sbi_system_reset_get_device()
can return "sbi_system_reset_device *" with highest non-zero priority.

>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>         struct sbi_dlist *pos;
> +       struct sbi_system_reset_device *reset_dev = 0;
> +       int priority = 255;
>
>         /* Send HALT IPI to every hart other than the current hart */
>         while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &hmask)) {
> @@ -70,12 +72,22 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
>
>         /* Check each reset device registered for supported reset type */
>         sbi_list_for_each(pos, &(reset_devices_list)) {
> -               struct sbi_system_reset_device *dev =
> -                       to_system_reset_device(pos);
> -               if (dev->system_reset_check(reset_type, reset_reason))
> -                       dev->system_reset(reset_type, reset_reason);
> +               struct sbi_system_reset_device *dev
> +                       = to_system_reset_device(pos);
> +               int status = dev->system_reset_check(reset_type, reset_reason);
> +
> +               if (status == 0)
> +                       continue;
> +
> +               if (status < priority) {

This is counter intuitive because lower value means higher priority.

Instead, I suggest to have following priority semantics:
1) 0 means not support
2) higher value means higher priority

> +                       reset_dev = dev;
> +                       priority = status;
> +               }
>         }
>
> +       if (reset_dev)
> +               reset_dev->system_reset(reset_type, reset_reason);
> +
>         /* If platform specific reset did not work then do sbi_exit() */
>         sbi_exit(scratch);
>  }
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

