Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039AAE6BF1B
	for <opensbi@archiver.kernel.org>; Fri, 30 Jan 2026 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WprAchqvr8QLXUdgmugU7+kh+VHjnfsU9h4kwhHiV/M=; b=HUKUQtrzyun6C1
	+vV8k+5rM9cki/bONf0/NoMCwmadspaNF0JCW9iJ5hI9A/mEqByv+f5VuJgNMZKzo7T/w4Q/WHtGN
	ifot0abHMWPi8v9y99pI8F6kZGcvapNNmbOyLq6iimB+u2/cVU1BhXkDBReFrcu81/hVsHTa4yZvr
	UcgxpUjVKW4Mvpvqno/W/9uOvz0ubr0IvLqNvmdZ90vUn/+zbewRicjvYfSPEvfoRr8ERxEF2EzXJ
	JMrgY94ox76O/GzT1em9Z+f1gjEF+J2BJI8cI7nRFuDWWCCnQBYDwk79p1Y01d7ALUA0Ttfs+3zHp
	mXNNfh8xj1HGWrj/YZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpzd-00000001c4H-45jr;
	Fri, 30 Jan 2026 15:01:05 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpzb-00000001c3w-3fCm
	for opensbi@lists.infradead.org;
	Fri, 30 Jan 2026 15:01:05 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-56638fca064so711459e0c.3
        for <opensbi@lists.infradead.org>; Fri, 30 Jan 2026 07:01:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769785261; cv=none;
        d=google.com; s=arc-20240605;
        b=k19azGmdAAtUcgcw7iD6HKSM3tVbZYM1lNXO64srLrkF5fJzA+j2FbKiCrgZM+4Q6+
         Z9D4QNZSHlE5gZvj/lskYiMOPRMs6Ov4WldOH/AhQTDDOaCA5J6CGTf+NF9msWrC9dYt
         SqEccr7diMoV0lyE3+oO1bXT52a+NvwpVX5l+KkmkwVhuRysJ02GnL8S+hPC+yuEbeSL
         EFlgNjzqrwRWjOXc1BYAM/eo/OXpLzPzhuebPy3ls0aETDEA/okgLt6ZZvad6Qg8qD9Z
         2a0Y+MODQvvAQGcTpfHBXievp0CKiBwT68AHxGNEvDA5xTzf7Ks9I66qskQ2vqop5809
         fWEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fzR850OtyvhDK/w7hiShnIOqAT0htNmFUxlnznLQTqo=;
        fh=CeyCQp+XPGqs+/QFfJPRWct+orJ+/ruIFXLmnlb/73E=;
        b=XVrotcCd70VWpNn89T/x6zOjpUoSj6Js/2RVxCTMNq/A6X5WeFoVgHiRmwY31MIXFg
         QxyMyqedY87tWAcF21/GjV6zsnV6om5GxzP/vswurCAqNaKUwUKy3pnqFMqMi8gWGBd9
         IurEYepVGZ+/49Rx879gyGu8py1I/5MW5FKY6tZ+ljq5f+0+2D1IQRme92ehCNeYJZg5
         uI0YCLVj9tuXkNar2RcVuq/jGDv1mhXxvqw1mQ8K0zFjq9IMFD5+jVgk+ldes4q9qxv8
         dy30D6eBux0JJeaGk35qzp5IYOXyGEt7ypXILlJwidKpjK/uHP2AE94iW5cgv/neW3Tn
         jp5Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769785261; x=1770390061; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fzR850OtyvhDK/w7hiShnIOqAT0htNmFUxlnznLQTqo=;
        b=IYYIQg2puEvRgLlNUASoAsBKBN5ZV3zSDkzarkCOC2EGJYN7PiEVBMZ2e/SuQuqIPN
         3HxdlcfuzaCgRUUK81GiA3kQrv/hMN4lCbC7NzHw/SWgrr4TWTSX4678ItvnozT/yzs1
         AWwm/SN9rMD/uLHrIS9zZwK6Xdtwk8+RYixFyH/2vdXC5h5ovtHdrr2fdWhXk3j+8v0D
         7i+Asjy8vDtZIQuEHB00KA6VSbzPBP+wqVIMQpsTRKDMYks7TQsrTv0LXj2Up/5bYNCX
         J0cND7fw3Ad8dzPaXewzHJYhqRth79hFnaQTISOMX2xBP9Pt0O3DPKYnZN4R4uOM2X4q
         L1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769785261; x=1770390061;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fzR850OtyvhDK/w7hiShnIOqAT0htNmFUxlnznLQTqo=;
        b=S6wKHCT5xEiJav+uk9jufVh7ey5/QXs9+7f15kJunbVBfW5+dwDEFmG9x4Uub9oC7t
         m659pFCblwPChTpo0visvcP89S1hiLYfCM6ZxB9E3wXKRaUHqNB8HOtQBJGKlu2rpAZc
         w7DMuDvJkm2qj7N8jdscRMRGo9AXcB9bSwHmiGxiplm0vkJnuejFo/gxA4cc3g3dOL5a
         2I2eqzitDaAfz4LZIshhHX8ZxSE8As9BAYIH0dQfepZfciDrTGWGDdt0T5DhlEhjLsWO
         MYmcW5Vp/xj+qkW5ULpJzWeJuT7x7WBd00DcdUS5THFW6eivxaWYWudxcmVNE3o/yNly
         /H4g==
