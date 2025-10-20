Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979E9CCD199
	for <opensbi@archiver.kernel.org>; Mon, 20 Oct 2025 05:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWCFiViv02+dWz67GtStyBvP41pqFiaqtWwt0aVLyrE=; b=AB9jfR/eSDxpyr
	c7Mu7htdg74eJbfopYIzKu1pscVx/L/qz5p6skNkIOE4Y0WXWwmYfTlD22u7AZaTRMjlSyADhDZd6
	xudA7z6M+gEeFPKXsj5aPcMvU3NyZxlIxTb7Fw628nvNe579/38yhFM9ZDoqozPZTuxV6Sk6zS1ps
	EJ+pjksKYZIaA9SDQtltuPYGS6ce38GMVaKYUcUh5UbP/8OGhX6RDLAeqg7r85qK7lnsgKOrWM0AG
	Mm1PpUSZ0loDx6NpVMVcQjf5VU3Y4RveE4YqwT6g+QCr7WB49J0X0LelX8ApzsazUMqJE9dObLII8
	Cvej7aY8WYCMDs9yS+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAi9N-0000000Bv9U-1hD2;
	Mon, 20 Oct 2025 05:09:41 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAi9L-0000000Bv8q-02Lj
	for opensbi@lists.infradead.org;
	Mon, 20 Oct 2025 05:09:40 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-430ca464785so25745685ab.0
        for <opensbi@lists.infradead.org>; Sun, 19 Oct 2025 22:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1760936978; x=1761541778; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iC+1JRPFxe7TvYBnEavyjUkOFkrNWIiZYyj9ni/5eIo=;
        b=j+78KMSaLuAcmJv5xSMAWJPS3y/H0HDEnLtKGh8ZtGg8+raIl8sZ4YGUBNzucHtv+Q
         +D2g7TcZZYHUH/tkjoMUPZbq8ZNwNtfr3p3VQCGXVehu6AxdHY8kaSN29AM5yzO5W9XQ
         scF8Ye6mHuP6p2BdUFNK05lgRPrBezyozVq9OUgllHGbh1fw/xfZsJet7A7xSFZrbAQg
         n1zEswEHfIZijQ2ZXMjod3Qo3S/M1KUCRQbjIwyiYqK+v6+UxsX38/OGmglQZ/0KHwU8
         LqC+9H0Z0B1+LzcVF9kdDjvFE7caC8+7SfPvbtOMmmhOp/rWNOmu7hsuT+U696dBQrmL
         AuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760936978; x=1761541778;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iC+1JRPFxe7TvYBnEavyjUkOFkrNWIiZYyj9ni/5eIo=;
        b=udVEs2Ic3CWTHOB2y/9zPFosaqc4cYQv+Lldrz0lSYODC5/UjIOzt0v5oZr/vvErM9
         IbvVoY/5D7C3UC8mJM3LlTzxWoyIx1RZblQaBvzvJi7xvRsM6b7LfLH44i1NCwnGSGX5
         /7RX/TG+df7eNBPH2WlaP8zqh4kiJbpJdtllM4T9JHNbED/RB+WBQT21VEiYKYTDIP46
         WDWInCF7kZGEPtB8tTIl3hCKUf8hTUBvB5SUotUXGe0gc6jWYz4SEdpF88NiYhAzxsD+
         O0G7PuARIFbFf0E7xApyeB0nl+R64XVBCDtx7OorzbafSyTNtbDH4+mhhu4ObsqEV0DQ
         FQ5w==
X-Gm-Message-State: AOJu0Yyd+BGr9nedWYLAbthraW1+KzukYFfWub6QMVxpCdom5MdQ/wL3
	N6lRYwH9YvbWqNfu+uEFKW+RYMZShs2hW2pIhhsT0NBYHcM+MV+X7CRE8E5qpGhtNkM91LaHt6Y
	I7MVJjXbzjFILFL1/+OCNK+TDjMBb8YVMfzLkEciteA==
X-Gm-Gg: ASbGncvxx/BBOH8RFVP3GXOLmifLVBgPyAOfAOrE2gTXrlWj1jiiFskv+PMxC2IFrS4
	nIIuWqdVASLBaf9kfKjnWKPNeGzdfDW6FB1KI3onRJtfY602sIBlMuFrHrDT5GI0Qp2SFXsPwVL
	26im4ERJILVtBZvglEcMxDvHoVgHKhy2Mvd0puuT4qxfKSrIxjTcQ7KuVRQ7+9hPAOqbHx77fIg
	vJ0p1sJKLyVKwx7tZXHlqYr2ayrYlCcOcRVzTFAVSq+JkreEV99xU1TLyKpykXsuDH2w+Q+/uAJ
	lvOylDT6nfCae3V0lKvq6LWkjD8VvKmBmRCLqzLTdwUDQg7Rym/TI0tq1fJGGQ==
X-Google-Smtp-Source: AGHT+IHzQMcW+Ik+oaAQlVUYPLv31l+jln9/Z7u2Ob/DTRdv+jK6tycNj6lJWvAjiRxYZjPS0xmr+qylwPXFadASZmI=
X-Received: by 2002:a05:6e02:2291:b0:42f:9187:f6e0 with SMTP id
 e9e14a558f8ab-430c5270233mr187999225ab.13.1760936978043; Sun, 19 Oct 2025
 22:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250925-smt-k1-8-cores-v3-0-0885a8a70f8e@linux.spacemit.com> <20250925-smt-k1-8-cores-v3-3-0885a8a70f8e@linux.spacemit.com>
