Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863CCEA3F22
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 16:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FnSiPSIn2SsiLDQkxoaTU5zW39OG3K78BQYhPNcCLlQ=; b=kof/I8QEx77Z/X
	ggMe59mIBrbLZBZlX2s3o/iqgTobStDs5sqsCsmT9yLvINT6Of/Z2QjvX/f3XFj/TePmRAAvTDAq2
	K2roDjFMxj+BAqX9o1F1NPTmQxdAV8ggqYuFVxXG94QD0kRCwEH5RRuKE0QZgQJScviWAFzO+jyvn
	VAR1/8eUL8PrsZ6Btfeo/OBQhRezbZ3bZCJJ9Xr3ZxRkjaYJk0KfLls2VEp76uqTVf/VaDRjnag5e
	285SnKk1v8gCK0AW7dXlInZJcaFWQlGtZNt1p5HR4npAL6e5pCTsNM9deBy/tjVNwZKIwa/LU4DrN
	1wUnHXl14zWH0xDPm/8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqJ7-0000000HC8F-3Mbv;
	Tue, 10 Feb 2026 16:09:45 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqJ5-0000000HC7s-1eGG
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 16:09:44 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7d45d37f8e4so579515a34.0
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 08:09:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770739782; cv=none;
        d=google.com; s=arc-20240605;
        b=Z26C/qaTqPi0F5COizWMRF9/mT2Zsc6ZcFx0xt6fnMt7sBNS+BLtBthQp6aYticwJ3
         Pa0VsAyBJ/6mQCg24ad4ig3ND/DmO0e6OzEUqNESFevRGtqJWTNeDxxa4Eux0YwcX5gt
         Vx0fW/glAXbwjdoYCexFRAlGcXh6acb+9VA2CN9vo4uCSiUuL1VI1ri4Uooh2pl5J6rQ
         BQuHcf/iPE3xwzcAjDZqW1yuaVfXsR15mOphzWo2nVEBZIN5QVKh62Mqp481qqADDueW
         lZlJsmJ6+ImhhuK2dB8G3mBrpSuoFDb+7JUhiqeSUXXXm6wkHboPVIrR2GlIddkJKafX
         gZKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3JBrjdPYDNzqdZEL8b3ifzbkd3DeLOXm6EW6Vtdwn9s=;
        fh=ib6F6R1GdqzW5JcwHX6vjTeLmreRTHw0yvI/tPC4HFw=;
        b=Mkp+bPbjAofbVMQ5UdbviET7ku8PdEoq/l29LXLyB6aC8krv0bcGzdY8XhcDewe5gT
         AUqgZi9CQUv/7Sg8gujc1r46PEohtUcuPLQfm2cadxpE4a6gH7mdQ+G13U8fnfUjCWSK
         8hS5sFiB6cvciG3YEpf6zxMEzvgNQD5Ge6NwOz0fXlVIkepbKRw0pSv+yxAe/BZVFMHg
         UbRSH9v5YRBImwg55boLdz2RfJpnQPFGtgeKvgzqAVcTU4AIPzTUcxzRAkAOxIVJwz2y
         MmeV423F4Z+MsO/4j+LhsaPYhU0UYknHw2Av61UCR0zybBSj6GTjsdCbNFkvp+Km8M44
         KJRw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770739782; x=1771344582; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3JBrjdPYDNzqdZEL8b3ifzbkd3DeLOXm6EW6Vtdwn9s=;
        b=kUbtdj/R2ybfJw9qn8erBjRHzHDbAIJ+RLmiEwyF8OgySBrUs+v0g3r4mvlj9BSRfs
         Oaa3/alKaC2jCWbuE9sbYBwEQ9z7lVCjV4Ns6Dm3RYg242ZCCNV5OVZWVcorDHwUIYfX
         gei6AEorZFm5rwi1yrlPFp8WY2NoN5Q5e3fhH3zp8pkGCuSafr3QxQ01bAoZVO6IGaDw
         ar4zmwgVi/nvpViy185UvaN+XyRM/C66MmNLin/mPFoOTpgyrPUFgkKvJZ4svcTsdU71
         fD78Yr6w53RNkqcDIFjL8FYv/DkqCGTVRNrvNnQY/iuHuT23UAgEsfsLUFDFcCubYGoi
         FU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770739782; x=1771344582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3JBrjdPYDNzqdZEL8b3ifzbkd3DeLOXm6EW6Vtdwn9s=;
        b=w6KACT40V2TTcupLBn0jKORyId8IFh+G6asLLCjxo+5FOn9b/UTdJJ1GFDvba2jkD+
         U096HAQKdpIBKQy+HBvnroxy6P2f8OIAigUdgjPQ+2v7S/tIAXqINOnaIiHiqW0O1jcw
         stHqD1InUnUgySNveVUTAx8VmeOHn5c0zQw38SQUvjMnFnIqvjPwFcFCSODi6xElQly8
         KY7shW0wCw7x9nNGdGNAIxoIDWrwCZyslt+RbnSXbX2d11BOq/fRLi/3RSxiSm85gU0L
         rB4d9Jh8QDKpiGhXbpsEwcNICV+e//bOzzIrwzm8EGjJhXGe529ktkdjTqVKr+QhQKMU
         oDTg==
