From: Xiang W <wxjstz@126.com>
Date: Tue, 06 Jun 2023 15:12:44 +0800
Subject: [PATCH] lib: sbi: Fix timing of clearing tbuf
In-Reply-To: <F5CF4FE2-CC5B-419A-B3F0-576FC4BC4FE3@jrtc27.com>
References: <20230606063247.1174503-1-wxjstz@126.com>
	 <F5CF4FE2-CC5B-419A-B3F0-576FC4BC4FE3@jrtc27.com>
Message-ID: <4f8277f34c63178aaefd3991d5afeb6d4c0a25ce.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2023-06-06???? 07:42 +0100?Jessica Clarke???
> On 6 Jun 2023, at 07:32, Xiang W <wxjstz@126.com> wrote:
> > 
> > A single scan of the format char may add multiple characters to the
> > tbuf, causing a buffer overflow. You should check if tbuf is full in
> > printc so that it does not cause a buffer overflow.
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > lib/sbi/sbi_console.c | 17 +++++++++--------
> > 1 file changed, 9 insertions(+), 8 deletions(-)
> > 
> > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > index 168dffd..c092934 100644
> > --- a/lib/sbi/sbi_console.c
> > +++ b/lib/sbi/sbi_console.c
> > @@ -17,8 +17,8 @@
> > #define CONSOLE_TBUF_MAX 256
> > 
> > static const struct sbi_console_device *console_dev = NULL;
> > +static bool use_tbuf;
> > static char console_tbuf[CONSOLE_TBUF_MAX];
> > -static u32 console_tbuf_len;
> > static spinlock_t console_out_lock?????? = SPIN_LOCK_INITIALIZER;
> > 
> > bool sbi_isprintable(char c)
> > @@ -134,6 +134,12 @@ static void printc(char **out, u32 *out_len, char ch)
> > return;
> > }
> > 
> > + if (use_tbuf && (*out_len == 0)) {
> 
> Using a global variable to pass data into a function sounds dodgy.

You reminded well. When sbi_sprintf and sbi_printf are called at the
same time, the value of use_tbuf is broken, I will modify this patch
and re-post it.

Thank,
Xiang
> 
> Jess
> 
> > + nputs_all(console_tbuf, CONSOLE_TBUF_MAX);
> > + *out = console_tbuf;
> > + *out_len = CONSOLE_TBUF_MAX;
> > + }
> > +
> > /*
> > * The *printf entry point functions have enforced that (*out) can
> > * only be null when out_len is non-null and its value is zero.
> > @@ -238,7 +244,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
> > {
> > int width, flags, pc = 0;
> > char scr[2], *tout;
> > - bool use_tbuf = (!out) ? true : false;
> > + u32 console_tbuf_len;
> > unsigned long long tmp;
> > 
> > /*
> > @@ -246,6 +252,7 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
> > * print() is always called with console_out_lock held
> > * when out == NULL.
> > */
> > + use_tbuf = (!out) ? true : false;
> > if (use_tbuf) {
> > console_tbuf_len = CONSOLE_TBUF_MAX;
> > tout = console_tbuf;
> > @@ -254,12 +261,6 @@ static int print(char **out, u32 *out_len, const char *format, va_list args)
> > }
> > 
> > for (; *format != 0; ++format) {
> > - if (use_tbuf && !console_tbuf_len) {
> > - nputs_all(console_tbuf, CONSOLE_TBUF_MAX);
> > - console_tbuf_len = CONSOLE_TBUF_MAX;
> > - tout = console_tbuf;
> > - }
> > -
> > if (*format == '%') {
> > ++format;
> > width = flags = 0;
> > -- 
> > 2.39.2
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi


