From: Hoa Nguyen <hn@hnpl.org>
Date: Sun, 24 Sep 2023 14:48:23 -0700
Subject: [PATCH] doc: Fix fw_payload.md
Message-ID: <20230924214823.2789366-1-hn@hnpl.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The base of .text is defined by `FW_TEXT_START`, not `FW_TEXT_BASE`.

Signed-off-by: Hoa Nguyen <hn@hnpl.org>
---
 docs/firmware/fw_payload.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
index 3d50ddc..113604a 100644
--- a/docs/firmware/fw_payload.md
+++ b/docs/firmware/fw_payload.md
@@ -36,7 +36,7 @@ options. These configuration parameters can be defined using either the top
 level `make` command line or the target platform *objects.mk* configuration
 file. The parameters currently defined are as follows:
 
-* **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_BASE* where the payload binary
+* **FW_PAYLOAD_OFFSET** - Offset from *FW_TEXT_START* where the payload binary
   will be linked in the final *FW_PAYLOAD* firmware binary image. This
   configuration parameter is mandatory if *FW_PAYLOAD_ALIGN* is not defined.
   Compilation errors will result from an incorrect definition of
-- 
2.25.1


