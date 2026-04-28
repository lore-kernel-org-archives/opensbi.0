Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDD5FF8864
	for <opensbi@archiver.kernel.org>; Tue, 28 Apr 2026 03:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTauP+BV3NKLCIeneKDQSyYMphRBzWjXM/QiRS1agPA=; b=lcfVyAqxMI8SI8
	N3Jok1j8wG2lUBWJFk48SwdsBuM0NPg+5HM00p5POYUxFpGPgVqS70d6aJ4S1Hcta2D8ind55tIed
	xfqaZOcTrp83IOKGWKBEk8poVHfFph1i+5VSBpQ5eNaJrzOPL7EplX4rPXVP+rRWgN9+zt6Ov/B8T
	zAgGVSsFnYFGLqToX3DIa8wi8pJeiE6D50EXAkvbSDD5kIERpFTEuedSrlq/MMICiGWVxf3JIV7Ls
	L7a7twFeJvPI24Vgk1DCea/e2/m4XJUIn2Ct06SlSodIFV77BhYoEOzdcYOytwsT8h03kcLeWwvLh
	E02DGkHp0MehP5rY8joQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZJJ-00000000Ve4-2eSn;
	Tue, 28 Apr 2026 03:40:33 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHZJH-00000000Vdg-1Mnr
	for opensbi@lists.infradead.org;
	Tue, 28 Apr 2026 03:40:32 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-38e9653b580so121259061fa.2
        for <opensbi@lists.infradead.org>; Mon, 27 Apr 2026 20:40:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777347629; cv=none;
        d=google.com; s=arc-20240605;
        b=P4H8XXsZ+vGp73ib/d0Gjian07rEptBJmA7WuJyGTBCqlHcqWN9KmL40nAz9gU8hSe
         3TeTrebXEYsZ5jLfVaz5hOFImP3NuIS01u1Q7HQvI2n/fVozKnC/BtJTp5dNvG+4DByI
         DNWOJNaStWgl7u8MpR6MJe2t/gDzpTeMdAwkreaxbQdn+BZhaS8QlWs23z22tNGCHoJK
         rkTOtN+zyuekQ3RYgbWW40QoRfGamOgtBidiahVFdZDWw9BZKbCVAfCN5De5pggxwdlt
         /cE0opUpN3gibJTHzwaupWnc1e/ug4ZJRAS8Q08F5dlPfMtPlRA02NpVBmtPrRLJyNpV
         mJBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fqjpw9WHOOkHTPHEKVYISP7EvZ6J0wgpvL9r5AV6eKw=;
        fh=zbbOh6GdGzx4aDPFu6fZSKc+J9bKwQ41MTonPIzEJWM=;
        b=XXC2fFmWknNX2EU9xYRHxXY3JnntvhwUSLujCiho9Xw6o/KD5ddcaTfSofuskYD4d6
         BOX2Fa83BxpXHFuRSq501ijwsJPEHXsvKN5rfMwmve01rdX7W2VPjha6/SkQuFK3u2cQ
         gRyMyejNzgYCHylAw58hYnvRpiNUwhwel/WjoyL1Z77q76lcj0ILCLjIIgYbiDqttbTC
         M8cYBpYBPD1KI4CTF/lLzIrrCtMfnA5GZI8jEJC0AMY8GMxss0XzPLTxreVBbocO44r5
         ch5p4ZWh6CEzYw9PqYSC7pSMEC9Or07n3HHrlFyfEKunSFNjI9tV/1Rh1TYsgFd+1kDH
         UhTQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1777347629; x=1777952429; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqjpw9WHOOkHTPHEKVYISP7EvZ6J0wgpvL9r5AV6eKw=;
        b=AhHL0Co4CgBFx7NDIRrrjVcHhfNnvh2COvYVsJXNLK1U5ojEwmlzz9eWQMB7ZE6Bpj
         tL9/2UcS6o7NuMn/SPOCR4ykXOWKd8pkQe+gc+vlNRjhignqgBb8XYCQzdsz7HZh415R
         LEP6YjmQYccFUtZinwWMHdip6I7sFcj7jeKSU3+LJYgwu5/iMyZ9BJuVr3ggorEyevgd
         3f/Wz1AFqN4XIjGvUan7d3VhOmmzC/+p0YzEbIALJcIFAzuGle0LqfP/NbUobBkNoOh6
         cuHIcbAS1vYpAFSIb1NNTkupoxFkc861ifvoYFbsySqJWw07g/ED88qi8fOIq9xIuRvS
         dtLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777347629; x=1777952429;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqjpw9WHOOkHTPHEKVYISP7EvZ6J0wgpvL9r5AV6eKw=;
        b=S57npLjTh6SB7GtlDihs9Kugiuc+Pq0ZB9Jx2L/Z6KHe06+zLqqGwZya86AnXvMsxY
         xb2wriOxGgmPMmPtLedeG+njhu2q6xobmgdyqG5XoMdsjLHFd/X2H9yWWV5dPQoGzmHJ
         nUCBqByv7qYoLLbyCp9uoTDlqrEU1w/lgTEg7cL2nTh76iTmEp4+9C8876fhpAyqV6ts
         LEgtZtdTutGP97hpu8L/MatR8UmUsmB9KWiprPIAEcWwbBRt9Kogtpnzv+aLXkFd3FuM
         DF0gvTHJICP1iBjtjkvXCdBxa5nlV+O/BZaRZNANqHPzizVObXb6Nb1XrfFeGqNl7xpm
         DyRg==
