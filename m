Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C3DC369B5
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mXcXYyS3d5z4f9O+bxPhXw68K6CHUHYtnP6R22TZev8=; b=0K2l6jbq4V/VEc
	GqJ8Hp25T0XvU/x0v8CgyGf7ZLXuqffwjrMD+KYbDbeCVDhPYn4gUuEXQzodxvq13ejmcfWnHWb/n
	TJS5kYBNBq5typfT2jTuamoShbP/F2lIgvY7LsWFT0b98vfswCT83JVd2yizsiYvxt3PgeJ7UWxJE
	DNftwhoeP2vhCz9FOYVeGPaG5CoywmtFgCSywVAutDZkFXLBQf9DlZ0v0nXPTsCK5J2UwUtGvwpZd
	r/JzyEp7jZrgg74m6YYsX+8Fh0CiTibml/e0YFcI/POsLWT/63SaWfRo7PXGtSG+zvS+o40uLZPT+
	xYTM0vcrNySIPj4aRxiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVP-000000067vf-2QIz;
	Tue, 15 Apr 2025 14:43:19 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCy-00000005t9K-1W0v
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:13 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43d64e6c83eso7055885e9.0
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723210; x=1745328010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddppdI9zoX8+gIPbBpPfClW1qC3MPYvxu9VSack6u0g=;
        b=gc1Z+4sxylabjar90MSovehrKt2SiLJ4qfFZE23gj2FV62VqnlND27yEPrK19bPFye
         qIO5nDtjOiblB43cSSUegJw+Tg4UhPPa+Ex6QLyqWGMkAOtoG4Yfsb+Q3+SiGo/obO5a
         /2Kngnp3T5KweNCik3itiQXeGFl3f8auWvM2/l1Q+0JaoLCf4vg2c0oLQrFzvjo4Y3oN
         0jHtMZvT00cKH7qnrapcF5mva+pFxhVJk9ncHT6ywii1CBj/mMBSXLM5GnpQ7faAm7vU
         aAE/wxOj0OetJoYklvvF0RVEOySjPt8X84ZNpxsKUPpgxO5epB0X2efolyaGkT3hSHr+
         X+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723210; x=1745328010;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ddppdI9zoX8+gIPbBpPfClW1qC3MPYvxu9VSack6u0g=;
        b=OYewYXB6GxesGEe7qXr3BiC6eB/6jubBkxlPDv10wOkzTgUKYS4bYSIUuXwHTn4+b2
         Aa6z5TmO9ID45UlrIPniSgOiPDSzZjPWNdOwcG7QWGmlWuh8BU1ExLD8DwQBULzQErYi
         0ZzYGaxPHRh6UTg0F8ubY8lvE7R1ujvsAAdhNLjbO+h2o1pJDaqabnlki1S3xIIo5Zrk
         7ULpYdDN0tf0nsLTlWLMZcFy94q9gQxyjMBDSpRK9HegVp11N8Vovbw5ibK3y+CJOUrT
         fH6p9KW8URUnROn7RkeVY+NZrwFfAie0gA9Gm8KD26r+TnDpZeD9WxWSyIahVKngSPSy
         reGQ==
X-Gm-Message-State: AOJu0YyhlWNcYipPmdTMA4M5P/hL25SJF1nJFluKEY/PO1LrWga4JhLV
	yqKqtBG6cEMYfD/vDZRPAPDhyhxyVerFDT1J/M8NvbdindlguU5jIyHync3z4/z7A3pXtU6t0OX
	IfIc=
X-Gm-Gg: ASbGnctaaKr4W5lQzA2WfAlnewt8lwdgIvYvrfhfZHk7Hw+Wjn44FuVOMcTCP4O08Vb
	8eOReUtVOzdXgi0/c/FqIHRikJ8k/h36zte35RQdsYjXH/s2YabUGaLbfWXC1238aEzXfTsas55
	In9qw1R5/xbyobuDUvksp6BK/ELYb5vJ+A0TEzE9hqFNwVnS82ZJdIEB+goVV3VTiDKe4eBu/2f
	4NdqhBpvn3tCc4atrORU45W2TR7GjqOrLGkgEtLh9dkGwHSY7DDcFyW+A7ZXk07YSTlaTpDae43
	PbvBsBk3jvse8Z+fE+Ro7erTlrKj6Q9WWvH52+cdJmkDbq0fBq9V2vMEhdA=
X-Google-Smtp-Source: AGHT+IGd0eTM7Ffv7pj0KD8z6T9KVwp25zVIdD/wcfJOk9z3a+BEEANikS/ajux+HQdQO5nTFSzenQ==
X-Received: by 2002:a05:600c:8711:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-43f3a9aedbcmr54688465e9.4.1744723210515;
        Tue, 15 Apr 2025 06:20:10 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f235a5d82sm210025735e9.37.2025.04.15.06.20.10
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:10 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 7/8] lib: sbi_hart: add Ssstateen extension
Date: Tue, 15 Apr 2025 15:19:08 +0200
Message-ID: <20250415131908.2699782-9-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062012_397586_2F94BE6F 
X-CRM114-Status: GOOD (  10.81  )
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

