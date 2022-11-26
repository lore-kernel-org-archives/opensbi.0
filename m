From: Xiang W <wxjstz@126.com>
Date: Sat, 26 Nov 2022 20:49:55 +0800
Subject: [PATCH 3/5] lib: fix fdt_parse_plmt_node()
In-Reply-To: <20221125140827.47018-4-heinrich.schuchardt@canonical.com>
References: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
	 <20221125140827.47018-4-heinrich.schuchardt@canonical.com>
Message-ID: <52b2e02b3de19605d3816c9ebbfd520561d94055.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2022-11-25???? 15:08 +0100?Heinrich Schuchardt???
> cpu_offset, cpu_intc_offset must int to discover failed invocations of
> fdt_node_offset_by_phandle() or fdt_parent_offset().
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/fdt/fdt_helper.c#L837
if (cpu_intc_offset < 0) should be if (cpu_offset < 0)

Regards,
Xiang W
> ---
> ?lib/utils/fdt/fdt_helper.c | 4 +++-
> ?1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 57c0248..ea969e5 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -805,7 +805,7 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
> ?{
> ????????const fdt32_t *val;
> ????????int rc, i, count;
> -???????uint64_t reg_addr, reg_size, cpu_offset, cpu_intc_offset;
> +???????uint64_t reg_addr, reg_size;
> ????????u32 phandle, hwirq, hartid, hcount;
> ?
> ????????if (nodeoffset < 0 || !fdt || !plmt_base ||
> @@ -826,6 +826,8 @@ int fdt_parse_plmt_node(void *fdt, int nodeoffset, unsigned long *plmt_base,
> ?
> ????????hcount = 0;
> ????????for (i = 0; i < (count / 2); i++) {
> +???????????????int cpu_offset, cpu_intc_offset;
> +
> ????????????????phandle = fdt32_to_cpu(val[2 * i]);
> ????????????????hwirq = fdt32_to_cpu(val[2 * i + 1]);
> ?
> -- 
> 2.37.2
> 
> 



