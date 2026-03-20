Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACB4FB5EA9
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 04:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qDS3Pn7LXIfbE49FcFVh1d+VwV2yOHbkhsRFzlNAC88=; b=gFEZXlfMjZhM4O
	sU49Ea8O+Xy1Fr1UvLJcGT3PoxvwNDdYRb1qZ78nkJ9twoYnQ52elgv+S2q/XXslzEHxjun7xZ4HN
	GQ8wNB/R02srjOtWw/5dZ/gMjoyplCc2K5jKu+1r1DTD8QpQ2L4FVb5h0jCyqFoZ0IPgOUNADljkH
	+Lh6tQoVLkPGTQjs5veOdNkeUCdMRMpJvIPIzITG4O29n302Id03ry7SXQ+0+HMBnzfmDu/pmCngW
	I9i4s5+saUineGGMKWJS77ezTk5IbcJphyiYDiUgJw7SMTFd0c/WKyv2no7ko7AKzlRtwhYK2YqUB
	vJx1ECH6N7C76LwNAUaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Rgq-0000000C4Sg-2VoH;
	Fri, 20 Mar 2026 04:42:28 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Rgo-0000000C4SK-2j6i
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 04:42:27 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-46701f2077cso1921566b6e.0
        for <opensbi@lists.infradead.org>; Thu, 19 Mar 2026 21:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773981745; cv=none;
        d=google.com; s=arc-20240605;
        b=apR++OaV5o7d/DPh5DIhO+BUCa8wTf7Mo7nnrf7mdTGX94Ife9XDr76cgUDcg/pu5P
         bJ1HcCkj0UrMEcKsTCrmEjLb7pkG+7P+TS92Kl0LBXb/xInjq3ApcBEkro1iTr5F77+X
         3e+g/SxqbGAGuwclCyxylz7zJ5/IuftTqZxql4h3AeB4AlGHeAfpmNR3trYfZsRNP4KV
         BI4mJ+/OXtDdNmGQIiQDIKa75EPLtlnX8UqwoxgkCbTAmWscA/WjS+g+pPkFcmTxlXh+
         evPHIAbgAsiTFWtxE2hSCr+A3aex0gomm2oFjQrzEl2/zPrVicWtVmSaf3P/VVdLArqn
         XiPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TFiMeDqsqLxKH33tw8XieRipEcdYxlO0t3NWit2qvXY=;
        fh=ZvUNVdBUaw9ITe6WhmV5AcAsi7vmvtm+VWe7OnyYmG8=;
        b=gRGCqo/0Pd5/0+BaqvoMqZ6EfiI/YaRlLcga32BjhZ43OVRVHercfQoSUtQIqXTMQ/
         /GRO2bzhDWgiei9noAhFpfABFnBjQwde7QNMP0y46BQqKTHSLsK9xAkrUQSNMDdivp6l
         jDMUZTnosVOlMIuWaJNVo/areLBHufAnhVSmSbJ1CaiBV39wB+JkeNM2mJRmB7M2ZDC8
         cAAN+FDVbAFbt/rdZRo3vqGwDZnESyNk1AVRkyX+vH4yYTEYyih7V2RZ88VhMiBsGUsF
         9Ollv+67r8MBZNBor/IvgxAa4unAgAAe6JLx6fp34B1wdPXg3s/foqx5CoJtn3BaA8w3
         HybQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773981745; x=1774586545; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TFiMeDqsqLxKH33tw8XieRipEcdYxlO0t3NWit2qvXY=;
        b=R9XfXJEVUOEJlGdWIORJWTN3h5Ek+AXKbXJDrHT241o8LVh/e+nEum79fj2MvmV7SX
         RhWncxe7ewE29BkNgPt4vHrmQ3XF5NH8NfParT0Z0CXbzgK92WHxWJTBvrzSq9uj7Rsg
         EAtXUj2FKhIkxkxNqZR0EYB6POEToVlXyXjXRc8b+W2wdr3Na59CS7SXZf/Khja4eH6T
         HIy/CNP16X7eixCWub4P13Slp4nC2mg57vwdYa4tUNOGzfIR5kJ9R/O+U9GICPdCz0uq
         Ecuqzr4jn21hEtWeIV6J58tPzvlDyWurXIpn/7KzBbF85Fc5QYUNGszPDOXQe9ZhlHFz
         AQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773981745; x=1774586545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TFiMeDqsqLxKH33tw8XieRipEcdYxlO0t3NWit2qvXY=;
        b=cvHm3HzWmwsJRnNSiJZGy9f0EXCzdg5OnmC4YCaHhuvAEKKEemSPaCQCOzFjOmwwmh
         yuFdMbVrtsQGWMc67ObErXkO7Ge7xRIoL83lJ1zCi8+5UL4+JTjrOMx/2zFdof0Gah2+
         upkb+WjJEgorKDmqZXQ4uxMQ/cp631khnAyEALDeWVP9V0IJymCgbGcTGGaEeLqlM3JV
         yOTfH32Rf9G8EPYGIbjMmWv8hUlj9JJRAGGvXqOaMiGy55umkEt8T3I4u1b2VpfCotxv
         8xxiUtVwvX8M8SBg+C1rQ6i3XtO47G4hXy86oELJ3dgCuC5GkrK6Dwh8VLS1ETW5r8Gu
         nuYQ==
