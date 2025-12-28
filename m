Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E104EE784BE
	for <opensbi@archiver.kernel.org>; Sun, 28 Dec 2025 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=36K5r654A6D5kATA3K90xmbNYz97J1OyZ1jlqvtgDls=; b=MxLYMxDoBBiReM
	tEpOi5QyRx1Y1o4Ub49oN2B/QqH/JuQmeN2tD+4Tw4syoevBR1m4WX3c0QFPtWeDi0lyxK3yE3rk+
	ooPo3BIPXN4Ls4s5t5wQmpRyTC+v9IyFQ8eggvnUV0AKOQDwzGhkXwzxPs8XO+R5j4VnweqGW3Mw1
	Qroog4Vj1OU5dHm9dbvowpCXVMn0H2RmdxFH9grq4Cy89Gx4x9nh8i4ePo+uX5Ox4w4gpTeuu5fek
	C2hn6NF0CXJt04YrIUuBr1bAyZiXJz8b3emlLicjz4aclzOAsZk+GUf8SFw66CalIcQzGY0W0VmYS
	sKBnPKEv7dOufhk16rOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsnV-00000002qZe-3wad;
	Sun, 28 Dec 2025 15:35:09 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZsnT-00000002qZH-0rik
	for opensbi@lists.infradead.org;
	Sun, 28 Dec 2025 15:35:08 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-65cf050a5cdso5129083eaf.1
        for <opensbi@lists.infradead.org>; Sun, 28 Dec 2025 07:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1766936106; x=1767540906; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/H0WzGUOapQo1o+u1rvwrkP+F/4w9aTvzGCwCYHKViY=;
        b=g5MrvP5FrnUeiXKm0JC8H/8ECZvKBzqh1rX91aNTtq6TaU9Goo8daGtzJvXPG435az
         VAyJp2+YdRUR+7YCdgdEYDExRUR/c5z02FgF3tkUkFwE9v79mC6aN/G6ONB2TSzjuazI
         eH0hfX/fwZHKjym4apm6pWpuPf5fKbr0/j1ISmlfsF255M/5atfN1U6kfR2H1qBLCvW5
         pzdS7H+zoKwwys7U7snWom5Lvebb8ysAQlbJZV7yBQuOQZjdhcoaaE9Vg1MwCyLGxker
         3QvzjGpyeaRRap8Iy3vYmF203/r+QYr6R26ykTF0Qmxn5vjQDCzx+YW4KvQayFjSpnuR
         ikfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766936106; x=1767540906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/H0WzGUOapQo1o+u1rvwrkP+F/4w9aTvzGCwCYHKViY=;
        b=ipFLpHK8xsMlMmH3O1tV4NVBFa3jsCm8bZXon/jV2DirW3dISOtS0AEBESFwBtiLVi
         DM1D1r/yvO6l84tt/BGQEwXUPU4Ua7ENiarOsD2fzPBwqTfDg0OTrERPFWxtRDOkBdVg
         G/X7sjHLBb2JTD0MBcgZQX8TaiXmDjsl6d3yPO+8Sm0XHRT0ijnM9RxcnCYYQ2OXat8z
         ip6b5IUf63fnpJsvJFS7KrjoFkCRx0Ma2zHJADC91suW+1TawlhuzyVAwSXfvr88DGnS
         RCGHWT+Yzr0ASyUeVKTTuaWgusw3P52kVBOqB9BN99hjxrOb1hh3FCTuNsQdaB2t96DC
         uBEw==
X-Gm-Message-State: AOJu0Yz07UsdmuMZYnOfAPdoggoqQWEcQ/UIPszB5sPm5IbK6T5KopyG
	hWAcWbU3sv1HZNS5O51LzlkjS3QrzXxrTTZNCPA29jg3GMa31BIrzYwMx57V3FA2F1wmxVR+Wxq
	CfXeklo5/LVOWWhlvWed+oxOSZXN6htA4aKyh+drx/gnfmOkMd+W4bLoTUg==
X-Gm-Gg: AY/fxX7EvKApyGHWTMGWjl7C9ahIdWw7Hj+UW23fyVc0wmba1xIoKbbD3GujHrT/OWm
	ncbktp0vGKVJGOrIR0FnUifYNf+SjjLtKU51XkOg7elviKNixaXxZpGoUArgovOYk+fm8gP/6Op
	W+RbclY3TzwRLsxNtQ3iV9IQrKz2bfHcxeJZQlczr2izrIDVR2B33e9Jk+74BEPWLt6P4WQMKtd
	5JYLXikq7C6Jzf8flzzj5pUpFNcAG89XhqGwWESVCGffTlLUrWk96x8qmlS3+8dhZYZH+NOUL5u
	yBpptTPPyKsAciQJVbEqGKAQ2aKg8uPwlSCln8WpFQoPdLy8Mx9H0ilaXQ==
X-Google-Smtp-Source: AGHT+IFQUr/s8/XhaxM178VjmmScEiNPcrp29AiBLiumoc+ydpEtDJBHvR8j/pGLOGauwG5NexktVjtTVRiUDmnOl3k=
X-Received: by 2002:a05:6820:2225:b0:65b:295f:ee08 with SMTP id
 006d021491bc7-65cfe6a6f77mr12987647eaf.10.1766936106044; Sun, 28 Dec 2025
 07:35:06 -0800 (PST)
MIME-Version: 1.0
References: <20251210151046.37177-1-wxjstz@126.com>
In-Reply-To: <20251210151046.37177-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 28 Dec 2025 21:04:55 +0530
X-Gm-Features: AQt7F2oHE5e_vUTFVx6dB8H3qdiR5fZOqr4QxUlpQObN2xO8Yq-poKbvbiTCBqc
Message-ID: <CAAhSdy3nChD8e-m8KAS8BxY9ydrsEaw1vOdsSzFchah815gLhQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] firmware: Initialize stack guard via Zkr
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_073507_254696_128D7835 
X-CRM114-Status: GOOD (  13.12  )
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

