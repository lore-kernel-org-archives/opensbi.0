Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE7B606A31A
	for <opensbi@archiver.kernel.org>; Mon, 26 Oct 2026 05:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M2HcQ/TL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=my9b93+R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Erw+qIvndZuE40Gici+IrywvgceXbT5OjCokm2ZpndQ=; b=M2HcQ/TL9JEmpmtBL2pl7NN1qB
	COSaS0gbY+N50vpKTX/DcAweYlPRJdZPrft2ncF9tN0rxwtq6Wf0W5DCvACcbums0xMVy4FWyvYn0
	egIc+kALnAkNcvYjAQ26QGWZhVH9WM5a6GrTrGjohXD6mHD43K26E1Yyt3qwKbp5P8aPejt3vBUi9
	AADC9CW5Pi3tTx9nz0ECarDz7EYqZV/pqI8EYMGz9eMmMSwTQOSiuKhipkAkVoe2NbLvxWmpCbwnY
	NmutaYhv5s2HIwf14JCgsBNKnoSMHSSEYt8/GyxUlT1wUOwU/xyyjnGX40xb4OpoaMPuYjTq0i5D7
	g18riKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCsm-00000001j1W-3NGW;
	Mon, 26 Oct 2026 05:04:28 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLCsk-00000001j0y-0oaW
	for opensbi@lists.infradead.org;
	Mon, 26 Oct 2026 05:04:27 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e4831c028so976055f8f.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 22:04:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792991064; cv=none;
        d=google.com; s=arc-20260327;
        b=N6K7SoX8o93UkWX/S+mqNzbdiGYyQWDw8axfBJs5VLRo94ME7YJZzi0ZXp6t2zlFj3
         migJQEYY9Bu2Le3jX65f3IL4L/KW0UsmQF+pqXkZbAcRBpXe/JNqLuAgnH02TzCqohs1
         tAhxnrxjS3W1yHPFHqvZKfoRemmjpYl2HYLHVIUYCrwZoJAsfKowzCUKFTkqZFw1LS3S
         XSiz7KaNedEL09DZRgndUvgX5ImFKoVl45pTUstTdjSfdJPlosET0+G/hO4Gbt/R0SaP
         nKp/qsDfpQAtSS8Pk6IXhRFci2+Rd5+7kyEyszOiz/pJstyA36QbsmZKioYnyBrNA0lr
         xjDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=egQoI4csM2wUKKqMqXOgy6dJH2+zLqn4eBHc2Xgwx0M=;
        fh=Dh6aZinx23Z80DMo/g7Tzp0Oq2qhcklt202M/UMjetY=;
        b=fjrdQAvaIF8YdO1z2ihkjTeuV3JCPd1SdFxogOLgeoH+AcDoBjXLPcMzQGJwnt3rye
         ZfgUZ57z/um0wFgkhD+Z5ge6Z/6A7O/wu8w3BTvAHBae4dPX+5i1nogP7CfvmJ3rZiah
         lsIWVrrW5JS3VgxGgoQU0ZIZxSouu9q4J1g6hcWq9B8UkFlhKWovLJc6F6b2d7IVYuEq
         W34PwnzZSpnl/RCJybUCR5Yl26dH4Vw7CF2OypOa7l7zsWML/0X5bzqtHQQDsv4dU92F
         Gzh0X2cSdGjcPoCAShaNY9toGbtF0PoFdFwSD+XgNsCth8U+q68Vw6Be7bRfJP/GTkHx
         wtaw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792991064; x=1793595864; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=egQoI4csM2wUKKqMqXOgy6dJH2+zLqn4eBHc2Xgwx0M=;
        b=my9b93+RbKAhRnnTk38/PUq+hXYI5/LAb6WjgbL1tc1CNMuR0ygW5uzz3woLcFqKOn
         vY/uyI8FKNM3B9rkIOGip+kTEbdlgK/GEDXFxl7HjwcN9IL7/m0kS/Nv/8PvHAPFbGW0
         pl3MsJiwbXSc+yC0viFWt7ksvuZzNYtqOk8eT5aRwOodSpXDEA9FoIKZk69Ru3DhsiNS
         GVkxD1w3MzEmBqEQw9p4iPLcmO13Zjw55zJJxfZ26RKeBkxnY2TpcNHByx0261s073Mb
         1W3X/EDAfNZY/C53L6X264D23iGUFeJx+yMozzL36yoiNagAiIQ15zLyew2wnuAWSRrF
         fmTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991064; x=1793595864;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egQoI4csM2wUKKqMqXOgy6dJH2+zLqn4eBHc2Xgwx0M=;
        b=VZMBEpLmZp+zb5i5HGF+p7NWwINtrhADLjkMvb6hyVAKKY4xKzn2CdI+gBAmFKQ4mm
         si6X51Io0UiI4FtSZbPZwTnzLgxg9hLblhhdqz5yY+CyALGYz3vMqy69/lWVinyisl1W
         SzF/RuW3+L+RLlIWmM47NnrURtodliOce9HOzf3t4hOcqZN9REdWH3JXLB/h25mGiLIj
         lMiPRajOkEYSy0Kgq2BKf1Z1AsQNlAtY1yzBkBqsi0KyOLCmiK0UaHSIv2J5Sy949FPd
         mZTRSvKJeW1Yo3pOCc+7Y/Oo3KbhIAzMLeAC6aqi9IjH49aw0k3NG7u8HOb7Efw8e6D5
         k00w==
