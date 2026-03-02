Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9261CD58E47
	for <opensbi@archiver.kernel.org>; Mon,  2 Mar 2026 03:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r1QDN9N0nhc/xug0pU70GNuNUySMOtDuNTBN+46RKQg=; b=HQD5AU78sSjOZu
	CDu+W8paCVASJa1wHuT/q6nrMzfgTu7b1CHZUtEiqah7q3yUOohiFCvPlxfMG9AcJdBm7q5TY+MhJ
	vaIYFiB9aron+r0mTMozcTanficB+ooYcTgD6yOFOnbIHLwclWgB8Dt1igUc72p7rHUsCHSLOsV4E
	kKof5MXeOdNOrsQgmtYOVtCTyrkYNzdOcwbXK9xERdhIboakPG7GJW4MFpapnffKZccSIePgwPPGa
	satWywKIjJ5tIN4axGxCyy/TK7Ir0FA/gwelX7QCVEDkcOIR/lvgJ1JhEIKHPyXgFPdGEFAzYrkMY
	TxMi7fjJwEtkEuKFHlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuO6-0000000CE81-1gBh;
	Mon, 02 Mar 2026 03:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuO4-0000000CE7k-3R0o
	for opensbi@bombadil.infradead.org;
	Mon, 02 Mar 2026 03:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R0kueqGYsjD9Fwo4K9H6timJ9lzt3kUaM/4ag4ueoLw=; b=VCdH2UjdOO30xlF8kVlNKI8TAX
	00QbIslHxJp+HuxtSrLJ+oAf6O9JfBveAHYNjzP6lbC4IthYHxXGztbTsp4Pc7nL80OaoR9ZIKWxh
	Xwb16T6syNq8A3cFGxZV0sPk/5yiOLgYvaDQFL3M61v7JUoOoZBSXvOzMz34sxMzEoPm3L4wPQT02
	4ehw3aM8Gwt2NN+9cMQNsunvpP8oPNNUk8IUdy9lqZ3CfG5b90W/XdGYCTRuwsO8E69rOImLtOKAV
	mXDOr8sR9PFrPnv8c8HDvxVofxxKgLIze2MBuONUB2d9pBSZFeQSGA34qL0lPEK7tIL43KMs16axz
	cuOZKJag==;
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwuO1-0000000GlYD-3tjN
	for opensbi@lists.infradead.org;
	Mon, 02 Mar 2026 03:56:03 +0000
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-94dddb3c3f0so992300241.2
        for <opensbi@lists.infradead.org>; Sun, 01 Mar 2026 19:56:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772423759; cv=none;
        d=google.com; s=arc-20240605;
        b=cVmyiQB9ls+3X55xC15TCtD9WLAVYyhpWKgu/w5hDRMIi657NUpYcuO50Q6JoXbSFp
         HffJ9Ic4jNpgpZnBxFzQWaIfCvvWRB75OdP4kz5fKiGYu/mEBuvJ/UIAc2cc1iNOMHgP
         Dp/HzuT35VMXBGLBq8PcAHJDoXmMhQMDMTe/f4lAhf/nYtcvj2klf8G6c7+UCEqv+9hg
         J38eJOzlW/NGda6jTOsP2Fp/M4fWzW61twiguwUPBMGFUhERcm1MN4KKPGz1owekzD3D
         gfYLDpxRAvuL9UwRTDAJhPmZv4mHa7IcQiF4aRsc4OD8nPthj4/ZMRqQlRfN1+FefSwB
         3R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R0kueqGYsjD9Fwo4K9H6timJ9lzt3kUaM/4ag4ueoLw=;
        fh=b/g7bp+g7BjWzIfI3mLeDTHml0ctJAWA3rYN+mZTOjE=;
        b=GReRXtvyQ8RH+tfCbE/lb6MdOxdZTHzeevuecZ0aUJNvucdU0pOKWbqQY7mjfF+XpZ
         Vg+Xh/TFKAYEaCidE9VqHQvBspnIHbjjy746tbBekkxTHIpkbcpQWxknyMRaPTXyoXNU
         veWCcGMhXcXc3qBeTCgkW8R2nGpzoe3YB/SbOniQTHrpIAZZeeO5RzgZX08Z3NZjKg/Z
         fqiPsFW1yJ5TgLEthsg/quv9uHOpCBJQ8h423gMw82j+IKRcqJwkWUha6/BMMdRt6off
         CGwC8WYR+shgskjWEHk5MeweH8JaKAuG3dXwi/eXsVCK/dlRw0Nw6jYCV9YxpaDahxFJ
         FNzw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772423759; x=1773028559; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R0kueqGYsjD9Fwo4K9H6timJ9lzt3kUaM/4ag4ueoLw=;
        b=GDLTQtlFzQGoC710mId7woF7qlYVaBwvwMPWih+4p0Wz1D/iGHYsVLOPw+NRxeJnPN
         pQTFOkYT9NGtv8S01Ilc88HUuqJ+RWboELH9aM6b4AdNhHNVJlus4SpAis1BQNTf5WmC
         M5kdZAbE4DxJBXJpK7NfiD/4vy5sR8fRkAvH9ljcAbU202tLMrrF6aca4j60XPPghRmz
         /BjK6JBNOZgaHMZlVZ4KUEUDbgs6xg5pBnymGki9O0Kq3rZmFnUDKsmcFfBAgKDJpC2j
         CTFNOW5eEifykZ2s6oUAcqADtrGhYLtzcvRfYpKuFVmNTa/0sPLrbHB2jzw2CHwxcit4
         7i4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772423759; x=1773028559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R0kueqGYsjD9Fwo4K9H6timJ9lzt3kUaM/4ag4ueoLw=;
        b=QAeP1R0h/2uR/lgLx02JhRcltURSPqQNZAi9cdfbNxWnG+HwC1G5ygPyafqVRmTfvK
         LfqERbTllwHZeA3Ko/IkUI/FjFDoFOWG5kFFyCtT0/G+9i40sh3BqsqLUWjHZfxBTIGz
         aJF9CddYvm9ndqzLa1MQPylL/++1an7rmuYx+TGbk1mCXBX7cJG4i13cqHAZm7VexXZ6
         p78KIgBlxxZigyW4HDx4X6+Cgq/gBZ1uFabHLuSTLa7fc9BanM7HtJrR254KMbOuMc/7
         +YBU25/Bcglt6kpCYVKGBTJDtuMTzShBfNvhQO7yKS27WbKIdOycsJFPjgfpwQPDiL8q
         RHuQ==
