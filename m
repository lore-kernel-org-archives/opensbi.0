Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5C14CA0FF9
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 17:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PWhbSBxYcwW334VjJGfZQasANWug8XuVRryoesmrOhI=; b=MPCqEs178Itjq3
	W8oSMDHfvyjiBbJbn2YpM+Ov5FXX1nhZFH+93Zf8m26HRCp7pbCs9Qjg5MJCZjbc470VQfIIw/ARA
	FywtTbADFDC+yCL6aWBdFLMia9Qw7zAOT+eBwkoCsOdA6LRjga0gqOe81QLHWTF8FSG0mENOrhQ5C
	0jV550QjG3RfT+PahiONGDQgAqcnmH7+6rbIOq4/lMlQoABn2CKVKS6q+8IAw5BfZnVz1Wtt3wqmh
	aAXx0mC9CbE+m+v0P1pdPTf41Zjno8w3SEaxaki7QMF4OTqtqWsBMRgd7aOGGAmro2+dxI/zQpWg0
	AeMrUWR7I+a1GB0JPLCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urgQk-00000002WO0-1n3f;
	Thu, 28 Aug 2025 17:28:58 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ureBz-000000022DO-09b6
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 15:05:36 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f6017004dso756321e87.0
        for <opensbi@lists.infradead.org>; Thu, 28 Aug 2025 08:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756393532; x=1756998332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tC0/NfusJrsB0S7U5Yb7RDLXTdPxI2ZiCXVxUxWiUm0=;
        b=ZCdXdB0arAebE2R9+ozOqb/PVwQMGFDeK/Gezwrl/5YDy0w1qFgYR67mELj9V6nDKC
         7pxt7/SVSoolt1VQy6wbpTC1CkhJFpCZ/csCxxwoEGxE+PT/6Hx9deCf6DTY9UKjPgre
         DgAO+Z4Q0wDc9upnk8LxpUd3OvtdEYPMwkxDmyrITsSbRAbWrGTQJadXRRFb+eZmxZ3Y
         bSiFQbRSw57BvKGCU/pBqmwIBzbDQioIQF28/RHZYpb8aCLdwISMEcL1s9Dh6TInNnu3
         EY13GuA+Y5qRqqpMJO8F1tI4Z0iB4WODYeujuWCa7twJAuAlWjGO2k1YG+gMUYjB20QG
         UYQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756393532; x=1756998332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tC0/NfusJrsB0S7U5Yb7RDLXTdPxI2ZiCXVxUxWiUm0=;
        b=rsh4KD5cow/oPNqKHVQRKHXeVN8Y+qZ6r19nqAoCf3xrdeVxS3nGFpq4na9cHEMlEW
         8hKARtvOnLhpl5e1gVnWdnIemCxG8PY07Dd8Zmmh2NKYrXm/EfmplT+XC8VR20iMBGta
         ngJWfxxvauGAIfRSNLcWPq1SXNFZZq0YjaITo3GSnab3HqeeqQ59nRGoCdFNpxXYZeXq
         kAQbIsEBehLoOag6slmpGgW3u/yBi7f6v6xAJkOM9zoKvMyDur150MoWMI10W0WhTvln
         S292Si1kZNaX71RN8pyhuUnK2qP760KLBrG4BkvrkpXJICwa654SOLunVIFhyPGnnZts
         A0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY3fk1Gg7maz3xHkQwOfbvW76KvjtqaUMcuK5Tun5PI5LLE+RUhPmjy+6ljocrawsqVs2uMAEv@lists.infradead.org
X-Gm-Message-State: AOJu0YzyURT34TnrnAgCI842W+iQWFk92zk9Vh5TsoTtACMD8GRpiByr
	JsYLhb+5bjGMV7QerwuguMoN4wJtUicmi25/HpOSME1wbCs/kDsJB4LIi8BxMfwXuWNcJkaQuCB
	4f8/CCGGrV0oiXaPXCgGXyGkwTkxbD2IcSW6S9p1+bQ==
X-Gm-Gg: ASbGncvE4GfPCW6cyc808RXwMzftF0pu8rOWEwzQAK6in+WKfpX7ZMGJeeyMFqRdu82
	Qv/xe9eW+yDiqvHkd0HsDOHo22/84fDJFtVyb1bGoGQHKbF+4nXYroBHHxFIaB25SYlr+wZH4I9
	iGGpKSLae7HZXVtGtEE4EMhP6nvmnXefvUfpADPDHk/n8G0xLScf8aW/SSBEbF4x3+UsHVwdRc6
	PsufUXR21XyxTIDBDw=
