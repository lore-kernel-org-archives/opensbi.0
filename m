Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C22EF606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 06:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=pUFDwtxz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=i8bFBYJt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R4qnb1sHsNrtyg6eJ+X6h0SeAipCJM053JKgNej5zrQ=; b=pUFDwtxzEez888ojwLB6i3LeL6
	iF+1Ql4BinbeedUDlA2ssaus0/mSOAafopK6DPYI6w5R72iwselpkWzWspsCW2C/vXQb9HJWYTJ/f
	WT41kgrNeXvFtquaJsk5RfE18CH8p2FxmmAzarlo0xqZE0HwECpiTlGdT7VmrsXCqNmkDovWj6/3O
	COnzu139nkWctFyXh0xNru4G/IiprQnsTxo4paOdQiJ3n3QXImHcpi6RrJth8J/7KPSBspY4wGPoT
	g1X8mLZLlp9iNNSXpEDCGEROc19kyopyrl9IVbTBXWpGV3oy6QP4YHSv5DSUW7OA8/EM8egIx1tsp
	26yLUyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8U6-0000000FYuL-1sHn;
	Fri, 23 Oct 2026 06:10:34 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8U3-0000000FYtn-3K7C
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 06:10:33 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-48c4d870d54so287213f8f.2
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 23:10:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792735830; cv=none;
        d=google.com; s=arc-20260327;
        b=M8HNyjxIzxnAKbVtmg3BwTMLeZiKA93F0voizE9e5sFDUY+4r27v3TfbQ1CkaMmzKJ
         1FnE9CQn6tQXZ2GAFJEhCGE7sRoKAj/psdsVHzkMTWcSw6R7Fs2SyHig/4TkK/BHpNFB
         yzpWRgwJCBKXdy7TpFGXWZuBcL1zc5dCeakZzJZSuRNxYkjikjoKOV4Q+WHlm7Wj4MT8
         071uJUEjS1rTYFVyKLI6rdSp8BEk1BBGm+eRTjrwMvCRvLlP37iTVQNpK9EVDEbuZx+E
         r2TDJXtM+X0Vv5HpX85CY+0RDORAGJiR3CdHa4evzuerN/njrKO2XRXwEYw5auy8ekgG
         qgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FcE/WDhm78ALCH3gcgabOkLR3LCOGYCPkSL602PRL44=;
        fh=DvUZaCZeGFM/iKDgemEdcvjZTXBGU6zmoXACXNg+ctg=;
        b=JBcwoDx8MQxIcVNFpzNvlj33IfB/6o2myNiGaFnMQCgpJCdtXGrhGRYcS31Ajexnp2
         REhfhgUB0kVsRxqAp7Tr8UkYKTsTPn7aDu2SxPaQ6lXvWbKsMJ7BSFG/OwRlINam5atT
         RpGWvu/wLP/vPLzg/f+38g8zxawYbFVqAdSZ2+Z6fm5LzgznuRUjpI0Tv2rTuz5v0qD7
         yJbhRD00swjd0v0AHfb5vW0nkwjceksF0p1LHpron58XhPeH7dVwXdSDsMLFuSo16+0u
         ZQkAJ8TnIyGAGjL9WeJHu1jygmoiEkQsj8j7Ydgn+zihDNDVc5jtfY2QBORcIAlfEVZU
         zP5g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792735830; x=1793340630; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcE/WDhm78ALCH3gcgabOkLR3LCOGYCPkSL602PRL44=;
        b=i8bFBYJtx4bssLnLVBTHeiJNZRsZzgAUWpkAY5MwHEC93oxa72Fr/w7rheS8gMsqs5
         7vXX2UsWW30U2RC6R578t+444nGEWGtfbJDHEju9ztc4VH1Z/SPk9j2iEFLoCyzJsSCq
         AOnZMmQol4ysybUOo6+A/nOMEJ/kwVbCDiNJ0mVlbtDbwxEwzvmiRV6Sx6dBsbKVcS14
         2k0+OnAISQEo8HoBfp+dsWIlR+GkZugpgVO4UhWUDWupKMJ3Z7vbnmQfe8vgUb6E9ZCI
         WVrBrf8YXvybWnhHen7u2fLvRdFOcgYGpTvyOWWjTQHk2w6bmX/04wCTEs8f+8Cd9M9p
         DqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792735830; x=1793340630;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcE/WDhm78ALCH3gcgabOkLR3LCOGYCPkSL602PRL44=;
        b=Usux8KY3pghaQOmVgctghEzEG9wCbeg9XquKktEWjI9O0eQ+xPnKrE1t7nSIMg5X6Z
         HSNQOsmFKeygMw2ll4ovhebCtaxPl9Kc3CPCBvKKs9fE0at+4zhby9RJyDKLq3VOv2Kd
         5BrX25UR2KqvH6sZoRQkMBnPXYfdzhhuze5xNvZLiF0ksAuPhu7VS5G8UDX0Yg4iLe9W
         sgQgHEc66h/HJHOhhXcl/EyszXIf9wghU/33zqc7kuI/e03GxOvKWScvHHo0ftMmiwiP
         Yh+pAulRiOcBgm2U88V/Fv/gH2r6vnUlju7sVdmExtdA3/3Nn73TJzQX6X1GyBFccsSC
         K88A==
