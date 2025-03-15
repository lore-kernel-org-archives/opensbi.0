From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 15 Mar 2025 16:49:59 +0530
Subject: [PATCH 2/2] lib: sbi_ipi: Return error for invalid hartids
In-Reply-To: <20250315-3b8fa85cf3a12cf25ebda46e@orel>
References: <20250314163021.154530-4-ajones@ventanamicro.com>
 <20250314163021.154530-6-ajones@ventanamicro.com> <c3d6baae077d2ee5015e709edd477002f23a8fe1.camel@126.com>
 <20250315-3b8fa85cf3a12cf25ebda46e@orel>
Message-ID: <CAK9=C2W9bv9rEB2OKf=cXj9WR=T_1ygCwJ+NOdMtec=EjJaiNQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Mar 15, 2025 at 4:20?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Mar 15, 2025 at 12:19:30PM +0800, Xiang W wrote:
> > ? 2025-03-14?? 17:30 +0100?Andrew Jones???
> > > sbi_send_ipi() should return SBI_ERR_INVALID_PARAM if even one hartid
> > > constructed from hart_mask_base and hart_mask, is not valid.
> > >
> > > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > > ---
> > >  lib/sbi/sbi_ipi.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
> > > index 52898d302376..2de459b089ff 100644
> > > --- a/lib/sbi/sbi_ipi.c
> > > +++ b/lib/sbi/sbi_ipi.c
> > > @@ -116,6 +116,11 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> > >     struct sbi_domain *dom = sbi_domain_thishart_ptr();
> > >     struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
> > >
> > > +   if (hmask == 0 && hbase != -1UL) {
> > > +           /* Nothing to do, but it's not an error either. */
> > > +           return 0;
> > > +   }
> > > +
> > A modification here would change the original intent of the function.
> > lib/sbi/sbi_system.c#L72 will eventually call sbi_ipi_send_many(0, -1, ...)
>
> How could the above condition affect that call where hbase == -1? This
> condition explicitly checks that hbase != -1.
>
> > for sending ipi interrupts to all harts, this modification breaks
> > sbi_system_reset
>
> Is that an assertion based on a failed test? Because it looks like it
> should still work to me.
>
> (kvm-unit-tests SBI testing also tests IPI broadcast, and it's still
> passing.)

sbi_ipi_send_many() is an internal function used from a variety of
places. Xiang concern is correct because for system reset should
HALT all CPUs before issuing the actual platform specific reset
operation. If we have to change something then sbi_ipi_send_smode()
is the right place because that's the function called via SBI calls.

Now hart_mask = 0 and hart_mask_base = -1UL are indeed valid
parameters and represents "All HARTs" as-per SBI spec. Refer,
the following text from "3.1. Hart list parameter":

"In a single SBI function call, the maximum number of harts that
can be set is always XLEN. If a lower privilege mode needs to
pass information about more than XLEN harts, it must invoke the
SBI function multiple times. hart_mask_base can be set to -1 to
indicate that hart_mask shall be ignored and all available harts
must be considered."

In the "Table 7. IPI Send Errors" should be further refined to say
the following for SBI_ERR_INVALID_PARAM:

"At least one hartid constructed from hart_mask_base and
hart_mask as-per section 3.1 , is not valid, i.e. either the hartid
is not enabled by the platform or is not available to the supervisor."

Regards,
Anup

>
> drew
>
> >
> > Regards,
> > Xiang W
> > >     /* Find the target harts */
> > >     rc = sbi_hsm_hart_interruptible_mask(dom, &target_mask);
> > >     if (rc)
> > > @@ -123,6 +128,7 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> > >
> > >     if (hbase != -1UL) {
> > >             struct sbi_hartmask tmp_mask = { 0 };
> > > +           int count = sbi_popcount(hmask);
> > >
> > >             for (i = hbase; hmask; i++, hmask >>= 1) {
> > >                     if (hmask & 1UL)
> > > @@ -130,6 +136,9 @@ int sbi_ipi_send_many(ulong hmask, ulong hbase, u32 event, void *data)
> > >             }
> > >
> > >             sbi_hartmask_and(&target_mask, &target_mask, &tmp_mask);
> > > +
> > > +           if (sbi_hartmask_weight(&target_mask) != count)
> > > +                   return SBI_EINVAL;
> > >     }
> > >
> > >     /* Send IPIs */
> > > --
> > > 2.48.1
> > >
> >

