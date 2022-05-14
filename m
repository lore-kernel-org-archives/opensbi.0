From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 May 2022 15:16:22 +0530
Subject: [PATCH v4 1/4] lib: utils/fdt: introduce fdt_node_is_enabled()
In-Reply-To: <20220513105843.5139-2-jan.remes@codasip.com>
References: <20220513105843.5139-1-jan.remes@codasip.com>
 <20220513105843.5139-2-jan.remes@codasip.com>
Message-ID: <CAAhSdy0_RJk0hXkwdfXW1sxH-RppJNeMVWSaOF_aNB1mZoV_nw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, May 13, 2022 at 4:28 PM Jan Remes <jan.remes@codasip.com> wrote:
>
> If an FDT node contains a "status" property and this property is not
> "ok" or "okay", this node should be ignored. Introduce a function that
> checks this.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi_utils/fdt/fdt_helper.h |  2 ++
>  lib/utils/fdt/fdt_helper.c         | 18 ++++++++++++++++++
>  2 files changed, 20 insertions(+)
>
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 2279f96..a9c0a8a 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -48,6 +48,8 @@ int fdt_parse_phandle_with_args(void *fdt, int nodeoff,
>  int fdt_get_node_addr_size(void *fdt, int node, int index,
>                            uint64_t *addr, uint64_t *size);
>
> +bool fdt_node_is_enabled(void *fdt, int nodeoff);
> +
>  int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid);
>
>  int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid);
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 9a35969..3b45ae8 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -216,6 +216,24 @@ int fdt_get_node_addr_size(void *fdt, int node, int index,
>         return 0;
>  }
>
> +bool fdt_node_is_enabled(void *fdt, int nodeoff)
> +{
> +       int len;
> +       const void *prop;
> +
> +       prop = fdt_getprop(fdt, nodeoff, "status", &len);
> +       if (!prop)
> +               return true;
> +
> +       if (!strncmp(prop, "okay", strlen("okay")))
> +               return true;
> +
> +       if (!strncmp(prop, "ok", strlen("ok")))
> +               return true;
> +
> +       return false;
> +}
> +
>  int fdt_parse_hart_id(void *fdt, int cpu_offset, u32 *hartid)
>  {
>         int len;
> --
> 2.36.1
>

