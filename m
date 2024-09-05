From: Kele Zhang <zhangcola2003@gmail.com>
Date: Thu,  5 Sep 2024 09:31:36 +0000
Subject: [PATCH v3 0/1] Enable Dead Code Elimination
Message-ID: <cover.1725521174.git.zhangcola2003@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch enables `--gc-sections`. Dead Code Elimination (DCE) can
reduce binary size and the attack surface without introducing side
effects, and it has been used in the Linux kernel for many years.

After testing, enabling DCE does not affect the normal functionality of
OpenSBI.

---
v1: https://lists.infradead.org/pipermail/opensbi/2024-August/007286.html
v2: https://lists.infradead.org/pipermail/opensbi/2024-August/007301.html
---
Changes in v2:
- Move --gc-sections to ELFFLAGS
- Remove redundant KEEP()

Changes in v3:
- Move --print-gc-sections to ifneq ($(DEBUG),)
- Move "ifneq ($(DEBUG),)" to the latter part of the Makefile, ensuring
that "ELFFLAGS  +=      $(USE_LD_FLAG)" remains at the beginning.


Kele Zhang (1):
  Makefile: enable --gc-sections

 Makefile             | 15 +++++++++------
 firmware/fw_base.ldS |  1 +
 2 files changed, 10 insertions(+), 6 deletions(-)


base-commit: c4940a9517486413cd676fc8032bb55f9d4e2778
-- 
2.43.0


