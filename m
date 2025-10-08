Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36304CCA470
	for <opensbi@archiver.kernel.org>; Wed,  8 Oct 2025 08:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/isDRkBCjnM8r+9zIz2IszWS8Alz0UDAuyC9JykgHYA=; b=RteX2O6ab1kOQH
	71kqiNcV0AaiDDimppe9YgHV8YVhv9ix3ibl75Jtu/OTH0xjXGO23vXOL6CUMNySHNu1YTpS5Xwxc
	BANvhuMfN1vCuG5Gi9DI22ex8KqjDr76X/NSYadKOSreq+okSDWFV6Yun2fdZPSbmUkaqvAtM0PPu
	0fwFFoK8WGWBJexDgdwLagddPcqgBXnkOA3u55xljV3jZZSbvIQ7HPyNDNf6VxQe/HjT6sjg4dyX1
	my5lccwFNAujfs4qb6EJc5EiguOk5xFr4hg8HN8l8qeKNMl2PpYOJKJj1FnvOYWObtNW69aaKvBHm
	l1CJcQzkWpEFNulyeD2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnF-00000003UXW-1A8U;
	Wed, 08 Oct 2025 08:45:05 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6PnD-00000003UUm-05zG
	for opensbi@lists.infradead.org;
	Wed, 08 Oct 2025 08:45:04 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b5507d3ccd8so5895875a12.0
        for <opensbi@lists.infradead.org>; Wed, 08 Oct 2025 01:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1759913102; x=1760517902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBYirb3kfj8qSWcGgzTpmHXLEm0C5lgKeuIDXb0ku8Y=;
        b=EZSk6jCZvm6PyP32bPAeMkKwt41XwA6KLlGXuCu8kICYwErw3ZiOPYKcKOs38MhHM+
         JSGs0uf4Dzi2bx3toTH2Rto7X/RJDeD1x5aPWNfKDuvyRHZXC979+UarTCKaYAo0xna9
         tu5wuUYZAgzV7nNlZ78EdXKOqaW5jx28MoL+yADY7uVpjO8iNEEoxiyURAAtHSvvbywc
         rU16pBtiWSJmOXK8RW08xIYEb2WmwJOETuwZMBkY1WiIUQUK1KAOnpg79V2I/tYlmRTA
         VFTguHqELVPLTDYUoX96tz9dTJfxccQqe9ok7zqu69liOTDpukVo9pDv7687E3qqcKNl
         7qOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759913102; x=1760517902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LBYirb3kfj8qSWcGgzTpmHXLEm0C5lgKeuIDXb0ku8Y=;
        b=cbd+zwIf7Uhro68kY+AFVWOhu0TVYWuEHB2+tRC7fglkDODh5Q+2I0PxS6yWqb2GHA
         dtiFbGS+kQZxRennuWjG/3nCjpItq50kZgkMaSb77BIaCjws1AcTPh/NK3wAzp9wM0gL
         sLJCkgDd46gq1RmKSSekDdupmvy9vLIkIzLBjpRxJqvPyxoT2Ngtsz9MngL5N3HBzytK
         8UBzvX8D15ifiOJMon8Ueg3AbYN12MjUKKTdnunLQbBHDT7skoSpHtizFjXCmis3lgw6
         MLobPnN02BySxEENpz/3DkUNCCXlDmiQl2M/z9f5jfZlmFdtnB8VrKu5s8X0pSxQNAp2
         ISWQ==
X-Gm-Message-State: AOJu0YyFXrbJ5X7t7nxAGlUx+dU5VTmxg5VQslGJ5hf6HjG6G5H/4JT5
	tx7e7znUx6ElpVGJk9Ce5b9swpE4SsF5yVQLaEInOFA04bouxtCOChfFyiu41Yn0gMXqzB/bLhs
	GMZ5il4WOva3HrYsjnGyGX2yBgTRj/y/3gMdtvbDEpSuscb1U4xdF9jZrfpyrh1Z8qolZCkhT0R
	7bCNcXZW0iYpyBQD4p7mqSRHe+CKZzdamaW09IHSVx826tnoCm/0c=
