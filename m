From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 1 Jul 2024 17:31:07 +0200
Subject: [PATCH 3/4] Makefile: remove any .carray.c during clean
In-Reply-To: <20240701141101.20227-4-ben.dooks@codethink.co.uk>
References: <20240701141101.20227-1-ben.dooks@codethink.co.uk>
 <20240701141101.20227-4-ben.dooks@codethink.co.uk>
Message-ID: <20240701-2611336b026865e1b86d5078@orel>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 01, 2024 at 03:11:00PM GMT, Ben Dooks wrote:
> Now we've renamed the carray output files to .carray.c
> we can now use find to remove them.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
>  Makefile | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 2d964ec..7c43d93 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -687,6 +687,8 @@ clean:
>  	$(CMD_PREFIX)mkdir -p $(build_dir)
>  	$(if $(V), @echo " RM        $(build_dir)/*.o")
>  	$(CMD_PREFIX)find $(build_dir) -type f -name "*.o" -exec rm -rf {} +
> +	$(if $(V), @echo " RM        $(build_dir)/*.carray.c")
> +	$(CMD_PREFIX)find $(build_dir) -type f -name "*.carray.c" -exec rm -rf {} +
>  	$(if $(V), @echo " RM        $(build_dir)/*.a")
>  	$(CMD_PREFIX)find $(build_dir) -type f -name "*.a" -exec rm -rf {} +
>  	$(if $(V), @echo " RM        $(build_dir)/*.elf")
> -- 
> 2.37.2.352.g3c44437643
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

