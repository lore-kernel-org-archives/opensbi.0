From: Anup Patel <anup@brainfault.org>
Date: Tue, 27 Jul 2021 17:03:56 +0530
Subject: [PATCH v2] Makefile: Manually forward RELAX_FLAG to the GNU
 assembler when linking with LLD
In-Reply-To: <20210712021253.15777-1-bmeng.cn@gmail.com>
References: <20210712021253.15777-1-bmeng.cn@gmail.com>
Message-ID: <CAAhSdy2=x5MXBGyKpCk1ryw6cNxFhoZ2Va1fyytzQZH-d2fkjA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 12, 2021 at 7:43 AM Bin Meng <bmeng.cn@gmail.com> wrote:
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
>   $ make CC=riscv64-unknown-elf-gcc LLVM=1 PLATFORM=generic
>
> [1] https://github.com/gcc-mirror/gcc/commit/3b0a7d624e64eeb81e4d5e8c62c46d86ef521857
>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

>
> ---
>
> Changes in v2:
> - Use Jessica's suggestion
>
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 129b8ed..16d9dca 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -272,6 +272,11 @@ ASFLAGS            +=      -mno-save-restore -mstrict-align
>  ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  ASFLAGS                +=      $(RELAX_FLAG)
> +ifneq ($(CC_IS_CLANG),y)
> +ifneq ($(RELAX_FLAG),)
> +ASFLAGS                +=      -Wa,$(RELAX_FLAG)
> +endif
> +endif
>  ASFLAGS                +=      $(GENFLAGS)
>  ASFLAGS                +=      $(platform-asflags-y)
>  ASFLAGS                +=      $(firmware-asflags-y)
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

