Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04DEE606A31A
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Wc8i5R5v;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=jtQbyQnT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GIk2yqG7X4NWLYQuzMrfOs+MOP9A3+ABXuxUEeb64lU=; b=Wc8i5R5v31B3tP8ldZKlUY4fj/
	B2TKoC5jfRwYzDZGcydac6Vj4EifkljXm/qrPvOgEwe5Yxllwbu6Nkmh2VLgklggHBcqn/WZ4Y6LP
	eKnprmxeDV7fCL33dsMcB3DDGv83FSYRcJQpAb+l0IkHpLcFFNNGJHBh5GHxnlu/NF6Y8ldbh63kg
	h3Yc/riDDXJ50DfgaWlGKH5zSEgXD4e1OhNzZaQzL9bJkSCsIGaW4no7lqs99cSwMA+VYImrXIXBC
	qVrFu+KrLqFkofecWh/XJ8heWvcFKhPMfMThEgCHPQqZaVs6CgIqaPEech3gs46BJaqr1QcyMgH4s
	ZHZz532w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM15b-00000006mRR-28oR;
	Wed, 28 Oct 2026 10:41:03 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM15W-00000006mQq-3MAg
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 10:41:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso6969345e9.1
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 03:40:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793184057; cv=none;
        d=google.com; s=arc-20260327;
        b=Mw6dk+UV680xiM26krUacgOqLUSjqiQxyws+ffJRbGqtJsqS/yvbC0foww9w01n2B7
         S2X8cl+mOpmRj1Sigu52IWttgUogHl8bzre7BQzcdt5AHKRWOFor8R1wk2C72WJSQIcC
         0Xi38+vPxOOqqUGqyVBOOcA6NS8ez23DRnugmFRAb1gDB7z9wMsRUpVsQvv9Wxmrf6ev
         LclFgyO83VnZj6DSQiFsb4mkg/7ZB1EqPCLOMdLnSUoAS25dlqV8SoB1LUrY9JwhYBAs
         8mqv9ef8zZzKaenYj7Glq+DTIaSyiMwa9I6FoQbaWBErLkGaNc7DJrSRK5lTzlCH75tU
         KfaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c1ced10ggnAaKb5/j/Gy5DLX6tstvONTEHnMVPIATIg=;
        fh=doSY2OXRqCBe1Hk/jlTZzAHMqA6GPpCBiEL5Jis0ePI=;
        b=jYV6e8me+JWljNv35I9BK6zmxFxKdZV5knSSVF8XMC4K0/nPNibcSggbOhX01yB69u
         LKV7pNodclOCXJAz3nStiqZ4xIWEbDhsR+wHhfTWAgHyBiRUwDS9yoZHWtVIQP8scbRg
         znJxwHmb0QOJRydualTvoTZsl36dK65QZB+RFReZLkXd6fDjvy/6HfuhtzAAdcfAQZ+l
         XH3G7dCoBylJJhO30f+ovYpTkpm/S/N+5Nn97/xWvEJHv5sHyUly6fOS1gtIwl3jAW8T
         rZgM1EhLEUDUkS0aYrnWI2R0sh4ZZfX8wnLeyETlif32vghTYS0+Av3fyv2NgMXxNOwn
         ozBQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793184057; x=1793788857; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c1ced10ggnAaKb5/j/Gy5DLX6tstvONTEHnMVPIATIg=;
        b=jtQbyQnTj73bujIOZBnDuRDnxcdSau2Q3jBFtcFIR/IkypNJ/nZE0DJXVE+qUOrTlw
         I5mkmT5Mcn1KFpltr9VbaQdmlX5mXOql5qc+/IxgBjsQHY0pFMMIoLIqkYmQ8YDtJXUe
         APQrSRhhHWPNR/i65OXy/836tDfXoDqlgxMUuVcVosTke/SZKwpY9fYFgkjJNt9ljwsb
         5JA1NsuGBmn6ezWqGKprqpgFsv0CoYmBUqN18Ap1HCNb2BaHNsrJVNRlYZdhHglS5Rvc
         b9KWXYRZ0ZbMeyur8F0MVERLMFDIRgncEAfuuLbc2Ct+CEOHQpbERy9UxN+haJf3WHrA
         RSog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793184057; x=1793788857;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c1ced10ggnAaKb5/j/Gy5DLX6tstvONTEHnMVPIATIg=;
        b=1pMzz64eeXVwAwd8hNqtl7VNfaLNohHyVTR9BWYJnrTfyRdOLqxKsKP0EZUJItdAWz
         wTGIZYMm+U2PIuOi07G8EnMtEfx2/TUliEOs4ReTUE1bDiF3quuYGLNiTfsusoCQWQi/
         xUO1sRLKB7fCTCcQ5TEEH7z87T4NpGMpuzZW9SlIq6S0+c1YIET2V8pX/kSNGRa/TUtl
         f6MuR4XxvKH6xaMbPFHunTmd7m/y2vYBnJxkT5XMO3vQxIEu+3XmF8AgcL3gRysJhh54
         8wZNulH57/v0wRTYMmvOjFQSEZ9PQh5JPjWOdjuuAwg5HmrIRM8sVQjP0YJtcGYhAafd
         kvAA==
