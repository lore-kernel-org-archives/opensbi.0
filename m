From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Mar 2023 21:18:41 +0530
Subject: [PATCH] lib: serial: Cadence: Enable compatibility for cdns,uart-r1p8
In-Reply-To: <20230301143800.1418232-1-mchitale@ventanamicro.com>
References: <20230301143800.1418232-1-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy3askLfnPqLphsCNUQ-WLeNPe+68nJ4PwCktUts23z9Jw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Mar 1, 2023 at 8:08?PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> The Cadence driver does not use the RX byte status feature and hence can
> be advertised to be compatible with cdns,uart-r1p8 as well.
>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/serial/fdt_serial_cadence.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/lib/utils/serial/fdt_serial_cadence.c b/lib/utils/serial/fdt_serial_cadence.c
> index 946e533..ae59e4c 100644
> --- a/lib/utils/serial/fdt_serial_cadence.c
> +++ b/lib/utils/serial/fdt_serial_cadence.c
> @@ -24,6 +24,7 @@ static int serial_cadence_init(void *fdt, int nodeoff,
>  }
>
>  static const struct fdt_match serial_cadence_match[] = {
> +       { .compatible = "cdns,uart-r1p8", },
>         { .compatible = "cdns,uart-r1p12" },
>         { .compatible = "starfive,jh8100-uart" },
>         { },
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

