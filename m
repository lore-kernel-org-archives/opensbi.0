Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FEF7C61DD6
	for <opensbi@archiver.kernel.org>; Tue,  1 Sep 2026 05:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=112K3W9Iq+1iIHRZCdvU+CfBPap2cz2eVqji8i2LNVQ=; b=MWLjAvY9lOWdIk
	6nqd4CAqYlpyxyjWILV+BGjnMpwMk3Mv87CR6ym93PFoNqwGuo81AGTFPvCyE9DmcGjMSM3UDo2z2
	rMmKnOhmLZipFw0bmRnsXeJnEnaYYXd9ghjaLyCCgVl1LV6xKGPT8gPbC/G+Fowp+eiwGIPqvl1dm
	wW33rb9R7psl7b0X+U7QLM8cXv+/uLoeAdWAssfsMholWk5qUv8KK1cAUxaJymKNBJ2YX4AewuTId
	/IbV4sZNzhoxLijt5BKGFfoPZwJx5erUGCni4eLWD9rjA99ctTXHkk3yS/y1zQ+A5JJYk2VGdD27W
	IlfwNrbZr27JauhwDY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1H6J-0000000B1R5-3bCC;
	Tue, 01 Sep 2026 05:32:03 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1H6F-0000000B1QJ-404U
	for opensbi@lists.infradead.org;
	Tue, 01 Sep 2026 05:32:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-49ccfbe062eso21836095e9.3
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 22:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788240718; cv=none;
        d=google.com; s=arc-20260327;
        b=mK10IGhYqoQfi8xyM4+e1f/67l2j7sISaatAEQfXx57ZdNoMvq/RxFu3OJFH5prO9W
         0fy8beMvHUmf1pIs0seYxxCA9rHqgRg7jpzZVbZOaJNRPjaSr3+BCDmkTMh7klM3EKOm
         u9NQTwQx9cYf4Iuw8qai6AmGpfeiDpDYFSwXunQ2XIHmd3As/+VNMD/7E+m0OvnozqIg
         g21jfQdxC8/UR4cMJ2H4+uAApmLBs7APZZoA2qGdof5Shqk4CpB/c/PgbyOWnBsX2k4K
         YUibxf8wPldf7yoJCB7bZDCnfBZ7XB4erOJ12UqDrvX9ovst10vsQ3PzmqOjMMnr995f
         icVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=31E3b+gKZPufqJbJI6Nnr1GRodAiloegWQXeU9Q9L+c=;
        fh=oTRVdsah42kXT1osMQVcOcvNPcz4SXpfmfX8aR+v99E=;
        b=guoL3/iOUlEryjXKKvHX41PzWks/XAKqRhMCHdQv0OXRLv7WG75XdIwVpaKpNBSWDv
         Ea60P+f87BYQhBcSjrI9BhGawJ5slSBaIZT17T28yCGaMzZ6PJAQPUpe03ge5/Fj20XY
         D2kVJOkGxsE+Q9Ow40B47JNzZDdcJdbeUwngAmz3aJTywK6BBe23UKXvmEbURXvj3tRn
         s/PE7McL4fa1xE5wEoyyKZ5IRJ16UXScIgWkheM4hktl4cLkGxIXCioXsIuV6DOFKutJ
         c3ZBfOwMarrgLTnGi43RZ7CI2i2cmc6SZaj6nXWb8TAQPaUkzQkfvYB9f2u6mRUQnNVy
         NTmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788240718; x=1788845518; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=31E3b+gKZPufqJbJI6Nnr1GRodAiloegWQXeU9Q9L+c=;
        b=Gdy+jiIfMmMMjlwCNffF/o7Fwx4fArJK8wjSOSL/cvbhkxKDDR4cSo9t6O40xER8Fg
         uTskYWejw3wpuvYOl4gtPOVWbcAGTHpxmHUYgblKmOQNowP+J3ajUBRBUREv3Cl6knXl
         VA2hMSZuIKc10e3jeg2VuAZMVY7IB/++I627mxb1W14yG7eUzKWCDvLY/QDOyrk8pUDm
         RH371O0N3PL0pP3e1iTyt+U9LSnLQDynn8ICbB2oR6BJCfLvfsVIlLDuzWtMA1VgloC6
         nG0bgvT64Hk7xqrraT0kpb/xkC0AJIhv6R3Vl+qO14YKnp8rDL1e5uvPCB0SlIkNnBBo
         S7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788240718; x=1788845518;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31E3b+gKZPufqJbJI6Nnr1GRodAiloegWQXeU9Q9L+c=;
        b=R9QeQpQnOQC/YyQRSDQuYbffDfuwzVcSgIG9xIp0bqj/dE0+ZD+pXzQCTgRz0mWF20
         SUCV9LpREqtJ8uW2Oosc5APAbRVOLx9JFlet77AB9BBmitimc6PVqxfnf38xN2Z8Y4wB
         NfwVHXtKvYXL6oPoNykQDmK7PvDxx/RXzYfnKAYsSDeccX8c0HBhsDuljZYBfjkqFQVM
         twkgMzKe5xqPiCO1NB3fDYeVXRU2EQDuDTUTTpsyowoQjBfV6Cf/2T0XyIP1SGAW74Sw
         UIxA1A0XsjYh3W6B6AaVlT//nA/EvZO9FqKAfrnphAtnGx2HWtEVY+G7dIAzHdH+PXc1
         f+4A==