X-Google-Smtp-Source: AGHT+IFkKE3S/kPbFbWZ47ncbosYmh9QcWx8c+q/znP2WK5EA+dxy2NyDSGn2b/2Vt+IxS8nUv2UbG/CR986hVnkBfc=
X-Received: by 2002:a05:6512:258a:b0:55f:5516:4160 with SMTP id
 2adb3069b0e04-55f5516437emr2109891e87.37.1756393532306; Thu, 28 Aug 2025
 08:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250723204010.9927-1-cfu@mips.com> <CAAhSdy2VRE_bfqhae+ZCxwH-rZnmm+uL+nfYAzTXEn=C84L80Q@mail.gmail.com>
 <98E5DC08-1B1A-4F27-A520-4281A4C6B436@jrtc27.com> <1A02827E-2E3E-4064-985C-4FBCD1F69019@jrtc27.com>
In-Reply-To: <1A02827E-2E3E-4064-985C-4FBCD1F69019@jrtc27.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 28 Aug 2025 20:35:19 +0530
X-Gm-Features: Ac12FXwlfjpDuIZ2cX5INhFpIKNqi5uwwHUI2ITnNFpqo_HsHF77beVe_Iiltds
Message-ID: <CAK9=C2VsMKawQHHKFznyqDrb3TBHr-KuFrv6WdAru0ZQZ_Rwog@mail.gmail.com>
Subject: Re: [PATCH v3] generic: mips: support harts to boot from mips_warm_boot
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Anup Patel <anup@brainfault.org>, Chao-ying Fu <icebergfu@gmail.com>, 
	opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_080535_079769_9B4CAFA4 
X-CRM114-Status: GOOD (  32.71  )
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

