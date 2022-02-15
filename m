From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 15 Feb 2022 21:42:15 +0530
Subject: [PATCH 1/3] lib: sbi: fix typo in is_region_subset
In-Reply-To: <20220211111155.16121-2-nikita.shubin@maquefel.me>
References: <20220211111155.16121-1-nikita.shubin@maquefel.me>
 <20220211111155.16121-2-nikita.shubin@maquefel.me>
Message-ID: <CAK9=C2Xc=oj=1jhVjMUv-+D-zfvDTFguep8wWvvUGvn9d0hcFQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Feb 11, 2022 at 4:42 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> From: Nikita Shubin <n.shubin@yadro.com>
>
> Fix typo in is_region_subset, regB_end should be calculated from regB.
>
> Signed-off-by: Nikita Shubin <n.shubin@yadro.com>

Thanks for catching this issue.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_domain.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
> index b60915c..a1ac1bb 100644
> --- a/lib/sbi/sbi_domain.c
> +++ b/lib/sbi/sbi_domain.c
> @@ -159,7 +159,7 @@ static bool is_region_subset(const struct sbi_domain_memregion *regA,
>         ulong regA_start = regA->base;
>         ulong regA_end = regA->base + (BIT(regA->order) - 1);
>         ulong regB_start = regB->base;
> -       ulong regB_end = regB->base + (BIT(regA->order) - 1);
> +       ulong regB_end = regB->base + (BIT(regB->order) - 1);
>
>         if ((regB_start <= regA_start) &&
>             (regA_start < regB_end) &&
> --
> 2.31.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

