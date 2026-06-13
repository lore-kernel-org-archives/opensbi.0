Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25571CD8CA8
	for <opensbi@archiver.kernel.org>; Sat, 13 Jun 2026 10:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ho02lLZA9CnR3IjZKf17ZHcg3NE4XFKeFACmAWit1SA=; b=IHrBs2YEWdQqZH
	swSPC570Zug1SEmujPG5PYmKRnGrQUXrkr+c3JR6zRL9O+hvBjeO/9oExf6OIc/FVjfW3S1JAnPdS
	mBitHRRrX5UxxAl/GkenOMDZIu7bSuzmsuzL3H6ra/abPN6k42rUx85KN5BfTKJvLimZRYMXL+rMz
	lmLrFmjytfAxKkc0J/BS6y+awJ9OvdAJf7aG/CS1CO+cqMauHVPMWbUGqVWY/x4vsAuObDDyGLGhe
	4u5PNRGjjYi/onEpbr1YPwkVvfdXSwrQgiq2W5KMuFH4E9A4Wh4JSdTHgJp2au3ensU1S6Zl+uJH0
	e+zISG89qxZe1+JOHKHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLDD-0000000CA0V-3sqo;
	Sat, 13 Jun 2026 10:03:35 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYLDB-0000000C9zn-3mO8
	for opensbi@lists.infradead.org;
	Sat, 13 Jun 2026 10:03:35 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-39677c80386so17192021fa.3
        for <opensbi@lists.infradead.org>; Sat, 13 Jun 2026 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781345011; cv=none;
        d=google.com; s=arc-20240605;
        b=S/ToUCA/fPtWRb2JahQ4zV2cEKczrB3kK9Xp+bTDeuIJs4WmJnbHDiejR51hyl5dWS
         AVOIGStPw6u6/kxosSc3ZPYEMlsFX73C7jqdUKDyU9MvJ2h+XvyqGXhOgqQ1M6Faxjiu
         EgLyZVH5momXTDtRoFvAtZE/oIFsyHDpMjhcDdyujoeAl4UkD/p5DN2zENtSHs0vEvXF
         kqTqOnCEEFhOg591x6NYy61YHOtlflw/SqzENNN4vw8ptTY7yuRQsPiNLat/TI3F+/+e
         Xk8Qdw0rn0qulpV6caZIyNMM7s+oxZve63hS+hyoFnoqcqxVbUqgOCLk1QbRtLfHJlXK
         Agog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1C4tmey9qGO11k+xTtjRJiJrcS2TuzoAkDp+gFRV3k=;
        fh=NjevY/m7Q9KAS7JiyFjhxyyOgMAaVByFcHikHD9HL9k=;
        b=hU7EhYw7OThT1TMtStZ75c45iSHE1RUS2ciq1TaykHOEO/t7LQAAT4gTyr3dvy3FZ7
         YrrlHsQk1PtaRktPnbo6pqUw5rm6O2NXyJUaTrNLdsWf5/YeeSHnEOZ6dxdS7EMS0BRa
         +PgzbEf3ZNJFRI/PgkV0CcPKUV52mLhn+KazQuJqb6sH4h6AKsjuCTJ6L754rF3j2ejy
         evqCnzcxuxoJq7GFYtY9OjaQJUdUHFeSvVL8dm2GKeEOCbOyQJa2GiqkDweP7+SquCDl
         WPsr0rjWz0q0C8sFxHm/n6rc+ttiskW2Z0Bu36bi1iWw0woqujesmzQMwjUcM6sWj3cE
         aSWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1781345011; x=1781949811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t1C4tmey9qGO11k+xTtjRJiJrcS2TuzoAkDp+gFRV3k=;
        b=PK66MbVO28k1hHEmP1RLSCzoBHW8Rc79KIPkKDFpux22L86FPeJYG2ehK+AueGmPD0
         XFOlyPSxAXP9QciapqORLUVQHdpAWkd2tayMMBuTOcKi5+0qe0HYgskZdG1nQEOU1Huk
         unmm0jXeoSgMxvk5XpjTPupGWs5D7NVEoj0A5t6xhbND6NHcLzF0lPP9guSQ1mNdfKIb
         4ykDtSYCzHEtnJ8eiToo3x9O24LymkN6jasA0jPvbzSC0I0+f3Z/Df8S8xi4lxVrJhyW
         +E12MjMotSOa7J/bVDLCuy10u3rkGDIoyZg6sz+axvJog1vxliuaxWatbOSX64vu0BC5
         JjkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781345011; x=1781949811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t1C4tmey9qGO11k+xTtjRJiJrcS2TuzoAkDp+gFRV3k=;
        b=mSXBu/NFO/97UU+3TXw9djI1CnqvsVnMeCzger5CfGH6TCcP7EWv2hJCng0WOWuq+8
         lSDmmbC70rwYXbiqy0I2/idcL+uj/lLfZzmPa7HFmISA6B7G1OVfi3G2x6zVDrjEVDbX
         7L9VFNz28OrSV6yjl7POd9ocQJRUhokAxgHy+Zd3tLJBX6ufW+AVxD1YxaAxyselNAEK
         FO5SPP92SbqlU3RTvZQCr0oJKm2m6kXLtBPJbiNfbpBmF++eLjwm1GftyKINOkZZt2Xk
         bi7VI/hGQPOFD4ICwSTbxFyLjTQkaHCwI7P6bJV7U8G3p+KvcUT1UnIZMAJVR6NC8A+V
         yKAw==
