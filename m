From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 3 May 2022 10:17:39 +0530
Subject: [PATCH 00/11] OpenSBI compile-time C arrays
In-Reply-To: <F7A1D799-E427-4EF6-B14C-37E437AD7B01@jrtc27.com>
References: <CAK9=C2V7W7kS_sKVNJj7wEnAhM=btm7qbU6NUfynvNky3SvnyQ@mail.gmail.com>
 <7794A83B-A583-4372-BA36-C2B7BB0B11AB@jrtc27.com>
 <CAK9=C2WVYxKAhh1Dw9dAkr99nMEZnkd3j51NCyYEG37OifP74w@mail.gmail.com>
 <02D056F0-6FC5-4EAA-A27F-B0B2F31BF5AE@jrtc27.com>
 <CAAhSdy1VZbxSmg2xUL1Tn9bjBDmW3fsL6+uaD3cs4wGsP1yhvw@mail.gmail.com>
 <F7A1D799-E427-4EF6-B14C-37E437AD7B01@jrtc27.com>
Message-ID: <CAK9=C2X7zcM8f0rdA8ZpEgRaEYkW1=F-_qrPYik2PBdv3T6hXQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 3, 2022 at 10:15 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 3 May 2022, at 05:30, Anup Patel <anup@brainfault.org> wrote:
> >
> > On Tue, May 3, 2022 at 9:53 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>
> >> On 3 May 2022, at 05:17, Anup Patel <apatel@ventanamicro.com> wrote:
> >>>
> >>> On Tue, May 3, 2022 at 9:43 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>>
> >>>> On 3 May 2022, at 05:04, Anup Patel <apatel@ventanamicro.com> wrote:
> >>>>>
> >>>>> ?On Tue, May 3, 2022 at 9:24 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>>>>
> >>>>>> [resent cc?ing list?]
> >>>>>>
> >>>>>>> On 3 May 2022, at 04:52, Anup Patel <apatel@ventanamicro.com> wrote:
> >>>>>>>
> >>>>>>> ?On Tue, May 3, 2022 at 9:12 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >>>>>>>>
> >>>>>>>>> On 3 May 2022, at 04:38, Anup Patel <apatel@ventanamicro.com> wrote:
> >>>>>>>>>
> >>>>>>>>> ?This series aims at removing hard-coded C arrays for drivers and modules
> >>>>>>>>> in OpenSBI sources and replace it with dynamically generated arrays at
> >>>>>>>>> compile-time. External firmwares which use OpenSBI as library will have
> >>>>>>>>> to create these arrays separately because they typically don't use OpenSBI
> >>>>>>>>> build system.
> >>>>>>>>
> >>>>>>>> Why not use linker sets? No scripts needed.
> >>>>>>>
> >>>>>>> The problem is we can't assume anything about the build system of external
> >>>>>>> firmware which use OpenSBI as library.
> >>>>>>
> >>>>>>
> >>>>>> They require no build system support. Unlike your patch.
> >>>>>
> >>>>> With this series, they don't need to change anything in their build
> >>>>> system. For example:
> >>>>> 1) If they want to use fdt_serial_uart8250.c then they directly use
> >>>>> "struct fdt_serial fdt_serial_uart8250"
> >>>>> 2) If they want to use fdt_serial.c then they can create custom
> >>>>> "struct fdt_serial *fdt_serial_drivers[]" with their desired drivers
> >>>>>
> >>>>> If we go with a separate linker section then external firmwares
> >>>>> will also require a separate linker section. They will also need
> >>>>> to take care of relocations and dynamic linking for this special
> >>>>> linker section if the external firmware uses -fPIC.
> >>>>
> >>>> No they don?t. They just need to link in the object file like normal and it just works. Do you actually know what a linker set is and how it is used? Because it sounds like you haven?t encountered them before, or have and misunderstand them. They?re really quite convenient and perfect for this kind of thing. It?s what FreeBSD uses for all its drivers, and I assume Linux too.
> >>>
> >>> You are missing my point. The is about not breaking things for
> >>> external firmware which use OpenSBI as library. It's not about
> >>> whether we can add special linker section for OpenSBI firmwares.
> >>
> >> I don?t understand what the relevance of that is. It?s an
> >> implementation detail consumers, including of libsbi, don?t need to
> >> care about.
> >
> > You don't care about breaking things for external (non-OpenSBI)
> > firmwares but as maintainer I have to care about it.
>
> I do care about it and am not suggesting breaking things either. I just
> fail to understand what the breakage you see is; this is more
> disruptive in that it introduces new object files, whereas linker sets
> would not.
>
> > External firmware use not just lib/sbi but they also use lib/utils
> > which contain various drivers.
>
> I don?t see what difference this makes. With a linker set, anything
> that used fdt_serial.o for example would continue to function the same,
> just via a different implementation, and anything that manually used a
> specific driver would be unaffected as it wouldn?t use those code paths.
>
> >>> You are welcome to send alternate patch series with special
> >>> linker section.
> >>
> >> Sure, but that requires a lot more time that I don?t have than pointing
> >> out a better (in my opinion, at least) way to achieve your goals than
> >> your patch series. FreeBSD has a BSD-2-clause licensed header file at
> >> sys/sys/linker_set.h that provides macros for declaring, adding to and
> >> iterating over linker sets, for what it?s worth.
> >
> > In past, I have written linker based modules and dynamic module
> > loading from scratch in Xvisor. I am well aware how linker scripts work
> > so be careful when making judgmental statements about me. Try to
> > understand the rationale of any series before commenting. It is also
> > amazing to see that you always have time to comment/argue on the
> > mailing list but never have time to send patches to this project or
> > other RISC-V specs.
>
> Ok, I only asked because you seemed to be making factually inaccurate
> statements about how linker sets work and their requirements. Yes, I
> make more comments than patches for OpenSBI, it?s orders of magnitude
> quicker to do that, but ?never? is inaccurate, I have sent patches in
> the past to OpenSBI. I?m also RISC-V psABI co-chair so have my fair
> share of RISC-V spec contributions there. Not that that should matter
> in any way. So please let?s keep this respectful rather than resorting
> to personal attacks, whether accurate or (in this case) not.

