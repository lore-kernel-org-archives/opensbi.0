Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F2CC369BC
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gMKsQnt1MDEoqVfwO3NsFgYM8PKaLwzlqC5Wo1qkZYc=; b=YLqBPys2hdIFoq
	Y7pccvLwHEFpfra/S2zt6juB7K0MkGJREZapZLA85u1pIMfQF9fcohCSqfPfWTcDJj+289nSXnOUM
	H9BXbrb5iMyFR9MFLz8NCrqgoTxPI/P4Hct2sXHtsKCERQPk4ztXMh1r+HRIotgafGOO2QNnjwrHi
	u+WrmemWcE4S1ukGC2C7HX5r5hcMGZjUpIty72+Le+1q0VXMmZi0i+vEJffNcP2BS5wDfB8c5Y5jp
	UHfhmHfifYyYSfdXsJAp8lvtbu3F9KzjRc22mHEVlOFTHIk0DNC8gIN/jnI010VqLhntwfkCNCIGs
	zXgiuU3TEcP0POM69Efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVO-000000067up-2WVj;
	Tue, 15 Apr 2025 14:43:18 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCw-00000005t8q-3Hti
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:12 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so7451905e9.3
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723209; x=1745328009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NUrIa+iE+jNxmudLfkM6b5COKvoBllEMMWm5W1kkqw=;
        b=bjhoNBWxSg/DjQHdUc/gPlwb+3DCLtObggea5X/2j6Jc73eyP6BTjo767URMpBd9vW
         Gctv/VF+Y6oFViM5kCEiYlm94TPwjxJkaLSTkClONxw25JZJ5X86Ljr2g+K/CA6W6HF7
         F4IIbaAw4xeJ+Xvo4RCn2hYFxRrsjyNY3HhFDnQBcfjrT7T147mfEwqjzRY5igQSX/wq
         CrJdVa99DPmeUvQRFHfvBzS1K40YjOtxNvI2EzkaC4RWJYcGo/qaJHFcBObYUq/ior0b
         thpI0N9X/ZaWt+TcUrXrsWLPflBFH7KHdASlKd4z0vE6lPuQYBmrh8Dm1nn2MBzSxMtD
         3dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723209; x=1745328009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1NUrIa+iE+jNxmudLfkM6b5COKvoBllEMMWm5W1kkqw=;
        b=L9waVyQGoCKtTL8QVIT5a3mYa43gcOUqnRbcYgeAxsy0dneT4WPo7l4A1Soo+T5kkm
         HeH5//PKBJ2YLz+67ukVtdMqtAxtAGCliPhcH9mJS3E33UVvDJ/oR3T4QrfRS9sTWwfU
         uaVKvo9gB+VB4nMuItLBLFDqhrGNSNq1DTq4jUyo6HMCLmns+/XvC3LELyt3Ux5smMAV
         x+01XCQKGWpOm7rwPePhfFxEo6V2XA6cUxHOomsMjB4jTEHVU/M/9mUTpSoKQ51/TT0d
         x3Ddw6kYkS218My213OAhX5vQ/2Ko/nIBrlbyl5p3BYz78v5AnBQYHqXzyFI4EhnwQIz
         s5dQ==
X-Gm-Message-State: AOJu0YxUWi6SAhkqaeIHstOw72n1FJp6zZmz6c+nP3FsYjAp5hyV4ZAd
	/HQci0JXBsUwOnSMWiaV7QhAs+uBmPHA9xRwfW6Q4O2cs26U+VB3gU8+YAFwldY0WQDQNK4ajGg
	9zXo=
X-Gm-Gg: ASbGncv2nx01lVaDgMbiuBqntCiKim/RzEALK1Hffs5C/zrW2vCtihar9616xT56ObF
	hZwIaW7qz0WFMpsPlDLexwgeKSkQdhCpWhIKeN6LpP1ZG5RTCRhajRdRMPioHIWXM+ugYkFCX0C
	7s/BaBUsmn2F4hhnPW/t5jjqbDVQpjvxLe1GW1v0v3cgkIq9F3fiaTmX/dVb2GDZTGE10/C6LqV
	zKSxd2WlOo/+UBeb0Ur26ltlt1s6LazgZCDfT32+2KPmaOQmiSZvX1z/qoaYFs3BT7sfzwEZKn9
	PmBPOA4es3aZIFnn8Wngjz4KX0B5Milwq9mm9MzI3jpulwQN
X-Google-Smtp-Source: AGHT+IGGOyCz6EmwttGGr5HSt6sG3ZmVDpZpHI0cpCphH0QpYX5e+MqKqUf9kx4L6booz6ZwZbZBBw==
X-Received: by 2002:a05:600c:1c0a:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-43f86ddc50dmr10232805e9.0.1744723208530;
        Tue, 15 Apr 2025 06:20:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae963f4asm14327298f8f.16.2025.04.15.06.20.07
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:08 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 5/8] lib: sbi_hart: fix sstateen emulation
Date: Tue, 15 Apr 2025 15:19:06 +0200
Message-ID: <20250415131908.2699782-7-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062010_817745_598E52C8 
X-CRM114-Status: UNSURE (   8.47  )
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

VGhlIFNzdGF0ZWVuIGV4dGVuc2lvbiBkZWZpbmVzIDQgc3N0YXRlZW4gcmVnaXN0ZXJzLCBidXQg
U0JJIGN1cnJlbnRseQpjb25maWd1cmVzIHRoZSBleGVjdXRpb24gZW52aXJvbm1lbnQgdG8gdGhy
b3cgaWxsZWdhbCBpbnN0cnVjdGlvbgpleGNlcHRpb24gd2hlbiBhY2Nlc3Npbmcgc3N0YXRlZW4x
LTMuCgpTQkkgc2hvdWxkIGltcGxlbWVudCBhbGwgc3N0YXRlZW4gcmVnaXN0ZXJzLCBzbyBkZWxl
Z2F0ZSB0aGUKaW1wbGVtZW50YXRpb24gdG8gaGFyZHdhcmUgYnkgc2V0dGluZyB0aGUgU0UgYml0
LgoKU2lnbmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5j
b20+Ci0tLQogbGliL3NiaS9zYmlfaGFydC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3Ni
aV9oYXJ0LmMKaW5kZXggYzI4MGMwYjNlODVlLi5iMjA5ZjFjYWIyN2QgMTAwNjQ0Ci0tLSBhL2xp
Yi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAgLTExMSw2ICsxMTEs
OSBAQCBzdGF0aWMgdm9pZCBtc3RhdHVzX2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNo
KQogCQkJbXN0YXRlZW5fdmFsICY9IH5TTVNUQVRFRU4wX0NUUjsKIAogCQljc3Jfd3JpdGU2NChD
U1JfTVNUQVRFRU4wLCBtc3RhdGVlbl92YWwpOworCQljc3Jfd3JpdGU2NChDU1JfTVNUQVRFRU4x
LCBTTVNUQVRFRU5fU1RBVEVOKTsKKwkJY3NyX3dyaXRlNjQoQ1NSX01TVEFURUVOMiwgU01TVEFU
RUVOX1NUQVRFTik7CisJCWNzcl93cml0ZTY0KENTUl9NU1RBVEVFTjMsIFNNU1RBVEVFTl9TVEFU
RU4pOwogCiAJCWlmIChtaXNhX2V4dGVuc2lvbignUycpKQogCQkJY3NyX3dyaXRlKENTUl9TU1RB
VEVFTjAsIDApOwotLSAKMi40OC4xCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
