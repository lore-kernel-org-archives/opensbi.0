From: Anup Patel <anup@brainfault.org>
Date: Wed, 22 Sep 2021 13:26:11 +0530
Subject: [PATCH] lib: sbi: fix ctz bug
In-Reply-To: <CAEUhbmUTK9BWS1wjdY11TXhwz44Ag+L4=r33NWM-3HL2AMZ9Sw@mail.gmail.com>
References: <20210915065052.14980-1-wxjstz@126.com>
 <CAEUhbmUTK9BWS1wjdY11TXhwz44Ag+L4=r33NWM-3HL2AMZ9Sw@mail.gmail.com>
Message-ID: <CAAhSdy38eg+DjoxaCJTK-Z+y8cK3TcJr68JUJpynea7Z8CRjeg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 1:02 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Wed, Sep 15, 2021 at 2:51 PM Xiang W <wxjstz@126.com> wrote:
> >
> > The original version of ctz will cause an endless loop, if the parameter
> > passed in is 0. This commit fixes this bug.
> >
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> >  lib/sbi/riscv_asm.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> > index 4c24a51..d7b9b2b 100644
> > --- a/lib/sbi/riscv_asm.c
> > +++ b/lib/sbi/riscv_asm.c
> > @@ -213,6 +213,9 @@ static unsigned long ctz(unsigned long x)
> >  {
> >         unsigned long ret = 0;
> >
> > +       if (x == 0)
> > +               return 8 * sizeof(x);
> > +
> >         while (!(x & 1UL)) {
> >                 ret++;
> >                 x = x >> 1;
>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

