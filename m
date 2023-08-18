From: Anup Patel <anup@brainfault.org>
Date: Fri, 18 Aug 2023 15:08:18 +0530
Subject: [PATCH v2] Makefile: Fix grep warning
In-Reply-To: <20230810121527.62217-2-ajones@ventanamicro.com>
References: <20230810121527.62217-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy2hp2PhuM-uSG6gbjF01D4B6USMG_FuzZ6fknVOTM6VCQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 10, 2023 at 5:45?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> grep (at least my version, grep-3.8-3.fc38.x86_64) warns with
> "grep: warning: stray \ before -". Fix the warning by making
> the command line input to grep less ambiguous.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel  <anup@brainfault.org>

Regards,
Anup

> ---
> v2: Use -e instead of -- [Andreas]
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 730dbd910e51..ca70949df480 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -168,7 +168,7 @@ endif
>  OPENSBI_LD_PIE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) $(USE_LD_FLAG) -fPIE -nostdlib -Wl,-pie -x c /dev/null -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>
>  # Check whether the compiler supports -m(no-)save-restore
> -CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep "\-save\-restore" >/dev/null && echo n || echo y)
> +CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -mno-save-restore -x c /dev/null -o /dev/null 2>&1 | grep -e "-save-restore" >/dev/null && echo n || echo y)
>
>  # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
>  CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
> --
> 2.41.0
>

