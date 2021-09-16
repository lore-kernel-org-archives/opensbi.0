From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 16 Sep 2021 15:33:31 +0800
Subject: [PATCH 5/5] lib: utils/reset: use sbi_timer_mdelay() in gpio
 reset driver
In-Reply-To: <20210915092128.1029868-6-anup.patel@wdc.com>
References: <20210915092128.1029868-1-anup.patel@wdc.com>
 <20210915092128.1029868-6-anup.patel@wdc.com>
Message-ID: <CAEUhbmUH3RFvH40OsqZsA4Cpm2WTMQZ5njHE1n5_JuDNg8p58g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 15, 2021 at 5:22 PM Anup Patel <anup.patel@wdc.com> wrote:
>
> We should use sbi_timer_mdelay() instead of custom gpio_mdelay() in
> the gpio reset driver.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/utils/reset/fdt_reset_gpio.c | 13 +++----------
>  1 file changed, 3 insertions(+), 10 deletions(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

