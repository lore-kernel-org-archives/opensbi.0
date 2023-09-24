From: Xiang W <wxjstz@126.com>
Date: Sun, 24 Sep 2023 23:57:42 +0800
Subject: [PATCH 0/3] Sparse HART id improvements
Message-ID: <20230924155745.1753120-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Modify last_hartindex_having_scratch/hartindex_to_hartid_table
/hartindex_to_scratch_table as static variables to prevent accidental
modification and reduce memory consumption

Xiang W (3):
  lib: sbi: Refactor sbi_scratch_last_hartindex as a function
  lib: sbi: Refactor sbi_hartindex_to_hartid as a function
  lib: sbi: Refactor sbi_hartindex_to_scratch as a function

 include/sbi/sbi_scratch.h | 35 ++++++++++++-----------------------
 lib/sbi/sbi_scratch.c     | 30 ++++++++++++++++++++++++++----
 2 files changed, 38 insertions(+), 27 deletions(-)

-- 
2.40.1


