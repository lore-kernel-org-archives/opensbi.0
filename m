From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Jun 2024 19:00:17 +0530
Subject: [PATCH] lib: utils/fdt: Fix DT property for APLIC delegation
In-Reply-To: <20240605063014.2255006-1-apatel@ventanamicro.com>
References: <20240605063014.2255006-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0Q6AEmH0cGaFpbxjAzhTyAShrYpZRVfF_=KQWxmM_ZYw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jun 5, 2024 at 12:00?PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> During Linux AIA driver review, the APLIC DT property for interrupt
> delegation was renamed to "riscv,delegation" so let's use the new DT
> property name and fallback to old DT property name if the new DT
> property name is not available.
>
> Fixes: 34612193af92 ("lib: utils/irqchip: Add FDT based driver for APLIC")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/fdt/fdt_helper.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
> index a0e93b9..9a945af 100644
> --- a/lib/utils/fdt/fdt_helper.c
> +++ b/lib/utils/fdt/fdt_helper.c
> @@ -720,7 +720,9 @@ aplic_msi_parent_done:
>                 deleg->child_index = 0;
>         }
>
> -       del = fdt_getprop(fdt, nodeoff, "riscv,delegate", &len);
> +       del = fdt_getprop(fdt, nodeoff, "riscv,delegation", &len);
> +       if (!del)
> +               del = fdt_getprop(fdt, nodeoff, "riscv,delegate", &len);
>         if (!del || len < (3 * sizeof(fdt32_t)))
>                 goto skip_delegate_parse;
>         d = 0;
> --
> 2.34.1
>

