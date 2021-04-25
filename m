From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Apr 2021 10:32:49 +0530
Subject: [PATCH] platform: generic: Enable FW_PIC=y as default
In-Reply-To: <1619163440-93918-1-git-send-email-guoren@kernel.org>
References: <1619163440-93918-1-git-send-email-guoren@kernel.org>
Message-ID: <CAAhSdy2a=VX_jZmaDyuFOr0a1wyzXaeQCo8GiOEU4M6ECJxsBg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 23, 2021 at 1:08 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Tested with qemu_rv32 & rv64, T-HEAD all hardwares. I think it's
> time to enable it as default.
>
> Thx Vincent's commit: 0f20e8adcf42
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Tested-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Anup Patel <anup.patel@wdc.com>
> Cc: Vincent Chen <vincent.chen@sifive.com>

Enabling FW_PIC by default only for generic platform breaks the
compilation binary tarball using scripts/create-binary-archive.sh

I would suggest to have it globally enabled by default using
below change. The platform support or users can explicitly
disable it using "FW_PIC=n" in make command-line.

diff --git a/firmware/objects.mk b/firmware/objects.mk
index c1f632e..ce91c2f 100644
--- a/firmware/objects.mk
+++ b/firmware/objects.mk
@@ -13,6 +13,10 @@ firmware-cflags-y +=
 firmware-asflags-y +=
 firmware-ldflags-y +=

+ifndef FW_PIC
+FW_PIC := y
+endif
+
 ifeq ($(FW_PIC),y)
 firmware-genflags-y += -DFW_PIC
 firmware-asflags-y  += -fpic

Regards,
Anup

> ---
>  platform/generic/config.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/platform/generic/config.mk b/platform/generic/config.mk
> index 8151974..61015a0 100644
> --- a/platform/generic/config.mk
> +++ b/platform/generic/config.mk
> @@ -21,6 +21,7 @@ platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
>  FW_TEXT_START=0x80000000
>  FW_DYNAMIC=y
>  FW_JUMP=y
> +FW_PIC=y
>  ifeq ($(PLATFORM_RISCV_XLEN), 32)
>    # This needs to be 4MB aligned for 32-bit system
>    FW_JUMP_ADDR=$(shell printf "0x%X" $$(($(FW_TEXT_START) + 0x400000)))
> --
> 2.7.4
>

