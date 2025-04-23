Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCC5C369D1
	for <opensbi@archiver.kernel.org>; Wed, 23 Apr 2025 13:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZPj9kMTPwXcDDRDYSrb9+ZqB8bvTsqp4Vxosc4cNAw=; b=EnZvraxeY/cGwm
	m+JyymM5Sx2Qdkx8zryeaubWMh8PY6BCxGxrgl24cqk7E9d+iboC4U5D5bOIHKr7mvLZzj3H1Ktjk
	UY9v3tImbo5r6+jHULgWrciqSygbYWsGEFypvu76DqxxDhu3Fjgk6ofTkzdyRwsTInilZjeawnR/o
	SVqnL+xZTz92GVr7ZTYiyvmyzXb+c/iquEZLZjzNPjHihV6KqdlKTasozyubK1FJyhMYyYexcjA6Y
	Ko4de9gEMimx8dOTsOBuu66uqkgAqggT2tPHoLPOa3biBQ3UvcCj8XGRQ5/guTCAMsvcXXm3dPdkq
	XpWsCHTkOZKWo4fGoBSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7aW4-0000000Afkh-1Zqn;
	Wed, 23 Apr 2025 13:51:56 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Z7Y-0000000ASvX-3zN9
	for opensbi@lists.infradead.org;
	Wed, 23 Apr 2025 12:22:34 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d7f111e9e1so64617495ab.1
        for <opensbi@lists.infradead.org>; Wed, 23 Apr 2025 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745410952; x=1746015752; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9hSutAl0XpZZONZIWa6Z73ARWrocPDQYMR3MI18CFUY=;
        b=irCgWtN7L+j5rvlygWtCjajdb+9X+sJ6zTcrlcaJxFj8g7rTHUVHFWJs0KsdZdF+sb
         1RVibVao4lrgrXhvNIMJGlKwvpz9YoqWLESbiw+g+jroBD0wOsW8LKX0kppoWYZw6OAh
         qxDDECgecZIgZ27K8hVJYWlrCwStlx9nUis56t/oYdPaMXMz4PjlrwL8Xn6Q4XnqwljW
         vUWBuFKqOs0BX0cvl+q+bOd0LN2ryizri7ues7hVr63wVV5/+TWHMDaJuiyVdd/Wo5kH
         MpsNIRq6xqLCw7/NiGbyZ2VY4X4lEhSR+/7rbh69hTXY0ZMQaEMaD8edF1mvNPAYO+v7
         p/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745410952; x=1746015752;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9hSutAl0XpZZONZIWa6Z73ARWrocPDQYMR3MI18CFUY=;
        b=tOTv2l8JMzKueGZx1ZFkNF90FoaEkCPfercou4lxSCBR07rddf+x0JQ2ct9VFMeaXG
         bYR0Q8B6xuoeSbfYx2Ypsi3FnAhqZ75ypaXw9mqctr8PhUsQFcSXlt+SpN/vycVUCyjg
         tYYPswdr4Tc3eDNfaUL5KwgmSUd9SdW2egzir2hEBseDOG+AruV/TFMoOlE3eQVOW+m3
         EecBDBe2XVgCEe40bIlMtzO7EkssQ365o5P494AOj5/h+zly24Kv/NhCVlCEhULU2LGq
         swdVii3DDrXF0VksYcGNlvImySUsYmxggv/VaJp/1T2ZUMX0+7jmqN4oDZkh3HVfkZHw
         ipIw==
X-Gm-Message-State: AOJu0Yx0sPPqGzG0HGHLKJlBsdpZGoLNsbOf3dhHGsQsEKuwgGkJEST7
	2tHOPqvB2UhsxJQ1NnEfhyfEWzUNHNMhSu6txgnR7MCfyo9N7S7nmV3q1aDoEn/9ebR5/eL6Stc
	nfN0lOk2T92kMZFDR5zTJYP3vi6ahz5zdRdrZ3t3Me/N57SmD
