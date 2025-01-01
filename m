From: Xiang W <wxjstz@126.com>
Date: Wed, 01 Jan 2025 20:23:45 +0800
Subject: [PATCH] lib: utils/irqchip: Optimize `fdt_parse_aplic_node`
 function
In-Reply-To: <20241231081223.111470-1-huangborong@bosc.ac.cn>
References: <20241231081223.111470-1-huangborong@bosc.ac.cn>
Message-ID: <039a16dc607747517c6f1421f8320c9b6eaa886b.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-12-31?? 16:12 +0800?Huang Borong???
> - Remove redundant memset for the "aplic" parameter
> - Initialize "imsic" with zero
> 
> Signed-off-by: Huang Borong <huangborong@bosc.ac.cn>
> ---
> ?lib/utils/fdt/fdt_helper.c | 3 +--
> ?1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..e92484c 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -630,14 +630,13 @@ int fdt_parse_aplic_node(const void *fdt, int nodeoff, struct aplic_data *aplic)
> ?	bool child_found;
> ?	const fdt32_t *val;
> ?	const fdt32_t *del;
> -	struct imsic_data imsic;
> +	struct imsic_data imsic = { 0 };
> ?	int i, j, d, dcnt, len, noff, rc;
> ?	uint64_t reg_addr, reg_size;
> ?	struct aplic_delegate_data *deleg;
> ?
> ?	if (nodeoff < 0 || !aplic || !fdt)
> ?		return SBI_ENODEV;
> -	memset(aplic, 0, sizeof(*aplic));
Why?
Is it because the passed in apic is created using sbi_zalloc?
I think it should be kept to ensure that there are no problems
when calling fdt_parse_aplic_node elsewhere.

Regards,
Xiang W

> ?
> ?	rc = fdt_get_node_addr_size(fdt, nodeoff, 0, &reg_addr, &reg_size);
> ?	if (rc < 0 || !reg_addr || !reg_size)
> -- 
> 2.34.1
> 
> 


