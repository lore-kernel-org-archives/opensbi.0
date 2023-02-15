From: Shengyu Qu <wiagn233@outlook.com>
Date: Thu, 16 Feb 2023 02:26:28 +0800
Subject: [PATCH] docs: fix typo in fw.md
Message-ID: <TY3P286MB2611F8A2445A0A2ADE1A843498A39@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In docs/firmware/fw.md, there's a configuration parameter called
FW_TEXT_ADDR, which actually should be FW_TEXT_START, so fix it.

Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
---
 docs/firmware/fw.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index 18faaa9..38351c8 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -61,7 +61,7 @@ Firmware Configuration and Compilation
 All firmware types support the following common compile time configuration
 parameters:
 
-* **FW_TEXT_ADDR** - Defines the execution address of the OpenSBI firmware.
+* **FW_TEXT_START** - Defines the execution address of the OpenSBI firmware.
   This configuration parameter is mandatory.
 * **FW_FDT_PATH** - Path to an external flattened device tree binary file to
   be embedded in the *.rodata* section of the final firmware. If this option
-- 
2.25.1


