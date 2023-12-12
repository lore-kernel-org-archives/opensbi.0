From: Anup Patel <anup@brainfault.org>
Date: Tue, 12 Dec 2023 14:04:18 +0530
Subject: [PATCH 5/7] lib: sbi: adjust first usable PMP index to sbi_hart_pmp_reserved
In-Reply-To: <tencent_38EE478C58084EE3031FA1609CF690632906@qq.com>
References: <tencent_A2668222DA598E42B87A318A214D8DBD7C08@qq.com> <tencent_38EE478C58084EE3031FA1609CF690632906@qq.com>
Message-ID: <CAAhSdy1bLmR80J5A2a9972o6rD_6WeWdvO2cmuC4BPqONGhnJQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 8, 2023 at 3:34?AM Yangyu Chen <cyy@cyyself.name> wrote:
>
> Since we have probed the maximum index of locked PMPs and marked PMPs
> reserved from index 0 to it. We can use the number of reserved PMPs as
> the first usable PMP index.
>
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  include/sbi/sbi_hart.h | 2 +-
>  lib/sbi/sbi_hart.c     | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
> index 8df655c..aeaff45 100644
> --- a/include/sbi/sbi_hart.h
> +++ b/include/sbi/sbi_hart.h
> @@ -65,7 +65,7 @@ enum sbi_hart_extensions {
>   * unmapped. sbi_hart_map_saddr/sbi_hart_unmap_saddr function
>   * pair should be used to map/unmap the shared memory.
>   */
> -#define SBI_SMEPMP_RESV_ENTRY          0
> +#define SBI_SMEPMP_RESV_ENTRY          sbi_hart_pmp_reserved(scratch)
>
>  struct sbi_hart_features {
>         bool detected;
> diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
> index f8f7b82..f836b1c 100644
> --- a/lib/sbi/sbi_hart.c
> +++ b/lib/sbi/sbi_hart.c
> @@ -401,7 +401,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
>         pmp_disable(SBI_SMEPMP_RESV_ENTRY);
>
>         /* Program M-only regions when MML is not set. */
> -       pmp_idx = 0;
> +       pmp_idx = sbi_hart_pmp_reserved(scratch);
>         sbi_domain_for_each_memregion(dom, reg) {
>                 /* Skip reserved entry */
>                 if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
> @@ -427,7 +427,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
>         csr_set(CSR_MSECCFG, MSECCFG_MML);
>
>         /* Program shared and SU-only regions */
> -       pmp_idx = 0;
> +       pmp_idx = sbi_hart_pmp_reserved(scratch);
>         sbi_domain_for_each_memregion(dom, reg) {
>                 /* Skip reserved entry */
>                 if (pmp_idx == SBI_SMEPMP_RESV_ENTRY)
> @@ -464,7 +464,7 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
>  {
>         struct sbi_domain_memregion *reg;
>         struct sbi_domain *dom = sbi_domain_thishart_ptr();
> -       unsigned int pmp_idx = 0;
> +       unsigned int pmp_idx = sbi_hart_pmp_reserved(scratch);
>         unsigned int pmp_flags;
>         unsigned long pmp_addr;
>
> --
> 2.43.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

