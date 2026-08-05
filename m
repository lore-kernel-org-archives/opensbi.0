Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D30C55174
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 09:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jo16a4OicqhhbhqfjcxHRPTDvnNjrW+e8ggHSSXH4Vs=; b=kimXMPhLIWlEMt
	tj1VsK3w+Pj8JcoUexJAdm4cOCGM9sM8WUyftcKrnEKN2KWHulnFKubIn4NTTDwzVnv3dA/sCEcgs
	omkI8CjWWG93tEKjmNJ4x3MUUUcCnMZAnyKBFeMTI5rYQHMuWx68oVDGbHIjqCkN7a9EpApMdpH9B
	DQ0ySuBTxL0+RCcCiqx2lkpLWG1V/jvCuiMr+gUm2bH4/LyYrGqp+20j9uymcVrbdZPmsr2xf1YKb
	yOkUT19Y5gva6vtJSxziCCAUt06cZsjiz5wvVYUfaGooMvCfLSvGas7vLucfzUl/rd0EFF7dAxrSG
	DUhgDyW8Fhw2KoXE7eoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY4j-00000003doX-0g3M;
	Wed, 05 Aug 2026 09:38:13 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrY4g-00000003do8-1QM2
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 09:38:11 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e04df8c46so931629b3a.2
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 02:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1785922689; x=1786527489; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L1dkc0p38cSi1MXoPL+NqX51yz2hzjuDC1ShCItcF54=;
        b=SFphHUUOsr0w8WngkU9ETgalj05ARNehJ25SaPHm4vM+VX5KMdEjdcX7g3LyJlCw+o
         B2S/ErCcuo9gqc/919tkL57Mo8EZUN4lAiTzzmi8kgFy64gg+1evknIA2kdlBSzwhrPf
         0CkE6+q0VrTBVmV4lLi+5hmB+Oh57By+984f1mSPc1A9iJKU4aeAjSqmM5M0Z/db8ZuR
         /xxZOx763eZGgMld78dsKMENk3cBin/GnPxctl4NMDy+U5ZrtP5u46sxHO4simBbBft1
         +J3J5ADb4vHzplGA2RCNvoKKz4uv/cQ1BowAIAIO+gtE+RuSWGEuWpclsujOoPu8yFKb
         YunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785922689; x=1786527489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L1dkc0p38cSi1MXoPL+NqX51yz2hzjuDC1ShCItcF54=;
        b=DZe9AdJGhfqKwgaDRyEgrT6YcWZ07//wkz3alOPSRkSg6lrzGCzOOF8USoZqgS9k7P
         +PAvCipe7qyLTE7Q117ORsr4RMasUkIbAms0EBZEDcHCrabZsisYiqmJQeDUrtDnqvou
         W032TvdxEHXu0HXURSE12nFMAT3vXKs0pmpiy6EFrvYE5KF8sFA0bt49Pplq1nhIdsmq
         2ZT+x4EkJWSX7lokUdKkNdUyi+z+P9UTNUyQjkbdTVQtjjSkJIGmAl9wPVxVwLYEhslg
         AgxFeS1Bm47udYwCjNVQq0revbatLoHbthbZFNuKog9akCThj3uP64Tu/KkTfGh7Fa2r
         l/ew==
X-Forwarded-Encrypted: i=1; AHgh+RoAYyMF92IOO0v9us5TcbPv74blWOqfmbppljOYlGH2HQSZ2tPLCPe7KZpawjKz7eljeKJASiKf@lists.infradead.org
X-Gm-Message-State: AOJu0YzuH7DEQWY+4/mud+uunD3r58mLcruuNvfrnxPrW6wX8mGIcxCr
	WAT0DgujTNZHp1wrZY8mszU1i7hBXftZi07191IkmkZt3QGWGgj6DfqKLAxnTRM/7P0=
