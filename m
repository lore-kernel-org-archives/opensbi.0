From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 26 Jul 2022 15:26:15 +0200
Subject: [PATCH] lib: sbi: Fix sbi_snprintf
In-Reply-To: <CAAhSdy2STYM0nP94wWxP_1U-VNQvFJmPyF=zP00V9tCfFJ8Gbg@mail.gmail.com>
References: <20220726112522.5070-1-ajones@ventanamicro.com>
 <CAAhSdy2STYM0nP94wWxP_1U-VNQvFJmPyF=zP00V9tCfFJ8Gbg@mail.gmail.com>
Message-ID: <20220726132615.wh4c5l3jw5omzi62@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 26, 2022 at 05:12:47PM +0530, Anup Patel wrote:
> On Tue, Jul 26, 2022 at 4:55 PM Andrew Jones <ajones@ventanamicro.com> wrote:
> >
> > printc would happily write to 'out' even when 'out_len' was zero,
> > potentially overflowing buffers. Rework printc to not do that and
> > also ensure the null byte is written at the last position when
> > necessary, as stated in the snprintf man page. Finally, ensure all
> > writes to 'out' go through printc and rename a goto label which
> > clashed with it.
> >
> > Fixes: 9e8ff05cb61f ("Initial commit.")
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  lib/sbi/sbi_console.c | 35 ++++++++++++++++++++---------------
> >  1 file changed, 20 insertions(+), 15 deletions(-)
> >
> > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > index 34c843d3f9e3..47f361705fc7 100644
> > --- a/lib/sbi/sbi_console.c
> > +++ b/lib/sbi/sbi_console.c
> > @@ -76,20 +76,24 @@ typedef __builtin_va_list va_list;
> >
> >  static void printc(char **out, u32 *out_len, char ch)
> >  {
> > -       if (out) {
> > -               if (*out) {
> > -                       if (out_len && (0 < *out_len)) {
> > -                               **out = ch;
> > -                               ++(*out);
> > -                               (*out_len)--;
> > -                       } else {
> > -                               **out = ch;
> > -                               ++(*out);
> > -                       }
> > -               }
> > -       } else {
> > +       if (!out) {
> >                 sbi_putc(ch);
> > +               return;
> >         }
> > +
> > +       if (!*out)
> > +               return;
> 
> What if the output buffer is filled with zeros ?

This single dereferencing of 'out' won't reach the buffer. This check
ensures we don't dereference NULL if sprintf/snprintf are called with
str=NULL and is just a rewording of the original code. Actually, we
probably shouldn't allow str=NULL for sprintf nor for snprintf with
size != 0 at all. We could hang in sprintf and snprintf if we detect
that.

Thanks,
drew

