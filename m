Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9D9C369AB
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CcbGYmhUwx/egx/Yy1oLqgNHJapqU4OtPU6fxcWlnUk=; b=T+bOvVjoRde78p
	Bicm7/Eidmo2guG01xLiW4dCjejR1MQ5VJtFoOXS1U1VqA8cdZB+6Zg7hG9q2KFCVam4AE3eOZQ1p
	WaZni+K7uCz9SoEZ4meAp//WlYvFTtabWwWtkHdGdyO5Dvd7XMT6osBbvtMJcUisUufbIHeN9I8gi
	3krxbRZn3sbV8uRZFknnMT9eKM6tGNhlktF06IYucngIj362IJzBwWpdx/hojXy5oRFD3kHZuIxLF
	CPopMffhgbhjKmmtIWekxuiNAT8ot1Ov1xJjMtybEf0GZE3Trij+LhYxcxPOA2MDs/Ea7KSer5XLA
	0HDwjxdFJY4kStXd7KJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVQ-000000067vx-06g5;
	Tue, 15 Apr 2025 14:43:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCz-00000005tA0-2Bea
	for opensbi@bombadil.infradead.org;
	Tue, 15 Apr 2025 13:20:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=nqgYIG3mwFEirT8SR8iargVZ24luNm/496umeWBZlfE=; b=hGJTEMO6cbGdIROdKqjXP+iCqU
	JVNBuMjZxqmI9LvSKdIj+rI9bOimwoPI3INSvjCL3iTijMbXKHeYIrjM5tVI+CQRWHhyKMstBpeIL
	XN+7uosRB+U+8N+vQBNIE1f30timcm8jKCP7ZM4et1dIxEK6CkBa1RZUi//qp2MZJl3WECPD4enKx
	BHrj9b39oQydsnWYwAhBEAJFypMZCYM0w9J4LFiq+KzCxfKCzqyKY5+tPmZh7TPo2hHNBPNabGkf3
	U90qU0+epPleDD7e5Fhskt9c/BZQCwS0mJCFrmkyYip88vhOdO1JBTN4z84tRhk/fJGe1ZD/t5LnH
	WBxpkAcQ==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4gCw-00000009tL7-1Ck3
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:12 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf861f936so9073515e9.3
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723205; x=1745328005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nqgYIG3mwFEirT8SR8iargVZ24luNm/496umeWBZlfE=;
        b=At/cyxL3+ic6YDc/UscYYP0KqrOSzgRBFXRQNviB8IzYERHSx3Z6/iOz7eOKRzD5SD
         jLive9ryHSS20pkFX0HZWoQr64c1pU7KkktGbZj34qIfDYMpzg8iM2/kYTnKK24vYqpR
         hZotmP3uOS1XeKu+FnPTxsE0lkz7c659qjWa9LsEtUCBAk0aerDSB2SMDSz8s4zk4aIE
         Tx9JbpaRZelsBxarAyveyNi/3vWsnAIKmGKwPvnM+b7T5OJmlXKU39ffbWcfO2QpynVx
         Ceb8BJfzkETd1UA3PgyShcZ6M6JfOoW+bZRw+woV6BkRL2hBoCwEYkDQShOb/+E1R4wy
         RlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723205; x=1745328005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqgYIG3mwFEirT8SR8iargVZ24luNm/496umeWBZlfE=;
        b=R91LNzmlEMQXzw0dB18IemQp4oLLFvRUdAIhvwuzVZVCpJ4329DqJmF70wiCwTSpBw
         umXcUs/P45eMpDHIJJHqdGoTciYna++po+qHheclWH0hLRWt5oVNVPAjbgj/CycdXog5
         P6ubHRi7cr5l3zA413eKK6PWt267acQEp46SyIhtFB0SFXK0DeNPicpEzWe+VwL/kWnr
         8J5zMK2SFoxwBzENJ7lleA1OpUltB7yP41MXX7i1mjfxYNbETolEp3VBSaWGlpTNY51R
         7w82zZt/087hlKTcQxzfm1tX0qJBNZqtKBz1dz5YLOZQUsQq5PfpbR4aINHBs5RFFo/t
         kN+g==
X-Gm-Message-State: AOJu0Yx3vJZgpq/QJVBF4pPlCvMeXVT9IRlmQL/iqfFfS+Pm3kGGDW8N
	1XNUSGv9tSCIRcuGb5XoPnwDWwsvgb29eJop+FrQIRcI5ECnctt60KuWOlLljC0HUgUgl0pDO0E
	hi+0=
