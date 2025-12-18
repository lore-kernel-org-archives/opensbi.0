Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F26D6ACE6
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 10:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2nfz38FNpAx3W/lpGmASinZqwNhtm2NxkSTFmyFE6L0=; b=UYznPWBWrHAM0x
	qrU6+N83E4ojLhhj196GY0t8/vzGz8WTrYRPGRPlq+sU+Ktirqke+Ypn9divE2aCABrc5VWPFE/s5
	0omeh8y8uQ3iU644tl6XAVHqaPLRrPHZyLP1my6CEY4NUXAFjl3BYbJggGH8h4wBWw2Nk6EHB98A3
	oWhVxTEbn/pZ3c/mD9SFsytBTqbhfSky/CnCmFoJnspAmVsqKYMSv/NRm4IWOiEBBsRtnzTOMxsM6
	1ByAYx52FRt0NAYTyAApMHpGfX0/VViYAjDZweNHKeEotpLEr60RdKhptvYo+f8b4wFOYjnkP2Qxf
	DW4ILYxRr7ERiCwmc/hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV2-00000008Fj1-2tro;
	Thu, 18 Dec 2025 10:44:48 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBV0-00000008FhB-2FcF
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 10:44:47 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so415215b3a.1
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 02:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766054685; x=1766659485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2hsTq8w/WzfYOcHXKGHmf3j6fEqMXj5p0XzGLliv9k=;
        b=e3H21+KcMf6IkbqEgL1kNS+mIEgw6yMThFNzgV4WUk5TqRLRstkBP6F8UX1tAyI8+x
         ydDId3ze2duTPU9tgt7W26wrxjK7vPYAp/0YbEjcXxcHFHV7Dg/+GoP8OPvmiJiqmJao
         j//KDaSPnyeQFeWw1Pzs5QOw8LCbI6BS+X64vRewqbouWU3LgIo48Ra1606316CYe7cx
         W9O44KsZzbtXRkiSkOmveqkkGW4lZtMRqfPai5mG8cHd3xn3bF+7R8ech2SCeYf5eJb/
         uEvsUYo79yI0swKjlJQ+9zWST6CsDJ7j7BVmgX7CYVPxs/icayGv+YAvVoWBtQ+CDScr
         7YMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766054685; x=1766659485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W2hsTq8w/WzfYOcHXKGHmf3j6fEqMXj5p0XzGLliv9k=;
        b=BEd0JdE/s9smzlmgPTwhKmjj6iOHUsXtQXPg0uPjxpXj48Cwq1c+Xetq97GfbwXNTi
         tTmKFgMZ8BN7olFMXHXXGqEl/VtBHPwyhsZtfkNXG2ZHs4Yi+OxL0/aSVcDm5v1b1GkX
         Ls/8BppB8md4L0cMtzCCAqLvnKTaQJh46llnbnsn7ObA3Ke1bEuhvWKEmIYVNCi0rPwK
         ogVgpKzZ+gPJ+IfBYj/qwM6AM/b6AflKoKpsY0lOUoEYXxRlxEi+tSPzLdn1CB1xcpDC
         LnML9e7TP4xE7xBUb5MQaDALy8jme6afuCbX2XPxAu9nAFGM1DKUkLStFQz4/dSh4ADX
         NB+Q==
X-Gm-Message-State: AOJu0Yy9PWLBEgxMbjg6Nm256mEw8b0e5Qr7PXfdkirpDTqz+Oat0PNm
	/LNDvLbGBQeDXVm5rMZH9WTx+tR0tU0sTU7HjQ52VzAUrJtcwcOK+DnXofWApw==
X-Gm-Gg: AY/fxX47nmeXZKViD9u8irUBESWh9NRxiHwWjpRsqTLWa91Sh76bOVvhlsoZCaZl69O
	msxCO2ZYeGL6eEx7YVTjYewRUVyupMuE6SHQVfVz2BkkeODfcb0MlEvaPQBeY0ImJ0YLTxih9RN
	CwREhZxQh5o2MSPt/Uamk+PpK37Ny9tDZdbhWe7JpG+RFvfd78anj88fMb0nowqKx7+48oemb/m
	4+pKCIoWFoI+4hmqhqtyCBVE9rQ7wTMSuiyYV9GERsORHU169mBbTS59+FR4AfcHv6SsRtDAn1/
	KjEStkRP0QuDHzxCQkJA66boj6ekoF9HVbhsnMJKJxn/o7t1sEZWo4ymPuv78BbpUfmOtyeu9wB
	P8bp/59kE9ak48nrdWa4rPTkyKxBlLKSRGFVALgnhOG9mZoorpe7XR26vA/Ma4N1WQ0FbLGUY3Q
	UrTzklJT2x2rzX
X-Google-Smtp-Source: AGHT+IFNQtl+z3GN1UDZI4vntpuMoWjTWNkH3SBe4PxYYsz+yhWXSrN7GlJOq7HXyBJNSSNTAqEGug==
X-Received: by 2002:a05:6a00:94f4:b0:7e8:4587:e8b9 with SMTP id d2e1a72fcca58-7f6693a58bfmr17983436b3a.44.1766054685390;
        Thu, 18 Dec 2025 02:44:45 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7fe11d3e004sm2264795b3a.15.2025.12.18.02.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 02:44:44 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org
Cc: linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com,
	gaohan@iscas.ac.cn,
	samuel@sholland.org,
	wangxiang@iscas.ac.cn
Subject: [PATCH v6 4/7] lib: sbi: give platform choice of using single memregion to cover OpenSBI
Date: Thu, 18 Dec 2025 02:42:40 -0800
Message-Id: <20251218104243.562667-5-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251218104243.562667-1-ganboing@gmail.com>
References: <20251218104243.562667-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_024446_587739_305C980C 
X-CRM114-Status: GOOD (  14.93  )
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
index a19bf25b..90cbb540 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -923,18 +923,30 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
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
