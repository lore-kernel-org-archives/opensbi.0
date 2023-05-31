From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:50:45 +0200
Subject: [PATCH 11/17] lib: utils/timer: Use heap in ACLINT MTIMER driver
In-Reply-To: <20230425123230.3943447-12-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-12-apatel@ventanamicro.com>
Message-ID: <20230531-ee54f6eccd40e7c90e2044e2@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:24PM +0530, Anup Patel wrote:
> Let's use heap allocation in ACLINT MTIMER driver instead of using
> a fixed size global array.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/timer/fdt_timer_mtimer.c | 47 +++++++++++++++++++-----------
>  1 file changed, 30 insertions(+), 17 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

