From: Xiang W <wxjstz@126.com>
Date: Mon, 25 Dec 2023 17:32:22 +0800
Subject: [PATCH] lib: sbi: Fix shift bug in sbi_system_reset
In-Reply-To: <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
References: <20231221014432.393824-1-wxjstz@126.com>
	 <CAAhSdy2J71KrU-Qb-Wo3AfoxGZ4jywVQo=xFWBR9PD_8pWEfXw@mail.gmail.com>
Message-ID: <1e693455843d68d3523da5192973db01a81d3786.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-12-25???? 14:54 +0530?Anup Patel???
> On Thu, Dec 21, 2023 at 7:14?AM Xiang W <wxjstz@126.com> wrote:
> > 
> > There is a problem with judging whether the current hart belongs to
> > hmask. If cur_hartid minus hbase is greater than BITS_PER_LONG, the
> > previous hmask will also have a bit cleared incorrectly, which will
> > cause some harts to lose ipi.
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > ?lib/sbi/sbi_system.c | 3 ++-
> > ?1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/lib/sbi/sbi_system.c b/lib/sbi/sbi_system.c
> > index d1fa349..e930272 100644
> > --- a/lib/sbi/sbi_system.c
> > +++ b/lib/sbi/sbi_system.c
> > @@ -72,7 +72,8 @@ void __noreturn sbi_system_reset(u32 reset_type, u32 reset_reason)
> > 
> > ??????? /* Send HALT IPI to every hart other than the current hart */
> > ??????? while (!sbi_hsm_hart_interruptible_mask(dom, hbase, &hmask)) {
> > -?????????????? if (hbase <= cur_hartid)
> > +?????????????? if ((hbase <= cur_hartid)
> > +???????????????????????? && (cur_hartid < hbase + BITS_PER_LONG))
> 
> If "cur_hartid < hbase + BITS_PER_LONG" then
> "1UL << (cur_hartid - hbase) == 0x0" so hmask
> won't be impacted.
> 
> Do we still need this additional check ?
Yes, needed.

1UL << (cur_hartid - hbase) is equal to 1UL << ((cur_hartid - hbase) % XLEN)
is not equal to 0.

Regards,
Xiang W
> 
> > ??????????????????????? hmask &= ~(1UL << (cur_hartid - hbase));
> > ??????????????? if (hmask)
> > ??????????????????????? sbi_ipi_send_halt(hmask, hbase);
> > --
> > 2.43.0
> > 
> > 
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Regards,
> Anup


