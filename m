From: pyjmstr@gmail.com <pyjmstr@gmail.com>
Date: Tue, 18 Oct 2022 20:58:37 +0800
Subject: [PATCH] docs: update docs/firmware/fw_payload.md
Message-ID: <20221018125837.10799-1-pyjmstr@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yangjie Zhang <pyjmstr@gmail.com>

Update the document.

Signed-off-by: Yangjie Zhang <pyjmstr@gmail.com>
---
 docs/firmware/fw_payload.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/firmware/fw_payload.md b/docs/firmware/fw_payload.md
index 3bb918f..3d50ddc 100644
--- a/docs/firmware/fw_payload.md
+++ b/docs/firmware/fw_payload.md
@@ -12,7 +12,7 @@ firmware and the booting stage to follow OpenSBI firmware.
 A *FW_PAYLOAD* firmware is also useful for cases where the booting stage prior
 to the OpenSBI firmware does not pass a *flattened device tree (FDT file)*. In
 such a case, a *FW_PAYLOAD* firmware allows embedding a flattened device tree
-in the .text section of the final firmware.
+in the .rodata section of the final firmware.
 
 Enabling *FW_PAYLOAD* compilation
 ---------------------------------
-- 
2.34.1


