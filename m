Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B06606A33B
	for <opensbi@archiver.kernel.org>; Fri, 20 Nov 2026 13:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1cqlFgOu;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=Lh9dfKfv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=+dDhhO9uq4K1kkAmKwxFYGXOXGlwSje27iAnnzVBoSU=; b=1cqlFgOuiOISQcyFFjtjvUw4rJ
	7DD8IAXJG64BYYBWyxCmmADrT/dwOQAGU0RDpGMKHeivEu+bmFoErALZyc7i2XnPP99MlP7USDAWE
	qzfWBCMNNftRXe7w9GFTbxiZIN28LDcRfCGx06WqNSU+lSMuUsliIOZdfaXp2HmwNpTFl3af6JV62
	6h0sbOcqm0QOg/koQbgQJ18MVDWWGwFdxTTEMWET8yuUftu0sUnmlfd/HPPiFR7bAIWhE50OGPkkc
	tYlTE4D2nMF/c72pbF24fbuKZcxW4+D7Dxiokhre3lancQBJp6HH6Xxl9nTwjfIRGSHrwUAhOXezC
	mF3YdBnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOao-0000000F5X4-1gvu;
	Fri, 20 Nov 2026 13:23:54 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUOac-0000000F5VC-3g2q
	for opensbi@lists.infradead.org;
	Fri, 20 Nov 2026 13:23:44 +0000
Received: from LT03.fritz.box (ip-084-119-040-110.um24.pools.vodafone-ip.de [84.119.40.110])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 3CB1E3F115;
	Fri, 20 Nov 2026 13:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795181020;
	bh=OgbCSiD7nwYJlD9a2M5i4YNJl5BuWJMP7HxXqBpjPXo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=Lh9dfKfvNGnRSAUmFCHq36vG1p1mAL/3mL+Evd2I4U6mmjb08hwCHdn5zVNjuAMSF
	 n7wCyIc3DgliDoJuQOvHtlAT/Npw6lS4couPZcoLeeVcJizsp4Em1X44rjZnEASILP
	 FwKDaMRtxkn1oVHVqxY+9SYkbIIgO08ZLtE3sWmLp9RTB90OeCfbDoSkpO/fH+k3xa
	 rLZ+pOEVAU4+TQa7IevykFV0gxHT37HpYJwIesyNh1ocL0LdYANGwrU+gJxHopO1ut
	 K40jfS9VOVH/Z26vnyJSMF7bz7i87p7unKE8dPYBHkTMH28tJVzvd7VnGqRY873Gzd
	 i3/jlTWpAEwSLl25iwlgvABO2vO/84RgsrI79NqCweWImccDUoI4brhJjiIxs6L4+X
	 tqcJ65O/+HZfPiugYFmuCoyIWyt8HFI2RV6PKc4KIhB2/arAsUYWrNhZQKfShe4Mxo
	 LdJjbJfe9fnaW5QpkMYrOT4jVMqYrOCH76O0RXxy8hk9UwYrKODZ+Y7bLnzkKSSjrm
	 8PC+Yft4AIhvtTZjJE3hDFZdXDZwqBg24/fWAquaanXsgvtrk5MDs8+dymraayW29p
	 13iD8GqR1CVvn52JvcZtf3RsTOrafanKRC9Z4ksmBKdfi8A59AxsWS/zJNVqaCEzbY
	 hwCS2szs0e2zEpoTM7dBl7nc=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] lib: utils: mpxy: mm: move attr_rsp before the first case
Date: Fri, 20 Nov 2026 14:23:35 +0100
Message-ID: <20261120132335.55713-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_052343_182008_CC42F203 
X-CRM114-Status: GOOD (  11.83  )
X-Spam-Score: -4.4 (----)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The switch in mpxy_rpmi_mm_complete() declares attr_rsp right after
a case label. A declaration after a label is only valid in C23, and
the build uses -std=gnu11. GCC accepts it silently if not building with
-Wpedantic, but Clang stops with -Werror,-Wc23-extensions:

  fdt_mpxy_rpmi_bridge_mm.c:160:4: error: label followed by a
  declaration is a C23 extension

so "make LLVM=1" fails for the generic platform.

Declare the variable at the start of the switch body, before the
first case label. The scope is the same as before, the whole switch
block, and the code is valid in C11. While at it, remove the stray
tab after the assignment operator.

Fixes: 37bde95c8c38 ("sbi_utils: mpxy:: Add MPXY RPMI bridge MM driver")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c b/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c
index 55b31872..29e3fca0 100644
--- a/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c
+++ b/lib/utils/mpxy/fdt_mpxy_rpmi_bridge_mm.c
@@ -156,9 +156,10 @@ static int mpxy_rpmi_mm_complete(struct mpxy_bridge_src_ctx *src,
 		return ret;
 
 	switch (src->header.service_id) {
+		struct rpmi_mm_get_attributes_rsp *attr_rsp;
+
 		case RPMI_MM_SRV_GET_ATTRIBUTES:
-			struct rpmi_mm_get_attributes_rsp *attr_rsp;
-			attr_rsp = 	(struct rpmi_mm_get_attributes_rsp *)payload;
+			attr_rsp = (struct rpmi_mm_get_attributes_rsp *)payload;
 
 			mm_shmem.addr = ((u64)le32_to_cpu(attr_rsp->mma.shmem_addr_hi) << 32) |
 				(u64)le32_to_cpu(attr_rsp->mma.shmem_addr_lo);
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
