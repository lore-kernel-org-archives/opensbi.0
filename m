From: Anup Patel <anup@brainfault.org>
Date: Mon, 12 Jul 2021 09:32:43 +0530
Subject: [PATCH v5 6/6] Drop dependency on libgcc by importing part of
 FreeBSD's libquad
In-Reply-To: <CAEUhbmW2D95JkeALZm2itrVTTC9GHfcOA-LNERVgQjy5yzVjLQ@mail.gmail.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-7-jrtc27@jrtc27.com>
 <CAAhSdy0H1=P=SQKwbE+=mJq6N4gz3jOBeoZoLhZ989Xo2gMTKA@mail.gmail.com>
 <CAEUhbmW2D95JkeALZm2itrVTTC9GHfcOA-LNERVgQjy5yzVjLQ@mail.gmail.com>
Message-ID: <CAAhSdy2KGnpETXwS9SBt_X42QO6Em81toymhNEduNxfnLGwdbA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 9:25 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jul 11, 2021 at 11:46 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sun, Jul 11, 2021 at 7:58 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> > >
> > > We only need libgcc for 64-bit division on RV32. Whilst GCC toolchains
> > > bundle libgcc, Clang toolchains tend not to ship libclang_rt.builtins
> > > given every compiler is a cross-compiler for every target and so you
> > > would need a silly number of builds of it, with only the native library
> > > available; only vendor-provided Clang toolchains specifically for bare
> > > metal cross-compiling are likely to provide it.
> > >
> > > Thus, import part of FreeBSD's implementation of the division support
> > > functions needed and stop linking against libgcc.
> > >
> > > Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> >
> > I tried this patch with GCC linux toolchain and U-Boot SPL and it worked
> > fine for me. Other please try LLVM and bare-metal toolchain at your end
> > and if you see any issue then please send a fix patch.
> >
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Tested-by: Anup Patel <anup.patel@wdc.com>
> >
> > Applied this patch to the riscv/opensbi repo.
> >
> > @Bin Meng Can you also try RV32 U-Boot SPL ? I did not try that.
>
> It seems RV32 U-Boot SPL is broken, that it does not boot occasionally.
>
> But this has nothing to do with the LLVM changes in this series. It
> was due to upstream libfdt changes. I have sent a patch on the U-Boot
> side. Booting S-mode U-Boot directly is not affected.

Yes, it's not related to this series. In fact, it is not related to
FW_PIC at all.

I did little digging. It seems OpenSBI gets corrupted FDT from U-Boot SPL
RV32. The fw_platform_init() get's stuck very early because it is not able to
find nodeoffset of "/" path in FDT.

The OpenSBI RV32 firmwares work fine without U-Boot SPL which leads
to the conclusion that FDT is corrupted for U-Boot SPL RV32 case.

I hope the above info helps ...

Regards,
Anup

>
> Regards,
> Bin

