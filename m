Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0399CFC501
	for <opensbi@archiver.kernel.org>; Fri, 21 Nov 2025 19:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Uo3evVn5i3STDxTL1vjQx2OJlduIgwUOeI648O4Uy4=; b=cTXLGL2FExjgCZ
	ZjlKrdwwQjNpq0+kokNqYmucuc8+BK5+UhARPpKgr6svvdN0cjOnq73ro9KD1ZDgI2RMbYcHbNfp6
	1d+do9UGpDleb7xp0pYXA6u6lYOaU2MQj6vyueDFWN/21dLSIu5Ow5YhUen6bhsm4uPaCXuPF8YXt
	O09/PGuKImPBREMxx/lNJwMbu4qhxL2GMF9R3KNZDQh9o7/6jEHfG5mbah7TzjWT0mJ4pdsB/Q1+q
	ROBYXT9R8NhVhA+KL8vme1VY9hHf2pVW9O2709ytBrkdfB5AeH5JqV5Ao+0ERGztTXnrapEVBN7Re
	JJjb7965AH5RPYEeYvmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWxS-00000008uke-0ymI;
	Fri, 21 Nov 2025 19:38:14 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMWxP-00000008ujp-2eJT
	for opensbi@lists.infradead.org;
	Fri, 21 Nov 2025 19:38:12 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b55517e74e3so1734843a12.2
        for <opensbi@lists.infradead.org>; Fri, 21 Nov 2025 11:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1763753891; x=1764358691; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9VDhPHAM/cP6rRCWqJAmo0pmDoOWyVzvKB4uS66aqfs=;
        b=h0AGiFxP4HU7gQAC+6V5C67J8RulcodMcchFsUxq6xynNt8N6G8d34SQyKE0u86A64
         5UDqXqKoY0LqJZGjJnnnKr2PlHC+o1aHytWwZkCIrkQI7bkh7IFnkXE94joC0VAfOnUl
         c34n4Ohdmdlkz0hQ+0RZjpcUwYCjCBQF9JttxUUlpMZg7NR0+5lTvnapg4O1uEUJKLNz
         hGyySvZY1iupfsKKoUHWyRcTlpTehXRVs7n6zeYJMDw97hvyeohZGbZjkMsvheMMubcV
         m1XhB58E1QiPkFuPELInLJ1WuZwW/W73wA/eLeCTm+UtghDgSj0AMix+SlDFflRmembo
         9ETA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763753891; x=1764358691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9VDhPHAM/cP6rRCWqJAmo0pmDoOWyVzvKB4uS66aqfs=;
        b=ijr4b6BKDmaJyXrRHo/4NPNFxHCwR0o0GblCkZ+8NNuH6zwKh3zIeHjCubUAbVdD+/
         w2lFMwDUxY9DApE4PCJDG7t0MTGcXXHt+Ys3u5KA+g1AbmXeAgT+e2MnLoqdzo7rmags
         vjZ3xEFSbyyJna1+czPDgfgd5/Bv0qQ8bGuFQ5zAuKd4HXDblNwTl7e/kRMQ3c5NEcgc
         k4zLZvvsjyYU2NLaQh/Bb2DU9OY5Z4Gu6Xb8p81oH2lb0fAsrO09PaIz+eiteZzV8Qau
         uT0OHCuTbkeSXr2zxyYjttuZG6cCY2dX7YlHYn/S62Osl+O6Cqn4SnyRAXhqNNxz6NA9
         /SlQ==
X-Gm-Message-State: AOJu0YzpkDdrdloHGN+q9SIyxfxGg4iZrrR3NbWtG2TyyGmLOWqli1DZ
	HyeVxeneixyLORzLFCTmx0EvQmxvz3zFxy6TFkqD6KxBkvqPluPbwX/eRDyW2IVNJevoo4D/huW
	NhpM3Z7/VsEyoxkDj/WNMMY14IX9ezc/yzTfi8vIDUYtVGrnOYaxhARZYSXJnbn5089xhJPv45g
	vuOtzHqPK0/zMcH0UKsxZPHcppLSXDy5em0gwmGZABgZlepO09SHpGG0E=
