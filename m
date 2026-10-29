Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DFD606A31D
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 15:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MueYybvA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nVergKDp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=H1i4W9bBxLpB/j/7tmGaEijHYWiq8M1AYY/zck8HbVE=; b=MueYybvAaT+BVkxOHvnBrCkKhu
	7RecmwIioQAq80dz+2/eU6kG8g3s39086TaW+fCG0x16LoxQ2IrQREIcsHqhqczcXYIXOwXnUHXdP
	YMBsf3uZVJDEBYYCi+yELqIfTE1w+ZhRTghKV9wsbqRfi6OcKKeaNw9aFkg46pjergcCdUYko7W2D
	qpZn0OX7ilt+GUlIMbjaRCgnF2OY6JZQfU8Y+h759zaGVpANBhnasE4PjaP9ZsMoJaV9cxUaxHCBW
	EUrGg+kZFPoNEbA2d0KaMH/QrMo/Gdn8MDU9dyx8d184FGESfl7HcOVF4ZGFtcqPMAmX/2DspvH+L
	N0EnZMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXk-00000009iI5-0Ydh;
	Thu, 29 Oct 2026 15:59:56 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXh-00000009iGJ-321Y
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 15:59:54 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-53669f7b518so27006811cf.2
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 08:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289592; x=1793894392; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78vYuz5dcLj37VFrkjhgJsdk6jyw9i3RGCM7EWdmuIo=;
        b=nVergKDpYqzFBLGMNlZ2PTLKNEALwLYZGXXrX6v45uXBUZD+oINC5mZ91Fcy6xrXdK
         z0eXQWDFAr3KdjpY2gvTdwuoLUcvHBuh/gP7MkR45fyKBwjOCoc2xSJQFU1GiEcCKIKV
         wyJVw0Gk3NW+DKuzpvXrSAwVzSV/lJn3EDuKaDPVvHs77w7Evo/e5qX76YqlgpdI3z1F
         ezh/3gOrnXNLWiudP3JM28WSRbc5BySBjashJNuv69jTnbuN7BFKCh3qpWUvkgUK8b6T
         e4jRno8+98iFzkNXotCcaO2VAdhe5G9eV0tUpRC1G3OiXXVmRy6nRqxiJuQ/1wid2i4B
         xDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289592; x=1793894392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78vYuz5dcLj37VFrkjhgJsdk6jyw9i3RGCM7EWdmuIo=;
        b=vTkjZ8n171ZWQJlg4gWuy7R72XzkJg/5PgpUYhgiQWt4KcuvS8BuEexHu3ereMcvyc
         m1hZG77A4rjAlKTDzkGynamIqyYf+kMEazqXO144xxQxcl8vtdXzAmjNZVnqiPhB8UzW
         Axa/o/r3ekCJr5Svpsma1fAy5m98wPsV7YmpRdR+7escjFLAHHhZQSqV4ErmqpvqP86C
         De+bd/TjqU4LO440c0PReH/nXwxK8/z7xnZf0t2ssmCPEWlVR+yu4xTrx71zIOS60+8j
         MyO19CW1hStkLqTpZkuu/kwtgyt0JS+ataTA8XSdQEJ5bkRV1PdtBS+nayXzfBR8dW7g
         IW9g==
X-Gm-Message-State: AFq9FYIi+Llt0hBeAMfVL4tgXPyswmzWoFkO9e2Q0cCfXxnBdJnYBeA3
	V0xCQkUCY7SpVh2qSbicJGFsUUt9mwxxxVNAj5ud/dk0yB9QYbhXvNHp+WKz0A==
X-Gm-Gg: AYBFou1ojgQ9K36y43b7B9iawMM9DKfWRBsmWB6qVnX/vZ71OF3+Z2Ltw4vDofx+8nG
	YJrKpdX4+RMQ4B9rOTZfDvhLyqq4AMPQc8JWHkBXE7Qz4+YBQS1ZvwwQq4k/eVgQ+dmgjgmwE1f
	3VS3COvY6gsrLQU996mC7CcbNlhe6rSnLjGIiN5nYIQDOCFWT3bCk1xdqaRubD4eiBSPVz/L73Z
	csgCTCH43tAuoOepFfhmy+vPMRx85/ItpTwiOOhmSeYpALpJWpfLpNhbEURpwiDN14AkQSmhQr7
	VKF3NrbPIm7qVPg+nyob7oYk8WOMFUfZLMMWqASPbuwKvCuNRSO5xdrpd8PKo7J+o7bVRJltOOj
	LLHmHLTwjnHT6MMG3iUeVXBG30RiMX9I79KoY09FMGSAZRvC+JxcPBrWVl7klbDRZbVnxfhwNhn
	lVwNlrwI+mU8l4aSwsejXKafQIHYY52tNWL7pavzvnNbkIyGnFM+SUM+HDmVX3hcdzxSmYuXJt7
	IVsyVqMotyUPZa8TIwx+Zszwrd978SUhiweWeL4HfAPmV+rUvbdxhnqqVma619raww79VgPiqel
	0a3pM+pBZwqtyPbe0cRTV3Pk+BSCVC93I87yxtifskQBBv3bCOLd4P6+Ws/MCVe36sCz2UcWFvJ
	n2SuDE4Y0qb83iA==
