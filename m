From: Anup Patel <Anup.Patel@wdc.com>
Date: Wed, 28 Apr 2021 12:14:46 +0000
Subject: [PATCH 7/7] lib: sbi: Show devices provided by platform in boot
 prints
In-Reply-To: <b60b3ac7317a7d64eefe52a7db983c0495f9b56a.camel@wdc.com>
References: <20210422112023.670521-1-anup.patel@wdc.com>
 <20210422112023.670521-8-anup.patel@wdc.com>
 <b60b3ac7317a7d64eefe52a7db983c0495f9b56a.camel@wdc.com>
Message-ID: <DM6PR04MB6201BD15CA1BA1879F3E7FC58D409@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Alistair Francis <Alistair.Francis@wdc.com>
> Sent: 26 April 2021 11:40
> To: Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> <Anup.Patel@wdc.com>
> Cc: anup at brainfault.org; opensbi at lists.infradead.org
> Subject: Re: [PATCH 7/7] lib: sbi: Show devices provided by platform in boot
> prints
> 
> On Thu, 2021-04-22 at 16:50 +0530, Anup Patel wrote:
> > We extend the boot-time prints to show various devices provided (or
> > registered) by the platform support. This will help users verify
> > hardware devices available for OpenSBI firmwares.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> 
> Alistair
> 
> > ---
> > ?lib/sbi/sbi_init.c | 20 ++++++++++++++++++++
> > ?1 file changed, 20 insertions(+)
> >
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index
> > 7380d01..3f44a2b 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -53,6 +53,11 @@ static void sbi_boot_print_banner(struct
> > sbi_scratch
> > *scratch)
> > ?static void sbi_boot_print_general(struct sbi_scratch *scratch)
> > ?{
> > ????????char str[128];
> > +???????const struct sbi_hsm_device *hdev;
> > +???????const struct sbi_ipi_device *idev;
> > +???????const struct sbi_timer_device *tdev;
> > +???????const struct sbi_console_device *cdev;
> > +???????const struct sbi_system_reset_device *srdev;
> > ????????const struct sbi_platform *plat = sbi_platform_ptr(scratch);
> >
> > ????????if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS) @@ -65,6
> > +70,21 @@ static void sbi_boot_print_general(struct sbi_scratch
> > *scratch)
> > ????????sbi_printf("Platform Features???????? : %s\n", str);
> > ????????sbi_printf("Platform HART Count?????? : %u\n",
> > ?????????????????? sbi_platform_hart_count(plat));
> > +???????idev = sbi_ipi_get_device();
> > +???????sbi_printf("Platform IPI Device?????? : %s\n",
> > +????????????????? (idev) ? idev->name : "---");
> > +???????tdev = sbi_timer_get_device();
> > +???????sbi_printf("Platform Timer Device???? : %s\n",
> > +????????????????? (tdev) ? tdev->name : "---");
> > +???????cdev = sbi_console_get_device();
> > +???????sbi_printf("Platform Console Device?? : %s\n",
> > +????????????????? (cdev) ? cdev->name : "---");
> > +???????hdev = sbi_hsm_get_device();
> > +???????sbi_printf("Platform HSM Device?????? : %s\n",
> > +????????????????? (hdev) ? hdev->name : "---");
> > +???????srdev = sbi_system_reset_get_device();
> > +???????sbi_printf("Platform SysReset Device? : %s\n",
> > +????????????????? (srdev) ? srdev->name : "---");
> >
> > ????????/* Firmware details */
> > ????????sbi_printf("Firmware Base???????????? : 0x%lx\n", scratch-
> > >fw_start);

