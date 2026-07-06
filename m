Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCAD8C43458
	for <opensbi@archiver.kernel.org>; Mon,  6 Jul 2026 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q1RgNnmrqOHkXv90u0JjLHGVKktnvkUNzIUebUlD1DM=; b=yj8/TTaeiUqOMx
	b2FA1tQm90z+LnHypilzdLtiQPWu5TrXwZR4JYfkD+MsZwcdy3i+OLQ2FLaubAb9xi9/qbeSGWCSE
	L1uVMglDAYsbxH4tuJSPrtSXpKlieTXE35SaUDZBJaprBto8rsakrec/WRUPGXXRp9PksfEUcNT9t
	RfsAbgglHUAg8HLjcZIBXrGi8KIC157CT5WeweXrxeyLGNu3M+UtVl62ymeXOeN1C0YOgy9N7ZgNT
	ZoFyjat/k5njXAJJTSafXSYftHNQrk85ve45JYOe6Bz8587kePo/VSQb16hYyae5nstPGEFicR6cD
	fzs8DBdqo8/yZTN47HdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfq4-0000000C5bQ-2q3z;
	Mon, 06 Jul 2026 09:42:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfq1-0000000C5aa-49LG
	for opensbi@lists.infradead.org;
	Mon, 06 Jul 2026 09:42:07 +0000
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 29E603F174
	for <opensbi@lists.infradead.org>; Mon,  6 Jul 2026 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783330922;
	bh=uGIGvBELKX5rh+vRKxNIWW8OWOM7tCcDT1t25U04818=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=WPrImHNWjboyEcb9KbPwVgy8Dgbj7CI2wz8bqxlkbrgr0+pSkVnL0Wu8IwDf8dWk8
	 0KyInrCTOQ3mXbaNZgEMkukXB4FlRdoWfA+lHTP2TzzQD6TO7SM55I/HOL8UinSI6i
	 fU2Sqapdoi6Dj1Uzumzjo9BcEFj6qKTntrwK54CLaVeMrWr7ZVq+pFRyS3RAw5Zntd
	 owsfEyHmMZTGYQDMMDfR9ICfeZrxKlUen3VGQ6Ghfi4x2SqRcKX2zbNgiioCy7gmqy
	 RriGF5/5kgj3DjvaSyNgJ7jvm6W7K423o+rnN0pydXb7Tz5qtyOgOWhoY++dWuf/Hj
	 kyxvOPcqQl+vCQTFluDp3BgZX208Pj4gFiitzA1segtORogNCY7Ys3/amCxye2kAy8
	 B1Ddinrf+vdQdNv0PYtMySSXiqKrVrteRREQh8PiOMpQ9gtSy3np/x0m9ZkKSjnS/U
	 L4fnSqdOZmvQv8jXcIxCfEgv0Y+mTL/axQOXVTQ3x9G3dw0qizC1pgwELaYebvs9j9
	 3vvCu3kWMPMhuOViTeaLT8U5rlfzna3hN0lLRuNhXPq1Fr5Em8t42aP4zW4F6n0PIG
	 ugQnQVWpScS/tqfMpNtneFCuTaodgOAdLdfJgqLswo1XeX2oiHqSqnwXU5TyfIRppg
	 WKECgJptqqR9DLGNAw4qKXNs=
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-493c20d0468so33696405e9.1
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 02:42:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330922; x=1783935722;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGIGvBELKX5rh+vRKxNIWW8OWOM7tCcDT1t25U04818=;
        b=iXNmAOBIcPk7+XS1s3RlFSmJPgwnQAHYw9+ioxWsSA1kBnE8Nsx9pw9ZOiFX47JDRM
         tw7h+QFtlLuVFZ2fj9F0i0Q4MR3FO8c280PKqCbs7rTNU1HfAgrwQ/R+134RKWRTlNNA
         9LgyLQHuDoSzMA5pdeujVVOB+j1889tHqnhwtuQWjgVNeAEyksjMg2HgB+AOFNMswFvn
         KpqKj+zmCB0YVsdGnKTgc699e5QkO3LeWom6WWdzWoq5k+9c2EqAJUhF/WvZaGYJufw1
         /0dIaRPAxHP2PIuA3jP2wtywkl15+6nW9t/BU4D1OizY2VNhR2y4NGdE+yRpV8H06r0j
         HX1g==
