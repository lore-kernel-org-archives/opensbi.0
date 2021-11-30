From: Anup Patel <anup@brainfault.org>
Date: Tue, 30 Nov 2021 10:43:48 +0530
Subject: [PATCH] lib: sbi: Resolve the uninitialized complaint in sbi_pmu
In-Reply-To: <20211125103817.6018-1-Dd_nirvana@sjtu.edu.cn>
References: <20211125103817.6018-1-Dd_nirvana@sjtu.edu.cn>
Message-ID: <CAAhSdy1c7zp_didJQ-5PYimeFqNOu3ksjJKpGLbEPTnSax-Qwg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Nov 25, 2021 at 4:08 PM Dong Du <Dd_nirvana@sjtu.edu.cn> wrote:
>
> A recent commit (b28f0700) turns to read from CSR_MCOUNTINHIBIT after
> checking the SBI_HART_HAS_MCOUNTINHIBIT HART feature, which leaves the
> mctr_inhbt uninitialized in pmu_ctr_find_hw().
> As a result, compiler will complain:
> error: 'mctr_inhbt' may be used uninitialized in this function.
>
> This commit resolves the issue by assigning an initial value to mctr_inhbt.
>
> Signed-off-by: Dong Du <Dd_nirvana@sjtu.edu.cn>

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  lib/sbi/sbi_pmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
> index a0eb359..5950a20 100644
> --- a/lib/sbi/sbi_pmu.c
> +++ b/lib/sbi/sbi_pmu.c
> @@ -489,7 +489,7 @@ static int pmu_ctr_find_hw(unsigned long cbase, unsigned long cmask, unsigned lo
>         unsigned long ctr_mask;
>         int i, ret = 0, fixed_ctr, ctr_idx = SBI_ENOTSUPP;
>         struct sbi_pmu_hw_event *temp;
> -       unsigned long mctr_inhbt;
> +       unsigned long mctr_inhbt = 0;
>         u32 hartid = current_hartid();
>         struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
>
> --
> 2.33.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

