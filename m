From: Anup Patel <anup@brainfault.org>
Date: Wed, 1 Mar 2023 09:30:02 +0530
Subject: [PATCH] make: Add a command line option for debugging OpenSBI
In-Reply-To: <20230227023506.1818620-1-bmeng@tinylab.org>
References: <20230227023506.1818620-1-bmeng@tinylab.org>
Message-ID: <CAAhSdy2BhBHz6zA=Ni5YScQ21noxyn-HzygCd+om4OpsxjSUJQ@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Feb 27, 2023 at 8:05 AM Bin Meng <bmeng@tinylab.org> wrote:
>
> Add a new make command line option "make DEBUG=1" to prevent compiler
> optimizations using -O2.
>
> Signed-off-by: Bin Meng <bmeng@tinylab.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Applied this patch to the riscv/opensbi repo.

Thanks,
Anup

> ---
>
>  Makefile  |  7 ++++++-
>  README.md | 13 +++++++++++++
>  2 files changed, 19 insertions(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index b20404f..a26a39b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -331,7 +331,12 @@ GENFLAGS   +=      $(libsbiutils-genflags-y)
>  GENFLAGS       +=      $(platform-genflags-y)
>  GENFLAGS       +=      $(firmware-genflags-y)
>
> -CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
> +CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing
> +ifneq ($(DEBUG),)
> +CFLAGS         +=      -O0
> +else
> +CFLAGS         +=      -O2
> +endif
>  CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls -mstrict-align
>  # enable -m(no-)save-restore option by CC_SUPPORT_SAVE_RESTORE
>  ifeq ($(CC_SUPPORT_SAVE_RESTORE),y)
> diff --git a/README.md b/README.md
> index 895bbf2..a6bcb0c 100644
> --- a/README.md
> +++ b/README.md
> @@ -298,6 +298,19 @@ NOTE: Using `BUILD_INFO=y` without specifying SOURCE_DATE_EPOCH will violate
>  purpose, and should NOT be used in a product which follows "reproducible
>  builds".
>
> +Building with optimization off for debugging
> +--------------------------------------------
> +
> +When debugging OpenSBI, we may want to turn off the compiler optimization and
> +make debugging produce the expected results for a better debugging experience.
> +To build with optimization off we can just simply add `DEBUG=1`, like:
> +```
> +make DEBUG=1
> +```
> +
> +This definition is ONLY for development and debug purpose, and should NOT be
> +used in a product build.
> +
>  Contributing to OpenSBI
>  -----------------------
>
> --
> 2.25.1
>

