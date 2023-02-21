From: Conor Dooley <conor@kernel.org>
Date: Tue, 21 Feb 2023 10:06:31 +0000
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/3=5D_platfo?= =?US-ASCII?Q?rm=3A_generic=3A_renesas=3A_rzf?= =?US-ASCII?Q?ive=3A_Add_SBI_EXT_to_check_for_enabling_IOCP_errata?=
In-Reply-To: <CAAhSdy046QNs-ae+mKs1J0E0bPv_Ew0JP4sNQa2RVzPmW6u8EA@mail.gmail.com>
References: <20230213215111.32017-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230213215111.32017-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAAhSdy046QNs-ae+mKs1J0E0bPv_Ew0JP4sNQa2RVzPmW6u8EA@mail.gmail.com>
Message-ID: <4FB80591-F4AE-4735-82CA-4B69B129DE2B@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 20 February 2023 15:31:32 GMT, Anup Patel <anup@brainfault.org> wrote:
>On Tue, Feb 14, 2023 at 3:21 AM Lad Prabhakar
><prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>>
>> I/O Coherence Port (IOCP) provides an AXI interface for connecting
>> external non-caching masters, such as DMA controllers. The accesses
>> from IOCP are coherent with D-Caches and L2 Cache.
>>
>> IOCP is a specification option and is disabled on the Renesas RZ/Five
>> SoC due to this reason IP blocks using DMA will fail.
>>
>> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
>> software. Firstly OpenSBI configures the memory region as
>> "Memory, Non-cacheable, Bufferable" and passes this region as a global
>> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
>> allocations happen from this region and synchronization callbacks are
>> implemented to synchronize when doing DMA transactions.
>>
>> RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP
>> errata should be applied to handle cache management.
>>
>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>> Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
>> ---
>>  platform/generic/include/andes/andes45.h | 25 +++++++++++++--
>>  platform/generic/renesas/rzfive/rzfive.c | 41 ++++++++++++++++++++++++
>>  2 files changed, 64 insertions(+), 2 deletions(-)
>>
>> diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes45.h
>> index 08b3d18..d5d265f 100644
>> --- a/platform/generic/include/andes/andes45.h
>> +++ b/platform/generic/include/andes/andes45.h
>> @@ -4,7 +4,28 @@
>>  #define CSR_MARCHID_MICROID 0xfff
>>
>>  /* Memory and Miscellaneous Registers */
>> -#define CSR_MCACHE_CTL 0x7ca
>> -#define CSR_MCCTLCOMMAND 0x7cc
>> +#define CSR_MCACHE_CTL         0x7ca
>> +#define CSR_MCCTLCOMMAND       0x7cc
>> +#define CSR_MICM_CFG           0xfc0
>> +#define CSR_MDCM_CFG           0xfc1
>> +#define CSR_MMSC_CFG           0xfc2
>> +
>> +#define MISA_20_OFFSET                 20
>> +#define MISA_20_MASK                   (0x1 << MISA_20_OFFSET)
>> +
>> +#define MICM_CFG_ISZ_OFFSET            6
>> +#define MICM_CFG_ISZ_MASK              (0x7  << MICM_CFG_ISZ_OFFSET)
>> +
>> +#define MDCM_CFG_DSZ_OFFSET            6
>> +#define MDCM_CFG_DSZ_MASK              (0x7  << MDCM_CFG_DSZ_OFFSET)
>> +
>> +#define MMSC_CFG_CCTLCSR_OFFSET                16
>> +#define MMSC_CFG_CCTLCSR_MASK          (0x1 << MMSC_CFG_CCTLCSR_OFFSET)
>> +#define MMSC_IOCP_OFFSET                       47
>> +#define MMSC_IOCP_MASK                 (0x1ULL << MMSC_IOCP_OFFSET)
>> +
>> +#define MCACHE_CTL_CCTL_SUEN_OFFSET    8
>> +#define MCACHE_CTL_CCTL_SUEN_MASK      (0x1 << MCACHE_CTL_CCTL_SUEN_OFFSET)
>> +
>>
>>  #endif /* _RISCV_ANDES45_H */
>> diff --git a/platform/generic/renesas/rzfive/rzfive.c b/platform/generic/renesas/rzfive/rzfive.c
>> index 4d71d0d..9530d28 100644
>> --- a/platform/generic/renesas/rzfive/rzfive.c
>> +++ b/platform/generic/renesas/rzfive/rzfive.c
>> @@ -4,11 +4,14 @@
>>   *
>>   */
>>
>> +#include <andes/andes45.h>
>>  #include <andes/andes45_pma.h>
>>  #include <platform_override.h>
>>  #include <sbi/sbi_domain.h>
>>  #include <sbi_utils/fdt/fdt_helper.h>
>>
>> +#define RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND      0
>
>The SBI vendor extension_id will be the same for all SoCs based on Andes
>CPUs so the function_id space will be shared across all such SoCs.

