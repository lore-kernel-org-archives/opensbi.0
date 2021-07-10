From: Jessica Clarke <jrtc27@jrtc27.com>
Date: Sat, 10 Jul 2021 20:27:25 +0100
Subject: [PATCH] firmware: Detect whether the toolchain supports pie and
 automatically disable the FW_PIC option
In-Reply-To: <20210710191421.164771-1-wxjstz@126.com>
References: <20210710191421.164771-1-wxjstz@126.com>
Message-ID: <D537044C-286B-45A8-A13E-11F85B8AEAE4@jrtc27.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 10 Jul 2021, at 20:14, Xiang W <wxjstz@126.com> wrote:
> 
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
> firmware/objects.mk         |  4 +++-
> scripts/toolchain-check-pie | 16 ++++++++++++++++
> 2 files changed, 19 insertions(+), 1 deletion(-)
> create mode 100755 scripts/toolchain-check-pie
> 
> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index ce91c2f..020e1a9 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -16,7 +16,9 @@ firmware-ldflags-y +=
> ifndef FW_PIC
> FW_PIC := y
> endif
> -
> +ifeq ($(FW_PIC),y)
> +FW_PIC := $(shell scripts/toolchain-check-pie $(CC))
> +endif

Why are you making this so complicated? Your previous version was fine
with -x c added, albeit with one issue I didn?t bring up.

In my opinion, whether or not the toolchain supports PIEs should
determine the default value for FW_PIC, but FW_PIC=y should force it on
rather than silently produce a PDE, and thus result in the expected
toolchain error if it doesn?t in fact work. That also allows people to
work around any broken auto-detection logic.

But regardless:

> ifeq ($(FW_PIC),y)
> firmware-genflags-y +=	-DFW_PIC
> firmware-asflags-y  +=	-fpic
> diff --git a/scripts/toolchain-check-pie b/scripts/toolchain-check-pie
> new file mode 100755
> index 0000000..14ad6d1
> --- /dev/null
> +++ b/scripts/toolchain-check-pie
> @@ -0,0 +1,16 @@
> +#! /bin/bash

No space after shebang. Plain sh should suffice for this script (use ``
not $()).

Use set -e/-u?

> +
> +CC=$1

This is short-sighted, this script will need to take -target and
-fuse-ld options once Clang and LLD support lands. Just remove this
variable and use ?$@? in place of ${CC} below.

> +f=$(mktemp)

Backticks so plain sh works.

> +mv ${f} ${f}.s
> +
> +cat << EOF >${f}.s
> +	.section .entry, "ax", %progbits
> +	.align 3
> +	.globl _start
> +_start:
> +    j   _start

Tabs not spaces (both indentation and separator).

> +EOF
> +
> +${CC}  -nostdlib -fPIE -Wl,-pie ${f}.s -o /dev/null 2>/dev/null && echo y || echo n

Why not just use a pipe? You don?t need a file.

Having the script exit with zero vs non-zero would also be more
conventional, with the echo y/n in the Makefile.

> +rm ${f}.s
> \ No newline at end of file

Newline.

Jess


