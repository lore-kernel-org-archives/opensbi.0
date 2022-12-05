From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 10:08:14 +0530
Subject: [PATCH v2 2/3] lib: sbi: Optionally use ".option arch,+h"
In-Reply-To: <688110cfcf63a3b70562d58daa095fcbb6a7820b.1669518264.git.research_trasio@irq.a4lg.com>
References: <cover.1669452733.git.research_trasio@irq.a4lg.com>
 <cover.1669518264.git.research_trasio@irq.a4lg.com> <688110cfcf63a3b70562d58daa095fcbb6a7820b.1669518264.git.research_trasio@irq.a4lg.com>
Message-ID: <CAAhSdy2kNehxoEPQit25PyVvKqBUv5r6=JPKtn5HTSYHAXykYg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Nov 27, 2022 at 8:35 AM Tsukasa OI <research_trasio@irq.a4lg.com> wrote:
>
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>
> On the debugger / disassembler, disassembling hfence.* as hfence.* requires
> indication of the 'H'-extension use.
>
> ".option arch,+[EXT_NAME]" is one of the such ways and this commit
> optionally inserts this assembler directive when supported.
>
> It enables disassembling on the software which supports "$x[arch]" (mapping
> symbols with ISA string) - latest GNU Binutils (will be released as 2.40).
> Note that this commit alone won't make disassembler behavior correct on
> GNU Binutils 2.39 because of a linker issue.
>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> ---
>  Makefile             | 6 ++++++
>  lib/sbi/sbi_hfence.S | 4 ++++
>  2 files changed, 10 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index e942dfdc00bc..d8b85f0497aa 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -173,6 +173,9 @@ CC_SUPPORT_SAVE_RESTORE := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib
>  # Check whether the assembler and the compiler support the Zicsr and Zifencei extensions
>  CC_SUPPORT_ZICSR_ZIFENCEI := $(shell $(CC) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -march=rv$(OPENSBI_CC_XLEN)imafd_zicsr_zifencei -x c /dev/null -o /dev/null 2>&1 | grep "zicsr\|zifencei" > /dev/null && echo n || echo y)
>
> +# Check whether the assembler support the H extension with .option arch,+h
> +AS_SUPPORT_H_EXT_BY_OPTION_ARCH := $(shell echo ".option arch,+h" | $(AS) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -x assembler-with-cpp -c - -o /dev/null 2>&1 | grep -i "warning:.*option" > /dev/null && echo n || echo y)
> +

Currently, its H-extension and in-future there will be some other
extension adding new instructions.

Please look at <linux>/arch/riscv/include/asm/insn-def.h, we should
go this route for OpenSBI as well.

Regards,
Anup

>  # Check whether the ".insn" directive on the assembler (with raw value) is supported
>  AS_SUPPORT_INSN_RAW_DIRECTIVE := $(shell echo ".insn 0x1000000f" | $(AS) $(CLANG_TARGET) $(RELAX_FLAG) -nostdlib -x assembler-with-cpp -c - -o /dev/null >/dev/null 2>&1 && echo y || echo n)
>
> @@ -331,6 +334,9 @@ GENFLAGS    +=  -DRAW_INSN=".insn"
>  else
>  GENFLAGS    +=  -DRAW_INSN=".word"
>  endif
> +ifeq ($(AS_SUPPORT_H_EXT_BY_OPTION_ARCH),y)
> +GENFLAGS    +=  -DOPENSBI_H_EXT_BY_OPTION_ARCH_SUPPORTED
> +endif
>  ifdef PLATFORM
>  GENFLAGS       +=      -include $(KCONFIG_AUTOHEADER)
>  endif
> diff --git a/lib/sbi/sbi_hfence.S b/lib/sbi/sbi_hfence.S
> index 40882e036932..146a41959a67 100644
> --- a/lib/sbi/sbi_hfence.S
> +++ b/lib/sbi/sbi_hfence.S
> @@ -8,6 +8,10 @@
>   *   Atish Patra <anup.patel@wdc.com>
>   */
>
> +#ifdef OPENSBI_H_EXT_BY_OPTION_ARCH_SUPPORTED
> +       .option arch,+h
> +#endif
> +
>         /*
>          * HFENCE.GVMA rs1, rs2
>          * HFENCE.GVMA zero, rs2
> --
> 2.38.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

