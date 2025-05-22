Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B56C54E65
	for <opensbi@archiver.kernel.org>; Thu, 22 May 2025 01:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wpPt9TnSctNCsFb7CztTdk+K0+YtUxlKWnb8Gm3Z9ss=; b=306ViCOA1N62Sp
	MB/0Ik9beHWZMLow6Ff9F4seLRAvv4ynaJm/MoN8tdjHynxv98ZqOooXgKrkgTl81Zg+yteCYALZ8
	/jhtvCqgSF9V+212hFwuFVrAR9dDMrSZoufjL5xJ6qMZHj5fWcLG9RLGnPAx3Bn0xJaN1Iv9ITNCu
	mfiwreOQF45PFmTXila15jaQ+44+8oewdh3qKyVlalkz4KVzcK9x04HH7iltqtENUpVtdAlU/hWGL
	k4jAo2DbS35KGp30ZvS3q2eT9LNFS/T3xJjifmzTKElj/3YnYiqNtR3vWFcVqTY+Tgc5/sx12Hd5O
	1TabZdglTB7gEbftNU7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHupw-0000000HBpM-3UCb;
	Thu, 22 May 2025 01:35:08 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHupu-0000000HBoo-2R6y
	for opensbi@lists.infradead.org;
	Thu, 22 May 2025 01:35:07 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b1a1930a922so5110539a12.3
        for <opensbi@lists.infradead.org>; Wed, 21 May 2025 18:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1747877706; x=1748482506; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S9SdV+oYBmZqz6x8P8boYuYZYalRZnnrbOrT7skhLhU=;
        b=fEV11OOtfQScQM90gh1vnIXLQ5c1xEF5TNC8FY0mnHTm+ERl1t2nIL9f+4l+FKn/FC
         VC0+NT5xcIUBmrnQz/FCneDBho7sDY+iuecdYoOgixagHtRtkGlUhPb2yxS8LwvHaSAk
         AQLV+ySySCZibMt807jQaEki1Bo5OjQHvpWPKbQKbGzGDoppDJ6aGwap4amolyeMpXuu
         Hfetdg9Cu2C67c41Nw514t//5mmXVvx8yziAF8TjokG5HmKjziEjMS2bxm+Sv2V4bSLX
         u8/8eLExVgZ5hAxoyULMaLPAycIqlbSZgrJT9Vm8FcNA1zaU96DcvLgLxnyxgWOEz/LO
         s1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747877706; x=1748482506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9SdV+oYBmZqz6x8P8boYuYZYalRZnnrbOrT7skhLhU=;
        b=P6XYxndr4etYAszgNggNxFR4aZqvBkwxnSh3chL+q4LjABQ9z0jiorV+ZSmUmpqc72
         xlP1+1ltXlvg/Jmx/KHdagcn89E0yQGtCvc81sbn5rJsqegP24ffx2E4f0emUOl0+ATu
         EAGBLDrEbL63RGz40aVg5qq27egMHO72U5S4QCPXFMKYJJ/bNtpQTUkqCl4QZM+65X4l
         Nq4ESHCxO3wLsbpyMDBzuCHHn8Al++EYd1oozyZWcjS1q7tApZ9fY2tItuhBPMHjRoFG
         O+hStpRnetdhJphdp1rd6c0OoAx7/iA75swKhfX/ZUTYG/CJimsqjB2VrYmKiFS0haEx
         ZsLw==
X-Gm-Message-State: AOJu0YyC1Tyx0RVODLzPxyJpIw2gkv8g7CWfNLW8rk2/QQVxNvZRJ3QP
	nlk0LnjhUooJzBwBvi4Sx/p6jbNWrRFCSa37ezScJogW21nsgHHaewxltbLitdCqh+MRecWh+2a
	E4rtcq2a4SubiYTzQtVoWAwhMm2yyKTLsvwEBvfe35D0MzJQK4BiZx/wrXHYwoxMkQXrv5Eh0+7
	VEUaEmGI82IvqgJzCmblG8D1zmmx7mhhsKz8fpVS3esaZ5aBNn51TKTIQ=
