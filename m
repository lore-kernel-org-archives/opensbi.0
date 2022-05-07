From: Anup Patel <anup@brainfault.org>
Date: Sat, 7 May 2022 22:20:21 +0530
Subject: [PATCH] lib: utils/fdt: check for CPU status property
In-Reply-To: <CALXH3=KtzYkUTR8_NxR7edRAtPE92bzj90tgUzihy0FyBUB-HQ@mail.gmail.com>
References: <CALXH3=KtzYkUTR8_NxR7edRAtPE92bzj90tgUzihy0FyBUB-HQ@mail.gmail.com>
Message-ID: <CAAhSdy2_61mmXvdKyw3HavvzeeKHPZBTVE-CU5jzVTuV=RAMfA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 29, 2022 at 5:35 PM Jan Reme? <jan.remes@codasip.com> wrote:
>
> The nodes in the FDT that have a "status" property should be
> ignored when this property is not "ok" or "okay".
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>

Failing fdt_parse_hart_id() for disabled CPUs does not look
natural and can break things.

For example, let's say we have 1 core disabled out of 4 cores
then fdt_parse_aclint_node() would return 3 cores but the
ACLINT hardware might have 4 registers (one for each core)
and one of the register (corresponding to disabled core)
should not be used.

I suggest we should have a separate function to check
whether node is enabled/disabled (e.g.
bool fdt_node_is_enabled(void *fdt, int nodeoff)). This
functions should be used all places where applicable.

Regards,
Anup

> ---
>  lib/utils/fdt/fdt_helper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 9a35969..77dac1f 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -231,6 +231,14 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset,
> u32 *hartid)
>         if (strncmp (prop, "cpu", strlen ("cpu")))
>                 return SBI_EINVAL;
>
> +       prop = fdt_getprop(fdt, cpu_offset, "status", NULL);
> +       if (prop) {
> +               if (strncmp(prop, "okay", strlen("okay")) &&
> +                   strncmp(prop, "ok", strlen("ok"))) {
> +                       return SBI_EINVAL;
> +               }
> +       }
> +
>         val = fdt_getprop(fdt, cpu_offset, "reg", &len);
>         if (!val || len < sizeof(fdt32_t))
>                 return SBI_EINVAL;
> --
> 2.35.1
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

