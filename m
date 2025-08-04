Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936AACA0EC1
	for <opensbi@archiver.kernel.org>; Mon,  4 Aug 2025 08:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuNlPjqKm4gj5YPbsifmSIwaTtk79p/F8OX8jy6Bndg=; b=z1snwyCx9H4fLQ
	0UiGJGPeGPe3aGUOm080veE16PiK8viEjhhlXsrRQ2HGmX/73pmknVapMd6ZvPzeVTojbL6sv0aZt
	zfTTXNqrubx1IiXXOLY9hbvD3nkSdPGpA0E3SLxcXmNSHMKGYLeKS7onLDF/wR9Y4Hq6R0CnCp2Nz
	hIZNA3IJ7FmqGMr1dQJC5G993U2waLEoCiOkOqWGsHk6LWPEMPZel4EFrLaN1n+vCzg/AP30GVevQ
	1rav2qqduxJ2k+A2eL7kLrPwmuu/MxJqcJJbvX/98Hctwar3sGPkZq/3YMqIiTkOuKASudQD77MEa
	u/QEDv/yX/B1Ha3bZMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqsw-00000009zf9-3bx8;
	Mon, 04 Aug 2025 08:49:34 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqiW-00000009yAb-2d2J
	for opensbi@lists.infradead.org;
	Mon, 04 Aug 2025 08:38:49 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-87c0bb1ee4eso46978239f.2
        for <opensbi@lists.infradead.org>; Mon, 04 Aug 2025 01:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1754296726; x=1754901526; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBG3NyFZHOXc7rErzLiHHmUIn/33yHu1ZFMogC8OApY=;
        b=uruHE/zZa5vdwpSH46nSDBUCdLThyumbNv3BSUK4/YvISW8dMW/KsdX6FUlFIHoEe+
         Bgf+hLCQA2WOUMOfWDo05e7KPsE/6Ri0B5pbpOcutwN+XNmEvagxh/GwAvOampQhGHMk
         OJcR2U3kcNvLJ6GIZA8W14rpG364FTcAyTGLY905U4wf9FZrEgREjyEyu7YLg6uWMf/Q
         AWD+qWEsG+FHLlgcz4HyE2mQ4XY+heAq1FrshUqrxDIWprsMNMo4E/vJGggAFoJ7JnOl
         lTul9El6pUQG2q1aPPjy6YMXyq7lYF2m6MDvbzEp337nP7KROMfuwg454SQTvHUAN7dj
         ZEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754296726; x=1754901526;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBG3NyFZHOXc7rErzLiHHmUIn/33yHu1ZFMogC8OApY=;
        b=P4P0AvL/ZD0lqDWMUWM6oEtzKeIBzQwnjzwS58ul/eJgw8wtI6NNvR2d6VdSqBGqdS
         RfMZ91v3kG+0z+f3u8jrrfC7E8VgouI83YypjEGo9d0fy9sb9VVWWt6ArJdkJFqX5ZfT
         BjhcBD8HIWGqyOTX8chp0U2Ms+P/W+t8S8FyGcI+DQZvA7gySGVRj2rDGc0bavs6MN+9
         84yMNLQL66jHNO/wj4S9m00N0BgumoPgzaMcT3Ik3QLWur6h4ICnSvWfBB/andako9In
         Pr67PD5Ke5kkMS39kdbF8viMLeBbaqu8CrJfwjoe0sTMG9G4kI9IE5KiYBGZXHunE8aj
         qzUQ==
X-Gm-Message-State: AOJu0YzDnTNfad7gl1i355swmBWKAscbB8C0OpEWG/kKAafS0DSoXFwH
	lR3eL9+WJyIyzmO3Ii7PIhPHtxmyLiSJL2Cm3+vosp24c88J1P2n0Nw0QqjIYDYnhl9vrJyBveu
	rmlPS1WBDle3HsBnKHzgJpkqnfqcW8WeaF0bmrCC96w==
X-Gm-Gg: ASbGncszw8N6ASFDjSKYLyNQ5MGnHpV4lYKvYvzajq2XUtgV9wYdG0Chy4/BrlSlkbr
	AiNe0O1ipUGGl5zjQy1kSDDuHA49wRVB+cwPmPDnJV37u+7SIOBg0rFyoEmUNSVphYmN8EssAlM
	R8jSHpcOluIM2K8+W6c8UW64Ar38V+LV6Y1ubOM5JRgOIqfHheLaXsVrXHpa9nWH37D2plY87SN
	d5MTfc=
