From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 8 Apr 2021 03:25:58 +0000
Subject: [RFC 07/14] lib: sbi: Remove redundant boot time print statement
In-Reply-To: <20210319221305.2138412-8-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
 <20210319221305.2138412-8-atish.patra@wdc.com>
Message-ID: <DM6PR04MB62015A3A20252C93845EF0088D749@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atish.patra@wdc.com>
> Sent: 20 March 2021 03:43
> To: opensbi at lists.infradead.org
> Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel <Anup.Patel@wdc.com>
> Subject: [RFC 07/14] lib: sbi: Remove redundant boot time print statement
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>


Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/sbi/sbi_init.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index
> 4de2dfa7c99d..acc2a81a1b53 100644
> --- a/lib/sbi/sbi_init.c
> +++ b/lib/sbi/sbi_init.c
> @@ -117,8 +117,6 @@ static void sbi_boot_print_hart(struct sbi_scratch
> *scratch, u32 hartid)
>  		   sbi_hart_pmp_addrbits(scratch));
>  	sbi_printf("Boot HART MHPM Count      : %d\n",
>  		   sbi_hart_mhpm_count(scratch));
> -	sbi_printf("Boot HART MHPM Count      : %d\n",
> -		   sbi_hart_mhpm_count(scratch));
>  	sbi_hart_delegation_dump(scratch, "Boot HART ", "         ");
>  }
> 
> --
> 2.25.1


