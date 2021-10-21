From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 21 Oct 2021 16:08:59 +0800
Subject: [PATCH v6] Makefile: Add build time and compiler info string
In-Reply-To: <CAAhSdy2NwMuaORJBB1YMNXe2+joUvw7K69XRu8fGgCywFcYiFA@mail.gmail.com>
References: <20211020094406.1393760-1-anup.patel@wdc.com>
 <CAAhSdy2NwMuaORJBB1YMNXe2+joUvw7K69XRu8fGgCywFcYiFA@mail.gmail.com>
Message-ID: <CAEUhbmV0VognG3vsC_pf=Whoftx4aO=H1NZsfpZ-2Xm=yGMyFg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 21, 2021 at 12:07 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Wed, Oct 20, 2021 at 3:14 PM Anup Patel <anup.patel@wdc.com> wrote:
> >
> > From: Wei Fu <wefu@redhat.com>
> >
> > When we are doing opensbi development, we want to know the build time
> > and compiler info for debug purpose.
> >
> > To enable this message, please add "BUILD_INFO=y", like:
> >
> > ```
> > make BUILD_INFO=y
> > ```
> >
> > NOTE: Using `BUILD_INFO=y` without specifying SOURCE_DATE_EPOCH will
> > violate "reproducible builds". So it's ONLY for development and debug
> > purpose, and should NOT be used in a product which follows "reproducible
> > builds".
> >
> > Signed-off-by: Wei Fu <wefu@redhat.com>
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
>
> Applied this patch to the riscv/opensbi repo
>

Please cc people who gave comments to previous versions, and wait for
a day or two before the applying.

Regards,
Bin

