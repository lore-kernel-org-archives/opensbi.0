From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 15:34:36 +0200
Subject: [PATCH 17/17] lib: utils/irqchip: Use scratch space to save
 per-HART IMSIC pointer
In-Reply-To: <20230425123230.3943447-18-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-18-apatel@ventanamicro.com>
Message-ID: <20230531-7f2d35ba9b68460b8bc8ae2d@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:30PM +0530, Anup Patel wrote:
> Instead of using a global array indexed by hartid, we should use
> scratch space to save per-HART IMSIC pointer and IMSIC file number.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/irqchip/fdt_irqchip_imsic.c |  4 +-
>  lib/utils/irqchip/imsic.c             | 87 ++++++++++++++++++++++-----
>  2 files changed, 74 insertions(+), 17 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

