From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 10 Jul 2021 20:43:16 +0800
Subject: [PATCH v4 3/5] firmware: Explicitly pass -pie to the linker, not
 just the driver
In-Reply-To: <CAAhSdy12gSm9ZJktj4ZUskTOoGVAJ8xdqANkU3ci2q8_mstVnw@mail.gmail.com>
References: <20210709193423.29712-1-jrtc27@jrtc27.com>
 <20210709193423.29712-4-jrtc27@jrtc27.com>
 <CAEUhbmVDAY8Puuro=m+nVBhR8pbXPYgB-1PHjEd3tKGvNCB03w@mail.gmail.com>
 <CAEUhbmWJafiTvJzMb1xo=6_7UFEToJDUwytTFBmiRXzVfZ8YPA@mail.gmail.com>
 <CAAhSdy12gSm9ZJktj4ZUskTOoGVAJ8xdqANkU3ci2q8_mstVnw@mail.gmail.com>
Message-ID: <CAEUhbmXWJmkGqrHR31qZUYQBpD4qE8WFmKSZa20T_5_DUR0x7w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Sat, Jul 10, 2021 at 6:42 PM Anup Patel <anup@brainfault.org> wrote:
>
> Hi Bin,
>
> On Sat, Jul 10, 2021 at 2:23 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Sat, Jul 10, 2021 at 10:56 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> > >
> > > On Sat, Jul 10, 2021 at 3:35 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > > >
> > > > When using Clang with a bare-metal triple, -pie does not get passed to
> > > > the linker as it's not normally a thing that makes sense. However, in
> > > > our case it is, and manually forwarding it on works as desired, so do so
> > > > to fully support FW_PIC with Clang, including when linking with LLD.
> > > > ---
> > > >  firmware/objects.mk | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/firmware/objects.mk b/firmware/objects.mk
> > > > index ce91c2f..3bc83cd 100644
> > > > --- a/firmware/objects.mk
> > > > +++ b/firmware/objects.mk
> > > > @@ -21,7 +21,7 @@ ifeq ($(FW_PIC),y)
> > > >  firmware-genflags-y += -DFW_PIC
> > > >  firmware-asflags-y  += -fpic
> > > >  firmware-cflags-y   += -fPIE -pie
> > > > -firmware-ldflags-y  +=  -Wl,--no-dynamic-linker
> > > > +firmware-ldflags-y  +=  -Wl,--no-dynamic-linker -Wl,-pie
> > > >  endif
> > >
> > > Does this manual forwarding also work for GNU ld? If so, I think we
> > > don't need to detect bare-metal triple and turn off FW_PIC in
> > > Makefile?
> >
> > I just built a riscv64-unknown-elf-gcc toolchain and used it to build
> > the current HEAD of opensbi/master. Indeed it's broken that pie is not
> > supported with the bare-metal triple.
> >
> > The GNU ld simply complains:
> >
> >  ELF       platform/generic/firmware/payloads/test.elf
> > /opt/riscv-unknown-elf/lib/gcc/riscv64-unknown-elf/10.1.0/../../../../riscv64-unknown-elf/bin/ld.bfd:
> > -pie not supported
>
> The firmware/objects.mk is doing the following:
>
> ifndef FW_PIC
> FW_PIC := y
> endif
>
> Instead of above, we should set FW_PIC=y only when the underlying
> toolchain supports pie.
>

Agree.

> We need a patch for this to be merged before we can merge this
> series. Can you send such a patch ? If not then I can send it.

Do you have some reliable ways to check whether a toolchain supports PIE?

Regards,
Bin

