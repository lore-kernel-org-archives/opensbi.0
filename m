Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D13C61DD3
	for <opensbi@archiver.kernel.org>; Mon, 31 Aug 2026 12:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rg7eeMt5Oe+QSUdkIXhQkdFht+Xx18RsQ2K42DXQXEI=; b=qRfthRzbLUR9WP
	YrS05RrXE96U6qhToppLzRUf6UgIhT2ZB/h6owCLMa+r2+efKSp4I8TdkFAynwkWkJLHUgMBIJYR8
	wf/b1t6IQRiq0aWgKoLji0eBbOclw60QpMYrAeKKzdESTWTOeK2foeWPlZB6BfBXZRVi+KdXM1Zml
	iK144XmGrcjTtGtAZYemHIUzwue5IjQGHY82ez82bkPAKRUFtcPc2C09bfzWFrotOjpoJ982EGFpn
	tl7/Bmqn6WHiQ+gmIU68bDsIE7kgYNKC0AztyxVjCBui1Eo6h5EtLsM/YDWqCGWcYVNpsNyfMZviV
	JQ9UrpBKXSe4/nq3x2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11Iw-00000009JdM-1NNu;
	Mon, 31 Aug 2026 12:40:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11It-00000009JcU-1EiF
	for opensbi@lists.infradead.org;
	Mon, 31 Aug 2026 12:40:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so32506445e9.1
        for <opensbi@lists.infradead.org>; Mon, 31 Aug 2026 05:39:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788179997; cv=none;
        d=google.com; s=arc-20260327;
        b=gM2wjwlMe2W9FMWvwF5fkQ6TyjqaVbs08+iaaaTNNsW4ZFgsdJ9TGfBmk+9jeAqmzi
         gW8y8UvX1lQynCgGb8s0J9gxjTMp1Ie5NF8lP8fpWgzI8ySa4cmz1aoXEsDL/yiwlZ0b
         LdhnFOl/mmSbie06tGlnR6bEu/DSJEuwE6z8YK/aiErPxO3bBOHBEv7OuLXW3jziFcJN
         nNbW3qqboMfAmnpujsh82I2adarwsxjbBc6F/UIpuQlOspy+2kR70Yp4Ny9GfbRtZpqc
         aMrQytMtfSb8J66AXy+Rp6ZYiapLHX1tLuhDMwlox5rc3NxAIKq6LTFCgZGgbgidrJjp
         PclQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Yq4fGoYEQl3efQ3UUervew4/HeU5ksCgl3EQ5FqD3Q4=;
        fh=gwJvkpAVu7kXKVzwi30/01Mz4REuI6CZaTHr5MWrAu0=;
        b=A8v+koBigAaTvK/jY7Lahk6BacVIWwVcFJmqkPVVvf+Yw+c8apivnw9GFxg+HIMIj9
         I/yRZednF2KrcxCtwHhIjosFpjEhNd33wAxj3xgKb4SJ5GH4S6duWcLzUL1Nh4eIm052
         P7roZGoPC3lvM0DX3E9xM7U/yqFYFJGqruBxlvzBNdrueC8UifYX97ZmIomROi0G89ei
         DBUyamztvSjN7ylVuOBFLyynCUAfgCSEx3DVDtagB1hQ0oyPNz/0bP9VZZIWrRxqpmH+
         3+Ao+GHGflB6w35qj1ATVnBqOaGyxDXsY//Cf+Od2PBnzRQFMDBAJFqUcZmawcLOAWo6
         V0Yg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788179997; x=1788784797; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Yq4fGoYEQl3efQ3UUervew4/HeU5ksCgl3EQ5FqD3Q4=;
        b=DYHwly6lbPttnzuHnCA7K1G4LfE64W75igZ1xlHxdo4CB0IqbI+XgHeN2hZ3FA1yuD
         RSEA+ed54EPtKoeZkPQiNjNL81ujughPaOe3Nsz1RLmCcH9yc3hggEFweza62T9PcFG1
         APuugNk6UqWXgBIaVR1I8ZzT48HSwtF/kLQ2LY7jzp2c/GGoh+ZSQS/uanfaylsxtQ7p
         mUK+uNTU8wuigNlycKu4ajgs53Xd599n6BqnyCqGMMxdPO+FK4bv54QNWDeFDNRR07gY
         uAPPuvuqkUtmNXWhx3R8bvFgwjI9w13NectpGD63OUgBvIS9jLREbU7SXGj7bBe61H+/
         QsmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788179997; x=1788784797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yq4fGoYEQl3efQ3UUervew4/HeU5ksCgl3EQ5FqD3Q4=;
        b=hlCMSHiUVCVL1r+U/RRT99G0Q23n1gPicMn1SDJGg+GDtJsdWZtVa389dPL36FNVbr
         1igGQVtphrYJreNhB1W4OWK0Imfhc89F0iyBBtEIzQsSPgVapFPYkdFwf7ogcs1lbXt+
         Td63cSgufszyIoYTv9pKUHHLZOjQ5xzQ/GpI7eab/msA3Xw18R9j3Xbu2NDUAm2SDJQZ
         HmKE9QzwBpz6Ady+LsoeDJkyItOSs2hhxV35YEFpFaIzd33hH5ZYn2adKmN779rLvwM1
         C/ndZfBVw9FEPP9W/ZZgVW1bCP0tH6Var9k4hgZWdp146SWi+6wDNSgt2ERj4YoBgiM1
         jJbw==
