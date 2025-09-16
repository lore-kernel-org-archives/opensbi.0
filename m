Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEFACAC592
	for <opensbi@archiver.kernel.org>; Tue, 16 Sep 2025 04:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8+9Xe5l1DNYqAYSJGk+otSCAgXrBZPMNv8XhQJ4yl+s=; b=DL94nWuCujECd5
	ibq6p3tb7sLw4QMW4aboTW2Pcc9vQwEliuQ6osj47gXE74Z1vHH82P23YlrORui2R+lGeNkntT5A4
	NDsA6yvRXLBEUDtCUNK1srO6162NpWJjDKmceLsG33LoaccoT5Trmhp/hZklIlgUp7QQYMc4uQQea
	Arnx9RCeRXKtgpBdyoyBMrCTjah1u6mHlqU4nCSHHG+kbF3qGJKRyRcT+0GD+GrwzK9iXFUqIHmlN
	nnLeY8e6jiMfAgfRKCJ0TT6dP6Uh4V9BsQk7/TYl9tWpBDlGnxQqfeNW7XLtWtv+qe5sfdeONbYiD
	mC3l4aOrd1Q/cP8RT6mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNVf-00000006iNM-3Qnd;
	Tue, 16 Sep 2025 04:41:43 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyNVd-00000006iMW-1BR8
	for opensbi@lists.infradead.org;
	Tue, 16 Sep 2025 04:41:42 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-424081ae9f2so7242085ab.0
        for <opensbi@lists.infradead.org>; Mon, 15 Sep 2025 21:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1757997700; x=1758602500; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jsT8YP2SHUp/Hc19IOVvkFnxbL7o6FDfBjKl0YF8vg=;
        b=T3PLwRBPu9nNofC7dKJstWLmkYgS3eTefSSB9HHLvdVXJGBGiV5Bsrwupolx8J3L18
         8mctE2cGX7XWDSeoL8tdfSHiDeUUTbnO0Kxtbr34FRLcj9lwV0r+mxFK0wGwdkURJF5y
         h6fiUliNxLOHTbOEKl7LbWmQijo3FAGrlG/V+XnshlLiN7mRAe//Xpc+czIpym8hQQYH
         m3hYny11kZiKdiIzaV3JmNRxUEskYViQWWypt0tKndSIV3XpM+0tUxFp9EzmW85gVKmr
         lUKCbNJUPTqeJWGjcrJIJj9I9t4XHImCiS5cpGQGTyWslYUKXBCndFlChc2uplZrdALw
         RDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757997700; x=1758602500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jsT8YP2SHUp/Hc19IOVvkFnxbL7o6FDfBjKl0YF8vg=;
        b=sEnV/6WbcL8lJbROLShUm02URQjHiAJFZv3tcYQxH4YeBU7aroNwp3/cxm5ItKFLL9
         EQMwfyCCflecVQ/LvDelWgOjayqbSHlErlOV9NwZ95XqrSbNU/Z+k9EqAphapfCHuahe
         iXNYFwkXAGE06T3XLo0GBAwzx24gEFCFk8rau2BxhYafhG9vQ8BnKYUGF3/IQDhIz/mQ
         7YYnw7NO2ZNfvF1uiVOCPzTqhGvbUVMiLlGYf8Kad6us2DXjpXE3AxfuBEBI6rj9eSfO
         s6RfBR/F+TGez3q68zagR78lecf+br7P0tx6XP6aYmrRIX6RF1vXyOzYCzz3jIBYRGXs
         nEFA==
X-Gm-Message-State: AOJu0YzwUN4jONt8B/QTh/StBq23kAMo6w3x2skfXffKZ0159ODmJe9b
	ligesu23fqUrdy726EukXFW4tHCFSNmSYfSW6kU0v/Pj4j+vCxoXyLvvXIQeMRf4/MWJeiZ84gG
	6XEKBS4xeYUi2KYsnv/9kStLiG74xXU2QiulQrbirFEqf1ODy/s/dbvA=