X-Gm-Message-State: AOJu0Yy6yP1399zCb2Z29zCnaY2+ep9ECiJTVdug12lHtKVWZsxCLxGY
	fgbzw0ZfMYcu8HthNCpsB8nggtSxopeejbwW53m/W5qvMdNGudwqVAQOhaga8MHnqK3pGtmAHC1
	mhlUQ7OQptFb2IDYX2ySL1Uhf4sn9bP+uXgChC/Ci5g==
X-Gm-Gg: ATEYQzwIxroTGwfQJ2qxy/cmf3qW5IODIL6JviYI2zOGfVhZFkLNQYhjd7l23qPLMnu
	1e8E1zU31UihUUGC/T8EAZw65lW2m65ktYThrNQtDudjyr7MWaslvuxwFa68kB03cBKPHHnHjf6
	b4GyY9t+IzDgSc0a/x82k/BhIvL3DYNDPty4zD7Uar0mrgYoIcHYDi4AeBsAXOuZlglk0ZBq9HE
	r04U1YM7q2T6ZFzypbQiXy09FsKE8luBU1b8Y3iUs8h7oPbZ3JgQVWhhiPODAAsbpSHITDXpqX9
	0h5M4VqS5A==
X-Received: by 2002:a05:6102:3746:b0:5db:fe0d:7fd5 with SMTP id
 ada2fe7eead31-5ff32341b95mr4400787137.10.1772423759492; Sun, 01 Mar 2026
 19:55:59 -0800 (PST)
MIME-Version: 1.0
References: <20260129-smrnmi-v3-v1-0-5d297d3e2027@sifive.com>
 <20260129-smrnmi-v3-v1-3-5d297d3e2027@sifive.com> <DG4K5AOGY1J9.1BWQ6O7XEY7S1@qti.qualcomm.com>
