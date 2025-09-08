Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F1DCAC586
	for <opensbi@archiver.kernel.org>; Mon,  8 Sep 2025 12:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rtJVt3LO0WQP03pDafV/k94WFXZF8/dqt2XiAYfNQA4=; b=UDTs6f21Kwktav
	QFVVAwAjezy1a23pEn01LRqNXWj3ofNCw7IsL+4BqOgmz0QwYIl0PPtdAbFarbPC6JZgHKi30jmLk
	rCIUaj36ogzrKhZeqseQxyKxuAeIKGlDCSO8oLQnlqx+5q8jj4G59kOG0yRVqammwq8TCdzr4GX15
	4V4zf5c35aaMHxes3JLSrLGH3Hyh6iJ8s5mHNYgEmzf1QS5zcORxeNDpprGSbgojQa4UMsM2Ej1tk
	V9xjd+XjbHl6It3+ht5oZ4EvXErPzTRfkSSIO8WUGjS+VA7wLPyICl2nyXmKx9gyrhrx++buemb+6
	84OFIxoB5KYbCmJ+ezjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvadY-0000000GtA7-1mQR;
	Mon, 08 Sep 2025 12:06:20 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uva1L-0000000Gf6I-1TOz
	for opensbi@lists.infradead.org;
	Mon, 08 Sep 2025 11:26:52 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-887764c2834so162888139f.1
        for <opensbi@lists.infradead.org>; Mon, 08 Sep 2025 04:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757330810; x=1757935610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msX8+zxWt/UkUkaLdKHkR5mC1vpEAcCis1NyeY9LUBM=;
        b=OmHuMd/+IjT42SDiEu3iLl3ATq7uR4gAQdS7pLJ1FlM7ovBME34qyPKbh8x0MD5048
         W2ibFxCRbPbe3byW9OAxnDhL8RQx+8GuSQO9/GExe0SvAowpsoa6JKFF4v4JwKt5w7HM
         O53q7ybST64gMK4xSpr1Dv1hCXWVJAI2lFM6g7lfD+IpXQEG4zYeigNQbV+Q5rwosbId
         wiiGBpr/LPTA3dSbPaVnnVoc/BbRuTwxBFjudIyuCBcXN2QKZnQPcTMQV7njnD0Ndd1j
         GRqsrhSC7BjAAIn7j6jZV7wLgaTZJGCz9I9IppzAW8eMJ36L7JX/B6PWJkOruRQ6e3AM
         lC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757330810; x=1757935610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msX8+zxWt/UkUkaLdKHkR5mC1vpEAcCis1NyeY9LUBM=;
        b=ZF71SzeMU6FbdxacdCjvZIlt+FyXnu/0VBVOw+hLIWLKCWiUWwQSJo4PAcnloXh3gS
         1jtDmmTa5HerNkLszPf7p9Lc0Si6qy97FCEln95CfKs4qhDaJSbGBb8Nm9R3pzZ8K2mw
         h/uPjXShVxvb14rCtIBlV8wIvnf97LVooI+5SffN8/v7M0vEsKhN4VAIwVF5MFDQ8Fhf
         nua6zzYP3L3bYbKakVNNiCj/+jw2M2vWU9peQvhiHat1utiyowL7pwxRLS0Q+QICEbgI
         Sw6XtI1ve8gITmrs6GPjaLPx+ZuPWd0Tqwx76cbXRyLBG3OVcbPdnM4lAM54AyQiRulv
         wo6w==
X-Gm-Message-State: AOJu0YwaOVIuAfvo1LpuH3/c+qAOrVfxrwbUIgP85XSrK6tIVVvwSm8q
	EnzDIsmWn2AAzfUyxY7f+p6I7HHGPLmRDiyg8y9D3M4bXw0h/8F3HGKBUC65WkYXF5F1m/9d5RX
	RVk2Rr3bzd6LC0JcBO6NghXXC+Qxn5UnbKDzmaKkomw==
