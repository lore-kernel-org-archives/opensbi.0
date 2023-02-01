From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 1 Feb 2023 10:37:55 +0100
Subject: [PATCH v5 6/8] lib: sbi: Add console_puts() callback in the
 console device
In-Reply-To: <20230201093013.sibkotoeehynl7py@orel>
References: <20230113114110.1916226-1-apatel@ventanamicro.com>
 <20230113114110.1916226-7-apatel@ventanamicro.com>
 <20230201093013.sibkotoeehynl7py@orel>
Message-ID: <20230201093755.w624jjj5fnbmk6y7@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 01, 2023 at 10:30:13AM +0100, Andrew Jones wrote:
> On Fri, Jan 13, 2023 at 05:11:08PM +0530, Anup Patel wrote:
> > We add console_puts() callback in the console device which allows
> > console drivers (such as semihosting) to implement a specialized
> > way to output character string.
> > 
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Reviewed-by: Atish Patra <atishp@rivosinc.com>
> > Reviewed-by: Xiang W <wxjstz@126.com>
> > Reviewed-by: Bin Meng <bmeng@tinylab.org>
> > ---
> >  include/sbi/sbi_console.h |  3 +++
> >  lib/sbi/sbi_console.c     | 19 ++++++++++++++-----
> >  2 files changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/sbi/sbi_console.h b/include/sbi/sbi_console.h
> > index 660c239..8e95b9d 100644
> > --- a/include/sbi/sbi_console.h
> > +++ b/include/sbi/sbi_console.h
> > @@ -19,6 +19,9 @@ struct sbi_console_device {
> >  	/** Write a character to the console output */
> >  	void (*console_putc)(char ch);
> >  
> > +	/** Write a character string to the console output */
> > +	void (*console_puts)(const char *str, unsigned long len);
> 
> The spec draft says the write command is non-blocking and returns the
> number of bytes written. So this interface should at least return the
> number of bytes written. And, maybe it should take a flags parameter
> where a NON_BLOCKING flag can be set? But, if we can't enforce the
> console to be non-blocking at the SBI implementation level, then
> maybe the spec should state that the calls may block?
>

Also, if the console fails it'd be good if it returned an error,
allowing SBI_ERR_FAILED to be returned to the SBI caller as the
spec draft states. It'd be good if console_putc() could also
return an error for the same reason.

Thanks,
drew

