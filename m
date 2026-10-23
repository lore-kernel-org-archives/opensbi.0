Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2488606A31A
	for <opensbi@archiver.kernel.org>; Fri, 23 Oct 2026 06:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sU2DlwDK;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=exm42zDi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=dmOvGvqH5R4VzUetOEBFGj7FzBEc0kIVETPGIA8ItT8=; b=sU2DlwDKxuvfrF+svZOm44sHqt
	B6fgx652U3lTcs2q2Yn6+/OJ6CEEQm2CuPuMWbUWb3FaaNesJjJG3hNl8MyMEzdezmCUXBmYMUyxV
	IxFIIGGAG/FlL5kt25onE3D5fzKJwpj0jdqNd5/ilIViV3bQ2nDkvKHGrfRkAvTRsAIv4V5XReTJa
	IAGFNj57R2CiJp2HbNpCVVFFy74L6CSt1ITo1L4Bu2xhBchngqfooZ88MjrJ1q+LiuNKGqWAm7xTK
	J6YneDL/AjXM0ANLu1kCGaD8iBL1zsZ5/Nuu1O14KsARogHysDIPa4Kws21aUKzt/iglVWbf7Nufp
	F7DVsFVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Pj-0000000FYeE-2yct;
	Fri, 23 Oct 2026 06:06:03 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8Pd-0000000FYdX-2RuE
	for opensbi@lists.infradead.org;
	Fri, 23 Oct 2026 06:06:02 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso305462f8f.1
        for <opensbi@lists.infradead.org>; Thu, 22 Oct 2026 23:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792735555; cv=none;
        d=google.com; s=arc-20260327;
        b=Dui0MYTaQvYfQmvuOw4q4e402OpDcOjk7pFGs3ozQySwxxrN/4DfxU48lYaakQ072q
         oVjthF+PUtJFWdA1U1WDEeKR636G0qk/iSMeR7jDNm8tu+7p4f7eIZKz7qBeGDdctf50
         1EJ/4hXQcwYW2bxQrsW0eBLK8yw53SsKNl/da5caAfyooTNAZuzT8Z9UNlHJ+xczkk8o
         oCIkxZ9CTyt8EPYfvNW/1ZEN9k6Z6AZoDGFMq9+YmUL813SUj2wUzEWnLKhUYc1XTDGK
         xEZMGgKnIF1MEKI5rXGi/BPnai7EPPug6JwtUFR9pjRCVPssYcAm8pL5xBrxNAQW2ref
         WZKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntpMZmwWDFzPd5EV/ctkftAiccK/O3qrcYo0DLLE3VA=;
        fh=DvUZaCZeGFM/iKDgemEdcvjZTXBGU6zmoXACXNg+ctg=;
        b=kXpq5OPj/jw+67dJkzE2Rgh1HicDij9d4kgj5nhD6te9AgfSqaCoogGlBzlW+VGkMw
         DorEGg+Aj+WVrYY4tMFPfNQeMxMXGAVuQZXai4StKHZVSoIsHnLrFjAQoxYT+KqrRUwP
         NFtCanXge8KZbbwiWftQobVWKbUGfwyhmNEyJg3PQgaEMkmxmFfu6qQfLoWU7zmm4XUm
         UvYL9WDpMOffkBcka565kcXZEJUnyrBwzsXwx+OMdzCFqJ29waiWx0GbcbBg+qLaXkCL
         CaaylfN53V5Mfdi89wPQs8exVO+F9TWr6f4jjdjrYlII50g+Cvj55tbyBy9yZC/ZPcOE
         W2CA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792735555; x=1793340355; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntpMZmwWDFzPd5EV/ctkftAiccK/O3qrcYo0DLLE3VA=;
        b=exm42zDip9BTG4aPtkgL+bj1OcMXtpHCnnX3VfAHuOa8vl8B1U9j/O0l4YV+VrpGwb
         AF6nzI9n8Ckg/8aHMGB++tuZ5F3D+0GUL7l/1u6Ebte5A+xxzqeynhU/bw9W09IL9LMR
         ne3+GfuaNhqtMSHdm/4AEZSfwKCoeWOoUvd3MqHB4nq7CsUa49e5ZbgmcX/mCPV6EAbY
         hFPI6PvfVsWL42KmsEfEGRRJeRdC5RYfFbmYDHuMLdyv8ex1lr2xaj4PY8ZbAF0AJxIj
         tPccO6c7td0mKwJb2YaV5KLnHgpYaVv4IsdBoUuKpKTN6WxqmtRRqWBF0aHCoiegXz3q
         sAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792735555; x=1793340355;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntpMZmwWDFzPd5EV/ctkftAiccK/O3qrcYo0DLLE3VA=;
        b=l7iQuNr4iuwZMhocKlbIkT/F5Tlc2oTZxG58SYEUbwKLf21vo0izP4+8N8t7al7pXK
         tAGzDpntwTqxV52z2YmXlHylS8A41zOXbOidCFrYUI+9rCeyQJOd+BP05jTjAE6lE3C0
         U+DvjtcpGmCfe7rBvSmUeMqo9X22EDGNSXePcjxuxP2Llw1Fc9cskb70C1FnfDq6vwL4
         Cjybp8vfJnDWimuknHi3RuBbeXwLL1v4oFUCUF7hQNQ8fRe0Bxe/afxITqbImD5sgjhy
         gtSye/7W7bInLfq48/K+skDBpPe55QCEHod8292Kzs/peeUX2lohDcsEMpAGBEP0AutB
         Qafg==
