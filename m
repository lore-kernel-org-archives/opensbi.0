From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
Date: Mon, 30 Jan 2023 16:17:38 +0000
Subject: [RFC PATCH v3 3/3] platform: generic: renesas: rzfive: Add SBI
 EXT to check for enabling IOCP errata
In-Reply-To: <20230126095832.21566-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230126095832.21566-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230126095832.21566-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CA+V-a8sVBOSBtLrwJGg74yniWkmP0xURjm8z86dcgAfSJb9+rw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi Anup,

On Thu, Jan 26, 2023 at 9:58 AM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
>
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC due to this reason IP blocks using DMA will fail.
>
> As a workaround for SoCs with IOCP disabled CMO needs to be handled by
> software. Firstly OpenSBI configures the memory region as
> "Memory, Non-cacheable, Bufferable" and passes this region as a global
> shared dma pool as a DT node. With DMA_GLOBAL_POOL enabled all DMA
> allocations happen from this region and synchronization callbacks are
> implemented to synchronize when doing DMA transactions.
>
> RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND SBI EXT checks if the IOCP
> errata should be applied to handle cache management.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  platform/generic/renesas/rzfive/rzfive.c | 69 ++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)
>
<snip>
> +
> +static int renesas_rzfive_vendor_ext_provider(long extid, long funcid,
> +                                             const struct sbi_trap_regs *regs,
> +                                             unsigned long *out_value,
> +                                             struct sbi_trap_info *out_trap,
> +                                             const struct fdt_match *match)
> +{
> +       if (extid != ANDESTECH_SBI_EXT_ANDES)
Should we check extid here is this OK? Is returning SBI_EINVAL in case
of extid mismatch is ok or should we panic here?

> +               return SBI_EINVAL;
> +
> +       switch (funcid) {
> +       case RENESAS_RZFIVE_SBI_EXT_IOCP_SW_WORKAROUND:
> +               *out_value = renesas_rzfive_apply_iocp_sw_workaround();
> +               break;
> +
> +       default:
Is this a correct behavior or should we do a panic here?

Cheers,
Prabhakar

