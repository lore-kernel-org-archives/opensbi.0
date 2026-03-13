Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6882B106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGNoDo4LPUgLwY/Z5LC8nUtDq1OcfADsg9w5ZFtYstg=; b=VavJ/F16SY85ku
	AUUP4JGoLa8o6nKwVjBlUO7CB/lI8VzOG0QYD5EghOry//oc0CgCm8LuNvqKLF/Zqbh0ylu83btt3
	pmwY+q5rQn6BcD5bkLb2s7NgBEyFWSy3eXeqg5mk2XLZK0N+rRzGZ3qNjpnCL8k8L3dHiwmoHp9xy
	OBLOV1BdMnlxFCS5ANwN1kvKaAs9b4yuHhJtSFbm6GVFDRaD3axv02jsf46A179Hld6rEAyIgLNhK
	pStN5IFRrUuIPKPU5aOnJvg7pGsauQbd558HgkwJFafF/Vnwn1ke8RXJAWOZcrzj1CZx6IMoIrUC3
	s2aBouGm5ha3s84khhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uws-0000000Gc6i-3wZ1;
	Fri, 13 Mar 2026 05:20:34 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uwp-0000000Gc4P-1jAL
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:34 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-358ed696623so813727a91.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379230; x=1773984030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R5mGboXuAuHSrtYMku06OMz4SVhK6fOvuXz30Qm4IFE=;
        b=OX5dP56gR25J0KlTAA7Xidpqs49oPfvDdU3+ORM0IaRtky4r828CEasxChBB5F3+y6
         BmwadH8gPFZae2JmWcWylG69mGZlCqntGHPNIKo5sHr7mxdLksE8wIZ1DYF83rmJrkuZ
         JTLWpBHhDOPs0lZ/4MRuF2/efbaZH/Cx/uWJzwkRBhYPI7/r2N6AypzxL4Nwg0VENung
         lbYNpZZzsIWsP1OnIv+PzqaVsuq+k/bM9KatFM1Paue3UwR/pH49E8wBA9v5p2XQVCqI
         M0YM0tdVDnnRmeFXEX2akCfFEJ+cZcJjgbfa/EvklYc3VuVZZRqbWcK9uryLf5BU1Ojh
         AzFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379230; x=1773984030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R5mGboXuAuHSrtYMku06OMz4SVhK6fOvuXz30Qm4IFE=;
        b=D78wHm++PiALR9PmwMy3V4me5GIx0keQTU+Tf5aEf1Lsgt6wFlvoVIp1YfaOIQ1g2w
         eWbZ4N8q3FT6gNSJ30ez0aQxuhB3sRa5XWITlckrkFNnBE/I7uVuPQMs8/C2gDdVzt3U
         1OOH4Uxp1l3T9wOb9dwRkPOYf7n16rjYMYTTsBZvaKGaU49faii51MU3zyAJ18uCNX2V
         ogprRx5WNF4vgNqzVVpGGsq9IBEzHgF+hOyJ3gMWDXpgB+nz2BhQFYPTvmyepTLTyA0b
         4+2TY3rFiIDjp5wrWjjdimamOPggLg2QU9DeyURVnhDBaKGCXHz2CQC/8DX1oWclWW7w
         FR3A==
X-Gm-Message-State: AOJu0Yy5rRfL35k4PZIOS/Z5lm3M5m+v8qJiAjeSV4oI0u7/Fur5Le9U
	9U/hLbjJtuWN4pRAKVvWmzr5i99x7//BciOtfKo0bQDrIUEAggzisiH2K+N8lw==
X-Gm-Gg: ATEYQzyTeShbUx8Z71Vc16S+Z7w5jqUuviDwCKCzV7nlwHGj/FrJPn6/qD7yV/YACEd
	rcwhAvUFZFHNin9wPEmOslnAtP75tRgqWGwz/lHcdroSvNd9GvNK7F9psZzVUpyKSD4Fp3gNHBe
	XIry0SzwS6qzMD85ocwmdSdWV3C1rNcTA5Y42EenP/TUvuc6XjFJuGzv9BNKIDD6ql9IOnSjWjp
	NxXMB83B9EUVUsdffajpfIvzj9vegtV6oVZrWYRINlTVQaOIAWEzqSebMKuKtutaGLcVPFtIB5G
	hNrPKyQza0DWNL6FUCkdEPQ4Zi1WwBhP7Ks5GTFa/ra92cT3SduivYRmj1YdV8nZk++nbE8ZRkp
	s2xlP8YRwOjzFu4NW4F8IY08vpDtO8Q60rvhKCbT6TTKfwSx0WMlxBH/0XVoqAnxaKnGb5ykt0N
	8QdbFwmzJEb50iIYvNQI85qljkMpYfvDixkBmcpf1rhI76HH7N0iEb4uk645sFJAZdxxsp
X-Received: by 2002:a17:90b:4ccf:b0:336:b60f:3936 with SMTP id 98e67ed59e1d1-35a21ebca88mr1722545a91.12.1773379230009;
        Thu, 12 Mar 2026 22:20:30 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:29 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 05/18] dbtr: Do not support chain bit
Date: Fri, 13 Mar 2026 15:19:34 +1000
Message-ID: <20260313051948.4017134-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222032_661636_948F5548 
X-CRM114-Status: GOOD (  10.92  )
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

There is no chain bit validation in in SBI, so do not support it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 65c3b2df..224f2350 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -466,11 +466,21 @@ static void dbtr_trigger_clear(struct sbi_dbtr_trigger *trig)
 	csr_write(CSR_TDATA2, 0x0);
 }
 
-static int dbtr_trigger_supported(unsigned long type)
+static int dbtr_trigger_supported(unsigned long type, unsigned long tdata)
 {
 	switch (type) {
 	case RISCV_DBTR_TRIG_MCONTROL:
+		/*
+		 * SBI currently does not validate chain bit in install/update
+		 * so we do not support it.
+		 */
+		if (tdata & RV_DBTR_BIT_MASK(MC, CHAIN))
+			return 0;
+		return 1;
 	case RISCV_DBTR_TRIG_MCONTROL6:
+		if (tdata & RV_DBTR_BIT_MASK(MC6, CHAIN))
+			return 0;
+		return 1;
 	case RISCV_DBTR_TRIG_ICOUNT:
 		return 1;
 	default:
@@ -613,7 +623,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		tdata1 = lle_to_cpu(recv->tdata1);
 
-		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1))) {
+		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(tdata1), tdata1)) {
 			*out = _idx;
 			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
