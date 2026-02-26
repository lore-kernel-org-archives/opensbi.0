Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6546FD45F9
	for <opensbi@archiver.kernel.org>; Thu, 26 Feb 2026 00:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9qMQaoDeF4P5fauhemn7UDP4OzicC9gZdCogx0noVo=; b=ChAskvWiW1JJpH
	dAcGfk3gO5ksHafb1Md671fcraB29crfmfTCTp1c+vs6FZuzmDxZNhsG98IIqGGbvBFnthISDi1FS
	tPIvSpFJxA28KVLGa6dLU10RyikR4rQS9SN4BYImxo6Zxc6Kyr4kcCekUHE/RF+cGysTGWNRS+1T5
	P65yu4bYF+xyouT/0rGoLQ9dlQIRa5jV8ozrbiQJzDF3EYt/gNa4oCX17AGM36D43EThH/1gB86GE
	iXbhF0PpYGF3++cM+JSFZ47FbW3SOG2G7toWNla5AhZNDHGXppfsJYyfjuTeCxmeSrCZaRpOxB9Cc
	qqnhDjB43aLRrs0Hfl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvPM5-000000059L6-2UfM;
	Thu, 26 Feb 2026 00:35:49 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvPM3-000000059Kl-1154
	for opensbi@lists.infradead.org;
	Thu, 26 Feb 2026 00:35:48 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-124a635476fso314282c88.0
        for <opensbi@lists.infradead.org>; Wed, 25 Feb 2026 16:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772066146; x=1772670946; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=evD1GHO+BiDFrJl6Ab+12xuEK354LnDze2DqAE6X66E=;
        b=SbN8Hm7VDTh0GnvUvttBMTTVRG98QZyxEXL/Yb3NY1kCTnHCLErvjqo/86gdutK12D
         lJdfGuSNI6MD4nm2rt69MpLyFG31lPPzC7cX/f+6mQzbOy/UXZnk+fREiPVRq0yiXGwt
         4DAgk0Ts8MFbchXD5VnEJmfLXShGjJihab80zq00OowkdP0UaDIw35c946SJWY/CvWm2
         W0Ng9wpVzSRPOmH3W6c/P4XUX8NVtdDDJsNuoIY8wJ6NmL63//4IXQKM0hTpVqXiZ4aB
         SrhWYDgGsbxGoI0r5/rKWhX2Aas0GEoB0dW69WXbxd2OfPN4I/woE4aQMmggZJdvj1X/
         G8ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772066146; x=1772670946;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=evD1GHO+BiDFrJl6Ab+12xuEK354LnDze2DqAE6X66E=;
        b=hwMRDTURZUG1eRtaw68CYeTWK/cm8HJCnZpHrA6JwfZKGnmu+Tx3tynxHZCu7FjBBd
         ptR1mud9AkNPF2DusqvlCIvMlDwrOK3H0sWjQRsZBnZWOXXEQ26mauyMuGYsudzmkge6
         1rfJd++/g5dD58k9O+Y/IiW39B2VNoa8jQ7BS4JvzWRrORYT/alngus6tv4WEPw2qBLs
         kXH+RZlaLwgQ+ZUdkHkKjJxJDeS8/7sBiCAJFw6TCvyscI1V0ldU5fPw8a+s2WCcyx6H
         LgYSTGNqWVVyZZ+Ne0nRtNvdNcVe7cKwN4vJN2JFJNAngsf56wqzPJBX4Muo9yJb/B4y
         mktg==
X-Gm-Message-State: AOJu0Yxf+vTqnwfGbAJFKsOoOKxh5rTN5QRRPbV7IeKwwWtC1aj5b/QU
	r0F5EM162kvDvPCnifb23BupMOAa1wt0/fr1fXHGpgiUiEOgL9V5HfEq
