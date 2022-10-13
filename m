From: Anup Patel <anup@brainfault.org>
Date: Thu, 13 Oct 2022 10:03:26 +0530
Subject: [1/1] Makefile: Add cscope support
In-Reply-To: <20221013012623.1077367-1-ende.tan@linux.starfivetech.com>
References: <20221013012623.1077367-1-ende.tan@linux.starfivetech.com>
Message-ID: <CAAhSdy2ecbrj6W=u1mP+S-NWP8GaSra2zAPZqK1vzyD6qWU1rw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 13, 2022 at 6:56 AM Tan En De
<ende.tan@linux.starfivetech.com> wrote:
>
> Add cscope support so that running `make cscope` will generate/update
> cscope files used for source code browsing, while running `make
> distclean` will remove the cscope files.
>
> Also add entry in .gitignore to ignore generated cscope files.
>
> Signed-off-by: Tan En De <ende.tan@linux.starfivetech.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .gitignore |  1 +
>  Makefile   | 13 +++++++++++++
>  2 files changed, 14 insertions(+)
>
> diff --git a/.gitignore b/.gitignore
> index 534ad64..95692bb 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -9,3 +9,4 @@ install/
>
>  # Development friendly files
>  tags
> +cscope*
> diff --git a/Makefile b/Makefile
> index 0ab9f22..4b175a0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -623,6 +623,17 @@ install_firmwares: $(platform_build_dir)/lib/libplatsbi.a $(build_dir)/lib/libsb
>  install_docs: $(build_dir)/docs/latex/refman.pdf
>         $(call inst_file,$(install_root_dir)/$(install_docs_path)/refman.pdf,$(build_dir)/docs/latex/refman.pdf)
>
> +.PHONY: cscope
> +cscope:
> +       $(CMD_PREFIX)find \
> +               "$(src_dir)/firmware" \
> +               "$(src_dir)/include" \
> +               "$(src_dir)/lib" \
> +               "$(platform_src_dir)" \
> +       -name "*.[chS]" -print > cscope.files
> +       $(CMD_PREFIX)echo "$(KCONFIG_AUTOHEADER)" >> cscope.files
> +       $(CMD_PREFIX)cscope -bkq -i cscope.files -f cscope.out
> +
>  # Rule for "make clean"
>  .PHONY: clean
>  clean:
> @@ -652,6 +663,8 @@ ifeq ($(install_root_dir),$(install_root_dir_default)/usr)
>         $(if $(V), @echo " RM        $(install_root_dir_default)")
>         $(CMD_PREFIX)rm -rf $(install_root_dir_default)
>  endif
> +       $(if $(V), @echo " RM        $(src_dir)/cscope*")
> +       $(CMD_PREFIX)rm -f $(src_dir)/cscope*
>
>  .PHONY: FORCE
>  FORCE:
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

