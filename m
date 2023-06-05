From: Xiang W <wxjstz@126.com>
Date: Mon,  5 Jun 2023 14:16:03 +0800
Subject: [PATCH 0/9] Improve sbi_console
Message-ID: <20230605061612.1030529-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Xiang W (9):
  lib: sbi: Fix missing contine in print
  lib: sbi: Fix how print gets flags
  lib: sbi: print not fill '0' when left-aligned
  lib: sbi: Add '+' flags for print
  lib: sbi: Add ' ' '\'' flags for print
  lib: sbi: implifying the parameters of printi
  lib: sbi: print add 'o' type
  lib: sbi: Fix printi
  lib: sbi: Simplify prints

 lib/sbi/sbi_console.c | 243 ++++++++++++++++++++----------------------
 1 file changed, 118 insertions(+), 125 deletions(-)

-- 
2.39.2


