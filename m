From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 12 Mar 2021 04:06:02 +0000
Subject: [PATCH 1/1] include: sbi: SBI function IDs for RFENCE extension
In-Reply-To: <CAOnJCUL9-wO2j9_hcm_fh5PxMYoaCne222Y7qMCOx9+u+aVbUg@mail.gmail.com>
References: <20210309113122.63148-1-xypron.glpk@gmx.de>
 <CAOnJCUL9-wO2j9_hcm_fh5PxMYoaCne222Y7qMCOx9+u+aVbUg@mail.gmail.com>
Message-ID: <DM6PR04MB62010F0DAAE59D8774E215D48D6F9@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 10 March 2021 00:53
> To: Heinrich Schuchardt <xypron.glpk@gmx.de>
> Cc: OpenSBI <opensbi@lists.infradead.org>; Anup Patel
> <Anup.Patel@wdc.com>; Atish Patra <Atish.Patra@wdc.com>
> Subject: Re: [PATCH 1/1] include: sbi: SBI function IDs for RFENCE extension
> 
> On Tue, Mar 9, 2021 at 3:31 AM Heinrich Schuchardt <xypron.glpk@gmx.de>
> wrote:
> >
> > The SBI function IDs for RFENCE extension must match the SBI
> specification.
> >
> > Signed-off-by: Heinrich Schuchardt <xypron.glpk@gmx.de>
> > ---
> > The same bug exists in the Linux kernel:
> > https://lore.kernel.org/linux-riscv/20210306054801.18263-1-
> xypron.glpk at gmx.de/
> > ---
> >  include/sbi/sbi_ecall_interface.h | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/sbi/sbi_ecall_interface.h
> b/include/sbi/sbi_ecall_interface.h
> > index 7fcb373..559a33e 100644
> > --- a/include/sbi/sbi_ecall_interface.h
> > +++ b/include/sbi/sbi_ecall_interface.h
> > @@ -48,10 +48,10 @@
> >  #define SBI_EXT_RFENCE_REMOTE_FENCE_I          0x0
> >  #define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA       0x1
> >  #define SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID  0x2
> > -#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA      0x3
> > -#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x4
> > -#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA      0x5
> > -#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x6
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID 0x3
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA      0x4
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID 0x5
> > +#define SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA      0x6
> >
> >  /* SBI function IDs for HSM extension */
> >  #define SBI_EXT_HSM_HART_START                 0x0
> > --
> > 2.30.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> 

Applied this patch to the riscv/opensbi repo

Thanks,
Anup
