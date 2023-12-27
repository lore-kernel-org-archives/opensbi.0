From: Xiang W <wxjstz@126.com>
Date: Wed, 27 Dec 2023 09:54:52 +0800
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
In-Reply-To: <b9e904fc-0f5d-4f5d-b42a-4f3f3ea5b169@sifive.com>
References: <20231221014432.393824-1-wxjstz@126.com>
	 <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
	 <87le9i8vf0.fsf@linux-m68k.org>
	 <CAK9=C2VZLvj3D60Wtnd3f9U0xH+ffaVQ81ygOR7d5YeLtsUF=Q@mail.gmail.com>
	 <b9e904fc-0f5d-4f5d-b42a-4f3f3ea5b169@sifive.com>
Message-ID: <4df52e9199fe4a9632ae7a2f9466afd566e436c0.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-26???? 12:03 -0600?Samuel Holland???
> On 2023-12-26 9:51 AM, Anup Patel wrote:
> > On Mon, Dec 25, 2023 at 3:19?PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > 
> > > On Dez 25 2023, Anup Patel wrote:
> > > 
> > > > If "cur_hartid < hbase + BITS_PER_LONG" then
> > > > "1UL << (cur_hartid - hbase) == 0x0"
> > > 
> > > If cur_hartid - hbase < BITS_PER_LONG, then 1UL << (cur_hartid - hbase)
> > > will not be 0.? If cur_hartid - hbase >= BITS_PER_LONG, then 1UL <<
> > > (cur_hartid - hbase) will overflow and be undefined.
> > 
> > I meant "cur_hartid >= hbase + BITS_PER_LONG" which is
> > the overflow case.
> > 
> > Since the overflow behavior is undefined, we have the
> > explicit check added by this patch.
> 
> As pointed out by Andreas, "cur_hartid - hbase < BITS_PER_LONG" is the only
> check needed here. Unsigned wraparound will take care of the case where
> cur_hartid < hbase.
cur_hartid < hbase is not always true.

For example, cur_hartid is 3 and 0-100 belongs to a domain. Here the loop
is executed twice, the first time with hbase 0 and the second time with
hbase 64. The second loop will have cur_hartid < hbase.

Regards,
Xiang W
> 
> Regards,
> Samuel


