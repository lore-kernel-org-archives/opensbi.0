From: Andreas Schwab <schwab@suse.de>
Date: Tue, 09 Apr 2024 09:44:21 +0200
Subject: [PATCH] lib: sbi: Refine the settings for switching to Virtual
 Supervisor Mode.
In-Reply-To: <20240409022410.1866-1-popeblei@gmail.com> (Pope B. Lei's message
	of "Tue, 9 Apr 2024 10:24:10 +0800")
References: <20240409022410.1866-1-popeblei@gmail.com>
Message-ID: <mvmle5naskq.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Apr 09 2024, Pope B.Lei wrote:

> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 3d13694..e145cdc 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -1041,10 +1041,17 @@ sbi_hart_switch_mode(unsigned long arg0, unsigned long arg1,
>  	csr_write(CSR_MEPC, next_addr);
>  
>  	if (next_mode == PRV_S) {
> -		csr_write(CSR_STVEC, next_addr);
> -		csr_write(CSR_SSCRATCH, 0);
> -		csr_write(CSR_SIE, 0);
> -		csr_write(CSR_SATP, 0);
> +		if (true == next_virt){

Never compare a boolean with a constant.

> +		    csr_write(CSR_VSTVEC, next_addr);
> +		    csr_write(CSR_VSSCRATCH, 0);
> +		    csr_write(CSR_VSIE, 0);
> +		    csr_write(CSR_VSATP, 0);
> +		} else if (false == next_virt){

This condition is obviously redundant.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

