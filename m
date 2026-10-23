Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC59606A31E
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 07:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iZmbI48o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m6tOy5xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=K1Rpq5/wXTgVCQHxqDKBYh6NHzLq7RyqqCslZNfcNG4=; b=iZmbI48o86WBMNB+rB4kiCjO6a
	yWHT+2oXz0bcOR0oJbV86QMTDJ6DppUwBWT6QaO7khd/YnMsO1TdeT1bS+NvjYnBebX1ng4QkaTQA
	5FllibXFacWqv8UryLxBCJJ+N0SN/bm7mYPJucwfC1wf7amIvYV89PIkzFkwIcOxA+HVe1WzsVlNR
	DvzUWJSqEJmDtYh79bmhCs70mY4zD9h2Lpb/UOVRt8UiBZafmAgtWqz4b/J14cD+neJZJo+/OmJG9
	oxu2boxdcZnvWmRSWtl/s6A8iEQ8OAPMbjIRPPP7OLbo0F4o3Fa7527oh86Td91okVbB+KMna1ZGa
	TDoKoI+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PE-0000000FieB-0yYY;
	Fri, 23 Oct 2026 07:09:36 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK9PB-0000000FicB-4Alk
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 07:09:35 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-353804b591eso1032606eec.0
        for <opensbi@lists.infradead.org>; Fri, 23 Oct 2026 00:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792739373; x=1793344173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m650qEDke7fN9bkL9qGLn7ZyaB7lmY58hRkKuVzF7M8=;
        b=m6tOy5xdBVVVuTw2y0oFjGoa20VAaWqE7qj1Ne2JIGg76bo62zPP/ip6CqUP2h1Ys5
         VNpIGTFu7lwKPNcptrBqt9ADLzdOElFRrMZ0at6XowV/36IA7IF+1pmko+4KOPczm6iA
         VKjEzVdtSMdPOMxgnsnX+SamJ7TFME9TWliwqVjussEq6mUv1xyN4JmUm+l/IJLyD8ua
         m5aIh+pkOlo7O0KqqOC16Ub9H8mQ12nbQh0lGonMqGxowMgC0xjxULCeisQ+yOFdAypO
         z6sXgZEJnB6Gt69llqu1XzX4SsAc5RMVoCZaOjUu3MSEY6v1PnbIP4QRrS3QE1gAct1H
         N1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792739373; x=1793344173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=m650qEDke7fN9bkL9qGLn7ZyaB7lmY58hRkKuVzF7M8=;
        b=rDEIjWUnQ81PBZE6cCNBOVAtsilyefBq3yKwVeiU9nfESdO3wxoJJByggShmKCXy8D
         K+bH6Lq7yokmJjcrSJ4Mc8aFs6Cx56tXwi+PmcuJCGmJrbNcBKhHyFUABiWDx/MO9Gdn
         atnTxsEUOPpn/awIQu3lPt2FBSvZWElV3aEYdmVG1jF3D0OFiqS/KvJO9B0WmL8q8AEr
         5S4YWoj9pquaZIKSSs0w9ALmCXeNoiNsZJUKjoDOd9ahg7AXzv93Stc/gzfwlfNRxnDd
         XsV5CGvVlJ+qypIZNzlA7+X+6mbCuoFrDWOTGYZXeFPPml21imiSgq8zRWlmVEELGua1
         FmEA==
X-Gm-Message-State: AFq9FYIvsiNUyuI9OBLty+BzyAecpkTYEcfgbkG+e/TPO44sVdcG3xom
	iA+GTrq3knbuBL3p41lhDRMN1UOdp7mJ2Yt7ujV6HQ/MJ4knXSfNqqIIqFesB9Jg
