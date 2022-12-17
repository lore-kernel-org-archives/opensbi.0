From: Anup Patel <anup@brainfault.org>
Date: Sat, 17 Dec 2022 09:10:03 +0530
Subject: [PATCH v3 1/5] lib: utils/irqchip: plic: Fix the off-by-one error
 in priority save/restore helpers
In-Reply-To: <20221211065424.806478-1-bmeng@tinylab.org>
References: <20221211065424.806478-1-bmeng@tinylab.org>
Message-ID: <CAAhSdy1RtGeOVHE3gKN=09eNyvHu-FYYg-kri5r8oioVnC313A@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Dec 11, 2022 at 12:24 PM Bin Meng <bmeng@tinylab.org> wrote:
>
> Interrupt source 0 is reserved. Hence the irq should start from 1.
>
> Fixes: 2b79b694a805 ("lib: irqchip/plic: Add priority save/restore helpers")
> Signed-off-by: Bin Meng <bmeng@tinylab.org>
> Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
> (no changes since v1)
>
>  lib/utils/irqchip/plic.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/utils/irqchip/plic.c b/lib/utils/irqchip/plic.c
> index 73d7788..4df9020 100644
> --- a/lib/utils/irqchip/plic.c
> +++ b/lib/utils/irqchip/plic.c
> @@ -38,13 +38,13 @@ static void plic_set_priority(const struct plic_data *plic, u32 source, u32 val)
>
>  void plic_priority_save(const struct plic_data *plic, u8 *priority)
>  {
> -       for (u32 i = 0; i < plic->num_src; i++)
> +       for (u32 i = 1; i <= plic->num_src; i++)
>                 priority[i] = plic_get_priority(plic, i);
>  }
>
>  void plic_priority_restore(const struct plic_data *plic, const u8 *priority)
>  {
> -       for (u32 i = 0; i < plic->num_src; i++)
> +       for (u32 i = 1; i <= plic->num_src; i++)
>                 plic_set_priority(plic, i, priority[i]);
>  }
>
> --
> 2.34.1
>

