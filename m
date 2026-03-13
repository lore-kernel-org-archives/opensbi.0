Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA55B106FD91
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f56XdW9gZ0DYJC2yt73qTsW5RAT0qBAJ0wdub+2oLbM=; b=ES2/F8iIqToXUz
	KPwmUxgservGJ8v+7hn7UQJN7gX80Yd27h1h/Nr8Utq2XHZ1zYN1T6mjv+NyJTKls4xWxE/SopU4U
	FIHGdmsIGcW4q/58Ha0L1O2lbcS30zupZfn6yGTOJvfhwUx70lNEkgjokIieeU3MMDlYzaXRX0+AS
	LSGuFs8jJr09krchSoXeaihX4EuUXhnXtAKzm21lU2J2ylN7k1LJVLZVM3SbPsfNNZ5MRgsL0Bnns
	Xxif0iTW5kU5YoU7AJV1UV/JXNpFDvl+8kcoyNQW4uUdO71iuU/Uodw4E1KRW2UfsTFFKz0V1scLv
	zNgdlJ2SNcBNMlraGHdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wUS-0000000Gvzf-0Y60;
	Fri, 13 Mar 2026 06:59:20 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wUP-0000000Gvye-0o9h
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 06:59:18 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-7d7653db148so1343400a34.2
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 23:59:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773385156; cv=none;
        d=google.com; s=arc-20240605;
        b=ZQqey8JYqluKsjieD8oRd2kmM0Q139IFvz5BzeHA85MdaqRJjQYI4OA75HHUPqLgMA
         7N23nS5LiYvvHu65Ygic3NHyYxinpMD63w9rEoZ8VKzdfSdBlFNAlbyrI02VwI4sML0w
         knQJUUDo5RgdhyWhpSMvSfQSfEYEyO9/OmKuWeEiHnIWyPPLZi6urCbLveei2mzDZ7LD
         xcEHpMtiDoYvK8EYvjO3CJnxJtL264zCW94tcxYZhETZOtPhj0Wik49Rtt+59X5gGKqy
         Zwg5sXtIQzK7GK+wU+xuVpWkhFbNwNty3nGibnOJSeIXuw3bLEr0kJbi5LAxOCzfcsZC
         JSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F9tljTAvPInpKwYnl0ft6c4JRZwnV+Bm7lYqBS/uV8s=;
        fh=mmb7VpB1kALRichQRFEN0aEW4MANgxc8H6PB9Jz5RPU=;
        b=icrUwZ4TrGiD0Y5QHrR53PBzfQlyVKUR77eLT5wFHcUUWLYw+KUTWGnnyFWz+WOPtj
         S3vCOy3/+WlhIJavy3d75LWb6wboQuDp3hcHqyEYCZK3k2WL4oBh93BmJDOmJDnzBbiQ
         bFRCp0u5qR9ChbbFHBX0ymOHvD1TViDm36FM0UGg3IddBNWXE+0o1YBdTCpETgF72pCl
         0uExNIAeDv9auJp/2Arie9WHtttZAhQdsjb2DEU69W4oNWXYRhKWapHlk/wNo3zLVVuA
         B/6rxWl7OYeawSjCK7TLn0dSv5sjXqyRVObVi6fvQ//kbCVSaH7E2SDUBym+4nHGZ1tD
         7v5A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773385156; x=1773989956; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F9tljTAvPInpKwYnl0ft6c4JRZwnV+Bm7lYqBS/uV8s=;
        b=ztAXoAmntleFQ9qvTZvlwvis9RwRTFYul1h5t7q9J1nUx08cSyi8TzXsvz4KrZ0hNy
         ESeoEptqgKiZqqB13B0dPfmAQP0DaewrYjP0/KTCA/l0ucCXWpfPSFr4xpquV+Yn5Cl1
         /tVKDMk3B46JLVaznFCvMSpZiqpIsNA4Y289vIZH9xnfvRLNlBBgdpZcQgUY+WfKrqTC
         Iq1E8sMFZjaKj0UkoLykiV1AzBL4hUpC/k9I/ZRqBeCVhBCL/0XMCIraof8ydaxGwZ6F
         x3/dgjAdBsRw372WsCfKuooct2i3fwVrBjsrQyIFJL8SmGteD1nDa1oH1Du6YYAGAdKY
         GF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385156; x=1773989956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F9tljTAvPInpKwYnl0ft6c4JRZwnV+Bm7lYqBS/uV8s=;
        b=dGCvYfa+uLLQNzPJQ36RZU04ATKgJDnjASRcJDAwLKWJsqQM+BqjIPWAdZwZlxzESe
         LNJ1hKfzZZb6Q6Rk/6ensLNl77K3MLMx6nZX1iFy4D4eJVn4lzk6a5+svPYhRcjNRoib
         sBDwq7yjgq53Q7cGDuuZTXYQaFGBdwLbV3XSxX8xuEIcZ7tsX2r/xmwvGllrMjT5ZdnP
         5PpY71LopOANvxQDkOrM7C0Scon7kmdOOpOa0gqFYAtzl74z/turzvw/7+8uhq0sMJ/1
         UXd2P9ZgbDZZL6SRpelgM2S2YzV8Hvuf+CyMgV3ANbMibppVF37Fb8KGDEr+5xh7QqIT
         mRDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUH8F1nmwlBygC0bJnCM/IhN1+cFjGfIyAsFmz8jhdyrNUZQa1A1B2Dp43taHCd+dziQ7QZ4u2X@lists.infradead.org