X-Gm-Gg: ASbGnctpG2kd9yH4rFNCfYT8bnl0ydCN0+YVAPX+vur8TNGoUfNAd9pJEbDaqBPEYZV
	ZMgJFwR/+an9Cjb9mASp4bGaQ1wsbRy1iEgOJy+ZlyfoCtz/Wi/xLxYiAgjR77ytdkCd3R8GoUu
	eWGNWudzP8s812rPljxSZB22FBnZv9y6n1Qeq+Hablmbz1d/kdS9E15nsQp0KmGDk0UuNwKMJ+G
	3VZi0g3K5w1bUQJu6u3nqwB2+fHY0dEMwCq+kszOJAG69dCQZc=
X-Google-Smtp-Source: AGHT+IEBOoE2GeSPfXXT8uVOqJNr/HUqeaAY/Opk3XS91TLTkNOQB1JGn9hQLwDXujNSEAIcrjkLaYtgx1YHnrx8Mbo=
X-Received: by 2002:a05:6e02:1d99:b0:3fd:5836:2318 with SMTP id
 e9e14a558f8ab-3fd8e98d323mr112466395ab.11.1757330810172; Mon, 08 Sep 2025
 04:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250905-cache-upstream-v6-0-6a6da629c961@sifive.com> <20250905-cache-upstream-v6-10-6a6da629c961@sifive.com>
In-Reply-To: <20250905-cache-upstream-v6-10-6a6da629c961@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 8 Sep 2025 16:56:36 +0530
X-Gm-Features: Ac12FXzLJsSgekE4d3A0N7wjQKrGcHkivVjZGDBKEruBC7l2BcZwCEQYdfIgr5I
Message-ID: <CAAhSdy3VDJYnxFZuSspoGnmrBg2dQM6bm-gXQLcKQje7+TBChA@mail.gmail.com>
Subject: Re: [PATCH v6 10/11] lib: utils/timer: Expose timer update function
To: Nick Hu <nick.hu@sifive.com>
Cc: opensbi@lists.infradead.org, Cyan Yang <cyan.yang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_042651_390207_E3EE03A2 
X-CRM114-Status: GOOD (  18.77  )
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