X-Gm-Gg: ASbGncsaguL/8Jc21+6yfb+P6KA5Vw3eqaTpc0TxvAxMfiyJfEiJieUITvwx/HM+Gv0
	irwGkByYVHS7qzIdPgjS12mfhwKOYJHPzzXRJFP7Xh3gVsv8reINlJlnllRCSOx9NGyVaqGKaSR
	geryt3o+GKZUm2wsLUWxK/gnRmPmX/DcLsC9mZto+mQcmEyHVnsTIjsoq/OebUUhjTAM6AQy8FY
	R4m0+Z9ESQWjhN1kCdgxgQsstEoPFa3qiRFyvF1
X-Google-Smtp-Source: AGHT+IFV2IJIckYj1wLTQrBClkvXp8QB1VKNrbtRaymg50wqvFbmaXisT0U9ORJFdwGcgeZPSWV2eD3zyffQ/azfPsE=
X-Received: by 2002:a05:6e02:1948:b0:424:89d:5add with SMTP id
 e9e14a558f8ab-424089d5cf0mr45702125ab.10.1757997700245; Mon, 15 Sep 2025
 21:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250908055646.2391370-1-samuel.holland@sifive.com> <20250908055646.2391370-3-samuel.holland@sifive.com>
In-Reply-To: <20250908055646.2391370-3-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Sep 2025 10:11:27 +0530
X-Gm-Features: AS18NWAvbJpuuVynRQug3jShlzLrFK45Y3uuWY45WBTuY4nRGHPnfYEoANAS634
Message-ID: <CAAhSdy23NMj_Mg0mxLWy0J_ahv+FjMhp4JGZ=rzOmOOqeMCoUA@mail.gmail.com>
Subject: Re: [PATCH 3/3] lib: sbi_hsm: Use 64-bit CSR macro for menvcfg
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_214141_325990_D8431133 
X-CRM114-Status: GOOD (  17.13  )
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

