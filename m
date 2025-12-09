Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F3DD3B7FB
	for <opensbi@archiver.kernel.org>; Tue,  9 Dec 2025 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ownAl9Riwe3zr8u6iMNpXK57JQgcovejXC5H/mPSDs=; b=RYoVWcaGssJPfM
	Okq9Rv8y8nvD0SiG4rrQrNEooa7T4faWy+LsS5id2qhJUmBaC0oWA4fZy/Ohjq04O2LfVw/X8+ror
	/5jmnyyzShPXMKJa9rMUvO1F7CJDcVXuQMU3VxiZ5Aj/Qxmp0jjx8B/qDyBt7uiWdnVlpmhLJXTyT
	DIPcdZEaPczuRyXYx01fp7/CW0PJ1gvQ4x8Cew5f4aiyKWU8YtV9DFUooWV/pOkem+M1/n2lEK3pA
	7yQ6IqNCgQIypSCsfR+iqWXiCVd407bSljBXKVueT/GludcLDRkwuvJTf8h4ajrFhRDw9ykEi3UZo
	CJCVXmFztoZ17h0N60dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutw-0000000E6W6-0Vxt;
	Tue, 09 Dec 2025 10:25:00 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSutt-0000000E6U0-2Jbd
	for opensbi@lists.infradead.org;
	Tue, 09 Dec 2025 10:24:58 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-297e264528aso54480815ad.2
        for <opensbi@lists.infradead.org>; Tue, 09 Dec 2025 02:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765275896; x=1765880696; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMh01JNR6yI4D7JqnD8b6b1HUCxmq1bvxbnqtt9u7Nk=;
        b=LePd9Z07MriuBwy8qF98mfPYf1ZNzdTtCKvnbtptgyGFfG4uMg6HmUzaX/gkjMcFrB
         NjJHdGPqW0pWbqtNHidzeBWbGS8I9kB9MY1JDr2tK686bCAWhF/5MZIDUbr1fitvxVEc
         z3NBbUjtF8IoMB1srFFZrLA9FXXY0Ym+GCvz8WUJSAqbzamVyoUbt2qhTgfkY5qBTQTj
         /eGiuPncc5z67VblFgg8swViimHhftjGCNQLYVNFKnZ0xG0/nfL4c9RdOqi0Pm3gtBw3
         QuxSO2qZBVKyXzNwoHaUrdRMomHsglCVs+a1KY1IUJrl9a+bbwiijnISTQd8pLRfUV99
         RPXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275896; x=1765880696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hMh01JNR6yI4D7JqnD8b6b1HUCxmq1bvxbnqtt9u7Nk=;
        b=YalXaUGd9XnNgJZPwds0hml0wPQsTt4k+OixP/2BVQVMTk2L3sKWUnFcWuAgIVdDov
         3/+Y0ebs6v8X6y0sLCTvGGSd8LbFeRJOQFpZDWqcWA2VLOfN6StfuQ0IIUu4+pYUaNA2
         g4liIrfsGhH1P6oUDJvFecOAoZr1P2LdlEBkRTSeZN92gjpWxRVAyKyfPc5i439v6owd
         rCHoZiaW3JJ0X3HBiGLV82kr0KK4w/hJyJn84njmMtHZ21fCq16bGldUPzi0F45v93U1
         ZS5yTmATFCYfrndM5lVZ+4uvKCyOcT2Xp8iL9WH2JxBB+KSFbXuLTqIXArZc+G+NKYGr
         sB6w==
X-Gm-Message-State: AOJu0Yyy6cBxMXvGWhCK9Y+QAbN79KRr+5ADx607zUhugmOCYyZLC9PE
	VY588zwA+U5H9rxYNfvVogqEQU4hiR19Z1HHBQyDhCmuZe6SfRb5tTIle7anxC3k
X-Gm-Gg: AY/fxX5NNBcg/l0/os8AhuHhIcWUUOCPvG9JYuZCyT6FI3R9CHAqzVLU+DyFjtatob9
	azIdWAV8xBOCKOHVV5MriEv+pm4Z2Gx0/9IhB31c2c4TpKsMm6qhodw9f/FGPYs1zbA8S8CTqZn
	/VunYjaVMKkB7PZJaDShq/kpjeKjifDNBeJmn8cp8RZWTN2YoKZW7tKe49Q0yqZ5+BjGcCX6l+n
	7nslsK5wBk9gGcc/2ZELX0h8DoKpgQbSbKFl0HlUXHDBENBE1N9xqNuqHlW554ATYN+NtRLCMPh
	xpXBFxkFYDdt+ymNQdhplFDS+LfkwLpv8HZp6hjrEJmNxwXfQBNCGq5LyV4UcBz9mQBbe89knAj
	+8CCYLOcBZiWeRpDYxnPBuoU49QOZw88O/jkwjWxjeOSyjUvoS1Ra57W/goF5qEk49ZOv0T+TSH
	zQNivGgmVzKUYi