X-Gm-Message-State: AFq9FYJ6JSof/YiVD7EpR2gMiuz+MlDzScFrJkSiD+geA0hHeDq1I/yP
	CfpG3rtzyp8cqRAFftUR7KHU99zNQOMk1QIHdHuA5rSvnB2e8U9qHBQORUE1n+12R5XlO6dfstF
	fiskGSpEGa3sAj3k7C+lP8/AGTZCoXjxxuItRpd6VF0xaywQGAh17
X-Gm-Gg: AYBFou2Opfj3CdVC3ch53+xkhoO6nKUmLPK3mZCgdy4iepeLP+lYtQ68ZlW2DpAsR4C
	BrAQIW7JSac4tRpePjplGnJz7ym66ucTin0Lmp0ff/z0QD2ck/gUnzG0gUWA/x4rw+HODQB8g3f
	IMK/foFF7VaZ13evnIEisLLVmdYSn8sxSAY8BSl1jr57G3Qv321rHb4mwwndJFkNIKFGEYVPhCP
	rpyK/NmREHypjJuScdIXRth5Vm2aYM0TILJ0PAYaK8F/Qv2P+fPkzg02Or+3bMp9TIayhf6iX+1
	J3VdFm9ABrkh9tp58auw2D5rLVuIY8cnielcEtKm4lXShBwf/5n/4I+Sb/Nqp6tQ2AOmrW4t43e
	PcXiypv+Ygn2YuK4UmFspB1CMldGfU673UEq0Qh309kSGFgYuGk+eeAuEllD5XtH1Dpo/QwPpUt
	CjXdkGHrF3Nc8A3LqgxhvJB0RAGfYUPWxQedSvWattEIpwttEJsvTV6G8S
X-Received: by 2002:a5d:5d0b:0:b0:48b:10af:f85c with SMTP id
 ffacd0b85a97d-48e3859dd20mr1635628f8f.37.1792735555391; Thu, 22 Oct 2026
 23:05:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023033845.89152-1-theodoruswensanfebruanto025@gmail.com> <20261023033845.89152-3-theodoruswensanfebruanto025@gmail.com>
In-Reply-To: <20261023033845.89152-3-theodoruswensanfebruanto025@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 23 Oct 2026 11:35:44 +0530
X-Gm-Features: AclHuK8fcSg3LmOyyyTLC0yERAJFpklxx5iu1uVsVt0iI6LmtGD6hM9c1JkRAo0
Message-ID: <CAAhSdy1tQka=+=hMH2_T21jgenSKUvkqKOYh_7Fr1ASVw=AVOA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] lib: sbi: Preserve supervisor CTR records across
 domain switches
