Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A977CCD199
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 06:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UbaFKGaops6Vs8SCqKEBMt02qKfcLiv+RO1d47K05HE=; b=nDIRteRB9wPaH3
	a+bjzWjwvhnoxn8bCBLNe3yxEhLhA09YbPSGxKS+q4GSIp1RTml4/RrdIMu6b5MzxK/t8MMj77rdj
	y4/MJk3BpbXwhG4LUkB/ExrxWoe3HitsLKhEfOpz8GcZqYa0dvVMpTY+Rb8VPwkFpn0wnh6u1CoOI
	+75Ax+qzYNCNuaLQ+F7wJMv9xOkP76kkZlJMXnsLAXduHcOnNf0ezb6tmmIq/zNQBjCTAhnpacFvg
	nct4h4P8O42GIIAE9oU53YqC/W5utucOfGgc9unMyEbWBYIfWCJ8OzSSWc6o/VYg5980zIQOpRuD+
	r+bJLZynI2HhsNde0LUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMG-0000000C24i-0ICH;
	Mon, 20 Oct 2025 06:27:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAjMD-0000000C1zs-1lw2
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 06:27:03 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-781251eec51so3127058b3a.3
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 23:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760941620; x=1761546420; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zEsK7B9rohuBlouTJCfv1QAn/0RcE2F1u7YlEdY/sTI=;
        b=JtznkGw0Km+laNfxfuuYI3BFUdBYkzMnkEX/KA3KTuHIcaiSWmoEdlsKRbNnUsOjp2
         HrIeloGYE6dkmVZJRl4lkXoYcBktWtupnRi3A0+wHCYCUzww21Qsrbb7rc4+YU1p0/uI
         MiQzS/sPRWkzOQLSrNnu4wXLsTExU5+t16Nc0nUgXQwkU4XXtx/8uj6OhXqKyZwTVxWx
         ZCxQ3nG3CzPLsg1eWNq0iP53BhwjToIBtIwWAdA+WHf0fFJVSgEqb/w10Q4K/7ZqIHJ1
         Et+4ByNaYRvdpuciTvCT6t8XPYphUNofzhmACdB2xebwc935652T29w64Ewe2FSEeYVO
         qoDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760941620; x=1761546420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEsK7B9rohuBlouTJCfv1QAn/0RcE2F1u7YlEdY/sTI=;
        b=Gmxz8A5qQTxMCK6S+ppirHQc4X21v+dlGlsHIdSpc7Pil9Y2Udw/vYRCU9D9SxNdsx
         WOwjsEjbin+6jwtd0XA7lW6pFbrnoFPrk5dWIhVQk57wU2spMa+uqIrA1KBQ89Yq1djb
         zlYg/FjyjWJlAo8DvxTS7P3CEzNgkkcEiblDQHXz6/kM3ZkwLKQ8rYVG2fmhbokBRwS8
         D7WhoGU5ah6i3KweHcs3ETeqag3SOJtCsdDYFZ3svyaJ64IH9Hukp3mIIJH5X2Nb+RS9
         TeZB1OEUE3b97W/E5EA+8VryfBQGEf9caclILbwcvm7QkQwvoG64Zwokv9mmA8JAgqXy
         lAgA==
X-Gm-Message-State: AOJu0YwRkPeqaNPAd8SC8gOgNuyQHeCIPuhLWPR2QDvrhUQEBHDl3Bit
	ds5H3k9UDaU735SZyE2ebEUxXfTWC0afJGve9Mre2RXnatovIyB+LOr+gLeefRa1rlM=
X-Gm-Gg: ASbGnctaMllZBKZY0JJibwfFktNAJz+1OMvdHM3FHkXUpjX+iFREkblcLMr3rrbQ7FA
	OqsiYhWeCyDSZ2qfZ0DgoPA5K54jCP/e7eAdmfZRxEcUhe7xgogb4xOPRnhGNX5pwZwfPoK0ovG
	jB9y6nsO8Hfgi3yK8R+oZnpSMNZ0nuqy2or9jhf0mIyS2zPHKoL48brXfsp1PVnxyd7winTx14M
	5cQYq7Fluta16tXJop1KYPHZWcsa6pOH5qPYpXTG62yl/w/hev+t+Vbm0HJU+q0ZjvAYFtfAXJe
	pShGV0R1rkHASRJW6HKi7b8JM07DFiOdh1vuZgRR7I43XjpLVHgsuEUTPw8n+LNhKYyGyycKOjt
	/ttGdoCXObpaFhphr332nomB19X1UrafXYJDiWIBKnf+Kw8RwsOoCERScL3cuMXlRYg3defD+/g
	==
X-Google-Smtp-Source: AGHT+IGOUcIXFkXUKyg1nf1u4M/F58/gcv5KvVmy0I2qdXqx62+0rfVm+3xwFshRjy036ztrWUT2tg==
X-Received: by 2002:a05:6a00:3d06:b0:77d:6a00:1cd1 with SMTP id d2e1a72fcca58-7a220a814a5mr13989282b3a.12.1760941620483;
        Sun, 19 Oct 2025 23:27:00 -0700 (PDT)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a22ff349bcsm7301244b3a.17.2025.10.19.23.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 23:27:00 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
