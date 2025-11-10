Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8675CCFA13
	for <opensbi@archiver.kernel.org>; Mon, 10 Nov 2025 14:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Re9Td2e+w1tdZsUprqKlXFtRMEFz0GR6ANDBG24q/uU=; b=LVkvaiGyeAnUdA
	boguikTR+inYPLhTIe5KAeRd2g9i5b82UumVpoVL+wtZf3h0NWR0oRtxKymiBrEkqfYHxSx7Guhp5
	DbZFVPAL1zadnwmI+NXbSXbdBtPUzNGbgYTEqY68EgzvEZEjeZAn8B9njMLNAVbAIrzM9xvBA4UOv
	hVxEzF5cV04xqxvurEitwGaoCEnFmzaNyKbDA5wARN4eKZFcgUCED3s8Ony2gYP94zXjdFrHAJy+8
	kCwe8XFemix0AxyEhWNWad7dC30K3geR4mGOmOpMSV+cgMyYpDf05av3r+R1ijPcrnTWiJcO3ptDE
	ZiaNhtnum5Pewg7S/cgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT5N-00000005boD-0XJH;
	Mon, 10 Nov 2025 14:41:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIT5K-00000005bnU-2lAe
	for opensbi@lists.infradead.org;
	Mon, 10 Nov 2025 14:41:35 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-64094a79237so399529a12.1
        for <opensbi@lists.infradead.org>; Mon, 10 Nov 2025 06:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762785693; x=1763390493; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HlU9ckIWZyG7ADyC1MnjvOLxGTQweaX4VKCHkuSewQY=;
        b=hYOdMobcqGBZZFT7uS5V0G8mWzMEtQuYj9j5kxvyv0GwCf8NPWd/RYaTIwIEZWErCw
         tHmOz+E5VG8x41hDLCX68AbewWsg1eykZNaNIe+D1BMdvkJgrFmdsQXeTz/vDrvHPrss
         svfmgvanTZwopdxNxXn+sU6l69M3/VacDrgbgFL4bmmQjxBvNTBI41aazVocIClAbbrX
         UhzFJieDjApnU45PEGQWo+XO6n4ysQ1EHKzaQxeGDKoZ8vI61S2JGcy2nH9WTzRs1yas
         8aj7LQWcZNshqxbYfQWF6J06FWG4WZCDhRl5RFGTdB8bMfFKantBENf2BswkTn4fuzlI
         v37Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762785693; x=1763390493;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HlU9ckIWZyG7ADyC1MnjvOLxGTQweaX4VKCHkuSewQY=;
        b=eYMF1yY/cyMULmF0ofTyIFYZzlwarpaPPBqPN/UrgDO4/wD+r3zAPVYeFP4+48cHfT
         /bNuLJ7W+uFlzhZIXooIctECwJaZd9ARp8XJ5xWps3wSRRSbzwO/HG4cIHamvQc13fxN
         dkGUttVlZ5ml65ZtLhH1m2gDcSlo7BVoZ9STt+TmNTrN3/a4cGgaMJyowP9CiL5llmRq
         RVnx7wNl+sAbznSMF+qsdsmDn+xzYAwdpsgMtfjQccvsKK1Daovl7iJuwA/+Jet0MCqJ
         x6LKLosHq64DTBwgQqCVuI9JY+uwcuqz90R3i+iLPbg4rFZCphvwGrFa6YEaMIxmiBWM
         lGLA==
X-Forwarded-Encrypted: i=1; AJvYcCXQKs74ddg+LW/F5vWHf/x0mHm0zYD8ZjNNnnKqNrxKKHWvu5Ja97gPy8rjtfVUPQj3f/Sv9WUn@lists.infradead.org
X-Gm-Message-State: AOJu0YyuTBCZFz9AfGasgiWzleKR70PI2dsG5KF27Z/nyoyyxgbpb30U
	ORYrLlO282E7P7wYINb3urNuX4psxRwTbD5E9zxglJSTbbhc3X2GqgwtuxMtAue98Ec=
