Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58CFFCA0EE4
	for <opensbi@archiver.kernel.org>; Fri, 15 Aug 2025 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94ba+Eu+8i/2FCWWWqIDlC2iGhViyDZTPpt5sSVqtqE=; b=1pB85h5bsVkTAJ
	C4WQQ2MUu0HSveBFWzlVk7KrSfKs2T7lakl38onp1/9nbQRlfxXunLEGnt56O9Bt+17aVcioKJXPD
	FoiPQljxKeiHZ/UiRkWoaaBQzQx/T6anuBs8xy//Bf7ntXO9H/lNUcVTLrV0bd3m2oVBVly4uH9Dw
	mALjnfsP+sMKplRygbDPlEXel51Y554nNfkdQ91L+Rp/HMFUvWUQW24Rh5JdPn+eE9ai61x6rd3mA
	FaTEUufmi0IHGrF0JvIPS3h3jJcdxVExGjgPJ3xrxkzfKb9aMWeudTHWEKfNSDfXMTNsWFWm12ouZ
	MvoZCdhGIpRTU3MQTNjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umuGa-00000002YLt-1BLC;
	Fri, 15 Aug 2025 13:14:44 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umrFf-000000028ka-1bdR
	for opensbi@lists.infradead.org;
	Fri, 15 Aug 2025 10:01:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b471740e488so1713767a12.1
        for <opensbi@lists.infradead.org>; Fri, 15 Aug 2025 03:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755252094; x=1755856894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bQanBx8YQlMxUYNgOPeL+hXTtCWs5ci9hxpgdJsbbig=;
        b=g7fLqEPI+KYmzt6QbISBG4Pj/npu/OS7OgqJvNFIzTbYgw1fCa7+TLrzIqFU1J/xJG
         /GyYg3voVe2PnkSgqGW918KtaWn6KLmG0W6PJI+R81DvymwB9AXrjYnNXr2iIe3Ktzj9
         r90DAQUKTLZpDrjD57DWWRMcb1VjfLwcq6rJG3k0j7iHpPF4DdHkT1zpzbzlxu0dOFHX
         3z+JNUL5NTbcnq4p+JIGlEUrGVdEz8X2BqZoLQeF1SOEVH8Lt7wlvjuXZSl7i2f7Cg4T
         RtZruP7cxrC4sPhIS0bCcj6t6RcWzZiCfK1dylkAxO0a1n2mN9708h8BMKc37pcme4eu
         deCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755252094; x=1755856894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bQanBx8YQlMxUYNgOPeL+hXTtCWs5ci9hxpgdJsbbig=;
        b=GsDihzIGXEf5GtIaPd8KG5XtnoemHdKbVgoBFyJcKwwWm4gP+gUAKK+VGjjzNM02S8
         s+E3QRZggDe6hPivpxH7fyi8BkdbZJ4Xb9vBG9PYXPvLHoLuuj9X4VzYN0dEofuKoArO
         SCZDzqVWJfYjf934BCVOsEeJfbdz3hDX5Ejf31LP2SQltKiI6yUf19f7Pn7EHntum9Op
         4It93g5Isu55nhyqL17J9gFQWumN6XfFajrNTsVauCLFs8Fb+wsUE7McIEHsXCOWM/d2
         psy2n4EKTyfNUzW2bIOFCzhRt1W1dT41LqIW2RbKoWLUdDtnR4Li7fN6H7bDtAPgPTd6
         p7bA==
X-Gm-Message-State: AOJu0Yxf28en8nK396EhqUu/R/Esi95dFHckODrqq56ZzEZ42MkZCM5F
	FQ7YjYMSrP3lU26lmfCc9zjPU3atod3qMbderrnYE36ad1tAyk+BF4pRH9evnhkMIi+UILwSnl2
	+4AhJx+Ocysfc8bF195Agl72QyxhEGfrmopsmNgGigBp8Be1EjMWheCDRy7N0psa3KZ7DhvGFwk
	UVhC0vJbjIgnAhMedTSdypamS9bD9+brxh4Q6vbot8F/udVUIZoaC6yA==
