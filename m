From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 13 Apr 2021 05:26:22 +0000
Subject: [PATCH v2 7/7] lib: sbi: Make sbi_domain_memregion_initfw() a
 local function
In-Reply-To: <20210412121617.933493-8-anup.patel@wdc.com>
References: <20210412121617.933493-1-anup.patel@wdc.com>
 <20210412121617.933493-8-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201BE85F25B52630618CEC48D4F9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 12 April 2021 17:46
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Anup
> Patel <Anup.Patel@wdc.com>; Xiang W <wxjstz@126.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Subject: [PATCH v2 7/7] lib: sbi: Make sbi_domain_memregion_initfw() a
> local function
> 
> The sbi_domain_memregion_initfw() is no longer used outside sbi_domain.c
> so let's make it a local function.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  include/sbi/sbi_domain.h | 3 ---
>  lib/sbi/sbi_domain.c     | 4 ++--
>  2 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h index
> 27316de..15e3a53 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -127,9 +127,6 @@ bool sbi_domain_is_assigned_hart(const struct
> sbi_domain *dom, u32 hartid);  ulong
> sbi_domain_get_assigned_hartmask(const struct sbi_domain *dom,
>  				       ulong hbase);
> 
> -/** Initialize a domain memory region as firmware region */ -void
> sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg);
> -
>  /**
>   * Initialize a domain memory region based on it's physical
>   * address and size.
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> c95c3c3..69a3795 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -64,7 +64,7 @@ ulong sbi_domain_get_assigned_hartmask(const struct
> sbi_domain *dom,
>  	return ret;
>  }
> 
> -void sbi_domain_memregion_initfw(struct sbi_domain_memregion *reg)
> +static void domain_memregion_initfw(struct sbi_domain_memregion *reg)
>  {
>  	if (!reg)
>  		return;
> @@ -598,7 +598,7 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32
> cold_hartid)
>  	/* Root domain firmware memory region */
>  	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size, 0,
>  				  &root_fw_region);
> -
> 	sbi_domain_memregion_initfw(&root_memregs[root_memregs_co
> unt++]);
> +
> 	domain_memregion_initfw(&root_memregs[root_memregs_count
> ++]);
> 
>  	/* Root domain allow everything memory region */
>  	sbi_domain_memregion_init(0, ~0UL,
> --
> 2.25.1


