Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A623EA3F31
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGrY3oKk+8ES6Md7sQMNS0SVIzSbCBLR1Zxv1u+Hb38=; b=xjhWXeAWGASleg
	Ht9VoltbSnQLb3O2cchht0BYYEpZZm8M8LuLvyucxmTi5CnxUykA5CArs0OoAcfEpDTMEL7W3PfMd
	LjSNWtZ73NtTIBd+eYvTshpdEimx9qc+5MUbplEqrI2BME5/Rrte6eCsPSHKjRLdslvDTTi2g7A72
	FKaoH84VOQEH6PvIlkkkzLgPbxHbQ8InC5CDIZmpYjnWFOcw/CU2uRHRpwhCFEiUwfuXlOOGzSh4E
	sLZ5BLB95nY/fRlfEkiRRuGdGx+oNhlj1+y/Ia71bpLa7QtUvyLMbJlo0w+sFWYrLz9Yye2KI50l6
	pdwa58Gdv/ems8CSX+lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGh-0000000GlXM-39EC;
	Tue, 10 Feb 2026 09:42:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGg-0000000GlWV-0vVA
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a8fba3f769so23899225ad.2
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716569; x=1771321369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3R9vgO/x9b8W3dSnPHmMCrB3IuD4mg8nPaHgFUwEoQ=;
        b=mxQnYaRDwnqwloGq7WtMBTXvE77pMskF+LWppP84I4a+Mi5dJ3zd54yim4XVrFEWbS
         xa/z+sr1IYCnb1Ja7HZ6AMfNFLrOOrrsEazN1dInxuF2Ev/3uWCa995qsaxvj7/pIvZG
         hSNfeo7wFd/RJTnJEAIVuBA3d4UvwOIOWuBAZxTy4QowkTLiYj/VKa8wP/zskRdNAVTN
         wBgMep9mno2wi6kkBAZHmBmkdiZBQ9/hCyfFfW5sInQg0q5AqYwPwNMbjgGIj8h+izfe
         CzG6rsN/Wl5c4fswsktR3uSFq+7DxeHuWdtig2gXIeyswWsf2yP5hTGKLFy+m1PELHG4
         /X3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716569; x=1771321369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n3R9vgO/x9b8W3dSnPHmMCrB3IuD4mg8nPaHgFUwEoQ=;
        b=bXbIYSXinQa7VnClIO7d8ZPFNWDFhfBoECYWPKqo/CGoyisEKKfZSBFBUwSvxsvpAG
         ym3qOEkx0CMyWDf3AuM+f8JPApyxgGTdNQ0biUhcDAu3LXfSJPi6mAdFG00q2hZsxP8q
         z4R2UP8QlYoylqRspJEuq8ccJz1wRnNm1YTtlfeopNEyOzIiXBJkfUlm0+VkfcV3HwNL
         33axC45YiE98+6r4FpntGLj5sJc9Ow60CcGo67q3F/1PCT4CV5OzvC0misWaWniH+pT6
         UgXKfXghYWEx4xGvUTpkScD1Oo/JrleWYw2vUPR7QCtcZBAcYfG+tPI29buZf+XP4kgX
         wekQ==
X-Gm-Message-State: AOJu0YzqSdE53NB9/bM0rFCrKEKwNtDLM42GOG2LRfYV686R6ZtVgVM8
	gcC0H7pSQ7ksHnBaMNbZp6srIq7rUaHYxHW/f8EN/bf9Lefc+FkFCcBuQdPuGQ==
