From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 27 Dec 2023 11:15:25 +0530
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
In-Reply-To: <4df52e9199fe4a9632ae7a2f9466afd566e436c0.camel@126.com>
References: <20231221014432.393824-1-wxjstz@126.com> <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
 <87le9i8vf0.fsf@linux-m68k.org> <CAK9=C2VZLvj3D60Wtnd3f9U0xH+ffaVQ81ygOR7d5YeLtsUF=Q@mail.gmail.com>
 <b9e904fc-0f5d-4f5d-b42a-4f3f3ea5b169@sifive.com> <4df52e9199fe4a9632ae7a2f9466afd566e436c0.camel@126.com>
Message-ID: <CAK9=C2V9b-Wa49Es7aPDmxmB2gA+FAUqb0nv7yipN48Wf5QV2Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 27, 2023 at 7:25?AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2023-12-26???? 12:03 -0600?Samuel Holland???
> > On 2023-12-26 9:51 AM, Anup Patel wrote:
> > > On Mon, Dec 25, 2023 at 3:19?PM Andreas Schwab <schwab@linux-m68k.org> wrote:
> > > >
> > > > On Dez 25 2023, Anup Patel wrote:
> > > >
> > > > > If "cur_hartid < hbase + BITS_PER_LONG" then
> > > > > "1UL << (cur_hartid - hbase) == 0x0"
> > > >
> > > > If cur_hartid - hbase < BITS_PER_LONG, then 1UL << (cur_hartid - hbase)
> > > > will not be 0.  If cur_hartid - hbase >= BITS_PER_LONG, then 1UL <<
> > > > (cur_hartid - hbase) will overflow and be undefined.
> > >
> > > I meant "cur_hartid >= hbase + BITS_PER_LONG" which is
> > > the overflow case.
> > >
> > > Since the overflow behavior is undefined, we have the
> > > explicit check added by this patch.
> >
> > As pointed out by Andreas, "cur_hartid - hbase < BITS_PER_LONG" is the only
> > check needed here. Unsigned wraparound will take care of the case where
> > cur_hartid < hbase.
> cur_hartid < hbase is not always true.
>
> For example, cur_hartid is 3 and 0-100 belongs to a domain. Here the loop
> is executed twice, the first time with hbase 0 and the second time with
> hbase 64. The second loop will have cur_hartid < hbase.

The real issue is that overflow behaviour of the left shift operator is
undefined. No need for further justification on this issue.

Regards,
Anup

>
> Regards,
> Xiang W
> >
> > Regards,
> > Samuel
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

