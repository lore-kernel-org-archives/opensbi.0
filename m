Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA81EE3695
	for <opensbi@archiver.kernel.org>; Thu, 12 Feb 2026 16:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g0pRquC9gPIXhUQoFNY5RbShK++tyV61U9cWcptzIPs=; b=xiaqjSURZ0qLg1
	I2yRRO6YW2n1Uj7HywrhuA5Hdbik6IVrih0zEA9GH6aiD2qpS1rWO0REmMfgRWOpdDLMNf9+bVo9b
	5mWEfX2mOu232elGiuSr7KJBOM6MzSQO/tsMhUIUaDcop6SyMMF+ghs+COICGo6QTSbqdbV+PDwF0
	EgDTGicCih32cONoTYhBNdp2650i3mgkwGJVlVpBtPsiQfdzaj8n8NZEB4TDNSN3PkdYBY//TtfJi
	Cr6UgXAfaQ9Z+CnGw1t8Wghf9I56II4re5SHsst6W8IoFRhzsJQX2nyRQP9n8ZyFr2WyxFjd/HKnO
	HK+6F6fD9OrvaGQhv15A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZKb-00000002Jca-2NXh;
	Thu, 12 Feb 2026 16:14:17 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZKY-00000002Jby-2wtf
	for opensbi@lists.infradead.org;
	Thu, 12 Feb 2026 16:14:15 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-59dcdf60427so3360301e87.3
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 08:14:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770912852; cv=none;
        d=google.com; s=arc-20240605;
        b=ebmkbYwsAKzbJ1pcBxHo6C7Jbs6f9f3aw84MpmHKIBxWbKhDucX9YY+pTSyV8LOeDh
         9qFY0D78D5/ox1jYn1uMEvDSdrxNrCuwhsa6exzxwdjCES3TbfQr87cjlH49ylDHhefU
         IjLt7MqPr8C1H2bZ8tVdXeUuqFnTCylan2znqbwd2Ae8NY+LmEgDoi9/dKXNuppDc8wK
         a/H6hhPBZQPYjMK6xlruj3hfqcjZdm+v+hMCnPrWeFXhv1TrkdnlqRXMH1WmXGfnMasH
         9lO1BA2M0GSmRAEeqP7NUtxvR6iERIgD8/ZWzVU9WJmHHWUTLPXvDqjbQtNZZX8Z48jT
         BbyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W8WtpTIMMxK6QeQEHCdvtVOJih77EhOhnv3o+X6mQZ4=;
        fh=/mRTpLZ5iGt/Lvvpbj6OAKdz84yBUv4cNbAHQxDqnCM=;
        b=A+jwunybfQlqzpnO0NeTEycGU73CAMXkfJwIv+rgzBreqmx8wpOShQrkVFMu0079zZ
         H/vHpLQbmpMrq8oeVYU7fT5C1d5uHWsQKW1+lOYJdirc+haPmfPMuTU7hh+cs8qs++Ix
         pkN1E0YqT0Eqah8ZXZr36+VNujJ3EDGfNlDtSEd/CHye/aNcJj2B9+rBpWTtqf+OVuur
         f8Fini1OZNgGEHy+OSOpvO64ESlTLGjNZuD67X0y1XIro2wEtm/3ubqHoEJ0OJtPp4pH
         6AAon9pBFXHBbvWNBk5iEU0uVSCSfesixiLJa/QqMeVokybqx2Y2Cg2bcovR+079a51q
         A4bA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1770912852; x=1771517652; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8WtpTIMMxK6QeQEHCdvtVOJih77EhOhnv3o+X6mQZ4=;
        b=EWr5Zu1KaL9JnN7+LoRDB759rWRa13AuEnafozKg+CQWCP5rh0WBS2tBSYWh/2A97y
         1Bv/BI5MOYvur8UUI5lCWTaG1VUv/pvr0eB7ZtmFs3Hrz9ks3dyTrrBhLbkvpU6vQqvZ
         Fb7TQYEobUjuGK4HmTk+4ZnNBV53nKySSMByjM+uFRYWiwrfYb8Gc9EnVbbgRNGMvvLO
         vCNYpCokiehzL8kBgNSqOlISjon4lcvkA+Y2LhRvbBAP24a7QrqZ8MLjS/8eO3yDhnNL
         b/Hd81X/0lZMtdaHAfg0lMqGwFRNyjd6rVs3+7AQS8+qQmnryJBjvh5ayadGlJHaF1WX
         ttlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770912852; x=1771517652;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W8WtpTIMMxK6QeQEHCdvtVOJih77EhOhnv3o+X6mQZ4=;
        b=uYOS3StcrMPaO6bHuwegEQNaPc/vhL82gQJNl9w20MkS+nZ3tRBm9jbx8bK1vfGDpv
         CNTurFViuTY9CGOYAYMSw7sC/uBB0oZXY8v+ux7SL+nhFo1ipAPPIIFD0cPaJZVSmVTL
         AbKQ3h/wXBKOb98otluwbJOSgDfupfLdPK6yc0ZL4KOnarNn7NGg27QlX3sovRrTVSe/
         kolfUkFspc1bvWZ3irFwYuaKsagS9Ggp8ediS6Tz39yrjY9ECVfjXq8IweFsJ/AXQriC
         z+vxyiBwGuiIW9Wt0snKUZBWRejUPXivNIPPxJMabFrJdrx9lYdCkc6/2OHvmQtsy+Ap
         TsWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT+hUy/1kYIkuDixB1B0876AfZRWKJHHBpUZOeHREHEVkjLublfVF0FKnMzcfbOXrtUdqJPJB/@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/icqi3Fnq7CnxLibQ17QaKFIolZhk/wdcsNQEhxmldqMptnGL
	NFPNAbVJGjvxTJPj9k3uzUDdjTwQ4AXfC3vP34bb7xdDMVNwNiXRXvOGfJ1E2Wuc/Z89fDis87H
	3g6FfAVzH6mun1UeFU1ovZgpbWRWlMVsgChLATzImuQ==
