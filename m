From: Xiang W <wxjstz@126.com>
Date: Mon, 12 Jun 2023 16:09:47 +0800
Subject: [PATCH v6 00/12] Improve sbi_console
Message-ID: <20230612080959.571293-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v5 changes:
- PATCH12: fix printf("%%") missing USED_TBUF;  
- add PATCH14, Fix invalid directive print

v4 changes:
- PATCH11: Simplify printc
- add PATCH13, handle special case

v3 changes:
- PATCH11: Simplify get info->type
- PATCH12: Change the way to keep USED_TBUF by and to reset it by use_tbuf

v2 changes:
- add patch 10-12

Xiang W (12):
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
  lib: sbi: Fix missing '\0' when buffer szie equal 1

 lib/sbi/sbi_console.c | 413 ++++++++++++++++++++++--------------------
 1 file changed, 212 insertions(+), 201 deletions(-)

-- 
2.39.2


