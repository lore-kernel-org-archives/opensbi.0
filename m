From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 08:57:12 +0530
Subject: [PATCH 1/4] include: Add defines for [m|h|s]envcfg CSRs
In-Reply-To: <20220329155218.118580-2-apatel@ventanamicro.com>
References: <20220329155218.118580-1-apatel@ventanamicro.com>
 <20220329155218.118580-2-apatel@ventanamicro.com>
Message-ID: <CAAhSdy1u9r3oj3M-C1=3d7kjAonMKOf8=-r1mT2+88kQtmmU_Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 29, 2022 at 9:23 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The latest RISC-V privileged specification introduces xenvcfg CSRs
> to enable/disable certain features/extensions for lower privilege
> modes. This patch adds defines for these new [m|h|s]envcfg CSRs.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  include/sbi/riscv_encoding.h | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
>
> diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
> index 574d1c3..c02aa8f 100644
> --- a/include/sbi/riscv_encoding.h
> +++ b/include/sbi/riscv_encoding.h
> @@ -203,6 +203,22 @@
>
>  #define MHPMEVENT_SSCOF_MASK           _ULL(0xFFFF000000000000)
>
> +#if __riscv_xlen > 32
> +#define ENVCFG_STCE                    (_ULL(1) << 63)
> +#define ENVCFG_PBMTE                   (_ULL(1) << 62)
> +#else
> +#define ENVCFGH_STCE                   (_UL(1) << 31)
> +#define ENVCFGH_PBMTE                  (_UL(1) << 30)
> +#endif
> +#define ENVCFG_CBZE                    (_UL(1) << 7)
> +#define ENVCFG_CBCFE                   (_UL(1) << 6)
> +#define ENVCFG_CBIE_SHIFT              4
> +#define ENVCFG_CBIE                    (_UL(0x3) << ENVCFG_CBIE_SHIFT)
> +#define ENVCFG_CBIE_ILL                        _UL(0x0)
> +#define ENVCFG_CBIE_FLUSH              _UL(0x1)
> +#define ENVCFG_CBIE_INV                        _UL(0x3)
> +#define ENVCFG_FIOM                    _UL(0x1)
> +
>  /* ===== User-level CSRs ===== */
>
>  /* User Trap Setup (N-extension) */
> @@ -298,6 +314,9 @@
>  #define CSR_STVEC                      0x105
>  #define CSR_SCOUNTEREN                 0x106
>
> +/* Supervisor Configuration */
> +#define CSR_SENVCFG                    0x10a
> +
>  /* Supervisor Trap Handling */
>  #define CSR_SSCRATCH                   0x140
>  #define CSR_SEPC                       0x141
> @@ -336,6 +355,10 @@
>  #define CSR_HCOUNTEREN                 0x606
>  #define CSR_HGEIE                      0x607
>
> +/* Hypervisor Configuration */
> +#define CSR_HENVCFG                    0x60a
> +#define CSR_HENVCFGH                   0x61a
> +
>  /* Hypervisor Trap Handling (H-extension) */
>  #define CSR_HTVAL                      0x643
>  #define CSR_HIP                                0x644
> @@ -408,6 +431,10 @@
>  #define CSR_MCOUNTEREN                 0x306
>  #define CSR_MSTATUSH                   0x310
>
> +/* Machine Configuration */
> +#define CSR_MENVCFG                    0x30a
> +#define CSR_MENVCFGH                   0x31a
> +
>  /* Machine Trap Handling */
>  #define CSR_MSCRATCH                   0x340
>  #define CSR_MEPC                       0x341
> --
> 2.25.1
>