T24gRnJpLCBTZXAgNSwgMjAyNSBhdCA3OjU04oCvQU0gTmljayBIdSA8bmljay5odUBzaWZpdmUu
Y29tPiB3cm90ZToKPgo+IEV4cG9zaW5nIHRoZSBBQ0xJTlQgdGltZXIgdXBkYXRlIEFQSXMgc28g
dGhlIHVzZXIgY2FuIHVwZGF0ZSB0aGUgbXRpbWVyCj4gYWZ0ZXIgd2FraW5nIHVwIGZyb20gdGhl
IG5vbi1yZXRlbnRpdmUgc3VzcGVuZC4KPgo+IFNpZ25lZC1vZmYtYnk6IE5pY2sgSHUgPG5pY2su
aHVAc2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogQ3lhbiBZYW5nIDxjeWFuLnlhbmdAc2lmaXZl
LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz4KClJlZ2FyZHMsCkFudXAKCj4gLS0tCj4gIGluY2x1ZGUvc2JpX3V0aWxzL3RpbWVyL2FjbGlu
dF9tdGltZXIuaCB8ICA1ICsrKysrCj4gIGxpYi91dGlscy90aW1lci9hY2xpbnRfbXRpbWVyLmMg
ICAgICAgICB8IDI4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPiAgMiBmaWxlcyBjaGFu
Z2VkLCAyNiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvc2JpX3V0aWxzL3RpbWVyL2FjbGludF9tdGltZXIuaCBiL2luY2x1ZGUvc2JpX3V0aWxz
L3RpbWVyL2FjbGludF9tdGltZXIuaAo+IGluZGV4IGEyNDVlMTNlMjg1ZjJhZDY1OGZjZTdkYjYz
NjZmZThiN2JhZThjMmEuLmY4ZDJlNWI0YzIxMDE2NGM4YTczN2U4MjY0M2U1ZTQ5ODA3NzUzYzQg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmlfdXRpbHMvdGltZXIvYWNsaW50X210aW1lci5oCj4g
KysrIGIvaW5jbHVkZS9zYmlfdXRpbHMvdGltZXIvYWNsaW50X210aW1lci5oCj4gQEAgLTQyLDYg
KzQyLDExIEBAIHN0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEgewo+ICAgICAgICAgdm9pZCAoKnRp
bWVfd3IpKGJvb2wgdGltZWNtcCwgdTY0IHZhbHVlLCB2b2xhdGlsZSB1NjQgKmFkZHIpOwo+ICB9
Owo+Cj4gK3N0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEgKmFjbGludF9nZXRfbXRpbWVyX2RhdGEo
dm9pZCk7Cj4gKwo+ICt2b2lkIGFjbGludF9tdGltZXJfdXBkYXRlKHN0cnVjdCBhY2xpbnRfbXRp
bWVyX2RhdGEgKm10LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGFjbGludF9t
dGltZXJfZGF0YSAqcmVmKTsKPiArCj4gIHZvaWQgYWNsaW50X210aW1lcl9zeW5jKHN0cnVjdCBh
Y2xpbnRfbXRpbWVyX2RhdGEgKm10KTsKPgo+ICB2b2lkIGFjbGludF9tdGltZXJfc2V0X3JlZmVy
ZW5jZShzdHJ1Y3QgYWNsaW50X210aW1lcl9kYXRhICptdCwKPiBkaWZmIC0tZ2l0IGEvbGliL3V0
aWxzL3RpbWVyL2FjbGludF9tdGltZXIuYyBiL2xpYi91dGlscy90aW1lci9hY2xpbnRfbXRpbWVy
LmMKPiBpbmRleCAzZGIzYzNiZTI1NzVlNGRkZDAxODBjOTBmMjU0Zjc3MzNiN2MxZGFhLi5mZDYx
ODlhYWE1MmFkOTJjYTI4MzMwZmNmMGY3MDFhYzBiOGMzMzdmIDEwMDY0NAo+IC0tLSBhL2xpYi91
dGlscy90aW1lci9hY2xpbnRfbXRpbWVyLmMKPiArKysgYi9saWIvdXRpbHMvdGltZXIvYWNsaW50
X210aW1lci5jCj4gQEAgLTEwOSwyOCArMTA5LDQyIEBAIHN0YXRpYyBzdHJ1Y3Qgc2JpX3RpbWVy
X2RldmljZSBtdGltZXIgPSB7Cj4gICAgICAgICAudGltZXJfZXZlbnRfc3RvcCA9IG10aW1lcl9l
dmVudF9zdG9wCj4gIH07Cj4KPiAtdm9pZCBhY2xpbnRfbXRpbWVyX3N5bmMoc3RydWN0IGFjbGlu
dF9tdGltZXJfZGF0YSAqbXQpCj4gK3N0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEgKmFjbGludF9n
ZXRfbXRpbWVyX2RhdGEodm9pZCkKPiArewo+ICsgICAgICAgcmV0dXJuIG10aW1lcl9nZXRfaGFy
dF9kYXRhX3B0cihzYmlfc2NyYXRjaF90aGlzaGFydF9wdHIoKSk7Cj4gK30KPiArCj4gK3ZvaWQg
YWNsaW50X210aW1lcl91cGRhdGUoc3RydWN0IGFjbGludF9tdGltZXJfZGF0YSAqbXQsCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYWNsaW50X210aW1lcl9kYXRhICpyZWYpCj4g
IHsKPiAgICAgICAgIHU2NCB2MSwgdjIsIG12LCBkZWx0YTsKPiAgICAgICAgIHU2NCAqbXRfdGlt
ZV92YWwsICpyZWZfdGltZV92YWw7Cj4gLSAgICAgICBzdHJ1Y3QgYWNsaW50X210aW1lcl9kYXRh
ICpyZWZlcmVuY2U7Cj4KPiAtICAgICAgIC8qIFN5bmMtdXAgbm9uLXNoYXJlZCBNVElNRSBpZiBy
ZWZlcmVuY2UgaXMgYXZhaWxhYmxlICovCj4gLSAgICAgICBpZiAobXQtPmhhc19zaGFyZWRfbXRp
bWUgfHwgIW10LT50aW1lX2RlbHRhX3JlZmVyZW5jZSkKPiArICAgICAgIGlmICghbXQgfHwgIXJl
ZiB8fCAhbXQtPnRpbWVfcmQgfHwgIW10LT50aW1lX3dyIHx8ICFyZWYtPnRpbWVfcmQpCj4gICAg
ICAgICAgICAgICAgIHJldHVybjsKPgo+IC0gICAgICAgcmVmZXJlbmNlID0gbXQtPnRpbWVfZGVs
dGFfcmVmZXJlbmNlOwo+ICAgICAgICAgbXRfdGltZV92YWwgPSAodm9pZCAqKW10LT5tdGltZV9h
ZGRyOwo+IC0gICAgICAgcmVmX3RpbWVfdmFsID0gKHZvaWQgKilyZWZlcmVuY2UtPm10aW1lX2Fk
ZHI7Cj4gKyAgICAgICByZWZfdGltZV92YWwgPSAodm9pZCAqKXJlZi0+bXRpbWVfYWRkcjsKPiAg
ICAgICAgIGlmICghYXRvbWljX3Jhd194Y2hnX3Vsb25nKCZtdC0+dGltZV9kZWx0YV9jb21wdXRl
ZCwgMSkpIHsKPiAgICAgICAgICAgICAgICAgdjEgPSBtdC0+dGltZV9yZChtdF90aW1lX3ZhbCk7
Cj4gLSAgICAgICAgICAgICAgIG12ID0gcmVmZXJlbmNlLT50aW1lX3JkKHJlZl90aW1lX3ZhbCk7
Cj4gKyAgICAgICAgICAgICAgIG12ID0gcmVmLT50aW1lX3JkKHJlZl90aW1lX3ZhbCk7Cj4gICAg
ICAgICAgICAgICAgIHYyID0gbXQtPnRpbWVfcmQobXRfdGltZV92YWwpOwo+ICAgICAgICAgICAg
ICAgICBkZWx0YSA9IG12IC0gKCh2MSAvIDIpICsgKHYyIC8gMikpOwo+ICAgICAgICAgICAgICAg
ICBtdC0+dGltZV93cihmYWxzZSwgbXQtPnRpbWVfcmQobXRfdGltZV92YWwpICsgZGVsdGEsCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIG10X3RpbWVfdmFsKTsKPiAgICAgICAgIH0KPiAr
fQo+Cj4gK3ZvaWQgYWNsaW50X210aW1lcl9zeW5jKHN0cnVjdCBhY2xpbnRfbXRpbWVyX2RhdGEg
Km10KQo+ICt7Cj4gKyAgICAgICBzdHJ1Y3QgYWNsaW50X210aW1lcl9kYXRhICpyZWZlcmVuY2U7
Cj4gKwo+ICsgICAgICAgLyogU3luYy11cCBub24tc2hhcmVkIE1USU1FIGlmIHJlZmVyZW5jZSBp
cyBhdmFpbGFibGUgKi8KPiArICAgICAgIGlmIChtdC0+aGFzX3NoYXJlZF9tdGltZSB8fCAhbXQt
PnRpbWVfZGVsdGFfcmVmZXJlbmNlKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKwo+ICsg
ICAgICAgcmVmZXJlbmNlID0gbXQtPnRpbWVfZGVsdGFfcmVmZXJlbmNlOwo+ICsgICAgICAgYWNs
aW50X210aW1lcl91cGRhdGUobXQsIHJlZmVyZW5jZSk7Cj4gIH0KPgo+ICB2b2lkIGFjbGludF9t
dGltZXJfc2V0X3JlZmVyZW5jZShzdHJ1Y3QgYWNsaW50X210aW1lcl9kYXRhICptdCwKPgo+IC0t
Cj4gMi4zNC4xCj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3Rz
LmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
