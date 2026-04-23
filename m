Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 919F9FAD40D
	for <opensbi@archiver.kernel.org>; Thu, 23 Apr 2026 05:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XSyC5DlK+cI4y4w5FTgQUbGY5ShNf3hR9jrExZWacFU=; b=v1VnuwJAtQUvwv
	peO+s06HsOQFsSzzxnz8aajUZ25OOPQPlrPFHszuHYyc5wBA3XLEgu/uXUv84NPs1XJBd/+ElEnlw
	tQLlMYlhRhSA4DTUZ1xdMWq9qG2w2eO7bg74ZX2yEE1AKnCcd1kjHsBTcviYZiS/M34vYw9RS35zs
	JIdRM2b0K/pQ3aMPRBeXgvzvYrVXqXsCE9ajHrK6uKx9FboWUMyU3kXjHcf/SfBrT5ZoWah22bTKc
	g0b0mJjUzkJfVOFy9RFa9g+dbH4a5YD/X0bpJGKSXTqSZi9qf+UtuQCHFXNmlH30P9+SVP4mH3BdE
	ll9CFiRMLVpr7hO04t+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmY1-0000000B3xg-2HEA;
	Thu, 23 Apr 2026 05:24:21 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmXy-0000000B3v7-0ycd
	for opensbi@lists.infradead.org;
	Thu, 23 Apr 2026 05:24:20 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-7d4c383f2fcso5314566a34.0
        for <opensbi@lists.infradead.org>; Wed, 22 Apr 2026 22:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776921857; cv=none;
        d=google.com; s=arc-20240605;
        b=Tex/N4FJA3yP1+cnCF6NYUNkA2qsR1K6kCG7PSMOhx5gqfOAXRvhU1iwRUaTB/Gtf8
         h9fIZvgKQpXe3ZTkpVFmijFhZbMVgxWCR4KEiXMaL4fvyvu1CrcF8TKfVaBUNRu0n2Eg
         UyLUtDSR10abxBqFRI6HpLr+qlB63SfaEvg5GyTlnc5OX66Gvb0NuWwfS/8epgAU0yEH
         nu66B1f8qo/cC9D5aBB8lb2i7kxZnaXIqezfO+DkO+WRuNqCCxjbZVyFvH7DE69pvACg
         +UIgH8EWTfn1/gaQTTgEdAqE7p4GkzOtbCO2FJW4hMU/Z5aRUyID4+7HPX/oGvn+0vX2
         mOyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xc5NY+oS6xgo+bj/4KuXK1GYcilTQwy8S6lm8PGMJOc=;
        fh=eKJuLwe/Q3abxqiDCY82BKbySJb4gPVa1nOip41npJE=;
        b=WnDwvOo9vXmMx/XgtERaJhpuCvcS+knfwV8qkjaORsaMtjFibXRTOL6veKtog/ZfNC
         RoyYsun3doV0JsmrMtc7T/2RiPYcflOMKmY4/+zpoDmoMLpZqKmMtS1+Wskd3gmJ3BPN
         twAz1aI1+1YrVOXVUk0xlyhMgrEKOw23Sxnrcfh1pjekGuojMXyrI5GPo5b+jeNDmt0X
         fn3dW6ss1vlB+5n5IiQGRAnW7HUnH2pHoqN2SbqgemGIIsO/2LJ932AFWMUu5aEcF+AT
         NKWHKqhmHTJh3+jK/V3g8qMOrYicQWXixaURwbGK8sUzhPkFbv27SAbebbxWE/HEqf13
         a53A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1776921857; x=1777526657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xc5NY+oS6xgo+bj/4KuXK1GYcilTQwy8S6lm8PGMJOc=;
        b=gk1FQeaBMQEEykprXRm52JkSiNT9WkqNboW67I0TKIzCTQG0wRICClvX/iULn0TlpJ
         ETG22yVkmAfbtSqQRNfed/ARgOeo/lGdLeKLYRBq6cOlIIfCGoXX7q595kNC3B5s6KF/
         O4ySH//bA7I6uvfme3jGppUUxdSYXNS99elpzLTzm/9wudLESSTSVQLAQxFO6dmtDYgc
         VfjNwjXNQ2V2GoQ/DaWg1u74HJBbIJqgrwtda+xEIgvUPeu+fIRDmVaS1EIaumPUjNtI
         D3fkGP3vF7q3oX49kDXHOsLY4FGf0prNCYREM+k6Yij4NVb4IQg/4hoe2rOfg2X8AL1L
         Yorw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776921857; x=1777526657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xc5NY+oS6xgo+bj/4KuXK1GYcilTQwy8S6lm8PGMJOc=;
        b=AE6xdoIdSI8X+7uHQr+B6iVi50IJUYsfgAswMknEaNXP16qAs5n+alTYyHmr8p/Ivz
         Mxc5B0BP58rfj6pIVRK6g+t85+7lNamY3ZXPy4hemf8nRPrXovsHWV4kAlNaixZzoPmN
         pGaN4wgB4yk+nvE5owjSvSlEff2MdjL3XE67dB+tvSt8zMfyhSJ/Kh+y9tSIZBoQ61s8
         o9g8QLhiyWmC7tw3gjAmOx1DbkUSp+MHdR0/vmNZCc2XbdWTjNQvaTmecB4T9g9DSCpu
         1Pn1zJkRd6sbyFOWSxMp/9Pv4V2cLuRziVatUa2AH0EmSvAlvA0HM/4qOTr991DnQgWn
         QI3w==
