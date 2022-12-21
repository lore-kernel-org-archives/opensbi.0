From: Conor Dooley <conor@kernel.org>
Date: Wed, 21 Dec 2022 13:59:40 +0000
Subject: [PATCH v1] docs: pmu: fix binding example
Message-ID: <20221221135939.266377-1-conor@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Conor Dooley <conor.dooley@microchip.com>

The first PMU binding example does not terminate properties with a ;,
which is invalid. Noticed while converting the binding to yaml.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 docs/pmu_support.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/pmu_support.md b/docs/pmu_support.md
index 1db36fc..1a16bad 100644
--- a/docs/pmu_support.md
+++ b/docs/pmu_support.md
@@ -70,17 +70,17 @@ via platform hooks rather than the device tree.
 ```
 pmu {
 	compatible 			= "riscv,pmu";
-	riscv,event-to-mhpmevent 		= <0x0000B  0x0000 0x0001>,
+	riscv,event-to-mhpmevent 		= <0x0000B  0x0000 0x0001>;
 	riscv,event-to-mhpmcounters 	= <0x00001 0x00001 0x00000001>,
 						  <0x00002 0x00002 0x00000004>,
 						  <0x00003 0x0000A 0x00000ff8>,
-						  <0x10000 0x10033 0x000ff000>,
+						  <0x10000 0x10033 0x000ff000>;
 					/* For event ID 0x0002 */
 	riscv,raw-event-to-mhpmcounters = <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
 					/* For event ID 0-4 */
 					<0x0 0x0 0xffffffff 0xfffffff0 0x00000ff0>,
 					/* For event ID 0xffffffff0000000f - 0xffffffff000000ff */
-					<0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>,
+					<0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>;
 };
 ```
 
-- 
2.38.1


