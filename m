Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F45FCD4F3C
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aCkPGIGWBxYmiVZZSCBrC+4Kmmx33pGBgHlzIYgw8dw=; b=Xg3BqQlmOWhzZk
	E3GuRENtRlcu+wcDwpw1c9nrXiC/kB9Yuq+Ag13TWGYtAfwcJbyxfe6ovY9JOsUKmuIE1xvMm8cE3
	I3h+IP19wrbc1W3LmbJc5Z87ZF5fp4dp5P2PgBNKhQ9xLAy6D6GdXFEWu0R+LJW8q0RXOaoe3sB+p
	wm25LtuLaRbuNxljFYTWRqnU613epK8q4V6x1rXCUm8mt7LdCWvZ/7/LTUYe4pw/aVtQsIf25tvDv
	N7qxXbDVMqxWH+t1FPQInOrhaaFZAr5Z/oVMKk6oAVLwTl1CdInsaTYoKHvL+sd1v4Sw2GJL74iHD
	JvD8uGEtgVyTg6Q41Rag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIh-0000000EnEN-2LU5;
	Mon, 18 May 2026 08:26:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIe-0000000EnDI-1tdg
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i0hRLI+kgMbLC033qbJv8z21VLFMNQSfFfA+UeQyJZk=; b=US9oZGg/yNFpGlSwyhwCNb5vIX
	wUdX1GerqvY3ewl2ilzZ5/m8rPPFP6pzaJGVSom25j6pNMEk7p/MSyjTxhe9TvfPM1yuqbsUn2GL9
	w/MMh4ui4WncAgBRdnz9WdrrrpBKVw82+9x6qx4kizyMj8FKD/QDUyFae3CgbrzmT44sjs09+qIn5
	yKT+vDw3cC3L5NR6IIj9auRl28eJ9KVxA3U2EnM3y+dzkxcAW8aRnhGXZUdsMzMxtf4fVkFeR3UQA
	T14FajL/KtmeHLM2iaqyemNU0o95o+u/b+QxLjlDxT+4ZTcBi6QIrMnqvE1I1cK9f/X1uPQ0S9BSA
	g+DqAnYQ==;
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtIa-0000000AMdd-3BQj
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:26:07 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-6948d7ccfbbso572959eaf.1
        for <opensbi@lists.infradead.org>; Mon, 18 May 2026 01:26:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779092763; cv=none;
        d=google.com; s=arc-20240605;
        b=EOVsRPlByJQ3B1S3Ypgz6PZrrktM8mlEXlqdR51rCj2g5lUoMSLXln8CVeJwr8ck1o
         LpofOq07vKDbCnRCxx6qnqMyDVHs3xWS6yGvEabWEBq7xeof31UXOhq9cBnjrFqJm5s/
         reFXv4LVOgy/BpjnNmdjYbIT3raEc8a9XvatsIrb5N4dlvsMw6LsBSziD3Mfp//6X75Y
         B0Twm4nLhtlzVVYyTQ7bcfvbIsFcAkS1WznNQkH7dUmJe6S0bVbBxTKPoKC3K8xy+j0/
         4l+q8dkxI8diM0iCwrRtvNF7N+YxStrI59DmC4aDYSgjQbbN2eecArUek5tJhzJfT8Y5
         O1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i0hRLI+kgMbLC033qbJv8z21VLFMNQSfFfA+UeQyJZk=;
        fh=M8INpAAKwsztz76zmB77zrR9HWLcak8bygoLfxJQjJI=;
        b=YoxTt4FPZdfEzzqVVMa4KDn8ieWYL2IqMubyP9Y5SI5HlrVmQB2t0PzF1r2AbFqnA4
         wpFz7pUGNMFb5XXxApdbmYpFUVO95tQoAMRxiMcVvdLZZeEhmIcKu/U+4pbcdrNI8gJw
         iIJ6uvtZ2M+BwO4Rfc1BOYY8M1xnCTCkPJ+lB2en88zdM0RZdNh7l4oK9S9guHVqhTYk
         EE5WtbKlQSOpmb9RthCjhJHbEb1y1nnYQwGRPs9oFS4dg4LtlBV+hk70818IbI+vAxQ2
         tKNLhm+nBTobqSEAEB7V/8s5+cmDGiGTtfnWSucXdjswEacVjp4snDDBmNdCoZLImWLa
         cmXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779092763; x=1779697563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i0hRLI+kgMbLC033qbJv8z21VLFMNQSfFfA+UeQyJZk=;
        b=Xr7BEwEFVYfAgl6J1Z1V6cOMjqEFFKY+u1WecQM4ohOJH/CoMzurfHzbU7m5qs3PpY
         TyXKIaX83BMmQAkxJo9mb40OBpXom7M6orAm1zKvem0g3INn+m8aCrmRNqDFN+5X1YvP
         xZqqW0qWAnI/6AiJ1fyFZlLi7puwgHVSSL2OJD1/SO+h9nVvTXmjh15IjfeXpwQ0ZSlM
         WgTJWIxVmZKYnyf0BAIt6VXpXBQXqJN6jTVhiADBaXJIxWjhsvrDppxGhCDQVbKV3qPz
         Y6Zqr1+GsUaNFe9M9VECGH/h3T+5nox+cL0/BqSJ5szw9WHM4q8XFStb6B1/KgvuLF5K
         fzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092763; x=1779697563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i0hRLI+kgMbLC033qbJv8z21VLFMNQSfFfA+UeQyJZk=;
        b=PbcotVbF791hYbA2cI2BxaFHeDminm0hcBM7OWlF14Wc8yFidKPAF7xcIC2y78u0AA
         6vLcepwKevppFRCFs54PKF4t2TOKrzSHi5e5hOUWJ+Fb0/TQNFvaClyVph7r39q4T0gd
         i/gftPqrCtUmXyWNAbGvelDXmrkDMP0O9ZUKVl35KdNxDrTVEvHUmHSij3/o7u4r2FPl
         T/NKtba8jzcwmEUGXec5Lm08oVYpYpiy2wNigF0cC7/ZTPYC2+OIPtd4FTstPhfvWcTr
         W4hAdCFc/quMH4qCO4hvH9720FEkexvtdJMYplRO0PA/bKWw8L4H8TgC8rJ/Wh8jmUo6
         TFmA==
