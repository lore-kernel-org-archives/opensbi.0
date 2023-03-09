From: Andreas Schwab <schwab@suse.de>
Date: Thu, 09 Mar 2023 10:57:44 +0100
Subject: [PATCH] lib: sbi_scratch: Optimize the alignment code for alloc
 size
In-Reply-To: <20230309094607.72318-1-wxjstz@126.com> (Xiang W.'s message of
	"Thu, 9 Mar 2023 17:46:07 +0800")
References: <20230309094607.72318-1-wxjstz@126.com>
Message-ID: <mvmpm9ifdrb.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On M?r 09 2023, Xiang W wrote:

> +	size = (size + __SIZEOF_POINTER__ - 1) & ~(__SIZEOF_POINTER__ - 1);

It is probably more robust to convert (__SIZEOF_POINTER__ - 1) to
unsigned long before inverting.  This currently depends on the fact that
~(__SIZEOF_POINTER__ - 1) is a signed int, and thus sign extended, to
work correctly.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

