Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E79FF885A
	for <opensbi@archiver.kernel.org>; Mon,  4 May 2026 09:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=clDBg+F0aDaowU1oNir3y6yj3pQIhYEL0KJiAr1oHZ8=; b=oSOQYq4tZoem1l
	2Pj5kOE1CUuP9Pi+U+Tv+7A3748lLlmPWZ+8+RD8PdTrDc0bKDWdrUdneYo8hpBMQiVRQz9WaGSCl
	KF2YF4Foip50e3reBlk+tNOFex0hoV9WvhqN5rqWzftZ54Js4JjyN5KHHxnKe+Kmj6/p2+JGcezZO
	vlScQp/miCctgbwW0DcIbpLCxZQf7ipQlSfqFya28igmtzX722MdJdb7H8FDP3acDEcx1Tx3Mx/Tm
	Ft1xPwFJXtcE687KaxP+IMJJEMjNLLQ5Kq1p4eb/BmNPGmZGntMKZLwnG9zPzCmoa/6QEI1XbnUc6
	IK1iTRJR48UcTSN+q2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpAq-0000000CmPS-2ZVj;
	Mon, 04 May 2026 09:01:08 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJpAo-0000000CmP2-0G8L
	for opensbi@lists.infradead.org;
	Mon, 04 May 2026 09:01:07 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-6967080e6beso1062842eaf.2
        for <opensbi@lists.infradead.org>; Mon, 04 May 2026 02:01:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777885265; cv=none;
        d=google.com; s=arc-20240605;
        b=WusNImhN1TU+edFaJ9SsWVPE8kriSq8xwJCTCCDGmuc5f5BRigWgK4ZGxb9HM1K3av
         SYsXrx5GbKVRvXOWSwuQGx8zokLx14VF+vqQheoWqPS7OhANPTR2Fg2pxqkMmevQzHnk
         aK5tYzAuT+xJbZJA6Jixu5H4lor4d7Die13tKIS0b2q855YL7CIv9ynoJzXh7w40h02u
         S2DOJ7z2E1FeOV/z/84kervaubut5jSAKSyEXHk8YQGWiGFXGTzdCSDyDlKJxWhseV8Q
         mk9ZzclbK1l66Ld8cY7eqbKy90rkc10pNUFWp7hCsrbd7gyFhZZLu6rBwU/dku6kC4tv
         sIzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mQAGYqfCWThrU+h4pb4L6b6Qqy1j2feKMoetGCR82mE=;
        fh=ZAtPgNT/mWeTZ6vNEkZRyB0hM0YzwkpsSL1tZLHA+mM=;
        b=gGgw8TeZe0fJKIkDUXYlrHyUCwNyy/uIW07sp1m/ztKxfWeqrZRHYBl0QtCmYNBxDa
         2xncsGcU9EkH/XZxPxp6TKFR21a7bIKvRds1+Q8Fyfe2ROTPjBbTrPQoZX1gecgCnKsQ
         BNpG2VEvo7NPLjln379ycD+6JXPwXv/NHCf2znhDxZMURN2lJ7KpbK7Y7v5tsUvcRlxf
         sO2HSnYX8YrYx76sFADja1dCb3LK39CWsJ5rRlSuu9gby8ZJZiyVrP+6lraYLME0ZL+X
         qR6FhE4JiYJI7+3dLC2lD25cxhJwm69uZd+aGl6qh/OLSJ29+aQVnxc3ECNQWEegkE6S
         9Iow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1777885265; x=1778490065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mQAGYqfCWThrU+h4pb4L6b6Qqy1j2feKMoetGCR82mE=;
        b=RBEJ5NARTGhD0rsX7e46xF7iny6LYgYKNTn9GzN1zIe3jYBgUczEJ8kEnERXKLa2Fp
         rzYLQd1k/kUXjFHjnlW6l7b0tHXC1isyenaC8/l8fySWDI+idD8PhDkrxZoqgwqOGVH3
         NHw2MparpHOeYoT1rach5rlmMbcmkFuOB6Mqb6hTtK8DBjptjr5oMonYxy1X1wy6VEEY
         ojBgPCbMlDwWIAtwz6slL1qCFdAmSMx/4oB6t49EOG99UwVJsUQa3ogkETDaQFIkBpMg
         oigBtR/8+587Pm3OZ/9CMhL5DSxXbV5DS5eYCM61t2+WV//mCP7MrQu49WBU1TEIqnsf
         0yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777885265; x=1778490065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mQAGYqfCWThrU+h4pb4L6b6Qqy1j2feKMoetGCR82mE=;
        b=AzSUJ/cW83XFRwgUm7GNfs0n7ZYuZ4z/5hbYJl4dwL8swgeShg8UzfZxnIOWLrtW7Q
         ZVJ1OziHGVXdz4Or1GO5aBBaHaGEiFfXneOEH8S6Yd+2T+fX2YE9lWR0YgbTgNO2qK4+
         ZMDYEuj9+lAlkvpTrWlwxrEnEmfpAhDASrUfmr0L+gNhJMvsauMIxFeNjMIg3hTlkOI1
         0HFveR9yi4TT228aADBxx9rY+/Wi1Iy2xRBgk610Vsm1+92nH8+e4n5JS6PcpilQ+ZMB
         j1ZVj19T8mSFbM+JphMcpt1eI4QmhwTRfQ/tQJ3Pmdeyq/zJRAprZoH9QAHqG4zYVPbV
         UFvg==