X-Forwarded-Encrypted: i=1; AHgh+RosMwEldMJAeQwWGo5R75qOgmAczanM9KGDqXF2Fo1ahNcfNk6/8+bT108eA31GfZbbIcbT3qzu@lists.infradead.org
X-Gm-Message-State: AOJu0YwpZc8ykuiGI+rrOUY4GLV2NODD4Wyzh4IqK8qx1g4UlJ/Tc7ux
	A7+Ct59cWwOX9ItBXMLlA0X3vOX9cKWDZxbPkbpcCx9h6+z22IRSTu8o38VV+nZ2r9AXihApaXN
	BH/nephQh8oQYPKHZflHUKeGJ56JIrapzDGdSazfDnhxAyvl7el7wpX/2hc3CDxMRCybtqRgeX/
	rKWJgI
X-Gm-Gg: AfdE7cl7wwEMVuAzVPP5OQTnVWPCQAmzz04M1b+mBteYFCfm07sQiQ2tEdwf7fNm/KM
	08IHu7D146y5imwm58yc1iJabBe3fj34qJnP6EkjaYVpUbV4akNTGx64az7OGZTgiAJsiRwRz4y
	qJU0NKCiONAT2SCLqI4+sAlrFhmN1FINDfCzAJg9tv+cwCuSl5o1Xc2+ZFlEDdzva504N4Kcav8
	8QXsnN9SO6rmHmG3jbtqMWcZ84VN6OmvRy0WbcjSN39kKDCwYpyXULEL4lN7RDv+Lbw6rJwJ+xA
	2WYNelLV4v3xmHRb10iwlAPnbOG1ZeR8E9buxcf0KN/oIyLD/EEi6Pgx51Y9VdyNaF8wm57UIUi
	Ypn/meanFjYDWqkhPjh/+5xZjCJt7cSOKExaxgRk89M4fi4g1Cf4KF/+PepujMV4a2dGVZbKnjH
	hkqV3+xR0zvVUc9xm7hg6C8Q315byKhFGxmQ==
X-Received: by 2002:a05:600c:314f:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-493d11d8186mr108166325e9.16.1783330921721;
        Mon, 06 Jul 2026 02:42:01 -0700 (PDT)
X-Received: by 2002:a05:600c:314f:b0:490:b7e6:bd1d with SMTP id 5b1f17b1804b1-493d11d8186mr108166115e9.16.1783330921276;
        Mon, 06 Jul 2026 02:42:01 -0700 (PDT)