X-Gm-Message-State: AFq9FYIy7jlWMOZwLHSlCZRugAMSvtecF/N8TfbmE5J7Zixp0W6SdZAH
	frXNjIIoSIGzWbuN90Dd4EpJNjaaQbHi590TT7QDUbG1UqZH/OD91LKqtRN1YcKExsvOtJrF3yn
	D69sg2JhBzsnfIAX8DnRBCgXtSWXJ2QDhZ6+QmmITnKcAwGIrvD7K3ik=
X-Gm-Gg: AYBFou2wwNxMGF2ocXUbeNZAuBcxi1OzCmSUvh23j63L0i1du645M797d2aFmDBuH1S
	7ODR0ERldQPmqpwiV5Nr5/w71R9wB1AfNLl68sSiczY8oU+7aS7JCN0yQm+jcoRnvXJy28iC2yN
	fLoU9XSftHKURlpkYwrAO1nReRUkdHuwX61YI2r0yErv4vvIuGcSj6T5a5uVcZXEQbhR0A8+W5r
	eP4QVG7R48Mq4XoaxQ3N361WB3XB81X8POrqRWLf9VUHxIftdO13no8NZkMmCU57UPe0ql8Yeeo
	IgelIhBN2Mbg2DFriENftUiCdvRF/0qcWkcARmxDaobV+hRhPwo7HdEEX6QVNonsLsuT55cZYDd
	ss8ke7fgjhSBeLnMTd1vXFIXt/XrYFeQzebCVkMX9VLpUp8B3QCYj+FAJQpNat0mVwlr1r0RrCy
	5T7oMq7dIhCSyhvi62lxinO8RVMmmjQ4Ard2YC/0RWHkU1AmF6Zb+OmpBOFPaeszUFGHbKP77Jj
	vKgUw==
X-Received: by 2002:a5d:5d0b:0:b0:48d:ee0d:8b3d with SMTP id
 ffacd0b85a97d-48e387c354amr1531657f8f.28.1792735829570; Thu, 22 Oct 2026
 23:10:29 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022234135.324887-1-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261022234135.324887-1-theodoruswensanfebruanto025@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 11:40:17 +0530
