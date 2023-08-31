From: Xiang W <wxjstz@126.com>
Date: Thu, 31 Aug 2023 11:39:28 +0800
Subject: [RFC PATCH 0/2] miscellaneous about hartmask
Message-ID: <20230831033930.694299-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Originally, the bits in sbi_hartmask represent hartid. Because hartid can
be discontinuous, there may be gaps. Represent hartindex instead.

Xiang W (2):
  ilib: sbi: add sbi_platform_hart_index2id
  lib: sbi: improve sbi_hartmask

 include/sbi/sbi_hartmask.h | 40 ++++++++++++++++++++++++++++----------
 include/sbi/sbi_platform.h | 10 ++++++++++
 lib/sbi/sbi_domain.c       | 26 +++++++++----------------
 lib/sbi/sbi_init.c         |  2 +-
 lib/sbi/sbi_ipi.c          |  4 ++--
 lib/sbi/sbi_platform.c     |  9 +++++++++
 lib/sbi/sbi_system.c       |  4 ++--
 lib/sbi/sbi_tlb.c          |  4 ++--
 8 files changed, 65 insertions(+), 34 deletions(-)

-- 
2.40.1


