From: Xiang W <wxjstz@126.com>
Date: Wed,  5 Jul 2023 22:36:52 +0800
Subject: [PATCH v8 00/11] Improve sbi_console
Message-ID: <20230705143703.635254-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v8 changes:
- PATCH10: Rename USED_TBUF to USE_TBUF, and change value to 16
- PATCH 1/8/9 Add Anup's SoB

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


