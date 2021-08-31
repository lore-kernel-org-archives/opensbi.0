From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 1 Sep 2021 06:15:54 +0800
Subject: [PATCH] lib: sbi: Refine the way to construct platform features
In-Reply-To: <20210830135914.15395-1-Dd_nirvana@sjtu.edu.cn>
References: <20210830135914.15395-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAEUhbmXEUOdW6M-tA3SnwK2jzYpvu_nVwmrk9DQErSPvHjj5UQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 30, 2021 at 10:00 PM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> sbi_platform_get_features_str() uses sbi_snprintf() to construct the
> features_str. However, it passes the wrong length value (i.e., the nfstr),
> which should be (nfstr-offset) as the starting point of str (i.e., features_str + offset)
> changes.
> This commit also checks the return value of snprintf, and handles the corner case
> that the string buffer is full.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>
> ---
>  lib/sbi/sbi_platform.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/lib/sbi/sbi_platform.c b/lib/sbi/sbi_platform.c
> index 99bd8f5..56c37aa 100644
> --- a/lib/sbi/sbi_platform.c
> +++ b/lib/sbi/sbi_platform.c
> @@ -48,9 +48,17 @@ void sbi_platform_get_features_str(const struct sbi_platform *plat,
>                 if (features & feat) {
>                         temp = sbi_platform_feature_id2string(feat);
>                         if (temp) {
> -                               sbi_snprintf(features_str + offset, nfstr,
> +                               int len = sbi_snprintf(features_str + offset, nfstr - offset,
>                                              "%s,", temp);
> -                               offset = offset + sbi_strlen(temp) + 1;
> +                               if (len < 0)
> +                                       break;
> +
> +                               if (offset + len >= nfstr) {
> +                                       // No more space for features

Use /* */ style

> +                                       offset = nfstr;
> +                                       break;
> +                               } else
> +                                       offset = offset + len;
>                         }
>                 }
>                 feat = feat << 1;
>

Regards,
Bin

