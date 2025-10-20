Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D52CCD193
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 04:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyA6fQppEJ/7kj4r5lh5Ms5ndi4AuznEC+LX/Dwlxa0=; b=lke1JoK7P+tFwe
	QsSmDCVJQ2cfrhtS1wxwbSOmpw5pWfXY/awESQQQ4nX2eP9QUwLqiKdZkz1//i1pdfjOOY0p0pgRL
	C7Jja5dJS6YLQ9MG7BlPcPDVGmu+S7rCiaE0pXiBphNuUgndEgN204OIvQv9A2rsZfSDC1cWnsRjV
	lSb1FNmFQr2UDMpWjKH4ewVHeHL6hZksCZn6prN9IZi7Y5gfbiuE1sUjjcJu+PRBpQ88hF0ch4Y15
	PBJ9aPysPVHqpbnpk1oRGdGCaUaLUboQr+v9xx2lAXWmNaTV6wC61qdQO693qagmJZohmOgSBgEzY
	YoCBsKw+KnqKULD2h61g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhdI-0000000BsR8-009U;
	Mon, 20 Oct 2025 04:36:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhdH-0000000BsQv-0uSx
	for opensbi@bombadil.infradead.org;
	Mon, 20 Oct 2025 04:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=hz1lpx7nNCw1wc7KPKRwts/bhZo8S5oJwBQUrw/x+vw=; b=j5hyY9TFmTExRmg29WrWn4mZ/h
	cXb4iFKJaSxdMZJw7MHwaTYWepe4gsxAwGHuxF9rhZD0vgyl7ioLlWJd0W8kQ+lfTm5Hv34/eqUf4
	mEomwXcrDb/J8xEIMeoW0p5IGWbY0JJB/4Wsj24jOqWYaHXtZEaG9xmSPn8JorbaBN9rYB8vab3XG
	5GoDjXSHbkQa08Hww6UvKCFcysO3FIIrZRsrClnSOZhPGgBYnCr60Q2V+uB4viIY0xfGmfQCQTvQ+
	32JgND9L/4EbKs5REaOS8K/OHGrwSOEpNTmYRgTtQDqDt/Q6DoTaD6pmTTlBWt2LSwQLAPKTchAw0
	BAWItQTA==;
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAhdD-00000009VtX-2BnL
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 04:36:29 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-93e7ff97d9fso257692939f.1
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 21:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1760934985; x=1761539785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hz1lpx7nNCw1wc7KPKRwts/bhZo8S5oJwBQUrw/x+vw=;
        b=xHH4huRxjtcRDj6pSuXmPAU0tK5PY54yCGtid2sLHRDiE0XBaXlKlo6DWslITvqYjJ
         DjWHMQn4RWtV3wsPQR7icG1ID0EACYmVlbqYA2G7RaSNu0WUUK73d0h07Lzn1MAWlIKa
         CDFnx61bv7yrbR4TWT6F72F9kzYD2RzzHv6we64KTD6yscFaC4E6LUp+La/Nd0BETEYI
         ZTvjR5q/Ltx+aNC8oBBqfF05bsYxreulOQeWuKWq5fFLLCo+eF2wROuS868/6e098e+3
         Fg3x9XKtwK5+TR8DI2GbPEwGlk6UAsT/ixVqOrjCY/BDKmr+QqPqq+S8Yppw9nIaXum4
         sEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760934985; x=1761539785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hz1lpx7nNCw1wc7KPKRwts/bhZo8S5oJwBQUrw/x+vw=;
        b=LsuDy1awJEemsqqlnFrCRnndKxcuMTIzEOSZgEa4PRFMaUFwBclIYoXugM8/OKuABA
         uyrYUhLKHhgdURyh7yFjTLYAWdEvMYFVXz4UELeCzfnsKAyE4brkWU9ixwWxNDhFsT/I
         3E0n5NpfuVVcD2816L5NSRu3yaIfrGGGeKTG33xb15YP0Xx/WvdchhtL9GxLD/fBy+s8
         DRXBUy7qJhOEIpP79YyWy4phd3u6rlXYTcvWm1lf6Ty5Kvi6xURIqDGyhVGquyUxOqvq
         /uIb2MB/0VBlPDG3YmyIJnswJtM5EkFCWKHOK43w6rsrJa/bNBo/4P2qcrr1VVUqwvBo
         upIQ==
X-Gm-Message-State: AOJu0YxCFENkFTZqt7yJYm9orNWCwiL+Ff28BRTfW+sstTvHJhwAElVJ
	muNJrTYtEBNxQw+oDQRK7AAUmSyVCMcxIFnMHn7f5TAM8Sfg5JdbmIY6imCmWW8CkJIbLiLq9hI
	8z/526KKKfWlo29kE7isUzE12nUbz4qASRUTR/LlNkoqffP0fQGxLIqc=
X-Gm-Gg: ASbGncsebUzcfuwiloa4y3NemxFxN/7ZPgl2wQ/VR0dUG44QNed11UZBYHhvCs2tFcM
	X6KqN2FUOohlucu6oIGt8bqVRSTabfekUepOK/ZUfRXIA/PiOzQEWXo1DQnP3GGi7WU8DzPPHNm
	gPZC4tlXvmxVkknFhhfi6VktCZDQDAGRZ/eGWJRuseZV0Jr+jHulCcVnm6YAY1zUnd1q7t1PmGo
	A6JWNM12EKkh9cxSly+ZDy0DIg2jVbnZ96kbRU9OO2qLFe87zryC8d7nCb1H3aZYESDH6g4ZVUm
	n7eDCN61OMzc9lsIGg==
X-Google-Smtp-Source: AGHT+IFs05HhTJC0A9BbwwCr5G1MXEiLU4mkR59X2rFxHG0XVjDB7OdA+pGaIVxaHcDoz7ujGrWCB4YpLYPuezsnU0k=
X-Received: by 2002:a92:c247:0:b0:430:cecb:9e77 with SMTP id
 e9e14a558f8ab-430cecb9f08mr125262605ab.27.1760934984713; Sun, 19 Oct 2025
 21:36:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250904095447.1885-1-cp0613@linux.alibaba.com>
In-Reply-To: <20250904095447.1885-1-cp0613@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Oct 2025 10:06:13 +0530
X-Gm-Features: AS18NWB4rYX16mHVbjSKrq9nwZ_OphoIA3Gzm9Tx6i-1Q8So1YP3ufi92WBWZMs
Message-ID: <CAAhSdy11QzCn2h6uqPKsiK39Gd0GpM=ipBt1GtJubCJBtCDu6A@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Flush cache entries after writing PMP CSRs
To: cp0613@linux.alibaba.com
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_053627_949497_F57ED790 
X-CRM114-Status: GOOD (  26.22  )
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

T24gVGh1LCBTZXAgNCwgMjAyNSBhdCA0OjI24oCvUE0gPGNwMDYxM0BsaW51eC5hbGliYWJhLmNv
bT4gd3JvdGU6Cj4KPiBGcm9tOiBDaGVuIFBlaSA8Y3AwNjEzQGxpbnV4LmFsaWJhYmEuY29tPgo+
Cj4gQXMgdGhlIHByaXZpbGVnZWQgc3BlY2lmaWNhdGlvbiBzdGF0ZXMsIGFmdGVyIHdyaXRpbmcg
dG8gdGhlIFBNUCBDU1JzLAo+IGEgU0ZFTkNFLlZNQSBvciBIRkVOQ0UuR1ZNQSBpbnN0cnVjdGlv
biBzaG91bGQgYmUgZXhlY3V0ZWQgd2l0aCByczE9eDAKPiBhbmQgcnMyPXgwIHRvIGZsdXNoIGFs
bCBhZGRyZXNzIHRyYW5zbGF0aW9uIGNhY2hlIGVudHJpZXMuCj4KPiBUaGUgb3JpZ2luYWwgaW1w
bGVtZW50YXRpb24gZG9lcyBub3QgY292ZXIgYWxsIHBvc3NpYmxlIGNhc2VzLiBGb3IKPiBleGFt
cGxlLCB0aGUgc2JpX2hhcnRfbWFwX3NhZGRyIGZ1bmN0aW9uIGNhbGxzIHBtcF9zZXQgYnV0IGRv
ZXMgbm90Cj4gZXhlY3V0ZSB0aGUgU0ZFTkNFLlZNQSBpbnN0cnVjdGlvbi4gVGhpcyBwYXRjaCBj
b3ZlcnMgc2JpX2hhcnRfbWFwX3NhZGRyCj4gYW5kIHNiaV9oYXJ0X3VubWFwX3NhZGRyLCBlbnN1
cmluZyB0aGF0IGRidHIsIHNzZSBhbmQgb3RoZXIgbW9kdWxlcyBjYW4KPiBzYWZlbHkgdXBkYXRl
IHBtcGNmZy4KClRoZSB0ZW1wb3JhcnkgbWFwcGluZyBjcmVhdGVkIHVzaW5nIHNiaV9oYXJ0X21h
cC91bm1hcF9zYWRkcigpIGlzCm9ubHkgYWNjZXNzZWQgYnkgTS1tb2RlIGFuZCBkb2VzIG5vdCBp
bXBhY3QgdGhlIFMtbW9kZSBUTEIKZW50cmllcyBpbiBhbnl3YXkuCgpGdXJ0aGVyLCBmbHVzaGlu
ZyBUTEIgZW50cmllcyBpbiBzYmlfaGFydF9tYXAvdW5tYXBfc2FkZHIoKSBhbHNvCnNsb3dzLWRv
d24gbWFueSBTQkkgY2FsbHMgd2hpY2ggdXNlIHNoYXJlZCBtZW1vcnkuCgpOQUNLIHRvIHRoaXMg
cGF0Y2guCgpSZWdhcmRzLApBbnVwCgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYx
M0BsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KPiAgbGliL3NiaS9zYmlfaGFydC5jIHwgNTQgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggNmEyZDdkNi4u
MzNiYmEzOCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2Jp
L3NiaV9oYXJ0LmMKPiBAQCAtMzY0LDYgKzM2NCwzMCBAQCBzdGF0aWMgdW5zaWduZWQgaW50IHNi
aV9oYXJ0X2dldF9zbWVwbXBfZmxhZ3Moc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLAo+ICAg
ICAgICAgcmV0dXJuIHBtcF9mbGFnczsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIHBtcF9mbHVzaCh2
b2lkKQo+ICt7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogQXMgcGVyIHNlY3Rpb24gMy43LjIg
b2YgcHJpdmlsZWdlZCBzcGVjaWZpY2F0aW9uIHYxLjEyLAo+ICsgICAgICAgICogdmlydHVhbCBh
ZGRyZXNzIHRyYW5zbGF0aW9ucyBjYW4gYmUgc3BlY3VsYXRpdmVseSBwZXJmb3JtZWQKPiArICAg
ICAgICAqIChldmVuIGJlZm9yZSBhY3R1YWwgYWNjZXNzKS4gVGhlc2UsIGFsb25nIHdpdGggUE1Q
IHRyYXNsYXRpb25zLAo+ICsgICAgICAgICogY2FuIGJlIGNhY2hlZC4gVGhpcyBjYW4gcG9zZSBh
IHByb2JsZW0gd2l0aCBDUFUgaG90cGx1Zwo+ICsgICAgICAgICogYW5kIG5vbi1yZXRlbnRpdmUg
c3VzcGVuZCBzY2VuYXJpbyBiZWNhdXNlIFBNUCBzdGF0ZXMgYXJlCj4gKyAgICAgICAgKiBub3Qg
cHJlc2VydmVkLgo+ICsgICAgICAgICogSXQgaXMgYWR2aXNhYmxlIHRvIGZsdXNoIHRoZSBjYWNo
aW5nIHN0cnVjdHVyZXMgdW5kZXIgc3VjaAo+ICsgICAgICAgICogY29uZGl0aW9ucy4KPiArICAg
ICAgICAqLwo+ICsgICAgICAgaWYgKG1pc2FfZXh0ZW5zaW9uKCdTJykpIHsKPiArICAgICAgICAg
ICAgICAgX19hc21fXyBfX3ZvbGF0aWxlX18oInNmZW5jZS52bWEiKTsKPiArCj4gKyAgICAgICAg
ICAgICAgIC8qCj4gKyAgICAgICAgICAgICAgICAqIElmIGh5cGVydmlzb3IgbW9kZSBpcyBzdXBw
b3J0ZWQsIGZsdXNoIGNhY2hpbmcKPiArICAgICAgICAgICAgICAgICogc3RydWN0dXJlcyBpbiBn
dWVzdCBtb2RlIHRvby4KPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlm
IChtaXNhX2V4dGVuc2lvbignSCcpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIF9fc2JpX2hm
ZW5jZV9ndm1hX2FsbCgpOwo+ICsgICAgICAgfQo+ICt9Cj4gKwo+ICBzdGF0aWMgdm9pZCBzYmlf
aGFydF9zbWVwbXBfc2V0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpkb20sCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZywK
PiBAQCAtNTQzLDE4ICs1NjcsMjUgQEAgaW50IHNiaV9oYXJ0X21hcF9zYWRkcih1bnNpZ25lZCBs
b25nIGFkZHIsIHVuc2lnbmVkIGxvbmcgc2l6ZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHBtcF9mbGFncywgYmFzZSwgb3JkZXIpOwo+ICAgICAgICAgcG1wX3NldChTQklfU01FUE1Q
X1JFU1ZfRU5UUlksIHBtcF9mbGFncywgYmFzZSwgb3JkZXIpOwo+Cj4gKyAgICAgICBwbXBfZmx1
c2goKTsKPiArCj4gICAgICAgICByZXR1cm4gU0JJX09LOwo+ICB9Cj4KPiAgaW50IHNiaV9oYXJ0
X3VubWFwX3NhZGRyKHZvaWQpCj4gIHsKPiArICAgICAgIGludCByYzsKPiAgICAgICAgIHN0cnVj
dCBzYmlfc2NyYXRjaCAqc2NyYXRjaCA9IHNiaV9zY3JhdGNoX3RoaXNoYXJ0X3B0cigpOwo+Cj4g
ICAgICAgICBpZiAoIXNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhU
X1NNRVBNUCkpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfT0s7Cj4KPiAgICAgICAgIHNi
aV9wbGF0Zm9ybV9wbXBfZGlzYWJsZShzYmlfcGxhdGZvcm1fcHRyKHNjcmF0Y2gpLCBTQklfU01F
UE1QX1JFU1ZfRU5UUlkpOwo+IC0gICAgICAgcmV0dXJuIHBtcF9kaXNhYmxlKFNCSV9TTUVQTVBf
UkVTVl9FTlRSWSk7Cj4gKyAgICAgICByYyA9IHBtcF9kaXNhYmxlKFNCSV9TTUVQTVBfUkVTVl9F
TlRSWSk7Cj4gKwo+ICsgICAgICAgcG1wX2ZsdXNoKCk7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHJj
Owo+ICB9Cj4KPiAgaW50IHNiaV9oYXJ0X3BtcF9jb25maWd1cmUoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKQo+IEBAIC01NzgsMjYgKzYwOSw3IEBAIGludCBzYmlfaGFydF9wbXBfY29uZmln
dXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgICAgICAgICAgICAgICAgcmMgPSBz
YmlfaGFydF9vbGRwbXBfY29uZmlndXJlKHNjcmF0Y2gsIHBtcF9jb3VudCwKPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbXBfbG9nMmdyYW4sIHBtcF9h
ZGRyX21heCk7Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBBcyBwZXIgc2VjdGlvbiAzLjcu
MiBvZiBwcml2aWxlZ2VkIHNwZWNpZmljYXRpb24gdjEuMTIsCj4gLSAgICAgICAgKiB2aXJ0dWFs
IGFkZHJlc3MgdHJhbnNsYXRpb25zIGNhbiBiZSBzcGVjdWxhdGl2ZWx5IHBlcmZvcm1lZAo+IC0g
ICAgICAgICogKGV2ZW4gYmVmb3JlIGFjdHVhbCBhY2Nlc3MpLiBUaGVzZSwgYWxvbmcgd2l0aCBQ
TVAgdHJhc2xhdGlvbnMsCj4gLSAgICAgICAgKiBjYW4gYmUgY2FjaGVkLiBUaGlzIGNhbiBwb3Nl
IGEgcHJvYmxlbSB3aXRoIENQVSBob3RwbHVnCj4gLSAgICAgICAgKiBhbmQgbm9uLXJldGVudGl2
ZSBzdXNwZW5kIHNjZW5hcmlvIGJlY2F1c2UgUE1QIHN0YXRlcyBhcmUKPiAtICAgICAgICAqIG5v
dCBwcmVzZXJ2ZWQuCj4gLSAgICAgICAgKiBJdCBpcyBhZHZpc2FibGUgdG8gZmx1c2ggdGhlIGNh
Y2hpbmcgc3RydWN0dXJlcyB1bmRlciBzdWNoCj4gLSAgICAgICAgKiBjb25kaXRpb25zLgo+IC0g
ICAgICAgICovCj4gLSAgICAgICBpZiAobWlzYV9leHRlbnNpb24oJ1MnKSkgewo+IC0gICAgICAg
ICAgICAgICBfX2FzbV9fIF9fdm9sYXRpbGVfXygic2ZlbmNlLnZtYSIpOwo+IC0KPiAtICAgICAg
ICAgICAgICAgLyoKPiAtICAgICAgICAgICAgICAgICogSWYgaHlwZXJ2aXNvciBtb2RlIGlzIHN1
cHBvcnRlZCwgZmx1c2ggY2FjaGluZwo+IC0gICAgICAgICAgICAgICAgKiBzdHJ1Y3R1cmVzIGlu
IGd1ZXN0IG1vZGUgdG9vLgo+IC0gICAgICAgICAgICAgICAgKi8KPiAtICAgICAgICAgICAgICAg
aWYgKG1pc2FfZXh0ZW5zaW9uKCdIJykpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgX19zYmlf
aGZlbmNlX2d2bWFfYWxsKCk7Cj4gLSAgICAgICB9Cj4gKyAgICAgICBwbXBfZmx1c2goKTsKPgo+
ICAgICAgICAgcmV0dXJuIHJjOwo+ICB9Cj4gLS0KPiAyLjQ5LjAKPgo+Cj4gLS0KPiBvcGVuc2Jp
IG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFp
bGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
