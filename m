From: pyjmstr@gmail.com <pyjmstr@gmail.com>
Date: Thu, 20 Oct 2022 22:41:08 +0800
Subject: [PATCH] docs/firmware: update the document
Message-ID: <20221020144108.4034-1-pyjmstr@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Yangjie Zhang <pyjmstr@gmail.com>

Since
commit 9c07c513aa9b ("firmware:Remove FW_PAYLOAD_FDT_PATH compile-time option"),
the section where FDT would be embedded in has changed from *.text* to *.rodata*,
but some places in fw_payload.md and fw.md are still *.text*.
This patch updates the document.

Signed-off-by: Yangjie Zhang <pyjmstr@gmail.com>
---
 docs/firmware/fw.md         | 2 +-
 docs/firmware/fw_payload.md | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index 5a67848..18faaa9 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -53,7 +53,7 @@ the booting stage to follow OpenSBI firmware.
 A *FW_PAYLOAD* firmware is also useful for cases where the booting stage prior
 to OpenSBI firmware does not pass a *flattened device tree (FDT file)*. In such
 case, a *FW_PAYLOAD* firmware allows embedding a flattened device tree in the
-.text section of the final firmware.
+.rodata section of the final firmware.
 
 Firmware Configuration and Compilation
 --------------------------------------
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


