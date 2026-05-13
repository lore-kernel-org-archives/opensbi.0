Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD77CD4851
	for <opensbi@archiver.kernel.org>; Wed, 13 May 2026 08:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o2VkQ71z1JeMGjW+Z/SSIKo8XNy9DSLKuTADkhw/474=; b=hluUMmqJefaN5y
	7vVcpo1m+BIIt/RBeoECi/4NxEcPKegu4FZkWljFitMNjKo1sooOA0XK6ZnwGe3riUdzjj2w1hWEm
	cdOGGJwkimP23Daw4uv4TdYr4rfSEoE/0Vc8Nup56UZSGGnaGv08vgH/JLwlkdN8lf6xOlxr4i/cr
	DNdwKuc7WluTa+f4cmQpTuOKuX/tLYNKqieFNW29H4qU8W29bVai5QweqlPYsybUk2YxmT95Bj1xR
	7nzusErez2l2RDSDiuw6ssRzEeZkQISO5a3Rll+sgvQRXrIRMfLQdcAC8lpRpcs9GIazFi9JIVp5S
	5MrftH7Xo9by8pPnoppQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4YQ-00000001fer-2mbM;
	Wed, 13 May 2026 08:02:54 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4YP-00000001feR-2YYw
	for opensbi@bombadil.infradead.org;
	Wed, 13 May 2026 08:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=8Jh8oZCMyB8z3Rzgf5a9xmi8834zDpclRRY+vnDHir4=; b=ofN/5kp1hoti7lQ1FzlOKSWti3
	v11QjyUAcbMDV0OqDLmBltcO5Gb20x1c8ot8anYSHW+sw7DFOR8mHKeRyVKO+ocKo6FWzaJ5/Xlix
	OhzyS9aSLD04r6Mdrn6NS3KjwJX6Ds4xuIpi5lbVbxGI/PfIYqKNkMHzKy4xkL1GqPq9pp0Rj8Mu1
	wlovIC1p8fscJMSK4SrJ5daX4pn63d5P0Ia70LI++aVbP8QVUebn79/VYDfpUxtok/bOnO7yyV74G
	jc27gc3rFJVZI1AwW++Y/A1xqeDgAJyy32yTUypECajtFXOOz2b99t+RNSLWpJ5Zi2JW/j3zZpHlb
	QiLaNRZw==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4YL-0000000BH56-2JYh
	for opensbi@lists.infradead.org;
	Wed, 13 May 2026 08:02:52 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-bd394f4a931so134695866b.2
        for <opensbi@lists.infradead.org>; Wed, 13 May 2026 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778659367; x=1779264167; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Jh8oZCMyB8z3Rzgf5a9xmi8834zDpclRRY+vnDHir4=;
        b=SLSmyjS9Zx9Fou2ZHFdYlhStvowaRjLG588YNhnlXQeZlJAahX7nOcjPzd4DybaoOM
         IzC8CAz6zT8UVcUjPQFMOV55feNJTXQ2Ca214juupjUq2eI5WgqHk2P+8j6b50/EOyWj
         Sz/A73fgCAwfJ4q6y7jQt+6N7kUwgPL+xL2pIE3U1E1bk9+4Tvp30haK1yGqmjbreCrI
         0wv/ApDRifh8jXxIfoAXM247jR5Ffd5PlLn93XQh/Na/A4xosEnIovo3C6d+SDWpb+pz
         6nsVZpK92Pf+zNpscce+SRdnu4oqomYpQkk2QxhHtSu4RdowFVTjE9JSrCSOJYqijkxa
         XGqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778659367; x=1779264167;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Jh8oZCMyB8z3Rzgf5a9xmi8834zDpclRRY+vnDHir4=;
        b=eWmhn6KXlvZDUHTsk2gr4R5BY5yuVNGNrgTXyO7ILuIMH3WCSjJs2BZ6l+fjvJQp6H
         PwV8DUnCLYP/7ZbiCqANLKnGlzZxGhpfX3kXZu8E6RBMdQZ/jFS0e6pOuRdT9+laa6gJ
         liIsdHbNp4T9wmwcFG55rFD+mg6Tcl+JtHA8hKN54TwMLHutYwu61kz9K+iTFjtXifyw
         xDPQL5gKq+EMfgON332G1nzOGjFwkcD7qhouOFBfA3AyerLeZ8AsE4e3gwVPJQiV1Pvf
         tdBIx/dZJ3d0ww5pY4ufGxWX3JEMb+8pOylooJNId7+tCiMvrVe3Gk9M95cUzB892ajA
         2kWg==
