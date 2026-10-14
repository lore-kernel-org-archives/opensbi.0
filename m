Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 827DDCC6B1D
	for <opensbi@archiver.kernel.org>; Wed, 14 Oct 2026 11:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/u3+O6TG9URsRrd/xs8MBzFJcNzNjaArbeGTFrhPBo=; b=xIqTCZUw6V/LxL
	lOxht9PGXAZau94h5ceu/IASyOYTBGo/wu/dRkTgfQ1u7KRkozNP2jg11T0NJQVeZhvpHgKeEdJCh
	SVZZszF+YVC0l8fKkvQrudvlskusIyIqVOGKCxaXkqU4TPzdhQ8MHuUNWtcqY57cG7CK2rsuT02Ag
	lHIOx7S2dHPTA34TCnsZENbCJ/WHoe7Gp6mygm9LfEm2AID6F7HKBFBNfe33mq9kLfCScd7y7VUgb
	5MvyjdMfTrbNvVuvqkxzstLaUUALyfyfULW4r/xyw57f5AQSQGvb2osw7Sr8h8qK+9uwKDRb0xXCX
	YLurZa3qTjr3ZNOoJrxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCW-0000000FLVA-0AQC;
	Wed, 14 Oct 2026 11:31:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGxCU-0000000FLTM-37ma
	for opensbi@bombadil.infradead.org;
	Wed, 14 Oct 2026 11:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=v/YE/tzq7KnZ+jV2gPhO2gKWPZnZxIaXQObR6qzv4lM=; b=EHNU/+21FCIQ9byl5S6oZQkz43
	QDraxI9RFHX5RAP0NJFm3MmNHpVq/WI7TSmSUYLiGt8cD/Bwv1ZUNEE7IUdctFO1lVAmFTc4P0W9y
	E3CxL390xFWQHFR5Q/C4Xp+NHJfxOLMAqnyAhTLtpiXr2TE4VTNFYnQC5jtuPj9eeL/ZD5bC/lXti
	cOZLy3bdxXW/FFUabGKPMttldb6NMkPK1MHPWYjm4zDtxRKfMPDDCOWG6IuCGf3BUZI8x4g2oyDpm
	ubpS53xWAafJeSQhzC6cOI5GAaUoP5zaIIJu7Yfnod6Rqhtp1vekqO+GF3z9CLuIh99ukC+1MmM45
	3QnoAM3g==;
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGxCR-0000000GgyS-38jV
	for opensbi@lists.infradead.org;
	Wed, 14 Oct 2026 11:31:13 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-1517bda04a0so2579434c88.0
        for <opensbi@lists.infradead.org>; Wed, 14 Oct 2026 04:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1791977469; x=1792582269; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v/YE/tzq7KnZ+jV2gPhO2gKWPZnZxIaXQObR6qzv4lM=;
        b=bDxV4RYVTdh89KFbLaNp6Z6iz6Eyme8B/eeQS8vVlxFrtdlS0uH5AHmWDM+92yY6Ea
         7rRPRy9G8R57G2ruJAmhfB7bymgHFJCYQpfrqT37d5b0oE0qrgcpYD9VIUAj4X/osvMR
         LqQg5inu+KLy72LY9sW2p+O8tzs3VGR5ZKC4FzMjEz1JkNJKE78EZ9wwqv0sp0NGrGyW
         l/r0QNWd/H6XdszLpN/UrJ3zLpp2/SUoAqIlTNzoOtCt7GPnezMDtLHNxVsW4B9KMKp9
         +ckJRhQ0sAtrZjdkgYRCdr1wjJ0reqBUQgeC4Fat0osbBV33TgXrOjXsvzTk6LtYi1Zi
         V2Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791977469; x=1792582269;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v/YE/tzq7KnZ+jV2gPhO2gKWPZnZxIaXQObR6qzv4lM=;
        b=1LsC1gDLjahJbfBco8vPJuYVjay+93xrZNxc00s3K1gwcgOOciDjwsBKd/Q6mvIV5A
         Q4ozmawsrR91bTPpwG8p1W9Ou7L+KbD9kMTCgP8TJTG8KDvpSyh1UcQUfJ1TsBR4C1eb
         HXGTLKvpa4+1wZoqdmBFKp/EEG3u7HQYcReXI9HU+MwClXZDOoiKqJk/Zm3kUa3l7bG8
         3r4sxWLrbWYGBLK82bBYiyYrREH4HCws/Fn4rFJOAR4gqph4t6gAdJxL7g327k4SUBdI
         tLsU42y7IIrleQuNEmfpg7CdUbICvSTZLkYnKh9+M9byQnmWuc1GqRMzTZ8+jfkmux48
         LvXw==