X-Gm-Gg: ASbGncssCzbWMiBMxFtCG1NERm3dY2olwv0SQKsQ+1I4XBlGP86lgNI/1mFcb1I0g8D
	Hv/ZRqXtiaoOc8n7X+eBZjrvBm9Ku8ycIdr2wfhhzZ8lBpcpIJVuOa5K4GXaubVkQxijQxYT2Pf
	VgHx9vIZGROAuqS6R4Y9E2VPRi133oDFR2oqbuMCGSBSJ74IkcupYcQ6TrTTGIRRLePR98Xy4wS
	fpEYwNvz0AcBgTvl0rpZ5Bi34vHhERM8nD321zu/GXExFWzuVTXhPiXHWAwmMP2gppaKJHm/T3b
	ysD6xmw+hXyqeETvm3NWYQOjVxyY/+XRh6C5oO1TNXHj25diEFp2a7HVe8X2FC39pVoQ5vqC8Iu
	VtHsYQw5zoTszXesiI1RJLsdY9k5z8ng4VQVh5Tv4b+mK1QaZifEDhWTYZE1ohnZBBXclk+/8hY
	5fJ7NhgfjABA==
X-Google-Smtp-Source: AGHT+IF3mdSrgEW4cUW8gkwBPPnF6ghqy4C9u34JDLjd97C+wWASLpJTpg6ecHVSimJ0nbGocZ4AqA==
X-Received: by 2002:a05:6402:1462:b0:63c:4031:d864 with SMTP id 4fb4d7f45d1cf-6415ea4d860mr3593425a12.6.1762785692464;
        Mon, 10 Nov 2025 06:41:32 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-6411f862ca8sm11457752a12.28.2025.11.10.06.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:41:32 -0800 (PST)
Mime-Version: 1.0
Date: Mon, 10 Nov 2025 15:41:13 +0100
Message-Id: <DE53DAU3LAAK.2FGKTU66OSUEX@ventanamicro.com>
Subject: Re: [PATCH v3] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <anup@brainfault.org>, <guoren@kernel.org>,
 <opensbi@lists.infradead.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <cp0613@linux.alibaba.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <DE4VJ8FBXUYQ.1L6AZ87OOAMPT@ventanamicro.com>
 <20251110123116.496-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251110123116.496-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_064134_713377_D3044471 
X-CRM114-Status: GOOD (  23.15  )
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

