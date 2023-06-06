From: Xiang W <wxjstz@126.com>
Date: Tue,  6 Jun 2023 21:24:33 +0800
Subject: [PATCH v3 00/12] Improve sbi_console
Message-ID: <20230606132445.1239808-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v3 changes:
- PATCH11: Simplify get info->type
- PATCH12: Change the way to keep USED_TBUF by and to reset it by use_tbuf

v2 changes:
- add patch 10-12

Xiang W (12):
  lib: sbi: Fix missing contine in print
  lib: sbi: Fix how print gets flags
  lib: sbi: print not fill '0' when left-aligned
  lib: sbi: Add '+' flags for print
  lib: sbi: Add ' ' '\'' flags for print
  lib: sbi: implifying the parameters of printi
  lib: sbi: print add 'o' type
  lib: sbi: Fix printi
  lib: sbi: Simplify prints
  lib: sbi: sbi_console.c code re-layout
  lib: sbi: Add print_info for sbi_console.c
  lib: sbi: Fix timing of clearing tbuf

 lib/sbi/sbi_console.c | 405 +++++++++++++++++++++---------------------
 1 file changed, 201 insertions(+), 204 deletions(-)

-- 
2.39.2


