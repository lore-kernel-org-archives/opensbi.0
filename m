From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 19 Jul 2022 15:46:11 -0700
Subject: [PATCH v2  0/4] Miscellaneous PMU fixes
Message-ID: <20220719224615.3080494-1-atishp@rivosinc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series have a set of smaller PMU related fixes/improvements.
Most of the fixes are around possible buffer overrun errors in case of 
corrupt supervisor software.

Changes from v1->v2:
1. Split patch 1 to two patches with further improvements.
2. Added a fix for the issue pointed by Andrew.

Atish Patra (4):
lib: sbi: Fix counter index sanity check
lib: sbi: Add the bound check for events during config match
lib: sbi: Fix possible buffer overrun in counter validation
lib: sbi: Fix fw_event_map initialization

lib/sbi/sbi_pmu.c | 80 ++++++++++++++++++++++++++++++++++-------------
1 file changed, 58 insertions(+), 22 deletions(-)

--
2.25.1


