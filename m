Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3566FC28B20
	for <opensbi@archiver.kernel.org>; Fri, 28 Mar 2025 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2/kuiAEzE8OEZjPP2zkjiIggmr9Jicu/IuNyMH2MI3c=; b=wW+1Ueel7RVA5N
	5tI3fcbLiupNYAkcTnaYy14tO42Eb9+HuxQUTovL3LR4IEF0RrO+SZdEvvVLVXLBsNilsoUQW/iys
	wlCGXv/xLFd3LjDT7hLQcTOtptBPzjFBSzBFpwL5TM6R/x0R+nAGu+Jc8P4vWgyH01BY7j8JwbK4t
	dQWAFrpY3CiLDgY1RVy6ZHv4ou8TcSVNvV1bcQ7G+ls6af4Y5Poiq78qxsxZoRgakpCkrk6ZV1xyt
	ztBJokcceby+DgrOf397n6tNXa+pOxoGsDJ33+YlcRdtQk+4yJu5+NO886ZVXEh6RziT3ssOoQH0u
	2xi7cNukZuBKLtLkn3Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5Hv-0000000Cwpr-0p1w;
	Fri, 28 Mar 2025 08:42:03 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty5Hs-0000000CwpQ-3l7s
	for opensbi@lists.infradead.org;
	Fri, 28 Mar 2025 08:42:02 +0000
Received: from mail.andestech.com (ATCPCS34.andestech.com [10.0.1.134])
	by Atcsqr.andestech.com with ESMTPS id 52S8fkRY077868
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK);
	Fri, 28 Mar 2025 16:41:46 +0800 (+08)
	(envelope-from ycliang@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 28 Mar
 2025 16:41:46 +0800
From: Leo Yu-Chi Liang <ycliang@andestech.com>
To: <opensbi@lists.infradead.org>
Subject: [PATCH v2 1/1] lib: sbi: Allow programmable counters to monitor cycle/instret events for Andes PMU
Date: Fri, 28 Mar 2025 16:41:42 +0800
Message-ID: <20250328084142.540807-1-ycliang@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs34.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 52S8fkRY077868
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_014201_245966_4A323682 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: ycliang@andestech.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Referencing commit 0c304b661965
("lib: sbi: Allow programmable counters to monitor cycle/instret events")
to support this functionality for Andes PMU.

Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
Change since v1:
	- Modify the comment
---
 lib/sbi/sbi_pmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index b9e84543..575799eb 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -719,12 +719,13 @@ static int pmu_ctr_find_hw(struct sbi_pmu_hart_state *phs,
 		return SBI_EINVAL;
 
 	/**
-	 * If Sscof is present try to find the programmable counter for
-	 * cycle/instret as well.
+	 * If Sscofpmf or Andes PMU is present, try to find
+	 * the programmable counter for cycle/instret as well.
 	 */
 	fixed_ctr = pmu_ctr_find_fixed_hw(event_idx);
 	if (fixed_ctr >= 0 &&
-	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF))
+	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_SSCOFPMF) &&
+	    !sbi_hart_has_extension(scratch, SBI_HART_EXT_XANDESPMU))
 		return pmu_fixed_ctr_update_inhibit_bits(fixed_ctr, flags);
 
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_11)
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
