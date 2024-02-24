From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Feb 2024 16:29:59 +0530
Subject: [PATCH v2 3/4] platform: Apply relocatable address
In-Reply-To: <IA1PR20MB495323C838505F085A4E402CBB552@IA1PR20MB4953.namprd20.prod.outlook.com>
References: <IA1PR20MB495379ECC11096AEEBC4C691BB552@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB495323C838505F085A4E402CBB552@IA1PR20MB4953.namprd20.prod.outlook.com>
Message-ID: <CAAhSdy2QRQhNbhiYewoKhDMjuDeWbPFbuQ9fYWTVxFLvv0vK0w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 23, 2024 at 1:48?PM Inochi Amaoto <inochiama@outlook.com> wrote:
>
> Since jump and payload firmware support relocatable address, make
> general platform use runtime relocatable address.
>
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  platform/generic/objects.mk  |  8 ++++----
>  platform/template/objects.mk | 17 +++++++++++++++++
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/platform/generic/objects.mk b/platform/generic/objects.mk
> index 136853e..85aa723 100644
> --- a/platform/generic/objects.mk
> +++ b/platform/generic/objects.mk
> @@ -27,12 +27,12 @@ FW_DYNAMIC=y
>  FW_JUMP=y
>  ifeq ($(PLATFORM_RISCV_XLEN), 32)
>    # This needs to be 4MB aligned for 32-bit system
> -  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x400000)))
> +  FW_JUMP_OFFSET=0x400000
>  else
>    # This needs to be 2MB aligned for 64-bit system
> -  FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x200000)))
> +  FW_JUMP_OFFSET=0x200000
>  endif
> -FW_JUMP_FDT_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x2200000)))
> +FW_JUMP_FDT_OFFSET=0x2200000
>  FW_PAYLOAD=y
>  ifeq ($(PLATFORM_RISCV_XLEN), 32)
>    # This needs to be 4MB aligned for 32-bit system
> @@ -41,4 +41,4 @@ else
>    # This needs to be 2MB aligned for 64-bit system
>    FW_PAYLOAD_OFFSET=0x200000
>  endif
> -FW_PAYLOAD_FDT_ADDR=$(FW_JUMP_FDT_ADDR)
> +FW_PAYLOAD_FDT_OFFSET=$(FW_JUMP_FDT_OFFSET)
> diff --git a/platform/template/objects.mk b/platform/template/objects.mk
> index 0025928..b143cbc 100644
> --- a/platform/template/objects.mk
> +++ b/platform/template/objects.mk
> @@ -63,6 +63,17 @@ FW_JUMP=<y|n>
>  # This needs to be 4MB aligned for 32-bit support
>  # This needs to be 2MB aligned for 64-bit support
>  # ifeq ($(PLATFORM_RISCV_XLEN), 32)
> +# FW_JUMP_OFFSET=0x400000
> +# else
> +# FW_JUMP_OFFSET=0x200000
> +# endif
> +# FW_JUMP_FDT_OFFSET=0x2200000
> +#
> +# You can use fixed address for jump firmware as an alternative option,
> +# but this may fail when setting wrong FW_TEXT_START. Use with caution.
> +# SBI will prefer "<X>_ADDR" if both "<X>_ADDR" and "<X>_OFFSET" are
> +# defined
> +# ifeq ($(PLATFORM_RISCV_XLEN), 32)
>  # FW_JUMP_ADDR=0x80400000
>  # else
>  # FW_JUMP_ADDR=0x80200000
> @@ -84,4 +95,10 @@ FW_PAYLOAD_OFFSET=0x200000
>  endif
>  # FW_PAYLOAD_ALIGN=0x1000
>  # FW_PAYLOAD_PATH="path to next boot stage binary image file"
> +# FW_PAYLOAD_FDT_OFFSET=0x2200000
> +#
> +# You can use fixed address for payload firmware as an alternative option,
> +# but this may fail when setting wrong FW_TEXT_START. Use with caution.
> +# SBI will prefer "FW_PAYLOAD_FDT_ADDR" if both "FW_PAYLOAD_FDT_OFFSET"
> +# and "FW_PAYLOAD_FDT_ADDR" are defined.
>  # FW_PAYLOAD_FDT_ADDR=0x82200000
> --
> 2.43.2
>

