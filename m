Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBACAD185F3
	for <opensbi@archiver.kernel.org>; Thu,  8 Jan 2026 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mM2Z6XSejYCg/mqLW9X7D/T2WiqlQgYNkz+SRn9KoN4=; b=yGd3YH3xu1Yt6u
	4AMXS7m/TCpYSkkGwOvwCw8j0kW/sUjLi5VcnLnzCSxaUfLaXhGJD9Jb0nB51Ov6S4hJloSQ5UhzI
	2Pua9KSGuawMKYEqOQJWmM+SibhHdjhQbTs8kor43ltyNaCVzGEtNK6rGgZmvFA14YMYvYW8u//vy
	iSi35kLIGLjUoFilGeUAQdbrftd5QsnRwfH2EM5Ry2LslZw6Vu1LHVUnqbNc9M8b+pC/+vwGTizr+
	DSPEYY+Xa5JIlWCIeBd/7F0xrO+guWzvXOj0Yswt02Iu5mZHzwNo7/11PUZWpPFEGXdvOFEjk/E04
	1/6eClF93rQ+C8+xH8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq8a-0000000HAqP-1RFV;
	Thu, 08 Jan 2026 13:33:16 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq8Y-0000000HApV-2mYw
	for opensbi@lists.infradead.org;
	Thu, 08 Jan 2026 13:33:15 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-65f54073b63so810336eaf.2
        for <opensbi@lists.infradead.org>; Thu, 08 Jan 2026 05:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1767879193; x=1768483993; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzLyesnpWEwc9fsVC2SChhOAj7unK5UR5Wn7TUJ9oLI=;
        b=nmeoqIhktkBdPhiq+GDW0+47/yehXtMQbUA8wkeaTajlHhfUWdXSnpgZQkNWXQWx6L
         ydn0E1QrbbZxcjmf3DpUwjMbbVLk4vRF38VDnJIF7hc8pbi5TYE/RusBCNnLmpLZjWmQ
         Rb0kDZsRSGY5u6Wt1nXRYmwX9TrFgyB5yWFLd0ZBVwQ9u9rgJOcI20iR2McI1Yi7EItt
         9yF99J0YEF2DZnnIF0h8i+dfmTYriatdvQrLwwUhgMHBA9QA+Pfkg+KI9i9sDflPJynb
         D4DIedAe1RSxeE9OFNVIbxlWtRhNrFGNEOtQWGAB5TmeWnlo8hOn1uzattP4YdcI33CV
         F9SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767879193; x=1768483993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HzLyesnpWEwc9fsVC2SChhOAj7unK5UR5Wn7TUJ9oLI=;
        b=CgUIIDnh4ZFAN5b+zbdoGPsvbo5TozCN6VnTsvzCbIIPW31or0Crtqk7vOtqB0Ulsp
         HvRbRvk01o+JnDUZvx2hB0hy8zaGDDLdCrTmWmfyDrSOORI3zu1TP12fKizhtexYdinI
         x1tRzHTsY6a3qc/NZeGtBr7EAkyVlq7szbqyZJs7ybmz+YVV5/vGCew/+bi1d3CK4OiN
         /yo8KwCgB1oadK7ZVpPrpI4IjaTsXsHKda1DNN/eDy9f/qL0HTv3maZ/dG5GIjWaiPfF
         FqOZR1FYd2Gas+VqxeqBzcBTEI5G/X8xDqs48IcWEyZK6ebhPQNF9sy6S03G1od5ypEB
         sEog==
X-Forwarded-Encrypted: i=1; AJvYcCW+VCjD2WVNSe+/TTM7TGochf3a2kkcKSz+XFRawLW50HnRFfjeENgpI0zRSghc77TQGydpG9ee@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2ePztR40Hav4DBj51EIrdq6D//QFAt7Jkeyigbrvs0fQl3CnF
	P8L/uc5G0nXS6ZPzpoXvBXvu0xl3jv8n0ebOT4FDtlyAzFNmWQkFABUZU1tDKf/ll2rBglmNtXf
	K5Am6jb7KJOugIJTVumrZNXcFXN+V/1EFT7wFwPpCqw==
