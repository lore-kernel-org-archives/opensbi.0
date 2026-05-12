Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C2DCD4F25
	for <opensbi@archiver.kernel.org>; Tue, 12 May 2026 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/KWU/BX7gRtpEpl6mbibYpHYs2JDYlO2fGyVOdsyzYE=; b=KX4T+sCei9g6oR
	Tc8GQ73R/NgUX4jtjwHdC8OqF1jWmWxrTMQRiMMFtl1XLu3R+5sHtgW5GxtG41y9XT8+Y/LNuBu1T
	FS1hyTUwTEhRnad0xISt1RNsJ8h619gktcEhH3gqWjDl/0lF2SYE/nnQhFsybPtzG3g8GwN0CUk7Q
	RqUd8Qk2zkjBTUb5tcIQyc8M2idLhYHiHT6yEJ30onM8K8SPjKb4pvgiXgWnyzH3H7ayKREA7zrr1
	fYmX/2N8cTC9/edT7xuZD4aB+/q2LAJhsDEm4DvA21nHkBTJ/uJCFDCbmp420N/Yf0iR7FQaD/nHn
	U8FXhwdNXSUiRj1o8A7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpEB-0000000HFCW-1yNR;
	Tue, 12 May 2026 15:40:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpE9-0000000HFBL-2XEQ
	for opensbi@lists.infradead.org;
	Tue, 12 May 2026 15:40:58 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-676a89de629so9185610a12.1
        for <opensbi@lists.infradead.org>; Tue, 12 May 2026 08:40:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778600455; cv=none;
        d=google.com; s=arc-20240605;
        b=CnO4qDgs6T23MUGRwuT6HuobpA7pqzo3br6vJ3Gnb7MSPsWcAhllK/XkYd43b2uKiS
         Bgh0coh/0BexYJRI+KKut0scJkduU7J/LgmpdRkAO6X07j+9ItjX1ExMH3mi8CrTgq/R
         s3g7FIveCYoVWvi1TJtp3uVg4YFxztXVHikNh8NOReavhIPhP3ne6P5M3lMRIpqtI+lE
         1P5TNAcqBr2jUIraD76iSCfdPDA6uZVxjQQoL22a9HL1v1Wl7Bz7JXQ/gjfridYLfahI
         LKWSz+pwfY9pbWvhX1zCZFIkmo/6V2f06YLviTex0MFQ06mL3ip6OkUFHIFwoeanbJVT
         sVFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OQU9GK2p9xOBbIQqs08w+9MaRnlRjDLg2mcj/NG8vwg=;
        fh=d3EYDeMTr9bj8A9e+rWtnG4zGN6Hjldc53vwBbhhYAk=;
        b=FD2eEm1iDlNOR8bGHFBGzPpIe12R4MWxHic6/vrKgbTNkcI/2FP/g6ols88308joWE
         5bZsf/I3QcuaL4rVVOOxJBzG26tGyVq/sHTGvbDV8vpQgI0z3hoLli5iR11TkIZ5VFXT
         E4QtSUjghEudTZpjp2SdhuJdpPW+9fgZUl5O5z/CBvpIscPCxhCF1flBrzO3EKj5/esX
         a4USwXxzknfFu3JCoE/woqidBw2IuGV9pVcXgvr/0kyt2TqNa3otMPk7KARfwuxUxP9x
         yoxdy8i6B6aOsY6GYzgVZbauwkHYzd8dKMZPY69kFFJnsBr3mT5QOZaVgxN/vt+VnWrt
         RyFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1778600455; x=1779205255; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQU9GK2p9xOBbIQqs08w+9MaRnlRjDLg2mcj/NG8vwg=;
        b=CCXbD8olXwDgFAQXxmEqV3aLqndpo/H14JxsrUQ2CAK0K6tYZAGt7D1b8ECcgy/9Fj
         M0QC52Cflzl1EjvQeviXfA+vlwxBOknLS2BEj4XgpKbl8jVPkX/HIDPxohwB0tJ9vYpL
         1Oynz7VZ+hLDeDxl4w4FmfbuT0mvuOM+Q0xGmY/NpSZLSVtuLqGF1kfJDTIaLzlYmVSG
         Oib6CjAGPdN8D7wbSiFzO6rjDicEkABTAdRvgtVcJyPmg7kghxMU3v6a+66X6bL1nzm1
         goMWX/M0FPa3qtjtE/asNDXv5+MfskPs5J1tqRo+U/hbvGcWdpRrn6cBP6t8vRPQEWgU
         KWSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778600455; x=1779205255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQU9GK2p9xOBbIQqs08w+9MaRnlRjDLg2mcj/NG8vwg=;
        b=Jlr1tv/Wg0FbQ3ZWjqzPbqteKM4pQEHDpTo8W+gRUT2vPuMBRJRRFHA4TCIdUqc9sl
         SOPQDuBVdOEyiSnCU1/Mw8Ik0nxfC+CB8zou3nZMoAT+6+kksk4b4RXnDQdvJOyMyjiI
         ujjGDcPFzHuK9QxV9voAAQnz1HDB237AQwTCXyJlKrI+QKDQrLrICYx/NzvA96RmZ7/h
         UEfRHBc31XpwqluRevxmT9G5G5y1NxQOd32U5YSJxEpxYk3idMYBLb9d++vq39Pa+MCA
         LtHeFQVCAeFtF4mKpF23sGrrrQFljSEQNx8/PN6e32VSr+b8GJ4Bin/ikPe+ao8CGgsV
         9fXQ==
