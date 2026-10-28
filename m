Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C058B606A31F
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 00:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KI3ml4XP;
	dkim=fail reason="signature verification failed" (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=ldHapmGl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=hYtu+DCAo45rtYuoyLmMIKCAx+qKlQi7TMCCMzHbRRA=; b=KI3ml4XPnebgUwVeHOkrQFq05b
	E4ZBfTZh6TPAObGAYAoeJ4F1Unxud1a37hUHyxQg0K82sC+htnShNyn+xxha//KbTf6HMJqwFqSlE
	4hfKLTkxT/DruzcEMmLsIZtbBFMOCv00JVoUpShVvO/ZUde2mRcjoxjhOosS6iVELZS9NbBV9Yc3P
	QqFEUhFMKzEIcXAFPkg2xPbf4Il16s8AZOB50ylhMQMjgQtR8bWiQz9eE9h9L4qjIij+gB8i9oPnV
	Ub6v8r/tBudhKjgh988Wod8sWVrGvWp8QNd0d2YZdalDLe1EAT6fe4iraMlXV1Qo5qoVJd+ZXXfYg
	l8bH60yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLr8u-00000005yHR-3nYt;
	Wed, 28 Oct 2026 00:03:48 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLr8r-00000005yH3-3YO1
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 00:03:47 +0000
Received: from LT03 (host-209-35-187-178.broadbandcancun.mx [209.35.187.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 83B7D3F115;
	Wed, 28 Oct 2026 00:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1793145822;
	bh=SqRHJTysFkp3OYMqGz18o961My7hNT8RKjT8e977uTQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=ldHapmGl2lbY39WQxJbI/lrIAPYk7Vl4ucdiQfmc6aMLVqL5yARNdqxET83yOetHV
	 Mw+X6BzByng3C2BK8G6eChb+PT9hDeFosD8MA82ynhwtXb2/61DeoCFuILHN6zMDnW
	 rNxzksfAu7CHH8XzkEDTlDIqycPJI+HbC1XtlyOPlKXudm5qj8bBoJYvs5rqNHubY1
	 y7aBwcrcNX6pqwv7x0V1ZwQhlI1MsGC/OHSybekVtNGxgrXphxPmCyWs/LYOVGeoQM
	 irrTHXEXTYN9dmjpw8jHwVnD/uCfPi0JGWIVlUkYdCxIPq/Ra2YK/Y0PCr73fKnvo9
	 k7w+RFebRjn+Z/xd2gFT6kJxBOmJmXEWxdIKJBYBw9shn0N2KeXgOMRZMT3mjgrEf2
	 7jQAklLNl/R8qEImCNhNwOVh3S3fW69ke3Pvyxk2dbPPMXxjn7N52WFwYXOdmRh0rC
	 xhL+yHHukrRYKIxNCgZ1/SrA6WN4twizUrLMqcCrZDD2m4a3m+l1Z/9A34M8sCDe1f
	 ya3cwmk37OhNHZ2dZIB7VDHQMqCLeKrqds8eK2AyZG/OoYa/w6ZEgEvehxdShJIHLH
	 s0y6ZaP/LOOkgKSRCXlxNJpZACFgkJJYKbIzNu+2bT0C4Hho/K37P4TZrNhHAi5CHB
	 Wa5RG8JfB2Fa11iscBDVJ284=
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] lib: sbi_domain: logical constraints in sbi_domain_context_exit()
Date: Wed, 28 Oct 2026 01:03:29 +0100
Message-ID: <20261028000329.504700-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_170346_163236_3C4895E5 
X-CRM114-Status: UNSURE (   9.59  )
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

We check that tmp is non-NULL in one statement and in a later statement
we happily dereference it.

If hart_context_get() returns NULL, the hart-domain combination is
obviously invalid and we should simply continue in the loop.

Addresses-Coverity-ID: 1680795 ("Dereference after null check")
Fixes: 55b6b73435ec ("lib: sbi_domain: Introduce domain intialization order")
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 lib/sbi/sbi_domain_context.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..88afbb63 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -307,7 +307,7 @@ int sbi_domain_context_exit(void)
 				continue;
 
 			tmp = hart_context_get(dom, hartindex);
-			if (tmp && tmp->initialized)
+			if (!tmp || tmp->initialized)
 				continue;
 
 			if (!dom_ctx || tmp->dom->init_order < dom_ctx->dom->init_order)
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
