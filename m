Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3DDCD4851
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 06:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WJDWYTJ52FTNxW/CmQhQ9mNlSpSD/b1ARQ0oSaASI0=; b=vb+x922shW7sTO
	ZZJoEhobTf8O9m6+pVmg4PmlPodRTgoxH+e+yKh/QF6+vrrz+reNdUr5ORF+G58Fk0nTWyc/78dtV
	8/ej9HMDvIBM+g9wuBozKJzzevvDuzn5R1yD2Df6qvSrMiVIBWVuosZiYzGZLvBrMwKq8zYn64zsB
	fBdpsPipedOWDQmAMDwsL6Swt0UjQ55HJP2rxNQdugLV4I13ukl+1VUnpelOwzQqjHN5IS+IRzCMA
	1SQyShsztJ+xRikv7ANnTM9RroE/IWhXrXic+LeOlwGDCLUTtOb+t/Q6HrNzj53tlN6+hTIphrPmL
	fbwjbFaic4xd2mgxjMTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgrL-0000000FoGU-0Mjr;
	Tue, 12 May 2026 06:44:51 +0000
Received: from mail-vs1-xe31.google.com ([2607:f8b0:4864:20::e31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMgrI-0000000FoFZ-2rcd
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 06:44:49 +0000
Received: by mail-vs1-xe31.google.com with SMTP id ada2fe7eead31-6312a0d556cso1930685137.3
        for <opensbi@lists.infradead.org>; Mon, 11 May 2026 23:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778568287; cv=none;
        d=google.com; s=arc-20240605;
        b=j/MG0K9m/Lt0jEMPnv3H8bhh4QuEiWdDgK/Y7LhXlXQnmw5OEa9Q8GVjmVaLs8A6tb
         d9pEAmyz3QR7F167AjZkP66fqLmUX43r2Nk/mmuwNeUKn7zlSHR38z499OgE/HMOqCGL
         AISQCwRDraYeyjuipSOcfhGP+a8Z0FN2kAKOF3SIlgO/yaj71W8UpZ0b56/zYonV+gcI
         MyWZ4RR5d0/Ww1d41lR03HxLkWtiJF50QWKv8lEPgZqWEG2+v1zoJOh9NXsIZj/+vPpw
         VjygiuI+O5m1MXvrTWPeGH/KWI5drIWBE94jqOZNExxN6Zx6xcoUGqnJa+aWXA3alwYo
         //2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+eD6uWUf2sXEURX0Mbn3/fU1oWaQE+uyhvuHbtXEBpo=;
        fh=OZ67+FmlC1YbweOEx1W+JhD7gJ24n8zm1pIxthNEIrU=;
        b=BZ9cLYN4LnlfiuFliMT/pL18UnBCgZyUNauGdvM2aYcDOdgyZ/X88OFUd9E/IbD4mX
         4nvoxTj9f74aMpQE3/IhKT7v+0/YgW5RqZfCWMVCN4V8xGcHwLGR9sD5x24bwl/J0Tt9
         tsOz8cWN2DbYH8Rj17qw8f1kQ8NgdoOv8T+wdYFD/hTs/m0wO9iq3To0qADMnvADClPF
         F5sWQoALURV+pvwdUniKqwB1/DPApz3gdoy1PP9xtqbdwN5eziufrdRIRM8Ml/A/zUhd
         o8fHQ3QTX7PykDdqJUkfvUqTFr4h+odH4+0lrCcvB1zbiCl/MIECvwBEk/p4UBjjG1q0
         24zA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778568287; x=1779173087; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+eD6uWUf2sXEURX0Mbn3/fU1oWaQE+uyhvuHbtXEBpo=;
        b=EeFqXhQPvKoUio5QIBR4OSZxqTawKjw22vu/6r80H3Gz02i2DJEU4Vp9RYePn7K7gP
         BukYN0UcYraSRvjPxOdY5sjA+J8KdF3oryBFvU9ZWVVJbf8bB4/pCiIlKdP3L0aMnDnJ
         F/HQN0kifOJKRLDZClAQfA6L1QtID1jqBZtJnHVAhbCmmB5M5QzBlw3nKVAvgky2Q07G
         bXgWs7YZxuNDuqmDbgmIDZe0WHWgrtCjO7xoqm1zQbpWJ7gVFI65tHkPWDeesemc93tC
         bJdppLBwXvoNS6JEeKmRnAY4j0HFQJTF4Sl96ME69KgALxPolngCKDtcJOVZS7Y7ifAU
         KPew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778568287; x=1779173087;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+eD6uWUf2sXEURX0Mbn3/fU1oWaQE+uyhvuHbtXEBpo=;
        b=pjo0t4GU+yCUoaMLRJJ4GsHSQOPVuLfGcaV7aO5jh1brI3M9KyDfEdk8CtC5+Pp0xH
         +XCHyQi9EnU96pHIlfZgWpyj3Hi9HeirkwvvivQDjsLFkfGTsYvQIdVxWBy62kMBpYze
         ZdRIt6iFL2zIpC+5OUwxer3wV0a1AJ6XSRfk5qRbcvwriguUHmZM3huLfn7mFzRR5aeV
         5sijs75A2yzJlHpk0Qv0ifgpWaYyhQ46DebdTGfeiY1PX2ANR4Ngd9lFjldpVlQ3xG9C
         ysNbNo+pidoLtGuV54lt6/Nj1LBB0pMxyzIU26K6VabZlrsRywSqDNcnzeIdMaBHu0Y1
         7KrQ==
X-Forwarded-Encrypted: i=1; AFNElJ/PoCwriyG5IkwpsRWCvHmjbins7GwknzTvCT0kzPxlhst2OGfenKVQ7kh6w8sw/TxP7VzXpIE4@lists.infradead.org
X-Gm-Message-State: AOJu0YxqoHx3rpHDzhuEaH5aKbGdZo2KTlffW4/HuRotPDgirp8Bb/A8
	nSbSNNTJV534X3xOWeiyImcIIqvhrwFAVjENpi//jhB0q7c1fzh2wdnno2OCdcxvnt5vaRNth2T
	GkKl95UHXmRSWWizQS+ZWrqThx5/1xfuoml9KGLsGsPE6WULQlloa9uG/rQ==
X-Gm-Gg: Acq92OEL1lTcamSoRZLo9TUZqMyF2dwVrLmsTKS5MdiHx48wJ+oO5unXHDOEL7bpcWn
	Lf8lY71yWphP4Rzv8sfFFPZ2HiC6EKpXnnyP0/JwIQZwXvaQAmtiCjIbspKOhbNd7x/yzBndNMZ
	BNzG+IMRygdoGBHts2FpZyRI33xmDWeRA1agWOEfHUDmT0PYgS07dahM13ZZpqt3n/pYfSgNLSa
	U7rmfUcgF6PPv+GgxlpWa35DGNbcykQ+IfJB/gZIvSW3yQOTi8cpU6LEq1ddGZjAGJ0NuNN2wG7
	Wr2C6SoWJQ==
X-Received: by 2002:a67:e7c1:0:b0:62f:39a9:ae67 with SMTP id
 ada2fe7eead31-6313ea9cb65mr4234041137.17.1778568286970; Mon, 11 May 2026
 23:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
 <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
 <CAAhSdy3Pm5ESW17pz5wZxrbB5hoTHVBz_rQWo9voa6s+gxi7Pw@mail.gmail.com>
In-Reply-To: <CAAhSdy3Pm5ESW17pz5wZxrbB5hoTHVBz_rQWo9voa6s+gxi7Pw@mail.gmail.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 12 May 2026 14:44:35 +0800
X-Gm-Features: AVHnY4LG0u7eBU0tJzoQOOuoDbrosjYBEighkGGrTISzDcH_ljDXq6yBMekBAug
Message-ID: <CAHh=Yk9PUdCc3kbBWxmaEOOG1WauvYXctFdrQhvM-=NbWr_DCg@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] lib: sbi: hart: Detect and enable Smrnmi before
 trap-based feature detection
To: Anup Patel <anup@brainfault.org>
Cc: Evgeny Voevodin <evvoevod@tenstorrent.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_234448_764590_110DAD73 
X-CRM114-Status: GOOD (  31.85  )
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

QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4g5pa8IDIwMjblubQ15pyIOeaXpemAseWF
rSDkuIvljYgyOjUx5a+r6YGT77yaCgo+Cj4gT24gVGh1LCBNYXkgNywgMjAyNiBhdCAxMTozOOKA
r1BNIEV2Z2VueSBWb2V2b2Rpbgo+IDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+
ID4KPiA+IFRoZSBsb2NhdGlvbiBvZiB0aGUgUk5NSS9FIHRyYXAgdmVjdG9ycyBpbiB0aGUgU21y
bm1pIGV4dGVuc2lvbiBpcwo+ID4gaW1wbGVtZW50YXRpb24tZGVmaW5lZCwgc28gcGxhdGZvcm1z
IHdpdGggdmVuZG9yLXNwZWNpZmljIE5NSSB2ZWN0b3IKPiA+IG1lY2hhbmlzbXMgbXVzdCBpbnN0
YWxsIHRoZSBmaXJtd2FyZSdzIE5NSSBlbnRyeSBwb2ludHMgdGhlbXNlbHZlcy4KPiA+Cj4gPiBB
ZGQgYW4gc21ybm1pX2hhbmRsZXJzX2luaXQoKSBjYWxsYmFjayB0byBzYmlfcGxhdGZvcm1fb3Bl
cmF0aW9ucyB0aGF0Cj4gPiByZWNlaXZlcyB0aGUgZmlybXdhcmUgZW50cnkgcG9pbnRzIGFuZCBs
ZXRzIHBsYXRmb3JtIGNvZGUgaW5zdGFsbCB0aGVtCj4gPiBhdCB0aGUgaGFyZHdhcmUtc3BlY2lm
aWMgdmVjdG9yIGxvY2F0aW9ucy4gVHdvIHBvaW50ZXJzIGFyZSBwYXNzZWQ6Cj4gPgo+ID4gICAt
IF90cmFwX3JubWlfaGFuZGxlcjogdGhlIGRlZGljYXRlZCBSTk1JIGVudHJ5IHBvaW50IHRoYXQg
c2F2ZXMKPiA+ICAgICBjb250ZXh0IHVzaW5nIHRoZSBTbXJubWkgTU4qIENTUnMgYW5kIHJldHVy
bnMgdmlhIG1ucmV0Lgo+ID4gICAtIF90cmFwX2hhbmRsZXI6IHRoZSByZWd1bGFyIE0tbW9kZSB0
cmFwIGVudHJ5IHNpbmNlIFJOTUUgaXMgdGFrZW4KPiA+ICAgICBhcyBhIHJlZ3VsYXIgTS1tb2Rl
IHRyYXAgd2l0aCBOTUlFPTAuCj4gPgo+ID4gV2hlbiBTbXJubWkgaXMgcHJlc2VudCwgaW5zdGFs
bCB0aGUgcGxhdGZvcm0ncyBOTUkgdmVjdG9ycyB2aWEgdGhlIG5ldwo+ID4gY2FsbGJhY2ssIGlu
aXRpYWxpemUgTU5TQ1JBVENIIHdpdGggdGhlIHBlci1oYXJ0IHNjcmF0Y2ggcG9pbnRlciwgYW5k
Cj4gPiBzZXQgTU5TVEFUVVMuTk1JRS4KPiA+Cj4gPiBTbXJubWktZW5hYmxlZCBwbGF0Zm9ybXMg
bXVzdCByZWdpc3RlciBzbXJubWlfaGFuZGxlcnNfaW5pdDsgaWYgdGhlCj4gPiBleHRlbnNpb24g
aXMgZGV0ZWN0ZWQgYnV0IG5vIGNhbGxiYWNrIGlzIHJlZ2lzdGVyZWQsIHNiaV9wYW5pYygpIGlz
Cj4gPiBjYWxsZWQgc2luY2UgZW5hYmxpbmcgTk1JcyB3aXRob3V0IGhhbmRsZXJzIGluIHBsYWNl
IHdvdWxkIHJvdXRlCj4gPiBzdWJzZXF1ZW50IHRyYXBzIGludG8gbm93aGVyZS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBFdmdlbnkgVm9ldm9kaW4gPGV2dm9ldm9kQHRlbnN0b3JyZW50LmNvbT4K
Pgo+IExHVE0uCj4KPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KPgo+IFJlZ2FyZHMsCj4gQW51cAo+Cj4gPiAtLS0KPiA+ICBpbmNsdWRlL3NiaS9zYmlfcGxh
dGZvcm0uaCB8ICA0ICsrKysKPiA+ICBsaWIvc2JpL3NiaV9oYXJ0LmMgICAgICAgICB8IDIwICsr
KysrKysrKysrKysrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIvaW5jbHVk
ZS9zYmkvc2JpX3BsYXRmb3JtLmgKPiA+IGluZGV4IDcxNWRmNDk5Li5mZTM4MmI1NiAxMDA2NDQK
PiA+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oCj4gPiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfcGxhdGZvcm0uaAo+ID4gQEAgLTE1MCw2ICsxNTAsMTAgQEAgc3RydWN0IHNiaV9wbGF0
Zm9ybV9vcGVyYXRpb25zIHsKPiA+ICAgICAgICAgLyoqIHBsYXRmb3JtIHNwZWNpZmljIHBtcCBk
aXNhYmxlIG9uIGN1cnJlbnQgSEFSVCAqLwo+ID4gICAgICAgICB2b2lkICgqcG1wX2Rpc2FibGUp
KHVuc2lnbmVkIGludCBuKTsKPiA+Cj4gPiArICAgICAgIC8qKiBwbGF0Zm9ybSBzcGVjaWZpYyBT
bXJubWkgaGFuZGxlcnMgaW5pdCBvbiBjdXJyZW50IEhBUlQgKi8KPiA+ICsgICAgICAgdm9pZCAo
KnNtcm5taV9oYW5kbGVyc19pbml0KSh2b2lkICgqcm5taV9oYW5kbGVyKSh2b2lkKSwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKCpybm1lX2hhbmRsZXIpKHZvaWQpKTsKPiA+ICsK
PiA+ICAgICAgICAgLyoqIHBsYXRmb3JtIHNwZWNpZmljIFNtcm5taSBOTUkgaGFuZGxlci4KPiA+
ICAgICAgICAgICogIFJldHVybnMgU0JJX1NVQ0NFU1Mgb24gc3VjY2VzcywgZXJyb3IgY29kZSBp
ZiBOTUkgY2Fubm90IGJlIGhhbmRsZWQuICovCj4gPiAgICAgICAgIGludCAoKnJubWlfaGFuZGxl
cikoc3RydWN0IHNiaV90cmFwX2NvbnRleHQgKnRjbnR4KTsKPiA+IGRpZmYgLS1naXQgYS9saWIv
c2JpL3NiaV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+IGluZGV4IDc4MTE2MWU1Li45
MmM2MDJhYSAxMDA2NDQKPiA+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ID4gKysrIGIvbGli
L3NiaS9zYmlfaGFydC5jCj4gPiBAQCAtNTMyLDYgKzUzMiwyNiBAQCBzdGF0aWMgaW50IGhhcnRf
ZGV0ZWN0X2ZlYXR1cmVzKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiA+ICAgICAgICAg
aWYgKHJjKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+Cj4gPiArICAgICAgIGlm
IChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVJOTUkpKSB7
Cj4gPiArICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybSAqcGxhdCA9IHNi
aV9wbGF0Zm9ybV90aGlzaGFydF9wdHIoKTsKPiA+ICsgICAgICAgICAgICAgICBjb25zdCBzdHJ1
Y3Qgc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgKm9wcyA9IHNiaV9wbGF0Zm9ybV9vcHMocGxhdCk7
Cj4gPiArICAgICAgICAgICAgICAgZXh0ZXJuIHZvaWQgX3RyYXBfcm5taV9oYW5kbGVyKHZvaWQp
Owo+ID4gKyAgICAgICAgICAgICAgIGV4dGVybiB2b2lkIF90cmFwX2hhbmRsZXIodm9pZCk7Cj4g
PiArCj4gPiArICAgICAgICAgICAgICAgaWYgKCFvcHMgfHwgIW9wcy0+c21ybm1pX2hhbmRsZXJz
X2luaXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBzYmlfcGFuaWMoIlNtcm5taSBkZXRl
Y3RlZCwgYnV0IHBsYXRmb3JtIGxhY2tzIHNtcm5taV9oYW5kbGVyc19pbml0IGNhbGxiYWNrXG4i
KTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAvKiBSZXVzZSBfdHJhcF9oYW5kbGVyIGZvciB0
aGUgUk5NRSBzbG90IHNpbmNlIFJOTUUgaXMgdGFrZW4KPiA+ICsgICAgICAgICAgICAgICAgKiBh
cyBhIHJlZ3VsYXIgTS1tb2RlIHRyYXAgd2l0aCBOTUlFPTAuICovCj4gPiArICAgICAgICAgICAg
ICAgb3BzLT5zbXJubWlfaGFuZGxlcnNfaW5pdChfdHJhcF9ybm1pX2hhbmRsZXIsIF90cmFwX2hh
bmRsZXIpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIC8qIEluaXRpYWxpemUgTU5TQ1JBVENI
IGZvciB0aGUgUk5NSSBoYW5kbGVyICovCj4gPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENT
Ul9NTlNDUkFUQ0gsIHNjcmF0Y2gpOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIC8qIEVuYWJs
ZSBOTUlzICovCj4gPiArICAgICAgICAgICAgICAgY3NyX3NldChDU1JfTU5TVEFUVVMsIE1OU1RB
VFVTX05NSUUpOwpUd28gY29uY2VybnMgYWJvdXQgdGhpcyBibG9jawoKRmlyc3QsIHNiaV9wYW5p
YygpIHdoZW4gc21ybm1pX2hhbmRsZXJzX2luaXQgaXMgTlVMTCBpcyB0b28gc3RyaWN0LgpOb3Qg
YWxsIHBsYXRmb3JtcyB3aXRoIFNtcm5taSBuZWVkIHRvIHByb2dyYW0gYSB2ZW5kb3Itc3BlY2lm
aWMgTk1JCnZlY3RvciByZWdpc3Rlci4KU29tZSBpbXBsZW1lbnRhdGlvbnMgaGF2ZSBhIGZpeGVk
IE5NSSB2ZWN0b3IgYWRkcmVzcyBvciByb3V0ZSBOTUlzCnRocm91Z2ggbXR2ZWMgYnkgZGVmYXVs
dDsgZm9yIHRoZXNlLCBzZXR0aW5nIE1OU0NSQVRDSCBhbmQgTk1JRSBpcwpzdWZmaWNpZW50IGFu
ZCBubyBwbGF0Zm9ybSBjYWxsYmFjayBpcyBuZWVkZWQuCgpUaGlzIGNhbiBiZSByZXByb2R1Y2Vk
IHdpdGggUUVNVSB2aXJ0OgoKcWVtdS1zeXN0ZW0tcmlzY3Y2NCAtTSB2aXJ0IC1jcHUgcnY2NCxz
bXJubWk9b24gLW0gMjU2bSBcCiAgICAgIC1iaW9zIGZ3X2p1bXAuYmluIC1ub2dyYXBoaWMgLW5v
LXJlYm9vdAoKVGhlIGZpcm13YXJlIGhhbmdzIHdpdGggemVybyBvdXRwdXQuIFRoZSBwYW5pYyBm
aXJlcyBiZWZvcmUKc2JpX3BsYXRmb3JtX2Vhcmx5X2luaXQoKSBzbyB0aGUgY29uc29sZSBpcyBu
b3QgeWV0IGluaXRpYWxpemVkIGFuZAp0aGUgbWVzc2FnZSBpcyBzaWxlbnRseSBkcm9wcGVkLgoK
QWRkaW5nIGEgbm8tb3Agc3R1YiB0byB0aGUgZ2VuZXJpYyBwbGF0Zm9ybSBjb25maXJtcyB0aGUg
cGFuaWMgaXMgIHRoZQpzb2xlIGNhdXNlIC0tIGJvb3QgcHJvY2VlZHMgbm9ybWFsbHkgd2l0aCB0
aGUgc3R1YiBpbiBwbGFjZS4KClNlY29uZCwgdGhlIGNhbGxiYWNrIHJldHVybnMgdm9pZCwgc28g
dGhlcmUgaXMgbm8gd2F5IHRvIGRldGVjdAp3aGV0aGVyIHRoZSBwbGF0Zm9ybSBzdWNjZWVkZWQg
aW4gcHJvZ3JhbW1pbmcgdGhlIE5NSSB2ZWN0b3IuCmNzcl9zZXQoTU5TVEFUVVMsIE5NSUUpIHRo
ZW4gcnVucyB1bmNvbmRpdGlvbmFsbHkuCklmIHRoZSBjYWxsYmFjayBmYWlscyBzaWxlbnRseSwg
Tk1JcyBhcmUgZW5hYmxlZCBidXQgdGhlIGhhcmR3YXJlCnZlY3RvciByZWdpc3RlciBpcyBsZWZ0
IGF0IGl0cyByZXNldCB2YWx1ZS4gVGhlIGZpcnN0IE5NSSB3b3VsZCBqdW1wCnRvIGFuIHVuZGVm
aW5lZCBhZGRyZXNzLgoKU3VnZ2VzdGVkIGZpeDoKCi8qIGFsbG93IE5VTEw6IHBsYXRmb3JtcyB3
aXRoIGZpeGVkIG9yIG10dmVjLWJhc2VkIE5NSSB2ZWN0b3JzCiogZG8gbm90IG5lZWQgdG8gcHJv
Z3JhbSBhbnkgdmVuZG9yIHJlZ2lzdGVyICovCmlmIChvcHMgJiYgb3BzLT5zbXJubWlfaGFuZGxl
cnNfaW5pdCkgewogICAgICAgIGludCByZXQgPSBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0KF90
cmFwX3JubWlfaGFuZGxlciwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBfdHJhcF9oYW5kbGVyKTsKICAgICAgICBpZiAocmV0KQogICAgICAgICAgICByZXR1cm4g
cmV0Owp9Cgpjc3Jfd3JpdGUoQ1NSX01OU0NSQVRDSCwgc2NyYXRjaCk7CmNzcl9zZXQoQ1NSX01O
U1RBVFVTLCBNTlNUQVRVU19OTUlFKTsKClRoaXMgcmVxdWlyZXMgY2hhbmdpbmcgdGhlIGNhbGxi
YWNrIHNpZ25hdHVyZSBmcm9tIHZvaWQgdG8gaW50LgoKUGxhdGZvcm1zIHRoYXQgaGF2ZSBub3Ro
aW5nIHRvIHByb2dyYW0gcmV0dXJuIDAsIHBsYXRmb3JtcyB0aGF0IGZhaWwKcmV0dXJuIGFuIGVy
cm9yLCBhbmQgcGxhdGZvcm1zIHdpdGggbm8gY2FsbGJhY2sgYXQgYWxsIGFyZSBoYW5kbGVkCmdy
YWNlZnVsbHkgd2l0aG91dCBhIHBhbmljLgoKPiA+ICsgICAgICAgfQo+ID4gKwo+ID4gICNkZWZp
bmUgX19jaGVja19ocG1fY3NyKF9fY3NyLCBfX21hc2spICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIFwKPiA+ICAgICAgICAgb2xkdmFsID0gY3NyX3JlYWRfYWxsb3dl
ZChfX2NzciwgJnRyYXApOyAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgICBp
ZiAoIXRyYXAuY2F1c2UpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gPiAtLQo+ID4gMi40My4wCj4gPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
