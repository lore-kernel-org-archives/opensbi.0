From: Anup Patel <anup@brainfault.org>
Date: Sat, 11 Dec 2021 17:47:57 +0530
Subject: [PATCH v4 1/2] Makefile: Fix -msave-restore compile warning with
 CLANG-10 (or lower)
In-Reply-To: <20211203050334.729392-2-anup.patel@wdc.com>
References: <20211203050334.729392-1-anup.patel@wdc.com>
 <20211203050334.729392-2-anup.patel@wdc.com>
Message-ID: <CAAhSdy1oX_CwgtqucD-vc191oWv6G2==Bqh8j5EO89LtDLSq0g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 3, 2021 at 10:34 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> The riscv target of CLANG-10 (or lower) does not support the
> -m(no-)save-restore option so we get compile warnings. This patch
> fixes compile warning by using -m(no-)save-restore option only
> for GCC.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Reviewed-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

Applied this patch to the riscv/opensbi repo

Regards,
Anup

> ---
>  Makefile | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 8623c1c..d89a0c5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -275,8 +275,11 @@ GENFLAGS   +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
>  CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
> -CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> -CFLAGS         +=      -mno-save-restore -mstrict-align
> +CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
> +# CLANG-10 (or lower) does not support -m(no-)save-restore option
> +ifneq ($(CC_IS_CLANG),y)
> +CFLAGS         +=      -mno-save-restore
> +endif
>  CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  CFLAGS         +=      $(RELAX_FLAG)
> @@ -290,8 +293,11 @@ CPPFLAGS   +=      $(platform-cppflags-y)
>  CPPFLAGS       +=      $(firmware-cppflags-y)
>
>  ASFLAGS                =       -g -Wall -nostdlib
> -ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
> -ASFLAGS                +=      -mno-save-restore -mstrict-align
> +ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
> +# CLANG-10 (or lower) does not support -m(no-)save-restore option
> +ifneq ($(CC_IS_CLANG),y)
> +ASFLAGS                +=      -mno-save-restore
> +endif
>  ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  ASFLAGS                +=      $(RELAX_FLAG)
> --
> 2.25.1
>

