From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 14 Jun 2021 21:04:58 +0800
Subject: [PATCH 4/6] lib: utils/ipi: Add FDT based ACLINT MSWI IPI driver
In-Reply-To: <20210612160321.330638-5-anup.patel@wdc.com>
References: <20210612160321.330638-1-anup.patel@wdc.com>
 <20210612160321.330638-5-anup.patel@wdc.com>
Message-ID: <CAEUhbmUo5dXYJ10MMXV+d3rKE3ezOeoyhvKjqWBK7vb9RDxuhA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 13, 2021 at 12:04 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> We add a new FDT based ACLINT MSWI IPI driver which works for
> both CLINT device and standalone ACLINT MSWI device.
>
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  lib/utils/ipi/fdt_ipi.c       |  4 +--
>  lib/utils/ipi/fdt_ipi_clint.c | 51 --------------------------
>  lib/utils/ipi/fdt_ipi_mswi.c  | 67 +++++++++++++++++++++++++++++++++++
>  lib/utils/ipi/objects.mk      |  2 +-
>  4 files changed, 70 insertions(+), 54 deletions(-)
>  delete mode 100644 lib/utils/ipi/fdt_ipi_clint.c
>  create mode 100644 lib/utils/ipi/fdt_ipi_mswi.c
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

