From: Anup Patel <anup@brainfault.org>
Date: Sat, 30 Jul 2022 10:54:48 +0530
Subject: [PATCH 1/4] lib: utils/fdt: Factor out common uart node code
In-Reply-To: <20220718172028.2006166-2-ajones@ventanamicro.com>
References: <20220718172028.2006166-1-ajones@ventanamicro.com> <20220718172028.2006166-2-ajones@ventanamicro.com>
Message-ID: <CAAhSdy0Crf3puRUJehFaVc5TtSb7gyad26bR_DpQ5wnUr=aT1A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 18, 2022 at 10:50 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> Factor out the common code used by the fdt UART node parsers,
> allowing us to drop duplicate code.
>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/utils/fdt/fdt_helper.c | 131 +++++++++++--------------------------
>  1 file changed, 39 insertions(+), 92 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index 2bdb1ef23e55..c6abf804014d 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -314,8 +314,10 @@ int fdt_parse_timebase_frequency(void *fdt, unsigned long *freq)
>         return 0;
>  }
>
> -int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> -                               struct platform_uart_data *uart)
> +static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
> +                                     struct platform_uart_data *uart,
> +                                     unsigned long default_freq,
> +                                     unsigned long default_baud)
>  {
>         int len, rc;
>         const fdt32_t *val;
> @@ -338,13 +340,28 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
>         if (len > 0 && val)
>                 uart->freq = fdt32_to_cpu(*val);
>         else
> -               uart->freq = DEFAULT_UART_FREQ;
> +               uart->freq = default_freq;
>
>         val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed", &len);
>         if (len > 0 && val)
>                 uart->baud = fdt32_to_cpu(*val);
>         else
> -               uart->baud = DEFAULT_UART_BAUD;
> +               uart->baud = default_baud;
> +
> +       return 0;
> +}
> +
> +int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
> +                               struct platform_uart_data *uart)
> +{
> +       int rc;
> +
> +       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +                                       DEFAULT_UART_FREQ,
> +                                       DEFAULT_UART_BAUD);
> +
> +       if (rc)
> +               return rc;
>
>         /* For Gaisler APBUART, the reg-shift and reg-io-width are fixed .*/
>         uart->reg_shift    = DEFAULT_UART_REG_SHIFT;
> @@ -356,69 +373,26 @@ int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
>  int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
>                                struct platform_uart_data *uart)
>  {
> -       int len, rc;
> -       const fdt32_t *val;
> -       uint64_t reg_addr, reg_size;
> -
> -       if (nodeoffset < 0 || !uart || !fdt)
> -               return SBI_ENODEV;
> -
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> -                                   &reg_addr, &reg_size);
> -       if (rc < 0 || !reg_addr || !reg_size)
> -               return SBI_ENODEV;
> -       uart->addr = reg_addr;
> +       int rc;
>
> -       /**
> -        * UART address is mandaotry. clock-frequency and current-speed
> -        * may not be present. Don't return error.
> -        */
> -       val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-frequency", &len);
> -       if (len > 0 && val)
> -               uart->freq = fdt32_to_cpu(*val);
> -       else
> -               uart->freq = DEFAULT_SHAKTI_UART_FREQ;
> +       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +                                       DEFAULT_SHAKTI_UART_FREQ,
> +                                       DEFAULT_SHAKTI_UART_BAUD);
>
> -       val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed", &len);
> -       if (len > 0 && val)
> -               uart->baud = fdt32_to_cpu(*val);
> -       else
> -               uart->baud = DEFAULT_SHAKTI_UART_BAUD;
> -
> -       return 0;
> +       return rc ? : 0;
>  }
>
>  int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
>                                struct platform_uart_data *uart)
>  {
> -       int len, rc;
> -       const fdt32_t *val;
> -       uint64_t reg_addr, reg_size;
> -
> -       if (nodeoffset < 0 || !uart || !fdt)
> -               return SBI_ENODEV;
> -
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> -                                   &reg_addr, &reg_size);
> -       if (rc < 0 || !reg_addr || !reg_size)
> -               return SBI_ENODEV;
> -       uart->addr = reg_addr;
> +       int rc;
>
> -       /**
> -        * UART address is mandaotry. clock-frequency and current-speed
> -        * may not be present. Don't return error.
> -        */
> -       val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-frequency", &len);
> -       if (len > 0 && val)
> -               uart->freq = fdt32_to_cpu(*val);
> -       else
> -               uart->freq = DEFAULT_SIFIVE_UART_FREQ;
> +       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +                                       DEFAULT_SIFIVE_UART_FREQ,
> +                                       DEFAULT_SIFIVE_UART_BAUD);
>
> -       val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed", &len);
> -       if (len > 0 && val)
> -               uart->baud = fdt32_to_cpu(*val);
> -       else
> -               uart->baud = DEFAULT_SIFIVE_UART_BAUD;
> +       if (rc)
> +               return rc;
>
>         /* For SiFive UART, the reg-shift and reg-io-width are fixed .*/
>         uart->reg_shift = DEFAULT_SIFIVE_UART_REG_SHIFT;
> @@ -432,32 +406,13 @@ int fdt_parse_uart8250_node(void *fdt, int nodeoffset,
>  {
>         int len, rc;
>         const fdt32_t *val;
> -       uint64_t reg_addr, reg_size;
> -
> -       if (nodeoffset < 0 || !uart || !fdt)
> -               return SBI_ENODEV;
> -
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> -                                   &reg_addr, &reg_size);
> -       if (rc < 0 || !reg_addr || !reg_size)
> -               return SBI_ENODEV;
> -       uart->addr = reg_addr;
>
> -       /**
> -        * UART address is mandaotry. clock-frequency and current-speed
> -        * may not be present. Don't return error.
> -        */
> -       val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "clock-frequency", &len);
> -       if (len > 0 && val)
> -               uart->freq = fdt32_to_cpu(*val);
> -       else
> -               uart->freq = DEFAULT_UART_FREQ;
> +       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +                                       DEFAULT_UART_FREQ,
> +                                       DEFAULT_UART_BAUD);
>
> -       val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "current-speed", &len);
> -       if (len > 0 && val)
> -               uart->baud = fdt32_to_cpu(*val);
> -       else
> -               uart->baud = DEFAULT_UART_BAUD;
> +       if (rc)
> +               return rc;
>
>         val = (fdt32_t *)fdt_getprop(fdt, nodeoffset, "reg-shift", &len);
>         if (len > 0 && val)
> @@ -499,18 +454,10 @@ int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
>                                struct platform_uart_data *uart)
>  {
>         int rc;
> -       uint64_t reg_addr, reg_size;
>
> -       if (nodeoffset < 0 || !uart || !fdt)
> -               return SBI_ENODEV;
> +       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
>
> -       rc = fdt_get_node_addr_size(fdt, nodeoffset, 0,
> -                                   &reg_addr, &reg_size);
> -       if (rc < 0 || !reg_addr || !reg_size)
> -               return SBI_ENODEV;
> -       uart->addr = reg_addr;
> -
> -       return 0;
> +       return rc ? : 0;
>  }
>
>  int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic)
> --
> 2.36.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

