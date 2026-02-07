Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DB0EE0AE7
	for <opensbi@archiver.kernel.org>; Sat,  7 Feb 2026 16:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cseQO50ZznzdQPu8ei4KuDOno6WsdjUgP9HViAfoHq4=; b=FIx4zBcYHS7MCK
	eZFFLI5GzW7PYEQe5TzPzAD/M5iWGugM3uJbHR2tTiPjh0vBZxPfbCeaTHBo3cUmlvDOWpDDNBrPF
	z+GDSKnlaV46T4AKSmulmIJ5OVCudgJxudHjnub6QNav557cdfgZAkgPWFbPO8FAHj4j5hGzcqfLC
	LbiIYdDCkzC0bPvc+ZcAk4qNz87n7C8BB+TPZrE1wn9gw1SezSoQXCyngk/4oi0GKxFnIoV4WjbRK
	PCZOJnW5jPofwy9h9oW9R6p40FqLbUKHWsr6vgacCnjXQJ3/ZQUdJmzmLLHQGNGL+QwT8h2cFimCh
	RGHFebb+vOlop7wC066A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vokuU-0000000Cba6-22iO;
	Sat, 07 Feb 2026 16:11:50 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vokuR-0000000CbZl-2QXu
	for opensbi@lists.infradead.org;
	Sat, 07 Feb 2026 16:11:49 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-948bfb6b6bcso852375241.2
        for <opensbi@lists.infradead.org>; Sat, 07 Feb 2026 08:11:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770480706; cv=none;
        d=google.com; s=arc-20240605;
        b=dlbLz2XM35JpPlMYKtXx4NwwZ5e3I/2K0P7JxKSP4KOFdghZ/5cYFvqGbxy3bQd5cQ
         hwdE7FVF951pqm1sM3kgN796WRB1fX+YEDsK+aBYy/LX9LFIVgRIqMFEqINMNZsBAzbj
         6vuGCq3AF07KK9Bb38oeJxqILlBTG10SK/m0cmc7FbTF+DMea/Gga8WaU1bwldov/DzF
         emUij6hCVhhJ+c+P8pRjJr1g/i/St9R3mKsaOfCZslil8WXMtsBnc5Sw3tdn3tzqigcO
         Fgahix+71wqEOIREs0Yo8pereayEXTxYj/5Qu37oH53N/kQAI42SEv3Aeci4pIBpmUSJ
         Znqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4sNm8qzI3cM7+ngI7rNseHIONOUqp5mmAYZ9mf654ac=;
        fh=CeyCQp+XPGqs+/QFfJPRWct+orJ+/ruIFXLmnlb/73E=;
        b=eE12RmO9e6H3UgEFeyoYUAzvrzWBIAPGrElYNLmWNS7di8p6d7UnUYDyZTqxsjD22f
         FiqckAXMrEdBN6I03Lb/hWIPuYIn8leJSP3odg/4wzI0tQmDN1wCJEOjonV/diH70b99
         q0y5XO5oQt00UrseMCGksOM1SjPHLI041j6Su9ICMXQw1i5TqdCsUVVYS4jK0K1yedhv
         MJONXTVJxRXkn6yPhzyxc3GlwIppBGQ1ZzdXnohsCDgHzd8Xkb68XAIUuJF8iGpwCCDR
         ILrpi2Q1Z49maozT/toeJ49IQ64719JW3dqcSfnVGRQY+8VMNo3qcC+U16NqKukl4Gai
         vUZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770480706; x=1771085506; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4sNm8qzI3cM7+ngI7rNseHIONOUqp5mmAYZ9mf654ac=;
        b=nqDwjUikaia0Hn8l/leJaIQdSppFwGO3PlJD7wAC56eAOsbIXUAHwWBZBSUvWusIur
         FJp4OtRHsZDdb5K0T8pecIw2d7jmikkrsZZuJ3UjBKa9fiRZm0CYmW1RNchpNqpeja3O
         AmtXcxPA1xhAwCV+TC4OwQsA3SfSIYaZlAVGdR7ZHDTwYWhvwK43z835ITYkVrNN15ut
         UirZm2+OjajIlywYZuQqkpS1teOyDNWtfC1UCMNb1b4U8IzPVgvMTStPLT+Xym8+jq/b
         Aw6woghKIo5lEnLqZRT7/iYYXxpfpDnIqNz/G591crgMG+KR9D1fiCcsDjn0KpqRAN8q
         keUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770480706; x=1771085506;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4sNm8qzI3cM7+ngI7rNseHIONOUqp5mmAYZ9mf654ac=;
        b=Eb1qVK8/ylpJgElFTzm8ZSKgLfshJzZt3mvMG7qrCaEGEoI8gXxFKONtSWCuQlzeTd
         2AhW5f7VYzU7QGpMet/2UodsVmoqJlwMeE/3fKJR4Pd3W++nZnO1Y3DAATMj7Fy6BWWk
         HrlrWijtHiHCRJy6guaOWNAwYUxn3Gi2sQtpy3SM4aKdy5BLNEn4aepvrNiSNVa2P5VI
         48xyeGlBEcmiz9GxfXke3d5xq+A/yvkRYF+s4eal2qrIZijVa47LKfF1BCJ/uymamii4
         v7PONx3HJbewaG870WdvObwIjVfnHIfNmQz2t2SlnjXIxlXK9PII1SnmuoSFBArFOCxf
         HKEA==
