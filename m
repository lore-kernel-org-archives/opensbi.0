Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2DFEF99DF
	for <opensbi@archiver.kernel.org>; Fri, 13 Feb 2026 22:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMhy5j0TPM1bPZOalfcdiWtYMMKToqJLNW7uyEd5LIE=; b=cf2lxY16ltVVeW
	LaN6K/WVIihq7nm41dGyGnW+UVjBSGBXPIhXEJNGVjh04TEyn0cNySRFPWWjaWq70ZrNBaOG+vpBq
	+ADzZ2RH9qhcETSM8nFjUCpEq/+syj6AK25+Y4lp7G931nuyrzJ1j+rhHRtm3WYM+8b4PGMK3ahEu
	qes6c1tYQQPnMzB1O9GpRAAho74oOx80k8JJV6xSKksG6s5/ed+irm5UXNT637Uq7zZEJBH8udqbZ
	mUd90Cuf1WrBKNaNJcujLQVSWWhcDjUZYud2BCWhUDad0QS/wND9GRNrn121Gyp7VHRo1Vem/mUMl
	oG2ZKNQ7Xp+na+GrPeYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr1KK-00000003yb4-1pI7;
	Fri, 13 Feb 2026 22:07:52 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr1KH-00000003yaf-2Xzk
	for opensbi@lists.infradead.org;
	Fri, 13 Feb 2026 22:07:50 +0000
Received: by mail-vs1-xe36.google.com with SMTP id ada2fe7eead31-5fa3f2b8f7fso442068137.2
        for <opensbi@lists.infradead.org>; Fri, 13 Feb 2026 14:07:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771020468; cv=none;
        d=google.com; s=arc-20240605;
        b=Qm4/twi3PKmxmEGGZjRgl8rtbYpfAXhVwTYHJyLCTqMhtFOk67YemHYf+AiPhoHdVP
         lK+NwQ/3qpyUo4isojoZBSRiyZ3BdTyR75gH6AwDLZ82fN/2D0RvPWhXaMOVQnLgq3qS
         cCZ3rOnClJ90g+ACHOuOvAccJZ/WMuJbF8c4RuzVddI8Cyp1Ek2hLIHBeNYS7gYys4Q6
         j7tqtMolSCdH0hbdqGFPIigCVx4sbpN8Qx9F5i1TcePWFZhwGgOz1jR3WjmyXI9+gDYJ
         n3Gv3g5f2Az+HIKTriVsHavSQ0HJhpXcwacJ0Wa83NC+d+F9ltuDD5vzTbtN3qfQuAO8
         MiNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZqthtvMcnCpBVA6nBDGHyJ53NLH5pH0C7menoSnB3S8=;
        fh=HVmqc4Rc+3xzwC8uX1z7tapFe9ynu2SoUQm3aSVhnKY=;
        b=jUPtZYY5rzw2JEhmk/cFbw5slYvW+y5jdQaMg7E853ZY/bNTxH+ic7WenYe1q2GALi
         I9ovSYyb8xMYRz9f6+zvULWF0YeruDkFsCXAVGJpClM2AOK8tnVoAS5m9RhgP/QhMWwK
         faqZHVPCXKO7o3nSfldVFd21hGCb6pJzzejEZmziw50NayWDTFwEqJTBl+mxnosUzoSt
         HP+mJNJAOwq//QLmDPxwq41vO07RyFL+PtyeSC8zpTDxOxdxbsSTi/dfjdKTYJtAoVGK
         7vekb4pix9tXibj++ImsYhz/A5NrXzCEYCTYs+PUjJdM3/yqhFPoZnmk8CBsSkMSYEmH
         /5vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771020468; x=1771625268; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZqthtvMcnCpBVA6nBDGHyJ53NLH5pH0C7menoSnB3S8=;
        b=OUYoFqyb06/+M56yQN15ajFzTX7uV8Ck39Sz/c1238xAxvUeGmzZuxadvGIMJ2XTPl
         GFfj/g5QGYax9sgapuSOMPrM9gACS73TW7G8LdxcqTQ9ci5VAn96OWzCJFCYl40ruY14
         hGfo+/iepmrDQ5tuPxTH4g6WKqhE6dtbMzpKTAE3bI2NXsyufIyuEKKzuIdA0mElI+TO
         2Hj0DCo1YL9EB5M/40h8bmmCVQb73HLp5s4onJmphU8JQ86APb2GbO6FfM4QsjRrew6K
         u/kUpQGu1w8SdE2ADaXjSBp963kpDvtDEfItsSqUUvE+FZwfBPwxsJr7bi8cJgQNoouq
         3HIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771020468; x=1771625268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZqthtvMcnCpBVA6nBDGHyJ53NLH5pH0C7menoSnB3S8=;
        b=F7ctdb7LlZeEjKN0FvNJQhzKODHuDgAbBOjHKqH8rHZLxfyi303vlm7sqTWtxbbGAC
         u4i3Bq9gUZKnQgcIIIswyamAJvMPhTsRMjYG4w3Fiid0J2NpnH6I9qVGdd0Svzo8NmT6
         HvU/UzR9tpmBwyXVOGy0Pa/N/HJP70/pdDOhjI0/qAySEBoktATs0CdkrZblS6cmqA1g
         xA4K6I2ya5vfaHzk3rRJeUQMnmeRI2kv5GLYsa89CmyRIlR3DxQ+CCpY6KwWyFBzNVgs
         vLcVMhHMgSeHv57VtlSF3EPKUL0gjVzCSNgN2SklSXDuHmwLkr1OqDFeTflnqrcJhhL4
         N1UA==
