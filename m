Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E60CA101F
	for <opensbi@archiver.kernel.org>; Wed, 10 Sep 2025 06:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3MkGeSwRn2FPkl0YhGbTSt/AXeAVLtngi7rDo2czmA=; b=sBa4uViSmjYqNE
	vWldrGGXQhCxYxO/ouQi00YaOu//j2n8v4o2Esw1cJO4RXKrdyFT2AiZokIurFvH/rX8s/8hULo+R
	hLPRFmCHL++04GKfX9F0HT6hF7lK9nrMA8zmK4jXq1mCF5iKt/OM1+NYSdMyMnJQ+9PCkyizEhB7H
	0LIWoI3kv1VxVhVraexH9EcD3L6YxHqgWc4rqtnI1G1i5ZDCz0iCGDifvpqpHPbZBGyCn2ofXHSo6
	eMDe+AztWFLPIYD0J4uQhnAn1j1YBznh6xTYMwIt9hNLlSjZMuV4ugTAa8sM+thQ9HDZVel4nja7X
	g9MSn4l2xYJy8Ux+SGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEcU-0000000CKc7-0K9r;
	Wed, 10 Sep 2025 06:47:54 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEcR-0000000CKbD-06Hj
	for opensbi@lists.infradead.org;
	Wed, 10 Sep 2025 06:47:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-32b02d88d80so5935074a91.0
        for <opensbi@lists.infradead.org>; Tue, 09 Sep 2025 23:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757486870; x=1758091670; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfzX9DKeX1pwjUMn4Wle9mlfKAz1G8rrTNr46fhekkc=;
        b=pB/oLiXfWAvY68w9Vn+DBYtRAKeF1HAfMCvmi1Pe7jJ7ms4PYm7U2gjf9rFfdLM11A
         j9ddy3k2RxTn6QdDdznn1shQpNy9Ggarz4ekmWu0PROxqxCz9sA9Zhf2ERz3kGgUNZOU
         OgoJg/qyuMRIEHHjZDr6le5eBIlC5L9TcVPCu/DZBnhldUTHan49yYBRimH0aHbZv3qJ
         6zLA2ekHzJRwQjphbC7vFwfH1C3DKBFeViJ+MLmLHW8/wkz6evm0DDVCjthU9lW95L7C
         Gi+y9t04NBS7mlgiTiEiestdMnImGF3IeIhvq2clclInRyAzdfilC2/1OGoqYmOItHPj
         IUvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757486870; x=1758091670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfzX9DKeX1pwjUMn4Wle9mlfKAz1G8rrTNr46fhekkc=;
        b=WTD4JXTO5eEjMQ6kqQZAwp1GPAi548q7mH2VdqIALZykdk1wssW0+JKr6BA8VeqQ0Y
         bituT8mx74n473FXyItvgXPFN8rlvhBgHwq5OHY+YyThhkdiffwTMEVxU4nOUIbguYtp
         RC7detTMtccD7ibJTerc/9qKfdr/WbHL2UVylvSgADsAvAi3puGfsRRMolQAStVDS0zN
         uwdARGr91KF53c/F609KpzFkKeUOw6eSz4rbNmiDiPXYllPWqAA8r+Hmbn/gBiHp6U4t
         I8fZgi6YMeoGcp2elYmM+Gaa8Si+SEyRPmI5p3BT1EJtA1B938uBJ2F2fUmoPsE+F1zl
         G/kg==
X-Gm-Message-State: AOJu0Yy2G6/TcSPBiPJ6wzTeRWLEwb5ZZze0uDzHPu2GerB3CmuzVnVF
	BHKMM8/PU7N6ryopc9O0cfDzDaWGQfnAgzBSPkOhN4B0BlrmEHF7IqBU62piKan6mPyKuA43plj
	X1ai5s5QhA/gwsktI/MTksPFNFcVEksehJ9/Z2J2LLA==
