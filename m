Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D172C3ABBC
	for <opensbi@archiver.kernel.org>; Fri,  9 May 2025 05:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jj+55CBkMxSB02lNDh+ATK4tzfqadWvHNClU87yLWas=; b=LRw7P/4zokj8gS
	NysT+idXvfZGusX2AqT5wwJS3RgH12f9mfBy1VJrpjmqRBsfEsj2l+RczxhqW0G6qeIicnNzV6dzm
	s+SpUxx+AAc6r8IXhwLjxBqLMb3/U//Vyu1bY5EFs9fBN+GZfgyoi8l/QIWuGBpziVEFzUQbExC8g
	3le2oZ2nbgRTAf1K3J9EaTi3B6wlECy3xA0cKq5dRzc3gLTsnMCfyG/k4MBGA/rhcjFZ11kYJMFeH
	BrqC5NbbU4SbUwgKUsjT8WzPNBGPypTLiveuEjIk5R6T3nKbl+GCDFZalpwmvMIgM2LzkuFO6B9VL
	F1ysTchYZzQ7mx0xIrqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDFzC-00000002UkV-0Ld5;
	Fri, 09 May 2025 05:09:26 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDFz9-00000002Ujc-3O8y
	for opensbi@lists.infradead.org;
	Fri, 09 May 2025 05:09:25 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e6e2971f79fso1657057276.0
        for <opensbi@lists.infradead.org>; Thu, 08 May 2025 22:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1746767362; x=1747372162; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2cuFTn1tQ1Tq2cSQBcNHOMvrJzGC7DGjC6Vqj+uk6U=;
        b=SV5nRQeam0eKL4zIJihrRZ+MYDxhlA0ryPg/hf1OXpPPrVWtLcBeC7sGT2pV3eQ73Z
         NmUkS1nx7Xzeet4v5z6bqCJXv1KH1Xj9nMY5RF/OY4MojqaDjvkAOoffsAgxCnivNG4R
         eAmhDqB7gpBzw5Q86TJxgDSA4AbDl5Yk1YqQwihXvD5w2FkbF3X0hv+VpQFqW+zIdBoH
         V1IcDEeLhK2YYHsNf0H/T0R4lHmtMkfEW3eRD1bYkF4MNPRknoVE1KFdVnAJkQ8kmpDD
         /nyFq6zoF8wVprSBLHWzLQz7S3wmzJ/dX+CPS7dTpd2Hp/T+lKG9cWclyuhCtvs3pqM/
         kozw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746767362; x=1747372162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h2cuFTn1tQ1Tq2cSQBcNHOMvrJzGC7DGjC6Vqj+uk6U=;
        b=R1tWE9ZnL8VcinOXN4R7c7zZHZkvGNWvM13imsJXJA/srCjoDPQVfZPZ51jnT2dv4t
         B5KfSns/SyxVdtlJzQZWodrE6U9Hilxhq9jPxWk6kWll/Jynlrz48bW0Js2d/MdqPz3R
         bE1BDJCoONODY1pGIl67Dz/TTikdespIquyVPQTFggW8hzR0jhJPM9qZNIXZuBUQHPLu
         jPK6VrFjwYxEkHc6uncL3g+YddOTR3bL6cGa9IJwQzEfXM9zOkondDbDZ5HW9l6JEmF6
         l7jVBSL3dn7goxgypPFiD2Ivf0fDVHSHoouJs2PRlIEl4KwPOoTfwVFlXvVMjZpsuatP
         Ze2Q==
X-Gm-Message-State: AOJu0YwncJLI0uzOAaGp3zrK3pRvHYKEteNXyCKzkq1GlfzbrWemLY5X
	Sfse93e7lsPeTtQiF+5ERNqjCLHjipULpCusO+K6pwwQixvy+Z+QGggSLV/r33TT/JqVtV6JE0J
	nOXH2WVLGQ43xTUcMJQ02EpKuzI18d++6191+QyML6m4Zzind/j2Qsg==
X-Gm-Gg: ASbGncuSCNjKbfviBsoJOYoClokkQai0W0dgPQfxZ4fzgNPsatWesptIjmlZmjROkQX
	bYX7HFp2HGii20jgArkF+gidcFTSlq/SXsS85YKBRYqdI/zRu2tZE/adSvkG8eb4DFaLwiZ4Wtf
	mmuj3hTaHeFVbAj80ZdVYqUb/8
X-Google-Smtp-Source: AGHT+IEcXTMEMqTPPU52pTkZVy9CJcpwqFEFHXAXJtQb7Nz8Vg51VrUhw6cIHIyHlk0z99zXZXOvVdPbZBZ88wrhsc0=
X-Received: by 2002:a05:6902:1207:b0:e6e:84a:e7e5 with SMTP id
 3f1490d57ef6-e78fdba5611mr2862406276.7.1746767362586; Thu, 08 May 2025
 22:09:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250424034003.28522-1-nick.hu@sifive.com>
