From: Kele Zhang <zhangcola2003@gmail.com>
Date: Thu, 29 Aug 2024 20:11:58 +0000
Subject: [PATCH v2 0/1] Enable Dead Code Elimination
Message-ID: <cover.1724959010.git.zhangcola2003@gmail.com>
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

---
Changes in v2:
- Move --gc-sections to ELFFLAGS
- Remove redundant KEEP() 

Kele Zhang (1):
  Makefile: enable --gc-sections

 Makefile             | 5 +++--
 firmware/fw_base.ldS | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)


base-commit: c4940a9517486413cd676fc8032bb55f9d4e2778
-- 
2.34.1


