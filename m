From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 May 2022 09:41:04 +0530
Subject: [PATCH v3 1/3] lib: utils/fdt: introduce fdt_node_is_enabled()
In-Reply-To: <20220512175539.83942-2-jan.remes@codasip.com>
References: <20220512175539.83942-1-jan.remes@codasip.com>
 <20220512175539.83942-2-jan.remes@codasip.com>
Message-ID: <CAAhSdy3GXEGzMOjh-Ni7Wv4cLOAKuFvT6kiBpdM0mXTCXk68_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, May 12, 2022 at 11:26 PM Jan Remes <jan.remes@codasip.com> wrote:
>
> If an FDT node contains a "status" property and this property is not
> "ok" or "okay", this node should be ignored. Introduce a function that
> checks this.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>

I had already given Reviewed-by to this patch in v2. Please add various
Reviewed-by tags after your Signed-off-by when sending new patch version
so that we know which patches are already reviewed.

We also have patchwork setup for OpenSBI mailing list which also tracks
reviewed/acked patches.
(https://patchwork.ozlabs.org/project/opensbi/list/)

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
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
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

