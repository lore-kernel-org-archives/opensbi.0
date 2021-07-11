From: Anup Patel <anup@brainfault.org>
Date: Sun, 11 Jul 2021 20:07:06 +0530
Subject: [PATCH v5 3/6] firmware: Explicitly pass -pie to the linker, not
 just the driver
In-Reply-To: <CAEUhbmX5iPaHNHOrYM2SG5JjDG=9bxKABK8v2oE6LizEJpy+rw@mail.gmail.com>
References: <20210711022824.29915-1-jrtc27@jrtc27.com>
 <20210711022824.29915-4-jrtc27@jrtc27.com>
 <CAEUhbmX5iPaHNHOrYM2SG5JjDG=9bxKABK8v2oE6LizEJpy+rw@mail.gmail.com>
Message-ID: <CAAhSdy30uBYBMoHrFCS7dr_An9A-ZeW4Wzs8b4Gae5WedzyVRA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 5:45 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Sun, Jul 11, 2021 at 10:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > When using Clang with a bare-metal triple, -pie does not get passed to
> > the linker as it's not normally a thing that makes sense, unlike GCC
> > which will unconditionally forward it on and potentially result in a
> > linker error. However, LLD does support it, and manually forwarding it
> > on works as desired, so do so to fully support FW_PIC with Clang and
> > LLD.
> >
> > Signed-off-by: Jessica Clarke <jrtc27@jrtc27.com>
> > ---
> >  firmware/objects.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
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

