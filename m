Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 247B8C83F17
	for <opensbi@archiver.kernel.org>; Wed, 23 Jul 2025 05:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p7dj8ABjVEfWDyEqSBQJhBAaYcgPBzsVXBZiXS8asUg=; b=r7pR4iA0q40+FL
	Auiavamuxy6+jV16nFZp0HBxZzhNjs65bSPNJSHNrMkuqclFMEjSQ7OeMiPQuD503ijOSugB2Ajzy
	kr6Yeapx/Bd8hmZkVShpXvPgYjRTVrt7StZLfzXJ8RKtbzlLcEG6Uv6kLXx8HsA1P26YmLmYOJzdq
	x1U+wCSEFSVyREMnO0nc6TycbFRK++TpmEQPBzspPR1m/H1DkEqVxNbNGz4adf+UpzhNsNXs3kINV
	sVqOyGFI6c4eomXpaw8GVAYu60aqoWSnCm4RLuZf2eefulhMPQPDGkZFMEP1qem3Z4i450FS0uD1M
	ywNdLUjuVpgvYKJcwGOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRts-0000000432F-2rTo;
	Wed, 23 Jul 2025 05:20:20 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRtp-0000000431T-2GE0
	for opensbi@lists.infradead.org;
	Wed, 23 Jul 2025 05:20:19 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3df3ce3ec91so23080585ab.2
        for <opensbi@lists.infradead.org>; Tue, 22 Jul 2025 22:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753248016; x=1753852816; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sq4mPRlml5YzXo8xf0jSwmW3cWQewUq0RX3VjnIBM4o=;
        b=2EV+spTnEYvUeYy1PNX+sNVcfcX+sQjeADln2qV5PQlca2/MaipfMZnpGuNJmWAY6U
         wxVhR7ZAd6CXA7XqPkqTjoPOAV6YIYdPCeA0dVWKpnxcVuKtZEoNCytGvfCy06ZIhkQq
         oR9t3qlapwH8PlAXNks0085/bF/X699kZps/D/K+ZndsymMr/398XIekrHHD4BHqOR54
         PRnNd8flbETbI5tGPnvKP0pSUlsQsOy/ZzQJMuLyk5PvhSS0rwNHFr3I069lE0YG485q
         zSkKaFcgaEhZwD5yCBXambmWpmeLoJEx4eylQgTKNvDSNvfkbIMbi6ENW9H1CIXDZzRn
         Rdhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753248016; x=1753852816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sq4mPRlml5YzXo8xf0jSwmW3cWQewUq0RX3VjnIBM4o=;
        b=ARbS+RlpmjECrXeGNgQYzrvpJ1sn1DoWw2c825lWnaFeKXLazycEKQctFiaKt6DVcZ
         i3jSssk7bOvYTjDh8vtcGKpkUbb9ZwS+pgkZ4FwdmDDiv2N2gqUgO+RJcIcUjO5HKrVL
         ONh3ZNFNB8ZBdnYWZZDw/ZrJtK9V9eAA4bXkX6ZokFldhdoFcjKp6O/tY4trXybl19lA
         jZ5B29R+/2paw+S+YFINpyO3Jo+yML1VjkZn12m7/QkST7XtF8Kf+bvFar2kv8MvbA5P
         heLbxc47JpC6OVRYDxreVy9gJBfKEer9gJxAYxXsX88dQpbHKpVWeuw0/TiBHxQHWtYu
         YLGA==
X-Gm-Message-State: AOJu0Yxa30GXuq91r6TY5cSZBYdR3EC9ABIJyH1jbMm8v/De66SUO4wI
	6KD4MiC+dXss0UWPsC7N1xe0KSWWsZVe+IRNQiQMq+fjNWDYQRGi6MUQS8i2SuGbnIKYD4g/bHW
	oVtR00kJffh78o738K/AtS6j2UfdQypl1bD5O0MtBzw==
