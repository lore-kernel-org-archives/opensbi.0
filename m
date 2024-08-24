From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 Aug 2024 13:27:39 +0530
Subject: [PATCH] Makefile: fix OPENSBI_VERSION_GIT build with submodules
In-Reply-To: <20240805124632.1732560-1-dbarboza@ventanamicro.com>
References: <20240805124632.1732560-1-dbarboza@ventanamicro.com>
Message-ID: <CAAhSdy06W1hxBQUdhZw_yOCoe66tonJDtUBWMgh2oU8JSJsGrg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Aug 5, 2024 at 6:16?PM Daniel Henrique Barboza
<dbarboza@ventanamicro.com> wrote:
>
> When building OpenSBI via a submodule, OPENSBI_VERSION_GIT can be left
> unset in case '.git' isn't a dir. This is the case when building OpenSBI
> as a QEMU submodule:
>
> $ cat .git
> gitdir: ../../.git/modules/roms/opensbi
>
> As a result, building OpenSBI tag v1.5.1 in QEMU will result in a binary
> that will have "OpenSBI v1.5" as a banner.
>
> Use "git rev-parse --git-dir" instead of checking if '.git' is a dir to
> detect if the current dir is a git repo.
>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>  Makefile | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 9c7fd4d..1497174 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -91,7 +91,13 @@ endif
>  # Find library version
>  OPENSBI_VERSION_MAJOR=`grep "define OPENSBI_VERSION_MAJOR" $(include_dir)/sbi/sbi_version.h | sed 's/.*MAJOR.*\([0-9][0-9]*\)/\1/'`
>  OPENSBI_VERSION_MINOR=`grep "define OPENSBI_VERSION_MINOR" $(include_dir)/sbi/sbi_version.h | sed 's/.*MINOR.*\([0-9][0-9]*\)/\1/'`
> -OPENSBI_VERSION_GIT=$(shell if [ -d $(src_dir)/.git ]; then git describe 2> /dev/null; fi)
> +OPENSBI_VERSION_GIT=
> +
> +# Detect 'git' presence before issuing 'git' commands
> +GIT_AVAIL=$(shell command -v git 2> /dev/null)
> +ifneq ($(GIT_AVAIL),)
> +OPENSBI_VERSION_GIT=$(shell git rev-parse --git-dir &> /dev/null && git describe 2> /dev/null)
> +endif
>
>  # Setup compilation commands
>  ifneq ($(LLVM),)
> --
> 2.45.2
>

