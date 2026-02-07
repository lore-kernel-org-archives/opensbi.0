Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E47EE0AE7
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 16:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZC9F5GGNAW4Ggi7iHhnVpLbjh9fu3Xm2D4Uuqc1b0g=; b=UiQ/4x8ZiFw0R4
	q+uIBDJIMvIcHkGoR9wtLdSzUza0Vw8H0FU9HOgFBw7114cz+Z/F01uIXeyY8nVd9W94ruzlQwu0E
	flDXLhTutBs9nV1FxZrRFubKNvp90eshvjPH7J5DItmkhVJFDKf9E5nDFdvbCt/WJ3vgNbdJrMjXO
	+79jIycp02iLYCzZWL4VaU86/LnlGs75cPM1Mc8DOV0SFkH+6Xbc3Zhw0kf5b34dYxTtVUUfq6J0n
	1Vuztx9BtckRzYvSdHq39kzIZxMWdfxteBjm/0ASRPn3+0VFq+BNoT1sSyDUh9fFoVua9VKTI7B18
	s7oG+0xgeRnpDzVz/vAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vol5n-0000000CcFl-2EQJ;
	Sat, 07 Feb 2026 16:23:31 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vol5j-0000000CcFO-2W3D
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 16:23:30 +0000
Received: by mail-vs1-xe34.google.com with SMTP id ada2fe7eead31-5f94f5ca9faso1918511137.3
        for <opensbi@lists.infradead.org>; Sat, 07 Feb 2026 08:23:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770481406; cv=none;
        d=google.com; s=arc-20240605;
        b=SFyVgyu3shqsDo5XwsES/gDmi2b1ko8K3NBGwznnHXUPtNUGAOP3IcsWK4jqvvLU/m
         WD1mLI5k0o22sDP57DDJRdmlO6N3Aho22Acy9RHlzN1EDGLvmJVdzo71LratBFyCuDII
         QG1yQhMFVkd8ejIiWngtZ4CCP/t38ylXasK/Tj0CvCxLXO96L6OWjuc5Sq+VUc+Yz0+N
         9kBWSvNVBXzUEM1D2KWnZvHA81DQE5kGKnT+7BwnPM3EzQD5LlC36d6akWHXnR3ZbMqe
         RxFlGIXX/s2GZ+55NYE9pInVKUePt09uISLY7CsT+dgCDV0oOM2ckYzzj00s22Isy0dI
         Vq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=71jbCcbGb3cEdgNRsmpn5iof5GePPMSN0e+WfUes+uQ=;
        fh=CeyCQp+XPGqs+/QFfJPRWct+orJ+/ruIFXLmnlb/73E=;
        b=hiEga/+acDU+04/HfSX+rEaIYmlSr1HqNrcDjFqm/tgagQQdfjgp5sIJ1uqDyWKmsK
         HXzlfcIiIhfnNOBRWACLhYeFNg1FJCepDDvOYQ61UEv7+kjWcT+WQ6fVccHriMQKQeJx
         i6jnaNHt7HguwJq1KzcYsRUan5N6eB+PShK/btJaiWKU04YeXor6Fr35MIa3jdo/npha
         d2VavcGxrJBE82N1C0B3uTgoxRRr7vuCuREx+rB4QOl/5HkgD/+je5VdVr4VZjbpoZbs
         dOA/EfELn9C2MCtYzdyGcOS11Pkw2Po6GzDB0Q14RMeUqDVjzL3Dwvqe5Zoiz+rbXMtJ
         79ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770481406; x=1771086206; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71jbCcbGb3cEdgNRsmpn5iof5GePPMSN0e+WfUes+uQ=;
        b=KUB8/NZHvVYbI8CncppMhycsWCnLm87EwKy9IlYSjP/BAFlLMJ2n4hjFN3KRIYSaS/
         5zwb82oSAR3zVTotCe39lP+ODusILFanwZvT9P/uk6agBK4N9lpycGGiv/G4i5io/DW3
         UNO8Z6dnAOctghSpK6Od76alsUESDNn2vJ4yRe/XBEW/CsKzYf9clAw7dENFdwfQB5h9
         UA57zDvL4vXYfClMHfUkE/SATBQozA9wUmgkKXE05PTEbjtz4bt56My2DCnf1UMk0sKT
         qCJrko28oNzqeIWoMFtLmwEnLpQjIghWUbfaQH12WixTEkPYyGuALWjf63oRdGkP+3l5
         yuCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770481406; x=1771086206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=71jbCcbGb3cEdgNRsmpn5iof5GePPMSN0e+WfUes+uQ=;
        b=TWKnYn2nZDc34Acj5XEqs7AEVsf04dbX5ZXTCMHKE76W3vNNoktF4XCceKj/Y2W0M6
         C7vM1pTayz+ZegCF6R2f4d+6MPVY36cyA9m/Ur/XVk93jbrb+4XXoYdwYRBhJQuQlna/
         q2Gd+XN5OOmftw5hG0Rk0A+0qzmnP//zDN3J9x0UmP7lqRvWRNwwpzOrGQa+AnTNt4zj
         E84fjhleq+p5mHZwlIhOdbhyZig9aMzA+rCQnZZNoo/IeNVz7bdSKGXmlLZz6uwSJdvr
         7pIA06cv3zfsqaUTSsX2agJjBGlmdwd9Mwox8gwObTXEjLPguI5EdBY10AOZQYTNj9u7
         3kEQ==
