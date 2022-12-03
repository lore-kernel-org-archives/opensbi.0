From: Sergey Matyukevich <geomatsi@gmail.com>
Date: Sun,  4 Dec 2022 00:04:15 +0300
Subject: [PATCH 1/1] gitignore: add vim swap files
Message-ID: <20221203210415.113835-1-geomatsi@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 95692bb..c11afd3 100644
--- a/.gitignore
+++ b/.gitignore
@@ -10,3 +10,4 @@ install/
 # Development friendly files
 tags
 cscope*
+*.swp
-- 
2.38.1


