Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77294CAC5BB
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JKvLcIjXjPREchEbw5mVTZHAMpnTSeW4K5iq9VKqK4=; b=G77TDq/L3DXSuK
	PYnsXB0WgZMMBik6egiHE57eVy6pCxjkvDMLEpcpvnsCpuloFNeXKsv7m1nW2APDhoe9ahEMqOj+L
	RGSRCxKirooPB5wrfCugR4FNuKNkK68yVsPxHpx2OATkVCWzsQaDFOuhn5q8NpLECuBW7pBQpi6WD
	udVShheBhmCeRj7AilEuqCB8zHQuSs6L80T4ZxQxhKVT1s5+65tIFR/CX1bYuIGzN/TPsax2uXnur
	yaYddMf9/DOZ5Eyt+76/NlSuQuYMm8azQUqgwbA76RvHGqwS9tUALzytCWv5m5oN9ENvYqzsHFV0x
	9Xgb8O9V8fev2EF9QZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnD-00000003UW1-491N;
	Wed, 08 Oct 2025 08:45:03 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnB-00000003UTR-0gXE
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:45:02 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-782a77b5ec7so6102335b3a.1
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913100; x=1760517900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi1HbiSspUpXw6Y5qNBC/ue/0We/lREUmL/PzsQZXkc=;
        b=SplDffcZx/gqRi0HdRM5Def4Qc16c3aTq7/1D3GnICp7A7FMTrfAzVDEeosYLcepxx
         eK4fTDk9LNogLYX9QblU5+qcjj/Y4GdVjIy2eqwwdlIzK/Nm2bzIDo8V+qyAm2hVurSz
         XvB0klCyseeoC2DHNIsHSCRPJ1b2ftJEcdxqqnKnwz0FDZshqTdYXlUWCmhduypNGmQw
         5khia+AJGte80t7/cw9KrTxEPubyFdatEDY5AQ+RL0MKcCkdUn1BoquBTCaaOu5ZO7eE
         o3mIBdvVewhQSOTaFqMm+LD/KVBi3QrIxoGPcaDSpTPsOb1pMeXfJS6HPni8IG6Zzs92
         1mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913100; x=1760517900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi1HbiSspUpXw6Y5qNBC/ue/0We/lREUmL/PzsQZXkc=;
        b=S/lKrMA2TESvTY70yXRGnKnHp6GbMnxsvIiKT5ydlbUWDT22TjuCdzFo9Pwue/lJrj
         WrszUy8HHWPPofcuaaKewqZAWQQoJ8lDVfU66uWFDwyYds9xTcf5cz9roB4zzOOBCD1q
         VUUrqsIP5IkZB3XqtlGptm4xu/8gYLqjDLXqH0DdMSjeNNTKv7Owi1VaNUgSNNiaIT/1
         8/KF3OD3fC1li8kENFBAOR41nGVNnXmlZZcP3Sae7HEeS71BvHil43evBE4hlm9dpXMk
         d9+VFS/656/StlJARPLd4bPwXAfgzsGNWuI6PWnyQXvlCCyvmevOZLDweLg2DNoVcRuV
         kfRg==
X-Gm-Message-State: AOJu0YzfKu36Ga8yF43SLvZQyNyTv4BYJosl6iUlZ5PkU64y9dXk2Ft2
	EmZnJhGdENQXDE7zVV2jTfeifMiZI+8HX75QpXTziz3vnUbprAYlWZtSRQEwHJooZCg2z5HHD9L
	RxFdsvEzoNLkXjoXTEgmXLD0SnAIx8uDuraz/DOe2JAYjYpwzlcq5EifaaYN8lUzxtPERsW6Gcn
	/Qya9n99PBDVSA2mW9U++l+MMUtdyg2VQLLB+RA7wiaRw+DBv5lAM=
