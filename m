From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 18:23:16 +0800
Subject: [PATCH v3 5/6] lib: sbi: Add console_puts() callback in the
 console device
In-Reply-To: <20221124132906.257732-6-apatel@ventanamicro.com>
References: <20221124132906.257732-1-apatel@ventanamicro.com> <20221124132906.257732-6-apatel@ventanamicro.com>
Message-ID: <CAEUhbmXR1b7uJTge7KnsOLZfrfu7LO7U7w-FtKhWiADaKvM99g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 9:33 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add console_puts() callback in the console device which allows
> console drivers (such as semihosting) to implement a specialized
> way to output character string.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  include/sbi/sbi_console.h |  3 +++
>  lib/sbi/sbi_console.c     | 19 ++++++++++++++-----
>  2 files changed, 17 insertions(+), 5 deletions(-)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