X-Forwarded-Encrypted: i=1; AFNElJ/yIUBiItFd8V7BbVw4Wp9GT+1H0YWEg4NWkDlcD8Efkpnpt+YrxoIJoz7GpwjScHMWlXohImFr@lists.infradead.org
X-Gm-Message-State: AOJu0YzurauDmX4gSm6TBThr9wQRQfHSMZvw9o+6veqfjYChT2z1bSq8
	pq8kWAm6K6m20r0Gp7QXMw2WFBvlPx8/xAhDqmtaN+IF+SqSpsOWAJonHvUvLf6OqbI8jeXijQU
	3SUonXq1gtcWSEXtsJMpwLrk5fE6vgjT+NA97VGi6DA==
X-Gm-Gg: Acq92OEHW9W4Cr+Lid7RbHbANLJekdwbO3wllgcFX36ZzmScq9q+IbXwfa2ruW4IVWt
	M5ng8Olwvt3olfBsTlwPDOvoVCnMg3MDS3A4G6KOcZdsfzhFN9CljlyqG8lXEa0tYmneDrOb9pt
	2lhRmxMAmrxnZgS/jJr5iW1cR8zhh4MpqHSpD6eW07zoCDxAWXrZGAVsWnf0yQCETtkuYydgO8V
	QtCskmKXO5qdPFKMxzsPupqXyxMnmI17uT0jfUBtMVTcyim5TnKvqFWV0FxxSh4ty7bjn/5aOWU
	KKs/jUvUnUlZEHCQ2TiEG6Iqy/qHHiHXkx6J889n
X-Received: by 2002:a17:907:a01:b0:bab:f5c7:23ca with SMTP id
 a640c23a62f3a-bc56df0650fmr1746777466b.38.1778600455471; Tue, 12 May 2026
 08:40:55 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com>
 <88b1470e1e3348d454b4b995a11a85c01914f7af.1778176768.git.evvoevod@tenstorrent.com>
 <CAAhSdy3Pm5ESW17pz5wZxrbB5hoTHVBz_rQWo9voa6s+gxi7Pw@mail.gmail.com>
 <CAHh=Yk9PUdCc3kbBWxmaEOOG1WauvYXctFdrQhvM-=NbWr_DCg@mail.gmail.com>
 <CAAhSdy0TLbpLmfO_LPLn0cPqs-gD0EzvbYEaUvHpZuv_NYQXRQ@mail.gmail.com> <CAHh=Yk_Sbd1MEH8tVshAOFQptEVKm0QZv+D7bJwMC80qvarVew@mail.gmail.com>
