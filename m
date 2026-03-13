Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67DDD106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EnVVoY2O3yPSgtaDKWXBp4UjwcB0O2qbHE+DsHiT8g8=; b=x2rg7Grxu5rQCj
	/1wcEaUUFPvNrZUkX5nPeS0M3c6wgybidWtaxXC8AAzsSKMd/eTj1k2tLN8IWw4knuWrfDWN/al6v
	7jIvzibHEM7O+eXQQdgCZBuQKLZOsY0m3s8tDtyHNyZDltbsyyL5MS5H7LF9Xfi9v5cpVmgobyjZe
	mao6e3MZdrQDM6HaHY31Lm8YnqPjgae7OLXSSCzMqsagVISzxzSiQZgXtKpEyw383yyvM01mQCzpi
	MhharqUGY8epCI9z2+ths8QQCESZ4A0t/AyZS3E9Twm+5jSkoWNTjt6gfiQq9LhDe5tJVx1DtcQSE
	uoNaLzYTM36UuGmIoknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ux2-0000000GcDY-0qzX;
	Fri, 13 Mar 2026 05:20:44 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ux0-0000000GcBt-0eLG
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:43 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-356337f058aso1175915a91.2
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379241; x=1773984041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KorxEio0DpK168r87YFJtydBmFtpn5auAJuvcY5xKTs=;
        b=du1pnfFMVqfbd3hyswy1inNRxfnEU48BiFi3Wx5ZUtnzDuIuHCTeMOKi6F8g4EQFV8
         XA7bnlnwLdypEGKDmAfXTvU0ju9FRTT0uJSMLdMluyPtytRcY5YfRO/cynjB8lhMiMQf
         0NxtLtjs8I+algqplwIVZ2gmzkyRk9xLpNSKvEW2L/oeCzFrk7ktkedqpazg04TNfgEA
         LUhcxbQIKceu+BivMVGN9NnqX3db1vhDO94WB1wUrtmPnM8GDYkVt0yVn4yYcPijkdfT
         mrRbX0cqYw60msHBTT1BzQdNQ5EfAsqQk2erfbtecuX2m9Fw0Jdc5PW/8SBKxkqT5BMw
         Bj1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379241; x=1773984041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KorxEio0DpK168r87YFJtydBmFtpn5auAJuvcY5xKTs=;
        b=l4v80KlmRLlLCSed4Yc1wtyYQTKfg2b6fUyMn314YD5rLbBrZH/x7+qYM9gAHNQnL5
         M4rDfpYy+DGUd+tsBce2s0r5gWGGNOjfHb3MaDndvttR+cLOTtKMtWj6wJ9qgaz0RLfD
         2qBNCALYf7eookBWwDTWPzmt+ln0Xvk93he7jaiyUt3gCvCZ3rpowtAUYJJKG00Or1/4
         OF9FUQ+vDpd4fs9feAGWogzyjxW9zCUhs133YhcnBbD8oiGVr5FbrubcDVKihSjoPNGn
         Xa2+OKaVqpPWQIroJTCTYlP5JP1563+HSn2Mo71yUMYwyxj+nDJ2UWzYEV/30R2zmo0g
         3SCQ==
X-Gm-Message-State: AOJu0Yy01PDsIdDhevimalQrG2fpCjgAeWbalT2ly+xc+QiGRRayAHOs
	7dffu9Q43DoPTylOJLpuCLwj9X8aZeL/9Lb79BcCUthf7yGkbo0hRTqlEOop3g==
