From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 May 2023 14:42:06 +0200
Subject: [PATCH 07/17] lib: utils/gpio: Use heap in SiFive and StartFive
 GPIO drivers
In-Reply-To: <20230425123230.3943447-8-apatel@ventanamicro.com>
References: <20230425123230.3943447-1-apatel@ventanamicro.com>
 <20230425123230.3943447-8-apatel@ventanamicro.com>
Message-ID: <20230531-2a78b7b9f677100eca0349ea@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 25, 2023 at 06:02:20PM +0530, Anup Patel wrote:
> Let's use heap allocation in SiFive and Starfive GPIO drivers
> instead of using a fixed size global array.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/gpio/fdt_gpio_sifive.c   | 21 ++++++++++-----------
>  lib/utils/gpio/fdt_gpio_starfive.c | 20 ++++++++++----------
>  2 files changed, 20 insertions(+), 21 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

