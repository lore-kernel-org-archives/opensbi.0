From: Xiang W <wxjstz@126.com>
Date: Wed, 19 Mar 2025 09:19:02 +0800
Subject: [PATCH v4] Set the scratch allocation to alignment to cacheline
 size.
In-Reply-To: <20250318185111.452620-1-Raj.Vishwanathan@gmail.com>
References: <20250127202017.1043240-1-Raj.Vishwanathan>
	 <20250318185111.452620-1-Raj.Vishwanathan@gmail.com>
Message-ID: <b5b17dea94ef28d7b3392ade6c8c4d18163b71f3.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-03-18?? 11:51 -0700?Raj Vishwanathan???
> We set the scratch allocation alignment to cacheline size,specified by
> riscv,cbom-block-size in the dts file to avoid two atomic variables from
> the same cache line causing livelock on some platforms. If the cacheline
> is not specified, we set it a default value.
> 
> Signed-off-by: Raj Vishwanathan <Raj.Vishwanathan@gmail.com>
LGTM

Reviewed-by: Xiang W <wxjstz@126.com>
> ---
> Changes in V3:
> ??? Remove platform specific references to 64 Bytes.
> Changes in V2:
> ??? Added a new configuration to get the alignment size.
> Change in V1:
> ??? Original Patch
> ---
> ?include/sbi/sbi_platform.h???????? |? 2 ++
> ?include/sbi_utils/fdt/fdt_helper.h |? 1 +
> ?lib/sbi/sbi_scratch.c????????????? | 27 +++++++++++++++++++++++++--
> ?lib/utils/fdt/fdt_helper.c???????? | 24 ++++++++++++++++++++++++
> ?platform/generic/platform.c??????? |? 7 +++++++
> ?5 files changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 6d5fbc7..0cea0fe 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -197,6 +197,8 @@ struct sbi_platform {
> ?	 * 2. HART id < SBI_HARTMASK_MAX_BITS
> ?	 */
> ?	const u32 *hart_index2id;
> +	/** Allocation alignment for Scratch */
> +	u32 cbom_block_size;
> ?};
> ?
> ?/**
> diff --git a/include/sbi_utils/fdt/fdt_helper.h b/include/sbi_utils/fdt/fdt_helper.h
> index 7329b84..0b82159 100644
> --- a/include/sbi_utils/fdt/fdt_helper.h
> +++ b/include/sbi_utils/fdt/fdt_helper.h
> @@ -55,6 +55,7 @@ bool fdt_node_is_enabled(const void *fdt, int nodeoff);
> ?
> ?int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid);
> ?
> +int fdt_parse_cbom_block_size(const void *fdt, int cpu_offset, u32 *cbom_block_size);
> ?int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid);
> ?
> ?int fdt_parse_timebase_frequency(const void *fdt, unsigned long *freq);
> diff --git a/lib/sbi/sbi_scratch.c b/lib/sbi/sbi_scratch.c
> index ccbbc68..fdb9e20 100644
> --- a/lib/sbi/sbi_scratch.c
> +++ b/lib/sbi/sbi_scratch.c
> @@ -14,6 +14,8 @@
> ?#include <sbi/sbi_scratch.h>
> ?#include <sbi/sbi_string.h>
> ?
> +#define DEFAULT_SCRATCH_ALLOC_ALIGN __SIZEOF_POINTER__
> +
> ?u32 last_hartindex_having_scratch = 0;
> ?u32 hartindex_to_hartid_table[SBI_HARTMASK_MAX_BITS + 1] = { -1U };
> ?struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0 };
> @@ -21,6 +23,20 @@ struct sbi_scratch *hartindex_to_scratch_table[SBI_HARTMASK_MAX_BITS + 1] = { 0
> ?static spinlock_t extra_lock = SPIN_LOCK_INITIALIZER;
> ?static unsigned long extra_offset = SBI_SCRATCH_EXTRA_SPACE_OFFSET;
> ?
> +static u32 sbi_get_scratch_alloc_align(void)
> +{
> +	const struct sbi_platform *plat;
> +	/*
> +	 * Get the alignment size. We will return DEFAULT_SCRATCH_ALLOC_ALIGNMENT
> +	 * or riscv,cbom_block_size
> +	 */
> +	plat = sbi_platform_thishart_ptr();
> +	if (!plat)
> +		return DEFAULT_SCRATCH_ALLOC_ALIGN;
> +	return plat->cbom_block_size ? plat->cbom_block_size : \
> +????????????????????????????????? DEFAULT_SCRATCH_ALLOC_ALIGN;
> +
> +}
> ?u32 sbi_hartid_to_hartindex(u32 hartid)
> ?{
> ?	u32 i;
> @@ -57,6 +73,7 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
> ?	void *ptr;
> ?	unsigned long ret = 0;
> ?	struct sbi_scratch *rscratch;
> +	u32 scratch_alloc_align = 0;
> ?
> ?	/*
> ?	 * We have a simple brain-dead allocator which never expects
> @@ -70,8 +87,14 @@ unsigned long sbi_scratch_alloc_offset(unsigned long size)
> ?	if (!size)
> ?		return 0;
> ?
> -	size += __SIZEOF_POINTER__ - 1;
> -	size &= ~((unsigned long)__SIZEOF_POINTER__ - 1);
> +	scratch_alloc_align = sbi_get_scratch_alloc_align();
> +
> +	/*
> +	 * We let the allocation align to cacheline bytes to avoid livelock on
> +	 * certain platforms due to atomic variables from the same cache line.
> +	 */
> +??? size += scratch_alloc_align - 1;
> +??? size &= ~((unsigned long)scratch_alloc_align - 1);
> ?
> ?	spin_lock(&extra_lock);
> ?
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cb350e5..bea4fdc 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -287,6 +287,30 @@ int fdt_parse_hart_id(const void *fdt, int cpu_offset, u32 *hartid)
> ?
> ?	return 0;
> ?}
> +int fdt_parse_cbom_block_size(const void *fdt,int cpu_offset,u32 *cbom_block_size)
> +{
> +??? int len;
> +??? const void *prop;
> +??? const fdt32_t *val;
> +
> +??? if (!fdt || cpu_offset < 0)
> +??????? return SBI_EINVAL;
> +
> +??? prop = fdt_getprop(fdt, cpu_offset, "device_type", &len);
> +??? if (!prop || !len)
> +??????? return SBI_EINVAL;
> +??? if (strncmp (prop, "cpu", strlen ("cpu")))
> +??????? return SBI_EINVAL;
> +
> +??? val = fdt_getprop(fdt, cpu_offset, "riscv,cbom-block-size", &len);
> +??? if (!val || len < sizeof(fdt32_t))
> +??????? return SBI_EINVAL;
> +
> +??? if (cbom_block_size)
> +??????? *cbom_block_size = fdt32_to_cpu(*val);
> +??? return 0;
> +
> +}
> ?
> ?int fdt_parse_max_enabled_hart_id(const void *fdt, u32 *max_hartid)
> ?{
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index c03ed88..0ff8d46 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -174,6 +174,8 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> ?	const void *fdt = (void *)arg1;
> ?	u32 hartid, hart_count = 0;
> ?	int rc, root_offset, cpus_offset, cpu_offset, len;
> +	u32 cbom_block_size = 0;
> +	u32 tmp=0;
> ?
> ?	root_offset = fdt_path_offset(fdt, "/");
> ?	if (root_offset < 0)
> @@ -207,11 +209,16 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
> ?			continue;
> ?
> ?		generic_hart_index2id[hart_count++] = hartid;
> +		rc = fdt_parse_cbom_block_size(fdt, cpu_offset,&tmp);
> +		if (rc)
> +			continue;
> +		cbom_block_size = MAX(tmp,cbom_block_size);
> ?	}
> ?
> ?	platform.hart_count = hart_count;
> ?	platform.heap_size = fw_platform_get_heap_size(fdt, hart_count);
> ?	platform_has_mlevel_imsic = fdt_check_imsic_mlevel(fdt);
> +	platform.cbom_block_size = cbom_block_size;
> ?
> ?	fw_platform_coldboot_harts_init(fdt);
> ?
> -- 
> 2.43.0
> 


