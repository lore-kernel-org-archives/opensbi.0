From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 May 2023 11:34:39 +0200
Subject: [PATCH v5 0/7] lib: sbi: Ensure SBI extension is available
Message-ID: <20230515093446.73123-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure attempts to invoke SBI extension functions fail with
SBI_ERR_NOT_SUPPORTED when the extension's probe function has reported
that the extension is not available. To avoid invoking probe too
frequently, we check extension availability at init time and skip
registering them in the extension list when their probe fails. If the
probes succeed, we keep them, and then later seeing them is enough to
know they're available. Extensions which have multiple IDs may also need
to narrow their ID range or remove IDs from their range to ensure when
the IDs are seen they are valid.

To handle both the available and valid cases at init time we introduce a
new callback which gets invoked instead of just registering the
extensions. We then modify the callbacks for probing and narrowing as
necessary. Additionally, considering the Base extension probe function
already knows how to set out_val to 1 for available extensions, we simply
remove all the probe functions, as now they must all succeed and none of
them return anything other than 1 on success.

v5:
  Another rework where I finally take Anup's advice that he gave on
  the initial posting and more or less replace probe with a new
  init callback.

v4:
  Almost a total redesign. Patch1 of the v4 (now series) does keep
  hunk 2 of the v3 patch, but the changes to sbi_ecall_find_extension()
  of the v3 patch have been dropped. Instead multi-ID extensions can
  now make use of a new extension callback (Patch2) which gets invoked
  at init time. This new callback has been applied to vendor extensions
  with Patch3.

v3: http://lists.infradead.org/pipermail/opensbi/2023-May/004894.html

Andrew Jones (6):
  lib: sbi: Introduce register_extensions extension callback
  lib: sbi: Narrow vendor extension range
  lib: sbi: pmu: Remove unnecessary probe function
  lib: sbi: Only register available extensions
  lib: sbi: Remove 0/1 probe implementations
  lib: sbi: Document sbi_ecall_extension members

Xiang W (1):
  lib: sbi: Optimize probe of srst/susp

 include/sbi/sbi_ecall.h    | 36 ++++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall.c        |  5 ++++-
 lib/sbi/sbi_ecall_base.c   | 14 +++++++++++---
 lib/sbi/sbi_ecall_cppc.c   | 18 +++++++++++-------
 lib/sbi/sbi_ecall_dbcn.c   | 18 +++++++++++-------
 lib/sbi/sbi_ecall_hsm.c    | 14 +++++++++++---
 lib/sbi/sbi_ecall_ipi.c    | 14 +++++++++++---
 lib/sbi/sbi_ecall_legacy.c | 14 +++++++++++---
 lib/sbi/sbi_ecall_pmu.c    | 16 ++++++++--------
 lib/sbi/sbi_ecall_rfence.c | 14 +++++++++++---
 lib/sbi/sbi_ecall_srst.c   | 28 ++++++++++++++++++----------
 lib/sbi/sbi_ecall_susp.c   | 27 ++++++++++++++++++---------
 lib/sbi/sbi_ecall_time.c   | 14 +++++++++++---
 lib/sbi/sbi_ecall_vendor.c | 37 ++++++++++++++++++++-----------------
 14 files changed, 192 insertions(+), 77 deletions(-)

-- 
2.40.0