T24gV2VkLCBEZWMgMTAsIDIwMjUgYXQgODo0MOKAr1BNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IFRyeSB0byBpbml0aWFsaXplIHN0YWNrIHByb3RlY3Rpb24gZ3VhcmQgdmlh
IHRoZSB6a3IgZXh0ZW5zaW9uLgo+Cj4gU2lnbmVkLW9mZi1ieTogWGlhbmcgVyA8d3hqc3R6QDEy
Ni5jb20+Cj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpJ
IHRoaW5rIG15IFJldmlld2VkLWJ5IHdhcyBwcmVtYXR1cmUgcHJldmlvdXNseS4gUGxlYXNlIHNl
ZQpmZXcgY29tbWVudHMgYmVsb3cuCgo+IC0tLQo+IHYyIGNoYW5nZXM6IGFkZCAnW1BBVENIXScK
Pgo+ICBmaXJtd2FyZS9md19iYXNlLlMgfCAyNCArKysrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9maXJtd2Fy
ZS9md19iYXNlLlMgYi9maXJtd2FyZS9md19iYXNlLlMKPiBpbmRleCA1MzAwZWNmMi4uOTUzZmJh
OTUgMTAwNjQ0Cj4gLS0tIGEvZmlybXdhcmUvZndfYmFzZS5TCj4gKysrIGIvZmlybXdhcmUvZndf
YmFzZS5TCj4gQEAgLTEwNyw2ICsxMDcsMzAgQEAgX2Jzc196ZXJvOgo+ICAgICAgICAgYWRkICAg
ICBzNCwgczQsIF9fU0laRU9GX1BPSU5URVJfXwo+ICAgICAgICAgYmx0ICAgICBzNCwgczUsIF9i
c3NfemVybwo+Cj4gKyAgICAgICAvKiBUcnlpbmcgdG8gaW5pdGlhbGl6ZSB0aGUgc3RhY2sgZ3Vh
cmQgdmlhIHRoZSBaa3IgZXh0ZW5zaW9uICovCj4gKyAgICAgICBsbGEgICAgIHQwLCBfX3N0YWNr
X2Noa19ndWFyZF9kb25lCj4gKyAgICAgICBjc3J3ICAgIENTUl9NVFZFQywgdDAKPiArICAgICAg
IGxpICAgICAgdDAsIDAKPiArICAgICAgIGxpICAgICAgdDMsIDIKPiArICAgICAgIGxpICAgICAg
dDQsIDB4ZmZmZgo+ICsgICAgICAgbGkgICAgICB0NSwgX19TSVpFT0ZfUE9JTlRFUl9fCj4gK19f
c3RhY2tfY2hrX2d1YXJkX2xvb3A6Cj4gKyAgICAgICBjc3JydyAgIHQxLCBDU1JfU0VFRCwgeDAK
PiArICAgICAgIHNybGkgICAgdDIsIHQxLCAzMAo+ICsgICAgICAgYW5kaSAgICB0MiwgdDIsIDMK
CldlIGhhdmUgdmFyaW91cyBoYXJkLWNvZGVkIHZhbHVlcyByZWxhdGVkIHRvIFNFRUQKQ1NSIG92
ZXIgaGVyZS4gUGxlYXNlIGludHJvZHVjZSBhcHByb3ByaWF0ZSBkZWZpbmVzIGluCnJpc2N2X2Vu
Y29kaW5nLmggYW5kIHVzZSBpdCBvdmVyIGhlcmUuCgo+ICsgICAgICAgYmd0ICAgICB0MiwgdDMs
IF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUKPiArICAgICAgIGJsdCAgICAgdDIsIHQzLCBfX3N0YWNr
X2Noa19ndWFyZF9sb29wCj4gKyAgICAgICBhbmQgICAgIHQxLCB0MSwgdDQKPiArICAgICAgIHNs
bGkgICAgdDAsIHQwLCAxNgo+ICsgICAgICAgb3IgICAgICB0MCwgdDAsIHQxCj4gKyAgICAgICBh
ZGRpICAgIHQ1LCB0NSwgLTIKClNob3VsZCB0aGlzIG5vdCBiZSAiYWRkaSB0NSwgdDUsIC0xNiIg
c2luY2Ugd2UgYXJlCnJlYWRpbmcgMTYgYml0cyBvZiBlbnRyb3B5IGluIG9uZSBsb29wIGl0ZXJh
dGlvbiA/Cgo+ICsgICAgICAgYmd0eiAgICB0NSwgX19zdGFja19jaGtfZ3VhcmRfbG9vcAo+ICsg
ICAgICAgbGxhICAgICB0MSwgX19zdGFja19jaGtfZ3VhcmQKPiArICAgICAgIFJFR19TICAgdDAs
IDAodDEpCj4gKyAgICAgICBqICAgICAgIF9fc3RhY2tfY2hrX2d1YXJkX2RvbmUKPiArICAgICAg
IC5hbGlnbiAzCj4gK19fc3RhY2tfY2hrX2d1YXJkX2RvbmU6Cj4gKwo+ICAgICAgICAgLyogU2V0
dXAgdGVtcG9yYXJ5IHRyYXAgaGFuZGxlciAqLwo+ICAgICAgICAgbGxhICAgICBzNCwgX3N0YXJ0
X2hhbmcKPiAgICAgICAgIGNzcncgICAgQ1NSX01UVkVDLCBzNAo+IC0tCj4gMi40Ny4zCj4KClJl
Z2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
