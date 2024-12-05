From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 04 Dec 2024 16:43:45 -0800
Subject: [PATCH 0/2] PMU related minor fixes
Message-ID: <20241204-pmu_event_info_fixes-v1-0-05c484c7345b@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These two are minor fixes for some corner cases found out during the
review. However, the previous series[1] was already merged. This series
just includes the fixes on top of main.

[1] https://lists.infradead.org/pipermail/opensbi/2024-November/007625.html

To: opensbi@lists.infradead.org
Cc: apatel at ventanamicro.com

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (2):
      lib: sbi_pmu: Fix the sanity check condition for hw event map
      lib: sbi_pmu: Verify the raw events first during event info

 lib/sbi/sbi_pmu.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)
---
base-commit: e4345842168b5725f56a81f1211d08f1a9d6c897
change-id: 20241203-pmu_event_info_fixes-a80cc3b15a67
--
Regards,
Atish patra


