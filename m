From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 20 Jul 2022 14:50:31 -0700
Subject: [PATCH v3  0/4] Miscellaneous PMU fixes
Message-ID: <20220720215035.3453553-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series have a set of smaller PMU related fixes/improvements.
Most of the fixes are around possible buffer overrun errors in case of 
corrupt supervisor software.

Changes from v2->v3:
1. Improved patch 2.
2. Added RB tags.

Changes from v1->v2:
1. Split patch 1 to two patches with further improvements.
2. Added a fix for the issue pointed by Andrew.

Atish Patra (4):
lib: sbi: Fix counter index sanity check
lib: sbi: Add the bound check for events during config match
lib: sbi: Fix possible buffer overrun in counter validation
lib: sbi: Fix fw_event_map initialization

lib/sbi/sbi_pmu.c | 87 +++++++++++++++++++++++++++++++++++------------
1 file changed, 65 insertions(+), 22 deletions(-)

--
2.25.1


