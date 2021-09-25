From: Xiang W <wxjstz@126.com>
Date: Sat, 25 Sep 2021 15:27:38 +0800
Subject: [PATCH v3 1/5] lib: utils/fdt: Add
 fdt_parse_timebase_frequency() function
In-Reply-To: <20210925043735.686518-2-anup.patel@wdc.com>
References: <20210925043735.686518-1-anup.patel@wdc.com>
 <20210925043735.686518-2-anup.patel@wdc.com>
Message-ID: <bc5519354181f6ee97549e21befbf25344fb8fe5.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2021-09-25???? 10:07 +0530?Anup Patel???
> We add fdt_parse_timebase_frequency() function which can be used
> by ACLINT mtimer driver and platform code to get timebase frequency.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> ?include/sbi_utils/fdt/fdt_helper.h |? 2 ++
> ?lib/utils/fdt/fdt_helper.c???????? | 21 +++++++++++++++++++++
> ?2 files changed, 23 insertions(+)
> 
> diff --git a/include/sbi_utils/fdt/fdt_helper.h
> b/include/sbi_utils/fdt/fdt_helper.h
> index 2246254..5cb7340 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -50,6 +50,8 @@ int fdt_parse_hart_id(void *fdt, int cpu_offset,
> u32 *hartid);
> ?
> ?int fdt_parse_max_hart_id(void *fdt, u32 *max_hartid);
> ?
> +int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq);
> +
> ?int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> ????????????????????????????????struct platform_uart_data *uart);
> ?
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 5628337..5bf4021 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -269,6 +269,27 @@ int fdt_parse_max_hart_id(void *fdt, u32
> *max_hartid)
> ????????return 0;
> ?}
> ?
> +int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
> +{
> +???????const fdt32_t *val;
> +???????int len, cpus_offset;
> +
> +???????if (!fdt || !freq)
> +???????????????return SBI_EINVAL;
> +
> +???????cpus_offset = fdt_path_offset(fdt, "/cpus");
> +???????if (cpus_offset < 0)
> +???????????????return cpus_offset;
> +
> +???????val = fdt_getprop(fdt, cpus_offset, "timebase-frequency",
> &len);
> +???????if (len > 0 && val)
> +???????????????*freq = fdt32_to_cpu(*val);
> +???????else
> +???????????????return SBI_ENOENT;
> +
> +???????return 0;
> +}
> +
> ?int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> ????????????????????????????????struct platform_uart_data *uart)
> ?{
> -- 
> 2.25.1
> 
> 