X-Forwarded-Encrypted: i=1; AJvYcCUyUVcAu+lJqGFt58jq+cEca+0DLHQSREaxkWhM1sZwbeelOITCCMITauADFHQ9nLdvMJsLtMDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzDF3ysf38c/v2uYx1Wn9NhdJ7zIwVQUWVC2EXZiygvjRSIX3QU
	Q+crSIkmVp0fumaKOHRANs0skOiXlatNx312heA96w7b5to7sCvzWSpfIfpA7k3ZRShJTFALqen
	jPN7duuVeAF/pUTvi21svpa2nT9sXHjN9JCa38/VdHg==
X-Gm-Gg: AZuq6aJb8q6skngwA8v4LDB2EkwnhGZ1kacSJJLVnKOu0fEFUCjzObkHWySfRpNBK9L
	D//+V94hSNEuNa85uHWzakVe60wOcCqEhB4yx2AGcwz5fZ4eeNh7JNhvu4Cl1SsfwVWwpGUaEWT
	1pPKBYTps5xVPar7SH8Y1cjWfnuBZtyc3myUquUIxAVrxa/N4k8XVpjCtYxjieJW+vWNC/pEV47
	Jfnwm1Rk4f+a3yGY47Nr3voCVeCJjXeYEOyRTsZX7UYyrhUwH5RdySRQUoKkVPc+BGu99I7hXmc
	wiGjGUpamOOwRgymoCaJGKxf09l9r7ijvPpLLOt8wiBFLdc/OcVOfojUQNdpwOJVMUwWhN8=
X-Received: by 2002:a05:6820:1518:b0:66f:1d80:c406 with SMTP id
 006d021491bc7-66f1d80c55bmr4746871eaf.38.1770739781988; Tue, 10 Feb 2026
 08:09:41 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-6-anup.patel@oss.qualcomm.com> <0f55c5db-929f-4192-994a-8432c5bda1b4@gmail.com>
In-Reply-To: <0f55c5db-929f-4192-994a-8432c5bda1b4@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Feb 2026 21:39:30 +0530
X-Gm-Features: AZwV_QiEq0JCOP6R8RcYCN2rpcIBbDjAybxI9GOyGCwpGzXdpfjNoeSLDHGdBhY
Message-ID: <CAAhSdy26XNCbfDhe8EpK-AWMneyS=Hpwo8mb7vC1zrcVhBMKPQ@mail.gmail.com>
Subject: Re: [PATCH 5/8] lib: sbi_irqchip: Support irqchip device targetting
 subset of harts
