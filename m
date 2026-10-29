Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC6D606A31A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dN0nh+ED;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f6QeECfI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=eFXfylvgHtyyLsOvbaZ4aYPJFnKX2vVqO43jCYjz6Ys=; b=dN0nh+EDA6XrZQnBGMB07hK1Fh
	zcWRveuISBiAM84F2yVUikzYtbv+MQmUXXJTpIUmF+oI2XNsyhN+BrfVfXnylUT+TG6M6r4vzvIxb
	KpxzaJ6o4NF4gpQnWiqE34ZxO4B+rdohHuw85SnYqhv/IYeXrvwHeSf6mIzGn3JSykJ7QdjOhelRn
	q4RQp6WkLfkZCoQ0oAxyOzl5G2t0N/6p3Pz19Ofk3j38Mqlrzla8Fu3Yy8bgGhZ5NHjIpLJV4xmiG
	3OyMtnO/TT50erj/SJI/BT3kCKKHNZJYw+BFMoj31DVsgp5UeGITeu+gc/lRlB4a4AXkcdkz00tdk
	DN25KtEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSY2-00000009iXk-33Zq;
	Thu, 29 Oct 2026 16:00:14 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMSXz-00000009iWA-2iKl
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 16:00:13 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-53c4b82919fso31407321cf.0
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 09:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793289610; x=1793894410; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jhnd6xxMiyN4gTDnnKwJE02p6HdAmauHWguQug9Wo9E=;
        b=f6QeECfIzcq0rdH9CYAwW4OcKOodrCvnhretHoNlrEv1rA3coCSbRgy2TZKyY/SwmA
         t6ZfHhjRDah2hTFdBhYHn/3uLMB/q197CUJWO7lo4zr5linaX059i2UHzBiScBzkzfqi
         n3IYs4reroYXrhJgw9Dq9WMuOCygzGuX+rKVcBz5QGkAdPGko3U5CmWEgPTH6p75Li5u
         rrko7akwGpD2NIXCU30aOwoTe/eBOQb+xj+UHv+Uur08IBI4xv04dI/ElPurAH9GcL8+
         zTcal4vR7ysMvdLylsbx6zxCz4bClFflz81nnktqVtC17F5QUoNlrc7aHdWtRa+IDR5b
         P4tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793289610; x=1793894410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jhnd6xxMiyN4gTDnnKwJE02p6HdAmauHWguQug9Wo9E=;
        b=g1aa1HIxVT2MPCm8Sv3OZP7cApud3oBbKnnyQg25PGdgHAz/g2mjAq66dAOBU32h0E
         Xkw4xg48rIXJ1P6WwgiA3k5DBHuo7DBb9FsI0f3PLOaPp0UNSYXNXIurW6PatdRn8+rC
         vTHobMk5hebWQrIi845dEMsmyZi5YaeZqUY3klTXBGNGh0dzbNztZBeUrLGKedD0RzLW
         O9ieTr7VidOqj+XriBbFhfpe7e9kO17V2VvbvNIKZD5ovgBjDGxtBeAK2ChplQQF2WTD
         DuLvoTmy2gnID49TQtqaHyb4r66GFTljX4n69enf3AC3JcWE/kgSdwtSf33KKjk7kF6T
         s6Vw==
X-Gm-Message-State: AFq9FYJgJR03UDw262HaHKssIli8arzHRBKkSJ+SFQdlDPiavuJXnb5/
	39Xbl47dJMSzUTlGVUCWOb7B0tJWg9buCeT2gCb0/33EMnJ0Sl3/gEVle30S5A==
