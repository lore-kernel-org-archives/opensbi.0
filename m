Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C487C3ABA5
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 17:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VKhHStrc1oDMQ6WjP+yfoH1CKASncnjwt66RRhwVFPk=; b=xJHVbP8OfolOSl
	X+VGMguhZxm/Ewy6ahnFtho5n0k7rwozx2LJGJL8kMcXWsBZ+YPLU/ek8qdeKoBrVKBT2MZ9WnHcP
	wJtaPmXW4iTlhA5w1TqvkupV9bqFllOVKgM2OS9WXYtKYcgWA+VnSV/0ZxWnJRlwG9aynsnWLZSub
	3QkivUsafznvXi0l/JndCioe8XVZUn3C/Tjtp/N85Q7yxNM2VXPMlN4mYMtk7Lwqg+QrHXvxy7/81
	cElmwk+LmM43CtK5b6GLLKv1hFnSbZ+rk3eaqHJWAdzDIdsNEIEc86H0AHD+cw4uTV1R4qsg3s4jf
	8FK7pcZM0nkVFsdDmaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oKZ-0000000ALQp-3vwi;
	Tue, 29 Apr 2025 17:01:15 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyJ-00000009xZQ-1ZYW
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:08 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so6052415e9.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937006; x=1746541806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hT9WIMU9v/8HXbY4pj8/EQMroUCN/NIBrr54aYEUpes=;
        b=RDFfW8+czjKOb5cwL1wzjNmirPmCCzY9r+S3ElmOQBJJj9tJPzEPLPVxW69TVf3tfh
         zyeeHYffKtSkE1TPImdvYJG8aTnb0az1H9COkRHcb5uIMXK37CfD8EXuFrQoaj5P6YX1
         QC7xHmOSyD1nRQ3WgYoANo1bVQeJU+dryjPVZdsxbnTjBYBQXG6uIwjWOUSHS1TRs5OQ
         Ix2wQybkluduOnt+ktPIMKUd/MIb3lgIR24Khw2uuogHn7D+XSWQ3EaL+bymT9KrdD7D
         9yJcoUe2OJo+LJdWlFG7tJbSuKYb3uEEX2EfD+tfutfjxmZMud40M+7c05LaWCy4JQZp
         Y5zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937006; x=1746541806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hT9WIMU9v/8HXbY4pj8/EQMroUCN/NIBrr54aYEUpes=;
        b=AdtrdqULnu2deG9dEnJQnDJIO9xgQfZwRYdoaiplyQZhPg4FN62Kmc49sqqdZbmCQt
         vt3eBNkzwTl93xMyg/oEKevRdNnybamLNlTYcnw7e86vX3Z2sY49jXwsFnFVz4tEeVVG
         3Sfo8r/PHfXFgxH6yVclnlBu2u40E76ez/jSz3lIIt0h6jSI5GHC6UIEg0rlgwDmXddh
         nyqraan+6LdRy+zOOyHdEvtcEHV9cgBSfiepCofk8yahMwMJTfWIpxCCTNhOS/3xpI9u
         L20eOdimlcn1+kbUWDxZdooq/PDZsrL1JiAt68VKio5/eapMN+kxFNUU7pvWH7IRPrBX
         9S0A==
X-Gm-Message-State: AOJu0YzbfJ0bkxob/cJAT+iq3WVIC/Vx+J+IDvre9n8AB3xeLAeAJfE9
	igdU1w+fP+pv9FnKICwOhsucxHhvbkD6zy4VK8TEKtjewA4u5WyyWk+hdF5inOu2etu6LKj7ybf
	K/7o=
X-Gm-Gg: ASbGncvuewfpW6tAzmIVXZDKyk+q5Vw+z5vjGaBQWu/plgaKQWELnPtK//kQZYjPyDp
	X+1jUYI5H05B1LLcArNuVmhV2Z6AYnlwm8tZdulbrF7KKPM+VSQ4W7DesBKN5NRBiMjDFWYIlKA
	ZZeFkWqO6yYOHQJowpaR7WlC5ttmKBL75+jHl+2G2k5j/LLbLmDK+NWjDYrgGJor1eLNLuJLd7X
	VTta4hORY+20JSP0KXDKPPKB9sUND6t+Fu3OGW6kQczUtIVXqJkiP031HCptO9wfrN+IVra+0/y
	bi8rdzq9an6bTv+wRM2ckqNEFNK1XR9kC+BV3IPdtldV/mSw
X-Google-Smtp-Source: AGHT+IE+YHIfvylc9ufIeYmqPMSQqbTrlN5mbyYC3Ixrp583I8tsTewY7H8if7mbU3FTr5gxs88yvQ==
X-Received: by 2002:a05:6000:c0b:b0:3a0:8b90:1acd with SMTP id ffacd0b85a97d-3a08b901b2bmr692242f8f.0.1745937005728;
        Tue, 29 Apr 2025 07:30:05 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbedf4sm13917075f8f.45.2025.04.29.07.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:05 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 6/8] lib: sbi_hart: reset mstateen0
Date: Tue, 29 Apr 2025 16:25:48 +0200
Message-ID: <20250429142549.3673976-8-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073007_411779_0960CE7B 
X-CRM114-Status: GOOD (  12.43  )
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

VGhlIGN1cnJlbnQgbG9naWMgY2xlYXJzIHNvbWUgYml0cyBiYXNlZCBvbiBTQkkga25vd24gZXh0
ZW5zaW9ucy4KQmUgc2FmZSBhbmQgZG8gbm90IGxlYXZlIGVuYWJsZWQgYW55dGhpbmcgdGhhdCBT
QkkgZG9lc24ndCBjb250cm9sLgoKVGhpcyBpcyBub3QgYSBicmVha2luZyBjaGFuZ2UsIGJlY2F1
c2UgdGhlIHJlZ2lzdGVyIG11c3QgYmUgaW5pdGlhbGl6ZWQKdG8gMCBieSB0aGUgSVNBIG9uIHJl
c2V0LCBidXQgaXQgaXMgYmV0dGVyIHRvIG5vdCBkZXBlbmQgb24gaXQgd2hlbiB3ZQpkb24ndCBu
ZWVkIHRvLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+ClNp
Z25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgot
LS0KdjI6IEFkZCBSZXZpZXdlZC1ieSBbQW51cF0KLS0tCiBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAy
ICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKaW5kZXggZmMz
N2IyNDliODkyLi5jNmE3Nzk0OTBjNzAgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwor
KysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAgLTg5LDcgKzg5LDcgQEAgc3RhdGljIHZvaWQgbXN0
YXR1c19pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKIAkJY3NyX3dyaXRlKENTUl9I
U1RBVFVTLCAwKTsKIAogCWlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9I
QVJUX0VYVF9TTVNUQVRFRU4pKSB7Ci0JCW1zdGF0ZWVuX3ZhbCA9IGNzcl9yZWFkNjQoQ1NSX01T
VEFURUVOMCk7CisJCW1zdGF0ZWVuX3ZhbCA9IDA7CiAJCW1zdGF0ZWVuX3ZhbCB8PSBTTVNUQVRF
RU5fU1RBVEVOOwogCQltc3RhdGVlbl92YWwgfD0gU01TVEFURUVOMF9DT05URVhUOwogCQltc3Rh
dGVlbl92YWwgfD0gU01TVEFURUVOMF9IU0VOVkNGRzsKLS0gCjIuNDguMQoKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