X-Forwarded-Encrypted: i=1; AKwUvBydXTaPzdsNYDBh9DOTfWnhVYLVob7UDJMDyb5KkUg+V1a3UvTiFYfBwPVeS0vCS3CRPva+elDP@lists.infradead.org
X-Gm-Message-State: AFq9FYIh3EoEt+yfqrWZDqI7FORFHrG7jMq3VeTF4Lrt+mJp6TRPSmYd
	+wnMmXw6uQN1V+GqvOM003HQQ6xKrV+ODsfH01TDiKbvW3D8I7OnH/1ugJpO3m1dvQIsaQOotnf
	OZi+XLHct0+4s4dvfrG8cD8RHzdkxMTHkYXIokEiDsA==
X-Gm-Gg: AYBFou3lSkjbFEOVRViopJdnEGIzdLbHxeKSxcSjzMxokyJkvlYuQUIx1JY9sBVdbsp
	Y4WyswQ/R4WLqT1Mg18Ltrxw+09z00kAr4xD54DjO2hTkGVBvXcxmlSyX+0masu7uv1AzII1zju
	Bo/s05fWNh4hDWuG4VQRS01SE0iJVJjVmbfnyNs+BDTmX2SGu7Fko5Um1o/4+BSy9KlkDFt78aY
	kqVpdRTxA2gEZlh8TATKYEfv5OG/hCPeoF9TVoO2h4gGTjeGuXkSnZdCJ/nf5+0cObmUW+ya88c
	xQ3hm2Wg5dEt75AtRCt+2TiQZlldkGNgMEdo6EjdPNUvsB1+W9H8m1LMsenDxtuaFMbb/EHlvGb
	eFGHBzxgIYRDdNH+lwge6xUsZjWQOKLckqUIQWZyhC0A3dN3b6769or6Jv2PMlebBGjKEsyfU0t
	EGr9hKzVV3V1qY9s6/5+FkaeIooTt2FvnK6h1efcw/ktyebIc/PxfVb87b/9pkSi0w7cHcvnMvg
	UxmKQ==
X-Received: by 2002:a05:600c:4ece:b0:4a2:1960:6db with SMTP id
 5b1f17b1804b1-4a9677ca10emr40678205e9.26.1793184056264; Wed, 28 Oct 2026
 03:40:56 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com>
 <20261027083509.1076577-3-peter.lin@sifive.com> <CAAVgOk+Q+MADkOqAc7qBy9=346dMnd3Tq9bE-8+9f9hqaZf5ww@mail.gmail.com>