T24gTW9uLCBTZXAgOCwgMjAyNSBhdCAxMToyNuKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFNpbXBsaWZ5IHRoZSBjb2RlIGFuZCByZW1v
dmUgcHJlcHJvY2Vzc29yIGNoZWNrcyBieSB0cmVhdGluZyBtZW52Y2ZnIGFuZAo+IG1lbnZjZmdo
IHRvZ2V0aGVyIGFzIG9uZSA2NC1iaXQgdmFsdWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwg
SG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTog
QW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0
aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+Cj4gIGxpYi9zYmkv
c2JpX2hzbS5jIHwgMjEgKysrKystLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX2hzbS5jIGIvbGliL3NiaS9zYmlfaHNtLmMKPiBpbmRleCA4ZWM5NGQyYi4uYmIyNzRiMzMg
MTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfaHNtLmMKPiArKysgYi9saWIvc2JpL3NiaV9oc20u
Ywo+IEBAIC00OCwxMCArNDgsNyBAQCBzdHJ1Y3Qgc2JpX2hzbV9kYXRhIHsKPiAgICAgICAgIHVu
c2lnbmVkIGxvbmcgc2F2ZWRfbWlwOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzYXZlZF9tZWRl
bGVnOwo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzYXZlZF9taWRlbGVnOwo+IC0gICAgICAgdW5z
aWduZWQgbG9uZyBzYXZlZF9tZW52Y2ZnOwo+IC0jaWYgX19yaXNjdl94bGVuID09IDMyCj4gLSAg
ICAgICB1bnNpZ25lZCBsb25nIHNhdmVkX21lbnZjZmdoOwo+IC0jZW5kaWYKPiArICAgICAgIHU2
NCBzYXZlZF9tZW52Y2ZnOwo+ICAgICAgICAgYXRvbWljX3Qgc3RhcnRfdGlja2V0Owo+ICB9Owo+
Cj4gQEAgLTQzMSwxMiArNDI4LDggQEAgdm9pZCBfX3NiaV9oc21fc3VzcGVuZF9ub25fcmV0X3Nh
dmUoc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+ICAgICAgICAgaGRhdGEtPnNhdmVkX21p
cCA9IGNzcl9yZWFkKENTUl9NSVApICYgKE1JUF9TU0lQIHwgTUlQX1NUSVApOwo+ICAgICAgICAg
aGRhdGEtPnNhdmVkX21lZGVsZWcgPSBjc3JfcmVhZChDU1JfTUVERUxFRyk7Cj4gICAgICAgICBo
ZGF0YS0+c2F2ZWRfbWlkZWxlZyA9IGNzcl9yZWFkKENTUl9NSURFTEVHKTsKPiAtICAgICAgIGlm
IChzYmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkgPj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8x
Mikgewo+IC0jaWYgX19yaXNjdl94bGVuID09IDMyCj4gLSAgICAgICAgICAgICAgIGhkYXRhLT5z
YXZlZF9tZW52Y2ZnaCA9IGNzcl9yZWFkKENTUl9NRU5WQ0ZHSCk7Cj4gLSNlbmRpZgo+IC0gICAg
ICAgICAgICAgICBoZGF0YS0+c2F2ZWRfbWVudmNmZyA9IGNzcl9yZWFkKENTUl9NRU5WQ0ZHKTsK
PiAtICAgICAgIH0KPiArICAgICAgIGlmIChzYmlfaGFydF9wcml2X3ZlcnNpb24oc2NyYXRjaCkg
Pj0gU0JJX0hBUlRfUFJJVl9WRVJfMV8xMikKPiArICAgICAgICAgICAgICAgaGRhdGEtPnNhdmVk
X21lbnZjZmcgPSBjc3JfcmVhZDY0KENTUl9NRU5WQ0ZHKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lk
IF9fc2JpX2hzbV9zdXNwZW5kX25vbl9yZXRfcmVzdG9yZShzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNj
cmF0Y2gpCj4gQEAgLTQ0NCwxMiArNDM3LDggQEAgc3RhdGljIHZvaWQgX19zYmlfaHNtX3N1c3Bl
bmRfbm9uX3JldF9yZXN0b3JlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKPiAgICAgICAg
IHN0cnVjdCBzYmlfaHNtX2RhdGEgKmhkYXRhID0gc2JpX3NjcmF0Y2hfb2Zmc2V0X3B0cihzY3Jh
dGNoLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGhhcnRfZGF0YV9vZmZzZXQpOwo+Cj4gLSAgICAgICBpZiAoc2JpX2hhcnRfcHJp
dl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIpIHsKPiAtICAgICAg
ICAgICAgICAgY3NyX3dyaXRlKENTUl9NRU5WQ0ZHLCBoZGF0YS0+c2F2ZWRfbWVudmNmZyk7Cj4g
LSNpZiBfX3Jpc2N2X3hsZW4gPT0gMzIKPiAtICAgICAgICAgICAgICAgY3NyX3dyaXRlKENTUl9N
RU5WQ0ZHSCwgaGRhdGEtPnNhdmVkX21lbnZjZmdoKTsKPiAtI2VuZGlmCj4gLSAgICAgICB9Cj4g
KyAgICAgICBpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0Y2gpID49IFNCSV9IQVJUX1BS
SVZfVkVSXzFfMTIpCj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZTY0KENTUl9NRU5WQ0ZHLCBo
ZGF0YS0+c2F2ZWRfbWVudmNmZyk7Cj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX01JREVMRUcsIGhk
YXRhLT5zYXZlZF9taWRlbGVnKTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfTUVERUxFRywgaGRh
dGEtPnNhdmVkX21lZGVsZWcpOwo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9NSUUsIGhkYXRhLT5z
YXZlZF9taWUpOwo+IC0tCj4gMi40Ny4yCj4KPiBiYXNlLWNvbW1pdDogMTUzY2RlZWE1MzUwODM3
YzEyMDZhMmQyYjYxODlmZDBiYTA2ZDFmMgo+IGJyYW5jaDogdXAvbWlkZWxlZy1maXgKPgo+IC0t
Cj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApv
cGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