X-Gm-Message-State: AFq9FYLSRcrjkJUI0iVlrRwSoI+RgbiJmt60dzFoJo62QxR5iLvpi6qD
	VlZ543W/wq3w8dlGzis0uMdYi0mYEnFd1S79hR3Rbm+2Do7xNWXPVElALHeETXuK610iGRNMKda
	dAZKlqvVZCB/fjh4bYElQHFLQDBApPZzYKalNETMJYyoOQqCK7otjddLFxQ==
X-Gm-Gg: AYBFou0e9aIGxEhIYRvgS4TMwdJrdoiVk3ZkOnf0P2FmVJfd98+BLi6TQjvRv6wQImV
	fWznkt+c7cQf2SF/UAbU7C/powc20Kp9FW1hsF2YvebYJM1cmOz38POlnsDrWlEOuw6KY/xkQAC
	ARyk65J8qnDyw7NzfRK8XtapgR7DeuEFv3dODruTKibNOyqzZJnQZ8VykO9wrx7qMGjzCkjtKNJ
	tI6tHxFU29Ke0IrmbV8tjcGvj1xZyowkKPjXPkV/R0pJ3ed160lKm6u4YdBLpGmpscjHuvh1KfX
	xsrgElPBXsDyGCje5Hnx42Q4o6lqq+Imt56WPg0jHEFjEBmP+JHMJy8DG2ifVYx1Y5JPFxykhbg
	dF6/mq5mJlyNZFds9BJuno6ptbWzPe05lyhUWND8/XFeDd7+NcBrja6SkFxstAPvPHefBkzbh9R
	8gStQq/1AeI5SgYPTA+7adk+1fAYkTM6pHshjjdf8rxUMQQ2tagalzmnCD
X-Received: by 2002:a05:6000:2508:b0:48c:8126:a260 with SMTP id
 ffacd0b85a97d-48e3eb2c891mr10102754f8f.6.1792991064283; Sun, 25 Oct 2026
 22:04:24 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260910052629.3359493-1-liutong@iscas.ac.cn> <20260910052629.3359493-3-liutong@iscas.ac.cn>
In-Reply-To: <20260910052629.3359493-3-liutong@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 26 Oct 2026 10:34:12 +0530
X-Gm-Features: AclHuK9IL6smM1xjN447BaOthBnF6ZBhcqMECMJy2Kx7YwvyOR7o3ytCC1Vxv8U
Message-ID: <CAAhSdy16rgVM2Ae5euGX63+v+gFR9HM7sW=xcig9L59MaP8BYA@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] lib: sbi_pmu: fix integer overflow and
 zero-address in event_get_info