X-Gm-Message-State: AOJu0YxtBcyYa/uITb1nzhhuhmTEsRoleKy73KaPMGbHFjlfERxfvaQU
	kxqZ+i1862cILlbpXklmZkPr3VwMHI6yH6atuS2DnsTVWzIejaTOcg1xU5zXvKI1uWGCBW2DKR/
	8V2sKzHDGfqpsPpGSB6fUu7j8FN0ZQWE=
X-Gm-Gg: AZuq6aJ1ROuNnpY4QCXGPneQWfjGdSDTqiDv8Z2kkcdEANTNBfeRPBlEkXs88r2dITD
	kErKnnFG6UUk2PN29uP+yADiPiSrdeX3H7oWSBctYTkDHQy7VZAO7m3jEBhdEKFAyzPM2Nm6Mkd
	GdQJpvnwovDc5F8DGWbsl3Y4o6tRoAbrhCN06AVsxtCdJQ66uA84SW+V3/GAKPEsvyuzumHz+Bn
	t0hSnIaLfAPUwQXNjbkG79ZMpwDPdY+5B5T/5Ofml9R0oUfGfEFFwsEPxkY50wf2etc+9thvuJB
	MfYpv0SgQYBdeA1ROm4=
X-Received: by 2002:a05:6102:f0c:b0:5fd:ff75:f41d with SMTP id
 ada2fe7eead31-5fe16ee3582mr1202727137.24.1771020467898; Fri, 13 Feb 2026
 14:07:47 -0800 (PST)
MIME-Version: 1.0
References: <20260213190459.2540597-1-raymondmaoca@gmail.com>
 <20260213190459.2540597-4-raymondmaoca@gmail.com> <tx4srauwlm4cy755tqqbo5fxp53rzfvyesgpsftc7w76p7xqql@uvwgjaruyc4n>
In-Reply-To: <tx4srauwlm4cy755tqqbo5fxp53rzfvyesgpsftc7w76p7xqql@uvwgjaruyc4n>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Fri, 13 Feb 2026 17:07:36 -0500
X-Gm-Features: AaiRm50GHUHFX9X9AHOqD5R_ZzboYUezOWOwDbYWog3ETdOgr1qdmW6TQ1unt4s
Message-ID: <CAMDkj5yqRv8LYfUKiDkX4KtMpeRLdEbQbuYPoavDqj4CRznnmg@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] lib: sbi: Add VIRQ ecall extension
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_140749_684471_3BCCB57F 
X-CRM114-Status: GOOD (  26.59  )
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

