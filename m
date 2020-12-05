From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 5 Dec 2020 09:50:04 +0000
Subject: [PATCH v2 04/11] lib: sbi: Auto start domain only if boot HART
 within limits
In-Reply-To: <20201204155224.733188-5-anup.patel@wdc.com>
References: <20201204155224.733188-1-anup.patel@wdc.com>
 <20201204155224.733188-5-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201749460CDEC2CBA63BA9C8DF00@DM6PR04MB6201.namprd04.prod.outlook.com>
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
> Subject: [PATCH v2 04/11] lib: sbi: Auto start domain only if boot HART within
> limits
> 
> The sbi_domain_finalize() should auto start a domain only if the boot HART is
> withing limits (i.e. less than SBI_HARTMASK_MAX_BITS).
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_domain.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> ac920b8..ecb098c 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -403,6 +403,10 @@ int sbi_domain_finalize(struct sbi_scratch *scratch,
> u32 cold_hartid)
>  		/* Domain boot HART */
>  		dhart = dom->boot_hartid;
> 
> +		/* Ignore of boot HART is off limits */
> +		if (SBI_HARTMASK_MAX_BITS <= dhart)
> +			continue;
> +
>  		/* Ignore if boot HART not possible for this domain */
>  		if (!sbi_hartmask_test_hart(dhart, dom->possible_harts))
>  			continue;
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo.

Regards,
Anup


