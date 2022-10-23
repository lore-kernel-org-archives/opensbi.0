From: Anup Patel <anup@brainfault.org>
Date: Sun, 23 Oct 2022 11:11:11 +0530
Subject: [PATCH 1/3] Makefile: Add rules for carray sources in lib/sbi
In-Reply-To: <TYYP286MB14397F96761E23EB9E84A3BEC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
References: <TYYP286MB1439D0F7EA824413E8EF63FCC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
 <TYYP286MB14397F96761E23EB9E84A3BEC6209@TYYP286MB1439.JPNP286.PROD.OUTLOOK.COM>
Message-ID: <CAAhSdy3_v0XcSPajveaAyrXdp2Le6mf6Y+uPec+34sedNV23dA@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 10, 2022 at 10:05 PM Vivian Wang <dramforever@live.com> wrote:
>
> Add back the missing rules needed to build carray files in lib/sbi. This
> allows future usage of carray in lib/sbi.
>
> Fixes: de80e9337d81 ("Makefile: Compile lib/utils sources separately for each platform")
> Signed-off-by: Vivian Wang <dramforever@live.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 0ab9f22..2a3d080 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -478,6 +478,13 @@ $(build_dir)/lib/libsbi.a: $(libsbi-objs-path-y)
>  $(platform_build_dir)/lib/libplatsbi.a: $(libsbi-objs-path-y) $(libsbiutils-objs-path-y) $(platform-objs-path-y)
>         $(call compile_ar,$@,$^)
>
> +$(build_dir)/%.dep: $(src_dir)/%.carray $(KCONFIG_CONFIG)
> +       $(call compile_gen_dep,$@,.c,$< $(KCONFIG_CONFIG))
> +       $(call compile_gen_dep,$@,.o,$(@:.dep=.c))
> +
> +$(build_dir)/%.c: $(src_dir)/%.carray
> +       $(call compile_carray,$@,$<)
> +
>  $(build_dir)/%.dep: $(src_dir)/%.c $(KCONFIG_CONFIG)
>         $(call compile_cc_dep,$@,$<)
>
> --
> 2.37.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

