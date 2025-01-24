From: Xiang W <wxjstz@126.com>
Date: Fri, 24 Jan 2025 11:47:40 +0800
Subject: [PATCH 3/3] lib: sbi: fwft: Fix error return value for feature
 > 32 bits
In-Reply-To: <20250123160537.3420975-4-cleger@rivosinc.com>
References: <20250123160537.3420975-1-cleger@rivosinc.com>
	 <20250123160537.3420975-4-cleger@rivosinc.com>
Message-ID: <8faaa309c99f65acc84a4dce6c021c957eea6ea7.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2025-01-23?? 17:05 +0100?Cl?ment L?ger???
> Based on the spec, invalid feature should return SBI_ERR_INVALID_PARAM.
> This was not the case with the current implementation since the upper 32
> bits were not considered when checking the feature thus returning
> SBI_ERR_DENIED. Fix that by passing the raw unsigned long rather than
> the enum to be sure we are passing the full 64 bits and then check for
> upper bits to be cleared.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
> ?include/sbi/sbi_fwft.h |? 4 ++--
> ?lib/sbi/sbi_fwft.c???? | 11 ++++++++---
> ?2 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sbi/sbi_fwft.h b/include/sbi/sbi_fwft.h
> index 2148820e..a9caa863 100644
> --- a/include/sbi/sbi_fwft.h
> +++ b/include/sbi/sbi_fwft.h
> @@ -14,9 +14,9 @@
> ?
> ?struct sbi_scratch;
> ?
> -int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
> +int sbi_fwft_set(unsigned long feature, unsigned long value,
> ?		 unsigned long flags);
> -int sbi_fwft_get(enum sbi_fwft_feature_t feature, unsigned long *out_val);
> +int sbi_fwft_get(unsigned long feature, unsigned long *out_val);
> ?
> ?int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot);
> ?
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index c46006d4..7bf86d6d 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -287,12 +287,17 @@ static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
> ?	return NULL;
> ?}
> ?
> -static int fwft_get_feature(enum sbi_fwft_feature_t feature,
> +static int fwft_get_feature(unsigned long feature,
> ?			??? struct fwft_config **conf)
> ?{
> ?	int ret;
> ?	struct fwft_config *tconf;
> ?
> +	/* Feature are defined as 32 bits identifiers */
> +	if (feature & ~(BIT(32) - 1)) {
The macro expansion of BIT(32) is 1UL<<32. In RV32, unsigned long is 32 bits,?so
integer overflow will occur. It is recommended to replace BIT with BIT_ULL.

Regards,
Xiang W
> +		return SBI_EINVAL;
> +	}
> +
> ?	tconf = get_feature_config(feature);
> ?	if (!tconf) {
> ?		if (fwft_is_defined_feature(feature))
> @@ -323,7 +328,7 @@ static void fwft_clear_config_lock(enum sbi_fwft_feature_t feature)
> ?	conf->flags &= ~SBI_FWFT_SET_FLAG_LOCK;
> ?}
> ?
> -int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
> +int sbi_fwft_set(unsigned long feature, unsigned long value,
> ?		 unsigned long flags)
> ?{
> ?	int ret;
> @@ -348,7 +353,7 @@ int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
> ?	return SBI_OK;
> ?}
> ?
> -int sbi_fwft_get(enum sbi_fwft_feature_t feature, unsigned long *out_val)
> +int sbi_fwft_get(unsigned long feature, unsigned long *out_val)
> ?{
> ?	int ret;
> ?	struct fwft_config *conf;
> -- 
> 2.47.1
> 
> 


