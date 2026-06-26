Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C47CD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GO+J1FldprrJhyTdHwW71RxaY240kz3QoihWlQ3DkNo=; b=mL0Z0w3Qm8i/r4
	99v1DXRo0vK0VkoHjKJOiqCn4AamyGMBYEDKtnHDSC4fr0sd5Kiw9beLAYkSU5ZOUMlZqD1cOCNRI
	9dyX2BhHQvX0azvyJ/lLX9u6TlxS+YlpuBr/HNIDuH18SGnrWsbNLMEi7k1QyMzMggynND/jIzIsa
	S05s3+WJBrZ1mqjX/dqizixYSRgGoI5URdOAYo1GX3JpECQ9TGV/98ip0/F4UErLeJuwWktNCT4nD
	6kIvkNVHUnsQG8lJOlooVwHjiB+6aFk7z+5CLdo2LntJ/y/wOrML4g+3vKzO9CcGW83VY4pOsaTng
	bMJXGEmufUUf+/FRJFcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3c6-0000000B4La-4ATV;
	Fri, 26 Jun 2026 10:16:46 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3c3-0000000B4KE-2Liz
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:45 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-84532e3dbf7so357969b3a.1
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469003; x=1783073803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5I2LZKB98hS7GG296PW/GeckxhPydigT9/2xcBd/V/8=;
        b=YtVI0//O7CNgXJ+LrXt83Cpymy3YVBofUB+s7o09rNMj/7s8lYtEDrfC+4WWVgba7m
         YCDCgvmG4fi3V6Ed/hN8f5TJCLIcxXJefz2DQhVjrERN4+yqvsK2XzDj1UYrQruRsVqH
         D6ypb0UAJoQO7DxQK9QwUSuMEpGrPRnMWa8VH+FZMehQkzXOonrijM6GVFPVMKqS8suz
         bPn+3k/5f7QAIs4Q8AiCkbA8+V3vBhIBp6FsMPmlA3DYXtxlskDy2xXKPRzxNJOoAoYS
         WKWF1+hBxiALPlJYCflO0RZtnrUs8Hz7MIrfq9cmX3Nm215TyIpYyycehAtV4gSpQkye
         L88w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469003; x=1783073803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5I2LZKB98hS7GG296PW/GeckxhPydigT9/2xcBd/V/8=;
        b=r3budm//3wFwwhNpzmh1az6Sn1JkF7gjp+Sa7t2tTYb27sso8gzsQzli4T1UyJzgMW
         gfBoMtVpNXyfBk1iVOd/P4VMq9PVVVtmKhr4oXbzm9PzR3yZxyOvf/hNKKfhxRvmqkw/
         PUIaE+jXfQbPGuuySkqbtrnqHue1u+rJj6sqMeYISEm3hZizX0W6Vr1iRI6EEW/4agp5
         z78Q2u8eIPWb3tMiucJPCfNLxwCvyqV0liOakcACx0V7hcXAHGzeUntgtpZ/CXU0CpDw
         QR+sObkpxmsoW5k412mt0YakeoqzAoMu9KrI9htIU0oKbL/+IA+lrcZCjpT5t0l2ZNRj
         GJ9A==
X-Gm-Message-State: AOJu0YxN0AFPCdM+FpvG38TvffMRghvdRZ4DswCCdqfOZN0Wy3kYor4A
	4MO62wCieNwEh5qwNmaOsXF4+PrX8ofTH1OSe4N7pzp8hSizXTI4wQeBUTl8Ndg70LcZ4dHyYAW
	yhuvfuqyejdBYpdCkOpkSOz9Qrnoy9WUP9wSt5OM+TjLS9CtZHDaIr+DQaQM7T/Q2TKL6Hdgwg0
	j3dS5GBcNE9bbN5xINN0rJ3g6hwVgeWw5cDDBex6G3C7mPwOLZ4jk=
X-Gm-Gg: AfdE7clRBwirXTL6v2xFqLZzZwiwR+LzRc+Z+UX4zUZD14OQ4ZvVaanheVmm6FUBhoa
	n54JiuqZXRW0ltpFDsNR4v+XvSk9Z8G5BSbdaTa0EBYYkMWDKVkRT4hhoy9xWAG8UNPAtGPkJAn
	e1C39i/3n6nf6cZDm7Z4buo9E7Tr6AKVePkiuLz+r9FjdBcQvVph7de52GOEr1/9ia0AYYFkZbl
	PJeCJxTDG+TriMqZuX2l0J8scF5GYGzLaKFwmVG1a794oJkvTNv7PYmR/ink+B4NV58XeInvUv5
	pBnC+E0EXwB7fvPPmIvFxO+PAXateq+xxy8t5Al787MhpL78qTwopqcr4VVnxoblsCiPxwAYFx4
	dHy97csO/GUDsPBbNfWRFj/9GDNr3eEFn6atv34ngZF/sGcY3+jD4qY8GSIoHf86bp4YPnfxNYu
	JS01DNbUkdGIbPP0JA5EZA8pTz2zyj5y4atCS7
X-Received: by 2002:a05:6a00:3d0a:b0:845:286d:4687 with SMTP id d2e1a72fcca58-845b39c53a5mr7206004b3a.5.1782469002479;
        Fri, 26 Jun 2026 03:16:42 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:41 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 03/12] lib: sbi_hart: enforce riscv,pmwid for Worlds ISA
Date: Fri, 26 Jun 2026 18:14:24 +0800
Message-ID: <20260626101433.3133466-4-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031643_601287_BA64E392 
X-CRM114-Status: UNSURE (   8.62  )
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

When Smwid/Smlwid extensions are detected during hart ISA detection,
the riscv,pmwid device tree property is required to specify the M-mode
WID default value.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_hart.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 0c584bfc..cb0c66ea 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -768,6 +768,19 @@ skip_smwiddeleg:
 	/* Mark hart feature detection done */
 	hfeatures->detected = true;
 
+	/*
+	 * Validate M-mode WID default value: if Worlds ISA extensions
+	 * are present, riscv,pmwid must exist in DT.
+	 */
+	if ((sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID) ||
+	     sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID)) &&
+	     !hfeatures->has_pmwid) {
+		sbi_printf("WARNING: hart%u has Worlds ISA extension but DT "
+			   "lacks riscv,pmwid.\n",
+			   current_hartid());
+		return SBI_EINVAL;
+	}
+
 	/*
 	 * On platforms with Smepmp, the previous booting stage must
 	 * enter OpenSBI with mseccfg.MML == 0. This allows OpenSBI
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