X-Gm-Gg: AZuq6aI/gNUjlcwhdDFawGlm+svvxp/kXTd9fsq9oRFjd1xiNoqz5dtKi727LhEuWtl
	YPQiJwwN1xQFf6mfZSlVVz08wOiwvEt3AFekrfXZu64hNLd1BO6oDE5LbCwsTRyPdWOto+uI45d
	ffhvIFFA5duSeEinl+AhVxhAFquZdMY7e/37QsA0uJUtsRaHSELpzMk2VWyLsNYELGhaznGkB/O
	1sf4kl6WiH9ajAoTnUSm6gpdi9onpd/UgtAtIMYT/eQs6/odvL9gI3T8Hez9K2994teNwtgTEKo
	Ym2qPxS+ImDYmiyv7Kbq6dZSkj/paJPn/yO5h4PBO7OD7KFqvg5lfTkw+gh0mOJOxU5vgAOC7ii
	wzmxbD1RDvZS9V7mzlbkfcB3wMXQZqekAt6hwc5PRXS9rR81FmymEwgVVAorJThVbE6wbKBfPup
	4ogfjFDtTlBZdZhqO+npl7/Qmn
X-Received: by 2002:a17:903:124d:b0:29d:9755:9bd8 with SMTP id d9443c01a7336-2ab10344b46mr16257805ad.22.1770716568803;
        Tue, 10 Feb 2026 01:42:48 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:47 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 2/7] include: sbi: Add sbi_regs_prev_xlen
Date: Tue, 10 Feb 2026 01:40:39 -0800
Message-Id: <20260210094044.72591-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210094044.72591-1-ganboing@gmail.com>
References: <20260210094044.72591-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014250_278891_4703DE9B 
X-CRM114-Status: UNSURE (   9.76  )
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

sbi_regs_prev_xlen reports the xlen of previous mode by decoding
from multiple CSRs including mstatus/hstatus/vsstatus

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/sbi/sbi_trap.h | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 731a0c98..4ef672f4 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -273,6 +273,64 @@ static inline int sbi_mstatus_prev_mode(unsigned long mstatus)
 	return (mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
 }
 
+#if __riscv_xlen == 32
+static inline int sbi_regs_prev_xlen(const struct sbi_trap_regs *regs)
+{
+	return __riscv_xlen;
+}
+#else
+static inline int sbi_mstatus_sxl(unsigned long mstatus)
+{
+	return (mstatus & MSTATUS_SXL) >> MSTATUS_SXL_SHIFT;
+}
+
+static inline int sbi_mstatus_uxl(unsigned long mstatus)
+{
+	return (mstatus & MSTATUS_UXL) >> MSTATUS_UXL_SHIFT;
+}
+
+static inline int sbi_hstatus_vsxl(unsigned long hstatus)
+{
+	return (hstatus & HSTATUS_VSXL) >> HSTATUS_VSXL_SHIFT;
+}
+
+static inline int sbi_regs_prev_xlen(const struct sbi_trap_regs *regs)
+{
+	unsigned long hstatus, vsstatus;
+
+	if (!sbi_regs_from_virt(regs)) {
+		switch (sbi_mstatus_prev_mode(regs->mstatus)) {
+		case PRV_M:
+			return __riscv_xlen;
+		case PRV_S:
+			return MXL_TO_XLEN(sbi_mstatus_sxl(regs->mstatus));
+		case PRV_U:
+			return MXL_TO_XLEN(sbi_mstatus_uxl(regs->mstatus));
+		default:
+			__builtin_unreachable();
+		}
+	}
+
+	/* V=1, Check HSXLEN first */
+	if (sbi_mstatus_sxl(regs->mstatus) < MXL_XLEN_64)
+		return 32;
+
+	hstatus = csr_read(CSR_HSTATUS);
+	/* Check VSXLEN */
+	if (sbi_hstatus_vsxl(hstatus) < MXL_XLEN_64)
+		return 32;
+
+	vsstatus = csr_read(CSR_VSSTATUS);
+	switch (sbi_mstatus_prev_mode(regs->mstatus)) {
+		case PRV_S:
+			return MXL_TO_XLEN(sbi_hstatus_vsxl(hstatus));
+		case PRV_U:
+			return MXL_TO_XLEN(sbi_mstatus_uxl(vsstatus));
+	}
+	__builtin_unreachable();
+}
+#endif
+
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		      const struct sbi_trap_info *trap);
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
