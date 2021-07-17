From: Anup Patel <anup@brainfault.org>
Date: Sat, 17 Jul 2021 14:16:25 +0530
Subject: [PATCH v4 1/5] lib: utils/fdt: Add fdt_parse_phandle_with_args()
 API
In-Reply-To: <20210713032345.2571-2-green.wan@sifive.com>
References: <20210713032345.2571-1-green.wan@sifive.com>
 <20210713032345.2571-2-green.wan@sifive.com>
Message-ID: <CAAhSdy3R-bZw9ipV4ngiFN4+4abM_5snv4K0BjLECTc3DhuvFQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 13, 2021 at 8:54 AM Green Wan <green.wan@sifive.com> wrote:
>
> From: Anup Patel <anup.patel@wdc.com>
>
> The libfdt project does not have a generic API to parse phandle
> with args from a DT node so we add fdt_parse_phandle_with_args()
> for this purpose. This new API will be useful to FDT based drivers.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
>  include/sbi_utils/fdt/fdt_helper.h | 11 +++++++
>  lib/utils/fdt/fdt_helper.c         | 47 ++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 871f9b9..55b9382 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -17,6 +17,13 @@ struct fdt_match {
>         void *data;
>  };
>
> +#define FDT_MAX_PHANDLE_ARGS 16
> +struct fdt_phandle_args {
> +       int node_offset;
> +       int args_count;
> +       u32 args[FDT_MAX_PHANDLE_ARGS];
> +};
> +
>  struct platform_uart_data {
>         unsigned long addr;
>         unsigned long freq;
> @@ -32,6 +39,10 @@ int fdt_find_match(void *fdt, int startoff,
>                    const struct fdt_match *match_table,
>                    const struct fdt_match **out_match);
>
> +int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
> +                               const char *prop, const char *cells_prop,
> +                               int index, struct fdt_phandle_args *out_args);
> +
>  int fdt_get_node_addr_size(void *fdt, int node, unsigned long *addr,
>                            unsigned long *size);
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index de77196..a970c0f 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -72,6 +72,53 @@ int fdt_find_match(void *fdt, int startoff,
>         return SBI_ENODEV;
>  }
>
> +int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
> +                               const char *prop, const char *cells_prop,
> +                               int index, struct fdt_phandle_args *out_args)
> +{
> +       u32 i, pcells;
> +       int len, pnodeoff;
> +       const fdt32_t *list, *list_end, *val;
> +
> +       if (!fdt || (nodeoff < 0) || !prop || !cells_prop || !out_args)
> +               return SBI_EINVAL;
> +
> +       list = fdt_getprop(fdt, nodeoff, prop, &len);
> +       if (!list)
> +               return SBI_ENOENT;
> +       list_end = list + (len / sizeof(*list));
> +
> +       while (list < list_end) {
> +               pnodeoff = fdt_node_offset_by_phandle(fdt,
> +                                               fdt32_to_cpu(*list));
> +               if (pnodeoff < 0)
> +                       return pnodeoff;
> +               list++;
> +
> +               val = fdt_getprop(fdt, pnodeoff, cells_prop, &len);
> +               if (!val)
> +                       return SBI_ENOENT;
> +               pcells = fdt32_to_cpu(*val);
> +               if (FDT_MAX_PHANDLE_ARGS < pcells)
> +                       return SBI_EINVAL;
> +               if (list + pcells > list_end)
> +                       return SBI_ENOENT;
> +
> +               if (index > 0) {
> +                       list += pcells;
> +                       index--;
> +               } else {
> +                       out_args->node_offset = pnodeoff;
> +                       out_args->args_count = pcells;
> +                       for (i = 0; i < pcells; i++)
> +                               out_args->args[i] = fdt32_to_cpu(list[i]);
> +                       return 0;
> +               }
> +       }
> +
> +       return SBI_ENOENT;
> +}
> +
>  static int fdt_translate_address(void *fdt, uint64_t reg, int parent,
>                                  unsigned long *addr)
>  {
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

