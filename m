From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 Oct 2020 09:22:01 +0530
Subject: [PATCH] Makefile: Don't specify mabi or march
In-Reply-To: <20201019224108.99481-1-alistair.francis@wdc.com>
References: <20201019224108.99481-1-alistair.francis@wdc.com>
Message-ID: <CAAhSdy0nB1ydfPznXrS2UnhuZFGK6p01-H5LBkZkD+2Ce7b5Kw@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 20, 2020 at 4:22 AM Alistair Francis
<alistair.francis@wdc.com> wrote:
>
> To avoid
>     can't link double-float modules with soft-float modules
> errors when building 32-bit openSBI don't specify mabi or march.

We have a lot of users (including me) who use multilib toolchain to compile
OpenSBI for desired mabi and march. In fact, I have one common toolchain
for ilp32, ilp32d, lp64, and lp64d.

By removing "-mabi" and "-march", we are enforcing users to depend on
default mabi and march of toolchain. This means we can't use multilib
toolchain for OpenSBI.

I would suggest to add a separate makefile option (e.g.
PLATFORM_USE_TOOLCHAIN_MABI, PLATFORM_USE_TOOLCHAIN_MARCH)
which when enabled will skip specifying "-mabi" and "-march" in various
compiler/assembler/linker flags.

Regards,
Anup

>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index a231881..3f819d9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -196,7 +196,6 @@ GENFLAGS    +=      $(firmware-genflags-y)
>  CFLAGS         =       -g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
>  CFLAGS         +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  CFLAGS         +=      -mno-save-restore -mstrict-align
> -CFLAGS         +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  CFLAGS         +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  CFLAGS         +=      $(GENFLAGS)
>  CFLAGS         +=      $(platform-cflags-y)
> @@ -210,7 +209,6 @@ CPPFLAGS    +=      $(firmware-cppflags-y)
>  ASFLAGS                =       -g -Wall -nostdlib -D__ASSEMBLY__
>  ASFLAGS                +=      -fno-omit-frame-pointer -fno-optimize-sibling-calls
>  ASFLAGS                +=      -mno-save-restore -mstrict-align
> -ASFLAGS                +=      -mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
>  ASFLAGS                +=      -mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
>  ASFLAGS                +=      $(GENFLAGS)
>  ASFLAGS                +=      $(platform-asflags-y)
> --
> 2.28.0
>
>
> --
> opensbi mailing list
> opensbi at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/opensbi