X-Forwarded-Encrypted: i=1; AFNElJ/Qga+kJjejSHW6o/Gb6Degc+jqAwzv1eb3UE+RTuqFLJQ3uXKW7aU2ABqWyZqxBMrH+0HBa1wK@lists.infradead.org
X-Gm-Message-State: AOJu0YwL28PcVgSMrv2PBXd8NqMVQ/Ri6olMS+kKtvJjNmTgC5quAyBD
	ZzTUd0jsEYJIg2cB+Qkv1XBLD3J7xfiMvzxeUbg3ry0VBPnFmBxNUwCHa3JF531X08Nzhg6boDy
	3sSxAk6LCYFvSbur/bvxep+iqFkTtNGiJxyRqEhYR5GzDxFzUSYmj
X-Gm-Gg: Acq92OEg8om7ppccTzSlWqGNw8elcvLv2uO838ofrJj7BHDBY9nZwb5UWAXaCLKDiSY
	1sKK6jPrpbGnuM/TzrDqynbSxcVLW3yVtbo6zuM2oyKdDRplHCDcGNvL8bEYAGYqi+pYQXymjM2
	UJvkQnU4DUMp6a2hnUN7jNINFR/Za1rvR3WPXhZWOKwobkcK9lHZEJkoepYoX8nJDAjVMUgaVsL
	ZjtHgGx0i/qLUGoK3viX8Ae0/UWNzMjvXekiSESS68wUMqZOV5kcgy35WZVYPYfJ8mqTygNUncU
	TZCqWs2Eu3xBhA946yIX7FdBYRLo+GiuswvgrkHWgg+rd7tWHHB6KbUccfovLplZjS8fM9/fkge
	HYQvw/i0BZHDFfClvVBj+vZIywQ==
