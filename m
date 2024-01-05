From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jan 2024 21:40:42 +0530
Subject: [PATCH v1 1/7] include: sbi: Introduce common endianess
 conversion macro
In-Reply-To: <20231219112856.3865827-2-hchauhan@ventanamicro.com>
References: <20231219112856.3865827-1-hchauhan@ventanamicro.com> <20231219112856.3865827-2-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy0itP10QyxagEcBQYupwGc72H=r-yyriBTTF+UWCNEeqA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 19, 2023 at 4:59?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Introduct cpu_to_lle and lle_to_cpu macros which invoke

s/Introduct/Introduce/

> correct word length cpu_to_le<64/32> conversion based on
> __riscv_xlen.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Otherwise, it looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_byteorder.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>
> diff --git a/include/sbi/sbi_byteorder.h b/include/sbi/sbi_byteorder.h
> index 15107e1..db6eb2b 100644
> --- a/include/sbi/sbi_byteorder.h
> +++ b/include/sbi/sbi_byteorder.h
> @@ -58,4 +58,14 @@
>  #define le64_to_cpu(x)         ((uint64_t)BSWAP64(x))
>  #endif
>
> +#if __riscv_xlen == 64
> +#define cpu_to_lle             cpu_to_le64
> +#define lle_to_cpu             le64_to_cpu
> +#elif __riscv_xlen == 32
> +#define cpu_to_lle             cpu_to_le32
> +#define lle_to_cpu             le32_to_cpu
> +#else
> +#error "Unknown __riscv_xlen"
> +#endif
> +
>  #endif /* __SBI_BYTEORDER_H__ */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