X-Gm-Message-State: AOJu0YwpNuuIEYy6X5DJnuukfIsGMSS2GabSZ8uA2dDKQae1irSvFi9H
	acXPnEFAwsVEzqDN5ofGpCXIDtsv3BNnWM2aR6ifwrmiS7CGGVXjyrqKoFFOM1VMNduGu9nISdy
	Pl2MOJqUA9O6A35s+2InnMUyd/PGJfZA=
X-Gm-Gg: AZuq6aJdIx9zJt6DPjoEb+wU6SrAu0Vf7nHU5P3jLaL+xnS5deYgWQLYA6dV5dZ3ogo
	cIxPjE2mrhsxfKqsAxr8vfaERswREE5BphTpa6u9wsjgGt0wWJb1DRcnbksDP475QkSUvWh9nMX
	i6X15Yt/H9aFvfyaqYHRvTK3jKjVkUIcFbfF8RI7lhV7ssYI1FDcW7uQwJ2/hxZU6ja5LlFx1Ay
	OWHkopwtPJWYjrkaElaqoEBubqtmeX7n5uQgmDVwkbjnGyQW/5IKifPK5rNUKsG+prjEu+9
X-Received: by 2002:a05:6122:5002:b0:566:23dd:19b9 with SMTP id
 71dfb90a1353d-566a0052671mr823965e0c.3.1769785259465; Fri, 30 Jan 2026
 07:00:59 -0800 (PST)
MIME-Version: 1.0
References: <20260127152342.1231995-1-raymondmaoca@gmail.com>
 <20260127152342.1231995-2-raymondmaoca@gmail.com> <CAAhSdy1=rc9fsXDfJ55pev4RVT1c3QsPJfCFiF7dOVGXnQtiuw@mail.gmail.com>
In-Reply-To: <CAAhSdy1=rc9fsXDfJ55pev4RVT1c3QsPJfCFiF7dOVGXnQtiuw@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Fri, 30 Jan 2026 10:00:47 -0500
X-Gm-Features: AZwV_QhD8WAfq2RuKj_c-i4Z27G1gKxgYlsoXD4Uq9EPBZkk-WcEJxL_3tjdT2A
Message-ID: <CAMDkj5yhnufDQnowgvq5SzDELZBv0E3BCA6+k_y_Gq2zRMctCg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] lib: sbi: introduce INTC abstraction for wired interrupts
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org, scott@riscstar.com, dave.patel@riscstar.com, 
	raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, anup.patel@qti.qualcomm.com, 
	anuppate@qti.qualcomm.com, dhaval@rivosinc.com, peter.lin@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_070103_967770_B7F2E300 
X-CRM114-Status: GOOD (  32.98  )
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