X-Gm-Gg: ASbGnctxlcu3n8FJ0pn26CUzr5sMSuhbOxiOKQ6fcDMcU4qseO42s5Dz8AusGY5WT7X
	cqsYgeNXoRTqtU3a+uJZLPgrp5kszs1p4dqvwJUJMAxZj23XzMAlD1eR3TA9iODhBjUMbadyC0E
	rHr+qQ7bYjJN13OWmZ0+UxYejITrd5iwtF9JqpOzGfrYWjuIDBbVTrZe14FypYX7uxxLgkN/cYY
	2zGeaSYsZMEuMVUEOqfSdXV3ZaXAX4mJL7oIMDOuD0dM48q93r/h7Z0MuWvwizTHDn+rR9ZWNDB
	Uh3UOQZV7Cq7GF3i6Yq3KNabVzi+k4/347hkCtKWryf+aX70Dl2QoLHd14dMruUkj8iVUEJnWg=
	=
X-Google-Smtp-Source: AGHT+IEiQSbDvWSa5tsu1nI9/WNEyI8TFGGVaS+ZmC1ybfz8DbNtc3AEazPCzM+GEFY048qHP3Je/g==
X-Received: by 2002:a17:90a:d604:b0:303:75a7:26a4 with SMTP id 98e67ed59e1d1-30e7d4fea75mr36951281a91.7.1747877705588;
        Wed, 21 May 2025 18:35:05 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365c4ef2sm4323932a91.17.2025.05.21.18.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 18:35:05 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH] lib: sbi: fwft: Use only the provided PMLEN value
Date: Wed, 21 May 2025 18:34:33 -0700
Message-ID: <20250522013503.2556053-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_183506_636724_C249C648 
X-CRM114-Status: GOOD (  10.93  )
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

As of riscv-sbi-doc commit c7d3d1f7dcaa ("ext-fwft: use the provided
value in fwft_set(POINTER_MASKING_PMLEN)"), the SBI implementation must
use only the provided PMLEN value or else fail. It may not fall back to
a larger PMLEN value.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_fwft.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/lib/sbi/sbi_fwft.c b/lib/sbi/sbi_fwft.c
index c46006d4..a2aefb9a 100644
--- a/lib/sbi/sbi_fwft.c
+++ b/lib/sbi/sbi_fwft.c
@@ -223,32 +223,32 @@ static int fwft_pmlen_supported(struct fwft_config *conf)
 	return SBI_OK;
 }
 
-static bool fwft_try_to_set_pmm(unsigned long pmm)
-{
-	csr_set(CSR_MENVCFG, pmm);
-	return (csr_read(CSR_MENVCFG) & ENVCFG_PMM) == pmm;
-}
-
 static int fwft_set_pmlen(struct fwft_config *conf, unsigned long value)
 {
-	unsigned long prev;
+	unsigned long pmm, prev;
 
-	if (value > 16)
+	switch (value) {
+	case 0:
+		pmm = ENVCFG_PMM_PMLEN_0;
+		break;
+	case 7:
+		pmm = ENVCFG_PMM_PMLEN_7;
+		break;
+	case 16:
+		pmm = ENVCFG_PMM_PMLEN_16;
+		break;
+	default:
 		return SBI_EINVAL;
+	}
 
 	prev = csr_read_clear(CSR_MENVCFG, ENVCFG_PMM);
-	if (value == 0)
-		return SBI_OK;
-	if (value <= 7) {
-		if (fwft_try_to_set_pmm(ENVCFG_PMM_PMLEN_7))
-			return SBI_OK;
-		csr_clear(CSR_MENVCFG, ENVCFG_PMM);
+	csr_set(CSR_MENVCFG, pmm);
+	if ((csr_read(CSR_MENVCFG) & ENVCFG_PMM) != pmm) {
+		csr_write(CSR_MENVCFG, prev);
+		return SBI_EINVAL;
 	}
-	if (fwft_try_to_set_pmm(ENVCFG_PMM_PMLEN_16))
-		return SBI_OK;
-	csr_write(CSR_MENVCFG, prev);
 
-	return SBI_EINVAL;
+	return SBI_OK;
 }
 
 static int fwft_get_pmlen(struct fwft_config *conf, unsigned long *value)
-- 
2.47.2

base-commit: 69a0f0245f39ea3af4685cab4cb2dda90acd17cd
branch: up/fwft-pmlen-update

-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
