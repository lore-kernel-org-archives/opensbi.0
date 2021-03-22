From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 22 Mar 2021 04:01:10 +0000
Subject: [PATCH v3 1/1] lib: sbi: illegal CSR 0x306 access in hpm_allowed()
In-Reply-To: <20210319100450.15491-1-xypron.glpk@gmx.de>
References: <20210319100450.15491-1-xypron.glpk@gmx.de>
Message-ID: <DM6PR04MB62017E10EE0BFD5F497C98E88D659@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Sent: 19 March 2021 15:35
> To: Atish Patra <Atish.Patra@wdc.com>
> Cc: Anup Patel <Anup.Patel@wdc.com>; Xiang W <wxjstz@126.com>;
> OpenSBI <opensbi@lists.infradead.org>; Heinrich Schuchardt
> <xypron.glpk@gmx.de>
> Subject: [PATCH v3 1/1] lib: sbi: illegal CSR 0x306 access in hpm_allowed()
> 
> The trap handler sbi_emulate_csr_read() invokes hpm_allowed() which
> reads CSR 0x306 (mcounteren). The K210 does not support CSR 0x306. While
> trying to handle a trap occurring in S-mode code this creates an additional
> trap in M-mode. This results in failure to redirect to S-mode and the system
> hanging in sbi_hart_hang().
> 
> In hart_detect_features() we have already determined if CSR 0x306 is
> available and stored that information in the scratch area. We can use this
> information to decide if CSR 0x306 shall be accessed in hpm_allowed() and
> thus avoid the M-mode trap.
> 
> Likewise if CSR scounteren is not available we have to avoid reading CSR
> 0x106.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> v3:
> 	remove NOT for SBI_HART_HAS_SCOUNTEREN
> v2:
> 	consider scounteren (Xiang W)
> ---
>  lib/sbi/sbi_emulate_csr.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/lib/sbi/sbi_emulate_csr.c b/lib/sbi/sbi_emulate_csr.c index
> bee7761..c66b5d3 100644
> --- a/lib/sbi/sbi_emulate_csr.c
> +++ b/lib/sbi/sbi_emulate_csr.c
> @@ -21,14 +21,23 @@
>  static bool hpm_allowed(int hpm_num, ulong prev_mode, bool virt)  {
>  	ulong cen = -1UL;
> +	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> 
>  	if (prev_mode <= PRV_S) {
> -		cen &= csr_read(CSR_MCOUNTEREN);
> -		if (virt)
> -			cen &= csr_read(CSR_HCOUNTEREN);
> +		if (sbi_hart_has_feature(scratch,
> SBI_HART_HAS_MCOUNTEREN)) {
> +			cen &= csr_read(CSR_MCOUNTEREN);
> +			if (virt)
> +				cen &= csr_read(CSR_HCOUNTEREN);
> +		} else {
> +			cen = 0;
> +		}
> +	}
> +	if (prev_mode == PRV_U) {
> +		if (sbi_hart_has_feature(scratch,
> SBI_HART_HAS_SCOUNTEREN))
> +			cen &= csr_read(CSR_SCOUNTEREN);
> +		else
> +			cen = 0;
>  	}
> -	if (prev_mode == PRV_U)
> -		cen &= csr_read(CSR_SCOUNTEREN);
> 
>  	return ((cen >> hpm_num) & 1) ? TRUE : FALSE;  }
> --
> 2.30.2


