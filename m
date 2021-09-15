From: Andreas Schwab <schwab@linux-m68k.org>
Date: Wed, 15 Sep 2021 11:27:13 +0200
Subject: [PATCH V2 1/2] lib: sbi: add some macros to detect BUG at runtime
In-Reply-To: <20210915090330.23354-1-wxjstz@126.com> (Xiang W.'s message of
 "Wed, 15 Sep 2021 17:03:29 +0800")
References: <20210915090330.23354-1-wxjstz@126.com>
Message-ID: <87wnni42a6.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sep 15 2021, Xiang W wrote:

> +#define BUG_ON(cond) do { \
> +	if (!(cond))	\
> +		BUG(); \

Isn't that backwards?

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

