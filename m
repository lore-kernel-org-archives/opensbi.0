From: Guo Ren <guoren@kernel.org>
Date: Tue, 13 Jun 2023 10:31:40 +0800
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <20230612-graveness-uncloak-5f3634a45339@spud>
References: <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
 <20230524-vertebrae-slip-84584f5bb65b@wendy> <CAJF2gTQPyyi5twqdboo=4t0KgP0RqgOpqd0PX239PQZKC-Z8Uw@mail.gmail.com>
 <20230524-claw-obligate-e4815c3e232b@spud> <0115F3EA-6071-4876-A50B-CCCB6496FBB6@jrtc27.com>
 <20230524-climate-citrus-4959e052bf56@spud> <CAJF2gTRgE2ceqZ7Ddi6NwT++qFGEzK-YZ4gg9mYPwTSUKiTwRw@mail.gmail.com>
 <B31C373E-7DDF-43A5-B855-DB664C940C7B@kernel.org> <CAJF2gTT-PkUUceDR8d3GXq4v40daJuNQ6rFHzLTAkLA_=ie=cA@mail.gmail.com>
 <CAJF2gTQNXncSUcDh0SfbRwb2GrKn7DeoQ_pgOfERXbLZ9yS_jg@mail.gmail.com> <20230612-graveness-uncloak-5f3634a45339@spud>
Message-ID: <CAJF2gTSV-+cGj-1R6VumTqHmUt0PKJSEjrCoq5hMnBsLrg4jcw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 12, 2023 at 11:39?PM Conor Dooley <conor@kernel.org> wrote:
>
> On Mon, Jun 12, 2023 at 08:57:36AM +0800, Guo Ren wrote:
> > Hi Conor,
> >
> > Jisheng Zhang would update the Linux yaml patch, here is the final dts
> > format of the reset controller:
> >
> >                reset-controller at ffff019050 {
> >                        compatible = "thead,cpu-reset";
> >                        reg = <0xff 0xff019050 0x0 0x4>, <0xff
> > 0xff015004 0x0 0x0>;
> >                        reset-ctrl = <0x1c>;
> >                        clone-csrs = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3
> > 0x7c5 0x7cc 0x7ce>;
> >                 };
> >
> > The reset-ctrl is used to control different parts of soc, generally, a
> > bit indicates a reset signal (a core/a interconnect/a subsystem).
>
> So what is "reset-ctrl"? Values to write into a register? A register
> address?
It's a values, and every bit indicate a reset signal.

> Should this stuff be represented as a proper reset controller, with a
> "resets" property in each of the controlled nodes w/ a phandle + index?
> It's hard to say with your explanation here :/ Is there some
> documentation in English that I could look at? Unfortunately that's only
> language I speak that anyone writes technical docs in.
Sorry, there is no exact document about reset-ctrl, becasue every SoC
customers has some little difference here.

For SoC intergration, every t-head CPU would give a reset signal, and
SoC customer could intergrate them into their own reset control
register, generally, every bit indicate a reset signal. Some of them
would combine it with their SoC bus reset signal, so we provide a
flexiable/undefined setting value here.

This has been implemented in opensbi, and we have used it many years :)
https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/reset/fdt_reset_thead.c

val = fdt_getprop(fdt, nodeoff, "control-reg", &len);
if (len > 0 && val) {
p = (void *)(ulong)fdt64_to_cpu(*val);

val_w = fdt_getprop(fdt, nodeoff, "control-val", &len);
if (len > 0 && val_w) {
tmp = fdt32_to_cpu(*val_w);
tmp |= readl(p);
writel(tmp, p);
}
}


>
> Thanks,
> Conor.



-- 
Best Regards
 Guo Ren

