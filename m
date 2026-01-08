Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DD7D1D46C
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 15:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qC4YwUJlaSN+ZXtCQI/oqq0dqBDONk/0MiE9HUL4Edc=; b=HFCtHJ+u+g4b9n
	REyv3odCIW1cK/N5tAfHBDLtMWxbi32WIuwxFW+eicoIqMFD2DD1haRTq6Bo+b4l5m86VZ6YBLqyh
	pPBHBSDqN/5A6t9Uc6Lsm5TVpVXIEDJqW/hPj1lFwfCqlebOaY9rIu6XY1goI1hJcU+jMOz10pWvh
	vSxYftNa4GilMIGyVoOxfZR52wiICB/H+LM+PO1HZuKRYthChXREqFv+/yUnF+bmCJerCqeuNyvMy
	xAE9k+ltV2h4Ds3oAkH3IgssPtfnXgloQKmEKqsUyBhSPeW2vm6RQ9pkFWQ3w8uuA4yv3M7sa83N8
	RIU0FIlW5PLIyWRQNyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZ5-0000000HRoT-3N0u;
	Thu, 08 Jan 2026 15:04:43 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdrZ2-0000000HRnL-2LiJ
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 15:04:42 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-59b6d1b16dbso2381685e87.2
        for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 07:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1767884677; x=1768489477; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7feulWfkV9/X8XPklMwFfmxf2xie7pg9WDSK/R82Fo=;
        b=BINSlTi1cLoirfPVoqFOPu9/xCWLWLq3XoficVFA15XbdZcGf8M4I1drRoBoaOx027
         cuijFRd48hfYy+zuhYV9vo8NM447mHJabcN4EiBznyFbXGQpULOsEz93/+d+/q0hdb/+
         Bq8cBkuvOD94dIY3nRKtpeQpc02C1DkCeGuwSRuPGy+iiun0/8AbA9NdUS3xx1NfSEhS
         jyFuu0dPxH47dTcrZk4DoqsZgajGPat3K2JED3c/1fmt/8eY3+qAhNuOj60Z9x8uYPVD
         GRT4Fh/gW9OGAf9I8Z2i8bJvFx330plJouRqQeSw4OBSM1F38CYDESnckkIobGUYx8Le
         v9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767884677; x=1768489477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T7feulWfkV9/X8XPklMwFfmxf2xie7pg9WDSK/R82Fo=;
        b=WtzrMYvGX27lyFhX2Kh7Q+7lC7abXG/amT9h4zko3/T7OBZEWnP2/NWr5Vh/Z9Jl8o
         bTvMxp6mcuQ1qIAWlGr+weIwuYPRK/POm4/ZMDP1uqSfKQLRbr/wgz2jlFU9WdZwZsMI
         Yy5HKej5SPkDMV5Wm68NH6ojAg3ygNvtXZ1TS9aJmJ6HSLvmrMwvod758IspEwtwYf4Y
         aCzIaTNBgckOiXUv9mCCtzv2MM7qNqMC9uYLDVCz5LfIo6Q4ccnfHsxy+soUnZhzUjcM
         M0hseQGN3etQJ67fNW/c7X1HatJoTLQ8eZd4ucBbO9mXHwgPptO+r2UJmhpxWXVeWy9Z
         GcAQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1F7wsJn1wt4sYo8jyquBDROEOh/Xz9VAnGS0XewUkC03RoiIdbi1YuJ73TfwQkjAPQCLc+nV7@lists.infradead.org
X-Gm-Message-State: AOJu0YzB6C0d8MVj9MogQzkOvfl4k67Z8KhDgCnEhYIBspqahwVgsrhe
	/JiHyz0sVFUYSVWQRX6zvUSgupQcMYRlAnVr2h6+gGwO8swzYgUWVb9ESztBBhbmZnZnYVXXO1/
	R7Q7737/8sfihlsJt0Rw2azWxxPOLKGUWObtP/LIhBw==
