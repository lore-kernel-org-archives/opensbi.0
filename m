From: Xiang W <wxjstz@126.com>
Date: Thu, 24 Nov 2022 11:16:02 +0800
Subject: [PATCH v2 0/3] Some optimizations and bug fixes about sbi_domain
Message-ID: <20221124031605.216192-1-wxjstz@126.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changes since v1:
fix [PATCH 2/3] mistakes edit

Xiang W (3):
  lib: sbi: Simplified mmio match checking
  lib: sbi: add in_region
  lib: sbi: fix is_region_valid

 lib/sbi/sbi_domain.c | 61 ++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 33 deletions(-)

-- 
2.30.2


