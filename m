Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A01EFB7EF
	for <opensbi@archiver.kernel.org>; Tue, 24 Feb 2026 03:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rE60dSya/i8RJild5PjILoHvWRAMewq+YYzAnGLRgA4=; b=iQdF9Q2UO8A9ZM
	TrjqRC2soYdDflwak5FLU+SaEc5Ay7NKJJNJxOWlIffMrIOvuSX845sO1h4CEW+MajeuOuudMdRwp
	fVzI8HkoZ0wCu73/vIRMMWDb98ZNOITshdIPTwBtet+cm2KnY9bb6r7TuUYHntTSsEATKE7fCcdyD
	pv7iBIJo56KEw9AbNWbNn8je+Lf7BgJ6G+qQDS9fl8k6MLvGKNadx6+nkvuUGjpI5uRkJN+gGiTIX
	El5no+1s4aW4qhAa3aSSMGsXnsHBlYWeSNSTLhafp1a+DW+902IDpmWLcR0M2kA/jawrFvHGuczHN
	eG/3sPI8PC+8jAHjIM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuivo-00000001Onx-36EZ;
	Tue, 24 Feb 2026 03:17:52 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuivm-00000001On4-3KS7
	for opensbi@lists.infradead.org;
	Tue, 24 Feb 2026 03:17:51 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-43988056dc3so28661f8f.3
        for <opensbi@lists.infradead.org>; Mon, 23 Feb 2026 19:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771903069; x=1772507869; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHjlgMdXeI4l/yOZY+DQm662maL6VBKOM6yzz3uBSkc=;
        b=DwZgI6jwqI9afAid531kOIylWhgBX1tJBvvzmNEaxVgjhFV7gikf9zxUdB7QcUjAgh
         Vj/EyD1si8AWxVbe7x7UESjlXUf/LHB0PlcUVsklIDMWCRmKoMExYLDA9a2Oq0iQjR8N
         gPNVZGfmsqS2t9QNzwJmtgeZ7EpsngteMHBMJcBEDDztIRJJoQnYOudb6tsz0FO17seb
         3fW6ZvDdGyNcdgy8Bv5IThqVIIk7xTniRW8hKN93UfOnyMeMfT7XDGpVWyLPBwFiDJra
         M7vDmEHL9TuZDt7O55I2L6Kt6suGSKB4fiXY8Db8VnLBOwho/66Z5T84MLk7zVSdBFBm
         r/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771903069; x=1772507869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eHjlgMdXeI4l/yOZY+DQm662maL6VBKOM6yzz3uBSkc=;
        b=D3LU2lrZVjeGkBXvWFvXqH03Ssii6q1/KMwovFEMg/wtqLThH8PXatV2nlpxGIXdRB
         4725pDFmFG6XXmomwO+kbMRS2fuRD8U6+OZe+Cv8Su7Dj2HKl0NOvUB8YfCdXVLQM6vS
         qTOjIkXsQxi+M1f3uxbClsOtsZk2Vc7TMPbcsA1qF0hx1eM8+T6YxcizPz8H6pxJuwAc
         HlW0SJQemPudIVnihpAA8JLmR/rUCg1aSExqW7kGGIitXhISRz+Fx5AD9XzqUeNRdgH9
         /CoOZB8SFQxlLN/Wu3pq84i/tDPjzmGFxkBwO4YIXZcfuX2z/6t5NVMXO86O+XkuNiU0
         UwFQ==
X-Gm-Message-State: AOJu0YyP87TnP2+z84shY1whKP7uTl3rrTgjqMDkfezu4OvlXOG8Hd3m
	6S4MOoWEoBwao0zrtfixw0S14hon1qjZXn+9PmOt7j88Yaad6g4kQMgWRRszjb12WuaLbw/Fy6x
	d1xPO3FiJHzt+12Vhhz5qb/kddBQbUHaIX5vdL/Ea71fMpzTehPTc7tYPk7VJhPFsiu8V9yMGKl
	KpKcBqckh91Ub23ysJJxuDzojfU/6+aTA7apQCQt8PyGt2y4Uy