To: liutong <liutong@iscas.ac.cn>
Cc: opensbi@lists.infradead.org, himanshu.chauhan@oss.qualcomm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_220426_257675_D12E6593 
X-CRM114-Status: GOOD (  23.66  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBTZXAgMTAsIDIwMjYgYXQgMTA6NTbigK9BTSBsaXV0b25nIDxsaXV0b25nQGlzY2Fz
LmFjLmNuPiB3cm90ZToKPgo+IHNiaV9wbXVfZXZlbnRfZ2V0X2luZm8oKSBjb21wdXRlcyB0aGUg
c2hhcmVkIG1lbW9yeSBzaXplIGFzCj4gbnVtX2V2ZW50cyAqIHNpemVvZihzdHJ1Y3Qgc2JpX3Bt
dV9ldmVudF9pbmZvKSBiZWZvcmUgbnVtX2V2ZW50cyBpcwo+IHZhbGlkYXRlZC4gVGhlIHByb2R1
Y3QgY2FuIHdyYXAsIGluIHdoaWNoIGNhc2UgdGhlIGRvbWFpbiBjaGVjayBydW5zCj4gYWdhaW5z
dCBhIHRydW5jYXRlZCBzaXplIHdoaWxlIHRoZSBsb29wIGJlbG93IHN0aWxsIGl0ZXJhdGVzIG92
ZXIgdGhlCj4gb3JpZ2luYWwgY291bnQsIHRoYXQgaXMsIHBhc3QgdGhlIHJlZ2lvbiB0aGF0IHdh
cyBjaGVja2VkLgo+Cj4gQSBzaG1lbV9waHlzX2xvIG9mIHplcm8gaXMgYWxzbyBhY2NlcHRlZCwg
d2hpY2ggbGVhdmVzIHRoZSBsb29wIHdyaXRpbmcKPiBhdCBhZGRyZXNzIDAuCj4KPiBDaGVjayBu
dW1fZXZlbnRzIGFnYWluc3QgdGhlIGxhcmdlc3QgdmFsdWUgdGhhdCBjYW5ub3Qgd3JhcCwgYW5k
IHJlamVjdAo+IGEgemVybyBhZGRyZXNzLCBib3RoIGJlZm9yZSB0aGUgbXVsdGlwbGljYXRpb24u
Cj4KPiBGaXhlczogZTQzNDU4NDIxNjhiICgibGliOiBzYmlfcG11OiBJbXBsZW1lbnQgU0JJIFBN
VSBldmVudCBpbmZvIGZ1bmN0aW9uIikKPiBTaWduZWQtb2ZmLWJ5OiBsaXV0b25nIDxsaXV0b25n
QGlzY2FzLmFjLmNuPgo+IC0tLQo+IFByZXZpb3VzbHkgc2VudCBhcyBbUEFUQ0ggdjIgNC82XS4K
Pgo+IENoYW5nZXMgaW4gdjM6Cj4gLSBSZWJhc2VkIG9udG8gY3VycmVudCBtYXN0ZXIKPiAtIENv
bW1pdCBtZXNzYWdlIHJld29yZGVkOyB0aGUgY29kZSBpcyB1bmNoYW5nZWQgZnJvbSB2Mgo+IC0g
U3BsaXQgaW50byB0aGlzIHNlcmllcwo+Cj4gIGxpYi9zYmkvc2JpX3BtdS5jIHwgMTAgKysrKysr
KysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMgYi9saWIvc2JpL3NiaV9wbXUuYwo+IGlu
ZGV4IGU3OWY2YjYwLi41NGRhNWMyNCAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+
ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gQEAgLTEwNzQsNyArMTA3NCw3IEBAIGludCBzYmlf
cG11X2N0cl9nZXRfaW5mbyh1aW50MzJfdCBjaWR4LCB1bnNpZ25lZCBsb25nICpjdHJfaW5mbykK
PiAgaW50IHNiaV9wbXVfZXZlbnRfZ2V0X2luZm8odW5zaWduZWQgbG9uZyBzaG1lbV9waHlzX2xv
LCB1bnNpZ25lZCBsb25nIHNobWVtX3BoeXNfaGksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgbG9uZyBudW1fZXZlbnRzLCB1bnNpZ25lZCBsb25nIGZsYWdzKQo+ICB7Cj4g
LSAgICAgICB1bnNpZ25lZCBsb25nIHNobWVtX3NpemUgPSBudW1fZXZlbnRzICogc2l6ZW9mKHN0
cnVjdCBzYmlfcG11X2V2ZW50X2luZm8pOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzaG1lbV9z
aXplOwo+ICAgICAgICAgaW50IGksIGosIGV2ZW50X3R5cGU7Cj4gICAgICAgICBzdHJ1Y3Qgc2Jp
X3BtdV9ldmVudF9pbmZvICplaW5mbzsKPiAgICAgICAgIHN0cnVjdCBzYmlfcG11X2hhcnRfc3Rh
dGUgKnBocyA9IHBtdV90aGlzaGFydF9zdGF0ZV9wdHIoKTsKPiBAQCAtMTA4OSw2ICsxMDg5LDE0
IEBAIGludCBzYmlfcG11X2V2ZW50X2dldF9pbmZvKHVuc2lnbmVkIGxvbmcgc2htZW1fcGh5c19s
bywgdW5zaWduZWQgbG9uZyBzaG1lbV9waHlzCj4gICAgICAgICBpZiAoIW51bV9ldmVudHMgfHwg
KHNobWVtX3BoeXNfbG8gJiAweEYpKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9J
TlZBTElEX1BBUkFNOwo+Cj4gKyAgICAgICBpZiAoIXNobWVtX3BoeXNfbG8pCj4gKyAgICAgICAg
ICAgICAgIHJldHVybiBTQklfRVJSX0lOVkFMSURfQUREUkVTUzsKClJJU0MtViBwbGF0Zm9ybXMg
Y2FuIGhhdmUgRFJBTSBzdGFydGluZyBhdCAweDAgc28gdGhpcyBjaGVjayBpcyBub3QgdmFsaWQu
Cgo+ICsKPiArICAgICAgIGlmIChudW1fZXZlbnRzID4gKCh1bnNpZ25lZCBsb25nKS0xKSAvIHNp
emVvZihzdHJ1Y3Qgc2JpX3BtdV9ldmVudF9pbmZvKSkKClVzZSAiLTFVTCIgaW5zdGVhZCBvZiAi
KHVuc2lnbmVkIGxvbmcpLTEiCgo+ICsgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9JTlZB
TElEX1BBUkFNOwo+ICsKPiArICAgICAgIHNobWVtX3NpemUgPSBudW1fZXZlbnRzICogc2l6ZW9m
KHN0cnVjdCBzYmlfcG11X2V2ZW50X2luZm8pOwo+ICsKPiAgICAgICAgIC8qCj4gICAgICAgICAg
KiBPbiBSVjMyLCB0aGUgTS1tb2RlIGNhbiBvbmx5IGFjY2VzcyB0aGUgZmlyc3QgNEdCIG9mCj4g
ICAgICAgICAgKiB0aGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBiZWNhdXNlIE0tbW9kZSBkb2Vz
IG5vdCBoYXZlCj4gLS0KPiAyLjM0LjEKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+
IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKT3RoZXJ3aXNlLCBMR1RNLiBJIHdpbGwgdGFrZSBj
YXJlIG9mIHRoZSBhYm92ZSBjb21tZW50cwphdCB0aGUgdGltZSBvZiBtZXJnaW5nLgoKUmV2aWV3
ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0
Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkg
bWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
