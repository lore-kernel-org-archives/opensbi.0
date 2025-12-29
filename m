Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0CCFE92725
	for <opensbi@archiver.kernel.org>; Mon, 29 Dec 2025 07:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnEpuPQ5Cq7Upb8grV5CNfn7uoXc4DD3Cf9G3G8hyWM=; b=aD8qK50lNjF9iI
	04ydrQbyMmiK1muIMzJLgVVDF7Y1wTpRhrmGrCmDSK73OedFkD+/mSWHTUGI+1BmY+jU9CeAAI1RP
	S7qD/j2oRhvDVSuTg2Ot3wfl9RiIDkAm/nz22KB51mf9v8S7GN2nCGBIK8GI8z4HqN7SJsBoy5SR/
	ppKNfZrlB9fQs9JOFVjr6q5ZTyIFs9Yzqi7IU190IudNt+ey5k3JnzQ3OFkdMIvtyYcekWHhrjtqx
	YQBrb6QIlKlZO1xboetNpKja5vO5ScygNYJXzACvBGpcIUDK72wWsTmNlubyoYqTUDRWUimAoR7MU
	9ExVbd8+8f0z9MeRMKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XV-00000003Pxk-2zM9;
	Mon, 29 Dec 2025 07:19:37 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7XT-00000003Pvv-2SXR
	for opensbi@lists.infradead.org;
	Mon, 29 Dec 2025 07:19:36 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5BT7JNrT084316
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <opensbi@lists.infradead.org>; Mon, 29 Dec 2025 15:19:23 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 29 Dec 2025
 15:19:23 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH 3/5] lib: utils/cache: add cache enable function
Date: Mon, 29 Dec 2025 15:19:12 +0800
Message-ID: <20251229071914.1451587-4-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229071914.1451587-1-ben717@andestech.com>
References: <20251229071914.1451587-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5BT7JNrT084316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_231935_973985_23E71578 
X-CRM114-Status: GOOD (  11.19  )
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add functions to enable/disable the cache.

Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 include/sbi_utils/cache/cache.h          | 11 +++++++++++
 include/sbi_utils/cache/fdt_cmo_helper.h | 13 +++++++++++++
 lib/utils/cache/cache.c                  | 11 +++++++++++
 lib/utils/cache/fdt_cmo_helper.c         | 23 +++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/include/sbi_utils/cache/cache.h b/include/sbi_utils/cache/cache.h
index 70d9286f9a0a..de6cf50d1da6 100644
--- a/include/sbi_utils/cache/cache.h
+++ b/include/sbi_utils/cache/cache.h
@@ -19,6 +19,8 @@ struct cache_ops {
 	int (*warm_init)(struct cache_device *dev);
 	/** Flush entire cache **/
 	int (*cache_flush_all)(struct cache_device *dev);
+	/** Enable/Disable cache **/
+	int (*cache_enable)(struct cache_device *dev, bool enable);
 };
 
 struct cache_device {
@@ -66,4 +68,13 @@ int cache_add(struct cache_device *dev);
  */
 int cache_flush_all(struct cache_device *dev);
 
+/**
+ * Enable/Disable the cache
+ *
+ * @param dev the cache to enable/disable
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int cache_enable(struct cache_device *dev, bool enable);
+
 #endif
diff --git a/include/sbi_utils/cache/fdt_cmo_helper.h b/include/sbi_utils/cache/fdt_cmo_helper.h
index a6a28db9ede2..8b3ec89b9c15 100644
--- a/include/sbi_utils/cache/fdt_cmo_helper.h
+++ b/include/sbi_utils/cache/fdt_cmo_helper.h
@@ -22,6 +22,19 @@ int fdt_cmo_private_flc_flush_all(void);
  */
 int fdt_cmo_llc_flush_all(void);
 
+/**
+ * Enable/Disable the private first level cache of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_private_flc_enable(bool enable);
+
+/**
+ * Enable/Disable the last level cache of the current hart
+ *
+ * @return 0 on success, or a negative error code on failure
+ */
+int fdt_cmo_llc_enable(bool enable);
 /**
  * Initialize the cache devices for each hart
  *
diff --git a/lib/utils/cache/cache.c b/lib/utils/cache/cache.c
index 6bc3d10e9347..2810d5e9570c 100644
--- a/lib/utils/cache/cache.c
+++ b/lib/utils/cache/cache.c
@@ -44,3 +44,14 @@ int cache_flush_all(struct cache_device *dev)
 
 	return dev->ops->cache_flush_all(dev);
 }
+
+int cache_enable(struct cache_device *dev, bool enable)
+{
+	if (!dev)
+		return SBI_ENODEV;
+
+	if (!dev->ops || !dev->ops->cache_enable)
+		return SBI_ENOTSUPP;
+
+	return dev->ops->cache_enable(dev, enable);
+}
diff --git a/lib/utils/cache/fdt_cmo_helper.c b/lib/utils/cache/fdt_cmo_helper.c
index d87bab76ca00..3ab8abe667ba 100644
--- a/lib/utils/cache/fdt_cmo_helper.c
+++ b/lib/utils/cache/fdt_cmo_helper.c
@@ -41,6 +41,29 @@ int fdt_cmo_llc_flush_all(void)
 	return cache_flush_all(llc);
 }
 
+int fdt_cmo_private_flc_enable(bool enable)
+{
+	struct cache_device *flc = get_hart_flc(sbi_scratch_thishart_ptr());
+
+	if (!flc || !flc->cpu_private)
+		return SBI_ENODEV;
+
+	return cache_enable(flc, enable);
+}
+
+int fdt_cmo_llc_enable(bool enable)
+{
+	struct cache_device *llc = get_hart_flc(sbi_scratch_thishart_ptr());
+
+	if (!llc)
+		return SBI_ENODEV;
+
+	while (llc->next)
+		llc = llc->next;
+
+	return cache_enable(llc, enable);
+}
+
 static int fdt_cmo_cold_init(const void *fdt)
 {
 	struct sbi_scratch *scratch;
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
