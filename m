Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12011CA5FA2
	for <opensbi@archiver.kernel.org>; Mon, 28 Sep 2026 12:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UXXhyNqTsZbLJ2ihqXRFsA5EF+nAnISiD2+xCYLqV10=; b=xBZI8+eNXjnwpG
	gFa1jMmevwMgBJ3BIR30P2dDBLQaWhZEJnkkFryiavrcxkf9Fonm0uErp+p0q5+2RvkMSNEByjHcy
	7WdLPga5w5cbANdT6egTsEsGfT11O/H5FAqjzmg0hci4UrjuXbP/lU3wdlo+Q+Hzegkbd3/nqHDES
	bQ81PDtsHfg4KoSIt+sb+44v7yUPau32LVoByEHhpPeu7qZQtc2Ur1rQqsxVCOHKXso/RIqBpGznq
	FahPprsbF1PjOu5+R0v1FBbTX4qOsPTjem6rsRuiDkk1JbAM7a+pPnvvAdaz+jvndiIBZuoJqdhOw
	rvt5M4U2FO5wVlX0cJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAdj-00000000Zq4-3tYe;
	Mon, 28 Sep 2026 12:39:27 +0000
Received: from mail-wr2-x0e.google.com ([2a00:1450:4864:30::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAdi-00000000ZpB-0DRO
	for opensbi@lists.infradead.org;
	Mon, 28 Sep 2026 12:39:27 +0000
Received: by mail-wr2-x0e.google.com with SMTP id ffacd0b85a97d-48884b0219bso1250017f8f.2
        for <opensbi@lists.infradead.org>; Mon, 28 Sep 2026 05:39:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790599164; cv=none;
        d=google.com; s=arc-20260327;
        b=HduadD9UM8iNr0q9NHL5dUaYLq9BrnG2+I38HgpmWSrvAcjgqhr7ODz9Drj2jIbNIg
         +BwhYXesB0vLETX5FiahFlKXCQD+bTvdXyTr0d8rLqPhluSSFGfdgjERTjP5xADA7LtP
         XFgLVOpMmr3qIIdzxPKLKVecEx2ToRXY0t7jCEZ2JxMicjaNJ93TfqI9uX2CUKVtMEbj
         pkIus8COaLu10heFl8dsmZyj5j8mR56C8zNj1GOrhLPJNzb3VLOVofkRb6yknzE+SGut
         jHhpQ8QAVuhu7gdP/i6MKjOJECj5ENHTGd8kTLOfWDFQcjUv7ORbWswSAk0BLRB1pPsz
         B83g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EU75UPuA7Nrixt8JS/+rFIB7/yyz0FfKE6yoFwAzg8A=;
        fh=81DTbTHFVIppoiQdeYn186cyNjRcPJUSmDPZml6tE4U=;
        b=rca9B+aAhq10yFpFFx7CXoZYUnXZjl4sp6IQQjtm7QRLhjMFUzwJr09eHqTo9ZHOWQ
         mFk97mWfPEDQqTHqJuw89m8lcEemFDPOAp7EnawwqWQ8gW8H4hFvo7Qqop7nh8ZHemz1
         f/k4W4gUHQjxZy8SJ2RFD394aWKOVSd+bDDDxUHq9/p7tJNq+ntFifjnmu9b/e9vQLmS
         wL26MHhYDt3LPxFWtSVIUNGAG5CX2xi+tEW0NmnxqUU+XEUC9qDFdaOms92qo9hbH54u
         E07kENZlD0/nSiat0PlISx5UJXRhyaunY7Bvj+HccVd/YD8Qvj+LhaDbgppoo7UnylPZ
         BuoA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790599164; x=1791203964; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EU75UPuA7Nrixt8JS/+rFIB7/yyz0FfKE6yoFwAzg8A=;
        b=jd4OUVaMz2cMcNjojKCIjGYKSiTs2hjwLVK4yBEEIKN+/06vXAG9IFo0vv6ovYG/Xz
         GgbpCwXeUGiRX7uVrmzbWISN1xh00/YVfhrJCbx3MZAUQL8z3GIZ7ju3DSpfFS6O8vNK
         mCX+As6lYs+xDyXOWkEqI8prOxKCNLCNxKzuryv8RfWQKbE25FXfvRtuXoc1y0FBlZef
         K+O2dZKPMcDPZMVqEXD/XSCsnN9UxZ3gOj6y0S23OdOLmAuxxo1fO5T1EKNFQ/Hyel78
         dIh2OtUL1TZQ3aICzxcp8zgO3+d1H7vJtjG2JT+3wWkuZQfXu4MobFG6Jkjgng4+79O3
         fSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790599164; x=1791203964;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EU75UPuA7Nrixt8JS/+rFIB7/yyz0FfKE6yoFwAzg8A=;
        b=TrJSgDY973IVIWGbfUgMFl28aN0vjxsoW0GZivsaR43rM7hQgatTqWbNeKgPpx0QD1
         0STzrkAlro+iOUQLPGdAZYKJOf5cICJxOLkzv1aX/n/l9YxyByhScQR3mybKLdpPnR/9
         38ppI7l7d8EUMs/tJl1XXYkNUWLDbreJXpnRvSDASaTQElcZ1IJyYnuOgvc0RbQQtD93
         wKB1CUURWw6dq8wQPor7WayEj/MONGgeO+E52eOQJkY7ENpFzFYJd9IBnrrk3HdtsyEG
         mxAK29hrRXb+vHph1mINXC92DRu6h5I/RxvXH2cev1WmmmjjzFHqcv8LBj7jSmMNkEqn
         NacA==
X-Gm-Message-State: AFq9FYIhh2pN+r/vBN39HTwCaD459wWcnRj1uAT2MTVRmD1UXV7HjWmW
	FhfXVysKuLrMMU+lE0eSjmxIAIPDra67t1rksgoibOn/FF9f4rn4VTX4KuM9gISnpWBsUT7Vupf
	YiJxRv1JWiZaBpSAYODSwla4p2uqotJFyqc7hyvDpqpsrj6W4Gxk3
X-Gm-Gg: AYBFou3sGcqbFv8pNYt+CwZEIK3bU1w8HnqQkCUuVSIAnOOyPk4zE6088+YWdty8Esh
	NurTcEcYU6N0Tm8lIfCDKtDRwM5GiJbp7CPtGDAsSxYAZkLK+eCNR3O/nLS+RgB8otWMmAuGToD
	jLY8WAY3ultLlBbgLMfDnFVQ5pLIvlV/2uE9IsXRikEarb9nPRw4f2mHni+g641OlYUv8UNERWk
	c8GAx2yvo1v5l4kxS2sYBrERzqGJyuPZq5lo1OHW8WLSpvn4BDvgDjzbDNyDsavEP11N9XZHi8L
	ROoI01aen0GmPvtR37EMp3VeruyvxD+9NzMddTYDkDXdISOlJI1g0H/kIy/2NmdX9eGLQrz6aA+
	qPojhUizjimPoL6D6xL37p26BH02TCmteaBUquthWcqCnKYgyJ6RIHzNESna1BmDYwr4xQVln9d
	o=
X-Received: by 2002:a5d:584a:0:b0:487:89:bf74 with SMTP id ffacd0b85a97d-4887db4b55bmr18670688f8f.51.1790599163918;
 Mon, 28 Sep 2026 05:39:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-mt2824-pma-v1-1-ada8f836365d@bootlin.com>
In-Reply-To: <20260902-mt2824-pma-v1-1-ada8f836365d@bootlin.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Sep 2026 18:09:11 +0530
X-Gm-Features: AclHuK_jueMnnEkpzi1-W7xKNNE6z-t3BNBaextuGQaH9xqhdL6taFYRwWS-EJo
Message-ID: <CAAhSdy2sZD+1Rt1B6rVEqeaff4grBL5VNzHHOf=HO0S8qX1eNQ@mail.gmail.com>
Subject: Re: [PATCH] platform: generic: metanoia/mt2824: configure PMA for DSP
 memory regions
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: opensbi@lists.infradead.org, 
	=?UTF-8?B?UmFuZG9scGggU2hlbmctS2FpIExpbijmnpfogZblh7Ep?= <randolph@andestech.com>, 
	Jun Chang <jun.chang@metanoia-comm.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_053926_124985_83ABCF2F 
X-CRM114-Status: GOOD (  20.40  )
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

T24gV2VkLCBTZXAgMiwgMjAyNiBhdCA4OjM04oCvUE0gQmVub8OudCBNb25pbiA8YmVub2l0Lm1v
bmluQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IFNldCB1cCB0aGUgbWVtb3J5IGF0dHJpYnV0ZSBm
b3IgdGhlIFhPUiBSQU0sIE1SQVMgbWVtb3J5LCBhbmQgUlNDIHRhYmxlCj4gdXNlZCBieSB0aGUg
RFNQcyBhcyBub24tY2FjaGVhYmxlIGFuZCBidWZmZXJhYmxlIGR1cmluZyBmaW5hbCBpbml0Lgo+
Cj4gU2lnbmVkLW9mZi1ieTogQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmluQGJvb3RsaW4uY29t
PgoKTm8gb25lIGZyb20gQW5kZXMgb3IgTWV0YW5vaWEgY29tbWVudGVkIHNvIEkgZ3Vlc3MgdGhl
eSBhcmUgZmluZSB3aXRoCnRoaXMgcGF0Y2guIEZyb20gbXkgcGVyc3BlY3RpdmUsIHRoaXMgbG9v
a3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQu
b3JnPgoKQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFu
a3MsCkFudXAKCj4gLS0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvbWV0YW5vaWEvbXQyODI0L210Mjgy
NC5jIHwgNDcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgNDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvbWV0
YW5vaWEvbXQyODI0L210MjgyNC5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9tZXRhbm9pYS9tdDI4MjQv
bXQyODI0LmMKPiBpbmRleCBhMzQzMDRiOS4uOTcwZTE1ZTcgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZv
cm0vZ2VuZXJpYy9tZXRhbm9pYS9tdDI4MjQvbXQyODI0LmMKPiArKysgYi9wbGF0Zm9ybS9nZW5l
cmljL21ldGFub2lhL210MjgyNC9tdDI4MjQuYwo+IEBAIC02LDEzICs2LDYwIEBACj4gICAqICAg
ICAgSnVuIENoYW5nIDxqdW4uY2hhbmdAbWV0YW5vaWEtY29tbS5jb20+Cj4gICAqLwo+Cj4gKyNp
bmNsdWRlIDxhbmRlcy9hbmRlc19wbWEuaD4KPiAgI2luY2x1ZGUgPGFuZGVzL2FuZGVzX3BtdS5o
Pgo+ICAjaW5jbHVkZSA8YW5kZXMvYW5kZXNfc2JpLmg+Cj4gICNpbmNsdWRlIDxwbGF0Zm9ybV9v
dmVycmlkZS5oPgo+ICsjaW5jbHVkZSA8c2JpX3V0aWxzL2ZkdC9mZHRfaGVscGVyLmg+Cj4gKwo+
ICsjZGVmaW5lIE1UMjgyNF9YT1JfUkFNX0JBU0UgICAgICAgICAgICAweDAwMTAwMDAwVUxMCj4g
KyNkZWZpbmUgTVQyODI0X1hPUl9SQU1fU0laRSAgICAgICAgICAgIDB4MDAwNDAwMDBVTEwKPiAr
Cj4gKyNkZWZpbmUgTVQyODI0X01SQVNfTUVNX0JBU0UgICAgICAgICAgIDB4NjAwMDAwMDBVTEwK
PiArI2RlZmluZSBNVDI4MjRfTVJBU19NRU1fU0laRSAgICAgICAgICAgMHgyMDAwMDAwMFVMTAo+
ICsKPiArI2RlZmluZSBNVDI4MjRfUlNDVEFCTEVfQkFTRSAgICAgICAgICAgMHg4MTAwMDAwMFVM
TAo+ICsjZGVmaW5lIE1UMjgyNF9SU0NUQUJMRV9TSVpFICAgICAgICAgICAweDAwMDEwMDAwVUxM
Cj4gKwo+ICtzdGF0aWMgY29uc3Qgc3RydWN0IGFuZGVzX3BtYV9yZWdpb24gbWV0YW5vaWFfbXQy
ODI0X3BtYV9yZWdpb25zW10gPSB7Cj4gKyAgICAgICB7Cj4gKyAgICAgICAgICAgICAgIC5wYSA9
IE1UMjgyNF9YT1JfUkFNX0JBU0UsCj4gKyAgICAgICAgICAgICAgIC5zaXplID0gTVQyODI0X1hP
Ul9SQU1fU0laRSwKPiArICAgICAgICAgICAgICAgLmZsYWdzID0gQU5ERVNfUE1BQ0ZHX0VUWVBf
TkFQT1QgfAo+ICsgICAgICAgICAgICAgICAgICAgICAgICBBTkRFU19QTUFDRkdfTVRZUF9NRU1f
Tk9OX0NBQ0hFX0JVRiwKPiArICAgICAgIH0sCj4gKyAgICAgICB7Cj4gKyAgICAgICAgICAgICAg
IC5wYSA9IE1UMjgyNF9NUkFTX01FTV9CQVNFLAo+ICsgICAgICAgICAgICAgICAuc2l6ZSA9IE1U
MjgyNF9NUkFTX01FTV9TSVpFLAo+ICsgICAgICAgICAgICAgICAuZmxhZ3MgPSBBTkRFU19QTUFD
RkdfRVRZUF9OQVBPVCB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIEFOREVTX1BNQUNGR19N
VFlQX01FTV9OT05fQ0FDSEVfQlVGLAo+ICsgICAgICAgfSwKPiArICAgICAgICB7Cj4gKyAgICAg
ICAgICAgICAgIC5wYSA9IE1UMjgyNF9SU0NUQUJMRV9CQVNFLAo+ICsgICAgICAgICAgICAgICAu
c2l6ZSA9IE1UMjgyNF9SU0NUQUJMRV9TSVpFLAo+ICsgICAgICAgICAgICAgICAuZmxhZ3MgPSBB
TkRFU19QTUFDRkdfRVRZUF9OQVBPVCB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgIEFOREVT
X1BNQUNGR19NVFlQX01FTV9OT05fQ0FDSEVfQlVGLAo+ICsgICAgICAgIH0sCj4gK307Cj4gKwo+
ICtzdGF0aWMgaW50IG1ldGFub2lhX210MjgyNF9maW5hbF9pbml0KGJvb2wgY29sZF9ib290KQo+
ICt7Cj4gKyAgICAgICB2b2lkICpmZHQgPSBmZHRfZ2V0X2FkZHJlc3NfcncoKTsKPiArICAgICAg
IGludCByYzsKPiArCj4gKyAgICAgICAvKiBTZXQgdGhlIERTUCBtZW1vcnkgcmVnaW9ucyBhdHRy
aWJ1dGVzICovCj4gKyAgICAgICByYyA9IGFuZGVzX3BtYV9zZXR1cF9yZWdpb25zKGZkdCwgbWV0
YW5vaWFfbXQyODI0X3BtYV9yZWdpb25zLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBhcnJheV9zaXplKG1ldGFub2lhX210MjgyNF9wbWFfcmVnaW9ucykpOwo+ICsgICAg
ICAgaWYgKHJjKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKwo+ICsgICAgICAgcmV0
dXJuIGdlbmVyaWNfZmluYWxfaW5pdChjb2xkX2Jvb3QpOwo+ICt9Cj4KPiAgc3RhdGljIGludCBt
ZXRhbm9pYV9tdDI4MjRfcGxhdGZvcm1faW5pdChjb25zdCB2b2lkICpmZHQsIGludCBub2Rlb2Zm
LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3Qg
ZmR0X21hdGNoICptYXRjaCkKPiAgewo+ICsgICAgICAgZ2VuZXJpY19wbGF0Zm9ybV9vcHMuZmlu
YWxfaW5pdCA9IG1ldGFub2lhX210MjgyNF9maW5hbF9pbml0Owo+ICAgICAgICAgZ2VuZXJpY19w
bGF0Zm9ybV9vcHMuZXh0ZW5zaW9uc19pbml0ID0gYW5kZXNfcG11X2V4dGVuc2lvbnNfaW5pdDsK
PiAgICAgICAgIGdlbmVyaWNfcGxhdGZvcm1fb3BzLnBtdV9pbml0ID0gYW5kZXNfcG11X2luaXQ7
Cj4gICAgICAgICBnZW5lcmljX3BsYXRmb3JtX29wcy52ZW5kb3JfZXh0X3Byb3ZpZGVyID0gYW5k
ZXNfc2JpX3ZlbmRvcl9leHRfcHJvdmlkZXI7Cj4KPiAtLS0KPiBiYXNlLWNvbW1pdDogMzU1MTFi
YzZlZTFjOWMxN2I2YTg5YjQ0YzUyZTIwNDRiYjUxYjk3OQo+IGNoYW5nZS1pZDogMjAyNjA5MDIt
bXQyODI0LXBtYS1mMDljNDk2NWM0ZTkKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IEJlbm/DrnQg
TW9uaW4sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCj4g
aHR0cHM6Ly9ib290bGluLmNvbQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