To: Raymond Mao <raymondmaoca@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Dave Patel <dave.patel@riscstar.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_080943_461410_53EF3267 
X-CRM114-Status: GOOD (  23.57  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMTo1NeKAr0FNIFJheW1vbmQgTWFvIDxyYXltb25kbWFv
Y2FAZ21haWwuY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiAyMDI2LTAyLTA3IDU6MjUg
YS5tLiwgYW51cC5wYXRlbCBhdCBvc3MucXVhbGNvbW0uY29tIChBbnVwIFBhdGVsKSB3cm90ZToK
PiA+IEl0IGlzIHBvc3NpYmxlIHRvIGhhdmUgcGxhdGZvcm0gd2hlcmUgYW4gaXJxY2hpcCBkZXZp
Y2UgdGFyZ2V0cwo+ID4gYSBzdWJzZXQgb2YgaGFydHMgYW5kIHRoZXJlIGFyZSBtdWx0aXBsZSBp
cnFjaGlwIGRldmljZXMgdG8gY292ZXIKPiA+IGFsbCBoYXJ0cy4KPiA+Cj4gPiBUbyBzdXBwb3J0
IHRoaXMgc2NlbmFyaW86Cj4gPiAxKSBBZGQgdGFyZ2V0X2hhcnRzIGhhcnRtYXNrIHRvIHN0cnVj
dCBzYmlfaXJxY2hpcF9kZXZpY2Ugd2hpY2gKPiA+ICAgICByZXByZXNlbnRzIHRoZSBzZXQgb2Yg
aGFydHMgdGFyZ2V0dGVkIGJ5IHRoZSBpcnFjaGlwIGRldmljZQo+ID4gMikgQ2FsbCB3YXJtX2lu
aXQoKSBhbmQgaXJxX2hhbmRsZSgpIGNhbGxiYWNrcyBvZiBhbiBpcnFjaGlwIGRldmljZQo+ID4g
ICAgIG9uIGEgaGFydCBvbmx5IGlmIGlycWNoaXAgZGV2aWNlIHRhcmdldHMgdGhhdCBwYXJ0aWN1
bGFyIGhhcnQKPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBhdGVsIDxhbnVwLnBhdGVsIGF0
IG9zcy5xdWFsY29tbS5jb20+Cj4gPiAtLS0KPiA+ICAgaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAu
aCB8ICA4ICsrKysrLS0KPiA+ICAgbGliL3NiaS9zYmlfaXJxY2hpcC5jICAgICB8IDQ4ICsrKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQo+ID4gICBsaWIvdXRpbHMvaXJxY2hp
cC9hcGxpYy5jIHwgMTIgKysrKysrKysrLQo+ID4gICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5j
IHwgIDcgKysrKy0tCj4gPiAgIGxpYi91dGlscy9pcnFjaGlwL3BsaWMuYyAgfCAgNSArKy0tCj4g
PiAgIDUgZmlsZXMgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pCj4g
Pgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmggYi9pbmNsdWRlL3Ni
aS9zYmlfaXJxY2hpcC5oCj4gPiBpbmRleCBjZGExZTUwZi4uYzNkZWQyNzEgMTAwNjQ0Cj4gPiAt
LS0gYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oCj4gPiArKysgYi9pbmNsdWRlL3NiaS9zYmlf
aXJxY2hpcC5oCj4gPiBAQCAtMTAsNiArMTAsNyBAQAo+ID4gICAjaWZuZGVmIF9fU0JJX0lSUUNI
SVBfSF9fCj4gPiAgICNkZWZpbmUgX19TQklfSVJRQ0hJUF9IX18KPiA+Cj4gPiArI2luY2x1ZGUg
PHNiaS9zYmlfaGFydG1hc2suaD4KPiA+ICAgI2luY2x1ZGUgPHNiaS9zYmlfbGlzdC5oPgo+ID4g
ICAjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+ID4KPiA+IEBAIC0yMCwxMSArMjEsMTQgQEAg
c3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSB7Cj4gPiAgICAgICAvKiogTm9kZSBpbiB0aGUgbGlz
dCBvZiBpcnFjaGlwIGRldmljZXMgKi8KPiA+ICAgICAgIHN0cnVjdCBzYmlfZGxpc3Qgbm9kZTsK
PiA+Cj4gPiArICAgICAvKiogU2V0IG9mIGhhcnRzIHRhcmdldHRlZCBieSB0aGlzIGlycWNoaXAg
Ki8KPiA+ICsgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgdGFyZ2V0X2hhcnRzOwo+ID4gKwo+ID4g
ICAgICAgLyoqIEluaXRpYWxpemUgcGVyLWhhcnQgc3RhdGUgZm9yIHRoZSBjdXJyZW50IGhhcnQg
Ki8KPiA+ICAgICAgIGludCAoKndhcm1faW5pdCkoc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAq
Y2hpcCk7Cj4gPgo+ID4gICAgICAgLyoqIFByb2Nlc3MgaGFyZHdhcmUgaW50ZXJydXB0cyBmcm9t
IHRoaXMgaXJxY2hpcCAqLwo+ID4gLSAgICAgaW50ICgqcHJvY2Vzc19od2lycXMpKHZvaWQpOwo+
ID4gKyAgICAgaW50ICgqcHJvY2Vzc19od2lycXMpKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2Ug
KmNoaXApOwo+ID4gICB9Owo+ID4KPiA+ICAgLyoqCj4gPiBAQCAtMzgsNyArNDIsNyBAQCBzdHJ1
Y3Qgc2JpX2lycWNoaXBfZGV2aWNlIHsKPiA+ICAgaW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Modm9p
ZCk7Cj4gPgo+ID4gICAvKiogUmVnaXN0ZXIgYW4gaXJxY2hpcCBkZXZpY2UgdG8gcmVjZWl2ZSBj
YWxsYmFja3MgKi8KPiA+IC12b2lkIHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9p
cnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPiAraW50IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3Ry
dWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4gPgo+ID4gICAvKiogSW5pdGlhbGl6ZSBp
bnRlcnJ1cHQgY29udHJvbGxlcnMgKi8KPiA+ICAgaW50IHNiaV9pcnFjaGlwX2luaXQoc3RydWN0
IHNiaV9zY3JhdGNoICpzY3JhdGNoLCBib29sIGNvbGRfYm9vdCk7Cj4gPiBkaWZmIC0tZ2l0IGEv
bGliL3NiaS9zYmlfaXJxY2hpcC5jIGIvbGliL3NiaS9zYmlfaXJxY2hpcC5jCj4gPiBpbmRleCAz
Yjk3MDUyNy4uNzdlYzA1YWYgMTAwNjQ0Cj4gPiAtLS0gYS9saWIvc2JpL3NiaV9pcnFjaGlwLmMK
PiA+ICsrKyBiL2xpYi9zYmkvc2JpX2lycWNoaXAuYwo+ID4gQEAgLTEzLDI0ICsxMyw0NCBAQAo+
ID4KPiA+ICAgc3RhdGljIFNCSV9MSVNUX0hFQUQoaXJxY2hpcF9saXN0KTsKPiA+Cj4gPiAtc3Rh
dGljIGludCBkZWZhdWx0X2lycWZuKHZvaWQpCj4gPiAraW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Mo
dm9pZCkKPiA+ICAgewo+ID4gLSAgICAgcmV0dXJuIFNCSV9FTk9ERVY7Cj4gPiAtfQo+ID4gKyAg
ICAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcDsKPiA+ICsgICAgIGludCByYyA9IFNC
SV9FTk9ERVY7Cj4gPgo+ID4gLXN0YXRpYyBpbnQgKCpleHRfaXJxZm4pKHZvaWQpID0gZGVmYXVs
dF9pcnFmbjsKPiA+ICsgICAgIHNiaV9saXN0X2Zvcl9lYWNoX2VudHJ5KGNoaXAsICZpcnFjaGlw
X2xpc3QsIG5vZGUpIHsKPiA+ICsgICAgICAgICAgICAgaWYgKCFjaGlwLT5wcm9jZXNzX2h3aXJx
cykKPiA+ICsgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsgICAgICAgICAgICAg
aWYgKCFzYmlfaGFydG1hc2tfdGVzdF9oYXJ0aW5kZXgoY3VycmVudF9oYXJ0aW5kZXgoKSwgJmNo
aXAtPnRhcmdldF9oYXJ0cykpCj4gPiArICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4g
PiArICAgICAgICAgICAgIHJjID0gY2hpcC0+cHJvY2Vzc19od2lycXMoY2hpcCk7Cj4gPiArICAg
ICAgICAgICAgIGlmIChyYykKPiA+ICsgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsg
ICAgIH0KPiA+Cj4gPiAtaW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Modm9pZCkKPiA+IC17Cj4gPiAt
ICAgICByZXR1cm4gZXh0X2lycWZuKCk7Cj4gPiArICAgICByZXR1cm4gcmM7Cj4gPiAgIH0KPiA+
Cj4gPiAtdm9pZCBzYmlfaXJxY2hpcF9hZGRfZGV2aWNlKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZp
Y2UgKmNoaXApCj4gPiAraW50IHNiaV9pcnFjaGlwX2FkZF9kZXZpY2Uoc3RydWN0IHNiaV9pcnFj
aGlwX2RldmljZSAqY2hpcCkKPiA+ICAgewo+ID4gLSAgICAgc2JpX2xpc3RfYWRkX3RhaWwoJmNo
aXAtPm5vZGUsICZpcnFjaGlwX2xpc3QpOwo+ID4gKyAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2Rl
dmljZSAqYzsKPiA+ICsgICAgIHN0cnVjdCBzYmlfaGFydG1hc2sgaG07Cj4gPiArCj4gPiArICAg
ICBpZiAoIWNoaXAgfHwgIXNiaV9oYXJ0bWFza193ZWlnaHQoJmNoaXAtPnRhcmdldF9oYXJ0cykp
Cj4gPiArICAgICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4gKwo+ID4gKyAgICAgaWYg
KGNoaXAtPnByb2Nlc3NfaHdpcnFzKSB7Cj4gPiArICAgICAgICAgICAgIHNiaV9saXN0X2Zvcl9l
YWNoX2VudHJ5KGMsICZpcnFjaGlwX2xpc3QsIG5vZGUpIHsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICBpZiAoIWMtPnByb2Nlc3NfaHdpcnFzKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgY29udGludWU7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgc2JpX2hhcnRtYXNrX2Fu
ZCgmaG0sICZjLT50YXJnZXRfaGFydHMsICZjaGlwLT50YXJnZXRfaGFydHMpOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGlmIChzYmlfaGFydG1hc2tfd2VpZ2h0KCZobSkpCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPgo+IEkgdGVzdGVkIHRo
aXMgYnkgcmVnaXN0ZXJpbmcgYSAncHJvY2Vzc19od2lycXMnIGhvb2ssIGJ1dAo+ICdzYmlfaGFy
dG1hc2tfd2VpZ2h0JyByZXR1cm5zIGVycm9ycy4KClRoaXMgbG9vcCBlbnN1cmVzIHRoYXQgaXJx
Y2hpcHMgd2hpY2ggZGlyZWN0bHkgY29ubmVjdAp0byBleHRlcm5hbCBpbnRlcnJ1cHQgbGluZSBv
ZiBoYXJ0cyAoYWthIGlycWNoaXBzIHdoaWNoCmltcGxlbWVudCBwcm9jZXNzX2h3aXJxcykgZG9u
J3QgaGF2ZSBvdmVybGFwcGluZwp0YXJnZXRfaGFydHMuCgpSZWdhcmRzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
