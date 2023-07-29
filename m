From: Inochi Amaoto <inochiama@outlook.com>
Date: Sat, 29 Jul 2023 09:49:38 +0800
Subject: [PATCH] gitignore: add VSCode workspace dir
Message-ID: <IA1PR20MB49531FC9B5E99A58C37DD66DBB07A@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

VSCode uses .vscode dir to store workspace settings, update .gitignore to
ignore it

Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index c11afd3..69ff5f8 100644
--- a/.gitignore
+++ b/.gitignore
@@ -11,3 +11,4 @@ install/
 tags
 cscope*
 *.swp
+.vscode
-- 
2.41.0


