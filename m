From: Jan Remes <jan.remes@codasip.com>
Date: Thu, 12 May 2022 19:55:36 +0200
Subject: [PATCH v3 0/3] Honor FDT status property
Message-ID: <20220512175539.83942-1-jan.remes@codasip.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series introduces a new function to check for the "status" property
in the FDT nodes and uses it to ignore CPU nodes that are disabled.

Changes in v3:
- Don't check the property in PLIC/IMSIC/ACLINT drivers
- Start writing this changelog

Changes in v2:
- Implement the functionality separately from fdt_parse_hart_id
- Turn patch into proper series

Jan Remes (3):
  lib: utils/fdt: introduce fdt_node_is_enabled()
  lib: utils: check if CPU node is enabled
  platform: generic: check if CPU node is enabled

 include/sbi_utils/fdt/fdt_helper.h |  2 ++
 lib/utils/fdt/fdt_domain.c         | 14 +++++++++++++-
 lib/utils/fdt/fdt_fixup.c          |  3 +++
 lib/utils/fdt/fdt_helper.c         | 21 +++++++++++++++++++++
 platform/generic/platform.c        |  3 +++
 5 files changed, 42 insertions(+), 1 deletion(-)

-- 
2.36.1


