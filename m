From: Anup Patel <anup@brainfault.org>
Date: Fri, 3 Sep 2021 12:14:10 +0530
Subject: [PATCH v2] lib: sbi: Refine the way to construct platform features
In-Reply-To: <20210901030624.20065-1-Dd_nirvana@sjtu.edu.cn>
References: <20210901030624.20065-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAAhSdy2jJA2B0YP1UKdyoKnbs7vA4Acc4pObrpiqgg4qWkYkQQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 1, 2021 at 8:37 AM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> sbi_platform_get_features_str() uses sbi_snprintf() to construct the
> features_str. However, it passes the wrong length value (i.e., the nfstr),
> which should be (nfstr-offset) as the starting point of str (i.e., features_str + offset)
> changes.
> This commit also checks the return value of snprintf, and handles the corner case
> that the string buffer is full.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

Please insert here Reviewed-by obtained in previous patch revisions.

> ---
>  lib/sbi/sbi_platform.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
> index 99bd8f5..7f0ed23 100644
> --- a/lib/sbi/sbi_platform.c
> +++ b/lib/sbi/sbi_platform.c
> @@ -48,9 +48,17 @@ void sbi_platform_get_features_str(const struct sbi_platform *plat,
>                 if (features & feat) {
>                         temp = sbi_platform_feature_id2string(feat);
>                         if (temp) {
> -                               sbi_snprintf(features_str + offset, nfstr,
> +                               int len = sbi_snprintf(features_str + offset, nfstr - offset,

This line is over 80 characters.

>                                              "%s,", temp);
> -                               offset = offset + sbi_strlen(temp) + 1;
> +                               if (len < 0)
> +                                       break;
> +
> +                               if (offset + len >= nfstr) {
> +                                       /* No more space for features */
> +                                       offset = nfstr;
> +                                       break;
> +                               } else
> +                                       offset = offset + len;
>                         }
>                 }
>                 feat = feat << 1;
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Only one minor comment above, which I have taken care of while
merging this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

