Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7492E6B279
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 05:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+XXK4gxLhPJu1j4JNo1C0+M9bqweKo2+27TkxSELUU=; b=F3r9qqYiBCZUnX
	LRDVB4IgdV4e/tXnEiV4ZUUehhQQhIMfLpqQ5HYrsZFLREqckexNs4mqjB8iny/7PW0ur90sTjJmq
	XIFg9QTICQoYXDB+e62kEAcLy7qq7bTfBmQZPI3EiyqEmBCMKlzhGiWC3cJuKhObTZf6YWxUmvIR8
	6tpRPI4nLKghNP+nZ0uxvzjAKn0+/NKFjvb0MbL9uIJ0HxamEh1jPRN46HU4E/ZEzEMEuthOYyTq9
	8Onr22C0jGw6qS1lFAYP1rZALnLw0xiaj4whe7QrmNrnSX3FYCKt4ffaUrfpdoADmmK4hR6yodCGu
	W9aA4KpuiZzwQI1Y0OSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZMlz-00000001ieT-0ijn;
	Sat, 27 Dec 2025 05:23:27 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZMlv-00000001ie6-1dLC
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 05:23:24 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-65cf050a5cdso4724823eaf.1
        for <opensbi@lists.infradead.org>; Fri, 26 Dec 2025 21:23:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766813002; x=1767417802; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GKh4tr8HZCLFjEQimeOQsFwphYCGZWO/0KDjGeKOP+M=;
        b=jncaxpQufLWqxPM4PmrBgcP3zoWf0vZGHU3h7oUX9bUbvNFn66/2mq5dgC/19THqzJ
         wxrlZPwdzWRaLAE/0d/8AQp2RLu3G5bRYTCBLejbB23Q5zohJXHPT5k1BxAqnTHyTWDN
         AcZqM9cPnFzfDdwJKpu6B7aNSsmARVlBYBM3kpvaK35RX3xtvblv8QLmJLbX97EEPe2x
         dZZ/MBzZRavCtmUODk5RjfEtxdyhmjF9TcmtYmRtV50XTxffKAYCQsptRc4lUj0v2/+v
         Q2VJTlxAemuK3k78WbFHXxIKbtmc2/uE2wlQcr22GDVbCi74TUODOABqwfjYYlb7Rm8+
         Ssdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766813002; x=1767417802;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GKh4tr8HZCLFjEQimeOQsFwphYCGZWO/0KDjGeKOP+M=;
        b=f/yb0ekQh9h6xNhEMYBlDoPPpFRDuj8vtNsZdNGmuqUtMZqKliZYQG+YNyptfr3nI2
         KCYgMF9aZ1YrG8zrccQqilmQ7jtIvhCsV3qMG6q775g1RZ6CiCqjpQ+zYYIJfuKcZ+EB
         5gpVTi5aTNZkdqEfj3S0jgY5aQVrxvXMD6lYXwtQGv/B6HdWFjkm+tEmi0zDpt/Cczks
         Lb99wWt20IF4kNVVwJe4UvNy5TgPeS/V8V0PlbBOTCsljcY5IhnP2kLnz5nZOrLztDE0
         ybtrZ2uKQcgZBd6YOZhZTMwN7W5Z38/XgQgzQ+fWMcztRN97t07wTxULwh0M5PDxM7sL
         cauQ==
X-Forwarded-Encrypted: i=1; AJvYcCVef45zbX7bwdVWb72a2zzZjdq1hj+n4OMt/mm2NFdMarpr/LdELSjEodHhcBZ07b3JBpJcpSpS@lists.infradead.org
X-Gm-Message-State: AOJu0YwWZYc7WudAl717ShfG8gY1KWfRYkYdD5okmCjpS7b5M9ylCS5J
	vVMw9DLY3yjkN7Up1cIePpoHOjtubG4uxn1EpPl6/rv13f2h6UDOjazSOfan0YMJtn9LJHe2MRt
	STQqMsCpMLzNOSg3zFpqCChInw2gtUIrQLc31k9KqXQ==
