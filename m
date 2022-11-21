From: KaDiWa <kalle.wachsmuth@gmail.com>
Date: Mon, 21 Nov 2022 16:59:05 +0100
Subject: [PATCH] Makefile: replace `echo` with `printf` for compatibility
Message-ID: <20221121155905.48577-1-kalle.wachsmuth@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I don't know why but `echo -n` didn't work for me. macOS supports the `-n` option but it doesn't work in the makefile. What it does instead is it literally writes `-n` to the file and then also
leaves a newline at the end.

I'm using GNU Make 4.4 (`gmake` from Homebrew).

Signed-off-by: KaDiWa <kalle.wachsmuth@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8db6eab..98e42fc 100644
--- a/Makefile
+++ b/Makefile
@@ -224,7 +224,7 @@ $(KCONFIG_CONFIG): $(platform_src_dir)/configs/$(PLATFORM_DEFCONFIG) $(platform_
 
 $(KCONFIG_AUTOCMD): $(KCONFIG_CONFIG)
 	$(CMD_PREFIX)mkdir -p $(KCONFIG_DIR)
-	$(CMD_PREFIX)echo -n "$(KCONFIG_CONFIG): " > $(KCONFIG_AUTOCMD)
+	$(CMD_PREFIX)printf "%s: " $(KCONFIG_CONFIG) > $(KCONFIG_AUTOCMD)
 	$(CMD_PREFIX)cat $(KCONFIG_AUTOLIST) | tr '\n' ' ' >> $(KCONFIG_AUTOCMD)
 
 include $(KCONFIG_CONFIG)
-- 
2.37.1 (Apple Git-137.1)


