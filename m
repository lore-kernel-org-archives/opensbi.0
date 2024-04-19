From: Ben Zong-You Xie <ben717@andestech.com>
Date: Fri, 19 Apr 2024 11:58:23 +0800
Subject: [1/2] platform: andes: Rename files with the prefix andes45
In-Reply-To: <20240419035824.280137-1-ben717@andestech.com>
References: <20240419035824.280137-1-ben717@andestech.com>
Message-ID: <20240419035824.280137-2-ben717@andestech.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Rename files with the prefix andes45 to andes.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 platform/generic/andes/{andes45-pma.c => andes_pma.c}         | 0
 platform/generic/include/andes/{andes45.h => andes.h}         | 0
 platform/generic/include/andes/{andes45_pma.h => andes_pma.h} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename platform/generic/andes/{andes45-pma.c => andes_pma.c} (100%)
 rename platform/generic/include/andes/{andes45.h => andes.h} (100%)
 rename platform/generic/include/andes/{andes45_pma.h => andes_pma.h} (100%)

diff --git a/platform/generic/andes/andes45-pma.c b/platform/generic/andes/andes_pma.c
similarity index 100%
rename from platform/generic/andes/andes45-pma.c
rename to platform/generic/andes/andes_pma.c
diff --git a/platform/generic/include/andes/andes45.h b/platform/generic/include/andes/andes.h
similarity index 100%
rename from platform/generic/include/andes/andes45.h
rename to platform/generic/include/andes/andes.h
diff --git a/platform/generic/include/andes/andes45_pma.h b/platform/generic/include/andes/andes_pma.h
similarity index 100%
rename from platform/generic/include/andes/andes45_pma.h
rename to platform/generic/include/andes/andes_pma.h
-- 
2.34.1