X-Gm-Message-State: AOJu0Yx5A/f4h8dNL8OYBYfyayvdVRljSMvF08rkxzZ51wjxlg99c+EE
	JjJwhv3YsAH2UZVPr6MPhytVUSTBijt0nR0ObLJCXjy1v1L7+4oG4I7HaNH0FLvupiLX/r+VvLa
	tXSyr58FdPt9X1O5ABPo7yJwqPMJqbOddicsTljs/vQ==
X-Gm-Gg: AeBDieuKXW11K8fNzofKuP4csInA/YciDDnJnfldcBaqqsRl16jeSAa0upQlqI3HKDf
	qlTDPoiEScT1WA+y2bjCFkZ5pVCDhkmx2Fz2PsUbnq6yilVWWEz+D7WnOJkH8ZkzAlFicGCh6LG
	YK8V+hRwHCLtlOv6pVpdKH+AVjvg23/EIoLYdpYG+0VRFI46XRt3bu3afTioUSdg7ZJmd8gqS73
	kYzfEIn4dKSitzRbMbZLbKeIxsYgTGWKnRXRIYFkA718C5Ilq6k6YXhnZ7zXyL6W65It2kLIukK
	vBuBSbBkwTw0dEtETRuUxvcSIU3LftOX10sAIfGj6i9fUK+GjVqrma8wBo6h4lclRYzXc8U+zS8
	Ptz8z8Saou0MMxcMHze8HBOrnFO0xKr3g1eYs
X-Received: by 2002:a4a:e903:0:b0:694:8ed8:e581 with SMTP id
 006d021491bc7-6948ed8eccbmr7906531eaf.59.1776921856069; Wed, 22 Apr 2026
 22:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
 <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com>
 <20260409191943.291207-1-evvoevod@tenstorrent.com> <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
 <20260416202608.1125121-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260416202608.1125121-1-evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 23 Apr 2026 10:54:04 +0530
X-Gm-Features: AQROBzCeNMN3siOx3g382tLGLg0vrzIfPTB0_o-LEA7p8ipF4Te1vaqWM4fWgwo
Message-ID: <CAAhSdy1kwkZtHKUzQov=b8_PvnXT1DZ379P_egDtbpSbkN03dw@mail.gmail.com>
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_222418_548700_982AA363 
X-CRM114-Status: GOOD (  20.35  )
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

