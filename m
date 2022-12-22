From: Conor Dooley <conor@kernel.org>
Date: Thu, 22 Dec 2022 19:39:14 +0000
Subject: [PATCH v1] docs: pmu: update a reference to a deprecated property name
Message-ID: <20221222193913.223114-1-conor@kernel.org>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Conor Dooley <conor.dooley@microchip.com>

event-to-mhpmevent was deprecated and replaced by
riscv,event-to-mhpmevent, but a reference remains to the old name.
Replace it with the new one.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 docs/pmu_support.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/pmu_support.md b/docs/pmu_support.md
index 1a16bad..9c79636 100644
--- a/docs/pmu_support.md
+++ b/docs/pmu_support.md
@@ -46,7 +46,7 @@ a table format where each row represents a certain range of events and
 corresponding counters. The first column represents starting of the pmu event id
 and 2nd column represents the end of the pmu event id. The third column
 represent a bitmap of all the MHPMCOUNTERx. This property is mandatory if
-event-to-mhpmevent is present. Otherwise, it can be omitted. This property
+riscv,event-to-mhpmevent is present. Otherwise, it can be omitted. This property
 shouldn't encode any raw event.
 
 * **riscv,raw-event-to-mhpmcounters**(Optional) - It represents an ONE-to-MANY
-- 
2.38.1