X-Gm-Gg: ASbGncu0vUMhrfXZCHep3P7jRIQdKoovG+8Dpmo95AojkxoKxMD4hpNpaOC/4QNa8Ne
	kPepZkv/vdkkDEh65unzFUC6h/mbMT6MXrJiOpKsFB2KXML/EsL5HkswzZT8maNFGxl2wGqrZkW
	KOXVVwISvi7kN5JbPjXjddsJQJrlgMHq1dKMiH1MnA+tdV2wexN+Jdm6/9tvn0MGlXC8JgA7sw2
	gtWmavyk4DVLpnKWvEXV1VLQ8B7jsroOtXBIl5cMil2L3sHO69iuYvqi6sLvvL6bhUHydWs6BWn
	ppegJJe1gFCHL0rNlDtt7bKgu7YtBacboaT7MF556r3yo2fnMWdjUzRUcBMfeWEGPOS+uo+HFwR
	UUicEpeiJKQG9+0ZxnF/8bEBnXAeAJkofe6unJSoh5SDnd/AcqHwmjFySCwyYhcoVPfz0wXWVII
	ohiqxpkmyqWGHv5bZDQYOjzl3U3nwkeVgvNrTbyRfwx16OI9DCv9m4557V
X-Google-Smtp-Source: AGHT+IFmBXtMDT8tUfSPDHkjd2p4Hom2Gp03raGrZgXlSMxkHznQcU18zGSztNXwNhXGGAwwuJjuGA==
X-Received: by 2002:a17:903:f85:b0:264:befb:829c with SMTP id d9443c01a7336-2902721634bmr25382305ad.9.1759913100017;
        Wed, 08 Oct 2025 01:45:00 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:44:59 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 5/8] lib: sbi_domain: add SBI_DOMAIN_MEMREGION_FW memregion flag
Date: Wed,  8 Oct 2025 16:44:41 +0800
Message-ID: <20251008084444.3525615-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014501_210028_ED567233 
X-CRM114-Status: GOOD (  10.24  )
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

Add a new memregion flag, SBI_DOMAIN_MEMREGION_FW and mark the
OpenSBI code and data regions.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h | 1 +
 lib/sbi/sbi_domain.c     | 8 ++++++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index a6ee553b..9193feb0 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -157,6 +157,7 @@ struct sbi_domain_memregion {
 				 SBI_DOMAIN_MEMREGION_M_EXECUTABLE)
 
 #define SBI_DOMAIN_MEMREGION_MMIO		(1UL << 31)
+#define SBI_DOMAIN_MEMREGION_FW			(1UL << 30)
 	unsigned long flags;
 };
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 798e68b3..968fe61b 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -540,6 +540,8 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		sbi_printf("M: ");
 		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
 			sbi_printf("%cI", (k++) ? ',' : '(');
+		if (reg->flags & SBI_DOMAIN_MEMREGION_FW)
+			sbi_printf("%cF", (k++) ? ',' : '(');
 		if (reg->flags & SBI_DOMAIN_MEMREGION_M_READABLE)
 			sbi_printf("%cR", (k++) ? ',' : '(');
 		if (reg->flags & SBI_DOMAIN_MEMREGION_M_WRITABLE)
@@ -893,13 +895,15 @@ int sbi_domain_init(struct sbi_scratch *scratch, u32 cold_hartid)
 	/* Root domain firmware memory region */
 	sbi_domain_memregion_init(scratch->fw_start, scratch->fw_rw_offset,
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE),
+				   SBI_DOMAIN_MEMREGION_M_EXECUTABLE |
+				   SBI_DOMAIN_MEMREGION_FW),
 				  &root_memregs[root_memregs_count++]);
 
 	sbi_domain_memregion_init((scratch->fw_start + scratch->fw_rw_offset),
 				  (scratch->fw_size - scratch->fw_rw_offset),
 				  (SBI_DOMAIN_MEMREGION_M_READABLE |
-				   SBI_DOMAIN_MEMREGION_M_WRITABLE),
+				   SBI_DOMAIN_MEMREGION_M_WRITABLE |
+				   SBI_DOMAIN_MEMREGION_FW),
 				  &root_memregs[root_memregs_count++]);
 
 	root.fw_region_inited = true;
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
