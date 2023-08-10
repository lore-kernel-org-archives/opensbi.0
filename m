From: Andreas Schwab <schwab@suse.de>
Date: Thu, 10 Aug 2023 13:32:49 +0200
Subject: [PATCH] Makefile: Fix grep warning
In-Reply-To: <20230810110258.52482-2-ajones@ventanamicro.com> (Andrew Jones's
	message of "Thu, 10 Aug 2023 13:02:59 +0200")
References: <20230810110258.52482-2-ajones@ventanamicro.com>
Message-ID: <mvmwmy3f7z2.fsf@suse.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Aug 10 2023, Andrew Jones wrote:

> grep (at least my version, grep-3.8-3.fc38.x86_64) warns with
> "grep: warning: stray \ before -". Fix the warning by making
> the command line input to grep less ambiguous.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 730dbd910e51..03768a51f710 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -168,7 +168,7 @@ endif
>  OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>  
>  # Check whether the compiler supports -m(no-)save-restore
> -CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep "\-save\-restore" >/dev/null && echo n || echo y)
> +CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -- "-save-restore" >/dev/null && echo n || echo y)

Please use grep -e ... instead.

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

