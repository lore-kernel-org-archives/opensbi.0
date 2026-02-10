Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5603EB26EA
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 16:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fW5E6DGNdBMBTbE1N8Dbh/HZI8wQIZFJxG3tWcxtM/A=; b=GhdwfVDU3ERJ8i
	wCxoUVCQlLUd+LtdoaN7R49V1MzJztA6MsLGcOAJfJA223onHzcG7R9Gat7xHFOIuDLFX4S2sERm1
	XgGjC2DEdw2qfGXf8CsH8V/k1AdJakJzl/kM+AV4CXpIEZCP1Okf0O42OFn95r4aaApJm6f8Dk0KB
	fh8DBzkEcNNso4AfVti6080o+F3zppBTvnyXBlzfKIVXE3s3fl+TsHs7O98lpQRDV3Xe7QdCMpyuQ
	WpBLdj3Vqn1xHhwKo+uqz4OeP7cw9zP2ImuJWBSfGhcMlPs9b7V2wHmSTS21sQXSsRbAO16PBFYeT
	kPYuo27EKeKqpRQGHiIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpr42-0000000HHL7-1ENP;
	Tue, 10 Feb 2026 16:58:14 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpr40-0000000HHKm-0oBV
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 16:58:13 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id ada2fe7eead31-5fa26e497feso342807137.3
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 08:58:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770742691; cv=none;
        d=google.com; s=arc-20240605;
        b=UPi/zQEIjRL9+OUZnoF6V6pBOwyEi2yTPW7OiaTOp1tHcdL7NfiQfIw1o5Tlh6/zXy
         Oy1NMPV/Xz+0Hfb8nI5B8/kAwJlpbt8mIo0XFG3IXCUr8m6tlVO2UgLfDx/zwnC/SET3
         US/L0g8KGuBqKx76pjCUgx2SnBn4XWpRq2uflDjZIKpL3VbEOJGp9hpHDFYKh6decHSF
         anMvMWDcjsCUlXHf6EGMl0DLvaCxtP63RGpWAm871h38XItVvdWiXKD7HBBiz2Fuhd+7
         nHb+N3jbT1AS+7mSsGPiVgcINPFrCfJ3ZLpe/VhqqNKTyrn/WhJo0pvcFTVkNFCB2RkY
         gohQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mfWfjZCHnlU9VCTAckzEOJm/cDhgxXJsLAIv33znp+I=;
        fh=lPW0v4LwOKg6/7zx2mws19OKWZ+6bwbS69cpuSK5MtU=;
        b=SIfretP3OdztqYF/R/TpsGkNfLUWvUU/bjxkP04s7S4HXJpDHiljbE17L5gZnOh9j3
         yvAhOx8rLyMQpHnEVXHK4XoZPW+lwfOO0AK06bN/LhKPfLHQYu2sy17SDthAORKWJZgj
         f9FSTbIqB75Resof0HabqDGoiuPI1SeXq0KkZi36kEN5PAcMYlxLjDmNF/YP53GG2Dop
         LM1FO8D/QPkJPK3ZNpsApWElbsoQX4ElHrcc8I7Do86ATr6okGVswsPDQpBWrJjKy6da
         TxrfLmTNNxLW5d+KzP0XR/N6kwiYgwbtfN3EtkuXeMT8cL8vH7awshkAm4XePPDbfetp
         Al0Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770742691; x=1771347491; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfWfjZCHnlU9VCTAckzEOJm/cDhgxXJsLAIv33znp+I=;
        b=UcUv81otS/7BzlTFbwRoOuvRfd5Ipto9zlDYRcJUJcSvWulrfZQIpHLHnUMfl3JCVW
         y5IFaXujapA9y7JfE/HbJekxSeSIVj3W1+8jLa17s+OA5XeCEb72dczVJ4cLKtGpoxjX
         mWzqG1F1kMbSyIOpQXZEIzHneK7LbpESvPoz0IJB6+l4H8ujFey4U7USH7PvJdaMnhTk
         cEWUWfpSy2ksuD1UR3aDoQAS+OrZw1P2ZLZM2KieKStVPOp6wRJuBLy5ptFSetB6roUJ
         C9x8rS3TOCyhzWIdAiUomojYFi348DNsZYjoKeiGGYpF7oyPMy+xXZ1/wZKZjkosRgcQ
         BVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770742691; x=1771347491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfWfjZCHnlU9VCTAckzEOJm/cDhgxXJsLAIv33znp+I=;
        b=jdPXfSUKzXAbMsv/HEY/kTeHUnJXq9uHFjOD09Jd1He5opthh8KCfeMNU21N7mTHrM
         bMA/YeRz1sqerCqhCQwXFyMWzhd/JBoYE7lfcXLyg3jnq59+FnhGL8cmSVP77e76Vi94
         +tSkk77tbUVEtr30Ksbz+jjhxBBgIdfSd6JOfDUa/ZyyUpLy+qtsseE4iiiryWJ0Sqj6
         r6hag/pA0wSECphKRnW1jk9K0fTneJtaXrgKFo0g5JIXMIUE64eFS6HBnQqdJPUrrwRR
         VJNEGb25Ar/D2p9+OwxYhZI7jAQ0kxns8Ah0VtQlFL7c5CS1clKlsPjEsl4athh21Teu
         eVBA==
