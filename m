From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 11 May 2023 18:11:01 +0200
Subject: [PATCH v4 0/3] lib: sbi: Ensure SBI extension is available
Message-ID: <20230511161104.115168-1-ajones@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure attempts to invoke SBI extension functions fail with
SBI_ERR_NOT_SUPPORTED when the extension's probe function has
reported that the extension is not available. To avoid invoking
probe too frequently, we check single extension ID extensions at
init time and even drop them from the extension list when their
probe fails. If the probe succeeds, we keep it, and then later
seeing that it's a single extension ID extension is enough to know
it's available. Extensions which have multiple IDs must have its probe
called for each, so rather than try probing at init time we provide
another callback allowing the extension to narrow its range or even
vanish.

v4:
  Almost a total redesign. Patch1 of the v4 (now series) does keep
  hunk 2 of the v3 patch, but the changes to sbi_ecall_find_extension()
  of the v3 patch have been dropped. Instead multi-ID extensions can
  now make use of a new extension callback (Patch2) which gets invoked
  at init time. This new callback has been applied to vendor extensions
  with Patch3.

v3: http://lists.infradead.org/pipermail/opensbi/2023-May/004894.html

Andrew Jones (3):
  lib: sbi: Don't register unavailable single ID extensions
  lib: sbi: Introduce register_extensions extension callback
  lib: sbi: Apply register_extensions to vendor extensions

 include/sbi/sbi_ecall.h    |  1 +
 lib/sbi/sbi_ecall.c        | 17 ++++++++++++-----
 lib/sbi/sbi_ecall_vendor.c | 17 +++++++++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

-- 
2.40.0


