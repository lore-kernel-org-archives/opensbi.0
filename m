From: Atish Patra <atish.patra@wdc.com>
Date: Fri, 19 Mar 2021 15:13:00 -0700
Subject: [RFC 09/14] lib: sbi: Add PMU specific platform hooks
In-Reply-To: <20210319221305.2138412-1-atish.patra@wdc.com>
References: <20210319221305.2138412-1-atish.patra@wdc.com>
Message-ID: <20210319221305.2138412-10-atish.patra@wdc.com>
List-Id: <opensbi.lists.infradead.org>
To: opensbi@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A platform hook to initialize PMU allows platform vendors to provide
their own mechanism to define pmu event-counter mappings in addition
to the DT based approach.

Another platform hook that allows platform vendors customize the
final mhpmevent value configuration.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 include/sbi/sbi_platform.h | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index dadbc1e94e18..02773f672443 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -97,6 +97,11 @@ struct sbi_platform_operations {
 	/** Initialize (or populate) domains for the platform */
 	int (*domains_init)(void);
 
+	/** Initialize hw performance counters */
+	int (*pmu_init)(void);
+
+	uint64_t (*get_mhpmevent_value)(uint32_t event_idx, uint64_t data);
+
 	/** Write a character to the platform console output */
 	void (*console_putc)(char ch);
 	/** Read a character from the platform console input */
@@ -514,6 +519,39 @@ static inline int sbi_platform_domains_init(const struct sbi_platform *plat)
 	return 0;
 }
 
+/**
+ * Setup hw PMU events for the platform
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return 0 on success and negative error code on failure
+ */
+static inline int sbi_platform_pmu_init(const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->pmu_init)
+		return sbi_platform_ops(plat)->pmu_init();
+	return 0;
+}
+
+/**
+ * Get the value to be written in mhpmeventx for event_idx
+ *
+ * @param plat pointer to struct sbi_platform
+ * @param event_idx ID of the PMU event
+ * @param data Additional configuration data passed from supervisor software
+ *
+ * @return expected value by the platform or 0 if platform doesn't know about
+ * the event
+ */
+static inline int sbi_platform_get_mhpmevent_value(const struct sbi_platform *plat,
+						   uint32_t event_idx, uint64_t data)
+{
+	if (plat && sbi_platform_ops(plat)->get_mhpmevent_value)
+		return sbi_platform_ops(plat)->get_mhpmevent_value(event_idx,
+								   data);
+	return 0;
+}
+
 /**
  * Write a character to the platform console output
  *
-- 
2.25.1