X-Gm-Gg: ASbGncvjG/qFMORxF9+iKWsKLAjy4OKP8zuAMY0WnrkbIEt2WdHZ3tK2rMpgnHV1BTr
	1NlCvdE9PvA5a8ztidKhzFxpzeVMXK09JZPjAGDs/jRNqXFc2H7Hu57o55oa09hXvln3/X0tWBh
	mJHUPQIJobw9mZ5aSvBNCXVkhaeQruO2KO4rPON0tVZ82wHHZ9Zx/sxMZZuXSFgxVLyOWlGW1nK
	VwuFIS1GXtKmppI
X-Google-Smtp-Source: AGHT+IG4nKhIgm5512v6weCkddVHDbATgS2T+Cvm3rl25/hKdBfCtcUkW8a7hSJXefWN1aon+y13O02q9FVbj/HsbiQ=
X-Received: by 2002:a05:6e02:2484:b0:3e2:c6dd:e796 with SMTP id
 e9e14a558f8ab-3e32fc5e676mr32963635ab.3.1753248015934; Tue, 22 Jul 2025
 22:20:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250711-dev-maxh-master_fdt_helper-v2-1-9579e1f02ee1@sifive.com>
In-Reply-To: <20250711-dev-maxh-master_fdt_helper-v2-1-9579e1f02ee1@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Jul 2025 10:50:04 +0530
X-Gm-Features: Ac12FXx9GDxN-PHvCJbyYoqkBCnxgff7qW805YEfNXPlDTzCtTR2LsknEVeKEf8
Message-ID: <CAAhSdy1T00Stpb0OLwE=0=Brq6+x0aH8Seqgfv5mCEqyk2oWPg@mail.gmail.com>
Subject: Re: [PATCH v2] lib: utils: fdt: fix "ranges" translation
To: Max Hsu <max.hsu@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_222017_822247_21ABA317 
X-CRM114-Status: GOOD (  26.40  )
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

