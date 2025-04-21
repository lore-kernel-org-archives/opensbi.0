Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F21C369AB
	for <opensbi@archiver.kernel.org>; Mon, 21 Apr 2025 04:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WBjgo2+hHthuGV5u4JVzovFhdMecyvrs3wKiV27UYjM=; b=wNVP5UZVSiC6cd
	LFAJaF+G6KVNFHScxQpwYbgltWanvFTcNEBAA21grnaYVxuueZnMaXMlK3YEaycHIdwa88kOJW75S
	QaYXA+K9RUI8oWqx8qF5LkKEAwVfhZIpExT99BiKLUg28NZtJwoWAnaNu4aSnjlLnZ+KKwEU3xkBV
	iOEIzgNpTxRCdzB0BOPhgFg/P/iXL5fwmzTsKYlVpFv64Orq/HdBrI3XOZR5Fp3yusk4dxxde5f3J
	/VNWXGBOrKFUcpgudYBaEPErPQnacNUO6QDkce0Ux5Y2FTUXOJrMCoda0rGngBkf80lU5YUA/hXjn
	+Zbk1mFYkB07bjE28ffg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ih5-00000003Z5C-2UZi;
	Mon, 21 Apr 2025 04:23:43 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6ih2-00000003Z4q-3iGW
	for opensbi@lists.infradead.org;
	Mon, 21 Apr 2025 04:23:42 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so9854205ab.2
        for <opensbi@lists.infradead.org>; Sun, 20 Apr 2025 21:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745209419; x=1745814219; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DAxinubaMuPH3hUhrb4KsH4dmZuY0OiTO56UZgp0W/s=;
        b=FM/eb2z39v3Dop0Lk/8UmqXN4g3CS5iKpqELXcCTTJYVFFSmopIui6QwpOOpcHArhU
         rThMWCOiuUmMHX9Oqqnh0GU0QVvxmjKB0XSsnJhjLYIZDjnvWHUOe76TEcvEvN/yc6aE
         +rMsDbxLnfNj5QeI/zFC0vayBWdAkjY5l7v3EyZmFHHT4G2lZ6vmVHaEKEE4QqzeCnlv
         +wNIkb5/uwX9wOgMQTPbqlGz49FE96DfLwPk6Cp6uo6qvwcB1jIBknuMClTeN+kDjU17
         22fDYIVYzWh6wCNEVdaBv/OwlYLQUI3/Scz4iW6bZVLhqaI69znVeKpPBu3IgDUqyw1R
         vlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745209419; x=1745814219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DAxinubaMuPH3hUhrb4KsH4dmZuY0OiTO56UZgp0W/s=;
        b=C0xbhSiBU7+Kz87x2vqPKSOI5IgFZBjVbg5/nw4dBwJ/YiC1ZNCOHW1o5BQY99cF1a
         QnBzUQTXl/4TYWdB07i/19zIfHIfVvliLf97uLG0nBpG35v89EF4CR75zttsndmVHnef
         1m3kAbC2kaHahgPgleUril8nTSLkGJw/bzXQ4oHcHMSxx3M8D+JMt056XLcJ7tVimM2Z
         P5qPAmQARdhUKia1KjTUf9JMtBgDJ2IuVZ1gMc4kHacicWfe4EpAoIAX+0U7OiS157gx
         3Lp9OK+vJ5vNOcfolzBxowAwcodtg+qo3vwlxnTDBnR8qPi6z4S2ozPfmWaZGe47Jc6D
         rzIg==
X-Gm-Message-State: AOJu0Yz/2jKvoTkhvHh1Qb9ow0nh3rNdPzdaD0x6MDCFdkG9YRSQSBS3
	Rb9Dz+rtHyc7aXfPNZ5es1tPxqX1MCDRY0CDOrCyWgBxL3FNA1M/1XZrgBicnFcLOi2q+r3OWo6
	SeAbt7X/xxh57WI7AN70LYcRx+s0upnJ1MoPdGw==
X-Gm-Gg: ASbGncvzV8rtKVCZN1EY8DrC77QX7yvHY7H9WkR7/ZalBPQzFVSAv5PQUbDUkInCB44
	TnF1XyFHnSqN3SSpaDWYVcgW2B9PDuknZgXLXk8lS4FpaVJvuSwueHtXB/hMopaPGGkovrGPc7i
	/lgImamDKudCR5wjqByVXaiMgFRbZX0oyyYg==
