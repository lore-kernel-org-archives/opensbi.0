From: Samuel Holland <samuel.holland@sifive.com>
Date: Thu, 13 Feb 2025 14:48:38 -0800
Subject: [PATCH 1/2] lib: utils/fdt: Remove redundant PMU property length checks
Message-ID: <20250213225024.3586544-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If a property value is too small, len will be zero after the division
on the next line, so the property will be ignored. This is the same
behavior as when the length check fails. Furthermore, the first two
length checks were already ineffectual, because each item in those
arrays is 12 bytes long, not 8.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/utils/fdt/fdt_pmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/utils/fdt/fdt_pmu.c b/lib/utils/fdt/fdt_pmu.c
index 64de569e..22760603 100644
--- a/lib/utils/fdt/fdt_pmu.c
+++ b/lib/utils/fdt/fdt_pmu.c
@@ -74,7 +74,7 @@ int fdt_pmu_setup(const void *fdt)
 
 	event_ctr_map = fdt_getprop(fdt, pmu_offset,
 				    "riscv,event-to-mhpmcounters", &len);
-	if (event_ctr_map && len >= 8) {
+	if (event_ctr_map) {
 		len = len / (sizeof(u32) * 3);
 		for (i = 0; i < len; i++) {
 			event_idx_start = fdt32_to_cpu(event_ctr_map[3 * i]);
@@ -89,7 +89,7 @@ int fdt_pmu_setup(const void *fdt)
 
 	event_val = fdt_getprop(fdt, pmu_offset,
 				"riscv,event-to-mhpmevent", &len);
-	if (event_val && len >= 8) {
+	if (event_val) {
 		len = len / (sizeof(u32) * 3);
 		for (i = 0; i < len; i++) {
 			event = &fdt_pmu_evt_select[hw_event_count];
@@ -103,7 +103,7 @@ int fdt_pmu_setup(const void *fdt)
 
 	event_val = fdt_getprop(fdt, pmu_offset,
 				"riscv,raw-event-to-mhpmcounters", &len);
-	if (event_val && len >= 20) {
+	if (event_val) {
 		len = len / (sizeof(u32) * 5);
 		for (i = 0; i < len; i++) {
 			raw_selector = fdt32_to_cpu(event_val[5 * i]);
-- 
2.47.0