X-Gm-Gg: AY/fxX4t5BxSyDCTmq1r8f+seOKMqcjBc65gVNnrcB8fbcVWoTfA89nZ86Z4e6kZqKx
	b7F7nJa8HgStmSb4jyswkYtp3bAIf/hhp0oohRucwhMREdnxwRZRwhx0iPJqX5YnIwXGmq2KS1n
	1Iwf71iFa4VjH9oQemlSLl/bEmooM7yMzPhztPBphOYRv20CEukdu6+Gz17UrsCS9ECj0bDYLBG
	KzdoGhbK4SYzfuQD4T+Ew1qocMl5xluASgVeXITbgzgvtH6RGDo5+pFBePar5XFl/Wy1ktLWfnZ
	6UwwAXXqSYI0yKXn9zjQjFiUgv9Y
X-Google-Smtp-Source: AGHT+IF4d9oe9u4bwh2AHv/excZPpqLqrYzDj+bJ22VdpuJSG4INs+BIVFnL61RYLfG9Gxv2il6iiXv2SsHrfpEa1N4=
X-Received: by 2002:a05:6512:3f05:b0:59a:1145:1d16 with SMTP id
 2adb3069b0e04-59b6f03f997mr2077345e87.42.1767884676963; Thu, 08 Jan 2026
 07:04:36 -0800 (PST)
MIME-Version: 1.0
References: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
 <ee3a8b0fe02eb882cfbb312e80d0694a2e964e76.camel@126.com> <c7901a6dfcedb10a1002d8874a1fd54cb2b58edf.camel@bootlin.com>
 <CAAhSdy3tzMsF_8gNxRZgCP5TBENTSpw+WpA1C=tZ08OtDNKRcg@mail.gmail.com> <632a9235-f727-4b0d-9698-1f8bbdf3be60@oss.qualcomm.com>
In-Reply-To: <632a9235-f727-4b0d-9698-1f8bbdf3be60@oss.qualcomm.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 8 Jan 2026 20:34:25 +0530
X-Gm-Features: AQt7F2pAmUh2WwW7a4AKKtn_rX__QROaTEr2zlPuIF8A8L0qAu710zY0QQgJN_s
Message-ID: <CAK9=C2W0x4Ut6WFJxvsSwhA8mM8_JUCQCYWvL5Cx+d-BaBY5Zg@mail.gmail.com>
Subject: Re: Hart isolation configuration failure (error -3) with OpenSBI 1.8
 on QEMU 10.1.3 rva22s64/rva23s64 profiles
To: Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Perrot <thomas.perrot@bootlin.com>, 
	Xiang W <wxjstz@126.com>, OpenSBI <opensbi@lists.infradead.org>, qemu-riscv@nongnu.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_070440_897582_4DD66AC2 
X-CRM114-Status: GOOD (  21.23  )
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

