Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54191CA0FF2
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 06:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FF9isSee2kkN6gpiAFoEM/zZdMq2KzXv+q6BvWF7hKU=; b=i0xY0J3Wp2hFl/
	nBNIms94wMb/QMC6bOiVKg2Qy2ZeryLJdQe1FvLggiSPzwJxKcEkl90P/gp9xhvrkHjjW9Fs1ZdmQ
	BMWbiZJRsyYo/ULlaLyu5xOZRq2FaKKpA83FLXsiO3/JkQcaUZAQZ6dJNPpsouNrvBpVEE5djNhs3
	6tTkKrwHvPI0g0kqAn897kkMbIEfm/bNjYmeV5HPK4LIhvO3cF1lObqCRYW9NsFkF7+2559OZXKXZ
	S0NSXJy0fV9tQYymq8CM6xpRFFv+Rd8S3Ulzo0pE0qrlTcCoPBZiYF04nnTjJlbZN9C31iYpaORi9
	uHmh7qSeyPXB8PbxovZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWPr-00000000Teq-3Oxu;
	Thu, 28 Aug 2025 06:47:23 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urWPo-00000000Td5-3Owc
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 06:47:21 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45b618e067eso11276005e9.1
        for <opensbi@lists.infradead.org>; Wed, 27 Aug 2025 23:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1756363639; x=1756968439; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7t86LE4DtKfbI7G+LmyFDqQoxky/imUifziHjbRJnYs=;
        b=nYxh7JzOe+OZ5/c4xzOTWXYyxaC+YcBhv7i2sHtsbMUVm3I9xfewkCC4ELthEe8hYU
         Y6VH7A/N28yJ3IRXKQ8c+fZ+RvK7U+/kzXnyIk9rjH0z+LWtG0hkwObiAYwfqOHfCjbi
         hlqhnVq2mBBLcoNmUbOIR3xtcnbDX5DlbECyVL06AIjzfwusKyyY7atafLHGpiVzxJfK
         jizsW0y5mhJnrC4QvtTXi5h/c1d54k7cfvp0A64THeeetJoacro2kTUMzsoDG4tY5OHR
         uzME7FdtWF+X4q+02h++ZJv/XTAoT4ERDoDtx8EWes0HYPYhcAZc3uRuJg7TSa7bgYsw
         nSdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756363639; x=1756968439;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7t86LE4DtKfbI7G+LmyFDqQoxky/imUifziHjbRJnYs=;
        b=brbVWaKuahVRWkYHg87CmB2gCPHDyB1uK6f/Tf5wnyVrXT6KQl8P1raRgfmPHzCKBI
         vO5rsix7AIrpPPscQs5Rtt5Ce2aQ/8dy/OKpNrLmUCAPH5i5pULesapwPVAkQ6vWFoK/
         DdXTBFksjKQDHVt612z3id89GE2ZfXDQ78U3vfqPXAhCLXoA4Ji9aQZdHlwoz0v/XzJH
         OHueH1jTlPLPOkMpOjk3XljG4rd6v0Z5v/VfG0767QTtvlFKzwm3UUg9gsxL/SuLA77L
         Z8anuawDAPY6RRdl0zKS+tYgyZ9/LoLhL1cNSnrzQs13yufcC/FW+JZ9Ysceo0c6zUp6
         JRCA==
X-Forwarded-Encrypted: i=1; AJvYcCVLG4JO1zlrvh8txfhlo/pdJLaId8btezQUa+UhggixMDRrxekNHYY4S6O335cOe6uvdT/M5NCe@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7GnOV7/FOSTRVcv8Z8uoKlTZ/qXZHSZYDLyh9Vbg0fl7pRggZ
	RU8hZR/CQNqWeFdZbq2B/aIBSsm3k1WWJgf6JaitUnRZI9Iz3mETCnEjasYYzxC5bYc=
