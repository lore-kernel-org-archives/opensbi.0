Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1636CF2582
	for <opensbi@archiver.kernel.org>; Wed, 19 Nov 2025 05:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=esAj5/B0aXkNfI+rFFC+GgzhxHHisOzSPx7fY8/lAlU=; b=JPq1giKle9nJb8
	Ng93nx5THqnud+qZF2pyZ6EKTQy6V1P61+SwkREk+KT90f+oqqkzpwn0VMjpKQiUrcINu67v0YNQi
	uDpaosKfrlu4p6MOYvnoJQr2ybwBsZShTZzwr03aT0eOg5IZAJER8s9cVlA4GZqjoGFvBFzBROloT
	ma7wxXfwQt4sncnDGtW7ohWOAm6dev6kEFHge2mdSwAJQf0n7aNZ5Hr8yn8N601Mom5qB8bA8ctJ7
	EvGOGWVZAVl6s1HdJlGglCVTLiYSzHipYKXnGgeoasI8v69o1Te2aBFYwnrQmum2ug2VOHcUemSwZ
	2wwVC27ac2KHupmd/jnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLahG-00000002CwH-1Ogc;
	Wed, 19 Nov 2025 05:25:38 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLahC-00000002CtB-41tK
	for opensbi@lists.infradead.org;
	Wed, 19 Nov 2025 05:25:36 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-43479d86958so30945675ab.0
        for <opensbi@lists.infradead.org>; Tue, 18 Nov 2025 21:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1763529933; x=1764134733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzSMOOuyjjyzxNqsMeekUPPFfV/7n6/8a5sewwblmYM=;
        b=blDe1ZESYpDBN9lFF/kQUYp31+hyJT6YZAgGksk9nZn19l30wSNqSursgnlM0MYezI
         ZenpyYJCNsOdQJK6cSjpHwmX5ThGZltW2x2xQ4XJbiGswxvhnch1yWdD7QjCCqOmS97k
         e+r7EVRFeIP0nAdutI0XoVLNN92EhkcFG7oa7yDtpwHOeUBMrZtScpE5FZEHPpQF54KO
         li+IYGv+ccdDdR2+2REeNdOUMYnVsnk+r2UJoKKHjn15XvVXr+PVHzb1lSQ5n1Ha9Y0+
         jQU2N70CzfHgAnxEEawWd/HDwpC9QpcG/xkUYQj1VllGvPcU1D9CUlE0c24iz33DBm2E
         wajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763529933; x=1764134733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qzSMOOuyjjyzxNqsMeekUPPFfV/7n6/8a5sewwblmYM=;
        b=prOoySPUiVa8LA++LRpSL4B3UVqK8Ww0uCEdnlBwwh4aW7orttHFwQYfYgq53TIYhl
         MKTg5hTMQ3JmHxxT2SaRsP6mHfkAq9ykr+dA1SE9aqYNLFV9ttF6VmRmRgRrVhruaLta
         l6fE4QXs0IdJq+iqCUHa6OAE+tIaAIysH90w/wKnLJJHAEYTOylupcqC96lbzRoKPCsu
         wP5YjhHDaAEKtcXw4w57x6s1zTsN2NSjt/9GoDMIFFIlzrB7uvtATv63GaqMHnHU1sLE
         Yj456h9vaTH34rllnbC63niVGAXVHE4sQUkc8lzVGMY6XoXdYMoXfygmUkWiLKGpYmGC
         21eg==
X-Forwarded-Encrypted: i=1; AJvYcCXk9rasXKbTl/bKt4UgYZ5uJYnc31e1JYFoWYbEHyllpo7EMWbD83wzwMq6LJuBHA8xM9JIxAbr@lists.infradead.org
X-Gm-Message-State: AOJu0YxBs1sUjq9UtNduhdtT4xJ/dW7+35zt/PynHG9/9LpcGoY2jyD2
	InfyISV/t/7vwDwzqgwe8kFhMqnABK0tDMrxRQzbIisAsnSgFV2+2IcEa5o60MQq1XOurY+rT9b
	TXEMxtWgPbfSwkWqZ4N2jvQ2OwReiD5qSQnFakwe4Lg==