X-Gm-Message-State: AOJu0Ywb8PaotZRnxB5IyyUwG5nt7mA5SP3XocCyUrsZ5QmR9J92OVEl
	8OOTI2yvZ0eVOeU9AmJqmauy9tr8Q4L68CeX7SDW5j1smM8zMFEQHW/0QQmmC12q9A8DgdFuVt/
	gSk4HkVgiV2oMuQ+kWENCVy4Gw9va0uW+2lM48d2kwQ==
X-Gm-Gg: ATEYQzwtwmfuGlPAfLYoEyWewui7yjH/z5bnE2eRW6GY+fiyLWVLkD0byUrvBRfiecI
	/g9HHq1MRPxfdIyI5bE036myH5kp5y8aA5iFIcKVQG0tqkSK3UOKsGNxuTKDG34+BY7CZH89PlW
	qzmqUhNoG9sQ1MDEeOTyAdJcvDKFgL6nC6+xkSZDlkYdK9A2zt2zHk4N+YKKr26QVxn4LQb6giQ
	+nwip830tBGeDH/sxW/o0ywqZ4QavUlFcKpSjd3I5RIeEJhXESRWuGNUviUiHvbqDNEP2G//Pm8
	Ej7i7qf8gwzB73OsIScA+pRkQkT41+4OBiEKcPfSSS9E9aAeYtk2N4TgdhFfWCQ3ViKEUYCUnVs
	vstKiSyOBg7fFjIUZMo4CbLcW+23tsbrqR1fx
X-Received: by 2002:a05:6820:229c:b0:67c:1765:df48 with SMTP id
 006d021491bc7-67c18387686mr4937723eaf.7.1773981745272; Thu, 19 Mar 2026
 21:42:25 -0700 (PDT)
MIME-Version: 1.0
References: <20260210094044.72591-1-ganboing@gmail.com> <20260210094044.72591-3-ganboing@gmail.com>
In-Reply-To: <20260210094044.72591-3-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Mar 2026 10:12:13 +0530
X-Gm-Features: AaiRm50WO9zYujWzt4lRecZH1H7D0QYkAQjaTM9Iq28tYSN0dhJvKP-B9TbO_zA
Message-ID: <CAAhSdy1o9--rxOxgtpcKSYwxqEVhjXGEPGHvhV_Ha1Z-AJcXOg@mail.gmail.com>
Subject: Re: [PATCH 2/7] include: sbi: Add sbi_regs_prev_xlen
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com, 
	anup.patel@oss.qualcomm.com, cleger@rivosinc.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_214226_697428_954192F9 
