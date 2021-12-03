From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 10:11:10 +0530
Subject: [PATCH v3 1/2] Makefile: Fix -mno-save-restore compile warning
 with CLANG
In-Reply-To: <53FD3B9A-ADA5-4948-A7A4-2AB449C01360@jrtc27.com>
References: <20211202122929.685756-1-anup.patel@wdc.com>
 <20211202122929.685756-2-anup.patel@wdc.com>
 <7dfd90c711fd20dc0bcf07082a59c45d7f76ddcd.camel@126.com>
 <53FD3B9A-ADA5-4948-A7A4-2AB449C01360@jrtc27.com>
Message-ID: <CAAhSdy0n8sy0fBKX3C1-VTiXNKM3Ni+=MRa0F5cHzqZb5PUR_w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 2, 2021 at 8:43 PM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 2 Dec 2021, at 14:28, Xiang W <wxjstz@126.com> wrote:
> >
> > ? 2021-12-02???? 17:59 +0530?Anup Patel???
> >> The riscv target of CLANG does not support -m(no-)save-restore option
> >> so we get compile warnings. This patch fixes compile warning by using
> >> -m(no-)save-restore option only for GCC.
> >>
> >> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >
> > ?  /tmp clang -target riscv64 -mno-save-restore -O2 -S test.c
> > ?  /tmp clang -target riscv64 -msave-restore -O2 -S test.c
> > ?  /tmp clang --version
> > Debian clang version 11.0.1-2
> > Target: x86_64-pc-linux-gnu
> > Thread model: posix
> > InstalledDir: /usr/bin
> > ?  /tmp lsb_release -a
> > No LSB modules are available.
> > Distributor ID:       Debian
> > Description:  Debian GNU/Linux 11 (bullseye)
> > Release:      11
> > Codename:     bullseye
> > ?  /tmp
> >
> > clang supports -m(no-)save-restore option on my computer
>
> Yes, Clang 11 and above support -m(no-)save-restore. Clang 9 and 10
> support the driver option but were buggy and would cause the backend to
> give several warnings even if you just gave -mno-save-restore
> (https://reviews.llvm.org/D64008, which did make it into Clang 9, was
> not a complete fix for that, see my comment there). Clang 8 and below
> didn?t support the option in the driver, but the RISCV backend only
> graduated from experimental status in Clang 9 so, whilst it was in
> relatively decent shape before then, such versions should probably be
> discouraged.
>
> In theory not passing the option is fine, there isn?t currently a way
> to configure Clang to default to -msave-restore other than patching it,
> though only skipping it for Clang 10 and below would be preferable.
> Either way the commit message needs updating.

Okay, I will update the commit message and also add a comment in
Makefile.

>
> Or you could just say it?s not worth caring and leave the warnings for
> Clang 9 and 10; with time they?ll stop being relevant, and they?re
> stderr output, not real diagnostics, so -Werror doesn?t make them fatal.
> That?s probably the approach I?d take, but I don?t have to work with
> old versions of Clang on RISC-V.

I am inclined towards suppressing this warning for now because apart
from this warning OpenSBI works fine with clang-10. Once all major
distros have moved to clang-11 (or higher), we can update the Makefile
(maybe after 6-12 months).

Regards,
Anup

>
> Jess
>

