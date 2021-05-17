From: Daniel Schaefer <daniel.schaefer@hpe.com>
Date: Mon, 17 May 2021 19:33:16 +0800
Subject: [PATCH v1 0/3] Don't use SBI functions in fdt code
Message-ID: <20210517113319.25855-1-daniel.schaefer@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

My previous solution to build v0.9 in EDK2 wasn't correct:
http://lists.infradead.org/pipermail/opensbi/2021-May/000982.html

Abner reminded me that he had done a similar change before. It was
to not use SBI functions in the FDT files but instead call those from
libfdt_env.h.

See:
2cfd2fc9048806353298a1b967abf985901e36e8
2845d2d2cf4fb74a89452ba223995aa4a118c07e
8e47649eff96c303e02fbd58cdc6c4ed341066ec

Doing the same kinds of changes again, solves the issue.

Cc: Abner Chang <abner.chang@hpe.com>
Cc: Anup Patel <Anup.Patel@wdc.com>

Daniel Schaefer (3):
  lib: utils: Add macro to libfdt_env.h for strncpy
  lib: fdt: Don't use sbi_string functions
  lib: utils: Replace strcmp with strcmp

 lib/utils/fdt/fdt_domain.c    | 7 ++++---
 lib/utils/libfdt/libfdt_env.h | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.30.1


