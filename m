From: Xiang W <wxjstz@126.com>
Date: Tue, 28 Feb 2023 00:19:04 +0800
Subject: [PATCH v5 0/2] fix missing '\r' for console
Message-ID: <20230227161906.634775-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since v5:
- Add sbi_strnchr as suggested by Anup

Changes since v4:
- nputs_all come back
- implement partial writes as much as possible

Changes since v3:
- Prevent string overflow when looking for \n

Changes since v2:
- Fix the bug reported by Samuel. Prevent p from accessing memory other
  than strings.

Xiang W (2):
  lib: sbi: Add sbi_strnchr implementation
  lib: sbi: fix missing '\r' for console

 include/sbi/sbi_string.h |  2 ++
 lib/sbi/sbi_console.c    | 31 ++++++++++++++++++++++++++++++-
 lib/sbi/sbi_string.c     | 10 ++++++++++
 3 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.39.2


