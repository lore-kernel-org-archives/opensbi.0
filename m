From: Anup Patel <anup@brainfault.org>
Date: Mon, 17 Apr 2023 09:19:13 +0530
Subject: [PATCH 2/2] firmware: Change to use positive offset to access
 relocation entries
In-Reply-To: <20230404044601.2835305-2-bmeng@tinylab.org>
References: <20230404044601.2835305-1-bmeng@tinylab.org> <20230404044601.2835305-2-bmeng@tinylab.org>
Message-ID: <CAAhSdy32g5Uoi7xUAxgPi-CkJgmueq2b5EvcYt2_tcUbAq4CYA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 4, 2023 at 10:17?AM Bin Meng <bmeng@tinylab.org> wrote:
>
> The codes currently skip the very first relocation entry, but later
> reference the elements in the relocation entry using minus offsets.
>
> Change to use positive offsets so that there is no need to skip the
> first relocation entry.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  firmware/fw_base.S | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/firmware/fw_base.S b/firmware/fw_base.S
> index e30aca6..bb0401b 100644
> --- a/firmware/fw_base.S
> +++ b/firmware/fw_base.S
> @@ -79,13 +79,12 @@ _try_lottery:
>         lla     t0, __rel_dyn_start
>         lla     t1, __rel_dyn_end
>         beq     t0, t1, _relocate_done
> -       j       5f
>  2:
> -       REG_L   t5, -(REGBYTES*2)(t0)   /* t5 <-- relocation info:type */
> +       REG_L   t5, REGBYTES(t0)        /* t5 <-- relocation info:type */
>         li      t3, R_RISCV_RELATIVE    /* reloc type R_RISCV_RELATIVE */
>         bne     t5, t3, 3f
> -       REG_L   t3, -(REGBYTES*3)(t0)
> -       REG_L   t5, -(REGBYTES)(t0)     /* t5 <-- addend */
> +       REG_L   t3, 0(t0)
> +       REG_L   t5, (REGBYTES * 2)(t0)  /* t5 <-- addend */
>         add     t5, t5, t2
>         add     t3, t3, t2
>         REG_S   t5, 0(t3)               /* store runtime address to the GOT entry */
> @@ -101,11 +100,11 @@ _try_lottery:
>         bne     t5, t3, 5f
>
>         /* address R_RISCV_64 or R_RISCV_32 cases*/
> -       REG_L   t3, -(REGBYTES*3)(t0)
> +       REG_L   t3, 0(t0)
>         li      t5, SYM_SIZE
>         mul     t6, t6, t5
>         add     s5, t4, t6
> -       REG_L   t6, -(REGBYTES)(t0)     /* t0 <-- addend */
> +       REG_L   t6, (REGBYTES * 2)(t0)  /* t0 <-- addend */
>         REG_L   t5, REGBYTES(s5)
>         add     t5, t5, t6
>         add     t5, t5, t2              /* t5 <-- location to fix up in RAM */
> @@ -113,8 +112,8 @@ _try_lottery:
>         REG_S   t5, 0(t3)               /* store runtime address to the variable */
>
>  5:
> -       addi    t0, t0, (REGBYTES*3)
> -       ble     t0, t1, 2b
> +       addi    t0, t0, (REGBYTES * 3)
> +       blt     t0, t1, 2b
>         j       _relocate_done
>  _wait_relocate_copy_done:
>         j       _wait_for_boot_hart
> --
> 2.25.1
>

