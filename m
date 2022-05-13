From: Jan Remes <jan.remes@codasip.com>
Date: Fri, 13 May 2022 12:58:39 +0200
Subject: [PATCH v4 0/4] Honor FDT status property
Message-ID: <20220513105843.5139-1-jan.remes@codasip.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This series introduces a new function to check for the "status" property
in the FDT nodes and uses it to ignore CPU nodes that are disabled.

Changes in v4:
- Rename fdt_parse_max_hart_id to fdt_parse_max_enabled_hart_id
- Assign correct Reviewed-by: tags

Changes in v3:
- Don't check the property in PLIC/IMSIC/ACLINT drivers
- Start writing this changelog

Changes in v2:
- Implement the functionality separately from fdt_parse_hart_id
- Turn patch into proper series

Jan Remes (4):
  lib: utils/fdt: introduce fdt_node_is_enabled()
  lib: utils: check if CPU node is enabled
  platform: generic: check if CPU node is enabled
  lib: utils/fdt: rename fdt_parse_max_hart_id

 include/sbi_utils/fdt/fdt_helper.h |  4 +++-
 lib/utils/fdt/fdt_domain.c         | 14 +++++++++++++-
 lib/utils/fdt/fdt_fixup.c          |  3 +++
 lib/utils/fdt/fdt_helper.c         | 23 ++++++++++++++++++++++-
 platform/generic/platform.c        |  3 +++
 5 files changed, 44 insertions(+), 3 deletions(-)

-- 
2.36.1


