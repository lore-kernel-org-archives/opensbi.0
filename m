From: Conor Dooley <conor.dooley@microchip.com>
Date: Wed, 24 May 2023 07:42:53 +0100
Subject: [RFC PATCH 2/2] lib: reset: thead: Correct the naming convention
 of dts
In-Reply-To: <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
References: <20230523094649.4100554-1-guoren@kernel.org>
 <20230523094649.4100554-3-guoren@kernel.org>
 <20230523-manatee-providing-77413fac0c58@spud>
 <CAJF2gTSR1LzGyzxLWWst+4M_nKWXBA=v8=zY-42-ODGU_aO-Lg@mail.gmail.com>
Message-ID: <20230524-vertebrae-slip-84584f5bb65b@wendy>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, May 24, 2023 at 09:17:11AM +0800, Guo Ren wrote:
> On Tue, May 23, 2023 at 11:51?PM Conor Dooley <conor@kernel.org> wrote:
> > On Tue, May 23, 2023 at 05:46:49AM -0400, guoren at kernel.org wrote:
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Correct the naming convention to fit Linux kernel upstream rule.
> >
> > Understatement of the year contender? ;)
> >
> > This is a backwards incompatible change, based on suggestions that I
> > made on LKML, with a view to creating a yaml binding for this thing.
> > Everyone else might disagree with me, but I think "proper" bindings
> > should be written for this stuff so that use would be common across SBI
> > providers etc *but* in doing so do you not want to keep OpenSBI
> > backwards compatible with the markdown "binding" in the process?
> > Skimming this patch, the old way of doing things would no longer work?
> There is no upstreamed usage of the old way, which used in old frozen
> version of opensbi & custom linux. So I can accept the change in the
> new version opensbi & Linux.

Okay, cool.

> > > Link: https://lore.kernel.org/linux-riscv/CAJF2gTRG5edPnVmhMtv67OANpOynL0br0wcrQCave88_KkyZcg at mail.gmail.com/
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Signed-off-by: Guo Ren <guoren@kernel.org>
> > > Cc: Conor Dooley <conor.dooley@microchip.com>
> > > Cc: Jisheng Zhang <jszhang@kernel.org>
> > > Cc: Wei Fu <wefu@redhat.com>
> > > ---
> > >  docs/platform/thead-c9xx.md       | 21 +++++-------
> > >  lib/utils/reset/fdt_reset_thead.c | 57 +++++++++++++++----------------
> > >  2 files changed, 35 insertions(+), 43 deletions(-)
> > >
> > > diff --git a/docs/platform/thead-c9xx.md b/docs/platform/thead-c9xx.md
> > > index 8bb9e91f1a9b..35cca94b5bb9 100644
> > > --- a/docs/platform/thead-c9xx.md
> > > +++ b/docs/platform/thead-c9xx.md
> > > @@ -19,9 +19,6 @@ because it uses generic platform.
> > >  CROSS_COMPILE=riscv64-linux-gnu- PLATFORM=generic /usr/bin/make
> > >  ```
> > >
> > > -The *T-HEAD C9xx* DTB provided to OpenSBI generic firmwares will usually have
> > > -"riscv,clint0", "riscv,plic0", "thead,reset-sample" compatible strings.
> > > -
> > >  DTS Example1: (Single core, eg: Allwinner D1 - c906)
> > >  ----------------------------------------------------
> > >
> > > @@ -75,8 +72,8 @@ DTS Example1: (Single core, eg: Allwinner D1 - c906)
> > >       }
> > >  ```
> > >
> > > -DTS Example2: (Multi cores with soc reset-regs)
> > > ------------------------------------------------
> > > +DTS Example2: (Multi cores, eg: T-HEAD th1520 - c910)
> > > +-----------------------------------------------------
> > >
> > >  ```
> > >       cpus {
> > > @@ -143,13 +140,11 @@ DTS Example2: (Multi cores with soc reset-regs)
> > >               compatible = "simple-bus";
> > >               ranges;
> > >
> > > -             reset: reset-sample {
> > > -                     compatible = "thead,reset-sample";
> > > -                     entry-reg = <0xff 0xff019050>;
> > > -                     entry-cnt = <4>;
> > > -                     control-reg = <0xff 0xff015004>;
> > > -                     control-val = <0x1c>;
> > > -                     csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc>;
> > > +             reset-controller at ffff019050 {
> > > +                     compatible = "thead,th1520-cpu-reset";
> > > +                     reg = <0xff 0xff019050 0x0 0x4>, <0xff 0xff015004 0x0 0x0>;
> > > +                     reset-ctrl-val = <0x1c>;
> > > +                     csr-copy = <0x7f3 0x7c0 0x7c1 0x7c2 0x7c3 0x7c5 0x7cc 0x7ce>;
> >
> > I also did not suggest either rest-ctrl-val or csr-copy, as both are
> > surely able to be determined from match data based on the compatible
> > string.
> I want to keep them in dts to be modified flexiable. This driver is
> not only for th1520, but for bunches of  T-HEAD SoCs, th1520 is a
> sample/example for us.
> 
> Of cause, some of vendors would develop their own chip reset flow
> (Allwinner, Sopho), but this one would be easier for hardware guys to
> modify dtb without compling some stuffs.

I am not a maintainer of OpenSBI, but I would differentiate "people
doing SoC bringup work" who can totally have hacked together things
that read these values from properties in a dtb & what should be
upstreamed/shipped.
When you, or someone else, asks me to review some dt stuff I am going
to only consider the latter. You are always going to have hacked
together things that you use during SoC bringup - the dts is probably
only the start.

My understanding is that Allwinner and Sopho are SoC vendors, so all
they have to do is add a new compatible string when they settle on their
final magic values & pull the information out of match data. So Sopho
would do something like "sopho,magic-carpet-cpu-reset" etc etc.

> Does the "reset-ctrl-val & csr-copy" violate any rule of dts?

"reset-ctrl-val" certainly goes against "do not put register values in
the dts". Both of them go against adding special properties for things
that are known based on the compatible string.

Cheers,
Conor.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230524/02eea703/attachment.sig>
