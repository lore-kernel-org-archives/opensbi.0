From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 21 Dec 2022 18:24:50 +0800
Subject: [PATCH v3 6/6] lib: utils/serial: Implement console_puts() for semihosting
In-Reply-To: <20221124132906.257732-7-apatel@ventanamicro.com>
References: <20221124132906.257732-1-apatel@ventanamicro.com> <20221124132906.257732-7-apatel@ventanamicro.com>
Message-ID: <CAEUhbmX_cnB1V1z63QAeY=iQm+9T-CNHnimAULX9NCM0KWJPGw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 24, 2022 at 9:33 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We implement console_puts() for semihosting serial driver to speed-up
> semihosting based prints.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  lib/utils/serial/semihosting.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>

Reviewed-by: Bin Meng <bmeng@tinylab.org>

