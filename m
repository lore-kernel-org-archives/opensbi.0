From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 22 Nov 2022 06:17:16 +0100
Subject: [PATCH] Makefile: replace `echo` with `printf` for compatibility
In-Reply-To: <20221121155905.48577-1-kalle.wachsmuth@gmail.com>
References: <20221121155905.48577-1-kalle.wachsmuth@gmail.com>
Message-ID: <20221122051716.akv4prhx3otgqazd@kamzik>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 21, 2022 at 04:59:05PM +0100, KaDiWa wrote:
> I don't know why but `echo -n` didn't work for me. macOS supports the `-n` option but it doesn't work in the makefile. What it does instead is it literally writes `-n` to the file and then also
> leaves a newline at the end.
> 
> I'm using GNU Make 4.4 (`gmake` from Homebrew).
> 
> Signed-off-by: KaDiWa <kalle.wachsmuth@gmail.com>
> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 8db6eab..98e42fc 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -224,7 +224,7 @@ $(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(platform_
>  
>  $(KCONFIG_AUTOCMD): $(KCONFIG_CONFIG)
>  	$(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
> -	$(CMD_PREFIX)echo -n "$(KCONFIG_CONFIG): " > $(KCONFIG_AUTOCMD)
> +	$(CMD_PREFIX)printf "%s: " $(KCONFIG_CONFIG) > $(KCONFIG_AUTOCMD)
>  	$(CMD_PREFIX)cat $(KCONFIG_AUTOLIST) | tr '\n' ' ' >> $(KCONFIG_AUTOCMD)
>  
>  include $(KCONFIG_CONFIG)
> -- 
> 2.37.1 (Apple Git-137.1)
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