X-Gm-Gg: ASbGnct54fjpSaB4glmMFb4NWNu1gBEHQSxW3HA072tDsv82fa/39T3fG3NFYBpLd66
	tr2yEf/QIaljeYDtYaeXNHLVGBGvY7IPOXTsvBP1JikYJxPJuk7CHpQnEQKpmIQ2StngqNJcWmb
	ecMiSwqx/e7cGVHKEsn1RvUyKcJV08m+G00iBaHuoerDzjZ5tUWoiavXGzsnrrLDWbV1D+uTjES
	INpAbRo3gt6slR7Y8E3sn54pzdFY/orNnqSjohyhqt3+T90YpuImew46PtIPZ1PQy2mQ4QV0ahz
	iXEtakrH+8yrjc4mG/vP03421vC+Ok7LoWl7Qt877xuuEGHh
X-Google-Smtp-Source: AGHT+IElLYQych+pD9e+/jXJU1iQJRlOTqAhTSGVNwP6Idv4nQlkdHceytrPkQzBm9IJuWoZzysyrg==
X-Received: by 2002:a05:6000:4589:b0:39e:cbca:7fe7 with SMTP id ffacd0b85a97d-39ecbca802dmr3242927f8f.6.1744723205578;
        Tue, 15 Apr 2025 06:20:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf4457a6sm14378463f8f.98.2025.04.15.06.20.04
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:05 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 2/8] lib: sbi: use 64 bit csr macros
Date: Tue, 15 Apr 2025 15:19:03 +0200
Message-ID: <20250415131908.2699782-4-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_142010_490839_2C12C1E1 
X-CRM114-Status: UNSURE (   9.86  )
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