X-Gm-Message-State: AFuF++n/kbxgJ6cFmohsaKYXHpX0tnJ5aIwbb8NuZwCmzAcfZUALEH3L
	jSlrHA7V1Qh+eyM+9FydITQBmjsKqhyrfPdeZo867GPpjC5E6qkgKl4lLF1+ZfY4pmp9WEopMfz
	DwkeFAsk4/F3IO/PxRVFkqs/ppssiTpb3Q1Xjz1SndA==
X-Gm-Gg: AR+sD12TsfJlBaJyignseKdvlxdGNdXHvSR8XuuAEhKXVw+6sdPBFXFgJMa9q8ItJex
	jvO7TlZ/XDdw67ana1erG5BF9Qz0XRdnAFtLjS1lEbUKUGSoYavaxdGpIW2qqRL5lnfMHMINdwR
	UTkbvwTVV47K622tzBzrfPc8rfSQYw8w9Zz4HMmg4Tra0gq9UDROm9M8JqcaFJVMBv2ORRNyxQk
	CBwciVN36jKymHpwsBoR8wuEz+7YDigrC2oJ/gLlvT5CWNryo9zdjgx9+Y9zm7We7GHVxJRrkJE
	uBvVSHCWbnxzj6EhBKjo6QiwA1OpqLEMCTqUDAtk3AYfptsqibGg1AcISJyzB3SDMzSIv5rgTH8
	mPdQnYzXeMzk3pn1iMxhAVvsrohRhFEVrhebdkYcorz3D+RariVLOH7xFsH4+KfB9LGbL5A8oSW
	4=
X-Received: by 2002:a05:600c:34d2:b0:49c:cbad:1c44 with SMTP id
 5b1f17b1804b1-49ccbad1cf1mr290689565e9.6.1788179996683; Mon, 31 Aug 2026
 05:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260719101125.190314-1-pyudistira519@gmail.com>
In-Reply-To: <20260719101125.190314-1-pyudistira519@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 31 Aug 2026 18:09:43 +0530
X-Gm-Features: AcwNN1XQXcdWJqV2djBtH2wGmnaqNMLY30N1LDzC_byhKukzBiJ416vxhQTt92s
Message-ID: <CAAhSdy3e0jCWyeQedoe3uuTxNtj05a6sw0wNxFE1Veb=XxsZJw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: clamp sbi_ecall_get_extensions_str buffer offset
To: Yudistira Putra <pyudistira519@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_053959_472736_FE30AC95 
X-CRM114-Status: GOOD (  24.05  )
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

