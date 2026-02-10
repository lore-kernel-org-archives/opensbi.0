Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F7CEB26E8
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 16:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NaOw17EC4oXj3aNOESA46U3j0Ut5HhvEUJLCKyS1tpc=; b=E7FjWAtGMUgVhx
	PL/ms3Jnl5R/buU7NJBnyh4HgmrTjmLY/K06N9Rh4oqwb55v87xOJ/lQLpPRvUSK4pmXzekBrZz8t
	X+m6tWXGdVhZ0LMta5nN8X9ZdPfUJcpjpjgZ7gkXcYr4sGAQlKhXo1lDZXx9OBV3uZ/cVdyNWX72x
	LhLGrvOtg28GpmISP0jwsIZfqbHO2/KTI1k+vdCtd+T4Ty+bUJ3yETjijlHHKns4j8QCgHKSaPN1+
	9vjnoEV7Snkb03cfyvtoqLfQijZqXaJoY+H44S0p8LrmjXkFPmH5gsUbm/r8OZq7Rk2j4Tg+h63w+
	o5zPuvU+DtPHwNf2zNeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqlq-0000000HFmv-3rnC;
	Tue, 10 Feb 2026 16:39:26 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqlo-0000000HFmO-0Qgi
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 16:39:25 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-662f2fa7e67so1548558eaf.1
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 08:39:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770741562; cv=none;
        d=google.com; s=arc-20240605;
        b=gEpxINa0z440cEn5sYdRWH1RKKnyfSMZCrplDmo5ekmIpXI1xpylYlSM9a77tPJmpU
         S00fhOR5M0dMB0yPkH0A1tTUcNmmcWgtaUXM+NE8zHOjU2r0RyiC5f99MBa6IyPFN5DE
         b48cXbZf3WZM4gvdMjtSWnm7B9vSnmRrovzvn/a8Iiimj/ZszwUWNXPqA3OMEN9Sw/ap
         qi18PVIaHrH/gPtKzYiT+9Swg8wcVcp3NHkyepKsKzqzpsxkPX/vNrpczYWYbbmYHnIp
         L2LvmBrvz+oOYF9sS04aVdW5IxDZO4Uo94+4w5MEAYn+imFbyFovuSupXcVMKH84D3HN
         6ckQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0Ywnrr1QAAucwXmCgmahAEn10W1RWvvuJyRaB7R4EHU=;
        fh=UVGqT16s2aDxbANSkGRoIAze6BrfuDGRdbGoxiWTYhw=;
        b=it9zbChpY6iJ4CV5Tn9PcbK6te/QTEAqPxjimXlh8awfG5c5UTdOg915AKVuaBmx8b
         lOMJm0YHm0X/jznR0xuGTWitg3tW70/yRd9SdzGG40Gtf/L21KoOU6gmoa6YVtGC87+r
         Cm+Hbat2/o8ReL7GT8iqiO2dvjFnFkgp8IY8HJBDIMDoDAGmGuHe5GoblSvS40JR1snu
         qphP43qzkMDIjlS1lcy9VxdYyz8ttZXCnjnV6NPPHY8zvkoKmCE2feq+6Vevf/rZ9k8J
         pSORp31PQVXPB6JzJO8et1LqddLhEAVqJAntmJNaYzW6L1Lb/T9c9k5OhYviOgucUhtm
         /o0A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770741562; x=1771346362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Ywnrr1QAAucwXmCgmahAEn10W1RWvvuJyRaB7R4EHU=;
        b=kCS15lkD6EV8+hTb7VQzkWD+OL7xXjbaWDzcH2kTMGmel/Q312RgHOWcpn6jEsGGnf
         +z6H/8erXu97lLfB8qDs80n2zyRsDcr3t6mgfURbkfEoSBjHUdZzGvHv7jRQvQt7sYoq
         zN+loZcARit+opqTKM9LF6twmcGWUswafr09ak9zhMn4DEheh6VsmnomMzkX7Pr3lbSM
         JdYj40pLnu6E31LZRYBZf/ZodNJtCCpCKKX4MJ4qI0kGEEHCKrxMh9SOXxYlEUPy8uKM
         5TdOUUqT28jMV82USJnleyAL0Qt9Ty8lLIYoGET+P2yps+GSD89nq5lF9SEz8aYiuXqt
         CbHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770741562; x=1771346362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0Ywnrr1QAAucwXmCgmahAEn10W1RWvvuJyRaB7R4EHU=;
        b=YChq6IfklfViKvOwernUCAWoFmKZtMOOdIIcGKWlSTZoGY1QR/PjhnqKU+CGyM4fgS
         MVb0VlOQ0+ysm7QhgDrIqYYzR2wO/DlRFm4+nKTkld4bple6HsiBk+zkrXSMHdvWptwV
         v4FbxIx2nJHtRdT1XGTjs1nHwu337Kww7wubrURuf3HZRGJYwvKpwpwaetr4sgL/GZH5
         7UH9Lh6WbWdL4TgaPny2LQW9lhsg+1Qvp48QsC7uOlOoC5ShSfkosMZrjrm1tSvcqEUV
         U3y0Gd2aDce/+DnAXHT+gUpbVuUE9wnWLVH1kNtz8RnbBFLnQjXfYL1mZQBMgwNJ/teB
         2BzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUx6NO3BNg12un/fU3nmNpJnSBnPkM1kIC36TUzVXFaXJqHI+myN68llawKy+4ww783sB63P8if@lists.infradead.org