X-Gm-Gg: AZuq6aL6C5UEDnRdGr7Xy84r/eTue2NL/QKi2wUI6AOFMPjQGeYjryyq8zhDPbhUKCo
	I6Sdlfaw6K9L6I1ZnD7RtfZuDJquzBHutZp5Plxy6lxCrt+LfTMzClsfltxVkHyVimCkoTMOTBZ
	2WQIhpi53kDQPoozACiKzgdliM9Lh3GsRkgXZD0CZpslwNhirsX8w7I1HyfLKc+ek9C+h0AQftX
	8dYVtOhfCDzg0109FkxLIyW4NQPXxs8HPITWPmjumQDPsfh75UGId3yzmbunjEzsVYw2BBiyeaT
	/v0J6XEkJoBevYU3rbvfl0TjIDHKKXdiEI5sbdORzg==
X-Received: by 2002:a05:6512:4020:b0:59e:5e18:cb22 with SMTP id
 2adb3069b0e04-59e64f241cfmr838697e87.9.1770912852250; Thu, 12 Feb 2026
 08:14:12 -0800 (PST)
MIME-Version: 1.0
References: <20260211100010.4082-1-dave.patel@riscstar.com>
 <CAK9=C2UN2kAhXx0RvL07T+a31bYKS=sOnHhmkOBpkmXKproxMg@mail.gmail.com>
 <CAL2H45cQm_O-K-6weC-xeGNB0+yCHjQe1msS+JwHdKLKecM5CA@mail.gmail.com>
 <CAK9=C2XLsvs45jAtORxucWDskvz4q_X9FUgoaPJ9Kiqt3=V6XQ@mail.gmail.com> <CAEigVW8cs7=f0xk-QZN2vKTTg-=dU9eoof=RrMHqzj9t8Yi=4Q@mail.gmail.com>
In-Reply-To: <CAEigVW8cs7=f0xk-QZN2vKTTg-=dU9eoof=RrMHqzj9t8Yi=4Q@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Feb 2026 21:43:58 +0530
X-Gm-Features: AZwV_QgMAfWwgxXIo2U_usbwdZWF4tN4dwCPfF04ReOBX_RpWH5O1atZbfFOezI
Message-ID: <CAK9=C2XzBFTouGyJ-PCgJmfiq+8Sji+FW=uiuwT9R+Fwg7KtWg@mail.gmail.com>
Subject: Re: [PATCH] Trap and Emulate changes
To: Dave Patel <dave.patel@riscstar.com>
Cc: Scott Bambrough <scott@riscstar.com>, opensbi@lists.infradead.org, 
	Ray Mao <raymond.mao@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Anup Patel <anup.patel@qti.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anuppate@qti.qualcomm.com>, Dhaval <dhaval@rivosinc.com>, 
	Peter Lin <peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_081414_780781_CE2EE6A4 