X-Gm-Gg: AR+sD10mproBtoe5rO8oRw7zouRzqIAH3QxTthSnUg2hPxofSYkuklZ/e/wTouOPNN5
	a69mEJNSh3kwSBfFO0qCFaBFy5L3L734vf7mBrAyRt6OlxxSsvy+rZIztRQOtNAeu4GUyPtkyW6
	9Z33uuB1B2jwRJpfne3b8+S5tsiEYr5IqySyntSot02GoRNLcKwWbwwXqeVFvGhpzBux3V/cm8/
	fvhnNGCuQcTNDZpZc8q519XdKJB0BwHhfOi9Eretg9A0jXD+aaQrFaKA2XJ7Q6suSlqklcyPgT8
	dtsHdUd7FNfCG8kQ4Gr2gZG13pi28CDgcgHPBsz+WNnanDQ2qz5BBY8dek+HuX/nY71JKsIdhRX
	a1r7RzExV/PSHVxmQ8UxK6xByiT8eDrU6Wifg2h+hV2O0c9e2yEeGcaVFC+PtkpUhVPE8KJE8Ej
	QDLXQzpQyfUR046vVaUW0TSC42y6B81ybYtDNqmoROT45UOYzrNjhmS16F8Yk=
X-Received: by 2002:a05:6a00:1c8e:b0:847:76d8:8d72 with SMTP id d2e1a72fcca58-84f2dff5a57mr6238699b3a.23.1785922689278;
        Wed, 05 Aug 2026 02:38:09 -0700 (PDT)