X-Google-Smtp-Source: AGHT+IGQ2pv9JKHj7C4w+B5lhWSj5QfMUc+0Mp3a3nEmSxvxZFpwEGfOOfZoP2px9dpt8xcB068pTD4+cPZgXRSfYd8=
X-Received: by 2002:a92:cd84:0:b0:3d8:975:b808 with SMTP id
 e9e14a558f8ab-3d88ed7c186mr87100755ab.5.1745209419297; Sun, 20 Apr 2025
 21:23:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250321001450.11189-1-jimmy.ho@sifive.com>
In-Reply-To: <20250321001450.11189-1-jimmy.ho@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Apr 2025 09:53:27 +0530
X-Gm-Features: ATxdqUEQBqO0mslZDm6sD5yC3GYkAZ9NEPwfNSOpy5Nc8u3qPxmNDleX4YBv730
Message-ID: <CAAhSdy0k+huyM+qkeBY=EohDX=Xb4w3+YjUTyHWNPF8=ygM+tQ@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Handle length of extension name string exceed
 buffer size error
To: Jimmy Ho <jimmy.ho@sifive.com>
Cc: opensbi@lists.infradead.org, Nick Hu <nick.hu@sifive.com>, 
	Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250420_212341_189851_08B539C4 
X-CRM114-Status: GOOD (  14.68  )
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

T24gRnJpLCBNYXIgMjEsIDIwMjUgYXQgNjoxMeKAr0FNIEppbW15IEhvIDxqaW1teS5ob0BzaWZp
dmUuY29tPiB3cm90ZToKPgo+IHByaW50IGVycm9yIG1lc3NhZ2UgYW5kIHR1cm5jYXQgdGhlIHN0
cmluZyB3aGVuIGxlbmd0aAo+IG9mIGV4dGVuc2lvbiBuYW1lIHN0cmluZyBleGNlZWQgYnVmZmVy
IHNpemUKPgo+IFNpZ25lZC1vZmYtYnk6IEppbW15IEhvIDxqaW1teS5ob0BzaWZpdmUuY29tPgo+
IFJldmlld2QtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4KPiBSZXZpZXdkLWJ5OiBa
b25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+CgpzL1Jldmlld2QtYnkvUmV2aWV3ZWQtYnkvCgpJ
IGhhdmUgY29ycmVjdGVkIHRoaXMgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZyB0aGlzIHBhdGNoLgoK
QXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFu
dXAKCj4gLS0tCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDQgKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIv
bGliL3NiaS9zYmlfaGFydC5jCj4gaW5kZXggMTUwNzAwMjEuLjBhY2Y2MDYzIDEwMDY0NAo+IC0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC03
NDMsNiArNzQzLDEwIEBAIHZvaWQgc2JpX2hhcnRfZ2V0X2V4dGVuc2lvbnNfc3RyKHN0cnVjdCBz
Ymlfc2NyYXRjaCAqc2NyYXRjaCwKPiAgICAgICAgIHNiaV9tZW1zZXQoZXh0ZW5zaW9uc19zdHIs
IDAsIG5lc3RyKTsKPgo+ICAgICAgICAgZm9yX2VhY2hfc2V0X2JpdChleHQsIGhmZWF0dXJlcy0+
ZXh0ZW5zaW9ucywgU0JJX0hBUlRfRVhUX01BWCkgewo+ICsgICAgICAgICAgICAgICBpZiAob2Zm
c2V0ICsgc2JpX3N0cmxlbihzYmlfaGFydF9leHRbZXh0XS5uYW1lKSArIDEgPiBuZXN0cikgewo+
ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOmV4dGVuc2lvbiBuYW1lIGlz
IGxvbmdlciB0aGFuIGJ1ZmZlciAoZXJyb3IpXG4iLCBfX2Z1bmNfXyk7Cj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICAgICAgICAgIH0KPiAgICAgICAgICAgICAgICAg
c2JpX3NucHJpbnRmKGV4dGVuc2lvbnNfc3RyICsgb2Zmc2V0LAo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIG5lc3RyIC0gb2Zmc2V0LAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICIlcywiLCBzYmlfaGFydF9leHRbZXh0XS5uYW1lKTsKPiAtLQo+IDIuNDMuMgo+
Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