X-Gm-Gg: ATEYQzyFWvX6WHK/ADbXFJhMHMQyrsBIS80qHtG0X4Ab1XEwtcfoQ7wZ9SKHWqakHjj
	E+n6J4Vn7ZWNvnMH9CjphafG/JLZr1948Z3ZxVu5H6I9zrJFDIVxHzr/ZC32af6md0LYxXHWN/x
	YhbS5r9tW35foCF/3GE+7eM8lOkeeAqSaLqklJ1eoX6W3zLPtP8AORZvFvK7OdzCaIQzAcR6IM0
	XZ386Vuy0qMqvqM4vPm7vrXufXdiEbJhzb10DxCYCNbluFUaEkeM5WtPSQJjNqZosuvsO+4UDZq
	N2Njg6ifc2oB93PjZQ/8YKNBUxfIEqkMYSTGaP35DlDzEC0beZxtyjkFAZrAPs9kphuGIpT55ph
	33e6Go+4xOrmKCfImYLtrfeADiqliPziYqU7yTljJkJd3arBcKfNkSKZy0NFYh8ROQfDRmkOJoi
	6IRSApGnb2vcqb4PUe78ZDakgeX156o78skAPizpx+TaUwfig=
X-Received: by 2002:a05:6000:1883:b0:439:570e:b13b with SMTP id ffacd0b85a97d-4396f15b06dmr20466738f8f.19.1771903068912;
        Mon, 23 Feb 2026 19:17:48 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d401aasm22907889f8f.23.2026.02.23.19.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 19:17:47 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 3/3] sifive_dev_platform: Set default MMIO region when SmePMP is enabled
Date: Tue, 24 Feb 2026 11:17:33 +0800
Message-ID: <20260224031733.3817148-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260224031733.3817148-1-peter.lin@sifive.com>
References: <20260224031733.3817148-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_191750_850253_5EC899B2 
X-CRM114-Status: GOOD (  10.91  )
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

Set a default MMIO region with a single SmePMP entry, which allows us
to save entries for M-mode only devices. The default entry has M-/S-mode
shared permission, so system-level resource protection, such as RISC-V
World extension and WorldGuard checker, will be introduced to protect
M-mode only region access from lower privilege modes.

Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 platform/generic/sifive/sifive_dev_platform.c | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/platform/generic/sifive/sifive_dev_platform.c b/platform/generic/sifive/sifive_dev_platform.c
index facc044f1..9799e5b88 100644
--- a/platform/generic/sifive/sifive_dev_platform.c
+++ b/platform/generic/sifive/sifive_dev_platform.c
@@ -5,10 +5,58 @@
  */
 
 #include <platform_override.h>
+#include <sbi/sbi_hart.h>
+#include <sbi/sbi_scratch.h>
+
+/*
+ * Instead of allocating individual PMP entries for each M-mode
+ * MMIO driver, configure SMEPMP regions to grant R/W permission
+ * to peripheral and system ports for all privilege modes.
+ * Finer-grained access control is enforced by wgChecker rules.
+ */
+static int sifive_smepmp_setup(void)
+{
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	int rc;
+
+	if (!sbi_hart_has_extension(scratch, SBI_HART_EXT_SMEPMP))
+		return 0;
+
+	/* Peripheral port region: 0 to 2GiB */
+	rc = sbi_domain_root_add_memrange(0x0, 0x80000000, 0x80000000,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
+	if (rc)
+		return rc;
+
+	/* System port region: 512GiB to 1TiB */
+	rc = sbi_domain_root_add_memrange(0x8000000000, 0x8000000000, 0x8000000000,
+					  SBI_DOMAIN_MEMREGION_MMIO |
+					  SBI_DOMAIN_MEMREGION_SHARED_SURW_MRW);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
+static int sifive_early_init(bool cold_boot)
+{
+	int rc;
+
+	if (cold_boot) {
+		rc = sifive_smepmp_setup();
+		if (rc)
+			return rc;
+	}
+
+	return generic_early_init(cold_boot);
+}
 
 static int sifive_platform_init(const void *fdt, int nodeoff,
 				const struct fdt_match *match)
 {
+	generic_platform_ops.early_init = sifive_early_init;
+
 	return 0;
 }
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
