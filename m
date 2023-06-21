From: Anup Patel <anup@brainfault.org>
Date: Wed, 21 Jun 2023 11:18:52 +0530
Subject: [PATCH V2] lib: reset: Move fdt_reset_init into generic_early_init
In-Reply-To: <20230618150716.3317274-1-guoren@kernel.org>
References: <20230618150716.3317274-1-guoren@kernel.org>
Message-ID: <CAAhSdy383vf-yMQYe6Dx+h0EY3cj66vvho44k28yvR8T+gXSDA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jun 18, 2023 at 8:37?PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> The fdt_reset_thead driver needs to modify the __reset_thead_csr_stub
> text region for the secondary harts booting. After that, the
> sbi_hart_pmp_configure may lock down the text region with M_READABLE &
> M_EXECUTABLE attributes in the future. Currently, the M_READABLE &
> M_EXECUtABLE have no effect on m-mode, the L-bit in pmpcfg csr is
> useless for the current opensbi scenario. See:
>
> Priv-isa-spec 3.7.1.2. Locking and Privilege Mode
> When the L bit is clear, any M-mode access matching the PMP entry will
> succeed; the R/W/X permissions apply only to S and U modes.
>
> That's why current fdt_reset_thead could still work well after commit:
> 230278dcf127 ("lib: sbi: Add separate entries for firmware RX and RW
> regions"). So this patch fixes up a fake bug for the M-mode permission
> setting of the future.
>
> Fixes: 230278dcf127 ("lib: sbi: Add separate entries for firmware RX and RW regions")
> Link: http://lists.infradead.org/pipermail/opensbi/2023-June/005176.html
> Reported-by: Jessica Clarke <jrtc27@jrtc27.com>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>

Applied this patch to the riscv/opensbi repo

Thanks,
Anup

> ---
> Changelog:
> v2:
>  - Direct move fdt_reset_init into generic_early_init
> ---
>  platform/generic/platform.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/platform/generic/platform.c b/platform/generic/platform.c
> index eeefef4c9533..bd608f6d4065 100644
> --- a/platform/generic/platform.c
> +++ b/platform/generic/platform.c
> @@ -143,6 +143,9 @@ static int generic_nascent_init(void)
>
>  static int generic_early_init(bool cold_boot)
>  {
> +       if (cold_boot)
> +               fdt_reset_init();
> +
>         if (!generic_plat || !generic_plat->early_init)
>                 return 0;
>
> @@ -154,9 +157,6 @@ static int generic_final_init(bool cold_boot)
>         void *fdt;
>         int rc;
>
> -       if (cold_boot)
> -               fdt_reset_init();
> -
>         if (generic_plat && generic_plat->final_init) {
>                 rc = generic_plat->final_init(cold_boot, generic_plat_match);
>                 if (rc)
> --
> 2.36.1
>

