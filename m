Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B2CCCF9F8
	for <opensbi@archiver.kernel.org>; Thu,  6 Nov 2025 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EagpDq34Qmxep/XdDWlsfbtPeb3FLGY8Cwhx7k1vcUw=; b=uC9FaymFjCvfTr
	CRJDtjiMkB0+S9JtinSrGkq1ZNrJJDEuuSKl/IRPLkJ0TCTWSa7iY3MTXaxRn5x6Md7R5DyyHydjN
	ulbzjUoddB2cLqwhfImaQ5Kvydc8613Rtp4U+o/gzjJRhNe250uzGUeGL5q8l1+lsYGhcDxHD9l8b
	uOyrPe88h9hyPGkhp1tGi4bh4RuH/F7aUZZkvLYBd13eb/3vg4FiPp7D2+P4eBPoHbTtMKLJtUPmG
	xuD0az4TKMKoK0KIwdjhGEHTL/XCHxm72QsLUFVkKnv1zBh384X5KUIUER0FgYxvHvo+eqTF1IXM8
	y5GbD0+irJ+4KM9RtRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxBo-0000000FJxV-1JDd;
	Thu, 06 Nov 2025 10:26:00 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGxBl-0000000FJwo-2Alo
	for opensbi@lists.infradead.org;
	Thu, 06 Nov 2025 10:25:58 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-4331e9cb748so3352905ab.1
        for <opensbi@lists.infradead.org>; Thu, 06 Nov 2025 02:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1762424756; x=1763029556; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lEIru5q2EB2EeNRiDlwtOIOw95AObmGoOQgLdaPT8l4=;
        b=umWfiKCgNd5j+4xrrS3qmmXsHHmOr1RqF8mOw2WF8ej4fRPeBP1P8hpNXn5752QZAD
         HVoGR51RoUm3sEk/b28xkJeSw4AG7R+Bd2keWPOFk0lniw7mIawc5eCQI3Lm12cpyMG7
         WUIpoN+x7a6DnrdR8hOk9AVOX5RcgHA/mpqDb1U3h7wHgvbqiSdhhG3xDzLvzATr67op
         bouNRuTPAS+YkMQ59iSVN8rt8KwzG1Bb7MHWpdFdQCaIDTHDEVTl8tQLcZAXzzlZa+82
         k+kh21ShSZK33Mls1YlzrFxYqkmZ9a8vOMeho5HMGwm4V6MP4ZCxAF7GgyCvkcCWYjbr
         0G7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762424756; x=1763029556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lEIru5q2EB2EeNRiDlwtOIOw95AObmGoOQgLdaPT8l4=;
        b=oHOJORyFVr/RkJtnHWOt83Jg0Kk9aUlDNC1fQ389bwm4fDVss+J8zn9ZUOH1vripG6
         XjExHP7ReM0nFuRe2Z2gaRZo48lFDFQu8P6p9GB7rh92naB2Vnw8zW3sZcUb88/m024X
         vF3rMto/bUvZ/asERgR9wele8cehmNVysx4Ih3h55uqwq8m0DYDV73L/yRiVPeht2OqS
         4pG4iXd7EIK+/iWiZrP9xTJNTzPnDmEvbmrlxf96sv+BwSoUB9LVWgxxjJFuOZhLTb1+
         bgEqEmRh68x4p+GcGtGCoEuUGwek0nfvp1epIpo4+VraaFSrI09/2nur4kQ12/FAGcUj
         Y7dw==
X-Gm-Message-State: AOJu0Ywb7S5pSXlTuD/RxgTy66QHqqVc8lp+iRd0S5rNogbCj7WX7wF8
	FWeqNI6Gq8DBFFOGSxieiN4fkyPM2z9cSefu9J4ckGGkOsvMeRQNc7/XFt/1NQ2SZC8qNL7ncn/
	GLDGesHhJVWtaj1w3EK/HMSec6kYmqV/k0jTnzgbWqg==
X-Gm-Gg: ASbGncsXrKGgo9dyjUKdYqr+CxcTN4lffxEZGsiF7CT4ijFDMlJIVDGD7MdkgNGopEV
	hcvF62cglkSUCubuQVnu1FddzzxQ4xHgqK2Mea3PwP5wxmBKnBr/oEF6cOF125JvtYBiwHm22wu
	6iOK1Hkt/DCTRlSknuZNW8cUyd/G08JZXBZsIab07xOuPDLrHX6iui/wjaGY7uJa5Il9OHYyZ5L
	+apJcRa9SjfzM/J6iwOupJP9Q046n0kumaVGnpgyLN+NKSeiwUto6EpsCbU2urr6a9QnY+f
