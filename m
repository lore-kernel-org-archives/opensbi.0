From: Xiang W <wxjstz@126.com>
Date: Fri, 17 Nov 2023 09:06:50 +0800
Subject: [PATCH v2] lib: utils/serial: Optimize semihosting_putc
 implementation
In-Reply-To: <CAAhSdy2Y5ydEKrFx1AGx9NOmk50zWB4adEvsiO0JGKruPGAoag@mail.gmail.com>
References: <20231018024205.270-1-cp0613@linux.alibaba.com>
	 <CAAhSdy0BphFUER+8kiza-Cw1qG3TD7xMZW9KkJeyAjqgxyqk4g@mail.gmail.com>
	 <4d7d9b69c833a7de7806019f734576a9998b7f76.camel@126.com>
	 <CAAhSdy2Y5ydEKrFx1AGx9NOmk50zWB4adEvsiO0JGKruPGAoag@mail.gmail.com>
Message-ID: <d514cf38c8425079ca46edbdb68e4e8b117b5f37.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-11-16???? 21:30 +0530?Anup Patel???
> On Thu, Nov 16, 2023 at 2:16?PM Xiang W <wxjstz@126.com> wrote:
> > 
> > ? 2023-11-16???? 11:42 +0530?Anup Patel???
> > > On Wed, Oct 18, 2023 at 8:12?AM <cp0613@linux.alibaba.com> wrote:
> > > > 
> > > > From: Chen Pei <cp0613@linux.alibaba.com>
> > > > 
> > > > For some debuggers that do not implement SYSWRITEC and SYSREADC
> > > > operations, we can use SYSWRITE and SYSREAD instead like the
> > > > implementation of semihosting_getc().
> > > > 
> > > > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > > > Reviewed-by: Xiang W <wxjstz@126.com>
> > > 
> > > Looks good to me.
> > > 
> > > Reviewed-by: Anup Patel <anup@brainfault.org>
> > > 
> > > Applied this patch to the riscv/opensbi repo.
> > I submitted a new workaround.
> > 
> > https://patchwork.ozlabs.org/project/opensbi/patch/20231025043104.748104-1-wxjstz at 126.com/
> > https://patchwork.ozlabs.org/project/opensbi/patch/20231025043104.748104-2-wxjstz at 126.com/
> 
> Can you rebase and send a new version for review ?

New version at:
https://patchwork.ozlabs.org/project/opensbi/patch/20231117010440.105759-1-wxjstz at 126.com/
https://patchwork.ozlabs.org/project/opensbi/patch/20231117010440.105759-2-wxjstz at 126.com/

Regards,
Xiang W
> 
> Regards,
> Anup
> 
> > 
> > Regards,
> > Xiang W
> > > 
> > > Thanks,
> > > Anup
> > > 
> > > > 
> > > > Changed from v1:
> > > > 1. simplified by calling semihosting_puts directly.
> > > > 
> > > > ---
> > > > ?lib/utils/serial/semihosting.c | 10 +++++-----
> > > > ?1 file changed, 5 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/lib/utils/serial/semihosting.c b/lib/utils/serial/semihosting.c
> > > > index ce65887..a27c69e 100644
> > > > --- a/lib/utils/serial/semihosting.c
> > > > +++ b/lib/utils/serial/semihosting.c
> > > > @@ -160,11 +160,6 @@ static long semihosting_write(long fd, const void *memp, size_t len)
> > > > 
> > > > ?/* clang-format on */
> > > > 
> > > > -static void semihosting_putc(char ch)
> > > > -{
> > > > -?????? semihosting_trap(SYSWRITEC, &ch);
> > > > -}
> > > > -
> > > > ?static unsigned long semihosting_puts(const char *str, unsigned long len)
> > > > ?{
> > > > ??????? char ch;
> > > > @@ -183,6 +178,11 @@ static unsigned long semihosting_puts(const char *str, unsigned long len)
> > > > ??????? return (ret < 0) ? 0 : ret;
> > > > ?}
> > > > 
> > > > +static void semihosting_putc(char ch)
> > > > +{
> > > > +?????? semihosting_puts(&ch, 1);
> > > > +}
> > > > +
> > > > ?static int semihosting_getc(void)
> > > > ?{
> > > > ??????? char ch = 0;
> > > > --
> > > > 2.25.1
> > > > 
> > > > 
> > > > --
> > > > opensbi mailing list
> > > > opensbi at lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/opensbi
> > 
> 