X-Gm-Gg: ASbGncuIKhM6Dk8f32sWzx5Nxkw8TohT+JS5ftWwAbnxDbApnPOcBj6nH6JfUZC6s3q
	amQtG44/hgZUxNkOnHnf4Rg3DGXuevwpE6VEMg9nIRhPDFpRyGKmBvHhvVUxLJ3Wmt7ekDtINdS
	gVcPppcfu4eExvU1EtY60T+cthRr73mEj1bM32V2/rd9w+TE36hhUk8Z70pktRVwvxkjzlOwx1q
	3MxLHkGWjj4BcUW642I7uG4CdvdZFBzN3jXtZhRB3cEYuttFLo1COflhONetMni8fDX0afM7OlI
	q9Ul
X-Google-Smtp-Source: AGHT+IHj4c/jKghRbjoKsp5PSe3U2d6uqWQebC7v5fBuPyEkC4Y2mmcttqG3MMOiSfnInWfPwG1yYssRb1ODmib3dD0=
X-Received: by 2002:a92:c004:0:b0:434:96ea:ff78 with SMTP id
 e9e14a558f8ab-43496eb02eemr146424675ab.40.1763529933145; Tue, 18 Nov 2025
 21:25:33 -0800 (PST)
MIME-Version: 1.0
References: <20251114115722.1831-1-cp0613@linux.alibaba.com>
 <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com> <CAJF2gTQjXMfvAAJma1QmsETqU7aE+Nb8=koH_B91PW8BM_khaQ@mail.gmail.com>
 <CAJF2gTTZGPZazh1GCdfktySWi048fQg4AULXxVEd5sqp5v1dWg@mail.gmail.com>
 <DEBVKGILFGWB.3JT03EV4NM4PP@ventanamicro.com> <CAJF2gTRFKuF_uQ_xsjGm1L8nvn-Hzv8951xVP9wn8j=rayNE4A@mail.gmail.com>
In-Reply-To: <CAJF2gTRFKuF_uQ_xsjGm1L8nvn-Hzv8951xVP9wn8j=rayNE4A@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Nov 2025 10:55:20 +0530
X-Gm-Features: AWmQ_bkTDiVvxgMACZvrQm-5JjYeKz4InqEfpf8Nnc0Gp-Lmkb42kFbo62W2at4
Message-ID: <CAAhSdy1rvybw9yp5nbFGBhfdC0x4+=2Z5w9gFr_+BJLxK_xiHg@mail.gmail.com>
Subject: Re: [PATCH v5] lib: sbi: Enable Ssqosid Ext using mstateen0
To: Guo Ren <guoren@kernel.org>
Cc: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	cp0613@linux.alibaba.com, opensbi@lists.infradead.org, 
	opensbi <opensbi-bounces@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_212535_252223_9715E339 
X-CRM114-Status: GOOD (  37.59  )
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