X-Forwarded-Encrypted: i=1; AFNElJ9xVl2Q7ZwIlfSMmosAByX3y3152DOP5bQppXisFnCMoID3xQkcobY5QUUC38KxWVL1uS+vV78o@lists.infradead.org
X-Gm-Message-State: AOJu0YwWkCwt/ALf3lnLacvmDfMsPHD33EdsqWmL+ibFe2BLayR5+qTh
	RWe+ptuIetcU8CAS0NZqaYCTRjBByaX733sPxjIEH3g87vnjXRlhuNdtLs59aS3+6sPiUtwHffh
	Han/SxhA446CepHapmnMTzXnp58y2V92WcdCcfhGNLg==
X-Gm-Gg: AeBDievUe1wfpBsgqfaxzdMydp4+f3JgaUg1g8ZvHu/NiB6hxjnkgT3hj/GHd2Y4cVp
	nm17ljzJTUZdrxkOxnSDOJOL7PeoGSUNV0Mn144J/J9nFItHe+GE2GWTD71ucZVI5g1MwuFyY2g
	yvReNv1x/BnvE8TTFTIfYSiI+aXHPdvSVPuSw89pUEGiz1HI9V2CgNkrg9ABb2ZfSHU7ptYhLn7
	+5n4spjpoLKPQUL9VIagR08aNYK/vHAC7XqJi8rp+T7ET9fjrnw4q3w9VWmg9udFWWh1WKiRPcn
	PZbWRQSkANUL0VbntwFcVwYsHAWPn+TUAnHJjdxJAY6B0V1px4HJZJ47U0tFFUU=
X-Received: by 2002:a05:651c:50d:b0:38a:4e7a:c236 with SMTP id
 38308e7fff4ca-39240d021b6mr3921491fa.12.1777347628289; Mon, 27 Apr 2026
 20:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
 <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com>
 <20260409191943.291207-1-evvoevod@tenstorrent.com> <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
 <20260416202608.1125121-1-evvoevod@tenstorrent.com> <CAAhSdy1kwkZtHKUzQov=b8_PvnXT1DZ379P_egDtbpSbkN03dw@mail.gmail.com>
 <20260427180039.2472287-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260427180039.2472287-1-evvoevod@tenstorrent.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Apr 2026 09:10:17 +0530
X-Gm-Features: AVHnY4JXHn6pbkWqvc_IJCg-MdIcHdHF2LSOP_X3eKp-RE5_n9i8EoJGaS-eOyc
Message-ID: <CAK9=C2UWiWfKwUhnWwHZZ1iB1UZuUJG5uNp823Q9rvZvrTJ19Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: anup@brainfault.org, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_204031_409751_B5D0DFB7 
X-CRM114-Status: GOOD (  25.41  )
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

