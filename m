From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 18 Oct 2021 13:50:54 +0800
Subject: [PATCH v2] lib: utils/irqchip: Automatically delegate T-HEAD PLIC
 access
In-Reply-To: <20211018053350.39184-1-samuel@sholland.org>
References: <20211018053350.39184-1-samuel@sholland.org>
Message-ID: <CAEUhbmUKPoq=QAU9RVOnstL+8yusxjvHNNSpY5L+XeVcwAsBYA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 1:34 PM Samuel Holland <samuel@sholland.org> wrote:
>
> The T-HEAD PLIC implementation requires setting a delegation bit
> to allow access from S-mode. Now that the T-HEAD PLIC has its own
> compatible string, set this bit automatically from the PLIC driver,
> instead of reaching into the PLIC's MMIO space from another driver.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
>
> ---
>
> Changes in v2:
>  - Use the thead,c900-plic compatible instead of the D1 compatible.
>  - Also apply this change to other T-HEAD device tree examples.
>  - Remove the plic-delegate code from the thead,reset-sample driver.
>  - Drop the return value from thead_plic_plat_init().
>
> The compatible string is added in the patch series here:
> https://lore.kernel.org/linux-riscv/20211016032200.2869998-1-guoren at kernel.org/T/
> ---
>  docs/platform/thead-c9xx.md          | 12 +++---------
>  lib/utils/irqchip/fdt_irqchip_plic.c | 15 +++++++++++++++
>  lib/utils/reset/fdt_reset_thead.c    |  8 --------
>  3 files changed, 18 insertions(+), 17 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

