From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Oct 2023 13:55:47 +0530
Subject: [PATCH] lib: sbi_misaligned_ldst: Fix handling of C.SWSP and C.SDSP
In-Reply-To: <20231001091226.592084-1-amanieu@gmail.com>
References: <20231001091226.592084-1-amanieu@gmail.com>
Message-ID: <CAAhSdy0Ut=A2T02FauaH=fZqpX8XosUt_fCMXbm0WhAW2sECPw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Oct 1, 2023 at 2:43?PM Amanieu d'Antras <amanieu@gmail.com> wrote:
>
> Unlike C.LWSP/C.LDSP, these encodings can be used with the zero
> register, so checking that the rs2 field is non-zero is unnecessary.
>
> Additionally, the previous check was incorrect since it was checking the
> immediate field of the instruction instead of the rs2 field.
>
> Signed-off-by: Amanieu d'Antras <amanieu@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Regards,
Anup

> ---
>  lib/sbi/sbi_misaligned_ldst.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/lib/sbi/sbi_misaligned_ldst.c b/lib/sbi/sbi_misaligned_ldst.c
> index 4b91e07..aa512de 100644
> --- a/lib/sbi/sbi_misaligned_ldst.c
> +++ b/lib/sbi/sbi_misaligned_ldst.c
> @@ -211,16 +211,14 @@ int sbi_misaligned_store_handler(ulong addr, ulong tval2, ulong tinst,
>         } else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
>                 len            = 8;
>                 val.data_ulong = GET_RS2S(insn, regs);
> -       } else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP &&
> -                  ((insn >> SH_RD) & 0x1f)) {
> +       } else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP) {
>                 len            = 8;
>                 val.data_ulong = GET_RS2C(insn, regs);
>  #endif
>         } else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
>                 len            = 4;
>                 val.data_ulong = GET_RS2S(insn, regs);
> -       } else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP &&
> -                  ((insn >> SH_RD) & 0x1f)) {
> +       } else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP) {
>                 len            = 4;
>                 val.data_ulong = GET_RS2C(insn, regs);
>  #ifdef __riscv_flen
> --
> 2.42.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

