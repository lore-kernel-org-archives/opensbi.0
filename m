Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB89CCF9E3
	for <opensbi@archiver.kernel.org>; Tue,  4 Nov 2025 03:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMOPFGAPi9AdxZXrhi0DCaVH5z5kfZbm82KwdtmhC3A=; b=ckxqq/hLQg2Uup
	F2V5MiRqJOeDDqiit8EweG1SyaaQZh2mcNdZ8ECTe3BWYHLJaQS/Tgt4eo7wEbdFqfgLGuPLM7BLt
	A9CO8EDevP7yF2SePd5l+u4zRf/snWYGyTWKb+7pF/Nrb3fF7DhYiNMFlL6lCYG95LUL5Ll9WaReL
	sIuOFExTbTzY3l41usYhzKKZ+Y9zLAacS7b7TP22aHxykNNwNEh70PQRtX3yM8PYrSVMYitDfWNcz
	UYN1rIHSltnsHC5z/jhrQ6cGsg6OfHuZD8BDcgoDRqVim/pzY2mgjx8dCJhRz6xSfG1OP4UewLpgt
	/OnxxCe5IQhdcRDoLnNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG84F-0000000B52q-3qlW;
	Tue, 04 Nov 2025 03:50:47 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG84C-0000000B525-34TR
	for opensbi@lists.infradead.org;
	Tue, 04 Nov 2025 03:50:46 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-433217b58d9so10268485ab.1
        for <opensbi@lists.infradead.org>; Mon, 03 Nov 2025 19:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762228243; x=1762833043; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2Kvq2MJLvhLZJUlFa5gkWCCrGpBYwjnQ24OFCtVZjg=;
        b=mrUxA/yzHB8ZW4wyF7Jl3kKDKcBeWAUkFwYM3do2NYNXn/OaDiKxIkG4Ju2fd5NshJ
         xyzx6pDkSqTTt/JBgq6j1HvFdUZ30H04v/03meULEnBFfMeHwJMKSJmtikrrWdG6zFfZ
         5UMrZYQjembAEkzSUYw/1c3T/oHUG2npFVCorYVeInoCQ+wVhQYSUfi0MGOQ18swa7KQ
         PXJvTUChhMKleNBUveN8zPXFXHq/Imv0sTzlc02fGSmtGRS/CIXyQUTi6oZpbzEZ3ZFx
         B85m6i3dRWK1Cp3Ue7tm872QRYz0KjFZliVgEqCg6PTJBXHoQusYawpWyvJ+0u3qPy/c
         nhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762228243; x=1762833043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2Kvq2MJLvhLZJUlFa5gkWCCrGpBYwjnQ24OFCtVZjg=;
        b=CFwTrXM+kay9Dzdn/ORMpg6kGlJkR4nqN2MEIFI4j1kv+0sHQCzcu9w1ipDYnuwW9P
         IsUpyFZno3ylq35oeXLTiGmyIj9J1goDTMJ/xT4OKX560YO2XsPUHsEySvmmS5194Fva
         oD2BWAcDG4p8PN5DK/CCEFDUWLCUQIOLtwcFqtLH/uawaLquaUGhGo24a02vbxRDYUy9
         /y2THGS2zkU7avAOsKJRDukrfadWaAT7CmWC652vw70O5NqVFA+Uuc151ox5Sb4vGdbW
         4Ny2k1Qypw9YqJ9HXFsaCSyHPa3KnRvSV3KpUuoqVp7A4w3dFYc9fLONUjmcLHuz8cD+
         qkOg==
X-Gm-Message-State: AOJu0YxIDNnXeOc3lXykuQx4FMeM11FEh+dYbLPr75cYHCrYPsZW5yD5
	9isuD/BXiC60bxS1E7iFbx6lqbofBKxjF46kwC6L7PR+Krr7+GNW/vyAWVyCGIbi/FBQDnQMVre
	bTEZ/W3xFEzqvK4kr+j8CsE8HTQR26DpKu9kOl5/vvA==
X-Gm-Gg: ASbGncsY0j4il07l4iIi42Sndo/5r59ejV+Y3kJclcS+0cIbDOygv+M6M0JZAb9WEqw
	CwPLIKp2hoy+dS1jk1PfkcO8Vh7jBQkHjH2hNb6zajf6+smI4HVubsYLV5qFhhMDZytugRKyu3S
	HCTRixShWrdz/uBWnLD4kbqLWpLXw5ZBBf1qlkAKtfkpkkweY/rCYqUuB1a5QALzjOikNFnNmzl
	LSAl1TsmGzapMD3I2xA7cYcXyDhee+xtCBP56cApYyoeL4ebplHJyF3unXh
X-Google-Smtp-Source: AGHT+IGhQg7iqQU+KRsgB8fjN0zEekqL8TuzB7lxPG1AvK2biqgLOI9RFLE/TGUmNqcuBI2cBel6S+0CEn5FzqibIug=
X-Received: by 2002:a05:6e02:2184:b0:433:3848:e20 with SMTP id
 e9e14a558f8ab-4333848107amr13296535ab.10.1762228243393; Mon, 03 Nov 2025
 19:50:43 -0800 (PST)