X-Gm-Message-State: AFq9FYJnUgE9O5ojKrR69oLO5TUFalkX9EOeVrN2G+nUUcHb4nRuPaZX
	+Fl4S9UaRKhyvgBGReFqcofULJrurC3c9JwC1mO0OjPJgaeqoCc0DgwVy5RQ7NSWCAJ7hQtNcVb
	1Cks+9yH053ytHZvFFnBJnf2r25FkC2YuPv/ZdBgmHR1xcRit2aLVRVy+p/8YcAcOnez3L3sQQ+
	GECE2s5DL/LNTyrT0SsvHZDbF/CBrkiILPPG3rw4oSHl+VZX2XKgkYpM4=
X-Gm-Gg: AYBFou2K7BRM5ibfoAzZqtfXdcxJOEu+2pBDh76uenY5jElBlAVYdi496z9Q4FvYG/N
	fOpvDjw96uXAL6lMD+6KXiJ2bIH/ZbMw++GMgBeJS14tHz8aDtuulmyzNgO3w2lzdHiRE2AX20C
	13rbDEXLCnI/qmjxUF7qvSrQFCA4sCY7kHSQD7rjuOfOgwmr4H7WOnsKb9OFabAxqwSyGNOOtYH
	TmZS2ygOenPaLnXGmvgTxTrcknSNBDYHINSsR50c6D5zFegTHV5iKnHQEIaz5+PTY2SEi5u14/S
	I3TIeDrK8Ndhc7x8BHIaRaJekZU7kbnf+fZ3gkLkwRk4Pcljo5cbEbdbkt58oMcK1IUKDkevXOs
	6F4l7ffaxd1tygZ+u0F84pdO300ihqADNmcmxkJUv2keVcsEbbnMpgQ5ycjG0KuDvwCyjpcd7uK
	8yJsgIyBDmqVTbTaO+ytmlxtCu1uu+lcKHv2etgaRYGYIf6hp1pA5pJQ+CruLx4PFrCHLhEFU1c
	RGqcizNZLcoK/siXHbqybBSrLXy8F0=
X-Received: by 2002:a05:701b:291c:b0:15b:bfa6:203b with SMTP id a92af1059eb24-16a5c4096b8mr19156808c88.21.1791977469055;
        Wed, 14 Oct 2026 04:31:09 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm71207996c88.18.2026.10.14.04.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:31:08 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 6/7] lib: utils: Use fdt_cpu_intc_phandle_to_hartindex()
Date: Wed, 14 Oct 2026 04:30:23 -0700
Message-ID: <20261014113100.2192229-7-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261014113100.2192229-1-samuel.holland@sifive.com>
References: <20261014113100.2192229-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_123112_116007_CD6D7AD8 
X-CRM114-Status: GOOD (  18.61  )
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

Use the cached information to look up the hart index from a local
interrupt controller phandle instead of parsing the DT each time.

The logic should otherwise be equivalent.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v3:
 - Also use the cache in irqchip_aplic_update_idc_map()

 include/sbi_utils/irqchip/imsic.h     |  2 +-
 lib/utils/fdt/fdt_helper.c            | 56 ++++++---------------------
 lib/utils/irqchip/fdt_irqchip_aplic.c | 21 +++-------
 lib/utils/irqchip/fdt_irqchip_imsic.c | 19 +++------
 lib/utils/irqchip/fdt_irqchip_plic.c  | 21 +++-------
 lib/utils/irqchip/imsic.c             |  6 +--
 6 files changed, 30 insertions(+), 95 deletions(-)

diff --git a/include/sbi_utils/irqchip/imsic.h b/include/sbi_utils/irqchip/imsic.h
index ffb62d35..0baa438f 100644
--- a/include/sbi_utils/irqchip/imsic.h
+++ b/include/sbi_utils/irqchip/imsic.h
@@ -38,7 +38,7 @@ struct imsic_data {
 
 #ifdef CONFIG_IRQCHIP_IMSIC
 
-int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file);
+int imsic_map_hartindex_to_data(u32 hartindex, struct imsic_data *imsic, int file);
 
 struct imsic_data *imsic_get_data(u32 hartindex);
 
