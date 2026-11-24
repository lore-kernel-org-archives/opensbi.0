Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09481606A31E
	for <opensbi@archiver.kernel.org>; Tue, 24 Nov 2026 04:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ynBEK5Ef;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Pwbz7yrw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uvjuNEJB7HPyvqvz/+05sr4hg3m8jSkj14C5DQTXRqk=; b=ynBEK5EfP36mWaztZqwALjl/v5
	XfydZaJ59T7n/MAO3sDsz3ujIm9/ehwIueUXGWhiPZ5OEORGPsjz1bWlHmcn/vBpYEv4/0lhkBeCF
	X++4vgzH+KbunN0IEMwXcQl2TUCy4FRz37Tl6eJ57Wi3zgQxfzpzHk9mCK2omNHACIYzZO0Y2Icx4
	fGZfjvlqgJobb1mi9ObNOd1eMgACFbrgQeMtaGxYjqn9kLk8+dPLbFtKHeeRdJcL3j23gDsX5Bnmr
	urUnwuZq3fNdCJsYn1wHoiYNqlKU2KPvCwv1rSfO+XZmQASN1/x0Louzk9iUwlQkDT+tgQZZpevD/
	TgkTrqGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxe-00000005VZw-31vq;
	Tue, 24 Nov 2026 04:16:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVhxc-00000005VXL-1yuP
	for opensbi@lists.infradead.org;
	Tue, 24 Nov 2026 04:16:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2f04f61282dso15900245ad.1
        for <opensbi@lists.infradead.org>; Mon, 23 Nov 2026 20:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795493811; x=1796098611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXD9q88AZUldPHqjRTFNAX5JVla6EsHzt1WVKLAPOqU=;
        b=Pwbz7yrwjFW+eLlILVoFP5SG6rwGP/y1gcBSV3i5eMA5qJsne03//yxeOS6YguOPe2
         w2wkoM4SLNDS1DL2V9K9+XJicAOG/q3I8me38up8UU5j0ur6F458Ftdw3LyrC4dnYvUE
         FFG/yiyp0P1X2q0EuQc5YSrMX3PLWfRtWE3F0ku4Mmd7OOVjcpWzCLXU07aiOXD2gfvd
         CHnJqRSvU3dUq/75IukCOHlwlUL40WhMIp0BDRPorygV3n1Aw34r3T72iraQI6GunRjX
         hXQIuDk9qmj6S20OaTSRDToMqhSnsDsp9nOviKkv2IXVL0AGJlhmfEdoGltiyFsHeYVf
         D+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795493811; x=1796098611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXD9q88AZUldPHqjRTFNAX5JVla6EsHzt1WVKLAPOqU=;
        b=HVosJBUu8FHaaurqWh3+2lCvtUdbIIC1HP8t1IsrHgXuYrvFL0U/mb5h1svoxMPNPJ
         DFuqG5GIVrMz+Miffz4GA7s6vbRJ/jnYI81h/cPXJ4gaxW1s6AnJWLOsQzvQTaIDYzV1
         ybLeJsMetae0SfM9nDNnyH3SmWrftCOLzoSQdKKGHJnHl4UqBGnf6y1ebieljRemaVG8
         um4nwUB0JEPAH6V2Wc5JSKS22enoywb1l6Kn5Ep3+K417Dk8sgbsedtEUWxOC8F7cPmJ
         wAtXBnbDdu058lJcb6WSaQdcJHekcurT9l88h8/2a0tZWzh9Skf85D4J8xPwCssJlDqF
         Eygw==
X-Gm-Message-State: APuU4Z8p06mrCeI0Otur8IcWdVUiH9G35NOMdUqQb1Q5LwCKXUJ5T7qp
	oPwdK/9WaESXaWy1hEygnrCIXSGQFHWEfe/iSmBUfvYUKWNOqIu1T35MB2lI9RqI5Z4q/qfYnpT
	0rDe9yJP4EAKdasemSkrZb2hM4qvhP7wxz5LqEuMewM7rJgXTRyj9CqLH1syh6ok2000ZNs9MX3
	CMgoQhZkSqbrhkKAPVC7YTIK8Rt+LDH6TuZxAjsvDut+/u/i4nybw=
X-Gm-Gg: AZFdTZdNahfpCbFNjoMWLKjunXEGUDd4lgYX0uPhJ+M7onBKPPieigiqWQ9C45G1+wd
	Sam0nAVu6gZzaRObmLbFHO0rbDTWecXcVyT6r36Bpk28CBzHLUsAkuDEAL0cBy9HX/q6iVDjfJ2
	hTMyshF9jkkOpjWPphepnN26gxkfOA865WMOtGSwKAqcqU+uGQpo6cwnlVe0tzGz+worLYv/E23
	LHUTQAnEwEsN0aIV9TRSxUhYhDMY4GuI3g4t1kGEuhJTHqIvVGLf/5/R3oXA9O4uaeIPubkhF2R
	Es1+Q77LUlnYBTwMKv/O8zzK16rTrN68yvdDgIRDKhqZP6cyw1bPGLoVU3Ww7orwJanqlilY4Tu
	3QI6GJcZsl+lHZ+Id/J48mU0G5TKddBXjHxYB0EEDefxh3KTgFYA5dnNiTZ3zKS/7l4/BsV5+EJ
	4W10msO2kS39d+biQyuw1d8CDYnYJJLBgLOm9IP4g4vy2HPiMgjxuVU4Ipt5tPqv0uMCQ8KsW+B
	4NVcpdcbzGKR0KMHtbLwLeJqTEiCjQ89rDrwV0l7hAhhiVS/ZqjKvHDFmPyjIYA5RlRBtuQVLUY
	BHeFF/gk/bpkAdZ29hD4PVxFh0GhtlB69/CU2gC8/EaTxrdV
X-Received: by 2002:a17:90b:390b:b0:3b3:b858:cc92 with SMTP id 98e67ed59e1d1-3b41c97ac6bmr12157954a91.63.1795493811318;
        Mon, 23 Nov 2026 20:16:51 -0800 (PST)
Received: from localhost ([136.226.240.203])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d135e9sm23412418a91.4.2026.11.23.20.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 20:16:50 -0800 (PST)
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
Subject: [PATCH v6 5/9] lib: sbi_domain_context: propagate error from sbi_hart_protection_reconfigure
Date: Tue, 24 Nov 2026 12:16:27 +0800
Message-Id: <20261124041631.1049169-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261124041631.1049169-1-peter.lin@sifive.com>
References: <20261124041631.1049169-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_201652_533911_079771BA 
X-CRM114-Status: GOOD (  10.71  )
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