X-Gm-Gg: AYBFou2zir4psdNSSBg7RLuos5qrK6Wgvy2ejlwCLmMpxtSho2b0DjkjKuiDTJEBqZK
	h9zVcFG9x4LDWIedHlzP+MNlKRP0ZVhhQAB37T5w1cgOxDCnm+55xnLILSoBxcI9Yfbtn9uGxJV
	6KYGDRVz3j6xdzpAHWpwnFmF3K91DNi7qs5tgUUwZcOEIsTHED+6KX/wOBZFv7VKlCSD75V6eMp
	LaEZqMeyaphyTOeq6oEt4qtParNgxqUdOaXIAbd2Rd7LVRvULIthN/O51moVP3C77ClHoH2JSD6
	OE7+cVrePo43k0AFnZs8DmS10mlRDn+S/7+uVLQgt12ftOizirNf0o5zRdBjblFNFQboz5SRuon
	NMlAfpz2lUCdV0rR2N5+A4kRZeksHmlzCyJpmyYJ8EjlaA7lOWYY32HaQVbvE4Qc+1EhsFp1bcs
	+utMO1QUGmHFrPWxX3vsv+py7VPmaifSqx/yb8ESbTppNag9NWqnxD2s2p09D4I92L2d3t3XyOQ
	YjYpTDZ8NP1y1bGWJ7cN8zVVZCbvIoQ94YnWXnKiV5jU6yHS29hEQN+nPz2Y3AW4Z5+v0S18ogk
	qx/lpwesPV14ww5wYZaZPLodc33L7fzHgn9E8VPA67IjX12ayLWgL62+POMJ/VbDzE+h3M5QVuu
	8mxZxGFAw3QwgWg==
X-Received: by 2002:a05:622a:2614:b0:536:e29:e774 with SMTP id d75a77b69052e-53fcccb3195mr98804751cf.77.1793289610140;
        Thu, 29 Oct 2026 09:00:10 -0700 (PDT)
Received: from ubuntu.localdomain (69-171-141-154.rdns.distributel.net. [69.171.141.154])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394f82cfsm133231001cf.13.2026.10.29.09.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 09:00:03 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v2 09/12] lib: utils: irqchip: Add helper to register VIRQ courier handler
Date: Thu, 29 Oct 2026 11:59:26 -0400
Message-Id: <20261029155929.586597-10-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261029155929.586597-1-raymondmaoca@gmail.com>
References: <20261029155929.586597-1-raymondmaoca@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_090011_702806_4983E0D6 
X-CRM114-Status: GOOD (  15.74  )
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

Add an APLIC helper to register a VIRQ courier handler for a supplied
HWIRQ and IRQ type, using the precomputed per-HWIRQ target hartindex
map.

Translate OpenSBI hart indices to APLIC IDC indices when programming
targets and setting affinity. Reject targets with no matching IDC
instead of directing interrupts to an unrelated fallback IDC.
Reuse the VIRQ registration helper to preserve the selected target
after handler registration, which initially selects the calling hart.

Treat SBI_EALREADY as deferred completion rather than an error when
processing hardware interrupts.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi_utils/irqchip/aplic.h |  3 ++
 lib/utils/irqchip/aplic.c         | 57 +++++++++++++++++++++++++++++--
 2 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/include/sbi_utils/irqchip/aplic.h b/include/sbi_utils/irqchip/aplic.h
index 76b39099..44bbfcf6 100644
--- a/include/sbi_utils/irqchip/aplic.h
+++ b/include/sbi_utils/irqchip/aplic.h
@@ -53,6 +53,9 @@ struct aplic_data {
 
 int aplic_cold_irqchip_init(struct aplic_data *aplic);
 
+int aplic_init_virq_courier(struct aplic_data *aplic, u32 hwirq,
+			    u32 hwirq_flags);
+
 void aplic_reinit_all(void);
 
 #endif
diff --git a/lib/utils/irqchip/aplic.c b/lib/utils/irqchip/aplic.c
index 3da9a717..b9a43115 100644
--- a/lib/utils/irqchip/aplic.c
+++ b/lib/utils/irqchip/aplic.c
@@ -13,6 +13,8 @@
 #include <sbi/sbi_domain.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi/sbi_scratch.h>
+#include <sbi/sbi_virq.h>
 #include <sbi_utils/irqchip/aplic.h>
 
 #define APLIC_MAX_IDC			(1UL << 14)
@@ -426,7 +428,7 @@ static int aplic_process_hwirqs(struct sbi_irqchip_device *chip)
 			continue;
 
 		tmp = sbi_irqchip_process_hwirq(chip, hwirq);
-		if (tmp)
+		if (tmp && tmp != SBI_EALREADY)
 			rc = tmp;
 	}
 
