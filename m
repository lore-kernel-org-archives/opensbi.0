From: Samuel Holland <samuel.holland@sifive.com>
Date: Wed, 21 Aug 2024 19:36:07 -0500
Subject: [PATCH 3/3] lib: sbi: sw check exception delegation
In-Reply-To: <20240821235546.3876172-4-debug@rivosinc.com>
References: <20240821235546.3876172-1-debug@rivosinc.com>
 <20240821235546.3876172-4-debug@rivosinc.com>
Message-ID: <da2cb8bf-98fe-48ac-b92d-846eb727ceee@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Deepak,

On 2024-08-21 6:55 PM, Deepak Gupta wrote:
> zicfiss and zicfilp introduces new exception (cause=18). Delegate this
> exception to S mode because cfi violations in U / S will be reported
> via this exception.
> 
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  lib/sbi/sbi_hart.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 67a2e42..5bc02a1 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -234,6 +234,9 @@ static int delegate_traps(struct sbi_scratch *scratch)
>  		exceptions |= (1U << CAUSE_STORE_GUEST_PAGE_FAULT);
>  	}
>  
> +	/* delegate sw check exception to S */
> +	exceptions |= (1U << CAUSE_SW_CHECK_EXCP);

I would suggest to include this with the other unconditionally-delegated
exceptions earlier in the function. Either way:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +
>  	csr_write(CSR_MIDELEG, interrupts);
>  	csr_write(CSR_MEDELEG, exceptions);
>  