X-Google-Smtp-Source: AGHT+IF0AHF08z9ZYOHy07OTgncHroIxxF3TE7d+ekir4lr1O4EuJJNhfJ4EZvSMNqnDYT+6BT0crmC/F3bo5459L7Y=
X-Received: by 2002:a05:6e02:198e:b0:3e3:e8ee:68b9 with SMTP id
 e9e14a558f8ab-3e4161dcd24mr165159535ab.22.1754296725827; Mon, 04 Aug 2025
 01:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250708074940.10904-1-nick.hu@sifive.com> <20250708074940.10904-7-nick.hu@sifive.com>
In-Reply-To: <20250708074940.10904-7-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 4 Aug 2025 14:08:33 +0530
X-Gm-Features: Ac12FXxjciYzUWCtDNn3R1055A89DbrAGeMK7aA53kQqYA9Zu7864A9BAhdsBXE
Message-ID: <CAAhSdy3WrRuuffYWQdxX2-4AMyUDtrYtuVTayPcQbcDz7hgogg@mail.gmail.com>
Subject: Re: [PATCH v3 06/12] lib: sbi: Add SiFive proprietary xsfcflushdlone
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_013848_667031_AC941033 
X-CRM114-Status: GOOD (  13.19  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCAxOjIw4oCvUE0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IFVzaW5nIElTQSBzdHJpbmcgInhzZmNmbHVzaGRsb25lIiB0byBkZXRl
Y3QgdGhlIHN1cHBvcnQgb2YgdGhlCj4gU2lGaXZlIEwxRCBjYWNoZSBmbHVzaCBjdXN0b20gaW5z
dHJ1Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+
Cj4gUmV2aWV3ZWQtYnk6IEN5YW4gWWFuZyA8Y3lhbi55YW5nQHNpZml2ZS5jb20+Cj4gLS0tCj4g
IGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggfCAyICsrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAgICAg
fCAxICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQg
YS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IGluZGV4
IGRmYmU4ZTRjLi41NjdlMDEzMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5o
Cj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+IEBAIC04MSw2ICs4MSw4IEBAIGVudW0g
c2JpX2hhcnRfZXh0ZW5zaW9ucyB7Cj4gICAgICAgICBTQklfSEFSVF9FWFRfU1NDVFIsCj4gICAg
ICAgICAvKiogSEFSVCBoYXMgU3NzdGF0ZWVuIGV4dGVuc2lvbiAqKi8KPiAgICAgICAgIFNCSV9I
QVJUX0VYVF9TU1NUQVRFRU4sCj4gKyAgICAgICAvKiogSGFydCBoYXMgWHNmY2ZsdXNoZGxvbmUg
ZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfWFNGX0NGTFVTSF9EX0wxLAoKcy9T
QklfSEFSVF9FWFRfWFNGX0NGTFVTSF9EX0wxL1NCSV9IQVJUX0VYVF9YU0lGSVZFX0NGTFVTSF9E
X0wxLwoKPgo+ICAgICAgICAgLyoqIE1heGltdW0gaW5kZXggb2YgSGFydCBleHRlbnNpb24gKi8K
PiAgICAgICAgIFNCSV9IQVJUX0VYVF9NQVgsCj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hh
cnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IGluZGV4IDA1NGE0MDVjLi5lOTFlMTEyMyAxMDA2
NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiArKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMK
PiBAQCAtNzE1LDYgKzcxNSw3IEBAIGNvbnN0IHN0cnVjdCBzYmlfaGFydF9leHRfZGF0YSBzYmlf
aGFydF9leHRbXSA9IHsKPiAgICAgICAgIF9fU0JJX0hBUlRfRVhUX0RBVEEoc21jdHIsIFNCSV9I
QVJUX0VYVF9TTUNUUiksCj4gICAgICAgICBfX1NCSV9IQVJUX0VYVF9EQVRBKHNzY3RyLCBTQklf
SEFSVF9FWFRfU1NDVFIpLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzc3N0YXRlZW4s
IFNCSV9IQVJUX0VYVF9TU1NUQVRFRU4pLAo+ICsgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh4
c2ZjZmx1c2hkbG9uZSwgU0JJX0hBUlRfRVhUX1hTRl9DRkxVU0hfRF9MMSksCj4gIH07Cj4KPiAg
X1N0YXRpY19hc3NlcnQoU0JJX0hBUlRfRVhUX01BWCA9PSBhcnJheV9zaXplKHNiaV9oYXJ0X2V4
dCksCj4gLS0KPiAyLjE3LjEKPgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
