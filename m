Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10A8C369CB
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 05:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yyA6Ddzxq8UHBLEJYxw5t68BPDHgxvKtOKkty5jqUcA=; b=zKSUgSzx3FiCGv
	PQDYfrhUXqEPkKn5r74EOPewwP4F/NFL6rMsS2OEZUpxcwO+n+nhw4IK3h8ww4Bfp0Izd7I6AKd9D
	xQUgQJRANc3eLeS2ED5frkyBpoQQRehq0AJdsrx03CrPotqfxfr4m9Wgg50katPfv3lxvXGxYFPFx
	EUX0KSYVNCNdoMa+krfGiQOR2rK7a3u6MlpvUE0KqsAGDmcxgmZpyveaNlIEA8y7Qpr9b3VmtAE7w
	bk6uq9SgVC0q8fH2soe8z69A7VBsb0uXU4Ls+eudhQev5h0NDG8bB3/Xq8q4kyo3r0RRnqCpLKcjF
	ctTBsX75et9FKbeKrXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dgp-00000008PU2-3kXG;
	Tue, 29 Apr 2025 05:39:31 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dXs-00000008OVI-0WQo
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 05:30:17 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so7115004e87.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 22:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745904614; x=1746509414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZAmG5hAhkmuxYg5lQzSZzJkT1GW8mljV9a7PBCnbNPA=;
        b=VwFY40tEik46AD+qVOWywLQ0fACNWZUTztYiiq1HJ+Gju2WCLfYNLK57uhR7G34l2l
         dq1l4PAOYZ86u8sxOA0OkqwAFrZl0Yx+H0UpnSpFx2les5WUL5A0lGMDVZWaGVYrJPzR
         kJ6sjfCXk8wllc3xHmhozRflx+j3V3mmQf9Ob1uFZXGTKrdnTKX7g1e9owdYf9+4kYti
         cbZYbLaryqXUNneWoRMGQ2Z25rgtyuW0+vlwogFEP8z/i5S/ownZDLvOWpo0D8CFGDuo
         0QPd5RZ3eum7354qQN9jZSzrCXPCCr01yjJ/CDFQS5MKSgu972BY9Sysy8YD09Vcd7/x
         qExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745904614; x=1746509414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAmG5hAhkmuxYg5lQzSZzJkT1GW8mljV9a7PBCnbNPA=;
        b=WujxnFbkrVS1UGhYdJDZba7c51Br2PLruLlV+s+yAZlGHdPSET9mz+Yr2vBXxcFpkY
         hS/axuSCD07Ey+4OteU7XffpwjVp98EDVjld0u4RIP5dwSDGl9RhO2pDzzJUs2fJgNYj
         zZs9vynhnz7qesmlxLBWF28+EKGehmPN+c6BmPSDZjdiavatKM+gxk6x6KEjILYQJR3i
         0kRxLQTsEo6251J3rC0/yu71yVrUkpZ5+tELe9bPZ9W5YlatsScuy/v6obRshGwlNyKC
         74m5vC82wziAdTPXBpdmP9GTDx/lmD6ThcFikC8b/9Gj4NU9USLCcZzMCChoH67VDjcS
         V7qg==
X-Forwarded-Encrypted: i=1; AJvYcCUSF678hnKFO3vHvu6Oej3tbcBThcmT1X79YbikjBg++lryjQfqBwcAaKQrn2c7jGwKqqskLh6x@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0JMnPdmrb0CYtuKhROkrtDw6EnU1AtrRfP9ZMilDNC+2aQ8kS
	fb88G0mtfTYPk9ZBnvrNGHSHXnkplYxJXpdNu3QBabEIyo/Oa31DNByXGv7+GzrYlhZgC7omt6l
	qgsvs7Lcu3CSlaaI5Muj/iBCpmVka0H8dhP+0aQf330uuRCE4+jerBQ==
X-Gm-Gg: ASbGncu2MDBg0xmGy5Im0UQuKdGDwIcSUMlZEro03xFjhxwzv3Im/VVfZQlRCMYsgbu
	FgtNbkQYUzbQ0hDzYMvsbVtAt9pIZpj0irWSgzoYIlW6pUYWKwIT7m5yoI2bsgTVGPLpNn1o/qS
	ciV7zyo5wPk/TFlKZ1q4auiXloC4O8FhSHRw==
X-Google-Smtp-Source: AGHT+IGutvGzjnyZyGuiSkC0gK+1YI8FbMrmok5ZIofnqUMDCm1euMll8sE93plYy0WA9a1sJJo6yoFErRA3rUGyDB4=
X-Received: by 2002:a05:6512:3a85:b0:54b:1055:f4bb with SMTP id
 2adb3069b0e04-54e9e53a9dbmr374776e87.4.1745904613624; Mon, 28 Apr 2025
 22:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
 <20250415131908.2699782-9-rkrcmar@ventanamicro.com> <CAAhSdy0_3DrkKWTcA57KDmCgEWV+1Be2hkh8LxrnyO_RXSjzog@mail.gmail.com>
 <D9IBHEG15AYR.122VJJYNT9QGQ@ventanamicro.com>
