Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF943C43458
	for <opensbi@archiver.kernel.org>; Sun, 28 Jun 2026 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XnhJA1/RURU2gIpn6p59ZVLFUFIiIGkU7hDDaimpQbE=; b=R8f/hmH01SFMEF
	jYngrWppDU61OZNkcYNhVlSPBykrPtu/Nz5MikVho+FQmDBWbebEx5mhjyThP8jEPypLfHaJCl/Bk
	xrAzB77T0CIjkjuJZGQuZe3VmymXL4JElPruAWoFTn6EFJEmUgcnC0H/FTrp+55wg/jsn/sbVN/nl
	ZMGhi6vyKyy2Gh3ej/Q2SSUHjESavk46Fro+XVogDXJQQtxsbyM+BaNE9nsXEFdi7XcQDlSoUwh8V
	bieOz10b/BEp1wN8zUki6lhwlqcyB3KD+k0ZFx9LFjCB4B7FV3NnHhL5JkYADGKlkRTd1Don+aMWh
	R9xHUIjaYkWHQESw77cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdky6-0000000CzQE-3Wu4;
	Sun, 28 Jun 2026 08:34:22 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdky4-0000000CzPi-0jv6
	for opensbi@lists.infradead.org;
	Sun, 28 Jun 2026 08:34:21 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-472326ca506so189608f8f.2
        for <opensbi@lists.infradead.org>; Sun, 28 Jun 2026 01:34:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782635658; cv=none;
        d=google.com; s=arc-20260327;
        b=jBNXpVzhhcAp8v3DMfRKePIlRIRzxtn28QUQ8NdDjuh9L+0PwVsv+BN0BH3RK6Xa//
         vGrPd0M1pBIlaoBMWOeTMnJ67EnWUICWlaIyegaK+kjobitASg7PN9MTyGvX0TdQQ0P7
         2bILj2aYnrW34ziNlTzD1r2uyWECa1oErvRnyWA5v+7bFa7PE85fJ3powTmEUWheSfaR
         2COhNVfhJczKGDWaBiYHrXnbOsd4Xxi/R13Kqe4TzoVhTxZj/OA2nvF3V+W4DkIUYJKf
         ZSWZIZGNpb4nKoCTELguGe2CiJnPkgJE8aFtrZNI000nI1GHQJgQBM14wZpILAON9LOp
         mkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DmnIEg2yvkX3eo6riXDEuvsxXc9FsLp0dBhzL2oJsRU=;
        fh=ptzNB7g9a30gS3iMdXy8hchchj5+04tEpHu43QD535Q=;
        b=kf8Io+eQEXR/h89RlvRHnQbAag/etoaRipOuNITAR19vkPobYxDYelQb7BFuDiJWnG
         JQHiZmDND8xN10xO+IXLdgGNX4JVKKdCAs/lHrvb+/Z3GyCtGlsTArcsk/HINrkCfEhO
         nftFMdcCqI4+wAu0Uk+4KHwYvhMFEMZXRkHtIhHJ04jOGLCf4/ebju+bueXfnYQynNpR
         +lSiX3ZdWKjAw+a4wSR1HvOqbS8rQYu+H+VKai0DgRua3JeFxzLaFrekovJY5UBtfDe3
         LoNxOayhMil5MdnjbLu7lRCFzlUNu6NN3vBnREEpYdSKvzqN8nPjHq/XAKKWRBjEmkrR
         0W9Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1782635658; x=1783240458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DmnIEg2yvkX3eo6riXDEuvsxXc9FsLp0dBhzL2oJsRU=;
        b=JHr+ZUx2hKGiVxKPkKu7BXOdXR1SXshPYYobvBSdJRo5LN8F0TMxDWGdrge5gtBp3T
         zG50o7PCVcDPtzKOvUmAOOqwJBq3EWXNuYcNe5FjLyANN1QhdPcuz1RYdNAP/ccIG5u1
         pLoiZ66z/X0+iogIH0c4UzwlVKNsyYnN0WBlC4tbvi+pEFou0qOdZtNyf0EumWwsosqQ
         /isH13WcO8AHcI1PAbNcTydKTeZvRwKalB+u8xvos8g9HyZ5typDEAEYrjbCx/xx6YFA
         3KLG9a47fdgzGoCldSw1DvoFPw3Khl5J/FccT7gxJzOhfchmtmrP1MEHhExr6AeREX3V
         GY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782635658; x=1783240458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DmnIEg2yvkX3eo6riXDEuvsxXc9FsLp0dBhzL2oJsRU=;
        b=GvucWm6t5pYMvVaCFrjUlW1qEUgJGNuQtqJpxE1kac9OMzV7H+OhrXuPOx3txA5Xo5
         NBAbFrprjcf5+1pO5+D6+FhfxVhyR9V1mUGaqlMbCvCjqM/9LThY2bhwGfafjNPI9+Ts
         Nx8zakCXTIbfuyCQaWjf+GBw5ulWcX6Do0g633VI0w8eOt1KJEQ6tbRgKaJVxad8bsJ1
         VNJWXvubo6RBsF80De0gUFMGwVZMNeLg4IbU8D6hw07LbifkLkMwJeCKSFXeMf0QIQpF
         jPaArG2cVFzTJvjgubQbMQVhzTCSdS+4voxUormXnhXvvopB8ELfB376GPWFl0kUdPJF
         c3HQ==
