From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jan 2024 15:53:11 +0530
Subject: [PATCH v2 2/7] include: sbi: Add TINFO debug trigger CSR
In-Reply-To: <20240108065525.208172-3-hchauhan@ventanamicro.com>
References: <20240108065525.208172-1-hchauhan@ventanamicro.com> <20240108065525.208172-3-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3YqLnCvvW0MB=m4q7vE1fnCXeqjxDBhKGdjOLRz1S6XQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 8, 2024 at 12:25?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Add the missing TINFO debug trigger CSR.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Already reviewed previously.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/riscv_encoding.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index f20df76..e74cc0d 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -686,6 +686,7 @@
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