X-Gm-Message-State: AOJu0YwpLiY9uiLnwncn93ZHUgexoQrrCz/4R18zGUhGzZ5uvgDeQzG3
	cQTmbJ4hQBeeYZ5R1SZDcGqXkHsNt6NOnMwzf5Y0tz6mY2DqYa/M4h7b+AxmHjAO5j35Q7HeGia
	W7Cz+TSrxqGcNhuvur3be2DNBZWIL2Mw=
X-Gm-Gg: AZuq6aLsxoOLN6CR3wyA9HvuoqB1SJtQZWQ6NiphAJpm2VoV9lkNGDtgfmaN4oOgSc8
	dFQGUjKj1QmevMqVFaKT2ZbpzUs0UVC9VGeJkeM5iZpBEAacxcgh8kdFDPT+rCAuP2QYdKjN4ix
	porrFihsNyO6jyeHCeDrU9H6ZzXIu2xGUBceLQs99I14ph0v8kPRFWTvzCca9h4g2h2MgEdSS6M
	LmNCIb1gBUDiN6tvjlTYuRsZosGElBz9p4Ye6VqS6ySv86j/zBiDl/4+fjTXMjb2PD01orv
X-Received: by 2002:a05:6102:c09:b0:5e8:1d93:921a with SMTP id
 ada2fe7eead31-5fae8a85dcbmr1468110137.15.1770480705547; Sat, 07 Feb 2026
 08:11:45 -0800 (PST)
MIME-Version: 1.0
References: <20260202150207.1331811-1-raymondmaoca@gmail.com> <CAAhSdy1VQp5RtgR+uK6Wv6+RTw0Ja3-Oa-YnR17--0jmerjOcQ@mail.gmail.com>
In-Reply-To: <CAAhSdy1VQp5RtgR+uK6Wv6+RTw0Ja3-Oa-YnR17--0jmerjOcQ@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Sat, 7 Feb 2026 11:11:34 -0500
X-Gm-Features: AZwV_Qj0w2nzydaFBgLxBqZgxYOTq95oKhTNCz8z8akclv5tX6BGNhjuirAM-_o
Message-ID: <CAMDkj5zgcR1Jyspp9qFme7cmS73tcxScY9CpunnPiNUHG9To1g@mail.gmail.com>
Subject: Re: [RFC v2 PATCH 0/2] Introduce irqchip and VIRQ layer prototypes
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_081147_633265_2DE7F2CE 
X-CRM114-Status: GOOD (  24.92  )
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

