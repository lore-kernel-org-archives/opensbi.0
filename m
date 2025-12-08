Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2E77D3ABEF
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TR8HEPt6DKYsEkTMwXGtousfrDZk6C2Cj9lb9iAULoE=; b=ggqUjiV0HKIJri
	EiULK39SflrOZWCMx/HI2rk8XZHeXK5e8bWAOsucc1Bw0x26PRfoxmk5M0m9ZD7Vo5+LbPhxRPSn/
	KPJvo1zYS9bCb+TYoQm7GIGJMRnxMYYUQ6MqLmJvsAKfHHJWqjzJeqzxAL5GHiRsJUIa34ybOyQ6Q
	jbs5jb/oKRPn/bvGE994YxfUCJi6VgUvLlPdM8mJgj5ycbeUVQegI9IYec1afJh5wxUqSotwDzcuD
	X5HT8AqpFiQNR39XvzKOozQGIMlA8rj5yB3H1gLqUfNLik6rAQPbnTSzV4ouKYelWCYeLgSgbeXuT
	/p/yLlN6ow49zJBJ3+RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXVk-0000000Crly-1sog;
	Mon, 08 Dec 2025 09:26:28 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXVg-0000000CrlN-1u4q
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 09:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1765185984; x=1796721984;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7MgYokARU4RjKtuZjHgmf9ZnG+BtQiylVrqYG5nQrYU=;
  b=NXYGOEzqbDko5OrcLIP+HLWE/KD3+dUKppPkU2rXVQ+heOWUiwLqBkPp
   NEbelG2qDPKt4ZA66P3R7ASWTjNgXGKPVndNkWczAUu5HEqFYDFkpQR2c
   +kjzl8eFgXocbmYaN9BxqTFz4IAJlSVkgwpU+mlivqTQCQrkIs4B6MdPx
   1CzIjkMpwYhKmHBn5fOKdHXp7OKefHKM2mGy0TJ78iQmTWTC9VDdjFz3T
   hBbDVvuAdF/77YsL/u1uMhdqwdHvCVMvJ9NTj5s1ZF+4R38fKfEy+lBqN
   zMT98ZGnigHfNwlwaP9bLEA5Rr1+qpFYMO8IbSBr1Vmvu1VI0wgG1EL/k
   w==;
X-CSE-ConnectionGUID: m80hnIdTSdu8viQK/+sP1A==
X-CSE-MsgGUID: algO288pSrKBScH9yNL+gQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:26:20 +0200
X-CSE-ConnectionGUID: UgNSQoO7SLG8FrpYt6/k0g==
X-CSE-MsgGUID: qF5FnnQARpyIxdo6WvAvSA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 08 Dec 2025 11:27:16 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 08 Dec 2025 11:26:18 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH] lib: utils/fdt: devices to use MMIO memory
Date: Mon,  8 Dec 2025 11:26:15 +0200
Message-ID: <20251208092615.1081606-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_012624_984813_1DF2FC2E 
X-CRM114-Status: GOOD (  11.50  )
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

When applying FDT fixups, request device memory to be of
MMIO type. MMIO memory type may imply different properties
like cacheability. Request for the regular memory may be
incompatible with the platform arrangement.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 lib/utils/fdt/fdt_fixup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/utils/fdt/fdt_fixup.c b/lib/utils/fdt/fdt_fixup.c
index f3fe8af91dfa..b0ed20c85144 100644
--- a/lib/utils/fdt/fdt_fixup.c
+++ b/lib/utils/fdt/fdt_fixup.c
@@ -185,7 +185,7 @@ static void fdt_domain_based_fixup_one(void *fdt, int nodeoff)
 		return;
 
 	if (!sbi_domain_check_addr(dom, reg_addr, dom->next_mode,
-				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE)) {
+				    SBI_DOMAIN_READ | SBI_DOMAIN_WRITE | SBI_DOMAIN_MMIO)) {
 		rc = fdt_open_into(fdt, fdt, fdt_totalsize(fdt) + 32);
 		if (rc < 0)
 			return;

base-commit: de376252f4f3e3df4998bd14893cb687821b4102
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
