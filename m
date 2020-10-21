From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 21 Oct 2020 07:06:19 +0000
Subject: [PATCH v4 10/16] lib: sbi: Extend sbi_system_reset() for domains
In-Reply-To: <20201020093930.2551352-11-anup.patel@wdc.com>
References: <20201020093930.2551352-1-anup.patel@wdc.com>
 <20201020093930.2551352-11-anup.patel@wdc.com>
Message-ID: <DM6PR04MB62010E279A28953DE13CAEAB8D1C0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 20 October 2020 15:09
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Anup
> Patel <Anup.Patel@wdc.com>
> Subject: [PATCH v4 10/16] lib: sbi: Extend sbi_system_reset() for domains
> 
> The sbi_system_reset() should issue platform system reset only if domain of
> current HART is allowed to do system reset.
> 
> This patch extends sbi_system_reset() as-per above.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_system.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c index
> a938003..96290b3 100644
> --- a/lib/sbi/sbi_system.c
> +++ b/lib/sbi/sbi_system.c
> @@ -37,9 +37,10 @@ void __noreturn sbi_system_reset(u32
> platform_reset_type)
>  	/* Stop current HART */
>  	sbi_hsm_hart_stop(scratch, FALSE);
> 
> -	/* Platform specific reset */
> -	sbi_platform_system_reset(sbi_platform_ptr(scratch),
> -				  platform_reset_type);
> +	/* Platform specific reset if domain allowed system reset */
> +	if (dom->system_reset_allowed)
> +		sbi_platform_system_reset(sbi_platform_ptr(scratch),
> +					  platform_reset_type);
> 
>  	/* If platform specific reset did not work then do sbi_exit() */
>  	sbi_exit(scratch);
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo

Regards,
Anup

