Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D383C3ABA4
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 14:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8a/DAU4ZwD1Xn9uue5EeyayKivXxXcQ6WzyuHhRAcRc=; b=GycEenTD7yv3W2
	nlGQUaEagmBlG0+WDOv5ud4rwn6NPepuI5kMh4XiJKwpV2rhuqfdGYUEIQhRycEQKB5oltvKGe3Ct
	YyJmeLd6nWGidEuddZ1cQYsSPUWVEgpwzMQ5Gzwyq2bRlR/QexSpHUlzzdasHxLznGEnB/yt6/oQl
	xBF3YCEN9GnPYXuKl3kFJ671wqemFrWGuHHE/wDB4K+95I5JzNJc3fKke5HjD6gM9s1Ih7y1M/ms7
	lTnizcL30nE9LDs3uu7nODGIkoNINio0U+crrNCs0gO0SIthXQ3lFc205m/MJmPNxKL3BzvuDJ6N2
	aYGw11ZGPEfI3N4uXT+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9PHA-00000006b6q-2tym;
	Mon, 28 Apr 2025 14:16:04 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9NmA-00000006DxK-3srv
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 12:40:00 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85de3e8d0adso69637239f.1
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 05:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745843998; x=1746448798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfroCneOfpIEybgOWvxJyEgokCsvDW9MQAOvvZ392nw=;
        b=HvyZtvJBGdpHqJ2IMzMhgN9BkAduHqtAez7VECD8KCVoUR4ARCsEJ/YhZHNekBnuiW
         0M5A98bJ1huQUuSl4lKAfPT7Jbbg3qAPyebsv/7+f7MHS0hfKJHTo0vbf+14MUg+PC8x
         ll6nrE3lHiT4WkjjvYJF2OBafgZwlq0AaWAuekNXrRV/ZLFn5e4PPAAG65piD7NM7Wjl
         +CivT7RTqfQ2cvl/e1vvFbfIsuEbH3a22IhEkklEo5BaMvOKzwpQzsTCNzsdD1PotPeR
         wkewOU9gF8KA8ANS29Zx7jTL291RnTVs+ZX8WnoodoKEoYozhsSjKyCeZ5z/1to5eI6t
         Gvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745843998; x=1746448798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfroCneOfpIEybgOWvxJyEgokCsvDW9MQAOvvZ392nw=;
        b=tIRfR2r0X8FHvKSocFRsvjKeCn/7g8IaKouxGeAkqQTWMTdwRWJs32Tef1yIj0O8S3
         mM4YOrJ1bK3g5SkuEesshUgqDpgav4bYta2MxTTGG5hmULujQJRQqJmL8WQKbg3Fxh1s
         ++S0EBL8VCxZGBA95sosX3gfZUZu9DMIuWhoixSHrADYY63jR4NF7Hoz4TxCErDcMVmA
         GRkI6diR/75IA9NUpArSu/X4h8t2hs1c7s+SMaa2ZbQ/oURP3e4o48J6XuccBtd7Ducg
         /zg1Wv1j6xu1LLsll2mOfvByAU2woesBI4vQ0mZ5Zw94VQPOtTRa5CXaJWiuStY/AqWn
         sOwA==
X-Gm-Message-State: AOJu0YzgPLEGO2bmXpTBzgs5ZBnMM6cX+Xem/fqZlf4qHCJqlWokTaxr
	MKxtVzX6jsDFQcSZG/x6kMnbfrP06/Mg70reBJLoerMlYIZCAQ+/3zyL6Cc+jC1DDj1EiyiEuBw
	/TynwvBkNdCzjrYEonPBEx0xY+wuvQY4tjHlnbc2Y+76dRzfanfY=
X-Gm-Gg: ASbGncvVPyCYtynfltEWaE8IsM9vwyhgISDKUQ4CmTsZSZv/4GaRgvHpSqloGYbP/k5
	0gHivd5K3Yf9R5Z9t8rMQuW3irpSLGkHGmEcdkXQeB4NoEo5MJqDeV1cLK7B4Y34X7ccD8YHPBa
	LxllkSVICod++Wj85RJcPts0M=
X-Google-Smtp-Source: AGHT+IHKyuNilZBMo81hC3TAMYUIlJbjEbA1f18hdyg61K25TrVb5VUJiZdaQJkr+bVxT6f+ELxOrtQ0scC57aT1wDE=
X-Received: by 2002:a05:6e02:214b:b0:3d8:1e50:1d55 with SMTP id
 e9e14a558f8ab-3d942d808b9mr77854075ab.11.1745843997984; Mon, 28 Apr 2025
 05:39:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com> <20250415131908.2699782-10-rkrcmar@ventanamicro.com>
