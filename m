Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D436C3ABA4
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uZZz3j4/8sKbKHFL/uYaiTCnjI7AiJLEgoUHdyiUn7E=; b=vbitZlnqoJUoMZ
	TJysfEl8fNndWwkD3aH6pCkN9I16QGcpoHedycMp6mDeLZY3ptEXvLpqnLEBebEv6PQbtAUIsaMqu
	tnel21rt36aoPwsBXUssrREIds6j93kLQwp9i7CpJBQU8cKBX/qTtvn56NVyhh19IC615kLxZYWGr
	5MRNz5dDtJEeygYO67nz62hFV/NWd0eld1t1c2Pn8xYTJHc9j7YVXWaJJPqWYpTSwqRSxEeFOQV+Q
	UQzzYbTnzWpNAnTTkgabNoqOjLfPRp8NV1b7h7bV0SVC/ri9FWlPm0U2Zcu1bSUmejCCLeN4IcPNm
	3HZQhvRy2OF21Acmb3xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9OCC-00000006Md2-1byp;
	Mon, 28 Apr 2025 13:06:52 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NbI-00000006BW4-0UY4
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:28:45 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d5e43e4725so12790675ab.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:28:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843323; x=1746448123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLOnk9lJAUW2p06Kb/Hb9tPbzZCmn9airSF3fMc2WDY=;
        b=QPmAdNuh2X3aGjetw6eHOXzng1zayRZ/+7PT5UnwkTFgZa9oLegKN4H4P9apZO0Ttu
         qgnpm7SiMPNg3I5nMVKuSic9CQr/oA8D4zriiK7fDyjntE7wE2eI4+0YS98KAHRrGfMH
         T4FKqDg9ZGmJi3mDROFli4YiEOCvlzoYme1mPiJsuqhdhpBe4XCJCEgajrymSazOyEyk
         TPPJ9BKSTdYzSw1th1OaKxrj8RamulqGWtab47uCIcptmOzIeBTvoqwjooqzPkWrD4vC
         r0HOKKRke8XUQyuA4lkQfTdK2WZ5JrasEPBgQHZxZsVPnT/JfxtDKFoH4PvbjwNKD9Z8
         8NEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843323; x=1746448123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLOnk9lJAUW2p06Kb/Hb9tPbzZCmn9airSF3fMc2WDY=;
        b=mvEaAW00niR87GmJAv+mCCH0Zg59LTV9Jzz62GxCoVZzgzkA7kMoz+SWvFdaBSMMAq
         3w/nw0DPbTfl+WDyI07upeMcXCMvOSibxUomwOpiTZ7M6SLMhqCE+Fkl2n42zRrNNoXl
         EJ/ewCPHFgWhZHPm2/VIgb6fUYTkQoj/TrmqUN27QpX0eQ3ANQRHjx0qceN4U0uQXf6v
         s4z1VoBq+YSt02nKTvCDXNGUo2aqWT0CE4bAjUJW5VwE82oycVYpZvjxvhVQTistnPx8
         AOn1BqPl2YyjSzpTGasIKYUw6gPXX7T0+jPSdmLJZv7zIi/3K7kUAb8jZqmMHRevFsYj
         O/Rw==
X-Gm-Message-State: AOJu0YyRQxafXjq2VszmC5SAs23cpLMxjnwwp4Tsd/r5vXZywo3wZnRJ
	dgfmwvY64t8rIGXfgoLO4zNEQiLiUweEIOJVyQ9DLlKwjFlhlax91dI2GX7bj3xy/wo67dPjtYP
	ZWeft+T10kFqT7LVrgPICQDdoU/1RSuUazqDX3A==
X-Gm-Gg: ASbGncvc+e0jf5suQOwwBIFI4T9KUZlMbTeoC/uB8Do9cTvmEVuA0F4QW+FltrrQyyQ
	hfSQB7vPsr79NwZiZrgg7YO2EJT1OFGYCpT6K1QNuWbDWQ92j/frhPinh0oxQ9Lp8U1+PNO1Sab
	NaqILSz0MNdZwrcEANP29e9Akx9gQ/RHDZXg==
