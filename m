Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA718D3B7E2
	for <opensbi@archiver.kernel.org>; Mon,  8 Dec 2025 11:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Evn2RBlOKLrTxaQ9Dtzu0/177E/5qTwKZHyy7OkDxc=; b=oNHEqyTk04ZVTS
	Ub8L8N5qSFdn93ynuRAD4ap3S2Qz4pH3cnfbG/+WeFeiY3y2Ogi9NUxxdDUeeswesYPX/s/xDYPHj
	Wiy2lc7oGEAJQaMvP9RJXpYIWBKNcoW+g8NMb14l1sM90fqiqT/Iwz0+Inl1LjxNc7B5VKrYJp9ho
	Auj4m4+t43qwzKDjqj9aNwmQZ7HyTaLMoRUm08f2YQ4+uEJGbS8kB0XPIS+ccRRSdnuR8/ye77k6i
	NWzUmevlDopl5wojefQi9zHNoi1l407wPaV2MrwOlw4Dd7AETm7F6zoiYTSiYvTLDiO329xf/OSEm
	J/z3N0gZw2tFBw/EJr9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZUO-0000000D0xa-0K0E;
	Mon, 08 Dec 2025 11:33:12 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSZUL-0000000D0x6-1BOm
	for opensbi@lists.infradead.org;
	Mon, 08 Dec 2025 11:33:10 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7c6cc366884so2165406a34.1
        for <opensbi@lists.infradead.org>; Mon, 08 Dec 2025 03:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1765193588; x=1765798388; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BIiDw9mllyoLgv4HBBCrc6tY01JafGhF1M1hdUIorJ0=;
        b=LDv7Z00V4nZXqoq/Vk9qqtNh6Dxh6O7lJkFNwbcQSteRXtk8/gkgajSN+xZ3wxo9Me
         U5E5ZhfUbywGckoXqxQU/BCmIqJW42n3jI5grSvESj4GttX0ngidUPrJOdsHX4CBqAE+
         q8YzqsQYqo4tENBASvfHjlYaYqw2dTmSazEJXmpXpY8vp/cT+pNy7oxfOrckmFnvKDYJ
         bdK12tzWwNrFpvBIcbjX2HsXDtgyID2jY1yD897SROT7mxucI4+FToDrp+P0VqPdwmfB
         Wa5X2I1t7AWmqIxS5dUfdPhYaqSFy3MG4zAZOEDOVwfMlJ52OgpwRBHpPgJNmATXE7u3
         O+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765193588; x=1765798388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BIiDw9mllyoLgv4HBBCrc6tY01JafGhF1M1hdUIorJ0=;
        b=BeodxqaYcZify/4KISsMzUvDfSVnEuE/wuDkhuej3wej1v7xpwq3MKhqQ8CBTlmBqk
         k46qykWcpbnATlQhpQ4fnUYUF5SLylJ2FCOW9LkgwoWSCsalpI4OSajhCz1/bCg1rM51
         KlVjp4LrrNvFhSpHF7+EYXdQGRgovsHxIxLbf0LVdBkOQmChy3YyTQnMWcUU16sfM7Sz
         cBUvAvwlFVdyv0NGDNX2NE4SUdZZ0QsF5jnvYAiuE1O9c8GmxwlsiXVtkwMI3hPyTkIa
         miXcR6XspXZEoj6zoNzazCIFAymO9PYLhmy3nQLo4G9aLBFtE1K4DhE6vsJ7/gv8KeN0
         oZpQ==
X-Gm-Message-State: AOJu0Ywh1FS6Ag04g/zsakfBPSvMjhzYYJyR4zVH1x1acRuqiIAuK6w2
	5AIXWym5A0p65ln/fyIjt9T3GMTuvK1/jNPWWUPCWj5nBfUcKtK+i7iONGM6ZPfRUcuaKvi7LOT
	G8d+qHNZqJWUkAbmnTogly1cKQSCFZFEBJnLd55INheIjo49hp+5siVE=
X-Gm-Gg: ASbGnctPqIQ6VHU9AyuxnqubvI8DVjguxX3v5YQnTgs7HSNPx6r7p1abi8kvRnC3Lv3
	IwMmi1stMB0nDbQxvoOvdmO2yEihPX6lgQV6t7V2tkXv4zN5Tt4KbJyE6x3nYcXqElqGYh9zp9C
	d1seHubCuBv/XQiPlqqy6KMy/y2FFD5h0TYx4ZcIC/iSfqphnhiJuM+glxi7yxckKPvYzhlLPl5
	CQWFa/W0QI/A8/daoDY8d+msU7dGPvgL+folegtgu9xzc6RjvHpAJZWJCYXsigDNCEXRntp5m2S
	92LnMcwuvR5kXynTVpscGWrPFrpGmyMTbOkDXmat
X-Google-Smtp-Source: AGHT+IFevVYY/a/kRLya75agA+BRoe6OimoOR0XPvxNhxr888IxgRFlggwOVo1cXI+7tZXxzvjG+4xKv6lisOvfPvT0=
X-Received: by 2002:a05:6820:818e:b0:659:9a49:8de1 with SMTP id
 006d021491bc7-6599a8fe95dmr2773443eaf.35.1765193588031; Mon, 08 Dec 2025
 03:33:08 -0800 (PST)
