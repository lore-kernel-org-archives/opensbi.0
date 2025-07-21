Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30275C83F25
	for <opensbi@archiver.kernel.org>; Mon, 21 Jul 2025 17:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=96ATBemlo1sbFgwH6u5b1pnW/NWsJeUZc6fwvleHVFw=; b=v92sNsXfB7wb0b
	fGMP5xla0wh+leQRX2ErRGRpoGjL4ByBHQutrunVrPvhRYQTvrbgjG4vx4ceALIGt6FPLpcI44YL8
	28Tny+zUs4tBfwMJcCHdIgeQ/2pDietP/BCq+F3ylA15LojTNAqvPYI68Q+F8RIkOdgAR4Tfu3e1w
	M3nyrZ6HYgLfYPosj54t0TP+chdJzxFGSJcsjR5je5EO4ECkc7IcO47v5OGGYdXK5DuYeDKxlM0cF
	ybKg06PwK1iCes7ZPYgx3mUTi62EnHvBopb+HJYqHxN7Jnfb53DKyewc7cvdnBcDky4KAAymuEdkF
	hiGly9Yu34qqT/HCyr8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udttL-00000000GiX-0YBj;
	Mon, 21 Jul 2025 17:01:31 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udt37-000000009J0-3Nvj
	for opensbi@lists.infradead.org;
	Mon, 21 Jul 2025 16:07:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-456382f1a56so1724925e9.1
        for <opensbi@lists.infradead.org>; Mon, 21 Jul 2025 09:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753114052; x=1753718852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeTGqHbVC3NFoeU/jsOhqi5L7OrbQ58GDZtg/NoO7QA=;
        b=jCQDNV8IJbk6DYV+sQut5uf5bL2d5toioDICM6fb+qrLgi88CVBlGph12HmJUZnSXW
         unof1HAenA79n+aJO3s801XM4qox12wGjJIQaWknCpvB5dhSaJFjp43a6WiwYQAebnj6
         hOZNIlubjd4SFBrAW/nuzA2qYBi2LAaHeBtCJDpW3xaayUhNdXG5q6NQoe4lbSqfuNgp
         OtRmVNB951Mywi2oJFh7/3DNHcEgwFWRC51E/kTf5JHamiGSs2nyzkTwK71wnYzzx3+G
         RPBxdywpehaMaQpE9zX5P10MtV9dGq7fcgALDScjhxNukB0iexyVKd5lHr0LtQSHAMU/
         B1MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753114052; x=1753718852;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeTGqHbVC3NFoeU/jsOhqi5L7OrbQ58GDZtg/NoO7QA=;
        b=A7akFgerg/xDUUWDpj9XSLItB1gvZw3KGITJgD4+x4245NboBaOqOHsfu6f6+Px5Is
         zA5OwdNJjZQgjGDF9ZeooCKhUQG/z3Coz9nMTL8xwDKK/oz7o8yKwfD43PNbPG54vDAT
         fwKz+wI0u4Jan/w7B9kcljf4c/WFnPb2btJ8TVswlzEP0ZtCyvpWWvZyNNym+AEOfjV1
         rypSstewHDTITGeVO4Tk5cHP6b2M3nrOzwRVza/p7SMu5khINlWpIKJ35Bm3dnAle2Zo
         3DuWLJl3bzRRVQgOOA5zFBRW/E2TkteeFtwfrGa5vTzntjuc2TTarKeaeXfC2KM21Q4O
         pTpg==
X-Gm-Message-State: AOJu0YzoLKNDtJW4m1WeWE+dF03zghQV0gvkV9zm4kIJwI6k2S4HL0u+
	k8TSXf6ezVj0ruySE9avyjD3mvvvgjabRvI5qvBL+UKEVlq5nGoDBH2AM5y8Lg==
