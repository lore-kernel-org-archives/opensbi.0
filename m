From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 5 Dec 2020 09:50:18 +0000
Subject: [PATCH v2 06/11] lib: sbi: Override domain boot HART when
 coldboot HART assigned to it
In-Reply-To: <20201204155224.733188-7-anup.patel@wdc.com>
References: <20201204155224.733188-1-anup.patel@wdc.com>
 <20201204155224.733188-7-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201BC7FFB4B2AC356EEBCEF8DF00@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel <Anup.Patel@wdc.com>
> Sent: 04 December 2020 21:22
> To: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org; Anup
> Patel <Anup.Patel@wdc.com>; Alistair Francis <Alistair.Francis@wdc.com>
> Subject: [PATCH v2 06/11] lib: sbi: Override domain boot HART when
> coldboot HART assigned to it
> 
> If coldboot HART is assigned to a domain then we should use coldboot HART
> as the boot HART of the domain. This allows coldboot HART to continue boot
> sequence even when it is assigned to some non-root domain.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_domain.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> ecb098c..1b50604 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -395,6 +395,17 @@ int sbi_domain_finalize(struct sbi_scratch *scratch,
> u32 cold_hartid)
>  						&tdom->assigned_harts);
>  			hartid_to_domain_table[i] = dom;
>  			sbi_hartmask_set_hart(i, &dom->assigned_harts);
> +
> +			/*
> +			 * If cold boot HART is assigned to this domain then
> +			 * override boot HART of this domain.
> +			 */
> +			if (i == cold_hartid &&
> +			    dom->boot_hartid != cold_hartid) {
> +				sbi_printf("Domain%d Boot HARTID forced
> to"
> +					   " %d\n", dom->index, cold_hartid);
> +				dom->boot_hartid = cold_hartid;
> +			}
>  		}
>  	}
> 
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo.

Regards,
Anup


