Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B17106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psBWbSDSiqttI4hSdg5n0yeFW/Qgf09Zq6cMQDF5oRw=; b=3Gx5oKAKPj3S4U
	lIfJvkR6pXJXK4tyYm9yUpeHDYQZhjdu2JyGdEK9cv0v/79UOMj21+N/Gl3aV7i2OEnv6E2zdHvMt
	FBigm70TgNNFUuvMf7IHyv1FIJadLsKwoT/2mVgUT7lafu2kCmsLwaGYF5AMYNM9AJE9b6j6MP1F1
	j142ZLMbBSesbzyJuwEbceiui67gZHtRt6TT9wzeeTVz2/y5OqTjyz502TEeCaefK2Yrv0Wuz1U0o
	O8XeJh1iNU8yxMlL3vTn73XVENTH3CzCxEe4s1Kj4H/y0mdAP0WYCFC2Q93riOKa3Lse1qZ9XQ765
	tUsONPyieW3DDsUynTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwe-0000000Gby5-0HZ4;
	Fri, 13 Mar 2026 05:20:20 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwb-0000000Gbx7-1398
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:19 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-359fea895b5so1044141a91.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379216; x=1773984016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGFykOBYT8IHvuY1I/zVTEeojhco37SyKNNEEk1dtZI=;
        b=MAL4JdG6Fp+7UUXfT8poA+XCcjIfVRxvJNMRq0ta/5zzAb3HfkDrVjO7Jf54ntD+3U
         QArfLs6QPFc+XhXXKD3Y+z5uQUGkTGOnt40AIuv8ZQ/XzrpcH8ch21c24fF5Cw0ykvW9
         yHxQpKTB+qvvWxZuplRsjBBWH9R453/StofSOZwyAgd/W3cAGQIfW+dLIyh2EE2kZR2z
         VxcDObdCpm5hoL78svOKbQSQwCqE1t5aBkRUF/5w67x3yiN2+G5/pRtt7+OoCuzHvVDh
         yqpjPdPI0r3GtIqeHLa7m8wme+h1oRYx7GcjvOmsnlMB8wOjHmMnuYewb0NzgWOKM5pU
         /vEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379216; x=1773984016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGFykOBYT8IHvuY1I/zVTEeojhco37SyKNNEEk1dtZI=;
        b=OsqxaM2Ty/sM19H7p9lrgul1JU9TaC4PnWHPrAo1PZG7ucWQBn5V2kivo5mPBW+GSe
         d+jQJi1Fia7MLRn/K8ApPVcXri+bl2HuuyldRgFvMskhABt2TLLd183ZknfUS1ZXbTdT
         D3DhZOrwLEg+L+5uQ6RSBLGX05J64UvrKNCYEcf+No+hqsTBNvRqzfqvYj2CKTE47WuK
         tjX6TeeRMLwlWtV4hGywJ4uLOFa49pXKVPiUoJ427cCTyG8EEn6viQdhCN+SMvqZX+2W
         ady19XgcHZDGXbyChcgcQgTNKjIDFldO2ihs7qxNt/aM0BQIbHbNV5PEG4DOAq5gniPf
         /xKQ==
X-Gm-Message-State: AOJu0Yx3VC815ye82U6HJdGCfx73xtPtEFcmT1/6Ef4N+n9a9lPul5Iz
	sPWtBMYYbXjjzeBrmk8zqsF0NmtcUJR4dNa87EPBHbDhByb5LvknLUjQZVPcLQ==
X-Gm-Gg: ATEYQzwopULpPYxP9nsq8rnJrmRC4oTjMoX0eB9178QWo0hogkBUX+yOIaWDlzYXFZV
	f3cQ/I12qLY0ksC2rZcc/eTgtUAvP1FRdR1ZS1ta9DordtFmXF1yKunkan9rcKuAJp8lLC4QxD/
	8kIkBStjg+zdkYrMpVHLRmpIECFAqFrzcART3EOmsWcHNOdnQGECZWT5biDaAffwkIvTT1xlytb
	2JM4zan2rhWzH5iYBw9bFvCOguhjHJ1edNpBLnjh8ZP0a4Cu/lsfOCqrSMKaMY4kv/hV/W2EJ2N
	YWTrfAVqtKPxmZd1m90Bz0ggQ9uiSVpPCJUIeuVftIEVGUal3xqNxkc7c3/jsnAw4Jaq335cIER
	BJufNATQIfI8S6STnPQ8d/tYXRjtQmq/DjkDhfAWv4PijfpSH4tnUxdorj1eYy4xgQQ3lqI0CC8
	IANBLl5jxtgL+t5hgbV6mEKf6m0KrwsK/bXY9lUUW4I2ELLyl+358Sj4+1UmJMAW2Vimzt
X-Received: by 2002:a17:90a:e7d0:b0:359:ff8a:ee46 with SMTP id 98e67ed59e1d1-35a21e30c55mr2087838a91.3.1773379215798;
        Thu, 12 Mar 2026 22:20:15 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:14 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 01/18] dbtr: Add consistent range checks to trigger ecalls
Date: Fri, 13 Mar 2026 15:19:30 +1000
Message-ID: <20260313051948.4017134-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222017_571253_0572B89C 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

Be more consistent with the sequence of trigger range checks in dbtr
ecall handlers. This includes adding a missing range check in install
triggers that can result in SBI past the end of the shm region.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 27 ++++++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 8bcb4312..b0160163 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -550,6 +550,9 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
 	if (trig_idx_base >= hs->total_trigs ||
 	    trig_idx_base + trig_count >= hs->total_trigs)
 		return SBI_ERR_INVALID_PARAM;
@@ -594,6 +597,9 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
@@ -663,6 +669,11 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_idx_base >= hs->total_trigs ||
+		find_last_bit(&trig_idx_mask, hs->total_trigs) +
+				trig_idx_base >= hs->total_trigs)
+		return SBI_ERR_INVALID_PARAM;
+
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
@@ -688,6 +699,11 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_idx_base >= hs->total_trigs ||
+		find_last_bit(&trig_idx_mask, hs->total_trigs) +
+				trig_idx_base >= hs->total_trigs)
+		return SBI_ERR_INVALID_PARAM;
+
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
@@ -710,14 +726,14 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_count >= hs->total_trigs)
+		return SBI_ERR_BAD_RANGE;
+
 	if (sbi_dbtr_shmem_disabled(hs))
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
 
-	if (trig_count >= hs->total_trigs)
-		return SBI_ERR_BAD_RANGE;
-
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
 		trig_idx = entry->id.idx;
@@ -754,6 +770,11 @@ int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 	if (!hs)
 		return SBI_ERR_FAILED;
 
+	if (trig_idx_base >= hs->total_trigs ||
+		find_last_bit(&trig_idx_mask, hs->total_trigs) +
+				trig_idx_base >= hs->total_trigs)
+		return SBI_ERR_INVALID_PARAM;
+
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		dbtr_trigger_disable(trig);
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
