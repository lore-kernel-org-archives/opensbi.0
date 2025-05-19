Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E46AC3DA6D
	for <opensbi@archiver.kernel.org>; Mon, 19 May 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nior+r9+nmszQrJJhrijKBgTtZkKsG/24Zn4z2H28Hw=; b=Zplf2kVVhCAHGU
	ecWrs7PySCq0DvLgNBTdlXTjmxl/vux4s2Wm/fAx1pH5+cqkhDyMKL8k2Utw3gPxNYmjwjSQ/yVXY
	d2kirQd/v5w3xecY5LRAEd7PgjedlkakmkxLUvxFOUsBaLCaXAeyxgkNSvj9gNMGeCQNu+gfuwprf
	f1xBKEV+kE5GrWF0TdtoKH58MsfQCXuLbtrc4Ladz/N4xxLFQHYdA3comUC0X4SpxB5Kg43PDT++h
	1HOSj3cpAZTOmMAejL0rsdAMmHytnou5a3w0saaTBuHxGJ1n0eEcHX9AgxZ17egfVhgE08LHB0zB9
	s6ug56DQkCSaXvwxvbKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw2g-00000008Nw8-2UuD;
	Mon, 19 May 2025 08:40:14 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGw2d-00000008Ntp-3TUY
	for opensbi@lists.infradead.org;
	Mon, 19 May 2025 08:40:12 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so42708125e9.1
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 01:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747644010; x=1748248810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WSBDjjHFLYGqS1W4J9HpZQ4qyY2CicXGZ4HNNXu8zAA=;
        b=I1dh0Z7xPaYqjFKVKpHuQNPxLwKjhI3QJfscE+1JLIL/og+sgiDHJndNeZdttBnWLl
         rnDoCwHhD/x4Yw5lJ6GvnXoQeiCxboQoDqcwCXA7BrzPtb/ne8cdaDk3xoQyoeGLHp+g
         oCNh8E8UVAd1TtBSS86MYP+X0wxkfIevDJE2PGnPLsqQwHjiex1k+dRKO41YiWxwppQS
         fMtcXpEpXtDM+MkQrq8t5Is9LdIbiWAdV55WZn39fiPWK89M87WIas4p3CoL8vzmcVSA
         MpH6K2GcjPr2OG6UkUShR+Jth1/8WyBBNTreP85mQV0ZUIuOP5HQACbMkTGmpErEe0Vi
         UTJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747644010; x=1748248810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WSBDjjHFLYGqS1W4J9HpZQ4qyY2CicXGZ4HNNXu8zAA=;
        b=JbgfU6JE+KvSrP8kG2f1MdO9H3qkkdOvRRRyLAGvqFf5sRwIOIEYuOvNUkByioHUPJ
         FdHnNW05a0PsUQbQptioF1lwFSzGPW9A4fatPcfDRNH4yE2vDKQ3P862LIJYDm2z83d7
         3KRcp9E+GVST0xWcOqpA5kFrfV/OR+p4MdM/hWdbrM7GYOY5bkExRCNAR3WB0ssyXRme
         w8dhmqJ4yy8eic5vtPmGszzpoVh3zJr0e19PfZvR5yKOSpCy/hmYP/BCG9uqaE8I5g0R
         RzdivpurNp0hlvE1OsEvcBqH2YAZm6qa5duru/XbLTWlo8VNaQ6hs34x2/k/BHbIH6pH
         RSJA==
X-Gm-Message-State: AOJu0Yw5DUqWjOolEV/WslQVjC9ya6zV48V7mnjd1ofnBZKvmY1F36jo
	NM5R03HPdQT5oQzhUGceD3oZQNVugTTtwgMjRuTXUY2E//KVLfV0k2zZiFZTF0dXIcRU6xOTZlr
	jHZsHNbA=
X-Gm-Gg: ASbGncvcj3vSMONu7d3hQhL/0N9UxQtzFK50vIqqgLDBpWvVMPx2TqMct7zCJhn0PR4
	u8V7PHhvD26vhFCwVDJUzMUatEJN0zqSqmT6FC/KBdVKmq+frPsaFGa3wQlOb5rkuSlmclqc2r/
	55WSI/aUS6tPknVK5jrrlN5uqUtjm1NRI4Vh9o1gJSiAt9LtUaKu9HQ/omYfsa1SMLi9oE6Mi16
	NOay2Z5KTs2/Wdv04Vg+uVpvVJvmQ+qQ27pMZ3dXxka+dUDKb+oCtHAHZHj04gW8WHSpwKg/yPf
	7yB8vdDQYYnR/Se3A8ZSFKke3r0ZlTdWg9v909ypzM26JYjHXCjE
X-Google-Smtp-Source: AGHT+IGipGJi6jiWUbu7t88XnHkjk7Fn9qBa4yMBN2NN5CghrYqby08he1Ktr1ADnJtlq/zHch0Nzw==
X-Received: by 2002:a05:600c:c0c3:10b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-442fd671800mr79115715e9.31.1747644009811;
        Mon, 19 May 2025 01:40:09 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f39ef832sm202099905e9.40.2025.05.19.01.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:40:08 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 2/2] lib: sbi: pmu: Remove MIP clearing from pmu_sse_enable()
Date: Mon, 19 May 2025 10:39:49 +0200
Message-ID: <20250519083950.739044-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250519083950.739044-1-cleger@rivosinc.com>
References: <20250519083950.739044-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_014011_865839_31614514 
X-CRM114-Status: UNSURE (   9.34  )
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

Q2xlYXJpbmcgTUlQIGF0IHRoYXQgcG9pbnQgbWVhbnMgdGhhdCB3ZSBjYW4gcHJvYmFibHkgbG9z
ZSBhIHBlbmRpbmcKaW50ZXJydXB0LiBUaGlzIHNob3VsZCBub3QgaGFwcGVuLCByZW1vdmUgTUlQ
IGNsZWFyaW5nIGZyb20gdGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNs
ZWdlckByaXZvc2luYy5jb20+Ci0tLQogbGliL3NiaS9zYmlfcG11LmMgfCAxIC0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMgYi9s
aWIvc2JpL3NiaV9wbXUuYwppbmRleCBkZWU1MGI5Yi4uNTA0NzZkN2EgMTAwNjQ0Ci0tLSBhL2xp
Yi9zYmkvc2JpX3BtdS5jCisrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCkBAIC0xMDk5LDcgKzEwOTks
NiBAQCBzdGF0aWMgdm9pZCBwbXVfc3NlX2VuYWJsZSh1aW50MzJfdCBldmVudF9pZCkKIHsKIAl1
bnNpZ25lZCBsb25nIGlycV9tYXNrID0gc2JpX3BtdV9pcnFfbWFzaygpOwogCi0JY3NyX2NsZWFy
KENTUl9NSVAsIGlycV9tYXNrKTsKIAljc3Jfc2V0KENTUl9NSUUsIGlycV9tYXNrKTsKIH0KIAot
LSAKMi40OS4wCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
