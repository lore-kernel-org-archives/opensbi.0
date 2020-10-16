From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 16 Oct 2020 12:44:33 -0700
Subject: [PATCH 1/5] Makefile: Build ELF, BIN and LD script in platform
 build directory
In-Reply-To: <20201015081211.1956554-2-anup.patel@wdc.com>
References: <20201015081211.1956554-1-anup.patel@wdc.com>
 <20201015081211.1956554-2-anup.patel@wdc.com>
Message-ID: <CAOnJCUJYp03F+BZeNppE2+hnk3YKVbP2K+OhjZEsbXwJz5gWng@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Oct 15, 2020 at 1:12 AM Anup Patel <anup.patel@wdc.com> wrote:
>
> Currently, the make rules for ELF, BIN and LD script are little
> generic to allowing ELF, BIN and LD script to be anywhere in the
> build directory. For OpenSBI firwares, the ELF, BIN, and LD script
> are always platform specific so we update make rules accordingly.
>

/s/firewares/firmwares

> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  Makefile | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 2a352ef..6c36f09 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -310,15 +310,6 @@ all: $(targets-y)
>  # Preserve all intermediate files
>  .SECONDARY:
>
> -$(build_dir)/%.bin: $(build_dir)/%.elf
> -       $(call compile_objcopy,$@,$<)
> -
> -$(build_dir)/%.elf: $(build_dir)/%.o $(build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
> -       $(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
> -
> -$(platform_build_dir)/%.ld: $(src_dir)/%.ldS
> -       $(call compile_cpp,$@,$<)
> -
>  $(build_dir)/lib/libsbi.a: $(libsbi-objs-path-y)
>         $(call compile_ar,$@,$^)
>
> @@ -340,6 +331,15 @@ $(build_dir)/%.dep: $(src_dir)/%.S
>  $(build_dir)/%.o: $(src_dir)/%.S
>         $(call compile_as,$@,$<)
>
> +$(platform_build_dir)/%.bin: $(platform_build_dir)/%.elf
> +       $(call compile_objcopy,$@,$<)
> +
> +$(platform_build_dir)/%.elf: $(platform_build_dir)/%.o $(platform_build_dir)/%.elf.ld $(platform_build_dir)/lib/libplatsbi.a
> +       $(call compile_elf,$@,$@.ld,$< $(platform_build_dir)/lib/libplatsbi.a)
> +
> +$(platform_build_dir)/%.ld: $(src_dir)/%.ldS
> +       $(call compile_cpp,$@,$<)
> +
>  $(platform_build_dir)/%.dep: $(platform_src_dir)/%.c
>         $(call compile_cc_dep,$@,$<)
>
> --
> 2.25.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

Otherwise, looks good.

Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