X-Gm-Message-State: AFuF++n+fzz6xHU9x/TW7ReOWAGJUFgQLpw3WwwMtbwT5AAHroNvfyuJ
	trkJzGgnLlwNWbscPtciK0X4/6cyIimcGg8HeOPc7eF5AEgl7g3sjbwOoGtMnEKdR3iUKpw7XST
	7zTD2ZtpaSa3QwAwJQPHhnSzvMZ6zIN0WTJYkyzxy/52kycXj/W7+
X-Gm-Gg: AR+sD13hHp8QHtVy16bhfoj3PgH/yJ1/tX3hOz59fT7L2kAzPKyW5y7U9vkVg0C/Htx
	IYZwUadtVp7HrQEc5I8fJaAx0le6hIXz2rgvCSSzVg3lqX0Ewg2ZxX6m0ng0zaCRBN0fpq6VI7Z
	kr4A8PSNb+yeoDCyFgm3SeFUghUrgxbkoORrFoXlOmiZ7ZVRxC6J5h3EZzmvaVni7Jtrl7PDQIr
	HtT0p6GHvVd3nGKn4dDDZB0TAlnYK4uBZPVpWud1Fli+LkLHyu65lfJ3VJGNXO5Z0Lp3nYVcwY+
	H21ZG3wEz+wpP7/xVT68R+mPhRp8Vwo97SYjHNxi4cybamV5z2hvfkXXj6LCOVd/WTqKnZb+1kQ
	em0x2qPnykEka8a1UeFhhIY4XfmnAC+l37QSQRcnBH8DAYuBaqtjQ4+mPoxZ6N645VCANoDA1Ep
	o=
X-Received: by 2002:a05:600c:4692:b0:49b:d03:8d3a with SMTP id
 5b1f17b1804b1-49b91c3e5fdmr444316625e9.11.1788240717610; Mon, 31 Aug 2026
 22:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260729092317.2848665-1-randolph@andestech.com>
In-Reply-To: <20260729092317.2848665-1-randolph@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Sep 2026 11:01:46 +0530
X-Gm-Features: AcwNN1VmpiameKG7JzbKDYwKJIhaRPrRAbEJ7pjVHIcZz516HIpnyHQic4nPBls
Message-ID: <CAAhSdy1d-eBck5ZTc4EO6QvaeVHZJ73qz1JNz10vU2grxh_Hvw@mail.gmail.com>
Subject: Re: [PATCH] platform: generic/andes: fix 32-bit shift overflow in decode_pmaaddrx()
To: Randolph <randolph@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_223200_014359_FB8DB6C6 
X-CRM114-Status: GOOD (  20.64  )
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

