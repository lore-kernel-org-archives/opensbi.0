From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 18:53:44 +0800
Subject: [PATCH] Makefile: add rebuild
Message-ID: <20240117105403.1057264-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rebuild is useful when need a complete recompile.

Reviewed-by: Anup Patel <anup@brainfault.org>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index de4e73a..17d0a22 100644
--- a/Makefile
+++ b/Makefile
@@ -688,5 +688,9 @@ endif
 	$(if $(V), @echo " RM        $(src_dir)/cscope*")
 	$(CMD_PREFIX)rm -f $(src_dir)/cscope*
 
+# Rule for "make rebuild"
+.PHONY: rebuild
+rebuild: clean all
+
 .PHONY: FORCE
 FORCE:
-- 
2.43.0


