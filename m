From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 1 Apr 2021 05:11:15 +0000
Subject: [PATCH 1/3] lib/utils: Support the official clint DT bindings
In-Reply-To: <DM6PR04MB620192A82C8AF052F426D3A68D7C9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20210327050527.15955-1-bmeng.cn@gmail.com>
 <DM6PR04MB620192A82C8AF052F426D3A68D7C9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB6201D864998E680BB752738E8D7B9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 31 March 2021 10:23
> To: 'Bin Meng' <bmeng.cn@gmail.com>; opensbi at lists.infradead.org
> Subject: RE: [PATCH 1/3] lib/utils: Support the official clint DT bindings
> 
> 
> 
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Bin
> > Meng
> > Sent: 27 March 2021 10:35
> > To: opensbi at lists.infradead.org
> > Cc: Bin Meng <bmeng.cn@gmail.com>
> > Subject: [PATCH 1/3] lib/utils: Support the official clint DT bindings
> >
> > Linux kernel commit a2770b57d083 ("dt-bindings: timer: Add CLINT
> > bindings") adds the official DT bindings for CLINT, which uses "sifive,clint0"
> > as the compatible string. "riscv,clint0" is now legacy and has to be
> > kept for backward compatibility of legacy systems.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> 
> Regards,
> Anup
> 
> > ---
> >
> >  lib/utils/ipi/fdt_ipi_clint.c     | 1 +
> >  lib/utils/timer/fdt_timer_clint.c | 1 +
> >  2 files changed, 2 insertions(+)
> >
> > diff --git a/lib/utils/ipi/fdt_ipi_clint.c
> > b/lib/utils/ipi/fdt_ipi_clint.c index
> > e992440..e799fd7 100644
> > --- a/lib/utils/ipi/fdt_ipi_clint.c
> > +++ b/lib/utils/ipi/fdt_ipi_clint.c
> > @@ -36,6 +36,7 @@ static int ipi_clint_cold_init(void *fdt, int
> > nodeoff,
> >
> >  static const struct fdt_match ipi_clint_match[] = {
> >  	{ .compatible = "riscv,clint0" },
> > +	{ .compatible = "sifive,clint0" },
> >  	{ },
> >  };
> >
> > diff --git a/lib/utils/timer/fdt_timer_clint.c
> > b/lib/utils/timer/fdt_timer_clint.c
> > index fe66708..6ba6c7b 100644
> > --- a/lib/utils/timer/fdt_timer_clint.c
> > +++ b/lib/utils/timer/fdt_timer_clint.c
> > @@ -38,6 +38,7 @@ static int timer_clint_cold_init(void *fdt, int
> > nodeoff,
> >
> >  static const struct fdt_match timer_clint_match[] = {
> >  	{ .compatible = "riscv,clint0" },
> > +	{ .compatible = "sifive,clint0" },
> >  	{ },
> >  };
> >
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

