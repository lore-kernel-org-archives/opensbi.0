From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 20 Oct 2020 09:30:14 +0200
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <20201019224108.99481-1-alistair.francis@wdc.com> (Alistair
 Francis's message of "Mon, 19 Oct 2020 15:41:08 -0700")
References: <20201019224108.99481-1-alistair.francis@wdc.com>
Message-ID: <87h7qpuzg9.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Okt 19 2020, Alistair Francis wrote:

> To avoid
>     can't link double-float modules with soft-float modules
> errors when building 32-bit openSBI don't specify mabi or march.

What version of binutils are you using?

Andreas.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

