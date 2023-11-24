From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 24 Nov 2023 14:47:47 +0000
Subject: [PATCH v3 05/15] platform: include: andes45: Add PMU related CSR defines
In-Reply-To: <20231122073617.379441-6-peterlin@andestech.com>
References: <20231122073617.379441-1-peterlin@andestech.com> <20231122073617.379441-6-peterlin@andestech.com>
Message-ID: <CA+V-a8tEJEy-+O=ksUFGOQV6sdKsSmNe3fDf5Jx8_8W2XCRO2g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Nov 22, 2023 at 7:40?AM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> This patch adds CSR for Andes PMU extension.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Leo Yu-Chi Liang <ycliang@andestech.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
> Changes v1 -> v2:
>   - Rename andes_pmu() -> has_andes_pmu()
> Changes v2 -> v3:
>   - Include Anup's RB tag
> ---
>  platform/generic/include/andes/andes45.h | 26 ++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
> index f570994..ce31617 100644
> --- a/platform/generic/include/andes/andes45.h
> +++ b/platform/generic/include/andes/andes45.h
> @@ -12,6 +12,17 @@
>  #define CSR_MDCM_CFG           0xfc1
>  #define CSR_MMSC_CFG           0xfc2
>
> +/* Machine Trap Related Registers */
> +#define CSR_MSLIDELEG          0x7d5
> +
> +/* Counter Related Registers */
> +#define CSR_MCOUNTERWEN                0x7ce
> +#define CSR_MCOUNTERINTEN      0x7cf
> +#define CSR_MCOUNTERMASK_M     0x7d1
> +#define CSR_MCOUNTERMASK_S     0x7d2
> +#define CSR_MCOUNTERMASK_U     0x7d3
> +#define CSR_MCOUNTEROVF                0x7d4
> +
>  #define MICM_CFG_ISZ_OFFSET            6
>  #define MICM_CFG_ISZ_MASK              (0x7  << MICM_CFG_ISZ_OFFSET)
>
> @@ -26,4 +37,19 @@
>  #define MCACHE_CTL_CCTL_SUEN_OFFSET    8
>  #define MCACHE_CTL_CCTL_SUEN_MASK      (0x1 << MCACHE_CTL_CCTL_SUEN_OFFSET)
>
> +/* Performance monitor */
> +#define MMSC_CFG_PMNDS_MASK            (1 << 15)
> +#define MIP_PMOVI                      (1 << 18)
> +
> +#ifndef __ASSEMBLER__
> +
> +#define has_andes_pmu()                                        \
> +({                                                     \
> +       (((csr_read(CSR_MMSC_CFG) &                     \
> +          MMSC_CFG_PMNDS_MASK)                         \
> +         && misa_extension('S')) ? true : false);      \
> +})
> +
> +#endif /* __ASSEMBLER__ */
> +
>  #endif /* _RISCV_ANDES45_H */
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