T24gRnJpLCBBcHIgMTcsIDIwMjYgYXQgMTo1NuKAr0FNIEV2Z2VueSBWb2V2b2Rpbgo8ZXZ2b2V2
b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPgo+IE9uIEZyaSwgQXByIDEwLCAyMDI2IGF0IDE6
MDkgQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiA+ID4gRHJv
cCB0aGVzZSBwbGF0Zm9ybSBjYWxsYmFja3MgZnJvbSB0aGlzIHBhdGNoLiBXZSB3aWxsIGJlCj4g
PiA+ID4gZXh0ZW5kaW5nIHNiaV9pcnFjaGlwIHRvIHN1cHBvcnQgTk1Jcy4gRm9yIE5NRSwgd2Ug
d2lsbAo+ID4gPiA+IGNhbiBzaW1wbHkgY3Jhc2guCj4gPiA+Cj4gPiA+IEFncmVlZC4gSSdsbCBy
ZW1vdmUgdGhlIHBsYXRmb3JtIGNhbGxiYWNrcy4gRm9yIFJOTUksIEknbGwKPiA+ID4gcm91dGUg
dGhyb3VnaCBzYmlfaXJxY2hpcCBvbmNlIHRoYXQgc3VwcG9ydCBpcyBpbiBwbGFjZS4gRm9yCj4g
PiA+IFJOTUUsIEknbGwgc2ltcGxpZnkgdG8ganVzdCBwcmludCBkaWFnbm9zdGljcyBhbmQgaGFu
Zy4KPgo+IEhpIEFudXAsCj4KPiBJJ3ZlIGJlZW4gcmViYXNpbmcgYW5kIHJld29ya2luZyB0aGUg
U21ybm1pIHNlcmllcyBiYXNlZCBvbiBvdXIKPiBkaXNjdXNzaW9uLiBJIGNhbiByZW1vdmUgdGhl
IHBsYXRmb3JtIHJ1bnRpbWUgY2FsbGJhY2tzCj4gKG9wcy0+cm5taV9oYW5kbGVyIC8gb3BzLT5y
bm1lX2hhbmRsZXIpIGFzIGFncmVlZCwgYW5kIEkgY2FuIHN0aWxsCj4gaGF2ZSB0aGUgaW5pdGlh
bCBTbXJubWkgaW5mcmFzdHJ1Y3R1cmUgaW4gcGxhY2U6IHBsYXRmb3JtcyBpbnN0YWxsCj4gdHJh
cCBoYW5kbGVycyBmb3IgUk5NSS9STk1FIHZlY3RvcnMsIGRldGVjdCB0aGUgZXh0ZW5zaW9uIGZy
b20KPiBkZXZpY2UgdHJlZSwgYW5kIGluaXRpYWxpemUgTU5TQ1JBVENILgo+Cj4gSG93ZXZlciwg
d2l0aG91dCBpcnFjaGlwIE5NSSBzdXBwb3J0IHRoZXJlJ3Mgbm8gd2F5IGZvciBwbGF0Zm9ybXMK
PiB0byBhY3R1YWxseSBoYW5kbGUgTk1JcyBvbmNlIHRoZXkgZmlyZS4gVGhlIGRlZmF1bHQgUk5N
SSBoYW5kbGVyCj4gd291bGQganVzdCBsb2cgYW5kIGhhbmcuIFRoaXMgbWVhbnMgTk1JcyB3b3Vs
ZCBuZWVkIHRvIHN0YXkKPiBkaXNhYmxlZCAoTk1JRT0wKSB1bnRpbCB0aGF0IHN1cHBvcnQgbGFu
ZHMsIGV2ZW4gb24gcGxhdGZvcm1zIHRoYXQKPiBhcmUgb3RoZXJ3aXNlIHJlYWR5IGZvciBTbXJu
bWkuCj4KPiBJIGNvdWxkbid0IGZpbmQgb25nb2luZyB3b3JrIG9uIGlycWNoaXAgTk1JIHN1cHBv
cnQsIHNvIEkgd2FudGVkCj4gdG8gY2hlY2sgaG93IHlvdSdkIGxpa2UgdG8gcHJvY2VlZDoKPgo+
IDEuIFNoaXAgdGhlIFNtcm5taSBpbmZyYXN0cnVjdHVyZSB3aXRoIE5NSXMgZWZmZWN0aXZlbHkg
ZGlzYWJsZWQKPiAgICAobG9nIGFuZCBoYW5nKS4gUGxhdGZvcm1zIGNhcnJ5IGxvY2FsIHBhdGNo
ZXMgZm9yIE5NSSBoYW5kbGluZwo+ICAgIHVudGlsIGlycWNoaXAgTk1JIHN1cHBvcnQgbGFuZHMu
Cj4KPiAyLiBLZWVwIG9wcy0+cm5taV9oYW5kbGVyIGFzIGEgdGVtcG9yYXJ5IGJyaWRnZSwgbWFy
a2VkIGZvcgo+ICAgIG1pZ3JhdGlvbiB0byBpcnFjaGlwLgo+Cj4gMy4gSW5jbHVkZSBhIG1pbmlt
YWwgaXJxY2hpcCBOTUkgZXh0ZW5zaW9uIGluIHRoaXMgc2VyaWVzOiBhCj4gICAgc3RhbmRhbG9u
ZSByZWdpc3RyYXRpb24gQVBJIChzYmlfaXJxY2hpcF9yZWdpc3Rlcl9ubWlfaGFuZGxlciAvCj4g
ICAgc2JpX2lycWNoaXBfcHJvY2Vzc19ubWkpIHdpdGggYSBzaW1wbGUgc3RhdGljIGNhbGxiYWNr
IC0tIG5vdAo+ICAgIHRpZWQgdG8gYSBzcGVjaWZpYyBpcnFjaGlwIGRldmljZSBzaW5jZSBOTUkg
aXMgYSBzeXN0ZW0tbGV2ZWwKPiAgICBldmVudC4gUGxhdGZvcm1zIHdvdWxkIHJlZ2lzdGVyIHRo
ZWlyIE5NSSBoYW5kbGVyIGR1cmluZwo+ICAgIGlycWNoaXBfaW5pdCwgYW5kIHNiaV90cmFwX3Ju
bWlfaGFuZGxlciB3b3VsZCBkaXNwYXRjaAo+ICAgIHRocm91Z2ggaXQuCj4KCkkgYW0gbGVhbmlu
ZyB0b3dhcmRzIG9wdGlvbiAjMiBhbmQgYXMgYSBzZXBhcmF0ZSBzZXJpZXMKdGhlIHNiaV9pcnFj
aGlwIGNhbiBiZSBleHRlbmRlZCB0byBzdXBwb3J0IE5NSXMuCgpSZWdhcmRzLApBbnVwCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
