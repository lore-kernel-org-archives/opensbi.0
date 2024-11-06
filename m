From: Anup Patel <anup@brainfault.org>
Date: Wed, 6 Nov 2024 16:26:25 +0530
Subject: [PATCH] top: Add .editorconfig to set basic coding styles
In-Reply-To: <20240916095636.603355-1-minachou@andestech.com>
References: <20240916095636.603355-1-minachou@andestech.com>
Message-ID: <CAAhSdy1As9hbPGpG4QoDK+NFYALoGN-yGTpn-wqwYEkmxcUfuw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 16, 2024 at 3:26?PM Hui Min Mina Chou
<minachou@andestech.com> wrote:
>
> EditorConfig [1] ensures consistent coding styles for developers
> collaborating on the same project across various editors and IDEs. By
> adopting the Linux project's .editorconfig settings [2] and applying
> them to OpenSBI, it helps users maintain uniform indentation across
> different IDEs and version control systems, improving development
> efficiency.
>
> The main difference from Linux project is the addition of
> 'trim_trailing_whitespace = true', which removes trailing whitespace
> before newlines. This change affects only three files in OpenSBI, but
> it improves overall code consistency.
>
>  $ grep -nr "\s$" --include={*.{c,dts,h,lds,ldS,mk,s,S.py},Kconfig,Makefile,Makefile.*} .
>  ./include/sbi_utils/fdt/fdt_fixup.h:4: * Implement platform specific DT fixups on top of libfdt.
>  ./platform/generic/platform.c:79: * The fw_platform_coldboot_harts_init() function is called by fw_platform_init()
>  ./platform/generic/platform.c:81: * according to the DT property "cold-boot-harts" in "/chosen/opensbi-config"
>
> Link: https://editorconfig.org/ [1]
> Link: https://lore.kernel.org/lkml/ZbAbmchIO8Cd5hNd at surfacebook.localdomain/T/ [2]
> Signed-off-by: Hui Min Mina Chou <minachou@andestech.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  .editorconfig | 21 +++++++++++++++++++++
>  .gitignore    |  1 +
>  2 files changed, 22 insertions(+)
>  create mode 100644 .editorconfig
>
> diff --git a/.editorconfig b/.editorconfig
> new file mode 100644
> index 000000000000..e66b1ca3d6e7
> --- /dev/null
> +++ b/.editorconfig
> @@ -0,0 +1,21 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +# See here for more information about the format and editor support:
> +# https://editorconfig.org/
> +
> +root = true
> +
> +[{*.{c,dts,h,lds,ldS,mk,s,S},Kconfig,Makefile,Makefile.*}]
> +charset = utf-8
> +end_of_line = lf
> +trim_trailing_whitespace = true
> +insert_final_newline = true
> +indent_style = tab
> +indent_size = 8
> +
> +[*.py]
> +charset = utf-8
> +end_of_line = lf
> +trim_trailing_whitespace = true
> +insert_final_newline = true
> +indent_style = space
> +indent_size = 4
> diff --git a/.gitignore b/.gitignore
> index a519d67f5c54..424302b38337 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -5,5 +5,6 @@
>  !.clang-format
>  !.gitignore
> +!.editorconfig
>
>  # Object files
>  *.o
> --
> 2.34.1
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

