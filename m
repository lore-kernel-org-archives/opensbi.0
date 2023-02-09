From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Feb 2023 22:29:09 +0530
Subject: [PATCH v5 2/8] lib: sbi: Add sbi_nputs() function
In-Reply-To: <20230131173247.hxh3s4xhlufmnuvm@orel>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-3-apatel@ventanamicro.com> <20230131173247.hxh3s4xhlufmnuvm@orel>
Message-ID: <CAAhSdy0KeJM0uvDyhgDpwDda1tsVxxpaRYkaXym4vTj6a4PJiQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jan 31, 2023 at 11:02 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jan 13, 2023 at 05:11:04PM +0530, Anup Patel wrote:
> > We add new sbi_nputs() which help us print a fixed number of characters
> > from a physical memory location.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Bin Meng <bmeng@tinylab.org>
> > Reviewed-by: Xiang W <wxjstz@126.com>
> > ---
> >  include/sbi/sbi_console.h |  2 ++
> >  lib/sbi/sbi_console.c     | 10 ++++++++++
> >  2 files changed, 12 insertions(+)
> >
> > diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> > index e15b55d..1bdeeb9 100644
> > --- a/include/sbi/sbi_console.h
> > +++ b/include/sbi/sbi_console.h
> > @@ -33,6 +33,8 @@ void sbi_putc(char ch);
> >
> >  void sbi_puts(const char *str);
> >
> > +void sbi_nputs(const char *str, unsigned long len);
> > +
> >  void sbi_gets(char *s, int maxwidth, char endchar);
> >
> >  int __printf(2, 3) sbi_sprintf(char *out, const char *format, ...);
> > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > index bb6e1ef..946c61d 100644
> > --- a/lib/sbi/sbi_console.c
> > +++ b/lib/sbi/sbi_console.c
> > @@ -51,6 +51,16 @@ void sbi_puts(const char *str)
> >       spin_unlock(&console_out_lock);
> >  }
> >
> > +void sbi_nputs(const char *str, unsigned long len)
> > +{
> > +     unsigned long i;
> > +
> > +     spin_lock(&console_out_lock);
> > +     for (i = 0; i < len; i++)
> > +             sbi_putc(str[i]);
>
> sbi_putc() adds '\r' after '\n'. So, sbi_nputs("\n\n\n\n", 4)
> actually outputs 8 chars, but I imagine the new debug extension
> will still report it only wrote 4. Is that a problem?

I don't see this as a problem because the additional '\r' is only
for correctly rederring the effect of `\n` on console.

In other words, the nputs() function is still printing all the
characters it got as parameters and additionally it is printing
few more characters.

Regards,
Anup

