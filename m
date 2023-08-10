From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 10 Aug 2023 13:40:27 +0200
Subject: [PATCH] Makefile: Fix grep warning
In-Reply-To: <mvmwmy3f7z2.fsf@suse.de>
References: <20230810110258.52482-2-ajones@ventanamicro.com>
 <mvmwmy3f7z2.fsf@suse.de>
Message-ID: <20230810-0ea8bc1ee6925836422aa14f@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 10, 2023 at 01:32:49PM +0200, Andreas Schwab wrote:
> On Aug 10 2023, Andrew Jones wrote:
> 
> > grep (at least my version, grep-3.8-3.fc38.x86_64) warns with
> > "grep: warning: stray \ before -". Fix the warning by making
> > the command line input to grep less ambiguous.
> >
> > Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> >  Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 730dbd910e51..03768a51f710 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -168,7 +168,7 @@ endif
> >  OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
> >  
> >  # Check whether the compiler supports -m(no-)save-restore
> > -CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep "\-save\-restore" >/dev/null && echo n || echo y)
> > +CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -- "-save-restore" >/dev/null && echo n || echo y)
> 
> Please use grep -e ... instead.

Sure, but I'd like to put a justification in the commit message, something
like, Use -e, as opposed to --, because...

Thanks,
drew