X-Gm-Gg: AY/fxX6HG7qmmResEbVk0TZdwKfqDBbwO3S3C/b0BA7/UHfINxbPBNFaDOv4YKulA2h
	1RmBp24fjWII8gxnP9K8rnRTjTI2rsO3laqCaJYFNc3AWcstcM773E8aheFeEqnTkxK+m6XHagS
	Ppm3+kAJPAFbYTaBkSu69JmeYieA0iWEWzsufQQLkYyW6dW9qjESs0eVM0TG6m2f5KovbquYhGx
	WJCp11ZV3p8AAQXhty951a6d3mduvJmyJE1EwD0QktTklaMAvhb3+LmCKR262oEMwymi6HxCJ+A
	dRa1FGJna+8wwIaowBmlzeoTx4ebDvmECk2BpbVmmHdBsV/k02D12EkMig==
X-Google-Smtp-Source: AGHT+IGzDKjKGtovg2gRk89TedGrjwrqU/AKFQlwbGLIPH8aH4rnb2UTnqiFeWK8TdbYvhpDWV4hrPeegx5sjlXYP0c=
X-Received: by 2002:a05:6820:608c:b0:65c:9e6f:f4ca with SMTP id
 006d021491bc7-65cfe76f78emr9559549eaf.30.1766813001980; Fri, 26 Dec 2025
 21:23:21 -0800 (PST)
MIME-Version: 1.0
References: <20251208094504.1254011-1-vladimir.kondratiev@mobileye.com> <20251208125617.2557594-1-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20251208125617.2557594-1-vladimir.kondratiev@mobileye.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 27 Dec 2025 10:53:10 +0530
X-Gm-Features: AQt7F2r-8hjhPVXxQmGMVZo3SBKfP1j5Q4mcymU6hY0YwQYg2MEWeeg4FboLOz4
Message-ID: <CAAhSdy3-ZZYsdiTW=EGKmfgncpxTLn3jf5Vwo7-eyTAa+C+FVA@mail.gmail.com>
Subject: Re: [PATCH v2] lib/sbi: optimize domain memory regions copying
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: inochiama@outlook.com, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_212323_700062_88A02022 
X-CRM114-Status: GOOD (  16.22  )
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

