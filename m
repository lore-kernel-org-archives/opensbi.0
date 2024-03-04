From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 4 Mar 2024 10:42:25 +0530
Subject: [PATCH] lib: sbi_misaligned_ldst: Add handling of C.LHU/C.LH and C.SH
In-Reply-To: <20240226055644.881161-1-nylon.chen@sifive.com>
References: <20240226055644.881161-1-nylon.chen@sifive.com>
Message-ID: <CAK9=C2X+UOdj3AUkxpyOS=PwE+xEsyQSr+zknAscLih2eR0S+g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 26, 2024 at 11:27?AM Nylon Chen <nylon.chen@sifive.com> wrote:
>
> From: "Nylon Chen" <nylon.chen@sifive.com>
>
> Added exception handling for compressed instructions C.LHU, C.LH, and
> C.SH from the zcb extension to the sbi_misaligned_ldst library.
>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  include/sbi/riscv_encoding.h  |  7 +++++++
>  lib/sbi/sbi_misaligned_ldst.c | 10 ++++++++++
>  2 files changed, 17 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index e74cc0d..3d77e26 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -837,6 +837,13 @@
>  #define INSN_MATCH_C_FSWSP             0xe002
>  #define INSN_MASK_C_FSWSP              0xe003
>
> +#define INSN_MATCH_C_LHU               0x8400
> +#define INSN_MASK_C_LHU                0xfc43
> +#define INSN_MATCH_C_LH                0x8440
> +#define INSN_MASK_C_LH                 0xfc43
> +#define INSN_MATCH_C_SH                0x8c00
> +#define INSN_MASK_C_SH                 0xfc43
> +
>  #define INSN_MASK_WFI                  0xffffff00
>  #define INSN_MATCH_WFI                 0x10500000
>
> diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
> index aa512de..9ca225a 100644
> --- a/lib/sbi/sbi_misaligned_ldst.c
> +++ b/lib/sbi/sbi_misaligned_ldst.c
> @@ -123,6 +123,13 @@ int sbi_misaligned_load_handler(ulong addr, ulong tval2, ulong tinst,
>                 len = 4;
>  #endif
>  #endif
> +       } else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
> +               len = 2;
> +               insn = RVC_RS2S(insn) << SH_RD;
> +       } else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
> +               len = 2;
> +               shift = 8 * (sizeof(ulong) - len);
> +               insn = RVC_RS2S(insn) << SH_RD;
>         } else {
>                 uptrap.epc = regs->mepc;
>                 uptrap.cause = CAUSE_MISALIGNED_LOAD;
> @@ -237,6 +244,9 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
>                 val.data_ulong = GET_F32_RS2C(insn, regs);
>  #endif
>  #endif
> +       } else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
> +               len             = 2;
> +               val.data_ulong = GET_RS2S(insn, regs);

Don't need to handle "c.sb" instruction ??

>         } else {
>                 uptrap.epc = regs->mepc;
>                 uptrap.cause = CAUSE_MISALIGNED_STORE;
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Regards,
Anup

