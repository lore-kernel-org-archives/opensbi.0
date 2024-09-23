From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon, 23 Sep 2024 11:26:25 +0530
Subject: [PATCH v2 0/1] Mask/Unmask SSE Events
Message-ID: <20240923055626.1146237-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add support to mask/unmask SSE events.

changes from v1:
	- Removed sse_ prefix from sse_masked

Himanshu Chauhan (1):
  lib: sbi: Add support to mask/unmask SSE events

 include/sbi/sbi_ecall_interface.h |  2 ++
 include/sbi/sbi_sse.h             |  2 ++
 lib/sbi/sbi_ecall_sse.c           |  6 +++++
 lib/sbi/sbi_sse.c                 | 43 +++++++++++++++++++++++++++++++
 4 files changed, 53 insertions(+)

-- 
2.43.0


