Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD12C44521
	for <opensbi@archiver.kernel.org>; Mon, 20 Jul 2026 07:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FLbcyYEgTJ0AiNagJbHRGscyC18FKHmqzt8CTUyo4MU=; b=bfuQRDBTmYNqh6
	7DiABA/riUIEiRTpxYRpwpHqctnAxncVrF+69s4chXaB/vvaZgAaPG+ewNMwPgEzP6idOYA608oaS
	HL4tK1XSt815woEGGcSl5QOeXSgcNDZrYCBKUNpOfVmhSvm7cqPpQ94mvokhxgCjtUSl7OwUbagzc
	QEmjga+zue4wTsO71NRgxkPAE7WyyErJvICxcayMospVsknI0sdXqALMqIfR2awEB/lRVLOptPlnl
	31/M66zshtXq/5Hy7AZNRZeADwTCa1u1vrzvu6MnEzUJUSDxC6hv3kCh84pLV4aSZG3lUIVj3ofjs
	03L03QCG4oaMkiVnfOug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wli0F-0000000610b-0AED;
	Mon, 20 Jul 2026 07:01:27 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wli0C-0000000610E-3dZD
	for opensbi@lists.infradead.org;
	Mon, 20 Jul 2026 07:01:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso7607823a91.1
        for <opensbi@lists.infradead.org>; Mon, 20 Jul 2026 00:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784530884; x=1785135684; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pHnFWt7bkBCocfcDYCZqvOTHD+9jdjOxskDCpzVxOII=;
        b=RDgOkRYSbbpGJ6MkNTw13ZZXw8xgo/Hd70hF2rvEUh2YakDtxD23zT5+DHp2pE2dg1
         zwkT7SB+9INcrJl4IYRmyB3Rt4PUIosSZUsZYzFM0l3W/3brz9yF3ROMGcZG/elbPfSQ
         sCv3YX5dapnv0k44hQCPBq+YX+QMSq3DfZBiphaD1dH8PMq3m1WhmP467O94DqS34o68
         iheRtMQm719NwzLI/G+HjQkLyii63ahP+J0miFAFNUOpXdz3nTgkPye2MEaPAaFk0sQZ
         30GhCV9h5/ByvbFQEy2ZkMDREO7i78AZmAe1wVUXD2cCd4mmhdyyHC4eIgwiwF36Jyje
         y6WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784530884; x=1785135684;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pHnFWt7bkBCocfcDYCZqvOTHD+9jdjOxskDCpzVxOII=;
        b=pNzCB9+6xByEk7Bvdft7kqzV4l+lv7q+umbV2o0BODmCWdquxRm77FCoVQOgLDqBt+
         H7CIxr5Toxgg1zDQe1RlUuRTISIi39CwWxqGBT3F26EaEfzTTR1pYvBBB9mNTsC4xQXF
         Hm1i+bZYeIqOQbL5/+mhs1n8fANyTW/CFXb5X6uzbCoqlaIXAjXMHuNcjtQe+pru2BqY
         pA3c56bOmOwkl4giVelnsxjDRRG136o07rw4xGw6YhcNIOVTbWZjMg6gGe02fqWaxOH0
         LNmJ07Pl2gCctpudLock55Xschg05lL+x7/Fe9ITKJe8Sf5Gp5tXjUA3JoZJCLDmU4w5
         OyXg==
X-Gm-Message-State: AOJu0Yzo1AvT5QeOnxCaP+oad1ZnQNS45UBUPvS5TyFjaGyh5QoqIi/o
	WUVf764t7fdi6LxbXDNFRpyowk+xVP8BOWJY0yOEon6zhASlVRH/HeGKdKLBHWrdkK0=
X-Gm-Gg: AfdE7cno0WtviZmACtQdP4OJyFPr8hukgLpDkatW7PjNyihWGyZ4gzgKFWoQtJX0aaG
	sAKI69LyUMO8Sriwjoglpbe8FQcNsg4JwuW0ipL6u37/aZhg8ALcNtnbrfv2vD77/KN9p0kronE
	oB/67Yqj9lnTKLxp6u1u0XSw/aBALS6JHZHq/r69nIG476PzVsEW+otQhmdc01S0ydHYULehdp6
	Zs1WlYKf6NsdrLDVhWz9XQiYldDaET22Z9+ji6VFBFkOdJzF5t4aSGDi/I0eHUlPcI+70WSYV/c
	+NiOfNISDtz87jH7uqNcooWFBQq2Y+uz15rhSVsr6pZl10td8Ya4KuuSwRKZ3WUItVJ9GIANuoj
	utKhF+WuJECde9RpucmWmAjDWqDt+9l1g67fRhcWZ9CeNRl0JXfxxlNHEu4grzZkvk7BDyRooVg
	wL
X-Received: by 2002:a17:90b:54c4:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-38e4b3e133fmr12479061a91.7.1784530884078;
        Mon, 20 Jul 2026 00:01:24 -0700 (PDT)