diff --git a/lib/utils/fdt/fdt_helper.c b/lib/utils/fdt/fdt_helper.c
index 34369a62..9dc1c863 100644
--- a/lib/utils/fdt/fdt_helper.c
+++ b/lib/utils/fdt/fdt_helper.c
@@ -921,8 +921,8 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 			  u32 *out_first_hartid, u32 *out_hart_count)
 {
 	const fdt32_t *val;
-	int i, rc, count, cpu_offset, cpu_intc_offset;
-	u32 phandle, hwirq, hartid, first_hartid, last_hartid;
+	int i, rc, count;
+	u32 phandle, hwirq, hartindex, hartid, first_hartid, last_hartid;
 	u32 match_hwirq = (for_timer) ? IRQ_M_TIMER : IRQ_M_SOFT;
 
 	if (nodeoffset < 0 || !fdt ||
@@ -956,17 +956,11 @@ int fdt_parse_aclint_node(const void *fdt, int nodeoffset,
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[(2 * i) + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (rc)
-			continue;
+		hartid = sbi_hartindex_to_hartid(hartindex);
 
 		if (match_hwirq == hwirq) {
 			if (hartid < first_hartid)
@@ -989,7 +983,7 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
 	const fdt32_t *val;
 	int rc, i, count;
 	uint64_t reg_addr, reg_size;
-	u32 phandle, hwirq, hartid, hcount;
+	u32 phandle, hwirq, hartindex, hcount;
 
 	if (nodeoffset < 0 || !fdt || !plmt_base ||
 	    !hart_count || !plmt_size)
@@ -1009,25 +1003,11 @@ int fdt_parse_plmt_node(const void *fdt, int nodeoffset, unsigned long *plmt_bas
 
 	hcount = 0;
 	for (i = 0; i < (count / 2); i++) {
-		int cpu_offset, cpu_intc_offset;
-
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[2 * i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-
-		if (rc)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		if (hwirq == IRQ_M_TIMER)
@@ -1045,7 +1025,7 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 	const fdt32_t *val;
 	int rc, i, count;
 	uint64_t reg_addr, reg_size;
-	u32 phandle, hwirq, hartid, hcount;
+	u32 phandle, hwirq, hartindex, hcount;
 
 	if (nodeoffset < 0 || !fdt || !plicsw_base ||
 	    !hart_count || !size)
@@ -1065,25 +1045,11 @@ int fdt_parse_plicsw_node(const void *fdt, int nodeoffset, unsigned long *plicsw
 
 	hcount = 0;
 	for (i = 0; i < (count / 2); i++) {
-		int cpu_offset, cpu_intc_offset;
-
 		phandle = fdt32_to_cpu(val[2 * i]);
 		hwirq = fdt32_to_cpu(val[2 * i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		rc = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-
-		if (rc)
-			continue;
-
-		if (SBI_HARTMASK_MAX_BITS <= sbi_hartid_to_hartindex(hartid))
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		if (hwirq == IRQ_M_SOFT)
diff --git a/lib/utils/irqchip/fdt_irqchip_aplic.c b/lib/utils/irqchip/fdt_irqchip_aplic.c
index 4d7b1e77..9d2f6ee8 100644
--- a/lib/utils/irqchip/fdt_irqchip_aplic.c
+++ b/lib/utils/irqchip/fdt_irqchip_aplic.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/aplic.h>
@@ -19,8 +20,8 @@
 static int irqchip_aplic_update_idc_map(const void *fdt, int nodeoff,
 					struct aplic_data *pd)
 {
-	int i, err, count, cpu_offset, cpu_intc_offset;
-	u32 phandle, hartid, hartindex;
+	int i, count;
+	u32 phandle, hartindex;
 	const fdt32_t *val;
 
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
@@ -31,20 +32,8 @@ static int irqchip_aplic_update_idc_map(const void *fdt, int nodeoff,
 	for (i = 0; i < count; i += 2) {
 		phandle = fdt32_to_cpu(val[i]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		hartindex = sbi_hartid_to_hartindex(hartid);
-		if (hartindex == -1U)
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		pd->idc_map[i / 2] = hartindex;
diff --git a/lib/utils/irqchip/fdt_irqchip_imsic.c b/lib/utils/irqchip/fdt_irqchip_imsic.c
index 2e47cc81..153c4785 100644
--- a/lib/utils/irqchip/fdt_irqchip_imsic.c
+++ b/lib/utils/irqchip/fdt_irqchip_imsic.c
@@ -12,6 +12,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/imsic.h>
@@ -20,8 +21,8 @@ static int irqchip_imsic_update_hartid_table(const void *fdt, int nodeoff,
 					     struct imsic_data *id)
 {
 	const fdt32_t *val;
-	u32 phandle, hwirq, hartid;
-	int i, err, count, cpu_offset, cpu_intc_offset;
+	u32 phandle, hwirq, hartindex;
+	int i, err, count;
 
 	val = fdt_getprop(fdt, nodeoff, "interrupts-extended", &count);
 	if (!val || count < sizeof(fdt32_t))
@@ -32,21 +33,11 @@ static int irqchip_imsic_update_hartid_table(const void *fdt, int nodeoff,
 		phandle = fdt32_to_cpu(val[i]);
 		hwirq = fdt32_to_cpu(val[i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			return SBI_EINVAL;
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
 
 		switch (hwirq) {
 		case IRQ_M_EXT:
-			err = imsic_map_hartid_to_data(hartid, id, i / 2);
+			err = imsic_map_hartindex_to_data(hartindex, id, i / 2);
 			if (err)
 				return err;
 			break;
diff --git a/lib/utils/irqchip/fdt_irqchip_plic.c b/lib/utils/irqchip/fdt_irqchip_plic.c
index 61c68ac9..f75fb292 100644
--- a/lib/utils/irqchip/fdt_irqchip_plic.c
+++ b/lib/utils/irqchip/fdt_irqchip_plic.c
@@ -13,6 +13,7 @@
 #include <sbi/sbi_error.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_scratch.h>
+#include <sbi_utils/fdt/fdt_cpu.h>
 #include <sbi_utils/fdt/fdt_helper.h>
 #include <sbi_utils/irqchip/fdt_irqchip.h>
 #include <sbi_utils/irqchip/plic.h>
@@ -21,8 +22,8 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
 					   struct plic_data *pd)
 {
 	const fdt32_t *val;
-	u32 phandle, hwirq, hartid, hartindex;
-	int i, err, count, cpu_offset, cpu_intc_offset;
+	u32 phandle, hwirq, hartindex;
+	int i, count;
 
 	for (i = 0; i < sbi_hart_count(); i++) {
 		pd->context_map[i][PLIC_M_CONTEXT] = -1;
@@ -38,20 +39,8 @@ static int irqchip_plic_update_context_map(const void *fdt, int nodeoff,
 		phandle = fdt32_to_cpu(val[i]);
 		hwirq = fdt32_to_cpu(val[i + 1]);
 
-		cpu_intc_offset = fdt_node_offset_by_phandle(fdt, phandle);
-		if (cpu_intc_offset < 0)
-			continue;
-
-		cpu_offset = fdt_parent_offset(fdt, cpu_intc_offset);
-		if (cpu_offset < 0)
-			continue;
-
-		err = fdt_parse_hart_id(fdt, cpu_offset, &hartid);
-		if (err)
-			continue;
-
-		hartindex = sbi_hartid_to_hartindex(hartid);
-		if (hartindex == -1U)
+		hartindex = fdt_cpu_intc_phandle_to_hartindex(phandle);
+		if (!sbi_hartindex_valid(hartindex))
 			continue;
 
 		switch (hwirq) {
diff --git a/lib/utils/irqchip/imsic.c b/lib/utils/irqchip/imsic.c
index f6da9f7e..82249afb 100644
--- a/lib/utils/irqchip/imsic.c
+++ b/lib/utils/irqchip/imsic.c
@@ -96,7 +96,7 @@ static unsigned long imsic_file_offset;
 #define imsic_set_hart_file(__scratch, __file)				\
 	sbi_scratch_write_type((__scratch), long, imsic_file_offset, (__file))
 
-int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file)
+int imsic_map_hartindex_to_data(u32 hartindex, struct imsic_data *imsic, int file)
 {
 	struct sbi_scratch *scratch;
 
@@ -105,12 +105,12 @@ int imsic_map_hartid_to_data(u32 hartid, struct imsic_data *imsic, int file)
 
 	/*
 	 * We don't need to fail if scratch pointer is not available
-	 * because we might be dealing with hartid of a HART disabled
+	 * because we might be dealing with hartindex of a HART disabled
 	 * in device tree. For HARTs disabled in device tree, the
 	 * imsic_get_data() and imsic_get_target_file() will anyway
 	 * fail.
 	 */
-	scratch = sbi_hartid_to_scratch(hartid);
+	scratch = sbi_hartindex_to_scratch(hartindex);
 	if (!scratch)
 		return 0;
 
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