X-Gm-Message-State: AOJu0Yyodbq9vG5hGms2ybzg4WxaANAWyE40FVuFgrrRuMtLKx9iM7YB
	Wmdny1CNHu2T+nnq9/XxqFhhywsQ1EKAg1LaKpwRhePGJhy7rMSzPkLjvpQRd9MO0QjmTzKCDkM
	Pk5ggCJQsVDlY5SI4GSkVNC6iC+mAWvjVcm3WXzN62Q==
X-Gm-Gg: Acq92OEaTRy0SvJSM5BbdThYkiPmKBeHbcySxpPZ0dcfEJnpENSIVMu0HjimAvCjVBW
	7Nk8gLU+hL+/b1GghS9IRyUr9DCoB+aVQTtOhskV7RHPrDSqow8yqKNGbI2Ubr01ile+x9Q67mT
	9pd68LpJDkhsV+IWZ0OZQfWVAkd+3V8caY+fEY1yRWLNTlVexS5HRMeMuczyG79sBrLELQnifck
	jt9omFXcPaT86Gj2Wrws0X1uWS4f1wD7/tdYwRWEpD93X/4NLXnkVz9aRVvCYEVl4IZh4UP8GSy
	tBFi2KvJ0pWbfg0VmOH0XKtmwEASY0ilSqyO89b08g==
X-Received: by 2002:a05:651c:1511:b0:38b:f632:e0fc with SMTP id
 38308e7fff4ca-3992af7cea4mr20698911fa.1.1781345010498; Sat, 13 Jun 2026
 03:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260522-fw_rw_start_alignment-v1-1-362c17331541@oss.tenstorrent.com>
In-Reply-To: <20260522-fw_rw_start_alignment-v1-1-362c17331541@oss.tenstorrent.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 13 Jun 2026 15:33:19 +0530
X-Gm-Features: AVVi8CfBQHHz4bJB9iE0ru41Fch8j0njTWyNv8GsT6hy4E5rvsQo-A_0K0BO41M
Message-ID: <CAK9=C2XFeNUFXYJcWzGmtG+XM993cw206xCuPTPU2m_0dpHZ7g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Drop fw_rw_offset alignment requirement for
 single fw region
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: opensbi@lists.infradead.org, Nicholas Piggin <npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_030333_979576_8CA3A3B6 
X-CRM114-Status: GOOD (  21.14  )
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

