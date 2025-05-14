Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F280AC3ABC9
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 00:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzT+FuCfL2VXDiqs7ORYqt6QSiA7udLCe7NCHfhObZA=; b=Y/jEkjGgfvOQyH
	WlAUzqNMiGAGW5ez8KiMe+69A8FAXJKibVRiS8B3NxbHqS7eYNbD9c+N6nBGYFHTSIX+KfZuBpP1k
	8Jdkg29jdyac9y6sRkbvgcZmcrRngSryXcGhhz/IUIUpykl5Z9tI9wGuEEMPd06TZrJkQnW855RGN
	qLZKtOZHAQ/AXjhWqPcg1Wc5IBxP3Yn6/g/xTFq8SBA2JMPBjlchqddWJbZ9eHXav8FrIDKq0O7YG
	nHwKhZzmmKpa++u7VdcpNvzsEubgSZSUMgh0ZayiiDqQ4RC8XF/lI8bYeFNYJSGrjBMbZZ8kwl/wL
	BljaD+JtwmgZ5RuBo3Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF05g-0000000DnHx-3a6a;
	Wed, 14 May 2025 00:35:20 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF05e-0000000DnHX-1vYj
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 00:35:19 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43ede096d73so43174035e9.2
        for <opensbi@lists.infradead.org>; Tue, 13 May 2025 17:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1747182916; x=1747787716; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F3dtEXoN5vOgZOHxz7M4qqeEex1MaxhoydUyBqjolSA=;
        b=CduL3crzM2Mu8gjUnK1v70JiV5nMU3T/GmicGdWbUIbe3yMiWOYAnDocO4mazk7p4i
         dOafm6P0jcPW6LGmff7Mzw3Ky+XMcVRhI0G4zzAULkUBV0oMgZU+L0miwAdy3/0GGh/U
         DntYBQnBsIrvGXJwiZbIUrvYXDlydVRbEH2eMXFy5zIsFNgAfk+a4HOe4mEm/htS2p7T
         GeU/qaUtK5h4QhgHcl7uCB0HD/RioykkB+/54PZheK62D9hzIFLfZpwk0dZeRiMaVaiU
         48NU3sn4UKddu1n/CkWxnqGzLJ4nJMzHA7HlsfERGMPYzszZ4YEvDY7yOk5/WiRk39CU
         6hbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747182916; x=1747787716;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3dtEXoN5vOgZOHxz7M4qqeEex1MaxhoydUyBqjolSA=;
        b=dlGqO0m5FKH6PR86i4tNyWYQAiQiIT90LHWwwa2oannXmmXnlHll1bZTgCZbaXhoBt
         xRBytGarwHPqheOzFa9Ml05+n5V36WuiSSm35oZT5PKBT5WiYBQMNEQjcGaHaGL1W48G
         oA9jxOPcqJf65Nv6OvorgC+pyGNM7t0oyzkRG9f9nuc5LAUEWWuqFqH+9s0cMHAv4l7T
         fA30Nbq8TSrbrt4mJv/0UKmd7qRPH2RvNZbUAxToYNLNijxnQeo6yC4UFqTZKI46xyiA
         1X7+/3KxANjPiKmMtIwkVCD9/5VPwuyY0agTtVG65ei49vGhvKgJVwZpyBWzk+en9wr0
         tlxA==
X-Forwarded-Encrypted: i=1; AJvYcCV9he/5kfn751xTBn9iXwsgl9VUZ936LXgpzYwnF/+PZTMlfZsC6vpI+yd2lXvoaVk3yrHLbmW2@lists.infradead.org
X-Gm-Message-State: AOJu0Yyzk/JBdFohKg3fC1ovmlfDtADetsyiaua/4PWmzfFQp0zbYaGe
	Fy1/fzdgagIHDqXx4K+mEIJLhF8LQtEFFKz7XRDFLT5y+4PgzxhOpX1dRPbZux0=