X-CRM114-Status: GOOD (  14.04  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMzoxMuKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IHNiaV9yZWdzX3ByZXZfeGxlbiByZXBvcnRzIHRoZSB4bGVuIG9mIHBy
ZXZpb3VzIG1vZGUgYnkgZGVjb2RpbmcKPiBmcm9tIG11bHRpcGxlIENTUnMgaW5jbHVkaW5nIG1z
dGF0dXMvaHN0YXR1cy92c3N0YXR1cwo+Cj4gU2lnbmVkLW9mZi1ieTogQm8gR2FuIDxnYW5ib2lu
Z0BnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfdHJhcC5o
IHwgNTggKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCA1OCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkv
c2JpX3RyYXAuaCBiL2luY2x1ZGUvc2JpL3NiaV90cmFwLmgKPiBpbmRleCA3MzFhMGM5OC4uNGVm
NjcyZjQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX3RyYXAuaAo+ICsrKyBiL2luY2x1
ZGUvc2JpL3NiaV90cmFwLmgKPiBAQCAtMjczLDYgKzI3Myw2NCBAQCBzdGF0aWMgaW5saW5lIGlu
dCBzYmlfbXN0YXR1c19wcmV2X21vZGUodW5zaWduZWQgbG9uZyBtc3RhdHVzKQo+ICAgICAgICAg
cmV0dXJuIChtc3RhdHVzICYgTVNUQVRVU19NUFApID4+IE1TVEFUVVNfTVBQX1NISUZUOwo+ICB9
Cj4KPiArI2lmIF9fcmlzY3ZfeGxlbiA9PSAzMgo+ICtzdGF0aWMgaW5saW5lIGludCBzYmlfcmVn
c19wcmV2X3hsZW4oY29uc3Qgc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MpCj4gK3sKPiArICAg
ICAgIHJldHVybiBfX3Jpc2N2X3hsZW47Cj4gK30KPiArI2Vsc2UKPiArc3RhdGljIGlubGluZSBp
bnQgc2JpX21zdGF0dXNfc3hsKHVuc2lnbmVkIGxvbmcgbXN0YXR1cykKPiArewo+ICsgICAgICAg
cmV0dXJuIChtc3RhdHVzICYgTVNUQVRVU19TWEwpID4+IE1TVEFUVVNfU1hMX1NISUZUOwo+ICt9
Cj4gKwo+ICtzdGF0aWMgaW5saW5lIGludCBzYmlfbXN0YXR1c191eGwodW5zaWduZWQgbG9uZyBt
c3RhdHVzKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gKG1zdGF0dXMgJiBNU1RBVFVTX1VYTCkgPj4g
TVNUQVRVU19VWExfU0hJRlQ7Cj4gK30KPiArCj4gK3N0YXRpYyBpbmxpbmUgaW50IHNiaV9oc3Rh
dHVzX3ZzeGwodW5zaWduZWQgbG9uZyBoc3RhdHVzKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gKGhz
dGF0dXMgJiBIU1RBVFVTX1ZTWEwpID4+IEhTVEFUVVNfVlNYTF9TSElGVDsKPiArfQo+ICsKPiAr
c3RhdGljIGlubGluZSBpbnQgc2JpX3JlZ3NfcHJldl94bGVuKGNvbnN0IHN0cnVjdCBzYmlfdHJh
cF9yZWdzICpyZWdzKQo+ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGhzdGF0dXMsIHZzc3Rh
dHVzOwo+ICsKPiArICAgICAgIGlmICghc2JpX3JlZ3NfZnJvbV92aXJ0KHJlZ3MpKSB7Cj4gKyAg
ICAgICAgICAgICAgIHN3aXRjaCAoc2JpX21zdGF0dXNfcHJldl9tb2RlKHJlZ3MtPm1zdGF0dXMp
KSB7Cj4gKyAgICAgICAgICAgICAgIGNhc2UgUFJWX006Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgcmV0dXJuIF9fcmlzY3ZfeGxlbjsKPiArICAgICAgICAgICAgICAgY2FzZSBQUlZfUzoKPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gTVhMX1RPX1hMRU4oc2JpX21zdGF0dXNfc3hs
KHJlZ3MtPm1zdGF0dXMpKTsKPiArICAgICAgICAgICAgICAgY2FzZSBQUlZfVToKPiArICAgICAg
ICAgICAgICAgICAgICAgICByZXR1cm4gTVhMX1RPX1hMRU4oc2JpX21zdGF0dXNfdXhsKHJlZ3Mt
Pm1zdGF0dXMpKTsKPiArICAgICAgICAgICAgICAgZGVmYXVsdDoKPiArICAgICAgICAgICAgICAg
ICAgICAgICBfX2J1aWx0aW5fdW5yZWFjaGFibGUoKTsKPiArICAgICAgICAgICAgICAgfQo+ICsg
ICAgICAgfQo+ICsKPiArICAgICAgIC8qIFY9MSwgQ2hlY2sgSFNYTEVOIGZpcnN0ICovCj4gKyAg
ICAgICBpZiAoc2JpX21zdGF0dXNfc3hsKHJlZ3MtPm1zdGF0dXMpIDwgTVhMX1hMRU5fNjQpCj4g
KyAgICAgICAgICAgICAgIHJldHVybiAzMjsKPiArCj4gKyAgICAgICBoc3RhdHVzID0gY3NyX3Jl
YWQoQ1NSX0hTVEFUVVMpOwo+ICsgICAgICAgLyogQ2hlY2sgVlNYTEVOICovCj4gKyAgICAgICBp
ZiAoc2JpX2hzdGF0dXNfdnN4bChoc3RhdHVzKSA8IE1YTF9YTEVOXzY0KQo+ICsgICAgICAgICAg
ICAgICByZXR1cm4gMzI7Cj4gKwo+ICsgICAgICAgdnNzdGF0dXMgPSBjc3JfcmVhZChDU1JfVlNT
VEFUVVMpOwo+ICsgICAgICAgc3dpdGNoIChzYmlfbXN0YXR1c19wcmV2X21vZGUocmVncy0+bXN0
YXR1cykpIHsKPiArICAgICAgICAgICAgICAgY2FzZSBQUlZfUzoKPiArICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gTVhMX1RPX1hMRU4oc2JpX2hzdGF0dXNfdnN4bChoc3RhdHVzKSk7Cj4g
KyAgICAgICAgICAgICAgIGNhc2UgUFJWX1U6Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0
dXJuIE1YTF9UT19YTEVOKHNiaV9tc3RhdHVzX3V4bCh2c3N0YXR1cykpOwo+ICsgICAgICAgfQo+
ICsgICAgICAgX19idWlsdGluX3VucmVhY2hhYmxlKCk7Cj4gK30KPiArI2VuZGlmCj4gKwo+ICBp
bnQgc2JpX3RyYXBfcmVkaXJlY3Qoc3RydWN0IHNiaV90cmFwX3JlZ3MgKnJlZ3MsCj4gICAgICAg
ICAgICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBzYmlfdHJhcF9pbmZvICp0cmFwKTsKPgo+IC0t
Cj4gMi4zNC4xCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