X-Gm-Gg: ASbGncujgLycdm0wMbtLFkjjwe0LFRgekFzmKVMiuvCWh5PHizI+6fneogSJioyd0ML
	N9+6PzRk2RjgO8iNeX+eVE+2e9Joodsa1+E/jyQciKHqdn2CIQdajyo7tZzzK0HcPJpl5pRinJ4
	rgy83NejwrAnYRT7xkLvyumwmT1+7zIqzd56CUr30rpY/xurFU67Lp+f9uHlPwCZqzSyGIvoqDE
	9zJBihCDjneU2jj9/LHkZrUGFP0pGVvXeN8vqyv1aO17GS5vJa1BHmfKtF8NcQnvC4oRdhMnZwz
	49TsTmEHgxVL8oTLwaB2GYHn07Omeg59c8fnS0L9F4bxY88QD+LHJKfv64NuUrieScbbuMq0C8S
	roKScfKQmrvs84qlBPaw2eQ77vVGeNSiXCaCrVwt8qM6uVof4yI/UsmnmqxzWSofCirOi/6wIxq
	ARDXh6N+Ynr+UP3BfhR31nbl6BkxFvyFUs
X-Google-Smtp-Source: AGHT+IEA6Jii0Jdfmixzl7/Cu3CXxZSolsRwAxfxw77PLME9SZgI8258sBFRQRx/p+SiqVuaSnVSbQ==
X-Received: by 2002:a05:7301:41c:b0:2a4:3644:4be3 with SMTP id 5a478bee46e88-2a719635731mr823296eec.27.1763753890461;
        Fri, 21 Nov 2025 11:38:10 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm25505480eec.0.2025.11.21.11.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 11:38:10 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: opensbi@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 1/2] lib: sbi_domain: Allow MMIO access to non-MMIO ranges
Date: Fri, 21 Nov 2025 11:37:51 -0800
Message-ID: <20251121193808.1528050-2-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251121193808.1528050-1-samuel.holland@sifive.com>
References: <20251121193808.1528050-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_113811_669606_99660494 
X-CRM114-Status: GOOD (  13.45  )
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

Currently, platforms do not provide complete memory region information
to OpenSBI. Generally, memory regions are only created for the few MMIO
devices that have M-mode drivers. As a result, most MMIO devices fall
inside the default S-mode RWX memory region, which does _not_ have the
MMIO flag set.

In fact, OpenSBI relies on certain S-mode MMIO devices being inside
non-MMIO memory regions. Both fdt_domain_based_fixup_one() and
mpxy_rpmi_sysmis_xfer() call sbi_domain_check_addr() with the MMIO flag
cleared, and that function currently requires an exact flag match. Those
access checks will thus erroneously fail if the platform creates memory
regions with the correct flags for these devices (or for a larger MMIO
region containing these devices).

We should not ignore the MMIO flag entirely, because
sbi_domain_check_addr() is also used to check the permissions of S-mode
shared memory buffers, and S-mode should not be using MMIO device
addresses as memory buffers. But when checking if S-mode is allowed to
do MMIO accesses, we need to recognize that MMIO devices appear in
memory regions both with and without the MMIO flag set.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/sbi/sbi_domain.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index da0f0557..0da43d76 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -236,7 +236,11 @@ bool sbi_domain_check_addr(const struct sbi_domain *dom,
 			rstart + ((1UL << reg->order) - 1) : -1UL;
 		if (rstart <= addr && addr <= rend) {
 			rmmio = (rflags & SBI_DOMAIN_MEMREGION_MMIO) ? true : false;
-			if (mmio != rmmio)
+			/*
+			 * MMIO devices may appear in regions without the flag set (such as the
+			 * default region), but MMIO device regions should not be used as memory.
+			 */
+			if (!mmio && rmmio)
 				return false;
 			return ((rrwx & rwx) == rwx) ? true : false;
 		}
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
