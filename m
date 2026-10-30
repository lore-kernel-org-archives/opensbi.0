Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FED4606A334
	for <opensbi@archiver.kernel.org>; Fri, 30 Oct 2026 10:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T4i0krL4;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=Ifv/qUOt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uvjuNEJB7HPyvqvz/+05sr4hg3m8jSkj14C5DQTXRqk=; b=T4i0krL4OK6m+OE4LI1aUVxuoe
	9Fin5No9vyRZZ/8HPqi3iYJaH6qqrVy86UUue99e0a2UZINLLABw/ehSPtJVrC7I6BMPXTX45Oq0H
	at1wj8KPm8xcxa7nigsjfxB04GRkp8aVRZTgN3QzsfK0gCsMXp7m+gugtM/zbEwsxM83fbj9Kp5dp
	7of6hodABBZtIkagMQy484MYraM/39qqX5hlG0EOCi6iiNjCiCOW5cs8ktVCHlTcJqNyUfLiZBlSb
	H5RSw2qkpFand2z96NvqqCaGZQ+D1AazoKfPF6Q3ZpzHyhj8YMWOx1tP1yZTq7D5jo57m3yHRVre9
	/gd8Y6OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7F-0000000BQii-0183;
	Fri, 30 Oct 2026 10:45:45 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMk7C-0000000BQgu-2Bxe
	for opensbi@lists.infradead.org;
	Fri, 30 Oct 2026 10:45:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3ad787e0593so242219a91.3
        for <opensbi@lists.infradead.org>; Fri, 30 Oct 2026 03:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793357141; x=1793961941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZXD9q88AZUldPHqjRTFNAX5JVla6EsHzt1WVKLAPOqU=;
        b=Ifv/qUOtFzes2NjIey9mvhN1JR1ga3TGlALwpbHiYBcMHAc6WlxN6KjVM+cpDBuLzc
         J2vjeIjONP06VcJ1EU/88fpMYXxeSlHbeHxeo8VuWaAhsvWS+JbniURAURZVFRxaBhO4
         npeTua4jYdM5MShcSO/P6MDfAaERSlrgzKy/lJorqCo0paucGAUsxaE+btgWBBKDE2uo
         78d8Wl3aBVDMuH4zTlNBkUcTmLIBoiO1aWRHMihlR0GQfRSULL+jSbnvyM4o38zOXOPF
         SFxRu4r0z1uy6ev0wGeTooFTCraXl03sZOBcqZaPYg2Pd9YZ+IgC+JApsqePC/cLJrGe
         CksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357141; x=1793961941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZXD9q88AZUldPHqjRTFNAX5JVla6EsHzt1WVKLAPOqU=;
        b=TCafownXd4b7zSyMd9VPy9nUQnhoqnxffeyBuqjj3ZPAdA5k4ZIp0zwJ2Ga+lhG42k
         UBPtDnfLfoAcRpTJ1YPeSuHdMi9gLLYd3jJrocuFfXPKg8R+s3rjKagnuj0WlpVYKTSH
         D/sAPEn414/A1Beu0guuiAGDpEFhnaPYUsQRCPj+SqtdjxbNwI4WW95k4lgev92yamF/
         subYfy776kkb7YNYLbdFfDFdhyHQmPmDTpJGkS2QhiAfGIKtQnKlM4z9EhuDDL6ZfbP/
         CPemheh8tAIxBuBZr+Bh0+iluXVToPNj0XNSpWFWKWK6Isk8WkILrQ9Dhk2zCZqhNA/Z
         sD9g==
X-Gm-Message-State: AFq9FYJ9OgQCtYAoXjus1UeVpRbVll4UxLRtNIntQpk95iw6qXejE6oq
	9CGOU4Q5DcOYCctlyQ8dVWCv1pfMT8IMPmKfKwApoNg/spwSzOmhzV+f4xdZOnV7KrKBRf9ro6l
	/SrbTrobvNlwdDoN/hGy4bO9OJNDCfL3xereaZXSblhNsHFcXC/bJupXjeTTgIvwvW1PS7+ksps
	UwZcLvA8j9RweYv5BfpYU0azyVOYON7g92Q8y/Dk/Vq0AoS5UhMPs=
X-Gm-Gg: AYBFou0vLiVEzU4jau1AW0rdY7wxHq59kn3WfSxDRnQuPQlPFlsW4FRaNh4dn3HQypW
	0YOQC0if5+rFD5nf53d9kZMzig7t67KoVZllmCtwXGlEraqPaWmYQIYBI9eTiKlCKIg5oDtzI4z
	NXT3o12xePkgieOXKSPVRVrG0pyVLRo/hDM/OyIJwzxumHZ9mT6xBYvf0eEja4iwuuPORiH7e+j
	cSQe+3oAjM0/rlcFaqBYrlYnoiVp6NXeDUT/qnm00m8hsjBgtfo4ia1ZSixB4m3A/uS/MAHueg2
	g3b97MkpdwQq4mlV+f3yrJVneK0gJIVCDKg1L2e4djXzJ//oxBA+M4Amqh2wODZyJivM1wOX1nO
	wk+cqCaJfNKcJJoDYipQTv2TimaKD5hN2lR3Av0lKXhEdGe4QLdUwOvJLJN50YDWcLHhd4Y/8jd
	/xjW3kPrN1xktd8vjboHcQageK1kuuXRHFjetl9oJuM/RsvijvVdV5ixQpqoPjD+k8WyeIxFQDl
	RnpCahCIzHjnwyUK+4tBI6H2l4q+mHpS5LXfiX/WEfIvzTbSJDLeQwmHsY33yyN/rEXuehVVT6m
	J0B3tkhtSJUUi2YpIXO3nIeFLPY=
X-Received: by 2002:a17:90b:52c5:b0:3ac:a11a:7c79 with SMTP id 98e67ed59e1d1-3ae89776aebmr1622036a91.16.1793357141055;
        Fri, 30 Oct 2026 03:45:41 -0700 (PDT)
Received: from localhost ([136.226.240.163])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm8182687a91.9.2026.10.30.03.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:45:40 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v4 5/9] lib: sbi_domain_context: propagate error from sbi_hart_protection_reconfigure
Date: Fri, 30 Oct 2026 18:45:14 +0800
Message-Id: <20261030104518.3297875-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261030104518.3297875-1-peter.lin@sifive.com>
References: <20261030104518.3297875-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_034542_562564_D9584221 
X-CRM114-Status: GOOD (  10.91  )
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
