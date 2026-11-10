Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7680D606BF0A
	for <opensbi@archiver.kernel.org>; Tue, 10 Nov 2026 09:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GONRPGTM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=l3oZA1K2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wr1wwOVrq4jEFkKKhaA4A/iiDPpReAASU0K00AtXc+Q=; b=GONRPGTMuCMBRx2lffoL8j9kYJ
	FBzsxkJeTK0i8rGc4SC2Y1BaQZ3lN+HPzKHQpB1Q8p7gfpgSBKWDtqP8ncbaLRCMKv1mc991D102O
	PLS6jljbNbvo5q9JbQ31G9TTGXSsZc94ScQdoVhlCD7qFmP7jJIDtlJ7CyYYvxxU7uqtQnhZnaypL
	XAXpmsOusOkFN7/3JxCj00quCNqPE519zClGkPpGRQYS7vcBi0lb0+Mp7MppaLb9JtEVkqyOTCUwp
	RSTwoJ4iNThk3L76/oXkObk7vAbtKpHSxkXCm6Xseph/Iy/apxKXrz2lXYGMcscIW5oQ9NmKmFcz4
	JA0iwqkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV9-00000003LUB-1gUz;
	Tue, 10 Nov 2026 09:50:51 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiV6-00000003LRZ-2xBx
	for opensbi@lists.infradead.org;
	Tue, 10 Nov 2026 09:50:50 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ed06b725fdso13777005ad.0
        for <opensbi@lists.infradead.org>; Tue, 10 Nov 2026 01:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1794304248; x=1794909048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fC2tQYfTtNaDP89KkDz8Lh5az+nVYH3xvoVefjKE7Mc=;
        b=l3oZA1K2wlggerquFcPku9rSIBSEFPv9lZd+hx2G9llrXie/pziYzeVVFiKaXh7p6g
         270eq6CvJczbPgjUUeMGEH3slIoUdO8BZ4wH6cUpVqdnv2Z5mauIu8U/HLGivHa080iH
         ryeYWtumPEAZsg9f+8MI4HrLeYtThXOw689yeyeO11OssBwOB8a2NHPDRlhkSeinyzHz
         FCN1NXBFA+phv3l9e4SuTQNeyeqThrXVngkkoT4efPMmmYBi7J1RHj4qeqNTbOxDC+VT
         Fr4gaS/H0LVQksr68xA9wg8ZROsSML3f6HnE7Wi9YITj+UkkMfSTWCGBSGkLoOa04/BC
         FlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304248; x=1794909048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fC2tQYfTtNaDP89KkDz8Lh5az+nVYH3xvoVefjKE7Mc=;
        b=EwH6iTaDMyMjcY/vy1URKy7xAwbOIxexbq/4ZIWXUJ4ZHBUHwsV+Mrnd8zJZCUor7z
         52K/iXQrRBeO4/tX9c4uT09q+JkuHMMDgvkCiw7rutJ1BIWpaTDfPHdfmG4Xdd12LbvD
         zKK/N05yxc4toNyJ/nMqAfuQ9QnVklzniONOTobeKkVYiCDH8H7OTd0nVMTJ2aogDjqr
         r4wETIO3EgSjWpOfbrQ8LAXj0TtkvfA17qS8y3I0PpTeLmQM7QAPa2Et2IPqfRwaJabk
         ogpvLkmIILf55VfJgwHtHNKh7bq418/42oK5lBnz8K9+tT1FUX5y7E40a10yd9lZQxPs
         yVgg==
X-Gm-Message-State: APuU4Z95cSVEC4Kv4fgOY3/ghBDORDbTssDxke5UNQOe7LqzuPLgh9n2
	A8UUi0F1Nsrn69hH7F3legXjHgS8+irZugdwtncvDJjbGJELM8cfzDCD69vDKcAK2fBlk2n1LOZ
	1vu0mzdowVV7V/QdvMQC+/lFNeAEKok+x/8JytZjCF7+OAQ2qFJjkflM9/ZM8PR+a/RRCeN/JQa
	qJuzae0t1S4r1FRSrmfa5W9ZQXDYyS1QTe7F9l98v/nOU5Wd1yhyw=
X-Gm-Gg: AYBFou2fj9ohxV7JHQs3PsxREuov1bjjd3EayMbXq8q1zXqBBQAQ8u0xHQ7oeH1ChPM
	yVPZbNLDYPskYQoZgUOIpLwfufOf7I40LGLP5Iz8npKwkAvLGzEJWXC9BSPbpr/EQydx00AiZgo
	rMgHNRTerFtaVp0EymRdKy3CBKI7PjfKDGly4KRE97idEZt0QdJqYe0lnkeP+2/Tyl/agvHNHhC
	6RstLyqaKVwQT1Ry//W010r4S9srR+3SDrXud0MEDvpYAvp/D0pSlv4bifDNw2zV68+6/T6hwKI
	nr8uz3m/b8sxhQXDP1AeS/whFT11O2+ifYQqiU/IfRHKuaNw6PzWGiPLlNbi1dRJXV5nN8tmvBK
	BI9A6uQH9fRFKpSKS8cJr5UC7MSgOq93gDJmcUnXUkwh4t8spEoS2E3TjogaQWcxn6UegXuZ+Ww
	wX9pOsOLtVfeeoCsoVxci7zft5CTBU2i9RKPnJQdtvuiiP5jE7qkDBwoqiQd8R4nxJpBLe0FBXG
	N8XxzCWnvjI2n4/I9OWRKf+r94f+haqQu7VCxZhso0jbJcBL3m9DzpWGusAJk6bYf2XLjCbpAMC
	lgN3gQbDZzgmzA4/TK8k0qXB6ZYc
X-Received: by 2002:a17:902:d60d:b0:2e5:41d6:178c with SMTP id d9443c01a7336-2edb91a09ccmr15241235ad.33.1794304247589;
        Tue, 10 Nov 2026 01:50:47 -0800 (PST)
Received: from localhost ([136.226.240.177])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6de7df0sm6570565ad.63.2026.11.10.01.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:50:47 -0800 (PST)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org,
	anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com
Cc: raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v5 5/9] lib: sbi_domain_context: propagate error from sbi_hart_protection_reconfigure
Date: Tue, 10 Nov 2026 17:50:25 +0800
Message-Id: <20261110095029.117504-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110095029.117504-1-peter.lin@sifive.com>
References: <20261110095029.117504-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_015048_749188_BF8AB10B 
X-CRM114-Status: GOOD (  11.11  )
X-Spam-Score: -2.1 (--)
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

Propagate the return value of sbi_hart_protection_reconfigure in
switch_to_next_domain_context to ensure that domain transition
failures are correctly handled by the caller.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
Changes v4->v5:
- No change
---
 lib/sbi/sbi_domain_context.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 987ac7fa..1751d016 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -110,6 +110,7 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	MUST_NOT_HOLD(&ctx->dom->assigned_harts_lock)
 	MUST_NOT_HOLD(&dom_ctx->dom->assigned_harts_lock)
 {
+	int rc;
 	u32 hartindex = current_hartindex();
 	struct sbi_trap_context *trap_ctx;
 	struct sbi_domain *current_dom, *target_dom;
@@ -173,7 +174,9 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 	 * is also required for some of the above CSR updates (such
 	 * as satp CSR).
 	 */
-	sbi_hart_protection_reconfigure(scratch, current_dom, target_dom);
+	rc = sbi_hart_protection_reconfigure(scratch, current_dom, target_dom);
+	if (rc)
+		return rc;
 
 	/* Mark current context structure initialized because context saved */
 	ctx->initialized = true;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
