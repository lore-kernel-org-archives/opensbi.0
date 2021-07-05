From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Mon, 5 Jul 2021 02:56:33 +0100
Subject: [RFC PATCH 3/4] lib: utils: add gpio generic interface
In-Reply-To: <20210701073958.15558-4-green.wan@sifive.com>
References: <20210701073958.15558-1-green.wan@sifive.com>
 <20210701073958.15558-4-green.wan@sifive.com>
Message-ID: <F89BC455-515F-4FAD-ABCE-B7BC55B1A2ED@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 1 Jul 2021, at 08:39, Green Wan <green.wan@sifive.com> wrote:
> 
> Add generic interface for GPIO driver and add SiFive GPIO
> driver as an example. Currently, driver supports gpio output
> function only.
> 
> lib/utils/gpio/fdt_gpio.c:
>  - contains GPIO generic interfaces.
> 
> lib/utils/gpio/sifive_gpio.c:
>  - contains sifive GPIO driver.
> 
> platform/generic/platform.c:
>  - add entry of gpio init
> 
> Signed-off-by: Green Wan <green.wan@sifive.com>
> ---
> include/sbi/sbi_gpio.h            | 23 ++++++++++
> include/sbi_utils/gpio/fdt_gpio.h | 32 ++++++++++++++
> lib/utils/gpio/fdt_gpio.c         | 55 ++++++++++++++++++++++++
> lib/utils/gpio/objects.mk         | 11 +++++
> lib/utils/gpio/sifive_gpio.c      | 70 +++++++++++++++++++++++++++++++
> platform/generic/platform.c       |  3 ++
> 6 files changed, 194 insertions(+)
> create mode 100644 include/sbi/sbi_gpio.h
> create mode 100644 include/sbi_utils/gpio/fdt_gpio.h
> create mode 100644 lib/utils/gpio/fdt_gpio.c
> create mode 100644 lib/utils/gpio/objects.mk
> create mode 100644 lib/utils/gpio/sifive_gpio.c
> 
> diff --git a/include/sbi/sbi_gpio.h b/include/sbi/sbi_gpio.h
> new file mode 100644
> index 0000000..67ef9a9
> --- /dev/null
> +++ b/include/sbi/sbi_gpio.h
> @@ -0,0 +1,23 @@
> +/*
> + * SPDX-License-Identifier: GPL 2.0+

These files being GPL'ed isn?t going to fly.

Jess


