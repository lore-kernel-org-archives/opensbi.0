From: Anup Patel <anup@brainfault.org>
Date: Mon, 5 Dec 2022 18:16:34 +0530
Subject: [PATCH v3 6/6] platform: generic: Drop root_offset parameter from fw_platform_lookup_special()
In-Reply-To: <20221130220825.193693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221130220825.193693-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20221130220825.193693-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <CAAhSdy0kZDPJd4jWQGU-18gOtuS3dzgSQsThAafbf1RpDQrgQw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 1, 2022 at 3:39 AM Prabhakar <prabhakar.csengg@gmail.com> wrote:
>
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> root_offset parameter isn't used in fw_platform_lookup_special() so
> just drop it.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3
> * New patch
> ---
>  platform/generic/platform.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index 595b0fd..fb5f476 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -32,7 +32,7 @@ extern unsigned long platform_override_modules_size;
>  static const struct platform_override *generic_plat = NULL;
>  static const struct fdt_match *generic_plat_match = NULL;
>
> -static void fw_platform_lookup_special(void *fdt, int root_offset)
> +static void fw_platform_lookup_special(void *fdt)

Rather than dropping root_offset, please update this patch to
replace use of fdt_find_match() with fdt_match_node(). This is
because platform override should be detected only based on
root DT node matching.

Regards,
Anup

>  {
>         int pos, noff;
>         const struct platform_override *plat;
> @@ -83,7 +83,7 @@ unsigned long fw_platform_init(unsigned long arg0, unsigned long arg1,
>         if (root_offset < 0)
>                 goto fail;
>
> -       fw_platform_lookup_special(fdt, root_offset);
> +       fw_platform_lookup_special(fdt);
>
>         model = fdt_getprop(fdt, root_offset, "model", &len);
>         if (model)
> --
> 2.17.1
>

