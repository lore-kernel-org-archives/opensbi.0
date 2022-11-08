From: Andreas Schwab <schwab@suse.de>
Date: Tue, 08 Nov 2022 10:02:05 +0100
Subject: [PATCH] lib: utils/serial: Fix semihosting compile error using
 LLVM
In-Reply-To: <20221108032509.1382464-1-apatel@ventanamicro.com> (Anup Patel's
	message of "Tue, 8 Nov 2022 08:55:09 +0530")
References: <20221108032509.1382464-1-apatel@ventanamicro.com>
Message-ID: <mvmwn85ddki.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Nov 08 2022, Anup Patel wrote:

> diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> index 5012fa1..72bbbb3 100644
> --- a/lib/utils/serial/semihosting.c
> +++ b/lib/utils/serial/semihosting.c
> @@ -155,7 +155,7 @@ static int semihosting_getc(void)
>  
>  	if (semihosting_infd < 0)  {
>  		ch = semihosting_trap(SYSREADC, NULL);

This is using the wrong variable to record the return value of
semihosting_trap (which is of type long, not char).

> -		ret = ch > -1 ? ch : -1;
> +		ret = ((int)ch > -1) ? ch : -1;

I think this line can be removed, and the return value of
semihosting_trap can be returned directly.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

