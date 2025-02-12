From: Anup Patel <anup@brainfault.org>
Date: Wed, 12 Feb 2025 09:31:52 +0530
Subject: [PATCH v3] lib: utils:Check that hartid is valid
In-Reply-To: <20250211220042.222461-1-Raj.Vishwanathan@gmail.com>
References: <20250115234607.410148-1-Raj.Vishwanathan@gmail.com> <20250211220042.222461-1-Raj.Vishwanathan@gmail.com>
Message-ID: <CAAhSdy3RbtM573iM22ed8KjSiLnPXCyt6huuHnOx0tvejs5QMg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 12, 2025 at 3:30?AM Raj Vishwanathan
<raj.vishwanathan@gmail.com> wrote:
>
> It is possible that hartid may not be sequential and it should not be validated
> against SBI_HARTMASK_MAX_BITS. Instead we should check the index of the hartid, hart index, against SBI_HARTMASK_MAX_BITS.

Minor nit: Try to wrap the line around 75 characters

>
> Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Changes in V2:
>     Update: Make hart_count > SBI_HARTMASK_MAX_BITS a catastrophic failure.
>
> Changes in V1:
>     Ignore if hart_count is more than SBI_HARTMASK_MAX_BITS.
> ---
>  lib/utils/fdt/fdt_domain.c  | 2 +-
>  lib/utils/fdt/fdt_helper.c  | 6 +++---
>  platform/generic/platform.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_domain.c b/lib/utils/fdt/fdt_domain.c
> index 4bc7ed8..7d10d10 100644
> --- a/lib/utils/fdt/fdt_domain.c
> +++ b/lib/utils/fdt/fdt_domain.c
> @@ -471,7 +471,7 @@ static int __fdt_parse_domain(const void *fdt, int domain_offset, void *opaque)
>                 if (err)
>                         continue;
>
> -               if (SBI_HARTMASK_MAX_BITS <= val32)
> +               if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(val32))
>                         continue;
>
>                 if (!fdt_node_is_enabled(fdt, cpu_offset))
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..4673921 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -1032,7 +1032,7 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
>                 if (rc)
>                         continue;
>
> -               if (SBI_HARTMASK_MAX_BITS <= hartid)
> +               if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
>                         continue;
>
>                 if (match_hwirq == hwirq) {
> @@ -1097,7 +1097,7 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
>                 if (rc)
>                         continue;
>
> -               if (SBI_HARTMASK_MAX_BITS <= hartid)
> +               if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
>                         continue;
>
>                 if (hwirq == IRQ_M_TIMER)
> @@ -1153,7 +1153,7 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
>                 if (rc)
>                         continue;
>
> -               if (SBI_HARTMASK_MAX_BITS <= hartid)
> +               if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
>                         continue;
>
>                 if (hwirq == IRQ_M_SOFT)
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index c03ed88..027ec89 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -200,8 +200,8 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>                 if (rc)
>                         continue;
>
> -               if (SBI_HARTMASK_MAX_BITS <= hartid)
> -                       continue;
> +               if (SBI_HARTMASK_MAX_BITS <= hart_count)
> +                       break;
>
>                 if (!fdt_node_is_enabled(fdt, cpu_offset))
>                         continue;
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

