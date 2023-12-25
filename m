From: Xiang W <wxjstz@126.com>
Date: Tue, 26 Dec 2023 00:09:42 +0800
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
In-Reply-To: <87le9i8vf0.fsf@linux-m68k.org>
References: <20231221014432.393824-1-wxjstz@126.com>
	 <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
	 <87le9i8vf0.fsf@linux-m68k.org>
Message-ID: <87efb2320ac44f7f70d3ad45fa1b50ffefd5d87a.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-25???? 10:48 +0100?Andreas Schwab???
> On Dez 25 2023, Anup Patel wrote:
> 
> > If "cur_hartid < hbase + BITS_PER_LONG" then
> > "1UL << (cur_hartid - hbase) == 0x0"
> 
> If cur_hartid - hbase < BITS_PER_LONG, then 1UL << (cur_hartid - hbase)
> will not be 0.? If cur_hartid - hbase >= BITS_PER_LONG, then 1UL <<
> (cur_hartid - hbase) will overflow and be undefined.
> 
Andreas is right. C99 semantics require that the result of a shift overflow
is undefined. Under RISCV, 1<< n is equal to 1<<(n%XLAN).

Regards,
Xiang W