X-Gm-Gg: AYBFou1IhgR4J6i7uvQ8Gwxuyd3o7osruRE55orWXsfXYFjb3o+nqvSfYLGd5EX08iB
	VrpPkQb1oG61cK52lf3xXw7GEqrE/DWSJprGNhA42zn1WvNgTu6bA0MQx6jFUuQdq7gyQc+kMP7
	luRob2mjNRJ7N70XD7xC7DAun3fTxrauSaHWrBztju5OxvwX3bpmPzFbSvbpRhXhqgBsc5Q6ewH
	8FIMc5wPkMzZL7xlgrDwA+Ue94IF8pNAV8Ln45a03iyoD1orElz+wRqCyUNu+BbroBJf/xYqmrT
	Rpynz7oFuhgNesY1COkqPeh8Y0OnMqG3Z9F0a/7Gsh0n5bfGhpebOkA9zf+ZYChfQW5PPrPMrdN
	zdvGa8R25aMLdwYTV7WDn7kuo0YpwrsOZ3MzM9Z9U8VdmUtG5TiH/1dSd/SkfAPTL1/J+UegCXw
	tV+NpdwkMbTKdpeY2X1g6CbvFK1LdxaaFi6rgzbrPB6svBvfQ4xFZj6Q/cuUZrixVIlXvR5qLjM
	WyE6q7ZpNgxGeUN1+R6W1QoH/OCy3sSwptdC1c0kchX2nq3EdR/rr9wU4DZS76vY/fJo973tM6x
	KPVs11k6Lf3xc7M5O+Uwr678LDWAO7E8x0VbRGdBYvlvQGiyy9+F1dVZhg==
X-Received: by 2002:a05:693c:639a:20b0:368:ec6f:570e with SMTP id 5a478bee46e88-369d978657dmr1988260eec.29.1792739373136;
        Fri, 23 Oct 2026 00:09:33 -0700 (PDT)
Received: from aster-MS-7D31.tail5febd7.ts.net (209-147-138-26.nat.asu.edu. [209.147.138.26])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10da4sm3863206eec.26.2026.10.23.00.09.32
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:09:32 -0700 (PDT)
From: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
To: opensbi@lists.infradead.org
Subject: [RFC PATCH v2 2/8] lib: sbi: Preserve optional H-extension state across domain switches
Date: Fri, 23 Oct 2026 00:09:19 -0700
Message-ID: <20261023070925.241680-3-theodoruswensanfebruanto025@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
References: <20261023070925.241680-1-theodoruswensanfebruanto025@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_000934_045150_E4B7FBAC 
X-CRM114-Status: UNSURE (   8.87  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Preserve hypervisor interrupt enable state provided by Smaia and
hypervisor state-enable CSRs provided by Smstateen.

Use extension checks so systems without these CSRs are unaffected.
The 64-bit helper preserves the corresponding high-half CSRs on RV32.

Link: https://github.com/riscv-software-src/opensbi/issues/433
Signed-off-by: Theodorus Wensan Februanto <theodoruswensanfebruanto025@gmail.com>
---
 lib/sbi/sbi_domain_context.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/lib/sbi/sbi_domain_context.c b/lib/sbi/sbi_domain_context.c
index 4bafda5b..79419edc 100644
--- a/lib/sbi/sbi_domain_context.c
+++ b/lib/sbi/sbi_domain_context.c
@@ -32,6 +32,9 @@ struct hart_context_hext {
 	unsigned long htinst;
 	unsigned long hvip;
 	unsigned long hgatp;
+	/** Optional hypervisor state */
+	u64 hvien;
+	u64 hstateen[4];
 #if __riscv_xlen == 32
 	unsigned long hidelegh;
 	unsigned long hviph;
@@ -208,6 +211,19 @@ static int switch_to_next_domain_context(struct hart_context *ctx,
 			ctx->hext.hviph = csr_swap(CSR_HVIPH, dom_ctx->hext.hviph);
 		}
 #endif
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMAIA))
+			ctx->hext.hvien = csr_swap64(CSR_HVIEN, dom_ctx->hext.hvien);
+
+		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMSTATEEN)) {
+			ctx->hext.hstateen[0] = csr_swap64(CSR_HSTATEEN0,
+						dom_ctx->hext.hstateen[0]);
+			ctx->hext.hstateen[1] = csr_swap64(CSR_HSTATEEN1,
+						dom_ctx->hext.hstateen[1]);
+			ctx->hext.hstateen[2] = csr_swap64(CSR_HSTATEEN2,
+						dom_ctx->hext.hstateen[2]);
+			ctx->hext.hstateen[3] = csr_swap64(CSR_HSTATEEN3,
+						dom_ctx->hext.hstateen[3]);
+		}
 	}
 	if (sbi_hart_priv_version(scratch) >= SBI_HART_PRIV_VER_1_10)
 		ctx->scounteren = csr_swap(CSR_SCOUNTEREN, dom_ctx->scounteren);
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