T24gRnJpLCBKdWwgMTEsIDIwMjUgYXQgMTI6MDLigK9BTSBNYXggSHN1IDxtYXguaHN1QHNpZml2
ZS5jb20+IHdyb3RlOgo+Cj4gQWNjb3JkaW5nIHRvIHRoZSBEZXZpY2UgVHJlZSBTcGVjLCBDaGFw
dGVyIDIuMy44ICJyYW5nZXMiIFsxXToKPiBUaGUgcGFyZW50IGFkZHJlc3Mgc2l6ZSB3aWxsIGJl
IGRldGVybWluZWQgZnJvbSB0aGUgI2FkZHJlc3MtY2VsbHMKPiBwcm9wZXJ0eSBvZiB0aGUgbm9k
ZSB0aGF0IGRlZmluZXMgdGhlIHBhcmVudOKAmXMgYWRkcmVzcyBzcGFjZS4KPgo+IEluIGZkdF90
cmFuc2xhdGVfYWRkcmVzcygpLCB3aGljaCBjb25zaWRlcmVkIHRoZSBwYXJlbnQgYWRkcmVzcyBz
aXplCj4gaXMgdGhlIGNoaWxkIGFkZHJlc3Mgc2l6ZSwgdGhpcyBjb21taXQgZml4IHRoZSB0d28g
YWRkcmVzcyBzaXplcwo+IGFuZCBwYXJzaW5nIHRoZSBhZGRyZXNzIGluZGVwZW5kZW50bHkuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBNYXggSHN1IDxtYXguaHN1QHNpZml2ZS5jb20+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMg
cGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiB2
MSBmaXggd2lsbCBpbnRyb2R1Y2UgYW5vdGhlciBidWcgaW4gdGhlIGZvbGxvd2luZyBjYXNlLgo+
Cj4gVGhlIG5vZGUgaW4gRFRTIGRlcHRoIDEgaWYgZXhlY3V0ZSBmZHRfZ2V0X25vZGVfYWRkcl9z
aXplKCksIGluc2lkZQo+IHRoZSBmdW5jdGlvbiwgdGhlIGZkdF90cmFuc2xhdGVfYWRkcmVzcygp
IHdpbGwgdHJ5IHRvIGdldCB0aGUgY2hpbGQKPiAiI2FkZHJlc3MtY2VsbHMiIGFuZCAiI3NpemUt
Y2VsbHMiIGluIERUUyBkZXB0aCAwLCBhbmQgdGhlIHBhcmVudAo+ICIjYWRkcmVzcy1jZWxscyIg
aW4gRFRTIGRlcHRoIC0xLiB3aGljaCB3aWxsIGNhdXNlIGVhcmx5IGFib3J0Lgo+IFdpdGggZmR0
X3RyYW5zbGF0ZV9hZGRyZXNzKCkgZWFybHkgYWJvcnQsIHRoZSBwYXJhbWV0ZXIgImFkZHIiIGRp
ZG4ndAo+IGdvdCBhbnkgYXNzaWdubWVudCBvZiB0aGUgYWRkcmVzcyB2YWx1ZS4gVGhpcyBsZXQK
PiBmZHRfZ2V0X25vZGVfYWRkcl9zaXplKCkgcmV0dXJuIHdpdGggdW5rbm93biB2YWx1ZSBvZiBw
YXJhbWV0ZXIgImFkZHIiLgo+Cj4gRm9yIHRoZSB2MiBmaXgsIHdoaWNoIHdpbGwgY2hlY2sgdGhl
ICJyYW5nZXMiIGZpcnN0LCBzaW5jZSB0aGUgYWJvdmUKPiBjYXNlIHNob3VsZG4ndCBoYXBwZW4g
aW4gdGhlIERUUyBhcyB0aGUgInJhbmdlcyIgc2hvdWxkIGJlIGV4aXN0ZWQgaW4KPiBEVFMgZGVw
dGggbW9yZSB0aGFuIDAuIFRoaXMgZml4IGFsc28gaW1wcm92ZSBleGVjdXRpb24gY3ljbGUuCj4g
LS0tCj4gQ2hhbmdlcyBpbiB2MjoKPiAtIGZpeCB2MSBidWcgbWVudGlvbmVkIGluIHRoZSBjb3Zl
ciBsZXR0ZXIuCj4gLSBMaW5rIHRvIHYxOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUw
NzA4LWRldi1tYXhoLW1hc3Rlcl9mZHRfaGVscGVyLXYxLTEtODY2YzE2NWYxZjg1QHNpZml2ZS5j
b20KPiAtLS0KPiAgbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgfCAyNiArKysrKysrKysrKysr
KystLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTEgZGVs
ZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgYi9s
aWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+IGluZGV4IDBmNDg1OWMxYTcyMWJjN2MyODcxYmFj
ZWZlMjdjYWJhNzc4MGY3NTIuLjc5OWZkNDhkYzNhYmYwYTNjMTk2M2Y4NGRkNmJkZTI3MWU2YzA4
ZDcgMTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiArKysgYi9saWIv
dXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+IEBAIC04NCwyMyArODQsMjcgQEAgc3RhdGljIGludCBm
ZHRfdHJhbnNsYXRlX2FkZHJlc3MoY29uc3Qgdm9pZCAqZmR0LCB1aW50NjRfdCByZWcsIGludCBw
YXJlbnQsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdWludDY0X3QgKmFkZHIp
Cj4gIHsKPiAgICAgICAgIGludCBpLCBybGVuOwo+IC0gICAgICAgaW50IGNlbGxfYWRkciwgY2Vs
bF9zaXplOwo+ICsgICAgICAgaW50IGNlbGxfcGFyZW50X2FkZHIsIGNlbGxfY2hpbGRfYWRkciwg
Y2VsbF9zaXplOwo+ICAgICAgICAgY29uc3QgZmR0MzJfdCAqcmFuZ2VzOwo+ICAgICAgICAgdWlu
dDY0X3Qgb2Zmc2V0LCBjYWRkciA9IDAsIHBhZGRyID0gMCwgcnNpemUgPSAwOwo+Cj4gLSAgICAg
ICBjZWxsX2FkZHIgPSBmZHRfYWRkcmVzc19jZWxscyhmZHQsIHBhcmVudCk7Cj4gLSAgICAgICBp
ZiAoY2VsbF9hZGRyIDwgMSkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4g
LQo+IC0gICAgICAgY2VsbF9zaXplID0gZmR0X3NpemVfY2VsbHMoZmR0LCBwYXJlbnQpOwo+IC0g
ICAgICAgaWYgKGNlbGxfc2l6ZSA8IDApCj4gLSAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5P
REVWOwo+IC0KPiAgICAgICAgIHJhbmdlcyA9IGZkdF9nZXRwcm9wKGZkdCwgcGFyZW50LCAicmFu
Z2VzIiwgJnJsZW4pOwo+ICAgICAgICAgaWYgKHJhbmdlcyAmJiBybGVuID4gMCkgewo+IC0gICAg
ICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgY2VsbF9hZGRyOyBpKyspCj4gKyAgICAgICAgICAg
ICAgIGNlbGxfY2hpbGRfYWRkciA9IGZkdF9hZGRyZXNzX2NlbGxzKGZkdCwgcGFyZW50KTsKPiAr
ICAgICAgICAgICAgICAgaWYgKGNlbGxfY2hpbGRfYWRkciA8IDEpCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4gKwo+ICsgICAgICAgICAgICAgICBjZWxsX3Bh
cmVudF9hZGRyID0gZmR0X2FkZHJlc3NfY2VsbHMoZmR0LCBmZHRfcGFyZW50X29mZnNldChmZHQs
IHBhcmVudCkpOwo+ICsgICAgICAgICAgICAgICBpZiAoY2VsbF9wYXJlbnRfYWRkciA8IDEpCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4gKwo+ICsgICAgICAg
ICAgICAgICBjZWxsX3NpemUgPSBmZHRfc2l6ZV9jZWxscyhmZHQsIHBhcmVudCk7Cj4gKyAgICAg
ICAgICAgICAgIGlmIChjZWxsX3NpemUgPCAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJl
dHVybiBTQklfRU5PREVWOwo+ICsKPiArICAgICAgICAgICAgICAgZm9yIChpID0gMDsgaSA8IGNl
bGxfY2hpbGRfYWRkcjsgaSsrKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGNhZGRyID0gKGNh
ZGRyIDw8IDMyKSB8IGZkdDMyX3RvX2NwdSgqcmFuZ2VzKyspOwo+IC0gICAgICAgICAgICAgICBm
b3IgKGkgPSAwOyBpIDwgY2VsbF9hZGRyOyBpKyspCj4gKyAgICAgICAgICAgICAgIGZvciAoaSA9
IDA7IGkgPCBjZWxsX3BhcmVudF9hZGRyOyBpKyspCj4gICAgICAgICAgICAgICAgICAgICAgICAg
cGFkZHIgPSAocGFkZHIgPDwgMzIpIHwgZmR0MzJfdG9fY3B1KCpyYW5nZXMrKyk7Cj4gICAgICAg
ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBjZWxsX3NpemU7IGkrKykKPiAgICAgICAgICAgICAg
ICAgICAgICAgICByc2l6ZSA9IChyc2l6ZSA8PCAzMikgfCBmZHQzMl90b19jcHUoKnJhbmdlcysr
KTsKPgo+IC0tLQo+IGJhc2UtY29tbWl0OiBhMzJhOTEwNjkxMTllN2E1YWEzMWU2YmM1MWQ1ZTAw
ODYwYmUzZDgwCj4gY2hhbmdlLWlkOiAyMDI1MDcwOC1kZXYtbWF4aC1tYXN0ZXJfZmR0X2hlbHBl
ci00NmQyZWVlYjA3Y2QKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IE1heCBIc3UgPG1heC5oc3VA
c2lmaXZlLmNvbT4KPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
