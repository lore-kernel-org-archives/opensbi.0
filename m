From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Thu,  7 Sep 2023 09:27:25 +0000
Subject: [PATCH 0/4] Add Svadu extension support
Message-ID: <20230907092729.11200-1-yongxuan.wang@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series enables Svadu extension support by configuring the menvcfg
CSR and, if available, displays the Svadu extension in the boot log. 

Additionally, we've made some programming improvements in
lib/sbi/sbi_hart.c.

Yong-Xuan Wang (4):
  lib: sbi: refactor the code for enable extensions in menvfg CSR
  lib: sbi: Add support for Svadu extension
  lib: sbi: Improve the code of privilege mode and extensions detection
  lib: sbi: detect extensions from menvcfg

 include/sbi/riscv_encoding.h |   6 +-
 include/sbi/sbi_hart.h       |   8 ++
 lib/sbi/sbi_hart.c           | 160 ++++++++++++++++++++++-------------
 3 files changed, 109 insertions(+), 65 deletions(-)

-- 
2.17.1


