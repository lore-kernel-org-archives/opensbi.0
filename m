From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 29 Jul 2023 17:47:40 +0800
Subject: [RFC PATCH] gitignore: allow gitignore to ignore most dot file
Message-ID: <IA1PR20MB495312A830387CB43CF96A60BB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Nowdays, most of the editor use files or directories begin with dot to
store some settings. So let git ignore these files and directories to
reduce potential mistakes.

Add dot match to ignore any editor file and there are two exceptions:
- .gitignore
- .clang-format

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
Note:
1. AFAIK, the vim swap file is also begin with dot.
2. the patch also covers the patch `gitignore: add VSCode workspace dir`
so that patch is not needed anymore.
---
 .gitignore | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index c11afd3..fbba52e 100644
--- a/.gitignore
+++ b/.gitignore
@@ -1,3 +1,10 @@
+# ignore anything begin with dot
+.*
+
+# exceptions we need even begin with dot
+!.clang-format
+!.gitignore
+
 # Object files
 *.o
 *.a
@@ -10,4 +17,3 @@ install/
 # Development friendly files
 tags
 cscope*
-*.swp
--
2.41.0