Received: from ?IPV6:2a02:3035:67a:d7c1:88ed:2102:72c4:2c7d? ([2a02:3035:67a:d7c1:88ed:2102:72c4:2c7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce12c40sm454871215e9.13.2026.07.06.02.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 02:42:00 -0700 (PDT)
Message-ID: <62b51e6c-7f01-48c5-b9c6-465bfc963831@canonical.com>
Date: Mon, 6 Jul 2026 11:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] include: sbi: Lift the maximum harts to 1024
To: Anup Patel <anup@brainfault.org>
Cc: wu.fei9@sanechips.com.cn, opensbi@lists.infradead.org,
 Wu Fei <atwufei@163.com>
References: <20250806084123476SCLxg-qQRa8CRuhuY-dwE@zte.com.cn>
 <202508060106.57616maD072614@mse-db.zte.com.cn>
 <CAAhSdy2N0FQ4+3PR8ksYvi0CMc3m3Rt2Bsv+ABWWcXdWSMtXeQ@mail.gmail.com>
 <4b6afa21-f68e-4341-afed-e5d52beab77b@163.com>
 <CAAhSdy3H951_=J+FCR4nF_qiPfxsOmr438abuA28e5Cop+phrg@mail.gmail.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <CAAhSdy3H951_=J+FCR4nF_qiPfxsOmr438abuA28e5Cop+phrg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_024206_421108_F73BC349 
X-CRM114-Status: GOOD (  17.71  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gMTAvOS8yNSAxNToyOSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUaHUsIE9jdCA5LCAyMDI1
IGF0IDU6NTXigK9QTSBXdSBGZWkgPGF0d3VmZWlAMTYzLmNvbT4gd3JvdGU6Cj4+Cj4+Cj4+IE9u
IDkvMzAvMjUgMTk6MzYsIEFudXAgUGF0ZWwgd3JvdGU6Cj4+PiBPbiBXZWQsIEF1ZyA2LCAyMDI1
IGF0IDY6MznigK9BTSA8d3UuZmVpOUBzYW5lY2hpcHMuY29tLmNuPiB3cm90ZToKPj4+PiBJdCBp
cyBleHBlY3RlZCB0byBoYXZlIHJpc2N2IHNlcnZlciBib2FyZHMgd2l0aCBtYW55IGNvcmVzIHZl
cnkgc29vbi4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFd1IEZlaSA8d3UuZmVpOUBzYW5lY2hp
cHMuY29tLmNuPgo+Pj4+IC0tLQo+Pj4+ICAgIGluY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oIHwg
MiArLQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oIGIvaW5j
bHVkZS9zYmkvc2JpX2hhcnRtYXNrLmgKPj4+PiBpbmRleCAyMDBhYjZlLi4yZjk0ZjM5IDEwMDY0
NAo+Pj4+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0bWFzay5oCj4+Pj4gKysrIGIvaW5jbHVk
ZS9zYmkvc2JpX2hhcnRtYXNrLmgKPj4+PiBAQCAtMjAsNyArMjAsNyBAQAo+Pj4+ICAgICAqIGFs
c28gcmVwcmVzZW50cyB0aGUgbWF4aW11bSBudW1iZXIgb2YgSEFSVCBpZHMgZ2VuZXJpYyBPcGVu
U0JJCj4+Pj4gICAgICogY2FuIGhhbmRsZS4KPj4+PiAgICAgKi8KPj4+PiAtI2RlZmluZSBTQklf
SEFSVE1BU0tfTUFYX0JJVFMgICAgICAgICAgMTI4Cj4+Pj4gKyNkZWZpbmUgU0JJX0hBUlRNQVNL
X01BWF9CSVRTICAgICAgICAgIDEwMjQKPj4+IEluc3RlYWQgb2YgbWFraW5nIHRoaXMgOHgsIGl0
IGlzIGJldHRlciB0byBtb3ZlIHRvIGEgbW9yZSByZWFsaXN0aWMKPj4+IG51bWJlciBsaWtlIDI1
NiBvciA1MTIuIE5PID8KPj4KPj4KPj4gRG8geW91IHRoaW5rIHdlIG5lZWQgdG8gbWFrZSB0aGlz
IGNvbmZpZ3VyYWJsZT8gSXQgc291bmRzIGdvb2QgdG8gbWFrZQo+PiBpdCBsYXJnZXIgaWYgaXQn
cyBjb25maWd1cmFibGUsCj4+Cj4+IDUxMiBpcyBub3QgZW5vdWdoIHNvb25lciBvciBsYXRlciBv
biBzZXJ2ZXJzLgo+IAo+IEkgd291bGQgcmF0aGVyIHdhaXQgZm9yIGEgcmVhbCBwbGF0Zm9ybSB3
aXRoID4gMTI4IENQVXMgdG8gc2hvdy11cC4gU2luY2UKPiBpdCBpcyBhIG9uZS1saW5lIGNoYW5n
ZSBhbmQgd2UgY2FuIGRvIGl0IGFueSBkYXkuCj4gCj4gUmVnYXJkcywKPiBBbnVwCgpUaGUgTGlu
dXgga2VybmVsIGhhcyByYWlzZWQgdGhlIGRlZmF1bHQgdG8gMjU2IENQVXMgd2l0aCBhIG1heGlt
dW0gCmNvbmZpZ3VyYXRpb24gdmFsdWUgb2YgNTEyLiBTZWUKMGZhNzQ5NzcxOTkzICgicmlzY3Y6
IFJhaXNlIGRlZmF1bHQgTlJfQ1BVUyBmb3IgNjRCSVQgdG8gMjU2IikKClNob3VsZG4ndCBPcGVu
U0JJIG1hdGNoIGl0IGFuZCBoYXZlIGEgY29uZmlndXJhdGlvbiB2YXJpYWJsZSB0aGF0IApkZWZh
dWx0cyB0byAyNTY/CgpRRU1VIGlzIHN0aWxsIGxpbWl0ZWQgdG8gNTEyOiBDUFVzCgpCZXN0IHJl
Z2FyZHMKCkhlaW5yaWNoCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