X-Received: by 2002:a05:622a:13cb:b0:535:bfc:329 with SMTP id d75a77b69052e-53fcc9c1a8cmr98463681cf.61.1793289591703;
        Thu, 29 Oct 2026 08:59:51 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.08.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 08:59:51 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 03/12] lib: irqchip: add S-mode notification helpers
Date: Thu, 29 Oct 2026 11:59:20 -0400
Message-Id: <20261029155929.586597-4-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_085953_774024_0CC4F722 
X-CRM114-Status: GOOD (  11.62  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Raymond Mao <raymond.mao@riscstar.com>

Add irqchip helpers to set/clear S-mode notification (SEIP-based).
In addition to set/clear, expose a get API to read the current
notification state so upper layers can do edge-triggered notification.

Allow raw handlers to return SBI_EALREADY when physical completion is
deferred to the recipient, instead of issuing an immediate EOI. Preserve
ordinary completion behavior for other handler results.

Release handler storage when unregistering an interrupt handler so failed
courier setup can roll back without leaking memory.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/sbi_irqchip.h |  9 +++++++++
 lib/sbi/sbi_irqchip.c     | 21 +++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/include/sbi/sbi_irqchip.h b/include/sbi/sbi_irqchip.h
index f5dbf1c7..174fa930 100644
--- a/include/sbi/sbi_irqchip.h
+++ b/include/sbi/sbi_irqchip.h
@@ -172,4 +172,13 @@ void sbi_irqchip_exit(struct sbi_scratch *scratch);
 bool sbi_irqchip_is_hwirq_enabled(struct sbi_irqchip_device *chip,
 				   u32 hwirq);
 
+/** Notify S-mode for a pending virtual interrupt on this hart. */
+int sbi_irqchip_notify_smode_set(void);
+
+/** Clear S-mode notification for virtual interrupts on this hart. */
+void sbi_irqchip_notify_smode_clear(void);
+
+/** Read S-mode notification state for virtual interrupts on this hart. */
+bool sbi_irqchip_notify_smode_get(void);
+
 #endif
diff --git a/lib/sbi/sbi_irqchip.c b/lib/sbi/sbi_irqchip.c
index 1664bd2d..f9afadc0 100644
--- a/lib/sbi/sbi_irqchip.c
+++ b/lib/sbi/sbi_irqchip.c
@@ -14,6 +14,7 @@
 #include <sbi/sbi_list.h>
 #include <sbi/sbi_platform.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi/riscv_asm.h>
 
 /** Internal irqchip hardware interrupt data */
 struct sbi_irqchip_hwirq_data {
@@ -191,9 +192,8 @@ int sbi_irqchip_raw_handler_default(struct sbi_irqchip_device *chip, u32 hwirq)
 	if (h->callback)
 		rc = h->callback(hwirq, h->priv);
 
-	if (chip->hwirq_eoi)
+	if (chip->hwirq_eoi && rc != SBI_EALREADY)
 		chip->hwirq_eoi(chip, hwirq);
-
 	return rc;
 }
 
@@ -471,6 +471,7 @@ int sbi_irqchip_unregister_handler(struct sbi_irqchip_device *chip,
 	}
 
 	sbi_list_del(&fh->node);
+	sbi_free(fh);
 	return 0;
 }
 
@@ -618,3 +619,19 @@ skip_migrate:
 	if (hd && hd->chip && hd->chip->process_hwirqs)
 		csr_clear(CSR_MIE, MIP_MEIP);
 }
+
+int sbi_irqchip_notify_smode_set(void)
+{
+	csr_set(CSR_MIP, MIP_SEIP);
+	return 0;
+}
+
+void sbi_irqchip_notify_smode_clear(void)
+{
+	csr_clear(CSR_MIP, MIP_SEIP);
+}
+
+bool sbi_irqchip_notify_smode_get(void)
+{
+	return !!(csr_read(CSR_MIP) & MIP_SEIP);
+}
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
