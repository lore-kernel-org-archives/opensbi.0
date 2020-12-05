From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 5 Dec 2020 09:49:40 +0000
Subject: [PATCH v2 02/11] lib: sbi: Fix typo in sbi_domain_finalize()
In-Reply-To: <20201204155224.733188-3-anup.patel@wdc.com>
References: <20201204155224.733188-1-anup.patel@wdc.com>
 <20201204155224.733188-3-anup.patel@wdc.com>
Message-ID: <DM6PR04MB6201DE5C0D8CCADFBCCCEE9F8DF00@DM6PR04MB6201.namprd04.prod.outlook.com>
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
> Subject: [PATCH v2 02/11] lib: sbi: Fix typo in sbi_domain_finalize()
> 
> There has been typo in automatic domain boot hart startup for non-root
> domains so this patch fixes it.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> ---
>  lib/sbi/sbi_domain.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> d4b82fe..4c98a1b 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -404,12 +404,12 @@ int sbi_domain_finalize(struct sbi_scratch *scratch,
> u32 cold_hartid)
>  		dhart = dom->boot_hartid;
> 
>  		/* Ignore if boot HART not possible for this domain */
> -		if (!sbi_hartmask_test_hart(i, dom->possible_harts))
> +		if (!sbi_hartmask_test_hart(dhart, dom->possible_harts))
>  			continue;
> 
>  		/* Ignore if boot HART assigned different domain */
>  		if (sbi_hartid_to_domain(dhart) != dom ||
> -		    !sbi_hartmask_test_hart(i, &dom->assigned_harts))
> +		    !sbi_hartmask_test_hart(dhart, &dom->assigned_harts))
>  			continue;
> 
>  		/* Startup boot HART of domain */
> --
> 2.25.1

Applied this patch to the riscv/opensbi repo.

Regards,
Anup


