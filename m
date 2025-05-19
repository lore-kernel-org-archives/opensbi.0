Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E982C2D0CD
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YH+ZSlSesjoUoklxt6ZLGkaSjG0o29SgMJSUJycWjLY=; b=2k1Caqx4XLL/1D
	oFjnjjAILAZgf4hvxqnGRT9V8/RU775ALdaQ8Q38kMDxgqSzYPam9mGLhu08Ear3GV1sSnOqgHtwh
	eODEXu5taP3wEkuNoxtTWiPkUKrqEXTDsjgNKzRlEK6GPqqsvb9kRiRDg4qJ5zKOrkQ5sgFSQdbZk
	R7tXHQPP9sg7DceVzuJwFdwyXuTd7VKQcJZuw3ezE/6GhKBqItaTc6Ic8vpXf8c0ikFMYKkpk/m9Y
	wMP7aNWLKBsVibcpbN9akKUDelSljkBc0RV1Rtds9SII5ENFh9wiOiTYmd1PMxs9Bvvdun9z+2jPr
	JD/AKoagp5MCTM4IhxjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw2f-00000008NvK-0bFb;
	Mon, 19 May 2025 08:40:13 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw2c-00000008Nth-3Gao
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 08:40:11 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so44853045e9.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 01:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747644008; x=1748248808; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX6scCPvlo5WywEIe2WbF+gQkjc/ZBCgbv75mg3UVTI=;
        b=KtBYAJ+iXXtCIyJGTVSomyIX4UaAkuu49bdgZ8t3NQh08mSgqofins0pW3Uqj7GY1X
         Uk4k4cpPBEvbLiHPIAPGupfbEKtveSOEmnMlSQ23GmdzulkMY6H3NClA0AfmhAjImHO0
         6FIVYDNonW3hNNqL+gy+rl6cdGn0F6vih8UVHoRFS0QB5WnNPRk9FHB7Znr5Dbo2H30y
         PaeCOxWOU3JOIBMWA0fFgQ2vNPhUvG6BZwu3X5+Ry59Pf7/X0nycc30xbnEkagvMRbdc
         ZMdwjNqf2zx3FcT/LmYd3qpzD9lJg4fwibG8xp0wthEmRQMZqdGF1q9bfDNRwwlaHf+a
         fVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644008; x=1748248808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX6scCPvlo5WywEIe2WbF+gQkjc/ZBCgbv75mg3UVTI=;
        b=mD9EpLjE1QyAys0+1gosjxvAFuVQxIn9cTzZcg7ZRyIGEwprwqY68NZErQkLWdB4R5
         eGuoK50Pj9RlGHzmQnEs8OUtt/uJyQ7jCN5bl1x/rBAd8YUDZ/UW175QIwm6LWS/Vpjg
         5yt1+VbNIbTTmfHidw76F0ZF180lNyCyrAHMa0QPJizl9pXueoTxnGDfGx5LMZKqF6mw
         iR6e4iBmHq1fX2ZUXBazQSQARr/Pog4XdI7myxVS/6+ZEEyDGdNhXrGv8UpohmMkCSkH
         ptZTGQYAZDYM+0g5z3z55+sp66J8vSqX8ZXEm5Sw93dVacto8upJKCNb4QxAhVGO1u8a
         8aQQ==
X-Gm-Message-State: AOJu0YxAXxP/y5jhPs28OIIQx6WGFdhYUhlot4+zRcF7yvdqmxEyPmPW
	W2ndty1b6ZpkmQULo/DCkSi7kNj2KjxEiyPdR7PFaRNn70ID8yRa8L+ubAHQYhoH/gsgbdklT53
	2XLHlJ+Y=
X-Gm-Gg: ASbGncvE1YJdhOFKqHIvxgNzpCdMKyey9OnIk99l+qXYLGkt/6iKl4SUuoRut841BeP
	x31itChx9nHvW2u1a6VfnY4snawutFm8qRZkg2n/w3OTMly8D4hEyeiQsKECS0hToJcuoixew15
	SU2wX4cFU/O1KDCHMAnKmWBktuyxeb02Vo4o1llBPmaw09cQ7HqDLg4yPhnZGh8FltSLCutbItB
	uGo8szEFHDcjjleJJ3IWN0bEjXHjzl/P6ko7DKH8nmObIFlpZIf5WI9AvvuiCj6xWVYHOSo+bce
	kbZF6ezDKR/ZOnSeXAHDas5alrXW9YlTpSj7Zt37Tw0YVyglP4hW
X-Google-Smtp-Source: AGHT+IH4y1qDxUcKCOkLhKwWvuwi36dYtkngn9y2B2Z3+hoXcTSdO0p0XpbmaTw2g22ue+FRFBisTg==
X-Received: by 2002:a05:600c:154a:b0:442:d9f2:c753 with SMTP id 5b1f17b1804b1-442fd6647e7mr96358315e9.26.1747644008329;
        Mon, 19 May 2025 01:40:08 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef832sm202099905e9.40.2025.05.19.01.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:40:07 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 1/2] lib: sbi: pmu: Add SSE register/unregister() callbacks
Date: Mon, 19 May 2025 10:39:48 +0200
Message-ID: <20250519083950.739044-2-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519083950.739044-1-cleger@rivosinc.com>
References: <20250519083950.739044-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_014010_814124_45B7CF28 
X-CRM114-Status: GOOD (  10.78  )
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