X-Gm-Gg: ASbGncs1PNu2FhuLqazlt7G2me5THQdJxRJXHmK3vftXC26AdkFpsrSvTYsmdkgdznO
	w6emT6PuA5CYmL9Z25bH2y0c+Rc6oqkqf59mlaGSuI6kqx5oztZISS/l3tNWkZg/sXBRlfxzKBL
	L3/suNY4/AaOREh7OVYHzBokA7h6VDd4FBC7iHkslMDQEtAkF9Pv2GrDoc+mnL3cmP1rq81IiRI
	isVP1IWDh2SRExdGR4B4Zc4bRAEdBdYWYUNjQEJRk33Xu1j7PfUSi+eb/10kz6M/NmQNz/Gw5Wg
	z8895bhmUIitYCb6PwYvhlgXurH0uu06yyycOQzgT499eGLenpoA0OopJe2N4TpSZP0QfXXaypa
	J6gZq8xa+UxY+as4WCT6WQxKilVpK12MrdaeEnf8COeNDpdrpMyep/xbf1W+qCiPrg1X94YpkSV
	a0ZWY/7vshdhuXQVsRmOcrFPv9Rt63JPBnOywzbdxMEpdn5DfdS0pXUANGo0AaNCricgg=
X-Google-Smtp-Source: AGHT+IGSRMffaO9GxNGzINzhjA+tx8/zDO6wtcx2HZ8YEZfG3siI5SEE5lgr3kDbv6S/Rv232hlO4g==
X-Received: by 2002:a17:903:3c2c:b0:267:a55a:8684 with SMTP id d9443c01a7336-290272159dcmr37029715ad.2.1759913101812;
        Wed, 08 Oct 2025 01:45:01 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28ecaefd60fsm51327255ad.93.2025.10.08.01.45.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 01:45:01 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	wxjstz@126.com,
	alvinga@andestech.com,
	anup@brainfault.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 6/8] lib: sbi_domain: ensure consistent firmware PMP entries
Date: Wed,  8 Oct 2025 16:44:42 +0800
Message-ID: <20251008084444.3525615-7-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20251008084444.3525615-1-peter.lin@sifive.com>
References: <20251008084444.3525615-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_014503_064024_0E318637 
X-CRM114-Status: GOOD (  10.56  )
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

During domain context switches, all PMP entries are reconfigured
which can clear firmware access permissions, causing M-mode access
faults under SmePMP.

Sort domain regions to place firmware regions first, ensuring
consistent firmware PMP entries so they won't be revoked during
domain context switches.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h |  3 +++
 lib/sbi/sbi_domain.c     | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 9193feb0..1196d609 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -121,6 +121,9 @@ struct sbi_domain_memregion {
 		((__flags & SBI_DOMAIN_MEMREGION_SU_ACCESS_MASK)  &&	\
 		 !(__flags & SBI_DOMAIN_MEMREGION_M_ACCESS_MASK))
 
+#define SBI_DOMAIN_MEMREGION_IS_FIRMWARE(__flags)			\
+		((__flags & SBI_DOMAIN_MEMREGION_FW) ? true : false)	\
+
 /** Bit to control if permissions are enforced on all modes */
 #define SBI_DOMAIN_MEMREGION_ENF_PERMISSIONS	(1UL << 6)
 
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 968fe61b..657de10d 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -294,6 +294,20 @@ static bool is_region_compatible(const struct sbi_domain_memregion *regA,
 static bool is_region_before(const struct sbi_domain_memregion *regA,
 			     const struct sbi_domain_memregion *regB)
 {
+	/*
+	 * Enforce firmware region ordering for memory access
+	 * under SmePMP.
+	 * Place firmware regions first to ensure consistent
+	 * PMP entries during domain context switches.
+	 */
+	if (SBI_DOMAIN_MEMREGION_IS_FIRMWARE(regA->flags) &&
+	   !SBI_DOMAIN_MEMREGION_IS_FIRMWARE(regB->flags))
+		return true;
+	if (!SBI_DOMAIN_MEMREGION_IS_FIRMWARE(regA->flags) &&
+	    SBI_DOMAIN_MEMREGION_IS_FIRMWARE(regB->flags))
+		return false;
+
+
 	if (regA->order < regB->order)
 		return true;
 
-- 
2.48.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
