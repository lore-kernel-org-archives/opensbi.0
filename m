From: Atish Kumar Patra <atishp@rivosinc.com>
Date: Fri, 18 Feb 2022 09:58:51 -0800
Subject: [PATCH] lib: sbi: Enable M-mode external interrupt only for AIA
In-Reply-To: <150088D8-33AF-4598-87BE-98CD40222CDB@jrtc27.com>
References: <20220218165641.1811334-1-atishp@rivosinc.com>
 <3F6B2BA1-72B1-4BDD-ACD5-ACD8A6CD0A45@jrtc27.com>
 <CAK9=C2WoMxWnMgDK2GVRm22EitSZBozhjnN7UNTW9Yy8QTGnuQ@mail.gmail.com>
 <150088D8-33AF-4598-87BE-98CD40222CDB@jrtc27.com>
Message-ID: <CAHBxVyFtZNPikmOvjW4JkN4tW3QFY5CqUdD74BK9TKskXirRgA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 18, 2022 at 9:47 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 18 Feb 2022, at 17:11, Anup Patel <apatel@ventanamicro.com> wrote:
> >
> > On Fri, Feb 18, 2022 at 10:34 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> On 18 Feb 2022, at 16:56, Atish Patra <atishp@rivosinc.com> wrote:
> >>>
> >>> Some platforms may inject spurious M-mode external interrupt if
> >>> the external interrupt bit is enabled in mie. We really don't
> >>> need to enable M-mode external interrupts for platforms without
> >>> AIA. This issue is observed in HiFive unmatched.
> >>>
> >>> Keep the M-mode external interrupt disabled for non-AIA platforms.
> >>
> >> Is this for UART1 (https://forums.sifive.com/t/spurious-interrupts-from-m-2-e-key-uart1/5478)?
> >>
> >> Seems to be OpenSBI should not be enabling any external interrupts in
> >> the PLIC that it doesn?t want, which should render this patch
> >> unnecessary (though you could perhaps argue you still might as well not
> >> unmask external interrupts if you don?t expect any). Otherwise you just
> >> risk the same thing happening for AIA hardware and needing to do the
> >> proper fix at a later date.
> >
> > On platforms with IMSIC, the IPIs are through IMSIC since there is no
> > CLINT or MSWI on these platforms. To support IPIs over IMSIC, we have
> > to enable external interrupt on platforms with IMSIC.
> >
> > Unfortunately, this leads to possible spurious interrupts on platforms
> > (e.g. SiFive Unmatched) with traditional PLIC.
>
> Why? If you correctly configure the PLIC you shouldn?t get any, surely?
>
All M-mode interrupt contexts are disabled in PLIC.
https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/fdt/fdt_fixup.c#L114
This code has been there from ages.

The spurious external interrupt happens once Linux kernel invokes wfi.
I am assuming this is a hardware
bug where M-mode external interrupts are generated even if PLIC
contexts are disabled.

The issue only happens after the patch
55e79f823dfa (lib: sbi: Enable mie.MEIE bit for IPIs based on external
interrupts.)

> Jess
>
> > Regards,
> > Anup
> >
> >>
> >> As it stands this patch is quite dubious without further exploration
> >> and explanation of where these external interrupts are coming from.
> >>
> >> Jess
> >>
> >>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> >>> ---
> >>> lib/sbi/sbi_init.c | 14 ++++++++++++--
> >>> 1 file changed, 12 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
> >>> index 6876eb2f0f22..76b7c5d953ec 100644
> >>> --- a/lib/sbi/sbi_init.c
> >>> +++ b/lib/sbi/sbi_init.c
> >>> @@ -276,7 +276,12 @@ static void __noreturn init_coldboot(struct sbi_scratch *scratch, u32 hartid)
> >>>                         __func__, rc);
> >>>              sbi_hart_hang();
> >>>      }
> >>> -     csr_set(CSR_MIE, MIP_MEIP);
> >>> +     /**
> >>> +      * HiFive unmatched platform generates spurious interrupt if external
> >>> +      * interrupt is enabled in mie. Enable it only if AIA is present.
> >>> +      */
> >>> +     if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
> >>> +             csr_set(CSR_MIE, MIP_MEIP);
> >>>
> >>>      rc = sbi_ipi_init(scratch, TRUE);
> >>>      if (rc) {
> >>> @@ -377,7 +382,12 @@ static void init_warm_startup(struct sbi_scratch *scratch, u32 hartid)
> >>>      rc = sbi_platform_irqchip_init(plat, FALSE);
> >>>      if (rc)
> >>>              sbi_hart_hang();
> >>> -     csr_set(CSR_MIE, MIP_MEIP);
> >>> +     /**
> >>> +      * HiFive unmatched platform generates spurious interrupt if external
> >>> +      * interrupt is enabled in mie. Enable it only if AIA is present.
> >>> +      */
> >>> +     if (sbi_hart_has_feature(scratch, SBI_HART_HAS_AIA))
> >>> +             csr_set(CSR_MIE, MIP_MEIP);
> >>>
> >>>      rc = sbi_ipi_init(scratch, FALSE);
> >>>      if (rc)
> >>> --
> >>> 2.30.2
> >>>
> >>>
> >>> --
> >>> opensbi mailing list
> >>> opensbi at lists.infradead.org
> >>> http://lists.infradead.org/mailman/listinfo/opensbi
> >>
> >>
> >> --
> >> opensbi mailing list
> >> opensbi at lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/opensbi
>

