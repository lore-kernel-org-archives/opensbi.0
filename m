From: Anup Patel <Anup.Patel@wdc.com>
Date: Thu, 6 May 2021 09:09:02 +0000
Subject: [PATCH 1/3] docs: platform: Sort platform names
In-Reply-To: <DM6PR04MB6201E116F7A5C3BD656072638D5A9@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20210429101609.1459066-1-bmeng.cn@gmail.com>
 <DM6PR04MB6201E116F7A5C3BD656072638D5A9@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB6201F1EF74C5B25B1679CF5F8D589@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 04 May 2021 09:10
> To: Bin Meng <bmeng.cn@gmail.com>; opensbi at lists.infradead.org
> Subject: RE: [PATCH 1/3] docs: platform: Sort platform names
> 
> 
> 
> > -----Original Message-----
> > From: Bin Meng <bmeng.cn@gmail.com>
> > Sent: 29 April 2021 15:46
> > To: Anup Patel <Anup.Patel@wdc.com>; opensbi at lists.infradead.org
> > Subject: [PATCH 1/3] docs: platform: Sort platform names
> >
> > Let's sort the platform names in alphabetical order.
> >
> > Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> 
> Regards,
> Anup
> 
> > ---
> >
> >  docs/platform/generic.md | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/docs/platform/generic.md b/docs/platform/generic.md index
> > 8c3b0dd..e0bf8fe 100644
> > --- a/docs/platform/generic.md
> > +++ b/docs/platform/generic.md
> > @@ -46,11 +46,11 @@ RISC-V Platforms Using Generic Platform
> >  ---------------------------------------
> >
> >  * **QEMU RISC-V Virt Machine** (*[qemu_virt.md]*)
> > -* **Spike** (*[spike.md]*)
> >  * **Shakti C-class SoC Platform** (*[shakti_cclass.md]*)
> > +* **Spike** (*[spike.md]*)
> >  * **T-HEAD C9xx series Processors** (*[thead-c9xx.md]*)
> >
> >  [qemu_virt.md]: qemu_virt.md
> > -[spike.md]: spike.md
> >  [shakti_cclass.md]: shakti_cclass.md
> > +[spike.md]: spike.md
> >  [thead-c9xx.md]: thead-c9xx.md
> > --
> > 2.25.1


