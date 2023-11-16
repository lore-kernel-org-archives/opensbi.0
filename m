From: Anup Patel <anup@brainfault.org>
Date: Thu, 16 Nov 2023 15:46:41 +0530
Subject: [PATCH v3 1/3] lib: utils/timer: Allow ACLINT MTIMER driver to
 setup quirks
In-Reply-To: <IA1PR20MB495301D1E80A07F9C6F0CB4FBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495397CC87AD8A595B45131CBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495301D1E80A07F9C6F0CB4FBBB0A@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy3oZW=N0PzSAibRj53K-njkaHWkLDe8-kQ8E5hBkp9aJA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 16, 2023 at 2:36?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> The quirks checking will cause ACLINT step into a CLINT code path, this
> is not expected when ACLINT needs custom quirks.
>
> Add a new quirk to identify custom ACLINT, and apply the general quirks
> after applying CLINT specific quirks.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/timer/fdt_timer_mtimer.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/lib/utils/timer/fdt_timer_mtimer.c b/lib/utils/timer/fdt_timer_mtimer.c
> index 9eaa11d..29560fb 100644
> --- a/lib/utils/timer/fdt_timer_mtimer.c
> +++ b/lib/utils/timer/fdt_timer_mtimer.c
> @@ -16,6 +16,7 @@
>  #include <sbi_utils/timer/aclint_mtimer.h>
>
>  struct timer_mtimer_quirks {
> +       bool            custom_aclint;
>         unsigned int    mtime_offset;
>         bool            has_64bit_mmio;
>         bool            without_mtime;
> @@ -36,6 +37,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>         unsigned long addr[2], size[2];
>         struct timer_mtimer_node *mtn, *n;
>         struct aclint_mtimer_data *mt;
> +       const struct timer_mtimer_quirks *quirks = match->data;
>
>         mtn = sbi_zalloc(sizeof(*mtn));
>         if (!mtn)
> @@ -58,9 +60,7 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>                 return rc;
>         }
>
> -       if (match->data) { /* SiFive CLINT */
> -               const struct timer_mtimer_quirks *quirks = match->data;
> -
> +       if (quirks && !quirks->custom_aclint) { /* SiFive CLINT */
>                 /* Set CLINT addresses */
>                 mt->mtimecmp_addr = addr[0] + ACLINT_DEFAULT_MTIMECMP_OFFSET;
>                 mt->mtimecmp_size = ACLINT_DEFAULT_MTIMECMP_SIZE;
> @@ -74,8 +74,6 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>                         mt->mtime_addr = mt->mtime_size = 0;
>                 }
>                 mt->mtimecmp_addr += quirks->mtime_offset;
> -               /* Apply additional CLINT quirks */
> -               mt->has_64bit_mmio = quirks->has_64bit_mmio;
>         } else { /* RISC-V ACLINT MTIMER */
>                 /* Set ACLINT MTIMER addresses */
>                 mt->mtime_addr = addr[0];
> @@ -84,6 +82,11 @@ static int timer_mtimer_cold_init(void *fdt, int nodeoff,
>                 mt->mtimecmp_size = size[1];
>         }
>
> +       /* Apply additional quirks */
> +       if (quirks) {
> +               mt->has_64bit_mmio = quirks->has_64bit_mmio;
> +       }
> +
>         /* Check if MTIMER device has shared MTIME address */
>         if (mt->mtime_size) {
>                 mt->has_shared_mtime = false;
> --
> 2.42.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

