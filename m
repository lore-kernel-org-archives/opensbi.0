From: Inochi Amaoto <inochiama@outlook.com>
Date: Thu, 11 Jan 2024 08:34:41 +0800
Subject: [RFC PATCH v2 0/2] lib: sbi_pmu: Add PMU snapshot extension
Message-ID: <IA1PR20MB4953A6BEE8F94F7287527A9FBB682@IA1PR20MB4953.namprd20.prod.outlook.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Although PMU snapshot extension is not very useful for normal use,
it can provide a recoverable snapshot for PMU system. It is useful
for KVM VMs, especially for VM snapshot.

Add the PMU snapshot function.

Changed from RFC v1:
1. fix wrong function in sbi_shm header.

Inochi Amaoto (2):
  lib: sbi: Add shared memory region support
  lib: sbi_pmu: Add PMU snapshot implementation

 include/sbi/sbi_bitops.h |   3 +
 include/sbi/sbi_pmu.h    |   4 ++
 include/sbi/sbi_shm.h    | 129 +++++++++++++++++++++++++++++++++++
 lib/sbi/objects.mk       |   1 +
 lib/sbi/sbi_ecall_pmu.c  |   3 +-
 lib/sbi/sbi_pmu.c        | 143 +++++++++++++++++++++++++++++++++++++--
 lib/sbi/sbi_shm.c        | 114 +++++++++++++++++++++++++++++++
 7 files changed, 390 insertions(+), 7 deletions(-)
 create mode 100644 include/sbi/sbi_shm.h
 create mode 100644 lib/sbi/sbi_shm.c

--
2.43.0


