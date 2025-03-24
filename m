From: Leo Yu-Chi Liang <ycliang@andestech.com>
Date: Mon, 24 Mar 2025 12:39:43 +0800
Subject: [PATCH 1/1] docs: pmu_support: fix example typos
Message-ID: <20250324043943.2513070-1-ycliang@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The (event ID & "second column mask") should equal
the "first column match value". Modify the example
to fit the description.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
---
 docs/pmu_support.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/docs/pmu_support.md b/docs/pmu_support.md
index 9b48f1e..b552e67 100644
--- a/docs/pmu_support.md
+++ b/docs/pmu_support.md
@@ -74,10 +74,10 @@ pmu {
 						  <0x10000 0x10033 0x000ff000>;
 					/* For event ID 0x0002 */
 	riscv,raw-event-to-mhpmcounters = <0x0000 0x0002 0xffffffff 0xffffffff 0x00000f8>,
-					/* For event ID 0-4 */
+					/* For event ID 0-15 */
 					<0x0 0x0 0xffffffff 0xfffffff0 0x00000ff0>,
 					/* For event ID 0xffffffff0000000f - 0xffffffff000000ff */
-					<0xffffffff 0x0 0xffffffff 0xffffff0f 0x00000ff0>;
+					<0xffffffff 0xf 0xffffffff 0xffffff0f 0x00000ff0>;
 };
 ```
 
-- 
2.34.1