X-Gm-Message-State: AOJu0YxPvpdBbvcW74BbsyxSqsdkJRNbjzS3hus6AlqBdSrQ1jb8lVbE
	fx0PmPmcPeCnhN/K9VuWikC2o4Dga/AqT9CpTdqaocpz8AUB8/bpA3BbrntcHRMFqYbGlTFi3w3
	p7xX73Bm9tgpM9p53Qs5MV0mjsY64UCUUpP4UmZtgTy9ve4zRmgLqyeyhdA==
X-Gm-Gg: AeBDieugVZ3aMzDPHA4KBJgM7h3e3pl9BCUDc0p4v2oZd29akUNMh5G+Rs6oD4LsDUv
	By6k0Rz9BXIHlsD19d7tCYfrC7RFb/SYQPfrFy44jMRMEypLvVd3ze8gg0SdxNDut17ZrRi3Qv1
	LeBHCvkD9RT4iZoNKgUB55Oe2LNi4S0XU+oc2C5D8EifOtrwJ+kk7LKZSi1c+vBq92JyBOM/Mcv
	ECEWtcdqTNQPUKcr9ynrn7dUDSNIk1d0o/rE+aG5VCrE0zHnW9TacGxuu+OrjEfsKPkxF9CSnXv
	fhOAqo54YGOChemXwub2J6298uQQhgRr3W51SHz2G0wAe+ujajuqQz0Ts9AgdjCC8+L1bkFObym
	qx6wTflnJjeJLLtq8gYrB/KaSAparFLbLcw23aA5XqyWhn2c=
X-Received: by 2002:a05:6820:2d0b:b0:696:85b1:7fe2 with SMTP id
 006d021491bc7-696979f4a97mr4286509eaf.20.1777885264768; Mon, 04 May 2026
 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260501211627.3293126-1-evvoevod@tenstorrent.com> <20260501211627.3293126-5-evvoevod@tenstorrent.com>
In-Reply-To: <20260501211627.3293126-5-evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 May 2026 14:30:53 +0530
X-Gm-Features: AVHnY4IegecY-Xezl0v9OfqvzL3hki3yYTWPgcmMm20hxF7m1MI0jXpO3guxQ_Y
Message-ID: <CAAhSdy2CHgZ7cmrENKeJOenbcsgTVrQVNPFequqtmgufZ=1Epg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] lib: sbi: Create a spot to place Smrnmi detection
 before traps and after DT is ready
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nylon Chen <nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_020106_136397_7A4AB4A7 
X-CRM114-Status: GOOD (  23.50  )
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

