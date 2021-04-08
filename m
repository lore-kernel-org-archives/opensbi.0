From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 8 Apr 2021 03:15:28 +0000
Subject: [RFC 03/14] lib: sbi: Remove stray '\' character
In-Reply-To: <20210319221305.2138412-4-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
 <20210319221305.2138412-4-atish.patra@wdc.com>
Message-ID: <DM6PR04MB6201D0D511719673E3D88CDE8D749@DM6PR04MB6201.namprd04.prod.outlook.com>
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
> Subject: [RFC 03/14] lib: sbi: Remove stray '\' character
> 
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/sbi/sbi_hart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index
> 0b3bb6237182..ee11b2133d05 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -320,7 +320,7 @@ static unsigned long
> hart_pmp_get_allowed_addr(void)
>  	unsigned long val = 0;
>  	struct sbi_trap_info trap = {0};
> 
> -	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap,
> PMP_ADDR_MASK);			\
> +	csr_write_allowed(CSR_PMPADDR0, (ulong)&trap,
> PMP_ADDR_MASK);
>  	if (!trap.cause) {
>  		val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
>  		if (trap.cause)
> --
> 2.25.1


