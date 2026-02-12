Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BB3DEE3695
	for <opensbi@archiver.kernel.org>; Thu, 12 Feb 2026 15:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pxouUe1TbUN+VAcxZS6TWhf8YcXOIDYUFuDhvpCy38=; b=D46oksnXzbW8MH
	//0ZbVMYBBWppBuIGDwREQ1zoo0jmNqaMBHchl8mzb5oc5ad7P8wyVOVjNF2dDS7cnPcdHm0pzqJi
	59zl/NIFvN5IMjq1+4EesCTNoiKnTiuprQFkLr8JjMW0YdeOZXT1BeSJ+dGtz/q8hfVnKQOBJo76j
	IS55kaHvCctLaMQP96H/sdadD4/90f+K7S5DjX8WnNS3+yxfkCp9hdKb2wjg7c5MGl9XQSn2CGyeb
	4rJIe5c4mvceib0cQzRSQvgwTTUjzkTq6LSa3pTZ/Y2HKCnkkoyTGxICkM+rpgc2tg+1A3GvmnkSC
	7dtvMbdVzg4tje8J3Giw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYnq-00000002Haz-2P50;
	Thu, 12 Feb 2026 15:40:26 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqYnl-00000002HaG-1mrZ
	for opensbi@lists.infradead.org;
	Thu, 12 Feb 2026 15:40:24 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-59e5f52b13eso1913793e87.2
        for <opensbi@lists.infradead.org>; Thu, 12 Feb 2026 07:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770910819; cv=none;
        d=google.com; s=arc-20240605;
        b=PIzCmqAiWdDmMp66hwaFf8ORaKLOwKcWOf9gk1KwpO38IcRp4lBfnK9s6lEffiRoLC
         J0+QUajsmzPkaaXOJUT1TI24v1IXyasTB6+ddT6fq4BaKb4VmObVBEfrwHc72BklxLJG
         /X2am7qRAxjXlbcXOCAY0h4gmlYjA+1vu5rXFcvz08quXiOeZRVl23bFVWSXEGAmhHNg
         Bxzex03QDrkEohoSViJrfou6E/Pcf7eAItROsqoSp0GRL9uhutNdXE9xyfUf3hxPGXll
         daWmX3A4qO9zkpy9fVAnfmITagHlU9tekME9XozwQKFeXmWmgoIZqdDSuhtWeRQZl/3X
         1bPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G2RU+o0uLtnQ2flMO1AQOCxKy1w3knAZaNWB6GWRejA=;
        fh=XzTRPKqT7q2PShjE56ydneTkbGd9bDksKIjEyTx3Pbg=;
        b=clxQ6KWl0gGuC7luHicdYinI8jGUJpw49P524EK3hqXXTM4xXEeHujftS+UT3qIyll
         zpQ7QM6pW6ovB1j7tSSL5BSQPMM/kLsDWnWaccmxbI4E/RpJDnrcYnEESRvG7or9qrea
         CSlphJw/UeXBzjwHxjiVcOgTJu/keLRUJTFeGN8+z7RB+7hYG/hBBhN7RHI11a3l0S8z
         p8tcjwaTGxe0rgQ1rN4hxih08g7iqSfkjMv5t5jYb38dTBOqdK/hlwNnV6faVqieV8Q9
         ExR6pwwsvXzNgjfYlQzlnVqG0WB8+hb32Fe/zsnNVjyt6rUMsCgsxZcLLcGczERxcH9v
         N/Ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1770910819; x=1771515619; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2RU+o0uLtnQ2flMO1AQOCxKy1w3knAZaNWB6GWRejA=;
        b=iaNn7JG1zQML6VkB54jA1x3m1f+S6ZGLjKDvVyw5oZW+5298HbjEe7NQ0OQ5rc3MPJ
         R6juspv5bO+ozQVhCSwfPuaKYXX3xzlf15QdY/406R/TVRHsGznpczF3G6qM84EL4DlX
         g9gKEQnaleGMltyw9XtxHIDmhzk/afu8WI0Lb9gKlGTWiMlK/6uHM2lvLiLX1LYiD7Ln
         H5cBTfigElb5p9Blo1XoT44bI0vNCop/9BMD0J7YwmDFFaAYy7s0eAQokKEkXIoMRZfy
         JE4xkis9U+/afZCsPQxrOyvIXy4gSXyOwV8HiMIuA8NXOS79sDCZR8Fv+cBxOaFeU14O
         dsiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910819; x=1771515619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G2RU+o0uLtnQ2flMO1AQOCxKy1w3knAZaNWB6GWRejA=;
        b=DaYtRwsCTBpAP9+IrNuqN+xZNC4v/JimNtbwt+y2O7Cn0syO99vxQSCbHa8EiI2CjS
         hqlnE1znf1n67PP6YNsU3lO82IOJ+Sc6NeogZCLWb8eXOYnX2qwsAAAqb1AKHhf9DpTL
         PEU4VCdnpXxzuoj9Md2019GLd4Ir3ZF4pBFeKriDEWeKFmjCMdaQuYJIJtUyvXtKhWkb
         pLws4mehRbz8NJvxL4Mgox3CjCv3UozCjvswtzpARODeI2ONIMrQyH9V6dTKXFAru7f/
         65PYB6XgWE+mZbxefLMQuUPjfiEkRbhsY8sxuszP7JDRwiwr+H4dKf04xF6U95SMzq3z
         CHNw==
