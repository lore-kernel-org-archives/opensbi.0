From: Anup Patel <anup.patel@wdc.com>
Date: Mon, 14 Dec 2020 10:14:27 +0530
Subject: [PATCH 0/4] Improve domain registration
Message-ID: <20201214044431.76677-1-anup.patel@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series aims at improving domain registration by adding
sbi_domain_register() function and removing domain_get()
platform callback.

These patches can also be found in domains_imp_v1 branch at:
https://github.com/avpatel/opensbi.git

Anup Patel (4):
  lib: utils: Allow FDT domain iteration functions to fail
  lib: sbi: Add function to register new domain
  lib: utils: Remove fdt_domain_get() function
  lib: sbi: Remove domain_get() platform callback function

 include/sbi/sbi_domain.h           |  10 ++
 include/sbi/sbi_platform.h         |  18 ---
 include/sbi_utils/fdt/fdt_domain.h |  29 ++---
 lib/sbi/sbi_domain.c               | 141 +++++++++++-----------
 lib/utils/fdt/fdt_domain.c         | 184 +++++++++++++++--------------
 platform/generic/platform.c        |   1 -
 6 files changed, 188 insertions(+), 195 deletions(-)

-- 
2.25.1


