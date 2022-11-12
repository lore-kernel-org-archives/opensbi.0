From: Atish Patra <atishp@atishpatra.org>
Date: Sat, 12 Nov 2022 00:57:52 -0800
Subject: [PATCH 2/2] lib: utils/fdt: Simplified code
In-Reply-To: <20221031112145.126615-3-wxjstz@126.com>
References: <20221031112145.126615-1-wxjstz@126.com> <20221031112145.126615-3-wxjstz@126.com>
Message-ID: <CAOnJCULovR8eiD8LEaa5QZF4Trb3SSrktffPGh6d72oTw+xUnA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 31, 2022 at 4:22 AM Xiang W <wxjstz@126.com> wrote:
>
> Simplified fdt_parse_xxx_uart_node which direct call
> fdt_parse_uart_node_common.
>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  lib/utils/fdt/fdt_helper.c | 28 ++++------------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index cdd0b35..72d8635 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -350,43 +350,27 @@ static int fdt_parse_uart_node_common(void *fdt, int nodeoffset,
>  int fdt_parse_gaisler_uart_node(void *fdt, int nodeoffset,
>                                 struct platform_uart_data *uart)
>  {
> -       int rc;
>
> -       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +       return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
>                                         DEFAULT_UART_FREQ,
>                                         DEFAULT_UART_BAUD);
> -
> -       if (rc)
> -               return rc;
> -
> -       return 0;
>  }
>
>  int fdt_parse_shakti_uart_node(void *fdt, int nodeoffset,
>                                struct platform_uart_data *uart)
>  {
> -       int rc;
>
> -       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +       return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
>                                         DEFAULT_SHAKTI_UART_FREQ,
>                                         DEFAULT_SHAKTI_UART_BAUD);
> -
> -       return rc ? : 0;
>  }
>
>  int fdt_parse_sifive_uart_node(void *fdt, int nodeoffset,
>                                struct platform_uart_data *uart)
>  {
> -       int rc;
> -
> -       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart,
> +       return fdt_parse_uart_node_common(fdt, nodeoffset, uart,
>                                         DEFAULT_SIFIVE_UART_FREQ,
>                                         DEFAULT_SIFIVE_UART_BAUD);
> -
> -       if (rc)
> -               return rc;
> -
> -       return 0;
>  }
>
>  int fdt_parse_uart_node(void *fdt, int nodeoffset,
> @@ -441,11 +425,7 @@ int fdt_parse_uart8250(void *fdt, struct platform_uart_data *uart,
>  int fdt_parse_xlnx_uartlite_node(void *fdt, int nodeoffset,
>                                struct platform_uart_data *uart)
>  {
> -       int rc;
> -
> -       rc = fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
> -
> -       return rc ? : 0;
> +       return fdt_parse_uart_node_common(fdt, nodeoffset, uart, 0, 0);
>  }
>
>  int fdt_parse_aplic_node(void *fdt, int nodeoff, struct aplic_data *aplic)
> --
> 2.30.2
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi


Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
Regards,
Atish