MIME-Version: 1.0
References: <20251121193808.1528050-1-samuel.holland@sifive.com> <20251121193808.1528050-3-samuel.holland@sifive.com>
In-Reply-To: <20251121193808.1528050-3-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Dec 2025 17:02:56 +0530
X-Gm-Features: AQt7F2p5I-CauDdA4DmfroqBtXQtInD1s2WqNxOrDiBDo_sba1fp4D5dbVoijL0
Message-ID: <CAAhSdy0fLn_Q68-sHSOdTV282WeU2yKMwTQ2C_O5JReUyYukmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] lib: utils: Use SBI_DOMAIN_MMIO to check MMIO device permissions
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_033309_328635_5EB9C0F8 
X-CRM114-Status: GOOD (  17.78  )
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

T24gU2F0LCBOb3YgMjIsIDIwMjUgYXQgMTowOOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IERyaXZlcnMgb3IgcGxhdGZvcm1zIG1heSBj
cmVhdGUgbWVtb3J5IHJlZ2lvbnMgd2l0aCB0aGUgTU1JTyBmbGFnIHNldAo+IHRoYXQgY29udGFp
biBTLW1vZGUtYWNjZXNzaWJsZSBNTUlPIGRldmljZXMuIFRoaXMgaXMgc3RyaWN0bHkgY29ycmVj
dAo+IGFuZCBzaG91bGQgYmUgYWxsb3dlZCwgYWxvbmcgd2l0aCB0aGUgZXhpc3RpbmcgZGVmYXVs
dCBjYXNlIG9mCj4gUy1tb2RlLWFjY2Vzc2libGUgTU1JTyBkZXZpY2VzIGFwcGVhcmluZyBpbiBu
b24tTU1JTyBtZW1vcnkgcmVnaW9ucy4KPiBXaGVuIHBhc3NlZCBTQklfRE9NQUlOX01NSU8sIHNi
aV9kb21haW5fY2hlY2tfYWRkcigpIHdpbGwgcGVyZm9ybSB0aGUKPiBjb3JyZWN0IHNldCBvZiBw
ZXJtaXNzaW9uIGNoZWNrcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxh
bnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVu
c2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gLS0tCj4KPiAgbGliL3V0aWxzL2ZkdC9mZHRfZml4
dXAuYyAgICAgICAgICAgICB8IDIgKy0KPiAgbGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9z
eXNtc2kuYyB8IDMgKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMgYi9s
aWIvdXRpbHMvZmR0L2ZkdF9maXh1cC5jCj4gaW5kZXggZjNmZThhZjkuLmIwZWQyMGM4IDEwMDY0
NAo+IC0tLSBhL2xpYi91dGlscy9mZHQvZmR0X2ZpeHVwLmMKPiArKysgYi9saWIvdXRpbHMvZmR0
L2ZkdF9maXh1cC5jCj4gQEAgLTE4NSw3ICsxODUsNyBAQCBzdGF0aWMgdm9pZCBmZHRfZG9tYWlu
X2Jhc2VkX2ZpeHVwX29uZSh2b2lkICpmZHQsIGludCBub2Rlb2ZmKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4KPiAgICAgICAgIGlmICghc2JpX2RvbWFpbl9jaGVja19hZGRyKGRvbSwgcmVn
X2FkZHIsIGRvbS0+bmV4dF9tb2RlLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFNCSV9ET01BSU5fUkVBRCB8IFNCSV9ET01BSU5fV1JJVEUpKSB7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgU0JJX0RPTUFJTl9SRUFEIHwgU0JJX0RPTUFJTl9XUklU
RSB8IFNCSV9ET01BSU5fTU1JTykpIHsKPiAgICAgICAgICAgICAgICAgcmMgPSBmZHRfb3Blbl9p
bnRvKGZkdCwgZmR0LCBmZHRfdG90YWxzaXplKGZkdCkgKyAzMik7Cj4gICAgICAgICAgICAgICAg
IGlmIChyYyA8IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+IGRpZmYgLS1n
aXQgYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jIGIvbGliL3V0aWxzL21w
eHkvZmR0X21weHlfcnBtaV9zeXNtc2kuYwo+IGluZGV4IDk0YTVhZjhjLi4xZGNjMDQ5ZSAxMDA2
NDQKPiAtLS0gYS9saWIvdXRpbHMvbXB4eS9mZHRfbXB4eV9ycG1pX3N5c21zaS5jCj4gKysrIGIv
bGliL3V0aWxzL21weHkvZmR0X21weHlfcnBtaV9zeXNtc2kuYwo+IEBAIC01Nyw3ICs1Nyw4IEBA
IHN0YXRpYyBpbnQgbXB4eV9ycG1pX3N5c21pc194ZmVyKHZvaWQgKmNvbnRleHQsIHN0cnVjdCBt
Ym94X2NoYW4gKmNoYW4sCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3lzX21zaV9hZGRyZXNz
IHw9ICgodTY0KWxlMzJfdG9fY3B1KCgodTMyICopeGZlci0+dHgpWzJdKSkgPDwgMzI7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKCFzYmlfZG9tYWluX2NoZWNrX2FkZHJfcmFuZ2Uoc2Jp
X2RvbWFpbl90aGlzaGFydF9wdHIoKSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzeXNfbXNpX2FkZHJlc3MsIDB4NCwgUFJWX1MsCj4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
U0JJX0RPTUFJTl9SRUFEIHwgU0JJX0RPTUFJTl9XUklURSkpIHsKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX1JFQUQg
fCBTQklfRE9NQUlOX1dSSVRFIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBTQklfRE9NQUlOX01NSU8pKSB7Cj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAoKHUzMiAqKXhmZXItPnJ4KVswXSA9IGNwdV90b19sZTMyKFJQ
TUlfRVJSX0lOVkFMSURfQUREUik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
cmdzLT5yeF9kYXRhX2xlbiA9IHNpemVvZih1MzIpOwo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgYnJlYWs7Cj4gLS0KPiAyLjQ3LjIKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcg
bGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
