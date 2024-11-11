From: Inochi Amaoto <inochiama@gmail.com>
Date: Mon, 11 Nov 2024 10:27:32 +0800
Subject: [PATCH v3 0/2] platform: improve heap size handle
Message-ID: <20241111022737.336991-1-inochiama@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch is split into two parts:

1. the first part is used to adjust the default heap size and make
it more driven by the CPU as most allocation is percpu. I think this
could reduce the further enlarge for the default heap size.

2. the second part is introduce a DT-based "heap-size", so the
platform can set the suitable heap-size. This is serve as a more
generic solution for some platform.

Changed from v2:
1. change the heap size formula, now it requires less ram
2. change the description in the document

Changed from v1:
1. add forgot BIT_ALIGN when processing DT-based "heap-size".


Inochi Amaoto (2):
  platform: ensure enough heap size with debug triggers extension
  platform: introduce DT-based configurable heap size

 docs/opensbi_config.md      |  4 ++++
 include/sbi/sbi_platform.h  |  2 +-
 platform/generic/platform.c | 28 +++++++++++++++++++++++++---
 3 files changed, 30 insertions(+), 4 deletions(-)

--
2.47.0


