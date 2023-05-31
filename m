From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:42:53 +0200
Subject: [PATCH 08/17] lib: utils/i2c: Use heap in DesignWare and SiFive
 I2C drivers
In-Reply-To: <20230425123230.3943447-9-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-9-apatel@ventanamicro.com>
Message-ID: <20230531-a23342b506841afb1b45e655@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:21PM +0530, Anup Patel wrote:
> Let's use heap allocation in DesignWare and SiFive I2C drivers
> instead of using a fixed size global array.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/i2c/fdt_i2c_dw.c     | 24 ++++++++++--------------
>  lib/utils/i2c/fdt_i2c_sifive.c | 23 ++++++++++-------------
>  2 files changed, 20 insertions(+), 27 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