X-Forwarded-Encrypted: i=1; AFNElJ8/3qEuVTp+a+c+DmrZIPNS9JVWPDpx8rbzEZohTGhtoRCpmUhD9zspm8FVz0wGX16iAc3/QOBD@lists.infradead.org
X-Gm-Message-State: AOJu0YzKczIWB/EiuyFa/vBU2bWZMf+N7T0V0jtUXB41dVxq2WhDgrE6
	Hs5aaYYqbwJg/8KuPeu51jPcHTFuddGLb45M9+tsUK12z9oqBH2qZzQgCE/FyQrjTps=
X-Gm-Gg: Acq92OGkkq1yu+tuRkG/BrcS1SnAIHxwzNUbYmk9fwHolSwqTK6yXf/Ct4WbR4RjDBR
	xJQyvQTpLCUIw1P80CrHdl37CeodPXai5vXhAJp24NyW2rqaeQK/9FXHR4xz2DDZ2CwkuSdDCKP
	Z0NIr/BDJ9+brl0dEPNKAJ94Ht9CZSKLGg2JyKIbiI7p9kIxzcf9xVJJjsGap8EkfnKcnYzrOD2
	8OVADkKLRUOydHkeFhYEl0z3gkv8Ljaf3LCLifC0eXr7YrtPnJysu0c7+cdS5Hf2bJ62GZghPRG
	ta0R74g4kXottz5jnUwtCmz0Ji5BH2fUVqYWCyUImqFEK3rlwnrk1ZrRtG6cD1fbsbbfbUrOpxp
	dSlpTrhB6OUYpN6SJSckL8fyXc5qcHbnwSpp8ALisb6vnk2uSswactTREJYGXOisqLAdaLvMQgG
	Xr/BjilriYRqMXJ70by+eYh+5Ubz8oAghLltEfbaJUSi05x/uIApPiQgUvrQcnEg==
X-Received: by 2002:a17:907:9802:b0:bd0:4f6e:9b2f with SMTP id a640c23a62f3a-bd3bf197d33mr134568366b.1.1778659367225;
        Wed, 13 May 2026 01:02:47 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-454922715b9sm41091734f8f.36.2026.05.13.01.02.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 01:02:46 -0700 (PDT)
Message-ID: <d2e4f322-a5ed-4422-9420-226d901bde92@riscstar.com>
Date: Wed, 13 May 2026 09:02:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] lib: sbi: domain FP/Vector context support for
 context switch
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
 Anup Patel <anuppate@qti.qualcomm.com>, Scott Bambrough
 <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Dhaval <dhaval@rivosinc.com>,
 Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
References: <20260513071418.50957-1-dave.patel@riscstar.com>
 <20260513071418.50957-4-dave.patel@riscstar.com>
 <CAAhSdy10mKDQHczcHz-7JGaiYHVL=LOzOi+_=G=XNJhuX2y1Rg@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy10mKDQHczcHz-7JGaiYHVL=LOzOi+_=G=XNJhuX2y1Rg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_090249_946345_7ECE4E70 
X-CRM114-Status: GOOD (  18.77  )
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

