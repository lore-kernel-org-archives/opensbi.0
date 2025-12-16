Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A062D609D2
	for <opensbi@archiver.kernel.org>; Tue, 16 Dec 2025 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ne91j/bcbY3/tlsfvuXatYWkF5WFMWj6yjpDzA8EW0Q=; b=f5Eu+ylPKmgb2z
	tM3BUTnnnJPh7cJ9vVT8beA6PGMOud78kFjQvBQDH1tkhT4NPRGV89R4e9CkplLA1ZHOhb3SLE3Sf
	3PUQKpnxS8fBWtocUXF9fr5iPNDN0yhV0y/JI5WLDojAF3Kwqr9AQ8iBXvRa/851PGezd+XsQcTl+
	StWoP/irH4s9icccDAUon0B9gkZWU/YYxFQbBi2EC6wiD8LU1p0RWtBbqGt96OxAujMTG+MPXsasz
	9+/1Oy3MWrDODWOuywL8eGf6xTPFR0xId77KMBhm66PbSsrLfNSFa9HPWkqyDjV96dVkYyP3iD0Lm
	U6iGwupmqT0Of1W9puDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYtF-00000005cFB-45l9;
	Tue, 16 Dec 2025 17:31:13 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVYtD-00000005cEn-3PVG
	for opensbi@lists.infradead.org;
	Tue, 16 Dec 2025 17:31:13 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-45391956bfcso3974119b6e.3
        for <opensbi@lists.infradead.org>; Tue, 16 Dec 2025 09:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1765906270; x=1766511070; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xD8PbMaOXUKXC09et1YMiLdqrGxXnJye2ZQWh6NjhdU=;
        b=gRnAOKE4VQaY4uHVo6zvSe0qzy/1CdcjbEk2hYeilN2E0h2bqnwwbffyLSrr/uUmmS
         0aqlyzvxQuN/N8AM+b+cX/EP4jPJRXjelA0qPTNBn7mBuE6ctC+J/C0shY/Bhdi3qt86
         ppCroPYjt+vZpsGRSmDuYLHNc8328oA3WVU0NynQeCxTEYDyBgI2xjMl3vEPJ734kZ4P
         BSKjvVzVhwNDr9SA+dbkxZmOd9z+bRqHJ3W+FxTirwn9qDG+klsV4VNBhJP5fzpeRovr
         UdOF68VgAsD3YC4tCsB4TkOzxtbrPPzhePNn9ZYOOyd2aHpX0za6NF8Jtq8NTv4fw2Rl
         yf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765906270; x=1766511070;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xD8PbMaOXUKXC09et1YMiLdqrGxXnJye2ZQWh6NjhdU=;
        b=eeBlS87ptWKo5Eq3U/wY91T/PtojQ2TO7D7skhxH865JLrUyB69tn3tCBeqYTtIJmS
         Be3cS1kYSLiMTheL+jttVznKIuaQ3AI6j5Z19+NlH03LVksuYDDg9Td4ixc0gCTklZPh
         FNFJBX4vSYFviFul/r3uopFsAtTwk3uoAMBQEp2MXlESq09fp2fKTJ3xOYjCU8D3qWtI
         pbypbaEd5G+p6UEy2zviBRqOU5rqDLqhIMqH9G4I/08Vw8OloajZdDwBO8+0f/gUJi4v
         xFcGkydOcfH57oqDfW32mAJ2uOvAm6qm/fBSc25wkRMFoUZqXJuwghAIQzPUOWvyyOMU
         hGyg==
X-Forwarded-Encrypted: i=1; AJvYcCWX8uju2gR1NqQPfb/OffE6N4RmPLq7dvLZa/+oIjdd9WuCdoEpMdAjrmVA1TNOyUyzqxwiTNbl@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6nk8PyfttGRQo3Tf9j1+OhuRVW/AJVJcDR0l17LwlmfxSlwNF
	ICmCugj+dFWaFQ3r/AuiYpQbPU9/muKXNCo50ur5vQpgJg/K/ytj+y4zb/x7y7iFvf8=
