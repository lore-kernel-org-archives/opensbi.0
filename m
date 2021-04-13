From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 13 Apr 2021 05:26:01 +0000
Subject: [PATCH v2 5/7] lib: sbi: Make the root domain instance global
 variable
In-Reply-To: <20210412121617.933493-6-anup.patel@wdc.com>
References: <20210412121617.933493-1-anup.patel@wdc.com>
 <20210412121617.933493-6-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201FD12595234D8F56722F08D4F9@DM6PR04MB6201.namprd04.prod.outlook.com>
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
> Subject: [PATCH v2 5/7] lib: sbi: Make the root domain instance global
> variable
> 
> We make the the root domain instance global variable so that platform
> support and drivers can iterate over the root domain regions.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Xiang W <wxjstz@126.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  include/sbi/sbi_domain.h | 3 +++
>  lib/sbi/sbi_domain.c     | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h index
> 84d17da..27316de 100644
> --- a/include/sbi/sbi_domain.h
> +++ b/include/sbi/sbi_domain.h
> @@ -80,6 +80,9 @@ struct sbi_domain {
>  	bool system_reset_allowed;
>  };
> 
> +/** The root domain instance */
> +extern struct sbi_domain root;
> +
>  /** HART id to domain table */
>  extern struct sbi_domain *hartid_to_domain_table[];
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> 4b5a89f..c95c3c3 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -29,7 +29,7 @@ static u32 root_memregs_count = 0;  static struct
> sbi_domain_memregion root_fw_region;  static struct
> sbi_domain_memregion root_memregs[ROOT_REGION_MAX + 1] = { 0 };
> 
> -static struct sbi_domain root = {
> +struct sbi_domain root = {
>  	.name = "root",
>  	.possible_harts = &root_hmask,
>  	.regions = root_memregs,
> --
> 2.25.1