To: whensun <theodoruswensanfebruanto025@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_230557_691460_A926E2EF 
X-CRM114-Status: GOOD (  23.76  )
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

T24gRnJpLCBPY3QgMjMsIDIwMjYgYXQgOTowOOKAr0FNIHdoZW5zdW4KPHRoZW9kb3J1c3dlbnNh
bmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogVGhlb2RvcnVzIFdlbnNh
biBGZWJydWFudG8gPHRoZW9kb3J1c3dlbnNhbmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+Cj4KPiBT
YXZlIHN1cGVydmlzb3IgQ1RSIGNvbnRyb2wsIGRlcHRoLCBzdGF0dXMsIGFuZCBsb2dpY2FsIHJl
Y29yZAo+IGVudHJpZXMgd2hlbiBTc2N0ciBhbmQgU3Njc3JpbmQgYXJlIGF2YWlsYWJsZS4gVGhp
cyBleHBlcmltZW50YWwKPiBpbXBsZW1lbnRhdGlvbiBmcmVlemVzIHJlY29yZGluZyBiZWZvcmUg
c2F2aW5nIGFuZCByZXN0b3Jlcwo+IHN0YXR1cyBiZWZvcmUgbG9naWNhbCByZWNvcmRzLgo+Cj4g
SU1TSUMgYW5kIG90aGVyIGluZGlyZWN0IENTUiBzdGF0ZSByZW1haW4gb3V0c2lkZSB0aGlzIGNo
YW5nZS4KPgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1zb2Z0d2FyZS1zcmMvb3Bl
bnNiaS9pc3N1ZXMvNDMzCj4gU2lnbmVkLW9mZi1ieTogVGhlb2RvcnVzIFdlbnNhbiBGZWJydWFu
dG8gPHRoZW9kb3J1c3dlbnNhbmZlYnJ1YW50bzAyNUBnbWFpbC5jb20+Cj4gLS0tCj4gIGxpYi9z
Ymkvc2JpX2RvbWFpbl9jb250ZXh0LmMgfCA5NSArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDk1IGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1n
aXQgYS9saWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2Nv
bnRleHQuYwo+IGluZGV4IDE0OTI3ZmY1Li5hZjE4MDQwOSAxMDA2NDQKPiAtLS0gYS9saWIvc2Jp
L3NiaV9kb21haW5fY29udGV4dC5jCj4gKysrIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQu
Ywo+IEBAIC0yMSw2ICsyMSwyNCBAQAo+ICAjaW5jbHVkZSA8c2JpL3NiaV92ZWN0b3IuaD4KPiAg
I2luY2x1ZGUgPHNiaS9zYmlfZnAuaD4KPgo+ICsjZGVmaW5lIEhBUlRfQ1RSX01BWF9FTlRSSUVT
IDI1Ngo+ICsjZGVmaW5lIEhBUlRfQ1RSX0ZJUlNUX1NFTEVDVE9SIDB4MjAwCj4gKyNkZWZpbmUg
SEFSVF9DVFJfRlJPWkVOICgxVUwgPDwgMzEpCj4gKwo+ICtzdHJ1Y3QgaGFydF9jdHJfZW50cnkg
ewo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBzb3VyY2U7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IHRhcmdldDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZGF0YTsKPiArfTsKPiArCj4gK3N0cnVj
dCBoYXJ0X2N0cl9jb250ZXh0IHsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgY3RsOwo+ICsgICAg
ICAgdW5zaWduZWQgbG9uZyBkZXB0aDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgc3RhdHVzOwo+
ICsgICAgICAgdW5zaWduZWQgbG9uZyB2c2N0bDsKPiArICAgICAgIHN0cnVjdCBoYXJ0X2N0cl9l
bnRyeSBlbnRyaWVzW0hBUlRfQ1RSX01BWF9FTlRSSUVTXTsKPiArfTsKPiArCj4gIC8qKiBDb250
ZXh0IHJlcHJlc2VudGF0aW9uIGZvciBhIGhhcnQgd2l0aGluIGEgZG9tYWluICovCj4gIHN0cnVj
dCBoYXJ0X2NvbnRleHQgewo+ICAgICAgICAgLyoqIFRyYXAtcmVsYXRlZCBzdGF0ZXMgc3VjaCBh
cyBHUFJzLCBtZXBjLCBhbmQgbXN0YXR1cyAqLwo+IEBAIC03Nyw2ICs5NSw4IEBAIHN0cnVjdCBo
YXJ0X2NvbnRleHQgewo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBzaXNlbGVjdDsKPiAgICAgICAg
IC8qKiBBSUEgc3VwZXJ2aXNvciBpbnRlcnJ1cHQgcHJpb3JpdHkgcmVnaXN0ZXIgYmFuayAqLwo+
ICAgICAgICAgdW5zaWduZWQgbG9uZyBzaXByaW9bMTZdOwo+ICsgICAgICAgLyoqIFN1cGVydmlz
b3IgY29udHJvbCB0cmFuc2ZlciByZWNvcmRzICovCj4gKyAgICAgICBzdHJ1Y3QgaGFydF9jdHJf
Y29udGV4dCAqY3RyX2N0eDsKPgo+ICAgICAgICAgLyoqIEZsb2F0IGNvbnRleHQgc3RhdGUgKi8K
PiAgICAgICAgIHN0cnVjdCBzYmlfZnBfY29udGV4dCBmcF9jdHg7Cj4gQEAgLTE0Miw2ICsxNjIs
NTkgQEAgc3RhdGljIHZvaWQgaGFydF9haWFfaXByaW9fcmVzdG9yZShjb25zdCBzdHJ1Y3QgaGFy
dF9jb250ZXh0ICpjdHgpCj4gICAgICAgICB9Cj4gIH0KPgo+ICsjaWYgX19yaXNjdl94bGVuID09
IDY0Cj4gK3N0YXRpYyB1bnNpZ25lZCBpbnQgaGFydF9jdHJfZW50cnlfY291bnQodW5zaWduZWQg
bG9uZyBkZXB0aCkKPiArewo+ICsgICAgICAgdW5zaWduZWQgaW50IGVuY29kaW5nID0gZGVwdGgg
JiA3Owo+ICsKPiArICAgICAgIGlmIChlbmNvZGluZyA+IDQpCj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+ICsgICAgICAgcmV0dXJuIDE2VSA8PCBlbmNvZGluZzsKPiArfQo+ICsKPiArc3Rh
dGljIHZvaWQgaGFydF9jdHJfc2F2ZShzdHJ1Y3QgaGFydF9jdHJfY29udGV4dCAqY3R4KQo+ICt7
Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgaSwgY291bnQ7Cj4gKwo+ICsgICAgICAgY3R4LT5zdGF0
dXMgPSBjc3JfcmVhZF9zZXQoQ1NSX1NDVFJTVEFUVVMsIEhBUlRfQ1RSX0ZST1pFTik7Cj4gKyAg
ICAgICBjdHgtPmN0bCA9IGNzcl9yZWFkKENTUl9TQ1RSQ1RMKTsKPiArICAgICAgIGN0eC0+ZGVw
dGggPSBjc3JfcmVhZChDU1JfU0NUUkRFUFRIKTsKPiArICAgICAgIGlmIChtaXNhX2V4dGVuc2lv
bignSCcpKQo+ICsgICAgICAgICAgICAgICBjdHgtPnZzY3RsID0gY3NyX3JlYWQoQ1NSX1ZTQ1RS
Q1RMKTsKPiArCj4gKyAgICAgICBjb3VudCA9IGhhcnRfY3RyX2VudHJ5X2NvdW50KGN0eC0+ZGVw
dGgpOwo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiArICAgICAgICAg
ICAgICAgY3NyX3dyaXRlKENTUl9TSVNFTEVDVCwgSEFSVF9DVFJfRklSU1RfU0VMRUNUT1IgKyBp
KTsKPiArICAgICAgICAgICAgICAgY3R4LT5lbnRyaWVzW2ldLnNvdXJjZSA9IGNzcl9yZWFkKENT
Ul9TSVJFRyk7Cj4gKyAgICAgICAgICAgICAgIGN0eC0+ZW50cmllc1tpXS50YXJnZXQgPSBjc3Jf
cmVhZChDU1JfU0lSRUcyKTsKPiArICAgICAgICAgICAgICAgY3R4LT5lbnRyaWVzW2ldLmRhdGEg
PSBjc3JfcmVhZChDU1JfU0lSRUczKTsKPiArICAgICAgIH0KPiArfQo+ICsKPiArc3RhdGljIHZv
aWQgaGFydF9jdHJfcmVzdG9yZShjb25zdCBzdHJ1Y3QgaGFydF9jdHJfY29udGV4dCAqY3R4KQo+
ICt7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgaSwgY291bnQ7Cj4gKwo+ICsgICAgICAgY3NyX3dy
aXRlKENTUl9TQ1RSQ1RMLCAwKTsKPiArICAgICAgIGNzcl93cml0ZShDU1JfU0NUUkRFUFRILCBj
dHgtPmRlcHRoKTsKPiArICAgICAgIF9fYXNtX18gX192b2xhdGlsZV9fKCIuNGJ5dGUgMHgxMDQw
MDA3MyIgOjo6ICJtZW1vcnkiKTsKPiArICAgICAgIGNzcl93cml0ZShDU1JfU0NUUlNUQVRVUywg
Y3R4LT5zdGF0dXMgfCBIQVJUX0NUUl9GUk9aRU4pOwo+ICsKPiArICAgICAgIGNvdW50ID0gaGFy
dF9jdHJfZW50cnlfY291bnQoY3R4LT5kZXB0aCk7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwg
Y291bnQ7IGkrKykgewo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUoQ1NSX1NJU0VMRUNULCBI
QVJUX0NUUl9GSVJTVF9TRUxFQ1RPUiArIGkpOwo+ICsgICAgICAgICAgICAgICBjc3Jfd3JpdGUo
Q1NSX1NJUkVHMiwgY3R4LT5lbnRyaWVzW2ldLnRhcmdldCk7Cj4gKyAgICAgICAgICAgICAgIGNz
cl93cml0ZShDU1JfU0lSRUczLCBjdHgtPmVudHJpZXNbaV0uZGF0YSk7Cj4gKyAgICAgICAgICAg
ICAgIGNzcl93cml0ZShDU1JfU0lSRUcsIGN0eC0+ZW50cmllc1tpXS5zb3VyY2UpOwo+ICsgICAg
ICAgfQo+ICsKPiArICAgICAgIGlmIChtaXNhX2V4dGVuc2lvbignSCcpKQo+ICsgICAgICAgICAg
ICAgICBjc3Jfd3JpdGUoQ1NSX1ZTQ1RSQ1RMLCBjdHgtPnZzY3RsKTsKPiArICAgICAgIGNzcl93
cml0ZShDU1JfU0NUUkNUTCwgY3R4LT5jdGwpOwo+ICsgICAgICAgY3NyX3dyaXRlKENTUl9TQ1RS
U1RBVFVTLCBjdHgtPnN0YXR1cyk7Cj4gK30KPiArI2VuZGlmCj4gKwo+ICAvKioKPiAgICogU3dp
dGNoZXMgdGhlIEhBUlQgY29udGV4dCBmcm9tIHRoZSBjdXJyZW50IGRvbWFpbiB0byB0aGUgdGFy
Z2V0IGRvbWFpbi4KPiAgICogVGhpcyBpbmNsdWRlcyBjaGFuZ2luZyBkb21haW4gYXNzaWdubWVu
dHMgYW5kIHJlY29uZmlndXJpbmcgUE1QLCBhcyB3ZWxsCj4gQEAgLTIzOSw2ICszMTIsMTMgQEAg
c3RhdGljIGludCBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dChzdHJ1Y3QgaGFydF9jb250
ZXh0ICpjdHgsCj4gICAgICAgICAgICAgICAgIGhhcnRfYWlhX2lwcmlvX3Jlc3RvcmUoZG9tX2N0
eCk7Cj4gICAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfU0lTRUxFQ1QsIGRvbV9jdHgtPnNp
c2VsZWN0KTsKPiAgICAgICAgIH0KPiArI2lmIF9fcmlzY3ZfeGxlbiA9PSA2NAo+ICsgICAgICAg
aWYgKGN0eC0+Y3RyX2N0eCAmJiBkb21fY3R4LT5jdHJfY3R4KSB7Cj4gKyAgICAgICAgICAgICAg
IGhhcnRfY3RyX3NhdmUoY3R4LT5jdHJfY3R4KTsKPiArICAgICAgICAgICAgICAgaGFydF9jdHJf
cmVzdG9yZShkb21fY3R4LT5jdHJfY3R4KTsKPiArICAgICAgICAgICAgICAgY3NyX3dyaXRlKENT
Ul9TSVNFTEVDVCwgZG9tX2N0eC0+c2lzZWxlY3QpOwo+ICsgICAgICAgfQo+ICsjZW5kaWYKPgo+
ICAgICAgICAgLyogRWFnZXIgY29udGV4dCBzd2l0Y2ggZm9yIGZsb2F0ICovCj4gICAgICAgICBp
ZiAoc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfRikgfHwKPiBA
QCAtMzAyLDYgKzM4MiwyMCBAQCBzdGF0aWMgaW50IGhhcnRfY29udGV4dF9pbml0KHUzMiBoYXJ0
aW5kZXgpCj4KPiAgICAgICAgICAgICAgICAgY3R4LT5zdGltZWNtcCA9IH4wVUxMOwo+Cj4gKyNp
ZiBfX3Jpc2N2X3hsZW4gPT0gNjQKPiArICAgICAgICAgICAgICAgaWYgKHNiaV9oYXJ0X2hhc19l
eHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRyKCksCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJUX0VYVF9TU0NUUikgJiYKPiArICAgICAg
ICAgICAgICAgICAgIHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRf
cHRyKCksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9I
QVJUX0VYVF9TU0NTUklORCkpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICBjdHgtPmN0cl9j
dHggPSBzYmlfemFsbG9jKHNpemVvZigqY3R4LT5jdHJfY3R4KSk7Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCFjdHgtPmN0cl9jdHgpIHsKPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHNiaV9mcmVlKGN0eCk7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBy
ZXR1cm4gU0JJX0VOT01FTTsKPiArICAgICAgICAgICAgICAgICAgICAgICB9Cj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgY3R4LT5jdHJfY3R4LT5kZXB0aCA9IGNzcl9yZWFkKENTUl9TQ1RSREVQ
VEgpOwo+ICsgICAgICAgICAgICAgICB9CgpEZXRlY3QgYW5kIHNhdmUgQ1RSIGRlcHRoIC8gbnVt
YmVyX29mX2VudGVyaWVzIGluIHN0cnVjdCBoYXJ0X2ZlYXR1cmVzLgpBbHNvLCBtb3ZlIHRoaXMg
ZGV0ZWN0aW9uIGxvZ2ljIGluIHNiaV9oYXJ0LmMKCj4gKyNlbmRpZgo+ICsKPiAgICAgICAgICAg
ICAgICAgaWYgKHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2JpX3NjcmF0Y2hfdGhpc2hhcnRfcHRy
KCksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFNCSV9IQVJU
X0VYVF9WKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIHZlY19zaXplID0gc2JpX3ZlY3Rv
cl9jb250ZXh0X3NpemUoKTsKPiBAQCAtMzA5LDYgKzQwMyw3IEBAIHN0YXRpYyBpbnQgaGFydF9j
b250ZXh0X2luaXQodTMyIGhhcnRpbmRleCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBB
bGxvY2F0ZSB0aGUgdmVjdG9yIGNvbnRleHQgcG9pbnRlciAqLwo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGN0eC0+dmVjX2N0eCA9IHNiaV96YWxsb2ModmVjX3NpemUpOwo+ICAgICAgICAgICAg
ICAgICAgICAgICAgIGlmICghY3R4LT52ZWNfY3R4KSB7Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzYmlfZnJlZShjdHgtPmN0cl9jdHgpOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc2JpX2ZyZWUoY3R4KTsKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiBTQklfRU5PTUVNOwo+ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiAtLQo+
IDIuNDMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5p
bmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9vcGVuc2JpCgpSZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