T24gU3VuLCBKdWwgMTksIDIwMjYgYXQgMzo0NeKAr1BNIFl1ZGlzdGlyYSBQdXRyYSA8cHl1ZGlz
dGlyYTUxOUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gc2JpX2VjYWxsX2dldF9leHRlbnNpb25zX3N0
cigpIGFkdmFuY2VkIG9mZnNldCBieSB0aGUgbm9taW5hbCBleHRlbnNpb24KPiBuYW1lIGxlbmd0
aCB3aXRob3V0IGNoZWNraW5nIHJlbWFpbmluZyBjYXBhY2l0eS4gV2hlbiB0aGUgY2FsbGVyIGJ1
ZmZlcgo+IHdhcyBzbWFsbGVyIHRoYW4gdGhlIGNvbmNhdGVuYXRlZCBleHRlbnNpb24gbGlzdCwg
b2Zmc2V0IGNvdWxkIHBhc3MKPiBleHRzX3N0cl9zaXplLCBzbyAoZXh0c19zdHJfc2l6ZSAtIG9m
ZnNldCkgYmVjYW1lIG5lZ2F0aXZlIGFuZCB3YXMKPiBwYXNzZWQgdG8gc2JpX3NucHJpbnRmKCkg
YXMgYSBsYXJnZSB1MzIsIGFuZCB0aGUgdHJhaWxpbmcgTlVMIHdyaXRlCj4gY291bGQgc3RlcCBw
YXN0IHRoZSBjYWxsZXIgYnVmZmVyLgo+Cj4gVGhlIGhlbHBlciBjYW4gd3JpdGUgYmV5b25kIGEg
Y2FsbGVyLXByb3ZpZGVkIGRlc3RpbmF0aW9uIHdoZW4gdGhlCj4gcmVnaXN0ZXJlZCBleHRlbnNp
b24gbGlzdCBleGNlZWRzIHRoZSBzdXBwbGllZCBjYXBhY2l0eS4KPgo+IE1pcnJvciB0aGUgZ3Vh
cmQgYWxyZWFkeSB1c2VkIGJ5IHNiaV9oYXJ0X2dldF9leHRlbnNpb25zX3N0cigpOiBzdG9wCj4g
YXBwZW5kaW5nIHdoZW4gdGhlIG5leHQgbmFtZSB3b3VsZCBub3QgZml0LiBBZGQgYW4gU0JJVU5J
VCByZWdyZXNzaW9uCj4gdGhhdCByZWdpc3RlcnMgc2V2ZXJhbCBleHRlbnNpb25zIGludG8gYSAx
Ni1ieXRlIGJ1ZmZlciB3aXRoIGEgcmVkem9uZQo+IGFuZCB2ZXJpZmllcyBubyBvdXQtb2YtYm91
bmRzIHdyaXRlLgo+Cj4gQ2xvc2VzOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytc29mdHdhcmUt
c3JjL29wZW5zYmkvaXNzdWVzLzQxNgo+IFNpZ25lZC1vZmYtYnk6IFl1ZGlzdGlyYSBQdXRyYSA8
cHl1ZGlzdGlyYTUxOUBnbWFpbC5jb20+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwg
PGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29w
ZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9zYmlfZWNhbGwuYyAg
ICAgICAgICAgIHwgIDIgKysKPiAgbGliL3NiaS90ZXN0cy9zYmlfZWNhbGxfdGVzdC5jIHwgNTkg
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDYx
IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9lY2FsbC5jIGIvbGli
L3NiaS9zYmlfZWNhbGwuYwo+IGluZGV4IDc0NWZhMzEuLjY1YzVhNTUgMTAwNjQ0Cj4gLS0tIGEv
bGliL3NiaS9zYmlfZWNhbGwuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2VjYWxsLmMKPiBAQCAtNjYs
NiArNjYsOCBAQCB2b2lkIHNiaV9lY2FsbF9nZXRfZXh0ZW5zaW9uc19zdHIoY2hhciAqZXh0c19z
dHIsIGludCBleHRzX3N0cl9zaXplLCBib29sIGV4cGVyaQo+ICAgICAgICAgc2JpX2xpc3RfZm9y
X2VhY2hfZW50cnkodCwgJmVjYWxsX2V4dHNfbGlzdCwgaGVhZCkgewo+ICAgICAgICAgICAgICAg
ICBpZiAoZXhwZXJpbWVudGFsICE9IHQtPmV4cGVyaW1lbnRhbCkKPiAgICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgICAgaWYgKG9mZnNldCArIHNiaV9zdHJs
ZW4odC0+bmFtZSkgKyAxID4gZXh0c19zdHJfc2l6ZSkKPiArICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPiAgICAgICAgICAgICAgICAgc2JpX3NucHJpbnRmKGV4dHNfc3RyICsgb2Zmc2V0
LCBleHRzX3N0cl9zaXplIC0gb2Zmc2V0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IiVzLCIsIHQtPm5hbWUpOwo+ICAgICAgICAgICAgICAgICBvZmZzZXQgPSBvZmZzZXQgKyBzYmlf
c3RybGVuKHQtPm5hbWUpICsgMTsKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS90ZXN0cy9zYmlfZWNh
bGxfdGVzdC5jIGIvbGliL3NiaS90ZXN0cy9zYmlfZWNhbGxfdGVzdC5jCj4gaW5kZXggNWI2Y2Uz
Ny4uZjVjNTUzZSAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3Rlc3RzL3NiaV9lY2FsbF90ZXN0LmMK
PiArKysgYi9saWIvc2JpL3Rlc3RzL3NiaV9lY2FsbF90ZXN0LmMKPiBAQCAtNDAsMTAgKzQwLDY5
IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2JpX2VjYWxsX3JlZ2lzdGVyX2ZpbmRfZXh0ZW5zaW9uKHN0
cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzCj4gICAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0
ZXN0LCBzYmlfZWNhbGxfZmluZF9leHRlbnNpb24oU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQp
LCBOVUxMKTsKPiAgfQo+Cj4gK3N0YXRpYyB2b2lkIHRlc3Rfc2JpX2VjYWxsX2dldF9leHRlbnNp
b25zX3N0cl9ib3VuZHMoc3RydWN0IHNiaXVuaXRfdGVzdF9jYXNlICp0ZXN0KQo+ICt7Cj4gKyAg
ICAgICBzdHJ1Y3Qgc2JpX2VjYWxsX2V4dGVuc2lvbiBlMSA9IHsKPiArICAgICAgICAgICAgICAg
LmV4dGlkX3N0YXJ0ID0gU0JJX0VYVF9FWFBFUklNRU5UQUxfU1RBUlQsCj4gKyAgICAgICAgICAg
ICAgIC5leHRpZF9lbmQgPSBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCwKPiArICAgICAgICAg
ICAgICAgLm5hbWUgPSAiQWxwaGEiLAo+ICsgICAgICAgICAgICAgICAuaGFuZGxlID0gZHVtbXlf
aGFuZGxlciwKPiArICAgICAgICAgICAgICAgLmV4cGVyaW1lbnRhbCA9IGZhbHNlLAo+ICsgICAg
ICAgfTsKPiArICAgICAgIHN0cnVjdCBzYmlfZWNhbGxfZXh0ZW5zaW9uIGUyID0gewo+ICsgICAg
ICAgICAgICAgICAuZXh0aWRfc3RhcnQgPSBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFSVCArIDEs
Cj4gKyAgICAgICAgICAgICAgIC5leHRpZF9lbmQgPSBTQklfRVhUX0VYUEVSSU1FTlRBTF9TVEFS
VCArIDEsCj4gKyAgICAgICAgICAgICAgIC5uYW1lID0gIkJyYXZvIiwKPiArICAgICAgICAgICAg
ICAgLmhhbmRsZSA9IGR1bW15X2hhbmRsZXIsCj4gKyAgICAgICAgICAgICAgIC5leHBlcmltZW50
YWwgPSBmYWxzZSwKPiArICAgICAgIH07Cj4gKyAgICAgICBzdHJ1Y3Qgc2JpX2VjYWxsX2V4dGVu
c2lvbiBlMyA9IHsKPiArICAgICAgICAgICAgICAgLmV4dGlkX3N0YXJ0ID0gU0JJX0VYVF9FWFBF
UklNRU5UQUxfU1RBUlQgKyAyLAo+ICsgICAgICAgICAgICAgICAuZXh0aWRfZW5kID0gU0JJX0VY
VF9FWFBFUklNRU5UQUxfU1RBUlQgKyAyLAo+ICsgICAgICAgICAgICAgICAubmFtZSA9ICJDaGFy
bGkiLAo+ICsgICAgICAgICAgICAgICAuaGFuZGxlID0gZHVtbXlfaGFuZGxlciwKPiArICAgICAg
ICAgICAgICAgLmV4cGVyaW1lbnRhbCA9IGZhbHNlLAo+ICsgICAgICAgfTsKPiArICAgICAgIGNo
YXIgc3RvcmFnZVsxNiArIDE2XTsKPiArICAgICAgIGNoYXIgKmJ1ZiA9IHN0b3JhZ2U7Cj4gKyAg
ICAgICBjaGFyIGJpZ1sxMjhdOwo+ICsgICAgICAgaW50IGk7Cj4gKyAgICAgICBpbnQgZm91bmRf
YWxwaGEgPSAwOwo+ICsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNUX0VRKHRlc3QsIHNiaV9lY2Fs
bF9yZWdpc3Rlcl9leHRlbnNpb24oJmUxKSwgMCk7Cj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9F
USh0ZXN0LCBzYmlfZWNhbGxfcmVnaXN0ZXJfZXh0ZW5zaW9uKCZlMiksIDApOwo+ICsgICAgICAg
U0JJVU5JVF9FWFBFQ1RfRVEodGVzdCwgc2JpX2VjYWxsX3JlZ2lzdGVyX2V4dGVuc2lvbigmZTMp
LCAwKTsKPiArCj4gKyAgICAgICBmb3IgKGkgPSAxNjsgaSA8IDMyOyBpKyspCj4gKyAgICAgICAg
ICAgICAgIHN0b3JhZ2VbaV0gPSAoY2hhcikweEE1Owo+ICsKPiArICAgICAgIC8qIFVuZGVyc2l6
ZWQgYnVmZmVyIG11c3Qgbm90IHdyaXRlIHBhc3QgdGhlIGNhbGxlci1wcm92aWRlZCBzaXplLiAq
Lwo+ICsgICAgICAgc2JpX2VjYWxsX2dldF9leHRlbnNpb25zX3N0cihidWYsIDE2LCBmYWxzZSk7
Cj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBidWZbMTVdLCAnXDAnKTsKPiArICAg
ICAgIGZvciAoaSA9IDE2OyBpIDwgMzI7IGkrKykKPiArICAgICAgICAgICAgICAgU0JJVU5JVF9F
WFBFQ1RfRVEodGVzdCwgKHVuc2lnbmVkIGNoYXIpc3RvcmFnZVtpXSwgMHhBNSk7Cj4gKwo+ICsg
ICAgICAgLyogTmVnYXRpdmUgY29udHJvbDogcm9vbSBmb3IgdGhlIGZ1bGwgbGlzdCwgaW5jbHVk
aW5nIHJlZ2lzdGVyZWQgbmFtZXMuICovCj4gKyAgICAgICBzYmlfZWNhbGxfZ2V0X2V4dGVuc2lv
bnNfc3RyKGJpZywgc2l6ZW9mKGJpZyksIGZhbHNlKTsKPiArICAgICAgIFNCSVVOSVRfRVhQRUNU
X05FKHRlc3QsIHNiaV9zdHJsZW4oYmlnKSwgMCk7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBiaWdb
aV0gIT0gJ1wwJzsgaSsrKSB7Cj4gKyAgICAgICAgICAgICAgIGlmIChzYmlfc3RybmNtcCgmYmln
W2ldLCAiQWxwaGEiLCA1KSA9PSAwKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgZm91bmRf
YWxwaGEgPSAxOwo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAg
ICAgICB9Cj4gKyAgICAgICB9Cj4gKyAgICAgICBTQklVTklUX0VYUEVDVF9FUSh0ZXN0LCBmb3Vu
ZF9hbHBoYSwgMSk7Cj4gKwo+ICsgICAgICAgc2JpX2VjYWxsX3VucmVnaXN0ZXJfZXh0ZW5zaW9u
KCZlMSk7Cj4gKyAgICAgICBzYmlfZWNhbGxfdW5yZWdpc3Rlcl9leHRlbnNpb24oJmUyKTsKPiAr
ICAgICAgIHNiaV9lY2FsbF91bnJlZ2lzdGVyX2V4dGVuc2lvbigmZTMpOwo+ICt9Cj4gKwo+ICBz
dGF0aWMgc3RydWN0IHNiaXVuaXRfdGVzdF9jYXNlIGVjYWxsX3Rlc3RzW10gPSB7Cj4gICAgICAg
ICBTQklVTklUX1RFU1RfQ0FTRSh0ZXN0X3NiaV9lY2FsbF92ZXJzaW9uKSwKPiAgICAgICAgIFNC
SVVOSVRfVEVTVF9DQVNFKHRlc3Rfc2JpX2VjYWxsX2ltcGlkKSwKPiAgICAgICAgIFNCSVVOSVRf
VEVTVF9DQVNFKHRlc3Rfc2JpX2VjYWxsX3JlZ2lzdGVyX2ZpbmRfZXh0ZW5zaW9uKSwKPiArICAg
ICAgIFNCSVVOSVRfVEVTVF9DQVNFKHRlc3Rfc2JpX2VjYWxsX2dldF9leHRlbnNpb25zX3N0cl9i
b3VuZHMpLAo+ICAgICAgICAgU0JJVU5JVF9FTkRfQ0FTRSwKPiAgfTsKPgo+IC0tCj4gMi40My4w
Cj4KPgo+IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