X-Gm-Features: AclHuK-cpgWPSEFXF9defHvz-w-eMNkRBobY0viURuHl7048IUioJr5cTlQ35Bo
Message-ID: <CAAhSdy1+N8S+K8qAj3LrGpwmnGpY7umC57hi8Hh+nPy02j8-XA@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: Preserve vl and vtype during domain switches
To: whensun <theodoruswensanfebruanto025@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_231031_874146_CDE05528 
X-CRM114-Status: GOOD (  15.49  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgNToxMeKAr0FNIHdoZW5zdW4KPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gU2F2ZSB2bCBhbmQgdnR5cGUgYXMg
cGFydCBvZiB0aGUgVmVjdG9yIGRvbWFpbiBjb250ZXh0Lgo+Cj4gUmVzdG9yZSBib3RoIENTUnMg
dXNpbmcgdnNldHZsIGFmdGVyIHJlc3RvcmluZyB0aGUgVmVjdG9yIHJlZ2lzdGVyCj4gZmlsZS4g
UmVzdG9yZSB2c3RhcnQgYWZ0ZXIgdnNldHZsIGJlY2F1c2UgVmVjdG9yIGNvbmZpZ3VyYXRpb24K
PiBpbnN0cnVjdGlvbnMgcmVzZXQgdnN0YXJ0Lgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29t
L3Jpc2N2LXNvZnR3YXJlLXNyYy9vcGVuc2JpL2lzc3Vlcy80MzQKPiBTaWduZWQtb2ZmLWJ5OiB3
aGVuc3VuIDx0aGVvZG9ydXN3ZW5zYW5mZWJydWFudG8wMjVAZ21haWwuY29tPgoKRXhwYW5kIHlv
dXIgb3RoZXIgc2VyaWVzICJQcmVzZXJ2ZSBtb3JlIFMvSFMgYXJjaGl0ZWN0dXJhbCBzdGF0ZQph
Y3Jvc3MgZG9tYWluIHN3aXRjaGVzIiB0byBpbmNsdWRlIHRoaXMgcGF0Y2ggYXMgd2VsbC4KCkJl
dHRlciB0byBjYWxsIHRoYXQgc2VyaWVzICJQcmVzZXJ2ZSBtb3JlIGFyY2hpdGVjdHVyYWwgc3Rh
dGUgYWNyb3NzCmRvbWFpbiBzd2l0Y2hlcyIuCgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfdmVj
dG9yLmggfCAgMiArKwo+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgfCAxMSArKysrKysrKysr
Kwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9p
bmNsdWRlL3NiaS9zYmlfdmVjdG9yLmggYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmgKPiBpbmRl
eCBjMTRmMzE3NC4uNDgwZjlhYzMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX3ZlY3Rv
ci5oCj4gKysrIGIvaW5jbHVkZS9zYmkvc2JpX3ZlY3Rvci5oCj4gQEAgLTE1LDYgKzE1LDggQEAK
PiAgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCB7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHZj
c3I7Cj4gICAgICAgICB1bnNpZ25lZCBsb25nIHZzdGFydDsKPiArICAgICAgIHVuc2lnbmVkIGxv
bmcgdmw7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZ0eXBlOwo+Cj4gICAgICAgICAvKiBzaXpl
IGRlcGVuZHMgb24gVkxFTiAqLwo+ICAgICAgICAgdWludDhfdCB2cmVnc1tdOwo+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV92ZWN0b3IuYyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4gaW5kZXgg
MWY5ZTAxY2YuLjUzYzJlNWE3IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4g
KysrIGIvbGliL3NiaS9zYmlfdmVjdG9yLmMKPiBAQCAtMzMsNiArMzMsOCBAQCB2b2lkIHNiaV92
ZWN0b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpkc3QpCj4gICAgICAgICAvKiBT
dGVwIDI6IFNhdmUgQ1NScyAqLwo+ICAgICAgICAgZHN0LT52Y3NyID0gY3NyX3JlYWQodmNzcik7
Cj4gICAgICAgICBkc3QtPnZzdGFydCA9IGNzcl9yZWFkKHZzdGFydCk7Cj4gKyAgICAgICBkc3Qt
PnZsID0gY3NyX3JlYWQodmwpOwo+ICsgICAgICAgZHN0LT52dHlwZSA9IGNzcl9yZWFkKHZ0eXBl
KTsKPgo+ICAgICAgICAgLyogU3RlcCAzOiBTYXZlIHZlY3RvciByZWdpc3RlcnMgKi8KPiAgI2Rl
ZmluZSBTQVZFX1ZSRUcoaSkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4gQEAgLTg2LDYgKzg4LDE1IEBAIHZvaWQgc2JpX3ZlY3Rvcl9yZXN0b3Jl
KGNvbnN0IHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKnNyYykKPgo+ICAgICAgICAgLyogU3Rl
cCAzOiBSZXN0b3JlIENTUidzIGxhc3QgKi8KPiAgICAgICAgIC8qIFJlc3RvcmUgQ1NScyBmaXJz
dCAqLwo+ICsgICAgICAgYXNtIHZvbGF0aWxlKAo+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBw
dXNoXG5cdCIKPiArICAgICAgICAgICAgICAgIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+ICsgICAg
ICAgICAgICAgICAidnNldHZsIHplcm8sICUwLCAlMVxuXHQiCj4gKyAgICAgICAgICAgICAgICIu
b3B0aW9uIHBvcFxuXHQiCj4gKyAgICAgICAgICAgICAgIDoKPiArICAgICAgICAgICAgICAgOiAi
ciIoc3JjLT52bCksICJyIihzcmMtPnZ0eXBlKQo+ICsgICAgICAgICAgICAgICA6ICJtZW1vcnki
KTsKPiArCj4gICAgICAgICBjc3Jfd3JpdGUodmNzciwgICBzcmMtPnZjc3IpOwo+ICAgICAgICAg
Y3NyX3dyaXRlKHZzdGFydCwgc3JjLT52c3RhcnQpOwo+Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0K
PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKUmVnYXJk
cywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
