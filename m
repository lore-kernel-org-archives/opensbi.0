Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7CD106FD7E
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d06Dw1aTJacGqRZFI9XS4mxEWXfh1GEY+jYhLkAqDl8=; b=uMncQopPStEeMX
	KNz6mZDaPe28/QggJxa+iJO2GT2/K+EoZnYJCsa1ImF9eIxJJfp2IqjmF/j9J23GoQSf74Mc7FIph
	IMMwSCBpxldwezGu6XNAyJ+Qr51bEdVlbwmaOb088QiWKgqFkwHPfjYx6/2K2F1DgPvKqAFBXfTg5
	cHUr2cchg7F3SCJLDCUCuX4xkqmD8ZVWlq27CJ9EJMV9pPy3+7uPxr82GD+DPCHN+9kKreUbWNtdh
	IHHuQcEE+hkWepzXPU8Ik0COqOWJRwp2bnLd3pOgmZSSvylqWWCwH1I30zfCLWnUihWkqR2dwwUnw
	whNnp1zBDrRAWCwoVeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxK-0000000GcSr-1XOP;
	Fri, 13 Mar 2026 05:21:02 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uxE-0000000GcMn-1ELE
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:58 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-35a1f3f07ebso489041a91.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379255; x=1773984055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7h7gHcIKrbGxtx6la9QBZBZqoJN+DkEhJYMYDJbNU20=;
        b=PpBTDYf/00j7dz8VWodMdmQpi0daQAWltOvqgFeMHTSTFz/m3ME4EkNoloOBLVFTK3
         JsppZLpJEwQSIrnI2TduX+kXIsTZ8moVvVj1naqxfQkKoqYSuP/qwlk6pzkV493nOgIu
         Qllb+iI5fpgp5E1cYctfy+lzZOjl3IhrPcDaIpH3L5zp52G6Zbg8IPaa33BEeZeLd32f
         Bl3HOBZm2YBtbMBAUvsUlSRiDJykDCrrUk6qwk8mYeTuuKZhJ0ploGZJpjnQfxTYy1gH
         OyAXjBJf2E+Xq6uc1RnJGXg1bdMtz9DSr1TNjAPGDtAWr2ea21S9BnawC86uw8e7bkZz
         /rsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379255; x=1773984055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7h7gHcIKrbGxtx6la9QBZBZqoJN+DkEhJYMYDJbNU20=;
        b=PdPr5gxUjE2C9LfDv0RQMz5QJrzqS8xlWwSD128qRks+sXC4ol47dSOdnjh5YfGnl9
         bRP1UVy5nve3jQfpfCIQawedpglV5aZ+1vfpwWuYPpvkEi7OwgKYnEx5aVAFkfk5Ewku
         t3ec6PFcSQd6I2wnpTWsD0wRv42qKgxCyUftMwvoKkWLgoNhcSrT+0qA5NjtVn7ysA2f
         NhEnIZ6dWVkg/o+AkvikeH2hdNCoJbHv+9aZ0MfkFVA10H3PduFptw2uyTmxFdbOLHiA
         uKrO+5e+3tyw7OW3yYvkFc2bn7wOm6UKFkHd2J3cudhoMXnTgFbdybOyNZJFVXbTjcpP
         dsDQ==
X-Gm-Message-State: AOJu0Yw8af8uxGCc+It5qWQ6lxqhlVLX9GzRmNu4Q0zjwYLlTjJZ4EUf
	rkB85+eW6c7FVMjh5Qykt+6PRxi04NbM4p1r9JjKRiafQLAyu7eubPUlMAlMBw==
X-Gm-Gg: ATEYQzwq3YG7JW9x2GWAMDx8BHkErCsiS9qIzbY0qaub4A/T2QEi730QA2eyYWhvqWa
	6IgK7yq1P+IFhrBNoX4XUW5IWaSvNX/I3Jlpl6J8okiKahLJnFdpm0mnWcJBp7e+KWT0MROcMVN
	gyJXXpv3QAzHIEzN+kyPQWJzOmBJGu7LYrkcC30WyUMfQNvDS74T04XJYtQLtQ5pJ2Nb3n8RttC
	hexoKvXxSxzZLx3zfsPtw8C+4aL6npiGfGi9XZp7RLPr0MsTqU1YGeGzWj+qGohJyUHX91ld8eD
	BPd2NTkRf3rrVDApVe12L0xvDzAAeuDIGIAA0HlhsEMDQzdMV5UX8YdGroj167KdZV/EsMJtpWi
	/lOoAVk7orv/4JgAHs2nVgqUZ7ygqfjXZFszZXnOtAD+bPLSLhDDB+hgFzotEybhByhA1OinvKT
	QINgwwHtc+Vd6BLZFYIiAsF4OailUYSDicNDGTz3j+r2nSQZomGhaNZJPTMmrqCj+jqm7J