X-Gm-Message-State: AOJu0YzKAB5erHU0qhXAjj6Z9xLo4W1u+huYAXpFZxfqN58sBiUsNVrJ
	v1buuvjyBxgLuyw4c21vZtyryiQyUzh4zE3iAesMM179QLy+8xz6+OJJ1A3cdepAfXQIImWzDZL
	VplfW2FkN8+/Cj1ztHrebig3b7ELEWPJQwo6RpMvvVQ==
X-Gm-Gg: AZuq6aJ+TPi4GRUsK+W47i9zZ13Act5VyZa0Ie+0NV6YwDPzOJxPPc0oxx6sg0u3d8U
	WVaFPax0oTfhaeZUScF6XGM33SVSM2KBQc4N50FX3WEYdkKyqUgLuRMb8/pSiug+T1Fanp9mmMG
	LObjVihocwStxlVTqxJ051+Q4yxQGjiWP42IEZvcDJ2OaGSLfJY12oDXW39LGJQRm5plqnv6LDQ
	QFveo0hXsehRlttleTvC/IsYOjXFFC8oNPc1+s6nppRRcXBY68gyLzT3cTkOyZit5BHcDmEUZm6
	3qX8K29iqytu44Fh++KFuiNHcQNpv4634DTpvol2F59AdWcnCjim13URyn7UgUWOmf88Ww0=
X-Received: by 2002:a05:6820:480c:b0:662:ede7:fdaa with SMTP id
 006d021491bc7-67300db996emr755257eaf.74.1770741562409; Tue, 10 Feb 2026
 08:39:22 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-9-anup.patel@oss.qualcomm.com> <CAMkFH19feRsme6Mfr1vQ7hSnr2yhFMivNpGkwfTT2uSV3ojnjg@mail.gmail.com>