X-Gm-Message-State: AOJu0YweoNFgwvqfoNdriP9astCvd6wUlT96ot9jKLzX3urut/WD80a2
	o4MUmjlTy/jX8seM0aYFnBlXIwNeTBLGmlGshA+CHGjVNk2nR9Y654bfG1QAijhoXpC0k0VWeXj
	zysNG4FI3aghJfyv0HzClGDoVFUE5WCI=
X-Gm-Gg: AZuq6aL3luxZsviUYUL9IA+aGVoj618RdwtQSc/CbiIPE8Hy377VAM8hhfywWXV5LpY
	B9EQiMNhzex45I6mcMPKaX+0K5E9okBRu/Ypuv64/4qTK6v/IUko6bi7nMUoIbgD9hi5hPhYNex
	Uq64kiKnIHdM1vV/yIQgKaACJdfpe4Dkm/hy4ltsn//5RefX47SLDOuapQT38cMkErWajlnVpM7
	KgsPQvIwLqgqe1do8PQnwpe9k5YACmbxiOIoCy8G/Kh14SQDFqvad0Rw5YDt0Xu3Wc0HZ6Xfw/8
	YVwpD2Y=
X-Received: by 2002:a05:6102:5091:b0:5b2:d28a:8937 with SMTP id
 ada2fe7eead31-5fae8a58b98mr2102020137.12.1770481405796; Sat, 07 Feb 2026
 08:23:25 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com>
 <20260202150207.1331811-2-raymondmaoca@gmail.com> <CAAhSdy0LKS9XTu+Xccs0SCj+vyCdFGrNQU7TNP2k97vvJwh4dQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0LKS9XTu+Xccs0SCj+vyCdFGrNQU7TNP2k97vvJwh4dQ@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Sat, 7 Feb 2026 11:23:15 -0500
X-Gm-Features: AZwV_QhmVzcl8UGiUaq2eXBC_taqwIKRO5tGJTzCeLYeOTM2ZS98-Tm8mpyaAWM
Message-ID: <CAMDkj5xti1EXYTa+TBgu=nQndqeNud2YoXaW2ptz4RTsAEKJ3A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] lib: sbi: introduce abstraction for wired
 interrupt handling
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_082327_659339_A8FF3742 
X-CRM114-Status: GOOD (  21.58  )
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

