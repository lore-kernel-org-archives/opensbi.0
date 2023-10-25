From: Guo Ren <guoren@kernel.org>
Date: Wed, 25 Oct 2023 15:51:34 +0800
Subject: [PATCH 1/2] lib: sbi: Make console_puts/console_putc interchangeable
In-Reply-To: <0924c043e1c989cd813c4cc985510be8554662fa.camel@126.com>
References: <20231025043104.748104-1-wxjstz@126.com> <CAJF2gTSKWVQA=qi=G8Lcd5jMvsmT=T28gQp5rKfjLMJ5vaAu1A@mail.gmail.com>
 <0924c043e1c989cd813c4cc985510be8554662fa.camel@126.com>
Message-ID: <CAJF2gTTjEGFPdUdWGnW1wozPK8s3kxmAWRmY3-ZOy+SYsSe7xA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Oct 25, 2023 at 3:29?PM Xiang W <wxjstz@126.com> wrote:
>
> ? 2023-10-25???? 14:53 +0800?Guo Ren???
> > On Wed, Oct 25, 2023 at 12:32?PM Xiang W <wxjstz@126.com> wrote:
> > >
> > > console_puts/console_putc should replace each other, but the previous
> > > sbi_putc can only use console_putc. This patch improves this problem.
> > >
> > > Signed-off-by: Xiang W <wxjstz@126.com>
> > > ---
> > >  lib/sbi/sbi_console.c | 35 +++++++++++++++++------------------
> > >  1 file changed, 17 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > > index 2b3b0a3..ab09a5c 100644
> > > --- a/lib/sbi/sbi_console.c
> > > +++ b/lib/sbi/sbi_console.c
> > > @@ -37,28 +37,22 @@ int sbi_getc(void)
> > >         return -1;
> > >  }
> > >
> > > -void sbi_putc(char ch)
> > > -{
> > > -       if (console_dev && console_dev->console_putc) {
> > > -               if (ch == '\n')
> > > -                       console_dev->console_putc('\r');
> > > -               console_dev->console_putc(ch);
> > > -       }
> > > -}
> > > -
> > >  static unsigned long nputs(const char *str, unsigned long len)
> > >  {
> > > -       unsigned long i, ret;
> > > +       unsigned long i;
> > >
> > > -       if (console_dev && console_dev->console_puts) {
> > > -               ret = console_dev->console_puts(str, len);
> > > -       } else {
> > > -               for (i = 0; i < len; i++)
> > > -                       sbi_putc(str[i]);
> > > -               ret = len;
> > > +       if (console_dev) {
> > > +               if (console_dev->console_puts)
> > > +                       return console_dev->console_puts(str, len);
> > > +               else if (console_dev->console_putc) {
> > > +                       for (i = 0; i < len; i++) {
> > > +                               if (str[i] == '\n')
> > > +                                       console_dev->console_putc('\r');
> > > +                               console_dev->console_putc(str[i]);
> > > +                       }
> > > +               }
> > >         }
> > > -
> > > -       return ret;
> > > +       return len;
> > The return becomes meaningless, right?
> Even if console_dev is NULL, it cannot return 0, otherwise it will cause nputs_all
> to fall into an infinite loop.
If console_dev is NULL, we assume all strings were sent out. Okay, I got it, so:

Reviewed-by: Guo Ren <guoren@kernel.org>

>
> Regards,
> Xiang W
> >
> > >  }
> > >
> > >  static void nputs_all(const char *str, unsigned long len)
> > > @@ -69,6 +63,11 @@ static void nputs_all(const char *str, unsigned long len)
> > >                 p += nputs(&str[p], len - p);
> > >  }
> > >
> > > +void sbi_putc(char ch)
> > > +{
> > > +       nputs_all(&ch, 1);
> > > +}
> > > +
> > >  void sbi_puts(const char *str)
> > >  {
> > >         unsigned long len = sbi_strlen(str);
> > > --
> > > 2.42.0
> > >
> > >
> > > --
> > > opensbi mailing list
> > > opensbi at lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/opensbi
> >
> >
> >
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi



-- 
Best Regards
 Guo Ren

