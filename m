Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BBF8C54756
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 21:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WG7Fn1L3PrPTZxZGDHhSwz2T8N8JWXJbZVOIJPqaz5s=; b=l+IkpowbK5gpw4
	jAOAfIwQygfF2WZMkazWCeZujQXvaCaJJGF8R+2Cziq9G8w2deBi0wey5C39DDKDSv+Lt4IjVYuyS
	OWkNSy03Qy+ClUrixannb0Ge/uMO/beTlk7WME6qWIUPDtpIt2ViUbz521qWM+cGy4viBBZjIJUbh
	Y7XtnIr3m9/CV/qeyNEr6faM+iES+8jJxjBMsh4YWLJ4HJsTxLEZsKekZxVKntMGbynfymJZFCzir
	Qmkb+iVPJ963UGauJ83rzMLrhPnDSyWyhO5w5yGFriAaT5rWiiw36X+8IgvWshSYtHKackn3JugEB
	PIf+EBPLHZt8mmrtzcYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vw-0000000AgNJ-3o4m;
	Mon, 19 May 2025 21:59:16 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH8Vu-0000000AgIm-1fpO
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 21:59:15 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22e09f57ed4so61142365ad.0
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 14:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747691952; x=1748296752; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJ+SmQkb/yCzYjv4RlLDb6yCMEx24tVgsoFjF3g0RYo=;
        b=QeOeqkfkDcOgoX7YfN62wXAvKnbOQI3ojqT2O0QabC8CJGBSjT+nbBVukxq1rqYqBT
         EEvG7UUOupWT0sh167cvW+Mjr40tOOe+nhhAmWqE57il1TsxafX/9NztuJYciIfwpb/R
         Wz4H3aiPLQTVj7G/ENjphT+3KaCPhib/5llR0LER+8zGqbdBpSvKlVvror1hrv7NXIGO
         J0Pm+5xzL4912hGug3JmUpir5nU8jlbwQ8lfSrnHiTOxWXfodD8vrLSDK5+It/MINvZr
         rCSrvak03ab5EAbcXveZetYO64yu+/mLmHJZNXToXsgucbzg8LXyXJCyjgZ0B9OjlZub
         uIAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747691952; x=1748296752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJ+SmQkb/yCzYjv4RlLDb6yCMEx24tVgsoFjF3g0RYo=;
        b=ZNAvXM/kT1EYZ++vCagL5apOnhUcCvaezhcqFWC9tpJuaNU0MLXmv4NvyPph7h5ioP
         81mNeMFTTn4gVTOvvorQgW7UTpH2JDkEWL9hRr4ebDXh/puQi33wxtXgT4BTp1o5Oju7
         48bIlSouhPV4rV1pd4mP511Ip3PnGdQS6vxWDpq/3dHl5Oo06APqKT7RXOqHkeySnQr5
         e52R3rrN3hC0urT/hPyoPyo6kvzQoynyhQk/6TxN3DLhx9ak+0Bv8DceFyBNUSPsFe+8
         JJlYYOWSVx4VXu/Y4HWBHhQcAJAAoNYGNqK1JfHP5AFMvmGMvVIeXzkxM9QJqFwlTwoy
         WFfg==
X-Gm-Message-State: AOJu0YxE8eYNbeN9CMRL6P+xAoeFuaMk7sjxhqjD88vwPusB0yQYNrM2
	TKr+v4XiVk4F2lW+zZrv8sOkoMKuh9FLOvbcZir6PBBkPolgDK9Le4liYkCOv7zd
X-Gm-Gg: ASbGncsf4x0xb0EvZD5QJiRGEm0/30DglTSpqBKKeCe0k/PMpUd1DQtWUPdiQs9uFAX
	TGuDDkdGFENeqqHlSRxNfMEIo39g6NOUUWnEyzRraBd4QewK1zuu7M3PZLrfiwYptJMCGjxbPbh
	slu9zv18eLsJqBeXl+CBX4F2nHPUJWnPapO8qaoG4+ViRRp/VnhOUEE4BB0BI3uBRHAAWIrytpm
	92qPRVVw2bwhvokyYVVF9NQYS25aM6dTAZoJPHhxvd3IE0hvsqarNS9CtfVJie9OT43O4cd/t8x
	w79yDWcIBKN2PaVzmTG+ahRVHA6MKPKr5zECn69f4NUfKEbMezebWi8r4WdQaNAEmw==
