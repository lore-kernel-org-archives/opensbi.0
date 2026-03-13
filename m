Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E947D106FD83
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/n5ynxBCP7cI9EDpeN0l7VKU4cZPldi/UHzpdkyx4a4=; b=Ek8XV10ZqtctdH
	ZoPDEqBsICi2YklGTqChZm/KiT0G6LCSHYHKzkAoLqb8l3ZD8uNc7zZawXbZBSHBAWUbVbcH4jpYe
	koft43aRNvZFCOAK7Uuknx8r3xOicPO26H+erpYuHFgGHGrAERcRCmAg5ANa+MWNPPNQPUr8wXS7r
	5HTo/zXQIp40ygkmA4jvDS/5ntoTokXM/7ouMLneQtnRMYARwXAR7j6P8h1LNZqyIF6LRgurwe6Ok
	ekmWthbeOaNLRjD1STFR1R2LfLMAy4z54ysOdwgWtei0wLbFqxVT1W324zn6FgWYk75ViJrIvbW+6
	wXe6talat2fs2/kaPq4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwk-0000000Gc1o-3Zhh;
	Fri, 13 Mar 2026 05:20:26 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwi-0000000Gc06-0WTj
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-35a1230c60eso909529a91.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379223; x=1773984023; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMzGdshKrHrJ2HqbfwdwZLONgqHRE8SsWdQp/E2Wcxo=;
        b=CYU8CRtnKSAbrX/TtFoynGlosJmo1hOh/R0k0CsW1v4eQrQOI+k/RljUrlLcwY6F/A
         eKXI9oPljR30AzW0VfVqRNDPT4tMTUBGFnKxMRMOMnYMZ4HHWoOFfEdDtn3XqPZ2komo
         I2/VNPBxbtPKCHTZiZJPsCAtUHHWNePncoWrKst9Nh+TTo4d0HUM1gArChat4J+ByCGN
         we4jPOpfrUSAAk07Ho0hPfTyTRJPfNwp0QAQoFZMG/c9+5ZPCuLHiwtbg933gUh6z7nO
         X+0HYtU75sj/Di77WC5fOEoPXB27YrdRKYghxc6ch4hOZMS0wPc1cZMawWwFQicIKQxS
         dgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379223; x=1773984023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YMzGdshKrHrJ2HqbfwdwZLONgqHRE8SsWdQp/E2Wcxo=;
        b=BI2LXzLbO72xSSYY1DxTJETZq5oCz0O/7UrOsaWdYi5JP8Al5o9yQPwmifLmBfSa4K
         b1gzEN8TuG6hBQeUNULIkS1haKOO57HJEUoFDu7AGCP4zmy++f2Lb2qeKqh3Sc2rVvFt
         5SdgRUvJxDrEzV/owhDjnFNnR18sZOpEbZuFrfjlUy5d6vra38hpbc/yw6ZTAZX7THUE
         8r9JiVByW6hIQffyaMJOjWxFisZsNrQuw20BubDfQ+uLP2GE3MPf3CwTPufWCuOXS3eG
         ltsnsdi3kcW9oxIrkxfIL3BKllzL3iiYp8unk6ja8ZwMhynwOEk9YTwPykZuOxVcJ+z3
         eqQg==
X-Gm-Message-State: AOJu0YxHCk5yCbF9py2D17Mhl1BptcB0IYGQPJ1LhuT1nzOVq9LUQCGw
	9RwzQseXauct6frgVhiMhbDfR225yTQT9g5XJ4LN0yTSeYDcoodlN2UVV/5i8g==
X-Gm-Gg: ATEYQzxsXu8xlvT5BAvdIN3Qgv7nDd46Ox5TbjHzX7lG+zxoaMOc5S8lHSpdg9b36Dw
	MYHpSi53qDGDP7TOXx0WJJEkLb74pXKOOisCZ3uDqNN4HJAI7ePRmyTPkI0H213gSpZbLcgW359
	MdG66olzMscbL3ORct80ZmW4wg79ir7RYHx1WUjSCBau5kTa1ShFxmM9R5eN6idqFfZ+ks+Gtoe
	cB3pTNVtFsWG2eyd0Ch1OTM/2RTV423syehdcmlyujIqttNTkx/IbJo0/W+sxJRdphpNrQxIzSI
	PeIx95FrwlcOHRMr0URws2oldda5hFLHqE2naGB1nEcBm8K+9+W6i7d7fQhocOJP0+CzYgdi6e9
	LF9sa8tk6MFI8XL5P/DU+mpm/A40OIbBU04KX8n0xykSWgqrDaB/P7mElXiPm09GJfPwNPBrAtc
	JvaJjlk4I5/J6lZx0MVJYn99PTQSxx7U6gwOeuQ+fUKhPiMN4n6Y06Fc3pk8t/zfR1zgc6
X-Received: by 2002:a17:90a:d607:b0:359:87a8:e65c with SMTP id 98e67ed59e1d1-35a21f89937mr1773942a91.17.1773379222724;
        Thu, 12 Mar 2026 22:20:22 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:22 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 03/18] dbtr: Fix endian conversion in trigger install handler
Date: Fri, 13 Mar 2026 15:19:32 +1000
Message-ID: <20260313051948.4017134-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222024_162830_C0610C27 
X-CRM114-Status: UNSURE (   9.70  )
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

An endian conversion was missed loading tdata1 from shm. Add the
conversion and change the variable name from ctrl to tdata1 while here.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 8f59e407..10ed6b3e 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -589,7 +589,6 @@ int sbi_dbtr_install_trig(unsigned long smode,
 	union sbi_dbtr_shmem_entry *entry;
 	struct sbi_dbtr_data_msg *recv;
 	struct sbi_dbtr_id_msg *xmit;
-	unsigned long ctrl;
 	struct sbi_dbtr_trigger *trig;
 	struct sbi_dbtr_hart_triggers_state *hs = NULL;
 
@@ -609,17 +608,19 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		unsigned long tdata1;
+
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
-		ctrl = recv->tdata1;
+		tdata1 = lle_to_cpu(recv->tdata1);
 
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
+		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1))) {
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
-		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
+		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(tdata1), tdata1)) {
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
