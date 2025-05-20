Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A18C3ABDD
	for <opensbi@archiver.kernel.org>; Tue, 20 May 2025 05:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NYvE1dpxW9OEJYiJz/s99kgCUwspvOju0kMKFNWdk0A=; b=CJ9HXccouqCBPA
	5SOikYhs8fZgEWyGqnjGDUDb/MCgyaIgD+leAKFPje/oGYN1OKU4rX/+Zf6qjCn5i8LS6K0hDo2IN
	SwoLibF1yjAbn7GffySzZdTENoe18Yx3TM0k4P8MW9+2FLorl75VIy4twGG99p0tOc6Ku+vObQN4v
	lXnFZI4aAjbO8nQMQJkbHItPNjVJzMgJ/yXRxcWOxYA+s3UdbSM1NOJSbtM7HVW2JTVf+ejAPkO+U
	5ITtwJ3USGsKiofnDzdm+Sd9aOpLMB/MP7Nf6nnSlzMfiwMJg7+JSrI/ZBkTkVl4ktp9pQiB3sQ5x
	T6kz/jcsK1pxFBpHuPGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFE1-0000000BXXO-3uln;
	Tue, 20 May 2025 05:09:13 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHFDz-0000000BXWr-1uuz
	for opensbi@lists.infradead.org;
	Tue, 20 May 2025 05:09:12 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-8616987c261so208929439f.3
        for <opensbi@lists.infradead.org>; Mon, 19 May 2025 22:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747717750; x=1748322550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=49mnxQqtrW0EFbpLCK4eFtZz7KxXDix9+8WKIDBRj44=;
        b=dvvnFhY10Ngj3oLVKugoz9X0szS+HRclx9eL19/7wrxEOE1/ko6e/SgijiOcRyYncu
         GpWZpLXafDUwMkZN+CSHDKf6Eho2/2PQ7CJrJjA/foY5MPYYwSXF3wt3rLm1uKbXB8if
         pWQiUOgS4SLBQKzykcHkX0UEk9qTKA+KVOnaos8gz/w0z2aQ7/NjKEXd7rboDiY+KGOJ
         G7mekSqu5RCYAbdJffODXe82vPp82AjvZ1nfuArUmHtZGJ0TRpQVHFaqfVfsy1gRmN6Q
         t+BFCe/wrKEfHSwyM0Lp4ntSm1DctBNbgPTfIExMVWotJ/q5Brs370grL7cn1IQb40wI
         DIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747717750; x=1748322550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=49mnxQqtrW0EFbpLCK4eFtZz7KxXDix9+8WKIDBRj44=;
        b=o+67qMVoFxlLqUU6E1wmc9pgsyjI8KRWlCflmPWXsitbsom7F9it36t0WLdf38lN/x
         VXWtjpBvP2eKuyLK+bIMiniscQiiPPweQbGJ4mRkpItBGKHP8lyTRJKpuJ9KdeQ3LcK5
         UlA8FLfMmzNlDdWvtf9J/lH12WJha4t3O3kPqUobs+bC6+7rYUq2UbyhjBkXffRwc6Kn
         m8777f/Vpxisng7MehR5l+4gcS1C9FP67IwRZio3I2vnuGkWSfQXql2lYram2jZkKk2Y
         kJPnOyrSpex0g2naCIaXfPDOrE89HlYJI8F4yZSOiVtMOdpL58R3N9X7kjTsZ76NWf4J
         blaw==
X-Gm-Message-State: AOJu0YwO+/1HzYHAEgMQxz40HzGZjWrh55iOuLxbm6bGS8bMb0KrNamE
	wnYTP66TJU6KJsBjvbL9dYu+/XkxxDQsRW4fEfshFs77/TISvKPrSyltOnq7e7V5iXa3/TlyIMJ
	COZVqa2c7niauEtYhqRp/a+qN1msJljLYhbj8rUJJcg==
X-Gm-Gg: ASbGnct0Go/kJlXSEB8RQ+ko9XWE4zk+n4veXMqCwZKKfz/V72vWQRZiz/6XRx/SRlC
	XI4G4drpEIKGAtDUaZqiEknivl4tbuDNod413TI3aTOL6U7YS3BbSJaEnD0Pw+XgqU4DXkQTZUb
	4Fi/pwJH792dRJf1b/RE/cvUIiRalkiZZx8A==
X-Google-Smtp-Source: AGHT+IG2fnQlfkXYAmznJY7meZKu0+OwaM91Rjcdf2dy+3MKj5fWrds+qgf/Ggm0FKE9rKA5tASHcAiEpTlQphYuIYU=
X-Received: by 2002:a05:6602:7205:b0:86a:2617:50bc with SMTP id
 ca18e2360f4ac-86a261751b5mr1858216639f.0.1747717750622; Mon, 19 May 2025
 22:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2jObwq5SUymwVmwMhcQ_h0-4OJuhwitgcVN2gPq2B=XQ@mail.gmail.com>
 <20250519215848.27569-8-cfu@mips.com>
