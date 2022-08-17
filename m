From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 17 Aug 2022 18:42:46 +0200
Subject: [PATCH v4] lib: utils: serial: Add Cadence UART driver
In-Reply-To: <20220817154056.543158-1-junliang.tan@linux.starfivetech.com>
References: <20220817154056.543158-1-junliang.tan@linux.starfivetech.com>
Message-ID: <20220817164246.vvsdwr3fmsht5lco@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Aug 17, 2022 at 11:40:56PM +0800, Jun Liang Tan wrote:
> Add Cadence UART driver
> 
> Signed-off-by: Jun Liang Tan <junliang.tan@linux.starfivetech.com>
> Signed-off-by: Wei Liang Lim <weiliang.lim@linux.starfivetech.com>
> ---
> 
> Changes in v4:
> - Add changelog
> - Check for possible divide-by-zero in uart_min_clk_divisor() by
>   referring to the fix in commit f27203525aa2fc20d0074feb892a6f8433f84e3a
> - Cosmetic changes
> 
> Changes in v3:
> - Place #define register name in ascending order of register offset
> - Change #define register name to match manual register name
> - #define register flags in a way associate with their register
> - Cosmetic changes
> 
> Changes in v2:
> - Rename fdt_parse_uart8250_node() to fdt_parse_uart_node() and make
>   neccessary changes in functions that call it
> - Align patch with the latest OpenSBI sources
> 
>  include/sbi_utils/fdt/fdt_helper.h      |   4 +-
>  include/sbi_utils/serial/cadence-uart.h |  16 +++
>  lib/utils/fdt/fdt_helper.c              |   6 +-
>  lib/utils/serial/Kconfig                |   9 ++
>  lib/utils/serial/cadence-uart.c         | 128 ++++++++++++++++++++++++
>  lib/utils/serial/fdt_serial_cadence.c   |  35 +++++++
>  lib/utils/serial/fdt_serial_uart8250.c  |   2 +-
>  lib/utils/serial/objects.mk             |   4 +
>  platform/generic/configs/defconfig      |   1 +
>  9 files changed, 199 insertions(+), 6 deletions(-)
>  create mode 100644 include/sbi_utils/serial/cadence-uart.h
>  create mode 100644 lib/utils/serial/cadence-uart.c
>  create mode 100644 lib/utils/serial/fdt_serial_cadence.c
>

Looks good!

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