Same applies to you as well. Keep things respectful rather than
making judgemental comments or personal attacks.

Regards,
Anup

>
> Jess
>
> > Regards,
> > Anup
> >
> >>
> >> Jess
> >>
> >>> Regards,
> >>> Anup
> >>>
> >>>>
> >>>> Jess
> >>>>
> >>>>> Regards,
> >>>>> Anup
> >>>>>
> >>>>> "
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >>>>>>
> >>>>>> Jess
> >>>>>>
> >>>>>>> Regards,
> >>>>>>> Anup
> >>>>>>>
> >>>>>>>>
> >>>>>>>> Jess
> >>>>>>>>
> >>>>>>>>> These patches can also be found in generated_carray_v1 branch at:
> >>>>>>>>> https://github.com/avpatel/opensbi.git
> >>>>>>>>>
> >>>>>>>>> Anup Patel (11):
> >>>>>>>>> Makefile: Allow generated C source to be anywhere in build directory
> >>>>>>>>> Makefile: Add support for generating C array at compile time
> >>>>>>>>> lib: utils/reset: Generate FDT reset driver list at compile-time
> >>>>>>>>> lib: utils/serial: Generate FDT serial driver list at compile-time
> >>>>>>>>> lib: utils/timer: Generate FDT timer driver list at compile-time
> >>>>>>>>> lib: utils/irqchip: Generate FDT irqchip driver list at compile-time
> >>>>>>>>> lib: utils/ipi: Generate FDT ipi driver list at compile-time
> >>>>>>>>> lib: utils/i2c: Generate FDT i2c adapter driver list at compile-time
> >>>>>>>>> lib: utils/gpio: Generate FDT gpio driver list at compile-time
> >>>>>>>>> platform: generic: Generate platform override module list at
> >>>>>>>>> compile-time
> >>>>>>>>> platform: generic: Move Sifive platform overrides into own directory
> >>>>>>>>>
> >>>>>>>>> Makefile | 17 +++-
> >>>>>>>>> include/sbi_utils/gpio/fdt_gpio.h | 2 +
> >>>>>>>>> lib/utils/gpio/fdt_gpio.c | 18 ++---
> >>>>>>>>> lib/utils/gpio/fdt_gpio_drivers.carray | 3 +
> >>>>>>>>> lib/utils/gpio/objects.mk | 4 +
> >>>>>>>>> lib/utils/i2c/fdt_i2c.c | 14 ++--
> >>>>>>>>> lib/utils/i2c/fdt_i2c_adapter_drivers.carray | 3 +
> >>>>>>>>> lib/utils/i2c/objects.mk | 4 +
> >>>>>>>>> lib/utils/ipi/fdt_ipi.c | 12 ++-
> >>>>>>>>> lib/utils/ipi/fdt_ipi_drivers.carray | 3 +
> >>>>>>>>> lib/utils/ipi/objects.mk | 4 +
> >>>>>>>>> lib/utils/irqchip/fdt_irqchip.c | 16 ++--
> >>>>>>>>> lib/utils/irqchip/fdt_irqchip_drivers.carray | 3 +
> >>>>>>>>> lib/utils/irqchip/objects.mk | 8 ++
> >>>>>>>>> lib/utils/reset/fdt_reset.c | 22 ++----
> >>>>>>>>> lib/utils/reset/fdt_reset_drivers.carray | 3 +
> >>>>>>>>> lib/utils/reset/objects.mk | 12 +++
> >>>>>>>>> lib/utils/serial/fdt_serial.c | 28 ++-----
> >>>>>>>>> lib/utils/serial/fdt_serial_drivers.carray | 3 +
> >>>>>>>>> lib/utils/serial/objects.mk | 16 ++++
> >>>>>>>>> lib/utils/timer/fdt_timer.c | 12 ++-
> >>>>>>>>> lib/utils/timer/fdt_timer_drivers.carray | 3 +
> >>>>>>>>> lib/utils/timer/objects.mk | 4 +
> >>>>>>>>> platform/generic/objects.mk | 3 +-
> >>>>>>>>> platform/generic/platform.c | 14 ++--
> >>>>>>>>> .../generic/platform_override_modules.carray | 3 +
> >>>>>>>>> .../{sifive_fu540.c => sifive/fu540.c} | 0
> >>>>>>>>> .../{sifive_fu740.c => sifive/fu740.c} | 0
> >>>>>>>>> platform/generic/sifive/objects.mk | 9 +++
> >>>>>>>>> scripts/carray.sh | 77 +++++++++++++++++++
> >>>>>>>>> 30 files changed, 224 insertions(+), 96 deletions(-)
> >>>>>>>>> create mode 100644 lib/utils/gpio/fdt_gpio_drivers.carray
> >>>>>>>>> create mode 100644 lib/utils/i2c/fdt_i2c_adapter_drivers.carray
> >>>>>>>>> create mode 100644 lib/utils/ipi/fdt_ipi_drivers.carray
> >>>>>>>>> create mode 100644 lib/utils/irqchip/fdt_irqchip_drivers.carray
> >>>>>>>>> create mode 100644 lib/utils/reset/fdt_reset_drivers.carray
> >>>>>>>>> create mode 100644 lib/utils/serial/fdt_serial_drivers.carray
> >>>>>>>>> create mode 100644 lib/utils/timer/fdt_timer_drivers.carray
> >>>>>>>>> create mode 100644 platform/generic/platform_override_modules.carray
> >>>>>>>>> rename platform/generic/{sifive_fu540.c => sifive/fu540.c} (100%)
> >>>>>>>>> rename platform/generic/{sifive_fu740.c => sifive/fu740.c} (100%)
> >>>>>>>>> create mode 100644 platform/generic/sifive/objects.mk
> >>>>>>>>> create mode 100755 scripts/carray.sh
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> 2.34.1
> >>>>>>>>>
> >>>>>>>>>
> >>>>>>>>> --
> >>>>>>>>> opensbi mailing list
> >>>>>>>>> opensbi at lists.infradead.org
> >>>>>>>>> http://lists.infradead.org/mailman/listinfo/opensbi
>

