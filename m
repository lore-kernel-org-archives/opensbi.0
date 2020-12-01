From: Anup Patel <Anup.Patel@wdc.com>
Date: Tue, 1 Dec 2020 16:29:02 +0000
Subject: [PATCH v3 5/5] lib: sbi: Implement System Reset (SRST) SBI
 extension
In-Reply-To: <CAOnJCU+_TMWZKznkBQbv8n3KYqTR02L5J+nrs8rs9-rcci73GQ@mail.gmail.com>
References: <20201125051647.295472-1-anup.patel@wdc.com>
 <20201125051647.295472-6-anup.patel@wdc.com>
 <CAOnJCU+_TMWZKznkBQbv8n3KYqTR02L5J+nrs8rs9-rcci73GQ@mail.gmail.com>
Message-ID: <DM6PR04MB6201367F54B8810FE6E3279D8DF40@DM6PR04MB6201.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Atish Patra <atishp@atishpatra.org>
> Sent: 01 December 2020 13:30
> To: Anup Patel <Anup.Patel@wdc.com>
> Cc: Atish Patra <Atish.Patra@wdc.com>; Alistair Francis
> <Alistair.Francis@wdc.com>; Anup Patel <anup@brainfault.org>; OpenSBI
> <opensbi@lists.infradead.org>
> Subject: Re: [PATCH v3 5/5] lib: sbi: Implement System Reset (SRST) SBI
> extension
> 
> On Tue, Nov 24, 2020 at 9:17 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > The SBI SRST extension has been accepted and merged in the latest SBI
> > v0.3-draft specification.
> > (Refer, https://github.com/riscv/riscv-sbi-doc)
> >
> > It allows to S-mode software to request system shutdown, cold reboot,
> > and warm reboot.
> >
> > This patch implements SBI SRST extension as a replacement of the
> > legacy sbi_shutdown() call of SBI v0.1 specification.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > ---
> >  include/sbi/sbi_ecall.h     |  1 +
> >  lib/sbi/sbi_ecall.c         |  3 ++
> >  lib/sbi/sbi_ecall_replace.c | 60
> > +++++++++++++++++++++++++++++++++++++
> >  3 files changed, 64 insertions(+)
> >
> > diff --git a/include/sbi/sbi_ecall.h b/include/sbi/sbi_ecall.h index
> > 3273ba6..1ef86e2 100644
> > --- a/include/sbi/sbi_ecall.h
> > +++ b/include/sbi/sbi_ecall.h
> > @@ -37,6 +37,7 @@ extern struct sbi_ecall_extension ecall_rfence;
> > extern struct sbi_ecall_extension ecall_ipi;  extern struct
> > sbi_ecall_extension ecall_vendor;  extern struct sbi_ecall_extension
> > ecall_hsm;
> > +extern struct sbi_ecall_extension ecall_srst;
> >
> >  u16 sbi_ecall_version_major(void);
> >
> > diff --git a/lib/sbi/sbi_ecall.c b/lib/sbi/sbi_ecall.c index
> > 64c9933..6d41cff 100644
> > --- a/lib/sbi/sbi_ecall.c
> > +++ b/lib/sbi/sbi_ecall.c
> > @@ -167,6 +167,9 @@ int sbi_ecall_init(void)
> >         if (ret)
> >                 return ret;
> >         ret = sbi_ecall_register_extension(&ecall_hsm);
> > +       if (ret)
> > +               return ret;
> > +       ret = sbi_ecall_register_extension(&ecall_srst);
> >         if (ret)
> >                 return ret;
> >         ret = sbi_ecall_register_extension(&ecall_legacy);
> > diff --git a/lib/sbi/sbi_ecall_replace.c b/lib/sbi/sbi_ecall_replace.c
> > index e460c30..d06dfa2 100644
> > --- a/lib/sbi/sbi_ecall_replace.c
> > +++ b/lib/sbi/sbi_ecall_replace.c
> > @@ -14,6 +14,7 @@
> >  #include <sbi/sbi_error.h>
> >  #include <sbi/sbi_hart.h>
> >  #include <sbi/sbi_ipi.h>
> > +#include <sbi/sbi_system.h>
> >  #include <sbi/sbi_timer.h>
> >  #include <sbi/sbi_tlb.h>
> >
> > @@ -127,3 +128,62 @@ struct sbi_ecall_extension ecall_ipi = {
> >         .extid_end = SBI_EXT_IPI,
> >         .handle = sbi_ecall_ipi_handler,  };
> > +
> > +static int sbi_ecall_srst_handler(unsigned long extid, unsigned long
> funcid,
> > +                                 unsigned long *args, unsigned long *out_val,
> > +                                 struct sbi_trap_info *out_trap) {
> > +       if (funcid == SBI_EXT_SRST_RESET) {
> > +               if ((((u32)-1U) <= ((u64)args[0])) ||
> > +                   (((u32)-1U) <= ((u64)args[1])))
> > +                       return SBI_EINVAL;
> > +
> > +               switch (args[0]) {
> > +               case SBI_SRST_RESET_TYPE_SHUTDOWN:
> > +               case SBI_SRST_RESET_TYPE_COLD_REBOOT:
> > +               case SBI_SRST_RESET_TYPE_WARM_REBOOT:
> > +                       break;
> > +               default:
> > +                       return SBI_ENOTSUPP;
> > +               }
> > +
> > +               switch (args[1]) {
> > +               case SBI_SRST_RESET_REASON_NONE:
> > +               case SBI_SRST_RESET_REASON_SYSFAIL:
> > +                       break;
> > +               default:
> > +                       return SBI_ENOTSUPP;
> > +               }
> > +
> > +               if (sbi_system_reset_supported(args[0], args[1]))
> > +                       sbi_system_reset(args[0], args[1]);
> > +       }
> > +
> > +       return SBI_ENOTSUPP;
> > +}
> > +
> > +static int sbi_ecall_srst_probe(unsigned long extid, unsigned long
> > +*out_val) {
> > +       u32 type, count = 0;
> > +
> > +       /*
> > +        * At least one standard reset types should be supported by
> > +        * the platform for SBI SRST extension to be usable.
> > +        */
> > +
> > +       for (type = 0; type <= SBI_SRST_RESET_TYPE_LAST; type++) {
> > +               if (sbi_system_reset_supported(type,
> > +                                       SBI_SRST_RESET_REASON_NONE))
> > +                       count++;
> > +       }
> > +
> > +       *out_val = (count) ? 1 : 0;
> > +       return 0;
> > +}
> > +
> > +struct sbi_ecall_extension ecall_srst = {
> > +       .extid_start = SBI_EXT_SRST,
> > +       .extid_end = SBI_EXT_SRST,
> > +       .handle = sbi_ecall_srst_handler,
> > +       .probe = sbi_ecall_srst_probe, };
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
> Reviewed-by: Atish Patra <atish.patra@wdc.com>

Applied this patch to the riscv/opensbi repo

Regards,
Anup