X-Gm-Gg: AY/fxX6CSPyxWcr5C9br8TVZTcv9eJxQDQBfh9pmQuA9Ka+XWllt4YFuO88j4SPisyz
	h5BFUDG4yegR62L+m/sowNzOw3M1+bnAn7+T/tVYpX74HrA64XSGFO1YB82w1wMVu5Irj48rVDH
	xRhCZTyNClBsEA5X4FbrwvEy5NWloMS8VRSon4ef9i09tao6sdmt16XELPzY7t4AGZRgRg00olc
	5kFOaLPHDH929X0r+PXimJBFzldG1yilYFtV2Br9e7CLyyEGqHjdpz/UmEkMBac0DWHFBMj7JJo
	BdzOIhowT/sQiRtY7Uk1giOE+wj4Aa5x4TdtbSujazEee3LZRbhQQo7ziH3Zq+hLniGFB+Kr2L9
	Lx0XZXdt82BumdUSPB796mTYVFoBKp/Of6la4vN12U/NjFxmyq373NxFv+V7VBXqCvyZ25e+7CH
	+uSr6TyHqCCSX++kYjFiqBUdYpU077
X-Google-Smtp-Source: AGHT+IHKsXy4IeubajyYlCHW4JRTfAcH9jcrTjzWkZ3HSjiH22ITiMAJSCoeVJmkGfxLmvRtxvUHQQ==
X-Received: by 2002:a05:6808:1304:b0:450:b28c:6b79 with SMTP id 5614622812f47-455ac9d2593mr6285781b6e.59.1765906270582;
        Tue, 16 Dec 2025 09:31:10 -0800 (PST)
Received: from [100.64.0.1] ([170.85.11.118])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45598d6e789sm9139041b6e.22.2025.12.16.09.31.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 09:31:10 -0800 (PST)
Message-ID: <fa570c2d-43b0-480b-833e-62f99dac7da7@sifive.com>
Date: Tue, 16 Dec 2025 11:31:09 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform: generic: Keep some empty space in FDT passed
 to next stage
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, opensbi@lists.infradead.org
References: <20251209053130.407935-1-apatel@ventanamicro.com>
 <CAAhSdy3wZ=ih970E1ZT9tW+=gz1gYbjMWELriHX1ya-pr40iUw@mail.gmail.com>
 <bdfa024a-ad3d-47af-b629-ede7d4ecd607@sifive.com>
 <CAK9=C2URiHPjLaYuF_rZbjsUCT+s+=o24_M8NM_W=kBQDVqdUA@mail.gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAK9=C2URiHPjLaYuF_rZbjsUCT+s+=o24_M8NM_W=kBQDVqdUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_093111_871972_68D72211 
X-CRM114-Status: GOOD (  18.57  )
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

