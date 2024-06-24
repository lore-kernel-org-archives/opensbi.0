From: Xiang W <wxjstz@126.com>
Date: Mon, 24 Jun 2024 22:09:00 +0800
Subject: [PATCH] lib: sbi: print before sbi_console_init
In-Reply-To: <5CE9901D-C055-4B8E-B269-6673AB8B7EE4@thechauhan.dev>
References: <20240624013808.2148906-1-wxjstz@126.com>
	 <5CE9901D-C055-4B8E-B269-6673AB8B7EE4@thechauhan.dev>
Message-ID: <c48fd8e03d8450daee5e095d5b7ecd7164142933.camel@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

? 2024-06-24???? 08:40 +0530?Himanshu Chauhan???
> Hi Xiang,
> 
> 
> > On 24 Jun 2024, at 7:07?AM, Xiang W <wxjstz@126.com> wrote:
> > 
> > The information from the print is cached via a ring buffer and
> > output to the console after initialization is complete.
> > 
> > Signed-off-by: Xiang W <wxjstz@126.com>
> > ---
> > lib/sbi/sbi_console.c | 32 ++++++++++++++++++++++++++++++++
> > lib/sbi/sbi_hart.c??? |? 4 ++++
> > 2 files changed, 36 insertions(+)
> > 
> > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
> > index d3ec461..93e243a 100644
> > --- a/lib/sbi/sbi_console.c
> > +++ b/lib/sbi/sbi_console.c
> > @@ -19,6 +19,8 @@
> > static const struct sbi_console_device *console_dev = NULL;
> > static char console_tbuf[CONSOLE_TBUF_MAX];
> > static u32 console_tbuf_len;
> > +static u32 console_tbuf_stat;
> > +static u32 console_tbuf_i;
> > static spinlock_t console_out_lock?????? = SPIN_LOCK_INITIALIZER;
> > 
> > bool sbi_isprintable(char c)
> > @@ -135,6 +137,24 @@ static void printc(char **out, u32 *out_len, char ch, int flags)
> > return;
> > }
> > 
> > + /* early print before console sbi_console_init */
> > + if (!console_dev && (flags & USE_TBUF)) {
> > + /*
> > + * console_tbuf_stat
> > + *?? 0 buff is empty
> > + *?? 1 buff is not empty and does not overflow
> > + *?? 2 buff is overflow
> > + */
> > + console_tbuf [console_tbuf_i++] = ch;
> > + if (console_tbuf_stat == 0)
> > + console_tbuf_stat = 1;
> > + if (console_tbuf_i == CONSOLE_TBUF_MAX) {
> 
> Where is CONSOLE_TBUF_MAX defined? It would be great if it is part of a Kconfig so that a platform?s defconfig can set the size of the buffer.

will be done
> 
> > + console_tbuf_stat = 2;
> > + console_tbuf_i = 0;
> > + }
> > + return;
> > + }
> > +
> 
> IMO, it would be better to have a generic wrapper for circular buffers and then use that wrapper.
> Something like https://www.kernel.org/doc/Documentation/circular-buffers.txt

The circular buffer does not allow overflow. This is where overflow is needed.
> 
> 
> > /*
> > * The *printf entry point functions have enforced that (*out) can
> > * only be null when out_len is non-null and its value is zero.
> > @@ -476,6 +496,18 @@ void sbi_console_set_device(const struct sbi_console_device *dev)
> > return;
> > 
> > console_dev = dev;
> > +
> > + if (console_tbuf_stat == 1)
> > + sbi_nputs(console_tbuf, console_tbuf_i);
> > +
> > + if (console_tbuf_stat == 2) {
> > + sbi_nputs(console_tbuf + console_tbuf_i,
> > + CONSOLE_TBUF_MAX - console_tbuf_i);
> > + sbi_nputs(console_tbuf, console_tbuf_i);
> > + }
> > +
> > + console_tbuf_stat = 0;
> > + console_tbuf_i = 0;
> > }
> 
> Can be handled behind a wrapper.
> 
> > 
> > int sbi_console_init(struct sbi_scratch *scratch)
> > diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> > index c366701..48ec97c 100644
> > --- a/lib/sbi/sbi_hart.c
> > +++ b/lib/sbi/sbi_hart.c
> > @@ -1010,6 +1010,10 @@ int sbi_hart_init(struct sbi_scratch *scratch, bool cold_boot)
> > 
> > void __attribute__((noreturn)) sbi_hart_hang(void)
> > {
> > + /* Try to initialize the console to output some error messages */
> > + if (sbi_console_get_device() == NULL)
> > + sbi_console_init(sbi_scratch_thishart_ptr());
> > +
> 
> Please make it a separate patch. IIUC, this is just to dump logs when crash happens too early in boot process.

will be done

Thanks,
Xiang W
> 
> Thanks
> Regards
> Himanshu
> 
> > while (1)
> > wfi();
> > __builtin_unreachable();
> > -- 
> > 2.43.0
> > 
> > 
> > -- 
> > opensbi mailing list
> > opensbi at lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/opensbi