X-Gm-Gg: AY/fxX7VJaO5vLk7TPEec8kuZwFRZ8YB4XL31Kit9skoWuRXBijsv/7UAyRosMk1Kj4
	ijyvzbQQTjmV8Yklr6r6Hflk53it3O2Mcjzr4ASrOraQx1mEIQUusyodgFH8gKwjjuczmjvBFTh
	8hyaxf6ta0RY/oHA3h3NLtDLCbYcoMQ1Ac/u57uD6CROidHMc/6TwrUB6Y0SEnU7WalrJTHjqNz
	b/5KLQUv/yFeV1yZKc7XfnQ3v/W/ucmrXLUbkH4+3rUM35j/Y0jVbVwCBknw7RyqzknXW8fwyWf
	rBg+c5obSr8tHwXSxHfvVZ+o1tLOHR1iyURcYYYdlES/dfeG1DV/IQcfhorGn9O53c8H
X-Google-Smtp-Source: AGHT+IFPVwVXQJHqQ1Ly5OUgkzZYrZLd1qSPK8KLuPNRptPptFwLcfNm1dr7y/+Afh/AxTEwKbjhI6sjG1ieI4t0HkY=
X-Received: by 2002:a05:6820:678e:b0:65b:35a2:7a8b with SMTP id
 006d021491bc7-65f550adb50mr1557841eaf.82.1767879193407; Thu, 08 Jan 2026
 05:33:13 -0800 (PST)
MIME-Version: 1.0
References: <bd8cc9b22f496b06e4c874253ba964f306c8f575.camel@bootlin.com>
 <ee3a8b0fe02eb882cfbb312e80d0694a2e964e76.camel@126.com> <c7901a6dfcedb10a1002d8874a1fd54cb2b58edf.camel@bootlin.com>
In-Reply-To: <c7901a6dfcedb10a1002d8874a1fd54cb2b58edf.camel@bootlin.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 8 Jan 2026 19:03:02 +0530
X-Gm-Features: AQt7F2oM7VOSTKkZ4JbiSgKZ9qHwkdqGeeaGBER5fzfsHQ_VpsH3Co9FpBU3NDU
Message-ID: <CAAhSdy3tzMsF_8gNxRZgCP5TBENTSpw+WpA1C=tZ08OtDNKRcg@mail.gmail.com>
Subject: Re: Hart isolation configuration failure (error -3) with OpenSBI 1.8
 on QEMU 10.1.3 rva22s64/rva23s64 profiles
To: Thomas Perrot <thomas.perrot@bootlin.com>
Cc: Xiang W <wxjstz@126.com>, OpenSBI <opensbi@lists.infradead.org>, qemu-riscv@nongnu.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_053314_729010_9AE1437E 
X-CRM114-Status: GOOD (  17.47  )
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

