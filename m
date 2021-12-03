From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Dec 2021 10:19:27 +0530
Subject: [PATCH v3 2/2] lib: sbi: Fix compile errors using -Os option
In-Reply-To: <85041259.5731384.1638449705214.JavaMail.zimbra@sjtu.edu.cn>
References: <20211202122929.685756-1-anup.patel@wdc.com>
 <20211202122929.685756-3-anup.patel@wdc.com>
 <85041259.5731384.1638449705214.JavaMail.zimbra@sjtu.edu.cn>
Message-ID: <CAAhSdy1qP7R1F4ZDb8=ftLCb0uf-daSB4PNZKRPRZMFNSai72Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 2, 2021 at 6:25 PM Dong Du <dd_nirvana@sjtu.edu.cn> wrote:
>
>
>
> On Dec 2, 2021, at 8:29 PM, anup patel anup.patel at wdc.com wrote:
>
> > When building with -Os option along with -ffreestanding, both GCC
> > and clang will add implicit calls to memcpy() and memcpy() for stack
>
> twice memcpy(), should be: memcpy() and memset()

Okay, will update in next revision.

>
> > variables initialized in declaration.
> >
> > The C standard as per Clause 4, the compiler cannot necessarily
> > assume that anything beyond:
> >
> > * float.h
> > * iso646.h
> > * limits.h
> > * stdalign.h
> > * stdarg.h
> > * stdbool.h
> > * stddef.h
> > * stdint.h
> > * stdnoreturn.h
> > * fenv.h
> > * math.h
> > * and the numeric conversion functions of stdlib.h.
> >
> > This patch maps memcpy() and memset() as weak-alias of sbi_memcpy()
> > and sbi_memset() respectively so that implicit calls to memcpy()
> > and memset() will compile properly.
> >
> > Signed-off-by: Anup Patel <anup.patel@wdc.com>
>
> Besides the above nits, looks good to me.
>
> Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

Regards,
Anup

>
> > ---
> > lib/sbi/sbi_string.c | 6 ++++++
> > 1 file changed, 6 insertions(+)
> >
> > diff --git a/lib/sbi/sbi_string.c b/lib/sbi/sbi_string.c
> > index c87bce9..c67c02e 100644
> > --- a/lib/sbi/sbi_string.c
> > +++ b/lib/sbi/sbi_string.c
> > @@ -122,6 +122,9 @@ void *sbi_memset(void *s, int c, size_t count)
> >       return s;
> > }
> >
> > +void *memset(void *s, int c, size_t count) \
> > +__attribute__((weak, alias("sbi_memset")));
> > +
> > void *sbi_memcpy(void *dest, const void *src, size_t count)
> > {
> >       char *temp1       = dest;
> > @@ -135,6 +138,9 @@ void *sbi_memcpy(void *dest, const void *src, size_t count)
> >       return dest;
> > }
> >
> > +void *memcpy(void *dest, const void *src, size_t count) \
> > +__attribute__((weak, alias("sbi_memcpy")));
> > +
> > void *sbi_memmove(void *dest, const void *src, size_t count)
> > {
> >       char *temp1       = (char *)dest;
> > --
> > 2.25.1
> >
> >
> > --
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi

