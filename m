From: Damien Le Moal <damien.lemoal@wdc.com>
Date: Mon,  5 Oct 2020 23:55:53 +0900
Subject: [PATCH] makefile: fix clean directive
Message-ID: <20201005145553.80557-1-damien.lemoal@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add cleaning of compiled device tree files (.dtb files).

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index cebb78e..2a352ef 100644
--- a/Makefile
+++ b/Makefile
@@ -461,6 +461,8 @@ clean:
 	$(CMD_PREFIX)find $(build_dir) -type f -name "*.elf" -exec rm -rf {} +
 	$(if $(V), @echo " RM        $(build_dir)/*.bin")
 	$(CMD_PREFIX)find $(build_dir) -type f -name "*.bin" -exec rm -rf {} +
+	$(if $(V), @echo " RM        $(build_dir)/*.dtb")
+	$(CMD_PREFIX)find $(build_dir) -type f -name "*.dtb" -exec rm -rf {} +
 
 # Rule for "make distclean"
 .PHONY: distclean
-- 
2.26.2


