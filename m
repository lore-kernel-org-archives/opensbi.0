From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 24 Mar 2025 16:37:14 +0100
Subject: [PATCH v2 4/4] lib: sbi: Clear lock only for local events
In-Reply-To: <20250124165202.465445-5-cleger@rivosinc.com>
References: <20250124165202.465445-1-cleger@rivosinc.com>
 <20250124165202.465445-5-cleger@rivosinc.com>
Message-ID: <20250324-1bebff0668faab3ab96620ac@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 24, 2025 at 05:51:59PM +0100, Cl?ment L?ger wrote:
> Upon hart reset, only the local events state should be reset. While this
> implicitely worked since fwft_get_feature() return NULL for global
> events this is a bit fragile to do so. Additionally, the loop on feature
> list plus the call to fwft_get_feature was unneeded since we already have
> a direct access to the fwft hart state and thus can directly reset lock
> flags for each config. Lastly, we can only clear the lock when the fwft
> hart state was already allocated, in the other case, it is allocated with
> a zalloc which guarantees us that the feature flags are clear at boot.
> 
> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> ---
>  lib/sbi/sbi_fwft.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
> index 85f8a638..d946e9db 100644
> --- a/lib/sbi/sbi_fwft.c
> +++ b/lib/sbi/sbi_fwft.c
> @@ -271,12 +271,17 @@ static int fwft_get_pmlen(struct fwft_config *conf, unsigned long *value)
>  }
>  #endif
>  
> +static bool fwft_feature_is_global(enum sbi_fwft_feature_t feature)
> +{
> +	return feature & SBI_FWFT_GLOBAL_FEATURE_BIT;
> +}
> +
>  static struct fwft_config* get_feature_config(enum sbi_fwft_feature_t feature)
>  {
>  	int i;
>  	struct fwft_hart_state *fhs = fwft_thishart_state_ptr();
>  
> -	if (feature & SBI_FWFT_GLOBAL_FEATURE_BIT)
> +	if (fwft_feature_is_global(feature))
>  		return NULL;
>  
>  	for (i = 0; i < fhs->config_count; i++){
> @@ -315,16 +320,18 @@ static int fwft_get_feature(unsigned long feature,
>  	return SBI_SUCCESS;
>  }
>  
> -static void fwft_clear_config_lock(enum sbi_fwft_feature_t feature)
> +static void fwft_clear_local_lock(struct fwft_hart_state *fhs)
>  {
> -	int ret;
> +	int i;
>  	struct fwft_config *conf;
>  
> -	ret = fwft_get_feature(feature, &conf);
> -	if (ret)
> -		return;
> +	for (i = 0; i < fhs->config_count; i++) {
> +		conf = &fhs->configs[i];
> +		if (fwft_feature_is_global(conf->feature->id))
> +			continue;
>  
> -	conf->flags &= ~SBI_FWFT_SET_FLAG_LOCK;
> +		conf->flags &= ~SBI_FWFT_SET_FLAG_LOCK;
> +	}
>  }
>  
>  int sbi_fwft_set(unsigned long feature, unsigned long value,
> @@ -428,10 +435,9 @@ int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
>  			fhs->configs[i].feature = &features[i];
>  
>  		fwft_set_hart_state_ptr(scratch, fhs);
> +	} else {
> +		fwft_clear_local_lock(fhs);
>  	}
>  
> -	for (i = 0; i < array_size(features); i++)
> -		fwft_clear_config_lock(features[i].id);
> -
>  	return 0;
>  }
> -- 
> 2.47.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

