Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F2EC369CB
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 04:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ILGWmF5TgCF+UW5S9THQDYoXUPHbKShWV+4pYVsOJTs=; b=s4xSQfFnC23u9E
	JKSHRBZ11SoCGRLhw1EXSiObVo1R+VTmG5vvmTAatW2J5f2hWU7npsFEfUj0W2XtfhojLvc5WerIj
	hWnWQ3AS1A1ow3byAA6s+/KjJF1e/QSBqAF9SxHXamHjGBiIcW3NRXtmb/pULvzGFTqPpoxjhSaid
	4YNAswTFrk9A7n1r3RPYNM0fGe1RHD8Q+Sqs2kzf0kYwwBj4SZh9i/8MH5UKknna3r+lqGNxUtaJD
	dGAbZeDz6z19scnxLOiYX+Thvbq8aoIZ2/nNSeSeVo9XtjY82y2cIQ4VWjIaVUjsBFXtqhRG9qjbn
	GfyvCtvyCYIqkJ/qnRcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RSi-00000009Aev-2Sch;
	Wed, 23 Apr 2025 04:11:52 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RSf-00000009AeA-3Et9
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 04:11:51 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-861525e9b0aso456897939f.3
        for <opensbi@lists.infradead.org>; Tue, 22 Apr 2025 21:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745381509; x=1745986309; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3E/mGeoLyIt1elRfU8gD//PlUTJI05rLYufHSsFReQQ=;
        b=RSPt8ZnP6xHLdI6lakSkSAIBZDRDI/4FragLySZ0TOOoonJt3dFFhMm+RCEp9M3TVP
         D00ziUCibPFZmHGa3i3Qk8SLVEiDIkqiOrZKOEkM6Awy7+L88P9uzCpwIt/XlbROBliQ
         xLSA+G/pgEKYpPHsUaTon4dKKg9PcSoofGyPnfD14wxntQ9nTOfsTWSpJ70egUKwrB7b
         na+OHDitdtvdScDTl6xwQ8u/The03jt8zATTMSk37dskzq58GPQVUhE6StTWNcgskLsI
         OMcduQfhWLZWvY8agPiSgN2VVti7jH+pcXVwxaFol62zd/KxHTHpUz591aJ99IKUcg5T
         MhnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745381509; x=1745986309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3E/mGeoLyIt1elRfU8gD//PlUTJI05rLYufHSsFReQQ=;
        b=lGOqqrJrSv8CSyT8TZ9EUU+sbegW2CDzFtsYVr/CQnql/KjgKDboZQhWm+wOWZepVZ
         TGxHBsGdG2XpTIlfwjjVvfjiVMBrHFSWIe7NxAAvKi4DdmmFRkK8IAvCRkQe1sTqvJ/L
         jWm4SjUhAh6IZoX1h+T6hWrU8F2mE8/XmZ/CEKVhSz1O1tMkDJWmxbQWh4aIlXlMNsfh
         +Xzj0WTeOA0SqMTwsvFhYE54CB23xrxERZZJWGzkSaz5j3eC3SSudwVKa4nikvh+ddc5
         3jXu6Q3O0rVOx9mvHc7RpnnJkWBWPwKETehxKn5IAR3K4I1pJ2zGiFWxRjvNzPLap+Jh
         vSUA==
X-Gm-Message-State: AOJu0YyHz+V6+mV6f+vtJMt5Lfypgovypvw03LO3GFdgwbSBX9vdRiUt
	oeDjYf+1PxNYPQqF+KvyPWejECDjsBAHQEpiOasO7osmYiaKyn53BNfX/hewZyG7Aot4VcRmnSF
	MqUcuv4wyXaSSVLIGWYuqli/r99vcLrcPj1tfweqFaSnTQu5c
X-Gm-Gg: ASbGncvgURo33CVtGszOkJw9UKy9HA5sMRfRXJH0XeXevXcLOSpCDRZGLaYawFFQCCx
	m5An3HkKqtzv6tX5sLN8JByqMKTyWOVq7hmgGcrM7cdFOJhjG+HNMI4c0ChdrUiBaeitu5vxuCb
	fdMzdy7l4q98pjnkxWvRfhdW4=
X-Google-Smtp-Source: AGHT+IHOJStbqEKR1VXSGLfZnyCA9fDe0uJDfN77QX9yOP1Cp82w2sl1ZEEDsjBLj90J88D6Dlk3awgAxrc1vcEJ6bU=
X-Received: by 2002:a05:6e02:1987:b0:3d4:3db1:77ae with SMTP id
 e9e14a558f8ab-3d89418e3admr204462715ab.18.1745381508854; Tue, 22 Apr 2025
 21:11:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-11-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-11-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Apr 2025 09:41:37 +0530
