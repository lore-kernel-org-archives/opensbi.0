From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 6 Jul 2020 08:47:33 +0000
Subject: [PATCH] lib/utils: fdt: Update FDT expand size to 1024 for
 reserved memory node
In-Reply-To: <CAOnJCU+H9rHbQp+gYqg1HpTaDkT5T1Q_2_hPsJ0JkJVD1Zi6pA@mail.gmail.com>
References: <1593077799-16270-1-git-send-email-bmeng.cn@gmail.com>
 <CAOnJCU+H9rHbQp+gYqg1HpTaDkT5T1Q_2_hPsJ0JkJVD1Zi6pA@mail.gmail.com>
Message-ID: <DM6PR04MB6201C29E93A1FD982436D2BC8D690@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Atish
> Patra
> Sent: 25 June 2020 23:00
> To: Bin Meng <bmeng.cn@gmail.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Bin Meng
> <bin.meng@windriver.com>; OpenSBI <opensbi@lists.infradead.org>
> Subject: Re: [PATCH] lib/utils: fdt: Update FDT expand size to 1024 for
> reserved memory node
> 
> On Thu, Jun 25, 2020 at 2:36 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Currently 256 bytes is used for the FDT expand size when fixing up
> > reserved memory node. Increase it to 1024 bytes with an estimated size
> > of 64 bytes per PMP memory region by 16 regions in total.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  lib/utils/fdt/fdt_fixup.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> > index adf1be3..a3bccae 100644
> > --- a/lib/utils/fdt/fdt_fixup.c
> > +++ b/lib/utils/fdt/fdt_fixup.c
> > @@ -151,8 +151,14 @@ int fdt_reserved_memory_fixup(void *fdt)
> >         int na = fdt_address_cells(fdt, 0);
> >         int ns = fdt_size_cells(fdt, 0);
> >
> > -       /* expand the device tree to accommodate new node */
> > -       err  = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 256);
> > +       /*
> > +        * Expand the device tree to accommodate new node
> > +        * by the following estimated size:
> > +        *
> > +        * Each PMP memory region entry occupies 64 bytes.
> > +        * With 16 PMP memory regions we need 64 * 16 = 1024 bytes.
> > +        */
> > +       err = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 1024);
> >         if (err < 0)
> >                 return err;
> >
> > --
> > 2.7.4
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

