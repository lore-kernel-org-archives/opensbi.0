From: dskwelmcy@163.com <dskwelmcy@163.com>
Date: Wed, 25 Nov 2020 23:13:19 +0800
Subject: [PATCH] docs: fix a typo error
Message-ID: <20201125151319.20633-1-dskwelmcy@163.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yuan Li <dskwelmcy@163.com>

fix a typo error in docs/platform/sifive_fu540.md

Signed-off-by: Yuan Li <dskwelmcy@163.com>
---
 docs/platform/sifive_fu540.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/platform/sifive_fu540.md b/docs/platform/sifive_fu540.md
index c9513eb..b4d3c60 100644
--- a/docs/platform/sifive_fu540.md
+++ b/docs/platform/sifive_fu540.md
@@ -27,7 +27,7 @@ U-Boot v2020.01 (or higher) should be used.
 The HiFive Unleashed device tree(DT) is merged in Linux v5.2 release. This
 DT (device tree) is not backward compatible with the DT passed from FSBL.
 
-To use Linux v5.2 (or higher, the pre-built DTB (DT binary) from Linux v5.2
+To use Linux v5.2 (or higher), the pre-built DTB (DT binary) from Linux v5.2
 (or higher) should be used to build SiFive FU540 OpenSBI binaries by using
 the compile time option *FW_FDT_PATH*.
 
-- 
2.17.1