X-Gm-Gg: ASbGncsi9tJwC0FxcGBy+I20yVOVkXNLYyS6YDLf/VboqcFBkUDA28fX3ZO8ZjR1pxn
	Db+kKS06Z//79LiHl+Iqp5416yU3H5MngIeZbt2n/pPGBdsLOLQABDmeqwt7Tg3G51C0x3gFCpe
	8T4t4P/m0anQxSYTHeUS/e269h/i7lWctZ1To2Yh2crf+40hi40CMOV2cOlS43INl2l6hpoycX/
	PAzQWviJKYeV6UncQyuLhZ80DnqkjEe4bUcKll24lf23NmgjlYqyOEow7TI3z8jEb7Wu6/k+4pe
	jt1kulu8rGRFrlCo5x8g/mCfKwCbJAuWFBJ5RXWdls24foRM5zmYxJErVafdlSeCMz+nTA==
X-Google-Smtp-Source: AGHT+IFW1ixWmrPhCwGnVchZ8eTwU6aBmmDN5wxmCL9Jip7oVWRnVi4C1Mo7/L/FtyNZvggAqSehrg==
X-Received: by 2002:a05:600c:4fd3:b0:441:c1ea:ac35 with SMTP id 5b1f17b1804b1-442f4c8fe08mr442475e9.18.1747182916158;
        Tue, 13 May 2025 17:35:16 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368f36sm6844265e9.1.2025.05.13.17.35.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 13 May 2025 17:35:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] lib: sbi: Only enable TM bit in scounteren
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
Date: Wed, 14 May 2025 01:35:04 +0100
Cc: anup@brainfault.org,
 opensbi@lists.infradead.org
Message-Id: <B1E3B737-3E3D-4FCD-ADA1-136F69433F39@jrtc27.com>
References: <20250513-fix_scounteren-v1-1-01018e0c0b0a@rivosinc.com>
To: Atish Patra <atishp@rivosinc.com>
X-Mailer: Apple Mail (2.3826.500.181.1.5)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_173518_513440_223AFDEE 
X-CRM114-Status: GOOD (  21.76  )
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