SGkgVGhvbWFzLAoKT24gV2VkLCBKYW4gNywgMjAyNiBhdCAzOjAy4oCvUE0gVGhvbWFzIFBlcnJv
dCA8dGhvbWFzLnBlcnJvdEBib290bGluLmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBYaWFuZywKPgo+
IE9uIFdlZCwgMjAyNi0wMS0wNyBhdCAxMDo0OCArMDgwMCwgWGlhbmcgVyB3cm90ZToKPiA+IOWc
qCAyMDI2LTAxLTA15LiA55qEIDE4OjQyICswMTAw77yMVGhvbWFzIFBlcnJvdOWGmemBk++8mgo+
ID4gPiBIZWxsbywKPiA+ID4KPiA+ID4gSGFwcHkgTmV3IFllYXIhCj4gPiA+Cj4gPiA+IEknbSBm
YWNpbmcgYSBoYXJ0IGlzb2xhdGlvbiBjb25maWd1cmF0aW9uIGVycm9yIHdoZW4gcnVubmluZwo+
ID4gPiBPcGVuU0JJCj4gPiA+IDEuOCBvbiBRRU1VIDEwLjEuMyB3aXRoIHRoZSBSSVNDLVYgYXBw
bGljYXRpb24gcHJvZmlsZXMgcnZhMjJzNjQKPiA+ID4gYW5kCj4gPiA+IHJ2YTIzczY0Ogo+ID4g
Pgo+ID4gPiAgICAgaW5pdF9jb2xkYm9vdDogaGFydCBpc29sYXRpb24gY29uZmlndXJlIGZhaWxl
ZCAoZXJyb3IgLTMpCj4gPiA+Cj4gPiA+IE5vIGlzc3VlIG9jY3VycyB3aGVuIHVzaW5nIHRoZSBy
djY0IHByb2ZpbGUuIFRoZSBzeXN0ZW0gY29udGludWVzCj4gPiA+IHRvCj4gPiA+IGJvb3QgYWZ0
ZXIgdGhlIGVycm9yLCBidXQgSSdkIGxpa2UgdG8gdW5kZXJzdGFuZCB0aGUgcm9vdCBjYXVzZS4K
PiA+ID4KPiA+ID4gSSBoYXZlbid0IHRlc3RlZCBPcGVuU0JJIDEuOCBvbiByZWFsIGhhcmR3YXJl
IHlldCAtIHRoYXQncyBteSBuZXh0Cj4gPiA+IHN0ZXAuCj4gPiA+Cj4gPiA+IElzIHRoZXJlIGEg
a25vd24gUUVNVSBpc3N1ZT8gSXMgdGhlcmUgYSByZWNvbW1lbmRlZCB3b3JrYXJvdW5kCj4gPiA+
IGJlc2lkZXMKPiA+ID4gdXNpbmcgcnY2ND8KPiA+ID4KPiA+ID4gQmVsb3cgaXMgdGhlIGNvbXBs
ZXRlIHRyYWNlOgo+ID4gPgo+ID4gPiBxZW11LXN5c3RlbS1yaXNjdjY0IC1kZXZpY2UgdmlydGlv
LW5ldC0KPiA+ID4gZGV2aWNlLG5ldGRldj1uZXQwLG1hYz01Mjo1NDowMDoxMjozNTowMiAtbmV0
ZGV2Cj4gPiA+IHVzZXIsaWQ9bmV0MCxob3N0ZndkPXRjcDoxMjcuMC4wLjE6MjIyMi0KPiA+ID4g
OjIyLGhvc3Rmd2Q9dGNwOjEyNy4wLjAuMToyMzIzLQo+ID4gPiA6MjMsdGZ0cD0vc3JjL2J1aWxk
L3RtcC9kZXBsb3kvaW1hZ2VzL3FlbXVyaXNjdjY0IC1vYmplY3Qgcm5nLQo+ID4gPiByYW5kb20s
ZmlsZW5hbWU9L2Rldi91cmFuZG9tLGlkPXJuZzAgLWRldmljZSB2aXJ0aW8tcm5nLQo+ID4gPiBw
Y2kscm5nPXJuZzAgLQo+ID4gPiBkcml2ZSBpZD1kaXNrMCxmaWxlPS9zcmMvYnVpbGQvdG1wL2Rl
cGxveS9pbWFnZXMvcWVtdXJpc2N2NjQvY29yZS0KPiA+ID4gaW1hZ2UtbWluaW1hbC1xZW11cmlz
Y3Y2NC5yb290ZnMtCj4gPiA+IDIwMjYwMTA1MTczODQ3LmV4dDQsaWY9bm9uZSxmb3JtYXQ9cmF3
Cj4gPiA+IC1kZXZpY2UgdmlydGlvLWJsay1kZXZpY2UsZHJpdmU9ZGlzazAgLWRldmljZSBxZW11
LXhoY2kgLWRldmljZQo+ID4gPiB1c2ItCj4gPiA+IHRhYmxldCAtZGV2aWNlIHVzYi1rYmQgIC1t
YWNoaW5lIHZpcnQgLWNwdSBydmEyM3M2NCAtc21wIDQgLW0gMjU2IC0KPiA+IFFFTVUgZGlzYWJs
ZXMgUE1QIGJ5IGRlZmF1bHQ7IHRoZSBmb2xsb3dpbmcgb3B0aW9uIG5lZWRzIHRvIGJlIGFkZGVk
Lgo+ID4KPiA+IC1jcHUgcnZhMjNzNjQscG1wPXRydWUKPiA+Cj4KPiBUaGFuayB5b3UuIFdpdGgg
dGhlIGFkZGl0aW9uYWwgb3B0aW9uLCB0aGUgaXNzdWUgbm8gbG9uZ2VyIG9jY3Vycy4KCkkgaGF2
ZSBkb25lIGFuIGluY3JlbWVudGFsIE9wZW5TQkkgdjEuOC4xIHJlbGVhc2UKdG8gYWRkcmVzcyB0
aGlzIGlzc3VlLiBXaXRoIHRoaXMgaW5jcmVtZW50YWwgcmVsZWFzZSwKeW91IGRvbid0IGhhdmUg
dG8gZXhwbGljaXRseSBwYXNzICJwbXA9dHJ1ZSIgdG8KcnZhMjJzNjQgYW5kIHJ2YTIzczY0IENQ
VSB0eXBlcyBpbiBRRU1VLgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
