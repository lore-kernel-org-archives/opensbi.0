From: Alistair Francis <Alistair.Francis@wdc.com>
Date: Mon, 19 Oct 2020 17:53:42 +0000
Subject: [PATCH v3 03/16] lib: sbi: Configure PMP late in coldboot and
 warmboot path
In-Reply-To: <20201019125453.2460105-4-anup.patel@wdc.com>
References: <20201019125453.2460105-1-anup.patel@wdc.com>
 <20201019125453.2460105-4-anup.patel@wdc.com>
Message-ID: <327a724145bbe0a36de28ab761624053f783a40c.camel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 2020-10-19 at 18:24 +0530, Anup Patel wrote:
> We factor-out PMP configuration from sbi_hart_init() as a separate
> sbi_hart_pmp_configure() function and do the PMP configuration very
> late in coldboot and warmboot path just before platform_final_init().
> 
> Eventually, this enable us to configure PMP totally based on OpenSBI
> domain where OpenSBI domains can be parsed from device-tree in any of
> the platform operations except platform_final_init().
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  include/sbi/sbi_hart.h | 1 +
>  lib/sbi/sbi_hart.c     | 4 ++--
>  lib/sbi/sbi_init.c     | 8 ++++++++
>  3 files changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 0ba68f0..9207f4c 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -45,6 +45,7 @@ void sbi_hart_pmp_dump(struct sbi_scratch
> *scratch);
>  int  sbi_hart_pmp_check_addr(struct sbi_scratch *scratch,
>  			     unsigned long daddr, unsigned long mode,
>  			     unsigned long attr);
> +int sbi_hart_pmp_configure(struct sbi_scratch *scratch);
>  bool sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long
> feature);
>  void sbi_hart_get_features_str(struct sbi_scratch *scratch,
>  			       char *features_str, int nfstr);
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index edf79b7..7244f1c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -224,7 +224,7 @@ int sbi_hart_pmp_check_addr(struct sbi_scratch
> *scratch,
>  	return SBI_OK;
>  }
>  
> -static int pmp_init(struct sbi_scratch *scratch, u32 hartid)
> +int sbi_hart_pmp_configure(struct sbi_scratch *scratch)
>  {
>  	u32 pmp_idx = 0;
>  	unsigned long fw_start, fw_size_log2;
> @@ -462,7 +462,7 @@ int sbi_hart_init(struct sbi_scratch *scratch,
> u32 hartid, bool cold_boot)
>  	if (rc)
>  		return rc;
>  
> -	return pmp_init(scratch, hartid);
> +	return 0;
>  }
>  
>  void __attribute__((noreturn)) sbi_hart_hang(void)
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> index 65d81ba..85a5f13 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -210,6 +210,10 @@ static void __noreturn init_coldboot(struct
> sbi_scratch *scratch, u32 hartid)
>  	if (rc)
>  		sbi_hart_hang();
>  
> +	rc = sbi_hart_pmp_configure(scratch);
> +	if (rc)
> +		sbi_hart_hang();
> +
>  	rc = sbi_platform_final_init(plat, TRUE);
>  	if (rc)
>  		sbi_hart_hang();
> @@ -266,6 +270,10 @@ static void __noreturn init_warmboot(struct
> sbi_scratch *scratch, u32 hartid)
>  	if (rc)
>  		sbi_hart_hang();
>  
> +	rc = sbi_hart_pmp_configure(scratch);
> +	if (rc)
> +		sbi_hart_hang();
> +
>  	rc = sbi_platform_final_init(plat, FALSE);
>  	if (rc)
>  		sbi_hart_hang();
