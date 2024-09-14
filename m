From: Samuel Holland <samuel.holland@sifive.com>
Date: Sat, 14 Sep 2024 12:05:02 -0500
Subject: [PATCH v5 3/4] lib: sbi: sw check exception delegation
In-Reply-To: <20240910163522.2584936-4-debug@rivosinc.com>
References: <20240910163522.2584936-1-debug@rivosinc.com>
 <20240910163522.2584936-4-debug@rivosinc.com>
Message-ID: <e93353ca-26b6-4a67-845b-3b509b9b7b43@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2024-09-10 11:35 AM, Deepak Gupta wrote:
> zicfiss and zicfilp introduces new exception (cause=18). Delegate this
> exception to S mode because cfi violations in U / S will be reported
> via this exception.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> ---
>  lib/sbi/sbi_hart.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index e1bc346..fa00f69 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -207,7 +207,8 @@ static int delegate_traps(struct sbi_scratch *scratch)
>  	if (sbi_platform_has_mfaults_delegation(plat))
>  		exceptions |= (1U << CAUSE_FETCH_PAGE_FAULT) |
>  			      (1U << CAUSE_LOAD_PAGE_FAULT) |
> -			      (1U << CAUSE_STORE_PAGE_FAULT);
> +			      (1U << CAUSE_STORE_PAGE_FAULT)|

nit: missing space before |

> +			      (1U << CAUSE_SW_CHECK_EXCP);
>  
>  	/*
>  	 * If hypervisor extension available then we only handle hypervisor


