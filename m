Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320C4EE3695
	for <opensbi@archiver.kernel.org>; Thu, 12 Feb 2026 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrOewsns9ySZekI8TWR+pbkasUwe/qoANwLjH0elh04=; b=j+sHYVEAtZL4qI
	JTvqzfUjtOeX1rjnXae9WSjv28p0oCg8X9pUnGj34fWNEq46OZp7GVXLxP0rMS+EImU3FwQPeVT0J
	vUjdnu31tfSWVdsheGSdWmdZi5Pfla0g8FaP88klOYILz5xduwn8NzAH/9mAxrCrh8zQ30mmLPTF9
	q0pf60q1phcSTw5xxNyHHbdsTL00LvjnFRulGVl/ZkWKnsE4H0fSWgRbYFvzGRqdv58ijsRJxamFF
	nIE8g6crQUnvS+rVtjVk3s1GpM9PFAVk6d7jbvATshs1Ufj9cF2hw8Ve/9YeFjzDNzJyBCf3E4Ajv
	DXHKAP+XLn3R7aU/wdzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZBO-00000002JBa-3ggw;
	Thu, 12 Feb 2026 16:04:46 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqZBL-00000002JAe-3PDA
	for opensbi@lists.infradead.org;
	Thu, 12 Feb 2026 16:04:45 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-5f178c83a3dso1885737137.3
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 08:04:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770912281; cv=none;
        d=google.com; s=arc-20240605;
        b=WoPbP2chpYsfKK9ipFXgs7qSGNMRJPvf4/Jy8a1vnZTmMgSFbFR13Ju0wjHPilC/la
         9BXDTge1KVHSDONFFtaDlQV/C/Z2IxsHJx3IA/dtgkeXE5dut92t8IUOAqpAsWG/9/zb
         oKxfZyOopfkcyNjEY9l8LSyNE6VJ/HnqQdi+1sUMBMbMBd03HY/G6ETjbW5ad0aI39w2
         avItnLzU34fazJoWlOP/CdXD+qkSECUSr/++hojckizAR80tyTT3DQeqPTJ3yqxxc8Ll
         N8WXo2rbEf7GkHSc1WQXAE2S5EenZmTCSCT+T96YqOXWRBLNDV2jZ5bZinbnUwvSyPUb
         hXDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rhFI5ZYiqZqWBAOP7ycvQMXoEisL+K80jdHTwdME5H4=;
        fh=b8AinCbixKjSXoveYojBmvmNe4I2TS2tDSRG90XkMhM=;
        b=UKnRz/kFDF+c3oOpZDh2Buy4XiBK8gYeDnkpjUpBDtWD6svqF+O2UtQC8hD6V8UFzx
         0CW4H1LLB9sjhtJyZ5vRts4OCLimDk0rKmHcXbS7193/Iy+CLlZfBaHMXmqpu5k7AyVC
         wmnUNVbCm45lDPFWCwtIEUWkvAtX0+oHmFDDnTJqSRHhAPjpaGH115dQkSYzhAYhBd4b
         wA6mKtroCdD67kARA4tocwekBeog90zr+TaIFpKh7AgM4TbHoTLeeSNY1c8QvxY6QuZ/
         LR2EhY8Qh8QzT6gzWCmhHP93kXwNdacUgej/98uFy5Amofpp4lMZFIUCVoe3DXh/j3RF
         SF0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770912281; x=1771517081; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rhFI5ZYiqZqWBAOP7ycvQMXoEisL+K80jdHTwdME5H4=;
        b=EDUY8/yItWLSxp1eS26BbO/s9xQbSxY81zDiZzEfMhx1sO9SvWyt/UawHR2yWVT2UA
         1sZlQ1tPj4Yew8baX80xOygzHGV36/gFhYeRVC5n6+JCSjNSChWQAfni3CuU1sc8izBQ
         NvP9fAJR1rTlRM//g/fJGXivJz9fsnx4MZLVqvZr9zt1o4JuQ5+1U6kgNsMR0OkLJLVa
         0YahcRNOkHn9wiyPN0mUyMNNtLzOyXLzGIKFv8Fk+AZ07DmgCl3JbmDEoVGdhaCCW7On
         YCHesjrljz9BJx2Zgd/w40WrHqFmDTOCbajNjkUVWNAOgYahrZ0FkqgOdFVaIu+mbNGa
         kh4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770912281; x=1771517081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rhFI5ZYiqZqWBAOP7ycvQMXoEisL+K80jdHTwdME5H4=;
        b=EXdrdgoLblUXIFjAZgtIZunlybzIR5tD5hsyWQWotnoByvWkBcNx/NDxFcypqVzuC7
         4itHrZ+IRtKTFY4ABzLSj6oIfI5dvyVv5evPDxLJs2OcXTng6ylIxlC+2GWtIxx8wP+t
         QoO5N0O9ZOcUIT3HtCtYrvGopHc00Q+w/tpbwnTM3FC8x+D1XS/5W/tpXX5JBmu6lGGg
         CMqG3LWaUTMo/7hRXQ6mOA9pKWD31RdJHjikAa0lm4DEcv86woFY8JLmgyGl+muXYzt6
         jNKzR0pf3LBksW+lA7dHJ3gBNZ6LPQFhd8XyrC1W1YNKutg67hnHDEPIf1ORgh8++ElO
         0J8g==
