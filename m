From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 14 Mar 2025 17:30:22 +0100
Subject: [PATCH 0/2] lib: sbi_ipi: Return error for invalid hartids
Message-ID: <20250314163021.154530-4-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add sbi_hartmask_weight() and use it to check for invalid hartids
in SBI IPI. Fixes a bug found with the kvm-unit-tests SBI tests.

Andrew Jones (2):
  sbi: Introduce sbi_hartmask_weight
  lib: sbi_ipi: Return error for invalid hartids

 include/sbi/sbi_bitmap.h   | 13 +++++++++++++
 include/sbi/sbi_bitops.h   | 22 +++++++++++++++-------
 include/sbi/sbi_hartmask.h | 11 +++++++++++
 lib/sbi/sbi_ipi.c          |  9 +++++++++
 4 files changed, 48 insertions(+), 7 deletions(-)

-- 
2.48.1