@@ -549,6 +551,19 @@ static int aplic_setup_msi(struct aplic_data *aplic, u32 hwirq)
 	return 0;
 }
 
+static void aplic_set_target(struct sbi_irqchip_device *chip, u32 hwirq,
+			     u32 idc_index)
+{
+	struct aplic_data *aplic = container_of(chip, struct aplic_data, irqchip);
+
+	aplic_target_write(aplic, hwirq, APLIC_TARGET_HART_IDX(idc_index) |
+			   APLIC_TARGET_IPRIO(APLIC_DEFAULT_PRIORITY));
+	aplic_idc_write(aplic, idc_index, APLIC_IDC_IDELIVERY,
+			APLIC_ENABLE_IDELIVERY);
+	aplic_idc_write(aplic, idc_index, APLIC_IDC_ITHRESHOLD,
+			APLIC_ENABLE_ITHRESHOLD);
+}
+
 static int aplic_hwirq_setup(struct sbi_irqchip_device *chip,
 			     u32 hwirq, u32 hwirq_flags)
 {
@@ -637,7 +652,7 @@ static int aplic_hwirq_set_affinity(struct sbi_irqchip_device *chip,
 		return SBI_EINVAL;
 
 	aplic_target_write(aplic, hwirq,
-			   APLIC_TARGET_HART_IDX(hart_index) |
+			   APLIC_TARGET_HART_IDX(idc_index) |
 			   APLIC_TARGET_IPRIO(APLIC_DEFAULT_PRIORITY));
 
 	return 0;
@@ -676,6 +691,44 @@ static struct sbi_irqchip_device aplic_irqchip_template = {
 	.hwirq_unmask		= aplic_hwirq_unmask,
 };
 
+int aplic_init_virq_courier(struct aplic_data *aplic, u32 hwirq,
+			    u32 hwirq_flags)
+{
+	u32 irq, hartindex = current_hartindex();
+	int idc_idx;
+	int rc;
+
+	if (!aplic || !aplic->targets_mmode || !aplic_is_direct_mode(aplic))
+		return SBI_ENOTSUPP;
+	if (!hwirq || hwirq > aplic->num_source)
+		return SBI_EINVAL;
+
+	if (!sbi_virq_is_inited()) {
+		rc = sbi_virq_init(aplic->num_source);
+		if (rc)
+			return rc;
+	}
+
+	for (irq = 1; irq <= aplic->num_source; irq++) {
+		u32 hartidx;
+
+		if (!aplic->hwirq_target_hartindex)
+			break;
+		hartidx = aplic->hwirq_target_hartindex[irq];
+		if (hartidx == -1U)
+			continue;
+		idc_idx = aplic_find_idc_index(aplic, hartidx);
+		if (idc_idx < 0)
+			return SBI_EINVAL;
+		aplic_set_target(&aplic->irqchip, irq, idc_idx);
+	}
+	if (aplic->hwirq_target_hartindex &&
+	    aplic->hwirq_target_hartindex[hwirq] != -1U)
+		hartindex = aplic->hwirq_target_hartindex[hwirq];
+	return sbi_virq_register_courier(&aplic->irqchip, hwirq, hwirq_flags,
+					hartindex);
+}
+
 int aplic_cold_irqchip_init(struct aplic_data *aplic)
 {
 	int rc;
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
