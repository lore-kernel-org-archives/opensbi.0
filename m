From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 15 Nov 2024 15:33:08 +0800
Subject: [PATCH] sbi: fwft: clear the config lock when warm boot
Message-ID: <20241115073308.905612-1-nick.hu@sifive.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The hotplug cpu should clear the fwft config's SBI_FWFT_SET_FLAG_LOCK
in the warm boot flow otherwise the cpu can't set the menvcfg.sse by
SBI_EXT_FWFT_SET sbi call and cause the illegal instruction when
accessing the CSR_SSP in kernel.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 lib/sbi/sbi_fwft.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index 9cf14c16..0cb165b4 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -311,6 +311,18 @@ static int fwft_get_feature(enum sbi_fwft_feature_t feature,
 	return SBI_SUCCESS;
 }
 
+static void fwft_clear_config_lock(enum sbi_fwft_feature_t feature)
+{
+	int ret;
+	struct fwft_config *conf;
+
+	ret = fwft_get_feature(feature, &conf);
+	if (ret)
+		return;
+
+	conf->flags &= ~SBI_FWFT_SET_FLAG_LOCK;
+}
+
 int sbi_fwft_set(enum sbi_fwft_feature_t feature, unsigned long value,
 		 unsigned long flags)
 {
@@ -414,5 +426,8 @@ int sbi_fwft_init(struct sbi_scratch *scratch, bool cold_boot)
 		fwft_set_hart_state_ptr(scratch, fhs);
 	}
 
+	for (i = 0; i < array_size(features); i++)
+		fwft_clear_config_lock(features[i].id);
+
 	return 0;
 }
-- 
2.34.1


