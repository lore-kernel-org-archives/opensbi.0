From: Anup Patel <Anup.Patel@wdc.com>
Date: Sat, 22 Aug 2020 03:51:00 +0000
Subject: [PATCH v3 1/2] lib: sbi_init: Avoid thundering hurd problem with
 coldboot_lock
In-Reply-To: <CAEUhbmU45KSuduO5p+L_N1g+9zcJpJ_NLYZL2V7ub=ReBjT5cg@mail.gmail.com>
References: <20200818040728.528426-1-anup.patel@wdc.com>
 <CAEUhbmU45KSuduO5p+L_N1g+9zcJpJ_NLYZL2V7ub=ReBjT5cg@mail.gmail.com>
Message-ID: <DM6PR04MB6201C65ACC84324EEC501B898D580@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: 18 August 2020 14:46
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Heinrich Schuchardt <xypron.glpk@gmx.de>;
> OpenSBI <opensbi@lists.infradead.org>; Anup Patel <anup@brainfault.org>
> Subject: Re: [PATCH v3 1/2] lib: sbi_init: Avoid thundering hurd problem with
> coldboot_lock
> 
> On Tue, Aug 18, 2020 at 12:09 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > We can have thundering hurd problem with coldboot_lock where the boot
> > HART can potentially starve trying to acquire coldboot_lock because
> > some of the non-boot HARTs are continuously acquiring and releasing
> > coldboot_lock. This can happen if MIP.MSIP bit is already set for some
> > of the non-boot HARTs.
> >
> > To avoid thundering hurd problem for coldboot_lock, we use the
> > __smp_load_acquire() and __smp_store_release() for coldboot_done flag
> > and use coldboot_lock only for coldboot_wait_hmask.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > Tested-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > Reviewed-by: Atish Patra <atish.patra@wdc.com>
> > ---
> >  lib/sbi/sbi_init.c | 20 +++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> 
> Reviewed-by: Bin Meng <bin.meng@windriver.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