X-Gm-Gg: ATEYQzxE6nDIacSHA3AjHoymq9oh47OckXyxWexWdS5XCBXGBX1sYPjNVK6vnXj4DiK
	LUgx4Qv+XUsbHy/81/HjRfSEYOp1kFBmG02cNUGYaxP0WytrO/ZZ3TneB6cd84PlMAXJg4+f4ZR
	dCDUniUCjECiXgQcZgV5Q4ItUL3VhpgRGVWjPvPePFd/TIkp7tQ52062yJP9+DIxAWFJktYDzfl
	NoyJFsIlBa2/An0dH3FF/lwaLDup+ceBdbg1tFN2la8Stv/cv4J85c9Ttw4Op31uQUUA4oxqWXO
	SL/1smlEbeYTu7wGlzAgKpHELhBhD/HFMuNaq7wuDJwuZqCXdAt17Mx4SwhW2kOThqmt97TdnCW
	oH/CehNczJA0Xju1vxRy1kZ3NiB+ZHoe667XJc6N/8yTw3Q2L+0wBIyd4MfhE0/QkDr8DVTuvNi
	asjzRjpUrtKMi4TBz9gpmlPEc=
X-Received: by 2002:a05:7022:629d:b0:119:e55a:9be7 with SMTP id a92af1059eb24-12789c68a0fmr216092c88.3.1772066145483;
        Wed, 25 Feb 2026 16:35:45 -0800 (PST)
Received: from charlie ([2601:647:6700:64d0::1071])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1a45a58sm564066eec.0.2026.02.25.16.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 16:35:44 -0800 (PST)
Date: Wed, 25 Feb 2026 16:35:42 -0800
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: opensbi@lists.infradead.org
Subject: Re: [PATCH] lib: sbi_pmu: Track SBI_PMU_FW_PLATFORM started counter
Message-ID: <20260226003542.GA538390@charlie>
References: <20260127-pmu_platform_stop-v1-1-b07d1abd1ef2@gmail.com>
 <CAAhSdy2sttP2czaxAzev+xeCShtzvrNAtJRx9Ph_YCHN1dfmyg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAhSdy2sttP2czaxAzev+xeCShtzvrNAtJRx9Ph_YCHN1dfmyg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_163547_288540_70A4D294 
X-CRM114-Status: GOOD (  22.86  )
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

