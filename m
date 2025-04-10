Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B51C369A6
	for <opensbi@archiver.kernel.org>; Thu, 10 Apr 2025 23:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5lwDZSKFRFodI0ozwLqvPFB8YAQmBX/4DtRKZHKmmQ=; b=HGYCkpwptlTdnH
	pZE/DMbnjFP2xgZTZdcBKb5F0v1eALW5Sr8WGzIpLKFsg0KlTTgUQnmIYEo/EEjKtWMWgn+ycfjnz
	Kjjx85weHybzhcMiPuNws5X9UVfSQ2W48Ubx+Zp61/4ojSvbdjSMfkxuVn/XP7zTzZchiBkgfbjzz
	PoyGB+Z0Ai0toxqZVZyvebMrnEXKxVjBNtj2gTbyDe++eegljLx4I5cjRu97O/KNaxnHqzRC6CdGU
	mgI/ytWnFwY6tvvnsG5+HbdKIIp77Cu1H6ZkBa1mPMXsSWd6G6mh1TEGU1eKEEWfzZToECWIJjrmj
	+06MeBMQ4NMuwPibqh0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31Ra-0000000C44T-3t63;
	Thu, 10 Apr 2025 23:36:26 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u31RY-0000000C42o-1jNT
	for opensbi@lists.infradead.org;
	Thu, 10 Apr 2025 23:36:25 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22580c9ee0aso14980405ad.2
        for <opensbi@lists.infradead.org>; Thu, 10 Apr 2025 16:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744328182; x=1744932982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NIMuhcJ2ItYZBWW9tFUmxeP0Z3cRk0nQcmNSdlz5MTY=;
        b=kkynEtjA4Dx5ydfOb/KADTFCSX/mL2vJJVqCnmqhuFQcRstGqP6l8678RwgLDN/ywN
         /PO/YdxIqkg5kE7S35QePBdyREBhxia0n7HaTQixlVQgqKYJ+3Y0CGA5s7HcFUW3r40C
         e7Q1AyyVJY0rZNKW6x3ZbmGxE+nazCDJkhdfnn4XWemY4cajRI7jI9WYn2ZOAlg3VkMm
         vFfDf5OJDF+HJyDdhpU9JyBHbg2g5+Ae1r/h69LwCTLOI4v/8xZFVIkEipsu4Z6Rogi6
         sR7KUrDQVboAVFsCebGarVJfpcsUfuOTYBLCAy4F6P7SNNXtswW+bjXizofb4OcZyWaU
         Tl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744328182; x=1744932982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NIMuhcJ2ItYZBWW9tFUmxeP0Z3cRk0nQcmNSdlz5MTY=;
        b=oSMpvojtIoYkJ4n1Gws1fAcvm9rKUqSzdfzLSJgOyBGWyu7x7HwABR7BitpnElglQv
         M4A0lzI9fvDJVhXULgMzhju8v3rMZoo5yrvGNhoVhxl/vOLmV6AVx/3UdX3RmIvHGDhE
         mgq9rHyRk+RAvN+XwyPyWq3QAOwMnbzVqbe4TnfIMgKc7jfLCbYr6fK+JRkiDzYH7Ler
         sZ64Squf0OzFLBU46FGFrV8tl/PruG1VcPtJR2E0IltLzmzPmMmWqdWiJ4G7ObIGshSB
         xQ4e/X0ubwPQPyAGNq2HjDKhrq5OlrhcFrOfnaYoU6Jsz0ylJ65XwAfqAC2Xw85hdoBM
         PbJg==
X-Gm-Message-State: AOJu0YzaJ76CXGRT8rlfj23L/eO64OsvFRiVoeHoBkMzVG71G+YCssYe
	xuTeJy1cdfe7BXXErus8hwyDW0tIcatCeyx5meXRto/Ni9WmMHL6akn2EEde
X-Gm-Gg: ASbGncuJ3k956osY8RmH86bYm7Z7ziqAIKvQpAPqwJUNY/u8vsCv9LXACB5sifOzHbl
	967zpmBUtGX+WPdHeUFYep6I++ZBnX9uPgCdZLUzfoXp8C+LuOsw5N5UEjtgL3qOuNeaW7z+ORh
	wv1PubHljNb0V9YyWeE7j5QiteDFi1NKY0mz4N8d6Y7MLZY2viLSC2B/zFJnh1Z8c9U0dGH+CqK
	WSDJSLO9J+fVxffX7xzJR5WYA3NY4pc5RPmU4dsb+brWU/CaTrVu0Hb2RbOYSRMyrsdZVBSIQZE
	4wpx0hrXhQvztXoLBi1dVQRV00DmcFCzesFrAKwPQbnXtdHciFPCLkIhonh2tKhYCIhPTeq9jbW
	wbhEkvUmL8xVq
X-Google-Smtp-Source: AGHT+IFPUZ3eg5EQQxj5vPzlcpyf4LXPo7P8VVIg3lk8+lIS91HV5mWL9HWjW1hc9UzcnITX7wNOkQ==
X-Received: by 2002:a17:903:1c8:b0:223:3630:cd32 with SMTP id d9443c01a7336-22bea50e1f0mr8220705ad.53.1744328182525;
        Thu, 10 Apr 2025 16:36:22 -0700 (PDT)
Received: from localhost.localdomain (36-231-65-80.dynamic-ip.hinet.net. [36.231.65.80])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7c992aasm36686985ad.157.2025.04.10.16.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 16:36:21 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Chao-ying Fu <cfu@mips.com>
Subject: [PATCH v3 4/9] platform: generic: add nanscent_init to platform_override
Date: Thu, 10 Apr 2025 15:45:30 -0700
Message-ID: <20250410224536.25021-5-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_163624_451434_ADC9B079 
X-CRM114-Status: GOOD (  11.30  )
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

This allows generic platforms to override nascent_init.

Signed-off-by: Chao-ying Fu <cfu@mips.com>
---
 platform/generic/include/platform_override.h | 1 +
 platform/generic/platform.c                  | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/platform/generic/include/platform_override.h b/platform/generic/include/platform_override.h
index 946fb8f..8d63837 100644
--- a/platform/generic/include/platform_override.h
+++ b/platform/generic/include/platform_override.h
@@ -21,6 +21,7 @@ struct platform_override {
 	u64 (*tlbr_flush_limit)(const struct fdt_match *match);
 	u32 (*tlb_num_entries)(const struct fdt_match *match);
 	bool (*cold_boot_allowed)(u32 hartid, const struct fdt_match *match);
+	int (*nascent_init)(const struct fdt_match *match);
 	int (*early_init)(bool cold_boot, const void *fdt, const struct fdt_match *match);
 	int (*final_init)(bool cold_boot, void *fdt, const struct fdt_match *match);
 	void (*early_exit)(const struct fdt_match *match);
diff --git a/platform/generic/platform.c b/platform/generic/platform.c
index b2f29e8..b7e744b 100644
--- a/platform/generic/platform.c
+++ b/platform/generic/platform.c
@@ -238,7 +238,11 @@ static int generic_nascent_init(void)
 {
 	if (platform_has_mlevel_imsic)
 		imsic_local_irqchip_init();
-	return 0;
+
+	if (!generic_plat || !generic_plat->nascent_init)
+		return 0;
+
+	return generic_plat->nascent_init(generic_plat_match);
 }
 
 static int generic_early_init(bool cold_boot)
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
