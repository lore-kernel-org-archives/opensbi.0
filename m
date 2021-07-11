From: Bin Meng <bmeng.cn@gmail.com>
Date: Sun, 11 Jul 2021 09:56:40 +0800
Subject: [PATCH] firmware: Detect whether the toolchain supports pie and
 automatically disable the FW_PIC option
In-Reply-To: <20210710202710.192820-1-wxjstz@126.com>
References: <20210710202710.192820-1-wxjstz@126.com>
Message-ID: <CAEUhbmUiEh8JKyH6N0Cpbvm1OUyJa4d+eKZG-+rG6UojMNZRmg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, Jul 11, 2021 at 4:27 AM Xiang W <wxjstz@126.com> wrote:

Please write something in the commit message to explain why are we doing this.

>
> Signed-off-by: Xiang W <wxjstz@126.com>
> ---
>  firmware/objects.mk         | 4 +++-
>  scripts/toolchain-check-pie | 7 +++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/toolchain-check-pie
>

Please append a patch version in the email title. This way it's easy
to know which patch is the latest version.

> diff --git a/firmware/objects.mk b/firmware/objects.mk
> index ce91c2f..020e1a9 100644
> --- a/firmware/objects.mk
> +++ b/firmware/objects.mk
> @@ -16,7 +16,9 @@ firmware-ldflags-y +=
>  ifndef FW_PIC
>  FW_PIC := y
>  endif
> -
> +ifeq ($(FW_PIC),y)
> +FW_PIC := $(shell scripts/toolchain-check-pie $(CC))
> +endif
>  ifeq ($(FW_PIC),y)
>  firmware-genflags-y += -DFW_PIC
>  firmware-asflags-y  += -fpic
> diff --git a/scripts/toolchain-check-pie b/scripts/toolchain-check-pie
> new file mode 100755
> index 0000000..779c0ee
> --- /dev/null
> +++ b/scripts/toolchain-check-pie
> @@ -0,0 +1,7 @@
> +#! /bin/bash
> +
> +if ${1} --version | head -n 1 | grep clang 2>&1 >/dev/null; then
> +       echo void _start\(\) \{\} | ${1} --target=riscv64 -fuse-ld=lld -mno-relax -nostdlib -fPIE -Wl,-pie -xc - -o /dev/null 2>/dev/null && echo y || echo n
> +else
> +       echo void _start\(\) \{\} | ${1} -nostdlib -fPIE -Wl,-pie -xc - -o /dev/null 2>/dev/null && echo y || echo n
> +fi

Regards,
Bin

