Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B5FC3600C
	for <opensbi@archiver.kernel.org>; Fri, 28 Mar 2025 04:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxeJh8rNjy+Cf4gfKAzmNyNUkPAbN1g7i4KpTFOmeWs=; b=PgiBL/OQU3aYb5
	P/c54UC3fxKa1EgjZkKuZ0ZbYvmY3rDDA/H5Wn+RmvH2DS/93FZVz4w0kpNfxD8VHN3LV9+Ay/UMA
	8gtaN5qWXQJgb/pd54jH2lt6X7757RySdLjV5RZD1E6jA6rcnHIFbe32CXAC8BbXVC8yfOaYua16A
	y6FTLsow14qVqO4LNaL/KCgOGuPTltVtUKo6r2uJX+pG5z2lUFORK/DuV8qamObQpzCKFNPWyW3Gq
	eVaZPbRWLPWHghklXaFZlCPHN6kWYf809AjtUhdbIiDbyxWtoHrN62wGSHz0Y6uavbaTtUnEPE+WY
	l5vQeQPQAoS3XVgf/WZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty1b5-0000000CaS2-3He6;
	Fri, 28 Mar 2025 04:45:35 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty1b3-0000000CaRg-2KTs
	for opensbi@lists.infradead.org;
	Fri, 28 Mar 2025 04:45:35 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-85b44094782so52737639f.3
        for <opensbi@lists.infradead.org>; Thu, 27 Mar 2025 21:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1743137132; x=1743741932; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UbRHlEBONKn06kpQntKRcGR74tryZKojmi2KkR905ds=;
        b=KVp1Tuq61bK1lp5qdkOpPEnlJTAO/EjFHbvBo9wfntF5u5WVwft2dfNCQ45rT0sFtM
         zThm98te/ncfZASrHKazsxKuhN0VrIykmO+r9jMsd9OE8Qsf3R8hAtoq5tTIOjOhlJox
         nxiEHZ9x2AHpa+YAFaAYor+ZIANgMkZVu58zU0Vhrb1WQdxzYA55YVbr0XaZdOAnbrHK
         2D5Zvv74h6VWcvzaRTxbd+aS8VtKBqmXXxmjX9Nchtsu6YaTZfYGJ2+uISLrlEtco3Lq
         NlScz1J/ydzg90wVyY/VUVAkVMejqRhL7i/gRA83I+VAtVjpw5nfgRXPLMQNw5znEcfD
         E4cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743137132; x=1743741932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UbRHlEBONKn06kpQntKRcGR74tryZKojmi2KkR905ds=;
        b=BX1r/U+8hdeutbSTdp03qsFap6eJpU3+g7yM9E4eBooksdhrLfZ70qyzULb0ZMV439
         yFKlIn36qJnrez3ZsTOdWhFdXG5E9jxDFFLUA8ELvsrAIICyXXxp3dFvGLgFufugd0B/
         921upTUn3S1TPz4V9uHqvL1yzSwRUkKs1aLO6/2bgBkrfiUfiR2eT5nDPc6rGcxLC/2k
         853Yrn0ZAFmmC8XHpnPn/a+BJYCaa31LSg/Zsx0FaLxAOAk4/rMjPfCd02J8oTjWora8
         PiMfBlphKMulqAvu2uo2i7k8RdeTvy5hUgcrvf6oVqmBD3iUcwr6rYszbLQQShpKjnBv
         YU6g==
X-Gm-Message-State: AOJu0YzphybXhzgR6sCyn45wjjfC1zn9BgTLjuhZGgziP6cdbcioYJk6
	nsn72kq9jN6cmyI7hjl1qsJWcJVbc3YiHxrHJoabDGe9D6f8X/vPthpkqjp5oy6qFZDkkierxrJ
	jD5OTRH850I975KvCXT1GE5wmbMJKFeHu2Yw9sw==
X-Gm-Gg: ASbGncvkYlY8nRoQ5RJiMxyq+poUAiSy3lpfsBW1BxHgO7BKdQE3iOTNkSHxFQczK7K
	vCO+PZ07CSOEDpbuF+wqpRRPcJbUKUcS9tjlvlm0LKkXazuAdp0qUICZSHQNZQcIfp9E/scyGYH
	BY/HtaaJrz2pS6ezIgzLskjCRoazE=
