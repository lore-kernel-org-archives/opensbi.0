From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 1 Sep 2020 05:00:16 +0000
Subject: [PATCH v3 3/5] lib: sbi: Detect and print MHPM counters at
 boot-time
In-Reply-To: <CAOnJCUL6YmpY4av7_tyFcsqXrneWmHAk+LDv=DExp_9U+jLkEA@mail.gmail.com>
References: <20200828034012.144048-1-anup.patel@wdc.com>
 <20200828034012.144048-4-anup.patel@wdc.com>
 <CAOnJCUL6YmpY4av7_tyFcsqXrneWmHAk+LDv=DExp_9U+jLkEA@mail.gmail.com>
Message-ID: <DM6PR04MB6201D4961260244C02152F948D2E0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 01 September 2020 01:47
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH v3 3/5] lib: sbi: Detect and print MHPM counters at boot-
> time
> 
> On Thu, Aug 27, 2020 at 8:41 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > A RISC-V platform can leave unimplemented MHPM counters hard-wired
> to
> > zero. We extend hart_detect_features() to detect MHPM counters which
> > are accessible and not hard-wired to zero. We also print number of
> > available MHPM counters as part of boot prints.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_hart.h |  1 +
> >  lib/sbi/sbi_hart.c     | 17 +++++++++++++++++
> >  lib/sbi/sbi_init.c     |  1 +
> >  3 files changed, 19 insertions(+)
> >
> > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h index
> > c2ea686..1e1eb67 100644
> > --- a/include/sbi/sbi_hart.h
> > +++ b/include/sbi/sbi_hart.h
> > @@ -35,6 +35,7 @@ static inline ulong sbi_hart_expected_trap_addr(void)
> >         return (ulong)sbi_hart_expected_trap;  }
> >
> > +unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch);
> >  void sbi_hart_delegation_dump(struct sbi_scratch *scratch);  unsigned
> > int sbi_hart_pmp_count(struct sbi_scratch *scratch);  int
> > sbi_hart_pmp_get(struct sbi_scratch *scratch, unsigned int n, diff
> > --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c index 8f31d58..2211c3c
> > 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -28,6 +28,7 @@ void (*sbi_hart_expected_trap)(void) =
> > &__sbi_expected_trap;  struct hart_features {
> >         unsigned long features;
> >         unsigned int pmp_count;
> > +       unsigned int mhpm_count;
> >  };
> >  static unsigned long hart_features_offset;
> >
> > @@ -135,6 +136,14 @@ void sbi_hart_delegation_dump(struct sbi_scratch
> > *scratch)  #endif  }
> >
> > +unsigned int sbi_hart_mhpm_count(struct sbi_scratch *scratch) {
> > +       struct hart_features *hfeatures =
> > +                       sbi_scratch_offset_ptr(scratch,
> > +hart_features_offset);
> > +
> > +       return hfeatures->mhpm_count;
> > +}
> > +
> >  unsigned int sbi_hart_pmp_count(struct sbi_scratch *scratch)  {
> >         struct hart_features *hfeatures = @@ -339,6 +348,7 @@ static
> > void hart_detect_features(struct sbi_scratch *scratch)
> >         hfeatures = sbi_scratch_offset_ptr(scratch, hart_features_offset);
> >         hfeatures->features = 0;
> >         hfeatures->pmp_count = 0;
> > +       hfeatures->mhpm_count = 0;
> >
> >  #define __check_csr(__csr, __rdonly, __wrval, __field, __skip) \
> >         val = csr_read_allowed(__csr, (ulong)&trap);                    \
> > @@ -382,6 +392,13 @@ static void hart_detect_features(struct sbi_scratch
> *scratch)
> >         __check_csr_64(CSR_PMPADDR0, 0, PMP_ADDR_MASK, pmp_count,
> > __pmp_skip);
> >  __pmp_skip:
> >
> > +       /* Detect number of MHPM counters */
> > +       __check_csr(CSR_MHPMCOUNTER3, 0, 1UL, mhpm_count,
> __mhpm_skip);
> > +       __check_csr_4(CSR_MHPMCOUNTER4, 0, 1UL, mhpm_count,
> __mhpm_skip);
> > +       __check_csr_8(CSR_MHPMCOUNTER8, 0, 1UL, mhpm_count,
> __mhpm_skip);
> > +       __check_csr_16(CSR_MHPMCOUNTER16, 0, 1UL, mhpm_count,
> > +__mhpm_skip);
> > +__mhpm_skip:
> > +
> >  #undef __check_csr_64
> >  #undef __check_csr_32
> >  #undef __check_csr_16
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c index
> > c438eaa..e1a1d96 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -70,6 +70,7 @@ static void sbi_boot_prints(struct sbi_scratch *scratch,
> u32 hartid)
> >         sbi_hart_get_features_str(scratch, str, sizeof(str));
> >         sbi_printf("BOOT HART Features  : %s\n", str);
> >         sbi_printf("BOOT HART PMP Count : %d\n",
> > sbi_hart_pmp_count(scratch));
> > +       sbi_printf("BOOT HART MHPM Count: %d\n",
> > + sbi_hart_mhpm_count(scratch));
> >
> >         /* Firmware details */
> >         sbi_printf("Firmware Base       : 0x%lx\n", scratch->fw_start);
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
> 
> 
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
