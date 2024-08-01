From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Thu, 1 Aug 2024 10:45:20 -0700
Subject: [RFC PATCH] include: Adjust Sscofpmf mhpmevent mask for upper 8 bits
In-Reply-To: <CAAhSdy23qdUQOETAUSjGLUJoHBroacLbbup3xJecnkhyPt_dSg@mail.gmail.com>
References: <20240730093022.11665-1-eric.lin@sifive.com> <CAAhSdy23qdUQOETAUSjGLUJoHBroacLbbup3xJecnkhyPt_dSg@mail.gmail.com>
Message-ID: <CAHBxVyEZ8QwH1DvsRfm+w-f_=T6tva4jXVVnVtpLxw0JbEwrtQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 1, 2024 at 7:34?AM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Jul 30, 2024 at 3:00?PM Eric Lin <eric.lin@sifive.com> wrote:
> >
> > Currently, OpenSBI reserves the upper 16 bits in mhpmevent for
> > the Sscofpmf extension.
> >
> > However, according to the Sscofpmf extension specification[1],
> > it only defines the upper 8 bits in mhpmevent for privilege mode
> > inhibit and counter overflow disable. Other bits are defined by
> > the platform for event selection.
> >
> > Since vendors might define raw event encoding exceeding 48 bits in
> > mhpmevent, we should adjust the MHPMEVENT_SSCOF_MASK to support it.
> >
> > Link: https://github.com/riscvarchive/riscv-count-overflow [1]
> > Signed-off-by: Eric Lin <eric.lin@sifive.com>
>
> Actually, only the upper 6 bits of mhpmevent CSR are defined as-per
> Sscofpmf in the integrated Priv spec.
>

That may be the result of an integration issue. I cross checked the
ratified spec
which had 8 bits allocated (56:57 are reserved). The Smcntrpmf extension in the
integrated spec also have 8 bits citing sscofpmf example. I have filed
an issue in isa manual repo for clarification

https://github.com/riscv/riscv-isa-manual/issues/1578

> I have updated this patch accordingly at the time of merging this patch.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
>
> Applied this patch to the riscv/opensbi repo.
>
> Thanks,
> Anup
>
> > ---
> >  include/sbi/riscv_encoding.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> > index 477fa3a1..2ed05f24 100644
> > --- a/include/sbi/riscv_encoding.h
> > +++ b/include/sbi/riscv_encoding.h
> > @@ -207,7 +207,7 @@
> >
> >  #endif
> >
> > -#define MHPMEVENT_SSCOF_MASK           _ULL(0xFFFF000000000000)
> > +#define MHPMEVENT_SSCOF_MASK           _ULL(0xFF00000000000000)
> >
> >  #define ENVCFG_STCE                    (_ULL(1) << 63)
> >  #define ENVCFG_PBMTE                   (_ULL(1) << 62)
> > --
> > 2.43.2
> >

