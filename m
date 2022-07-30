From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Jul 2022 15:57:34 +0530
Subject: [PATCH v3] lib: sbi: Fix printf handling of long long
In-Reply-To: <20220727164401.tjinf26ysa27j43y@kamzik>
References: <TYYP286MB14396B0D3F810E64516CFE9DC6979@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <20220727164401.tjinf26ysa27j43y@kamzik>
Message-ID: <CAAhSdy1NMe0yrA4ELi8Vkz2mSWXYjrnx5aevEq7zF2mFo=pgdg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 27, 2022 at 10:14 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Jul 28, 2022 at 12:30:05AM +0800, dramforever wrote:
> > Read long long arguments directly using va_arg. Remove original hack for
> > RV32 that read a long long arg as two long args.
> >
> > This un-breaks the case on RV64 where e.g. the long long is followed by
> > an odd number of ints:
> >
> >     sbi_printf("%d %lld", (int) 1, (long long) 2LL);
> >
> > Also remove the acnt variable, which is now unused.
> >
> > Signed-off-by: dramforever <dramforever@live.com>
> > ---
> >
> > Changes since v2:
> >
> > - Remove the acnt variable
> >
> > Changes since v1:
> >
> > - Removed hack that reads a long long as two longs
> > - Better commit message
> >
> >  lib/sbi/sbi_console.c | 30 ++----------------------------
> >  1 file changed, 2 insertions(+), 28 deletions(-)
> >
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

