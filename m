From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Jun 2022 16:21:28 +0530
Subject: [PATCH 1/2] lib: sbi_illegal_insn: Constify illegal_insn_table
In-Reply-To: <CAAhSdy39KPsBzvmgbO2Vo-ADC5ocjn-nXRYmpb4d5+7qoZDVBQ@mail.gmail.com>
References: <20220529182531.30377-1-samuel@sholland.org> <CAAhSdy39KPsBzvmgbO2Vo-ADC5ocjn-nXRYmpb4d5+7qoZDVBQ@mail.gmail.com>
Message-ID: <CAAhSdy1M5mFkesG9sinGMQKRreWtOZBJaYtr1sCkkv4v-+6Chg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 30, 2022 at 11:30 AM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, May 29, 2022 at 11:55 PM Samuel Holland <samuel@sholland.org> wrote:
> >
> > This table does not need to be modified at runtime.
> >
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> >
> >  lib/sbi/sbi_illegal_insn.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
> > index bfe7d61..39ef990 100644
> > --- a/lib/sbi/sbi_illegal_insn.c
> > +++ b/lib/sbi/sbi_illegal_insn.c
> > @@ -80,7 +80,7 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
> >         return 0;
> >  }
> >
> > -static illegal_insn_func illegal_insn_table[32] = {
> > +static const illegal_insn_func illegal_insn_table[32] = {
> >         truly_illegal_insn, /* 0 */
> >         truly_illegal_insn, /* 1 */
> >         truly_illegal_insn, /* 2 */
> > --
> > 2.35.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

