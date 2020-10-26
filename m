From: Atish Patra <atishp@atishpatra.org>
Date: Sun, 25 Oct 2020 23:47:04 -0700
Subject: [PATCH v3 1/2] lib: sbi: Detect PMP granularity and number of
 address bits
In-Reply-To: <DM6PR04MB62010A2F8E9F29A575001BD88D180@DM6PR04MB6201.namprd04.prod.outlook.com>
References: <20201023224712.3837103-1-atish.patra@wdc.com>
 <20201023224712.3837103-2-atish.patra@wdc.com>
 <CAAhSdy16VS==d+uzMjhU+U2W+YZhiNA3i+kbPG2HYLoZDNr79g@mail.gmail.com>
 <CAOnJCU+v+Ta_=C1xCxm9aiLQqDbeFuSn0Gza19rApp=MZ589pQ@mail.gmail.com>
 <DM6PR04MB62010A2F8E9F29A575001BD88D180@DM6PR04MB6201.namprd04.prod.outlook.com>
Message-ID: <CAOnJCUK_Utdy4AOUzMFmJoHNbEsQB9hGsA72JebGt71FePJnDw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Oct 24, 2020 at 9:32 PM Anup Patel <Anup.Patel@wdc.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Atish Patra <atishp@atishpatra.org>
> > Sent: 25 October 2020 03:06
> > To: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <Atish.Patra@wdc.com>; Anup Patel
> > <Anup.Patel@wdc.com>; OpenSBI <opensbi@lists.infradead.org>
> > Subject: Re: [PATCH v3 1/2] lib: sbi: Detect PMP granularity and number of
> > address bits
> >
> > On Sat, Oct 24, 2020 at 12:02 AM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sat, Oct 24, 2020 at 4:17 AM Atish Patra <atish.patra@wdc.com> wrote:
> > > >
> > > > As per RISC-V privilege specification, a platform may choose to
> > > > implement a coarser granularity scheme for PMP addresses. In that
> > > > case, we shouldn't allow any pmp region size smaller than the
> > > > platform supports. A platform may not also implement all the bits
> > > > for a PMP address specified in the priv specification.
> > > >
> > > > The pmp range granularity and address bits should be detected
> > > > dynamically before detecing PMP regions. Any pmp modification
> > > > request beyond these detected value must not succeed.
> > > >
> > > > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > > > ---
> > > >  include/sbi/sbi_hart.h |  2 ++
> > > >  lib/sbi/sbi_hart.c     | 66
> > ++++++++++++++++++++++++++++++++++++++----
> > > >  2 files changed, 63 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h index
> > > > 3ac150036c79..ec9e30f913ce 100644
> > > > --- a/include/sbi/sbi_hart.h
> > > > +++ b/include/sbi/sbi_hart.h
> > > > @@ -39,6 +39,8 @@ unsigned int sbi_hart_mhpm_count(struct
> > > > sbi_scratch *scratch);  void sbi_hart_delegation_dump(struct sbi_scratch
> > *scratch,
> > > >                               const char *prefix, const char
> > > > *suffix);  unsigned int sbi_hart_pmp_count(struct sbi_scratch
> > > > *scratch);
> > > > +unsigned long sbi_hart_pmp_granularity(struct sbi_scratch
> > > > +*scratch); unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch
> > > > +*scratch);
> > > >  int sbi_hart_pmp_configure(struct sbi_scratch *scratch);  bool
> > > > sbi_hart_has_feature(struct sbi_scratch *scratch, unsigned long
> > > > feature);  void sbi_hart_get_features_str(struct sbi_scratch
> > > > *scratch, diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index
> > > > 8ded82841d82..00613babcbdc 100644
> > > > --- a/lib/sbi/sbi_hart.c
> > > > +++ b/lib/sbi/sbi_hart.c
> > > > @@ -30,6 +30,8 @@ void (*sbi_hart_expected_trap)(void) =
> > > > &__sbi_expected_trap;  struct hart_features {
> > > >         unsigned long features;
> > > >         unsigned int pmp_count;
> > > > +       unsigned int pmp_addr_bits;
> > > > +       unsigned long pmp_gran;
> > > >         unsigned int mhpm_count;
> > > >  };
> > > >  static unsigned long hart_features_offset; @@ -159,16 +161,37 @@
> > > > unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)
> > > >         return hfeatures->pmp_count;  }
> > > >
> > > > +unsigned long sbi_hart_pmp_granularity(struct sbi_scratch *scratch)
> > > > +{
> > > > +       struct hart_features *hfeatures =
> > > > +                       sbi_scratch_offset_ptr(scratch,
> > > > +hart_features_offset);
> > > > +
> > > > +       return hfeatures->pmp_gran;
> > > > +}
> > > > +
> > > > +unsigned int sbi_hart_pmp_addrbits(struct sbi_scratch *scratch) {
> > > > +       struct hart_features *hfeatures =
> > > > +                       sbi_scratch_offset_ptr(scratch,
> > > > +hart_features_offset);
> > > > +
> > > > +       return hfeatures->pmp_addr_bits; }
> > > > +
> > > >  int sbi_hart_pmp_configure(struct sbi_scratch *scratch)  {
> > > >         struct sbi_domain_memregion *reg;
> > > >         struct sbi_domain *dom = sbi_domain_thishart_ptr();
> > > > -       unsigned int pmp_idx = 0, pmp_flags;
> > > > +       unsigned int pmp_idx = 0, pmp_flags, pmp_bits,
> > > > + pmp_gran_log2;
> > > >         unsigned int pmp_count = sbi_hart_pmp_count(scratch);
> > > > +       unsigned long pmp_addr = 0, pmp_addr_max = 0;
> > > >
> > > >         if (!pmp_count)
> > > >                 return 0;
> > > >
> > > > +       pmp_gran_log2 = log2roundup(sbi_hart_pmp_granularity(scratch));
> > > > +       pmp_bits = sbi_hart_pmp_addrbits(scratch);
> > > > +       pmp_addr_max = (1UL << pmp_bits) | ((1UL << pmp_bits) - 1);
> > >
> > > The PMP addr bits are detected one less. See comments below.
> > >
> > > Once PMP addr bits value is corrected, the pmp_addr_max computation
> > > needs to be fixed here.
> > >
> > > > +
> > > >         sbi_domain_for_each_memregion(dom, reg) {
> > > >                 if (pmp_count <= pmp_idx)
> > > >                         break;
> > > > @@ -183,7 +206,14 @@ int sbi_hart_pmp_configure(struct sbi_scratch
> > *scratch)
> > > >                 if (reg->flags & SBI_DOMAIN_MEMREGION_MMODE)
> > > >                         pmp_flags |= PMP_L;
> > > >
> > > > -               pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
> > > > +               pmp_addr =  reg->base >> PMP_SHIFT;
> > > > +               if (pmp_gran_log2 <= reg->order && pmp_addr <
> > pmp_addr_max)
> > > > +                       pmp_set(pmp_idx++, pmp_flags, reg->base, reg->order);
> > > > +               else {
> > > > +                       sbi_printf("Can not configure pmp for domain %s", dom-
> > >name);
> > > > +                       sbi_printf("because memory region address %lx or size %lx is
> > not in range\n",
> > > > +                                   reg->base, reg->order);
> > > > +               }
> > > >         }
> > > >
> > > >         return 0;
> > > > @@ -282,11 +312,26 @@ done:
> > > >                 sbi_strncpy(features_str, "none", nfstr);  }
> > > >
> > > > +static unsigned long hart_pmp_get_allowed_addr(void) {
> > > > +       unsigned long val = 0;
> > > > +       struct sbi_trap_info trap = {0};
> > > > +
> > > > +       csr_write_allowed(CSR_PMPADDR0, (ulong)&trap,
> > PMP_ADDR_MASK);                   \
> > > > +       if (!trap.cause) {
> > > > +               val = csr_read_allowed(CSR_PMPADDR0, (ulong)&trap);
> > > > +               if (trap.cause)
> > > > +                       val = 0;
> > > > +       }
> > > > +
> > > > +       return val;
> > > > +}
> > > > +
> > > >  static void hart_detect_features(struct sbi_scratch *scratch)  {
> > > >         struct sbi_trap_info trap = {0};
> > > >         struct hart_features *hfeatures;
> > > > -       unsigned long val;
> > > > +       unsigned long val, msb, lsb;
> > > >
> > > >         /* Reset hart features */
> > > >         hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
> > > > @@ -332,8 +377,19 @@ static void hart_detect_features(struct
> > sbi_scratch *scratch)
> > > >         __check_csr_32(__csr + 0, __rdonly, __wrval, __field, __skip)   \
> > > >         __check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
> > > >
> > > > -       /* Detect number of PMP regions */
> > > > -       __check_csr_64(CSR_PMPADDR0, 0, 1UL, pmp_count, __pmp_skip);
> > > > +       /**
> > > > +        * Detect the allowed address bits & granularity. At least PMPADDR0
> > > > +        * should be implemented.
> > > > +        */
> > > > +       val = hart_pmp_get_allowed_addr();
> > > > +       if (val) {
> > > > +               lsb = __ffs(val);
> > > > +               msb = __fls(val);
> > > > +               hfeatures->pmp_gran =  1 << (lsb + 2);
> > > > +               hfeatures->pmp_addr_bits = msb;
> > >
> > > This has to be "hfeatures->pmp_addr_bits = msb + 1" because __fls()
> > returns
> > > bit position and not bit count.
> > >
> >
> > Yes. I am aware of that. In v2, I had msb+1. I changed it to because
> > pmp_addr_bits
> > to indicate the highest bit position(after doing PMP_SHIFT) rather
> > than number of bits.
> > Since, we are not representing the size, bit position seems to be more
> > apt for this.
> >
> > Let me know if you prefer to store the size of the maximum encoded
> > address rather than
> > bits.
>
> addr_size = 1UL << addr_bits
>
> For example, on QEMU RV32 we have 32bits implemented in PMPADDR
> and bit positions are from bit0 to bit31. Also address space size is
> 4GB (= 1UL << 32).
>
> The above indicates that MSB position is not the size of address space
> rather (MSB + 1) is the size of address space.
>
> > > Also, "lsb" and "msb" variables seem redundant here. Please remove
> > > these if you can.
> > >
> > > > +               /* Detect number of PMP regions. At least PMPADDR0 should
> > be implemented*/
> > > > +               __check_csr_64(CSR_PMPADDR0, 0, val, pmp_count,
> > __pmp_skip);
> > > > +       }
> > > >  __pmp_skip:
> > > >
> > > >         /* Detect number of MHPM counters */
> > > > --
> > > > 2.25.1
> > > >
> > > >
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > >
> > > My apologies for the last minute comments.
> > >
> > > I tried this patch on QEMU RV32 and it showed me PMP address
> > > bits as 31 instead of 32.
> > >
> >
> > Yes. It is intentional.
>
> No problem.
>
> We have two options here:
> 1) Rename "hfeatures->pmp_addr_bits" to " hfeatures->pmp_addr_msb"
> and rename sbi_hart_pmp_addrbits() to sbi_hart_pmp_addrmsb()
> 2) Set "hfeatures->pmp_addr_bits = __fls(val) + 1" and update
> pmp_addr_max calculation accordingly
>
> I am fine with both of the options. My concern is semantics and
> not the implementation here.
>

ok. I will update the patch as per option 2. Sorry for the confusion.
I misunderstood your comment.

> Regards,
> Anup



-- 
Regards,
Atish

