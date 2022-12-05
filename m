From: Yu Chien Peter Lin <peterlin@andestech.com>
Date: Mon, 5 Dec 2022 10:03:59 +0800
Subject: [PATCH v2 3/4] docs: andes-ae350.md: fix watchdog nodename in dts example
In-Reply-To: <20221205020400.28712-1-peterlin@andestech.com>
References: <20221205020400.28712-1-peterlin@andestech.com>
Message-ID: <20221205020400.28712-4-peterlin@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The example should use watchdog as nodename instead of wdt.
This is defined in watchdog common schemas:
https://github.com/torvalds/linux/blob/v6.0/Documentation/devicetree/bindings/watchdog/watchdog.yaml#L19

Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
Reviewed-by: Bin Meng <bmeng@tinylab.org>
---
Changes v1 -> v2
- Add Bin Meng's review tag
---
 docs/platform/andes-ae350.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/platform/andes-ae350.md b/docs/platform/andes-ae350.md
index 4739951..8fc8ec6 100644
--- a/docs/platform/andes-ae350.md
+++ b/docs/platform/andes-ae350.md
@@ -178,7 +178,7 @@ DTS Example: (Quad-core AX45MP)
 			                        &CPU3_intc 7 >;
 		};
 
-		wdt: wdt at f0500000 {
+		wdt: watchdog at f0500000 {
 			compatible = "andestech,atcwdt200";
 			reg = <0x00000000 0xf0500000 0x00000000 0x00001000>;
 			interrupts = <3 4>;
-- 
2.34.1


