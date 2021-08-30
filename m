From: Anup Patel <Anup.Patel@wdc.com>
Date: Mon, 30 Aug 2021 03:56:27 +0000
Subject: [PATCH v2] lib: sbi: protect dprintf output with spinlock
In-Reply-To: <8e0a879265c7817ba07e6e64353d81a2816b46b2.camel@126.com>
References: <20210828064502.7227-1-Dd_nirvana@sjtu.edu.cn>
 <8e0a879265c7817ba07e6e64353d81a2816b46b2.camel@126.com>
Message-ID: <397FF35B-066C-4490-9D98-016571D66BF7@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



?On 30/08/21, 8:20 AM, "opensbi on behalf of Xiang W" <opensbi-bounces at lists.infradead.org on behalf of wxjstz@126.com> wrote:

    ? 2021-08-28???? 14:45 +0800?Dong Du???
    > Avoid getting messages from multiple harts (using dprintf and printf)
    > concurrently with a spinlock serializaing calls to sbi_dprintf(),
    > sbi_printf() and sbi_puts()
    > 
    > Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

    look good to me.
    Reviewed-by: Xiang W <wxjstz@126.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

    > ---
    >  lib/sbi/sbi_console.c | 5 ++++-
    >  1 file changed, 4 insertions(+), 1 deletion(-)
    > 
    > diff --git a/lib/sbi/sbi_console.c b/lib/sbi/sbi_console.c
    > index b54f7a2..29eede3 100644
    > --- a/lib/sbi/sbi_console.c
    > +++ b/lib/sbi/sbi_console.c
    > @@ -387,8 +387,11 @@ int sbi_dprintf(const char *format, ...)
    >         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
    >  
    >         va_start(args, format);
    > -       if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS)
    > +       if (scratch->options & SBI_SCRATCH_DEBUG_PRINTS) {
    > +               spin_lock(&console_out_lock);
    >                 retval = print(NULL, NULL, format, args);
    > +               spin_unlock(&console_out_lock);
    > +       }
    >         va_end(args);
    >  
    >         return retval;
    > -- 
    > 2.31.1
    > 
    > 



    -- 
    opensbi mailing list
    opensbi at lists.infradead.org
    http://lists.infradead.org/mailman/listinfo/opensbi