T24gU2F0LCBNYXkgMiwgMjAyNiBhdCAyOjQ24oCvQU0gRXZnZW55IFZvZXZvZGluIDxldnZvZXZv
ZEB0ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+Cj4gU2luY2UgU21ybm1pIGlzIGRldGVjdGVkIGZy
b20gdGhlIGRldmljZSB0cmVlLCBtb3ZlCj4gc2JpX3BsYXRmb3JtX2V4dGVuc2lvbnNfaW5pdCgp
IGJlZm9yZSB0cmFwLWJhc2VkIGZlYXR1cmUgZGV0ZWN0aW9uIHNvCj4gdGhlIGV4dGVuc2lvbiBp
cyBrbm93biB3aGVuIHRoZSBuZXh0IGNvbW1pdCBhY3RzIG9uIGl0Lgo+Cj4gVGhlIFprciBzZWVk
LUNTUiBhY2Nlc3MgY2FuIHRyYXAgaWYgWmtyIGlzIG5vdCBpbXBsZW1lbnRlZC4gT24gU21ybm1p
Cj4gcGxhdGZvcm1zIE5NSUU9MCBieSBkZWZhdWx0IGFmdGVyIHJlc2V0LCB3aGljaCByb3V0ZXMg
dGhhdCB0cmFwIHRvCj4gTk1FVkVDIHJhdGhlciB0aGFuIE1UVkVDLiBVbnRpbCBTbXJubWkgaGFu
ZGxlcnMgYXJlIGluc3RhbGxlZCBhbmQKPiBOTUlFPTEsIG5vIE5NRVZFQyBoYW5kbGVyIGlzIGlu
IHBsYWNlLCBzbyBhbiBlYXJseS1ib290IHRyYXAgdGhlcmUKPiB3b3VsZCBjcmFzaC4gUmVmYWN0
b3IgdGhlIGlubGluZSBzZWVkIGxvb3AgaW4gZndfYmFzZS5TIGludG8gYQo+IGNhbGxhYmxlIF9f
c3RhY2tfY2hrX2d1YXJkX2luaXQgZnVuY3Rpb24gYW5kIGludm9rZSBpdCBmcm9tCj4gaW5pdF9j
b2xkYm9vdCgpIGFmdGVyIHNiaV9oYXJ0X2luaXQoKSByZXR1cm5zOyB0aGUgbmV4dCBjb21taXQg
bWFrZXMKPiBzYmlfaGFydF9pbml0KCkgaW5zdGFsbCBTbXJubWkgaGFuZGxlcnMgYW5kIHNldCBO
TUlFPTEsIHNvIGJ5IHRoZSB0aW1lCj4gX19zdGFja19jaGtfZ3VhcmRfaW5pdCBydW5zIHRoZSB0
cmFwIHBhdGggaXMgc2FmZS4KPgo+IFNpZ25lZC1vZmYtYnk6IEV2Z2VueSBWb2V2b2RpbiA8ZXZ2
b2V2b2RAdGVuc3RvcnJlbnQuY29tPgo+IC0tLQo+ICBmaXJtd2FyZS9md19iYXNlLlMgfCA2NCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tCj4gIGxpYi9zYmkv
c2JpX2hhcnQuYyB8IDE2ICsrKysrKystLS0tLQo+ICBsaWIvc2JpL3NiaV9pbml0LmMgfCAxMCAr
KysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDYwIGluc2VydGlvbnMoKyksIDMwIGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Zpcm13YXJlL2Z3X2Jhc2UuUyBiL2Zpcm13YXJlL2Z3X2Jh
c2UuUwo+IGluZGV4IDA0M2RlN2Q3Li5lYmVjZmVjYyAxMDA2NDQKPiAtLS0gYS9maXJtd2FyZS9m
d19iYXNlLlMKPiArKysgYi9maXJtd2FyZS9md19iYXNlLlMKPiBAQCAtMTA3LDMwICsxMDcsNiBA
QCBfYnNzX3plcm86Cj4gICAgICAgICBhZGQgICAgIHM0LCBzNCwgX19TSVpFT0ZfUE9JTlRFUl9f
Cj4gICAgICAgICBibHQgICAgIHM0LCBzNSwgX2Jzc196ZXJvCj4KPiAtICAgICAgIC8qIFRyeWlu
ZyB0byBpbml0aWFsaXplIHRoZSBzdGFjayBndWFyZCB2aWEgdGhlIFprciBleHRlbnNpb24gKi8K
PiAtICAgICAgIGxsYSAgICAgdDAsIF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUKPiAtICAgICAgIGNz
cncgICAgQ1NSX01UVkVDLCB0MAo+IC0gICAgICAgbGkgICAgICB0MCwgMAo+IC0gICAgICAgbGkg
ICAgICB0MywgU0VFRF9PUFRTX0VTMTYKPiAtICAgICAgIGxpICAgICAgdDQsIFNFRURfRU5UUk9Q
WV9NQVNLCj4gLSAgICAgICBsaSAgICAgIHQ1LCBfX1NJWkVPRl9QT0lOVEVSX18KPiAtX19zdGFj
a19jaGtfZ3VhcmRfbG9vcDoKPiAtICAgICAgIGNzcnJ3ICAgdDEsIENTUl9TRUVELCB4MAo+IC0g
ICAgICAgbGkgICAgICB0MiwgU0VFRF9PUFRTX01BU0sKPiAtICAgICAgIGFuZCAgICAgdDIsIHQy
LCB0MQo+IC0gICAgICAgYmd0dSAgICB0MiwgdDMsIF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUKPiAt
ICAgICAgIGJsdHUgICAgdDIsIHQzLCBfX3N0YWNrX2Noa19ndWFyZF9sb29wCj4gLSAgICAgICBh
bmQgICAgIHQxLCB0MSwgdDQKPiAtICAgICAgIHNsbGkgICAgdDAsIHQwLCAxNgo+IC0gICAgICAg
b3IgICAgICB0MCwgdDAsIHQxCj4gLSAgICAgICBhZGRpICAgIHQ1LCB0NSwgLTIKPiAtICAgICAg
IGJndHogICAgdDUsIF9fc3RhY2tfY2hrX2d1YXJkX2xvb3AKPiAtICAgICAgIGxsYSAgICAgdDEs
IF9fc3RhY2tfY2hrX2d1YXJkCj4gLSAgICAgICBSRUdfUyAgIHQwLCAwKHQxKQo+IC0gICAgICAg
aiAgICAgICBfX3N0YWNrX2Noa19ndWFyZF9kb25lCj4gLSAgICAgICAuYWxpZ24gMwo+IC1fX3N0
YWNrX2Noa19ndWFyZF9kb25lOgo+IC0KPiAgICAgICAgIC8qIFNldHVwIHRlbXBvcmFyeSB0cmFw
IGhhbmRsZXIgKi8KPiAgICAgICAgIGxsYSAgICAgczQsIF9zdGFydF9oYW5nCj4gICAgICAgICBj
c3J3ICAgIENTUl9NVFZFQywgczQKPiBAQCAtODk1LDYgKzg3MSw0NiBAQCBfX3N0YWNrX2Noa19m
YWlsOgo+ICAgICAgICAgbGEgICAgICBhMCwgLkxzdGFja19jb3JydXB0X21zZwo+ICAgICAgICAg
Y2FsbCAgICBzYmlfcGFuaWMKPgo+ICsgICAgICAgLyoKPiArICAgICAgICAqIEluaXRpYWxpemUg
X19zdGFja19jaGtfZ3VhcmQgZnJvbSB0aGUgWmtyIHNlZWQgQ1NSLiBDYWxsZWQgZnJvbSBDCj4g
KyAgICAgICAgKiBhZnRlciBTbXJubWkgaGFzIGJlZW4gZW5hYmxlZCAoTk1JRT0xKSwgc28gdGhh
dCBhIG1pc3NpbmctWmtyCj4gKyAgICAgICAgKiBpbGxlZ2FsLWluc3RydWN0aW9uIHRyYXAgaXMg
ZGVsaXZlcmVkIHRvIE1UVkVDIG5vcm1hbGx5IGFuZCBpcwo+ICsgICAgICAgICogY2F1Z2h0IGJ5
IG91ciB0ZW1wb3JhcnkgTVRWRUMgcmVkaXJlY3QgYmVsb3cuCj4gKyAgICAgICAgKi8KPiArICAg
ICAgIC5hbGlnbiAzCj4gKyAgICAgICAuZ2xvYmwgX19zdGFja19jaGtfZ3VhcmRfaW5pdAo+ICsg
ICAgICAgLnR5cGUgX19zdGFja19jaGtfZ3VhcmRfaW5pdCwgJWZ1bmN0aW9uCj4gK19fc3RhY2tf
Y2hrX2d1YXJkX2luaXQ6Cj4gKyAgICAgICAvKiBTYXZlIGN1cnJlbnQgTVRWRUMgc28gd2UgY2Fu
IHJlc3RvcmUgaXQgb24gcmV0dXJuICovCj4gKyAgICAgICBjc3JyICAgIHQ2LCBDU1JfTVRWRUMK
PiArCj4gKyAgICAgICAvKiBSZWRpcmVjdCBNVFZFQyB0byBsb2NhbCBza2lwIHRhcmdldCBmb3Ig
WmtyLW5vdC1zdXBwb3J0ZWQgY2FzZSAqLwo+ICsgICAgICAgbGxhICAgICB0MCwgMWYKPiArICAg
ICAgIGNzcncgICAgQ1NSX01UVkVDLCB0MAo+ICsKPiArICAgICAgIGxpICAgICAgdDAsIDAKPiAr
ICAgICAgIGxpICAgICAgdDMsIFNFRURfT1BUU19FUzE2Cj4gKyAgICAgICBsaSAgICAgIHQ0LCBT
RUVEX0VOVFJPUFlfTUFTSwo+ICsgICAgICAgbGkgICAgICB0NSwgX19TSVpFT0ZfUE9JTlRFUl9f
Cj4gKzI6Cj4gKyAgICAgICBjc3JydyAgIHQxLCBDU1JfU0VFRCwgeDAKPiArICAgICAgIGxpICAg
ICAgdDIsIFNFRURfT1BUU19NQVNLCj4gKyAgICAgICBhbmQgICAgIHQyLCB0MiwgdDEKPiArICAg
ICAgIGJndHUgICAgdDIsIHQzLCAxZgo+ICsgICAgICAgYmx0dSAgICB0MiwgdDMsIDJiCj4gKyAg
ICAgICBhbmQgICAgIHQxLCB0MSwgdDQKPiArICAgICAgIHNsbGkgICAgdDAsIHQwLCAxNgo+ICsg
ICAgICAgb3IgICAgICB0MCwgdDAsIHQxCj4gKyAgICAgICBhZGRpICAgIHQ1LCB0NSwgLTIKPiAr
ICAgICAgIGJndHogICAgdDUsIDJiCj4gKyAgICAgICBsbGEgICAgIHQxLCBfX3N0YWNrX2Noa19n
dWFyZAo+ICsgICAgICAgUkVHX1MgICB0MCwgMCh0MSkKPiArICAgICAgIGogICAgICAgMWYKPiAr
ICAgICAgIC5hbGlnbiAzCj4gKzE6Cj4gKyAgICAgICBjc3J3ICAgIENTUl9NVFZFQywgdDYKPiAr
ICAgICAgIHJldAo+ICsKCkluaXRpYWxpemluZyBfX3N0YWNrX2Noa19ndWFyZCBmcm9tIEMgY29k
ZSBtYXkgYnJlYWsgc3RhY2sKY2FuYXJ5IGFscmVhZHkgcHVzaGVkIG9uIHN0YWNrIGhlbmNlIGl0
IGlzIGJldHRlciB0byBpbml0aWFsaXplCl9fc3RhY2tfY2hrX2d1YXJkIGluIGxvdy1sZXZlbCBj
b2RlIGJlZm9yZSBlbnRlcmluZyBDIGNvZGUuCgpJbnN0ZWFkIG9mIHRoZSBhcHByb2FjaCB0YWtl
biBieSB0aGlzIHBhdGNoLCBteSBzdWdnZXN0aW9uCmlzIHRvIHNldCBtbnN0YXR1cy5OTUlFIGVh
cmx5IG9uIHNvIHRoYXQgbXR2ZWMgYmFzZWQgdHJhcApiZWhhdmUgbm9ybWFsbHkgYW5kIHNldHVw
IE5NSSB0cmFwIGhhbmRsZXIgbGF0ZXIgaW4gdGhlCmZ3X3BsYXRmb3JtX2luaXQoKSBvciBuYXNj
ZW50X2luaXQoKS4KClNvbWV0aGluZyBsaWtlIGJlbG93LCBjYW4gaGVscCAuLi4KCmRpZmYgLS1n
aXQgYS9maXJtd2FyZS9md19iYXNlLlMgYi9maXJtd2FyZS9md19iYXNlLlMKaW5kZXggMDQzZGU3
ZDcuLjIxZDU5ZTcxIDEwMDY0NAotLS0gYS9maXJtd2FyZS9md19iYXNlLlMKKysrIGIvZmlybXdh
cmUvZndfYmFzZS5TCkBAIC0zOSw2ICszOSwxNiBAQAogICAgIGxpICAgICBcdG1wLCBNU1RBVFVT
X01EVAogICAgIGNzcmMgICAgQ1NSX01TVEFUVVMsIFx0bXAKICNlbmRpZgorLmVuZG0KKworLm1h
Y3JvIFBBUlRJQUxMWV9FTkFCTEVfU01STk1JIHRtcAorICAgIGxsYSAgICBcdG1wLCA5OTk5Zgor
ICAgIGNzcncgICAgQ1NSX01UVkVDLCBcdG1wCisgICAgbGkgICAgXHRtcCwgTU5TVEFUVVNfTk1J
RQorICAgIGNzcnMgICAgQ1NSX01OU1RBVFVTLCBNTlNUQVRVU19OTUlFCisgICAgaiAgICA5OTk5
ZgorICAgIC5hbGlnbiAzCis5OTk5OgogLmVuZG0KCiAgICAgLnNlY3Rpb24gLmVudHJ5LCAiYXgi
LCAlcHJvZ2JpdHMKQEAgLTEwNyw2ICsxMTcsMTIgQEAgX2Jzc196ZXJvOgogICAgIGFkZCAgICBz
NCwgczQsIF9fU0laRU9GX1BPSU5URVJfXwogICAgIGJsdCAgICBzNCwgczUsIF9ic3NfemVybwoK
KyAgICAvKgorICAgICAqIFBhcnRpYWxseSBlbmFibGUgU21ybm1pIGVhcmx5IGZvciBib290IEhB
UlQgc28gdGhhdAorICAgICAqIG5vcm1hbCB0cmFwcyBnZXQgcm91dGVkIHRvIG10dmVjIHRyYXAg
aGFuZGxlci4KKyAgICAgKi8KKyAgICBQQVJUSUFMTFlfRU5BQkxFX1NNUk5NSSB0MAorCiAgICAg
LyogVHJ5aW5nIHRvIGluaXRpYWxpemUgdGhlIHN0YWNrIGd1YXJkIHZpYSB0aGUgWmtyIGV4dGVu
c2lvbiAqLwogICAgIGxsYSAgICB0MCwgX19zdGFja19jaGtfZ3VhcmRfZG9uZQogICAgIGNzcncg
ICAgQ1NSX01UVkVDLCB0MApAQCAtMzM5LDYgKzM1NSwxMiBAQCBfd2FpdF9mb3JfYm9vdF9oYXJ0
OgogICAgIGJuZSAgICB0MCwgdDEsIF93YWl0X2Zvcl9ib290X2hhcnQKCiBfc3RhcnRfd2FybToK
KyAgICAvKgorICAgICAqIFBhcnRpYWxseSBlbmFibGUgU21ybm1pIGVhcmx5IGZvciBjdXJyZW50
IEhBUlQgc28gdGhhdAorICAgICAqIG5vcm1hbCB0cmFwcyBnZXQgcm91dGVkIHRvIG10dmVjIHRy
YXAgaGFuZGxlci4KKyAgICAgKi8KKyAgICBQQVJUSUFMTFlfRU5BQkxFX1NNUk5NSSB0MAorCiAg
ICAgLyogUmVzZXQgYWxsIHJlZ2lzdGVycyBleGNlcHQgcmEsIGEwLCBhMSwgYTIsIGEzIGFuZCBh
NCBmb3IKbm9uLWJvb3QgSEFSVCAqLwogICAgIGxpICAgIHJhLCAwCiAgICAgY2FsbCAgICBfcmVz
ZXRfcmVncwoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL29wZW5zYmkK