X-Forwarded-Encrypted: i=1; AJvYcCVTgLOsq1oGfbDPkg3cVh2Fj4C5jt/hm3Bb3BysEcmDPfSk0gDrSv/NUKOJ30vUevE0CblffbiT@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ9A+Yyva2iRgWv9GstVLJmdMi2eI+Rg+1CVwgbsSvsRGYQivz
	spmrP+wcE4l7LhU6zcag7hRL2a8k+4HOE+TU05UcY3yAbOk3FVeIwFHbwpJNoEpMuVOze/S+wLc
	w1RE6oEWlqNP+yZkBysD5v4BOtCb9irs=
X-Gm-Gg: AZuq6aIKpkYh/WWuKeNH72as3w9qkoJ8DBikboyPnRMtmqnNQBKk92eSJoadQPPj/Jj
	YbCjKGVPWwttSZ8xCK/AtYOyCv+ngLQPG0ZsFuZflLXEs+shWmUwK6+maksl6ZE7kDzlG6S+hT2
	7EWsM6n3B0V2PHB03VF4HGuU8r+ABDTgT5LojIAJh9GIwxOiBIg6jyzS9s+sNGJzlh/THeJAOF0
	YGORYH7miJPfvuD6sjsFDcrOYxbCBhEVTglziis2gYfdcqQIhUX8W+sG10KLh5RC2UY/s6PC8uE
	7Uxlp4EudgvUNedI1Tk=
X-Received: by 2002:a05:6102:290b:b0:5f5:328e:73ab with SMTP id
 ada2fe7eead31-5fdfbb4ef81mr1140445137.32.1770912281420; Thu, 12 Feb 2026
 08:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20260211100010.4082-1-dave.patel@riscstar.com>
 <CAK9=C2UN2kAhXx0RvL07T+a31bYKS=sOnHhmkOBpkmXKproxMg@mail.gmail.com>
 <CAL2H45cQm_O-K-6weC-xeGNB0+yCHjQe1msS+JwHdKLKecM5CA@mail.gmail.com> <CAK9=C2XLsvs45jAtORxucWDskvz4q_X9FUgoaPJ9Kiqt3=V6XQ@mail.gmail.com>
In-Reply-To: <CAK9=C2XLsvs45jAtORxucWDskvz4q_X9FUgoaPJ9Kiqt3=V6XQ@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Thu, 12 Feb 2026 11:04:29 -0500
X-Gm-Features: AZwV_Qgahp_8iFroXfLttR0TiALUK0yzXgK5AdKxv4LEgOxa0FyhNmaSRkLUkP4
Message-ID: <CAMDkj5yoLnOLKuv=KJ6VDoUFKtZmX+TrLMuNng6-tAV0KfH34g@mail.gmail.com>
Subject: Re: [PATCH] Trap and Emulate changes
To: Anup Patel <apatel@ventanamicro.com>
Cc: Scott Bambrough <scott@riscstar.com>, dave.patel@riscstar.com, 
	opensbi@lists.infradead.org, Ray Mao <raymond.mao@riscstar.com>, 
	Robin Randhawa <robin.randhawa@sifive.com>, Anup Patel <anup.patel@qti.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_080443_864301_4686E703 
X-CRM114-Status: GOOD (  27.74  )
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

