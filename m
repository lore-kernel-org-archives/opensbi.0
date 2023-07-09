From: Xiang W <wxjstz@126.com>
Date: Mon, 10 Jul 2023 00:02:20 +0800
Subject: [PATCH v9 00/11] Improve sbi_console
Message-ID: <20230709160231.202121-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v9 changes:
- PATCH10 Add Anup's SoB
- PATCH11 Add check of out_len

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

 lib/sbi/sbi_console.c | 274 +++++++++++++++++++++---------------------
 1 file changed, 137 insertions(+), 137 deletions(-)

-- 
2.40.1