X-Forwarded-Encrypted: i=1; AJvYcCW1Dzz6SrV6oSANWigEMsQQB6uqxBX2q1ZY1dzkp3zXP9Z4u692beNPfa7oj1C99OBMTbSNViga@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb4mnttgMuzyhHjZmGiaEUz1oevlh5PN6iHEdXlW1CAzROhVy4
	NRjrUsaNnK2L/IBpMnrQNoAkHiul70iuT5ctqvNd76pZmw18zpGsnKBzmmqCcl8xzKh1KUwUOnE
	8jgmiG8CQL6wMfWcRlCcnQwAkcAaT4Ds=
X-Gm-Gg: AZuq6aLZzQllU/VqxdRXkmbOWNnMYkDiTFnwkFO+7lGB3LSSkGpJOBqCZaGJwbIcLgI
	rDufWLFsnddNg4oyKzazx3qEkM8rdGyF1D+VGLAVt/Ul3au/A6vrtKggaaJj7SxReNFSLKdvpTz
	TDKqUHMCB1T0mpZWqsvnCNdhSvkCT3n43Z4Q3IwfHSHt/LDpU/McFSj+LfimG9aK5+B0wB9MbRl
	Pvv7T+PVPghC1NdKN0Sv7mx8zPQl7kjV94o+PsnAuyJHi6BpHmF7LLbkltqlE43CddNE9tioHQx
	0LGFxuyYVip2jh2Tr4M=
X-Received: by 2002:a05:6102:3a06:b0:5f9:3ab4:1332 with SMTP id
 ada2fe7eead31-5fae89f1a4bmr4333972137.5.1770742690492; Tue, 10 Feb 2026
 08:58:10 -0800 (PST)
MIME-Version: 1.0
References: <20260207102602.2917520-1-anup.patel@oss.qualcomm.com>
 <20260207102602.2917520-9-anup.patel@oss.qualcomm.com> <CAMkFH19feRsme6Mfr1vQ7hSnr2yhFMivNpGkwfTT2uSV3ojnjg@mail.gmail.com>
 <CAAhSdy0JsxWANTmoz51n7Z=6x+1TofuY5GPoCWEDvwp=JZvZQQ@mail.gmail.com>
In-Reply-To: <CAAhSdy0JsxWANTmoz51n7Z=6x+1TofuY5GPoCWEDvwp=JZvZQQ@mail.gmail.com>
From: Raymond Mao <raymondmaoca@gmail.com>
Date: Tue, 10 Feb 2026 11:57:58 -0500
X-Gm-Features: AZwV_QgIESt4aTamLt4UF7OxD8waq5_ICfDfZYL78HflUOuKNgWKWD5MX7qIiPk
Message-ID: <CAMDkj5zuk_Qu+MKyD+55pKZrT93kzE-4SZcf-iabVHRFitd6Wg@mail.gmail.com>
Subject: Re: [PATCH 8/8] lib: sbi_irqchip: Allow registering interrupt handlers
To: Anup Patel <anup@brainfault.org>
Cc: Ray Mao <raymond.mao@riscstar.com>, Anup Patel <anup.patel@oss.qualcomm.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Dave Patel <dave.patel@riscstar.com>, Samuel Holland <samuel.holland@sifive.com>, 
	opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_085812_265889_B632AA8C 