X-Gm-Gg: ASbGncv6uBniE7Z8Xt+dTIRMxvAWym6APbfk+00MCxmuVn0+JyCMEz3wil8rDNhIK8Z
	pcL5M2rcMPHkv4Ta5MhJzy9SozdaXJ7Bjp7jcfKjsau/AdLAzVon+LfBp7e7I0mNSbaCLLjhyPT
	v1qOzAdjed5vkhX6Lwj4i9I/dlz9l1Tx3A0kBJXD0luQKO0hE3c+sSnJomt1sYTZRpdJBiT9RXU
	aLnnPISMRaJiybkOiRs7BxMj6tBcZtvax0mo+sjkuJW2eDoPXwmfH66nPJGFBabBFsgGyEB3hnS
	ZA41SIf8yQZ6r5qB7Q3yYLVx+Zox0iAq5c8UlsbXgOlH+RRznp3E8fBZEg==
X-Google-Smtp-Source: AGHT+IEBP889tuXg64LWcouRYypzsT6jpi7z6hrQbciVv9BVmfNWUvcMr69s0jRrFN4SsXtWBgdGy/V1e3NlSGPTMJ4=
X-Received: by 2002:a17:90b:4ac9:b0:32b:a32b:a163 with SMTP id
 98e67ed59e1d1-32d43f9a839mr17426008a91.36.1757486870185; Tue, 09 Sep 2025
 23:47:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250903144323.251270-1-rpathak@ventanamicro.com> <1f1c14d4-4637-4991-87a3-1cf3327eeef3@sifive.com>
In-Reply-To: <1f1c14d4-4637-4991-87a3-1cf3327eeef3@sifive.com>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Wed, 10 Sep 2025 12:17:14 +0530
X-Gm-Features: Ac12FXzxFkJHclaaRMsTm-FxWp6HN9CjB39pWt4ONe8wwvrxXnR1V6tQvu6lXs8
Message-ID: <CA+Oz1=YsiCLLApUPFG1KS67XkiJ8dAcNFvkhSyJ83BQOXaZa1Q@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/reset: Hang the hart after RPMI system reset message
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org, rahul@summations.net, 
	Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_234751_065898_6CF5916F 
X-CRM114-Status: GOOD (  22.66  )
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

