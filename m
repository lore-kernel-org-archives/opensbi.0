From: qinhaijun@eswincomputing.com <qinhaijun@eswincomputing.com>
Date: Tue, 22 Nov 2022 15:13:20 +0800
Subject: [PATCH 0/1] add check for function parameter
Message-ID: <20221122071321.4274-1-qinhaijun@eswincomputing.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: haijun qin <qinhaijun@eswincomputing.com>

sbi_ecall_base_handler is the interface for external calls, Object-oriented 
will be complex. So add pointer check to avoid calling errors.

haijun qin (1):
  lib: sbi_ecall_base: add check for function parameter pointers

 lib/sbi/sbi_ecall_base.c | 3 +++
 1 file changed, 3 insertions(+)


base-commit: 22f38ee6c658a660083aa45c4ec6c72f66a17260
-- 
2.17.1