X-Gm-Message-State: AOJu0Yyqdz7KbuXgacvw5CFg4UN99y9cAGkdLgRlFg9QVKO3co9rOYHO
	AE0HEeqK7e2pIkX3cALXQGQ5JyGsjKNOQSoELez43NKkWYeIU5DVCqCFhYFnHeTb4fMH8kf7TDf
	yJuEsxsxNy6kmZAEmXGEQMps7ATluLj+FFlW0eIqwiw==
X-Gm-Gg: AfdE7cka/Do9n5v+L9UF88kp+pKd1a7cu6z7Hfgz5KIVlY6YFpzFRthuLilE2ZwgMa8
	Ez1QYtg/QchrcqyCbB5i+1rRBuw5QY+Rynd7AykQexCiIsvtW3YyryiFH4O7F4c6Tn0VHcIxYb0
	KZwBQiMAX8aE2Y3FFpD2MBb0I0zGE13wWU8IdeizVYzaUiEWb90f1qf9HxUblUBVsRALPMjo0nv
	dsVByoXMuVTLhwGpethtv+chGGChpZJFpLt46yeK+I8o3Uly4SWU0dBmljCmUphhmsLMRcnpg8m
	eIV/irCjDRU/yjIGGIPRY/7z6bmUCKBiyHIM8XqVaMyH5Nftp9G+RuZ1QolyOUf8Wl5tX8eCXjC
	k1v8cXVWH1ZUd4eU=
X-Received: by 2002:a5d:54cf:0:b0:465:ba53:a006 with SMTP id
 ffacd0b85a97d-46fb87d2eb8mr9005004f8f.23.1782635657917; Sun, 28 Jun 2026
 01:34:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260624035049.1753003-1-liutong@iscas.ac.cn>
In-Reply-To: <20260624035049.1753003-1-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 28 Jun 2026 14:04:06 +0530
X-Gm-Features: AVVi8Cf0_5G1iObomMCrvBCvh8THsDy4ZLsJTdSfxHF6uO4s5iDztG6Fehk1g_A
Message-ID: <CAAhSdy2PbQSGtDBaKicJ_4Jheqzeo_bh8H5KCLXQQAQG-2E51A@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_pmu: fix integer overflow in pmu_ctr_idx_validate
 and cfg_match skip path
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_013420_488779_37985F19 
X-CRM114-Status: GOOD (  21.09  )
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

