From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Nov 2021 10:57:03 +0530
Subject: [PATCH v5 1/3] lib: sbi: move sbi_boot_print_general()
In-Reply-To: <CAAhSdy2oEpwnnHR=JypWwtyD_un8i320rU2=xaowzq5i+SVa2A@mail.gmail.com>
References: <20211106095451.13200-1-heinrich.schuchardt@canonical.com>
 <20211106095451.13200-2-heinrich.schuchardt@canonical.com>
 <CAAhSdy2oEpwnnHR=JypWwtyD_un8i320rU2=xaowzq5i+SVa2A@mail.gmail.com>
Message-ID: <CAAhSdy1DSrGFobVhEOeuZotDeTwa2CRfZK4eCcvtBzoeNsmxMQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Nov 6, 2021 at 4:14 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sat, Nov 6, 2021 at 3:24 PM Heinrich Schuchardt
> <heinrich.schuchardt@canonical.com> wrote:
> >
> > Moving the sbi_boot_print_general() call after the
> > sbi_platform_final_init() call allows to print devices initialized in the
> > latter.
> >
> > To keep the overall print sequence the same also move
> > sbi_boot_print_domains().
> >
> > Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

>
> Regards,
> Anup
>
> > ---
> > v5:
> >         move sbi_boot_print_domains() too
> > v4:
> >         no change
> > v3:
> >         no change
> > v2:
> >         new patch
> > ---
> >  lib/sbi/sbi_init.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> > index 843659e..765c7b6 100644
> > --- a/lib/sbi/sbi_init.c
> > +++ b/lib/sbi/sbi_init.c
> > @@ -293,8 +293,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >                 sbi_hart_hang();
> >         }
> >
> > -       sbi_boot_print_general(scratch);
> > -
> >         /*
> >          * Note: Finalize domains after HSM initialization so that we
> >          * can startup non-root domains.
> > @@ -308,8 +306,6 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >                 sbi_hart_hang();
> >         }
> >
> > -       sbi_boot_print_domains(scratch);
> > -
> >         rc = sbi_hart_pmp_configure(scratch);
> >         if (rc) {
> >                 sbi_printf("%s: PMP configure failed (error %d)\n",
> > @@ -328,6 +324,10 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >                 sbi_hart_hang();
> >         }
> >
> > +       sbi_boot_print_general(scratch);
> > +
> > +       sbi_boot_print_domains(scratch);
> > +
> >         sbi_boot_print_hart(scratch, hartid);
> >
> >         wake_coldboot_harts(scratch, hartid);
> > --
> > 2.32.0
> >