MIME-Version: 1.0
References: <20250930022728.887069-1-wxjstz@126.com>
In-Reply-To: <20250930022728.887069-1-wxjstz@126.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 4 Nov 2025 09:20:31 +0530
X-Gm-Features: AWmQ_bkoPd1OKxCKy06rvLbfj7S3ja2l3viLZQ3q0JTYz3YnH3ftw4ZUL97m4Ng
Message-ID: <CAAhSdy0x1zn0mxx82p8Y3RnuR0neWjnY5Wdr4OeGWCt1O4hc6w@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Detect support of entropy source
To: Xiang W <wxjstz@126.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_195045_007887_575A6CCC 
X-CRM114-Status: GOOD (  15.33  )
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

T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgNzo1N+KAr0FNIFhpYW5nIFcgPHd4anN0ekAxMjYuY29t
PiB3cm90ZToKPgo+IERldGVjdCBpZiBlbnRyb3B5IHNvdXJjZSwgWmtyIGV4dGVuc2lvbiwgaXMg
c3VwcG9ydGVkCj4gYnkgdGhlIEhBUlQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpz
dHpAMTI2LmNvbT4KCldlIGFyZSBhbHJlYWR5IGRldGVjdGluZyB0aGUgWmtyIGV4dGVuc2lvbiBm
cm9tIHRoZSBJU0Egc3RyaW5nCmluIGZkdF9wYXJzZV9pc2Ffb25lX2hhcnQoKS4gSSBkb24ndCBz
ZWUgYW55IHZhbHVlIGluIHRyYXAtbi1kZXRlY3QKWmtyLgoKUmVnYXJkcywKQW51cAoKPiAtLS0K
PiAgaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCB8ICAzICsrKwo+ICBsaWIvc2JpL3NiaV9o
YXJ0LmMgICAgICAgICAgIHwgMTQgKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2Rp
bmcuaCBiL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBpbmRleCA0MGE4NTRlMy4uOGNh
NjA3YzAgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+ICsrKyBi
L2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBAQCAtMjYxLDYgKzI2MSw5IEBACj4gICNk
ZWZpbmUgQ1NSX0ZSTSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgMHgwMDIKPiAgI2Rl
ZmluZSBDU1JfRkNTUiAgICAgICAgICAgICAgICAgICAgICAgMHgwMDMKPgo+ICsvKiBVc2VyIGVu
dHJvcHkgc291cmNlICovCj4gKyNkZWZpbmUgQ1NSX1NFRUQgICAgICAgICAgICAgICAgICAgICAg
IDB4MDE1Cj4gKwo+ICAvKiBVc2VyIENvdW50ZXJzL1RpbWVycyAqLwo+ICAjZGVmaW5lIENTUl9D
WUNMRSAgICAgICAgICAgICAgICAgICAgICAweGMwMAo+ICAjZGVmaW5lIENTUl9USU1FICAgICAg
ICAgICAgICAgICAgICAgICAweGMwMQo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0LmMg
Yi9saWIvc2JpL3NiaV9oYXJ0LmMKPiBpbmRleCAxYjUwZjY3MS4uZWU2NTUzNzUgMTAwNjQ0Cj4g
LS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCj4gKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCj4gQEAg
LTk4Myw2ICs5ODMsMjAgQEAgX19wbXBfc2tpcDoKPgo+ICAjdW5kZWYgX19jaGVja19leHRfY3Ny
Cj4KPiArI2RlZmluZSBfX2NoZWNrX2V4dF9jc3JfdyhfX2Jhc2VfcHJpdiwgX19jc3IsIF9fdmFs
LCBfX2V4dCkgICAgICAgICAgICBcCj4gKyAgICAgICBpZiAoaGZlYXR1cmVzLT5wcml2X3ZlcnNp
b24gPj0gX19iYXNlX3ByaXYpIHsgICAgICAgICAgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICBjc3Jfd3JpdGVfYWxsb3dlZChfX2NzciwgJnRyYXAsIF9fdmFsKTsgICAgICAgICAgICAgICAg
IFwKPiArICAgICAgICAgICAgICAgaWYgKCF0cmFwLmNhdXNlKSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19zYmlfaGFy
dF91cGRhdGVfZXh0ZW5zaW9uKGhmZWF0dXJlcywgICAgICAgICAgXAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2V4dCwgdHJ1ZSk7ICAgICAg
IFwKPiArICAgICAgIH0KPiArCj4gKyAgICAgICAvKiBEZXRlY3QgaWYgaGFydCBzdXBwb3J0cyBa
a3IgKGVudHJvcHkgc291cmNlKSAqLwo+ICsgICAgICAgX19jaGVja19leHRfY3NyX3coU0JJX0hB
UlRfUFJJVl9WRVJfVU5LTk9XTiwKPiArICAgICAgICAgICAgICAgICAgICAgICBDU1JfU0VFRCwg
MCwgU0JJX0hBUlRfRVhUX1pLUik7Cj4gKwo+ICsjdW5kZWYgX19jaGVja19leHRfY3NyX3cKPiAr
Cj4gICNkZWZpbmUgX19jaGVja19jc3JfZXhpc3RlbmNlKF9fY3NyLCBfX2Nzcl9pZCkgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ICAgICAgICAgY3NyX3JlYWRfYWxsb3dlZChfX2NzciwgJnRy
YXApOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgICAgICAgIGlmICghdHJh
cC5jYXVzZSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBc
Cj4gLS0KPiAyLjQ3LjMKPgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L29wZW5zYmkK
