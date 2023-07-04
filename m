From: Xiang W <wxjstz@126.com>
Date: Tue,  4 Jul 2023 21:11:57 +0800
Subject: [PATCH v7 00/11] Improve sbi_console
Message-ID: <20230704131208.465914-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v7 changes:
- Added some description based on anup's suggestions
- Added patch: lib: sbi: Fix printc
- update patch
  lib: sbi: Fix timing of clearing tbuf
  lib: sbi: Fix missing '\0' when buffer szie equal 1
- drop PATCH based on anup's suggestions 
  lib: sbi: sbi_console.c code re-layout
  lib: sbi: Add print_info for sbi_console.c

Xiang W (11):
  lib: sbi: Fix how print gets flags
  lib: sbi: print not fill '0' when left-aligned
  lib: sbi: Add '+' flags for print
  lib: sbi: Add ' ' '\'' flags for print
  lib: sbi: implifying the parameters of printi
  lib: sbi: print add 'o' type
  lib: sbi: Fix printi
  lib: sbi: Simplify prints
  lib: sbi: Fix printc
  lib: sbi: Fix timing of clearing tbuf
  lib: sbi: Fix missing '\0' when buffer szie equal 1

 lib/sbi/sbi_console.c | 272 +++++++++++++++++++++---------------------
 1 file changed, 135 insertions(+), 137 deletions(-)

-- 
2.40.1


