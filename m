Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 335DFD6D22C
	for <opensbi@archiver.kernel.org>; Thu, 18 Dec 2025 14:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wdgXrqLacvCMySa3d/BRetB0RB5dLeC8HuK15Tb+3jU=; b=Wlvmizxf9cutlm
	FINCiKgoJYi4sD2CdZEVP5BzIYVyiRBQz3c6ZxjvMKeQRZziTbqkD3I0BcCx8YSQtVbbGQCtuDgjy
	zJxeUlMZ3uS5W9sFh7h+uf0MWhkJJCgNzkbvy4+CKFd/xAWqrIIQlL2xIEg1QHFuPOeVpd4X7QtwR
	p+WiIZGVZEb+ZbxB9oVn0QpwiDIvRCG4aC9bWAEbj2SIok9A7gLP3EVYGXbCN3z4HufDSXZelg484
	CyxTA5YSqoUYaQULbhKsH+39vGd9jZ3gyz/qpJSNfPYxC3ieLpNw+EKyhlG5IbsUxIt2O0wVaYt0V
	PA/8NgaO2F7Ia5mFRbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWF6u-00000008cbZ-3mpK;
	Thu, 18 Dec 2025 14:36:08 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWF6q-00000008cb5-3Vhf
	for opensbi@lists.infradead.org;
	Thu, 18 Dec 2025 14:36:07 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-3ec4d494383so496630fac.3
        for <opensbi@lists.infradead.org>; Thu, 18 Dec 2025 06:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766068563; x=1766673363; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=skoNKNGHkv9X8ms/WM3iQ2aFwcPkRx2Lm9w/aUhh6rc=;
        b=jat59BFB7YUFwxiKYXUm93GYXhw0ZUPYKOpevxUEFe1Z9sQInwDFnvOd8LlYB3jLOw
         /Ty37r455cv5k931OwCAVI9W7I74z2rv7B7ING+QTksk7O8O9NA6XOJqhhoNgha7d1XK
         Sa9xMIrq527NK9UO6mZmyKSYn3JP+ERdB5sxUoO+tD/OjjsxBCqycCir3XD/oESU0dgq
         Mes0WJj9J5xfK3ZbNq7DMs4vi0TijIo4W0VFivs0gAUH0HG9h/+3oxvkW6nbbCI4M7aT
         0XV3PMgF9W6VmEtdmao2lDA12xr+w1NLyQ1917dhEKayX6KQLhmmxWyvwwOQRxuSr4n2
         xWDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068563; x=1766673363;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=skoNKNGHkv9X8ms/WM3iQ2aFwcPkRx2Lm9w/aUhh6rc=;
        b=ag082D7gXD6h5J8R3H3BMK1lNECUH6STXvs2zZJHrCK+IKWsZv8X7+PgQpY6bFxCEs
         lNdfsSTg36F38oZmMbflzOmoTOYzCOYqPTcDf/fmjaZSJzSzMp6MRJCsQFKQzcykKLBa
         qwBDAGsSF6Hw2H1T0ZpwxTB3kHh/pzRYDU/8QAodZmkjsX44MnAwQwJFeC7m66317/Og
         HY/zCzVhPiDZZ0R9iKG/Ufh0lxWR5OOrjgEanYv+BsKB9al2XNezKM1SVq+ztxqXacDF
         YQ6EEWwOU6IVPyMCNakFclAnwHxOU+Le5nG0fkFSCS4RZVZs5npqvZbYvU1VpucLG+PY
         UvrQ==
X-Gm-Message-State: AOJu0Yy8tviVSpXWKvl4oGFKMaZ3J3tGh1MEbZT3QuiTGOlNSD37DfUU
	PHUWvaOhQUzJPk5FJiYQWhaHuy0GJrgFroBNbBtdnEcEXA4BQtPPzxgwihhfZvZAJTayp4NguP4
	jmzXROa/sOCbLtcW3+gHwjDsadutUJvmycd/8cHc1yg==
X-Gm-Gg: AY/fxX6OvXmOG8T9pbqNL2xYc/BzgqwzHPsKokeVtzD616rwTfJrg5IJ9lvb8p84sXy
	kq511R89DSJFlk8lFEJNVWmRsxaiSSbv7BsTNHY8YIOPhvyR5zsp2mWu309RTYm1FPu33DPUr7z
	MY+ll19QvqyZw2Gi37612zTyFhXOL6MbDa5pQNFKho5GyF38XgwcGa0oSm1ql7vCwhqdi1kzRwc
	7CZ8wcLEoov1aZYE0VCOV2EyDQUXNeYitoT4oUt39dnbNe65PagC779XOmUTCbPcjL5b8za