In-Reply-To: <DG4K5AOGY1J9.1BWQ6O7XEY7S1@qti.qualcomm.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 2 Mar 2026 11:55:43 +0800
X-Gm-Features: AaiRm513HmWPh1ZXBni14fgIPejc30do1yw5dwio_8Fn96kNn3ZERT8f35Mng_A
Message-ID: <CAHh=Yk-qMtg7y1PVaWqyBSOg6fOAh2iaWFkf=9+RgJqV5u581A@mail.gmail.com>
Subject: Re: [PATCH 3/3] firmware: fw_base.S: Add common NMI trap handler
To: Radim Krcmar <rkrcmar@qti.qualcomm.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>, Zong Li <zong.li@sifive.com>, 
	Nick Hu <nick.hu@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_035602_197813_82E72415 
X-CRM114-Status: GOOD (  13.52  )
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

UmFkaW0gS3JjbWFyIDxya3JjbWFyQHF0aS5xdWFsY29tbS5jb20+IOaWvCAyMDI25bm0MuaciDLm
l6XpgLHkuIAg5LiL5Y2IMTA6NDnlr6vpgZPvvJoKPgo+IDIwMjYtMDEtMjlUMDA6MTM6NDMtMDg6
MDAsIE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT46Cj4gPiBBZGQgcm5taV9oYW5k
bGVyIGFzc2VtYmx5IHdyYXBwZXIgYW5kIHNiaV9ybm1pX3RyYXBfaGFuZGxlciBkZWZhdWx0Cj4g
PiBDIGhhbmRsZXIuIFRoZSBkZWZhdWx0IGhhbmRsZXIgcHJpbnRzIGRpYWdub3N0aWNzIGFuZCBo
YW5ncyB0aGUgaGFydC4KPiA+Cj4gPiBDby1kZXZlbG9wZWQtYnk6IFpvbmcgTGkgPHpvbmcubGlA
c2lmaXZlLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFpvbmcgTGkgPHpvbmcubGlAc2lmaXZlLmNv
bT4KPiA+IFN1Z2dlc3RlZC1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gU3Vn
Z2VzdGVkLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPiA+
IFNpZ25lZC1vZmYtYnk6IE55bG9uIENoZW4gPG55bG9uLmNoZW5Ac2lmaXZlLmNvbT4KPiA+IFNp
Z25lZC1vZmYtYnk6IFlvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+Cj4g
PiAtLS0KPiA+IGRpZmYgLS1naXQgYS9maXJtd2FyZS9md19iYXNlLlMgYi9maXJtd2FyZS9md19i
YXNlLlMKPiA+IEBAIC02NDMsNiArNjQzLDcwIEBAIG1lbWNtcDoKPiA+ICsgICAgIC5zZWN0aW9u
IC5lbnRyeSwgImF4IiwgJXByb2diaXRzCj4gPiArICAgICAuYWxpZ24gNAo+ID4gKyAgICAgLmds
b2JsIHNiaV9ybm1pX3ZlY3Rvcgo+ID4gK3NiaV9ybm1pX3ZlY3RvcjoKPiA+ICsgICAgIC8qIFN3
YXAgU1Agd2l0aCBNTlNDUkFUQ0ggKi8KPiA+ICsgICAgIGNzcnJ3ICAgc3AsIENTUl9NTlNDUkFU
Q0gsIHNwCj4gPiArCj4gPiArICAgICAvKiBBbGxvY2F0ZSBzcGFjZSBmb3IgZnVsbCB0cmFwIHJl
Z2lzdGVycyBzdHJ1Y3R1cmUgKi8KPiA+ICsgICAgIGFkZGkgICAgc3AsIHNwLCAtKFNCSV9UUkFQ
X1JFR1NfU0laRSkKPgo+IFsyLzNdIGRpZDoKPgo+ICAgICAgICAgcm5taV9jb250ZXh0X29mZnNl
dCA9IHNiaV9zY3JhdGNoX2FsbG9jX29mZnNldChTQklfVFJBUF9SRUdTX1NJWkUpOwo+ICAgICAg
ICAgcm5taV9jdHggPSBzYmlfc2NyYXRjaF9vZmZzZXRfcHRyKHNjcmF0Y2gsIHJubWlfY29udGV4
dF9vZmZzZXQpOwo+ICAgICAgICAgcm5taV9zcCAgPSAodW5zaWduZWQgbG9uZylybm1pX2N0eCAr
IFNCSV9UUkFQX1JFR1NfU0laRTsKPiAgICAgICAgIGNzcl93cml0ZShDU1JfTU5TQ1JBVENILCBy
bm1pX3NwKTsKPgo+IFdlIGNhbiBhdm9pZCB0aGUgYWRkL3N1YnRyYWN0IGRhbmNlLCBzaW5jZSBp
dCBwcm9kdWNlcyBybm1pX2N0eC4KPiBBIGJpZ2dlciBpc3N1ZSBpcyB0aGF0IGl0IGxlYXZlcyAw
IGJ5dGVzIGZvciB0aGUgc3RhY2sgb2YgdGhlIGNhbGxiYWNrLgo+Cj4gSXMgdGhlcmUgYSByZWFz
b24gbm90IHRvIHJldXNlIHRoZSBleGlzdGluZyBNLW1vZGUgc3RhY2s/Cj4KPiBUaGFua3MuCkhp
IFJhZGltCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpSZWdhcmRpbmcgeW91ciBxdWVzdGlv
biAiSXMgdGhlcmUgYSByZWFzb24gbm90IHRvIHJldXNlIHRoZSBleGlzdGluZwpNLW1vZGUgc3Rh
Y2s/IjoKCldlIGNhbm5vdCByZXVzZSB0aGUgTS1tb2RlIHN0YWNrIGJlY2F1c2UgUk5NSSBjYW4g
aW50ZXJydXB0IE0tbW9kZSBjb2RlIGl0c2VsZgpJZiBSTk1JIHJldXNlcyB0aGUgTS1tb2RlIHN0
YWNrLCBpdCB3b3VsZCBjb3JydXB0IHRoZSBpbnRlcnJ1cHRlZApNLW1vZGUgZnVuY3Rpb24ncyBz
dGFjayBmcmFtZS4KCllvdSdyZSBhYnNvbHV0ZWx5IHJpZ2h0IGFib3V0IHRoZSBzdGFjayBzcGFj
ZSBpc3N1ZS4KClRoZSBjdXJyZW50IGNvZGUgYWxsb2NhdGVzIG9ubHkgU0JJX1RSQVBfUkVHU19T
SVpFICgyODAgYnl0ZXMpLApsZWF2aW5nIDAgYnl0ZXMgZm9yIHRoZSBDIGhhbmRsZXIuCgpJJ2xs
IGZpeCB0aGlzIGJ5IGFsbG9jYXRpbmcgYWRkaXRpb25hbCBzdGFjayBzcGFjZToKCiNkZWZpbmUg
Uk5NSV9TVEFDS19TSVpFICAyMDQ4CiNkZWZpbmUgUk5NSV9DT05URVhUX1NJWkUgIChTQklfVFJB
UF9SRUdTX1NJWkUgKyBSTk1JX1NUQUNLX1NJWkUpCnJubWlfY29udGV4dF9vZmZzZXQgPSBzYmlf
c2NyYXRjaF9hbGxvY19vZmZzZXQoUk5NSV9DT05URVhUX1NJWkUpOwpybm1pX3NwID0gKHVuc2ln
bmVkIGxvbmcpcm5taV9jdHggKyBSTk1JX0NPTlRFWFRfU0laRTsKClRoaXMgZ2l2ZXMgdGhlIEMg
aGFuZGxlciAyMDQ4IGJ5dGVzIG9mIHN0YWNrIHNwYWNlIHdoaWxlIGtlZXBpbmcgdGhlCnJlZ2lz
dGVyIHNhdmUgYXJlYSBzZXBhcmF0ZS4KCkRvZXMgdGhpcyBhcHByb2FjaCBzb3VuZCByZWFzb25h
YmxlIHRvIHlvdT8KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVu
c2JpCg==
