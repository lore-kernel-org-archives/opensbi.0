From: Samuel Holland <samuel.holland@sifive.com>
Date: Fri, 30 Aug 2024 08:56:56 -0700
Subject: [PATCH] lib: sbi_domain_context: Fix file permissions
Message-ID: <20240830155707.3979714-1-samuel.holland@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These C source files should not be marked as executable.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 include/sbi/sbi_domain_context.h | 0
 lib/sbi/sbi_domain_context.c     | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 include/sbi/sbi_domain_context.h
 mode change 100755 => 100644 lib/sbi/sbi_domain_context.c

diff --git a/include/sbi/sbi_domain_context.h b/include/sbi/sbi_domain_context.h
old mode 100755
new mode 100644
diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
old mode 100755
new mode 100644
-- 
2.45.1