Received: from plin-1878 ([136.226.240.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e4afcc067sm5118350a91.1.2026.07.20.00.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 00:01:23 -0700 (PDT)
Date: Mon, 20 Jul 2026 15:01:18 +0800
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com,
	greentime.hu@sifive.com, anup@brainfault.org, scott@riscstar.com,
	conor@kernel.org, dave.patel@riscstar.com, raymond.mao@riscstar.com,
	robin.randhawa@sifive.com, samuel.holland@sifive.com
Subject: Re: [RFC PATCH 03/12] lib: sbi_hart: enforce riscv,pmwid for Worlds
 ISA
Message-ID: <al3Hvl1zpOXwbDcG@plin-1878>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
 <20260626101433.3133466-4-peter.lin@sifive.com>
 <CAAVgOkL1oRfEXgNot5V899LO-GjPhpbm4gOm8r2MFZw6U7i=Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAVgOkL1oRfEXgNot5V899LO-GjPhpbm4gOm8r2MFZw6U7i=Pg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_000124_917589_7085BCE0 
X-CRM114-Status: GOOD (  17.76  )
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgMDI6MjY6MTNQTSAtMDcwMCwgUGF3YW5kZWVwIE96YSB3
cm90ZToKPiBPbiBGcmksIEp1biAyNiwgMjAyNiBhdCAzOjE24oCvQU0gWXUtQ2hpZW4gUGV0ZXIg
TGluIDxwZXRlci5saW5Ac2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2hlbiBTbXdpZC9TbWx3
aWQgZXh0ZW5zaW9ucyBhcmUgZGV0ZWN0ZWQgZHVyaW5nIGhhcnQgSVNBIGRldGVjdGlvbiwKPiA+
IHRoZSByaXNjdixwbXdpZCBkZXZpY2UgdHJlZSBwcm9wZXJ0eSBpcyByZXF1aXJlZCB0byBzcGVj
aWZ5IHRoZSBNLW1vZGUKPiA+IFdJRCBkZWZhdWx0IHZhbHVlLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+
ICBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAxMyArKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFy
dC5jIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gPiBpbmRleCAwYzU4NGJmYy4uY2IwYzY2ZWEgMTAw
NjQ0Cj4gPiAtLS0gYS9saWIvc2JpL3NiaV9oYXJ0LmMKPiA+ICsrKyBiL2xpYi9zYmkvc2JpX2hh
cnQuYwo+ID4gQEAgLTc2OCw2ICs3NjgsMTkgQEAgc2tpcF9zbXdpZGRlbGVnOgo+ID4gICAgICAg
ICAvKiBNYXJrIGhhcnQgZmVhdHVyZSBkZXRlY3Rpb24gZG9uZSAqLwo+ID4gICAgICAgICBoZmVh
dHVyZXMtPmRldGVjdGVkID0gdHJ1ZTsKPiA+Cj4gPiArICAgICAgIC8qCj4gPiArICAgICAgICAq
IFZhbGlkYXRlIE0tbW9kZSBXSUQgZGVmYXVsdCB2YWx1ZTogaWYgV29ybGRzIElTQSBleHRlbnNp
b25zCj4gPiArICAgICAgICAqIGFyZSBwcmVzZW50LCByaXNjdixwbXdpZCBtdXN0IGV4aXN0IGlu
IERULgo+ID4gKyAgICAgICAgKi8KPiA+ICsgICAgICAgaWYgKChzYmlfaGFydF9oYXNfZXh0ZW5z
aW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTVdJRCkgfHwKPiA+ICsgICAgICAgICAgICBzYmlf
aGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9TTUxXSUQpKSAmJgo+ID4g
KyAgICAgICAgICAgICFoZmVhdHVyZXMtPmhhc19wbXdpZCkgewo+ID4gKyAgICAgICAgICAgICAg
IHNiaV9wcmludGYoIldBUk5JTkc6IGhhcnQldSBoYXMgV29ybGRzIElTQSBleHRlbnNpb24gYnV0
IERUICIKPiA6JXMvV0FSTklORy9FUlJPUi9nYyBhcyB0aGlzIGlzIGNhdXNpbmcgcGFuaWMvaGFu
ZwoKWWVzLCBtYWtlcyBzZW5zZS4KCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAibGFj
a3MgcmlzY3YscG13aWQuXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgY3VycmVu
dF9oYXJ0aWQoKSk7Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gPiAr
ICAgICAgIH0KPiA+ICsKPiA+ICAgICAgICAgLyoKPiA+ICAgICAgICAgICogT24gcGxhdGZvcm1z
IHdpdGggU21lcG1wLCB0aGUgcHJldmlvdXMgYm9vdGluZyBzdGFnZSBtdXN0Cj4gPiAgICAgICAg
ICAqIGVudGVyIE9wZW5TQkkgd2l0aCBtc2VjY2ZnLk1NTCA9PSAwLiBUaGlzIGFsbG93cyBPcGVu
U0JJCj4gPiAtLQo+ID4gMi40My43Cj4gPgo+ID4KPiA+IC0tCj4gPiBvcGVuc2JpIG1haWxpbmcg
bGlzdAo+ID4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxpbmcg
bGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