MjAyNS0xMS0xMFQyMDozMToxNSswODowMCwgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT46Cj4g
T24gMjAyNS0xMS0xMCAwODozMiBBTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+PiAoSSBtaXNz
ZWQgdGhhdCB0aGlzIGlzbid0IHRoZSBmaXJzdCB2ZXJzaW9uLCBwbGVhc2UgdHJ5IHRvIG1haW50
YWluIGEKPj4gIGNoYW5nZWxvZyB3aGVuIHBvc3Rpbmcgc3Vic2VxdWVudCBtb2RpZmljYXRpb25z
LikKPgo+IFRoYW5rcyBmb3IgdGhlIHJlbWluZGVyLCBJIHdpbGwga2VlcCBhIGNoYW5nZWxvZyBp
biB0aGUgbmV4dCBwYXRjaC4KCihBcHByZWNpYXRlZC4gIEkgd291bGQgaGF2ZSBzZWFyY2hlZCBt
YWlsYm94IGJlZm9yZSBwb3N0aW5nIGlmIEkgbm90aWNlZAogdGhlIHYzIGluIHRoZSBoZWFkZXIs
IGJ1dCBoYXZpbmcgaXQgc3VtbWFyaXplZCBpcyBldmVuIGJldHRlci4pCgo+PiA+PiA+IGRpZmYg
LS1naXQgYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWlu
X2NvbnRleHQuYwo+PiA+PiA+IEBAIC0xNDMsOCArMTQ1LDExIEBAIHN0YXRpYyBpbnQgc3dpdGNo
X3RvX25leHRfZG9tYWluX2NvbnRleHQoc3RydWN0IGhhcnRfY29udGV4dCAqY3R4LAo+PiA+PiA+
ICAgY3R4LT5zYXRwID0gY3NyX3N3YXAoQ1NSX1NBVFAsIGRvbV9jdHgtPnNhdHApOwo+PiA+PiA+
ICAgaWYgKHNiaV9oYXJ0X3ByaXZfdmVyc2lvbihzY3JhdGNoKSA+PSBTQklfSEFSVF9QUklWX1ZF
Ul8xXzEwKQo+PiA+PiA+ICAgIGN0eC0+c2NvdW50ZXJlbiA9IGNzcl9zd2FwKENTUl9TQ09VTlRF
UkVOLCBkb21fY3R4LT5zY291bnRlcmVuKTsKPj4gPj4gPiAtIGlmIChzYmlfaGFydF9wcml2X3Zl
cnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMikKPj4gPj4gPiArIGlmIChz
YmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMikg
ewo+PiA+PiA+ICAgIGN0eC0+c2VudmNmZyA9IGNzcl9zd2FwKENTUl9TRU5WQ0ZHLCBkb21fY3R4
LT5zZW52Y2ZnKTsKPj4gPj4gPiArICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNo
LCBTQklfSEFSVF9FWFRfU1NRT1NJRCkpCj4+ID4+ID4gKyAgIGN0eC0+c3JtY2ZnID0gY3NyX3N3
YXAoQ1NSX1NSTUNGRywgZG9tX2N0eC0+c3JtY2ZnKTsKPj4gPj4gPiArIH0KPj4gPgo+PiA+PiBX
aHkgd291bGQgd2Ugd2FudCBTc3Fvc2lkIHRvIGRlcGVuZCBvbiBTID49IDEuMTI/Cj4+ID4KPj4g
PiBJJ20gZ3Vlc3NpbmcgeW91IHJlYWQgdGhlIFJJU0MtViBJbnN0cnVjdGlvbiBTZXQgTWFudWFs
LCB3aGljaCBkZXNjcmliZXMgc3Nxb2lkIGFzCj4+ID4gcmVxdWlyaW5nIHByaXYgdmVyc2lvbiAx
LjE0LiBIb3dldmVyLCB0aGUgaGlnaGVzdCBwcml2IHZlcnNpb24gY3VycmVudGx5IHN1cHBvcnRl
ZAo+PiA+IGJ5IE9wZW5TQkkgaXMgMS4xMi4gVGhlcmVmb3JlLCB0aGlzIGltcGxlbWVudGF0aW9u
IGlzIGJhc2VkIG9uIHRoZSBjdXJyZW50IHNpdHVhdGlvbiwKPj4gPiBhbmQgdGhlIHByZXZpb3Vz
IGltcGxlbWVudGF0aW9ucyBzdWNoIGFzIENUUiBhbHNvIGZvbGxvdyB0aGlzIGFwcHJvYWNoLgo+
PiAKPj4gRG9lcyBpdD8gIFRoZXJlIGlzIGV2ZW4gYSBub24tbm9ybWF0aXZlIG5vdGU6Cj4+IAo+
PiAgIFRoZSBTc3Fvc2lkIGV4dGVuc2lvbiBkb2VzIG5vdCByZXF1aXJlIHRoYXQgUy1tb2RlIG1v
ZGUgYmUgaW1wbGVtZW50ZWQuCj4+IAo+PiBJIHRoaW5rIGl0J3MgYmVjYXVzZSBzcm1jZmcgaGFz
IGVmZmVjdCBvbiBNLW1vZGUsIHNvIHRoZSBleHRlbnNpb24gaXMKPj4gY29tcGxldGVseSBpbmRl
cGVuZGVudCB0byBhbGxvdyBpdCBpbiBwdXJlIE0gc3lzdGVtcy4KPj4gCj4+IChXZSBlbmFibGUg
c3JtY2ZnIGluIG1zdGF0ZWVuIHJlZ2FyZGxlc3Mgb2YgUyB2ZXJzaW9uLCBzbyB0aGVyZSBpcyBh
Cj4+ICBwb3RlbnRpYWwgYnVnIHdoZXJlIHdlIHdvdWxkbid0IGNvcnJlY3RseSBjb250ZXh0IHN3
aXRjaCB0aGUgY3NyLCBnaXZlbgo+PiAgYSBzeXN0ZW0gd2l0aCB3ZWlyZCBjb21iaW5hdGlvbiBv
ZiBleHRlbnNpb25zLikKCldlIG1pZ2h0IGhhdmUgdGFrZWQgcGFzdCBlYWNoIG90aGVyIGhlcmUu
CgpJJ20gYXJndWluZyB0aGF0IFJJU0MtViBhbGxvd3MgYSBoYXJ0IHdpdGggSVNBIFMxcDExX1Nz
cW9zaWQgdG8gZXhpc3QsCmJlY2F1c2UgU3Nxb3NpZCBkb2Vzbid0IGRlcGVuZCBvbiBTLCBzbyBv
cGVuc2JpIHNob3VsZCBjb250ZXh0IHN3aXRjaApzcm1jZmcgb24gc3VjaCBwb3RlbnRpYWwgKGFs
YmVpdCB1bmxpa2VseSkgbWFjaGluZS4KCk90aGVyd2lzZSBkb21haW5zIGNvdWxkIG9ic2VydmUg
c3JtY2ZnIHNldCBieSBvdGhlciBkb21haW5zLgoKPiBJIGhhdmUgYSBkaWZmZXJlbnQgb3Bpbmlv
biBvbiB0aGlzIHBvaW50LiBUaGlzIGV4dGVuc2lvbiBpcyBiYXNpY2FsbHkgdW5yZWxhdGVkCj4g
dG8gTS1tb2RlLCBpbnN0ZWFkLCBpdCBydW5zIGluIFMtbW9kZS4gSXQgbWF5IGJlIG5lY2Vzc2Fy
eSB0byBjb25zaWRlciB0aGUgYmFja2dyb3VuZAo+IG9mIHNzcW9zaWQncyBpbnRyb2R1Y3Rpb24u
IFRoaXMgaXMgdG8gZW5zdXJlIHRoYXQgY2VydGFpbiBjcml0aWNhbCBidXNpbmVzcyBwcm9jZXNz
ZXMKPiBjYW4gb2J0YWluIHN1ZmZpY2llbnQgaGFyZHdhcmUgcmVzb3VyY2VzIHRvIHJ1biBhbmQg
dGh1cyBndWFyYW50ZWUgc2VydmljZSBxdWFsaXR5Lgo+Cj4gU2ltaWxhciB0ZWNobm9sb2dpZXMg
aW5jbHVkZSBJbnRlbC1SRFQgYW5kIEFSTSBNUEFNLiBPbiB0aGUgTGludXggc2lkZSwgRHJldyBo
YXMgYWxyZWFkeQo+IHN1Ym1pdHRlZCByZWxldmFudCBwYXRjaGVzIFsxXS4gSXQgY2FuIGJlIHNl
ZW4gdGhhdCBpbiB0aGUgZnV0dXJlLCBpdCB3aWxsIGluZXZpdGFibHkgYmUKPiB1c2VkIGluIGNv
bmp1bmN0aW9uIHdpdGggTGludXggcmVzY3RybCwKClllYWgsIEknbSBwbGFubmluZyB0byBsb29r
IGF0IHRoZSBwYXRjaGVzIGFzIHdlbGwsIGJlY2F1c2UgU3Nxb3NpZCdzCmRlc2lnbiBoYXMgYSBs
b3Qgb2YgcG90ZW50aWFsIGZvciBzaWRlLWNoYW5uZWxzLgoKPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBjb25zaWRlciB0aGUg
ZXhlY3V0aW9uCj4gc2l0dWF0aW9uIGluIE0tbW9kZSwgaXQgaXMgb25seSBuZWNlc3NhcnkgdG8g
ZW5hYmxlIHRoZSByZWxldmFudCBwZXJtaXNzaW9ucy4KClRoZSBleGVjdXRpb24gb2YgTS1tb2Rl
IGlzIGFmZmVjdGVkIGJ5IHNybWNmZywgc28gd2UgaGF2ZSB0byBiZQpleHRyZW1lbHkgY2FyZWZ1
bCBhYm91dCBpc29sYXRpb24gaW4gb3BlbnNiaSB0b28sIGVzcGVjaWFsbHkgd2hlbgpqdWdnbGlu
ZyBtdWx0aXBsZSBkb21haW5zLgoKKEkgdGhpbmsgd2UgbWlnaHQgYmUgZmluZSBub3csIGJ1dCBo
YXZpbmcgb3BlbnNiaSBzd2l0Y2ggdG8gYSBzcm1jZmcKIHRoYXQgaXNuJ3QgY29udHJvbGxlZCBi
eSBTLW1vZGUgd2lsbCByZXN1bHQgaW4gYSBsb3QgbGVzcyBoZWFkYWNoZXMuLi4pCgpUaGFua3Mu
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