In-Reply-To: <CAHh=Yk_Sbd1MEH8tVshAOFQptEVKm0QZv+D7bJwMC80qvarVew@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 12 May 2026 21:10:42 +0530
X-Gm-Features: AVHnY4Lm-O0qgp45f6pqNEtlmazcQDb9laRtkM-L7dVnsxb0zJwf-WnIMKzaYDw
Message-ID: <CAK9=C2WAsC+oPNL6=H+HRnzD+LiXN0StHQvMUCLmT8UUJOq+wQ@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] lib: sbi: hart: Detect and enable Smrnmi before
 trap-based feature detection
To: Nylon Chen <nylon.chen@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Evgeny Voevodin <evvoevod@tenstorrent.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_084057_697147_FAD1E22F 
X-CRM114-Status: GOOD (  45.51  )
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

T24gVHVlLCBNYXkgMTIsIDIwMjYgYXQgMjowMOKAr1BNIE55bG9uIENoZW4gPG55bG9uLmNoZW5A
c2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiDm
lrwgMjAyNuW5tDXmnIgxMuaXpemAseS6jCDkuIvljYgzOjU55a+r6YGT77yaCj4gPgo+ID4gT24g
VHVlLCBNYXkgMTIsIDIwMjYgYXQgMTI6MTTigK9QTSBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNp
Zml2ZS5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPiDmlrwgMjAyNuW5tDXmnIg55pel6YCx5YWtIOS4i+WNiDI6NTHlr6vpgZPvvJoKPiA+ID4K
PiA+ID4gPgo+ID4gPiA+IE9uIFRodSwgTWF5IDcsIDIwMjYgYXQgMTE6MzjigK9QTSBFdmdlbnkg
Vm9ldm9kaW4KPiA+ID4gPiA8ZXZ2b2V2b2RAdGVuc3RvcnJlbnQuY29tPiB3cm90ZToKPiA+ID4g
PiA+Cj4gPiA+ID4gPiBUaGUgbG9jYXRpb24gb2YgdGhlIFJOTUkvRSB0cmFwIHZlY3RvcnMgaW4g
dGhlIFNtcm5taSBleHRlbnNpb24gaXMKPiA+ID4gPiA+IGltcGxlbWVudGF0aW9uLWRlZmluZWQs
IHNvIHBsYXRmb3JtcyB3aXRoIHZlbmRvci1zcGVjaWZpYyBOTUkgdmVjdG9yCj4gPiA+ID4gPiBt
ZWNoYW5pc21zIG11c3QgaW5zdGFsbCB0aGUgZmlybXdhcmUncyBOTUkgZW50cnkgcG9pbnRzIHRo
ZW1zZWx2ZXMuCj4gPiA+ID4gPgo+ID4gPiA+ID4gQWRkIGFuIHNtcm5taV9oYW5kbGVyc19pbml0
KCkgY2FsbGJhY2sgdG8gc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgdGhhdAo+ID4gPiA+ID4gcmVj
ZWl2ZXMgdGhlIGZpcm13YXJlIGVudHJ5IHBvaW50cyBhbmQgbGV0cyBwbGF0Zm9ybSBjb2RlIGlu
c3RhbGwgdGhlbQo+ID4gPiA+ID4gYXQgdGhlIGhhcmR3YXJlLXNwZWNpZmljIHZlY3RvciBsb2Nh
dGlvbnMuIFR3byBwb2ludGVycyBhcmUgcGFzc2VkOgo+ID4gPiA+ID4KPiA+ID4gPiA+ICAgLSBf
dHJhcF9ybm1pX2hhbmRsZXI6IHRoZSBkZWRpY2F0ZWQgUk5NSSBlbnRyeSBwb2ludCB0aGF0IHNh
dmVzCj4gPiA+ID4gPiAgICAgY29udGV4dCB1c2luZyB0aGUgU21ybm1pIE1OKiBDU1JzIGFuZCBy
ZXR1cm5zIHZpYSBtbnJldC4KPiA+ID4gPiA+ICAgLSBfdHJhcF9oYW5kbGVyOiB0aGUgcmVndWxh
ciBNLW1vZGUgdHJhcCBlbnRyeSBzaW5jZSBSTk1FIGlzIHRha2VuCj4gPiA+ID4gPiAgICAgYXMg
YSByZWd1bGFyIE0tbW9kZSB0cmFwIHdpdGggTk1JRT0wLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFdo
ZW4gU21ybm1pIGlzIHByZXNlbnQsIGluc3RhbGwgdGhlIHBsYXRmb3JtJ3MgTk1JIHZlY3RvcnMg
dmlhIHRoZSBuZXcKPiA+ID4gPiA+IGNhbGxiYWNrLCBpbml0aWFsaXplIE1OU0NSQVRDSCB3aXRo
IHRoZSBwZXItaGFydCBzY3JhdGNoIHBvaW50ZXIsIGFuZAo+ID4gPiA+ID4gc2V0IE1OU1RBVFVT
Lk5NSUUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU21ybm1pLWVuYWJsZWQgcGxhdGZvcm1zIG11c3Qg
cmVnaXN0ZXIgc21ybm1pX2hhbmRsZXJzX2luaXQ7IGlmIHRoZQo+ID4gPiA+ID4gZXh0ZW5zaW9u
IGlzIGRldGVjdGVkIGJ1dCBubyBjYWxsYmFjayBpcyByZWdpc3RlcmVkLCBzYmlfcGFuaWMoKSBp
cwo+ID4gPiA+ID4gY2FsbGVkIHNpbmNlIGVuYWJsaW5nIE5NSXMgd2l0aG91dCBoYW5kbGVycyBp
biBwbGFjZSB3b3VsZCByb3V0ZQo+ID4gPiA+ID4gc3Vic2VxdWVudCB0cmFwcyBpbnRvIG5vd2hl
cmUuCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRXZnZW55IFZvZXZvZGluIDxl
dnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+Cj4gPiA+ID4KPiA+ID4gPiBMR1RNLgo+ID4gPiA+Cj4g
PiA+ID4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4gPiA+
ID4KPiA+ID4gPiBSZWdhcmRzLAo+ID4gPiA+IEFudXAKPiA+ID4gPgo+ID4gPiA+ID4gLS0tCj4g
PiA+ID4gPiAgaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggfCAgNCArKysrCj4gPiA+ID4gPiAg
bGliL3NiaS9zYmlfaGFydC5jICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrKwo+ID4g
PiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKQo+ID4gPiA+ID4KPiA+ID4g
PiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCBiL2luY2x1ZGUvc2Jp
L3NiaV9wbGF0Zm9ybS5oCj4gPiA+ID4gPiBpbmRleCA3MTVkZjQ5OS4uZmUzODJiNTYgMTAwNjQ0
Cj4gPiA+ID4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaAo+ID4gPiA+ID4gKysr
IGIvaW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmgKPiA+ID4gPiA+IEBAIC0xNTAsNiArMTUwLDEw
IEBAIHN0cnVjdCBzYmlfcGxhdGZvcm1fb3BlcmF0aW9ucyB7Cj4gPiA+ID4gPiAgICAgICAgIC8q
KiBwbGF0Zm9ybSBzcGVjaWZpYyBwbXAgZGlzYWJsZSBvbiBjdXJyZW50IEhBUlQgKi8KPiA+ID4g
PiA+ICAgICAgICAgdm9pZCAoKnBtcF9kaXNhYmxlKSh1bnNpZ25lZCBpbnQgbik7Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gKyAgICAgICAvKiogcGxhdGZvcm0gc3BlY2lmaWMgU21ybm1pIGhhbmRsZXJz
IGluaXQgb24gY3VycmVudCBIQVJUICovCj4gPiA+ID4gPiArICAgICAgIHZvaWQgKCpzbXJubWlf
aGFuZGxlcnNfaW5pdCkodm9pZCAoKnJubWlfaGFuZGxlcikodm9pZCksCj4gPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgICAgICB2b2lkICgqcm5tZV9oYW5kbGVyKSh2b2lkKSk7Cj4gPiA+ID4g
PiArCj4gPiA+ID4gPiAgICAgICAgIC8qKiBwbGF0Zm9ybSBzcGVjaWZpYyBTbXJubWkgTk1JIGhh
bmRsZXIuCj4gPiA+ID4gPiAgICAgICAgICAqICBSZXR1cm5zIFNCSV9TVUNDRVNTIG9uIHN1Y2Nl
c3MsIGVycm9yIGNvZGUgaWYgTk1JIGNhbm5vdCBiZSBoYW5kbGVkLiAqLwo+ID4gPiA+ID4gICAg
ICAgICBpbnQgKCpybm1pX2hhbmRsZXIpKHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCk7
Cj4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlf
aGFydC5jCj4gPiA+ID4gPiBpbmRleCA3ODExNjFlNS4uOTJjNjAyYWEgMTAwNjQ0Cj4gPiA+ID4g
PiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+ID4gPiA+ICsrKyBiL2xpYi9zYmkvc2JpX2hh
cnQuYwo+ID4gPiA+ID4gQEAgLTUzMiw2ICs1MzIsMjYgQEAgc3RhdGljIGludCBoYXJ0X2RldGVj
dF9mZWF0dXJlcyhzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gPiA+ID4gPiAgICAgICAg
IGlmIChyYykKPiA+ID4gPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gKyAgICAgICBpZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklf
SEFSVF9FWFRfU01STk1JKSkgewo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNvbnN0IHN0cnVj
dCBzYmlfcGxhdGZvcm0gKnBsYXQgPSBzYmlfcGxhdGZvcm1fdGhpc2hhcnRfcHRyKCk7Cj4gPiA+
ID4gPiArICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybV9vcGVyYXRpb25z
ICpvcHMgPSBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpOwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAg
IGV4dGVybiB2b2lkIF90cmFwX3JubWlfaGFuZGxlcih2b2lkKTsKPiA+ID4gPiA+ICsgICAgICAg
ICAgICAgICBleHRlcm4gdm9pZCBfdHJhcF9oYW5kbGVyKHZvaWQpOwo+ID4gPiA+ID4gKwo+ID4g
PiA+ID4gKyAgICAgICAgICAgICAgIGlmICghb3BzIHx8ICFvcHMtPnNtcm5taV9oYW5kbGVyc19p
bml0KQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3BhbmljKCJTbXJubWkg
ZGV0ZWN0ZWQsIGJ1dCBwbGF0Zm9ybSBsYWNrcyBzbXJubWlfaGFuZGxlcnNfaW5pdCBjYWxsYmFj
a1xuIik7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgLyogUmV1c2UgX3Ry
YXBfaGFuZGxlciBmb3IgdGhlIFJOTUUgc2xvdCBzaW5jZSBSTk1FIGlzIHRha2VuCj4gPiA+ID4g
PiArICAgICAgICAgICAgICAgICogYXMgYSByZWd1bGFyIE0tbW9kZSB0cmFwIHdpdGggTk1JRT0w
LiAqLwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIG9wcy0+c21ybm1pX2hhbmRsZXJzX2luaXQo
X3RyYXBfcm5taV9oYW5kbGVyLCBfdHJhcF9oYW5kbGVyKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAvKiBJbml0aWFsaXplIE1OU0NSQVRDSCBmb3IgdGhlIFJOTUkgaGFu
ZGxlciAqLwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTU5TQ1JBVENI
LCBzY3JhdGNoKTsKPiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAvKiBFbmFi
bGUgTk1JcyAqLwo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIGNzcl9zZXQoQ1NSX01OU1RBVFVT
LCBNTlNUQVRVU19OTUlFKTsKPiA+ID4gVHdvIGNvbmNlcm5zIGFib3V0IHRoaXMgYmxvY2sKPiA+
ID4KPiA+ID4gRmlyc3QsIHNiaV9wYW5pYygpIHdoZW4gc21ybm1pX2hhbmRsZXJzX2luaXQgaXMg
TlVMTCBpcyB0b28gc3RyaWN0Lgo+ID4gPiBOb3QgYWxsIHBsYXRmb3JtcyB3aXRoIFNtcm5taSBu
ZWVkIHRvIHByb2dyYW0gYSB2ZW5kb3Itc3BlY2lmaWMgTk1JCj4gPiA+IHZlY3RvciByZWdpc3Rl
ci4KPiA+ID4gU29tZSBpbXBsZW1lbnRhdGlvbnMgaGF2ZSBhIGZpeGVkIE5NSSB2ZWN0b3IgYWRk
cmVzcyBvciByb3V0ZSBOTUlzCj4gPiA+IHRocm91Z2ggbXR2ZWMgYnkgZGVmYXVsdDsgZm9yIHRo
ZXNlLCBzZXR0aW5nIE1OU0NSQVRDSCBhbmQgTk1JRSBpcwo+ID4gPiBzdWZmaWNpZW50IGFuZCBu
byBwbGF0Zm9ybSBjYWxsYmFjayBpcyBuZWVkZWQuCj4gPiA+Cj4gPiA+IFRoaXMgY2FuIGJlIHJl
cHJvZHVjZWQgd2l0aCBRRU1VIHZpcnQ6Cj4gPiA+Cj4gPiA+IHFlbXUtc3lzdGVtLXJpc2N2NjQg
LU0gdmlydCAtY3B1IHJ2NjQsc21ybm1pPW9uIC1tIDI1Nm0gXAo+ID4gPiAgICAgICAtYmlvcyBm
d19qdW1wLmJpbiAtbm9ncmFwaGljIC1uby1yZWJvb3QKPiA+ID4KPiA+ID4gVGhlIGZpcm13YXJl
IGhhbmdzIHdpdGggemVybyBvdXRwdXQuIFRoZSBwYW5pYyBmaXJlcyBiZWZvcmUKPiA+ID4gc2Jp
X3BsYXRmb3JtX2Vhcmx5X2luaXQoKSBzbyB0aGUgY29uc29sZSBpcyBub3QgeWV0IGluaXRpYWxp
emVkIGFuZAo+ID4gPiB0aGUgbWVzc2FnZSBpcyBzaWxlbnRseSBkcm9wcGVkLgo+ID4gPgo+ID4g
PiBBZGRpbmcgYSBuby1vcCBzdHViIHRvIHRoZSBnZW5lcmljIHBsYXRmb3JtIGNvbmZpcm1zIHRo
ZSBwYW5pYyBpcyAgdGhlCj4gPiA+IHNvbGUgY2F1c2UgLS0gYm9vdCBwcm9jZWVkcyBub3JtYWxs
eSB3aXRoIHRoZSBzdHViIGluIHBsYWNlLgo+ID4gPgo+ID4gPiBTZWNvbmQsIHRoZSBjYWxsYmFj
ayByZXR1cm5zIHZvaWQsIHNvIHRoZXJlIGlzIG5vIHdheSB0byBkZXRlY3QKPiA+ID4gd2hldGhl
ciB0aGUgcGxhdGZvcm0gc3VjY2VlZGVkIGluIHByb2dyYW1taW5nIHRoZSBOTUkgdmVjdG9yLgo+
ID4gPiBjc3Jfc2V0KE1OU1RBVFVTLCBOTUlFKSB0aGVuIHJ1bnMgdW5jb25kaXRpb25hbGx5Lgo+
ID4gPiBJZiB0aGUgY2FsbGJhY2sgZmFpbHMgc2lsZW50bHksIE5NSXMgYXJlIGVuYWJsZWQgYnV0
IHRoZSBoYXJkd2FyZQo+ID4gPiB2ZWN0b3IgcmVnaXN0ZXIgaXMgbGVmdCBhdCBpdHMgcmVzZXQg
dmFsdWUuIFRoZSBmaXJzdCBOTUkgd291bGQganVtcAo+ID4gPiB0byBhbiB1bmRlZmluZWQgYWRk
cmVzcy4KPiA+ID4KPiA+ID4gU3VnZ2VzdGVkIGZpeDoKPiA+ID4KPiA+ID4gLyogYWxsb3cgTlVM
TDogcGxhdGZvcm1zIHdpdGggZml4ZWQgb3IgbXR2ZWMtYmFzZWQgTk1JIHZlY3RvcnMKPiA+ID4g
KiBkbyBub3QgbmVlZCB0byBwcm9ncmFtIGFueSB2ZW5kb3IgcmVnaXN0ZXIgKi8KPiA+ID4gaWYg
KG9wcyAmJiBvcHMtPnNtcm5taV9oYW5kbGVyc19pbml0KSB7Cj4gPiA+ICAgICAgICAgaW50IHJl
dCA9IG9wcy0+c21ybm1pX2hhbmRsZXJzX2luaXQoX3RyYXBfcm5taV9oYW5kbGVyLAo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF90cmFwX2hhbmRsZXIp
Owo+ID4gPiAgICAgICAgIGlmIChyZXQpCj4gPiA+ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4g
PiA+IH0KPiA+ID4KPiA+ID4gY3NyX3dyaXRlKENTUl9NTlNDUkFUQ0gsIHNjcmF0Y2gpOwo+ID4g
PiBjc3Jfc2V0KENTUl9NTlNUQVRVUywgTU5TVEFUVVNfTk1JRSk7Cj4gPiA+Cj4gPiA+IFRoaXMg
cmVxdWlyZXMgY2hhbmdpbmcgdGhlIGNhbGxiYWNrIHNpZ25hdHVyZSBmcm9tIHZvaWQgdG8gaW50
Lgo+ID4gPgo+ID4gPiBQbGF0Zm9ybXMgdGhhdCBoYXZlIG5vdGhpbmcgdG8gcHJvZ3JhbSByZXR1
cm4gMCwgcGxhdGZvcm1zIHRoYXQgZmFpbAo+ID4gPiByZXR1cm4gYW4gZXJyb3IsIGFuZCBwbGF0
Zm9ybXMgd2l0aCBubyBjYWxsYmFjayBhdCBhbGwgYXJlIGhhbmRsZWQKPiA+ID4gZ3JhY2VmdWxs
eSB3aXRob3V0IGEgcGFuaWMuCj4gPiA+Cj4gPgo+ID4gUGxlYXNlIHNlbmQgYSBwYXRjaCB3aXRo
IGFwcHJvcHJpYXRlIEZpeGVzIHRhZy4KPiBXaWxsIGRvLgo+Cj4gV2hpbGUgcHJlcGFyaW5nIHRo
ZSBwYXRjaCwgSSBhbHNvIG5vdGljZWQgdGhlIHNlcmllcyBpcyBtaXNzaW5nCj4gbm9uLXJldGVu
dGl2ZSBzdXNwZW5kL3Jlc3VtZSBoYW5kbGluZyBmb3IgQ1NSX01OU0NSQVRDSCBhbmQKPiAgIE1O
U1RBVFVTLk5NSUUuCj4KPiBBZnRlciBub24tcmV0ZW50aXZlIHN1c3BlbmQsIHRoZSBoYXJ0IGlz
IGZ1bGx5IHBvd2VyZWQgb2ZmIGFuZCBhbGwgQ1NSCj4gc3RhdGUgaXMgcmVzZXQuCj4KPiBPbiBy
ZXN1bWUsIHNiaV9oc21faGFydF9yZXN1bWVfZmluaXNoKCkgY2FsbHMKPiBfX3NiaV9oc21fc3Vz
cGVuZF9ub25fcmV0X3Jlc3RvcmUoKSBhbmQganVtcHMgZGlyZWN0bHkgdG8gdGhlIGtlcm5lbAo+
IHdpdGhvdXQgZ29pbmcgdGhyb3VnaCBzYmlfaGFydF9pbml0KCksIHNvIHRoZSBTbXJubWkgQ1NS
cyBzZXQgdXAgaW4KPiBoYXJ0X2RldGVjdF9mZWF0dXJlcygpIGFyZSBuZXZlciByZS1pbml0aWFs
aXplZC4KCkkgdGhpbmsgU21ybm1pIGluIGhhcnRfZGV0ZWN0X2ZlYXR1cmVzKCkgc2hvdWxkIGJl
IG1vdmVkIHRvIGEKc2VwYXJhdGUgZnVuY3Rpb24gd2hpY2ggc2hvdWxkIGJlIGNhbGxlZCBmcm9t
IHR3byBwbGFjZXM6CjEpIEF0IHRoZSBjdXJyZW50IGxvY2F0aW9uIGZyb20gaGFydF9kZXRlY3Rf
ZmVhdHVyZXMoKSBiZWZvcmUKd2UgdXNlIHRyYXAtYmFzZWQgZXh0ZW5zaW9uIGRldGVjdGlvbgoy
KSBJbiBzYmlfaGFydF9pbml0KCkgZm9yIGJvdGggY29sZCBib290IGFuZCB3YXJtIGJvb3QgcGF0
aAoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