T24gVGh1LCBKYW4gOCwgMjAyNiBhdCA3OjEy4oCvUE0gRGFuaWVsIEhlbnJpcXVlIEJhcmJvemEK
PGRhbmllbC5iYXJib3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDEvOC8y
MDI2IDEwOjMzIEFNLCBBbnVwIFBhdGVsIHdyb3RlOgo+ID4gSGkgVGhvbWFzLAo+ID4KPiA+IE9u
IFdlZCwgSmFuIDcsIDIwMjYgYXQgMzowMuKAr1BNIFRob21hcyBQZXJyb3QgPHRob21hcy5wZXJy
b3RAYm9vdGxpbi5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gSGVsbG8gWGlhbmcsCj4gPj4KPiA+PiBP
biBXZWQsIDIwMjYtMDEtMDcgYXQgMTA6NDggKzA4MDAsIFhpYW5nIFcgd3JvdGU6Cj4gPj4+IOWc
qCAyMDI2LTAxLTA15LiA55qEIDE4OjQyICswMTAw77yMVGhvbWFzIFBlcnJvdOWGmemBk++8mgo+
ID4+Pj4gSGVsbG8sCj4gPj4+Pgo+ID4+Pj4gSGFwcHkgTmV3IFllYXIhCj4gPj4+Pgo+ID4+Pj4g
SSdtIGZhY2luZyBhIGhhcnQgaXNvbGF0aW9uIGNvbmZpZ3VyYXRpb24gZXJyb3Igd2hlbiBydW5u
aW5nCj4gPj4+PiBPcGVuU0JJCj4gPj4+PiAxLjggb24gUUVNVSAxMC4xLjMgd2l0aCB0aGUgUklT
Qy1WIGFwcGxpY2F0aW9uIHByb2ZpbGVzIHJ2YTIyczY0Cj4gPj4+PiBhbmQKPiA+Pj4+IHJ2YTIz
czY0Ogo+ID4+Pj4KPiA+Pj4+ICAgICAgaW5pdF9jb2xkYm9vdDogaGFydCBpc29sYXRpb24gY29u
ZmlndXJlIGZhaWxlZCAoZXJyb3IgLTMpCj4gPj4+Pgo+ID4+Pj4gTm8gaXNzdWUgb2NjdXJzIHdo
ZW4gdXNpbmcgdGhlIHJ2NjQgcHJvZmlsZS4gVGhlIHN5c3RlbSBjb250aW51ZXMKPiA+Pj4+IHRv
Cj4gPj4+PiBib290IGFmdGVyIHRoZSBlcnJvciwgYnV0IEknZCBsaWtlIHRvIHVuZGVyc3RhbmQg
dGhlIHJvb3QgY2F1c2UuCj4gPj4+Pgo+ID4+Pj4gSSBoYXZlbid0IHRlc3RlZCBPcGVuU0JJIDEu
OCBvbiByZWFsIGhhcmR3YXJlIHlldCAtIHRoYXQncyBteSBuZXh0Cj4gPj4+PiBzdGVwLgo+ID4+
Pj4KPiA+Pj4+IElzIHRoZXJlIGEga25vd24gUUVNVSBpc3N1ZT8gSXMgdGhlcmUgYSByZWNvbW1l
bmRlZCB3b3JrYXJvdW5kCj4gPj4+PiBiZXNpZGVzCj4gPj4+PiB1c2luZyBydjY0Pwo+ID4+Pj4K
PiA+Pj4+IEJlbG93IGlzIHRoZSBjb21wbGV0ZSB0cmFjZToKPiA+Pj4+Cj4gPj4+PiBxZW11LXN5
c3RlbS1yaXNjdjY0IC1kZXZpY2UgdmlydGlvLW5ldC0KPiA+Pj4+IGRldmljZSxuZXRkZXY9bmV0
MCxtYWM9NTI6NTQ6MDA6MTI6MzU6MDIgLW5ldGRldgo+ID4+Pj4gdXNlcixpZD1uZXQwLGhvc3Rm
d2Q9dGNwOjEyNy4wLjAuMToyMjIyLQo+ID4+Pj4gOjIyLGhvc3Rmd2Q9dGNwOjEyNy4wLjAuMToy
MzIzLQo+ID4+Pj4gOjIzLHRmdHA9L3NyYy9idWlsZC90bXAvZGVwbG95L2ltYWdlcy9xZW11cmlz
Y3Y2NCAtb2JqZWN0IHJuZy0KPiA+Pj4+IHJhbmRvbSxmaWxlbmFtZT0vZGV2L3VyYW5kb20saWQ9
cm5nMCAtZGV2aWNlIHZpcnRpby1ybmctCj4gPj4+PiBwY2kscm5nPXJuZzAgLQo+ID4+Pj4gZHJp
dmUgaWQ9ZGlzazAsZmlsZT0vc3JjL2J1aWxkL3RtcC9kZXBsb3kvaW1hZ2VzL3FlbXVyaXNjdjY0
L2NvcmUtCj4gPj4+PiBpbWFnZS1taW5pbWFsLXFlbXVyaXNjdjY0LnJvb3Rmcy0KPiA+Pj4+IDIw
MjYwMTA1MTczODQ3LmV4dDQsaWY9bm9uZSxmb3JtYXQ9cmF3Cj4gPj4+PiAtZGV2aWNlIHZpcnRp
by1ibGstZGV2aWNlLGRyaXZlPWRpc2swIC1kZXZpY2UgcWVtdS14aGNpIC1kZXZpY2UKPiA+Pj4+
IHVzYi0KPiA+Pj4+IHRhYmxldCAtZGV2aWNlIHVzYi1rYmQgIC1tYWNoaW5lIHZpcnQgLWNwdSBy
dmEyM3M2NCAtc21wIDQgLW0gMjU2IC0KPiA+Pj4gUUVNVSBkaXNhYmxlcyBQTVAgYnkgZGVmYXVs
dDsgdGhlIGZvbGxvd2luZyBvcHRpb24gbmVlZHMgdG8gYmUgYWRkZWQuCj4gPj4+Cj4gPj4+IC1j
cHUgcnZhMjNzNjQscG1wPXRydWUKPiA+Pj4KPiA+Pgo+ID4+IFRoYW5rIHlvdS4gV2l0aCB0aGUg
YWRkaXRpb25hbCBvcHRpb24sIHRoZSBpc3N1ZSBubyBsb25nZXIgb2NjdXJzLgo+ID4KPiA+IEkg
aGF2ZSBkb25lIGFuIGluY3JlbWVudGFsIE9wZW5TQkkgdjEuOC4xIHJlbGVhc2UKPiA+IHRvIGFk
ZHJlc3MgdGhpcyBpc3N1ZS4gV2l0aCB0aGlzIGluY3JlbWVudGFsIHJlbGVhc2UsCj4gPiB5b3Ug
ZG9uJ3QgaGF2ZSB0byBleHBsaWNpdGx5IHBhc3MgInBtcD10cnVlIiB0bwo+ID4gcnZhMjJzNjQg
YW5kIHJ2YTIzczY0IENQVSB0eXBlcyBpbiBRRU1VLgo+Cj4gU2VlbXMgbGlrZSB3ZSBkb24ndCBu
ZWVkIHRoaXMgcGF0Y2ggSSBzZW50IGEgZmV3IGRheXMgYWdvIHRoZW46Cj4KPgo+ICJbUEFUQ0hd
IHRhcmdldC9yaXNjdi9jcHUuYzogZW5hYmxlIFBNUCBieSBkZWZhdWx0IGZvciBwcm9maWxlIENQ
VXMiCj4KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9xZW11LWRldmVsLzIwMjYwMTA2MjA1MTUy
LjM2NTQ5NzUtMS1kYW5pZWwuYmFyYm96YUBvc3MucXVhbGNvbW0uY29tLwo+Cj4KPiBXZSBjYW4g
bGVhdmUgdGhpcyBwYXRjaCBhbG9uZS4gV2UgY2FuIGFsc28gbGVhdmUgdGhlIHVwZGF0ZSB0byBP
cGVuU0JJCj4gMS44IGFsb25lIGFzIHdlbGwgYW5kIHVwZGF0ZSB0byAxLjguMSB0byBnZXQgdGhl
IGZpeC4KCkkgdGhpbmsgdGhlIFFFTVUgcGF0Y2ggaXMgc3RpbGwgbmVlZGVkIGJlY2F1c2Ugd2l0
aG91dCBQTVAKdGhlcmUgaXMgbm90aGluZyB0byBwcm90ZWN0IE0tbW9kZSBmaXJtd2FyZSAoT3Bl
blNCSSkgZnJvbQpsb3dlciBwcml2aWxlZ2UgbW9kZXMuCgpSZWdhcmRzLApBbnVwCgotLSAKb3Bl
bnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
