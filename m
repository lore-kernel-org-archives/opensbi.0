From: Andreas Schwab <schwab@linux-m68k.org>
Date: Tue, 27 Dec 2022 19:53:45 +0100
Subject: [PATCH] platform: generic: allwinner: Fix PLIC array bounds
In-Reply-To: <20221227184444.61331-1-samuel@sholland.org> (Samuel Holland's
	message of "Tue, 27 Dec 2022 12:44:44 -0600")
References: <20221227184444.61331-1-samuel@sholland.org>
Message-ID: <87mt78d6fa.fsf@igel.home>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 27 2022, Samuel Holland wrote:

> -static u8 plic_priority[PLIC_SOURCES];
> +static u8 plic_priority[1 + PLIC_SOURCES];

This is unnecessarily wasting space.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