X-Received: by 2002:a17:90b:1c08:b0:359:8c01:66f with SMTP id 98e67ed59e1d1-35a2205880bmr1786969a91.28.1773379254937;
        Thu, 12 Mar 2026 22:20:54 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 12/18] dbtr: Move hardware trigger probing to a function
Date: Fri, 13 Mar 2026 15:19:41 +1000
Message-ID: <20260313051948.4017134-13-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222057_266792_FD3E3FAF 
X-CRM114-Status: GOOD (  13.38  )
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

This makes the code a bit neater. HW trigger probing will be expanded
with subsequent changes.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 89 +++++++++++++++++++++++++---------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 5735bdc6..cfcd728f 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -134,11 +134,57 @@ static inline void sbi_free_trigger(struct sbi_dbtr_trigger *trig)
 	hart_state->available_trigs++;
 }
 
-int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
+static bool sbi_hw_trigger_probe(int i)
 {
 	struct sbi_trap_info trap = {0};
 	unsigned long tdata1;
 	unsigned long val;
+
+	csr_write_allowed(CSR_TSELECT, &trap, i);
+	if (trap.cause)
+		return false;
+
+	val = csr_read_allowed(CSR_TSELECT, &trap);
+	if (trap.cause)
+		return false;
+
+	/*
+	 * Read back tselect and check that it contains the
+	 * written value
+	 */
+	if (val != i)
+		return false;
+
+	val = csr_read_allowed(CSR_TINFO, &trap);
+	if (trap.cause) {
+		unsigned long type;
+
+		/*
+		 * If reading tinfo caused an exception, the
+		 * debugger must read tdata1 to discover the
+		 * type.
+		 */
+		tdata1 = csr_read_allowed(CSR_TDATA1, &trap);
+		if (trap.cause)
+			return false;
+
+		type = TDATA1_GET_TYPE(tdata1);
+		if (type == 0)
+			return false;
+
+		sbi_trigger_init(INDEX_TO_TRIGGER(i), BIT(type), i);
+	} else {
+		if (val == 1)
+			return false;
+
+		sbi_trigger_init(INDEX_TO_TRIGGER(i), val, i);
+	}
+
+	return true;
+}
+
+int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
+{
 	int i;
 	struct sbi_dbtr_hart_triggers_state *hart_state = NULL;
 
@@ -168,47 +214,8 @@ int sbi_dbtr_init(struct sbi_scratch *scratch, bool coldboot)
 		goto _probed;
 
 	for (i = 0; i < RV_MAX_TRIGGERS; i++) {
-		csr_write_allowed(CSR_TSELECT, &trap, i);
-		if (trap.cause)
-			break;
-
-		val = csr_read_allowed(CSR_TSELECT, &trap);
-		if (trap.cause)
-			break;
-
-		/*
-		 * Read back tselect and check that it contains the
-		 * written value
-		 */
-		if (val != i)
-			break;
-
-		val = csr_read_allowed(CSR_TINFO, &trap);
-		if (trap.cause) {
-			/*
-			 * If reading tinfo caused an exception, the
-			 * debugger must read tdata1 to discover the
-			 * type.
-			 */
-			tdata1 = csr_read_allowed(CSR_TDATA1,
-						  &trap);
-			if (trap.cause)
-				break;
-
-			if (TDATA1_GET_TYPE(tdata1) == 0)
-				break;
-
-			sbi_trigger_init(INDEX_TO_TRIGGER(i),
-					 BIT(TDATA1_GET_TYPE(tdata1)),
-					 i);
+		if (sbi_hw_trigger_probe(i))
 			hart_state->total_trigs++;
-		} else {
-			if (val == 1)
-				break;
-
-			sbi_trigger_init(INDEX_TO_TRIGGER(i), val, i);
-			hart_state->total_trigs++;
-		}
 	}
 
 	hart_state->probed = 1;
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