X-Gm-Gg: ASbGncuPxc7C1avXy5nD3ZV73WpyUTIu5AyICjtrZkXHU3RGW1RDP3r/eHtcIxrqA4W
	d3oBKTBvdSE6r4icXrIUUNNkw+HwXoWUygQzFuBbn2pSume4A++DXAuyAZRDATx+ZhaZy4QuVPk
	vjStJDtr7EWBymT65dJ5lsya9IOmbUGok+WxMhYNjprW3jNlis2R0g4W/UEtQ75SM2CoOgnTedR
	iyJqrrslXyMUdDSlSuSGPqEnWg9K7tab9v8h39wS55fR8sYCjtxRzM66MAF5XY2gamw9B8MqU+Q
	+36m8OMlKPomrzf8Jsf7h3oA1Mij/0BDVEMQeOryTQujW9k6U/TSjMpHZYrF5TN4Yx37y4+Wy5w
	Eb0+sS61BvYm7FdaSofCzzLXPw4bYRMLhWztRJRmhaCJNIpkz3zI37asuwvYNeVTKnmV/xoA=
X-Google-Smtp-Source: AGHT+IHgqzxFP/2vwcNbxoLG9jAGzkxV1IKZwmqgdXEoALLjAy/IclHKfFBOfHDmheqp0QeVJN9Seg==
X-Received: by 2002:a05:600c:4512:b0:45b:75d9:516e with SMTP id 5b1f17b1804b1-45b75d954e6mr21898295e9.15.1756363638468;
        Wed, 27 Aug 2025 23:47:18 -0700 (PDT)
Received: from smtpclient.apple (nat-184-99.net.cam.ac.uk. [131.111.184.99])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6ee66bddsm60777655e9.0.2025.08.27.23.47.17
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 23:47:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH v3] generic: mips: support harts to boot from
 mips_warm_boot
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <98E5DC08-1B1A-4F27-A520-4281A4C6B436@jrtc27.com>
Date: Thu, 28 Aug 2025 07:47:07 +0100
Cc: Chao-ying Fu <icebergfu@gmail.com>,
 opensbi@lists.infradead.org,
 Chao-ying Fu <cfu@mips.com>
Message-Id: <1A02827E-2E3E-4064-985C-4FBCD1F69019@jrtc27.com>
References: <20250723204010.9927-1-cfu@mips.com>
 <CAAhSdy2VRE_bfqhae+ZCxwH-rZnmm+uL+nfYAzTXEn=C84L80Q@mail.gmail.com>
 <98E5DC08-1B1A-4F27-A520-4281A4C6B436@jrtc27.com>
To: Anup Patel <anup@brainfault.org>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_234720_854050_2587E88B 
X-CRM114-Status: GOOD (  26.96  )
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