Received: from plin-1878 ([136.226.240.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f2e2c5eeasm636824b3a.7.2026.08.05.02.38.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:38:08 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:38:03 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	opensbi@lists.infradead.org, raymondmaoca@gmail.com,
	zong.li@sifive.com, jim.shu@sifive.com,
	pawandeep.oza@oss.qualcomm.com
Subject: Re: [PATCH 4/5] lib: sbi: Extend hart protection abstraction to
 allow ID configuration
Message-ID: <anMEe1XLBZJn+PLM@plin-1878>
References: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
 <20260717074413.2536416-5-anup.patel@oss.qualcomm.com>
 <al30Fax18B3Ev/qS@plin-1878>
 <CAAhSdy089rACuAxxuxhdmF=_Hu_kGokGqzSvqA2UTaC4=2oyQg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy089rACuAxxuxhdmF=_Hu_kGokGqzSvqA2UTaC4=2oyQg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_023810_404485_C1DD6EA5 
X-CRM114-Status: GOOD (  17.55  )
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

SGkgQW51cCwKCk9uIE1vbiwgSnVsIDIwLCAyMDI2IGF0IDA0OjE5OjEwUE0gKzA1MzAsIEFudXAg
UGF0ZWwgd3JvdGU6Cj4gT24gTW9uLCBKdWwgMjAsIDIwMjYgYXQgMzo0MOKAr1BNIFl1LUNoaWVu
IFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+ID4KPiA+IEhpIEFudXAg
YW5kIFJheW1vbmQsCj4gPgo+ID4gT24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMDE6MTQ6MTJQTSAr
MDUzMCwgQW51cCBQYXRlbCB3cm90ZToKPiA+ID4gVGhlcmUgYXJlIHZhcmlvdXMgSUQgY29uZmln
dXJhdGlvbiBJU0EgZXh0ZW5zaW9ucyBzdWNoIGFzIFJJU0MtViBXb3JsZHMsCj4gPiA+IFN1cGVy
dmlzb3IgZG9tYWluIElELCBRb1MgSUQsIGV0YyB3aGljaCBuZWVkIHRvIGJlIHJlLWNvbmZpZ3Vy
ZWQgdXBvbgo+ID4gPiBkb21haW4gY29udGV4dCBzd2l0Y2ggb24gYSBoYXJ0LiBFeHRlbmQgaGFy
dCBwcm90ZWN0aW9uIGFic3RyYWN0aW9uIHRvCj4gPiA+IHN1cHBvcnQgYm90aCBtZW1vcnkgcHJv
dGVjdGlvbiBhbmQgSUQgY29uZmlndXJhdGlvbiBJU0EgZXh0ZW5zaW9ucy4KPiA+Cj4gPiBJIHdp
bGwgcmV3b3JrIG15ICJbUkZDLDAwLzEyXSBBZGQgUklTQy1WIFdvcmxkcyBJU0Egc3VwcG9ydCB0
byBPcGVuU0JJIgo+ID4gc2VyaWVzIGJhc2VkIG9uIHRoaXMgc2VyaWVzLgo+IAo+IFRoYW5rcyBQ
ZXRlciEKPiAKPiBUaGUgUklTQy1WIHdvcmxkIERUIHByb3BlcnR5IHBhcnNpbmcgY2FuIGJlIGRv
bmUgYXQgdGhlCj4gdGltZSBvZiBwYXJzaW5nIGRvbWFpbnMgZnJvbSBGRFQgKGxpa2UgYWxyZWFk
eSBkb25lIGluIHRoaXMKPiBzZXJpZXMpLiBUaGUgaGFydCBwbGF0Zm9ybSBhYnN0cmFjdGlvbiB3
aWxsIGJlIG9ubHkgZm9yIGNvbmZpZ3VyaW5nCj4gdGhlIFJJU0MtViB3b3JsZCBDU1JzLgo+IAo+
IE1heSBiZSB5b3UgY2FuIGFkZCBzYmlfaGFydF93b3JsZHMuYyAoanVzdCBsaWtlIHNiaV9oYXJ0
X3BtcC5jKSA/Cj4gCj4gRm9yIFJJU0MtViB3b3JsZCBjaGVja2Vycywgd2UgY2FuIGhhdmUgc2Vw
YXJhdGUgRkRUIGJhc2VkIGRyaXZlcgo+IHVuZGVyIGxpYi91dGlscyB3aGljaCB3aWxsIHJlZ2lz
dGVyIHNiaV9kb21haW5fZGF0YSBpbnN0YW5jZSB1cG9uIHByb2JlCj4gb2YgZWFjaCBSSVNDLVYg
d29ybGQgY2hlY2tlciBpbnN0YW5jZS4gVGhlIGRvbWFpbl9zZXR1cCgpIGFuZAo+IGRvbWFpbl9j
bGVhbnVwKCkgY2FsbGJhY2tzIG9mIHRoZSBSSVNDLVYgd29ybGRzIGNoZWNrZXIgZHJpdmVyIHdp
bGwKPiBwcm9ncmFtIHRoZSBSSVNDLVYgd29ybGQgY2hlY2tlciBNTUlPIHJlZ2lzdGVycy4KCkkg
ZXhwZWN0IHRoZSB3Z0NoZWNrZXIgZHJpdmVyIHdpbGwgYmUgaW1wbGVtZW50ZWQgYXMgYSBnbG9i
YWwgRkRUCmRyaXZlciwgbm90IGJvdW5kIHRvIGRvbWFpbiBzdGF0ZS4gQSBjaGVja2VyIHNsb3Qg
dGFibGUgY29udGFpbnMKYWxsIFdJRHMnIHBlcm1pc3Npb25zIHNpbXVsdGFuZW91c2x5IGFuZCBy
ZW1haW5zIHVuY2hhbmdlZCBkdXJpbmcKcnVudGltZSAobWlnaHQgYmUgbG9ja2VkKS4gU28gSSB0
aGluayB3ZSBzaG91bGQgbm90IGFkZCB3Z0NoZWNrZXIKZG9tYWluX3NldHVwL2RvbWFpbl9jbGVh
bnVwIGNhbGxiYWNrcy4KClJlZ2FyZHMsClBldGVyIExpbgoKPiAKPiBSZWdhcmRzLAo+IEFudXAK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
