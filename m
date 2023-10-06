From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 17:51:44 +0530
Subject: [PATCH 4/4] lib: sbi: detect extensions from menvcfg
In-Reply-To: <CAMWQL2jdMwV=g5PNz26kk=w9dPHQQR-X5U_cOp+0JmHqEcb7xQ@mail.gmail.com>
References: <20230907092729.11200-1-yongxuan.wang@sifive.com>
 <20230907092729.11200-5-yongxuan.wang@sifive.com> <CAAhSdy2afU0UuO6H52Z9wryehPMk7rifP=dpQdOm9p88K05pvw@mail.gmail.com>
 <CAMWQL2jdMwV=g5PNz26kk=w9dPHQQR-X5U_cOp+0JmHqEcb7xQ@mail.gmail.com>
Message-ID: <CAAhSdy0DYx=uKK7KmSSGV5t4_WzgwvMA3tvUo-Ta--Hh8o1PuQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 27, 2023 at 4:07?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
>
> Hi Anup,
>
>
> On Fri, Sep 22, 2023 at 4:59?PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Thu, Sep 7, 2023 at 2:57?PM Yong-Xuan Wang <yongxuan.wang@sifive.com> wrote:
> > >
> > > Currently "Boot HART ISA Extensions" only shows extensions which can be
> > > detected by test and set their CSRs. We can expand this functionality to
> > > detect additional extensions from menvcfg that do not introduce new CSRs
> > > but are controlled through menvcfg settings.
> >
> > To detect extensions this way, we have to write the CSR and some of the
> > CSR fields can have side effects. For example, the MML bit is a sticky bit
> > and enables ePMP mode.
> >
> > Instead, I suggest detecting extensions from the ISA string provided in the
> > DT. We have already done this for Smepmp extension so it should be easy
> > to extend.
>
> Thank you! I will update it in patch v2.
>
> And at present, OpenSBI employs two mechanisms for extension detection:
> one is parsing ISA string in fdt_parse_isa_extensions(), the other one
> is by testing CSRs in hart_detect_features(). Maybe we can delete the
> CSR testing method and only detect extensions from DT?

Instead of totally abandoning the CSR testing mechanism, I suggest keep
it but for future extensions prefer ISA string parsing (i.e. discover extensions
from DT passed by previous booting stage).

Regards,
Anup

>
> Regards,
> Yong-Xuan
>
>
> >
> > Regards,
> > Anup
> >
> > >
> > > Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> > > ---
> > >  include/sbi/sbi_hart.h |  8 +++++++
> > >  lib/sbi/sbi_hart.c     | 49 ++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 57 insertions(+)
> > >
> > > diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> > > index e60f415..a0e5f58 100644
> > > --- a/include/sbi/sbi_hart.h
> > > +++ b/include/sbi/sbi_hart.h
> > > @@ -42,6 +42,14 @@ enum sbi_hart_extensions {
> > >         SBI_HART_EXT_ZIHPM,
> > >         /** Hart has Smcntrpmf extension */
> > >         SBI_HART_EXT_SMCNTRPMF,
> > > +       /** Hart has Smcntrpmf extension */
> > > +       SBI_HART_EXT_ZICBOZ,
> > > +       /** Hart has Smcntrpmf extension */
> > > +       SBI_HART_EXT_ZICBOM,
> > > +       /** Hart has Smcntrpmf extension */
> > > +       SBI_HART_EXT_SVPBMT,
> > > +       /** Hart has Svadu extension */
> > > +       SBI_HART_EXT_SVADU,
> > >
> > >         /** Maximum index of Hart extension */
> > >         SBI_HART_EXT_MAX,
> > > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > > index b7ca0e6..9a0572e 100644
> > > --- a/lib/sbi/sbi_hart.c
> > > +++ b/lib/sbi/sbi_hart.c
> > > @@ -604,6 +604,18 @@ static inline char *sbi_hart_extension_id2string(int ext)
> > >         case SBI_HART_EXT_SMCNTRPMF:
> > >                 estr = "smcntrpmf";
> > >                 break;
> > > +       case SBI_HART_EXT_ZICBOZ:
> > > +               estr = "zicboz";
> > > +               break;
> > > +       case SBI_HART_EXT_ZICBOM:
> > > +               estr = "zicbom";
> > > +               break;
> > > +       case SBI_HART_EXT_SVPBMT:
> > > +               estr = "svpbmt";
> > > +               break;
> > > +       case SBI_HART_EXT_SVADU:
> > > +               estr = "svadu";
> > > +               break;
> > >         default:
> > >                 break;
> > >         }
> > > @@ -875,6 +887,43 @@ __pmp_skip:
> > >                 __sbi_hart_update_extension(hfeatures,
> > >                                         SBI_HART_EXT_ZIHPM, true);
> > >
> > > +       if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_12) {
> > > +               unsigned long orig_menvcfg_val, menvcfg_val;
> > > +
> > > +               orig_menvcfg_val = csr_read(CSR_MENVCFG);
> > > +               csr_write(CSR_MENVCFG, ~0);
> > > +               menvcfg_val = csr_read(CSR_MENVCFG);
> > > +
> > > +#if __riscv_xlen == 32
> > > +               orig_menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
> > > +               csr_write(CSR_MENVCFGH, ~0);
> > > +               menvcfg_val |= ((uint64_t)csr_read(CSR_MENVCFGH)) << 32;
> > > +#endif
> > > +
> > > +#define __check_ext_menvcfg(__bit, __ext)                              \
> > > +               if (menvcfg_val & (__bit))                              \
> > > +                       __sbi_hart_update_extension(hfeatures,          \
> > > +                                                   __ext, true);       \
> > > +
> > > +               /* If the extension is not implemented, the related fields in
> > > +                * menvcfg are read-only zero.
> > > +                */
> > > +               __check_ext_menvcfg(ENVCFG_CBZE, SBI_HART_EXT_ZICBOZ);
> > > +               __check_ext_menvcfg(ENVCFG_CBCFE |
> > > +                                   (ENVCFG_CBIE_INV << ENVCFG_CBIE_SHIFT),
> > > +                                   SBI_HART_EXT_ZICBOM);
> > > +               __check_ext_menvcfg(ENVCFG_PBMTE, SBI_HART_EXT_SVPBMT);
> > > +               __check_ext_menvcfg(ENVCFG_HADE, SBI_HART_EXT_SVADU);
> > > +
> > > +#undef __check_ext_menvcfg
> > > +
> > > +               csr_write(CSR_MENVCFG, orig_menvcfg_val);
> > > +#if __riscv_xlen == 32
> > > +               csr_write(CSR_MENVCFGH, orig_menvcfg_val >> 32);
> > > +#endif
> > > +
> > > +       }
> > > +
> > >         /* Mark hart feature detection done */
> > >         hfeatures->detected = true;
> > >
> > > --
> > > 2.17.1
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi

