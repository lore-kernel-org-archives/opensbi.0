Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C85FC2D0CD
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 13:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9obQjR0nBaKpCczOn2P4Af1MkPasVLFMkSp3oVBnw8=; b=gP0tecTpYGcrtm
	/j1rtNRzUUXL2L1OMjZ3KRCjusSBg0b04efkMwyPiWk2ybMeCtvfd3V2ojosa/H7cVkCbd6EZyHlB
	v20u6xVVvjr+YJlfExb76efuBx4sZHBBkD1JQDGuGTNAGBWlCnn9N59GgQEJ1YCgWdC1mt/1g1D+J
	EpI15i6t7T5ZU18s+pE4QhgkXe/fR5B7EkGC90ujfRAQA90xZwc1ubIqdSLjumjVjDGz7o9Xx+M3g
	gUuxSWoZHnQdgnghZi/UFDY9htV0HO04h4OQlzlgIh6s59hlscXOjz+8YXLjzMWlRmulfb9UfNYoq
	W2gK0rUtWhxtlRRIsuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYVU-00000000i03-3C0x;
	Thu, 15 May 2025 13:20:16 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYOx-00000000gtk-1NEi
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 13:13:32 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d812103686so3033455ab.0
        for <opensbi@lists.infradead.org>; Thu, 15 May 2025 06:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747314810; x=1747919610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cTHSYe+1pVYg4r/O0EHM91XP3hdDqjr0oBcskoZRWdI=;
        b=lKwSIAnzRAmsCRmUGVi/Swyk69Ub1eI4XmjwBNIuGQPMMvK75XrKb9lgfNOfLN55wu
         FrEp+ovXBgjHDo9SiFAEKUswCXtJO08tG3z0KO+n2Jc1D2Yj+A677cDwpkmlK0e4IorQ
         3HE5AAfK6q6rIjeIceKzvJEoN6DrMmrCjZedYD5HCzYN3TDAzqLJTzhcMBcx1zEMTNs2
         Bb66e/IbZsL0d3JM2dpa+cXj2iVasUJ02LBIDV2cWmBNXod73w5M7o1wrOhzOuRtuOAg
         fAk4bRuc0IyBNYFdYVBwtVulCZaDdyZlYQC7vDaZGyqZP314fxLSiK0MfePvfgt8uRSQ
         zlLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747314810; x=1747919610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cTHSYe+1pVYg4r/O0EHM91XP3hdDqjr0oBcskoZRWdI=;
        b=W+4TEcXDhsbyD+xxmRusWZYLnyDK57k4w8q3H2RCMIyHvYeWR0wOGLzFwdlXuIg8RS
         IanTdFBTQpr3zr4zLqWpqgy7lCDZR1bRDH8floxqOfb++VCT6jDsZOUMjZtByeHaYhTA
         fXCuNbFfE9tsFAQErpb+6yEZWmZxW09pDspdxTjWKIY/4RANkrp+bSmS84sZ1MA7i3Y9
         6dZV8R7s5ofzPGBpeBYwAl6HveJ/Axlw8jyeob24Ccjt3XnRJ5xgJX6S2mPayLmNc26j
         AzYJcO/7kXW6FI8dWMvZWkdByPt2oG0n6cnOz9weAVAOUhnhpWF61pXD9gw/VVL5quyG
         JmcQ==
X-Gm-Message-State: AOJu0YzKs4dKVGeSReYWUmRUvWdFyTiSy5+2/zHNCzUEKP6FaHPKUqFc
	atVMWbdsMxuDd7OpNnrVvWNrCa65ZZknN2iMm3lD2sF1lVbIahCNJc2XzEBRq9TmRVyI75uPB9w
	PkP20SGRS5i+Y/S8EC3Ihv2Etud5KCgT5xxeNhUpKyuN9+SuoCWru
X-Gm-Gg: ASbGnctb2Up//Y/xUsFDHDJXl+GX55/KRRUbQ8oei1yHz+4uacDmHc7Mrr3GQi626aF
	fcwf9ZUfqk88IDMcJOOLGWBUcxg/6Si+NSCq0wASC5kaAOMlExP7vaG/+2AIS6lU0hjyoNQ/F8m
	avdvDlSSxj28maGRAJ7vYbUo307oGwWw56xA==
X-Google-Smtp-Source: AGHT+IEc0wDz6qAuq6OdNZtxNHA9/cfc1vUeO1rq3//LXQfmqTUwqXGCImHnXNO4anijG7EI/2wb72IGIcdErA8D6x0=
X-Received: by 2002:a05:6e02:d0f:b0:3d8:122f:9f07 with SMTP id
 e9e14a558f8ab-3db77925d81mr34304845ab.10.1747314810027; Thu, 15 May 2025
 06:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250418064506.15771-1-nick.hu@sifive.com>
In-Reply-To: <20250418064506.15771-1-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 18:43:19 +0530
X-Gm-Features: AX0GCFtWMSr06ZK-TAMNR3-rZzs81FEHU8bAH5DvKLG-nZpWi-NdjwEvYsMsbtQ
Message-ID: <CAAhSdy0Z8FXFb-rbR329UCQHQSr2N1uOLKscUUEgpN5Pwh9G2g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Use hsm stop for hsm wait
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_061331_491423_325C0CE7 
X-CRM114-Status: GOOD (  22.31  )
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