T24gVGh1LCBBdWcgMjgsIDIwMjUgYXQgMTI6MTfigK9QTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3
QGpydGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMjggQXVnIDIwMjUsIGF0IDA3OjIwLCBKZXNzaWNh
IENsYXJrZSA8anJ0YzI3QGpydGMyNy5jb20+IHdyb3RlOgo+ID4gT24gMjggQXVnIDIwMjUsIGF0
IDA2OjMyLCBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+PiBPbiBU
aHUsIEp1bCAyNCwgMjAyNSBhdCAyOjEw4oCvQU0gQ2hhby15aW5nIEZ1IDxpY2ViZXJnZnVAZ21h
aWwuY29tPiB3cm90ZToKPiA+Pj4KPiA+Pj4gV2UgcHJvZ3JhbSByZXNldCBiYXNlIGZvciBoYXJ0
cyAob3RoZXIgdGhhbiBoYXJ0IDApIHRvIGJvb3QgYXQKPiA+Pj4gbWlwc193YXJtX2Jvb3QgdGhh
dCBqdW1wcyB0byBfc3RhcnRfd2FybS4gVGhpcyBoZWxwcyB0byBza2lwIHNvbWUgY29kZQo+ID4+
PiBzZXF1ZW5jZSB0byBzcGVlZCB1cC4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogQ2hhby15
aW5nIEZ1IDxjZnVAbWlwcy5jb20+Cj4gPj4+IC0tLQo+ID4+PiBwbGF0Zm9ybS9nZW5lcmljL21p
cHMvbWlwc193YXJtX2Jvb3QuUyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gPj4+IHBsYXRm
b3JtL2dlbmVyaWMvbWlwcy9vYmplY3RzLm1rICAgICAgIHwgIDIgKy0KPiA+Pj4gcGxhdGZvcm0v
Z2VuZXJpYy9taXBzL3A4NzAwLmMgICAgICAgICAgfCAgNSArKysrKwo+ID4+PiAzIGZpbGVzIGNo
YW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiA+Pj4gY3JlYXRlIG1vZGUg
MTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBzX3dhcm1fYm9vdC5TCj4gPj4+Cj4gPj4+
IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUyBiL3Bs
YXRmb3JtL2dlbmVyaWMvbWlwcy9taXBzX3dhcm1fYm9vdC5TCj4gPj4+IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0Cj4gPj4+IGluZGV4IDAwMDAwMDAuLjI1Y2RiODMKPiA+Pj4gLS0tIC9kZXYvbnVsbAo+
ID4+PiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUwo+ID4+PiBA
QCAtMCwwICsxLDIwIEBACj4gPj4+ICsvKgo+ID4+PiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZp
ZXI6IEJTRC0yLUNsYXVzZQo+ID4+PiArICoKPiA+Pj4gKyAqIENvcHlyaWdodCAoYykgMjAyNSBN
SVBTCj4gPj4+ICsgKgo+ID4+PiArICovCj4gPj4+ICsgICAgICAgLnRleHQKPiA+Pj4gKyAgICAg
ICAuYWxpZ24gIDEyCj4gPj4+ICsgICAgICAgLmdsb2JsICBtaXBzX3dhcm1fYm9vdAo+ID4+PiAr
bWlwc193YXJtX2Jvb3Q6Cj4gPj4+ICsgICAgICAgaiAgICAgICBfc3RhcnRfd2FybQo+ID4+PiAr
ICAgICAgIC5hbGlnbiAgMgo+ID4+PiArbm1pX3ZlY3RvcjoKPiA+Pj4gKyAgICAgICBqICAgICAg
IF9zdGFydF93YXJtCj4gPj4+ICsgICAgICAgLmFsaWduICAyCj4gPj4+ICtjYWNoZWVycl92ZWN0
b3I6Cj4gPj4+ICsgICAgICAgaiAgICAgICBfc3RhcnRfd2FybQo+ID4+PiArICAgICAgIC5hbGln
biAgMgo+ID4+PiArZGVidWdleGNfdmVjdG9yOgo+ID4+PiArICAgICAgIGogICAgICAgX3N0YXJ0
X3dhcm0KPiA+Pgo+ID4+IG5taV92ZWN0b3IsIGNhY2hlZXJyX3ZlY3RvciwgYW5kIGRlYnVnZXhj
X3ZlY3RvciBhcmUgbm90IHVzZWQKPiA+PiBhbnl3aGVyZSBzbyBJIGhhdmUgZHJvcHBlZCB0aGVz
ZSBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLiBQbGVhc2UKPiA+PiBzZW5kIHNlcGFyYXRlIHBhdGNo
ZXMgdG8gYWRkIHRoZXNlIHdoZW4gdGhleSBhcmUgYmVpbmcgdXNlZAo+ID4+IHNvbWV3aGVyZS4K
PiA+Pgo+ID4+IFJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgo+
ID4+Cj4gPj4gQXBwbGllZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCj4g
Pgo+ID4gVWggSeKAmW0gcHJldHR5IHN1cmUgdGhpcyBpcyBhIHJlc2V0IHZlY3RvciwgYW5kIGVh
Y2ggbGFiZWwgaXMgbmFtaW5nIHRoZQo+ID4gZGlmZmVyZW50IGVudHJpZXMgaW4gdGhlIHZlY3Rv
ciwgbXVjaCBsaWtlIGZvciBtdHZlYy5NT0RFPVZlY3RvcmVkLCBhbmQKPiA+IHRoZXJlZm9yZSB0
aGUgcmVzdWx0IG9mIGRlbGV0aW5nIHRob3NlIHZlY3RvciBlbnRyaWVzIGlzIHRoYXQsIGlmIGFu
eQo+ID4gb2YgdGhvc2UgY2FzZXMgb2NjdXIsIGl0IHdpbGwgZW5kIHVwIHJ1bm5pbmcgd2hhdGV2
ZXIgcmFuZG9tIGNvZGUKPiA+IGhhcHBlbnMgdG8gYmUgYWZ0ZXIgdGhlIGZpcnN0IGVudHJ5Lgo+
ID4KPiA+IEnigJl2ZSBub3RpY2VkIHlvdSBhcmUgcXVpdGUgZWFnZXIgdG8gbW9kaWZ5IHBlb3Bs
ZeKAmXMgcGF0Y2hlcyBiZWZvcmUKPiA+IGFwcGx5aW5nIHRoZW0uIFJlZm9ybWF0dGluZyBpcyBv
bmUgdGhpbmcsIGJ1dCBkZWxldGluZyBhc3NlbWJseSBjb2RlIGlzCj4gPiBhbm90aGVyIHRoYXQg
SSB0aGluayBnb2VzIHRvbyBmYXIuIFBsZWFzZSBiZSBtb3JlIGNvbnNpZGVyYXRlIG9mIHRoZQo+
ID4gZmFjdCB0aGF0IHlvdSBtYXkgbm90IGJlIGNvcnJlY3QgaW4geW91ciBpbnRlcnByZXRhdGlv
biwgYW5kIHNvIGl0IGlzCj4gPiBub3QgYXBwcm9wcmlhdGUgdG8gdW5pbGF0ZXJhbGx5IGNvbW1p
dCB3aGF0ZXZlciB1bnJldmlld2VkIGNoYW5nZXMgeW91Cj4gPiB0aGluayBhcmUgYmVzdCwgZXNw
ZWNpYWxseSB3aGVuIGl0IGNvbWVzIHRvIHZlbmRvci1zcGVjaWZpYyBjb2RlIGZvcgo+ID4gd2hp
Y2ggeW91IGhhdmVu4oCZdCByZWFkIGFueSBvZiB0aGUgY29ycmVzcG9uZGluZyBtYW51YWxzLgo+
Cj4gRXNwZWNpYWxseSBzaW5jZSB5b3Uga2VlcCB0aGUgYXV0aG9yIGludGFjdCwgZG9u4oCZdCBh
ZGQgYW55IGtpbmQgb2YKPiBDby1hdXRob3JlZC1ieSBhbmQgZG9u4oCZdCBkb2N1bWVudCBhbnkg
b2YgdGhlIGNoYW5nZXMgeW91IGhhdmUgbWFkZQo+IGJldHdlZW4gdGhlIGF1dGhvcuKAmXMgU2ln
bmVkLW9mLWJ5IGFuZCB5b3Vycy4gVGhpcyBtZWFucyBpdCBsb29rcyBsaWtlCj4gaXTigJlzIHRo
ZSBzdWJtaXR0ZXLigJlzIGZhdWx0IHRoYXQgdGhlcmXigJlzIGEgYnVnIGluIHRoZSBjb21taXQs
IHdoZW4gaW4KPiByZWFsaXR5IHRoZXkgc3VibWl0dGVkIGEgY29ycmVjdCBwYXRjaCBhbmQgeW91
IGJyb2tlIGl0LiBUaGF04oCZcyBub3QgYQo+IHBhcnRpY3VsYXJseSBuaWNlIHRoaW5nIHRvIGhh
dmUgZG9uZSB0byBvbmXigJlzIHdvcmsuCj4KPiBNaWdodCBJIHN1Z2dlc3QsIGlmIHRoZSBnb2Fs
IGlzIHRvIGF2b2lkIHRoZSBhdXRob3IgbmVlZGluZyB0byBzdWJtaXQgYQo+IHZOKzEsIGF0IGxl
YXN0IGNvbmZpcm0gd2l0aCB0aGUgYXV0aG9yIHRoYXQgeW91ciBpbnRlbmRlZCBmaXhlcyBhcmUK
PiBjb3JyZWN0IGJlZm9yZSBmb2xkaW5nIHRoZW0gaW50byB0aGUgcGF0Y2ggeW91IGNvbW1pdD8g
QW5kLCBmb3IgbW9yZQo+IG1pbm9yIGNhc2VzLCBkb2N1bWVudCB0aGF0IHlvdeKAmXZlIG1hZGUg
Y2hhbmdlcywgd2hldGhlciBpbiB0aGUgTGludXgKPiBrZXJuZWwgY29tbWl0dGVyIHN0eWxlIHRo
YXQgc3RhdGVzIHdoYXQgeW914oCZdmUgYWN0dWFsbHkgZG9uZSwgb3IgYXQKPiBsZWFzdCBieSBh
ZGRpbmcgeW91ciBvd24gQ28tYXV0aG9yZWQtYnkgdG8gc3RhdGUgeW914oCZdmUgZG9uZSBzb21l
dGhpbmcKPiB1bnNwZWNpZmllZC4KPgoKSSBkb24ndCBtaW5kIGFkZGluZyBDby1kZXZlbG9wZWQt
YnkgYW5kIG1vcmUgY29tbWVudHMgYWJvdXQKbXkgY2hhbmdlcy4KClJlZ2FyZHMsCkFudXAKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
