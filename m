From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 5 Dec 2022 10:04:00 +0800
Subject: [PATCH v2 4/4] scripts/create-binary-archive.sh: remove andes/ae350 build directory
In-Reply-To: <20221205020400.28712-1-peterlin@andestech.com>
References: <20221205020400.28712-1-peterlin@andestech.com>
Message-ID: <20221205020400.28712-5-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The andes-specific files have been moved to generic platform so we
can drop this line.

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
Changes v1 -> v2
- Add Bin Meng's review tag
---
 scripts/create-binary-archive.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
index 261a45a..4dda7b4 100755
--- a/scripts/create-binary-archive.sh
+++ b/scripts/create-binary-archive.sh
@@ -103,7 +103,6 @@ build_opensbi() {
 		BUILD_PLATFORM_SUBDIR+=("kendryte/k210")
 		BUILD_PLATFORM_SUBDIR+=("fpga/ariane")
 		BUILD_PLATFORM_SUBDIR+=("fpga/openpiton")
-		BUILD_PLATFORM_SUBDIR+=("andes/ae350")
 		BUILD_PLATFORM_SUBDIR+=("generic")
 		;;
 	*)
-- 
2.34.1


