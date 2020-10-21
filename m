From: Atish Patra <atish.patra@wdc.com>
Date: Tue, 20 Oct 2020 17:57:52 -0700
Subject: [PATCH v2 0/2] Improve PMP feature detection
Message-ID: <20201021005754.2386272-1-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series improves the PMP detection by detecting the minimum granularity
and address size supported by the platform. It prevents any pmp region writes
that are not supported by platform leading to more robust and secure
implementation.

Tested generic platform for following boards:
1. Qemu
2. HiFive Unleashed
3. OmniXtend 

Changes from v1->v2:
1. Implement pmp address size computation.
2. Improve pmp granularity detection mechanism. 

Atish Patra (2):
lib: sbi: Check pmp range granularity and size before setting pmp
lib: sbi: Improve boot time print with additional PMP information

include/sbi/sbi_hart.h |  2 ++
lib/sbi/sbi_hart.c     | 56 ++++++++++++++++++++++++++++++++++++++----
lib/sbi/sbi_init.c     | 15 ++++++-----
3 files changed, 62 insertions(+), 11 deletions(-)

--
2.25.1


