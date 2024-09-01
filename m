From: Ben Dooks <ben.dooks@codethink.co.uk>
Date: Sun, 01 Sep 2024 23:20:22 +0100
Subject: [PATCH] Makefile: Make .carray.c files depend on carray.sh
In-Reply-To: <20240901163712.307806-1-samuel.holland@sifive.com>
References: <20240901163712.307806-1-samuel.holland@sifive.com>
Message-ID: <459fb3bef98296b9964e1a10283406a5@codethink.co.uk>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 2024-09-01 17:36, Samuel Holland wrote:
> Force carray C source files to be regenerated when the script changes,
> since their contents depend on the script's output.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> I have an upcoming patch series that modifies carray.sh, and it would 
> be
> helpful to have this fix already merged, to avoid needing to `make 
> clean`
> after trying out the series.

That looks reasobable, but not had the chance to test

>  Makefile | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index e5a0f19e..f0012f6d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -528,7 +528,7 @@ $(build_dir)/%.dep: $(src_dir)/%.carray 
> $(KCONFIG_AUTOHEADER)
>  	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
>  	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
> 
> -$(build_dir)/%.carray.c: $(src_dir)/%.carray
> +$(build_dir)/%.carray.c: $(src_dir)/%.carray 
> $(src_dir)/scripts/carray.sh
>  	$(call compile_carray,$@,$<)
> 
>  $(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
> @@ -556,7 +556,7 @@ $(platform_build_dir)/%.dep: 
> $(platform_src_dir)/%.carray $(KCONFIG_AUTOHEADER)
>  	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
>  	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
> 
> -$(platform_build_dir)/%.carray.c: $(platform_src_dir)/%.carray
> +$(platform_build_dir)/%.carray.c: $(platform_src_dir)/%.carray 
> $(src_dir)/scripts/carray.sh
>  	$(call compile_carray,$@,$<)
> 
>  $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c 
> $(KCONFIG_AUTOHEADER)
> @@ -599,7 +599,7 @@ $(platform_build_dir)/%.dep: $(src_dir)/%.carray 
> $(KCONFIG_AUTOHEADER)
>  	$(call compile_gen_dep,$@,.c,$< $(KCONFIG_AUTOHEADER))
>  	$(call compile_gen_dep,$@,.o,$(@:.dep=.c))
> 
> -$(platform_build_dir)/%.carray.c: $(src_dir)/%.carray
> +$(platform_build_dir)/%.carray.c: $(src_dir)/%.carray 
> $(src_dir)/scripts/carray.sh
>  	$(call compile_carray,$@,$<)
> 
>  $(platform_build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_AUTOHEADER)
> --
> 2.45.1