T24gV2VkLCBKdW4gMjQsIDIwMjYgYXQgOToyMeKAr0FNIGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMu
YWMuY24+IHdyb3RlOgo+Cj4gcG11X2N0cl9pZHhfdmFsaWRhdGUoKSBjaGVja3Mgd2hldGhlciBj
b3VudGVyIGluZGljZXMgYXJlIGluIHJhbmdlCj4gdXNpbmcgY2Jhc2UgKyBzYmlfZmxzKGNtYXNr
KSA8IHRvdGFsX2N0cnMuICBCb3RoIG9wZXJhbmRzIGFyZSB1bnNpZ25lZAo+IGxvbmcsIHNvIGEg
Y3JhZnRlZCBjYmFzZSBjbG9zZSB0byBVTE9OR19NQVggY2F1c2VzIHRoZSBhZGRpdGlvbiB0byB3
cmFwCj4gYXJvdW5kIHRvIGEgc21hbGwgdmFsdWUgdGhhdCBwYXNzZXMgdGhlIGNvbXBhcmlzb24u
Cj4KPiBPbmNlIHZhbGlkYXRpb24gaXMgYnlwYXNzZWQsIHNiaV9wbXVfY3RyX2NmZ19tYXRjaCgp
IHdpdGggdGhlCj4gU0tJUF9NQVRDSCBmbGFnIHVzZXMgdGhlIG92ZXJmbG93ZWQgaW5kZXggZGly
ZWN0bHkgYXMgYW4gYXJyYXkgc3Vic2NyaXB0Cj4gaW50byBwaHMtPmFjdGl2ZV9ldmVudHNbXSwg
cHJvZHVjaW5nIGFuIG91dC1vZi1ib3VuZHMgcmVhZCBpbiBNLW1vZGUuCj4gVGhyb3VnaCB0aGUg
ZmlybXdhcmUtZXZlbnQgY29kZSBwYXRoLCB0aGUgc2FtZSBvdmVyZmxvd2VkIGluZGV4IHJlYWNo
ZXMKPiBmd19jb3VudGVyc19kYXRhW10gYW5kIGZ3X2NvdW50ZXJzX3N0YXJ0ZWQsIGdpdmluZyBh
biBhdHRhY2tlciBPT0IKPiB3cml0ZS16ZXJvIGFuZCBPT0IgYml0LXNldCBwcmltaXRpdmVzIGlu
IE0tbW9kZSBtZW1vcnkuCj4KPiBGaXggcG11X2N0cl9pZHhfdmFsaWRhdGUoKSBieSBjaGVja2lu
ZyBmb3IgdW5zaWduZWQgb3ZlcmZsb3cgYmVmb3JlIHRoZQo+IGNvbXBhcmlzb24sIGFuZCBhZGQg
YSBzZWNvbmRhcnkgYm91bmRzIGNoZWNrIG9uIGNpZHhfZmlyc3QgaW4gdGhlCj4gU0tJUF9NQVRD
SCBwYXRoIHNvIHRoYXQgZXZlbiBpZiB2YWxpZGF0aW9uIGlzIHNvbWVob3cgYnlwYXNzZWQgaW4g
dGhlCj4gZnV0dXJlLCB0aGUgYXJyYXkgYWNjZXNzIHJlbWFpbnMgYm91bmRlZC4KPgo+IFNpZ25l
ZC1vZmYtYnk6IGxpdXRvbmcgPGxpdXRvbmdAaXNjYXMuYWMuY24+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2gg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3Ni
aS9zYmlfcG11LmMgfCAxNSArKysrKysrKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEzIGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlf
cG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IDQ4MGE5NzIzLi4xYjNlN2M5YSAxMDA2
NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4g
QEAgLTIyNCw4ICsyMjQsMTYgQEAgc3RhdGljIGludCBwbXVfY3RyX3ZhbGlkYXRlKHN0cnVjdCBz
YmlfcG11X2hhcnRfc3RhdGUgKnBocywKPgo+ICBzdGF0aWMgYm9vbCBwbXVfY3RyX2lkeF92YWxp
ZGF0ZSh1bnNpZ25lZCBsb25nIGNiYXNlLCB1bnNpZ25lZCBsb25nIGNtYXNrKQo+ICB7Cj4gLSAg
ICAgICAvKiBEbyBhIGJhc2ljIHNhbml0eSBjaGVjayBvZiBjb3VudGVyIGJhc2UgJiBtYXNrICov
Cj4gLSAgICAgICByZXR1cm4gY21hc2sgJiYgY2Jhc2UgKyBzYmlfZmxzKGNtYXNrKSA8IHRvdGFs
X2N0cnM7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGxhc3Q7Cj4gKwo+ICsgICAgICAgaWYgKCFj
bWFzaykKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAgIGxhc3Qg
PSBzYmlfZmxzKGNtYXNrKTsKPiArICAgICAgIGlmIChjYmFzZSA+IFVMT05HX01BWCAtIGxhc3Qp
Cj4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiArCj4gKyAgICAgICByZXR1cm4gKGNi
YXNlICsgbGFzdCkgPCB0b3RhbF9jdHJzOwo+ICB9Cj4KPiAgaW50IHNiaV9wbXVfY3RyX2Z3X3Jl
YWQodW5zaWduZWQgbG9uZyBjaWR4LCB1aW50NjRfdCAqY3ZhbCwgYm9vbCBoaWdoX2JpdHMpCj4g
QEAgLTkxNiw2ICs5MjQsOSBAQCBpbnQgc2JpX3BtdV9jdHJfY2ZnX21hdGNoKHVuc2lnbmVkIGxv
bmcgY2lkeF9iYXNlLCB1bnNpZ25lZCBsb25nIGNpZHhfbWFzaywKPiAgICAgICAgICAgICAgICAg
dW5zaWduZWQgbG9uZyBjaWR4X2ZpcnN0ID0gY2lkeF9iYXNlICsgc2JpX2ZmcyhjaWR4X21hc2sp
Owo+Cj4gKyAgICAgICAgICAgICAgIGlmIChjaWR4X2ZpcnN0ID49IHRvdGFsX2N0cnMpCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gKwo+ICAgICAgICAgICAg
ICAgICBpZiAocGhzLT5hY3RpdmVfZXZlbnRzW2NpZHhfZmlyc3RdID09IFNCSV9QTVVfRVZFTlRf
SURYX0lOVkFMSUQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7
Cj4gICAgICAgICAgICAgICAgIGN0cl9pZHggPSBjaWR4X2ZpcnN0Owo+IC0tCj4gMi4zNC4xCj4K
Pgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
