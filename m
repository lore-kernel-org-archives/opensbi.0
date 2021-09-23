From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Sep 2021 10:11:23 +0530
Subject: [RFC PATCH 2/9] lib: sbi: Use csr_read/write_num for mhpmeventh
 csrs as well
In-Reply-To: <20210909204031.1239254-3-atish.patra@wdc.com>
References: <20210909204031.1239254-1-atish.patra@wdc.com>
 <20210909204031.1239254-3-atish.patra@wdc.com>
Message-ID: <CAAhSdy2y8aoEQkOx0xTDvvek-7O2=0YO+gaANi174fA-yhDWaw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Sep 10, 2021 at 2:10 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> The sscof extension introduces mhpmeventh csrs to handle filtering
> /overflow bits in RV32. Add the support to read/write them.

Use "mhpmevent[h]" instead of "mhpmeventh" in patch subject and
description because this patch applies to both mhpmevent and
mhpmeventh CSRs.

>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

> ---
>  lib/sbi/riscv_asm.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
> index 4c24a5132195..ea6dd0837774 100644
> --- a/lib/sbi/riscv_asm.c
> +++ b/lib/sbi/riscv_asm.c
> @@ -124,6 +124,11 @@ unsigned long csr_read_num(int csr_num)
>         switchcase_csr_read_4(CSR_MHPMCOUNTER4, ret)
>         switchcase_csr_read_8(CSR_MHPMCOUNTER8, ret)
>         switchcase_csr_read_16(CSR_MHPMCOUNTER16, ret)
> +       switchcase_csr_read(CSR_MCOUNTINHIBIT, ret)
> +       switchcase_csr_read(CSR_MHPMEVENT3, ret)
> +       switchcase_csr_read_4(CSR_MHPMEVENT4, ret)
> +       switchcase_csr_read_8(CSR_MHPMEVENT8, ret)
> +       switchcase_csr_read_16(CSR_MHPMEVENT16, ret)
>  #if __riscv_xlen == 32
>         switchcase_csr_read(CSR_MCYCLEH, ret)
>         switchcase_csr_read(CSR_MINSTRETH, ret)
> @@ -131,6 +136,10 @@ unsigned long csr_read_num(int csr_num)
>         switchcase_csr_read_4(CSR_MHPMCOUNTER4H, ret)
>         switchcase_csr_read_8(CSR_MHPMCOUNTER8H, ret)
>         switchcase_csr_read_16(CSR_MHPMCOUNTER16H, ret)
> +       switchcase_csr_read(CSR_MHPMEVENT3H, ret)
> +       switchcase_csr_read_4(CSR_MHPMEVENT4H, ret)
> +       switchcase_csr_read_8(CSR_MHPMEVENT8H, ret)
> +       switchcase_csr_read_16(CSR_MHPMEVENT16H, ret)
>  #endif
>
>         default:
> @@ -189,6 +198,10 @@ void csr_write_num(int csr_num, unsigned long val)
>         switchcase_csr_write_4(CSR_MHPMCOUNTER4H, val)
>         switchcase_csr_write_8(CSR_MHPMCOUNTER8H, val)
>         switchcase_csr_write_16(CSR_MHPMCOUNTER16H, val)
> +       switchcase_csr_write(CSR_MHPMEVENT3H, val)
> +       switchcase_csr_write_4(CSR_MHPMEVENT4H, val)
> +       switchcase_csr_write_8(CSR_MHPMEVENT8H, val)
> +       switchcase_csr_write_16(CSR_MHPMEVENT16H, val)
>  #endif
>         switchcase_csr_write(CSR_MCOUNTINHIBIT, val)
>         switchcase_csr_write(CSR_MHPMEVENT3, val)
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