X-Received: by 2002:a05:6820:2908:b0:69b:5696:e64d with SMTP id
 006d021491bc7-69c9434a676mr9739250eaf.13.1779092762836; Mon, 18 May 2026
 01:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260518054219.58708-1-dave.patel@riscstar.com> <20260518054219.58708-2-dave.patel@riscstar.com>
In-Reply-To: <20260518054219.58708-2-dave.patel@riscstar.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 18 May 2026 13:55:51 +0530
X-Gm-Features: AVHnY4JB7crcREGmPShtE8PTM6UUDIiXvlK1bbc2iQihxaUbcPEhRwGxr9nHhow
Message-ID: <CAAhSdy2K5u2TmaUk+J53+TZ-vLJBUJBPad-n7ENcwPoux_vXOg@mail.gmail.com>
Subject: Re: [PATCH v7 1/3] lib: sbi: Add RISC-V vector context save/restore support
To: dave.patel@riscstar.com
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Scott Bambrough <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Ray Mao <raymond.mao@riscstar.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_092605_346232_D60EF5C2 
X-CRM114-Status: GOOD (  23.49  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5j
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
fCAgIDEgKwo+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgfCAxMTggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTQ3IGluc2VydGlv
bnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfdmVjdG9yLmMKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfdmVjdG9yLmggYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5kOTJmYzAzZAo+IC0tLSAvZGV2L251
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
dG9yX3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKTsKPiArc2l6
ZV90IHNiaV92ZWN0b3JfY29udGV4dF9zaXplKHZvaWQpOwo+ICsKPiArI2VuZGlmIC8vX19TQklf
VkVDVE9SX0hfXwo+ICsKCkkgaGFkIGNvbW1lbnRlZCBvbiBwcmV2aW91cyBzZXJpZXMgdGhhdCB0
aGlzIG5ld2xpbmUKaXMgcmVkdW5kYW50IGJ1dCBJIHN0aWxsIHNlZSBpdCBoZXJlLgoKPiBkaWZm
IC0tZ2l0IGEvbGliL3NiaS9vYmplY3RzLm1rIGIvbGliL3NiaS9vYmplY3RzLm1rCj4gaW5kZXgg
OTdjYzQ1MjEuLmRkYjJlN2FjIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvb2JqZWN0cy5tawo+ICsr
KyBiL2xpYi9zYmkvb2JqZWN0cy5tawo+IEBAIC0xMDksMyArMTA5LDQgQEAgbGlic2JpLW9ianMt
eSArPSBzYmlfdHJhcF92X2xkc3Qubwo+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV91bnByaXYubwo+
ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9leHBlY3RlZF90cmFwLm8KPiAgbGlic2JpLW9ianMteSAr
PSBzYmlfY3BwYy5vCj4gK2xpYnNiaS1vYmpzLXkgKz0gc2JpX3ZlY3Rvci5vCj4gZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX3ZlY3Rvci5jIGIvbGliL3NiaS9zYmlfdmVjdG9yLmMKPiBuZXcgZmls
ZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwLi5lNGExZjUxNQo+IC0tLSAvZGV2L251bGwK
PiArKysgYi9saWIvc2JpL3NiaV92ZWN0b3IuYwo+IEBAIC0wLDAgKzEsMTE4IEBACj4gKy8qCj4g
KyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiArICoKPiArICogQ29w
eXJpZ2h0IChjKSAyMDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KPiArICoKPiArICogQXV0aG9yczoK
PiArICogICAgICBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPiArICovCj4g
Kwo+ICsjaW5jbHVkZSA8c2JpL3NiaV9kb21haW4uaD4KPiArI2luY2x1ZGUgPHNiaS9yaXNjdl9l
bmNvZGluZy5oPgo+ICsjaW5jbHVkZSA8c2JpL3Jpc2N2X2FzbS5oPgo+ICsjaW5jbHVkZSA8c2Jp
L3NiaV92ZWN0b3IuaD4KPiArI2luY2x1ZGUgPHNiaS9zYmlfdHlwZXMuaD4KPiArI2luY2x1ZGUg
PHNiaS9zYmlfaGFydC5oPgo+ICsjaW5jbHVkZSA8c2JpL3NiaV9lcnJvci5oPgo+ICsjaW5jbHVk
ZSA8c2JpL3NiaV9jb25zb2xlLmg+Cj4gKwo+ICsjaWZkZWYgT1BFTlNCSV9DQ19TVVBQT1JUX1ZF
Q1RPUgo+ICsKPiArc2l6ZV90IHNiaV92ZWN0b3JfY29udGV4dF9zaXplKHZvaWQpCj4gK3sKPiAr
ICAgICAgIHJldHVybiBzaXplb2Yoc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCkgKyAoMzIgKiBj
c3JfcmVhZChDU1JfVkxFTkIpKTsKPiArfQo+ICsKPiArdm9pZCBzYmlfdmVjdG9yX3NhdmUoc3Ry
dWN0IHNiaV92ZWN0b3JfY29udGV4dCAqZHN0KQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IG1zdGF0dXNfb3JpZzsKPiArCj4gKyAgICAgICBpZiAoIWRzdCkKPiArICAgICAgICAgICAgICAg
cmV0dXJuOwo+ICsKPiArICAgICAgIC8qIFN0ZXAgMS4gU2F2ZSBvcmlnaW5hbCBtc3RhdHVzIGFu
ZCBFbmFibGUgVlMgKi8KPiArICAgICAgIG1zdGF0dXNfb3JpZyA9IGNzcl9yZWFkX3NldChDU1Jf
TVNUQVRVUywgTVNUQVRVU19WUyk7Cj4gKwo+ICsgICAgICAgLyogU3RlcCAyOiBTYXZlIENTUnMg
Ki8KPiArICAgICAgIGRzdC0+dmNzciA9IGNzcl9yZWFkKHZjc3IpOwo+ICsgICAgICAgZHN0LT52
c3RhcnQgPSBjc3JfcmVhZCh2c3RhcnQpOwo+ICsKPiArICAgICAgIHVsb25nIHZsZW5iID0gY3Ny
X3JlYWQoQ1NSX1ZMRU5CKTsKPiArICAgICAgIHVpbnQ4X3QgKmJhc2UgPSBkc3QtPnZyZWdzOwo+
ICsKPiArICAgICAgIC8qIFN0ZXAgMzogU2F2ZSB2ZWN0b3IgcmVnaXN0ZXJzICovCj4gKyNkZWZp
bmUgU0FWRV9WUkVHKGkpICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXAo+ICsgICAgICAgYXNtIHZvbGF0aWxlKCAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlv
biBwdXNoXG5cdCIgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAg
ICAgICAub3B0aW9uIGFyY2gsICt2XG5cdCIgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAg
ICAgICAgICAiICAgICAgIHZzOHIudiB2IiAjaSAiLCAoJTApXG5cdCIgICAgICAgICAgICAgICBc
Cj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAg
ICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgOjogICAgICAiciIoYmFzZSArIChpKSAqIHZs
ZW5iKSA6ICJtZW1vcnkiKTsgICAgXAo+ICsgICAgICAgfSkgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4gKwo+ICsgICAgICAgU0FWRV9WUkVH
KDApOwo+ICsgICAgICAgU0FWRV9WUkVHKDgpOwo+ICsgICAgICAgU0FWRV9WUkVHKDE2KTsKPiAr
ICAgICAgIFNBVkVfVlJFRygyNCk7Cj4gKwo+ICsjdW5kZWYgU0FWRV9WUkVHCj4gKwo+ICsgICAg
ICAgLyogU3RlcCA0LiBSZXN0b3JlIG9yaWdpbmFsIG1zdGF0dXMgTEFTVCAqLwo+ICsgICAgICAg
Y3NyX3dyaXRlKENTUl9NU1RBVFVTLCBtc3RhdHVzX29yaWcpOwo+ICt9Cj4gKwo+ICt2b2lkIHNi
aV92ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpzcmMpCj4g
K3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgbXN0YXR1c19vcmlnOwo+ICsKPiArICAgICAgIGlm
ICghc3JjKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsgICAgICAgLyogU3RlcCAx
LiBTYXZlIG9yaWdpbmFsIG1zdGF0dXMgYW5kIEVuYWJsZSBWUyAqLwo+ICsgICAgICAgbXN0YXR1
c19vcmlnID0gY3NyX3JlYWRfc2V0KENTUl9NU1RBVFVTLCBNU1RBVFVTX1ZTKTsKPiArCj4gKyAg
ICAgICBjb25zdCB1aW50OF90ICpiYXNlID0gc3JjLT52cmVnczsKPiArICAgICAgIHVsb25nIHZs
ZW5iID0gY3NyX3JlYWQoQ1NSX1ZMRU5CKTsKPiArCj4gKyAgICAgICAvKiBTdGVwIDI6IFJlc3Rv
cmUgdmVjdG9yIHJlZ2lzdGVycyAqLwo+ICsjZGVmaW5lIFJFU1RPUkVfVlJFRyhpKSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAgICAgICh7ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICsg
ICAgICAgYXNtIHZvbGF0aWxlKCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBcCj4gKyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBwdXNoXG5cdCIgICAgICAg
ICAgICAgICAgICAgICAgIFwKPiArICAgICAgICAgICAgICAgIiAgICAgICAub3B0aW9uIGFyY2gs
ICt2XG5cdCIgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAgICAiICAgICAgIHZs
OHIudiB2IiAjaSAiLCAoJTApXG5cdCIgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAg
ICIgICAgICAgLm9wdGlvbiBwb3Bcblx0IiAgICAgICAgICAgICAgICAgICAgICAgIFwKPiArICAg
ICAgICAgICAgICAgOjogICAgICAiciIoYmFzZSArIChpKSAqIHZsZW5iKSA6ICJtZW1vcnkiKTsg
ICAgXAo+ICsgICAgICAgIH0pICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBcCj4gKwo+ICsgICAgICAgUkVTVE9SRV9WUkVHKDApOwo+ICsgICAgICAg
UkVTVE9SRV9WUkVHKDgpOwo+ICsgICAgICAgUkVTVE9SRV9WUkVHKDE2KTsKPiArICAgICAgIFJF
U1RPUkVfVlJFRygyNCk7Cj4gKyN1bmRlZiBSRVNUT1JFX1ZSRUcKPiArCj4gKyAgICAgICAvKiBT
dGVwIDM6IFJlc3RvcmUgQ1NSJ3MgbGFzdCAqLwo+ICsgICAgICAgLyogUmVzdG9yZSBDU1JzIGZp
cnN0ICovCj4gKyAgICAgICBjc3Jfd3JpdGUodmNzciwgICBzcmMtPnZjc3IpOwo+ICsgICAgICAg
Y3NyX3dyaXRlKHZzdGFydCwgc3JjLT52c3RhcnQpOwo+ICsKPiArICAgICAgIC8qIFN0ZXAgNC4g
UmVzdG9yZSBvcmlnaW5hbCBtc3RhdHVzIExBU1QgKi8KPiArICAgICAgIGNzcl93cml0ZShDU1Jf
TVNUQVRVUywgbXN0YXR1c19vcmlnKTsKPiArfQo+ICsKPiArI2Vsc2UKPiArCj4gK3ZvaWQgc2Jp
X3ZlY3Rvcl9zYXZlKHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKmRzdCkKPiArewo+ICt9Cj4g
Kwo+ICt2b2lkIHNiaV92ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250
ZXh0ICpzcmMpCj4gK3sKPiArfQo+ICsKPiArc2l6ZV90IHNiaV92ZWN0b3JfY29udGV4dF9zaXpl
KHZvaWQpCj4gK3sKPiArICAgICByZXR1cm4gMDsKClVzZSB0YWJzIGZvciBhbGlnbm1lbnQgaW5z
dGVhZCBvZiBzcGFjZXMuCgo+ICt9Cj4gKyNlbmRpZiAvKiBPUEVOU0JJX0NDX1NVUFBPUlRfVkVD
VE9SICovCj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