Date: Mon, 20 Oct 2025 14:34:10 +0800
Subject: [PATCH v7 08/12] lib: sbi: Extends sbi_ipi_raw_send() to use all
 available IPI devices
MIME-Version: 1.0
Message-Id: <20251020-cache-upstream-v7-8-69a132447d8a@sifive.com>
References: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
In-Reply-To: <20251020-cache-upstream-v7-0-69a132447d8a@sifive.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>, Nick Hu <nick.hu@sifive.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_232702_050602_86F9CAEE 
X-CRM114-Status: GOOD (  14.62  )
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

A platform may contain multiple IPI devices. In certain use cases,
such as power management, it may be necessary to send an IPI through a
specific device to wake up a CPU. For example, if an IMSIC is powered
down and reset, the core cannot receive IPIs from it, so the wake-up must
instead be triggered through the CLINT.

Suggested-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 include/sbi/sbi_ipi.h          |  2 +-
 lib/sbi/sbi_hsm.c              |  2 +-
 lib/sbi/sbi_ipi.c              | 16 +++++++++++++---
 platform/generic/andes/ae350.c |  2 +-
 4 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/sbi/sbi_ipi.h b/include/sbi/sbi_ipi.h
index 26d1b66b7cfffbaa6f7cadd0fab8c810adfb1811..2c231041662bfb55b2f962ca48d724cf6aa53f6d 100644
--- a/include/sbi/sbi_ipi.h
+++ b/include/sbi/sbi_ipi.h
@@ -88,7 +88,7 @@ int sbi_ipi_send_halt(ulong hmask, ulong hbase);
 
 void sbi_ipi_process(void);
 
-int sbi_ipi_raw_send(u32 hartindex);
+int sbi_ipi_raw_send(u32 hartindex, bool all_devices);
 
 void sbi_ipi_raw_clear(bool all_devices);
 
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index bb274b33d6ee5e3db9953f4b591502e4522d99d1..0d97b43e0cd8f7b4fc97407ef01007485e3f5a24 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -364,7 +364,7 @@ int sbi_hsm_hart_start(struct sbi_scratch *scratch,
 	   (hsm_device_has_hart_secondary_boot() && !init_count)) {
 		rc = hsm_device_hart_start(hartid, scratch->warmboot_addr);
 	} else {
-		rc = sbi_ipi_raw_send(hartindex);
+		rc = sbi_ipi_raw_send(hartindex, true);
 	}
 
 	if (!rc)
diff --git a/lib/sbi/sbi_ipi.c b/lib/sbi/sbi_ipi.c
index ed9ccffb6c96cdfa1151a22d07c2bfc8181769bd..5b2d2f72eeb918a8877b4b8fbf201f2b9628f069 100644
--- a/lib/sbi/sbi_ipi.c
+++ b/lib/sbi/sbi_ipi.c
@@ -88,7 +88,7 @@ static int sbi_ipi_send(struct sbi_scratch *scratch, u32 remote_hartindex,
 	 */
 	if (!__atomic_fetch_or(&ipi_data->ipi_type,
 				BIT(event), __ATOMIC_RELAXED))
-		ret = sbi_ipi_raw_send(remote_hartindex);
+		ret = sbi_ipi_raw_send(remote_hartindex, false);
 
 	sbi_pmu_ctr_incr_fw(SBI_PMU_FW_IPI_SENT);
 
@@ -271,8 +271,10 @@ void sbi_ipi_process(void)
 	}
 }
 
-int sbi_ipi_raw_send(u32 hartindex)
+int sbi_ipi_raw_send(u32 hartindex, bool all_devices)
 {
+	struct sbi_ipi_device_node *entry;
+
 	if (!ipi_dev || !ipi_dev->ipi_send)
 		return SBI_EINVAL;
 
@@ -287,7 +289,15 @@ int sbi_ipi_raw_send(u32 hartindex)
 	 */
 	wmb();
 
-	ipi_dev->ipi_send(hartindex);
+	if (all_devices) {
+		sbi_list_for_each_entry(entry, &ipi_dev_node_list, head) {
+			if (entry->dev->ipi_send)
+				entry->dev->ipi_send(hartindex);
+		}
+	} else {
+		ipi_dev->ipi_send(hartindex);
+	}
+
 	return 0;
 }
 
diff --git a/platform/generic/andes/ae350.c b/platform/generic/andes/ae350.c
index f06e207d80f58703098ef805a14e1f8764c2cb16..0808065745af21f5d65f0114ca33a23949280296 100644
--- a/platform/generic/andes/ae350.c
+++ b/platform/generic/andes/ae350.c
@@ -35,7 +35,7 @@ static int ae350_hart_start(u32 hartid, ulong saddr)
 	 * 2) the target hart is non-sleepable 25-series hart0
 	 */
 	if (!sbi_init_count(hartindex) || (is_andes(25) && hartid == 0))
-		return sbi_ipi_raw_send(hartindex);
+		return sbi_ipi_raw_send(hartindex, false);
 
 	/* Write wakeup command to the sleep hart */
 	smu_set_command(&smu, WAKEUP_CMD, hartid);

-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
