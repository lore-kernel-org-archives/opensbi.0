From: Wei Fu <wefu@redhat.com>
Date: Sat, 2 Oct 2021 08:49:06 +0800
Subject: [PATCH V4] Makefile: Add build time and compiler info string
In-Reply-To: <9B9E3036-1BCA-4102-B9CA-7E4804B28F5B@jrtc27.com>
References: <20210930101120.430700-1-wefu@redhat.com>
 <CAEUhbmWHJu1vdHnG-t_exYXYhkJd+wvUoPsoAqH8Dz2Buu63CA@mail.gmail.com>
 <133FE40B-F6C0-4458-9777-309AA0208CC1@jrtc27.com>
 <9B9E3036-1BCA-4102-B9CA-7E4804B28F5B@jrtc27.com>
Message-ID: <CA+YCwKnZ1JMExoVcQBk3KZ6S0hyR=FF=Wd0y1t6K=RupLm9aGg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi, Bin, Jessica

On Sat, Oct 2, 2021 at 12:29 AM Jessica Clarke <jrtc27@jrtc27.com> wrote:
>
> On 1 Oct 2021, at 17:28, Jessica Clarke <jrtc27@jrtc27.com> wrote:
> >
> > On 1 Oct 2021, at 17:08, Bin Meng <bmeng.cn@gmail.com> wrote:
> >>
> >> Hi Wei,
> >>
> >> On Thu, Sep 30, 2021 at 6:12 PM <wefu@redhat.com> wrote:
> >>>
> >>> From: Wei Fu <wefu@redhat.com>
> >>>
> >>> When we are doing opensbi development, we want to know the build time and
> >>> compiler info for debug purpose.
> >>> To enable this message, please add "BUILD_INFO=y", like:
> >>>
> >>> ```
> >>> make BUILD_INFO=y
> >>> ```
> >>>
> >>> NOTE: `BUILD_INFO=y` will violate "reproducible builds".
> >>> So it's ONLY for development and debug purpose, and should NOT be used
> >>> in a product which follows "reproducible builds".
> >>>
> >>> Signed-off-by: Wei Fu <wefu@redhat.com>
> >>> ---
> >>> Makefile           | 31 +++++++++++++++++++++++++++++++
> >>> README.md          | 23 +++++++++++++++++++++++
> >>> lib/sbi/sbi_init.c |  8 ++++++++
> >>> 3 files changed, 62 insertions(+)
> >>>
> >>> diff --git a/Makefile b/Makefile
> >>> index 16d9dca..0158e89 100644
> >>> --- a/Makefile
> >>> +++ b/Makefile
> >>> @@ -150,6 +150,25 @@ endif
> >>> # Check whether the linker supports creating PIEs
> >>> OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
> >>>
> >>> +# Build Info:
> >>> +# OPENSBI_BUILD_TIME_STAMP -- the compilation time stamp
> >>> +# OPENSBI_BUILD_COMPILER_VERSION -- the compiler version info
> >>> +BUILD_INFO ?= n
> >>> +ifeq ($(BUILD_INFO),y)
> >>> +OPENSBI_BUILD_DATE_FMT = +%Y-%m-%d-%H-%M-%S %Z
> >>
> >> This hour/minute/second format seems uncommon. Also for %Z it is
> >> ambiguous and not better than %z, e.g.: CST could mean different time
> >> zones.
> >
> > -u is passed to date so it will always be UTC.
>
> ... but only for the SOURCE_DATE_EPOCH case. So yeah, %z sounds better.

yes, I have tried it

OPENSBI_BUILD_DATE_FMT = +%Y-%m-%d %H:%M:%S %z
is  better

will do.
>
> Jess
>