X-Forwarded-Encrypted: i=1; AJvYcCUkdWXl7NvAKnouW6bS6UZ7/LIYJb1DXEJIikNb82GEP6a2qcb2eiCuq6QmulPXrPwUxI5XWHeR@lists.infradead.org
X-Gm-Message-State: AOJu0YzwyapeIxn8ugYozKNJoWKWIaK9dKYa9LBfwmKlTbE57Whbr/mM
	/Wt2ndfAMqdKqAQfz7L3hsdf5BIf2yA9ODmq+pkrtxHNhkqRJ/hUEBeM6iwuvUvK93UMHguWmgP
	/G/edqgiTpBcTbi9raW0bJSWvZih0MJHOtNVRxX1Zig==
X-Gm-Gg: AZuq6aKzrUnGXelHENEr6qZAIcSHQ2AROY0kHJ+mEqqKp/vLRp6FAm5ic9SvuWF1Lij
	ndV3EiIhfI7M2bFiykaGfaoK0jcPPse2SMqTxu3k7pjWplRnIWdo8i4iiKTzJY9nyGRFOfT4Q2o
	mGS0imFu1WhEFApGuP9uu+WAbCOKirfAnOJMy6dujwb2npTR1DK34T/1L2SV042RSIwKD5WT5Sj
	5tS1OxW1GrogXO61SfZR6cw77lK1CL9ud4gBOclmp5dex8kBoryLQQT0mOJpmCNXhW7W3mTCYJk
	l4QjNpY6eYoaimdLs63MfCBgJCC1l9rBRMhP2YlI+w==
X-Received: by 2002:a05:6512:3a86:b0:59d:e774:db0e with SMTP id
 2adb3069b0e04-59e640343f3mr1181039e87.23.1770910819049; Thu, 12 Feb 2026
 07:40:19 -0800 (PST)
MIME-Version: 1.0
References: <20260211100010.4082-1-dave.patel@riscstar.com>
 <CAK9=C2UN2kAhXx0RvL07T+a31bYKS=sOnHhmkOBpkmXKproxMg@mail.gmail.com> <CAL2H45cQm_O-K-6weC-xeGNB0+yCHjQe1msS+JwHdKLKecM5CA@mail.gmail.com>
In-Reply-To: <CAL2H45cQm_O-K-6weC-xeGNB0+yCHjQe1msS+JwHdKLKecM5CA@mail.gmail.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 12 Feb 2026 21:10:05 +0530
X-Gm-Features: AZwV_QgL6KZVZ5PuQBDzDG7Ld2usB1l6LogBcEepQnGipoi5BaPXDhvedWQtCDE
Message-ID: <CAK9=C2XLsvs45jAtORxucWDskvz4q_X9FUgoaPJ9Kiqt3=V6XQ@mail.gmail.com>
Subject: Re: [PATCH] Trap and Emulate changes
To: Scott Bambrough <scott@riscstar.com>
Cc: dave.patel@riscstar.com, opensbi@lists.infradead.org, 
	Ray Mao <raymond.mao@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>, 
	Anup Patel <anup.patel@qti.qualcomm.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anuppate@qti.qualcomm.com>, Dhaval <dhaval@rivosinc.com>, 
	Peter Lin <peter.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_074021_508766_2967DDCE 
