Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B044CD343F
	for <opensbi@archiver.kernel.org>; Fri, 15 May 2026 07:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oLP5uDiNGASYCS61xHfNGKkAiYjd/vAE8SO1k/rEnrs=; b=aj2fUkoQNjpEta
	q3Lq454BjmCiRfjUnwxI1kw1MZbaQNnaISNI1nEN81RD1ZNypJP3RPnPjvKBE4BP1VCTuWfMVXMvR
	EL5GD8WDI+R1z/RaCn8VrzzA6wf2dgFJlU5zjsmkqzdXUun3beesHfRG8Mn3uLj71s6KDhW9vzd31
	RsNlLPbzIHv++lkzilfa6SG9NCq9CPoGTrritvU1i6JkNcjZ8TFlok6vqsJxTOAbrOa6LstXCKjtn
	whWwwNrdD8sWhcCsjPLxUAwDGjPPvn6m+SPLb02q+JrCEVAFXXTviBdkeRDamwO3ciLvnLzhP5SQt
	xz+CzqoLn3pv9vUTO0XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnB3-00000007e01-1wEe;
	Fri, 15 May 2026 07:41:45 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnB0-00000007dzN-3865
	for opensbi@lists.infradead.org;
	Fri, 15 May 2026 07:41:44 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-47c941f6bdcso5808658b6e.3
        for <opensbi@lists.infradead.org>; Fri, 15 May 2026 00:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778830900; cv=none;
        d=google.com; s=arc-20240605;
        b=UiV2fP8cN9dirr/LaNEhA3nbQ+fd82PoRKl/F3o83HiTPP+I16eGUlkTyJdrze3aQY
         mYiRFUlnHcF1/osuW0uiWeiOXCzcM/Y7PRSDrp+my1vVOxQnyUqBCxh6BK5v6PefL1Q5
         tKi4+0lroKlLbJSqyObh5PIKTtgSEEo8kdwXEumzjWw+C6fnRLv4qZ7E3wh0TAggitrK
         bU8H6drDLi+Hbr3gElbO+n9nDe7n0C0I5ilUDab++TWgwtUDoauC1HiQGnFLbiTfzA+f
         O0mlt45upTj5s4ipnp3OoBnyYNQCBWEeLmwK2VnmnYi+09o1sFF8FHNCqrlVxj1W7JQA
         vxzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tPR2H0k0iOMMIclauDbyUt9NqzXrBfqtPggc5IIVOK0=;
        fh=oCIWnkChKJYsczhCshkq6TXf5b8Y/iXrPjDyEk6+tSg=;
        b=VSDRXkMIP87tNNoOmvKJlojKHhyVjJ+SGv9Fqz2aM91AO5F619tXDXXp2ix+dQEqdD
         hErpUkTfKQtRxYpy4Mv0lUcn/+JHuICx9cdFLfyECyo414+TD7votMqK5MKaWvYjPnxJ
         o2iDX41CpkNMuSnVrjs6MKEaTsyPfeFClJ73aoPsfwISOrSpxWf6QnupWZy3aRITAtGk
         /PlOaCDm0/PnSKWYo5I+64z2Sflff7MTfBLzm5iJiCFMk9mRnRSn4M1AEQRWkAHwzCkq
         7YQmoG8ofw6HtE7dQ49YQtkYJpJWUwQxhb3c4nGyTArxAUfQxOaGXtQaJhObDCcvmWww
         Bs7A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1778830900; x=1779435700; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPR2H0k0iOMMIclauDbyUt9NqzXrBfqtPggc5IIVOK0=;
        b=eC7GBjlA7R9ttKdcnAai83QUuSGFE+yGQaajeZJPuhXAOSJuu1OH2JAGB4gFkEiPH0
         RDa0eQCX/02p2iXngziQeqBlVUUqe6+OzbMa8Te4m7pYxcE24E+iI4bdjmZm3eK76IYT
         tL3M5canCC4av4AqxYp1iUQBVXFkiKZR49g+XAgC+xZWMeoZzVzV2LriYw6W6kaMCz1b
         nJNWpvDrwo6B7/UqX+ldASvBH88zSGxlWCumkO45vfHP0Tbr838GdkNbMAwyiUtZQWtt
         9mFfsJn9PKLe+onVS5+0yAUsSVhRomtZhgHZcee7kl4zw7k+KBuFPEbRaED+swFXHE/x
         RHug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778830900; x=1779435700;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tPR2H0k0iOMMIclauDbyUt9NqzXrBfqtPggc5IIVOK0=;
        b=q1sLKS0ZKAwtPBWh4yfjFd56YO+gToMfxWRpZ925+ZQstSAtRMaqYVvueBh5GOF1Hh
         LMZmS8D4tuGzPpYAW5DHsfVKgXBpX+2m9Me0WUuCKdcW0p7AtGnHl5On34rh3xNVJeM4
         58UMpe3h9fXJNA+9hmEpVFZvEsB0vRkRuw8Uqs3I+16RemFu1jlWGhEXgWbzf/Blk9UX
         qVS8ankSOf0+InUEZlohTTRxunvHvvGoyVGEVCaHtmBDOz9ohNmXR3dN9uxwVgcRigiv
         ioeObsVSlxkiHmUhE99P5/PS0tKK3l0OLCrEYJwKQJcSGaaenM3PjyjU0538HV7tfIwv
         I3iA==
