From: Conor Dooley <conor.dooley@microchip.com>
Date: Fri, 31 Mar 2023 13:59:54 +0100
Subject: [PATCH v7] platform: generic: renesas: rzfive: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <20230317140357.14819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230317140357.14819-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <af55cd53-6319-44ad-8b9e-7fc519fa5c72@spud>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Mar 17, 2023 at 02:03:57PM +0000, Lad Prabhakar wrote:
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
> SBI_EXT_ANDES_IOCP_SW_WORKAROUND checks if the IOCP errata should be
> applied to handle cache management.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

> +static bool andes45_cache_controlable(void)

FWIW, controllable has 3 Ls

I'm not really au fait with this neck of the woods, but what you're
doing makes sense to me..
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/opensbi/attachments/20230331/7ce51cfd/attachment-0001.sig>
