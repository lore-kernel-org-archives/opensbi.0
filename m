From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 21:39:51 +0800
Subject: [PATCH Zisslpcfi 1/2] include: adding support for zsslpcfi encodings
In-Reply-To: <20221212030804.927309-2-debug@rivosinc.com>
References: <20221212030804.927309-1-debug@rivosinc.com> <20221212030804.927309-2-debug@rivosinc.com>
Message-ID: <CAEUhbmXam4R3af9njRYYAXOFw8PYeYOXCRfjKfcbae=su-87dw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 12, 2022 at 11:10 AM Deepak Gupta <debug@rivosinc.com> wrote:
>
> zsslpcfi extension (see links) introduces b60 (CFI) in menvcfg CSR to

The extension name is Zisslpcfi (capital Z)

> enable shadow stack and landing pad for machine and lesser privileged
> modes. Additionally extension introduces new bits in xstatus for cfi
> state.
>
> Links:https://github.com/riscv/riscv-cfi

nits: need a space after :

s/Links/Link

>
> Signed-off-by: Deepak Gupta <debug@rivosinc.com>
> ---
>  include/sbi/riscv_encoding.h | 4 ++++
>  include/sbi/sbi_hart.h       | 2 ++
>  2 files changed, 6 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index b0f08c8..1fb520f 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -210,9 +210,11 @@
>  #if __riscv_xlen > 32
>  #define ENVCFG_STCE                    (_ULL(1) << 63)
>  #define ENVCFG_PBMTE                   (_ULL(1) << 62)
> +#define ENVCFG_CFI                     (_ULL(1) << 60)
>  #else
>  #define ENVCFGH_STCE                   (_UL(1) << 31)
>  #define ENVCFGH_PBMTE                  (_UL(1) << 30)
> +#define ENVCFGH_CFI                    (_UL(1) << 28)
>  #endif
>  #define ENVCFG_CBZE                    (_UL(1) << 7)
>  #define ENVCFG_CBCFE                   (_UL(1) << 6)
> @@ -229,6 +231,8 @@
>  #define CSR_USTATUS                    0x000
>  #define CSR_UIE                                0x004
>  #define CSR_UTVEC                      0x005
> +#define CSR_LPLR                       0x006
> +#define CSR_SSP                                0x020
>
>  /* User Trap Handling (N-extension) */
>  #define CSR_USCRATCH                   0x040
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 95b40e7..d25227d 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -36,6 +36,8 @@ enum sbi_hart_extensions {
>         SBI_HART_EXT_SMSTATEEN,
>         /** HART has Sstc extension */
>         SBI_HART_EXT_SSTC,
> +       /** HART has sslpcfi extension */

Zisslpcfi

> +       SBI_HART_EXT_SSLPCFI,

SBI_HART_EXT_ZISSLPCFI

>
>         /** Maximum index of Hart extension */
>         SBI_HART_EXT_MAX,
> --

Regards,
Bin

