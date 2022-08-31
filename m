From: Nikita Shubin <nikita.shubin@maquefel.me>
Date: Wed, 31 Aug 2022 10:07:13 +0300
Subject: [PATCH 1/2] docs: pmu: fix Unmatched example typo
Message-ID: <20220831070714.7540-1-nikita.shubin@maquefel.me>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bitmap for MHPMCOUNTERx should be 0x18 and not 0x0c, we check
against SBI_PMU_FIXED_CTR_MASK which assumes than first 3 bits are
dedicated to mcycle, mtime and minstret, u74 has 2 hardware counters.

Reported-by: Zhang Xin <zhangxin.xa@gmail.com>
Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>
---
 docs/pmu_support.md | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/pmu_support.md b/docs/pmu_support.md
index 8751bb5..ca6ca25 100644
--- a/docs/pmu_support.md
+++ b/docs/pmu_support.md
@@ -93,8 +93,8 @@ pmu {
  */
 pmu {
 	compatible 			= "riscv,pmu";
-	riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0xc>,
-					  <0x0 0x1 0xffffffff 0xfff800ff 0xc>,
-					  <0x0 0x2 0xffffffff 0xffffe0ff 0xc>;
+	riscv,raw-event-to-mhpmcounters = <0x0 0x0 0xffffffff 0xfc0000ff 0x18>,
+					  <0x0 0x1 0xffffffff 0xfff800ff 0x18>,
+					  <0x0 0x2 0xffffffff 0xffffe0ff 0x18>;
 };
 ```
-- 
2.35.1