X-Gm-Gg: ASbGncsgls7CjuU5LEA05PEeBtGMzOe2emVpTAGlL1umkiZdzq6p0Ik9FElbuIrekyf
	cTx5F6OHBjHmyh/pYaWfpJx+N+L8Bik0DRI4UJ/yl674Kl2K0emqd8l/QZbzZQxcGH/esv0ma0p
	6xUlM5wLKLj6S6M462GHUwnRnMT83aHyfuhp+uR+8x2mZu3/7ms0Q/Qm3p8JOu5dMvOQT4+kHhU
	XZosfWFTv80zcf4ReeYdhfB9COmA3GHsf44h2FQDFd6RxSFZYe+q10SR70sY8vp11ZqiXzffMKj
	rXtuJ/cusrhaRcxSjM1BXxQg30OSqS8KAz3LujoxyOKP4ZpwzJHLkraPIRJevKutfHQiETgP6SU
	ilSo+nHpexMQTnBHXkH3jBbnd/8IYUx1kax8eT/7UgPMPO54=
X-Google-Smtp-Source: AGHT+IHSDBSPEOQAenVfu/EaF5JjRDN9SReE2zo5AwuPh4pVfrrb8YkMjyQng9OrcIYJdht2o7qnUg==
X-Received: by 2002:a17:902:e842:b0:235:ed01:18cd with SMTP id d9443c01a7336-2446d99e6acmr24779895ad.44.1755252094244;
        Fri, 15 Aug 2025 03:01:34 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d5a7a40sm879220a12.9.2025.08.15.03.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 03:01:33 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH 5/7] lib: sbi: riscv_asm: add reserved_pmp_alloc() to allocate a reserved PMP
Date: Fri, 15 Aug 2025 18:01:13 +0800
Message-ID: <20250815100116.27776-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250815100116.27776-1-peter.lin@sifive.com>
References: <20250815100116.27776-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_030135_423290_EB7F85A4 
X-CRM114-Status: GOOD (  10.75  )
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
Cc: greentime.hu@sifive.com, Yu-Chien Peter Lin <peter.lin@sifive.com>, zong.li@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Add a function that allocates unused PMP entries from the high-priority
reserved pool.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/riscv_asm.h |  2 ++
 lib/sbi/riscv_asm.c     | 25 +++++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/include/sbi/riscv_asm.h b/include/sbi/riscv_asm.h
index ef48dc89..5fff2196 100644
--- a/include/sbi/riscv_asm.h
+++ b/include/sbi/riscv_asm.h
@@ -221,6 +221,8 @@ int pmp_set(unsigned int n, unsigned long prot, unsigned long addr,
 int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 	    unsigned long *log2len);
 
+int reserved_pmp_alloc(unsigned int *pmp_id);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif
diff --git a/lib/sbi/riscv_asm.c b/lib/sbi/riscv_asm.c
index c7d75ac0..daa5087a 100644
--- a/lib/sbi/riscv_asm.c
+++ b/lib/sbi/riscv_asm.c
@@ -403,3 +403,28 @@ int pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *addr_out,
 
 	return 0;
 }
+
+/**
+ * reserved_pmp_alloc() - Allocate an unused reserved PMP entry
+ * @pmp_id: Pointer to store the allocated PMP entry ID
+ *
+ * Returns: 0 on success, negative error code on failure
+ *
+ * The caller is responsible for configuring the allocated entry
+ * using pmp_set() and pmp_disable().
+ */
+int reserved_pmp_alloc(unsigned int *pmp_id)
+{
+	const struct sbi_platform *plat = sbi_platform_thishart_ptr();
+
+	for (int n = 0; n < plat->reserved_pmp_count; n++) {
+		if (is_pmp_entry_mapped(n))
+			continue;
+		*pmp_id = n;
+		return SBI_SUCCESS;
+	}
+
+	sbi_printf("%s: Failed to allocate PMP entry. "
+		   "Please increase reserved-pmp-count\n", __func__);
+	return SBI_EFAIL;
+}
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
