From: Xiang W <wxjstz@126.com>
Date: Wed, 17 Jan 2024 18:57:44 +0800
Subject: [PATCH v2] Makefile: add rebuild
Message-ID: <20240117105843.1058338-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rebuild is useful when need a complete recompile.

Signed-off-by: Xiang W <wxjstz@126.com>
---

v2 changes
- Add Sob remove wrong Reviewed-by

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


