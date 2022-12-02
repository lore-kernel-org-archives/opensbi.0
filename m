From: Bin Meng <bmeng.cn@gmail.com>
Date: Sat, 3 Dec 2022 00:10:05 +0800
Subject: [PATCH 1/4] platform: generic/andes: Enable generic platform
 support for AE350
In-Reply-To: <20221128083046.6799-2-peterlin@andestech.com>
References: <20221128083046.6799-1-peterlin@andestech.com> <20221128083046.6799-2-peterlin@andestech.com>
Message-ID: <CAEUhbmVTmY1w_zOC8FgPJ8oDbm5hJmOZe6HYkAm-LJboHHGqoQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 4:33 PM Yu Chien Peter Lin
<peterlin@andestech.com> wrote:
>
> We move andes directory to platform/generic since the necessary fdt
> drivers are available, the users can enable the console, timer, ipi,
> irqchip and reset devices by adding device tree nodes stated in the
> docs/platform/andes-ae350.md.
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> ---
> Although generic/platform.c has been able to boot the system
> on AE350, we will add HSM device for it soon so let's keep
> ae350.c as a placeholder.
> ---
>  platform/andes/ae350/Kconfig           |  34 -----
>  platform/andes/ae350/cache.c           |  89 -------------
>  platform/andes/ae350/cache.h           |  17 ---
>  platform/andes/ae350/configs/defconfig |   0
>  platform/andes/ae350/objects.mk        |  40 ------
>  platform/andes/ae350/platform.c        | 169 -------------------------
>  platform/andes/ae350/platform.h        | 109 ----------------
>  platform/generic/Kconfig               |   4 +
>  platform/generic/andes/ae350.c         |  21 +++
>  platform/generic/andes/objects.mk      |   6 +
>  platform/generic/configs/defconfig     |   4 +
>  11 files changed, 35 insertions(+), 458 deletions(-)
>  delete mode 100644 platform/andes/ae350/Kconfig
>  delete mode 100644 platform/andes/ae350/cache.c
>  delete mode 100644 platform/andes/ae350/cache.h
>  delete mode 100644 platform/andes/ae350/configs/defconfig
>  delete mode 100644 platform/andes/ae350/objects.mk
>  delete mode 100644 platform/andes/ae350/platform.c
>  delete mode 100644 platform/andes/ae350/platform.h
>  create mode 100644 platform/generic/andes/ae350.c
>  create mode 100644 platform/generic/andes/objects.mk
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

