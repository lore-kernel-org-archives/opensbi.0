From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 17:24:01 +0530
Subject: [PATCH 2/2] lib: sbi_illegal_insn: Add emulation for fence.tso
In-Reply-To: <CAAhSdy2qJNafqQnQfYvR1fUop2siv7eDNYQU6WMz61ui_7FuNQ@mail.gmail.com>
References: <20220529182531.30377-1-samuel@sholland.org> <20220529182531.30377-2-samuel@sholland.org>
 <CAAhSdy2qJNafqQnQfYvR1fUop2siv7eDNYQU6WMz61ui_7FuNQ@mail.gmail.com>
Message-ID: <CAAhSdy0VLbMt=MXBq4xWys9wkfX+TOBZW9mFxRjDT1hj5ty=SA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 11:38 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, May 29, 2022 at 11:55 PM Samuel Holland <samuel@sholland.org> wrote:
> >
> > While OpenC906 appears to properly decode `fence.tso` as a fence
> > instruction[1], the version of the C906 taped out in the Allwinner D1
> > does not, and raises illegal instruction.
> >
> > Handle this errata by emulating `fence.tso` as `fence rw, rw`.
> >
> > [1]: https://github.com/T-head-Semi/openc906/blob/30827e7f/C906_RTL_FACTORY/gen_rtl/idu/rtl/aq_idu_id_decd.v#L2097
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> > ---
> >
> >  lib/sbi/sbi_illegal_insn.c | 14 +++++++++++++-
> >  1 file changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> > index 39ef990..44c9385 100644
> > --- a/lib/sbi/sbi_illegal_insn.c
> > +++ b/lib/sbi/sbi_illegal_insn.c
> > @@ -8,6 +8,7 @@
> >   */
> >
> >  #include <sbi/riscv_asm.h>
> > +#include <sbi/riscv_barrier.h>
> >  #include <sbi/riscv_encoding.h>
> >  #include <sbi/sbi_bitops.h>
> >  #include <sbi/sbi_emulate_csr.h>
> > @@ -32,6 +33,17 @@ static int truly_illegal_insn(ulong insn, struct sbi_trap_regs *regs)
> >         return sbi_trap_redirect(regs, &trap);
> >  }
> >
> > +static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
> > +{
> > +       /* Errata workaround: emulate `fence.tso` as `fence rw, rw`. */
> > +       if (insn == 0x8330000fUL) {
>
> Instead of hard-coding "fence.tso" encoding, I suggest to add match
> and mask defines in riscv_encoding.h.
>
> Something like this:
> #define INSN_MATCH_FENCE_TSO 0x8330000f
> #define INSN_MASK_FENCE_TSO 0xffffffff
>
> > +               smp_mb();
> > +               return 0;
> > +       }
> > +
> > +       return truly_illegal_insn(insn, regs);
> > +}
> > +
> >  static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
> >  {
> >         int do_write, rs1_num = (insn >> 15) & 0x1f;
> > @@ -84,7 +96,7 @@ static const illegal_insn_func illegal_insn_table[32] = {
> >         truly_illegal_insn, /* 0 */
> >         truly_illegal_insn, /* 1 */
> >         truly_illegal_insn, /* 2 */
> > -       truly_illegal_insn, /* 3 */
> > +       misc_mem_opcode_insn, /* 3 */
> >         truly_illegal_insn, /* 4 */
> >         truly_illegal_insn, /* 5 */
> >         truly_illegal_insn, /* 6 */
> > --
> > 2.35.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi
>
> Apart from a minor comment above, this looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

I have taken care of the minor comment at the time of merging
this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> Regards,
> Anup

