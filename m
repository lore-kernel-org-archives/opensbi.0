From: Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 11 Nov 2022 18:21:04 +0000
Subject: [PATCH v2 6/7] scripts: Add Renesas RZ/Five to platform list in the binary archive script
In-Reply-To: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221111182105.614094-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221111182105.614094-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch adds Renesas RZ/Five (R9A07G043F) SoC to RV64 platform list in
the binary archive script.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
RFC->v2
* No change
---
 scripts/create-binary-archive.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/create-binary-archive.sh b/scripts/create-binary-archive.sh
index 261a45a..28a5b2f 100755
--- a/scripts/create-binary-archive.sh
+++ b/scripts/create-binary-archive.sh
@@ -104,6 +104,7 @@ build_opensbi() {
 		BUILD_PLATFORM_SUBDIR+=("fpga/ariane")
 		BUILD_PLATFORM_SUBDIR+=("fpga/openpiton")
 		BUILD_PLATFORM_SUBDIR+=("andes/ae350")
+		BUILD_PLATFORM_SUBDIR+=("renesas/rzfive")
 		BUILD_PLATFORM_SUBDIR+=("generic")
 		;;
 	*)
-- 
2.17.1