X-Google-Smtp-Source: AGHT+IGyHge3b/rh/hd59A92NgFnRts8jLc3ThZlmuJGkHFFGXepLEJ6PLfREvSOLBw/AM9dyHijXQ==
X-Received: by 2002:a17:903:2c07:b0:295:2c8e:8e56 with SMTP id d9443c01a7336-29df610ed53mr83566875ad.44.1765275896119;
        Tue, 09 Dec 2025 02:24:56 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49ca1esm149302135ad.2.2025.12.09.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:24:55 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v4 4/5] lib: sbi: give platform choice of using single memregion to cover OpenSBI
Date: Tue,  9 Dec 2025 02:22:45 -0800
Message-Id: <20251209102246.1161-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209102246.1161-1-ganboing@gmail.com>
References: <20251209102246.1161-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_022457_595800_4EFC8D84 
X-CRM114-Status: GOOD (  14.80  )
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

By default the OpenSBI itself is covered by 2 memregions for RX/RW
sections. This is required by platforms with Smepmp to enforce
proper permissions in M mode. Note: M-mode only regions can't
have RWX permissions with Smepmp. Platforms with traditional PMPs
won't be able to benefit from it, as both regions are effectively
RWX in M mode, but usually it's harmless to so. Now we provide
these platforms with an option to disable this logic. It saves 1
PMP entry. For platforms really in short of PMPs, it does make a
difference.

Note: Platform requesting single OpenSBI memregion must be using
      traditional (old) PMP. We expect the platform code to do
      the right thing.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_platform.h | 21 +++++++++++++++++++++
 lib/sbi/sbi_domain.c       | 36 ++++++++++++++++++++++++------------
 2 files changed, 45 insertions(+), 12 deletions(-)

diff --git a/include/sbi/sbi_platform.h b/include/sbi/sbi_platform.h
index d75c12de..e65d9877 100644
--- a/include/sbi/sbi_platform.h
+++ b/include/sbi/sbi_platform.h
@@ -76,6 +76,9 @@ struct sbi_platform_operations {
 	/* Check if specified HART is allowed to do cold boot */
 	bool (*cold_boot_allowed)(u32 hartid);
 
+	/* Check if platform requires single firmware region */
+	bool (*single_fw_region)(void);
+
 	/* Platform nascent initialization */
 	int (*nascent_init)(void);
 
@@ -347,6 +350,24 @@ static inline bool sbi_platform_cold_boot_allowed(
 	return true;
 }
 
+/**
+ * Check whether platform requires single firmware region
+ *
+ * Note: Single firmware region only works with legacy PMP because with
+ * Smepmp M-mode only regions can't have RWX permissions.
+ *
+ * @param plat pointer to struct sbi_platform
+ *
+ * @return true if single firmware region required and false otherwise
+ */
+static inline bool sbi_platform_single_fw_region(
+					const struct sbi_platform *plat)
+{
+	if (plat && sbi_platform_ops(plat)->single_fw_region)
+		return sbi_platform_ops(plat)->single_fw_region();
+	return false;
+}
+
 /**
  * Nascent (very early) initialization for current HART
  *
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 8a0a8fe2..4d3b4ee4 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -919,18 +919,30 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	root.possible_harts = root_hmask;
 
 	/* Root domain firmware memory region */
-	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
-				   SBI_DOMAIN_MEMREGION_FW),
-				  &root_memregs[root_memregs_count++]);
-
-	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
-				  (scratch->fw_size - scratch->fw_rw_offset),
-				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
-				   SBI_DOMAIN_MEMREGION_FW),
-				  &root_memregs[root_memregs_count++]);
+	if (sbi_platform_single_fw_region(sbi_platform_ptr(scratch))) {
+		sbi_domain_memregion_init(scratch->fw_start, scratch->fw_size,
+					  (SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+					   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+					   SBI_DOMAIN_MEMREGION_FW),
+					  &root_memregs[root_memregs_count++]);
+	} else {
+		sbi_domain_memregion_init(scratch->fw_start,
+					  scratch->fw_rw_offset,
+					  (SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+					   SBI_DOMAIN_MEMREGION_FW),
+					  &root_memregs[root_memregs_count++]);
+
+		sbi_domain_memregion_init((scratch->fw_start +
+					   scratch->fw_rw_offset),
+					  (scratch->fw_size -
+					   scratch->fw_rw_offset),
+					  (SBI_DOMAIN_MEMREGION_M_READABLE |
+					   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+					   SBI_DOMAIN_MEMREGION_FW),
+					  &root_memregs[root_memregs_count++]);
+	}
 
 	root.fw_region_inited = true;
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
