From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jan 2024 21:41:22 +0530
Subject: [PATCH v1 2/7] include: sbi: Add TINFO debug trigger CSR
In-Reply-To: <20231219112856.3865827-3-hchauhan@ventanamicro.com>
References: <20231219112856.3865827-1-hchauhan@ventanamicro.com> <20231219112856.3865827-3-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy1ug07=ODGJw7R3K_8FvfJzB0i++=hLgoJJePPLZkC-WQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 19, 2023 at 4:59?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Add the missing TINFO debug trigger CSR.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/riscv_encoding.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 0996d64..9501207 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -691,6 +691,7 @@
>  #define CSR_TDATA1                     0x7a1
>  #define CSR_TDATA2                     0x7a2
>  #define CSR_TDATA3                     0x7a3
> +#define CSR_TINFO                      0x7a4
>
>  /* Debug Mode Registers */
>  #define CSR_DCSR                       0x7b0
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

