From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Tue, 13 Dec 2022 22:43:20 +0300
Subject: [PATCH RFC v2 2/2] lib: sbi: add support for debug triggers
In-Reply-To: <cd24a0c91272bf5e636c90c2071f6e22bd500cf9.camel@126.com>
References: <20221203213929.206429-1-geomatsi@gmail.com>
 <20221203213929.206429-3-geomatsi@gmail.com>
 <92833f1aeda3262f4ccb4b7fc796ee4de36c7ef0.camel@126.com>
 <Y5Ta7XTiBLwRmxBe@curiosity>
 <cd24a0c91272bf5e636c90c2071f6e22bd500cf9.camel@126.com>
Message-ID: <Y5jV2CPg9nDmOvfO@curiosity>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

> > > > RISC-V Debug specification includes Sdtrig ISA extension.
> > > > This extension describes Trigger Module. Triggers can cause
> > > > a breakpoint exception, entry into Debug Mode, or a trace
> > > > action without having to execute a special instruction. For
> > > > native debugging triggers can be used to implement hardware
> > > > breakpoints and watchpoints.
> > > > 
> > > > Software support for triggers consists of the following
> > > > major components:
> > > > - U-mode: gdb
> > > > - S-mode: hardware breakpoints framework in Linux kernel
> > > > - M-mode: SBI firmware code to handle triggers
> > > > 
> > > > SBI Debug Trigger extension proposal has been posted by
> > > > Anup Patel to lists.riscv.org tech-debug mailing list:
> > > > https://lists.riscv.org/g/tech-debug/topic/92375492
> > > > 
> > > > This patch provides initial implementation of SBI Debug
> > > > Trigger Extension in OpenSBI library based on the
> > > > suggested extension proposal.
> > > > 
> > > > Initial implementation has the following limitations:
> > > > - supported triggers: mcontrol, mcontrol6
> > > > - no support for chained triggers
> > > > - only build test for RV32
> > 
> > ... [snip]
> > 
> > > > +struct sbi_dbtr_trig_info {
> > > > +???????unsigned long type_mask;
> > > > +???????union sbi_dbtr_trig_state state;
> > > > +???????unsigned long tdata1;
> > > > +???????unsigned long tdata2;
> > > > +???????unsigned long tdata3;
> > > tdata1~tdata3 can be removed and written directly to scr during install
> > 
> > We need to write those values not only when we install triggers. We have
> > to rewrite them when we re-enable triggers after disabling or updating.
> > So I think it is more convenient to keep the whole state at hand.
> 
> when install, write directly to tdata1~data3
> when read, read from tdata1~tdata3, and OR the vs/vu/s/u bits in trig_status with tdata1  
> when disable, clear vs/vu/s/u in tdata1 
> when enable, write vs/vu/s/u in trig_state to tdata1

Ok for these four.

> when updat, Only need write recv to tdata2

Not for this one. You may need to update tdata1 as well. Besides, nothing
in spec requires hardware to support partial trigger updates on the fly.
On the other hand, we can read all CSRs, update some, and write back.
Ok, I agree that there is a value in saving quite a few extra bytes.
I will double-check this approach for v3.

Regards,
Sergey