SGkgQW51cCwKCk9uIEZyaSwgSmFuIDMwLCAyMDI2IGF0IDI6NDjigK9BTSBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0IDg6
NTTigK9QTSBSYXltb25kIE1hbyA8cmF5bW9uZG1hb2NhQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gRnJvbTogUmF5bW9uZCBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4KPiA+Cj4gPiBB
ZGQgYSB3aXJlZCBpbnRlcnJ1cHQtY29udHJvbGxlciAoSU5UQykgYWJzdHJhY3Rpb24gdG8gT3Bl
blNCSS4KPiA+IFRoaXMgaW50cm9kdWNlcyBhIHNtYWxsIHByb3ZpZGVyIGludGVyZmFjZSBiYXNl
ZCBvbgo+ID4gY2xhaW0vY29tcGxldGUvbWFzay91bm1hayBzZW1hbnRpY3MsIGFsbG93aW5nIHRv
IHJlZ2lzdGVyIGEgd2lyZWQKPiA+IGludGVycnVwdCBjb250cm9sbGVyIGFzIGEgcHJvdmlkZXIu
Cj4gPiBQbHVzLCBhZGQgdmlydHVhbCBJUlEgbnVtYmVyIG1hcHBpbmcgdG8gYXZvaWQgZXhwb3N1
cmUgb2YgaHdpcnEuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogUmF5bW9uZCBNYW8gPHJheW1vbmQu
bWFvQHJpc2NzdGFyLmNvbT4KPiA+IC0tLQo+ID4gIHNiaV9pbnRjLmggfCA5OSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOTkgaW5zZXJ0aW9ucygrKQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBzYmlfaW50
Yy5oCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3NiaV9pbnRjLmggYi9zYmlfaW50Yy5oCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAuLmY1MTk3NGM5Cj4gPiAtLS0gL2Rl
di9udWxsCj4gPiArKysgYi9zYmlfaW50Yy5oCj4gPiBAQCAtMCwwICsxLDk5IEBACj4gPiArLyoK
PiA+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTItQ2xhdXNlCj4gPiArICoKPiA+
ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgUklTQ3N0YXIgU29sdXRpb25zIENvcnBvcmF0aW9uLgo+
ID4gKyAqCj4gPiArICogQXV0aG9yOiBSYXltb25kIE1hbyA8cmF5bW9uZC5tYW9AcmlzY3N0YXIu
Y29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpZm5kZWYgX19TQklfSU5UQ19IX18KPiA+ICsjZGVm
aW5lIF9fU0JJX0lOVENfSF9fCj4gPiArCj4gPiArI2luY2x1ZGUgPHNiaS9zYmlfdHlwZXMuaD4K
PiA+ICsKPiA+ICsvKiBIYW5kbGVyIGZvciBhIHNwZWNpZmllZCBJUlEgbnVtYmVyICovCj4gPiAr
dHlwZWRlZiBpbnQgKCpzYmlfaW50Y19pcnFfaGFuZGxlcl90KSh1MzIgaXJxLCB2b2lkICpwcml2
KTsKPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFByb3ZpZGVyIGNhcGFiaWxpdGllcywgYXQgdGhlIG1v
bWVudCBpdCBjb250YWlucyB0aGUgbWF4aW11bSB2YWxpZCBzb3VyY2UgSUQKPiA+ICsgKiBidXQg
ZXh0ZW5zaWJsZSBpbiB0aGUgZnV0dXJlCj4gPiArICovCj4gPiArc3RydWN0IHNiaV9pbnRjX3By
b3ZpZGVyX2NhcHMgewo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBNYXhpbXVtIHN1cHBv
cnRlZCB3aXJlZCBzb3VyY2UgSUQgZm9yIHRoaXMgcHJvdmlkZXIuCj4gPiArICAgICAgICAqCj4g
PiArICAgICAgICAqIEZvciBBUExJQyB0aGlzIGNvcnJlc3BvbmRzIHRvIHRoZSBoaWdoZXN0IHZh
bGlkIHNvdXJjZSBJRCAoMS4uTikuCj4gPiArICAgICAgICAqIFRoZSBJTlRDIGNvcmUgdHJlYXRz
IHRoaXMgYXMgYW4gYWJzdHJhY3QgcHJvdmlkZXIgc291cmNlIElEIHNwYWNlLgo+ID4gKyAgICAg
ICAgKi8KPiA+ICsgICAgICAgdTMyIG1heF9zcmM7Cj4gPiArfTsKPiA+ICsKPiA+ICsvKiBQcm92
aWRlciBvcGVyYXRpb25zICovCj4gPiArc3RydWN0IHNiaV9pbnRjX3Byb3ZpZGVyX29wcyB7Cj4g
PiArICAgICAgIC8qCj4gPiArICAgICAgICAqIFF1ZXJ5IHByb3ZpZGVyIGNhcGFiaWxpdGllcy4K
PiA+ICsgICAgICAgICoKPiA+ICsgICAgICAgICogVGhpcyBhdm9pZHMgZXhwb3NpbmcgcHJvdmlk
ZXItc3BlY2lmaWMgbGltaXRzIChzdWNoIGFzIEFQTElDCj4gPiArICAgICAgICAqIG51bV9zb3Vy
Y2UpIHRocm91Z2ggdGhlIHJlZ2lzdHJhdGlvbiBBUEkuCj4gPiArICAgICAgICAqLwo+ID4gKyAg
ICAgICBpbnQgKCpnZXRfY2Fwcykodm9pZCAqY3R4LCBzdHJ1Y3Qgc2JpX2ludGNfcHJvdmlkZXJf
Y2FwcyAqY2Fwcyk7Cj4KPiBUaGlzIGNhbGxiYWNrIGlzIG5vdCBuZWVkZWQgaW5zdGVhZCB5b3Ug
ZHJpdmVyIGNhbiBwYXNzIG1heF9zcmMKPiBhcyBwYXJhbWV0ZXIgdG8gc2JpX2ludGNfcmVnaXN0
ZXJfcHJvdmlkZXIoKQo+CgpJIHRoaW5rIGl0IHdpbGwgYmUgbW9yZSBleHRlbnNpYmxlIGZvciB0
aGUgZnV0dXJlIHRvIGhhdmUgZ2V0X2NhcHMsCnRob3VnaCBjdXJyZW50bHkgaXQgaG9sZHMgb25s
eSB0aGUgbWF4IHNvdXJjZS4KCj4gPiArCj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAqIENs
YWltIGEgcGVuZGluZyB3aXJlZCBpbnRlcnJ1cHQgb24gY3VycmVudCBoYXJ0Lgo+ID4gKyAgICAg
ICAgKiBSZXR1cm5zOgo+ID4gKyAgICAgICAgKiAgIFNCSV9PSyAgICAgIDogKmh3aXJxIGlzIHZh
bGlkCj4gPiArICAgICAgICAqICAgU0JJX0VOT0VOVCAgOiBubyBwZW5kaW5nIHdpcmVkIGludGVy
cnVwdAo+ID4gKyAgICAgICAgKiAgIDwwICAgICAgICAgIDogZXJyb3IKPiA+ICsgICAgICAgICov
Cj4gPiArICAgICAgIGludCAoKmNsYWltKSh2b2lkICpjdHgsIHUzMiAqaXJxKTsKPiA+ICsKPiA+
ICsgICAgICAgLyoKPiA+ICsgICAgICAgICogQ29tcGxldGUvYWNrbm93bGVkZ2UgYSBwcmV2aW91
c2x5IGNsYWltZWQgd2lyZWQgaW50ZXJydXB0Cj4gPiArICAgICAgICAqIChpZiByZXF1aXJlZCBi
eSBIVykuCj4gPiArICAgICAgICAqIFNvbWUgSFcgbWF5IG5vdCByZXF1aXJlIGFuIGV4cGxpY2l0
IGNvbXBsZXRpb24uCj4gPiArICAgICAgICAqLwo+ID4gKyAgICAgICB2b2lkICgqY29tcGxldGUp
KHZvaWQgKmN0eCwgdTMyIGlycSk7Cj4KPiBBbGwgcHJvdmlkZXIgY2FsbGJhY2tzIHNob3VsZCB0
YWtlIGh3aXJxIGFzIGEgcGFyYW1ldGVyLgoKQWNjb3JkaW5nIHRvIG91ciBsYXN0IHN5bmMtdXAs
IHlvdSB3b3VsZCBsaWtlIGEgdmlydHVhbCBJUlEgbnVtYmVyCm1hcHBpbmcsIHNvIGRvIHlvdSBw
cmVmZXIgbW92aW5nIHRoZSBod2lycSBtYXBwaW5nIGZyb20gSU5UQyB0byBWSVJRPwoKPgo+ID4g
Kwo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBtYXNrL3VubWFzayBhIHdpcmVkIGludGVy
cnVwdCBsaW5lLgo+ID4gKyAgICAgICAgKgo+ID4gKyAgICAgICAgKiBUaGVzZSBhcmUgcmVxdWly
ZWQgZm9yIHJlbGlhYmxlIGNvdXJpZXJpbmcgb2YgbGV2ZWwtdHJpZ2dlcmVkIGRldmljZQo+ID4g
KyAgICAgICAgKiBpbnRlcnJ1cHRzIHRvIFMtbW9kZTogbWFzayBpbiBNLW1vZGUgYmVmb3JlIGVu
cXVldWVpbmcsIGFuZCB1bm1hc2sKPiA+ICsgICAgICAgICogYWZ0ZXIgUy1tb2RlIGhhcyBjbGVh
cmVkIHRoZSBkZXZpY2UgaW50ZXJydXB0IHNvdXJjZS4KPiA+ICsgICAgICAgICovCj4gPiArICAg
ICAgIHZvaWQgKCptYXNrKSh2b2lkICpjdHgsIHUzMiBpcnEpOwo+ID4gKyAgICAgICB2b2lkICgq
dW5tYXNrKSh2b2lkICpjdHgsIHUzMiBpcnEpOwo+Cj4gU2FtZSBhcyBhYm92ZS4KPgo+ID4gK307
Cj4gPiArCj4gPiArLyogUmVnaXN0ZXIgdGhlIGFjdGl2ZSB3aXJlZCBpbnRlcnJ1cHQgcHJvdmlk
ZXIsIGUuZy4gQVBMSUMsIHZpYSBvcHMgYW5kIGN0eCAqLwo+ID4gK2ludCBzYmlfaW50Y19yZWdp
c3Rlcl9wcm92aWRlcihjb25zdCBzdHJ1Y3Qgc2JpX2ludGNfcHJvdmlkZXJfb3BzICpvcHMsCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdm9pZCAqY3R4KTsKPiA+ICsKPiA+ICsv
Kgo+ID4gKyAqIE9wdGlvbmFsOiBtYXAgYSBJUlEgbnVtYmVyIChpcnEpIHRvIGEgaGFyZHdhcmUg
d2lyZWQgSVJRIChod2lycSkuCj4gPiArICoKPiA+ICsgKiBJZiBubyBleHBsaWNpdCBtYXBwaW5n
IGV4aXN0cywgJ2lycT09aHdpcnEnIGlzIGFzc3VtZWQuCj4gPiArICoKPiA+ICsgKiBUaGlzIGFs
bG93cyB1cHBlciBsYXllcnMgKGUuZy4gVklSUSBjb3VyaWVyL2VtdWxhdGlvbikgdG8gdXNlIHN0
YWJsZSBpcnEKPiA+ICsgKiBpZGVudGlmaWVycyB3aXRob3V0IGV4cG9zaW5nIHRoZSB3aXJlZCBj
b250cm9sbGVyJ3MgaHdpcnEgbnVtYmVyaW5nLgo+ID4gKyAqLwo+ID4gK2ludCBzYmlfaW50Y19t
YXBfaXJxKHUzMiBpcnEsIHUzMiBod2lycSk7Cj4gPiAraW50IHNiaV9pbnRjX3VubWFwX2lycSh1
MzIgaXJxKTsKPgo+IFRoZSB2aXJxIGNvdXJpZXIvZW11bGF0aW9uIHdpbGwgYmUgYW4gaW5kZXBl
bmRlbnQgbW9kdWxlCj4gc28gZHJvcCB0aGVzZSBmdW5jdGlvbnMuCj4KPiBBbHNvLCB0aGUgZHJp
dmVyIHNob3VsZCBoYXZlIG5vIGNvbnRyb2wgb24gaG93IGlycSBpcyBtYXBwZWQKPiB0byBod2ly
cS4gVGhlIElOVEMgZnJhbWV3b3JrIHdpbGwgaW50ZXJuYWxseSBtYW5hZ2UgaXJxIHRvCj4gaHdp
cnEgbWFwcGluZyBmb3IgYSBwYXJ0aWN1bGFyIHByb3ZpZGVyLgo+Cj4gPiArdTMyIHNiaV9pbnRj
X2lycV90b19od2lycSh1MzIgaXJxKTsKPiA+ICt1MzIgc2JpX2ludGNfaHdpcnFfdG9faXJxKHUz
MiBod2lycSk7Cj4gPiArCj4gPiArLyogU2V0L2NsZWFyIGhhbmRsZXIgZm9yIGEgc3BlY2lmaWVk
IElSUSBudW1iZXIgKi8KPiA+ICtpbnQgc2JpX2ludGNfc2V0X2hhbmRsZXIodTMyIGlycSwgc2Jp
X2ludGNfaXJxX2hhbmRsZXJfdCBoYW5kbGVyLCB2b2lkICpwcml2KTsKPiA+ICtpbnQgc2JpX2lu
dGNfY2xlYXJfaGFuZGxlcih1MzIgaXJxKTsKPiA+ICsKPiA+ICsvKgo+ID4gKyAqIFBsYXRmb3Jt
IGluZGVwZW5kZW50IG1hc2svdW5tYWsgd3JhcHBlcnMgb24gdG9wIG9mIHBsYXRmb3JtIHJlZ2lz
dGVyZWQKPiA+ICsgKiBtYXNrL3VubWFzayBvcHMgZnVuY3Rpb25zLgo+ID4gKyAqLwo+ID4gK3Zv
aWQgc2JpX2ludGNfbWFza19pcnEodTMyIGlycSk7Cj4gPiArdm9pZCBzYmlfaW50Y191bm1hc2tf
aXJxKHUzMiBpcnEpOwo+ID4gKwo+ID4gKy8qIEV4dGVybmFsIGludGVycnVwdCBoYW5kbGVyIChm
b3IgaXJxY2hpcCBkZXZpY2UgaG9vayAnaXJxY2hpcC5pcnFfaGFuZGxlJykgKi8KPiA+ICtpbnQg
c2JpX2ludGNfaGFuZGxlX2V4dGVybmFsX2lycSh2b2lkKTsKPiA+ICsKPiA+ICsjZW5kaWYKPgo+
IEFsc28sIGludHJvZHVjaW5nIGEgbmV3IHNldCBvZiBzYmlfaW50Yy5jIGFuZCBzYmlfaW50Yy5o
IGlzCj4gbm90IGdvaW5nIHRvIGZseS4KPgo+IFdlIGhhZCBhbHJlYWR5IGNyZWF0ZWQgc2JpX2ly
cWNoaXAuYyBhbmQgc2JpX2lycWNoaXAuaCB0bwo+IG1hbmFnZSBleHRlcm5hbCBpbnRlcnJ1cHRz
IHNvIHRoZSBnb2FsIHNob3VsZCBiZSB0byBlbmhhbmNlCj4gdGhlc2UgZnJhbWV3b3Jrcy4KPgoK
QWxsIHJpZ2h0LCBJIGNhbiBtb3ZlIHRoZSBpbXBsZW1lbnRhdGlvbiBmcm9tIElOVEMgdG8gc2Jp
X2lycWNoaXAuCgpSZWdhcmRzLApSYXltb25kCgo+IFJlZ2FyZHMsCj4gQW51cAoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