In-Reply-To: <20250519215848.27569-8-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 20 May 2025 10:38:59 +0530
X-Gm-Features: AX0GCFufgYqk95A1-Knl0N8VcRMmKJuyXT5QPsR_A8yc3hUSF_C4Ry18A_JWEVI
Message-ID: <CAAhSdy1kLUXN8293NHWDF2=jM9n0zEpxfsxtaPJEJRY+95rAnQ@mail.gmail.com>
Subject: Re: [PATCH v5 07/10] Initialize MIPS custom PMA registers
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_220911_500533_1C899C78 
X-CRM114-Status: GOOD (  18.88  )
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

T24gVHVlLCBNYXkgMjAsIDIwMjUgYXQgMzoyOeKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBCZWZvcmUgUE1QIHNldCB1cCwgd2UgbmVlZCB0byBzZXQg
dXAgTUlQUyBjdXN0b20gUE1BIHJlZ2lzdGVycwo+IHRvIGhhdmUgY29ycmVjdCBjYWNoZWFibGUg
b3IgdW5jYWNoZWFibGUgZXhlY3V0aW9uIGZvciBwbXAgcmVnaW9ucy4KPgo+IFNpZ25lZC1vZmYt
Ynk6IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgoKVGhpcyBNSVBTIHNwZWNpZmljIFBNQSBw
cm9ncmFtbWluZyBoYXMgdG8gYmUgdW5kZXIgcGxhdGZvcm0vZ2VuZXJpYy9taXBzLwoKUmVnYXJk
cywKQW51cAoKPiAtLS0KPiAgbGliL3NiaS9yaXNjdl9hc20uYyB8IDM2ICsrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMzYgaW5zZXJ0aW9ucygr
KQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvcmlzY3ZfYXNtLmMgYi9saWIvc2JpL3Jpc2N2X2Fz
bS5jCj4gaW5kZXggYzdkNzVhYy4uN2ViMDJjZiAxMDA2NDQKPiAtLS0gYS9saWIvc2JpL3Jpc2N2
X2FzbS5jCj4gKysrIGIvbGliL3NiaS9yaXNjdl9hc20uYwo+IEBAIC0xMiw2ICsxMiw5IEBACj4g
ICNpbmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX3BsYXRmb3Jt
Lmg+Cj4gICNpbmNsdWRlIDxzYmkvc2JpX2NvbnNvbGUuaD4KPiArI2lmZGVmIENPTkZJR19QTEFU
Rk9STV9NSVBTX1A4NzAwCj4gKyNpbmNsdWRlIDxtaXBzL3A4NzAwLmg+Cj4gKyNlbmRpZgo+Cj4g
IC8qIGRldGVybWluZSBDUFUgZXh0ZW5zaW9uLCByZXR1cm4gbm9uLXplcm8gc3VwcG9ydCAqLwo+
ICBpbnQgbWlzYV9leHRlbnNpb25faW1wKGNoYXIgZXh0KQo+IEBAIC0xMTksNiArMTIyLDkgQEAg
dW5zaWduZWQgbG9uZyBjc3JfcmVhZF9udW0oaW50IGNzcl9udW0pCj4gICAgICAgICB1bnNpZ25l
ZCBsb25nIHJldCA9IDA7Cj4KPiAgICAgICAgIHN3aXRjaCAoY3NyX251bSkgewo+ICsjaWZkZWYg
Q09ORklHX1BMQVRGT1JNX01JUFNfUDg3MDAKPiArICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWRf
MTYoQ1NSX01JUFNQTUFDRkcwLCByZXQpCj4gKyNlbmRpZgo+ICAgICAgICAgc3dpdGNoY2FzZV9j
c3JfcmVhZF8xNihDU1JfUE1QQ0ZHMCwgcmV0KQo+ICAgICAgICAgc3dpdGNoY2FzZV9jc3JfcmVh
ZF82NChDU1JfUE1QQUREUjAsIHJldCkKPiAgICAgICAgIHN3aXRjaGNhc2VfY3NyX3JlYWQoQ1NS
X01DWUNMRSwgcmV0KQo+IEBAIC0xOTksNiArMjA1LDkgQEAgdm9pZCBjc3Jfd3JpdGVfbnVtKGlu
dCBjc3JfbnVtLCB1bnNpZ25lZCBsb25nIHZhbCkKPiAgICAgICAgIHN3aXRjaGNhc2VfY3NyX3dy
aXRlXzMyKF9fY3NyX251bSArIDMyLCBfX3ZhbCkKPgo+ICAgICAgICAgc3dpdGNoIChjc3JfbnVt
KSB7Cj4gKyNpZmRlZiBDT05GSUdfUExBVEZPUk1fTUlQU19QODcwMAo+ICsgICAgICAgc3dpdGNo
Y2FzZV9jc3Jfd3JpdGVfMTYoQ1NSX01JUFNQTUFDRkcwLCB2YWwpCj4gKyNlbmRpZgo+ICAgICAg
ICAgc3dpdGNoY2FzZV9jc3Jfd3JpdGVfMTYoQ1NSX1BNUENGRzAsIHZhbCkKPiAgICAgICAgIHN3
aXRjaGNhc2VfY3NyX3dyaXRlXzY0KENTUl9QTVBBRERSMCwgdmFsKQo+ICAgICAgICAgc3dpdGNo
Y2FzZV9jc3Jfd3JpdGUoQ1NSX01DWUNMRSwgdmFsKQo+IEBAIC0zMDEsNiArMzEwLDI5IEBAIGlu
dCBpc19wbXBfZW50cnlfbWFwcGVkKHVuc2lnbmVkIGxvbmcgZW50cnkpCj4gICAgICAgICByZXR1
cm4gZmFsc2U7Cj4gIH0KPgo+ICsjaWZkZWYgQ09ORklHX1BMQVRGT1JNX01JUFNfUDg3MDAKPiAr
ZXh0ZXJuIHVuc2lnbmVkIGxvbmcgX2Z3X3N0YXJ0Owo+ICtzdGF0aWMgdm9pZCBwbWFfc2V0KHVu
c2lnbmVkIGludCBuLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gK3sKPiArICAgICAgIGludCBwbWFj
ZmdfY3NyLCBwbWFjZmdfc2hpZnQ7Cj4gKyAgICAgICB1bnNpZ25lZCBsb25nIGNmZ21hc2s7Cj4g
KyAgICAgICB1bnNpZ25lZCBsb25nIHBtYWNmZywgY2NhOwo+ICsKPiArICAgICAgIHBtYWNmZ19j
c3IgPSAoQ1NSX01JUFNQTUFDRkcwICsgKG4gPj4gMikpICYgfjE7Cj4gKyAgICAgICBwbWFjZmdf
c2hpZnQgPSAobiAmIDcpIDw8IDM7Cj4gKyAgICAgICBjZmdtYXNrID0gfigweGZmVUwgPDwgcG1h
Y2ZnX3NoaWZ0KTsKPiArCj4gKyAgICAgICAvKiBSZWFkIHBtYWNmZyB0byBjaGFuZ2UgY2FjaGVh
YmlsaXR5ICovCj4gKyAgICAgICBwbWFjZmcgID0gKGNzcl9yZWFkX251bShwbWFjZmdfY3NyKSAm
IGNmZ21hc2spOwo+ICsgICAgICAgaWYgKGFkZHIgPj0gKHVuc2lnbmVkIGxvbmcpJl9md19zdGFy
dCkKPiArICAgICAgICAgICAgICAgY2NhID0gQ0NBX0NBQ0hFX0VOQUJMRSB8IFBNQV9TUEVDVUxB
VElPTjsKPiArICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgY2NhID0gQ0NBX0NBQ0hFX0RJ
U0FCTEU7Cj4gKyAgICAgICBwbWFjZmcgfD0gKChjY2EgPDwgcG1hY2ZnX3NoaWZ0KSAmIH5jZmdt
YXNrKTsKPiArICAgICAgIGNzcl93cml0ZV9udW0ocG1hY2ZnX2NzciwgcG1hY2ZnKTsKPiArfQo+
ICsjZW5kaWYKPiArCj4gIGludCBwbXBfc2V0KHVuc2lnbmVkIGludCBuLCB1bnNpZ25lZCBsb25n
IHByb3QsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGxv
ZzJsZW4pCj4gIHsKPiBAQCAtMzEyLDYgKzM0NCwxMCBAQCBpbnQgcG1wX3NldCh1bnNpZ25lZCBp
bnQgbiwgdW5zaWduZWQgbG9uZyBwcm90LCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gICAgICAgICBp
ZiAobiA+PSBQTVBfQ09VTlQgfHwgbG9nMmxlbiA+IF9fcmlzY3ZfeGxlbiB8fCBsb2cybGVuIDwg
UE1QX1NISUZUKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPgo+ICsjaWZk
ZWYgQ09ORklHX1BMQVRGT1JNX01JUFNfUDg3MDAKPiArICAgICAgIHBtYV9zZXQobiwgYWRkcik7
Cj4gKyNlbmRpZgo+ICsKPiAgICAgICAgIC8qIGNhbGN1bGF0ZSBQTVAgcmVnaXN0ZXIgYW5kIG9m
ZnNldCAqLwo+ICAjaWYgX19yaXNjdl94bGVuID09IDMyCj4gICAgICAgICBwbXBjZmdfY3NyICAg
PSBDU1JfUE1QQ0ZHMCArIChuID4+IDIpOwo+IC0tCj4gMi40Ny4xCj4KPgo+IC0tCj4gb3BlbnNi
aSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
