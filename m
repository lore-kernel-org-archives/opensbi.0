From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 1 Nov 2022 13:20:29 +0300
Subject: [PATCH RFC v1 1/1] lib: sbi: add support for debug triggers
In-Reply-To: <6aaa58fd3e049b77a3caee7c3a016412a8e54ee8.camel@126.com>
References: <20221031211859.910439-1-geomatsi@gmail.com>
 <6aaa58fd3e049b77a3caee7c3a016412a8e54ee8.camel@126.com>
Message-ID: <Y2Dy7Y4hsrb+LcPH@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


Hi Xiang W and all,

> > RISC-V Debug specification includes Sdtrig ISA extension.
> > This extension describes Trigger Module. Triggers can cause
> > a breakpoint exception, entry into Debug Mode, or a trace
> > action without having to execute a special instruction. For
> > native debugging triggers can be used to implement hardware
> > breakpoints and watchpoints.
> > 
> > Software support for RISC-V hardware triggers consists of the
> > following major components:
> > - U-mode: gdb support for setting hw breakpoints/watchpoints
> > - S/VS-mode: hardware breakpoints framework in Linux kernel
> > - M-mode: SBI firmware code to handle triggers
> > 
> > SBI Debug Trigger extension proposal (draft v4) has been posted
> > by Anup Patel to lists.riscv.org tech-debug mailing list:
> > 
> > https://lists.riscv.org/g/tech-debug/topic/92375492
> > 
> > This patch provides initial implementation of SBI Debug
> > Trigger Extension in OpenSBI library based on the
> > suggested extension proposal.
> > 
> > Initial implementation has the following limitations:
> > - only mcontrol6 trigger type is supported
> > - no support for chained triggers
> > - trigger update supports only address change

...

> > +int sbi_dbtr_num_trig(unsigned long data, unsigned long *out)
> > +{
> > +???????unsigned long type = ((union riscv_dbtr_tdata1)data).type;
> 
> chain need to be care. If chain=1, we need to find the number of
> consecutive pairs of trigger.

There can be more than two triggers in chained configuration.
So I would suggest to check the availability of suitable
consecutive triggers in sbi_dbtr_install_trig handler.

> > +???????u32 hartid = current_hartid();
> > +???????unsigned long total = 0;
> > +???????int i;
> > +
> > +
> > +???????if (data == 0) {
> > +???????????????sbi_dprintf("%s: hart%d: total triggers: %u\n",
> > +?????????????????????????? __func__, hartid, total_trigs);
> > +???????????????*out = total_trigs;
> > +???????????????return SBI_SUCCESS;
> > +???????}
> > +
> > +???????for (i = 0; i < total_trigs; i++) {
 
> If only RISCV_DBTR_TRIG_MCONTROL6 is supported, do we need to find other
> types of triggers?

The idea is to add support for more types, e.g. icount and mcontrol.

> > +???????/* Check requested triggers configuration */
> > +???????for (k = 0; k < trig_count; k++) {
> > +???????????????recv = (struct sbi_dbtr_data_msg *)(in_addr + k * sizeof(*recv));
> > +???????????????ctrl = (union riscv_dbtr_tdata1_mcontrol6)recv->tdata1;
> > +
> > +???????????????if (ctrl.type != RISCV_DBTR_TRIG_MCONTROL6) {
> 
> why not support RISCV_DBTR_TRIG_MCONTROL?

Well, new debug spec recommends to use mcontrol6. But, as it was pointed
out in other review comments, there exists hardware which supports
mcontrol but not mcontrol6. So we have to be able to fall-back to using
mcontrol when needed.

Regards,
Sergey