V2UgYWxyZWFkeSBkZXRlY3QgU21zdGF0ZWVuLCBidXQgU3NzdGF0ZWVuIGV4aXN0cyBhcyB3ZWxs
IGFuZCBpdCBkb2Vzbid0CmhhdmUgdGhlIE0tc3RhdGUgQ1NScy4KClNpZ25lZC1vZmYtYnk6IFJh
ZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgotLS0KIGluY2x1ZGUvc2Jp
L3NiaV9oYXJ0LmggfCA0ICsrKy0KIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAgfCA0ICsrKysKIDIg
ZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKaW5kZXgg
YzNhN2ZlYjc1M2Q5Li4xMGQwY2Y0NDdiYTYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc2JpL3NiaV9o
YXJ0LmgKKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaApAQCAtMzEsNyArMzEsNyBAQCBlbnVt
IHNiaV9oYXJ0X2V4dGVuc2lvbnMgewogCVNCSV9IQVJUX0VYVF9TTUFJQSA9IDAsCiAJLyoqIEhB
UlQgaGFzIFNtZXBtcCAqLwogCVNCSV9IQVJUX0VYVF9TTUVQTVAsCi0JLyoqIEhBUlQgaGFzIFNt
c3RhdGVlbiBDU1IgKiovCisJLyoqIEhBUlQgaGFzIG1zdGF0ZWVuKiwgc3N0YXRlZW4qLCBhbmQg
aHN0YXRlZW4qIENTUnMgKiovCiAJU0JJX0hBUlRfRVhUX1NNU1RBVEVFTiwKIAkvKiogSGFydCBo
YXMgU3Njb2ZwbXQgZXh0ZW5zaW9uICovCiAJU0JJX0hBUlRfRVhUX1NTQ09GUE1GLApAQCAtNzks
NiArNzksOCBAQCBlbnVtIHNiaV9oYXJ0X2V4dGVuc2lvbnMgewogCVNCSV9IQVJUX0VYVF9TTUNU
UiwKIAkvKiogSEFSVCBoYXMgQ1RSIFMtbW9kZSBDU1JzICovCiAJU0JJX0hBUlRfRVhUX1NTQ1RS
LAorCS8qKiBIQVJUIGhhcyBzc3RhdGVlbiogYW5kIGhzdGF0ZWVuKiBDU1JzICoqLworCVNCSV9I
QVJUX0VYVF9TU1NUQVRFRU4sCiAKIAkvKiogTWF4aW11bSBpbmRleCBvZiBIYXJ0IGV4dGVuc2lv
biAqLwogCVNCSV9IQVJUX0VYVF9NQVgsCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMg
Yi9saWIvc2JpL3NiaV9oYXJ0LmMKaW5kZXggNTY5ZjgwMDhiNTIzLi5iYzBhNzNkMTI5OGQgMTAw
NjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAg
LTY5NSw2ICs2OTUsNyBAQCBjb25zdCBzdHJ1Y3Qgc2JpX2hhcnRfZXh0X2RhdGEgc2JpX2hhcnRf
ZXh0W10gPSB7CiAJX19TQklfSEFSVF9FWFRfREFUQShzc2RibHRycCwgU0JJX0hBUlRfRVhUX1NT
REJMVFJQKSwKIAlfX1NCSV9IQVJUX0VYVF9EQVRBKHNtY3RyLCBTQklfSEFSVF9FWFRfU01DVFIp
LAogCV9fU0JJX0hBUlRfRVhUX0RBVEEoc3NjdHIsIFNCSV9IQVJUX0VYVF9TU0NUUiksCisJX19T
QklfSEFSVF9FWFRfREFUQShzc3N0YXRlZW4sIFNCSV9IQVJUX0VYVF9TU1NUQVRFRU4pLAogfTsK
IAogX1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0
X2V4dCksCkBAIC05MzYsNiArOTM3LDkgQEAgX19wbXBfc2tpcDoKIAkvKiBEZXRlY3QgaWYgaGFy
dCBzdXBwb3J0cyBtc3RhdGVlbiBDU1JzICovCiAJX19jaGVja19leHRfY3NyKFNCSV9IQVJUX1BS
SVZfVkVSXzFfMTIsCiAJCQlDU1JfTVNUQVRFRU4wLCBTQklfSEFSVF9FWFRfU01TVEFURUVOKTsK
KwkvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBzc3RhdGVlbiBDU1JzICovCisJX19jaGVja19l
eHRfY3NyKFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIsCisJCQlDU1JfU1NUQVRFRU4wLCBTQklfSEFS
VF9FWFRfU1NTVEFURUVOKTsKIAkvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBzbWNudHJwbWYg
Ki8KIAlfX2NoZWNrX2V4dF9jc3IoU0JJX0hBUlRfUFJJVl9WRVJfMV8xMiwKIAkJCUNTUl9NQ1lD
TEVDRkcsIFNCSV9IQVJUX0VYVF9TTUNOVFJQTUYpOwotLSAKMi40OC4xCgoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