X-Gm-Message-State: AOJu0YxKCb5pg/wuC3emFhnbc6aoe3ush8ATtFkxpUU5xYbJy5b3QMaV
	3kPbThwmAjSrefqi5SlU0MxLJM6Ye5j0njsfVrtavEGw0hcc7qtY3deVNsucO/PZsNeduQ2Qz5g
	OW265/o9Vk3KjzWSwdgTGCJmukryq1R2SRiaXbnyg7JOK3jjqwt0Es+gOdA==
X-Gm-Gg: ATEYQzwIY/uhq5kTL0ZMOtuDEWmQqDzOOut82s0RefDDiG8tbm64bRnyTP0Q/qblEL1
	0dcTJdgT2oJrz33QuoME1Ap8tGkRDuxMKmKFjBc+x2RdDxtT+/xBklK6NgYVTbo/nSyVsCH6D2H
	4EvuCpR8iYO8yEk3LY07o/Og8LV2RgRfVkveVnue88TRMNEK/AGeo8iYXlGbcrMbVg+gLdRgXDA
	NHIBeOByMPZmH7V0MrWW+mITGB03pr+8mIlClXMAsIG1Ojm64gLlTRJue6IkxyW0QI4/QKu9TR3
	WRt09O7VG6Eg7wON5sKjqQwo4BosdXT3Bq4+H0I37JkfDv9XIyHRy2IbEPLQP9NnGHvWhn8y6fN
	MtH77iJC9ozq7WbXphWOifP6lWA==
X-Received: by 2002:a05:6820:1349:b0:67b:c368:1353 with SMTP id
 006d021491bc7-67bda9b5875mr1571980eaf.25.1773385155685; Thu, 12 Mar 2026
 23:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260311171103.70074-1-dave.patel@riscstar.com>
 <1b1d72fb-482f-49db-b41b-53bfef6edb3d@iscas.ac.cn> <88dca6b0-46cc-453d-8a5f-00e0c7181550@sifive.com>
 <ec7f6648-c2a7-4250-8079-fb5baefb0bf3@iscas.ac.cn> <56c57ce1-5ac4-44b9-81c0-02c6025c4edc@sifive.com>
 <3208508c-cf73-4878-9d87-76d58e821cc4@sifive.com>
