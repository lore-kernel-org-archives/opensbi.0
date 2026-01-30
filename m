Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F99ED49C6D
	for <opensbi@archiver.kernel.org>; Fri, 30 Jan 2026 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZfCimntRbxbW1/ODXOBg7kgL1D/dXUiPhWfSl95VsI=; b=DDXiEfARgxViYS
	gTM9Y8hddFG30gIeAmPFccN3VfimlCQJhgqQbViHmbOrXG4POc0Sj+5HmaKSN4aX6OG1i6BUeTcfZ
	R5T3A589xpPayP2D/EzFIZlzbaearFhlrN9pfLY+FqeEtP/97gocmczBS2HIsj9kMKSFNptFfWgsa
	IYbmIPCLXi+pk/2zraV1SMda74pz4SpOkSWW2d6tA1BPQjqGq5k8UBpD3xxcgMvROE4ZoH9MVA+O/
	tJsv9GKUuTKBfQiqS8JTKDEugUKED/rO14hzNZkJcmHLhfa89zdRI9kxRPcWy+QOA/IEpMwLQZAcO
	Lp35oZiddUFDP74DD73g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljF8-00000001AGP-34Vi;
	Fri, 30 Jan 2026 07:48:38 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljF5-00000001AFW-14W7
	for opensbi@lists.infradead.org;
	Fri, 30 Jan 2026 07:48:36 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-408199852c5so1497458fac.0
        for <opensbi@lists.infradead.org>; Thu, 29 Jan 2026 23:48:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769759313; cv=none;
        d=google.com; s=arc-20240605;
        b=IcG9JcH1f7C1S/mCzm6fEcUFQmjuD1yj6W7Z+rh43Af4iJ0PMBHvTK7P0kjkZEObJH
         ulksi0CEMpYtz17+KyXB625JI0+WKtpIyyvUaSJOl9YE8IS4Cj+zb42qPszBxwQgAitn
         9flrJ5Y2CPoFDVlgEVZzAOqMuyDSK+TE8Fkw1VJGhMefxwU2fakDHFKuBdKJ+AVASgOV
         61GD63Lib4qmDCe+RuUKPZDi81RUbDXxSFU4VVw/4E9eAyZqXsj6B4a4fgrGhJCAbl8l
         I7oGa7b98ot01qo2UjeAlTIdRxYNHuWG5HtKg28g9eWzMLEaZkExbeW7eEzEJ3HbrRzS
         T7fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hgwIR+l6xHWdmhN9wi/4MzhLuj+DPfnRuYLowEt8LKQ=;
        fh=Sch92qKkux4AeucvC2KlvargZk/jQktzKzrRc6CJlNk=;
        b=ad6fpuiymz7JEEsY6toYSN62P/24DM7nTD2UQelUyQ+unm06Lu6GcPcNakIehaZgXw
         L3IzxLRc0g8WXCGBjQ7n4cGHSUwHNw5as6+DsQ6agFqIGMKT5SAj94F/vdA5ODh32376
         T/8d8OySwbJsiKvsICmBT4DPZwSelNE9HDPhtzbeJy7d2gFPykHMXkvLVXMkODgOoGgZ
         QDspSzvMe76l1iFN+fe0rp/fuMo0NrcdyGYXtn/VEoLgQkaICrrsodYFyI6dQrS46ASh
         HGl2Qmh+MV8Hz5OOYBF/YKQcb3IQn9mKmyzVzl0HXlyrojOzlOH/tDWEfx9wcKsgEnp8
         aCHQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1769759313; x=1770364113; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hgwIR+l6xHWdmhN9wi/4MzhLuj+DPfnRuYLowEt8LKQ=;
        b=SXM9R/0KUu73l6YTmNT6ZEvpdCNHvH56wCBiGUK0Dx/EItwmWcQFDpFng7kG/r/eZY
         5H4SuihfF2AtcNf9xebJ3OxTocS6V7Mcan5Q6vEAMD5Cxgrn3W2OXvVrLdyBq8oqiUia
         M/CcJsOaLOEKYwaMSlDN2T6P/l07bZHtx5UikMv/vZtdvqDXxprSo6CjXV4tsTBnUsmv
         AEYe4FWc0p8KlQ4lVI2P/fVqDkcjnXBP6poBEmVs0S+A943ukynI9Y0mU0iSV3JNh0bg
         uw7x7QFzzmgbNxRLS6rZ5K5XPrVB9DAU2b0L9o8uyLVO5+XBBxZnrHCWwNk3q2udkHQT
         Ripg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769759313; x=1770364113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hgwIR+l6xHWdmhN9wi/4MzhLuj+DPfnRuYLowEt8LKQ=;
        b=DcHdjn7hxSlxCZs08J5jQND5s0xUgStEtbvXmMibg1DeDfK+0FtSpEX+Q7Xm/PsVjd
         /onluCqaGZwiQZQEgqO7C0CElcqHTsDNbcjA/nZLY5cWbJEJ4DPQscx+8ados6MSDBM8
         cSyOmHhpaYaPAi33kBnbQ2uhLlQYiCi2coR4+o10W3+Hqr+i7O4MIHUgBsdtydfbqGjs
         mN5aXcMIpbXNohENtAiGymPJZ76NgHLGoFFpAU9nNuMSJ0+uDkLW4uKi0aIfU/FNZf4/
         RUk+C3MCfrGM26mQbqpLeAlnrdJeHdYOHbR8mkLnVuSdIA4bPEAPh1nA/JSzzm2aE7kS
         88mw==
