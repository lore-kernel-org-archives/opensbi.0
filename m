From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 17:56:16 +0530
Subject: [PATCH] lib: utils: Add fdt_fixup_node() helper function
In-Reply-To: <20221202115947.226472-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221202115947.226472-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy2G9XJ+z0X-A8-tDSr3kjBjDWebDF7LVbxzP1NL3BpU_g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 2, 2022 at 5:30 PM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add a helper function fdt_fixup_node() based on the compatible string.
> This will avoid code duplication for every new node fixup being added.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

I have taken care of Bin's comment at the time of merging this patch.
Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/utils/fdt/fdt_fixup.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
> index d1050bb..ef06c6b 100644
> --- a/lib/utils/fdt/fdt_fixup.c
> +++ b/lib/utils/fdt/fdt_fixup.c
> @@ -74,22 +74,22 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
>         }
>  }
>
> -void fdt_aplic_fixup(void *fdt)
> +static void fdt_fixup_node(void *fdt, const char *compatible)
>  {
>         int noff = 0;
>
> -       while ((noff = fdt_node_offset_by_compatible(fdt, noff,
> -                                                    "riscv,aplic")) >= 0)
> +       while ((noff = fdt_node_offset_by_compatible(fdt, noff, compatible)) >= 0)
>                 fdt_domain_based_fixup_one(fdt, noff);
>  }
>
> -void fdt_imsic_fixup(void *fdt)
> +void fdt_aplic_fixup(void *fdt)
>  {
> -       int noff = 0;
> +       fdt_fixup_node(fdt, "riscv,aplic");
> +}
>
> -       while ((noff = fdt_node_offset_by_compatible(fdt, noff,
> -                                                    "riscv,imsics")) >= 0)
> -               fdt_domain_based_fixup_one(fdt, noff);
> +void fdt_imsic_fixup(void *fdt)
> +{
> +       fdt_fixup_node(fdt, "riscv,imsics");
>  }
>
>  void fdt_plic_fixup(void *fdt)
> --
> 2.17.1
>