X-Google-Smtp-Source: AGHT+IH/UDJFs2tXL04SX7qUbOUYE8xSfhvd4oDb8TTg0dK6dpiBJ0PyrVD1vTNKqv0mcPztyOagkXq2oFQWdZ5tRP8=
X-Received: by 2002:a05:6e02:3b84:b0:433:37e9:c1ff with SMTP id
 e9e14a558f8ab-4334ee674eamr35065805ab.9.1762424756513; Thu, 06 Nov 2025
 02:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20251027-p8700-aclint-v2-0-f10cbfb66e92@bootlin.com>
 <20251027-p8700-aclint-v2-2-f10cbfb66e92@bootlin.com> <CAAhSdy3QTuFkuqjGaibU5btxxbsANwLpwaiku30cavG+jtrKwQ@mail.gmail.com>
 <4998143.OV4Wx5bFTl@benoit.monin>
In-Reply-To: <4998143.OV4Wx5bFTl@benoit.monin>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 6 Nov 2025 15:55:44 +0530
X-Gm-Features: AWmQ_bnFXdohSloso5k7BqjhO8WiZ-kVWN10FZ1MrkSPkR3zW0bqiK1jIntUP4U
Message-ID: <CAAhSdy0hH-FDM6sNd=o_qnO67LDojDr6QE6O+n1H9XqB6eFe6A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] lib: utils/timer: mtimer: add MIPS P8700 compatible
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: opensbi@lists.infradead.org, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_022557_800510_C66B3F40 
X-CRM114-Status: GOOD (  35.06  )
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