KHJlc2VuZGluZywgcHJldmlvdXMgbWFpbCB3YXMgdW5kZWxpdmVyZWQgb24gbWFpbGluZyBsaXN0
KQoKSGkgU2FtdWVsLAoKQSBSUE1JIGJhc2VkIHJlc2V0IGRyaXZlciBtdXN0IHNpbXBseSBoYW5n
IHJhdGhlciB0aGFuIHJlbHkgb24gdGhlCmltcGxlbWVudGF0aW9uIGZhbGxiYWNrIChzYmlfZXhp
dCgpKSwgd2hpY2ggbWF5IGFsc28gaGF2ZSBzZXJ2ZWQgdGhlCnB1cnBvc2UgSU1PLgoKSSB3b24n
dCBzYXkgdGhhdCBpdCBpbnRyb2R1Y2VkIGEgYnVnLCBidXQgcmF0aGVyIHRoYXQgdGhpcyB3YXMK
c3VwcG9zZWQgdG8gYmUgZG9uZSBpbiB0aGUgaW5pdGlhbCBjb21taXQgb2YgdGhlIGRyaXZlciBi
dXQgd2FzCm1pc3NlZCwgaGVuY2UgdGhlIEZpeGVzIHRhZy4KClRoYW5rcwpSYWh1bAoKT24gV2Vk
LCBTZXAgMTAsIDIwMjUgYXQgMTE6MDLigK9BTSBTYW11ZWwgSG9sbGFuZAo8c2FtdWVsLmhvbGxh
bmRAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBIaSBSYWh1bCwKPgo+IE9uIDIwMjUtMDktMDMgOTo0
MyBBTSwgUmFodWwgUGF0aGFrIHdyb3RlOgo+ID4gUlBNSSBzeXN0ZW0gcmVzZXQgaXMgYSBwb3N0
ZWQgbWVzc2FnZSB3aGljaAo+ID4gZG9lcyBub3Qgd2FpdCBmb3IgYWNrbm93bGVkZ2VtZW50IGFm
dGVyIHNlbmRpbmcKPiA+IHRoZSBSUE1JIG1lc3NhZ2UgdG8gUHVDLiBDYWxsIHRoZSBzYmlfaGFy
dF9oYW5nKCkKPiA+IHRvIGhhbmcgdGhlIGhhcnQgYWZ0ZXIgcGVyZm9ybWluZyB0aGUgc3lzdGVt
IHJlc2V0Cj4gPiB2aWEgUlBNSSBtZXNzYWdlLgo+ID4KPiA+IEZpeGVzOiA2YTI2NzI2ZTA4ZTQg
KCJsaWIvdXRpbHM6IHJlc2V0OiBBZGQgUlBNSSBTeXN0ZW0gUmVzZXQgZHJpdmVyIikKPiA+IFJl
cG9ydGVkLWJ5OiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4KPiA+IFNpZ25l
ZC1vZmYtYnk6IFJhaHVsIFBhdGhhayA8cnBhdGhha0B2ZW50YW5hbWljcm8uY29tPgo+ID4gLS0t
Cj4gPiAgbGliL3V0aWxzL3Jlc2V0L2ZkdF9yZXNldF9ycG1pLmMgfCAzICsrKwo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxz
L3Jlc2V0L2ZkdF9yZXNldF9ycG1pLmMgYi9saWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3JwbWku
Ywo+ID4gaW5kZXggZWRjNTM5MzJjY2MwLi5jMjk3MTVkMzI5YzQgMTAwNjQ0Cj4gPiAtLS0gYS9s
aWIvdXRpbHMvcmVzZXQvZmR0X3Jlc2V0X3JwbWkuYwo+ID4gKysrIGIvbGliL3V0aWxzL3Jlc2V0
L2ZkdF9yZXNldF9ycG1pLmMKPiA+IEBAIC03LDYgKzcsNyBAQAo+ID4gICAqICAgUmFodWwgUGF0
aGFrIDxycGF0aGFrQHZlbnRhbmFtaWNyby5jb20+Cj4gPiAgICovCj4gPgo+ID4gKyNpbmNsdWRl
IDxzYmkvc2JpX2hhcnQuaD4KPiA+ICAjaW5jbHVkZSA8c2JpL3NiaV9lcnJvci5oPgo+ID4gICNp
bmNsdWRlIDxzYmkvc2JpX3N5c3RlbS5oPgo+ID4gICNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUu
aD4KPiA+IEBAIC01Niw2ICs1Nyw4IEBAIHN0YXRpYyB2b2lkIHJwbWlfZG9fc3lzdGVtX3Jlc2V0
KHUzMiByZXNldF90eXBlKQo+ID4gICAgICAgaWYgKHJldCkKPiA+ICAgICAgICAgICAgICAgc2Jp
X3ByaW50Zigic3lzdGVtIHJlc2V0IGZhaWxlZCBbdHlwZTogJWRdOiByZXQ6ICVkXG4iLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgIHJlc2V0X3R5cGUsIHJldCk7Cj4gPiArCj4gPiArICAg
ICBzYmlfaGFydF9oYW5nKCk7Cj4gPiAgfQo+IElmIHJwbWlfZG9fc3lzdGVtX3Jlc2V0KCkgcmV0
dXJucyBub3JtYWxseSwgdGhlIGdlbmVyaWMgY29kZSB3aWxsIGNvbnRpbnVlIHRvCj4gc2JpX2V4
aXQoKSBhbmQgZXZlbnR1YWxseSBzYmlfaHNtX2hhcnRfd2FpdCgpLiBXYXMgdGhhdCBwcm9ibGVt
YXRpYyBpbiBzb21lIHdheT8KPiBZb3UndmUgYWRkZWQgYSBGaXhlcyB0YWcsIGJ1dCBpdCdzIG5v
dCBjbGVhciBmcm9tIHRoZSBjb21taXQgbWVzc2FnZSB3aGF0Cj4gcHJvYmxlbSB5b3Ugb2JzZXJ2
ZWQuCj4KPiBJZiBhbGxvd2luZyB0aGUgZHJpdmVyJ3MgLnN5c3RlbV9yZXNldCBjYWxsYmFjayB0
byByZXR1cm4gaXMgcHJvYmxlbWF0aWMgKHNvbWUKPiBkcml2ZXIgaW1wbGVtZW50YXRpb25zIGhh
bmcsIHNvbWUgZG9uJ3QpLCB0aGVuIHdlIHNob3VsZCBtYXJrIHRoZSBmdW5jdGlvbiB0eXBlCj4g
YXMgbm9yZXR1cm4gYW5kIHVwZGF0ZSB0aGUgcmVtYWluaW5nIGRyaXZlcnMgYXMgd2VsbC4KPgo+
IFJlZ2FyZHMsCj4gU2FtdWVsCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
