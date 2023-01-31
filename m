From: Xiang W <wxjstz@126.com>
Date: Tue, 31 Jan 2023 17:20:05 +0800
Subject: [PATCH 0/3] Miscellaneous about sbi_tlb and sbi_ipi
Message-ID: <20230131092008.51078-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Removed the mutual waiting between process and sync in sbi_tlb
Update ipi first then wait together

Xiang W (3):
  lib: sbi: Optimize sbi_tlb
  lib: sbi: Optimize sbi_ipi
  lib: sbi: rename function of sbi_ipi

 lib/sbi/sbi_ipi.c | 41 ++++++++++++++++++++++++++++++++++++-----
 lib/sbi/sbi_tlb.c | 43 ++++++++++++++++++++-----------------------
 2 files changed, 56 insertions(+), 28 deletions(-)

-- 
2.39.0


