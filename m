From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 2 Oct 2020 10:25:19 +0000
Subject: [PATCH 1/1] lib: sbi_scratch: typo scatch
In-Reply-To: <DM6PR04MB62014252C4EF1E74741C740E8D300@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20201001102747.15565-1-xypron.glpk@gmx.de>
 <DM6PR04MB62014252C4EF1E74741C740E8D300@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB620176ADD0BCB08D270A978A8D310@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 01 October 2020 16:09
> To: Heinrich Schuchardt <xypron.glpk@gmx.de>; Atish Patra
> <Atish.Patra@wdc.com>
> Cc: OpenSBI List <opensbi@lists.infradead.org>; Atish Patra
> <atishp@atishpatra.org>
> Subject: RE: [PATCH 1/1] lib: sbi_scratch: typo scatch
> 
> 
> 
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of
> > Heinrich Schuchardt
> > Sent: 01 October 2020 15:58
> > To: Atish Patra <Atish.Patra@wdc.com>
> > Cc: Heinrich Schuchardt <xypron.glpk@gmx.de>; OpenSBI List
> > <opensbi@lists.infradead.org>; Atish Patra <atishp@atishpatra.org>
> > Subject: [PATCH 1/1] lib: sbi_scratch: typo scatch
> >
> > %s/scatch/scratch
> >
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > ---
> >  include/sbi/sbi_scratch.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/sbi_scratch.h b/include/sbi/sbi_scratch.h
> > index 8086207..9f3453d 100644
> > --- a/include/sbi/sbi_scratch.h
> > +++ b/include/sbi/sbi_scratch.h
> > @@ -85,7 +85,7 @@ enum sbi_scratch_options {  #define
> > sbi_scratch_thishart_arg1_ptr() \
> >  	((void *)(sbi_scratch_thishart_ptr()->next_arg1))
> >
> > -/** Initialize scatch table and allocator */
> > +/** Initialize scratch table and allocator */
> >  int sbi_scratch_init(struct sbi_scratch *scratch);
> >
> >  /**
> > --
> > 2.28.0
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>
> 

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