X-Gm-Message-State: AOJu0YxnB0s96/dtmhV6d/K5qNA6oNqJEkQCdvfoAjbdi1jXcaVCAVQY
	sbsrxj9ayaHhmXdgE4YgU6ktaqEqdozRFN2TFp2hiY5tOE7r/QKk2u+RTvmiwJ6uv7gEMoqCmIK
	EwUyufFLMhZtPYaw15YJaHHljm+lipcZJZRYo0OSSrA==
X-Gm-Gg: AZuq6aLuKC8nBH+u3CkJLoqDARPKzTG5DDzTfhTNZ5tnr1mNEB6Erdbe84sJ+Eqs8F/
	VADmIp72K4u03530XPCq/McHwQnXAu3J6k7esGC+MZ5SPwsPAswVYCw/3RxIVbZqIFTmnhDWLY7
	/Bqggi6LX7w2BdW9uESXdiNJ3IPqvXqhIrhsBOmhkggaRutfh7up9Yx3he3HLrwEJY8QvZC19EK
	PhwUMpfwARAtv9Bq9id/znXueFOjyvq8sAv+KGKw1DEzKVIe7vTzQ2wUiRgqkcpYW0jiqy8s49/
	lz5HEFIwke5d2nl8z+WR6ZEZvq1PZmyHq5AqxbqTPqusT/UuhP2KrhcXjA==
X-Received: by 2002:a05:6820:448d:b0:662:fef7:4dd5 with SMTP id
 006d021491bc7-6630f361b4cmr785020eaf.40.1769759313270; Thu, 29 Jan 2026
 23:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20260127152342.1231995-1-raymondmaoca@gmail.com> <20260127152342.1231995-2-raymondmaoca@gmail.com>
In-Reply-To: <20260127152342.1231995-2-raymondmaoca@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 30 Jan 2026 13:18:22 +0530
X-Gm-Features: AZwV_QgbsQOKJShX2Dh98evQRGVjcuhC1Y6OmWmRJlbYQmlE7QpTKMkAtdbuTsE
Message-ID: <CAAhSdy1=rc9fsXDfJ55pev4RVT1c3QsPJfCFiF7dOVGXnQtiuw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] lib: sbi: introduce INTC abstraction for wired interrupts
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_234835_558928_F41F78F5 
X-CRM114-Status: GOOD (  24.33  )
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