Apologies for sticking my nose in here, but I'm a bit confused as to why is being added as an rz/five specific thing in the first place?
My uninformed view of the world sees other purchasers of the IP needing to apply this workaround too, no?

>How does Andes plan to manage the function_id space of SBI vendor extension ?
>
>I suggest the following:
>1) The function_id == 0 can be used to return an SoC identifier. For example,
>     Renesas RzFive can have an SoC identifier "0".
>2) Move RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND to a
>    separate header at platform/generic/include/andes/andes_sbi.h and
>    change it's value to "1"
>
>The above suggestion will help multiple SoC with Andes CPU share same
>SBI function_id space for SBI vendor extension.

Sharing here makes complete sense to me, so that you don't end up duplicating this the next time someone buys the IP without the iocp.

Cheers,
Conor.

>
>
>> +
>>  static const struct andes45_pma_region renesas_rzfive_pma_regions[] = {
>>         {
>>                 .pa = 0x58000000,
>> @@ -28,6 +31,43 @@ static int renesas_rzfive_final_init(bool cold_boot, const struct fdt_match *mat
>>                                          array_size(renesas_rzfive_pma_regions));
>>  }
>>
>> +static bool renesas_rzfive_cpu_cache_controlable(void)
>> +{
>> +       return (((csr_read(CSR_MICM_CFG) & MICM_CFG_ISZ_MASK) ||
>> +                (csr_read(CSR_MDCM_CFG) & MDCM_CFG_DSZ_MASK)) &&
>> +               (csr_read(CSR_MISA) & MISA_20_MASK) &&
>> +               (csr_read(CSR_MMSC_CFG) & MMSC_CFG_CCTLCSR_MASK) &&
>> +               (csr_read(CSR_MCACHE_CTL) & MCACHE_CTL_CCTL_SUEN_MASK));
>> +}
>> +
>> +static bool renesas_rzfive_cpu_iocp_disabled(void)
>> +{
>> +       return (csr_read(CSR_MMSC_CFG) & MMSC_IOCP_MASK) ? false : true;
>> +}
>> +
>> +static bool renesas_rzfive_apply_iocp_sw_workaround(void)
>> +{
>> +       return renesas_rzfive_cpu_cache_controlable() & renesas_rzfive_cpu_iocp_disabled();
>> +}
>> +
>> +static int renesas_rzfive_vendor_ext_provider(long funcid,
>> +                                             const struct sbi_trap_regs *regs,
>> +                                             unsigned long *out_value,
>> +                                             struct sbi_trap_info *out_trap,
>> +                                             const struct fdt_match *match)
>> +{
>> +       switch (funcid) {
>> +       case RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND:
>> +               *out_value = renesas_rzfive_apply_iocp_sw_workaround();
>> +               break;
>> +
>> +       default:
>> +               break;
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>>  int renesas_rzfive_early_init(bool cold_boot, const struct fdt_match *match)
>>  {
>>         /*
>> @@ -55,4 +95,5 @@ const struct platform_override renesas_rzfive = {
>>         .match_table = renesas_rzfive_match,
>>         .early_init = renesas_rzfive_early_init,
>>         .final_init = renesas_rzfive_final_init,
>> +       .vendor_ext_provider = renesas_rzfive_vendor_ext_provider,
>>  };
>> --
>> 2.17.1
>>
>

