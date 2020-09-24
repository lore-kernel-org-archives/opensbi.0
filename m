From: Atish Patra <atishp@atishpatra.org>
Date: Thu, 24 Sep 2020 12:38:46 -0700
Subject: [PATCH] lib: sbi: Fix PMP CSR detection
In-Reply-To: <20200923071417.19000-1-pragnesh.patel@sifive.com>
References: <20200923071417.19000-1-pragnesh.patel@sifive.com>
Message-ID: <CAOnJCU+UEw66ckVM1TG=0T1vnxEKyZdgMNGoTKOwgdVvr6QDTA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 23, 2020 at 12:36 AM Pragnesh Patel
<pragnesh.patel@sifive.com> wrote:
>
> HiFive unleashed currently implements fewer than 56 bits of physical
> address so existing PMP CSR detection is broken.
>
> PMP address register encodes bits 55-2 of a 56-bit physical address,
> Not all physical address bits may be implemented, So just check
> minimum 1 bit.
>
It's good to add .
As per the privilege spec,

Are there any other usecase for PMP_ADDR_MASK in future? If not, we
can remove that as well.

> Fixes: 74d1db706293 ("lib: sbi: Improve PMP CSR detection and
> progamming")
>
> Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  lib/sbi/sbi_hart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index 4cbe8ce..6413194 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -403,7 +403,7 @@ static void hart_detect_features(struct sbi_scratch *scratch)
>         __check_csr_32(__csr + 32, __rdonly, __wrval, __field, __skip)
>
>         /* Detect number of PMP regions */
> -       __check_csr_64(CSR_PMPADDR0, 0, PMP_ADDR_MASK, pmp_count, __pmp_skip);
> +       __check_csr_64(CSR_PMPADDR0, 0, 1UL, pmp_count, __pmp_skip);
>  __pmp_skip:
>
>         /* Detect number of MHPM counters */
> --
> 2.17.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise,

Reviewed-by: Atish Patra <atish.patra@wdc.com>


-- 
Regards,
Atish

