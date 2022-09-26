From: Guo Ren <guoren@kernel.org>
Date: Tue, 27 Sep 2022 07:15:01 +0800
Subject: [PATCH v4 1/5] lib: sbi: do platform-specific extension
 population earlier
In-Reply-To: <20220926101607.731275-2-heiko@sntech.de>
References: <20220926101607.731275-1-heiko@sntech.de> <20220926101607.731275-2-heiko@sntech.de>
Message-ID: <CAJF2gTQXjj1bCWdiyOiSuh-BWtgmjE4cPeBzyWJ_tHbkS=Se_g@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Acked-by: Guo Ren <guoren@kernel.org>

On Mon, Sep 26, 2022 at 6:16 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Some of the more specific detections in hart_detect_features()
> might need to check platform-specific extensions so might need
> the platform-extensions being populated earlier.
>
> So move the call to sbi_platform_extensions_init() to an earlier
> place.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  lib/sbi/sbi_hart.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 1294868..9540e5c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -553,6 +553,11 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>         hfeatures->pmp_count = 0;
>         hfeatures->mhpm_count = 0;
>
> +       /* Let platform populate extensions */
> +       rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr());
> +       if (rc)
> +               return rc;
> +
>  #define __check_csr(__csr, __rdonly, __wrval, __field, __skip) \
>         oldval = csr_read_allowed(__csr, (ulong)&trap);                 \
>         if (!trap.cause) {                                              \
> @@ -681,11 +686,6 @@ __mhpm_skip:
>                                         SBI_HART_EXT_SMSTATEEN, true);
>         }
>
> -       /* Let platform populate extensions */
> -       rc = sbi_platform_extensions_init(sbi_platform_thishart_ptr());
> -       if (rc)
> -               return rc;
> -
>         /* Mark hart feature detection done */
>         hfeatures->detected = true;
>
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

