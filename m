From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 27 Oct 2020 08:03:53 +0000
Subject: [PATCH] lib: sbi: Fix PMP entry detetcion mechanism
In-Reply-To: <1603785263-11304-1-git-send-email-vincent.chen@sifive.com>
References: <1603785263-11304-1-git-send-email-vincent.chen@sifive.com>
Message-ID: <DM6PR04MB6201491124FD2FF8D2DE70DB8D160@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Vincent
> Chen
> Sent: 27 October 2020 13:24
> To: opensbi at lists.infradead.org
> Cc: vincent.chen at sifive.com
> Subject: [PATCH] lib: sbi: Fix PMP entry detetcion mechanism
> 
> The granularity of PMP access control settings is platform-specific. If the
> granularity is greater than 4 bytes, the current mechanism will not work
> because the return value will be forced to be granularity alignment so that
> the returned value is not equal to the written value. This patch writes
> PMP_ADDR_MASK to each PMP addr registers and checks the return value
> that is unequaled to zero to identify whether this PMP entry is support or
> not.

This was initially fixed by Pragnesh for SiFive Unleashed platform and finally
it has been fixed correctly by Atish.

Can you try latest OpenSBI repo ?

Regards,
Anup

> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  lib/sbi/sbi_hart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index 6413194..42c4f51
> 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -372,7 +372,7 @@ static void hart_detect_features(struct sbi_scratch
> *scratch)
>  		} else {						\
>  			csr_write_allowed(__csr, (ulong)&trap, __wrval);\
>  			if (!trap.cause) {				\
> -				if (csr_swap(__csr, val) == __wrval)	\
> +				if (csr_swap(__csr, val))		\
>  					(hfeatures->__field)++;
> 	\
>  				else					\
>  					goto __skip;			\
> @@ -403,7 +403,7 @@ static void hart_detect_features(struct sbi_scratch
> *scratch)
>  	__check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
> 
>  	/* Detect number of PMP regions */
> -	__check_csr_64(CSR_PMPADDR0, 0, 1UL, pmp_count, __pmp_skip);
> +	__check_csr_64(CSR_PMPADDR0, 0, PMP_ADDR_MASK,
> pmp_count, __pmp_skip);
>  __pmp_skip:
> 
>  	/* Detect number of MHPM counters */
> --
> 2.7.4
> 
> 
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

