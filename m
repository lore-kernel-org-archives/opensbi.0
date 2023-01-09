From: Himanshu Chauhan <hchauhan@ventanamicro.com>
Date: Mon,  9 Jan 2023 14:10:44 +0530
Subject: [PATCH 0/5] Split RX and RW regions for separate pmp entries
Message-ID: <20230109084049.31828-1-hchauhan@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is second installment of the patch series sent earlier with
the subject:  Split region permissions into M-mode and SU-mode. The
version 2 was recently posted, for which below is the link:
http://lists.infradead.org/pipermail/opensbi/2023-January/004127.html

This patch series splits the RX (text and read-only data) and RW data regions
so that each can have its independent pmp entries with correct permissions.
The linker script provides a new symbol _fw_rw_offset that marks the
beginning of the RW section. It also ensures that the split is a power-of-2
as required by pmp.

This lays ground work for enforcing the permissions from M-mode.

Himanshu Chauhan (5):
  firmware: Split RO/RX and RW sections
  firmware: Move dynsym and reladyn sections to RX section
  firmware: Add RW section offset in scratch
  lib: sbi: Print the RW section offset
  lib: sbi: Program separate pmp entries for text and data

 firmware/fw_base.S        |  5 +++++
 firmware/fw_base.ldS      | 43 ++++++++++++++++++++++++---------------
 include/sbi/sbi_scratch.h | 24 +++++++++++++---------
 lib/sbi/sbi_domain.c      | 11 ++++++++--
 lib/sbi/sbi_init.c        |  1 +
 5 files changed, 56 insertions(+), 28 deletions(-)

-- 
2.39.0