T24gMjggQXVnIDIwMjUsIGF0IDA3OjIwLCBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMyNy5j
b20+IHdyb3RlOgo+IE9uIDI4IEF1ZyAyMDI1LCBhdCAwNjozMiwgQW51cCBQYXRlbCA8YW51cEBi
cmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4+IE9uIFRodSwgSnVsIDI0LCAyMDI1IGF0IDI6MTDigK9B
TSBDaGFvLXlpbmcgRnUgPGljZWJlcmdmdUBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gCj4+PiBXZSBw
cm9ncmFtIHJlc2V0IGJhc2UgZm9yIGhhcnRzIChvdGhlciB0aGFuIGhhcnQgMCkgdG8gYm9vdCBh
dAo+Pj4gbWlwc193YXJtX2Jvb3QgdGhhdCBqdW1wcyB0byBfc3RhcnRfd2FybS4gVGhpcyBoZWxw
cyB0byBza2lwIHNvbWUgY29kZQo+Pj4gc2VxdWVuY2UgdG8gc3BlZWQgdXAuCj4+PiAKPj4+IFNp
Z25lZC1vZmYtYnk6IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29tPgo+Pj4gLS0tCj4+PiBwbGF0
Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUyB8IDIwICsrKysrKysrKysrKysrKysr
KysrCj4+PiBwbGF0Zm9ybS9nZW5lcmljL21pcHMvb2JqZWN0cy5tayAgICAgICB8ICAyICstCj4+
PiBwbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYyAgICAgICAgICB8ICA1ICsrKysrCj4+PiAz
IGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+IGNyZWF0
ZSBtb2RlIDEwMDY0NCBwbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUwo+Pj4g
Cj4+PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHNfd2FybV9ib290LlMg
Yi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUwo+Pj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPj4+IGluZGV4IDAwMDAwMDAuLjI1Y2RiODMKPj4+IC0tLSAvZGV2L251bGwKPj4+
ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBzX3dhcm1fYm9vdC5TCj4+PiBAQCAtMCww
ICsxLDIwIEBACj4+PiArLyoKPj4+ICsgKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogQlNELTIt
Q2xhdXNlCj4+PiArICoKPj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgTUlQUwo+Pj4gKyAqCj4+
PiArICovCj4+PiArICAgICAgIC50ZXh0Cj4+PiArICAgICAgIC5hbGlnbiAgMTIKPj4+ICsgICAg
ICAgLmdsb2JsICBtaXBzX3dhcm1fYm9vdAo+Pj4gK21pcHNfd2FybV9ib290Ogo+Pj4gKyAgICAg
ICBqICAgICAgIF9zdGFydF93YXJtCj4+PiArICAgICAgIC5hbGlnbiAgMgo+Pj4gK25taV92ZWN0
b3I6Cj4+PiArICAgICAgIGogICAgICAgX3N0YXJ0X3dhcm0KPj4+ICsgICAgICAgLmFsaWduICAy
Cj4+PiArY2FjaGVlcnJfdmVjdG9yOgo+Pj4gKyAgICAgICBqICAgICAgIF9zdGFydF93YXJtCj4+
PiArICAgICAgIC5hbGlnbiAgMgo+Pj4gK2RlYnVnZXhjX3ZlY3RvcjoKPj4+ICsgICAgICAgaiAg
ICAgICBfc3RhcnRfd2FybQo+PiAKPj4gbm1pX3ZlY3RvciwgY2FjaGVlcnJfdmVjdG9yLCBhbmQg
ZGVidWdleGNfdmVjdG9yIGFyZSBub3QgdXNlZAo+PiBhbnl3aGVyZSBzbyBJIGhhdmUgZHJvcHBl
ZCB0aGVzZSBhdCB0aGUgdGltZSBvZiBtZXJnaW5nLiBQbGVhc2UKPj4gc2VuZCBzZXBhcmF0ZSBw
YXRjaGVzIHRvIGFkZCB0aGVzZSB3aGVuIHRoZXkgYXJlIGJlaW5nIHVzZWQKPj4gc29tZXdoZXJl
Lgo+PiAKPj4gUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+Cj4+
IAo+PiBBcHBsaWVkIHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KPiAKPiBV
aCBJ4oCZbSBwcmV0dHkgc3VyZSB0aGlzIGlzIGEgcmVzZXQgdmVjdG9yLCBhbmQgZWFjaCBsYWJl
bCBpcyBuYW1pbmcgdGhlCj4gZGlmZmVyZW50IGVudHJpZXMgaW4gdGhlIHZlY3RvciwgbXVjaCBs
aWtlIGZvciBtdHZlYy5NT0RFPVZlY3RvcmVkLCBhbmQKPiB0aGVyZWZvcmUgdGhlIHJlc3VsdCBv
ZiBkZWxldGluZyB0aG9zZSB2ZWN0b3IgZW50cmllcyBpcyB0aGF0LCBpZiBhbnkKPiBvZiB0aG9z
ZSBjYXNlcyBvY2N1ciwgaXQgd2lsbCBlbmQgdXAgcnVubmluZyB3aGF0ZXZlciByYW5kb20gY29k
ZQo+IGhhcHBlbnMgdG8gYmUgYWZ0ZXIgdGhlIGZpcnN0IGVudHJ5Lgo+IAo+IEnigJl2ZSBub3Rp
Y2VkIHlvdSBhcmUgcXVpdGUgZWFnZXIgdG8gbW9kaWZ5IHBlb3BsZeKAmXMgcGF0Y2hlcyBiZWZv
cmUKPiBhcHBseWluZyB0aGVtLiBSZWZvcm1hdHRpbmcgaXMgb25lIHRoaW5nLCBidXQgZGVsZXRp
bmcgYXNzZW1ibHkgY29kZSBpcwo+IGFub3RoZXIgdGhhdCBJIHRoaW5rIGdvZXMgdG9vIGZhci4g
UGxlYXNlIGJlIG1vcmUgY29uc2lkZXJhdGUgb2YgdGhlCj4gZmFjdCB0aGF0IHlvdSBtYXkgbm90
IGJlIGNvcnJlY3QgaW4geW91ciBpbnRlcnByZXRhdGlvbiwgYW5kIHNvIGl0IGlzCj4gbm90IGFw
cHJvcHJpYXRlIHRvIHVuaWxhdGVyYWxseSBjb21taXQgd2hhdGV2ZXIgdW5yZXZpZXdlZCBjaGFu
Z2VzIHlvdQo+IHRoaW5rIGFyZSBiZXN0LCBlc3BlY2lhbGx5IHdoZW4gaXQgY29tZXMgdG8gdmVu
ZG9yLXNwZWNpZmljIGNvZGUgZm9yCj4gd2hpY2ggeW91IGhhdmVu4oCZdCByZWFkIGFueSBvZiB0
aGUgY29ycmVzcG9uZGluZyBtYW51YWxzLgoKRXNwZWNpYWxseSBzaW5jZSB5b3Uga2VlcCB0aGUg
YXV0aG9yIGludGFjdCwgZG9u4oCZdCBhZGQgYW55IGtpbmQgb2YKQ28tYXV0aG9yZWQtYnkgYW5k
IGRvbuKAmXQgZG9jdW1lbnQgYW55IG9mIHRoZSBjaGFuZ2VzIHlvdSBoYXZlIG1hZGUKYmV0d2Vl
biB0aGUgYXV0aG9y4oCZcyBTaWduZWQtb2YtYnkgYW5kIHlvdXJzLiBUaGlzIG1lYW5zIGl0IGxv
b2tzIGxpa2UKaXTigJlzIHRoZSBzdWJtaXR0ZXLigJlzIGZhdWx0IHRoYXQgdGhlcmXigJlzIGEg
YnVnIGluIHRoZSBjb21taXQsIHdoZW4gaW4KcmVhbGl0eSB0aGV5IHN1Ym1pdHRlZCBhIGNvcnJl
Y3QgcGF0Y2ggYW5kIHlvdSBicm9rZSBpdC4gVGhhdOKAmXMgbm90IGEKcGFydGljdWxhcmx5IG5p
Y2UgdGhpbmcgdG8gaGF2ZSBkb25lIHRvIG9uZeKAmXMgd29yay4KCk1pZ2h0IEkgc3VnZ2VzdCwg
aWYgdGhlIGdvYWwgaXMgdG8gYXZvaWQgdGhlIGF1dGhvciBuZWVkaW5nIHRvIHN1Ym1pdCBhCnZO
KzEsIGF0IGxlYXN0IGNvbmZpcm0gd2l0aCB0aGUgYXV0aG9yIHRoYXQgeW91ciBpbnRlbmRlZCBm
aXhlcyBhcmUKY29ycmVjdCBiZWZvcmUgZm9sZGluZyB0aGVtIGludG8gdGhlIHBhdGNoIHlvdSBj
b21taXQ/IEFuZCwgZm9yIG1vcmUKbWlub3IgY2FzZXMsIGRvY3VtZW50IHRoYXQgeW914oCZdmUg
bWFkZSBjaGFuZ2VzLCB3aGV0aGVyIGluIHRoZSBMaW51eAprZXJuZWwgY29tbWl0dGVyIHN0eWxl
IHRoYXQgc3RhdGVzIHdoYXQgeW914oCZdmUgYWN0dWFsbHkgZG9uZSwgb3IgYXQKbGVhc3QgYnkg
YWRkaW5nIHlvdXIgb3duIENvLWF1dGhvcmVkLWJ5IHRvIHN0YXRlIHlvdeKAmXZlIGRvbmUgc29t
ZXRoaW5nCnVuc3BlY2lmaWVkLgoKSmVzc2ljYQoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
