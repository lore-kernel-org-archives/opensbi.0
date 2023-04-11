From: Conor.Dooley@microchip.com <Conor.Dooley@microchip.com>
Date: Tue, 11 Apr 2023 16:45:42 +0000
Subject: [PATCH v10] platform: generic: andes/renesas: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <20230411163633.11220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230411163633.11220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <dc87f21a-4db4-5417-ecd9-43668e570708@microchip.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 11/04/2023 17:36, Lad Prabhakar wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> I/O Coherence Port (IOCP) provides an AXI interface for connecting
> external non-caching masters, such as DMA controllers. The accesses
> from IOCP are coherent with D-Caches and L2 Cache.
> 
> IOCP is a specification option and is disabled on the Renesas RZ/Five
> SoC (which is based on Andes AX45MP core) due to this reason IP blocks
> using DMA will fail.
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

I don't really have a nuanced opinion here, but I was happy a few 
versions ago, so:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

