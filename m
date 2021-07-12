From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 12 Jul 2021 02:53:37 +0100
Subject: [PATCH] Makefile: Pass "-Wa, -mno-relax" to manually forward it to
 the GNU assembler when linking with LLD
In-Reply-To: <20210712015007.9946-1-bmeng.cn@gmail.com>
References: <20210712015007.9946-1-bmeng.cn@gmail.com>
Message-ID: <DD587BCF-44CC-41E4-AD35-2BC58518D1F6@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 12 Jul 2021, at 02:50, Bin Meng <bmeng.cn@gmail.com> wrote:
> 
> When generating code with -mno-relax, GCC puts .option norelax in
> the generated assembly, and so doesn?t bother passing on -mno-relax
> to the assembler. This has the unfortunate effect that, when using
> GCC to assemble hand-written assembly, -mno-relax does nothing,
> and we have to pass -Wa,-mno-relax to manually forward it to the
> assembler.
> 
> This is an old GCC bug that was fixed [1] recently. For the time
> being, let's pass "-Wa,-mno-relax" to ASFLAGS for the GCC + LLD
> combination to work, e.g.:
> 
>  $ make CC=riscv64-unknown-elf-gcc LLVM=1 PLATFORM=generic
> 
> [1] https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---
> 
> Makefile | 3 +++
> 1 file changed, 3 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 129b8ed..d9bb925 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -272,6 +272,9 @@ ASFLAGS		+=	-mno-save-restore -mstrict-align
> ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> ASFLAGS		+=	$(RELAX_FLAG)
> +ifeq ($(CC_IS_CLANG)$(LD_IS_LLD),ny)
> +ASFLAGS		+=	-Wa,-mno-relax
> +endif

Hm, I was thinking:

ifneq ($(CC_IS_CLANG),y)
ifneq ($(RELAX_FLAG),)
ASFLAGS		+=	-Wa,$(RELAX_FLAG)
endif
endif

That way you separate ?GCC needs the flag forwarded manually? from ?LLD
needs code compiled with the flag? (as well as what the flag actually
is, not that that matters).

Jess