In-Reply-To: <3208508c-cf73-4878-9d87-76d58e821cc4@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Mar 2026 12:29:04 +0530
X-Gm-Features: AaiRm52TeuFCHyEf3kuG6Jb31udKXpogGsKOM89lkfd5mVx9VLsE1gzFSEZDxwE
Message-ID: <CAAhSdy1u_10EkrQN7RDCiAcgRVEwYGOkBfNQFg7dDkrqcmRsew@mail.gmail.com>
Subject: Re: [RFC] OpenSBI: Lazy floating-point and vector context switching
To: Samuel Holland <samuel.holland@sifive.com>
Cc: dave.patel@riscstar.com, Scott Bambrough <scott@riscstar.com>, 
	Robin Randhawa <robin.randhawa@sifive.com>, Anup Patel <anup.patel@qti.qualcomm.com>, 
	Ray Mao <raymond.mao@riscstar.com>, Anup Patel <anuppate@qti.qualcomm.com>, 
	Dhaval <dhaval@rivosinc.com>, Peter Lin <peter.lin@sifive.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_235917_539178_4C1FC9CB 
X-CRM114-Status: GOOD (  38.62  )
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgNjo0M+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEhpIERhdmUsCj4KPiBPbiAyMDI2LTAzLTEy
IDY6MjMgUE0sIFNhbXVlbCBIb2xsYW5kIHdyb3RlOgo+ID4gT24gMjAyNi0wMy0xMiAxMjozMyBQ
TSwgVml2aWFuIFdhbmcgd3JvdGU6Cj4gPj4gT24gMy8xMi8yNiAyMjoxMywgU2FtdWVsIEhvbGxh
bmQgd3JvdGU6Cj4gPj4+IE9uIDIwMjYtMDMtMTIgNDoxNCBBTSwgVml2aWFuIFdhbmcgd3JvdGU6
Cj4gPj4+PiBPbiAzLzEyLzI2IDAxOjExLCBkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbSB3cm90ZToK
PiA+Pj4+PiBIaSBPcGVuU0JJIG1haW50YWluZXJzIGFuZCBjb21tdW5pdHksCj4gPj4+Pj4KPiA+
Pj4+PiBJIGFtIHdvcmtpbmcgb24gYW4gaW1wbGVtZW50YXRpb24gdG8gc3VwcG9ydCBmbG9hdGlu
Zy1wb2ludCAoRlApIGFuZAo+ID4+Pj4+IHZlY3RvciByZWdpc3RlciBjb250ZXh0IG1hbmFnZW1l
bnQgZHVyaW5nIGRvbWFpbiBhbmQgYXBwbGljYXRpb24KPiA+Pj4+PiBjb250ZXh0IHN3aXRjaGVz
IGluIE9wZW5TQkkuCj4gPj4+Pj4KPiA+Pj4+PiBDdXJyZW50bHksIE9wZW5TQkkgc2F2ZXMgYW5k
IHJlc3RvcmVzIG9ubHkgdGhlIGludGVnZXIgcmVnaXN0ZXIKPiA+Pj4+PiBjb250ZXh0IHdoZW4g
aGFuZGxpbmcgdHJhcHMgb3IgZG9tYWluIHRyYW5zaXRpb25zLiBUaGUgRlAgcmVnaXN0ZXJzCj4g
Pj4+Pj4gKGYw4oCTZjMxKSBhbmQgdmVjdG9yIHJlZ2lzdGVycyAodjDigJN2MzEpIGFyZSBub3Qg
Y3VycmVudGx5IG1hbmFnZWQgYnkKPiA+Pj4+PiBPcGVuU0JJLgo+ID4+Pj4+Cj4gPj4+Pj4gV2l0
aCBpbmNyZWFzaW5nIGFkb3B0aW9uIG9mIHRoZSBSSVNDLVYgdmVjdG9yIGV4dGVuc2lvbiBhbmQK
PiA+Pj4+PiBmbG9hdGluZy1wb2ludCB3b3JrbG9hZHMsIGl0IGJlY29tZXMgaW1wb3J0YW50IHRv
IGVuc3VyZSBjb3JyZWN0Cj4gPj4+Pj4gYmVoYXZpb3Igd2hlbiBTLW1vZGUgc29mdHdhcmUgb3Ig
dHJ1c3RlZCBhcHBsaWNhdGlvbnMgdXNlIHRoZXNlCj4gPj4+Pj4gZXhlY3V0aW9uIHVuaXRzLgo+
ID4+Pj4+Cj4gPj4+Pj4gVGhpcyBlbWFpbCBwcm9wb3NlcyBhbiBhcHByb2FjaCB0byBzdXBwb3J0
IGxhenkgRlAgYW5kIHZlY3Rvcgo+ID4+Pj4+IGNvbnRleHQgc3dpdGNoaW5nLCBhbGlnbmVkIHdp
dGggdGhlIG1lY2hhbmlzbSBkZXNjcmliZWQgaW4gdGhlCj4gPj4+Pj4gUklTQy1WIHByaXZpbGVn
ZWQgc3BlY2lmaWNhdGlvbi4KPiA+Pj4+Pgo+ID4+Pj4+IC0tLQo+ID4+Pj4+Cj4gPj4+Pj4gIyMg
QmFja2dyb3VuZAo+ID4+Pj4+Cj4gPj4+Pj4gSW4gUklTQy1WLCB0aGUgYEZTYCAoRmxvYXRpbmct
cG9pbnQgU3RhdGUpIGFuZCBgVlNgIChWZWN0b3IgU3RhdGUpCj4gPj4+Pj4gZmllbGRzIGluIGBt
c3RhdHVzYCAvIGBzc3RhdHVzYCBjb250cm9sIGFjY2VzcyB0byB0aGUgZmxvYXRpbmctcG9pbnQK
PiA+Pj4+PiBhbmQgdmVjdG9yIHVuaXRzLgo+ID4+Pj4+Cj4gPj4+Pj4gV2hlbiB0aGVzZSBmaWVs
ZHMgYXJlIHNldCB0byBgT2ZmYCwgYW55IGF0dGVtcHQgdG8gZXhlY3V0ZSBGUCBvcgo+ID4+Pj4+
IHZlY3RvciBpbnN0cnVjdGlvbnMgcmVzdWx0cyBpbiBhbiBpbGxlZ2FsIGluc3RydWN0aW9uIHRy
YXAuCj4gPj4+Pj4KPiA+Pj4+PiBUaGlzIG1lY2hhbmlzbSBhbGxvd3Mgb3BlcmF0aW5nIHN5c3Rl
bXMgYW5kIGZpcm13YXJlIHRvIGltcGxlbWVudAo+ID4+Pj4+IGxhenkgY29udGV4dCBzd2l0Y2hp
bmcgd2hlcmUgRlAvdmVjdG9yIHJlZ2lzdGVycyBhcmUgc2F2ZWQgb3IKPiA+Pj4+PiByZXN0b3Jl
ZCBvbmx5IHdoZW4gdGhleSBhcmUgYWN0dWFsbHkgdXNlZC4KPiA+Pj4+IFRoaXMgZG9lcyBub3Qg
d29yayBpbiBNYWNoaW5lIG1vZGUsIHdoZXJlIE9wZW5TQkkgcmVzaWRlcy4KPiA+Pj4+Cj4gPj4+
PiBTZWUgcHJpdmlsZWdlZCBzcGVjLCBzZWN0aW9uICJFeHRlbnNpb24gQ29udGV4dCBTdGF0dXMg
aW4gbXN0YXR1cwo+ID4+Pj4gUmVnaXN0ZXIiOiAiTWFjaGluZSBhbmQgU3VwZXJ2aXNvciBtb2Rl
cyBzaGFyZSBhIHNpbmdsZSBjb3B5IG9mIHRoZSBGUywKPiA+Pj4+IFZTLCBhbmQgWFMgYml0cy4i
Cj4gPj4+Pgo+ID4+Pj4gVGhpcyBtZWFucyB0aGF0IGEgU3VwZXJ2aXNvciBtb2RlIHByb2dyYW0g
Y2FuIHNldCBzc3RhdHVzLkZTIHRvIERpcnR5LAo+ID4+Pj4gYWNjZXNzIGZsb2F0aW5nIHBvaW50
IHN0YXRlLCBhbmQgc2V0IHNzdGF0dXMuRlMgYmFjayB0byBPZmYgd2l0aG91dAo+ID4+Pj4gTWFj
aGluZSBtb2RlIHNvZnR3YXJlIG5vdGljaW5nIGV2ZXIuCj4gPj4+Pgo+ID4+Pj4gU2VlIGFsc28g
aHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWlzYS1tYW51YWwvaXNzdWVzLzgzMgo+ID4+
Pj4gIkltcG9zc2libGUgdG8gaW1wbGVtZW50IEhTLWxldmVsIHNzdGF0dXMue0ZTLFZTfSA9IE9m
ZiB3aXRoCj4gPj4+PiBzb2Z0d2FyZS1lbXVsYXRlZCBoeXBlcnZpc29yIGV4dGVuc2lvbj8iIHdo
ZXJlIEkgcmFuIGludG8gdGhlIHNhbWUKPiA+Pj4+IHByb2JsZW0gaW4gYSBkaWZmZXJlbnQgY29u
dGV4dC4KPiA+Pj4+Cj4gPj4+PiBTbyBiYXNpY2FsbHksIGxhenkgc2F2aW5nL3Jlc3RvcmluZyBG
IGFuZCBWIGluIE1hY2hpbmUgbW9kZSB3aXRoCj4gPj4+PiBtdWx0aXBsZSBTdXBlcnZpc29yIG1v
ZGUgcHJvZ3JhbXMgaXMgbm90IGEgZGVzaWduZWQgZmVhdHVyZSwgYW5kIGlzIG5vdAo+ID4+Pj4g
cG9zc2libGUgYXMgdGhlIHByaXZpbGVnZWQgYXJjaGl0ZWN0dXJlIGlzIGN1cnJlbnRseSBkZXNp
Z25lZC4gRm9yIHRoZXNlCj4gPj4+PiB1c2UgY2FzZXMgbm9uLWxhenkgc3dpdGNoaW5nIGlzIHJl
cXVpcmVkLgo+ID4+PiBBcyB5b3UgbWVudGlvbmVkIGluIGluIHRoYXQgR2l0aHViIGlzc3VlLCBp
dCBpcyBhbHNvIHBvc3NpYmxlIHRvIGZvcmNlCj4gPj4+IGZsb2F0aW5nLXBvaW50IGluc3RydWN0
aW9ucyB0byB0cmFwIGJ5IGNsZWFyaW5nIG1pc2EuRi4gSG93ZXZlciwgbm90ZSB0aGlzCj4gPj4+
IGNsYXVzZSBpbiB0aGUgbWlzYSBzcGVjaWZpY2F0aW9uOgo+ID4+Pgo+ID4+PiAiV2hlbiBzb2Z0
d2FyZSBlbmFibGVzIGFuIGV4dGVuc2lvbiB0aGF0IHdhcyBwcmV2aW91c2x5IGRpc2FibGVkLCB0
aGVuIGFsbCBzdGF0ZQo+ID4+PiB1bmlxdWVseSBhc3NvY2lhdGVkIHdpdGggdGhhdCBleHRlbnNp
b24gaXMgVU5TUEVDSUZJRUQsIHVubGVzcyBvdGhlcndpc2UKPiA+Pj4gc3BlY2lmaWVkIGJ5IHRo
YXQgZXh0ZW5zaW9uLiIKPiA+Pj4KPiA+Pj4gU28gZmxvYXRpbmctcG9pbnQgc3RhdGUgbXVzdCBh
bHdheXMgYmUgc2F2ZWQgb24gYSBtaXNhLkYgMS0+MCB0cmFuc2l0aW9uIGFuZAo+ID4+PiByZXN0
b3JlZCBvbiBhIG1pc2EuRiAwLT4xIHRyYW5zaXRpb24uIFRoaXMgZG9lcyBzb21ld2hhdCByZWR1
Y2UgdGhlCj4gPj4+IGVmZmVjdGl2ZW5lc3Mgb2YgdGhlIGxhenkgY29udGV4dCBzYXZpbmcsIGJ1
dCBzdGlsbCBwcm92aWRlcyBzb21lIGJlbmVmaXQuIEFuZAo+ID4+PiB0aGlzIHNjaGVtZSBncmFj
ZWZ1bGx5IGRlZ3JhZGVzIG9uIHN5c3RlbXMgd2hlcmUgbWlzYS5GIGlzIG5vdCB3cml0YWJsZS4g
U28KPiA+Pj4gdW5sZXNzIEkgYW0gbWlzc2luZyBzb21ldGhpbmcsIGhpZGluZyBGUCBzdGF0ZSB1
c2luZyBtaXNhIGJpdHMgc2hvdWxkIHdvcmsgZm9yCj4gPj4+IHRoZSBjdXJyZW50IHVzZSBjYXNl
Lgo+ID4+Cj4gPj4gSSdtIGEgYml0IGNvbmZ1c2VkIGFib3V0IHRoZSAwLT4xIGFuZCAxLT4wIHRy
YW5zaXRpb24gdGVybWlub2xvZ3kgYnV0IEkKPiA+PiBnZXQgdGhlIGlkZWEuIEl0ICp3b3VsZCog
d29yaywgeWVzLgo+ID4KPiA+IFNvcnJ5IGZvciB0aGUgY29uZnVzaW9uLiBUbyByZXdvcmQ6IHRo
ZSBGUCBjb250ZXh0IG11c3QgYmUgc2F2ZWQgZXZlcnkgdGltZSB0aGUKPiA+IG1pc2EuRiBiaXQg
aXMgY2xlYXJlZCAoRi9EL1YgZXh0ZW5zaW9uIGRpc2FibGVkKSwgYmVjYXVzZSBpdCBtdXN0IGJl
IHJlc3RvcmVkCj4gPiBldmVyeSB0aW1lIHRoZSBtaXNhLkYgYml0IGlzIGxhdGVyIHNldCAoRiBl
eHRlbnNpb24gZW5hYmxlZCksIGJlY2F1c2UgdGhlCj4gPiByZWdpc3RlciBzdGF0ZSBpcyBvdGhl
cndpc2UgdW5zcGVjaWZpZWQgaW1tZWRpYXRlbHkgYWZ0ZXIgdGhlIG1pc2EuRiBiaXQgaXMgc2V0
Lgo+ID4KPiA+IFRoaXMgaXMgaW4gY29udHJhc3QgdG8gbXN0YXR1cy5GUywgd2hlcmUgeW91IGNh
biBzZXQgdGhlIGZpZWxkIHRvIE9mZiB3aGlsZSB0aGUKPiA+IEZQIHJlZ2lzdGVycyBob2xkIGRv
bWFpbiBBJ3MgY29udGV4dCwgc3dpdGNoIHRvIGRvbWFpbiBCIGFuZCBiYWNrIHRvIEEsIHRoZW4g
c2V0Cj4gPiBtc3RhdHVzLkZTIGJhY2sgdG8gRGlydHksIGFsbCB3aXRob3V0IGxvc2luZyBhbnkg
cmVnaXN0ZXIgc3RhdGUuIFNvIG1pc2EuRiBpcwo+ID4gbm90IGFzIGxhenkgYXMgbXN0YXR1cy5G
Uy4KPiA+Cj4gPj4gSXQncyBqdXN0IHRoYXQgSSBhbSBub3QgYXdhcmUgb2YgYW55IGV4aXN0aW5n
IGhhcmR3YXJlIGltcGxlbWVudGF0aW9uCj4gPj4gaGF2aW5nIHdyaXRhYmxlIG1pc2EuRiBhbmQv
b3IgbWlzYS5WIChhcyBvcHBvc2VkIHRvIHhzdGF0dXMue0ZTLFZTfQo+ID4+IHdoaWNoIGFyZSBt
YW5kYXRvcnkgaWYgRiBhbmQgViBhcmUgaW1wbGVtZW50ZWQsIHJlc3BlY3RpdmVseSksIHNvIEkg
ZGlkCj4gPj4gbm90IGNvbnNpZGVyIGl0Lgo+ID4+Cj4gPj4gVG8gbWUsIHdyaXRhYmxlIG1pc2Eg
aXMgb25lIG9mIHRob3NlIGZ1bm55IGZlYXR1cmVzIHRoYXQgdGhlIHNwZWMKPiA+PiB0ZWNobmlj
YWxseSBwZXJtaXRzIGJ1dCBub2JvZHkgYWN0dWFsbHkgaW1wbGVtZW50cyBpbiBIVy4gSSdtIGhh
cHB5IHRvCj4gPj4gY2hhbmdlIG15IG1pbmQgYWJvdXQgdGhhdCBpZiBzb21lIHJlYWwgaGFyZHdh
cmUgaGFzIHdyaXRhYmxlIG1pc2EuRiBhbmQKPiA+PiBtaXNhLlYuCj4gPgo+ID4gVGhhdCdzIGZh
aXIuIEkga25vdyBhdCBsZWFzdCBvbmUgcmVhbC1pc2ggaW1wbGVtZW50YXRpb24sIFJvY2tldFsx
XSwgaGFzIHRoaXMKPiA+IGNhcGFiaWxpdHksIGJ1dCBJJ20gYWxzbyB1bmF3YXJlIG9mIGEgcHVi
bGljIGNvbW1lcmNpYWwgU29DIHdpdGggdGhpcyBmZWF0dXJlLgo+ID4gVGhhdCBiZWluZyBzYWlk
LCBzaW5jZSB0aGlzIGlzIHRoZSBleGlzdGluZyBhcmNoaXRlY3R1cmFsIHdheSB0byB0cmFjayBG
UCB1c2FnZQo+ID4gZnJvbSBNLW1vZGUgKGFkbWl0dGVkbHkgd2l0aCB0aGUgYWJvdmUgbGltaXRh
dGlvbiksIEkgd291bGQgZXhwZWN0IHB1c2hiYWNrIHRvCj4gPiBhZGRpbmcgYW55IGR1cGxpY2F0
ZSBvciBvdmVybGFwcGluZyBtZWNoYW5pc20uIFNvIHdlIG1pZ2h0IHNlZSBpbXBsZW1lbnRhdGlv
bnMKPiA+IGFkZCB0aGlzIGNhcGFiaWxpdHkgYXMgdGhleSBzdGFydCB0byBhZGQgU3VwZXJ2aXNv
ciBEb21haW5zIGZlYXR1cmVzLgo+Cj4gSSByYWlzZWQgdGhpcyBhdCBodHRwczovL2dpdGh1Yi5j
b20vcmlzY3YvcmlzY3Ytc21tdHQvaXNzdWVzLzI2NCBhbmQgdGhlCj4gcmVzcG9uc2UgZnJvbSBW
ZWQgd2FzICJFbmhhbmNpbmcgc3VwcG9ydCBmb3IgbGF6eSBzYXZlL3Jlc3RvcmUgaGFzIGJlZW4K
PiBkaXNjdXNzZWQgcHJldmlvdXNseSBhbmQgaXMgbm90IGxpa2VseSB0byBiZSBhY2NlcHRlZCIu
Cj4KPiBTbyBpdCBzZWVtcyB0aGF0IHRoZSBvcHRpb25zIGFyZToKPiAxKSBlYWdlciBjb250ZXh0
IHN3aXRjaGluZywKPiAyKSBvcHRpb25hbGx5IHdpdGggb3Bwb3J0dW5pc3RpYyB1c2Ugb2YgbWlz
YS57RCxGLFZ9IGlmIHRob3NlIGJpdHMgYXJlIHdyaXRhYmxlLgoKQ3VycmVudGx5LCBJIGFtIGxl
YW5pbmcgdG93YXJkcyBvcHRpb24gIzEgYmVjYXVzZToKPT4gbWlzYS57RCxGLFZ9IGFyZSBub3Qg
d3JpdGFibGUgb24gYWxsIFJJU0MtViBwbGF0Zm9ybXMKPT4gZG9tYWluIGNvbnRleHQgc3dpdGNo
aW5nIGlzIGxlc3MgZnJlcXVlbnQgYW5kIG9uLWRlbWFuZAogICAgIGNvbXBhcmVkIHRvIExpbnV4
IHRhc2sgc3dpdGNoaW5nCgpJbiB0aGUgbG9uZyBydW4sIG9wdGlvbiAjMSBjYW4gYmUgdGhlIGRl
ZmF1bHQgYW5kIHdlIGNhbiBkbwpvcHRpb24gIzIgc2VsZWN0aXZlbHkgb24gcGxhdGZvcm1zIHdp
dGggd3JpdGFibGUgbWlzYXtELEYsVn0gYml0cy4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