X-Forwarded-Encrypted: i=1; AFNElJ/efZwlEQ57kkCXaT8CmKfCibxhDnodsJ+aqeE8hDZAoIh31FM0sePxwmZxOcpjDaQ94D7wWGwQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyN+7kjl/R2YQ3Rn151mFdyzTJJOBHrjRLZqhIB4lqJCVXsVKRe
	1Oz/rFz/35hKZ2y/x+pogMBPq6NUoE0UC0vcaJaOkJoGZjOINlPu1c+OA5CVB743cxqaxJg/En+
	Vw1ZIYWmL7QbXU7cB3a0xcYYlbSGdvdirr2VpFUFUOw==
X-Gm-Gg: Acq92OF2kIEIHMSLWjAIQ0AJzsO173JpZf1pSaZMx7oLr0GNSivXopnIt15KUAD3f8w
	cCKDi8Q/2UsZ1hcE1rlTqGQ2PtkytX2azx20BpE5CK38UNySUVCx4n9NHLoAa5WA0WRs+ICM5eZ
	IkQvpu/lwEmDfGALRlWxwz8++71hlzMNXXLtJ0IEzGP+u1GB7D3uNVNv07PG+4P1cbmKZQpIFsi
	vOT4vaZuoIr0Xirj1CmgYqq04uX28+9pbw6+fkXoA5KBaSng2fOff1WZIfbJSPcFlfUrywXmrFB
	NGAnOklRz2/j+VCjfkU6t2mDrT2ZfA+27I9Et+B4bB2480gxP4JvUVfYcosKxiwYBoeKj704nx6
	SV89HM8UJFtyf1hZ7XzQeSaZNrLU=
X-Received: by 2002:a05:6820:81c7:b0:694:8bfa:7817 with SMTP id
 006d021491bc7-69c9bfc9642mr1752981eaf.53.1778830900563; Fri, 15 May 2026
 00:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20260515054208.151045-1-dave.patel@riscstar.com> <20260515054208.151045-2-dave.patel@riscstar.com>
In-Reply-To: <20260515054208.151045-2-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 15 May 2026 13:11:27 +0530
X-Gm-Features: AVHnY4Jv6UJNyL0_kX97IJI8wTrC-MreohEcnE_eU2eAAir4m0HfH08pIGyp-yI
Message-ID: <CAAhSdy3vOWOYd=nim8kzc6mZFBVBJmu-52Gw-mg8rKsfPF3Z7A@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] lib: sbi: Add RISC-V vector context save/restore support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_004142_800176_697D5045 
X-CRM114-Status: GOOD (  22.19  )
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

T24gRnJpLCBNYXkgMTUsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
b20+IHdyb3RlOgo+Cj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+
Cj4KPiBFYWdlciBjb250ZXh0IHN3aXRjaDogQWRkIHN1cHBvcnQgZm9yIHNhdmluZyBhbmQgcmVz
dG9yaW5nIFJJU0MtViB2ZWN0b3IKPiBleHRlbnNpb24gc3RhdGUgaW4gT3BlblNCSS4gVGhpcyBp
bnRyb2R1Y2VzIGEgcGVyLWhhcnQgdmVjdG9yIGNvbnRleHQKPiBzdHJ1Y3R1cmUgYW5kIGhlbHBl
ciByb3V0aW5lcyB0byBwZXJmb3JtIGZ1bGwgY29udGV4dCBzYXZlIGFuZCByZXN0b3JlLgo+Cj4g
VGhlIHZlY3RvciBjb250ZXh0IGluY2x1ZGVzIHZjc3IgQ1NScyBhbG9uZyB3aXRoIHN0b3JhZ2Ug
Zm9yIGFsbCAzMiB2ZWN0b3IKPiByZWdpc3RlcnMuIFRoZSByZWdpc3RlciBzdGF0ZSBpcyBzYXZl
ZCBhbmQgcmVzdG9yZWQgdXNpbmcgYnl0ZS13aXNlIHZlY3Rvcgo+IGxvYWQvc3RvcmUgaW5zdHJ1
Y3Rpb25zICh2czhyL3ZsOHIpLgo+Cj4gVGhlIGltcGxlbWVudGF0aW9uIGZvbGxvd3MgYW4gZWFn
ZXIgY29udGV4dCBzd2l0Y2hpbmcgbW9kZWwgd2hlcmUgdGhlIGVudGlyZQo+IHZlY3RvciBzdGF0
ZSBpcyBzYXZlZCBhbmQgcmVzdG9yZWQgb24gZXZlcnkgY29udGV4dCBzd2l0Y2guIFRoaXMgcHJv
dmlkZXMgYQo+IHNpbXBsZSBhbmQgZGV0ZXJtaW5pc3RpYyBtZWNoYW5pc20gd2l0aG91dCByZXF1
aXJpbmcgbGF6eSB0cmFwLWJhc2VkCj4gbWFuYWdlbWVudC4KPgo+IFNpZ25lZC1vZmYtYnk6IERh
dmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0YXIuY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9z
YmlfdmVjdG9yLmggfCAgMjggKysrKysrKysrKwo+ICBsaWIvc2JpL29iamVjdHMubWsgICAgICAg
fCAgIDEgKwo+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgfCAxMDkgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfdmVjdG9yLmMKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfdmVjdG9yLmggYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5iYmQ4NTdjMwo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBAQCAtMCwwICsxLDI4IEBACj4g
Ky8qCj4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiAr
ICogQ29weXJpZ2h0IChjKSAyMDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KPiArICoKPiArICogQXV0
aG9yczoKPiArICogICBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPiArICov
Cj4gKwo+ICsjaWZuZGVmIF9fU0JJX1ZFQ1RPUl9IX18KPiArI2RlZmluZSBfX1NCSV9WRUNUT1Jf
SF9fCj4gKwo+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+ICsKPiArc3RydWN0IHNiaV92
ZWN0b3JfY29udGV4dCB7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZjc3I7Cj4gKyAgICAgICB1
bnNpZ25lZCBsb25nIHZzdGFydDsKPiArCj4gKyAgICAgICAvKiBzaXplIGRlcGVuZHMgb24gVkxF
TiAqLwo+ICsgICAgICAgdWludDhfdCB2cmVnc1tdOwo+ICt9Owo+ICsKPiArdm9pZCBzYmlfdmVj
dG9yX3NhdmUoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqZHN0KTsKPiArdm9pZCBzYmlfdmVj
dG9yX3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKTsKPiArdW5z
aWduZWQgbG9uZyB2ZWN0b3JfdmxlbmIodm9pZCk7Cj4gKwo+ICsjZW5kaWYgLy9fX1NCSV9WRUNU
T1JfSF9fCj4gKwo+IGRpZmYgLS1naXQgYS9saWIvc2JpL29iamVjdHMubWsgYi9saWIvc2JpL29i
amVjdHMubWsKPiBpbmRleCA5N2NjNDUyMS4uZGRiMmU3YWMgMTAwNjQ0Cj4gLS0tIGEvbGliL3Ni
aS9vYmplY3RzLm1rCj4gKysrIGIvbGliL3NiaS9vYmplY3RzLm1rCj4gQEAgLTEwOSwzICsxMDks
NCBAQCBsaWJzYmktb2Jqcy15ICs9IHNiaV90cmFwX3ZfbGRzdC5vCj4gIGxpYnNiaS1vYmpzLXkg
Kz0gc2JpX3VucHJpdi5vCj4gIGxpYnNiaS1vYmpzLXkgKz0gc2JpX2V4cGVjdGVkX3RyYXAubwo+
ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9jcHBjLm8KPiArbGlic2JpLW9ianMteSArPSBzYmlfdmVj
dG9yLm8KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfdmVjdG9yLmMgYi9saWIvc2JpL3NiaV92
ZWN0b3IuYwo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLjFkMmFjOTQ0
Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4gQEAgLTAsMCAr
MSwxMDkgQEAKPiArLyoKPiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVz
ZQo+ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgUklTQ3N0YXIgU29sdXRpb25zLgo+ICsg
Kgo+ICsgKiBBdXRob3JzOgo+ICsgKiAgICAgIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxAcmlzY3N0
YXIuY29tPgo+ICsgKi8KPiArCj4gKyNpbmNsdWRlIDxzYmkvc2JpX2RvbWFpbi5oPgo+ICsjaW5j
bHVkZSA8c2JpL3Jpc2N2X2VuY29kaW5nLmg+Cj4gKyNpbmNsdWRlIDxzYmkvcmlzY3ZfYXNtLmg+
Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBl
cy5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9oYXJ0Lmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2Vy
cm9yLmg+Cj4gKyNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiArCj4gKyNpZmRlZiBPUEVO
U0JJX0NDX1NVUFBPUlRfVkVDVE9SCj4gKwo+ICt1bnNpZ25lZCBsb25nIHZlY3Rvcl92bGVuYih2
b2lkKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZsZW5iID0gMDsKPiArCj4gKyAgICAg
ICBhc20gdm9sYXRpbGUgKAo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwdXNoXG5cdCIKPiAr
ICAgICAgICAgICAgICAgIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+ICsgICAgICAgICAgICAgICAi
Y3NyciAlMCwgdmxlbmJcblx0Igo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwb3Bcblx0Igo+
ICsgICAgICAgICAgICAgICA6ICI9ciIodmxlbmIpCj4gKyAgICAgICAgICAgICAgIDoKPiArICAg
ICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4gKwo+ICsgICAgICAgcmV0dXJuIHZsZW5iOwo+ICt9
Cj4gKwo+ICt2b2lkIHNiaV92ZWN0b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpk
c3QpCj4gK3sKPiArICAgICAgIGlmICghZHN0KQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4g
Kwo+ICsgICAgICAgLyogU3RlcCAxOiBTYXZlIENTUnMgKi8KPiArICAgICAgIGRzdC0+dmNzciA9
IGNzcl9yZWFkKHZjc3IpOwo+ICsgICAgICAgZHN0LT52c3RhcnQgPSBjc3JfcmVhZCh2c3RhcnQp
Owo+ICsKPiArICAgICAgIHVsb25nIHZsZW5iID0gdmVjdG9yX3ZsZW5iKCk7Cj4gKyAgICAgICB1
aW50OF90ICpiYXNlID0gZHN0LT52cmVnczsKPiArCj4gKyAgICAgICAvKiBTdGVwIDM6IFNhdmUg
dmVjdG9yIHJlZ2lzdGVycyAqLwo+ICsjZGVmaW5lIFNBVkVfVlJFRyhpKSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAoeyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgIGFzbSB2
b2xhdGlsZSggICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgICAgICAgICAgICAiICAgICAgIC5vcHRpb24gcHVzaFxuXHQiICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBhcmNoLCArdlxuXHQiICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAgICAgICB2czhyLnYgdiIgI2kg
IiwgKCUwKVxuXHQiICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiICAgICAgIC5v
cHRpb24gcG9wXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAg
IDo6ICAgICAgInIiKGJhc2UgKyAoaSkgKiB2bGVuYikgOiAibWVtb3J5Iik7ICAgIFwKPiArICAg
ICAgIH0pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXAo+ICsKPiArICAgICAgIFNBVkVfVlJFRygwKTsKPiArICAgICAgIFNBVkVfVlJFRyg4KTsK
PiArICAgICAgIFNBVkVfVlJFRygxNik7Cj4gKyAgICAgICBTQVZFX1ZSRUcoMjQpOwoKU2FtZSBp
c3N1ZSBhcyBGUCBzYXZlL3Jlc3RvcmUsIHRoaXMgd2lsbCB0cmFwIGFuZCBjcmFzaAppZiBWZWN0
b3IgaXMgZGlzYWJsZWQgaW4gbXN0YXR1cy5WUy4KCkZvciBjb3JyZWN0IGltcGxlbWVudGF0aW9u
LCByZWZlciBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoKS9yZXN0b3JlKCkKZnJvbSA8bGludXhfc291
cmNlPi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3ZlY3Rvci5oCgo+ICsKPiArI3VuZGVmIFNBVkVf
VlJFRwo+ICt9Cj4gKwo+ICt2b2lkIHNiaV92ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qgc2Jp
X3ZlY3Rvcl9jb250ZXh0ICpzcmMpCj4gK3sKPiArICAgICAgIGlmICghc3JjKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgY29uc3QgdWludDhfdCAqYmFzZSA9IHNyYy0+
dnJlZ3M7Cj4gKyAgICAgICB1bG9uZyB2bGVuYiA9IHZlY3Rvcl92bGVuYigpOwo+ICsKPiArICAg
ICAgIC8qIFN0ZXAgMjogUmVzdG9yZSB2ZWN0b3IgcmVnaXN0ZXJzICovCj4gKyNkZWZpbmUgUkVT
VE9SRV9WUkVHKGkpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAr
ICAgICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+ICsgICAgICAgYXNtIHZvbGF0aWxlKCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBwdXNo
XG5cdCIgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAgICAgICAu
b3B0aW9uIGFyY2gsICt2XG5cdCIgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICAiICAgICAgIHZsOHIudiB2IiAjaSAiLCAoJTApXG5cdCIgICAgICAgICAgICAgICBcCj4gKyAg
ICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAgICAgICAg
ICAgIFwKPiArICAgICAgICAgICAgICAgOjogICAgICAiciIoYmFzZSArIChpKSAqIHZsZW5iKSA6
ICJtZW1vcnkiKTsgICAgXAo+ICsgICAgICAgIH0pICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKwo+ICsgICAgICAgUkVTVE9SRV9WUkVHKDAp
Owo+ICsgICAgICAgUkVTVE9SRV9WUkVHKDgpOwo+ICsgICAgICAgUkVTVE9SRV9WUkVHKDE2KTsK
PiArICAgICAgIFJFU1RPUkVfVlJFRygyNCk7Cj4gKyN1bmRlZiBSRVNUT1JFX1ZSRUcKPiArCj4g
KyAgICAgICAvKiBTdGVwIDM6IFJlc3RvcmUgQ1NSJ3MgbGFzdCAqLwo+ICsgICAgICAgLyogUmVz
dG9yZSBDU1JzIGZpcnN0ICovCj4gKyAgICAgICBjc3Jfd3JpdGUodmNzciwgICBzcmMtPnZjc3Ip
Owo+ICsgICAgICAgY3NyX3dyaXRlKHZzdGFydCwgc3JjLT52c3RhcnQpOwo+ICt9Cj4gKwo+ICsj
ZWxzZQo+ICsKPiArdm9pZCBzYmlfdmVjdG9yX3NhdmUoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4
dCAqZHN0KQo+ICt7Cj4gK30KPiArCj4gK3ZvaWQgc2JpX3ZlY3Rvcl9yZXN0b3JlKGNvbnN0IHN0
cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnNyYykKPiArewo+ICt9Cj4gKwo+ICsjZW5kaWYgLyog
T1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUiAqLwo+IC0tCj4gMi40My4wCj4KPgo+IC0tCj4gb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKClJlZ2FyZHMsCkFu
dXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
