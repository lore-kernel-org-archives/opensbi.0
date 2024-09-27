From: Anup Patel <anup@brainfault.org>
Date: Fri, 27 Sep 2024 10:46:28 +0530
Subject: [PATCH] lib: utils/ipi: Fix hartid wrongly used as hart index
In-Reply-To: <20240831022751.81875-1-samuel.holland@sifive.com>
References: <20240831022751.81875-1-samuel.holland@sifive.com>
Message-ID: <CAAhSdy3OVkJ2C+g9og5UFJPkG56Q=eZOGNvw423fEXA8w4+VHQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Aug 31, 2024 at 7:57?AM Samuel Holland
<samuel.holland@sifive.com> wrote:
>
> Since commit 78c667b6fc07 ("lib: sbi: Prefer hartindex over hartid in
> IPI framework"), The .ipi_clear callback functions take a hart index,
> not a hartid. However, these warm_init functions were never updated.
>
> Fixes: 78c667b6fc07 ("lib: sbi: Prefer hartindex over hartid in IPI framework")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> These functions could be updated to use current_hartindex() once that
> API is added, and I will do that if I send a v2 of the hartindex series.

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

I have updated this patch to use current_hartindex() at the time of
merging this patch.

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

>
>  lib/utils/ipi/aclint_mswi.c  | 2 +-
>  lib/utils/ipi/andes_plicsw.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/lib/utils/ipi/aclint_mswi.c b/lib/utils/ipi/aclint_mswi.c
> index 4ae6bb1c..905c1996 100644
> --- a/lib/utils/ipi/aclint_mswi.c
> +++ b/lib/utils/ipi/aclint_mswi.c
> @@ -74,7 +74,7 @@ static struct sbi_ipi_device aclint_mswi = {
>  int aclint_mswi_warm_init(void)
>  {
>         /* Clear IPI for current HART */
> -       mswi_ipi_clear(current_hartid());
> +       mswi_ipi_clear(sbi_hartid_to_hartindex(current_hartid()));
>
>         return 0;
>  }
> diff --git a/lib/utils/ipi/andes_plicsw.c b/lib/utils/ipi/andes_plicsw.c
> index 413ac20e..37dc4f64 100644
> --- a/lib/utils/ipi/andes_plicsw.c
> +++ b/lib/utils/ipi/andes_plicsw.c
> @@ -67,10 +67,8 @@ static struct sbi_ipi_device plicsw_ipi = {
>
>  int plicsw_warm_ipi_init(void)
>  {
> -       u32 hartid = current_hartid();
> -
>         /* Clear PLICSW IPI */
> -       plicsw_ipi_clear(hartid);
> +       plicsw_ipi_clear(sbi_hartid_to_hartindex(current_hartid()));
>
>         return 0;
>  }
> --
> 2.45.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

