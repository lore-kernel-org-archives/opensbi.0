From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Feb 2024 16:29:29 +0530
Subject: [PATCH v2 1/4] firmware: Add relocatable FW_JUMP_ADDR and FW_JUMP_FDT_ADDR
In-Reply-To: <IA1PR20MB495382D3F9CEEBAACA5F5E68BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495379ECC11096AEEBC4C691BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495382D3F9CEEBAACA5F5E68BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy3XCg0iS=q-2YSo1EGfxUFU0KLivWNTq3JO=E-108LiTw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 23, 2024 at 1:48?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> If FW_PIC=y is defined, the fw_jump.bin will be broken if
> FW_TEXT_START is wrong. This is not the desired behavior.
>
> Add two new variables to identify relocatable jump address:
> FW_JUMP_OFFSET and FW_JUMP_FDT_ADDR. To keep the existing
> ABI, FW_JUMP_ADDR and FW_JUMP_FDT_ADDR is prefered if they
> are defined.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  firmware/fw_jump.S  | 18 ++++++++++++++----
>  firmware/objects.mk |  6 ++++++
>  2 files changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> index ac74dc6..ebf297f 100644
> --- a/firmware/fw_jump.S
> +++ b/firmware/fw_jump.S
> @@ -46,6 +46,10 @@ fw_save_info:
>  fw_next_arg1:
>  #ifdef FW_JUMP_FDT_ADDR
>         li      a0, FW_JUMP_FDT_ADDR
> +#elif defined(FW_JUMP_FDT_OFFSET)
> +       lla     a0, _fw_start
> +       li      a1, FW_JUMP_FDT_OFFSET
> +       add     a0, a0, a1
>  #else
>         add     a0, a1, zero
>  #endif
> @@ -59,8 +63,16 @@ fw_next_arg1:
>          * The next address should be returned in 'a0'.
>          */
>  fw_next_addr:
> +#ifdef FW_JUMP_ADDR
>         lla     a0, _jump_addr
>         REG_L   a0, (a0)
> +#elif defined(FW_JUMP_OFFSET)
> +       lla     a0, _fw_start
> +       li      a1, FW_JUMP_OFFSET
> +       add     a0, a0, a1
> +#else
> +#error "Must define at least FW_JUMP_ADDR or FW_JUMP_OFFSET"
> +#endif
>         ret
>
>         .section .entry, "ax", %progbits
> @@ -86,11 +98,9 @@ fw_options:
>         add     a0, zero, zero
>         ret
>
> -#ifndef FW_JUMP_ADDR
> -#error "Must define FW_JUMP_ADDR"
> -#endif
> -
> +#ifdef FW_JUMP_ADDR
>         .section .rodata
>         .align 3
>  _jump_addr:
>         RISCV_PTR FW_JUMP_ADDR
> +#endif
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index a1704c4..fef090a 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -38,9 +38,15 @@ endif
>  firmware-bins-$(FW_DYNAMIC) += fw_dynamic.bin
>
>  firmware-bins-$(FW_JUMP) += fw_jump.bin
> +ifdef FW_JUMP_OFFSET
> +firmware-genflags-$(FW_JUMP) += -DFW_JUMP_OFFSET=$(FW_JUMP_OFFSET)
> +endif
>  ifdef FW_JUMP_ADDR
>  firmware-genflags-$(FW_JUMP) += -DFW_JUMP_ADDR=$(FW_JUMP_ADDR)
>  endif
> +ifdef FW_JUMP_FDT_OFFSET
> +firmware-genflags-$(FW_JUMP) += -DFW_JUMP_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
> +endif
>  ifdef FW_JUMP_FDT_ADDR
>  firmware-genflags-$(FW_JUMP) += -DFW_JUMP_FDT_ADDR=$(FW_JUMP_FDT_ADDR)
>  endif
> --
> 2.43.2
>

