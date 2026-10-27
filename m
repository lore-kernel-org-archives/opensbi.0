Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE915606A31A
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MVij80Ll;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=RgG6cSQ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=mIzUqQPb67f0gIQx93md1tZucaHnEcbZlWZ5ttptpmE=; b=MVij80LllxgdQ5Rj6+BR//S4fZ
	NabjBqgFRZ0hHAtglKQRTgdnMGwtHMIpkfQ7MDAcwgTviGmT0dDNTMaBAnBYl97yTt4eM57go97wa
	1jVm0scF2kML19cVxRqHLVrKH/lq2wIbgy7ZW8ivi7WnwOSJukU9Oy75+l2rg0a+gm1IqAVjZQXJX
	tLJh98BoJ5EFIZe/oHUVq1P0WVsQvIvug00JmFkUtNEm17x+FxmK2UrSDZ8jxFKmL/rp3YOJEqPCD
	FctMahVGM2Y3gu+VX1vYcTbUPA7dU0dpdxt2lzc3Gg7kzABgXdLoR9QUyFXd67VKF/m3ydJ/vpgDB
	zzyJJewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqsM-00000005xFQ-01iV;
	Tue, 27 Oct 2026 23:46:42 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqsI-00000005xF6-2UW1
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 23:46:40 +0000
Received: from LT03 (host-209-35-187-178.broadbandcancun.mx [209.35.187.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 335583F7C2;
	Tue, 27 Oct 2026 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793144794;
	bh=iwwP9Dobos5Yq1xCg1HUZzXhygvgOopncMLCp03kW3k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=RgG6cSQ8jefF5sx+i3w0K/26fidTBygnxnSVW/g+21kGMPiQZ7DrNuHNyqZ8z5OKR
	 H++bNOATU76SGnBktBJCEaQ+XhH0x+0GxtIjUTlehyx2Yahh/gMepnm8HZhrIzoIWx
	 DppqdqkYTrmP+qzOMPAD8HcSEO6FWFvcFmkI5OHlQyX7+Brw3oNXesVf9QtHuZaDNv
	 sNtSC62ehOMy0MK3BMqOx/J5u/auIUsL2+gVLQ9QwPRE0kFcUunP00VqyPpjyekhoT
	 PwpTH2tamzSElijfQb8DTeKaziAVHMueLZWFu+7Q05+WDqKZbn5849OcESeUj4NxKA
	 qvis1yav+K0YBwe4Nz9bHuU/0Oj1+5vQAPM6zkQVSZqDWUX0J/MSU3hBEGXvfN4gQN
	 JmePXZtznk4ViGv336YesIHKphwL4hvCg9JzA8EtWCbSPIgHjpgY5he9+yjY/tIdOw
	 5pxjRuBfIF+548v+lLnR9vvCklX8uSUyiB1pzpoyVvo91gSAS5IT1/8huVgX0ZTM9r
	 1TzahNXOFWiRPAeKClwXoX3jn81lzwzlhxKFHvdeR4spNPTLtF/Zfi3Gmxcjcl0Onj
	 nRZeTViPslYyJQcOr+izEr0UZk3VvqTvs6Mp12ecBQmSZyeke2bcAJjFHffQ7HEp2c
	 MQVPAJHEAaTlYboxpFxqiB6k=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] sbi_domain: correct loops in sanitize_domain()
Date: Wed, 28 Oct 2026 00:46:15 +0100
Message-ID: <20261027234615.503835-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_164639_081513_6F9727AD 
X-CRM114-Status: GOOD (  11.54  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

If sbi_domain_used_memregions() were to return 0, (count - 1) would
evaluate to UINT_MAX and a buffer overrun would occur.

We don't expect this to happen. But we should be prudent in our code.

Addresses-Coverity-ID: 1680796 ("Illegal address computation")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 42fe5632..73686da3 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -493,7 +493,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 	}
 
 	/* Sort the memory regions */
-	for (i = 0; i < (count - 1); i++) {
+	for (i = 0; i + 1 < count; i++) {
 		reg = &dom->regions[i];
 		for (j = i + 1; j < count; j++) {
 			reg1 = &dom->regions[j];
@@ -506,7 +506,7 @@ static int sanitize_domain(struct sbi_domain *dom)
 	}
 
 	/* Remove covered regions */
-	for (i = 0; i < (count - 1);) {
+	for (i = 0; i + 1 < count;) {
 		is_covered = false;
 		reg = &dom->regions[i];
 
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
