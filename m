From: Jan Remeš <jan.remes@codasip.com>
Date: Mon, 9 May 2022 15:46:21 +0200
Subject: [PATCH v2 0/3] Honor FDT status property
Message-ID: <CALXH3=KcYCwaVoofhHHeA_uVvHipiDmCkKv4r9w3FbeF4Z_Thg@mail.gmail.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series introduces a new function to check for the "status" property
in the FDT nodes and uses it to ignore CPU nodes that are disabled.

Jan Remes (3):
  lib: utils/fdt: introduce fdt_node_is_enabled()
  lib: utils: check if CPU node is enabled
  platform: generic: check if CPU node is enabled

 include/sbi_utils/fdt/fdt_helper.h    |  2 ++
 lib/utils/fdt/fdt_domain.c            | 14 +++++++++++++-
 lib/utils/fdt/fdt_fixup.c             |  3 +++
 lib/utils/fdt/fdt_helper.c            | 24 ++++++++++++++++++++++++
 lib/utils/irqchip/fdt_irqchip_imsic.c |  3 +++
 lib/utils/irqchip/fdt_irqchip_plic.c  |  3 +++
 platform/generic/platform.c           |  3 +++
 7 files changed, 51 insertions(+), 1 deletion(-)

-- 
2.35.1

