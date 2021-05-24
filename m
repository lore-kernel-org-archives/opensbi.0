From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 24 May 2021 11:26:13 +0000
Subject: [PATCH 1/2] lib: Check region base for merging in
 sbi_domain_root_add_memregion()
In-Reply-To: <1e046228abff570adaa5ecd3da2f2107396b89cd.camel@126.com>
References: <20210520155912.1336836-1-anup.patel@wdc.com>
 <20210520155912.1336836-2-anup.patel@wdc.com>
 <1e046228abff570adaa5ecd3da2f2107396b89cd.camel@126.com>
Message-ID: <CO6PR04MB781209B45E0698367B39551D8D269@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Xiang W <wxjstz@126.com>
> Sent: 21 May 2021 12:09
> To: Anup Patel <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>;
> Alistair Francis <Alistair.Francis@wdc.com>
> Cc: Anup Patel <anup@brainfault.org>; opensbi at lists.infradead.org
> Subject: Re: [PATCH 1/2] lib: Check region base for merging in
> sbi_domain_root_add_memregion()
> 
> ? 2021-05-20?? 21:29 +0530?Anup Patel???
> > We can merge region B onto region A only if base of region A is
> > aligned to region A order + 1.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> 
> Reviewed-by: Xiang W <wxjstz@126.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> 
> > ---
> >  lib/sbi/sbi_domain.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c index
> > 84f30b9..3096af0 100644
> > --- a/lib/sbi/sbi_domain.c
> > +++ b/lib/sbi/sbi_domain.c
> > @@ -511,7 +511,8 @@ int sbi_domain_root_add_memregion(const struct
> > sbi_domain_memregion *reg)
> >  			if (!nreg1->order)
> >  				continue;
> >
> > -			if ((nreg->base + BIT(nreg->order)) == nreg1-
> > >base &&
> > +			if (!(nreg->base & (BIT(nreg->order + 1) - 1))
> > &&
> > +			    (nreg->base + BIT(nreg->order)) == nreg1-
> > >base &&
> >  			    nreg->order == nreg1->order &&
> >  			    nreg->flags == nreg1->flags) {
> >  				nreg->order++;
> > --
> > 2.25.1
> >
> >

