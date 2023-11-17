From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 17 Nov 2023 14:59:31 +0100
Subject: [PATCH 1/1] lib: sbi_pmu: avoid buffer overflow
Message-ID: <20231117135931.26666-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

total_ctrs is bounded by

    SBI_PMU_FW_CTR_MAX + SBI_PMU_HW_CTR_MAX) == 48

which exceeds BITS_PER_LONG on 32 bit systems.

Iterating over the bits of &cmask results in a buffer overflow when looking
for a bit >= BITS_PER_LONG.

Adjust the iterators in sbi_pmu_ctr_start() and sbi_pmu_ctr_stop()
accordingly.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_pmu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index f4c8fc4..185068b 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -445,7 +445,7 @@ int sbi_pmu_ctr_start(unsigned long cbase, unsigned long cmask,
 	if (flags & SBI_PMU_START_FLAG_SET_INIT_VALUE)
 		bUpdate = true;
 
-	for_each_set_bit(i, &cmask, total_ctrs) {
+	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
 		cidx = i + cbase;
 		event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 		if (event_idx_type < 0)
@@ -540,7 +540,7 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 	if ((cbase + sbi_fls(cmask)) >= total_ctrs)
 		return SBI_EINVAL;
 
-	for_each_set_bit(i, &cmask, total_ctrs) {
+	for_each_set_bit(i, &cmask, BITS_PER_LONG) {
 		cidx = i + cbase;
 		event_idx_type = pmu_ctr_validate(phs, cidx, &event_code);
 		if (event_idx_type < 0)
-- 
2.40.1