X-Gm-Gg: ASbGncth5sqZ4KfUe7X3i/46kOkIyJiMYBzXUPLQmZjPvwx9e8UQ0vq+jiQsSetJF68
	LHsorIvenTcAkVgR50sU1mxSD+uWvjfik81liEnnkkGO0wXzAAWUkzE+LpMuygEEjU5T/HnEwp+
	9t0mt6xrxBq7BPfLYKdlemug06P8a8grdGCVyrHY0iFIvUvqjwPqYxdxFUCxm5q978VD2CHyXNw
	8j9mghIYPMEyDC9Rhdd5qr8FHUIEHlZu5MiXEPW0n5PRvEm0JyQVfhm0P2CWwFhKWMUe4bTHe1q
	pCtxpH3e+rAQpECQsS1pytxFXZo5Pw8Q3o/8yf2nzZpdaTOpW1Y2sXCizkDCPilfI/syVysh7Ip
	KVD1KsSQN+qKyq6z1LxIEuco78ljNo4hzURmYVG5f+0erUmfrRukYYhhBxeie+gpfj7PjDbFNQU
	+t/ZLVuWoIYY/QyCkC/8Kvmg==
X-Google-Smtp-Source: AGHT+IGVAEgLGpT0vQlqFU1TPx3acI/sPcgMpr2Gx8AZpUvYQiOFw0GVo2iwtw6tyAYjFDb5ggQ6HQ==
X-Received: by 2002:adf:b601:0:b0:3a4:eb46:7258 with SMTP id ffacd0b85a97d-3b60dd892c5mr5655918f8f.15.1753114051734;
        Mon, 21 Jul 2025 09:07:31 -0700 (PDT)
Received: from LT-5CD4135M7L.localdomain (215.red-83-41-148.dynamicip.rima-tde.net. [83.41.148.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48991sm10830644f8f.44.2025.07.21.09.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:07:31 -0700 (PDT)
From: =?UTF-8?q?Manuel=20Hern=C3=A1ndez=20M=C3=A9ndez?= <maherme.dev@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Manuel=20Hern=C3=A1ndez=20M=C3=A9ndez?= <maherme.dev@gmail.com>
Subject: [PATCH] lib: sbi: pmu: Improve loop in pmu_ctr_find_hw
Date: Mon, 21 Jul 2025 18:07:12 +0200
Message-Id: <20250721160712.8766-1-maherme.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_090733_847305_0B9A7D41 
X-CRM114-Status: UNSURE (   8.93  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

V2UgZG8gbm90IG5lZWQgdG8gaXRlcmF0ZSBvdmVyIGFsbCB2YWx1ZXMgaW4gdGhlIGxvb3AsCndl
IGNhbiBicmVhayB0aGUgbG9vcCB3aGVuIHdlIGZvdW5kIGEgdmFsaWQgY291bnRlcgp0aGF0IGlz
IG5vdCBzdGFydGVkIHlldC4KClNpZ25lZC1vZmYtYnk6IE1hbnVlbCBIZXJuw6FuZGV6IE3DqW5k
ZXogPG1haGVybWUuZGV2QGdtYWlsLmNvbT4KLS0tCiBsaWIvc2JpL3NiaV9wbXUuYyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
cG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwppbmRleCAwN2E1YzU0NC4uNjM1Y2IwYzcgMTAwNjQ0
Ci0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCisrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCkBAIC03ODAs
NiArNzgwLDcgQEAgc3RhdGljIGludCBwbXVfY3RyX2ZpbmRfaHcoc3RydWN0IHNiaV9wbXVfaGFy
dF9zdGF0ZSAqcGhzLAogCQkJCWNvbnRpbnVlOwogCQkJLyogV2UgZm91bmQgYSB2YWxpZCBjb3Vu
dGVyIHRoYXQgaXMgbm90IHN0YXJ0ZWQgeWV0ICovCiAJCQljdHJfaWR4ID0gY2Jhc2U7CisJCQli
cmVhazsKIAkJfQogCX0KIAotLSAKMi4zNC4xCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5zYmkK
