From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 9 May 2022 21:58:25 +0800
Subject: [PATCH] lib: utils/irqchip: fix typo when checking for CPU node
In-Reply-To: <CALXH3=LymzDa6c7DjYSfqZFTU3eUFZa0QgYxw6OOc3_577hO9g@mail.gmail.com>
References: <CALXH3=LymzDa6c7DjYSfqZFTU3eUFZa0QgYxw6OOc3_577hO9g@mail.gmail.com>
Message-ID: <CAEUhbmW7jRD3KEBAp4xHy4O585aPdv05tM-5Z8+8Lt3ZrFN1Vw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, May 9, 2022 at 8:44 PM Jan Reme? <jan.remes@codasip.com> wrote:
>
> Fix typo in irqchip_imsic_update_hartid_table() when checking for CPU
> node.
>
> Signed-off-by: Jan Remes <jan.remes@codasip.com>
> ---
>  lib/utils/irqchip/fdt_irqchip_imsic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Reviewed-by: Bin Meng <bmeng.cn@gmail.com>

