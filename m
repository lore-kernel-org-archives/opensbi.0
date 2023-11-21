From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 21 Nov 2023 21:47:09 +0530
Subject: [PATCH 0/2] Allow relaxed MMIO writes in device IPI callbacks
Message-ID: <20231121161711.904674-1-apatel@ventanamicro.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series improves the barrier usage around device IPI callbacks
such that platform IPI driver can now use relaxed MMIO writes in
device IPI callbacks.

These patches can also be found in the sbi_ipi_barrier_imp_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (2):
  lib: sbi: Allow relaxed MMIO writes in device ipi_send() callback
  lib: sbi: Allow relaxed MMIO writes in device ipi_clear() callback

 lib/sbi/sbi_ipi.c           | 31 +++++++++++++++++++++++++------
 lib/utils/ipi/aclint_mswi.c |  4 ++--
 lib/utils/irqchip/imsic.c   |  4 ++--
 3 files changed, 29 insertions(+), 10 deletions(-)

-- 
2.34.1


