From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:43:27 +0200
Subject: [PATCH 09/17] lib: utils/ipi: Use heap in ACLINT MSWI driver
In-Reply-To: <20230425123230.3943447-10-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-10-apatel@ventanamicro.com>
Message-ID: <20230531-3ec73c2cdd7ba27b02005072@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:22PM +0530, Anup Patel wrote:
> Let's use heap allocation in ACLINT MSWI driver instead of using
> a fixed size global array.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/ipi/fdt_ipi_mswi.c | 21 ++++++++++-----------
>  1 file changed, 10 insertions(+), 11 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

