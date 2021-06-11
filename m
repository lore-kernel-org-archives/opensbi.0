From: Anup Patel <Anup.Patel@wdc.com>
Date: Fri, 11 Jun 2021 05:54:11 +0000
Subject: [PATCH v2 2/4] docs/platform: andes-ae350: Fix missing spaces
In-Reply-To: <20210604153545.18949-2-bmeng.cn@gmail.com>
References: <20210604153545.18949-1-bmeng.cn@gmail.com>
 <20210604153545.18949-2-bmeng.cn@gmail.com>
Message-ID: <CO6PR04MB7812B85A66DBE7F6BB2CF5EB8D349@CO6PR04MB7812.namprd04.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



> -----Original Message-----
> From: Bin Meng <bmeng.cn@gmail.com>
> Sent: 04 June 2021 21:06
> To: Anup Patel <Anup.Patel@wdc.com>; opensbi at lists.infradead.org
> Cc: Bin Meng <bmeng.cn@gmail.com>
> Subject: [PATCH v2 2/4] docs/platform: andes-ae350: Fix missing spaces
> 
> Fix several places in the docmentation that are missing spaces.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
> 
> (no changes since v1)
> 
>  docs/platform/andes-ae350.md | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
> index 46889a1..1cf83cf 100644
> --- a/docs/platform/andes-ae350.md
> +++ b/docs/platform/andes-ae350.md
> @@ -1,9 +1,9 @@
>  Andes AE350 SoC Platform
>  ========================
>  The AE350 AXI/AHB-based platform N25(F)/NX25(F)/D25F/A25/AX25 CPU
> with level-one -memories,interrupt controller, debug module, AXI and AHB
> Bus Matrix Controller, -AXI-to-AHB Bridge and a collection of
> fundamentalAHB/APB bus IP components -pre-integrated together as a
> system design.The high-quality and configurable
> +memories, interrupt controller, debug module, AXI and AHB Bus Matrix
> +Controller, AXI-to-AHB Bridge and a collection of fundamental AHB/APB
> +bus IP components pre-integrated together as a system design. The
> +high-quality and configurable
>  AHB/APB IPs suites a majority embedded systems, and the verified platform
> serves  as a starting point to jump start SoC designs.
> 
> --
> 2.25.1