SGkgQW51cCwKCk9uIFNhdCwgRmViIDcsIDIwMjYgYXQgNToxMOKAr0FNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4OjMy
4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9jYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5jb20+Cj4gPgo+ID4gQWRk
IHdpcmVkIGludGVycnVwdCBoYW5kbGluZyBhYnN0cmFjdGlvbiBpbnRvIGlycWNoaXAuCj4gPiBU
aGlzIGludHJvZHVjZXMgYSBzbWFsbCBwcm92aWRlciBpbnRlcmZhY2UgYmFzZWQgb24KPiA+IGNs
YWltL2NvbXBsZXRlL21hc2svdW5tYWsgc2VtYW50aWNzLCBhbGxvd2luZyB0byByZWdpc3RlciBh
IHdpcmVkCj4gPiBpbnRlcnJ1cHQgY29udHJvbGxlciBhcyBhIHByb3ZpZGVyLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5jb20+Cj4gPiAt
LS0KPiA+ICBpbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oIHwgNTIgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUyIGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaCBiL2luY2x1
ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+IGluZGV4IGUwYWUxMmY1Li4yN2I4ODc2NSAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+ICsrKyBiL2luY2x1ZGUvc2Jp
L3NiaV9pcnFjaGlwLmgKPiA+IEBAIC0yNyw2ICsyNywzOCBAQCBzdHJ1Y3Qgc2JpX2lycWNoaXBf
ZGV2aWNlIHsKPiA+ICAgICAgICAgaW50ICgqaXJxX2hhbmRsZSkodm9pZCk7Cj4gPiAgfTsKPiA+
Cj4gPiArLyogSGFuZGxlciBmb3IgYSBzcGVjaWZpZWQgaHdpcnEgKi8KPiA+ICt0eXBlZGVmIGlu
dCAoKnNiaV9pcnFjaGlwX2lycV9oYW5kbGVyX3QpKHZvaWQgKnByaXYpOwo+ID4gKwo+ID4gKy8q
IFByb3ZpZGVyIG9wZXJhdGlvbnMgKi8KPiA+ICtzdHJ1Y3Qgc2JpX2lycWNoaXBfcHJvdmlkZXJf
b3BzIHsKPiA+ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogQ2xhaW0gYSBwZW5kaW5nIHdpcmVk
IGludGVycnVwdCBvbiBjdXJyZW50IGhhcnQuCj4gPiArICAgICAgICAqIFJldHVybnM6Cj4gPiAr
ICAgICAgICAqICAgU0JJX09LICAgICAgOiAqaHdpcnEgaXMgdmFsaWQKPiA+ICsgICAgICAgICog
ICBTQklfRU5PRU5UICA6IG5vIHBlbmRpbmcgd2lyZWQgaW50ZXJydXB0Cj4gPiArICAgICAgICAq
ICAgPDAgICAgICAgICAgOiBlcnJvcgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgaW50ICgq
Y2xhaW0pKHZvaWQgKmN0eCwgdTMyICpod2lycSk7Cj4gPiArCj4gPiArICAgICAgIC8qCj4gPiAr
ICAgICAgICAqIENvbXBsZXRlL2Fja25vd2xlZGdlIGEgcHJldmlvdXNseSBjbGFpbWVkIHdpcmVk
IGludGVycnVwdAo+ID4gKyAgICAgICAgKiAoaWYgcmVxdWlyZWQgYnkgSFcpLgo+ID4gKyAgICAg
ICAgKiBTb21lIEhXIG1heSBub3QgcmVxdWlyZSBhbiBleHBsaWNpdCBjb21wbGV0aW9uLgo+ID4g
KyAgICAgICAgKi8KPiA+ICsgICAgICAgdm9pZCAoKmNvbXBsZXRlKSh2b2lkICpjdHgsIHUzMiBo
d2lycSk7Cj4gPiArCj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIG1hc2svdW5tYXNrIGEg
d2lyZWQgaW50ZXJydXB0IGxpbmUuCj4gPiArICAgICAgICAqCj4gPiArICAgICAgICAqIFRoZXNl
IGFyZSByZXF1aXJlZCBmb3IgcmVsaWFibGUgY291cmllcmluZyBvZiBsZXZlbC10cmlnZ2VyZWQg
ZGV2aWNlCj4gPiArICAgICAgICAqIGludGVycnVwdHMgdG8gUy1tb2RlOiBtYXNrIGluIE0tbW9k
ZSBiZWZvcmUgZW5xdWV1ZWluZywgYW5kIHVubWFzawo+ID4gKyAgICAgICAgKiBhZnRlciBTLW1v
ZGUgaGFzIGNsZWFyZWQgdGhlIGRldmljZSBpbnRlcnJ1cHQgc291cmNlLgo+ID4gKyAgICAgICAg
Ki8KPiA+ICsgICAgICAgdm9pZCAoKm1hc2spKHZvaWQgKmN0eCwgdTMyIGh3aXJxKTsKPiA+ICsg
ICAgICAgdm9pZCAoKnVubWFzaykodm9pZCAqY3R4LCB1MzIgaHdpcnEpOwo+ID4gK307Cj4gPiAr
Cj4gPiAgLyoqCj4gPiAgICogUHJvY2VzcyBleHRlcm5hbCBpbnRlcnJ1cHRzCj4gPiAgICoKPiA+
IEBAIC00Niw0ICs3OCwyNCBAQCBpbnQgc2JpX2lycWNoaXBfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0
Y2ggKnNjcmF0Y2gsIGJvb2wgY29sZF9ib290KTsKPiA+ICAvKiogRXhpdCBpbnRlcnJ1cHQgY29u
dHJvbGxlcnMgKi8KPiA+ICB2b2lkIHNiaV9pcnFjaGlwX2V4aXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoKTsKPiA+Cj4gPiArLyoKPiA+ICsgKiBSZWdpc3RlciB0aGUgYWN0aXZlIHdpcmVk
IGludGVycnVwdCBwcm92aWRlci4KPiA+ICsgKiAtIG1heF9od2lycSBzcGVjaWZpZXMgdGhlIGhp
Z2hlc3QgdmFsaWQgaHdpcnEgSUQuCj4gPiArICovCj4gPiAraW50IHNiaV9pcnFjaGlwX3JlZ2lz
dGVyX3Byb3ZpZGVyKGNvbnN0IHN0cnVjdCBzYmlfaXJxY2hpcF9wcm92aWRlcl9vcHMgKm9wcywK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2b2lkICpjdHgsIHUzMiBtYXhf
aHdpcnEpOwo+ID4gKwo+ID4gK3UzMiBzYmlfaXJxY2hpcF9nZXRfbWF4X3NyYyh2b2lkKTsKPiA+
ICsKPiA+ICsvKiBTZXQvY2xlYXIgaGFuZGxlciBmb3IgYSBzcGVjaWZpZWQgaHdpcnEgKi8KPiA+
ICtpbnQgc2JpX2lycWNoaXBfc2V0X2hhbmRsZXIodTMyIGh3aXJxLCBzYmlfaXJxY2hpcF9pcnFf
aGFuZGxlcl90IGhhbmRsZXIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAq
cHJpdik7Cj4gPiAraW50IHNiaV9pcnFjaGlwX2NsZWFyX2hhbmRsZXIodTMyIGh3aXJxKTsKPiA+
ICsKPiA+ICt2b2lkIHNiaV9pcnFjaGlwX21hc2tfaXJxKHUzMiBod2lycSk7Cj4gPiArdm9pZCBz
YmlfaXJxY2hpcF91bm1hc2tfaXJxKHUzMiBod2lycSk7Cj4gPiArCj4gPiArLyogZXh0ZXJuYWwg
aW50ZXJydXB0IGhhbmRsZXIgKGlycWNoaXAgZGV2aWNlIGhvb2spICovCj4gPiAraW50IHNiaV9p
cnFjaGlwX2hhbmRsZV9leHRlcm5hbF9pcnEodm9pZCk7Cj4gPiArCj4KPiBJIGRpZCBub3QgbWVh
biByZW5hbWluZyBhbmQgbW92aW5nIHN0dWZmIHRvIHNiaV9pcnFjaGlwLmgKPiBpbnN0ZWFkLCBt
eSBleHBlY3RhdGlvbiB3YXMgdG8gdXNlIHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UKPiBhcyB0
aGUgYWJzdHJhY3Rpb24gZm9yIHRoZSBpbnRlcnJ1cHQgY29udHJvbGxlci4KPgoKSSBjYW4gd3Jh
cCBzYmlfaXJxY2hpcF9wcm92aWRlcl9vcHMgaW50byBzYmlfaXJxY2hpcF9kZXZpY2UgaWYgdGhh
dApsb29rcyBiZXR0ZXIuCkl0IGlzIG5vdCBhIGJpZyBjaGFuZ2UgdG8gdGhlIGltcGxlbWVudGF0
aW9uIGl0c2VsZi4KClJlZ2FyZHMsClJheW1vbmQKCj4gUmVnYXJkcywKPiBBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
