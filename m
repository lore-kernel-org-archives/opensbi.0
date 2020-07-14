From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 14 Jul 2020 11:44:20 +0000
Subject: [PATCH] include: sbi_bitops: Remove dead shift assignment in
 ffs/fls
In-Reply-To: <DM6PR04MB6201E2701D3FE828E324B06B8D650@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200707095655.12880-1-tklauser@distanz.ch>
 <DM6PR04MB6201E2701D3FE828E324B06B8D650@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB6201C469F1A9E882F39BB7E68D610@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 10 July 2020 15:48
> To: Tobias Klauser <tklauser@distanz.ch>; opensbi at lists.infradead.org
> Subject: RE: [PATCH] include: sbi_bitops: Remove dead shift assignment in
> ffs/fls
> 
> 
> 
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> > Tobias Klauser
> > Sent: 07 July 2020 15:27
> > To: opensbi at lists.infradead.org
> > Subject: [PATCH] include: sbi_bitops: Remove dead shift assignment in
> > ffs/fls
> >
> > The value assigned to x by the shift assignment in the last if block
> > of ffs/fls is never read. Remove it.
> >
> > Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
> > ---
> >  include/sbi/sbi_bitops.h | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/include/sbi/sbi_bitops.h b/include/sbi/sbi_bitops.h index
> > d920086789de..879430d4b903 100644
> > --- a/include/sbi/sbi_bitops.h
> > +++ b/include/sbi/sbi_bitops.h
> > @@ -66,10 +66,8 @@ static inline int ffs(int x)
> >  		x >>= 2;
> >  		r += 2;
> >  	}
> > -	if (!(x & 1)) {
> > -		x >>= 1;
> > +	if (!(x & 1))
> >  		r += 1;
> > -	}
> >  	return r;
> >  }
> >
> > @@ -148,10 +146,8 @@ static inline int fls(int x)
> >  		x <<= 2;
> >  		r -= 2;
> >  	}
> > -	if (!(x & 0x80000000u)) {
> > -		x <<= 1;
> > +	if (!(x & 0x80000000u))
> >  		r -= 1;
> > -	}
> >  	return r;
> >  }
> >
> > --
> > 2.27.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