U3dpdGNoIHRoZSBtb3N0IG9idmlvdXMgY2FzZXMgdG8gbmV3IG1hY3Jvcy4KClNpZ25lZC1vZmYt
Ynk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgotLS0KIGxpYi9z
Ymkvc2JpX2hhcnQuYyAgfCAyMCArKysrLS0tLS0tLS0tLS0tLS0tLQogbGliL3NiaS9zYmlfdGlt
ZXIuYyB8ICA3ICstLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3Ni
aV9oYXJ0LmMKaW5kZXggYzM0MzgwNWM1N2NiLi4yZDllZTYwZmQzNmMgMTAwNjQ0Ci0tLSBhL2xp
Yi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAgLTg2LDEwICs4Niw3
IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gp
CiAJfQogCiAJaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhU
X1NNU1RBVEVFTikpIHsKLQkJbXN0YXRlZW5fdmFsID0gY3NyX3JlYWQoQ1NSX01TVEFURUVOMCk7
Ci0jaWYgX19yaXNjdl94bGVuID09IDMyCi0JCW1zdGF0ZWVuX3ZhbCB8PSAoKHVpbnQ2NF90KWNz
cl9yZWFkKENTUl9NU1RBVEVFTjBIKSkgPDwgMzI7Ci0jZW5kaWYKKwkJbXN0YXRlZW5fdmFsID0g
Y3NyX3JlYWQ2NChDU1JfTVNUQVRFRU4wKTsKIAkJbXN0YXRlZW5fdmFsIHw9IFNNU1RBVEVFTl9T
VEFURU47CiAJCW1zdGF0ZWVuX3ZhbCB8PSBTTVNUQVRFRU4wX0NPTlRFWFQ7CiAJCW1zdGF0ZWVu
X3ZhbCB8PSBTTVNUQVRFRU4wX0hTRU5WQ0ZHOwpAQCAtMTEwLDE3ICsxMDcsMTEgQEAgc3RhdGlj
IHZvaWQgbXN0YXR1c19pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKIAkJZWxzZQog
CQkJbXN0YXRlZW5fdmFsICY9IH5TTVNUQVRFRU4wX0NUUjsKIAotCQljc3Jfd3JpdGUoQ1NSX01T
VEFURUVOMCwgbXN0YXRlZW5fdmFsKTsKLSNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKLQkJY3NyX3dy
aXRlKENTUl9NU1RBVEVFTjBILCBtc3RhdGVlbl92YWwgPj4gMzIpOwotI2VuZGlmCisJCWNzcl93
cml0ZTY0KENTUl9NU1RBVEVFTjAsIG1zdGF0ZWVuX3ZhbCk7CiAJfQogCiAJaWYgKHNiaV9oYXJ0
X3ByaXZfdmVyc2lvbihzY3JhdGNoKSA+PSBTQklfSEFSVF9QUklWX1ZFUl8xXzEyKSB7Ci0JCW1l
bnZjZmdfdmFsID0gY3NyX3JlYWQoQ1NSX01FTlZDRkcpOwotI2lmIF9fcmlzY3ZfeGxlbiA9PSAz
MgotCQltZW52Y2ZnX3ZhbCB8PSAoKHVpbnQ2NF90KWNzcl9yZWFkKENTUl9NRU5WQ0ZHSCkpIDw8
IDMyOwotI2VuZGlmCisJCW1lbnZjZmdfdmFsID0gY3NyX3JlYWQ2NChDU1JfTUVOVkNGRyk7CiAK
IAkJLyogRGlzYWJsZSBkb3VibGUgdHJhcCBieSBkZWZhdWx0ICovCiAJCW1lbnZjZmdfdmFsICY9
IH5FTlZDRkdfRFRFOwpAQCAtMTU2LDEwICsxNDcsNyBAQCBzdGF0aWMgdm9pZCBtc3RhdHVzX2lu
aXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQogCQlpZiAoc2JpX2hhcnRfaGFzX2V4dGVu
c2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU1ZBREUpKQogCQkJbWVudmNmZ192YWwgJj0gfkVO
VkNGR19BRFVFOwogCi0JCWNzcl93cml0ZShDU1JfTUVOVkNGRywgbWVudmNmZ192YWwpOwotI2lm
IF9fcmlzY3ZfeGxlbiA9PSAzMgotCQljc3Jfd3JpdGUoQ1NSX01FTlZDRkdILCBtZW52Y2ZnX3Zh
bCA+PiAzMik7Ci0jZW5kaWYKKwkJY3NyX3dyaXRlNjQoQ1NSX01FTlZDRkcsIG1lbnZjZmdfdmFs
KTsKIAogCQkvKiBFbmFibGUgUy1tb2RlIGFjY2VzcyB0byBzZWVkIENTUiAqLwogCQlpZiAoc2Jp
X2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfWktSKSkgewpkaWZmIC0t
Z2l0IGEvbGliL3NiaS9zYmlfdGltZXIuYyBiL2xpYi9zYmkvc2JpX3RpbWVyLmMKaW5kZXggODZl
MGRiNWFiMzk5Li45OThhOWE2N2MyZjAgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3RpbWVyLmMK
KysrIGIvbGliL3NiaS9zYmlfdGltZXIuYwpAQCAtMTM5LDEyICsxMzksNyBAQCB2b2lkIHNiaV90
aW1lcl9ldmVudF9zdGFydCh1NjQgbmV4dF9ldmVudCkKIAkgKiB0aGUgb2xkZXIgc29mdHdhcmUg
dG8gbGV2ZXJhZ2Ugc3N0YyBleHRlbnNpb24gb24gbmV3ZXIgaGFyZHdhcmUuCiAJICovCiAJaWYg
KHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksIFNCSV9I
QVJUX0VYVF9TU1RDKSkgewotI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMgotCQljc3Jfd3JpdGUoQ1NS
X1NUSU1FQ01QLCBuZXh0X2V2ZW50ICYgMHhGRkZGRkZGRik7Ci0JCWNzcl93cml0ZShDU1JfU1RJ
TUVDTVBILCBuZXh0X2V2ZW50ID4+IDMyKTsKLSNlbHNlCi0JCWNzcl93cml0ZShDU1JfU1RJTUVD
TVAsIG5leHRfZXZlbnQpOwotI2VuZGlmCisJCWNzcl93cml0ZTY0KENTUl9TVElNRUNNUCwgbmV4
dF9ldmVudCk7CiAJfSBlbHNlIGlmICh0aW1lcl9kZXYgJiYgdGltZXJfZGV2LT50aW1lcl9ldmVu
dF9zdGFydCkgewogCQl0aW1lcl9kZXYtPnRpbWVyX2V2ZW50X3N0YXJ0KG5leHRfZXZlbnQpOwog
CQljc3JfY2xlYXIoQ1NSX01JUCwgTUlQX1NUSVApOwotLSAKMi40OC4xCgoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