X-Gm-Features: ATxdqUFA7ExEQePvvpWbcSdlHUBDlsK72sD4HFHElveYCQ5-d3JMA7LBkozT7rQ
Message-ID: <CAAhSdy2+a0ZxRoK4wPXgVtZBUEi6xTDSOEyfCzGAPyG5BNkOgg@mail.gmail.com>
Subject: Re: [PATCH 10/10] lib: sbi_platform: Remove the vendor_ext_check hook
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_211149_815337_C8C3F508 
X-CRM114-Status: GOOD (  18.13  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IE5vdyB0aGF0IHRoZSBnZW5lcmljIHBsYXRm
b3JtIG9ubHkgc2V0cyAudmVuZG9yX2V4dF9wcm92aWRlciBpZiB0aGUKPiBmdW5jdGlvbiBpcyBy
ZWFsbHkgaW1wbGVtZW50ZWQsIHRoZXJlIGlzIG5vIG5lZWQgZm9yIGEgc2VwYXJhdGUgaG9vayB0
bwo+IGNoZWNrIGlmIGEgdmVuZG9yIGV4dGVuc2lvbiBpcyBpbXBsZW1lbnRlZC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJk
cywKQW51cAoKPiAtLS0KPgo+ICBpbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaCAgfCA3ICstLS0t
LS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIHwgNiAtLS0tLS0KPiAgMiBmaWxlcyBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMTIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmggYi9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaAo+
IGluZGV4IDNjOTlkNDM5Li42YThmNDdiZCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlf
cGxhdGZvcm0uaAo+ICsrKyBiL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oCj4gQEAgLTEyOSw4
ICsxMjksNiBAQCBzdHJ1Y3Qgc2JpX3BsYXRmb3JtX29wZXJhdGlvbnMgewo+ICAgICAgICAgLyoq
IEluaXRpYWxpemUgdGhlIHBsYXRmb3JtIE1lc3NhZ2UgUHJveHkoTVBYWSkgZHJpdmVyICovCj4g
ICAgICAgICBpbnQgKCptcHh5X2luaXQpKHZvaWQpOwo+Cj4gLSAgICAgICAvKiogQ2hlY2sgaWYg
U0JJIHZlbmRvciBleHRlbnNpb24gaXMgaW1wbGVtZW50ZWQgb3Igbm90ICovCj4gLSAgICAgICBi
b29sICgqdmVuZG9yX2V4dF9jaGVjaykodm9pZCk7Cj4gICAgICAgICAvKiogcGxhdGZvcm0gc3Bl
Y2lmaWMgU0JJIGV4dGVuc2lvbiBpbXBsZW1lbnRhdGlvbiBwcm92aWRlciAqLwo+ICAgICAgICAg
aW50ICgqdmVuZG9yX2V4dF9wcm92aWRlcikobG9uZyBmdW5jaWQsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3Qgc2JpX3RyYXBfcmVncyAqcmVncywKPiBAQCAtNjA0
LDEwICs2MDIsNyBAQCBzdGF0aWMgaW5saW5lIGludCBzYmlfcGxhdGZvcm1fbXB4eV9pbml0KGNv
bnN0IHN0cnVjdCBzYmlfcGxhdGZvcm0gKnBsYXQpCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBzYmlf
cGxhdGZvcm1fdmVuZG9yX2V4dF9jaGVjaygKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybSAqcGxhdCkKPiAgewo+IC0gICAg
ICAgaWYgKHBsYXQgJiYgc2JpX3BsYXRmb3JtX29wcyhwbGF0KS0+dmVuZG9yX2V4dF9jaGVjaykK
PiAtICAgICAgICAgICAgICAgcmV0dXJuIHNiaV9wbGF0Zm9ybV9vcHMocGxhdCktPnZlbmRvcl9l
eHRfY2hlY2soKTsKPiAtCj4gLSAgICAgICByZXR1cm4gZmFsc2U7Cj4gKyAgICAgICByZXR1cm4g
cGxhdCAmJiBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpLT52ZW5kb3JfZXh0X3Byb3ZpZGVyOwo+ICB9
Cj4KPiAgLyoqCj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYyBiL3Bs
YXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+IGluZGV4IDA0NDQ4ZDcxLi5mMzA3MmJlOCAxMDA2
NDQKPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMKPiArKysgYi9wbGF0Zm9ybS9n
ZW5lcmljL3BsYXRmb3JtLmMKPiBAQCAtMjQwLDExICsyNDAsNiBAQCBpbnQgZ2VuZXJpY19maW5h
bF9pbml0KGJvb2wgY29sZF9ib290KQo+ICAgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+IC1zdGF0
aWMgYm9vbCBnZW5lcmljX3ZlbmRvcl9leHRfY2hlY2sodm9pZCkKPiAtewo+IC0gICAgICAgcmV0
dXJuICEhZ2VuZXJpY19wbGF0Zm9ybV9vcHMudmVuZG9yX2V4dF9wcm92aWRlcjsKPiAtfQo+IC0K
PiAgaW50IGdlbmVyaWNfZXh0ZW5zaW9uc19pbml0KHN0cnVjdCBzYmlfaGFydF9mZWF0dXJlcyAq
aGZlYXR1cmVzKQo+ICB7Cj4gICAgICAgICAvKiBQYXJzZSB0aGUgSVNBIHN0cmluZyBmcm9tIEZE
VCBhbmQgZW5hYmxlIHRoZSBsaXN0ZWQgZXh0ZW5zaW9ucyAqLwo+IEBAIC0zNDAsNyArMzM1LDYg
QEAgc3RydWN0IHNiaV9wbGF0Zm9ybV9vcGVyYXRpb25zIGdlbmVyaWNfcGxhdGZvcm1fb3BzID0g
ewo+ICAgICAgICAgLmdldF90bGJfbnVtX2VudHJpZXMgICAgPSBnZW5lcmljX3RsYl9udW1fZW50
cmllcywKPiAgICAgICAgIC50aW1lcl9pbml0ICAgICAgICAgICAgID0gZmR0X3RpbWVyX2luaXQs
Cj4gICAgICAgICAubXB4eV9pbml0ICAgICAgICAgICAgICA9IGdlbmVyaWNfbXB4eV9pbml0LAo+
IC0gICAgICAgLnZlbmRvcl9leHRfY2hlY2sgICAgICAgPSBnZW5lcmljX3ZlbmRvcl9leHRfY2hl
Y2ssCj4gIH07Cj4KPiAgc3RydWN0IHNiaV9wbGF0Zm9ybSBwbGF0Zm9ybSA9IHsKPiAtLQo+IDIu
NDcuMgo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