T24gV2VkLCBOb3YgMTksIDIwMjUgYXQgNzo0NOKAr0FNIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE9uIFR1ZSwgTm92IDE4LCAyMDI1IGF0IDEwOjAz4oCvUE0gUmFkaW0g
S3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+IHdyb3RlOgo+ID4KPiA+IDIwMjUt
MTEtMTVUMTE6MTc6NTIrMDg6MDAsIEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPjoKPiA+ID4g
T24gU2F0LCBOb3YgMTUsIDIwMjUgYXQgMTE6MDXigK9BTSBHdW8gUmVuIDxndW9yZW5Aa2VybmVs
Lm9yZz4gd3JvdGU6Cj4gPiA+Pgo+ID4gPj4gT24gRnJpLCBOb3YgMTQsIDIwMjUgYXQgOTo1NeKA
r1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPiA+
ID4+ID4KPiA+ID4+ID4gMjAyNS0xMS0xNFQxOTo1NzoyMiswODowMCwgPGNwMDYxM0BsaW51eC5h
bGliYWJhLmNvbT46Cj4gPiA+PiA+ID4gRnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGli
YWJhLmNvbT4KPiA+ID4+ID4gPgo+ID4gPj4gPiA+IFRoZSBRb1MgSWRlbnRpZmllcnMgZXh0ZW5z
aW9uIChTc3Fvc2lkKSBpbnRyb2R1Y2VzIHRoZSBzcm1jZmcgcmVnaXN0ZXIsCj4gPiA+PiA+ID4g
d2hpY2ggY29uZmlndXJlcyBhIGhhcnQgd2l0aCB0d28gaWRlbnRpZmllcnM6IGEgUmVzb3VyY2Ug
Q29udHJvbCBJRAo+ID4gPj4gPiA+IChSQ0lEKSBhbmQgYSBNb25pdG9yaW5nIENvdW50ZXIgSUQg
KE1DSUQpLiBUaGVzZSBpZGVudGlmaWVycyBhY2NvbXBhbnkKPiA+ID4+ID4gPiBlYWNoIHJlcXVl
c3QgaXNzdWVkIGJ5IHRoZSBoYXJ0IHRvIHNoYXJlZCByZXNvdXJjZSBjb250cm9sbGVycy4KPiA+
ID4+ID4gPgo+ID4gPj4gPiA+IElmIGV4dGVuc2lvbiBTbXN0YXRlZW4gaXMgaW1wbGVtZW50ZWQg
dG9nZXRoZXIgd2l0aCBTc3Fvc2lkLCB0aGVuCj4gPiA+PiA+ID4gU3Nxb3NpZCBhbHNvIHJlcXVp
cmVzIHRoZSBTUk1DRkcgYml0IGluIG1zdGF0ZWVuMCB0byBiZSBpbXBsZW1lbnRlZC4gSWYKPiA+
ID4+ID4gPiBtc3RhdGVlbjAuU1JNQ0ZHIGlzIDAsIGF0dGVtcHRzIHRvIGFjY2VzcyBzcm1jZmcg
aW4gcHJpdmlsZWdlIG1vZGVzIGxlc3MKPiA+ID4+ID4gPiBwcml2aWxlZ2VkIHRoYW4gTS1tb2Rl
IHJhaXNlIGFuIGlsbGVnYWwtaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiBJZgo+ID4gPj4gPiA+IG1z
dGF0ZWVuMC5TUk1DRkcgaXMgMSBvciBpZiBleHRlbnNpb24gU21zdGF0ZWVuIGlzIG5vdCBpbXBs
ZW1lbnRlZCwKPiA+ID4+ID4gPiBhdHRlbXB0cyB0byBhY2Nlc3Mgc3JtY2ZnIHdoZW4gVj0xIHJh
aXNlIGEgdmlydHVhbC1pbnN0cnVjdGlvbiBleGNlcHRpb24uCj4gPiA+PiA+ID4KPiA+ID4+ID4g
PiBUaGlzIGV4dGVuc2lvbiBjYW4gYmUgZm91bmQgaW4gdGhlIFJJU0MtViBJbnN0cnVjdGlvbiBT
ZXQgTWFudWFsOgo+ID4gPj4gPiA+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9yaXNjdi1pc2Et
bWFudWFsCj4gPiA+PiA+ID4KPiA+ID4+ID4gPiBDaGFuZ2VzIGluIHY1Ogo+ID4gPj4gPiA+ICAt
IFJlbW92ZSBTQklfSEFSVF9FWFRfU1NRT1NJRCBkZXBlbmRlbmN5IFNCSV9IQVJUX1BSSVZfVkVS
XzFfMTIKPiA+ID4+ID4gPgo+ID4gPj4gPiA+IENoYW5nZXMgaW4gdjQ6Cj4gPiA+PiA+ID4gIC0g
UmVtb3ZlIGV4dHJhbmVvdXMgcGFyZW50aGVzZXMgYXJvdW5kIFNNU1RBVEVFTjBfU1JNQ0ZHCj4g
PiA+PiA+ID4KPiA+ID4+ID4gPiBDaGFuZ2VzIGluIHYzOgo+ID4gPj4gPiA+ICAtIENoZWNrIFNC
SV9IQVJUX0VYVF9TU1FPU0lEIHdoZW4gc3dhcHBpbmcgU1JNQ0ZHCj4gPiA+PiA+ID4KPiA+ID4+
ID4gPiBDaGFuZ2VzIGluIHYyOgo+ID4gPj4gPiA+ICAtIFJlbW92ZSB0cmFwLW4tZGV0ZWN0Cj4g
PiA+PiA+ID4gIC0gQ29udGV4dCBzd2l0Y2ggQ1NSX1NSTUNGRwo+ID4gPj4gPiA+Cj4gPiA+PiA+
ID4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiA+
ID4+ID4gPiAtLS0KPiA+ID4+ID4KPiA+ID4+ID4gSXQncyBwb3NzaWJsZSB0aGF0IFMtbW9kZSBj
b250cm9sIG92ZXIgc3JtY2ZnIG1pZ2h0IGxlYWsgdmVyeSBsaXR0bGUKPiA+ID4+ID4gaW5mb3Jt
YXRpb24gYWNyb3NzIGFyY2hpdGVjdHVyYWwgaXNvbGF0aW9uIGJvdW5kYXJpZXMsIGJ1dCBJIGRv
bid0IGtub3cKPiA+ID4+ID4gZW5vdWdoIGFib3V0IENCUVJJIHRvIG1vdW50IGFueSBwcmFjdGlj
YWwgYXR0YWNrIChpdCBtaWdodCBub3QgZXhpc3QpLAo+ID4gPj4gPiBzbyB0aGUgY3VycmVudCBo
YW5kbGluZyBzZWVtcyBhY2NlcHRhYmxlLAo+ID4gPj4gRm9yIG11bHRpcGxlIGRvbWFpbnMsIHRo
ZSBzcm1jZmcoUW9TIElEIFBvb2wpIG11c3QgYmUgbWFuYWdlZCBnbG9iYWxseQo+ID4gPj4gaW4g
bS1tb2RlLCBvciBkb21haW4gQSB3b3VsZCBhZmZlY3QgZG9tYWluIEIgYnkgdXNpbmcgaXRzIG93
biBzcm1jZmcuCj4gPgo+ID4gUmlnaHQsIHZlbmRvcnMgc2hvdWxkbid0IGFkZCBTc3Fvc2lkIHRv
IHRoZSBJU0Egc3RyaW5nIHVubGVzcyB0aGV5IGtub3cKPiA+IHdoYXQgdGhleSBhcmUgZG9pbmcu
Cj4gPiBpLmUuIGFsbG93aW5nIG5vIG1vcmUgdGhhbiBzaW5nbGUgZG9tYWluIHRoYXQgcnVucyB1
bmNvbnRyb2xsZWQgY29kZSwKPiA+IGFuZCBjb25maWd1cmluZyBzcm1jZmcgaW4gdGhlaXIgY29u
dHJvbGxlZCBkb21haW5zIHRvIGJlIHVuY29uc3RyYWluZWQuCj4gPgo+ID4gV2hlbiB3ZSBoYXZl
IFNtTVRUJ3MgbW5ybWNmZywgSSBpbWFnaW5lIHZlbmRvcnMgd2lsbCBiZSBhYmxlIHRvIHN0YXJ0
Cj4gPiB1c2luZyBzcm1jZmcgaW5zaWRlIHNlcnZpY2UgZG9tYWlucywgb3IgZXZlbiBhbGxvdyBt
dWx0aXBsZSB1c2VyCj4gPiBkb21haW5zLiAgKFdlJ2xsIG5lZWQgZXh0cmEgbWFuYWdlbWVudCBp
biBvcGVuc2JpIGZvciBpdCwgdGhvdWdoLikKPiA+Cj4gPiA+PiBDb21wYXJlZCB0byBzd2l0Y2hp
bmcgdGhlIHNybWNmZywgSSBwcmVmZXIgdG8gZW5hYmxlIFNNU1RBVEVFTjBfU1JNQ0ZHCj4gPiA+
PiBvbmx5IGluIG9uZSBkb21haW4gKHRoZSBkZWZhdWx0IG9uZSkuCj4gPiA+Cj4gPiA+IExlYXZp
bmcgaXQgYXdheSBpcyBtb3JlIGNvbnNpZGVyYWJsZS4KPiA+Cj4gPiBZb3UgbWVhbiB0cmFwcGlu
ZyB0byBvcGVuc2JpIGFuZCBpbXBsZW1lbnRpbmcgZmlsdGVyaW5nIGFraW4gdG8gU21NVFQ/Cj4g
Pgo+ID4gPiBUaGluayBhYm91dCB0aGUgQ29WRSBzY2VuYXJpbzogRG9tYWluIEEgKEtWTSkgc2V0
cyB1cCBRb1NfSUQsIHRoZW4KPiA+ID4gRG9tYWluIEIgKFRWTSkgdXNlcyB0aGUgUW9TX0lEIGZy
b20gRG9tYWluIEEuIFRodXMsIFRWTSBsZXRzIHJlZ3VsYXIKPiA+ID4gTGludXggS1ZNIG1hbmFn
ZSB0aGUgUW9TX0lEICYgQ0JRUkkuCj4gPgo+ID4gQ29WRSBjdXJyZW50bHkgaGFzIG5vIG9wdGlv
biB0byBzZXQgc3JtY2ZnIGZvciBhIFRWTSAtLSBUU00gc2hvdWxkLAo+ID4gY3VycmVudGx5IHNl
dCBzcm1jZmcgdG8gdW5jb25zdHJhaW5lZCwgYW5kIHRoaXMgcGF0Y2ggd2lsbAo+ID4gY29udGV4
dC1zd2l0Y2ggaXQgd2l0aG91dCBsb3NpbmcgdG9vIG11Y2ggKGFueT8pIGNvbmZpZGVudGlhbGl0
eS4KPiA+Cj4gPiBJIHRoaW5rIHRoaXMgcGF0Y2ggaXMgZmluZSBpZiB1c2VkIGNvcnJlY3RseSwg
YnV0IGl0IGRlZmluaXRlbHkgd2lkZW5zCj4gPiByb29tIGZvciBlcnJvcnMuICBEbyB3ZSB3YW50
IHRvIHNvbWVob3cgaW5jcmVhc2UgdGhlIHJvYnVzdG5lc3M/Cj4gSSByZWNvbW1lbmQgcmVtb3Zp
bmcgdGhlIHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0IG1vZGlmaWNhdGlvbiBpbgo+IHRo
aXMgcGF0Y2gsIGJlY2F1c2UgdGhlIHNvbHV0aW9uIGlzIG5vdCByZWFkeS4gV2UgY291bGQgbGVh
dmUgaXQgZm9yIGEKPiBsYXRlciBjb21wcmVoZW5zaXZlIHNvbHV0aW9uIChlLmcuLCBUU00pLgoK
SWYgd2UgbGVhdmUgb3V0IHRoZSBzd2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dCAoKSBjaGFu
Z2UgdGhlbgp0aGVyZSBpcyBzaWRlLWNoYW5uZWwgYmVpbmcgZXhwb3NlZCBmb3IgaW50ZXItZG9t
YWluIGNvbW11bmljYXRpb24Kd2hpY2ggd2UgZG9uJ3Qgd2FudC4KCj4KPiBXaGVuIHdlIHNldCBz
cm1jZmcgb24gdGhlIExpbnV4IHNpZGUgdmlhIHRoZSByZXNjdHJsIGludGVyZmFjZSBhbmQKPiBj
cmVhdGUgYSBUVk0gdXNpbmcgdGhlIENvVkUgQVBJLCB0aGUgcW9zaWQgc2V0dGluZyBpcyBuYXR1
cmFsbHkKPiBpbmhlcml0ZWQgYnkgdGhlIFRWTSwgd2hpY2ggaXMgd2hhdCBJIGV4cGVjdDogbGV0
IHRoZSBsb3dlc3QtcHJpdmlsZWdlCj4gZG9tYWluIHNldCB1cCBzcm1jZmcuIFRoaXMgcGF0Y2gn
cyBzcm1jZmcgc3dpdGNoIGluCj4gc3dpdGNoX3RvX25leHRfZG9tYWluX2NvbnRleHQgYnJlYWtz
IHRoZSBwYXRoLgoKVGhlIHN3aXRjaF90b19uZXh0X2RvbWFpbl9jb250ZXh0ICgpIGlzIGRvaW5n
IGl0cyBqb2IgY29ycmVjdGx5CmJ1dCB0aGUgcmVhbCBpc3N1ZSBpcyB0aGUgbGFjayBvZiBzZXBh
cmF0aW9uIG9mIFJDSUQgYW5kIE1DSUQKc3BhY2UgYmV0d2VlbiBkb21haW5zLgoKVHJhcC1uLWVt
dWxhdGlvbiBvZiBzcm1jZmcgQ1NSIGZvciBTLW1vZGUgd2lsbCBpbXBhY3QgcGVyZm9ybWFuY2UK
YmVjYXVzZSBTLW1vZGUgT1NlcyBtaWdodCBzd2l0Y2ggUkNJRCBhbmQgTUNJRCBpbiB0YXNrLXN3
aXRjaC4KSWRlYWxseSwgd2Ugc2hvdWxkIGhhdmUgc2VwYXJhdGUgSVNBIGV4dGVuc2lvbiBmb3Ig
TS1tb2RlIHRvCmlzb2xhdGUgUkNJRCBhbmQgTUNJRCBzcGFjZSBiZXR3ZWVuIGRvbWFpbnMuCgpG
b3Igbm93LCBsZXQncyBnbyBhaGVhZCB3aXRoIHRoaXMgcGF0Y2ggYW5kIHNlcGFyYXRlbHkgd2Ug
Y2FuCnRoaW5rIGFib3V0IGludGVyLWRvbWFpbiBpc29sYXRpb24gb2YgUkNJRCBhbmQgTUNJRCBz
cGFjZS4KClJlZ2FyZHMsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9vcGVuc2JpCg==
