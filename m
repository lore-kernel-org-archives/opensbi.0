From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 25 Sep 2020 09:06:02 +0000
Subject: [PATCH] lib: sbi: Fix PMP CSR detection
In-Reply-To: <DM6PR04MB62019E55ADA2B2209DF5CFC38D360@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20200923071417.19000-1-pragnesh.patel@sifive.com>
 <CAOnJCU+UEw66ckVM1TG=0T1vnxEKyZdgMNGoTKOwgdVvr6QDTA@mail.gmail.com>
 <DM6PR04MB62019E55ADA2B2209DF5CFC38D360@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <DM6PR04MB6201B12041247C404E313E6B8D360@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Anup Patel
> Sent: 25 September 2020 08:28
> To: Atish Patra <atishp@atishpatra.org>; Pragnesh Patel
> <pragnesh.patel@sifive.com>
> Cc: Yash Shah <yash.shah@sifive.com>; Bin Meng <bmeng.cn@gmail.com>;
> Sagar Shrikant Kadam <sagar.kadam@sifive.com>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: RE: [PATCH] lib: sbi: Fix PMP CSR detection
> 
> 
> 
> > -----Original Message-----
> > From: opensbi <opensbi-bounces@lists.infradead.org> On Behalf Of Atish
> > Patra
> > Sent: 25 September 2020 01:09
> > To: Pragnesh Patel <pragnesh.patel@sifive.com>
> > Cc: Yash Shah <yash.shah@sifive.com>; Bin Meng
> <bmeng.cn@gmail.com>;
> > Sagar Shrikant Kadam <sagar.kadam@sifive.com>; OpenSBI
> > <opensbi@lists.infradead.org>
> > Subject: Re: [PATCH] lib: sbi: Fix PMP CSR detection
> >
> > On Wed, Sep 23, 2020 at 12:36 AM Pragnesh Patel
> > <pragnesh.patel@sifive.com> wrote:
> > >
> > > HiFive unleashed currently implements fewer than 56 bits of physical
> > > address so existing PMP CSR detection is broken.
> > >
> > > PMP address register encodes bits 55-2 of a 56-bit physical address,
> > > Not all physical address bits may be implemented, So just check
> > > minimum 1 bit.
> > >
> > It's good to add .
> > As per the privilege spec,
> >
> > Are there any other usecase for PMP_ADDR_MASK in future? If not, we
> > can remove that as well.
> 
> Based on this fix, (as a separate test) it will be good if we can detect number
> of physical address bits implemented by RISC-V platform when atleast one
> PMPADDRx CSR is available. This will require PMP_ADDR_MASK define.
> 
> >
> > > Fixes: 74d1db706293 ("lib: sbi: Improve PMP CSR detection and
> > > progamming")
> > >
> > > Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> > > ---
> > >  lib/sbi/sbi_hart.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index
> > > 4cbe8ce..6413194 100644
> > > --- a/lib/sbi/sbi_hart.c
> > > +++ b/lib/sbi/sbi_hart.c
> > > @@ -403,7 +403,7 @@ static void hart_detect_features(struct
> > > sbi_scratch
> > *scratch)
> > >         __check_csr_32(__csr + 32, __rdonly, __wrval, __field,
> > > __skip)
> > >
> > >         /* Detect number of PMP regions */
> > > -       __check_csr_64(CSR_PMPADDR0, 0, PMP_ADDR_MASK,
> pmp_count,
> > __pmp_skip);
> > > +       __check_csr_64(CSR_PMPADDR0, 0, 1UL, pmp_count, __pmp_skip);
> > >  __pmp_skip:
> > >
> > >         /* Detect number of MHPM counters */
> > > --
> > > 2.17.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> > Otherwise,
> >
> > Reviewed-by: Atish Patra <atish.patra@wdc.com>
> 
> Looks good to me.
> 
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

