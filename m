From: Yu-Chien Peter Lin <peterlin@andestech.com>
Date: Wed, 12 Apr 2023 09:44:18 +0800
Subject: [PATCH v10] platform: generic: andes/renesas: Add SBI EXT to
 check for enabling IOCP errata
In-Reply-To: <20230411163633.11220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230411163633.11220-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <ZDYM8laDKXzApUw5@APC323>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 11, 2023 at 05:36:33PM +0100, Lad Prabhakar wrote:
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
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>

Thanks,
Peter Lin

> ---
> v9->v10
> * Renamed andes45->andes
> * Changes the license to BSD-2-Clause
> 
> v8->v9
> * Moved vendor_ext_provider callback to andes45_sbi.c
> * Updated commit message
> * Dropped RB tags
> 
> v7->v8
> * Fixed typo controlable -> controllable
> * Included RB tag from Lin-san and Conor
> 
> v6->v7
> * Added a new section for conf and control registers
> * Made use of misa_extension('U')
> * For unsupported funcid's now returning SBI_EINVAL
> * Renamed ANDES_SBI_EXT_IOCP_SW_WORKAROUND -> SBI_EXT_ANDES_IOCP_SW_WORKAROUND
> 
> v5->v6
> * Moved ANDES_SBI_EXT_IOCP_SW_WORKAROUND to andes_sbi.h
> * Moved helpers to check IOCP to common header so that we re-use code
> 
> v5:
> https://patchwork.ozlabs.org/project/opensbi/patch/20230213215111.32017-4-prabhakar.mahadev-lad.rj at bp.renesas.com/