X-Gm-Gg: ATEYQzzCW0x01hlLt2fgOFV+XfqT/t8J5F7ySPX4XaB+Tzfpk1av25kaJUkfpw1HEZH
	3yMDpXgrhVoZHYrgqu05489IzorGzqxRyR3eAeXEj5dStfarCpe1+a5bzsZtIYKwjdg2dwT5BUw
	849MwLsk9Pc87lT1kedWlINNNF3TyeKzLNbxn1vSqNIVQMv6+38M+Y1zf+ZO6jfSQP6BiRJBE/Y
	RukYmgGGMa8vLCShc8gVCJKGFQ4rwFax4NLVDIfxI1Y4ElgpfRm+oDffSSD+CP42dYeT3Al7WCu
	2iCBXkgCZdRLbXVpPl4WWpDe1utmY51xjK1Nr7GhxqqVPTPZ9/ir9PNHxvI3I6qOD1RNQYAVyIj
	KvrfBHPjTa4Kz6wjoxKhlrzC4yRggOq88eMwZWFIzWP2jMl1f6tvCYjn6245ynxYb5UHr++fJt9
	cfqyY9v4jZf1eSZIHWkc3Ykyz8vWp9SYxuVYa+LRa0LsDy7y+5ZhRdNT3phhYwjurCcF20
X-Received: by 2002:a17:90a:d44e:b0:359:8812:7c01 with SMTP id 98e67ed59e1d1-35a220d2afdmr1611432a91.28.1773379240806;
        Thu, 12 Mar 2026 22:20:40 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:40 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 08/18] dbtr: Improve error handling for trigger enable, disable, uninstall
Date: Fri, 13 Mar 2026 15:19:37 +1000
Message-ID: <20260313051948.4017134-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222042_197317_0D1124C3 
X-CRM114-Status: UNSURE (   8.41  )
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

When updating multiple triggers, error checking should be performed on
all triggers before changing any. Check all triggers for mapping to HW
in these handlers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 3925170f..a2c45061 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -672,7 +672,7 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 			    unsigned long trig_idx_mask)
 {
 	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
+	unsigned long idx;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
 
@@ -685,13 +685,17 @@ int sbi_dbtr_uninstall_trig(unsigned long trig_idx_base,
 				trig_idx_base >= hs->total_trigs)
 		return SBI_ERR_INVALID_PARAM;
 
+	idx = trig_idx_base;
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
 			return SBI_ERR_INVALID_PARAM;
+	}
 
+	idx = trig_idx_base;
+	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
+		trig = INDEX_TO_TRIGGER(idx);
 		dbtr_trigger_clear(trig);
-
 		sbi_free_trigger(trig);
 	}
 
@@ -702,7 +706,7 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 			 unsigned long trig_idx_mask)
 {
 	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
+	unsigned long idx;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
 
@@ -715,6 +719,14 @@ int sbi_dbtr_enable_trig(unsigned long trig_idx_base,
 				trig_idx_base >= hs->total_trigs)
 		return SBI_ERR_INVALID_PARAM;
 
+	idx = trig_idx_base;
+	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
+		trig = INDEX_TO_TRIGGER(idx);
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
+			return SBI_ERR_INVALID_PARAM;
+	}
+
+	idx = trig_idx_base;
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		sbi_dprintf("%s: enable trigger %lu\n", __func__, idx);
@@ -810,7 +822,7 @@ int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 			  unsigned long trig_idx_mask)
 {
 	unsigned long trig_mask = trig_idx_mask << trig_idx_base;
-	unsigned long idx = trig_idx_base;
+	unsigned long idx;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs;
 
@@ -823,6 +835,14 @@ int sbi_dbtr_disable_trig(unsigned long trig_idx_base,
 				trig_idx_base >= hs->total_trigs)
 		return SBI_ERR_INVALID_PARAM;
 
+	idx = trig_idx_base;
+	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
+		trig = INDEX_TO_TRIGGER(idx);
+		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)))
+			return SBI_ERR_INVALID_PARAM;
+	}
+
+	idx = trig_idx_base;
 	for_each_set_bit_from(idx, &trig_mask, hs->total_trigs) {
 		trig = INDEX_TO_TRIGGER(idx);
 		dbtr_trigger_disable(trig);
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
