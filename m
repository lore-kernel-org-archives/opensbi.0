From: Gregor Haas <gregorhaas1997@gmail.com>
Date: Wed, 10 Jul 2024 14:09:22 -0700
Subject: [PATCH v2 0/2] lib: sbi: Heap improvements for SMMTT
Message-ID: <20240710210924.817753-1-gregorhaas1997@gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series includes two changes to the SBI heap implementation, primarily
to enable future work on the SMMTT implementation. First, it enables allocations
from multiple independent heaps on separate memory regions. Then, it adds a simple
implementation for sbi_memalign for use in allocating aligned memory.

See the individual commit messages in this series for more technical details.

Gregor Haas (2):
  lib: sbi: Support multiple heaps
  lib: sbi: Implement aligned memory allocators

 include/sbi/sbi_heap.h |  23 ++++++
 lib/sbi/sbi_heap.c     | 181 +++++++++++++++++++++++++++++------------
 2 files changed, 151 insertions(+), 53 deletions(-)

--
2.45.2