In-Reply-To: <CAMkFH19feRsme6Mfr1vQ7hSnr2yhFMivNpGkwfTT2uSV3ojnjg@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 10 Feb 2026 22:09:10 +0530
X-Gm-Features: AZwV_QiikqFbyU2AcBPKSXqJ46GmuEWO30V5qbmpTFAG74aA7FPxfcoQU0CJUFk
Message-ID: <CAAhSdy0JsxWANTmoz51n7Z=6x+1TofuY5GPoCWEDvwp=JZvZQQ@mail.gmail.com>
Subject: Re: [PATCH 8/8] lib: sbi_irqchip: Allow registering interrupt handlers
To: Ray Mao <raymond.mao@riscstar.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Dave Patel <dave.patel@riscstar.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_083924_151614_DA6350A6 
X-CRM114-Status: GOOD (  16.24  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMTI6MjnigK9BTSBSYXkgTWFvIDxyYXltb25kLm1hb0By
aXNjc3Rhci5jb20+IHdyb3RlOgo+Cj4gSGkgQW51cCwKPgo+IE9uIFNhdCwgRmViIDcsIDIwMjYg
YXQgNToyNuKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4gd3Jv
dGU6Cj4+Cj4+IFRvIGhhbmRsZSBleHRlcm5hbCBpbnRlcnJ1cHRzIGluIE0tbW9kZSwgdGhlIHNi
aV9pcnFjaGlwIGZyYW1ld29yawo+PiBtdXN0IGFsbG93IHJlZ2lzdGVyaW5nIGludGVycnVwdCBo
YW5kbGVycyBmcm9tIGRldmljZSBkcml2ZXJzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBBbnVwIFBh
dGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+Cj4+IC0tLQo+PiAgaW5jbHVkZS9zYmkv
c2JpX2lycWNoaXAuaCB8ICA1NiArKysrKysrKysrLQo+PiAgbGliL3NiaS9zYmlfaXJxY2hpcC5j
ICAgICB8IDIwMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+PiAgbGli
L3V0aWxzL2lycWNoaXAvYXBsaWMuYyB8ICAgMSArCj4+ICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNp
Yy5jIHwgICA5ICsrCj4+ICBsaWIvdXRpbHMvaXJxY2hpcC9wbGljLmMgIHwgICAxICsKPj4gIDUg
ZmlsZXMgY2hhbmdlZCwgMjY3IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4+Cj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfaXJxY2hpcC5oIGIvaW5jbHVkZS9zYmkvc2JpX2ly
cWNoaXAuaAo+PiBpbmRleCBkMmM0N2FlOC4uNzdiNTQxMTAgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1
ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaAo+
PiBAQCAtMTgsMTIgKzE4LDIxIEBAIHN0cnVjdCBzYmlfc2NyYXRjaDsKPj4KPj4gIC8qKiBpcnFj
aGlwIGhhcmR3YXJlIGRldmljZSAqLwo+PiAgc3RydWN0IHNiaV9pcnFjaGlwX2RldmljZSB7Cj4+
IC0gICAgICAgLyoqIE5vZGUgaW4gdGhlIGxpc3Qgb2YgaXJxY2hpcCBkZXZpY2VzICovCj4+ICsg
ICAgICAgLyoqIE5vZGUgaW4gdGhlIGxpc3Qgb2YgaXJxY2hpcCBkZXZpY2VzIChwcml2YXRlKSAq
Lwo+PiAgICAgICAgIHN0cnVjdCBzYmlfZGxpc3Qgbm9kZTsKPj4KPj4gKyAgICAgICAvKiogSW50
ZXJuYWwgZGF0YSBvZiBhbGwgaGFyZHdhcmUgaW50ZXJydXB0cyBvZiB0aGlzIGlycWNoaXAgKHBy
aXZhdGUpICovCj4+ICsgICAgICAgc3RydWN0IHNiaV9pcnFjaGlwX2h3aXJxX2RhdGEgKmh3aXJx
czsKPj4gKwo+PiArICAgICAgIC8qKiBMaXN0IG9mIGludGVycnVwdCBoYW5kbGVycyAqLwo+PiAr
ICAgICAgIHN0cnVjdCBzYmlfZGxpc3QgaGFuZGxlcl9saXN0Owo+PiArCj4+ICAgICAgICAgLyoq
IFVuaXF1ZSBJRCBvZiB0aGlzIGlycWNoaXAgKi8KPj4gICAgICAgICB1MzIgaWQ7Cj4+Cj4+ICsg
ICAgICAgLyoqIE51bWJlciBvZiBoYXJkd2FyZSBJUlFzIG9mIHRoaXMgaXJxY2hpcCAqLwo+PiAr
ICAgICAgIHUzMiBudW1faHdpcnE7Cj4+ICsKPj4gICAgICAgICAvKiogU2V0IG9mIGhhcnRzIHRh
cmdldHRlZCBieSB0aGlzIGlycWNoaXAgKi8KPj4gICAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNr
IHRhcmdldF9oYXJ0czsKPj4KPj4gQEAgLTMyLDYgKzQxLDIxIEBAIHN0cnVjdCBzYmlfaXJxY2hp
cF9kZXZpY2Ugewo+Pgo+PiAgICAgICAgIC8qKiBQcm9jZXNzIGhhcmR3YXJlIGludGVycnVwdHMg
ZnJvbSB0aGlzIGlycWNoaXAgKi8KPj4gICAgICAgICBpbnQgKCpwcm9jZXNzX2h3aXJxcykoc3Ry
dWN0IHNiaV9pcnFjaGlwX2RldmljZSAqY2hpcCk7Cj4+ICsKPj4gKyAgICAgICAvKiogU2V0dXAg
YSBoYXJkd2FyZSBpbnRlcnJ1cHQgb2YgdGhpcyBpcnFjaGlwICovCj4+ICsgICAgICAgaW50ICgq
aHdpcnFfc2V0dXApKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXAsIHUzMiBod2lycSk7
Cj4+ICsKPj4gKyAgICAgICAvKiogQ2xlYW51cCBhIGhhcmR3YXJlIGludGVycnVwdCBvZiB0aGlz
IGlycWNoaXAgKi8KPj4gKyAgICAgICB2b2lkICgqaHdpcnFfY2xlYW51cCkoc3RydWN0IHNiaV9p
cnFjaGlwX2RldmljZSAqY2hpcCwgdTMyIGh3aXJxKTsKPj4gKwo+PiArICAgICAgIC8qKiBFbmQg
b2YgaGFyZHdhcmUgaW50ZXJydXB0IG9mIHRoaXMgaXJxY2hpcCAqLwo+PiArICAgICAgIHZvaWQg
KCpod2lycV9lb2kpKHN0cnVjdCBzYmlfaXJxY2hpcF9kZXZpY2UgKmNoaXAsIHUzMiBod2lycSk7
Cj4KPgo+IElmIGh3aXJxX2VvaSgpIGlzIGFuIGVxdWl2YWxlbnQgb2YgY2xhaW0oKSwgdGhlbiBo
d2lycSBzaG91bGQgYmUgYSBwb2ludGVyIG9mIG1lbW9yeSwgc2luY2Ugd2UgbmVlZCB0byByZWFk
IGFuZCByZXR1cm4gdGhlIElEQ19UT1BJX0lEIGZyb20gQ0xBSU1JLgo+CgpJIHRoaW5rIHRoZSBl
eHRlcm5hbCBpbnRlcnJ1cHQgaGFuZGxpbmcgZmxvdyBpcyBub3QgY2xlYXIKdG8geW91IGJ1dCBs
ZXQgbWUgdHJ5IHRvIGV4cGxhaW4uCgpXaGVuZXZlciBhIGhhcnQgcmVjZWl2ZXMgZXh0ZXJuYWwg
aW50ZXJydXB0OgoKMSkgVGhlIHNiaV90cmFwX2hhbmRsZXIoKSBpcyBjYWxsZWQgYnkgbG93LWxl
dmVsIGhhbmRsZXIKd2hpY2ggaW4tdHVybiBjYWxscyBzYmlfaXJxY2hpcF9wcm9jZXNzKCkKMikg
VGhlIHNiaV9pcnFjaGlwX3Byb2Nlc3MoKSB3aWxsIGluLXR1cm4gY2FsbApwcm9jZXNzX2h3aXJx
cygpIG9mIGFwcHJvcHJpYXRlIGRyaXZlcgozKSBUaGUgcHJvY2Vzc19od2lycXMoKSBpbi1jYXNl
IG9mIEFQTElDCmRpcmVjdC1tb2RlIHdpbGwgdXNlIElEQ19UT1BJX0lEIHRvIGRldGVybWluZQpo
d2lycSBudW1iZXIgYW5kIGNhbGwgc2JpX2lycWNoaXBfcHJvY2Vzc19od2lycSgpCnRvIGhhbmRs
ZSBpdC4KCklmIHdlIGhhdmUgbmVzdGVkIGlycWNoaXAgc3VjaCBhcyBJTVNJQytBUExJQwp0aGVu
IHByb2Nlc3NfaHdpcnFzKCkgd2lsbCBiZSBpbXBsZW1lbnRlZCBieSBJTVNJQwp3aGVyZWFzIEFQ
TElDIHdpbGwgdXNlIHNiaV9pcnFjaGlwX3JlcXVlc3RfaGFuZGxlcigpCnRvIHJlZ2lzdGVyIGNh
bGxiYWNrIGZvciBJTVNJQyBod2lycXMuIFRoaXMgbWVhbnMKc2JpX2lycWNoaXBfcHJvY2Vzcygp
IHdpbGwgY2FsbCBwcm9jZXNzX2h3aXJxcygpIG9mCklNU0lDIGFuZCBJTVNJQyB3aWxsIGNhbGwg
QVBMSUMgaW50ZXJydXB0IGhhbmRsZXIKdmlhIHNiaV9pcnFjaGlwX3Byb2Nlc3NfaHdpcnEoKSB3
aGVyZWFzIHRoZSBBUExJQwppbnRlcnJ1cHQgaGFuZGxlciB3aWxsIGFnYWluIGNhbGwgc2JpX2ly
cWNoaXBfcHJvY2Vzc19od2lycSgpLgoKSW4gb3RoZXIgd29yZHMsIHdlIGNhbiBzdXBwb3J0IGFu
eSBpcnFjaGlwIHRvcG9sb2d5LgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