In-Reply-To: <20250415131908.2699782-10-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Apr 2025 18:09:47 +0530
X-Gm-Features: ATxdqUGkagrNtSCQOY01Z65xeWpldrdb5hrpql-_dPg6dGcRCKT4WI6-8AQvwd8
Message-ID: <CAAhSdy1P3apLpKOzW4YSpHGN-PQGokaCMsotOb6LubZoavExNg@mail.gmail.com>
Subject: Re: [PATCH 8/8] lib: sbi_hart: properly reset Ssstateen
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_053958_970954_F6C9B79D 
X-CRM114-Status: GOOD (  15.17  )
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
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IHNzdGF0ZWVuKiBhbmQgaHN0YXRlZW4qIENT
UnMgbXVzdCBiZSB6ZXJvZWQgYnkgTS1tb2RlIGlmIHRoZSBtc3RhdGVlbioKPiByZWdpc3RlcnMg
YXJlIG1pc3NpbmcsIHRvIGF2b2lkIHNlY3VyaXR5IGlzc3Vlcy4KPgo+IFNpZ25lZC1vZmYtYnk6
IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgo+IC0tLQo+ICBsaWIv
c2JpL3NiaV9oYXJ0LmMgfCAxNiArKysrKysrKysrKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAx
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IGJjMGE3M2QxMjk4ZC4uMGY2
MWU5Y2QxYzk4IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9z
Ymkvc2JpX2hhcnQuYwo+IEBAIC0xMTQsMTIgKzExNCwyMiBAQCBzdGF0aWMgdm9pZCBtc3RhdHVz
X2luaXQoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgICAgICAgICBjc3Jf
d3JpdGU2NChDU1JfTVNUQVRFRU4xLCBTTVNUQVRFRU5fU1RBVEVOKTsKPiAgICAgICAgICAgICAg
ICAgY3NyX3dyaXRlNjQoQ1NSX01TVEFURUVOMiwgU01TVEFURUVOX1NUQVRFTik7Cj4gICAgICAg
ICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9NU1RBVEVFTjMsIFNNU1RBVEVFTl9TVEFURU4pOwo+
ICsgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIGlmIChtaXNhX2V4dGVuc2lvbignUycpKQo+
ICsgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhU
X1NNU1RBVEVFTikgfHwKPiArICAgICAgICAgICBzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0
Y2gsIFNCSV9IQVJUX0VYVF9TU1NUQVRFRU4pKSB7CgpUaGlzIHNob3VsZCBvbmx5IGNoZWNrIFNT
U1RBVEVFRU4uCgo+ICsgICAgICAgICAgICAgICBpZiAobWlzYV9leHRlbnNpb24oJ1MnKSkgewo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1NUQVRFRU4wLCAwKTsKPiAt
Cj4gLSAgICAgICAgICAgICAgIGlmIChtaXNhX2V4dGVuc2lvbignSCcpKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU1NUQVRFRU4xLCAwKTsKPiArICAgICAgICAgICAg
ICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NTVEFURUVOMiwgMCk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgY3NyX3dyaXRlKENTUl9TU1RBVEVFTjMsIDApOwo+ICsgICAgICAgICAgICAgICB9
Cj4gKyAgICAgICAgICAgICAgIGlmIChtaXNhX2V4dGVuc2lvbignSCcpKSB7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgY3NyX3dyaXRlNjQoQ1NSX0hTVEFURUVOMCwgKHVpbnQ2NF90KTApOwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9IU1RBVEVFTjEsICh1aW50
NjRfdCkwKTsKPiArICAgICAgICAgICAgICAgICAgICAgICBjc3Jfd3JpdGU2NChDU1JfSFNUQVRF
RU4yLCAodWludDY0X3QpMCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3NyX3dyaXRlNjQo
Q1NSX0hTVEFURUVOMywgKHVpbnQ2NF90KTApOwo+ICsgICAgICAgICAgICAgICB9Cj4gICAgICAg
ICB9Cj4KPiAgICAgICAgIGlmIChzYmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJ
X0hBUlRfUFJJVl9WRVJfMV8xMikgewo+IC0tCj4gMi40OC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCk90aGVyd2lzZSwgTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywK
QW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
