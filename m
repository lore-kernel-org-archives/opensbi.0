From: Xiang W <wxjstz@126.com>
Date: Mon, 14 Aug 2023 19:40:59 +0800
Subject: [PATCH] platform: Allow platforms to specify the size of tlb
 fifo
In-Reply-To: <20230814065937.85317-1-wxjstz@126.com>
References: <20230814065937.85317-1-wxjstz@126.com>
Message-ID: <b8fc1acac828ce2ce3671af1c2f9909b0254e3f4.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-08-14???? 14:59 +0800?Xiang W???
> For some platforms with a particularly high number of harts, if the
> tlb fifo is too small, it case harts to wait. Platforms should be
> allowed to specify the size of the tlb fifo.
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
Sorry, I split the two patches into two emails.

Please review at:
https://lists.infradead.org/pipermail/opensbi/2023-August/005483.html
https://lists.infradead.org/pipermail/opensbi/2023-August/005484.html
https://lists.infradead.org/pipermail/opensbi/2023-August/005485.html

Regards,
Xiang W
> ---
> ?include/sbi/sbi_platform.h | 29 +++++++++++++++++++++++++++++
> ?include/sbi/sbi_tlb.h????? |? 2 --
> ?lib/sbi/sbi_tlb.c????????? |? 4 ++--
> ?3 files changed, 31 insertions(+), 4 deletions(-)
> 
> diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
> index 3e9616f..5929042 100644
> --- a/include/sbi/sbi_platform.h
> +++ b/include/sbi/sbi_platform.h
> @@ -39,6 +39,8 @@
> ?#define SBI_PLATFORM_FIRMWARE_CONTEXT_OFFSET (0x60 + __SIZEOF_POINTER__)
> ?/** Offset of hart_index2id in struct sbi_platform */
> ?#define SBI_PLATFORM_HART_INDEX2ID_OFFSET (0x60 + (__SIZEOF_POINTER__ * 2))
> +/** Offset of tlb_fifo_num_entries in struct sbi_platform */
> +#define SBI_PLARFORM_TLB_FIFO_NUM_ENTRIES (0x60 + (__SIZEOF_POINTER__ * 3))
> ?
> ?#define SBI_PLATFORM_TLB_RANGE_FLUSH_LIMIT_DEFAULT		(1UL << 12)
> ?
> @@ -192,6 +194,15 @@ struct sbi_platform {
> ?	 * 2. HART id < SBI_HARTMASK_MAX_BITS
> ?	 */
> ?	const u32 *hart_index2id;
> +
> +	/**
> +	 * For some systems with too many harts, too small tlb fifo
> +	 * may cause harts to wait. For such systems, this number
> +	 * can be increased.
> +	 *
> +	 * This value can be change in platform_override->fw_init
> +	*/
> +	u32 tlb_fifo_num_entries;
> ?};
> ?
> ?/**
> @@ -243,6 +254,11 @@ _Static_assert(
> ?		== SBI_PLATFORM_HART_INDEX2ID_OFFSET,
> ?	"struct sbi_platform definition has changed, please redefine "
> ?	"SBI_PLATFORM_HART_INDEX2ID_OFFSET");
> +_Static_assert(
> +	offsetof(struct sbi_platform, tlb_fifo_num_entries)
> +		== SBI_PLARFORM_TLB_FIFO_NUM_ENTRIES,
> +	"struct sbi_platform definition has changed, please redefine "
> +	"SBI_PLARFORM_TLB_FIFO_NUM_ENTRIES");
> ?
> ?/** Get pointer to sbi_platform for sbi_scratch pointer */
> ?#define sbi_platform_ptr(__s) \
> @@ -370,6 +386,19 @@ static inline bool sbi_platform_hart_invalid(const struct sbi_platform *plat,
> ?		return true;
> ?	return false;
> ?}
> +/**
> + * Get number of tlb fifo entries
> + *
> + * @param plat pointer to struct sbi_platform
> + *
> + * @return number of tlb fifo entries
> +*/
> +static inline u32 sbi_platform_tlb_fifo_num_entries(const struct sbi_platform *plat)
> +{
> +	if(plat && plat->tlb_fifo_num_entries)
> +		return plat->tlb_fifo_num_entries;
> +	return 8;
> +}
> ?
> ?/**
> ? * Check whether given HART is allowed to do cold boot
> diff --git a/include/sbi/sbi_tlb.h b/include/sbi/sbi_tlb.h
> index 48f1962..55dcab0 100644
> --- a/include/sbi/sbi_tlb.h
> +++ b/include/sbi/sbi_tlb.h
> @@ -20,8 +20,6 @@
> ?
> ?/* clang-format on */
> ?
> -#define SBI_TLB_FIFO_NUM_ENTRIES		8
> -
> ?struct sbi_scratch;
> ?
> ?struct sbi_tlb_info {
> diff --git a/lib/sbi/sbi_tlb.c b/lib/sbi/sbi_tlb.c
> index 26a87f3..92648da 100644
> --- a/lib/sbi/sbi_tlb.c
> +++ b/lib/sbi/sbi_tlb.c
> @@ -422,7 +422,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
> ?			return SBI_ENOMEM;
> ?		}
> ?		tlb_fifo_mem_off = sbi_scratch_alloc_offset(
> -				SBI_TLB_FIFO_NUM_ENTRIES * SBI_TLB_INFO_SIZE);
> +				sbi_platform_tlb_fifo_num_entries(plat) * SBI_TLB_INFO_SIZE);
> ?		if (!tlb_fifo_mem_off) {
> ?			sbi_scratch_free_offset(tlb_fifo_off);
> ?			sbi_scratch_free_offset(tlb_sync_off);
> @@ -453,7 +453,7 @@ int sbi_tlb_init(struct sbi_scratch *scratch, bool cold_boot)
> ?	ATOMIC_INIT(tlb_sync, 0);
> ?
> ?	sbi_fifo_init(tlb_q, tlb_mem,
> -		????? SBI_TLB_FIFO_NUM_ENTRIES, SBI_TLB_INFO_SIZE);
> +		????? sbi_platform_tlb_fifo_num_entries(plat), SBI_TLB_INFO_SIZE);
> ?
> ?	return 0;
> ?}
> -- 
> 2.40.1
> 
> 


