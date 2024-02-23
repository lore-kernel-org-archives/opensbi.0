From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Feb 2024 10:28:49 +0530
Subject: [PATCH 1/4] firmware: Add relocatable FW_JUMP_ADDR and FW_JUMP_FDT_ADDR
In-Reply-To: <IA1PR20MB4953C326B2BADDFFAB32987BBB422@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495352218C0BF2CE8D86B3B9BB422@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953C326B2BADDFFAB32987BBB422@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy3y7x5gorsW9LKpLS0ucYrOmse4-v8HwgqYnD8r9iKP5Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 2, 2024 at 9:35?AM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> If FW_PIC=y is defined, the fw_jump.bin will be broken if
> FW_TEXT_START is wrong. This is not the desired behavior.

We should support FW_JUMP_OFFSET, irrespective of whether
FW_PIC is defined or not.

>
> Add two new variables to identify relocatable jump address:
> FW_JUMP_OFFSET and FW_JUMP_FDT_ADDR. To keep the existing
> ABI, FW_JUMP_ADDR and FW_JUMP_FDT_ADDR is prefered if they
> are defined. And these two new variables will convert to
> the old one if compiler does not support PIC.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  firmware/fw_jump.S  | 20 ++++++++++++++++----
>  firmware/objects.mk | 15 +++++++++++++++
>  2 files changed, 31 insertions(+), 4 deletions(-)
>
> diff --git a/firmware/fw_jump.S b/firmware/fw_jump.S
> index ac74dc6..0ad2398 100644
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
> @@ -59,7 +63,13 @@ fw_next_arg1:
>          * The next address should be returned in 'a0'.
>          */
>  fw_next_addr:
> +#ifdef FW_JUMP_ADDR
>         lla     a0, _jump_addr
> +#elif defined(FW_JUMP_OFFSET)
> +       lla     a0, _fw_start
> +       li      a1, FW_JUMP_OFFSET
> +       add     a0, a0, a1

What if both FW_JUMP_ADDR and FW_JUMP_OFFSET are not available ?

> +#endif
>         REG_L   a0, (a0)
>         ret
>
> @@ -86,11 +96,13 @@ fw_options:
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
> +#else
> +#ifndef FW_JUMP_OFFSET
> +#error "Must define at least FW_JUMP_ADDR or FW_JUMP_OFFSET"
> +#endif
> +#endif
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index a1704c4..248706d 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -35,12 +35,27 @@ firmware-genflags-y += -DFW_FDT_PADDING=$(FW_FDT_PADDING)
>  endif
>  endif
>
> +ifeq ($(FW_PIC),n)

Let's not condition this upon FW_PIC.

Instead this should be:

ifdef FW_JUMP_OFFSET

> +  ifndef FW_JUMP_ADDR
> +    FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + $(FW_JUMP_OFFSET))))
> +  endif
> +  ifndef FW_JUMP_FDT_ADDR
> +    FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + $(FW_JUMP_FDT_OFFSET))))
> +  endif
> +endif
> +
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
> 2.43.0
>

Regards,
Anup