X-Google-Smtp-Source: AGHT+IEC1HiPHN5YPl1XC74JqFpT7MRER3y0fx9HM++2Ajfx3X2ndIcD9QzUjOuOPF4h2Csgg9OyPGdLRbdxVBwWLOA=
X-Received: by 2002:a05:6820:830b:b0:65d:465:8bd2 with SMTP id
 006d021491bc7-65d04658f95mr459511eaf.65.1766068562646; Thu, 18 Dec 2025
 06:36:02 -0800 (PST)
MIME-Version: 1.0
References: <20251218104243.562667-1-ganboing@gmail.com> <20251218104243.562667-2-ganboing@gmail.com>
In-Reply-To: <20251218104243.562667-2-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 18 Dec 2025 20:05:51 +0530
X-Gm-Features: AQt7F2rYm34hlQXCETmonTc3CkWQMbbDc7UanGQPYB_XHnAbaKeU07j9zwTaXA8
Message-ID: <CAAhSdy3dhSppudnrOVNqmrBPbjKfMymv4qou0Yr5pek=7vhHPw@mail.gmail.com>
Subject: Re: [PATCH v6 1/7] lib: sbi_hart_pmp: make sbi_hart_pmp_fence public
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, gaohan@iscas.ac.cn, samuel@sholland.org, 
	wangxiang@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_063605_125761_A47D4BE2 
X-CRM114-Status: GOOD (  13.64  )
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

T24gVGh1LCBEZWMgMTgsIDIwMjUgYXQgNDoxNOKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IHNiaV9oYXJ0X3BtcF9mZW5jZSBjYW4gbm93IGJlIHV0aWxpemVkIGJ5
IG90aGVyIGhhcnQtcHJvdGVjdGlvbgo+IGltcGxlbWVudGF0aW9uLgo+Cj4gU2lnbmVkLW9mZi1i
eTogQm8gR2FuIDxnYW5ib2luZ0BnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBpbmNs
dWRlL3NiaS9zYmlfaGFydF9wbXAuaCB8IDEgKwo+ICBsaWIvc2JpL3NiaV9oYXJ0X3BtcC5jICAg
ICB8IDIgKy0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaGFydF9wbXAuaCBiL2luY2x1ZGUv
c2JpL3NiaV9oYXJ0X3BtcC5oCj4gaW5kZXggZjU0ZThiMmEuLmE3NzY1ZDE3IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0X3BtcC5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hh
cnRfcG1wLmgKPiBAQCAtMTUsNiArMTUsNyBAQCB1bnNpZ25lZCBpbnQgc2JpX2hhcnRfcG1wX2Nv
dW50KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCk7Cj4gIHVuc2lnbmVkIGludCBzYmlfaGFy
dF9wbXBfbG9nMmdyYW4oc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKTsKPiAgdW5zaWduZWQg
aW50IHNiaV9oYXJ0X3BtcF9hZGRyYml0cyhzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpOwo+
ICBib29sIHNiaV9oYXJ0X3NtZXBtcF9pc19md19yZWdpb24odW5zaWduZWQgaW50IHBtcF9pZHgp
Owo+ICt2b2lkIHNiaV9oYXJ0X3BtcF9mZW5jZSh2b2lkKTsKPiAgaW50IHNiaV9oYXJ0X3BtcF9p
bml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCk7Cj4KPiAgI2VuZGlmCj4gZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX2hhcnRfcG1wLmMgYi9saWIvc2JpL3NiaV9oYXJ0X3BtcC5jCj4gaW5k
ZXggNjJiYzg1OWEuLjdmOTcwY2EzIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnRfcG1w
LmMKPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0X3BtcC5jCj4gQEAgLTYyLDcgKzYyLDcgQEAgYm9v
bCBzYmlfaGFydF9zbWVwbXBfaXNfZndfcmVnaW9uKHVuc2lnbmVkIGludCBwbXBfaWR4KQo+ICAg
ICAgICAgcmV0dXJuIGJpdG1hcF90ZXN0KGZ3X3NtZXBtcF9pZHMsIHBtcF9pZHgpID8gdHJ1ZSA6
IGZhbHNlOwo+ICB9Cj4KPiAtc3RhdGljIHZvaWQgc2JpX2hhcnRfcG1wX2ZlbmNlKHZvaWQpCj4g
K3ZvaWQgc2JpX2hhcnRfcG1wX2ZlbmNlKHZvaWQpCj4gIHsKPiAgICAgICAgIC8qCj4gICAgICAg
ICAgKiBBcyBwZXIgc2VjdGlvbiAzLjcuMiBvZiBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24gdjEu
MTIsCj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkK
