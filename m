From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 4 Aug 2020 03:22:28 +0000
Subject: [PATCH] lib: sbi_misaligned_ldst: Determine transformed
 instruction length correctly
In-Reply-To: <CAOnJCUJmciriWLh2fodRLpHyHa5VkpJf=zqYGOb4qKQXDdP+xA@mail.gmail.com>
References: <20200729120153.127735-1-anup.patel@wdc.com>
 <CAOnJCUJmciriWLh2fodRLpHyHa5VkpJf=zqYGOb4qKQXDdP+xA@mail.gmail.com>
Message-ID: <DM6PR04MB620151975CA1E4D8EDA10F828D4A0@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 30 July 2020 12:13
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH] lib: sbi_misaligned_ldst: Determine transformed
> instruction length correctly
> 
> On Wed, Jul 29, 2020 at 5:02 AM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > If MTINST[0:0] bit is 1 then we have transformed instruction encoding
> > in MTINST CSR. For transformed instructions, if the MTINST[1:1] bit is
> > Zero then original trapped instruction was a 16bit instruction which
> > was converted to 32bit instruction at time of taking trap.
> >
> > We should use MTINST[1:1] bit to determine correct instruction length
> > of transformed instruction.
> >
> > This patch updates misaligned load/store emulation as-per above.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  lib/sbi/sbi_misaligned_ldst.c | 12 ++++++++----
> >  1 file changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_misaligned_ldst.c
> > b/lib/sbi/sbi_misaligned_ldst.c index 29d79bb..964a372 100644
> > --- a/lib/sbi/sbi_misaligned_ldst.c
> > +++ b/lib/sbi/sbi_misaligned_ldst.c
> > @@ -24,7 +24,7 @@ union reg_data {
> >  int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> >                                 struct sbi_trap_regs *regs)  {
> > -       ulong insn;
> > +       ulong insn, insn_len;
> >         union reg_data val;
> >         struct sbi_trap_info uptrap;
> >         int i, fp = 0, shift = 0, len = 0; @@ -35,6 +35,7 @@ int
> > sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> >                  * transformed instruction or custom instruction.
> >                  */
> >                 insn = tinst | INSN_16BIT_MASK;
> > +               insn_len = (tinst & 0x2) ? INSN_LEN(insn) : 2;
> >         } else {
> >                 /*
> >                  * Bit[0] == 0 implies trapped instruction value is @@
> > -45,6 +46,7 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2,
> ulong tinst,
> >                         uptrap.epc = regs->mepc;
> >                         return sbi_trap_redirect(regs, &uptrap);
> >                 }
> > +               insn_len = INSN_LEN(insn);
> >         }
> >
> >         if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) { @@ -134,7 +136,7
> > @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
> >                 SET_F32_RD(insn, regs, val.data_ulong);  #endif
> >
> > -       regs->mepc += INSN_LEN(insn);
> > +       regs->mepc += insn_len;
> >
> >         return 0;
> >  }
> > @@ -142,7 +144,7 @@ int sbi_misaligned_load_handler(ulong addr, ulong
> > tval2, ulong tinst,  int sbi_misaligned_store_handler(ulong addr, ulong
> tval2, ulong tinst,
> >                                  struct sbi_trap_regs *regs)  {
> > -       ulong insn;
> > +       ulong insn, insn_len;
> >         union reg_data val;
> >         struct sbi_trap_info uptrap;
> >         int i, len = 0;
> > @@ -153,6 +155,7 @@ int sbi_misaligned_store_handler(ulong addr, ulong
> tval2, ulong tinst,
> >                  * transformed instruction or custom instruction.
> >                  */
> >                 insn = tinst | INSN_16BIT_MASK;
> > +               insn_len = (tinst & 0x2) ? INSN_LEN(insn) : 2;
> >         } else {
> >                 /*
> >                  * Bit[0] == 0 implies trapped instruction value is @@
> > -163,6 +166,7 @@ int sbi_misaligned_store_handler(ulong addr, ulong
> tval2, ulong tinst,
> >                         uptrap.epc = regs->mepc;
> >                         return sbi_trap_redirect(regs, &uptrap);
> >                 }
> > +               insn_len = INSN_LEN(insn);
> >         }
> >
> >         val.data_ulong = GET_RS2(insn, regs); @@ -233,7 +237,7 @@ int
> > sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
> >                 }
> >         }
> >
> > -       regs->mepc += INSN_LEN(insn);
> > +       regs->mepc += insn_len;
> >
> >         return 0;
> >  }
> > --
> > 2.25.1
> >
> 
> Looks good to me.
> 
> Reviewed-by: Atish Patra <atish.patra@wdc.com>
> 

Applied this patch to the riscv/opensbi repo

Regards,
Anup