T24gNS8xMy8yNiAwODo1NywgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBXZWQsIE1heSAxMywgMjAy
NiBhdCAxMjo0NOKAr1BNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4+Cj4+IEZy
b206IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgo+Pgo+PiBUaGlzIHBhdGNo
IGFkZHMgcHJvcGVyIHN1cHBvcnQgZm9yIHBlci1kb21haW4gZmxvYXRpbmctcG9pbnQgKEZQKSBh
bmQKPj4gdmVjdG9yIChWKSBjb250ZXh0cyBpbiB0aGUgZG9tYWluIGNvbnRleHQgc3dpdGNoIGxv
Z2ljLiBFYWNoIGRvbWFpbgo+PiBub3cgbWFpbnRhaW5zIGl0cyBvd24gRlAgYW5kIHZlY3RvciBz
dGF0ZSwgd2hpY2ggaXMgc2F2ZWQgYW5kIHJlc3RvcmVkCj4+IGR1cmluZyBkb21haW4gc3dpdGNo
ZXMuCj4+Cj4+IENoYW5nZXMgaW5jbHVkZToKPj4KPj4gLSBBZGRlZCBgZnBfY3R4YCBhbmQgYHZl
Y19jdHhgIG1lbWJlcnMgdG8gYHN0cnVjdCBoYXJ0X2NvbnRleHRgLgo+PiAtIEludHJvZHVjZWQg
ZHluYW1pYyB2ZWN0b3Igc3RydWN0IGFsbG9jYXRpb24gZm9yIHZsZW5iIGluICdzdHJ1Y3QgaGFy
dF9jb250ZXh0Jwo+PiAgIHRvIGFsbG9jYXRlIGFuZCBmcmVlIHBlci1kb21haW4gRlAgYW5kIHZl
Y3RvciBjb250ZXh0Lgo+PiAtIE1vZGlmaWVkIGBzYmlfZG9tYWluX3JlZ2lzdGVyKClgIHRvIGlu
aXRpYWxpemUgRlAvVmVjdG9yIGNvbnRleHQgcGVyIGRvbWFpbi4KPj4gLSBVcGRhdGVkIGBzd2l0
Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dCgpYCB0byBzYXZlL3Jlc3RvcmUgRlAgYW5kIHZlY3Rv
cgo+PiAgIGNvbnRleHRzIHNhZmVseToKPj4gICAgIC0gRW5zdXJlcyBGUy9WUyBmaWVsZHMgaW4g
YG1zdGF0dXNgIGFyZSBlbmFibGVkIChzZXQgdG8gSW5pdGlhbCkgb25seSBpZiBPZmYuCj4+IC0g
QWRkZWQgcnVudGltZSBjaGVja3MgZm9yIEZQIGFuZCB2ZWN0b3IgZXh0ZW5zaW9ucyB3aGVyZSBu
ZWVkZWQuCj4+Cj4+IFRoaXMgaW1wcm92ZXMgc3VwcG9ydCBmb3IgbXVsdGktZG9tYWluIHN5c3Rl
bXMgd2l0aCBGUCBhbmQgVmVjdG9yCj4+IGV4dGVuc2lvbnMsIGFuZCBwcmV2ZW50cyBjb3JydXB0
aW9uIG9mIEZQL1ZlY3RvciBzdGF0ZSBkdXJpbmcgZG9tYWluCj4+IHN3aXRjaGVzLgo+Pgo+PiBT
aWduZWQtb2ZmLWJ5OiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPj4gLS0t
Cj4+ICBpbmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAgIHwgIDIgKysKPj4gIGxpYi9zYmkvc2Jp
X2RvbWFpbl9jb250ZXh0LmMgfCAyOCArKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAy
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc2JpL3NiaV9kb21haW4uaCBiL2luY2x1ZGUvc2JpL3NiaV9kb21haW4uaAo+PiBpbmRleCA4
ODJiNjJjMi4uMDVhNWQ4NmMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9kb21haW4u
aAo+PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZG9tYWluLmgKPj4gQEAgLTE2LDYgKzE2LDggQEAK
Pj4gICNpbmNsdWRlIDxzYmkvc2JpX2hhcnRtYXNrLmg+Cj4+ICAjaW5jbHVkZSA8c2JpL3NiaV9k
b21haW5fY29udGV4dC5oPgo+PiAgI2luY2x1ZGUgPHNiaS9zYmlfZG9tYWluX2RhdGEuaD4KPj4g
KyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+PiArI2luY2x1ZGUgPHNiaS9zYmlfZnAuaD4K
Pj4KPj4gIHN0cnVjdCBzYmlfc2NyYXRjaDsKPj4KPj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2RvbWFpbl9jb250ZXh0LmMgYi9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4+IGluZGV4
IDE1OGY0OTkwLi41ZTE4MDY5OCAxMDA2NDQKPj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWluX2Nv
bnRleHQuYwo+PiArKysgYi9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jCj4+IEBAIC0xOCw2
ICsxOCw5IEBACj4+ICAjaW5jbHVkZSA8c2JpL3NiaV9kb21haW5fY29udGV4dC5oPgo+PiAgI2lu
Y2x1ZGUgPHNiaS9zYmlfcGxhdGZvcm0uaD4KPj4gICNpbmNsdWRlIDxzYmkvc2JpX3RyYXAuaD4K
Pj4gKyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+PiArI2luY2x1ZGUgPHNiaS9zYmlfZnAu
aD4KPj4gKwo+Pgo+PiAgLyoqIENvbnRleHQgcmVwcmVzZW50YXRpb24gZm9yIGEgaGFydCB3aXRo
aW4gYSBkb21haW4gKi8KPj4gIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+PiBAQCAtNTUsNiArNTgs
MTEgQEAgc3RydWN0IGhhcnRfY29udGV4dCB7Cj4+ICAgICAgICAgc3RydWN0IGhhcnRfY29udGV4
dCAqcHJldl9jdHg7Cj4+ICAgICAgICAgLyoqIElzIGNvbnRleHQgaW5pdGlhbGl6ZWQgYW5kIHJ1
bm5hYmxlICovCj4+ICAgICAgICAgYm9vbCBpbml0aWFsaXplZDsKPj4gKwo+PiArICAgICAgIC8q
KiBmbG9hdCBjb250ZXh0IHN0YXRlICovCj4+ICsgICAgICAgc3RydWN0IHNiaV9mcF9jb250ZXh0
IGZwX2N0eDsKPj4gKyAgICAgICAvKiogdmVjdG9yIGNvbnRleHQgc3RhdGUgKi8KPj4gKyAgICAg
ICBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICp2ZWNfY3R4Owo+PiAgfTsKPj4KPj4gIHN0YXRp
YyBzdHJ1Y3Qgc2JpX2RvbWFpbl9kYXRhIGRjcHJpdjsKPj4gQEAgLTE0Myw2ICsxNTEsMTUgQEAg
c3RhdGljIGludCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1Y3QgaGFydF9jb250
ZXh0ICpjdHgsCj4+ICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwg
U0JJX0hBUlRfRVhUX1NTUU9TSUQpKQo+PiAgICAgICAgICAgICAgICAgY3R4LT5zcm1jZmcgICAg
ID0gY3NyX3N3YXAoQ1NSX1NSTUNGRywgZG9tX2N0eC0+c3JtY2ZnKTsKPj4KPj4gKyAgICAgICAv
KiBNYWtlIHN1cmUgRlMgYW5kIFZTIGlzIG9uIGJlZm9yZSBjb250ZXh0IHN3aXRjaCAqLwo+PiAr
ICAgICAgIGNzcl9zZXQoQ1NSX01TVEFUVVMsIE1TVEFUVVNfRlMgfCBNU1RBVFVTX1ZTKTsKPj4g
Kwo+PiArICAgICAgIC8qIEVhZ2VyIGNvbnRleHQgc3dpdGNoIEYgYW5kIFYgKi8KPj4gKyAgICAg
ICBzYmlfZnBfc2F2ZSgmY3R4LT5mcF9jdHgpOwo+PiArICAgICAgIHNiaV9mcF9yZXN0b3JlKCZk
b21fY3R4LT5mcF9jdHgpOwo+PiArICAgICAgIHNiaV92ZWN0b3Jfc2F2ZShjdHgtPnZlY19jdHgp
Owo+PiArICAgICAgIHNiaV92ZWN0b3JfcmVzdG9yZShkb21fY3R4LT52ZWNfY3R4KTsKPj4gKwo+
PiAgICAgICAgIC8qIFNhdmUgY3VycmVudCB0cmFwIHN0YXRlIGFuZCByZXN0b3JlIHRhcmdldCBk
b21haW4ncyB0cmFwIHN0YXRlICovCj4+ICAgICAgICAgdHJhcF9jdHggPSBzYmlfdHJhcF9nZXRf
Y29udGV4dChzY3JhdGNoKTsKPj4gICAgICAgICBzYmlfbWVtY3B5KCZjdHgtPnRyYXBfY3R4LCB0
cmFwX2N0eCwgc2l6ZW9mKCp0cmFwX2N0eCkpOwo+PiBAQCAtMTcwLDYgKzE4NywxMCBAQCBzdGF0
aWMgaW50IGhhcnRfY29udGV4dF9pbml0KHUzMiBoYXJ0aW5kZXgpCj4+ICB7Cj4+ICAgICAgICAg
c3RydWN0IGhhcnRfY29udGV4dCAqY3R4Owo+PiAgICAgICAgIHN0cnVjdCBzYmlfZG9tYWluICpk
b207Cj4+ICsgICAgICAgdW5zaWduZWQgbG9uZyB2bGVuYiA9IHZlY3Rvcl92bGVuYigpOwo+PiAr
Cj4+ICsgICAgICAgLyogQ2FsY3VsYXRlIHNpemU6IGJhc2Ugc3RydWN0ICsgMzIgcmVnaXN0ZXJz
IG9mIHZsZW5iIHNpemUgKi8KPj4gKyAgICAgICBzaXplX3QgdmVjX3NpemUgPSBzaXplb2Yoc3Ry
dWN0IHNiaV92ZWN0b3JfY29udGV4dCkgKyAoMzIgKiB2bGVuYik7Cj4gCj4gQ2FsbCB2ZWN0b3Jf
dmxlbmIoKSBhbmQgYWxsb2NhdGUgdmVjX2N0eCBvbmx5IHdoZW4KPiB1bmRlcmx5aW5nIEhBUlQg
aGFzIFNCSV9IQVJUX0VYVF9WLgoKb2sgc2hhbGwgYWRkIHRoaXMgY2hhbmdlLgo+IAo+Pgo+PiAg
ICAgICAgIHNiaV9kb21haW5fZm9yX2VhY2goZG9tKSB7Cj4+ICAgICAgICAgICAgICAgICBpZiAo
IXNiaV9oYXJ0bWFza190ZXN0X2hhcnRpbmRleChoYXJ0aW5kZXgsCj4+IEBAIC0xODAsNiArMjAx
LDEzIEBAIHN0YXRpYyBpbnQgaGFydF9jb250ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPj4gICAg
ICAgICAgICAgICAgIGlmICghY3R4KQo+PiAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VOT01FTTsKPj4KPj4gKyAgICAgICAgICAgICAgIC8qIEFsbG9jYXRlIHRoZSB2ZWN0b3Ig
Y29udGV4dCBwb2ludGVyICovCj4+ICsgICAgICAgICAgICAgICBjdHgtPnZlY19jdHggPSBzYmlf
emFsbG9jKHZlY19zaXplKTsKPj4gKyAgICAgICAgICAgICAgIGlmICghY3R4LT52ZWNfY3R4KSB7
Cj4+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9mcmVlKGN0eCk7Cj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJldHVybiBTQklfRU5PTUVNOwo+PiArICAgICAgICAgICAgICAgfQo+PiAr
Cj4+ICAgICAgICAgICAgICAgICAvKiBCaW5kIGNvbnRleHQgYW5kIGRvbWFpbiAqLwo+PiAgICAg
ICAgICAgICAgICAgY3R4LT5kb20gPSBkb207Cj4+ICAgICAgICAgICAgICAgICBoYXJ0X2NvbnRl
eHRfc2V0KGRvbSwgaGFydGluZGV4LCBjdHgpOwo+PiAtLQo+PiAyLjQzLjAKPj4KPj4KPj4gLS0K
Pj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4+
IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo+IAo+
IFJlZ2FyZHMsCj4gQW51cAoKVGhhbmtzIEFudXAsIHdpbGwgbWFrZSB0aGlzIGNoYW5nZQoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
