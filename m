From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 18:21:17 +0800
Subject: [PATCH v3 4/6] lib: sbi: Implement SBI debug console extension
In-Reply-To: <20221124132906.257732-5-apatel@ventanamicro.com>
References: <20221124132906.257732-1-apatel@ventanamicro.com> <20221124132906.257732-5-apatel@ventanamicro.com>
Message-ID: <CAEUhbmVgaQ-FcstNB1BC3xYdn8_8L=Ni30sfs_+M_N6cKvYT_A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 9:32 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We implement SBI debug console extension as one of the replacement
> SBI extensions. This extension is only available when OpenSBI platform
> provides a console device to generic library.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/sbi/Kconfig          |  4 +++
>  lib/sbi/objects.mk       |  3 ++
>  lib/sbi/sbi_ecall_dbcn.c | 62 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 69 insertions(+)
>  create mode 100644 lib/sbi/sbi_ecall_dbcn.c
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

