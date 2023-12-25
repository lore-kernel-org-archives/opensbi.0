From: Andreas Schwab <schwab@linux-m68k.org>
Date: Mon, 25 Dec 2023 10:48:35 +0100
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
In-Reply-To: <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
	(Anup Patel's message of "Mon, 25 Dec 2023 14:54:08 +0530")
References: <20231221014432.393824-1-wxjstz@126.com>
	<CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
Message-ID: <87le9i8vf0.fsf@linux-m68k.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Dez 25 2023, Anup Patel wrote:

> If "cur_hartid < hbase + BITS_PER_LONG" then
> "1UL << (cur_hartid - hbase) == 0x0"

If cur_hartid - hbase < BITS_PER_LONG, then 1UL << (cur_hartid - hbase)
will not be 0.  If cur_hartid - hbase >= BITS_PER_LONG, then 1UL <<
(cur_hartid - hbase) will overflow and be undefined.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

