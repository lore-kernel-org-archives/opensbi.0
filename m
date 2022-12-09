From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Dec 2022 11:21:17 +0530
Subject: [PATCH] platform: generic: Make use of fdt_match_node()
In-Reply-To: <20221207161419.10259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221207161419.10259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy3ZOs7VttrLFMvS+hv2Rf0mMivkWvEMm7MB-Tv5crxK-Q@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 7, 2022 at 9:44 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
>
> It makes sense to use fdt_match_node() instead of fdt_find_match()
> in fw_platform_lookup_special() as we already have the start offset
> to search from.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
> Based on the feedback provided by Anup [0].
>
> [0] https://patchwork.ozlabs.org/project/opensbi/patch/20221130220825.193693-7-prabhakar.mahadev-lad.rj at bp.renesas.com/#3015759
> ---
>  platform/generic/platform.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 595b0fd..bfe15f0 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -34,17 +34,17 @@ static const struct fdt_match *generic_plat_match = NULL;
>
>  static void fw_platform_lookup_special(void *fdt, int root_offset)
>  {
> -       int pos, noff;
>         const struct platform_override *plat;
>         const struct fdt_match *match;
> +       int pos;
>
>         for (pos = 0; pos < platform_override_modules_size; pos++) {
>                 plat = platform_override_modules[pos];
>                 if (!plat->match_table)
>                         continue;
>
> -               noff = fdt_find_match(fdt, -1, plat->match_table, &match);
> -               if (noff < 0)
> +               match = fdt_match_node(fdt, root_offset, plat->match_table);
> +               if (!match)
>                         continue;
>
>                 generic_plat = plat;
> --
> 2.17.1
>

