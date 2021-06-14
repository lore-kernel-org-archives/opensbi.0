From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:05:02 +0800
Subject: [PATCH 5/6] lib: utils/timer: Add FDT based ACLINT MTIMER driver
In-Reply-To: <20210612160321.330638-6-anup.patel@wdc.com>
References: <20210612160321.330638-1-anup.patel@wdc.com>
 <20210612160321.330638-6-anup.patel@wdc.com>
Message-ID: <CAEUhbmUJQmXx9VBbnJxBUJM61TCEL8RP772p1-H=rbwys7Gd4w@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 13, 2021 at 12:04 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add a new FDT based ACLINT MTIMER driver which works for
> both CLINT device and standalone ACLINT MTIMER device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/utils/timer/fdt_timer.c        |  4 +-
>  lib/utils/timer/fdt_timer_clint.c  | 57 -----------------------
>  lib/utils/timer/fdt_timer_mtimer.c | 74 ++++++++++++++++++++++++++++++
>  lib/utils/timer/objects.mk         |  2 +-
>  4 files changed, 77 insertions(+), 60 deletions(-)
>  delete mode 100644 lib/utils/timer/fdt_timer_clint.c
>  create mode 100644 lib/utils/timer/fdt_timer_mtimer.c
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