T24gMjAyNS0xMi0xNiAxMTowOSBBTSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUsIERlYyAx
NiwgMjAyNSBhdCA5OjI14oCvUE0gU2FtdWVsIEhvbGxhbmQKPiA8c2FtdWVsLmhvbGxhbmRAc2lm
aXZlLmNvbT4gd3JvdGU6Cj4+Cj4+IEFudXAsCj4+Cj4+IE9uIDIwMjUtMTItMTYgODo0NSBBTSwg
QW51cCBQYXRlbCB3cm90ZToKPj4+IE9uIFR1ZSwgRGVjIDksIDIwMjUgYXQgMTE6MDHigK9BTSBB
bnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Pj4KPj4+PiBMZWF2
aW5nIG5vIGVtcHR5IHNwYWNlIGluIHRoZSBGRFQgcGFzc2VkIHRvIHRoZSBuZXh0IGJvb3Rpbmcg
c3RhZ2UKPj4+PiBjYXVzZXMgdGhlIGZvbGxvd2luZyBVLUJvb3QgY3Jhc2ggb24gVmVudGFuYSBp
bnRlcm5hbCBwbGF0Zm9ybXM6Cj4+Pj4KPj4+PiBVbmhhbmRsZWQgZXhjZXB0aW9uOiBMb2FkIGFj
Y2VzcyBmYXVsdAo+Pj4+IEVQQzogMDAwMDAwMDBmZmZhNjM3MiBSQTogMDAwMDAwMDBmZmZhNzQx
OCBUVkFMOiAwMDAxNzQ2MTc0NzMwMDY4Cj4+Pj4gRVBDOiAwMDAwMDAwMDgwMjQ1MzcyIFJBOiAw
MDAwMDAwMDgwMjQ2NDE4IHJlbG9jIGFkanVzdGVkCj4+Pj4KPj4+PiBTUDogIDAwMDAwMDAwZmVm
Mzg0NDAgR1A6ICAwMDAwMDAwMGZlZjQwZTYwIFRQOiAgMDAwMDAwMDAwMDAwMDAwMAo+Pj4+IFQw
OiAgMDAwMDAwMDBmZWY0MGE3MCBUMTogIDAwMDAwMDAwMDAwMGZmMDAgVDI6ICAwMDAwMDAwMDAw
MDAwMDAwCj4+Pj4gUzA6ICAwMDAwMDAwMGZmZmMxN2E4IFMxOiAgMDAwMDAwMDBmZWYzOGQ0MCBB
MDogIDczNzU3NDYxNzQ3MzAwNjgKPj4+PiBBMTogIDAwMDAwMDAwZmZmYzE3YTggQTI6ICAwMDAw
MDAwMDAwMDAwMDEwIEEzOiAgMDAwMDAwMDAwMDAwMDAxMAo+Pj4+IEE0OiAgMDAwMDAwMDAwMDAw
MDAwMCBBNTogIDAwMDAwMDAwZmZmYzE3YjggQTY6ICAwMDAwMDAwMDAwZmYwMDAwCj4+Pj4gQTc6
ICAwMDAwMDAwMDAwMDBiMTAwIFMyOiAgMDAwMDAwMDAwMDAwMDAwMCBTMzogIDAwMDAwMDAwMDAw
MDAwMDEKPj4+PiBTNDogIDAwMDAwMDAwZmVmMzhkNDAgUzU6ICA3Mzc1NzQ2MTc0NzMwMDY4IFM2
OiAgMDAwMDAwMDAwMDAwMDAwMAo+Pj4+IFM3OiAgMDAwMDAwMDBmZWY0ZWVmMCBTODogIDAwMDAw
MDAwZmVmNGVmOTAgUzk6ICAwMDAwMDAwMDAwMDAwMDAwCj4+Pj4gUzEwOiAwMDAwMDAwMDAwMDAw
MDAwIFMxMTogMDAwMDAwMDBmZWY0ZWZjMCBUMzogIDAwMDAwMDAwZmVmNDBlYTgKPj4+PiBUNDog
IDAwMDAwMDAwMDBmZjAwMDAgVDU6ICAwMDAwMDAwMGZlZjQwYTYwIFQ2OiAgMDAwMDAwMDBmZWY0
MGE2Ywo+Pj4+Cj4+Pj4gVG8gYWRkcmVzcyB0aGUgYWJvdmUgaXNzdWUsIGtlZXAgc29tZSBtaW5p
bWFsIGVtcHR5IHNwYWNlIGluIHRoZQo+Pj4+IEZEVCBpbnN0ZWFkIG9mIG5vIGVtcHR5IHNwYWNl
Lgo+Pj4+Cj4+Pj4gRml4ZXM6IGJiZTlhMjMwNjBlOSAoInBsYXRmb3JtOiBnZW5lcmljOiBQYWNr
IHRoZSBGRFQgYWZ0ZXIgYXBwbHlpbmcgZml4dXBzIikKPj4+PiBTaWduZWQtb2ZmLWJ5OiBBbnVw
IFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPj4+Cj4+PiBBcHBsaWVkIHRoaXMgcGF0
Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KPj4KPj4gQWdhaW4sIHRoaXMgcGF0Y2ggcmVp
bnRyb2R1Y2VzIHRoZSBidWcgdGhhdCB3YXMgZml4ZWQgYnkgdGhlICJGaXhlczoiIGNvbW1pdC4K
Pj4gWW91IGNhbid0IGp1c3Qgc2F5ICJzb21lYm9keSB3aWxsIGFkZCB0aGUgbWVtc2V0KCkgc29t
ZXdoZXJlIGxhdGVyIiBhbmQgaWdub3JlCj4+IHRoZSBidWcgeW91IGFyZSBpbnRyb2R1Y2luZy4g
WW91IG5lZWQgdG8gYWRkIHRoZSBtZW1zZXQoKSAqbm93KiBhbG9uZyB3aXRoIHRoZQo+PiBmZHRf
b3Blbl9pbnRvKCkgY2FsbC4KPiAKPiBZZXMsIGJ1dCB0aGF0IGZpeCBicm9rZSBVLWJvb3QgYm9v
dGluZy4KCkFuZCBpdCBpcyBlbnRpcmVseSBwb3NzaWJsZSB0byBmaXggVS1ib290IGJvb3Rpbmcg
d2l0aG91dCBicmVha2luZyBvdGhlciB1c2VycwooY3Z3LCBldGMuKSBpbiB0aGUgcHJvY2Vzcy4g
WWVzLCB0aGUgb3JpZ2luYWwgY29tbWl0IGV4cG9zZWQgYSBidWcgaW4gVS1Cb290LgpCdWdzIGhh
cHBlbjsgd2UgY2FuIGZpeCB0aGVtIG9yIHdvcmsgYXJvdW5kIHRoZW0uIEJ1dCBuZWVkaW5nIHRv
IGZpeCBvbmUgYnVnIGlzCm5vdCBsaWNlbnNlIHRvIGludGVudGlvbmFsbHkgaW50cm9kdWNlIG1v
cmUgYnVncy4KCj4gVGhlIG9yaWdpbmFsIGZpeCBpdHNlbGYgd2FzIGluY29tcGxldGUuIEFkZGlu
ZyBtZW1zZXQoKSB0bwo+IGZkdF9vcGVuX2ludG8oKSBpcyBhIHNlcGFyYXRlIGNoYW5nZS4gRmVl
bCBmcmVlIHRvIHNlbmQKPiBwYXRjaCBmb3IgaXQuCgpJZiB5b3Ugd2FudCBhZGRpbmcgbWVtc2V0
KCkgdG8gZmR0X29wZW5faW50bygpIHRvIGJlIGEgc2VwYXJhdGUgY2hhbmdlLCB0aGVuCnRoYXQg
Y2hhbmdlIG11c3QgYmUgbWVyZ2VkICpmaXJzdCosIGJlZm9yZSB0aGlzIHBhdGNoLCBzbyBpdCBp
cyB0aGVuIHNhZmUgdG8gYWRkCnRoZSBjYWxsIHRvIGZkdF9vcGVuX2ludG8oKS4gQmVjYXVzZSBu
b3cgeW91IGhhdmUgYnJva2VuIGJpc2VjdGFiaWxpdHkgZm9yIHRoZQphZmZlY3RlZCBwbGF0Zm9y
bXMuIFRoZSB1bmluaXRpYWxpemVkIG1lbW9yeSBpc3N1ZSB3YXMgY29tcGxldGVseSBmaXhlZCBi
eSB0aGUKb3JpZ2luYWwgcGF0Y2gsIGFuZCBPcGVuU0JJIGNvdWxkIGJvb3Qgb24gY3Z3IGFzIG9m
IHRoYXQgY29tbWl0OyBub3cgaXQgaXMKYnJva2VuIGFnYWluLCBhbmQgdGhhdCBpcyBhIHJlZ3Jl
c3Npb24uCgpSZWdhcmRzLApTYW11ZWwKCj4+Pj4gLS0tCj4+Pj4gQ2hhbmdlcyBzaW5jZSB2MjoK
Pj4+PiAtIEZpeCBjb21tZW50cyBpbiBnZW5lcmljX2ZpbmFsX2luaXQoKQo+Pj4+IENoYW5nZXMg
c2luY2UgdjE6Cj4+Pj4gLSBBZGQgS2NvbmZpZyBvcHRpb24gZm9yIGFtb3VudCBvZiBlbXB0eSBz
cGFjZSBpbiBGRFQgd2l0aCBkZWZhdWx0Cj4+Pj4gICB2YWx1ZSBhcyA0S0IKPj4+PiAtLS0KPj4+
PiAgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgIHwgNSArKysrKwo+Pj4+ICBwbGF0Zm9ybS9n
ZW5lcmljL3BsYXRmb3JtLmMgfCAzICsrKwo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZyBi
L3BsYXRmb3JtL2dlbmVyaWMvS2NvbmZpZwo+Pj4+IGluZGV4IDI1Yjg4ODZiLi5iMTgwODAxMiAx
MDA2NDQKPj4+PiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPj4+PiArKysgYi9wbGF0
Zm9ybS9nZW5lcmljL0tjb25maWcKPj4+PiBAQCAtMjMsNiArMjMsMTEgQEAgY29uZmlnIFBMQVRG
T1JNX0dFTkVSSUNfTUlOT1JfVkVSCj4+Pj4gICAgICAgICByYW5nZSAwIDY1NTM1Cj4+Pj4gICAg
ICAgICBkZWZhdWx0IDEKPj4+Pgo+Pj4+ICtjb25maWcgUExBVEZPUk1fR0VORVJJQ19GRFRfRU1Q
VFlfU1BBQ0UKPj4+PiArICAgICAgIGludCAiUGxhdGZvcm0gRkRUIGVtcHR5IHNwYWNlIChLQiki
Cj4+Pj4gKyAgICAgICByYW5nZSAwIDEwMjQKPj4+PiArICAgICAgIGRlZmF1bHQgNAo+Pj4+ICsK
Pj4+PiAgY29uZmlnIFBMQVRGT1JNX0FMTFdJTk5FUl9EMQo+Pj4+ICAgICAgICAgYm9vbCAiQWxs
d2lubmVyIEQxIHN1cHBvcnQiCj4+Pj4gICAgICAgICBkZXBlbmRzIG9uIEZEVF9JUlFDSElQX1BM
SUMKPj4+PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5jIGIvcGxhdGZv
cm0vZ2VuZXJpYy9wbGF0Zm9ybS5jCj4+Pj4gaW5kZXggZTY2Zjk5ZmEuLjAxZmEwM2UwIDEwMDY0
NAo+Pj4+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+Pj4+ICsrKyBiL3BsYXRm
b3JtL2dlbmVyaWMvcGxhdGZvcm0uYwo+Pj4+IEBAIC0yNDUsNyArMjQ1LDEwIEBAIGludCBnZW5l
cmljX2ZpbmFsX2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4+Pj4gICAgICAgICBmZHRfZml4dXBzKGZk
dCk7Cj4+Pj4gICAgICAgICBmZHRfZG9tYWluX2ZpeHVwKGZkdCk7Cj4+Pj4KPj4+PiArICAgICAg
IC8qIFNldCB0aGUgZW1wdHkgc3BhY2UgaW4gRkRUIGJhc2VkIG9uIGtjb25maWcgb3B0aW9uICov
Cj4+Pj4gICAgICAgICBmZHRfcGFjayhmZHQpOwo+Pj4+ICsgICAgICAgZmR0X29wZW5faW50byhm
ZHQsIGZkdCwgZmR0X3RvdGFsc2l6ZShmZHQpICsKPj4+PiArICAgICAgICAgICAgICAgICAgICAg
Q09ORklHX1BMQVRGT1JNX0dFTkVSSUNfRkRUX0VNUFRZX1NQQUNFICogMTAyNCk7Cj4+Pj4KPj4+
PiAgICAgICAgIHJldHVybiAwOwo+Pj4+ICB9Cj4+Pj4gLS0KPj4+PiAyLjQzLjAKPj4+Pgo+Pj4K
Pj4KCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
