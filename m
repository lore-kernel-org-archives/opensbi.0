From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Mon, 28 Nov 2022 10:14:14 +0100
Subject: [PATCH v2 0/6] lib: fixes for fdt functions
Message-ID: <20221128091420.30391-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

* Use correct type for variables used in error checks
* Check correct variables
* Avoid duplicates checks
* Don't assign values that are never used.

v2:
	check correct variables
	fix fdt_parse_aclint_node() too

Heinrich Schuchardt (6):
  lib: simplify fdt_parse_plmt_node()
  lib: simplify fdt_parse_plicsw_node()
  lib: fix fdt_parse_plmt_node()
  lib: fix fdt_parse_plicsw_node()
  lib: simplify fdt_translate_address()
  lib: fix fdt_parse_aclint_node()

 lib/utils/fdt/fdt_helper.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

-- 
2.37.2


