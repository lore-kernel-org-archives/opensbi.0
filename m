From: Anup Patel <anup@brainfault.org>
Date: Fri, 6 Oct 2023 18:05:34 +0530
Subject: [PATCH] lib: sbi: Add support for mconfigptr
In-Reply-To: <TYWP286MB2987DF5FDABB17DF166C2588A5C1A@TYWP286MB2987.JPNP286.PROD.OUTLOOK.COM>
References: <TYWP286MB2987DF5FDABB17DF166C2588A5C1A@TYWP286MB2987.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy3y_AqQFRm60LWVV1EbO73+feRbQCjabWLtyGRnDv68UQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 28, 2023 at 1:58?PM <jay1273062855@outlook.com> wrote:
>
> From: Yangjie Zhang <jay1273062855@outlook.com>
>
> RISC-V privileged specification v1.12 introduced the mconfigptr CSR
> which will hold the physical address of a configuration data
> structure.
>
> Signed-off-by: Yangjie Zhang <jay1273062855@outlook.com>

Although, we don't use the mconfigptr CSR at the moment but it
does not hurt to have CSR define.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index d137bf8..d7a000f 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -430,6 +430,7 @@
>  #define CSR_MARCHID                    0xf12
>  #define CSR_MIMPID                     0xf13
>  #define CSR_MHARTID                    0xf14
> +#define CSR_MCONFIGPTR         0xf15
>
>  /* Machine Trap Setup */
>  #define CSR_MSTATUS                    0x300
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

