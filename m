From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Dec 2023 13:07:10 +0530
Subject: [PATCH 1/7] lib: sbi: Probe pmp_count in read-only
In-Reply-To: <tencent_543699631DAE560C78484D23191FA460AE06@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com> <tencent_543699631DAE560C78484D23191FA460AE06@qq.com>
Message-ID: <CAAhSdy00p0zv78u6w2x37Erg4X9X5meWoM8BVRaKijVDQMbAXg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 8, 2023 at 3:34?AM Yangyu Chen <cyy@cyyself.name> wrote:
>
> Some CPU implementations such as T-Head C908 will raise illegal
> instruction exception when writing a different value to some pmpaddr
> which is locked.
>
> To avoid this, a solution is to probe pmp_count in read-only. This will
> not affect the existing CPU implementation as RISC-V Privileged
> Architecture specified that access to a non-existent CSR raises an
> illegal instruction exception.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  lib/sbi/sbi_hart.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index c948373..49d1454 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -877,7 +877,7 @@ static int hart_detect_features(struct sbi_scratch *scratch)
>                 hfeatures->pmp_gran =  1 << (sbi_ffs(val) + 2);
>                 hfeatures->pmp_addr_bits = sbi_fls(val) + 1;
>                 /* Detect number of PMP regions. At least PMPADDR0 should be implemented*/
> -               __check_csr_64(CSR_PMPADDR0, 0, val, pmp_count, __pmp_skip);
> +               __check_csr_64(CSR_PMPADDR0, true, 0, pmp_count, __pmp_skip);
>         }
>  __pmp_skip:
>         /* Detect number of MHPM counters */
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