T24gTW9uLCBGZWIgMjMsIDIwMjYgYXQgMTA6Mjk6NDRBTSArMDUzMCwgQW51cCBQYXRlbCB3cm90
ZToKPiBPbiBXZWQsIEphbiAyOCwgMjAyNiBhdCA1OjI44oCvQU0gQ2hhcmxpZSBKZW5raW5zIHZp
YSBCNCBSZWxheQo+IDxkZXZudWxsK3RoZWNoYXJsZXNqZW5raW5zLmdtYWlsLmNvbUBrZXJuZWwu
b3JnPiB3cm90ZToKPiA+Cj4gPiBGcm9tOiBDaGFybGllIEplbmtpbnMgPHRoZWNoYXJsZXNqZW5r
aW5zQGdtYWlsLmNvbT4KPiA+Cj4gPiBXaGVuIGEgU0JJX1BNVV9GV19QTEFURk9STSBzdGFydHMs
IGFkZCB0aGUgY291bnRlciB0byB0aGUgY291bnRlciBhcnJheQo+ID4gaW5zdGVhZCBvZiByZXR1
cm5pbmcgZWFybHkuIFRoaXMgd2lsbCBjYXVzZSBmd19jb3VudGVyX3N0b3AoKSB0byBiZQo+ID4g
Y2FsbGVkIHdoZW4gYSBTQklfUE1VX0ZXX1BMQVRGT1JNIGNvdW50ZXIgc2hvdWxkIGJlIHN0b3Bw
ZWQuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hhcmxpZSBKZW5raW5zIDx0aGVjaGFybGVzamVu
a2luc0BnbWFpbC5jb20+Cj4gCj4gVGhpcyBpcyBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlIGZvbGxv
d2luZyBwYXRjaDoKPiAibGliOiBzYmlfcG11OiBGaXggbXVsdGlwbGUgRlcgY291bnRlciBzdGFy
dCBvcGVyYXRpb25zIHdpdGggY3VzdG9tIFBNVSBkZXZpY2UiCj4gCj4gUmVnYXJkcywKPiBBbnVw
CgpHcmVhdCwgdGhhbmtzIGZvciBhcHBseWluZyB0aGF0IG9uZSEKCi0gQ2hhcmxpZQoKPiAKPiA+
IC0tLQo+ID4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMTAgKysrKysrLS0tLQo+ID4gIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX3BtdS5jIGIvbGliL3NiaS9zYmlfcG11LmMKPiA+IGluZGV4IGUwODQw
MDVkLi4zYzYxMDc5YiAxMDA2NDQKPiA+IC0tLSBhL2xpYi9zYmkvc2JpX3BtdS5jCj4gPiArKysg
Yi9saWIvc2JpL3NiaV9wbXUuYwo+ID4gQEAgLTQ0OCw2ICs0NDgsOCBAQCBzdGF0aWMgaW50IHBt
dV9jdHJfc3RhcnRfZncoc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVpbnQ2NF90IGV2ZW50X2RhdGEsIHVpbnQ2NF90IGl2YWws
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYm9vbCBpdmFsX3VwZGF0ZSkKPiA+ICB7
Cj4gPiArICAgICAgIGludCByYyA9IDA7Cj4gPiArCj4gPiAgICAgICAgIGlmICgoZXZlbnRfY29k
ZSA+PSBTQklfUE1VX0ZXX01BWCAmJgo+ID4gICAgICAgICAgICAgZXZlbnRfY29kZSA8PSBTQklf
UE1VX0ZXX1JFU0VSVkVEX01BWCkgfHwKPiA+ICAgICAgICAgICAgIGV2ZW50X2NvZGUgPiBTQklf
UE1VX0ZXX1BMQVRGT1JNKQo+ID4gQEAgLTQ2OCw5ICs0NzAsOSBAQCBzdGF0aWMgaW50IHBtdV9j
dHJfc3RhcnRfZncoc3RydWN0IHNiaV9wbXVfaGFydF9zdGF0ZSAqcGhzLAo+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaWR4IC0gbnVt
X2h3X2N0cnMsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGl2YWwpOwo+ID4KPiA+IC0gICAgICAgICAgICAgICByZXR1cm4gcG11X2Rl
di0+ZndfY291bnRlcl9zdGFydChwaHMtPmhhcnRpZCwKPiA+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjaWR4IC0gbnVtX2h3X2N0cnMsCj4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZXZlbnRfZGF0YSk7
Cj4gPiArICAgICAgICAgICAgICAgcmMgPSBwbXVfZGV2LT5md19jb3VudGVyX3N0YXJ0KHBocy0+
aGFydGlkLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBjaWR4IC0gbnVtX2h3X2N0cnMsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGV2ZW50X2RhdGEpOwo+ID4gICAgICAgICB9IGVsc2Ugewo+ID4gICAg
ICAgICAgICAgICAgIGlmIChpdmFsX3VwZGF0ZSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAg
IHBocy0+ZndfY291bnRlcnNfZGF0YVtjaWR4IC0gbnVtX2h3X2N0cnNdID0gaXZhbDsKPiA+IEBA
IC00NzgsNyArNDgwLDcgQEAgc3RhdGljIGludCBwbXVfY3RyX3N0YXJ0X2Z3KHN0cnVjdCBzYmlf
cG11X2hhcnRfc3RhdGUgKnBocywKPiA+Cj4gPiAgICAgICAgIHBocy0+ZndfY291bnRlcnNfc3Rh
cnRlZCB8PSBCSVQoY2lkeCAtIG51bV9od19jdHJzKTsKPiA+Cj4gPiAtICAgICAgIHJldHVybiAw
Owo+ID4gKyAgICAgICByZXR1cm4gcmM7Cj4gPiAgfQo+ID4KPiA+ICBzdGF0aWMgdm9pZCBwbXVf
dXBkYXRlX2luaGliaXRfZmxhZ3ModW5zaWduZWQgbG9uZyBmbGFncywgdWludDY0X3QgKm1ocG1l
dmVudF92YWwpCj4gPgo+ID4gLS0tCj4gPiBiYXNlLWNvbW1pdDogNzQ0MzRmMjU1ODczZDc0ZTU2
Y2M1MGFhNzYyZDFjYWYyNGMwOTlmOAo+ID4gY2hhbmdlLWlkOiAyMDI2MDEyNy1wbXVfcGxhdGZv
cm1fc3RvcC1mZWJlZjY1YWJmNTQKPiA+Cj4gPiAtIENoYXJsaWUKPiA+Cj4gPgo+ID4KPiA+IC0t
Cj4gPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
PiAKPiAtLSAKPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