In-Reply-To: <20250424034003.28522-1-nick.hu@sifive.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Fri, 9 May 2025 13:09:11 +0800
X-Gm-Features: ATxdqUELkqfu3jnFag1NZl1qRT60F2FHcoL7YtwM4uRJd_BWZ-wIBRLDF-tgG0g
Message-ID: <CAKddAkD00gLgpzOCXY9mXaebr2qZcU9mkUGOZ4278w0bmiLuBQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Support external CMO to flush entire cache
To: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_220923_875358_ACB9C6ED 
X-CRM114-Status: GOOD (  12.02  )
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
Cc: vincent.chen@sifive.com, anup@brainfault.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkKCkFueSBmZWVkYmFjayBhYm91dCB0aGlzPwoKT24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMTE6
NDDigK9BTSBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gU29tZSBmZWF0
dXJlcywgc3VjaCBhcyBwb3dlciBtYW5hZ2VtZW50LCBtYXkgcmVxdWlyZSBmbHVzaGluZyB0aGUg
ZW50aXJlCj4gY2FjaGUgYmVmb3JlIGVudGVyaW5nIGEgbm9uLXJldGVudGlvbiBwb3dlciBzdGF0
ZS4gVG8gc3VwcG9ydCB0aGlzLCBhCj4gc2ltcGxlIGNhY2hlIGZyYW1ld29yayBpcyBpbnRyb2R1
Y2VkIHRvIGFsbG93IHRoZSBleHRlcm5hbCBDTU8gdG8KPiBwZXJmb3JtIGEgZnVsbCBjYWNoZSBm
bHVzaC4KPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBTaW5jZSB0aGUgcGxhdGZvcm0gb3ZlcnJpZGUg
aG9va3Mgd2FzIGRlcHJlY2F0ZWQsIHVzZSB0aGUgZmR0X2RyaXZlcgo+IGZvciBpbml0aWFsaXpp
bmcgdGhlIHNpZml2ZV9kZXZfcGxhdGZvcm0uCj4KPiBOaWNrIEh1ICgzKToKPiAgIGxpYjogdXRp
bHM6IEFkZCBjYWNoZSBmbHVzaCBsaWJyYXJ5Cj4gICBsaWI6IHV0aWxzOiBBZGQgRkRUIGNhY2hl
IGxpYnJhcnkKPiAgIGxpYjogdXRpbHMvY2FjaGU6IEFkZCBmZHQgY21vIGhlbHBlcnMKPgo+IFZp
bmNlbnQgQ2hlbiAoMik6Cj4gICB1dGlsczogY2FjaGU6IEFkZCBTaUZpdmUgY2NhY2hlIGNvbnRy
b2xsZXIKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBBZGQgU2lGaXZlIGRldmVsb3BtZW50IHBsYXRm
b3JtCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvY2FjaGUuaCAgICAgICAgICAgICAgIHwg
IDY5ICsrKysrKysKPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2NhY2hlLmggICAgICAg
ICAgIHwgIDM0ICsrKysKPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2Ntb19oZWxwZXIu
aCAgICAgIHwgIDM0ICsrKysKPiAgbGliL3V0aWxzL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKPiAgbGliL3V0aWxzL2NhY2hlL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIzICsrKwo+ICBsaWIvdXRpbHMvY2FjaGUvY2FjaGUuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNDYgKysrKysKPiAgbGliL3V0aWxzL2NhY2hlL2ZkdF9jYWNoZS5jICAg
ICAgICAgICAgICAgICAgIHwgIDg3ICsrKysrKysrKwo+ICBsaWIvdXRpbHMvY2FjaGUvZmR0X2Nh
Y2hlX2RyaXZlcnMuY2FycmF5ICAgICAgfCAgIDMgKwo+ICBsaWIvdXRpbHMvY2FjaGUvZmR0X2Nt
b19oZWxwZXIuYyAgICAgICAgICAgICAgfCAxMTIgKysrKysrKysrKysKPiAgbGliL3V0aWxzL2Nh
Y2hlL2ZkdF9zaWZpdmVfY2NhY2hlLmMgICAgICAgICAgIHwgMTc1ICsrKysrKysrKysrKysrKysr
Kwo+ICBsaWIvdXRpbHMvY2FjaGUvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgICAgfCAgMTQg
KysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA1
ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgIHwgICAz
ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvb2JqZWN0cy5tayAgICAgICAgICAgIHwgICAz
ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvc2lmaXZlX2Rldl9wbGF0Zm9ybS5jIHwgIDQy
ICsrKysrCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDY1MiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL3NiaV91dGlscy9jYWNoZS9jYWNoZS5oCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL3NiaV91dGlscy9jYWNoZS9mZHRfY2FjaGUuaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2Ntb19oZWxwZXIuaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2NhY2hlL0tjb25maWcKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi91dGlscy9jYWNoZS9jYWNoZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRp
bHMvY2FjaGUvZmR0X2NhY2hlLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9jYWNo
ZS9mZHRfY2FjaGVfZHJpdmVycy5jYXJyYXkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGls
cy9jYWNoZS9mZHRfY21vX2hlbHBlci5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMv
Y2FjaGUvZmR0X3NpZml2ZV9jY2FjaGUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxz
L2NhY2hlL29iamVjdHMubWsKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMv
c2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0uYwo+Cj4gLS0KPiAyLjE3LjEKPgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