SGkgQW51cCwKCk9uIFNhdCwgRmViIDcsIDIwMjYgYXQgNTowOOKAr0FNIEFudXAgUGF0ZWwgPGFu
dXBAYnJhaW5mYXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gTW9uLCBGZWIgMiwgMjAyNiBhdCA4OjMy
4oCvUE0gUmF5bW9uZCBNYW8gPHJheW1vbmRtYW9jYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+
IEZyb206IFJheW1vbmQgTWFvIDxyYXltb25kLm1hb0ByaXNjc3Rhci5jb20+Cj4gPgo+ID4gVGhp
cyBSRkMgaW50cm9kdWNlcyBpcnFjaGlwIGFic3RyYWN0aW9uIGFuZCBWSVJRIGxheWVycyBmb3Ig
QVBMSUMKPiA+IHdpcmVkIGludGVycnVwdCBzdXBwb3J0IGluIE9wZW5TQkkuCj4gPgo+ID4gSW4g
dGhlIGN1cnJlbnQgT3BlblNCSSBpbXBsZW1lbnRhdGlvbiwgQVBMSUMgc3VwcG9ydCBwcmltYXJp
bHkgZm9jdXNlcwo+ID4gb24gaW5pdGlhbGl6YXRpb24gYW5kIGRlbGVnYXRpb24sIHdoaWxlIGV4
dGVybmFsIGludGVycnVwdCBoYW5kbGluZwo+ID4gZm9yIHdpcmVkIGludGVycnVwdHMgcmVtYWlu
cyBsYXJnZWx5IHN0dWJiZWQuIEFzIGEgcmVzdWx0Ogo+ID4gLSBUaGVyZSBpcyBubyBnZW5lcmlj
IG1lY2hhbmlzbSBmb3IgT3BlblNCSSBkcml2ZXJzIG9yIHBsYXRmb3JtcyB0bwo+ID4gICByZWdp
c3RlciBoYW5kbGVycyBmb3Igd2lyZWQgaW50ZXJydXB0IGxpbmVzLgo+ID4gLSBJbnRlcnJ1cHQg
ZGlzcGF0Y2ggcmVtYWlucyB0aWdodGx5IGNvdXBsZWQgdG8gc3BlY2lmaWMgaXJxY2hpcAo+ID4g
ICBpbXBsZW1lbnRhdGlvbnMuCj4gPgo+ID4gVGhlIGdvYWwgaXMgdG8gaW50cm9kdWNlIGEgc21h
bGwsIGV4dGVuc2libGUgYWJzdHJhY3Rpb24gZm9yIGlycWNoaXAKPiA+IHRvIGhpZGUgdGhlIEhX
IGRldGFpbHMgYW5kIHByb3ZpZGUgYWJzdHJhY3Qgb3BlcmF0aW9ucyBsaWtlIGludGVycnVwdAo+
ID4gcHJvdmlkZXIgcmVnaXN0cmF0aW9uLCBjbGFpbS9jb21wbGV0ZS9tYXNrL3VubWFzayBvcGVy
YXRpb25zLgo+Cj4gV2UgZG9uJ3QgbmVlZCBjbGFpbSgpIGFuZCBjb21wbGV0ZSgpIGNhbGxiYWNr
cyBpbnN0ZWFkIHNpbmdsZSBlb2koKQo+IGNhbGxiYWNrIGlzIHN1ZmZpY2llbnQgYmVjYXVzZSB0
aGUgQVBMSUMgZHJpdmVyIHdpbGwgaGF2ZSB0byBhbnl3YXkKPiByZWFkIHRoZSBDTEFJTSByZWdp
c3RlciB0byBnZXQgdGhlIGhhcmR3YXJlIGlycSBudW1iZXIuCj4KClRoZSBhYnN0cmFjdGlvbiBp
cyBub3Qgb25seSBmb3IgQVBMSUMgYW5kIGlzIGZsZXhpYmxlIGZvciBvdGhlcgppbnRlcnJ1cHQg
Y29udHJvbGxlcnMsIHRoYXQgaXMgdGhlIHJlYXNvbiB3ZSBoYXZlIGNsYWltL2NvbXBsZXRlIGFz
CmdlbmVyYWwgaW50ZXJmYWNlcy4KCj4gPgo+ID4gVklSUSAoVmlydHVhbCBJUlEpIGxheWVyIGlz
IG9uIHRvcCBvZiBJTlRDLCBwcm92aWRpbmcgSVJRIHN0YXRlCj4gPiBtYW5hZ2VtZW50IHZpYSBw
ZXItKGRvbWFpbixoYXJ0KSBJUlEgcGVuZGluZyBxdWV1ZSwgd2l0aCBjb3VyaWVyCj4gPiBkaXNw
YXRjaGluZyBhbmQgaW50ZXJmYWNlIHRvIGVucXVldWUvcG9wL2NvbXBsZXRlIGFuIElSUSBhbmQg
bWFwIGh3aXJxCj4gPiB0byB2aXJ0dWFsIElSUSBudW1iZXIgdG8gYXZvaWQgZXhwb3N1cmUgb2Yg
aHdpcnEuCj4KPiBUaGlua2luZyBhYm91dCB0aGlzIG1vcmUsIGEgc2VwYXJhdGUgVklSUSBsYXll
ciB3aWxsIGNvbnN1bWUKPiBxdWl0ZSBhIGJpdCBvZiBtZW1vcnkgZm9yIG1hbmFnaW5nIHRoZSB2
aXJ0dWFsIElSUSBzcGFjZS4KPgo+IEluc3RlYWQgb2YgYSBWSVJRIGxheWVyLCBlYWNoIGlycWNo
aXAgaGF2aW5nIGl0cyBvd24gSFdJUlEgc3BhY2UKPiBpcyBtdWNoIG1vcmUgZmxleGlibGUgYW5k
IHNjYWxhYmxlLiBJIHNwZW50IHBhc3QgMiBkYXlzIHRyeWluZyB0bwo+IGNvbWUtdXAgd2l0aCB0
aGlzIGFic3RyYWN0aW9uIHdoaWNoIEkgd2lsbCBwb3N0IGluIGEgZmV3IG1pbnV0ZXMuCj4KPiBJ
IGhvcGUgdGhpcyB3aWxsIHNhdmUgdGltZSBpbiByZXZpZXdzLgo+CgpEbyB5b3UgcGxhbiB0byBo
YXZlIHRoZSBxdWV1ZSBtYW5hZ2VtZW50IGluIGlycWNoaXA/Ck15IG9yaWdpbmFsIGlkZWEgaXMg
dG8ga2VlcCBpcnFjaGlwIGFzIGEgSEFMIGFuZCBhcyBtaW5pbWFsIGFzIGl0CmNvdWxkIGJlLCBh
bmQgcHV0IG90aGVyIGhpZ2hlciBsZXZlbCBsb2dpY3MgKGUuZy4gcGVyLShkb21haW4saGFydCkK
SVJRIHBlbmRpbmcgcXVldWUgbWFuYWdlbWVudCkgYXMgYSBoaWdoZXIgbGF5ZXIgb24gdG9wIG9m
IGlycWNoaXAuCk9uY2UgeW91IHNlbmQgeW91ciBwcm9wb3NhbCBJIGNhbiBjaGVjayBob3cgdG8g
Y29tYmluZSB0aGUgaWRlYXMuCgpSZWdhcmRzLApSYXltb25kCgo+ID4KPiA+IFJheW1vbmQgTWFv
ICgyKToKPiA+ICAgbGliOiBzYmk6IGludHJvZHVjZSBhYnN0cmFjdGlvbiBmb3Igd2lyZWQgaW50
ZXJydXB0IGhhbmRsaW5nCj4gPiAgIGxpYjogc2JpOiBBZGQgVklSUSBpbnRlcnJ1cHQgYWJzdHJh
Y3Rpb24KPiA+Cj4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gLSBNb3ZlIElOVEMgdG8gaXJxY2hpcAo+
ID4gLSBNb3ZlIGh3aXJxIG1hcHBpbmcgdG8gVklSUQo+ID4gLSBSZW1vdmUgZ2V0X2NhcHMgYW5k
IHBhc3MgaW4gbWF4X3NyYyBkdXJpbmcgcHJvdmlkZXIgcmVnaXN0cmF0aW9uCj4gPiAtIEFsbCBp
cnFjaGlwIGludGVyZmFjZSB1c2UgaHdpcnEgYXMgcGFyYW1ldGVyCj4gPgo+ID4gIGluY2x1ZGUv
c2JpL3NiaV9pcnFjaGlwLmggfCA1MiArKysrKysrKysrKysrKysrKysrKysrCj4gPiAgaW5jbHVk
ZS9zYmkvc2JpX3ZpcnEuaCAgICB8IDkwICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMTQyIGluc2VydGlvbnMoKykKPiA+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9zYmkvc2JpX3ZpcnEuaAo+ID4KPiA+IC0tCj4gPiAyLjI1
LjEKPiA+Cj4gPgo+ID4gLS0KPiA+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gPiBvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKPiA+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo+Cj4gUmVnYXJkcywKPiBBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5n
IGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