T24gV2VkLCBKdWwgMjksIDIwMjYgYXQgMjo1M+KAr1BNIFJhbmRvbHBoIDxyYW5kb2xwaEBhbmRl
c3RlY2guY29tPiB3cm90ZToKPgo+IGRlY29kZV9wbWFhZGRyeCgpIHJlY29uc3RydWN0cyB0aGUg
TkFQT1QgcmVnaW9uIHN0YXJ0IGFuZCBzaXplIGZyb20gYQo+IHBtYWFkZHIgQ1NSIHZhbHVlIHVz
aW5nICIxIDw8IChrICsgMykiIGFuZCAiMSA8PCBrIi4gVGhlIGludGVnZXIKPiBsaXRlcmFsIDEg
aGFzIHR5cGUgaW50LCBzbyB0aGVzZSBzaGlmdHMgYXJlIHBlcmZvcm1lZCBpbiAzMi1iaXQKPiBw
cmVjaXNpb24uIFNoaWZ0aW5nIGEgMzItYml0IHZhbHVlIGJ5IDMyIG9yIG1vcmUgYml0cyBpcyB1
bmRlZmluZWQKPiBiZWhhdmlvciwgYW5kIG9uIFJWNjQgdGhlIGNvbXBpbGVyIGVtaXRzIHNsbHcs
IHdoaWNoIHRydW5jYXRlcyB0aGUKPiBzaGlmdCBhbW91bnQgbW9kdWxvIDMyLgo+Cj4gQXMgYSBy
ZXN1bHQsIGFueSBQTUEgcmVnaW9uIHdpdGggc2l6ZSA+PSA0IEdpQiAoayA+PSAyOSkgaXMgZGVj
b2RlZAo+IGluY29ycmVjdGx5LiBGb3IgZXhhbXBsZSwgb24gdGhlIEFuZGVzIFFpTGFpIFNvQyB0
aGUgUENJZSByZWdpb24KPiAweDEwMDAwMDAwMDAgLSAweDE3ZmZmZmZmZmYgKHBtYWFkZHIgPSAw
eDRmZmZmZmZmZiwgayA9IDMyKSBpcyBkZWNvZGVkCj4gYXMgYW4gOC1ieXRlIHJlZ2lvbiBhdCAw
eDEzZmZmZmZmZmMuCj4KPiBUaGlzIGlzIG5vdCBtZXJlbHkgY29zbWV0aWM6IGRlY29kZV9wbWFh
ZGRyeCgpIGlzIHVzZWQgYnkKPiBoYXNfcG1hX3JlZ2lvbl9vdmVybGFwKCkgYW5kIGFuZGVzX3Ni
aV9mcmVlX3BtYSgpLCBzbyBvdmVybGFwIGNoZWNrcwo+IGFyZSBwZXJmb3JtZWQgYWdhaW5zdCBi
b2d1cyByYW5nZXMgYW5kIGZyZWVpbmcgc3VjaCBhbiBlbnRyeSBieSBpdHMKPiBwaHlzaWNhbCBh
ZGRyZXNzIGFsd2F5cyBmYWlscy4KPgo+IFByb21vdGUgdGhlIHNoaWZ0cyB0byB1bnNpZ25lZCBs
b25nIHNvIHRoZXkgYXJlIHBlcmZvcm1lZCBpbiB0aGUKPiBuYXRpdmUgcmVnaXN0ZXIgd2lkdGgu
Cj4KPiBGaXhlczogYWE1NjA4NGM0ZGZiICgicGxhdGZvcm06IGdlbmVyaWM6IGFuZGVzOiBhZGQg
YSBuZXcgQW5kZXMgU0JJIGNhbGwgdG8gc2V0IHVwIGEgUE1BIGVudHJ5IikKPiBTaWduZWQtb2Zm
LWJ5OiBSYW5kb2xwaCBMaW4gPHJhbmRvbHBoQGFuZGVzdGVjaC5jb20+CgpMR1RNLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0
Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgcGxh
dGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19wbWEuYyB8IDQgKystLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRm
b3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1hLmMgYi9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL2Fu
ZGVzX3BtYS5jCj4gaW5kZXggYmE5YTM1YmIuLjI4ZDMzYTJmIDEwMDY0NAo+IC0tLSBhL3BsYXRm
b3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG1hLmMKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL2Fu
ZGVzL2FuZGVzX3BtYS5jCj4gQEAgLTgyLDggKzgyLDggQEAgc3RhdGljIHZvaWQgZGVjb2RlX3Bt
YWFkZHJ4KGludCBlbnRyeV9pZCwgdW5zaWduZWQgbG9uZyAqc3RhcnQsCj4gICAgICAgICAgKi8K
PiAgICAgICAgIHBtYWFkZHIgPSBjc3JfcmVhZF9udW0oQ1NSX1BNQUFERFIwICsgZW50cnlfaWQp
Owo+ICAgICAgICAgayA9IHNiaV9mZnoocG1hYWRkcik7Cj4gLSAgICAgICAqc2l6ZSA9IDEgPDwg
KGsgKyAzKTsKPiAtICAgICAgICpzdGFydCA9IChwbWFhZGRyIC0gKDEgPDwgaykgKyAxKSA8PCAy
Owo+ICsgICAgICAgKnNpemUgPSAxVUwgPDwgKGsgKyAzKTsKPiArICAgICAgICpzdGFydCA9IChw
bWFhZGRyIC0gKDFVTCA8PCBrKSArIDEpIDw8IDI7Cj4gIH0KPgo+ICBzdGF0aWMgYm9vbCBoYXNf
cG1hX3JlZ2lvbl9vdmVybGFwKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgc2l6
ZSkKPiAtLQo+IDIuMzQuMQo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
