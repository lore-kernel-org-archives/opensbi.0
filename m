From: Xiang W <wxjstz@126.com>
Date: Wed, 05 Jul 2023 21:33:33 +0800
Subject: [PATCH v7 11/11] lib: sbi: Fix missing '\0' when buffer szie
 equal 1
In-Reply-To: <CAAhSdy0ZhdxofU3C-dbYU2xivqc-YhrG4oT2VDoHfsJoF-LVMg@mail.gmail.com>
References: <20230704131208.465914-1-wxjstz@126.com>
	 <20230704131316.466246-1-wxjstz@126.com>
	 <CAAhSdy0ZhdxofU3C-dbYU2xivqc-YhrG4oT2VDoHfsJoF-LVMg@mail.gmail.com>
Message-ID: <a7928d9b88555ef8dc145839fcec7da3a9b7500c.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-07-05???? 11:14 +0530?Anup Patel???
> On Tue, Jul 4, 2023 at 6:43?PM Xiang W <wxjstz@126.com> wrote:
> > 
> > Fix special case: sbi_snprintf(out, out_len, ...) when out_len equal
> > 1, The previous code will not fill the buffer with any char.
> 
> I don't understand why this special case is needed.
The characters are eventually filled by printc, which requires a buffergreater than 1. For buffer lengths equal to 1, no characters will be filled.
Accessing this buffer later may result in an overflow.

This bug is hard to trigger, and the compiler's static detection checks
for the minimum requirement of out_len. However, when the input parameter
is variables, the static check will fail and the bug will be triggered.

Regards,
Xiang
> 
> Regards,
> Anup
> 
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > ?lib/sbi/sbi_console.c | 4 ++++
> > ?1 file changed, 4 insertions(+)
> > 
> > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > index 50af405..4f7c4ca 100644
> > --- a/lib/sbi/sbi_console.c
> > +++ b/lib/sbi/sbi_console.c
> > @@ -271,6 +271,10 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
> > ??????????????? out_len = &console_tbuf_len;
> > ??????? }
> > 
> > +?????? /* handle special case: *out_len == 1*/
> > +?????? if (out)
> > +?????????????? **out = '\0';
> > +
> > ??????? for (; *format != 0; ++format) {
> > ??????????????? width = flags = 0;
> > ??????????????? if (use_tbuf)
> > --
> > 2.40.1
> > 