In-Reply-To: <CAAVgOk+Q+MADkOqAc7qBy9=346dMnd3Tq9bE-8+9f9hqaZf5ww@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:10:44 +0530
X-Gm-Features: AclHuK9BLJoVNinEN59vKs4FdWqxumQkHL-xfqvlLPlwnuYHty-ahVYixcfjpJY
Message-ID: <CAAhSdy1KcLxPodO76WNJD5Y6d54gxmWj=BqAWg3O8Sdgxsvg3g@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] lib: utils: fdt_helper: parse RISC-V Worlds
 per-hart WID properties
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: Yu-Chien Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_034058_913334_477021E6 
X-CRM114-Status: GOOD (  24.42  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMTE6NTLigK9QTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gT24gVHVlLCBPY3QgMjcsIDIwMjYg
YXQgMTozNeKAr0FNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+IHdy
b3RlOgo+ID4KPiA+IEFkZCBmZHRfcGFyc2Vfd29ybGRzX2FsbF9oYXJ0cygpIHRvIHBhcnNlIHBs
YXRmb3JtLWRlZmluZWQgRFQKPiA+IHByb3BlcnRpZXMgaW4gdGhlIC9jcHVzL2NwdUBYOgo+ID4g
LSByaXNjdixwbXdpZDogTS1tb2RlIFdvcmxkIElECj4gPiAtIHJpc2N2LHBtd2lkbGlzdDogYml0
bWFwIG9mIHBlcm1pdHRlZCBNLW1vZGUgV0lEcwo+ID4gLSByaXNjdixwbWx3aWRsaXN0OiBiaXRt
YXAgb2YgcGVybWl0dGVkIGxvd2VyLXByaXZpbGVnZSBXSURzCj4gPiBTdG9yZSBwYXJzZWQgdmFs
dWVzIGluIHN0cnVjdCBzYmlfaGFydF9mZWF0dXJlcy4KPiA+Cj4gPiBUaGVzZSBwbGF0Zm9ybS1k
ZWZpbmVkIHZhbHVlcyBzZXJ2ZSBhcyB0aGUgcm9vdC1vZi10cnVzdCBjb25zdHJhaW50cwo+ID4g
Zm9yIHBlci1kb21haW4gV0lEIGFzc2lnbm1lbnQgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiBhbmQg
Y29udGV4dAo+ID4gc3dpdGNoaW5nLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBl
dGVyIExpbiA8cGV0ZXIubGluQHNpZml2ZS5jb20+Cj4gPiAtLS0KPiA+IENoYW5nZSB2Mi0+djM6
Cj4gPiAtIERyb3AgaGFzX3Btd2lkbGlzdCBwcmVzZW5jZSBmbGFnIGFuZCBjaGVjayBwbXdpZGxp
c3QgZGlyZWN0bHkuCj4gPiAtLS0KPiA+ICBpbmNsdWRlL3NiaS9zYmlfaGFydC5oICAgICAgICAg
ICAgIHwgIDUgKysKPiA+ICBpbmNsdWRlL3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oIHwgIDIg
Kwo+ID4gIGxpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jICAgICAgICAgfCA5MCArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysKPiA+ICBwbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgICAg
ICAgIHwgMTMgKysrKy0KPiA+ICA0IGZpbGVzIGNoYW5nZWQsIDEwOSBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9oYXJ0Lmgg
Yi9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiBpbmRleCAyOTQxODA5ZS4uYTE4NjBhOWMgMTAw
NjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfaGFydC5oCj4gPiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfaGFydC5oCj4gPiBAQCAtMTM1LDYgKzEzNSwxMSBAQCBzdHJ1Y3Qgc2JpX2hhcnRfZmVh
dHVyZXMgewo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgcG1wX2xvZzJncmFuOwo+ID4gICAgICAg
ICB1bnNpZ25lZCBpbnQgbWhwbV9tYXNrOwo+ID4gICAgICAgICB1bnNpZ25lZCBpbnQgbWhwbV9i
aXRzOwo+ID4gKyAgICAgICB1MzIgcG13aWQ7Cj4gPiArICAgICAgIHU2NCBwbXdpZGxpc3Q7Cj4g
PiArICAgICAgIHU2NCBwbWx3aWRsaXN0Owo+ID4gKyAgICAgICBib29sIGhhc19wbXdpZDsKPiA+
ICsgICAgICAgYm9vbCBoYXNfcG1sd2lkbGlzdDsKPiA+ICB9Owo+ID4KPiA+ICBleHRlcm4gdW5z
aWduZWQgbG9uZyBoYXJ0X2ZlYXR1cmVzX29mZnNldDsKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L3NiaV91dGlscy9mZHQvZmR0X2hlbHBlci5oIGIvaW5jbHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9o
ZWxwZXIuaAo+ID4gaW5kZXggNzVhNTY0ZDEuLjNmM2QwOTFiIDEwMDY0NAo+ID4gLS0tIGEvaW5j
bHVkZS9zYmlfdXRpbHMvZmR0L2ZkdF9oZWxwZXIuaAo+ID4gKysrIGIvaW5jbHVkZS9zYmlfdXRp
bHMvZmR0L2ZkdF9oZWxwZXIuaAo+ID4gQEAgLTU2LDYgKzU2LDggQEAgaW50IGZkdF9wYXJzZV90
aW1lYmFzZV9mcmVxdWVuY3koY29uc3Qgdm9pZCAqZmR0LCB1bnNpZ25lZCBsb25nICpmcmVxKTsK
PiA+Cj4gPiAgaW50IGZkdF9wYXJzZV9pc2FfZXh0ZW5zaW9uc19hbGxfaGFydHMoY29uc3Qgdm9p
ZCAqZmR0KTsKPiA+Cj4gPiAraW50IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGNvbnN0IHZv
aWQgKmZkdCk7Cj4gPiArCj4gPiAgaW50IGZkdF9wYXJzZV9nYWlzbGVyX3VhcnRfbm9kZShjb25z
dCB2b2lkICpmZHQsIGludCBub2Rlb2Zmc2V0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fdWFydF9kYXRhICp1YXJ0KTsKPiA+Cj4gPiBkaWZmIC0t
Z2l0IGEvbGliL3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgYi9saWIvdXRpbHMvZmR0L2ZkdF9oZWxw
ZXIuYwo+ID4gaW5kZXggNzQ3YmEwMjguLjQ3MDE2MDZkIDEwMDY0NAo+ID4gLS0tIGEvbGliL3V0
aWxzL2ZkdC9mZHRfaGVscGVyLmMKPiA+ICsrKyBiL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5j
Cj4gPiBAQCAtNDU3LDYgKzQ1Nyw5NiBAQCBpbnQgZmR0X3BhcnNlX2lzYV9leHRlbnNpb25zX2Fs
bF9oYXJ0cyhjb25zdCB2b2lkICpmZHQpCj4gPiAgICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+
Cj4gPiAraW50IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGNvbnN0IHZvaWQgKmZkdCkKPiA+
ICt7Cj4gPiArICAgICAgIHUzMiBoYXJ0aWQ7Cj4gPiArICAgICAgIGNvbnN0IGZkdDMyX3QgKnZh
bDsKPiA+ICsgICAgICAgc3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoOwo+ID4gKyAgICAgICBz
dHJ1Y3Qgc2JpX2hhcnRfZmVhdHVyZXMgKmhmZWF0dXJlczsKPiA+ICsgICAgICAgaW50IGVyciwg
Y3B1X29mZnNldCwgY3B1c19vZmZzZXQsIGxlbjsKPiA+ICsKPiA+ICsgICAgICAgaWYgKCFmZHQp
Cj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gPiArCj4gPiArICAgICAg
IGNwdXNfb2Zmc2V0ID0gZmR0X3BhdGhfb2Zmc2V0KGZkdCwgIi9jcHVzIik7Cj4gPiArICAgICAg
IGlmIChjcHVzX29mZnNldCA8IDApCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGNwdXNfb2Zm
c2V0Owo+ID4gKwo+ID4gKyAgICAgICBmZHRfZm9yX2VhY2hfc3Vibm9kZShjcHVfb2Zmc2V0LCBm
ZHQsIGNwdXNfb2Zmc2V0KSB7Cj4gPiArICAgICAgICAgICAgICAgZXJyID0gZmR0X3BhcnNlX2hh
cnRfaWQoZmR0LCBjcHVfb2Zmc2V0LCAmaGFydGlkKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAo
ZXJyKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPiArCj4gPiArICAg
ICAgICAgICAgICAgaWYgKCFmZHRfbm9kZV9pc19lbmFibGVkKGZkdCwgY3B1X29mZnNldCkpCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+ICsKPiA+ICsgICAgICAgICAg
ICAgICBzY3JhdGNoID0gc2JpX2hhcnRpZF90b19zY3JhdGNoKGhhcnRpZCk7Cj4gPiArICAgICAg
ICAgICAgICAgaWYgKCFzY3JhdGNoKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJu
IFNCSV9FTk9FTlQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgaGZlYXR1cmVzID0gc2JpX2hh
cnRfZmVhdHVyZXNfcHRyKHNjcmF0Y2gpOwo+ID4gKyAgICAgICAgICAgICAgIGlmICghaGZlYXR1
cmVzKQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FTk9FTlQ7Cj4gPiAr
Cj4gPiArICAgICAgICAgICAgICAgdmFsID0gZmR0X2dldHByb3AoZmR0LCBjcHVfb2Zmc2V0LCAi
cmlzY3YscG13aWQiLCAmbGVuKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAodmFsICYmIGxlbiA9
PSBzaXplb2YoZmR0MzJfdCkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGhmZWF0dXJl
cy0+cG13aWQgPSBmZHQzMl90b19jcHUoKnZhbCk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBoZmVhdHVyZXMtPmhhc19wbXdpZCA9IHRydWU7Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwg
InJpc2N2LHBtd2lkbGlzdCIsICZsZW4pOwo+ID4gKyAgICAgICAgICAgICAgIGlmICh2YWwgJiYg
bGVuID09IDIgKiBzaXplb2YoZmR0MzJfdCkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IGhmZWF0dXJlcy0+cG13aWRsaXN0ID0gKCh1NjQpZmR0MzJfdG9fY3B1KHZhbFswXSkgPDwgMzIp
IHwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZk
dDMyX3RvX2NwdSh2YWxbMV0pOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCFoZmVh
dHVyZXMtPnBtd2lkbGlzdCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBz
YmlfcHJpbnRmKCIlczogaGFydCV1IHJpc2N2LHBtd2lkbGlzdCBpcyBlbXB0eVxuIiwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlk
KTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4g
Kwo+ID4gKyAgICAgICAgICAgICAgIHZhbCA9IGZkdF9nZXRwcm9wKGZkdCwgY3B1X29mZnNldCwg
InJpc2N2LHBtbHdpZGxpc3QiLCAmbGVuKTsKPiA+ICsgICAgICAgICAgICAgICBpZiAodmFsICYm
IGxlbiA9PSAyICogc2l6ZW9mKGZkdDMyX3QpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBoZmVhdHVyZXMtPnBtbHdpZGxpc3QgPSAoKHU2NClmZHQzMl90b19jcHUodmFsWzBdKSA8PCAz
MikgfAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZkdDMyX3RvX2NwdSh2YWxbMV0pOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaGZlYXR1
cmVzLT5oYXNfcG1sd2lkbGlzdCA9IHRydWU7Cj4gPiArICAgICAgICAgICAgICAgfQo+ID4gKwo+
ID4gKyAgICAgICAgICAgICAgIC8qIFNhbml0eSBjaGVja3MgKi8KPiA+ICsjaWYgX19yaXNjdl94
bGVuID09IDMyCj4gPiArICAgICAgICAgICAgICAgaWYgKGhmZWF0dXJlcy0+cG13aWRsaXN0ICYm
Cj4gPiArICAgICAgICAgICAgICAgICAgIChoZmVhdHVyZXMtPnBtd2lkbGlzdCA+PiAzMikpIHsK
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3Ys
cG13aWRsaXN0IGhhcyBiaXRzIGJleW9uZCBYTEVOXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkKTsKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsKPiA+
ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1cmVzLT5oYXNfcG1sd2lkbGlzdCAmJgo+ID4gKyAg
ICAgICAgICAgICAgICAgICAoaGZlYXR1cmVzLT5wbWx3aWRsaXN0ID4+IDMyKSkgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgc2JpX3ByaW50ZigiJXM6IGhhcnQldSByaXNjdixwbWx3aWRs
aXN0IGhhcyBiaXRzIGJleW9uZCBYTEVOXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBfX2Z1bmNfXywgaGFydGlkKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJldHVybiBTQklfRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsjZW5kaWYKPiA+
ICsKPiA+ICsgICAgICAgICAgICAgICBpZiAoaGZlYXR1cmVzLT5oYXNfcG13aWQgJiYKPiA+ICsg
ICAgICAgICAgICAgICAgICAgaGZlYXR1cmVzLT5wbXdpZCA+PSBfX3Jpc2N2X3hsZW4pIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG13
aWQgKCV1KSBleGNlZWRzIG1heCBXSURcbiIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF9fZnVuY19fLCBoYXJ0aWQsIGhmZWF0dXJlcy0+cG13aWQpOwo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FSU5WQUw7Cj4gPiArICAgICAgICAgICAgICAg
fQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgIGlmIChoZmVhdHVyZXMtPnBtd2lkbGlzdCAmJiBo
ZmVhdHVyZXMtPmhhc19wbXdpZCAmJgo+ID4gKyAgICAgICAgICAgICAgICAgICAhKGhmZWF0dXJl
cy0+cG13aWRsaXN0ICYgQklUX1VMTChoZmVhdHVyZXMtPnBtd2lkKSkpIHsKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgIHNiaV9wcmludGYoIiVzOiBoYXJ0JXUgcmlzY3YscG13aWQgKCV1KSBu
b3QgaW4gcG13aWRsaXN0XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBfX2Z1bmNfXywgaGFydGlkLCBoZmVhdHVyZXMtPnBtd2lkKTsKPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ID4gKyAgICAgICAgICAgICAgIH0KPiA+ICsg
ICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICByZXR1cm4gMDsKPiA+ICt9Cj4gPiArCj4gPiAgc3Rh
dGljIGludCBmZHRfcGFyc2VfdWFydF9ub2RlX2NvbW1vbihjb25zdCB2b2lkICpmZHQsIGludCBu
b2Rlb2Zmc2V0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1
Y3QgcGxhdGZvcm1fdWFydF9kYXRhICp1YXJ0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGRlZmF1bHRfZnJlcSwKPiA+IGRpZmYgLS1naXQg
YS9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3JtLmMgYi9wbGF0Zm9ybS9nZW5lcmljL3BsYXRmb3Jt
LmMKPiA+IGluZGV4IDFkZjAyODBkLi41MWU5ZjM0MiAxMDA2NDQKPiA+IC0tLSBhL3BsYXRmb3Jt
L2dlbmVyaWMvcGxhdGZvcm0uYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9wbGF0Zm9ybS5j
Cj4gPiBAQCAtMjU1LDExICsyNTUsMjIgQEAgaW50IGdlbmVyaWNfZmluYWxfaW5pdChib29sIGNv
bGRfYm9vdCkKPiA+Cj4gPiAgaW50IGdlbmVyaWNfZXh0ZW5zaW9uc19pbml0KGJvb2wgY29sZF9i
b290KQo+ID4gIHsKPiA+ICsgICAgICAgaW50IHJjOwo+ID4gKwo+ID4gICAgICAgICBpZiAoIWNv
bGRfYm9vdCkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Cj4gPiAgICAgICAgIC8q
IFBhcnNlIHRoZSBJU0Egc3RyaW5nIGZyb20gRkRUIGFuZCBlbmFibGUgdGhlIGxpc3RlZCBleHRl
bnNpb25zICovCj4gPiAtICAgICAgIHJldHVybiBmZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxs
X2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiA+ICsgICAgICAgcmMgPSBmZHRfcGFyc2VfaXNh
X2V4dGVuc2lvbnNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiA+ICsgICAgICAgaWYg
KHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+ICsKPiA+ICsgICAgICAgLyog
UGFyc2UgUklTQy1WIFdvcmxkcyBDUFUgcHJvcGVydGllcyBmcm9tIEZEVCAqLwo+ID4gKyAgICAg
ICByYyA9IGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKGZkdF9nZXRfYWRkcmVzcygpKTsKPiA+
ICsgICAgICAgaWYgKHJjKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiByYzsKPiA+ICsKCkl0
IGlzIGJldHRlciB0byBwYXJzZSBSSVNDLVYgV29ybGRzIHBlci1oYXJ0IFdJRCBwcm9wZXJ0aWVz
CmRpcmVjdGwgZnJvbSBmZHRfcGFyc2VfaXNhX2V4dGVuc2lvbnNfYWxsX2hhcnRzKCkgaW5zdGVh
ZCBvZgphIHNlcGFyYXRlIGZkdF9wYXJzZV93b3JsZHNfYWxsX2hhcnRzKCkgZnVuY3Rpb24uCgpS
ZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
