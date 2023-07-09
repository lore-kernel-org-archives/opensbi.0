From: Xiang W <wxjstz@126.com>
Date: Sun, 09 Jul 2023 14:16:16 +0800
Subject: [PATCH v8 11/11] lib: sbi: Fix missing '\0' when buffer szie
 equal 1
In-Reply-To: <CAAhSdy27YNoAX25MfZhgmwWxUawNgc9UwYk4x4bqh6uUomOUXA@mail.gmail.com>
References: <20230705143703.635254-1-wxjstz@126.com>
	 <20230705143754.635428-1-wxjstz@126.com>
	 <CAAhSdy2QOcjukWmQiCxWTJsJK6g_WS_MYz8GvUqT2q9Q639MLw@mail.gmail.com>
	 <7b0e5009891f6b11e36b9471a0e25a4b417175b9.camel@126.com>
	 <CAAhSdy27YNoAX25MfZhgmwWxUawNgc9UwYk4x4bqh6uUomOUXA@mail.gmail.com>
Message-ID: <7bdcf4050940493bc47cf45225423d41a50a3ce4.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-07-09???? 11:02 +0530?Anup Patel???
> On Thu, Jul 6, 2023 at 12:20?PM Xiang W <wxjstz@126.com> wrote:
> > 
> > ? 2023-07-06???? 11:08 +0530?Anup Patel???
> > > On Wed, Jul 5, 2023 at 8:08?PM Xiang W <wxjstz@126.com> wrote:
> > > > 
> > > > Fix special case: sbi_snprintf(out, out_len, ...) when out_len equal
> > > > 1, The previous code will not fill the buffer with any char.
> > > 
> > > I would rather do something like below in printc(...)
> > > 
> > > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > > index 168dffd..e0ecb41 100644
> > > --- a/lib/sbi/sbi_console.c
> > > +++ b/lib/sbi/sbi_console.c
> > > @@ -138,10 +138,10 @@ static void printc(char **out, u32 *out_len, char ch)
> > > ????? * The *printf entry point functions have enforced that (*out) can
> > > ????? * only be null when out_len is non-null and its value is zero.
> > > ????? */
> > > -??? if (!out_len || *out_len > 1) {
> > > +??? if (!out_len || *out_len)
> > > ???????? *(*out)++ = ch;
> > > +??? if (!out_len || *out_len > 1)
> > > ???????? **out = '\0';
> > > -??? }
> > 
> > When *out_len is equal to 1, that is, when there is not enough buffer to drop
> > the formatted string, a string without '\0' will be generated.
> > 
> > And when there is a problem with the format in sbi_snprintf, it may not entry
> > printc at all. e.g:
> > ??????? sbi_printf(out,out_len,"%f",3.14)
> 
> Fair enough but I still think check on out_len is also required.
> 
> if (out && out_len && *out_len)
> ??? **out = '\0';

If we check out_len, it will result in possible loss of '\0' in the following cases:
	sbi_sprintf(out, format, ...)

Regards,
Xiang W
> 
> Regards,
> Anup
> 
> > 
> > Regards,
> > Xiang W
> > 
> > > 
> > > ???? if (out_len && *out_len > 0)
> > > ???????? --(*out_len);
> > > 
> > > Regards,
> > > Anup
> > > 
> > > > 
> > > > Signed-off-by: Xiang W <wxjstz@126.com>
> > > > ---
> > > > ?lib/sbi/sbi_console.c | 4 ++++
> > > > ?1 file changed, 4 insertions(+)
> > > > 
> > > > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > > > index 00feec8..0703d4a 100644
> > > > --- a/lib/sbi/sbi_console.c
> > > > +++ b/lib/sbi/sbi_console.c
> > > > @@ -271,6 +271,10 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
> > > > ??????????????? out_len = &console_tbuf_len;
> > > > ??????? }
> > > > 
> > > > +?????? /* handle special case: *out_len == 1*/
> > > > +?????? if (out)
> > > > +?????????????? **out = '\0';
> > > > +
> > > > ??????? for (; *format != 0; ++format) {
> > > > ??????????????? width = flags = 0;
> > > > ??????????????? if (use_tbuf)
> > > > --
> > > > 2.40.1
> > > > 
> > 


