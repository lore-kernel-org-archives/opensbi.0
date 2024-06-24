From: Xiang W <wxjstz@126.com>
Date: Mon, 24 Jun 2024 22:18:56 +0800
Subject: [PATCH v2 0/3] print befor sbi_console_init
Message-ID: <20240624141903.2305676-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2 changes:
- Moved the console initialization on crash to a separate patch as
suggested by Himanshu Chauhan
- Add console buffer size configuration in kconfig as suggested by
Himanshu Chauhan
- Fixed some code comments and formatting

This patch is used to output information to the console before
sbi_console_init

Xiang W (3):
  lib: sbi: print before sbi_console_init
  lib: sbi: dump logs when crash
  lib: sbi: Make the console print buffer size configurable

 lib/sbi/Kconfig       |  4 ++++
 lib/sbi/sbi_console.c | 31 ++++++++++++++++++++++++++++++-
 lib/sbi/sbi_hart.c    |  4 ++++
 3 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.43.0