In-Reply-To: <20250925-smt-k1-8-cores-v3-3-0885a8a70f8e@linux.spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 20 Oct 2025 10:39:26 +0530
X-Gm-Features: AS18NWDZ7BeAVUAxVQa4IO7Fcfz5Ou8-RSF-vB_dLebcKeO6UreobDMilArAXQM
Message-ID: <CAAhSdy3yezmssOQyioxTgVQLAJKAX-E22SjMB+kt=Y_32VkUtA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] platform: generic: Add SpacemiT K1 platform support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_220939_053306_9F8C28CD 
X-CRM114-Status: GOOD (  13.04  )
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

T24gVGh1LCBTZXAgMjUsIDIwMjUgYXQgMzoxOeKAr1BNIFRyb3kgTWl0Y2hlbGwKPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IEZyb206IFhpYW5iaW4gWmh1IDx4
aWFuYmluLnpodUBsaW51eC5zcGFjZW1pdC5jb20+Cj4KPiBFbmFibGUgQ09ORklHX1BMQVRGT1JN
X1NQQUNFTUlUX0sxIGluIHRoZSBkZWZjb25maWcgZm9yIFNwYWNlbWlUIEsxIFNvQy4KPgo+IENv
LWF1dGhvcmVkLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4LnNwYWNlbWl0
LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNoZWxsQGxpbnV4
LnNwYWNlbWl0LmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuYmluIFpodSA8eGlhbmJpbi56aHVA
bGludXguc3BhY2VtaXQuY29tPgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4K
ClRoYW5rcywKQW51cAoKPiAtLS0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZp
ZyB8IDUgKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVmY29uZmln
IGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZwo+IGluZGV4IDRiOTNkMGJjNTUy
MzNmODNhOTA3ZmY4MTIzNGM3ODU0MGUzM2Q4MjguLjg2ZTdiYjllM2Q4NTlkY2Y3MmU3Nzc1ZmFl
MDg0NGZmMDY2YmUwZjggMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2Rl
ZmNvbmZpZwo+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcKPiBAQCAt
MSw1ICsxLDYgQEAKPiAgQ09ORklHX1BMQVRGT1JNX0FMTFdJTk5FUl9EMT15Cj4gIENPTkZJR19Q
TEFURk9STV9BTkRFU19BRTM1MD15Cj4gK0NPTkZJR19QTEFURk9STV9PUEVOSFdHUk9VUF9PUEVO
UElUT049eQo+ICBDT05GSUdfUExBVEZPUk1fUkVORVNBU19SWkZJVkU9eQo+ICBDT05GSUdfUExB
VEZPUk1fU0lGSVZFX0ZVNTQwPXkKPiAgQ09ORklHX1BMQVRGT1JNX1NJRklWRV9GVTc0MD15Cj4g
QEAgLTcsNyArOCw3IEBAIENPTkZJR19QTEFURk9STV9TT1BIR09fU0cyMDQyPXkKPiAgQ09ORklH
X1BMQVRGT1JNX1NUQVJGSVZFX0pINzExMD15Cj4gIENPTkZJR19QTEFURk9STV9USEVBRD15Cj4g
IENPTkZJR19QTEFURk9STV9NSVBTX1A4NzAwPXkKPiAtQ09ORklHX1BMQVRGT1JNX09QRU5IV0dS
T1VQX09QRU5QSVRPTj15Cj4gK0NPTkZJR19QTEFURk9STV9TUEFDRU1JVF9LMT15Cj4gIENPTkZJ
R19GRFRfQ1BQQz15Cj4gIENPTkZJR19GRFRfQ1BQQ19SUE1JPXkKPiAgQ09ORklHX0ZEVF9HUElP
PXkKPiBAQCAtMzYsOCArMzcsOCBAQCBDT05GSUdfRkRUX1JFU0VUX0FUQ1dEVDIwMD15Cj4gIENP
TkZJR19GRFRfUkVTRVRfR1BJTz15Cj4gIENPTkZJR19GRFRfUkVTRVRfSFRJRj15Cj4gIENPTkZJ
R19GRFRfUkVTRVRfUlBNST15Cj4gLUNPTkZJR19GRFRfUkVTRVRfU1VOWElfV0RUPXkKPiAgQ09O
RklHX0ZEVF9SRVNFVF9TRzIwNDJfSFdNT05fTUNVPXkKPiArQ09ORklHX0ZEVF9SRVNFVF9TVU5Y
SV9XRFQ9eQo+ICBDT05GSUdfRkRUX1JFU0VUX1NZU0NPTj15Cj4gIENPTkZJR19GRFRfU0VSSUFM
PXkKPiAgQ09ORklHX0ZEVF9TRVJJQUxfQ0FERU5DRT15Cj4KPiAtLQo+IDIuNTEuMAo+Cj4KPiAt
LQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4g
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAK
b3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