T24gTW9uLCBEZWMgOCwgMjAyNSBhdCA2OjI24oCvUE0gVmxhZGltaXIgS29uZHJhdGlldgo8dmxh
ZGltaXIua29uZHJhdGlldkBtb2JpbGV5ZS5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgYXJlIDIgbG9j
YXRpb25zIHdoZXJlIG1lbW9yeSByZWdpb25zIG1vdmVkIGluIGEgYnVsaywKPiBidXQgdGhpcyBp
bXBsZW1lbnRlZCBpbiBhIHJlZ2lvbi1ieSByZWdpb24gbW92ZSBvciBldmVuIHN3YXAuCj4KPiBV
c2UgbW9yZSBlZmZlY3RpdmUgd2F5LiBOb3RlLCBsYXN0IGVudHJ5LCBkb20tPnJlZ2lvbnNbY291
bnRdLCBhbHdheXMKPiBleGlzdHMgYW5kIGlzIGVtcHR5LCBjb3B5aW5nIGl0IHJlcGxhY2VzIGNs
ZWFyX3JlZ2lvbigpCj4KPiBTaWduZWQtb2ZmLWJ5OiBWbGFkaW1pciBLb25kcmF0aWV2IDx2bGFk
aW1pci5rb25kcmF0aWV2QG1vYmlsZXllLmNvbT4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUg
cmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9k
b21haW4uYyB8IDIwICsrKysrLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2RvbWFpbi5jIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKPiBpbmRleCA5OWY0NTNmOWU1YWMuLmM1
Y2Y2NTZlOTJiNyAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xp
Yi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAgLTM2MiwxMSArMzYyLDYgQEAgc3RhdGljIHZvaWQgc3dh
cF9yZWdpb24oc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uKiByZWcxLAo+ICAgICAgICAgc2Jp
X21lbWNweShyZWcyLCAmdHJlZywgc2l6ZW9mKHRyZWcpKTsKPiAgfQo+Cj4gLXN0YXRpYyB2b2lk
IGNsZWFyX3JlZ2lvbihzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24qIHJlZykKPiAtewo+IC0g
ICAgICAgc2JpX21lbXNldChyZWcsIDB4MCwgc2l6ZW9mKCpyZWcpKTsKPiAtfQo+IC0KPiAgc3Rh
dGljIGludCBzYmlfZG9tYWluX3VzZWRfbWVtcmVnaW9ucyhjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFp
biAqZG9tKQo+ICB7Cj4gICAgICAgICBpbnQgY291bnQgPSAwOwo+IEBAIC00NTQsMTAgKzQ0OSw3
IEBAIHN0YXRpYyBpbnQgc2FuaXRpemVfZG9tYWluKHN0cnVjdCBzYmlfZG9tYWluICpkb20pCj4K
PiAgICAgICAgICAgICAgICAgLyogZmluZCBhIHJlZ2lvbiBpcyBzdXBlcnNldCBvZiByZWcsIHJl
bW92ZSByZWcgKi8KPiAgICAgICAgICAgICAgICAgaWYgKGlzX2NvdmVyZWQpIHsKPiAtICAgICAg
ICAgICAgICAgICAgICAgICBmb3IgKGogPSBpOyBqIDwgKGNvdW50IC0gMSk7IGorKykKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN3YXBfcmVnaW9uKCZkb20tPnJlZ2lvbnNbal0s
Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmZG9tLT5yZWdp
b25zW2ogKyAxXSk7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgY2xlYXJfcmVnaW9uKCZkb20t
PnJlZ2lvbnNbY291bnQgLSAxXSk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX21lbW1v
dmUocmVnLCByZWcgKyAxLCBzaXplb2YoKnJlZykgKiAoY291bnQgLSBpKSk7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgY291bnQtLTsKPiAgICAgICAgICAgICAgICAgfSBlbHNlCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgaSsrOwo+IEBAIC02OTksNyArNjkxLDcgQEAgc3RhdGljIGludCBy
b290X2FkZF9tZW1yZWdpb24oY29uc3Qgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICpyZWcp
Cj4gIHsKPiAgICAgICAgIGludCByYzsKPiAgICAgICAgIGJvb2wgcmVnX21lcmdlZDsKPiAtICAg
ICAgIHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqbnJlZywgKm5yZWcxLCAqbnJlZzI7Cj4g
KyAgICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKm5yZWcsICpucmVnMTsKPiAgICAg
ICAgIGludCByb290X21lbXJlZ3NfY291bnQgPSBzYmlfZG9tYWluX3VzZWRfbWVtcmVnaW9ucygm
cm9vdCk7Cj4KPiAgICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiBAQCAtNzQxLDEyICs3MzMs
MTAgQEAgc3RhdGljIGludCByb290X2FkZF9tZW1yZWdpb24oY29uc3Qgc3RydWN0IHNiaV9kb21h
aW5fbWVtcmVnaW9uICpyZWcpCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIChucmVnLT5i
YXNlICsgQklUKG5yZWctPm9yZGVyKSkgPT0gbnJlZzEtPmJhc2UgJiYKPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbnJlZy0+b3JkZXIgPT0gbnJlZzEtPm9yZGVyICYmCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIG5yZWctPmZsYWdzID09IG5yZWcxLT5mbGFncykgewo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgaW50IGkxID0gbnJlZzEgLSByb290LnJlZ2lvbnM7
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucmVnLT5vcmRlcisrOwo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgd2hpbGUgKG5yZWcxLT5vcmRlcikgewo+IC0gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBucmVnMiA9IG5yZWcxICsgMTsKPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpX21lbWNweShucmVnMSwg
bnJlZzIsIHNpemVvZigqbnJlZzEpKTsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbnJlZzErKzsKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaV9tZW1tb3ZlKG5yZWcxLCBucmVnMSAr
IDEsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzaXplb2Yo
Km5yZWcxKSAqIChyb290X21lbXJlZ3NfY291bnQgLSBpMSkpOwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVnX21lcmdlZCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICByb290X21lbXJlZ3NfY291bnQtLTsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICB9Cj4KPiBiYXNlLWNvbW1pdDogZGUzNzYyNTJmNGYzZTNkZjQ5OThiZDE0ODkzY2I2ODc4MjFi
NDEwMgo+IC0tCj4gMi40My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
