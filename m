Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DCC606C3F5
	for <opensbi@archiver.kernel.org>; Fri,  6 Nov 2026 09:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E21H4YS3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qzJHH36WdKoikmX3WU+rHuE0tQGu7PhlN/v7NHJ3KlQ=; b=E21H4YS37A4n9aX/jcIjusevss
	O0miNFMwaPhC+xE207Di1WPCfkpdG1XfB8JGThZIOzk/sS14gu6ByAeLqAmJbLaQ3eojerI4H2oGe
	RHkvKJBgLWIf1LufR8yBAF9eif0F/eVcVn+5WS2LHekHPp++opDR7+G4RVpnoPB6tiDh0ILF0WwL8
	4PsVYzlFtgrOEaJ6s/fb5VClMqwih20N+uMh9xYaHhqHMRdej5bDmt+eG1eIS8tPQ0JqXbGG7xre8
	hlvbUHy5qoA4+TQ+1IRXuYvoHjn4kmXFmam4p+PMA1pRXPGorao/wdMdI6gvCDdyu1bwmphbEej9h
	4NqbLerw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGRi-0000000Bmks-1UU0;
	Fri, 06 Nov 2026 09:41:18 +0000
Received: from atcsqr.andestech.com ([220.128.198.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPGRc-0000000Bmiy-3m62
	for opensbi@lists.infradead.org;
	Fri, 06 Nov 2026 09:41:17 +0000
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6A69eiMX038051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 6 Nov 2026 17:40:44 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Fri, 6 Nov
 2026 17:40:44 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Nov
 2026 17:40:44 +0800
From: Randolph <randolph@andestech.com>
To: <opensbi@lists.infradead.org>
CC: Anup Patel <anup@brainfault.org>,
        Lad Prabhakar
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
        =?UTF-8?q?Beno=C3=AEt=20Monin?=
	<benoit.monin@bootlin.com>,
        Randolph Lin <randolph.sklin@gmail.com>,
        Randolph
	<randolph@andestech.com>
Subject: [PATCH] lib: utils/cache: andes_llcache: match andestech,ax45mp-cache
Date: Fri, 6 Nov 2026 17:40:25 +0800
Message-ID: <20261106094025.1734577-1-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL: Atcsqr.andestech.com 6A69eiMX038051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_014114_664738_4B80B911 
X-CRM114-Status: GOOD (  10.67  )
X-Spam-Score: -1.9 (-)
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

The Linux binding for the AX45MP L2 cache controller,
andestech,ax45mp-cache.yaml, uses the "andestech,ax45mp-cache"
compatible, and the RZ/Five and QiLai device trees follow it. No
binding defines "andestech,llcache", so this driver does not probe the
L2 cache on these boards. OpenSBI then uses a generic cache device,
which cannot flush or enable the cache.

The AX45MP L2 cache controller has the registers this driver uses: the
memory map bit in the config register, the init status bit in the
control register, and the per-core CCTL command and status registers.
Add the compatible to the match table.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 lib/utils/cache/fdt_andes_llcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/utils/cache/fdt_andes_llcache.c b/lib/utils/cache/fdt_andes_llcache.c
index 7a61b6ab..c32ff2aa 100644
--- a/lib/utils/cache/fdt_andes_llcache.c
+++ b/lib/utils/cache/fdt_andes_llcache.c
@@ -172,6 +172,7 @@ static int andes_llcache_probe(const void *fdt, int nodeoff, const struct fdt_ma
 
 static const struct fdt_match andes_llcache_match[] = {
 	{ .compatible = "andestech,llcache" },
+	{ .compatible = "andestech,ax45mp-cache" },
 	{},
 };
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