In-Reply-To: <D9IBHEG15AYR.122VJJYNT9QGQ@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 29 Apr 2025 11:00:02 +0530
X-Gm-Features: ATxdqUFP_g9fZBLafvKp0LRZtWa6t_BbsPif5CIrfeEFLtnzNb3_ouQaKlyqyNM
Message-ID: <CAK9=C2XOq9hQy_wDvv_ZruooVgoJRXTEyN7cFZkv=0D0ybMcBg@mail.gmail.com>
Subject: Re: [PATCH 7/8] lib: sbi_hart: add Ssstateen extension
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_223016_168863_69B5FFBF 
X-CRM114-Status: GOOD (  16.35  )
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

T24gTW9uLCBBcHIgMjgsIDIwMjUgYXQgNzoyNeKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IDIwMjUtMDQtMjhUMTg6MDg6MTIrMDU6MzAs
IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Ogo+ID4gT24gVHVlLCBBcHIgMTUsIDIw
MjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PiB3cm90ZToKPiA+Pgo+ID4+IFdlIGFscmVhZHkgZGV0ZWN0IFNtc3RhdGVlbiwgYnV0IFNzc3Rh
dGVlbiBleGlzdHMgYXMgd2VsbCBhbmQgaXQgZG9lc24ndAo+ID4+IGhhdmUgdGhlIE0tc3RhdGUg
Q1NScy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2
ZW50YW5hbWljcm8uY29tPgo+ID4+IC0tLQo+ID4+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9z
YmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ID4+IEBAIC0zMSw3ICszMSw3IEBA
IGVudW0gc2JpX2hhcnRfZXh0ZW5zaW9ucyB7Cj4gPj4gICAgICAgICBTQklfSEFSVF9FWFRfU01B
SUEgPSAwLAo+ID4+ICAgICAgICAgLyoqIEhBUlQgaGFzIFNtZXBtcCAqLwo+ID4+ICAgICAgICAg
U0JJX0hBUlRfRVhUX1NNRVBNUCwKPiA+PiAtICAgICAgIC8qKiBIQVJUIGhhcyBTbXN0YXRlZW4g
Q1NSICoqLwo+ID4+ICsgICAgICAgLyoqIEhBUlQgaGFzIG1zdGF0ZWVuKiwgc3N0YXRlZW4qLCBh
bmQgaHN0YXRlZW4qIENTUnMgKiovCj4gPgo+ID4gTGV0J3Mgbm90IGRlZmluZSB3aGF0IFNtc3Rh
dGVlbiBtZWFucyBoZXJlLgo+ID4KPiA+IFNtc3RhdGVlbiBpbXBsaWVzIG9ubHkgbXN0YXRlZW4g
Q1NScyB3aGVyZWFzCj4gPiBTc3RhdGVlZW4gaW1wbGllcyBbaHxzXXN0YXRlZW4gQ1NScy4KPgo+
IFRoZSBzcGVjIGFjdHVhbGx5IHNheXMgdGhhdCBTbXN0YXRlZW4gaXMgYWxsIG9mIHRoZSBDU1Jz
IGFuZCBTc3RhdGVlZW4KPiBtaXNzZXMgbXN0YXRlZW4qLCBidXQgeWVhaCwgaXQncyBub3QgdGhh
dCBpbXBvcnRhbnQuLi4KPgo+IENhbiBJIHJlbW92ZSB0aGUgY29tbWVudHMgaW5zdGVhZD8KCkkg
c3VnZ2VzdCBrZWVwaW5nIHRoZSBjb21tZW50IGFzLWlzIHRvIGJlIGNvbnNpc3RlbnQKd2l0aCBv
dGhlciBlbnVtIHZhbHVlcy4KCj4KPiBTQklfSEFSVF9FWFRfU01TVEFURUVOIGlzIG9idmlvdXNs
eSBTbXN0YXRlZW4sIHNvIEkgZG9uJ3Qgc2VlIHRoZSBwb2ludAo+IG9mIHRoZSBjb21tZW50Lgo+
CgpTaW5jZSBTbXN0YXRlZW4gY292ZXIgU3NzdGF0ZWVuIGFzIHdlbGwsIEkgc3VnZ2VzdApTQklf
SEFSVF9FWFRfU01TVEFURUVOIHNob3VsZCBpbXBseQpTQklfSEFSVF9FWFRfU1NTVEFURUVOCgpS
ZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