T24gMTQgTWF5IDIwMjUsIGF0IDAxOjI1LCBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNv
bT4gd3JvdGU6Cgo+IFRoZSBTLW1vZGUgc2hvdWxkIGRpc2FibGUgQ3ljbGUgYW5kIGluc3RydWN0
aW9uIGNvdW50ZXIgZm9yIHVzZXIgc3BhY2UKPiB0byBhdm9pZCBzaWRlIGNoYW5uZWwgYXR0YWNr
cy4gVGhlIExpbnV4IGtlcm5lbCBhbHJlYWR5IGRvZXMgdGhpcyBzbyB0aGF0Cj4gYW55IHJhbmRv
bSB1c2VyIHNwYWNlIGNvZGUgc2hvdWxkbid0IGJlIGFibGUgdG8gbW9uaXRvciBjeWNsZS9pbnN0
cnVjdGlvbgo+IHdpdGhvdXQgaGlnaGVyIHByaXZpbGVnZSBtb2RlIGludm9sdmVtZW50Lgo+IAo+
IFJlbW92ZSB0aGUgQ1kvSVIgYml0cyBpbiBzY291bnRlcm4gaW4gT3BlblNCSS4KCklzbuKAmXQg
dGhpcyBhIGJyZWFraW5nIGNoYW5nZT8gUy1tb2RlIE9TZXMgdGhhdCBhcmUgaGFwcHkgdG8gYWxs
b3cKVS1tb2RlIHRvIHJlYWQgdGhlIGNvdW50ZXJzIGFyZSBub3cgYnJva2VuLCBzdWNoIGFzIEZy
ZWVCU0QuIEJCTCBhbHdheXMKc2V0IHNjb3VudGVyZW4gdG8gYWxsIG9uZXMgKHdpdGggYml0cyBh
Ym92ZSAyIGJlaW5nIHBvaW50bGVzcyB3aXRob3V0CnByb2dyYW1taW5nIG1ocG1ldmVudFgpLCBh
bmQgT3BlblNCSSBkaWQgdGhhdCB1bnRpbCBpdCBzd2l0Y2hlZCB0byB0aGlzCmJlaGF2aW91ciBv
ZiBDWXxUTXxJUi4gU28gd2hldGhlciBvciBub3QgaXQgd2FzIGV4cGxpY2l0IGluIHRoZQpzcGVj
aWZpY2F0aW9uIHdoYXQgdGhlc2Ugd2VyZSBpbml0aWFsaXNlZCB0bywgUy1tb2RlIE9TZXMgZXhp
c3QgdGhhdAphc3N1bWVkIENZLCBUTSBhbmQgSVIgYXQgbGVhc3Qgd2VyZSBhdmFpbGFibGUuIFBs
ZWFzZSBkbyBub3QgYnJlYWsKdGhpbmdzOyB0cmVhdCB0aGUgZmlybXdhcmU8LT5TLW1vZGUgaW50
ZXJmYWNlIGluIHRoZSBzYW1lIHdheSBhcwprZXJuZWw8LT51c2Vyc3BhY2UsIGkuZS4gZG9u4oCZ
dCBicmVhayB1c2Vyc3BhY2UvUy1tb2RlLgoKT1NlcyB0aGF0IHdhbnQgdG8gb3B0IG91dCBjYW4u
IEFuZCBpZiB5b3UgcmVhbGx5IHdhbnQgdG8gcHVzaCBmb3IgdGhpcywKeW91IG5lZWQgdG8gd2Fp
dCBmb3IgT1NlcyB0byBiZSBjaGFuZ2VkIHRvIGV4cGxpY2l0bHkgaW5pdGlhbGlzZQpzY291bnRl
cmVuIGFuZCBvbmx5IGRvIGl0IG9uY2Ugb2xkIHZlcnNpb25zIGFyZSBzdWZmaWNpZW50bHkgcmFy
ZS4gQnV0CnlvdSBjYW7igJl0IGp1c3QgZ28gZG9pbmcgdGhpcyB3aXRoIG5vIHdhcm5pbmcgLyBk
ZXByZWNhdGlvbiBwZXJpb2QuCgpOQUsuCgpKZXNzCgo+IFNpZ25lZC1vZmYtYnk6IEF0aXNoIFBh
dHJhIDxhdGlzaHBAcml2b3NpbmMuY29tPgo+IC0tLQo+IFRvOiBhbnVwIFBhdGVsIDxhbnVwQGJy
YWluZmF1bHQub3JnPgo+IENjOiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAtLS0KPiBs
aWIvc2JpL3NiaV9oYXJ0LmMgfCA0ICsrLS0KPiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMg
Yi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCBmYzQ5MjViNTc2MjUuLjE3N2YzNTZiN2I3NyAx
MDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0
LmMKPiBAQCAtNDksMTAgKzQ5LDEwIEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qg
c2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCj4gCj4gY3NyX3dyaXRlKENTUl9NU1RBVFVTLCBtc3RhdHVz
X3ZhbCk7Cj4gCj4gLSAvKiBEaXNhYmxlIHVzZXIgbW9kZSB1c2FnZSBvZiBhbGwgcGVyZiBjb3Vu
dGVycyBleGNlcHQgZGVmYXVsdCBvbmVzIChDWSwgVE0sIElSKSAqLwo+ICsgLyogRGlzYWJsZSB1
c2VyIG1vZGUgdXNhZ2Ugb2YgYWxsIHBlcmYgY291bnRlcnMgZXhjZXB0IFRNICovCj4gaWYgKG1p
c2FfZXh0ZW5zaW9uKCdTJykgJiYKPiAgICBzYmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkg
Pj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMCkKPiAtIGNzcl93cml0ZShDU1JfU0NPVU5URVJFTiwg
Nyk7Cj4gKyBjc3Jfd3JpdGUoQ1NSX1NDT1VOVEVSRU4sIDB4MDIpOwo+IAo+IC8qKgo+ICogT3Bl
blNCSSBkb2Vzbid0IHVzZSBhbnkgUE1VIGNvdW50ZXJzIGluIE0tbW9kZS4KPiAKPiAtLS0KPiBi
YXNlLWNvbW1pdDogMzE2ZGFhZjFjMjk5YzI5YWM0NmU1MjE0NWY2NTUyMWY0OGVjNjNiNQo+IGNo
YW5nZS1pZDogMjAyNTA1MTItZml4X3Njb3VudGVyZW4tOGI3YjY4MmJiODY0Cj4gLS0KPiBSZWdh
cmRzLAo+IEF0aXNoIHBhdHJhCj4gCj4gCj4gLS0gCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