T24gTW9uLCBBcHIgMjcsIDIwMjYgYXQgMTE6MzHigK9QTSBFdmdlbnkgVm9ldm9kaW4KPGV2dm9l
dm9kQHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEFwciAyMywgMjAyNiBhdCAx
MDo1NCBBTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPiA+IEkgYW0g
bGVhbmluZyB0b3dhcmRzIG9wdGlvbiAjMiBhbmQgYXMgYSBzZXBhcmF0ZSBzZXJpZXMKPiA+IHRo
ZSBzYmlfaXJxY2hpcCBjYW4gYmUgZXh0ZW5kZWQgdG8gc3VwcG9ydCBOTUlzLgo+Cj4gSGkgQW51
cCwKPgo+IEFzIEknbSB3b3JraW5nIG9uIHJlZmFjdG9yaW5nIHRoZSBTbXJubWkgc2VyaWVzIGFj
Y29yZGluZyB0byBvdXIKPiBkaXNjdXNzaW9uLCBJJ2QgbGlrZSB0byBzdWdnZXN0IHRvIGdvIHdp
dGggb3B0aW9uIDMuIEl0IHdvdWxkIGJlCj4gbXVjaCBjbGVhbmVyIHRvIGludHJvZHVjZSBnZW5l
cmljIE5NSSBzdXBwb3J0IGluIGlycWNoaXAgYW5kIGJ1aWxkCj4gU21ybm1pIG9uIHRvcCBvZiB0
aGF0LCByYXRoZXIgdGhhbiBzaGlwcGluZyBhIHRlbXBvcmFyeQo+IG9wcy0+cm5taV9oYW5kbGVy
IGJyaWRnZSBub3cgYW5kIHJlZmFjdG9yaW5nIGl0IGxhdGVyLgo+Cj4gTk1JIHN1cHBvcnQgaW4g
aXJxY2hpcCBkb2Vzbid0IG5lZWQgdG8gYmUgY29tcGxpY2F0ZWQuIEl0IGNvdWxkIGJlCj4gYXMg
c2ltcGxlIGFzIHRoaXM6Cj4KPiBpcnFjaGlwIE5NSSBBUEk6Cj4KPiAgIHR5cGVkZWYgaW50ICgq
c2JpX25taV9oYW5kbGVyX3QpKHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCwKPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgcmVzdW1hYmxlKTsKPgo+ICAgaW50
IHNiaV9pcnFjaGlwX3JlZ2lzdGVyX25taV9oYW5kbGVyKHNiaV9ubWlfaGFuZGxlcl90IGhhbmRs
ZXIpOwo+ICAgaW50IHNiaV9pcnFjaGlwX3Byb2Nlc3Nfbm1pKHN0cnVjdCBzYmlfdHJhcF9jb250
ZXh0ICp0Y250eCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIHJlc3VtYWJs
ZSk7Cj4KPiBBIHNpbmdsZSBOTUkgaGFuZGxlciBjYWxsYmFjayBub3QgdGllZCB0byBhbnkgaXJx
Y2hpcCBkZXZpY2Ugc2luY2UKPiBOTUkgaXMgYSBzeXN0ZW0tbGV2ZWwgZXZlbnQuIFBsYXRmb3Jt
cyByZWdpc3RlciB0aGVpciBOTUkgaGFuZGxlcgo+IGR1cmluZyBpbml0Lgo+Cj4gVHdvIGFzc2Vt
Ymx5IGVudHJ5IHBvaW50cyBpbiBmd19iYXNlLlM6Cj4KPiAtIF90cmFwX25taV9oYW5kbGVyIC0t
IGZvciBnZW5lcmljIHVucmVzdW1hYmxlIE5NSXMgKHVzZXMKPiAgIG1zY3JhdGNoL21lcGMvbWNh
dXNlLCByZXR1cm5zIHZpYSBtcmV0KS4gVGhpcyBjb3ZlcnMgcGxhdGZvcm1zCj4gICB3aXRob3V0
IFNtcm5taSB0aGF0IHN0aWxsIGhhdmUgaW1wbGVtZW50YXRpb24tZGVmaW5lZCBOTUkgdmVjdG9y
cy4KClRoaXMgaW50cm9kdWNlcyBzZXBhcmF0ZSBlbnRyeSBwb2ludCBvdGhlciB0aGFuIF90cmFw
X2hhbmRsZXIgd2hpY2gKd2hhdCB3ZSBzaG91bGQgbm90IGJlIGRvaW5nIGJlY2F1c2UgdGhlcmUg
d2lsbCBiZSBwbGF0Zm9ybXMgd2hpY2gKdXNlIG10dmVjIGZvciBSTk1JIGV4Y2VwdGlvbiB0cmFw
cyAob3IgVU5NSXMpIHNvIG9uIHN1Y2ggcGxhdGZvcm1zCnNhbWUgX3RyYXBfaGFuZGxlciB3aWxs
IGJlIHVzZWQgZm9yIHJlZ3VsYXIgdHJhcHMvaW50ZXJydXB0cyBhbmQgVU5NSXMuCgo+Cj4gLSBf
dHJhcF9ybm1pX2hhbmRsZXIgLS0gZm9yIFNtcm5taSByZXN1bWFibGUgTk1JcyAodXNlcwo+ICAg
bW5zY3JhdGNoL21uZXBjL21uY2F1c2UsIHJldHVybnMgdmlhIG1ucmV0KS4KPgo+IEJvdGggc2F2
ZSB0aGUgY29udGV4dCBpbnRvIHRoZSBzYW1lIHNiaV90cmFwX2NvbnRleHQgc3RydWN0dXJlIGFu
ZAo+IGRpc3BhdGNoIHRocm91Z2ggc2JpX2lycWNoaXBfcHJvY2Vzc19ubWkoKS4KPgo+IEMtbGV2
ZWwgZGlzcGF0Y2ggaW4gc2JpX3RyYXAuYzoKPgo+ICAgX3RyYXBfbm1pX2hhbmRsZXIgIC0+IHNi
aV90cmFwX25taV9oYW5kbGVyKCkgIC0+IHNiaV9pcnFjaGlwX3Byb2Nlc3Nfbm1pKHRjbnR4LCBm
YWxzZSkKCkxpa2UgZGlzY3Vzc2VkIHByZXZpb3VzbHksIHRoaXMgc2hvdWxkIGJlOgpfdHJhcF9o
YW5kbGVyIC0+IHNiaV90cmFwX2hhbmRsZXIoKQoKPiAgIF90cmFwX3JubWlfaGFuZGxlciAtPiBz
YmlfdHJhcF9ybm1pX2hhbmRsZXIoKSAtPiBzYmlfaXJxY2hpcF9wcm9jZXNzX25taSh0Y250eCwg
dHJ1ZSkKPgo+IFRoZSAicmVzdW1hYmxlIiBmbGFnIGxldHMgdGhlIHBsYXRmb3JtIGRpc3Rpbmd1
aXNoIFJOTUkgZnJvbSBVTk1JCj4gaWYgaXQgbmVlZHMgdG8gKGZvciByZWNvdmVyeSBvciBqdXN0
IHJlc2V0KSwgd2hpbGUgcGxhdGZvcm1zIHRoYXQKPiBkb24ndCBjYXJlIGNhbiBqdXN0IGlnbm9y
ZSBpdC4gVGhpcyBjb3VsZCBiZSB1c2VmdWwgZm9yIHZlbmRvcnMgd2hvCj4gd2FudCB0byBzaGFy
ZSB0aGVpciBwbGF0Zm9ybSBjb2RlIGFjcm9zcyBwbGF0Zm9ybXMgd2l0aCBTbXJubWkgYW5kCj4g
d2l0aG91dC4KPgo+IEZvciBSTk1FIChleGNlcHRpb24gd2hpbGUgTk1JRT0wKSwgd2UgcmV1c2Ug
X3RyYXBfaGFuZGxlciBhcyB5b3UKPiBzdWdnZXN0ZWQgLS0gaXQncyBhIHJlZ3VsYXIgTS1tb2Rl
IHRyYXAgYXQgYSBkaWZmZXJlbnQgdmVjdG9yLgo+Cj4gVGhlIG9wcy0+c21ybm1pX2hhbmRsZXJz
X2luaXQoKSBjYWxsYmFjayBzdGF5cyAtLSBwbGF0Zm9ybXMgc3RpbGwKPiBuZWVkIHRvIGluc3Rh
bGwgdGhlIGFzc2VtYmx5IGhhbmRsZXJzIGF0IHRoZWlyIGltcGxlbWVudGF0aW9uLWRlZmluZWQK
PiB2ZWN0b3JzIHRvIGhhbmRsZSBSTk1JcyBjb3JyZWN0bHkuCj4KPiBUaGUgc2VyaWVzIHdvdWxk
IHRoZW4gYmUgc3RydWN0dXJlZCBhczoKPiAxLiBpcnFjaGlwIE5NSSByZWdpc3RyYXRpb24gQVBJ
IChjb3VsZCBnbyBpbiBhIHNlcGFyYXRlIHBhdGNoIHNldAo+ICAgIGlmIG5lZWRlZCBmb3IgY2xh
cml0eSkKPiAyLiBTbXJubWkgc2NyYXRjaCBzcGFjZSBhbmQgbWFjcm9zIHdoaWNoIHlvdSBhbHJl
YWR5IGFwcHJvdmVkCj4gMy4gUmVzdCBvZiB0aGUgZ2VuZXJpYyBwYXJ0IG9mIHRoZSBTbXJubWkg
cGF0Y2ggc2V0Cj4KPiBXaGF0IGRvIHlvdSB0aGluaz8KClJhdGhlciB0aGFuIGV4cGFuZGluZyB0
aGlzIHNlcmllcywgbGV0cyBmaXJzdCBnZXQgdGhlIGJhc2ljCmluZnJhc3RydWN0dXJlIGluLXBs
YWNlIHdpdGgganVzdCB0d28gbG93LWxldmVsIGhhbmRsZXJzCl90cmFwX2hhbmRsZXIoKSBhbmQg
X3RyYXBfcm5taV9oYW5kbGVyKCkuIEV4dGVuZGluZywKdGhlIGlycWNoaXAgZnJhbWV3b3JrIGZv
ciBOTUlzIHNob3VsZCBiZSBhIHNlcGFyYXRlCmV4Y2VyY2lzZS4KClJlZ2FyZHMsCkFudXAKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
