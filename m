From: Anup Patel <anup@brainfault.org>
Date: Tue, 21 Jun 2022 09:51:45 +0530
Subject: [PATCH 2/3] lib: sbi: Fixup tinst for exceptions in sbi_misaligned_*()
In-Reply-To: <CAAhSdy2T=tVgsxCPS+A36x39idwnSQSg+TbA_Bt11QthYSbg9w@mail.gmail.com>
References: <TYYP286MB1439F38753D033042F83C8E0C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14399AD2F6CFFB0CECD334E9C6A79@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <CAAhSdy2T=tVgsxCPS+A36x39idwnSQSg+TbA_Bt11QthYSbg9w@mail.gmail.com>
Message-ID: <CAAhSdy0_wCu+q7LtCGM2CVGRWjd4HHwguwwTgU=kuUGpKDmPSA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jun 17, 2022 at 12:15 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Thu, Jun 9, 2022 at 12:38 PM dramforever <dramforever@live.com> wrote:
> >
> > If there is an exception while emulating a misaligned load/store, fixup
> > uptrap.tinst before redirecting. Otherwise, HS-mode software may receive
> > an htinst describing the lbu/sb instruction that faulted during
> > emulation[1].
> >
> > [1]: https://github.com/riscv-software-src/opensbi/issues/258
> >
> > Signed-off-by: dramforever <dramforever@live.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >  lib/sbi/sbi_misaligned_ldst.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
> > index c879ce7..fd11798 100644
> > --- a/lib/sbi/sbi_misaligned_ldst.c
> > +++ b/lib/sbi/sbi_misaligned_ldst.c
> > @@ -22,6 +22,18 @@ union reg_data {
> >         u64 data_u64;
> >  };
> >
> > +static ulong sbi_misaligned_tinst_fixup(ulong orig_tinst, ulong new_tinst,
> > +                                       ulong addr_offset)
> > +{
> > +       if (new_tinst == INSN_PSEUDO_VS_LOAD ||
> > +           new_tinst == INSN_PSEUDO_VS_STORE)
> > +               return new_tinst;
> > +       else if (orig_tinst == 0)
> > +               return 0UL;
> > +       else
> > +               return orig_tinst | (addr_offset << SH_RS1);
> > +}
> > +
> >  int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> >                                 struct sbi_trap_regs *regs)
> >  {
> > @@ -126,6 +138,8 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> >                                                 &uptrap);
> >                 if (uptrap.cause) {
> >                         uptrap.epc = regs->mepc;
> > +                       uptrap.tinst = sbi_misaligned_tinst_fixup(
> > +                               tinst, uptrap.tinst, i);
> >                         return sbi_trap_redirect(regs, &uptrap);
> >                 }
> >         }
> > @@ -238,6 +252,8 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
> >                              &uptrap);
> >                 if (uptrap.cause) {
> >                         uptrap.epc = regs->mepc;
> > +                       uptrap.tinst = sbi_misaligned_tinst_fixup(
> > +                               tinst, uptrap.tinst, i);
> >                         return sbi_trap_redirect(regs, &uptrap);
> >                 }
> >         }
> > --
> > 2.36.0
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

