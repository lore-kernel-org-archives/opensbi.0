From: Xiang W <wxjstz@126.com>
Date: Tue, 23 Apr 2024 22:51:38 +0800
Subject: [PATCH 0/5] miscellaneous about sbi_dtbr
Message-ID: <20240423145147.391425-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xiang W (5):
  lib: sbi: fix hart_shmem_base
  lib: sbi: Remove unnecessary sbi_dbtr_shmem_disabled
  lib: sbi: Removal unnecessary check dbtr_thishart_state_ptr
  lib: sbi: fix DBTR_SHMEM_MAKE_PHYS for RV64
  lib: sbi: Fixed memory permission check in sbi_dbtr_setup_shmem

 lib/sbi/sbi_dbtr.c | 40 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

-- 
2.43.0


