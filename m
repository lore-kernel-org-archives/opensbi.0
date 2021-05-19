From: Daniel Schaefer <daniel.schaefer@hpe.com>
Date: Wed, 19 May 2021 15:54:07 +0800
Subject: [PATCH v2 0/3] Don't use SBI functions in fdt code
Message-ID: <20210519075410.8520-1-daniel.schaefer@hpe.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Second series with minor changes based on the feedback

- Made commit description of 1 better
- Changed sbi_memcpy to memcpy in 2 (forgot it before because I was
  basing on v0.9 instead of master)
- Fixed typo in commit message of 3

Cc: Xiang W <wxjstz@126.com>
Cc: Abner Chang <abner.chang@hpe.com>
Cc: Anup Patel <anup.patel@wdc.com>

Daniel Schaefer (3):
  lib: utils: Add strncpy macro to libfdt_env.h
  lib: fdt: Don't use sbi_string functions
  lib: utils: Replace strcmp with strncmp

 lib/utils/fdt/fdt_domain.c    | 9 +++++----
 lib/utils/libfdt/libfdt_env.h | 1 +
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.30.1


