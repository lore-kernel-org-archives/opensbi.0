From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 12 Jul 2021 08:48:02 +0800
Subject: [PATCH] docs: firmware: Document FW_PIC compile time option
Message-ID: <20210712004802.23368-1-bmeng.cn@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

FW_PIC=y is on by default, but the doc is missing when this was
introduced. Add some description for it.

Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
---

 docs/firmware/fw.md | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/docs/firmware/fw.md b/docs/firmware/fw.md
index a3bb70c..db9a31c 100644
--- a/docs/firmware/fw.md
+++ b/docs/firmware/fw.md
@@ -69,6 +69,12 @@ parameters:
   argument by the prior booting stage.
 * **FW_FDT_PADDING** - Optional zero bytes padding to the embedded flattened
   device tree binary file specified by **FW_FDT_PATH** option.
+* **FW_PIC** - "FW_PIC=y" generates position independent executable firmware
+  images. OpenSBI can run at arbitrary address with appropriate alignment.
+  Therefore, the original relocation mechanism ("FW_PIC=n") will be skipped.
+  In other words, OpenSBI will directly run at the load address without any
+  code movement. This option requires a toolchain with PIE support, and it
+  is on by default.
 
 Additionally, each firmware type as a set of type specific configuration
 parameters. Detailed information for each firmware type can be found in the
-- 
2.25.1