SGkgQW51cCwKCk9uIFRodSwgRmViIDEyLCAyMDI2IGF0IDEwOjQx4oCvQU0gQW51cCBQYXRlbCA8
YXBhdGVsQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBGZWIgMTIsIDIwMjYg
YXQgODozOOKAr1BNIFNjb3R0IEJhbWJyb3VnaCA8c2NvdHRAcmlzY3N0YXIuY29tPiB3cm90ZToK
PiA+Cj4gPiBJcyBQTVAgdW5pdmVyc2FsbHkgYXZhaWxhYmxlPwo+Cj4gWWVzLCBQTVAgaXMgbm90
IHVuaXZlcnNhbGx5IGF2YWlsYWJsZSBwbHVzIHdlIG1pZ2h0Cj4gbm90IGhhdmUgZW5vdWdoIFBN
UCByZWdpb25zLgo+Cj4gQ2xlYW5lciBhcHByb2FjaCBpcyB0byB1c2UgYW4gImVjYWxsIiBiYXNl
ZCBwYXJhdmlydAo+IGludGVycnVwdCBjb250cm9sbGVyLgo+CgplY2FsbCBpcyBhbHJlYWR5IGlu
IHRoZSBwbGFuLCBiYXJlLW1ldGFsIGFwcCB3aWxsIHVzZSB0aGUgZWNhbGwgdG8gcG9wCmFuIFZJ
UlEgZnJvbSB0aGUgcXVldWUgaXQgYmVsb25ncyB0by4KU28gZG8geW91IG1lYW4gdG8gdXNlIGEg
dHJhcCBoYW5kbGVyIGluIFMtZG9tYWluIHRvIGZpcmUgdGhlIGVjYWxsCndoZW4gYSBNTUlPIGFk
ZHJlc3MgKHNpbXVsYXRlcyBDTEFJTUkpIGlzIGFjY2Vzc2VkPwpCdXQgdGhhdCBtZWFucyB0aGUg
ZW11bGF0aW9uIGlzIGltcGxlbWVudGVkIGluIHRoZSBiYXJlLW1ldGFsIGFwcApzaWRlLCBhbmQg
b3RoZXIgYXBwcyBuZWVkIHRvIGludGVncmF0ZSB0aGUgc2FtZSB3b3JrLgpUaGUgb3JpZ2luYWwg
aWRlYSBpcyB0byBkbyB0aGUgZW11bGF0aW9uIGluIE0tbW9kZSwgc28gdGhhdCBhbGwgUy1tb2Rl
ClNXIGNhbiBzdGF5IHVuY2hhbmdlZC4KClJlZ2FyZHMsClJheW1vbmQKCj4gUmVnYXJkcywKPiBB
bnVwCj4KPiA+IFNjb3R0Cj4gPgo+ID4gT24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgOTo1OOKAr0FN
IEFudXAgUGF0ZWwgPGFwYXRlbEB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+Pgo+ID4+IE9u
IFdlZCwgRmViIDExLCAyMDI2IGF0IDM6MzDigK9QTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
IHdyb3RlOgo+ID4+ID4KPiA+PiA+IEZyb206IERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0
YXIuY29tPgo+ID4+ID4KPiA+PiA+IFNpZ25lZC1vZmYtYnk6IERhdmUgUGF0ZWwgPGRhdmUucGF0
ZWxAcmlzY3N0YXIuY29tPgo+ID4+ID4gLS0tCj4gPj4gPiAgbGliL3NiaS9zYmlfaWxsZWdhbF9p
bnNuLmMgfCAyNSArKysrKysrKysrKysrKysrKysrKysrKystCj4gPj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDI0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+PiA+Cj4gPj4gPiBkaWZmIC0t
Z2l0IGEvbGliL3NiaS9zYmlfaWxsZWdhbF9pbnNuLmMgYi9saWIvc2JpL3NiaV9pbGxlZ2FsX2lu
c24uYwo+ID4+ID4gaW5kZXggZmE4MjI2NGEuLjg4MDc5ZTM5IDEwMDY0NAo+ID4+ID4gLS0tIGEv
bGliL3NiaS9zYmlfaWxsZWdhbF9pbnNuLmMKPiA+PiA+ICsrKyBiL2xpYi9zYmkvc2JpX2lsbGVn
YWxfaW5zbi5jCj4gPj4gPiBAQCAtMTEwLDEwICsxMTAsMzMgQEAgc3RhdGljIGludCBzeXN0ZW1f
b3Bjb2RlX2luc24odWxvbmcgaW5zbiwgc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MpCj4gPj4g
PiAgICAgICAgIHJldHVybiAwOwo+ID4+ID4gIH0KPiA+PiA+Cj4gPj4gPiArc3RhdGljIGludCBz
YmlfZ2V0X2VtdWxhdGVkX2lycV9pbnNuKHVsb25nIGluc24sIHN0cnVjdCBzYmlfdHJhcF9yZWdz
ICpyZWdzKQo+ID4+ID4gK3sKPiA+PiA+ICsgICAgICAgdWxvbmcgcnMxX3ZhbCAgID0gR0VUX1JT
MShpbnNuLCByZWdzKTsKPiA+PiA+ICsgICAgICAgdWxvbmcgcnMyX3ZhbCAgID0gR0VUX1JTMihp
bnNuLCByZWdzKTsKPiA+PiA+ICsgICAgICAgLy91bG9uZyBwcmV2X21vZGUgPSBzYmlfbXN0YXR1
c19wcmV2X21vZGUocmVncy0+bXN0YXR1cyk7Cj4gPj4gPiArICAgICAgIHVsb25nIGlycV92YWw7
Cj4gPj4gPiArCj4gPj4gPiArICAgICAgIC8qCj4gPj4gPiArICAgICAgIC8vIFRoaXMgaXMgd2Vy
ZSB0aGUgZW11YWx0ZWQgaXJxIHZsYXVlIGlzIGZldGNoZWQKPiA+PiA+ICsgICAgICAgaWYgKHBy
ZXZfbW9kZSA9PSBQUlZfUyAmJiBzYmlfZW11bGF0ZV9pcnFfcmVhZCgmaXJxX3ZhbCkpCj4gPj4g
PiArICAgICAgICAgICAgICAgcmV0dXJuIHRydWx5X2lsbGVnYWxfaW5zbihpbnNuLCByZWdzKTsK
PiA+PiA+ICsgICAgICAgKi8KPiA+PiA+ICsKPiA+PiA+ICsgICAgICAgLy8gRm9yIHRlc3RpbmcK
PiA+PiA+ICsgICAgICAgaXJxX3ZhbCA9IHJzMV92YWwgKyByczJfdmFsOwo+ID4+ID4gKwo+ID4+
ID4gKyAgICAgICBTRVRfUkQoaW5zbiwgcmVncywgaXJxX3ZhbCk7Cj4gPj4gPiArCj4gPj4gPiAr
ICAgICAgIHJlZ3MtPm1lcGMgKz0gNDsKPiA+PiA+ICsKPiA+PiA+ICsgICAgICAgcmV0dXJuIDA7
Cj4gPj4gPiArfQo+ID4+ID4gKwo+ID4+ID4gIHN0YXRpYyBjb25zdCBpbGxlZ2FsX2luc25fZnVu
YyBpbGxlZ2FsX2luc25fdGFibGVbMzJdID0gewo+ID4+ID4gICAgICAgICB0cnVseV9pbGxlZ2Fs
X2luc24sIC8qIDAgKi8KPiA+PiA+ICAgICAgICAgdHJ1bHlfaWxsZWdhbF9pbnNuLCAvKiAxICov
Cj4gPj4gPiAtICAgICAgIHRydWx5X2lsbGVnYWxfaW5zbiwgLyogMiAqLwo+ID4+ID4gKyAgICAg
ICBzYmlfZ2V0X2VtdWxhdGVkX2lycV9pbnNuLCAgIC8qIDIgKi8KPiA+Pgo+ID4+IFdlIGNhbid0
IHBpY2sgYXJiaXRyYXJ5IGluc3RydWN0aW9uIGVuY29kaW5nIGZvcgo+ID4+IHRyYXAtbi1lbXVs
YXRpb24gb2YgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIuCj4gPj4KPiA+PiBJZiB0aGUgZ29hbCBp
cyB0byB0cmFwLW4tZW11bGF0ZSBhbiBNTUlPIGRldmljZQo+ID4+IHRoZW4gdXNlIFBNUCBiYXNl
ZCBhY2Nlc3MgZmF1bHRzLgo+ID4+Cj4gPj4gUmVnYXJkcwo+ID4+IEFudXAKPgo+IC0tCj4gb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
