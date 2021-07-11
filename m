From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 20:07:49 +0530
Subject: [PATCH v5 4/6] firmware: Only default FW_PIC to y if supported
In-Reply-To: <CAEUhbmXNoej5kJNXxG4=ZKvBEQwta7fq--=1i=ZtCTrbMUBHSw@mail.gmail.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-5-jrtc27@jrtc27.com>
 <CAEUhbmXNoej5kJNXxG4=ZKvBEQwta7fq--=1i=ZtCTrbMUBHSw@mail.gmail.com>
Message-ID: <CAAhSdy31gqetmp-kFtLh=wqoJJMnume+X=CAaUn_epGM+R7v+Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 6:08 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jul 11, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > Bare-metal GNU ld does not support PIE, so if using it this will result
> > in a failure to build. Instead, default to FW_PIC=n if not supported.
> > Note that an explicit FW_PIC=y is not overriden, to ensure the build
>
> typo: overridden

I have fixed this typo at the time of merging this patch.

>
> > fails rather than silently producing a position-dependent binary.
> >
> > Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> > ---
> >  Makefile            | 3 +++
> >  firmware/objects.mk | 2 +-
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Tested-by: Bin Meng <bmeng.cn@gmail.com>

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

