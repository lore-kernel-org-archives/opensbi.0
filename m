From: Heinrich Schuchardt <xypron.glpk@gmx.de>
Date: Thu, 22 Jul 2021 12:53:58 +0200
Subject: [PATCH 1/2] lib: utils: remove unused variable in fdt_reset_init
In-Reply-To: <20210722105359.18622-1-xypron.glpk@gmx.de>
References: <20210722105359.18622-1-xypron.glpk@gmx.de>
Message-ID: <20210722105359.18622-2-xypron.glpk@gmx.de>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The value of variable current_driver is unused. Remove the variable.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/reset/fdt_reset.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/lib/utils/reset/fdt_reset.c b/lib/utils/reset/fdt_reset.c
index aa5f59f..87f925c 100644
--- a/lib/utils/reset/fdt_reset.c
+++ b/lib/utils/reset/fdt_reset.c
@@ -24,8 +24,6 @@ static struct fdt_reset *reset_drivers[] = {
 	&fdt_reset_thead,
 };

-static struct fdt_reset *current_driver = NULL;
-
 int fdt_reset_init(void)
 {
 	int pos, noff, rc;
@@ -47,7 +45,6 @@ int fdt_reset_init(void)
 			if (rc)
 				return rc;
 		}
-		current_driver = drv;
 		break;
 	}

--
2.30.2


