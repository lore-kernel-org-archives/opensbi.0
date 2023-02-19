From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 19 Feb 2023 10:11:09 +0100
Subject: [PATCH] lib: utils: fdt_fixup: Fix compile error
In-Reply-To: <20230219063335.30952-1-peterlin@andestech.com> (Yu Chien Peter
	Lin's message of "Sun, 19 Feb 2023 14:33:35 +0800")
References: <20230219063335.30952-1-peterlin@andestech.com>
Message-ID: <874jrij9zm.fsf@linux-m68k.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Feb 19 2023, Yu Chien Peter Lin wrote:

> Thus move the label "next_entry" to the beginning of the for loop.

This changes the semantics, because jumping to the top of the loop skips
the update expression.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