X-CRM114-Status: GOOD (  27.52  )
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

SGkgQW51cCwKCk9uIFR1ZSwgRmViIDEwLCAyMDI2IGF0IDExOjQw4oCvQU0gQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4KPiBPbiBUdWUsIEZlYiAxMCwgMjAyNiBhdCAx
MjoyOeKAr0FNIFJheSBNYW8gPHJheW1vbmQubWFvQHJpc2NzdGFyLmNvbT4gd3JvdGU6Cj4gPgo+
ID4gSGkgQW51cCwKPiA+Cj4gPiBPbiBTYXQsIEZlYiA3LCAyMDI2IGF0IDU6MjbigK9BTSBBbnVw
IFBhdGVsIDxhbnVwLnBhdGVsQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVG8g
aGFuZGxlIGV4dGVybmFsIGludGVycnVwdHMgaW4gTS1tb2RlLCB0aGUgc2JpX2lycWNoaXAgZnJh
bWV3b3JrCj4gPj4gbXVzdCBhbGxvdyByZWdpc3RlcmluZyBpbnRlcnJ1cHQgaGFuZGxlcnMgZnJv
bSBkZXZpY2UgZHJpdmVycy4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFudXAgUGF0ZWwgPGFu
dXAucGF0ZWxAb3NzLnF1YWxjb21tLmNvbT4KPiA+PiAtLS0KPiA+PiAgaW5jbHVkZS9zYmkvc2Jp
X2lycWNoaXAuaCB8ICA1NiArKysrKysrKysrLQo+ID4+ICBsaWIvc2JpL3NiaV9pcnFjaGlwLmMg
ICAgIHwgMjAyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystCj4gPj4gIGxp
Yi91dGlscy9pcnFjaGlwL2FwbGljLmMgfCAgIDEgKwo+ID4+ICBsaWIvdXRpbHMvaXJxY2hpcC9p
bXNpYy5jIHwgICA5ICsrCj4gPj4gIGxpYi91dGlscy9pcnFjaGlwL3BsaWMuYyAgfCAgIDEgKwo+
ID4+ICA1IGZpbGVzIGNoYW5nZWQsIDI2NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmggYi9pbmNsdWRl
L3NiaS9zYmlfaXJxY2hpcC5oCj4gPj4gaW5kZXggZDJjNDdhZTguLjc3YjU0MTEwIDEwMDY0NAo+
ID4+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV9pcnFjaGlwLmgKPiA+PiArKysgYi9pbmNsdWRlL3Ni
aS9zYmlfaXJxY2hpcC5oCj4gPj4gQEAgLTE4LDEyICsxOCwyMSBAQCBzdHJ1Y3Qgc2JpX3NjcmF0
Y2g7Cj4gPj4KPiA+PiAgLyoqIGlycWNoaXAgaGFyZHdhcmUgZGV2aWNlICovCj4gPj4gIHN0cnVj
dCBzYmlfaXJxY2hpcF9kZXZpY2Ugewo+ID4+IC0gICAgICAgLyoqIE5vZGUgaW4gdGhlIGxpc3Qg
b2YgaXJxY2hpcCBkZXZpY2VzICovCj4gPj4gKyAgICAgICAvKiogTm9kZSBpbiB0aGUgbGlzdCBv
ZiBpcnFjaGlwIGRldmljZXMgKHByaXZhdGUpICovCj4gPj4gICAgICAgICBzdHJ1Y3Qgc2JpX2Rs
aXN0IG5vZGU7Cj4gPj4KPiA+PiArICAgICAgIC8qKiBJbnRlcm5hbCBkYXRhIG9mIGFsbCBoYXJk
d2FyZSBpbnRlcnJ1cHRzIG9mIHRoaXMgaXJxY2hpcCAocHJpdmF0ZSkgKi8KPiA+PiArICAgICAg
IHN0cnVjdCBzYmlfaXJxY2hpcF9od2lycV9kYXRhICpod2lycXM7Cj4gPj4gKwo+ID4+ICsgICAg
ICAgLyoqIExpc3Qgb2YgaW50ZXJydXB0IGhhbmRsZXJzICovCj4gPj4gKyAgICAgICBzdHJ1Y3Qg
c2JpX2RsaXN0IGhhbmRsZXJfbGlzdDsKPiA+PiArCj4gPj4gICAgICAgICAvKiogVW5pcXVlIElE
IG9mIHRoaXMgaXJxY2hpcCAqLwo+ID4+ICAgICAgICAgdTMyIGlkOwo+ID4+Cj4gPj4gKyAgICAg
ICAvKiogTnVtYmVyIG9mIGhhcmR3YXJlIElSUXMgb2YgdGhpcyBpcnFjaGlwICovCj4gPj4gKyAg
ICAgICB1MzIgbnVtX2h3aXJxOwo+ID4+ICsKPiA+PiAgICAgICAgIC8qKiBTZXQgb2YgaGFydHMg
dGFyZ2V0dGVkIGJ5IHRoaXMgaXJxY2hpcCAqLwo+ID4+ICAgICAgICAgc3RydWN0IHNiaV9oYXJ0
bWFzayB0YXJnZXRfaGFydHM7Cj4gPj4KPiA+PiBAQCAtMzIsNiArNDEsMjEgQEAgc3RydWN0IHNi
aV9pcnFjaGlwX2RldmljZSB7Cj4gPj4KPiA+PiAgICAgICAgIC8qKiBQcm9jZXNzIGhhcmR3YXJl
IGludGVycnVwdHMgZnJvbSB0aGlzIGlycWNoaXAgKi8KPiA+PiAgICAgICAgIGludCAoKnByb2Nl
c3NfaHdpcnFzKShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlwKTsKPiA+PiArCj4gPj4g
KyAgICAgICAvKiogU2V0dXAgYSBoYXJkd2FyZSBpbnRlcnJ1cHQgb2YgdGhpcyBpcnFjaGlwICov
Cj4gPj4gKyAgICAgICBpbnQgKCpod2lycV9zZXR1cCkoc3RydWN0IHNiaV9pcnFjaGlwX2Rldmlj
ZSAqY2hpcCwgdTMyIGh3aXJxKTsKPiA+PiArCj4gPj4gKyAgICAgICAvKiogQ2xlYW51cCBhIGhh
cmR3YXJlIGludGVycnVwdCBvZiB0aGlzIGlycWNoaXAgKi8KPiA+PiArICAgICAgIHZvaWQgKCpo
d2lycV9jbGVhbnVwKShzdHJ1Y3Qgc2JpX2lycWNoaXBfZGV2aWNlICpjaGlwLCB1MzIgaHdpcnEp
Owo+ID4+ICsKPiA+PiArICAgICAgIC8qKiBFbmQgb2YgaGFyZHdhcmUgaW50ZXJydXB0IG9mIHRo
aXMgaXJxY2hpcCAqLwo+ID4+ICsgICAgICAgdm9pZCAoKmh3aXJxX2VvaSkoc3RydWN0IHNiaV9p
cnFjaGlwX2RldmljZSAqY2hpcCwgdTMyIGh3aXJxKTsKPiA+Cj4gPgo+ID4gSWYgaHdpcnFfZW9p
KCkgaXMgYW4gZXF1aXZhbGVudCBvZiBjbGFpbSgpLCB0aGVuIGh3aXJxIHNob3VsZCBiZSBhIHBv
aW50ZXIgb2YgbWVtb3J5LCBzaW5jZSB3ZSBuZWVkIHRvIHJlYWQgYW5kIHJldHVybiB0aGUgSURD
X1RPUElfSUQgZnJvbSBDTEFJTUkuCj4gPgo+Cj4gSSB0aGluayB0aGUgZXh0ZXJuYWwgaW50ZXJy
dXB0IGhhbmRsaW5nIGZsb3cgaXMgbm90IGNsZWFyCj4gdG8geW91IGJ1dCBsZXQgbWUgdHJ5IHRv
IGV4cGxhaW4uCj4KPiBXaGVuZXZlciBhIGhhcnQgcmVjZWl2ZXMgZXh0ZXJuYWwgaW50ZXJydXB0
Ogo+Cj4gMSkgVGhlIHNiaV90cmFwX2hhbmRsZXIoKSBpcyBjYWxsZWQgYnkgbG93LWxldmVsIGhh
bmRsZXIKPiB3aGljaCBpbi10dXJuIGNhbGxzIHNiaV9pcnFjaGlwX3Byb2Nlc3MoKQo+IDIpIFRo
ZSBzYmlfaXJxY2hpcF9wcm9jZXNzKCkgd2lsbCBpbi10dXJuIGNhbGwKPiBwcm9jZXNzX2h3aXJx
cygpIG9mIGFwcHJvcHJpYXRlIGRyaXZlcgo+IDMpIFRoZSBwcm9jZXNzX2h3aXJxcygpIGluLWNh
c2Ugb2YgQVBMSUMKPiBkaXJlY3QtbW9kZSB3aWxsIHVzZSBJRENfVE9QSV9JRCB0byBkZXRlcm1p
bmUKPiBod2lycSBudW1iZXIgYW5kIGNhbGwgc2JpX2lycWNoaXBfcHJvY2Vzc19od2lycSgpCj4g
dG8gaGFuZGxlIGl0Lgo+Cj4gSWYgd2UgaGF2ZSBuZXN0ZWQgaXJxY2hpcCBzdWNoIGFzIElNU0lD
K0FQTElDCj4gdGhlbiBwcm9jZXNzX2h3aXJxcygpIHdpbGwgYmUgaW1wbGVtZW50ZWQgYnkgSU1T
SUMKPiB3aGVyZWFzIEFQTElDIHdpbGwgdXNlIHNiaV9pcnFjaGlwX3JlcXVlc3RfaGFuZGxlcigp
Cj4gdG8gcmVnaXN0ZXIgY2FsbGJhY2sgZm9yIElNU0lDIGh3aXJxcy4gVGhpcyBtZWFucwo+IHNi
aV9pcnFjaGlwX3Byb2Nlc3MoKSB3aWxsIGNhbGwgcHJvY2Vzc19od2lycXMoKSBvZgo+IElNU0lD
IGFuZCBJTVNJQyB3aWxsIGNhbGwgQVBMSUMgaW50ZXJydXB0IGhhbmRsZXIKPiB2aWEgc2JpX2ly
cWNoaXBfcHJvY2Vzc19od2lycSgpIHdoZXJlYXMgdGhlIEFQTElDCj4gaW50ZXJydXB0IGhhbmRs
ZXIgd2lsbCBhZ2FpbiBjYWxsIHNiaV9pcnFjaGlwX3Byb2Nlc3NfaHdpcnEoKS4KPgo+IEluIG90
aGVyIHdvcmRzLCB3ZSBjYW4gc3VwcG9ydCBhbnkgaXJxY2hpcCB0b3BvbG9neS4KPgoKSSBrbm93
IHRoaXMgZmxvdyBvZiBpbnRlcnJ1cHQgaGFuZGxpbmcsIGJlZm9yZSBJIHBsYW5uZWQgdG8gcmVh
ZApUT1BJX0lEIGluIHRoZSBlb2kgaG9vaywgYnV0IHllcywgSSBjYW4gZG8gdGhpcyBpbiBwcm9j
ZXNzX2h3aXJxcygpCkkgYWxtb3N0IHJlYmFzZWQgYWxsIG15IHdvcmsgaW4gQVBMSUMgb24gdG9w
IG9mIHlvdXIgcGF0Y2ggc2VyaWVzLiBJCndpbGwgcHVzaCBhIG5ldyB2ZXJzaW9uIHRvIFJJU0Ug
R2l0bGFiIGFuZCBwaW5nIHlvdSBhbmQgUm9iaW4uCgpSYXltb25kCgo+IFJlZ2FyZHMsCj4gQW51
cAo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
