From: Anup Patel <anup@brainfault.org>
Date: Tue, 9 Jan 2024 15:52:52 +0530
Subject: [PATCH v2 1/7] include: sbi: Introduce common endianess
 conversion macro
In-Reply-To: <20240108065525.208172-2-hchauhan@ventanamicro.com>
References: <20240108065525.208172-1-hchauhan@ventanamicro.com> <20240108065525.208172-2-hchauhan@ventanamicro.com>
Message-ID: <CAAhSdy3ONX76W8VXv4D=RzR8S9x0H3qQ41a+kqLP8AdkNRYVXw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 8, 2024 at 12:25?PM Himanshu Chauhan
<hchauhan@ventanamicro.com> wrote:
>
> Introduce cpu_to_lle and lle_to_cpu macros which invoke
> correct word length cpu_to_le<64/32> conversion based on
> __riscv_xlen.
>
> Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>

Already reviewed previously.

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

