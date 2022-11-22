From: Alejandro Cabrera Aldaya <aldaya@gmail.com>
Date: Tue, 22 Nov 2022 12:28:25 +0200
Subject: [PATCH] Makefile: bugfix for handling platform paths
Message-ID: <20221122102825.88440-1-aldaya@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the path where this repo is located contains the platform name on it,
the original Makefile replaced its occurrences from the path making it an invalid path.
This commit prevents this behavior replacing only the last part of the path as intended.

Signed-off-by: Alejandro Cabrera Aldaya <aldaya@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8db6eab..32d4c48 100644
--- a/Makefile
+++ b/Makefile
@@ -47,7 +47,7 @@ ifdef PLATFORM_DIR
     platform_parent_dir=$(platform_dir_path)
   else
     PLATFORM=$(shell basename $(platform_dir_path))
-    platform_parent_dir=$(subst $(PLATFORM),,$(platform_dir_path))
+    platform_parent_dir=$(shell dirname $(shell realpath $(platform_dir_path)))    
   endif
 else
  platform_parent_dir=$(src_dir)/platform
-- 
2.34.1


