Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6A7606A31A
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 00:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcVSrOKh;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=VReeY1/4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=j/hopPvXpibvE1dzrBkgTWxq9b6JYRyV8bsKJQ8kYK4=; b=zcVSrOKhkNcbrU6dhPSpzEPCj6
	gvO9k3nGQoCBpdhDD5f5iQg80NF0KEhNrJ1SDiaCv2zi1e+4OnYhJKG0OLbJE9M4NCxUBBzsT0UF7
	IP90VzEUMnmLQWG5UPNAtQtTFRjoZlISD7d0idJGk4f2BKgOdoQNTTL+KBq6cb4ftAMKqD4ZUiWyB
	Rc+Z83DWQh+O6svs8Ra3cnHALgnvRmDUUf92/JlB4uvBqkKeFYutBL7oDRBNDwwY1UZshYWzlvTEg
	4Tl2BVwlU768vT4qN33crMlOVRSfw6xUcSRBog/T8OeqdHsnPNFQCKHkdkG8HkZ8c9uGCUnCux19G
	d6fl7Pkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrQc-00000005yuH-00TB;
	Wed, 28 Oct 2026 00:22:06 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLrQY-00000005ytu-0MqQ
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 00:22:03 +0000
Received: from LT03 (host-209-35-187-178.broadbandcancun.mx [209.35.187.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id A6B6A3F113;
	Wed, 28 Oct 2026 00:21:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793146919;
	bh=W7YxBkxiX4xkEHLgeDuFdeagK6QXl1Czr/uDiBquKow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=VReeY1/4k4Y6T/s7/0WeFwhcusoOw5OxHsg5i2G9kSXteoV2EoKWc1BninY9FfkbU
	 Sg+nJhFk9rKcnmMuLCBVyS6KQo7ZPMjQ3C4fJpPGEaZ6XryplVWcXQ9TPdgnuem3Fi
	 2plmhFqEHYkNjcZEuDY/0VeZ7f7IWFJUmvYElcI4+v1tDvtBUVBYq99mWh/IMQ564M
	 60jgJvxX0yOt4iiFCsgWiUFpZ9ZJ97lAzQcthRz5GlJeGjt5Cr7FT+xAc1E8sr9eIp
	 rv8Q7y+Y1OdD7Nviy5eL/Pk7L+4IIV4t9hEyCPkYSch48L8wPIYpIAdDVjZc6SxDt0
	 d/hVEKq/Tk0fQdEP5lHDTrCNQMRN0GLmrX7yOWmaLjRQdT5iCM4WMwVdCbT4LcH8tt
	 TdwQZDzIcC3LXgkAfeELiWwHbJlM2CwUrGOQ/n6gixzBePl+J5WDhpd4fGRHfnDFwz
	 7i1rev40WYRUf7TZcdSTxo+a1FOQFQqj0okoHly7Ip8C0NOXKBNaOJWvApsRCtInXz
	 BQ0pgaPYCrCR47evMa5xIKvbUIFJconNuRm+DX7UQzgSlrmA5SfF0U66KLJnO7I4p+
	 jA3s0xm2y1vxNCbwEG2OuOsfpC8pNRl5bzSZY/OxSEzrInZ4To+V2aX6edOUP85Myq
	 UZb69XTdxe20GggfYKRbBEhM=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] libfdt: error handling fdt_open_into()
Date: Wed, 28 Oct 2026 01:21:52 +0100
Message-ID: <20261028002152.506228-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_172202_398608_8FFE3B74 
X-CRM114-Status: UNSURE (   9.09  )
X-CRM114-Notice: Please train this message.
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

fdt_num_mem_rsv() may return -FDT_ERR_TRUNCATED.

fdt_open_into() should handle this error condition instead of blindly
continuing.

Addresses-Coverity-ID: ("1595097 Overflowed integer argument")
Fixes: e2ce15cb3be9 ("platform: Add libfdt support.")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/utils/libfdt/fdt_rw.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/utils/libfdt/fdt_rw.c b/lib/utils/libfdt/fdt_rw.c
index b3b8e73c..207b5ffc 100644
--- a/lib/utils/libfdt/fdt_rw.c
+++ b/lib/utils/libfdt/fdt_rw.c
@@ -427,7 +427,10 @@ int fdt_open_into(const void *fdt, void *buf, int bufsize)
 
 	FDT_RO_PROBE(fdt);
 
-	mem_rsv_size = (fdt_num_mem_rsv(fdt)+1)
+	mem_rsv_size = fdt_num_mem_rsv(fdt);
+	if (mem_rsv_size < 0)
+		return mem_rsv_size;
+	mem_rsv_size = (mem_rsv_size + 1)
 		* sizeof(struct fdt_reserve_entry);
 
 	if (can_assume(LATEST) || fdt_version(fdt) >= 17) {
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