T24gU2F0LCBNYXkgMjMsIDIwMjYgYXQgNDo1N+KAr0FNIEFuaXJ1ZGggU3Jpbml2YXNhbgo8YXNy
aW5pdmFzYW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBOaWNob2xhcyBQ
aWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgo+Cj4gSW4gYSBzaW5nbGUgZncgcmVnaW9uIHNjaGVt
ZSwgdGhlcmUgaXMgbm8gc2VwYXJhdGUgUE1QIGNyZWF0ZWQgZm9yIFJXCj4gbWVtb3J5LiBUaGUg
Y2hlY2tzIHRoYXQgb3BlbnNiaSBkb2VzIGZvciB0aGUgYWxpZ25tZW50IGJldHdlZW4gZndfc3Rh
cnQKPiBhbmQgZndfcndfc3RhcnQgKHVzaW5nIGZ3X3J3X29mZnNldCkgYW5kIHRoZSBwb3dlciBv
ZiAyIGNoZWNrIGZvcgo+IGZ3X3J3X29mZnNldCBhcmUgbm8gbG9uZ2VyIG5lY2Vzc2FyeS4KPgo+
IFVwZGF0ZSBzYmlfZG9tYWluX2luaXQgc28gdGhhdCB0aGVzZSBjaGVja3MgYXJlIG9ubHkgZG9u
ZSBpbiB0aGUgbm9uCj4gc2luZ2xlIGZ3IHJlZ2lvbiBzY2hlbWUuCj4KPiBTaWduZWQtb2ZmLWJ5
OiBOaWNob2xhcyBQaWdnaW4gPG5waWdnaW5AZ21haWwuY29tPgo+IENvLWRldmVsb3BlZC1ieTog
QW5pcnVkaCBTcmluaXZhc2FuIDxhc3Jpbml2YXNhbkBvc3MudGVuc3RvcnJlbnQuY29tPgo+IFNp
Z25lZC1vZmYtYnk6IEFuaXJ1ZGggU3Jpbml2YXNhbiA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3Jy
ZW50LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhh
bmtzLApBbnVwCgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9kb21haW4uYyB8IDI3ICsrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTIg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIv
c2JpL3NiaV9kb21haW4uYwo+IGluZGV4IDRmNDU4YWMwLi4yOTZlZTgxYiAxMDA2NDQKPiAtLS0g
YS9saWIvc2JpL3NiaV9kb21haW4uYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCj4gQEAg
LTg3MSwyMCArODcxLDIzIEBAIGludCBzYmlfZG9tYWluX2luaXQoc3RydWN0IHNiaV9zY3JhdGNo
ICpzY3JhdGNoLCB1MzIgY29sZF9oYXJ0aWQpCj4gICAgICAgICBzdHJ1Y3Qgc2JpX2hhcnRtYXNr
ICpyb290X2htYXNrOwo+ICAgICAgICAgc3RydWN0IHNiaV9kb21haW5fbWVtcmVnaW9uICpyb290
X21lbXJlZ3M7Cj4gICAgICAgICBpbnQgcm9vdF9tZW1yZWdzX2NvdW50ID0gMDsKPiArICAgICAg
IGNvbnN0IHN0cnVjdCBzYmlfcGxhdGZvcm0gKnBsYXQgPSBzYmlfcGxhdGZvcm1fcHRyKHNjcmF0
Y2gpOwo+ICsgICAgICAgYm9vbCBmd19zaW5nbGVfcmVnaW9uID0gc2JpX3BsYXRmb3JtX3Npbmds
ZV9md19yZWdpb24ocGxhdCk7Cj4KPiAgICAgICAgIFNCSV9JTklUX0xJU1RfSEVBRCgmZG9tYWlu
X2xpc3QpOwo+Cj4gLSAgICAgICBpZiAoc2NyYXRjaC0+Zndfcndfb2Zmc2V0ID09IDAgfHwKPiAt
ICAgICAgICAgICAoc2NyYXRjaC0+Zndfcndfb2Zmc2V0ICYgKHNjcmF0Y2gtPmZ3X3J3X29mZnNl
dCAtIDEpKSAhPSAwKSB7Cj4gLSAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBmd19yd19v
ZmZzZXQgaXMgbm90IGEgcG93ZXIgb2YgMiAoMHglbHgpXG4iLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgIF9fZnVuY19fLCBzY3JhdGNoLT5md19yd19vZmZzZXQpOwo+IC0gICAgICAgICAg
ICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiAtICAgICAgIH0KPiAtCj4gLSAgICAgICBpZiAoKHNj
cmF0Y2gtPmZ3X3N0YXJ0ICYgKHNjcmF0Y2gtPmZ3X3J3X29mZnNldCAtIDEpKSAhPSAwKSB7Cj4g
LSAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBmd19zdGFydCBhbmQgZndfcndfb2Zmc2V0
IG5vdCBhbGlnbmVkXG4iLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIF9fZnVuY19fKTsK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKyAgICAgICBpZiAoIWZ3X3Np
bmdsZV9yZWdpb24pIHsKPiArICAgICAgICAgICAgICAgaWYgKHNjcmF0Y2gtPmZ3X3J3X29mZnNl
dCA9PSAwIHx8Cj4gKyAgICAgICAgICAgICAgICAgICAoc2NyYXRjaC0+Zndfcndfb2Zmc2V0ICYg
KHNjcmF0Y2gtPmZ3X3J3X29mZnNldCAtIDEpKSAhPSAwKSB7Cj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc2JpX3ByaW50ZigiJXM6IGZ3X3J3X29mZnNldCBpcyBub3QgYSBwb3dlciBvZiAyICgw
eCVseClcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywg
c2NyYXRjaC0+Zndfcndfb2Zmc2V0KTsKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4g
U0JJX0VJTlZBTDsKPiArICAgICAgICAgICAgICAgfQo+ICsgICAgICAgICAgICAgICBpZiAoKHNj
cmF0Y2gtPmZ3X3N0YXJ0ICYgKHNjcmF0Y2gtPmZ3X3J3X29mZnNldCAtIDEpKSAhPSAwKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGZ3X3N0YXJ0IGFuZCBmd19y
d19vZmZzZXQgbm90IGFsaWduZWRcbiIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBfX2Z1bmNfXyk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5W
QUw7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgIH0KPgo+ICAgICAgICAgZG9tYWluX2hh
cnRfcHRyX29mZnNldCA9IHNiaV9zY3JhdGNoX2FsbG9jX3R5cGVfb2Zmc2V0KHZvaWQgKik7Cj4g
QEAgLTkxMyw3ICs5MTYsNyBAQCBpbnQgc2JpX2RvbWFpbl9pbml0KHN0cnVjdCBzYmlfc2NyYXRj
aCAqc2NyYXRjaCwgdTMyIGNvbGRfaGFydGlkKQo+ICAgICAgICAgcm9vdC5wb3NzaWJsZV9oYXJ0
cyA9IHJvb3RfaG1hc2s7Cj4KPiAgICAgICAgIC8qIFJvb3QgZG9tYWluIGZpcm13YXJlIG1lbW9y
eSByZWdpb24gKi8KPiAtICAgICAgIGlmIChzYmlfcGxhdGZvcm1fc2luZ2xlX2Z3X3JlZ2lvbihz
YmlfcGxhdGZvcm1fcHRyKHNjcmF0Y2gpKSkgewo+ICsgICAgICAgaWYgKGZ3X3NpbmdsZV9yZWdp
b24pIHsKPiAgICAgICAgICAgICAgICAgc2JpX2RvbWFpbl9tZW1yZWdpb25faW5pdChzY3JhdGNo
LT5md19zdGFydCwgc2NyYXRjaC0+Zndfc2l6ZSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAoU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9SRUFEQUJMRSB8Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9ET01BSU5fTUVNUkVH
SU9OX01fV1JJVEFCTEUgfAo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IGU3ZmE2NmMyMTYwZWMxMzlk
ZTE4NTNhMDBmNjY5YzA5MzIwYTkyNTYKPiBjaGFuZ2UtaWQ6IDIwMjYwNTIyLWZ3X3J3X3N0YXJ0
X2FsaWdubWVudC00NGVhYWM4ODQ4MjMKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEFuaXJ1ZGgg
U3Jpbml2YXNhbiA8YXNyaW5pdmFzYW5Ab3NzLnRlbnN0b3JyZW50LmNvbT4KPgo+Cj4gLS0KPiBv
cGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
