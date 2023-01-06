From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Jan 2023 17:57:21 +0530
Subject: [PATCH] Makefile: Remove -N ldflag to prevent linker RWX warning
In-Reply-To: <20221225032211.1370467-1-rpathak@ventanamicro.com>
References: <20221225032211.1370467-1-rpathak@ventanamicro.com>
Message-ID: <CAAhSdy2oFFkShOvuSMRowihBGB-CEXUiQRZPYNHZWi3U0u9iNg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 25, 2022 at 9:35 AM Rahul Pathak <rpathak@ventanamicro.com> wrote:
>
> -N option coalesce all sections into single LOAD segment which causes
> data and other sections to have executable permission causing warning
> with new binutils ld 2.39.
> New ld emits warning when any segment have all three permissions RWX.
>
> ld.bfd: warning: test.elf has a LOAD segment with RWX permissions
> ld.bfd: warning: fw_dynamic.elf has a LOAD segment with RWX permissions
> ld.bfd: warning: fw_jump.elf has a LOAD segment with RWX permissions
> ld.bfd: warning: fw_payload.elf has a LOAD segment with RWX permissions
>
> This option was added in below commit -
> commit: eeab92f2423e ("Makefile: Convert to a more standard format")
>
> Removing -N option allows to have text and rodata into one LOAD
> segment and other sections into separate LOAD segment which prevents
> RWX permissions on single LOAD segment. Here X == E
>
> Current
>  LOAD           0x0000000000000120 0x0000000080000000 0x0000000080000000
>                  0x000000000001d4d0 0x0000000000032ed8  RWE    0x10
>
> -N removed
>   LOAD           0x0000000000001000 0x0000000080000000 0x0000000080000000
>                  0x00000000000198cc 0x00000000000198cc  R E    0x1000
>   LOAD           0x000000000001b000 0x000000008001a000 0x000000008001a000
>                  0x00000000000034d0 0x0000000000018ed8  RW     0x1000
>
> Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 92203c5a2ac0..b742d6dbc5e5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -369,7 +369,7 @@ ASFLAGS             +=      $(firmware-asflags-y)
>  ARFLAGS                =       rcs
>
>  ELFFLAGS       +=      $(USE_LD_FLAG)
> -ELFFLAGS       +=      -Wl,--build-id=none -Wl,-N
> +ELFFLAGS       +=      -Wl,--build-id=none
>  ELFFLAGS       +=      $(platform-ldflags-y)
>  ELFFLAGS       +=      $(firmware-ldflags-y)
>
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

