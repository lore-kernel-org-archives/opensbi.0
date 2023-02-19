From: Andreas Schwab <schwab@linux-m68k.org>
Date: Sun, 19 Feb 2023 11:20:43 +0100
Subject: [PATCH] lib: utils: fdt_fixup: Fix compile error
In-Reply-To: <20230219101559.708444-1-wxjstz@126.com> (Xiang W.'s message of
	"Sun, 19 Feb 2023 18:15:59 +0800")
References: <20230219101559.708444-1-wxjstz@126.com>
Message-ID: <87zg9ahs78.fsf@linux-m68k.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Feb 19 2023, Xiang W wrote:

> Thus move the label "next_entry" to the beginning of the for loop.

This is not what the patch does.

-- 
Andreas Schwab, schwab at linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

