From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 09:44:44 +0530
Subject: [PATCH 2/3] firmware: Remove handling of R_RISCV_{32,64}
In-Reply-To: <TYYP286MB14392A606EEDABFB7734CB88C6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439495D0B19A0ECFD89BDABC6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14392A606EEDABFB7734CB88C6F4A@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy3Dmu7+DYZg8DcT9Y2QH-cRhYcfV4uLcvSDqeVBgsun=A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Sep 17, 2023 at 11:23?PM Vivian Wang <dramforever@live.com> wrote:
>
> Since everything is statically linked, we won't actually have
> R_RISCV_{32,64} relocations. No need to handle these.
>
> Fixes: 0f20e8adcf42 ("firmware: Support position independent execution")
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  firmware/fw_base.S      | 22 ----------------------
>  firmware/fw_base.ldS    |  6 ------
>  include/sbi/riscv_elf.h |  8 --------
>  3 files changed, 36 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index ca34b4c..42b03fe 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -88,30 +88,8 @@ _try_lottery:
>         add     t5, t5, t2
>         add     t3, t3, t2
>         REG_S   t5, 0(t3)               /* store runtime address to the GOT entry */
> -       j       5f
>
>  3:
> -       lla     t4, __dyn_sym_start
> -
> -4:
> -       srli    t6, t5, SYM_INDEX       /* t6 <--- sym table index */
> -       andi    t5, t5, 0xFF            /* t5 <--- relocation type */
> -       li      t3, RELOC_TYPE
> -       bne     t5, t3, 5f
> -
> -       /* address R_RISCV_64 or R_RISCV_32 cases*/
> -       REG_L   t3, 0(t0)
> -       li      t5, SYM_SIZE
> -       mul     t6, t6, t5
> -       add     s5, t4, t6
> -       REG_L   t6, (REGBYTES * 2)(t0)  /* t0 <-- addend */
> -       REG_L   t5, REGBYTES(s5)
> -       add     t5, t5, t6
> -       add     t5, t5, t2              /* t5 <-- location to fix up in RAM */
> -       add     t3, t3, t2              /* t3 <-- location to fix up in RAM */
> -       REG_S   t5, 0(t3)               /* store runtime address to the variable */
> -
> -5:
>         addi    t0, t0, (REGBYTES * 3)
>         blt     t0, t1, 2b
>         j       _relocate_done
> diff --git a/firmware/fw_base.ldS b/firmware/fw_base.ldS
> index 88b8dfd..c15ccdb 100644
> --- a/firmware/fw_base.ldS
> +++ b/firmware/fw_base.ldS
> @@ -40,12 +40,6 @@
>
>         . = ALIGN(0x1000); /* Ensure next section is page aligned */
>
> -       .dynsym : {
> -               PROVIDE(__dyn_sym_start = .);
> -               *(.dynsym)
> -               PROVIDE(__dyn_sym_end = .);
> -       }
> -
>         .rela.dyn : {
>                 PROVIDE(__rel_dyn_start = .);
>                 *(.rela*)
> diff --git a/include/sbi/riscv_elf.h b/include/sbi/riscv_elf.h
> index 3b62c38..ed361e3 100644
> --- a/include/sbi/riscv_elf.h
> +++ b/include/sbi/riscv_elf.h
> @@ -1,14 +1,6 @@
>  #ifndef __RISCV_ELF_H__
>  #define __RISCV_ELF_H__
>
> -#include <sbi/riscv_asm.h>
> -
> -#define R_RISCV_32             1
> -#define R_RISCV_64             2
>  #define R_RISCV_RELATIVE       3
>
> -#define RELOC_TYPE             __REG_SEL(R_RISCV_64, R_RISCV_32)
> -#define SYM_INDEX              __REG_SEL(0x20, 0x8)
> -#define SYM_SIZE               __REG_SEL(0x18,0x10)
> -
>  #endif
> --
> 2.41.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