X-Google-Smtp-Source: AGHT+IGXYIa6k5jYpQr0Z0MC5tTOBZJHNZPDejO2JuZhgzDfdPbBWedgQbWJO9xRJ5Cb2w9vc3Ub8A==
X-Received: by 2002:a17:903:1b48:b0:22e:4b74:5f68 with SMTP id d9443c01a7336-231b39acfbcmr296376685ad.19.1747691952417;
        Mon, 19 May 2025 14:59:12 -0700 (PDT)
Received: from localhost.localdomain ([50.175.154.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2320418f249sm46386625ad.215.2025.05.19.14.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 14:59:11 -0700 (PDT)
From: Chao-ying Fu <icebergfu@gmail.com>
X-Google-Original-From: Chao-ying Fu <cfu@mips.com>
To: opensbi@lists.infradead.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v5 10/10] Fix PMA init for MMIO regions
Date: Mon, 19 May 2025 14:58:47 -0700
Message-ID: <20250519215848.27569-11-cfu@mips.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_145914_450988_4BEDB8D1 
X-CRM114-Status: GOOD (  16.00  )
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

From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>

Convey MMIO flag as specified by SBI_DOMAIN_MEMREGION_MMIO
to the pma_set(); use this flag to decide upon memory cacheability

Introduce non-architecture bit PMP_MMIO for this new flag, have it
out of valid bit mask for the PMPCFG register to avoid side effects

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 include/sbi/riscv_asm.h |  2 ++
 lib/sbi/riscv_asm.c     | 10 +++-------
 lib/sbi/sbi_hart.c      | 13 +++++++++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc8..1bb2be7 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -215,6 +215,8 @@ int pmp_disable(unsigned int n);
 /* Check if the matching field is set */
 int is_pmp_entry_mapped(unsigned long entry);
 
+#define PMP_MMIO   _UL(0x100)
+
 int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 	    unsigned long log2len);
 
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index 7eb02cf..9f31c3e 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -311,8 +311,7 @@ int is_pmp_entry_mapped(unsigned long entry)
 }
 
 #ifdef CONFIG_PLATFORM_MIPS_P8700
-extern unsigned long _fw_start;
-static void pma_set(unsigned int n, unsigned long addr)
+static void pma_set(unsigned int n, unsigned long prot, unsigned long addr)
 {
 	int pmacfg_csr, pmacfg_shift;
 	unsigned long cfgmask;
@@ -324,10 +323,7 @@ static void pma_set(unsigned int n, unsigned long addr)
 
 	/* Read pmacfg to change cacheability */
 	pmacfg  = (csr_read_num(pmacfg_csr) & cfgmask);
-	if (addr >= (unsigned long)&_fw_start)
-		cca = CCA_CACHE_ENABLE | PMA_SPECULATION;
-	else
-		cca = CCA_CACHE_DISABLE;
+	cca = (prot & PMP_MMIO) ? CCA_CACHE_DISABLE : CCA_CACHE_ENABLE | PMA_SPECULATION;
 	pmacfg |= ((cca << pmacfg_shift) & ~cfgmask);
 	csr_write_num(pmacfg_csr, pmacfg);
 }
@@ -345,7 +341,7 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 		return SBI_EINVAL;
 
 #ifdef CONFIG_PLATFORM_MIPS_P8700
-	pma_set(n, addr);
+	pma_set(n, prot, addr);
 #endif
 
 	/* calculate PMP register and offset */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index fc4925b..ab56890 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -361,6 +361,13 @@ static unsigned int sbi_hart_get_smepmp_flags(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_X;
 	}
 
+	/*
+	 * indicate whether it is MMIO, to be evaluated by code,
+	 * out of pmpcfg mask
+	 */
+	if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+		pmp_flags |= PMP_MMIO;
+
 	return pmp_flags;
 }
 
@@ -489,6 +496,12 @@ static int sbi_hart_oldpmp_configure(struct sbi_scratch *scratch,
 			pmp_flags |= PMP_W;
 		if (reg->flags & SBI_DOMAIN_MEMREGION_SU_EXECUTABLE)
 			pmp_flags |= PMP_X;
+		/*
+		 * indicate whether it is MMIO, to be evaluated by code,
+		 * out of pmpcfg mask
+		 */
+		if (reg->flags & SBI_DOMAIN_MEMREGION_MMIO)
+			pmp_flags |= PMP_MMIO;
 
 		pmp_addr = reg->base >> PMP_SHIFT;
 		if (pmp_log2gran <= reg->order && pmp_addr < pmp_addr_max) {
-- 
2.47.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