T24gVHVlLCBKYW4gMjcsIDIwMjYgYXQgODo1NOKAr1BNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0By
aXNjc3Rhci5jb20+Cj4KPiBBZGQgYSB3aXJlZCBpbnRlcnJ1cHQtY29udHJvbGxlciAoSU5UQykg
YWJzdHJhY3Rpb24gdG8gT3BlblNCSS4KPiBUaGlzIGludHJvZHVjZXMgYSBzbWFsbCBwcm92aWRl
ciBpbnRlcmZhY2UgYmFzZWQgb24KPiBjbGFpbS9jb21wbGV0ZS9tYXNrL3VubWFrIHNlbWFudGlj
cywgYWxsb3dpbmcgdG8gcmVnaXN0ZXIgYSB3aXJlZAo+IGludGVycnVwdCBjb250cm9sbGVyIGFz
IGEgcHJvdmlkZXIuCj4gUGx1cywgYWRkIHZpcnR1YWwgSVJRIG51bWJlciBtYXBwaW5nIHRvIGF2
b2lkIGV4cG9zdXJlIG9mIGh3aXJxLgo+Cj4gU2lnbmVkLW9mZi1ieTogUmF5bW9uZCBNYW8gPHJh
eW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KPiAtLS0KPiAgc2JpX2ludGMuaCB8IDk5ICsrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUg
Y2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgc2JpX2ludGMu
aAo+Cj4gZGlmZiAtLWdpdCBhL3NiaV9pbnRjLmggYi9zYmlfaW50Yy5oCj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMC4uZjUxOTc0YzkKPiAtLS0gL2Rldi9udWxsCj4gKysr
IGIvc2JpX2ludGMuaAo+IEBAIC0wLDAgKzEsOTkgQEAKPiArLyoKPiArICogU1BEWC1MaWNlbnNl
LUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYg
UklTQ3N0YXIgU29sdXRpb25zIENvcnBvcmF0aW9uLgo+ICsgKgo+ICsgKiBBdXRob3I6IFJheW1v
bmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5jb20+Cj4gKyAqLwo+ICsKPiArI2lmbmRlZiBf
X1NCSV9JTlRDX0hfXwo+ICsjZGVmaW5lIF9fU0JJX0lOVENfSF9fCj4gKwo+ICsjaW5jbHVkZSA8
c2JpL3NiaV90eXBlcy5oPgo+ICsKPiArLyogSGFuZGxlciBmb3IgYSBzcGVjaWZpZWQgSVJRIG51
bWJlciAqLwo+ICt0eXBlZGVmIGludCAoKnNiaV9pbnRjX2lycV9oYW5kbGVyX3QpKHUzMiBpcnEs
IHZvaWQgKnByaXYpOwo+ICsKPiArLyoKPiArICogUHJvdmlkZXIgY2FwYWJpbGl0aWVzLCBhdCB0
aGUgbW9tZW50IGl0IGNvbnRhaW5zIHRoZSBtYXhpbXVtIHZhbGlkIHNvdXJjZSBJRAo+ICsgKiBi
dXQgZXh0ZW5zaWJsZSBpbiB0aGUgZnV0dXJlCj4gKyAqLwo+ICtzdHJ1Y3Qgc2JpX2ludGNfcHJv
dmlkZXJfY2FwcyB7Cj4gKyAgICAgICAvKgo+ICsgICAgICAgICogTWF4aW11bSBzdXBwb3J0ZWQg
d2lyZWQgc291cmNlIElEIGZvciB0aGlzIHByb3ZpZGVyLgo+ICsgICAgICAgICoKPiArICAgICAg
ICAqIEZvciBBUExJQyB0aGlzIGNvcnJlc3BvbmRzIHRvIHRoZSBoaWdoZXN0IHZhbGlkIHNvdXJj
ZSBJRCAoMS4uTikuCj4gKyAgICAgICAgKiBUaGUgSU5UQyBjb3JlIHRyZWF0cyB0aGlzIGFzIGFu
IGFic3RyYWN0IHByb3ZpZGVyIHNvdXJjZSBJRCBzcGFjZS4KPiArICAgICAgICAqLwo+ICsgICAg
ICAgdTMyIG1heF9zcmM7Cj4gK307Cj4gKwo+ICsvKiBQcm92aWRlciBvcGVyYXRpb25zICovCj4g
K3N0cnVjdCBzYmlfaW50Y19wcm92aWRlcl9vcHMgewo+ICsgICAgICAgLyoKPiArICAgICAgICAq
IFF1ZXJ5IHByb3ZpZGVyIGNhcGFiaWxpdGllcy4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBU
aGlzIGF2b2lkcyBleHBvc2luZyBwcm92aWRlci1zcGVjaWZpYyBsaW1pdHMgKHN1Y2ggYXMgQVBM
SUMKPiArICAgICAgICAqIG51bV9zb3VyY2UpIHRocm91Z2ggdGhlIHJlZ2lzdHJhdGlvbiBBUEku
Cj4gKyAgICAgICAgKi8KPiArICAgICAgIGludCAoKmdldF9jYXBzKSh2b2lkICpjdHgsIHN0cnVj
dCBzYmlfaW50Y19wcm92aWRlcl9jYXBzICpjYXBzKTsKClRoaXMgY2FsbGJhY2sgaXMgbm90IG5l
ZWRlZCBpbnN0ZWFkIHlvdSBkcml2ZXIgY2FuIHBhc3MgbWF4X3NyYwphcyBwYXJhbWV0ZXIgdG8g
c2JpX2ludGNfcmVnaXN0ZXJfcHJvdmlkZXIoKQoKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAg
ICogQ2xhaW0gYSBwZW5kaW5nIHdpcmVkIGludGVycnVwdCBvbiBjdXJyZW50IGhhcnQuCj4gKyAg
ICAgICAgKiBSZXR1cm5zOgo+ICsgICAgICAgICogICBTQklfT0sgICAgICA6ICpod2lycSBpcyB2
YWxpZAo+ICsgICAgICAgICogICBTQklfRU5PRU5UICA6IG5vIHBlbmRpbmcgd2lyZWQgaW50ZXJy
dXB0Cj4gKyAgICAgICAgKiAgIDwwICAgICAgICAgIDogZXJyb3IKPiArICAgICAgICAqLwo+ICsg
ICAgICAgaW50ICgqY2xhaW0pKHZvaWQgKmN0eCwgdTMyICppcnEpOwo+ICsKPiArICAgICAgIC8q
Cj4gKyAgICAgICAgKiBDb21wbGV0ZS9hY2tub3dsZWRnZSBhIHByZXZpb3VzbHkgY2xhaW1lZCB3
aXJlZCBpbnRlcnJ1cHQKPiArICAgICAgICAqIChpZiByZXF1aXJlZCBieSBIVykuCj4gKyAgICAg
ICAgKiBTb21lIEhXIG1heSBub3QgcmVxdWlyZSBhbiBleHBsaWNpdCBjb21wbGV0aW9uLgo+ICsg
ICAgICAgICovCj4gKyAgICAgICB2b2lkICgqY29tcGxldGUpKHZvaWQgKmN0eCwgdTMyIGlycSk7
CgpBbGwgcHJvdmlkZXIgY2FsbGJhY2tzIHNob3VsZCB0YWtlIGh3aXJxIGFzIGEgcGFyYW1ldGVy
LgoKPiArCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogbWFzay91bm1hc2sgYSB3aXJlZCBpbnRl
cnJ1cHQgbGluZS4KPiArICAgICAgICAqCj4gKyAgICAgICAgKiBUaGVzZSBhcmUgcmVxdWlyZWQg
Zm9yIHJlbGlhYmxlIGNvdXJpZXJpbmcgb2YgbGV2ZWwtdHJpZ2dlcmVkIGRldmljZQo+ICsgICAg
ICAgICogaW50ZXJydXB0cyB0byBTLW1vZGU6IG1hc2sgaW4gTS1tb2RlIGJlZm9yZSBlbnF1ZXVl
aW5nLCBhbmQgdW5tYXNrCj4gKyAgICAgICAgKiBhZnRlciBTLW1vZGUgaGFzIGNsZWFyZWQgdGhl
IGRldmljZSBpbnRlcnJ1cHQgc291cmNlLgo+ICsgICAgICAgICovCj4gKyAgICAgICB2b2lkICgq
bWFzaykodm9pZCAqY3R4LCB1MzIgaXJxKTsKPiArICAgICAgIHZvaWQgKCp1bm1hc2spKHZvaWQg
KmN0eCwgdTMyIGlycSk7CgpTYW1lIGFzIGFib3ZlLgoKPiArfTsKPiArCj4gKy8qIFJlZ2lzdGVy
IHRoZSBhY3RpdmUgd2lyZWQgaW50ZXJydXB0IHByb3ZpZGVyLCBlLmcuIEFQTElDLCB2aWEgb3Bz
IGFuZCBjdHggKi8KPiAraW50IHNiaV9pbnRjX3JlZ2lzdGVyX3Byb3ZpZGVyKGNvbnN0IHN0cnVj
dCBzYmlfaW50Y19wcm92aWRlcl9vcHMgKm9wcywKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgdm9pZCAqY3R4KTsKPiArCj4gKy8qCj4gKyAqIE9wdGlvbmFsOiBtYXAgYSBJUlEgbnVt
YmVyIChpcnEpIHRvIGEgaGFyZHdhcmUgd2lyZWQgSVJRIChod2lycSkuCj4gKyAqCj4gKyAqIElm
IG5vIGV4cGxpY2l0IG1hcHBpbmcgZXhpc3RzLCAnaXJxPT1od2lycScgaXMgYXNzdW1lZC4KPiAr
ICoKPiArICogVGhpcyBhbGxvd3MgdXBwZXIgbGF5ZXJzIChlLmcuIFZJUlEgY291cmllci9lbXVs
YXRpb24pIHRvIHVzZSBzdGFibGUgaXJxCj4gKyAqIGlkZW50aWZpZXJzIHdpdGhvdXQgZXhwb3Np
bmcgdGhlIHdpcmVkIGNvbnRyb2xsZXIncyBod2lycSBudW1iZXJpbmcuCj4gKyAqLwo+ICtpbnQg
c2JpX2ludGNfbWFwX2lycSh1MzIgaXJxLCB1MzIgaHdpcnEpOwo+ICtpbnQgc2JpX2ludGNfdW5t
YXBfaXJxKHUzMiBpcnEpOwoKVGhlIHZpcnEgY291cmllci9lbXVsYXRpb24gd2lsbCBiZSBhbiBp
bmRlcGVuZGVudCBtb2R1bGUKc28gZHJvcCB0aGVzZSBmdW5jdGlvbnMuCgpBbHNvLCB0aGUgZHJp
dmVyIHNob3VsZCBoYXZlIG5vIGNvbnRyb2wgb24gaG93IGlycSBpcyBtYXBwZWQKdG8gaHdpcnEu
IFRoZSBJTlRDIGZyYW1ld29yayB3aWxsIGludGVybmFsbHkgbWFuYWdlIGlycSB0bwpod2lycSBt
YXBwaW5nIGZvciBhIHBhcnRpY3VsYXIgcHJvdmlkZXIuCgo+ICt1MzIgc2JpX2ludGNfaXJxX3Rv
X2h3aXJxKHUzMiBpcnEpOwo+ICt1MzIgc2JpX2ludGNfaHdpcnFfdG9faXJxKHUzMiBod2lycSk7
Cj4gKwo+ICsvKiBTZXQvY2xlYXIgaGFuZGxlciBmb3IgYSBzcGVjaWZpZWQgSVJRIG51bWJlciAq
Lwo+ICtpbnQgc2JpX2ludGNfc2V0X2hhbmRsZXIodTMyIGlycSwgc2JpX2ludGNfaXJxX2hhbmRs
ZXJfdCBoYW5kbGVyLCB2b2lkICpwcml2KTsKPiAraW50IHNiaV9pbnRjX2NsZWFyX2hhbmRsZXIo
dTMyIGlycSk7Cj4gKwo+ICsvKgo+ICsgKiBQbGF0Zm9ybSBpbmRlcGVuZGVudCBtYXNrL3VubWFr
IHdyYXBwZXJzIG9uIHRvcCBvZiBwbGF0Zm9ybSByZWdpc3RlcmVkCj4gKyAqIG1hc2svdW5tYXNr
IG9wcyBmdW5jdGlvbnMuCj4gKyAqLwo+ICt2b2lkIHNiaV9pbnRjX21hc2tfaXJxKHUzMiBpcnEp
Owo+ICt2b2lkIHNiaV9pbnRjX3VubWFza19pcnEodTMyIGlycSk7Cj4gKwo+ICsvKiBFeHRlcm5h
bCBpbnRlcnJ1cHQgaGFuZGxlciAoZm9yIGlycWNoaXAgZGV2aWNlIGhvb2sgJ2lycWNoaXAuaXJx
X2hhbmRsZScpICovCj4gK2ludCBzYmlfaW50Y19oYW5kbGVfZXh0ZXJuYWxfaXJxKHZvaWQpOwo+
ICsKPiArI2VuZGlmCgpBbHNvLCBpbnRyb2R1Y2luZyBhIG5ldyBzZXQgb2Ygc2JpX2ludGMuYyBh
bmQgc2JpX2ludGMuaCBpcwpub3QgZ29pbmcgdG8gZmx5LgoKV2UgaGFkIGFscmVhZHkgY3JlYXRl
ZCBzYmlfaXJxY2hpcC5jIGFuZCBzYmlfaXJxY2hpcC5oIHRvCm1hbmFnZSBleHRlcm5hbCBpbnRl
cnJ1cHRzIHNvIHRoZSBnb2FsIHNob3VsZCBiZSB0byBlbmhhbmNlCnRoZXNlIGZyYW1ld29ya3Mu
CgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
b3BlbnNiaQo=
