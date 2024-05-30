From: Pope B.Lei <popeblei@gmail.com>
Date: Thu, 30 May 2024 10:56:50 +0800
Subject: [PATCH v1] "Reset registers to enhance robustness."
In-Reply-To: <5bd477ae147a02b0cb9f349c8ac7481ed6211f83.camel@126.com>
References: <20240529073747.505-1-popeblei@gmail.com> <5bd477ae147a02b0cb9f349c8ac7481ed6211f83.camel@126.com>
Message-ID: <CAECSvgbgZYwnsiS4PNsSU+BMb36a0-E2YP2CQz-oizFOxi8FPg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dear Xiang:
     You are right. In actual use, I will add an operation to set the
parameter to a fixed value. However, since this is just an operation
in the DV environment, I didn't push it.

    Referring to the approach of the kernel, my understanding is that
it is worthwhile to clean up irrelevant content in the context during
a switch.
    https://patchwork.kernel.org/project/linux-mm/patch/20190624054311.30256-17-hch at lst.de/

Regards,
B.Lei

On Thu, May 30, 2024 at 9:08?AM Xiang W <wxjstz@126.com> wrote:
>
> ? 2024-05-29???? 15:37 +0800?Pope B.Lei???
> > Signed-off-by: Pope B.Lei <popeblei@gmail.com>
> > ---
> > V1: If the registers are not initialized, they may remain in an x-state in certain DV verification environments due to the lack of written
> > values, causing the x-state to propagate during the boot process. Adding register initialization enhances robustness.
>
> In DV system, all registers should be written to prevent the existence of registers
> in x-state state. _reset_regs cannot write all registers for parameter passing. If
> all registers are written, it will affect the function of opensbi.
>
> So I don't think it's a good way to stop a register from having x-state state.
>
> Regards,
> Xiang W
>
> >  firmware/fw_base.S | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> > index b950c0b..10889a9 100644
> > --- a/firmware/fw_base.S
> > +++ b/firmware/fw_base.S
> > @@ -36,6 +36,8 @@
> >       .globl _start
> >       .globl _start_warm
> >  _start:
> > +     /* Reset registers to enhance robustness. */
> > +     call    _reset_regs
> >       /* Find preferred boot HART id */
> >       MOV_3R  s0, a0, s1, a1, s2, a2
> >       call    fw_boot_hart
> > --
> > 2.35.2.windows.1
> >
> >
>

