From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Jul 2024 10:01:05 +0200
Subject: [PATCH 00/16] Improve FDT blob lifecycle self-documentation
In-Reply-To: <20240731045931.2446799-1-samuel.holland@sifive.com>
References: <20240731045931.2446799-1-samuel.holland@sifive.com>
Message-ID: <20240731-340fe0e847404d6d3763bccb@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Jul 30, 2024 at 09:58:41PM GMT, Samuel Holland wrote:
> This series improves the documentation of the FDT blob lifecycle within
> the OpenSBI code by more explicitly indicating which functions and
> platform callbacks may modify the FDT blob, and by avoiding ad-hoc calls
> to fdt_get_address() outside the top-level platform callbacks.
> 
> 
> Samuel Holland (16):
>   lib: utils/fdt: Fix fdt_add_cpu_idle_states() prototype
>   lib: utils/regmap: Fix typo in comment
>   lib: utils/fdt: Constify FDT parsing functions
>   lib: utils/gpio: Constify FDT pointers in parsing functions
>   lib: utils/i2c: Constify FDT pointers in parsing functions
>   lib: utils/ipi: Constify FDT pointers in parsing functions
>   lib: utils/irqchip: Constify FDT pointers in parsing functions
>   lib: utils/regmap: Constify FDT pointers in parsing functions
>   lib: utils/reset: Constify FDT pointers in parsing functions
>   lib: utils/serial: Constify FDT pointers in parsing functions
>   lib: utils/timer: Constify FDT pointers in parsing functions
>   platform: generic: Constify FDT pointers in fw_platform_init()
>   platform: generic: Pass FDT to early/final_init overrides
>   lib: utils/reset: Pass the FDT to fdt_reset_init()
>   lib: utils/serial: Pass the FDT to fdt_serial_init()
>   lib: utils/fdt: Add fdt_get_address_rw() helper
>

This is a nice improvement, Samuel.

For the series,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

