From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 23 Jun 2020 02:56:51 -0700
Subject: [PATCH 2/3] config.mk: Update QEMU run command for generic and sifive
 fu540 platforms
In-Reply-To: <1592906212-13711-1-git-send-email-bmeng.cn@gmail.com>
References: <1592906212-13711-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <1592906212-13711-2-git-send-email-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bin Meng <bin.meng@windriver.com>

Since QEMU v5.1, if there is no "-bios" option provided, the default
OpenSBI firmware will be loaded by QEMU as the BIOS automatically,
hence to load fw_payload type image, we should explicitly pass the
"-bios" option to QEMU.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 platform/generic/config.mk      | 2 +-
 platform/sifive/fu540/config.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/platform/generic/config.mk b/platform/generic/config.mk
index 8d63ece..8151974 100644
--- a/platform/generic/config.mk
+++ b/platform/generic/config.mk
@@ -15,7 +15,7 @@ platform-ldflags-y =
 
 # Command for platform specific "make run"
 platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M virt -m 256M \
-  -nographic -kernel $(build_dir)/platform/generic/firmware/fw_payload.elf
+  -nographic -bios $(build_dir)/platform/generic/firmware/fw_payload.elf
 
 # Blobs to build
 FW_TEXT_START=0x80000000
diff --git a/platform/sifive/fu540/config.mk b/platform/sifive/fu540/config.mk
index e76adcd..23169b1 100644
--- a/platform/sifive/fu540/config.mk
+++ b/platform/sifive/fu540/config.mk
@@ -15,7 +15,7 @@ platform-ldflags-y =
 
 # Command for platform specific "make run"
 platform-runcmd = qemu-system-riscv$(PLATFORM_RISCV_XLEN) -M sifive_u -m 256M \
-  -nographic -kernel $(build_dir)/platform/sifive/fu540/firmware/fw_payload.elf
+  -nographic -bios $(build_dir)/platform/sifive/fu540/firmware/fw_payload.elf
 
 # Blobs to build
 FW_TEXT_START=0x80000000
-- 
2.7.4