T24gRnJpLCBBcHIgMTgsIDIwMjUgYXQgMTI6MzXigK9QTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gSWYgd2UgaG90cGx1ZyBhIGNvcmUgYW5kIHRoZW4gcGVyZm9ybSBh
IHN1c3BlbmQtdG8tUkFNIG9wZXJhdGlvbiBvbiBhCj4gbXVsdGktY29yZSBwbGF0Zm9ybSwgdGhl
IGhvdHBsdWdnZWQgQ1BVIG1heSBiZSB3b2tlbiB1cCBhbG9uZyB3aXRoIHRoZSByZXN0Cj4gb2Yg
dGhlIHN5c3RlbSwgcGFydGljdWxhcmx5IG9uIHBsYXRmb3JtcyB0aGF0IHdha2UgYWxsIGNvcmVz
IGZyb20gdGhlCj4gZGVlcGVzdCBzbGVlcCBzdGF0ZS4gV2hlbiB0aGlzIGhhcHBlbnMsIHRoZSBo
b3RwbHVnZ2VkIENQVSBlbnRlcnMgdGhlCj4gc2JpX2hzbV93YWl0IFdGSSB3YWl0IGxvb3AgaW5z
dGVhZCBvZiB0cmFuc2l0aW9uaW5nIGludG8gYQo+IHBsYXRmb3JtLXNwZWNpZmljIGxvdy1wb3dl
ciBzdGF0ZS4gVG8gYWRkcmVzcyB0aGlzLCB3ZSBhZGQgYSBIU00gc3RvcCBjYWxsCj4gd2l0aGlu
IHRoZSB3YWl0IGxvb3AuIFRoaXMgYWxsb3dzIHBsYXRmb3JtcyB0aGF0IHN1cHBvcnQgSFNNIHN0
b3AgdG8gZW50ZXIKPiBhIGxvdy1wb3dlciBzdGF0ZSB3aGVuIHRoZSBDUFUgaXMgdW5leHBlY3Rl
ZGx5IHdva2VuIHVwLgo+Cj4gU2lnbmVkLW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPgo+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZl
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtz
LApBbnVwCgoKPiAtLS0KPiAgbGliL3NiaS9zYmlfaHNtLmMgfCA5ICsrKysrKysrKwo+ICAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
aHNtLmMgYi9saWIvc2JpL3NiaV9oc20uYwo+IGluZGV4IGRmZTg0MDhkLi5lODEyOGEzOSAxMDA2
NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oc20uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hzbS5jCj4g
QEAgLTM3LDYgKzM3LDggQEAKPgo+ICBzdGF0aWMgY29uc3Qgc3RydWN0IHNiaV9oc21fZGV2aWNl
ICpoc21fZGV2ID0gTlVMTDsKPiAgc3RhdGljIHVuc2lnbmVkIGxvbmcgaGFydF9kYXRhX29mZnNl
dDsKPiArc3RhdGljIGJvb2wgaHNtX2RldmljZV9oYXNfaGFydF9ob3RwbHVnKHZvaWQpOwo+ICtz
dGF0aWMgaW50IGhzbV9kZXZpY2VfaGFydF9zdG9wKHZvaWQpOwo+Cj4gIC8qKiBQZXIgaGFydCBz
cGVjaWZpYyBkYXRhIHRvIG1hbmFnZSBzdGF0ZSB0cmFuc2l0aW9uICoqLwo+ICBzdHJ1Y3Qgc2Jp
X2hzbV9kYXRhIHsKPiBAQCAtMTcwLDYgKzE3MiwxMyBAQCBzdGF0aWMgdm9pZCBzYmlfaHNtX2hh
cnRfd2FpdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4KPiAgICAgICAgIC8qIFdhaXQg
Zm9yIHN0YXRlIHRyYW5zaXRpb24gcmVxdWVzdGVkIGJ5IHNiaV9oc21faGFydF9zdGFydCgpICov
Cj4gICAgICAgICB3aGlsZSAoYXRvbWljX3JlYWQoJmhkYXRhLT5zdGF0ZSkgIT0gU0JJX0hTTV9T
VEFURV9TVEFSVF9QRU5ESU5HKSB7Cj4gKyAgICAgICAgICAgICAgIC8qCj4gKyAgICAgICAgICAg
ICAgICAqIElmIHRoZSBoc21fZGV2IGlzIHJlYWR5IGFuZCBpdCBzdXBwb3J0IHRoZSBob3RwbHVn
LCB3ZSBjYW4KPiArICAgICAgICAgICAgICAgICogdXNlIHRoZSBoc20gc3RvcCBmb3IgbW9yZSBw
b3dlciBzYXZpbmcKPiArICAgICAgICAgICAgICAgICovCj4gKyAgICAgICAgICAgICAgIGlmICho
c21fZGV2aWNlX2hhc19oYXJ0X2hvdHBsdWcoKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBo
c21fZGV2aWNlX2hhcnRfc3RvcCgpOwo+ICsKPiAgICAgICAgICAgICAgICAgd2ZpKCk7Cj4gICAg
ICAgICB9Cj4KPiAtLQo+IDIuMTcuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4g
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
