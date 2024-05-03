From: Xiang W <wxjstz@126.com>
Date: Fri,  3 May 2024 21:53:32 +0800
Subject: [PATCH v3 0/6] miscellaneous about sbi_dtbr
Message-ID: <20240503135340.310030-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2 changes:
- fix shmem_base checking in PATCH2

Xiang W (6):
  lib: sbi: fix hart_shmem_base
  lib: sbi: Removal unnecessary check dbtr_thishart_state_ptr
  lib: sbi: fix DBTR_SHMEM_MAKE_PHYS for RV64
  lib: sbi: Fixed memory permission check in sbi_dbtr_setup_shmem
  lib: sbi: fix return type of sbi_dbtr_shmem_disabled
  lib: sbi: simplify inline function in sbi_dtbr.c

 lib/sbi/sbi_dbtr.c | 97 +++++++++++++++++-----------------------------
 1 file changed, 36 insertions(+), 61 deletions(-)

-- 
2.43.0