QXMgc29vbiBhcyB0aGUgU1NFIGV2ZW50IGlzIHJlZ2lzdGVyZWQsIHRoZXJlIGlzIG5vIHJlYXNv
biBub3QgdG8KZGVsZWdhdGUgdGhlIGludGVycnVwdC4gU3BsaXQgdGhlIFBNVSBTU0UgZW5hYmxl
L2Rpc2FibGUoKQpjYWxsYmFja3MgYnkgbW92aW5nIE1JREVMRUcgc2V0dGluZyB0byByZWdpc3Rl
ci91bnJlZ2lzdGVyKCkuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckBy
aXZvc2luYy5jb20+Ci0tLQogbGliL3NiaS9zYmlfcG11LmMgfCAyNCArKysrKysrKysrKysrKysr
KystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKaW5k
ZXggNTk4M2E3ODQuLmRlZTUwYjliIDEwMDY0NAotLS0gYS9saWIvc2JpL3NiaV9wbXUuYworKysg
Yi9saWIvc2JpL3NiaV9wbXUuYwpAQCAtMTA5NywyNCArMTA5NywxOCBAQCB2b2lkIHNiaV9wbXVf
ZXhpdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCiAKIHN0YXRpYyB2b2lkIHBtdV9zc2Vf
ZW5hYmxlKHVpbnQzMl90IGV2ZW50X2lkKQogewotCXN0cnVjdCBzYmlfcG11X2hhcnRfc3RhdGUg
KnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKIAl1bnNpZ25lZCBsb25nIGlycV9tYXNr
ID0gc2JpX3BtdV9pcnFfbWFzaygpOwogCi0JcGhzLT5zc2VfZW5hYmxlZCA9IHRydWU7Ci0JY3Ny
X2NsZWFyKENTUl9NSURFTEVHLCBpcnFfbWFzayk7CiAJY3NyX2NsZWFyKENTUl9NSVAsIGlycV9t
YXNrKTsKIAljc3Jfc2V0KENTUl9NSUUsIGlycV9tYXNrKTsKIH0KIAogc3RhdGljIHZvaWQgcG11
X3NzZV9kaXNhYmxlKHVpbnQzMl90IGV2ZW50X2lkKQogewotCXN0cnVjdCBzYmlfcG11X2hhcnRf
c3RhdGUgKnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKIAl1bnNpZ25lZCBsb25nIGly
cV9tYXNrID0gc2JpX3BtdV9pcnFfbWFzaygpOwogCiAJY3NyX2NsZWFyKENTUl9NSUUsIGlycV9t
YXNrKTsKIAljc3JfY2xlYXIoQ1NSX01JUCwgaXJxX21hc2spOwotCWNzcl9zZXQoQ1NSX01JREVM
RUcsIGlycV9tYXNrKTsKLQlwaHMtPnNzZV9lbmFibGVkID0gZmFsc2U7CiB9CiAKIHN0YXRpYyB2
b2lkIHBtdV9zc2VfY29tcGxldGUodWludDMyX3QgZXZlbnRfaWQpCkBAIC0xMTIyLDcgKzExMTYs
MjUgQEAgc3RhdGljIHZvaWQgcG11X3NzZV9jb21wbGV0ZSh1aW50MzJfdCBldmVudF9pZCkKIAlj
c3Jfc2V0KENTUl9NSUUsIHNiaV9wbXVfaXJxX21hc2soKSk7CiB9CiAKK3N0YXRpYyB2b2lkIHBt
dV9zc2VfcmVnaXN0ZXIodWludDMyX3QgZXZlbnRfaWQpCit7CisJc3RydWN0IHNiaV9wbXVfaGFy
dF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRlX3B0cigpOworCisJcGhzLT5zc2VfZW5h
YmxlZCA9IHRydWU7CisJY3NyX2NsZWFyKENTUl9NSURFTEVHLCBzYmlfcG11X2lycV9tYXNrKCkp
OworfQorCitzdGF0aWMgdm9pZCBwbXVfc3NlX3VucmVnaXN0ZXIodWludDMyX3QgZXZlbnRfaWQp
Cit7CisJc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzID0gcG11X3RoaXNoYXJ0X3N0YXRl
X3B0cigpOworCisJcGhzLT5zc2VfZW5hYmxlZCA9IGZhbHNlOworCWNzcl9zZXQoQ1NSX01JREVM
RUcsIHNiaV9wbXVfaXJxX21hc2soKSk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgc2JpX3Nz
ZV9jYl9vcHMgcG11X3NzZV9jYl9vcHMgPSB7CisJLnJlZ2lzdGVyX2NiID0gcG11X3NzZV9yZWdp
c3RlciwKKwkudW5yZWdpc3Rlcl9jYiA9IHBtdV9zc2VfdW5yZWdpc3RlciwKIAkuZW5hYmxlX2Ni
ID0gcG11X3NzZV9lbmFibGUsCiAJLmRpc2FibGVfY2IgPSBwbXVfc3NlX2Rpc2FibGUsCiAJLmNv
bXBsZXRlX2NiID0gcG11X3NzZV9jb21wbGV0ZSwKLS0gCjIuNDkuMAoKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
