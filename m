From: Anup Patel <anup@brainfault.org>
Date: Thu, 4 Jul 2024 11:20:28 +0530
Subject: [PATCH 3/4] Makefile: remove any .carray.c during clean
In-Reply-To: <20240701141101.20227-4-ben.dooks@codethink.co.uk>
References: <20240701141101.20227-1-ben.dooks@codethink.co.uk> <20240701141101.20227-4-ben.dooks@codethink.co.uk>
Message-ID: <CAAhSdy3K8jBaEfs9kEctUKcLSeWHrAxj1FdK_K_BoYn8DHzOWA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 1, 2024 at 7:57?PM Ben Dooks <ben.dooks@codethink.co.uk> wrote:
>
> Now we've renamed the carray output files to .carray.c
> we can now use find to remove them.
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 2d964ec..7c43d93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -687,6 +687,8 @@ clean:
>         $(CMD_PREFIX)mkdir -p $(build_dir)
>         $(if $(V), @echo " RM        $(build_dir)/*.o")
>         $(CMD_PREFIX)find $(build_dir) -type f -name "*.o" -exec rm -rf {} +
> +       $(if $(V), @echo " RM        $(build_dir)/*.carray.c")
> +       $(CMD_PREFIX)find $(build_dir) -type f -name "*.carray.c" -exec rm -rf {} +
>         $(if $(V), @echo " RM        $(build_dir)/*.a")
>         $(CMD_PREFIX)find $(build_dir) -type f -name "*.a" -exec rm -rf {} +
>         $(if $(V), @echo " RM        $(build_dir)/*.elf")
> --
> 2.37.2.352.g3c44437643
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