SGkgQW5kcmV3LAoKT24gRnJpLCBGZWIgMTMsIDIwMjYgYXQgNDowM+KAr1BNIEFuZHJldyBKb25l
cwo8YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBGZWIg
MTMsIDIwMjYgYXQgMDI6MDQ6NTlQTSAtMDUwMCwgUmF5bW9uZCBNYW8gd3JvdGU6Cj4gPiBGcm9t
OiBSYXltb25kIE1hbyA8cmF5bW9uZC5tYW9AcmlzY3N0YXIuY29tPgo+ID4KPiA+IEFkZCB2ZW5k
b3IgU0JJIGV4dGVuc2lvbiBlY2FsbCBmb3IgVklSUS4KPiA+IFRoaXMgYWxsb3dzIFMtbW9kZSBw
YXlsb2FkIHRvIHBvcC9jb21wbGV0ZSB0aGUgbmV4dCBwZW5kaW5nIFZJUlEgaGFzCj4gPiBjb3Vy
aWVkIGludG8gdGhlIGN1cnJlbnQgZG9tYWluLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFJheW1v
bmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5jb20+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3Ni
aS9zYmlfZWNhbGxfaW50ZXJmYWNlLmggfCAxOCArKysrKysrKysrCj4gPiAgbGliL3NiaS9LY29u
ZmlnICAgICAgICAgICAgICAgICAgIHwgIDUgKysrCj4gPiAgbGliL3NiaS9vYmplY3RzLm1rICAg
ICAgICAgICAgICAgIHwgIDMgKysKPiA+ICBsaWIvc2JpL3NiaV9lY2FsbF92aXJxLmMgICAgICAg
ICAgfCA1NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFu
Z2VkLCA4MyBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi9zYmkvc2Jp
X2VjYWxsX3ZpcnEuYwo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGxf
aW50ZXJmYWNlLmggYi9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmgKPiA+IGluZGV4
IDc2NjI0ZTNmLi45Y2I5YTdlYiAxMDA2NDQKPiA+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9lY2Fs
bF9pbnRlcmZhY2UuaAo+ID4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5o
Cj4gPiBAQCAtMTI2LDYgKzEyNiwyNCBAQAo+ID4gICNkZWZpbmUgU0JJX0VYVF9GV0ZUX1NFVCAg
ICAgICAgICAgICAweDAKPiA+ICAjZGVmaW5lIFNCSV9FWFRfRldGVF9HRVQgICAgICAgICAgICAg
MHgxCj4gPgo+ID4gKyNpZmRlZiBDT05GSUdfU0JJX0VDQUxMX1ZJUlEKPiA+ICsKPiA+ICsvKiBW
ZW5kb3IgZXh0ZW5zaW9uIGJhc2UgcmFuZ2UgaXMgZGVmaW5lZCBieSB0aGUgU0JJIHNwZWMuIENo
b29zZSBhIHByaXZhdGUgSUQuICovCj4gPiArI2RlZmluZSBTQklfRVhUX1ZJUlEgICAgICAgICAg
ICAgICAgIDB4MDkwMDUyNGQKPgo+IEknbSBub3Qgc3VyZSB3aGVyZSB0aGlzIG51bWJlciBjb21l
cyBmcm9tLiBJJ2QgZXhwZWN0IGl0IHRvIGJlCj4gMHg1NjQ5NTI1MSA9PSAiVklSUSIKPgo+ID4g
Kwo+ID4gKy8qIEZ1bmN0aW9uIElEcyBmb3IgU0JJX0VYVF9WSVJRICovCj4gPiArI2RlZmluZSBT
QklfRVhUX1ZJUlFfUE9QICAgICAgICAgICAgIDAKPiA+ICsjZGVmaW5lIFNCSV9FWFRfVklSUV9D
T01QTEVURSAgICAgICAgICAgICAgICAxCj4gPiArCj4gPiArLyoKPiA+ICsgKiBTQklfRVhUX1ZJ
UlFfUE9QCj4gPiArICogUmV0dXJuczoKPiA+ICsgKiAgIGEwOiBTQkkgZXJyb3IgY29kZSAoMCBm
b3Igc3VjY2VzcykKPiA+ICsgKiAgIGExOiBuZXh0IHBlbmRpbmcgaHdpcnEgKDAgaWYgbm9uZSBw
ZW5kaW5nKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBeIHZpcnEsIGJ1dC4uLgo+Cj4gaG93
IGFib3V0IGNyZWF0aW5nIGFuIFNCSSBmdW5jdGlvbiB3aGljaCBhbGxvd3MgcmVnaXN0ZXJpbmcg
YSBzaGFyZWQKPiBtZW1vcnkgcmVnaW9uIChhcyBzZXZlcmFsIFNCSSBleHRlbnNpb25zIGFscmVh
ZHkgZG8pIGFuZCB0aGVuIHBsYWNlIGEKPiBiaXRtYXAgaW4gdGhhdCBzaGFyZWQgbWVtb3J5IHdo
aWNoIHJlcHJlc2VudHMgYWxsIHZpcnFzIChhIHNldCBiaXQgbWVhbnMKPiB0aGF0IHRoYXQgdmly
cSBpcyBwZW5kaW5nKS4gVGhhdCB3b3VsZCBhbGxvdyBTLW1vZGUgdG8gaW1tZWRpYXRlbHkgZ2V0
Cj4gYWxsIHBlbmRpbmcgdmlycXMgaW4gaXRzIFNTRSBoYW5kbGVyIGFuZCB3ZSB3b3VsZG4ndCBu
ZWVkIHRvIHdvcnJ5IGFib3V0Cj4gYSBxdWV1ZSBmaWxsaW5nIHVwLiBUaGUgZG93bnNpZGUgaXMg
dGhhdCBTLW1vZGUgd291bGRuJ3QgbmVjZXNzYXJpbHkKPiBoYW5kbGUgdGhlIHZpcnFzIGluIEZJ
Rk8gb3JkZXIuIEJ1dCwgdGhhdCBjYW4gYmUgYSBmZWF0dXJlLCBiZWNhdXNlIHRoZQo+IHF1ZXVl
IGZvcmNlcyBGSUZPIG9yZGVyIHdoZXJlYXMgUy1tb2RlIG1heSBuZWVkIHRvIGhhbmRsZSB0aGVt
IGluIHNvbWUKPiBwcmlvcml0eSBvcmRlciBpbnN0ZWFkLgo+CgpUaGlzIHNvdW5kcyBnb29kLiBN
YXliZSB3ZSBjYW4gbWFrZSBib3RoIGltcGxlbWVudGF0aW9ucyBzZWxlY3RhYmxlCnZpYSBLY29u
Zmlncy4KTGV0IG1lIGNvbGxlY3QgbW9yZSBmZWVkYmFjaywgSSBjYW4gbWFrZSB0aGUgb3B0aW9u
YWwgYml0bWFwIGluIGEgc2Vjb25kIHBoYXNlLgoKPiA+ICsgKi8KPiA+ICsKPiA+ICsjZW5kaWYK
PiA+ICsKPiA+ICBlbnVtIHNiaV9md2Z0X2ZlYXR1cmVfdCB7Cj4gPiAgICAgICBTQklfRldGVF9N
SVNBTElHTkVEX0VYQ19ERUxFRyAgICAgICAgICAgPSAweDAsCj4gPiAgICAgICBTQklfRldGVF9M
QU5ESU5HX1BBRCAgICAgICAgICAgICAgICAgICAgPSAweDEsCj4gPiBkaWZmIC0tZ2l0IGEvbGli
L3NiaS9LY29uZmlnIGIvbGliL3NiaS9LY29uZmlnCj4gPiBpbmRleCBjNmNjMDRiYy4uODQ3OWY4
NjEgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvc2JpL0tjb25maWcKPiA+ICsrKyBiL2xpYi9zYmkvS2Nv
bmZpZwo+ID4gQEAgLTY5LDQgKzY5LDkgQEAgY29uZmlnIFNCSV9FQ0FMTF9TU0UKPiA+ICBjb25m
aWcgU0JJX0VDQUxMX01QWFkKPiA+ICAgICAgIGJvb2wgIk1QWFkgZXh0ZW5zaW9uIgo+ID4gICAg
ICAgZGVmYXVsdCB5Cj4gPiArCj4gPiArY29uZmlnIFNCSV9FQ0FMTF9WSVJRCj4gPiArICAgICBi
b29sICJWSVJRIGV4dGVuc2lvbiIKPiA+ICsgICAgIGRlZmF1bHQgeQo+ID4gKwo+ID4gIGVuZG1l
bnUKPiA+IGRpZmYgLS1naXQgYS9saWIvc2JpL29iamVjdHMubWsgYi9saWIvc2JpL29iamVjdHMu
bWsKPiA+IGluZGV4IDA3ZDEzMjI5Li4xOGU1OTBhYiAxMDA2NDQKPiA+IC0tLSBhL2xpYi9zYmkv
b2JqZWN0cy5tawo+ID4gKysrIGIvbGliL3NiaS9vYmplY3RzLm1rCj4gPiBAQCAtNjQsNiArNjQs
OSBAQCBsaWJzYmktb2Jqcy0kKENPTkZJR19TQklfRUNBTExfU1NFKSArPSBzYmlfZWNhbGxfc3Nl
Lm8KPiA+ICBjYXJyYXktc2JpX2VjYWxsX2V4dHMtJChDT05GSUdfU0JJX0VDQUxMX01QWFkpICs9
IGVjYWxsX21weHkKPiA+ICBsaWJzYmktb2Jqcy0kKENPTkZJR19TQklfRUNBTExfTVBYWSkgKz0g
c2JpX2VjYWxsX21weHkubwo+ID4KPiA+ICtjYXJyYXktc2JpX2VjYWxsX2V4dHMtJChDT05GSUdf
U0JJX0VDQUxMX1ZJUlEpICs9IGVjYWxsX3ZpcnEKPiA+ICtsaWJzYmktb2Jqcy0kKENPTkZJR19T
QklfRUNBTExfVklSUSkgKz0gc2JpX2VjYWxsX3ZpcnEubwo+ID4gKwo+ID4gIGxpYnNiaS1vYmpz
LXkgKz0gc2JpX2JpdG1hcC5vCj4gPiAgbGlic2JpLW9ianMteSArPSBzYmlfYml0b3BzLm8KPiA+
ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9jb25zb2xlLm8KPiA+IGRpZmYgLS1naXQgYS9saWIvc2Jp
L3NiaV9lY2FsbF92aXJxLmMgYi9saWIvc2JpL3NiaV9lY2FsbF92aXJxLmMKPiA+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMC4uYjE5MjU5OGUKPiA+IC0tLSAvZGV2L251
bGwKPiA+ICsrKyBiL2xpYi9zYmkvc2JpX2VjYWxsX3ZpcnEuYwo+ID4gQEAgLTAsMCArMSw1NyBA
QAo+ID4gKy8qCj4gPiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+
ID4gKyAqCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KPiA+
ICsgKgo+ID4gKyAqIEF1dGhvcjogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNv
bT4KPiA+ICsgKi8KPiA+ICsKPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9jb25zb2xlLmg+Cj4gPiAr
I2luY2x1ZGUgPHNiaS9zYmlfZWNhbGwuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9lY2FsbF9p
bnRlcmZhY2UuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV9lcnJvci5oPgo+ID4gKyNpbmNsdWRl
IDxzYmkvc2JpX3RyYXAuaD4KPiA+ICsjaW5jbHVkZSA8c2JpL3NiaV92aXJxLmg+Cj4gPiArCj4g
PiArc3RhdGljIGludCBzYmlfZWNhbGxfdmlycV9oYW5kbGVyKHVuc2lnbmVkIGxvbmcgZXh0aWQs
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgZnVuY2lk
LAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfcmVn
cyAqcmVncywKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHNiaV9l
Y2FsbF9yZXR1cm4gKm91dCkKPiA+ICt7Cj4gPiArICAgICAodm9pZClleHRpZDsKPiA+ICsKPiA+
ICsgICAgIHNiaV9wcmludGYoIltFQ0FMTCBWSVJRXSBWSVJRIGVjYWxsIGhhbmRsZXIsIGZ1bmNp
ZDogJWxkXG4iLCBmdW5jaWQpOwo+Cj4gWW91J2xsIHdhbnQgdG8gZ2V0IHJpZCBvZiB0aGVzZSBw
cmludCBzdGF0ZW1lbnRzIHdoZW4gcG9zdGluZyB3aXRob3V0IHRoZQo+IFJGQy4KPgoKU3VyZS4g
Tm8gd29ycmllcy4gVGhlIGZvcm1hbCBwYXRjaCB3aWxsIGNvbWUgdG9nZXRoZXIgd2l0aCB0aGUK
Y29tcGxldGUgVklSUSBpbXBsZW1lbnRhdGlvbiBhbmQgYWxsIHZlcmJvc2UgcHJpbnRzIHdpbGwg
YmUgcmVtb3ZlZC4KClRoYW5rcyBhbmQgcmVnYXJkcywKUmF5bW9uZAoKPiBUaGFua3MsCj4gZHJl
dwoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