X-Google-Smtp-Source: AGHT+IH8C057oiOJxuLBOSzwmw80YpPUZIz77n0ACnvg2zu5lDcjnCk+1xQm81t/pQht9u1ThxL+ST1wO3EgvTmlFf8=
X-Received: by 2002:a05:6e02:3f09:b0:3d0:21aa:a752 with SMTP id
 e9e14a558f8ab-3d5ccdc3533mr75220655ab.2.1743137132071; Thu, 27 Mar 2025
 21:45:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250226005335.19498-1-cfu@mips.com>
In-Reply-To: <20250226005335.19498-1-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Mar 2025 10:15:20 +0530
X-Gm-Features: AQ5f1JoZC9pqlgoBJuq29yGltAEvx8WtRo43jJhPqplvyIBjzGQMHn3_bQ1Ih_k
Message-ID: <CAAhSdy2sdccn2W_t8Ut+POjwrqMx2YB+7Yrf7vfJfGCtHJAoJA@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] platform: generic: mips: add P8700
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_214533_861168_C504E493 
X-CRM114-Status: GOOD (  12.67  )
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

T24gV2VkLCBGZWIgMjYsIDIwMjUgYXQgNzozOOKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYSBuZXcgY29uZmlnIGZpcnN0LgoKTWlzc2luZyBT
aWduZWQtb2ZmLWJ5LCBvdGhlcndpc2UgbG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAg
cGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAgICB8IDQgKysrKwo+ICBwbGF0Zm9ybS9n
ZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnIHwgMSArCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnIGIvcGxh
dGZvcm0vZ2VuZXJpYy9LY29uZmlnCj4gaW5kZXggNjg4ZGEzZi4uYTI0ZDZhYiAxMDA2NDQKPiAt
LS0gYS9wbGF0Zm9ybS9nZW5lcmljL0tjb25maWcKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL0tj
b25maWcKPiBAQCAtNjgsNiArNjgsMTAgQEAgY29uZmlnIFBMQVRGT1JNX1RIRUFECj4gICAgICAg
ICBzZWxlY3QgVEhFQURfQzlYWF9QTVUKPiAgICAgICAgIGRlZmF1bHQgbgo+Cj4gK2NvbmZpZyBQ
TEFURk9STV9NSVBTX1A4NzAwCj4gKyAgICAgICBib29sICJNSVBTIFA4NzAwIHN1cHBvcnQiCj4g
KyAgICAgICBkZWZhdWx0IG4KPiArCj4gIHNvdXJjZSAiJChPUEVOU0JJX1NSQ19ESVIpL3BsYXRm
b3JtL2dlbmVyaWMvYW5kZXMvS2NvbmZpZyIKPiAgc291cmNlICIkKE9QRU5TQklfU1JDX0RJUikv
cGxhdGZvcm0vZ2VuZXJpYy90aGVhZC9LY29uZmlnIgo+Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3Jt
L2dlbmVyaWMvY29uZmlncy9kZWZjb25maWcgYi9wbGF0Zm9ybS9nZW5lcmljL2NvbmZpZ3MvZGVm
Y29uZmlnCj4gaW5kZXggYmIyNjA2Mi4uY2UxZjFhZSAxMDA2NDQKPiAtLS0gYS9wbGF0Zm9ybS9n
ZW5lcmljL2NvbmZpZ3MvZGVmY29uZmlnCj4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdz
L2RlZmNvbmZpZwo+IEBAIC02LDYgKzYsNyBAQCBDT05GSUdfUExBVEZPUk1fU0lGSVZFX0ZVNzQw
PXkKPiAgQ09ORklHX1BMQVRGT1JNX1NPUEhHT19TRzIwNDI9eQo+ICBDT05GSUdfUExBVEZPUk1f
U1RBUkZJVkVfSkg3MTEwPXkKPiAgQ09ORklHX1BMQVRGT1JNX1RIRUFEPXkKPiArQ09ORklHX1BM
QVRGT1JNX01JUFNfUDg3MDA9bgo+ICBDT05GSUdfRkRUX0NQUEM9eQo+ICBDT05GSUdfRkRUX0NQ
UENfUlBNST15Cj4gIENPTkZJR19GRFRfR1BJTz15Cj4gLS0KPiAyLjQ3LjEKPgo+Cj4gLS0KPiBv
cGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
