From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Date: Fri, 25 Nov 2022 15:08:22 +0100
Subject: [PATCH 0/5] lib: fixes for fdt functions
Message-ID: <20221125140827.47018-1-heinrich.schuchardt@canonical.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

* Use correct type for variables used in error checks
* Avoid duplicates checks
* Don't assign values that are never used.

Heinrich Schuchardt (5):
  lib: simplify fdt_parse_plmt_node()
  lib: simplify fdt_parse_plicsw_node()
  lib: fix fdt_parse_plmt_node()
  lib: fix fdt_parse_plicsw_node()
  lib: simplify fdt_translate_address()

 lib/utils/fdt/fdt_helper.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

-- 
2.37.2