X-Gm-Gg: ASbGncsSYg9UHW/dUDizuHX7CcBPEMBV7UFA7jd7zhwVDV7WLznlEP8L2koxQGNqveX
	jMv/jQgGe//ZNKHLsU6QqElfHh7wriZVc/LiEAtCg7eNXcd3HJQvIsex1e4NF/C6H22CvbMhbvh
	tXKWz4FVA0LBWWrPnskgHBWdH7jqHT4CTf6w==
X-Google-Smtp-Source: AGHT+IEaYBZpIhrmq5G/oAAULfyFmf9XoANcAhJSkEfh6sktChWpmNah4JxlCEPyosCQZHxU7OwAzQTKt7UJuYz1M/k=
X-Received: by 2002:a05:6e02:3102:b0:3d3:d067:73f8 with SMTP id
 e9e14a558f8ab-3d88ed9fbf7mr193331185ab.11.1745410951664; Wed, 23 Apr 2025
 05:22:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250326062051.3763530-1-alvinga@andestech.com>
In-Reply-To: <20250326062051.3763530-1-alvinga@andestech.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 23 Apr 2025 17:52:19 +0530
X-Gm-Features: ATxdqUG2I203e6DNUWUziS0FLsFvrheBK02o7AgKqz8MTxL-qNNSdEaDqdRoic4
Message-ID: <CAAhSdy3JcmzP=8ZP5iLL7eJh_qsA1OinLqP6RWj7UfTeswdZ-g@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_domain: Reduce memory usage of per-domain hart context
To: Alvin Chang <alvinga@andestech.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_052233_259135_41468603 
X-CRM114-Status: GOOD (  23.80  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgMTE6NTHigK9BTSBBbHZpbiBDaGFuZyA8YWx2aW5nYUBh
bmRlc3RlY2guY29tPiB3cm90ZToKPgo+IEluIGN1cnJlbnQgaW1wbGVtZW50YXRpb24sIHRoZSBs
ZW5ndGggb2YgaGFydGluZGV4X3RvX2NvbnRleHRfdGFibGVbXQo+IGFycmF5IGlzIGZpeGVkIGFz
IFNCSV9IQVJUTUFTS19NQVhfQklUUy4gSG93ZXZlciwgdGhlIG51bWJlciBvZiBoYXJ0cwo+IHN1
cHBvcnRlZCBieSB0aGUgcGxhdGZvcm0gbWlnaHQgbm90IGJlIFNCSV9IQVJUTUFTS19NQVhfQklU
UyBhbmQgaXMKPiB1c3VhbGx5IHNtYWxsZXIgdGhhbiBTQklfSEFSVE1BU0tfTUFYX0JJVFMuIFRo
aXMgbWVhbnMgaXQgaXMgdW5uZWNlc3NhcnkKPiB0byBhbGxvY2F0ZSBzdWNoIGZpeGVkLWxlbmd0
aCBhcnJheSBoZXJlLgo+Cj4gUHJlY2lzZWx5LCBjdXJyZW50IGltcGxlbWVudGF0aW9uIGFsd2F5
cyBhbGxvY2F0ZXMgMTAyNCBieXRlcyBmb3IKPiBoYXJ0aW5kZXhfdG9fY29udGV4dF90YWJsZVsx
MjhdIG9uIFJWNjQgcGxhdGZvcm0uIEhvd2V2ZXIsIGEgcGxhdGZvcm0KPiBzdXBwb3J0cyB0d28g
aGFydHMgb25seSBuZWVkcyBoYXJ0aW5kZXhfdG9fY29udGV4dF90YWJsZVsyXSwgd2hpY2ggb25s
eQo+IG5lZWRzIDE2IGJ5dGVzLgo+Cj4gVGhpcyBjb21taXQgY2FsY3VsYXRlcyBuZWVkZWQgc2l6
ZSBvZiBoYXJ0aW5kZXhfdG9fY29udGV4dF90YWJsZVtdCj4gYWNjb3JkaW5nIHRvIHN1cHBvcnRl
ZCBudW1iZXIgb2YgaGFydHMgb24gdGhlIHBsYXRmb3JtIHdoZW4gcmVnaXN0ZXJpbmcKPiBwZXIt
ZG9tYWluIGRhdGEsIHNvIHRoYXQgbWVtb3J5IHVzYWdlIG9mIHBlci1kb21haW4gY29udGV4dCBk
YXRhIGNhbiBiZQo+IHJlZHVjZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbHZpbiBDaGFuZyA8YWx2
aW5nYUBhbmRlc3RlY2guY29tPgo+IC0tLQo+ICBsaWIvc2JpL3NiaV9kb21haW5fY29udGV4dC5j
IHwgMzMgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIv
c2JpL3NiaV9kb21haW5fY29udGV4dC5jIGIvbGliL3NiaS9zYmlfZG9tYWluX2NvbnRleHQuYwo+
IGluZGV4IDQwN2MwZDUuLjBlNWMxYzIgMTAwNjQ0Cj4gLS0tIGEvbGliL3NiaS9zYmlfZG9tYWlu
X2NvbnRleHQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbl9jb250ZXh0LmMKPiBAQCAtNTMs
MzEgKzUzLDMyIEBAIHN0cnVjdCBoYXJ0X2NvbnRleHQgewo+ICAgICAgICAgYm9vbCBpbml0aWFs
aXplZDsKPiAgfTsKPgo+IC1zdHJ1Y3QgZG9tYWluX2NvbnRleHRfcHJpdiB7Cj4gLSAgICAgICAv
KiogQ29udGV4dHMgZm9yIHBvc3NpYmxlIEhBUlRzIGluZGV4ZWQgYnkgaGFydGluZGV4ICovCj4g
LSAgICAgICBzdHJ1Y3QgaGFydF9jb250ZXh0ICpoYXJ0aW5kZXhfdG9fY29udGV4dF90YWJsZVtT
QklfSEFSVE1BU0tfTUFYX0JJVFNdOwo+IC19Owo+IC0KPiAgc3RhdGljIHN0cnVjdCBzYmlfZG9t
YWluX2RhdGEgZGNwcml2ID0gewo+IC0gICAgICAgLmRhdGFfc2l6ZSA9IHNpemVvZihzdHJ1Y3Qg
ZG9tYWluX2NvbnRleHRfcHJpdiksCj4gKwo+ICB9OwoKTm8gbmVlZCBmb3IgdGhlICJ7IH0iIGFz
IHdlbGwuIEkgaGF2ZSBkcm9wcGVkIHRoZSAieyB9IiBhdCB0aGUgdGltZQpvZiBtZXJnaW5nIHRo
aXMgcGF0Y2guCgo+Cj4gIHN0YXRpYyBpbmxpbmUgc3RydWN0IGhhcnRfY29udGV4dCAqaGFydF9j
b250ZXh0X2dldChzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgaGFydGluZGV4KQo+ICB7Cj4gLSAg
ICAgICBzdHJ1Y3QgZG9tYWluX2NvbnRleHRfcHJpdiAqZGNwID0gc2JpX2RvbWFpbl9kYXRhX3B0
cihkb20sICZkY3ByaXYpOwo+ICsgICAgICAgc3RydWN0IGhhcnRfY29udGV4dCAqKmRvbV9oYXJ0
aW5kZXhfdG9fY29udGV4dF90YWJsZTsKPiArCj4gKyAgICAgICBkb21faGFydGluZGV4X3RvX2Nv
bnRleHRfdGFibGUgPSBzYmlfZG9tYWluX2RhdGFfcHRyKGRvbSwgJmRjcHJpdik7Cj4gKyAgICAg
ICBpZiAoIWRvbV9oYXJ0aW5kZXhfdG9fY29udGV4dF90YWJsZSB8fCAhc2JpX2hhcnRpbmRleF92
YWxpZChoYXJ0aW5kZXgpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVMTDsKPgo+IC0gICAg
ICAgcmV0dXJuIChkY3AgJiYgaGFydGluZGV4IDwgU0JJX0hBUlRNQVNLX01BWF9CSVRTKSA/Cj4g
LSAgICAgICAgICAgICAgIGRjcC0+aGFydGluZGV4X3RvX2NvbnRleHRfdGFibGVbaGFydGluZGV4
XSA6IE5VTEw7Cj4gKyAgICAgICByZXR1cm4gZG9tX2hhcnRpbmRleF90b19jb250ZXh0X3RhYmxl
W2hhcnRpbmRleF07Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBoYXJ0X2NvbnRleHRfc2V0KHN0cnVj
dCBzYmlfZG9tYWluICpkb20sIHUzMiBoYXJ0aW5kZXgsCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBzdHJ1Y3QgaGFydF9jb250ZXh0ICpoYykKPiAgewo+IC0gICAgICAgc3RydWN0IGRv
bWFpbl9jb250ZXh0X3ByaXYgKmRjcCA9IHNiaV9kb21haW5fZGF0YV9wdHIoZG9tLCAmZGNwcml2
KTsKPiArICAgICAgIHN0cnVjdCBoYXJ0X2NvbnRleHQgKipkb21faGFydGluZGV4X3RvX2NvbnRl
eHRfdGFibGU7Cj4KPiAtICAgICAgIGlmIChkY3AgJiYgaGFydGluZGV4IDwgU0JJX0hBUlRNQVNL
X01BWF9CSVRTKQo+IC0gICAgICAgICAgICAgICBkY3AtPmhhcnRpbmRleF90b19jb250ZXh0X3Rh
YmxlW2hhcnRpbmRleF0gPSBoYzsKPiArICAgICAgIGRvbV9oYXJ0aW5kZXhfdG9fY29udGV4dF90
YWJsZSA9IHNiaV9kb21haW5fZGF0YV9wdHIoZG9tLCAmZGNwcml2KTsKPiArICAgICAgIGlmICgh
ZG9tX2hhcnRpbmRleF90b19jb250ZXh0X3RhYmxlIHx8ICFzYmlfaGFydGluZGV4X3ZhbGlkKGhh
cnRpbmRleCkpCj4gKyAgICAgICAgICAgICAgIHJldHVybjsKPiArCj4gKyAgICAgICBkb21faGFy
dGluZGV4X3RvX2NvbnRleHRfdGFibGVbaGFydGluZGV4XSA9IGhjOwo+ICB9Cj4KPiAgLyoqIE1h
Y3JvIHRvIG9idGFpbiB0aGUgY3VycmVudCBoYXJ0J3MgY29udGV4dCBwb2ludGVyICovCj4gQEAg
LTIzMiw2ICsyMzMsMTQgQEAgaW50IHNiaV9kb21haW5fY29udGV4dF9leGl0KHZvaWQpCj4KPiAg
aW50IHNiaV9kb21haW5fY29udGV4dF9pbml0KHZvaWQpCj4gIHsKPiArICAgICAgIC8qKgo+ICsg
ICAgICAgICogQWxsb2NhdGUgcGVyLWRvbWFpbiBhbmQgcGVyLWhhcnQgY29udGV4dCBkYXRhLgo+
ICsgICAgICAgICogVGhlIGRhdGEgdHlwZSBpcyAic3RydWN0IGhhcnRfY29udGV4dCAqKiIgd2hv
c2UgbWVtb3J5IHNwYWNlIHdpbGwgYmUKPiArICAgICAgICAqIGR5bmFtaWNhbGx5IGFsbG9jYXRl
ZCBieSBkb21haW5fc2V0dXBfZGF0YV9vbmUoKS4gQ2FsY3VsYXRlIG5lZWRlZAo+ICsgICAgICAg
ICogc2l6ZSBvZiBtZW1vcnkgc3BhY2UgaGVyZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgZGNw
cml2LmRhdGFfc2l6ZSA9IHNpemVvZihzdHJ1Y3QgaGFydF9jb250ZXh0ICopICogc2JpX2hhcnRf
Y291bnQoKTsKPiArCj4gICAgICAgICByZXR1cm4gc2JpX2RvbWFpbl9yZWdpc3Rlcl9kYXRhKCZk
Y3ByaXYpOwo+ICB9Cj4KPiAtLQo+IDIuNDMuMAo+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJp
c2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0
Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