X-CRM114-Status: GOOD (  24.39  )
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

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgOToyM+KAr1BNIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxA
cmlzY3N0YXIuY29tPiB3cm90ZToKPgo+IFRoYW5rcyBTY290dCwgVGhhbmtzIEFudXAuIFZlcnkg
bXVjaCBhcHByZWNpYXRlZC4KPgo+IFdlIGhhdmUgYWxyZWFkeSBiZWVuIHVzaW5nIGVjYWxsLCBJ
IGNhbiBleHRlbmQgaXQgdG8gdXNlIGl0IGZvciBwYXJhdmlydCBmb3IgJ0lSUScuCj4KPiBUaGUg
b25seSBkb3duc2lkZSBpcyBlY2FsbCBpcyBhbiBleHRlbnNpb24gcmF0aGVyIHRoYW4gdHJhcCBh
bmQgZW11bGF0ZSAodGhvdWdoIGl0IHJlc2lkZXMgd2l0aGluIHRyYXAgYW5kIGVtdWxhdGUgZnVu
Y3Rpb25hbGl0eSkuCgpZb3UgZG9uJ3QgbmVlZCB0byBkZWZpbmUgYSBuZXcgU0JJIGV4dGVuc2lv
biBmb3IgcGFyYXZpcnQgaW50ZXJydXB0IGNvbnRyb2xsZXIuCgpPcGVuU0JJIGNhbiBlbXVsYXRl
IFJQTUkgU3lzdGVtIE1TSSBvdmVyIFNCSSBNUFhZIGNoYW5uZWwgYXMgdGhlCnBhcmF2aXJ0IGlu
dGVycnVwdCBjb250cm9sbGVyLiBUaGVyZSBhcmUgc29tZSBpbXByb3ZlbWVudHMgcmVxdWlyZWQg
aW4KdGhlIFJQTUkgU3lzdGVtIE1TSSBzZXJ2aWNlIGdyb3VwIHRvIGFjaGlldmUgdGhpcyB3aGlj
aCBJIHdpbGwgcHJvcG9zZQpzb29uLgoKUmVnYXJkcywKQW51cAoKPgo+IFRoYW5rcyBmb3IgdGhl
IGZlZWRiYWNrLgo+Cj4gVGhhbmtzIGFuZCByZWdhcmRzCj4gRGF2ZQo+Cj4gT24gVGh1LCBGZWIg
MTIsIDIwMjYgYXQgMzo0MOKAr1BNIEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPj4KPj4gT24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgODozOOKAr1BNIFNjb3R0IEJh
bWJyb3VnaCA8c2NvdHRAcmlzY3N0YXIuY29tPiB3cm90ZToKPj4gPgo+PiA+IElzIFBNUCB1bml2
ZXJzYWxseSBhdmFpbGFibGU/Cj4+Cj4+IFllcywgUE1QIGlzIG5vdCB1bml2ZXJzYWxseSBhdmFp
bGFibGUgcGx1cyB3ZSBtaWdodAo+PiBub3QgaGF2ZSBlbm91Z2ggUE1QIHJlZ2lvbnMuCj4+Cj4+
IENsZWFuZXIgYXBwcm9hY2ggaXMgdG8gdXNlIGFuICJlY2FsbCIgYmFzZWQgcGFyYXZpcnQKPj4g
aW50ZXJydXB0IGNvbnRyb2xsZXIuCj4+Cj4+IFJlZ2FyZHMsCj4+IEFudXAKPj4KPj4gPiBTY290
dAo+PiA+Cj4+ID4gT24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgOTo1OOKAr0FNIEFudXAgUGF0ZWwg
PGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4gPj4KPj4gPj4gT24gV2VkLCBGZWIg
MTEsIDIwMjYgYXQgMzozMOKAr1BNIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4+
ID4+ID4KPj4gPj4gPiBGcm9tOiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4K
Pj4gPj4gPgo+PiA+PiA+IFNpZ25lZC1vZmYtYnk6IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlz
Y3N0YXIuY29tPgo+PiA+PiA+IC0tLQo+PiA+PiA+ICBsaWIvc2JpL3NiaV9pbGxlZ2FsX2luc24u
YyB8IDI1ICsrKysrKysrKysrKysrKysrKysrKysrKy0KPj4gPj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gPj4gPgo+PiA+PiA+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYyBiL2xpYi9zYmkvc2JpX2lsbGVnYWxfaW5z
bi5jCj4+ID4+ID4gaW5kZXggZmE4MjI2NGEuLjg4MDc5ZTM5IDEwMDY0NAo+PiA+PiA+IC0tLSBh
L2xpYi9zYmkvc2JpX2lsbGVnYWxfaW5zbi5jCj4+ID4+ID4gKysrIGIvbGliL3NiaS9zYmlfaWxs
ZWdhbF9pbnNuLmMKPj4gPj4gPiBAQCAtMTEwLDEwICsxMTAsMzMgQEAgc3RhdGljIGludCBzeXN0
ZW1fb3Bjb2RlX2luc24odWxvbmcgaW5zbiwgc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MpCj4+
ID4+ID4gICAgICAgICByZXR1cm4gMDsKPj4gPj4gPiAgfQo+PiA+PiA+Cj4+ID4+ID4gK3N0YXRp
YyBpbnQgc2JpX2dldF9lbXVsYXRlZF9pcnFfaW5zbih1bG9uZyBpbnNuLCBzdHJ1Y3Qgc2JpX3Ry
YXBfcmVncyAqcmVncykKPj4gPj4gPiArewo+PiA+PiA+ICsgICAgICAgdWxvbmcgcnMxX3ZhbCAg
ID0gR0VUX1JTMShpbnNuLCByZWdzKTsKPj4gPj4gPiArICAgICAgIHVsb25nIHJzMl92YWwgICA9
IEdFVF9SUzIoaW5zbiwgcmVncyk7Cj4+ID4+ID4gKyAgICAgICAvL3Vsb25nIHByZXZfbW9kZSA9
IHNiaV9tc3RhdHVzX3ByZXZfbW9kZShyZWdzLT5tc3RhdHVzKTsKPj4gPj4gPiArICAgICAgIHVs
b25nIGlycV92YWw7Cj4+ID4+ID4gKwo+PiA+PiA+ICsgICAgICAgLyoKPj4gPj4gPiArICAgICAg
IC8vIFRoaXMgaXMgd2VyZSB0aGUgZW11YWx0ZWQgaXJxIHZsYXVlIGlzIGZldGNoZWQKPj4gPj4g
PiArICAgICAgIGlmIChwcmV2X21vZGUgPT0gUFJWX1MgJiYgc2JpX2VtdWxhdGVfaXJxX3JlYWQo
JmlycV92YWwpKQo+PiA+PiA+ICsgICAgICAgICAgICAgICByZXR1cm4gdHJ1bHlfaWxsZWdhbF9p
bnNuKGluc24sIHJlZ3MpOwo+PiA+PiA+ICsgICAgICAgKi8KPj4gPj4gPiArCj4+ID4+ID4gKyAg
ICAgICAvLyBGb3IgdGVzdGluZwo+PiA+PiA+ICsgICAgICAgaXJxX3ZhbCA9IHJzMV92YWwgKyBy
czJfdmFsOwo+PiA+PiA+ICsKPj4gPj4gPiArICAgICAgIFNFVF9SRChpbnNuLCByZWdzLCBpcnFf
dmFsKTsKPj4gPj4gPiArCj4+ID4+ID4gKyAgICAgICByZWdzLT5tZXBjICs9IDQ7Cj4+ID4+ID4g
Kwo+PiA+PiA+ICsgICAgICAgcmV0dXJuIDA7Cj4+ID4+ID4gK30KPj4gPj4gPiArCj4+ID4+ID4g
IHN0YXRpYyBjb25zdCBpbGxlZ2FsX2luc25fZnVuYyBpbGxlZ2FsX2luc25fdGFibGVbMzJdID0g
ewo+PiA+PiA+ICAgICAgICAgdHJ1bHlfaWxsZWdhbF9pbnNuLCAvKiAwICovCj4+ID4+ID4gICAg
ICAgICB0cnVseV9pbGxlZ2FsX2luc24sIC8qIDEgKi8KPj4gPj4gPiAtICAgICAgIHRydWx5X2ls
bGVnYWxfaW5zbiwgLyogMiAqLwo+PiA+PiA+ICsgICAgICAgc2JpX2dldF9lbXVsYXRlZF9pcnFf
aW5zbiwgICAvKiAyICovCj4+ID4+Cj4+ID4+IFdlIGNhbid0IHBpY2sgYXJiaXRyYXJ5IGluc3Ry
dWN0aW9uIGVuY29kaW5nIGZvcgo+PiA+PiB0cmFwLW4tZW11bGF0aW9uIG9mIGFuIGludGVycnVw
dCBjb250cm9sbGVyLgo+PiA+Pgo+PiA+PiBJZiB0aGUgZ29hbCBpcyB0byB0cmFwLW4tZW11bGF0
ZSBhbiBNTUlPIGRldmljZQo+PiA+PiB0aGVuIHVzZSBQTVAgYmFzZWQgYWNjZXNzIGZhdWx0cy4K
Pj4gPj4KPj4gPj4gUmVnYXJkcwo+PiA+PiBBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QK
b3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
