From: Prabhakar <prabhakar.csengg@gmail.com>
Date: Fri, 28 Oct 2022 01:40:41 +0100
Subject: [PATCH RFC 6/7] scripts: Add Renesas RZ/Five to platform list in the binary archive script
In-Reply-To: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028004042.135549-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Message-ID: <20221028004042.135549-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

This patch adds Renesas RZ/Five to RV64 platform list in the binary
archive script.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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