T24gVGh1LCBOb3YgNiwgMjAyNSBhdCAyOjU44oCvUE0gQmVub8OudCBNb25pbiA8YmVub2l0Lm1v
bmluQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IEhpIEFudXAsCj4KPiBPbiBXZWRuZXNkYXksIDUg
Tm92ZW1iZXIgMjAyNSBhdCAxNzoxMToxMSBDRVQsIEFudXAgUGF0ZWwgd3JvdGU6Cj4gPiBPbiBN
b24sIE9jdCAyNywgMjAyNSBhdCA2OjQy4oCvUE0gQmVub8OudCBNb25pbiA8YmVub2l0Lm1vbmlu
QGJvb3RsaW4uY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gVGhlIE1USU1FUiBvZiB0aGUgTUlQUyBQ
ODcwMCBpcyBjb21wbGlhbnQgd2l0aCB0aGUgQUNMSU5UIHNwZWNpZmljYXRpb24sCj4gPiA+IHNv
IGFkZCBhIGNvbXBhdGlibGUgc3RyaW5nIGZvciBpdC4KPiA+ID4KPiA+ID4gSW4gYSBtdWx0aS1j
bHVzdGVyIGNvbmZpZ3VyYXRpb24sIHRoZXJlIGlzIG9uZSBNVElNRVIgcGVyIGNsdXN0ZXIsIGVh
Y2gKPiA+ID4gYXNzb2NpYXRlZCB3aXRoIHRoZSBIQVJUUyBvZiB0aGUgY2x1c3Rlci4gU28gd2Ug
ZG8gbm90IGhhdmUgYSBNVElNRVIKPiA+ID4gd2l0aCBubyBhc3NvY2lhdGVkIEhBUlRzIHRvIHVz
ZSBhcyBvdXIgcmVmZXJlbmNlLgo+ID4gPgo+ID4gPiBUbyBiZSBhYmxlIHRvIHNlbGVjdCBhIHJl
ZmVyZW5jZSBNVElNRVIgaW4gdGhhdCBjYXNlLCBhZGQgYSBxdWlyayB0byBsb29rCj4gPiA+IHVw
IGFuIG9wdGlvbmFsIGRldmljZSB0cmVlIHByb3BlcnR5IHRoYXQgaW5kaWNhdGUgd2hpY2ggTVRJ
TUVSIHRvIHVzZS4KPiA+ID4gRm9yIHRoZSBNSVBTIFA4NzAwLCB0aGUgcHJvcGVydHkgaXMgIm1p
cHMscmVmZXJlbmNlLW10aW1lciIuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJlbm/DrnQg
TW9uaW4gPGJlbm9pdC5tb25pbkBib290bGluLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBsaWIvdXRp
bHMvdGltZXIvZmR0X3RpbWVyX210aW1lci5jIHwgMjUgKysrKysrKysrKysrKysrKysrKy0tLS0t
LQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
Cj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVyX210aW1l
ci5jIGIvbGliL3V0aWxzL3RpbWVyL2ZkdF90aW1lcl9tdGltZXIuYwo+ID4gPiBpbmRleCBlMWZk
MDUxLi5lOThjOTlmIDEwMDY0NAo+ID4gPiAtLS0gYS9saWIvdXRpbHMvdGltZXIvZmR0X3RpbWVy
X210aW1lci5jCj4gPiA+ICsrKyBiL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMK
PiA+ID4gQEAgLTIwLDYgKzIwLDcgQEAgc3RydWN0IHRpbWVyX210aW1lcl9xdWlya3Mgewo+ID4g
PiAgICAgICAgIHVuc2lnbmVkIGludCAgICBjbGludF9tdGltZV9vZmZzZXQ7Cj4gPiA+ICAgICAg
ICAgYm9vbCAgICAgICAgICAgIGNsaW50X3dpdGhvdXRfbXRpbWU7Cj4gPiA+ICAgICAgICAgYm9v
bCAgICAgICAgICAgIGhhc182NGJpdF9tbWlvOwo+ID4gPiArICAgICAgIGNvbnN0IGNoYXIgICAg
ICAqZHRfcmVmX3Byb3A7Cj4gPiA+ICB9Owo+ID4gPgo+ID4gPiAgc3RydWN0IHRpbWVyX210aW1l
cl9ub2RlIHsKPiA+ID4gQEAgLTM5LDYgKzQwLDcgQEAgc3RhdGljIGludCB0aW1lcl9tdGltZXJf
Y29sZF9pbml0KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gPiA+ICAgICAgICAgc3Ry
dWN0IGFjbGludF9tdGltZXJfZGF0YSAqbXQ7Cj4gPiA+ICAgICAgICAgY29uc3Qgc3RydWN0IHRp
bWVyX210aW1lcl9xdWlya3MgKnF1aXJrcyA9IG1hdGNoLT5kYXRhOwo+ID4gPiAgICAgICAgIGJv
b2wgaXNfY2xpbnQgPSBxdWlya3MgJiYgcXVpcmtzLT5pc19jbGludDsKPiA+ID4gKyAgICAgICBi
b29sIGlzX3JlZiA9IGZhbHNlOwo+ID4gPgo+ID4gPiAgICAgICAgIG10biA9IHNiaV96YWxsb2Mo
c2l6ZW9mKCptdG4pKTsKPiA+ID4gICAgICAgICBpZiAoIW10bikKPiA+ID4gQEAgLTExMCwxMyAr
MTEyLDE4IEBAIHN0YXRpYyBpbnQgdGltZXJfbXRpbWVyX2NvbGRfaW5pdChjb25zdCB2b2lkICpm
ZHQsIGludCBub2Rlb2ZmLAo+ID4gPiAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAvKgo+
ID4gPiAtICAgICAgICAqIFNlbGVjdCBmaXJzdCBNVElNRVIgZGV2aWNlIHdpdGggbm8gYXNzb2Np
YXRlZCBIQVJUcyBhcyBvdXIKPiA+ID4gLSAgICAgICAgKiByZWZlcmVuY2UgTVRJTUVSIGRldmlj
ZS4gVGhpcyBpcyBvbmx5IGEgdGVtcG9yYXJ5IHN0cmF0ZWd5Cj4gPiA+IC0gICAgICAgICogb2Yg
c2VsZWN0aW5nIHJlZmVyZW5jZSBNVElNRVIgZGV2aWNlLiBJbiBmdXR1cmUsIHdlIG1pZ2h0Cj4g
PiA+IC0gICAgICAgICogZGVmaW5lIGFuIG9wdGlvbmFsIERUIHByb3BlcnR5IG9yIHNvbWUgb3Ro
ZXIgbWVjaGFuaXNtIHRvCj4gPiA+IC0gICAgICAgICogaGVscCB1cyBzZWxlY3QgdGhlIHJlZmVy
ZW5jZSBNVElNRVIgZGV2aWNlLgo+ID4gPiArICAgICAgICAqIElmIHdlIGhhdmUgYSBEVCBwcm9w
ZXJ0eSB0byBpbmRpY2F0ZSB3aGljaCBNVElNRVIgaXMgdGhlIHJlZmVyZW5jZSwKPiA+ID4gKyAg
ICAgICAgKiBzZWxlY3QgdGhlIGZpcnN0IE1USU1FUiBkZXZpY2UgdGhhdCBoYXMgaXQuIE90aGVy
d2lzZSwgc2VsZWN0IHRoZQo+ID4gPiArICAgICAgICAqIGZpcnN0IE1USU1FUiBkZXZpY2Ugd2l0
aCBubyBhc3NvY2lhdGVkIEhBUlRzIGFzIG91ciByZWZlcmVuY2UuCj4gPiA+ICAgICAgICAgICov
Cj4gPiA+IC0gICAgICAgaWYgKCFtdC0+aGFydF9jb3VudCAmJiAhbXRfcmVmZXJlbmNlKSB7Cj4g
PiA+ICsgICAgICAgaWYgKHF1aXJrcyAmJiBxdWlya3MtPmR0X3JlZl9wcm9wKSB7Cj4gPiA+ICsg
ICAgICAgICAgICAgICBpZiAoZmR0X2dldHByb3AoZmR0LCBub2Rlb2ZmLCBxdWlya3MtPmR0X3Jl
Zl9wcm9wLCBOVUxMKSkKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaXNfcmVmID0gdHJ1
ZTsKPiA+ID4gKyAgICAgICB9IGVsc2UgaWYgKCFtdC0+aGFydF9jb3VudCkgewo+ID4gPiArICAg
ICAgICAgICAgICAgaXNfcmVmID0gdHJ1ZTsKPiA+ID4gKyAgICAgICB9Cj4gPiA+ICsKPiA+ID4g
KyAgICAgICBpZiAoaXNfcmVmICYmICFtdF9yZWZlcmVuY2UpIHsKPiA+ID4gICAgICAgICAgICAg
ICAgIG10X3JlZmVyZW5jZSA9IG10Owo+ID4gPiAgICAgICAgICAgICAgICAgLyoKPiA+ID4gICAg
ICAgICAgICAgICAgICAqIFNldCByZWZlcmVuY2UgZm9yIGFscmVhZHkgcHJvcGJlZCBNVElNRVIg
ZGV2aWNlcwo+ID4gPiBAQCAtMTUyLDYgKzE1OSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHRp
bWVyX210aW1lcl9xdWlya3MgdGhlYWRfYWNsaW50X3F1aXJrcyA9IHsKPiA+ID4gICAgICAgICAu
aGFzXzY0Yml0X21taW8gICAgICAgICA9IGZhbHNlLAo+ID4gPiAgfTsKPiA+ID4KPiA+ID4gK3N0
YXRpYyBjb25zdCBzdHJ1Y3QgdGltZXJfbXRpbWVyX3F1aXJrcyBtaXBzX2FjbGludF9xdWlya3Mg
PSB7Cj4gPiA+ICsgICAgICAgLmR0X3JlZl9wcm9wICAgICAgICAgICAgPSAibWlwcyxyZWZlcmVu
Y2UtbXRpbWVyIiwKPiA+ID4gK307Cj4gPiA+ICsKPiA+Cj4gPiBJIHRoaW5rIHRoaXMgRFQgcHJv
cGVydHkgY2FuIGJlIHVzZWZ1bCB0byBvdGhlciBwbGF0Zm9ybXMgYXMgd2VsbC4KPiA+IEhvdyBh
Ym91dCAicmlzY3YscmVmZXJlbmNlLW10aW1lciIgYXMgYSBEVCBwcm9wZXJ0eSA/IFRoaXMgd2F5
Cj4gPiB5b3UgZG9uJ3QgbmVlZCB0byBtYWtlIGl0IGFzIE1JUFMgcXVpcmsuCj4gPgo+IEFDTElO
VCBpcyBub3QgYSByYXRpZmllZCBzcGVjaWZpY2F0aW9uLCBpcyBpdCBva2F5IHRvIHVzZSB0aGUg
InJpc2N2LCIKPiBwcmVmaXg/IFRoYXQncyB0aGUgcmVhc29uIEkgd2VudCB3aXRoIGEgdmVuZG9y
IHByZWZpeC4KPgoKSXQncyB1bmZvcnR1bmF0ZSB0aGF0IEFDTElOVCB3YXMgbm90IHJhdGlmaWVk
IGJ1dCBuZXZlcnRoZWxlc3MgaXQKaXMgYSBSSVNDLVYgZHJhZnQgc3BlY2lmaWNhdGlvbiBhbmQg
YXQgdGhpcyBwb2ludCBxdWl0ZSBhIGZldyBSSVNDLVYKcGxhdGZvcm1zIGhhdmUgYXQgbGVhc3Qg
aW1wbGVtZW50ZWQgdGhlIG10aW1lciBwYXJ0IG9mIHRoZSBBQ0xJTlQuCgpSZWdhcmRzLApBbnVw
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