X-CRM114-Status: GOOD (  19.30  )
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

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgODozOOKAr1BNIFNjb3R0IEJhbWJyb3VnaCA8c2NvdHRA
cmlzY3N0YXIuY29tPiB3cm90ZToKPgo+IElzIFBNUCB1bml2ZXJzYWxseSBhdmFpbGFibGU/CgpZ
ZXMsIFBNUCBpcyBub3QgdW5pdmVyc2FsbHkgYXZhaWxhYmxlIHBsdXMgd2UgbWlnaHQKbm90IGhh
dmUgZW5vdWdoIFBNUCByZWdpb25zLgoKQ2xlYW5lciBhcHByb2FjaCBpcyB0byB1c2UgYW4gImVj
YWxsIiBiYXNlZCBwYXJhdmlydAppbnRlcnJ1cHQgY29udHJvbGxlci4KClJlZ2FyZHMsCkFudXAK
Cj4gU2NvdHQKPgo+IE9uIFRodSwgRmViIDEyLCAyMDI2IGF0IDk6NTjigK9BTSBBbnVwIFBhdGVs
IDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFdlZCwgRmViIDExLCAy
MDI2IGF0IDM6MzDigK9QTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+IHdyb3RlOgo+PiA+Cj4+
ID4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4+ID4KPj4gPiBT
aWduZWQtb2ZmLWJ5OiBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPj4gPiAt
LS0KPj4gPiAgbGliL3NiaS9zYmlfaWxsZWdhbF9pbnNuLmMgfCAyNSArKysrKysrKysrKysrKysr
KysrKysrKystCj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCj4+ID4KPj4gPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaWxsZWdhbF9pbnNuLmMg
Yi9saWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYwo+PiA+IGluZGV4IGZhODIyNjRhLi44ODA3OWUz
OSAxMDA2NDQKPj4gPiAtLS0gYS9saWIvc2JpL3NiaV9pbGxlZ2FsX2luc24uYwo+PiA+ICsrKyBi
L2xpYi9zYmkvc2JpX2lsbGVnYWxfaW5zbi5jCj4+ID4gQEAgLTExMCwxMCArMTEwLDMzIEBAIHN0
YXRpYyBpbnQgc3lzdGVtX29wY29kZV9pbnNuKHVsb25nIGluc24sIHN0cnVjdCBzYmlfdHJhcF9y
ZWdzICpyZWdzKQo+PiA+ICAgICAgICAgcmV0dXJuIDA7Cj4+ID4gIH0KPj4gPgo+PiA+ICtzdGF0
aWMgaW50IHNiaV9nZXRfZW11bGF0ZWRfaXJxX2luc24odWxvbmcgaW5zbiwgc3RydWN0IHNiaV90
cmFwX3JlZ3MgKnJlZ3MpCj4+ID4gK3sKPj4gPiArICAgICAgIHVsb25nIHJzMV92YWwgICA9IEdF
VF9SUzEoaW5zbiwgcmVncyk7Cj4+ID4gKyAgICAgICB1bG9uZyByczJfdmFsICAgPSBHRVRfUlMy
KGluc24sIHJlZ3MpOwo+PiA+ICsgICAgICAgLy91bG9uZyBwcmV2X21vZGUgPSBzYmlfbXN0YXR1
c19wcmV2X21vZGUocmVncy0+bXN0YXR1cyk7Cj4+ID4gKyAgICAgICB1bG9uZyBpcnFfdmFsOwo+
PiA+ICsKPj4gPiArICAgICAgIC8qCj4+ID4gKyAgICAgICAvLyBUaGlzIGlzIHdlcmUgdGhlIGVt
dWFsdGVkIGlycSB2bGF1ZSBpcyBmZXRjaGVkCj4+ID4gKyAgICAgICBpZiAocHJldl9tb2RlID09
IFBSVl9TICYmIHNiaV9lbXVsYXRlX2lycV9yZWFkKCZpcnFfdmFsKSkKPj4gPiArICAgICAgICAg
ICAgICAgcmV0dXJuIHRydWx5X2lsbGVnYWxfaW5zbihpbnNuLCByZWdzKTsKPj4gPiArICAgICAg
ICovCj4+ID4gKwo+PiA+ICsgICAgICAgLy8gRm9yIHRlc3RpbmcKPj4gPiArICAgICAgIGlycV92
YWwgPSByczFfdmFsICsgcnMyX3ZhbDsKPj4gPiArCj4+ID4gKyAgICAgICBTRVRfUkQoaW5zbiwg
cmVncywgaXJxX3ZhbCk7Cj4+ID4gKwo+PiA+ICsgICAgICAgcmVncy0+bWVwYyArPSA0Owo+PiA+
ICsKPj4gPiArICAgICAgIHJldHVybiAwOwo+PiA+ICt9Cj4+ID4gKwo+PiA+ICBzdGF0aWMgY29u
c3QgaWxsZWdhbF9pbnNuX2Z1bmMgaWxsZWdhbF9pbnNuX3RhYmxlWzMyXSA9IHsKPj4gPiAgICAg
ICAgIHRydWx5X2lsbGVnYWxfaW5zbiwgLyogMCAqLwo+PiA+ICAgICAgICAgdHJ1bHlfaWxsZWdh
bF9pbnNuLCAvKiAxICovCj4+ID4gLSAgICAgICB0cnVseV9pbGxlZ2FsX2luc24sIC8qIDIgKi8K
Pj4gPiArICAgICAgIHNiaV9nZXRfZW11bGF0ZWRfaXJxX2luc24sICAgLyogMiAqLwo+Pgo+PiBX
ZSBjYW4ndCBwaWNrIGFyYml0cmFyeSBpbnN0cnVjdGlvbiBlbmNvZGluZyBmb3IKPj4gdHJhcC1u
LWVtdWxhdGlvbiBvZiBhbiBpbnRlcnJ1cHQgY29udHJvbGxlci4KPj4KPj4gSWYgdGhlIGdvYWwg
aXMgdG8gdHJhcC1uLWVtdWxhdGUgYW4gTU1JTyBkZXZpY2UKPj4gdGhlbiB1c2UgUE1QIGJhc2Vk
IGFjY2VzcyBmYXVsdHMuCj4+Cj4+IFJlZ2FyZHMKPj4gQW51cAoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