X-Google-Smtp-Source: AGHT+IGu4RNGRG+mQ2GQt5unv+OfRtEa+9VDCu4qZD90j3MGCqNJO1xy9u6xL+wOb2sLmphl6z7Nr0OUOSQfqDIv1Yo=
X-Received: by 2002:a05:6e02:23c3:b0:3d8:2085:a16e with SMTP id
 e9e14a558f8ab-3d93b3d1f1bmr110493425ab.1.1745843323190; Mon, 28 Apr 2025
 05:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-3-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-3-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 17:58:31 +0530
X-Gm-Features: ATxdqUGQp0lhMUpwWTMfafuQaQCIxQ5TRjXuXvY6hxTkRXd1XaWv0KctXkSz8E8
Message-ID: <CAAhSdy3L1_FFuy-UzViRdCWSQeZc6v_fBhwbHb9oT7Ei4FA0KQ@mail.gmail.com>
Subject: Re: [PATCH 1/8] lib: sbi: add 64 bit csr macros
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_052844_159005_CF34FDF8 
X-CRM114-Status: GOOD (  18.66  )
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

T24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IE1vc3QgQ1NScyBhcmUgWExFTiBiaXRzIHdp
ZGUsIGJ1dCBzb21lIGFyZSA2NCBiaXQsIHNvIHJ2MzIgbmVlZHMgdHdvCj4gYWNjZXNzZXMsIHBs
YWd1aW5nIHRoZSBjb2RlIHdpdGggaWZkZWZzLgo+Cj4gQWRkIG5ldyBoZWxwZXJzIHRoYXQgc3Bs
aXQgNjQgYml0IG9wZXJhdGlvbiBpbnRvIHR3byBvcGVyYXRpb25zIG9uIHJ2MzIuCj4KPiBUaGUg
aGVscGVycyBkb24ndCB1c2UgImNzciArIDB4MTAiLCBidXQgYXBwZW5kICJIIiBhdCB0aGUgZW5k
IG9mIHRoZSBjc3IKPiBuYW1lIHRvIGdldCBhIGNvbXBpbGUtdGltZSBlcnJvciB3aGVuIGFjY2Vz
c2luZyBhIG5vbiA2NCBiaXQgcmVnaXN0ZXIuCj4gVGhpcyBoYXMgdGhlIGRvd25zaWRlIHRoYXQg
eW91IGhhdmUgdG8gdXNlIHRoZSBuYW1lIHdoZW4gYWNjZXNzaW5nIHRoZW0uCj4gZS5nLiBjc3Jf
cmVhZDY0KDB4MTIzNCkgb3IgY3NyX3JlYWQ2NChDU1JfU0FUUCkgd29uJ3QgY29tcGlsZSBhbmQg
dGhlCj4gZXJyb3IgbWVzc2FnZXMgeW91IGdldCBmb3IgdGhlc2UgYnVncyBhcmUgbm90IHN0cmFp
Z2h0Zm9yd2FyZC4KPgo+IFNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2
ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9yaXNjdl9hc20uaCB8IDIxICsr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oIGIvaW5jbHVkZS9zYmkvcmlz
Y3ZfYXNtLmgKPiBpbmRleCA0NjA1ZGIyMGJkN2EuLmQxOTI4MWFjMTk2MSAxMDA2NDQKPiAtLS0g
YS9pbmNsdWRlL3NiaS9yaXNjdl9hc20uaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3Jpc2N2X2FzbS5o
Cj4gQEAgLTE1Niw2ICsxNTYsMjcgQEAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgOiAibWVtb3J5Iik7ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgfSkKPgo+ICsK
ClJlZHVuZGFudCBuZXdsaW5lLgoKPiArI2lmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ICsjZGVmaW5l
IF9fY3Nycnc2NChvcCwgY3NyLCBjc3JoLCB2YWwpICh0cnVlID8gb3AoY3NyLCB2YWwpIDogKHVp
bnQ2NF90KWNzcmgpCj4gKyNkZWZpbmUgX19jc3JyNjQoIG9wLCBjc3IsIGNzcmgpICAgICAgKHRy
dWUgPyBvcChjc3IpICAgICAgOiAodWludDY0X3QpY3NyaCkKPiArI2RlZmluZSBfX2Nzcnc2NCgg
b3AsIGNzciwgY3NyaCwgdmFsKSAodHJ1ZSA/IG9wKGNzciwgdmFsKSA6ICh1aW50NjRfdCljc3Jo
KQo+ICsjZWxpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiArI2RlZmluZSBfX2NzcnJ3NjQob3AsIGNz
ciwgY3NyaCwgdmFsKSAoICBvcChjc3IsIHZhbCkgfCAodWludDY0X3Qpb3AoY3NyaCwgdmFsID4+
IDMyKSA8PCAzMikKPiArI2RlZmluZSBfX2NzcnI2NCggb3AsIGNzciwgY3NyaCkgICAgICAoICBv
cChjc3IpICAgICAgfCAodWludDY0X3Qpb3AoY3NyaCkgICAgICAgICAgICA8PCAzMikKPiArI2Rl
ZmluZSBfX2Nzcnc2NCggb3AsIGNzciwgY3NyaCwgdmFsKSAoeyBvcChjc3IsIHZhbCk7ICAgICAg
ICAgICAgb3AoY3NyaCwgdmFsID4+IDMyKTsgICAgfSkKPiArI2VuZGlmCj4gKwo+ICsjZGVmaW5l
IGNzcl9zd2FwNjQoICAgICAgICBjc3IsIHZhbCkgX19jc3JydzY0KGNzcl9zd2FwLCAgICAgICAg
IGNzciwgY3NyICMjIEgsIHZhbCkKPiArI2RlZmluZSBjc3JfcmVhZDY0KCAgICAgICAgY3NyKSAg
ICAgIF9fY3NycjY0IChjc3JfcmVhZCwgICAgICAgICBjc3IsIGNzciAjIyBIKQo+ICsjZGVmaW5l
IGNzcl9yZWFkX3JlbGF4ZWQ2NChjc3IpICAgICAgX19jc3JyNjQgKGNzcl9yZWFkX3JlbGF4ZWQs
IGNzciwgY3NyICMjIEgpCj4gKyNkZWZpbmUgY3NyX3dyaXRlNjQoICAgICAgIGNzciwgdmFsKSBf
X2Nzcnc2NCAoY3NyX3dyaXRlLCAgICAgICAgY3NyLCBjc3IgIyMgSCwgdmFsKQo+ICsjZGVmaW5l
IGNzcl9yZWFkX3NldDY0KCAgICBjc3IsIHZhbCkgX19jc3JydzY0KGNzcl9yZWFkX3NldCwgICAg
IGNzciwgY3NyICMjIEgsIHZhbCkKPiArI2RlZmluZSBjc3Jfc2V0NjQoICAgICAgICAgY3NyLCB2
YWwpIF9fY3NydzY0IChjc3Jfc2V0LCAgICAgICAgICBjc3IsIGNzciAjIyBILCB2YWwpCj4gKyNk
ZWZpbmUgY3NyX2NsZWFyNjQoICAgICAgIGNzciwgdmFsKSBfX2Nzcnc2NCAoY3NyX2NsZWFyLCAg
ICAgICAgY3NyLCBjc3IgIyMgSCwgdmFsKQo+ICsjZGVmaW5lIGNzcl9yZWFkX2NsZWFyNjQoICBj
c3IsIHZhbCkgX19jc3JydzY0KGNzcl9yZWFkX2NsZWFyLCAgIGNzciwgY3NyICMjIEgsIHZhbCkK
PiArI2RlZmluZSBjc3JfY2xlYXI2NCggICAgICAgY3NyLCB2YWwpIF9fY3NydzY0IChjc3JfY2xl
YXIsICAgICAgICBjc3IsIGNzciAjIyBILCB2YWwpCj4gKwo+ICB1bnNpZ25lZCBsb25nIGNzcl9y
ZWFkX251bShpbnQgY3NyX251bSk7Cj4KPiAgdm9pZCBjc3Jfd3JpdGVfbnVtKGludCBjc3JfbnVt
LCB1bnNpZ25lZCBsb25nIHZhbCk7Cj4gLS0KPiAyLjQ4LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKT3RoZXJ3aXNlLCBMR1RNLgoK
UmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApB
bnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
