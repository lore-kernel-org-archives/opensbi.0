From: Nick Hu <nick.hu@sifive.com>
Date: Tue, 17 Jan 2023 16:14:26 +0800
Subject: [PATCH 0/2] Not to clear all the bits of mip
Message-ID: <20230117081428.15042-1-nick.hu@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In generic behavior of QEMU, if we clear the mip.SEIP and the pendings of
PLIC still exist, the QEMU may not set the mip.SEIP back immediately. So
interrupts won't be handled anymore until the next new device interrupt
arrived. We should only clear the SSIP and STIP which set by SW. The rest
of the bits should be decided by HW.

Nick Hu (2):
  firmware: Not to clear all the MIP
  lib: sbi_hsm: Use csr_set to restore the MIP

 firmware/fw_base.S | 10 ++++++++--
 lib/sbi/sbi_hsm.c  |  2 +-
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
2.34.1


