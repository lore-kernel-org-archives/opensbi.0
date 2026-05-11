Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BA4CD37AC
	for <opensbi@archiver.kernel.org>; Mon, 11 May 2026 03:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XrLdV4DMXWzF0qvkpCxGEBo0z8Lkl3wHY8LGk/vafxc=; b=nz0iVECZuO31il
	aEocNrRypk9DyMY+Oz3KIlQB9dOjpy6xCQeANaH1H/GOkw/yGaewoidymiBOglOok0KpMpoCp1KKc
	61A0Mj8aGDEMMr/TnjlXLSMVR4YSk4Qjz53Wj0iqdXpdVXFao2bAmq/l+r4nm46Gm/8dLWAVSLGqR
	+tRYn9d7offGmK2hu65C/RHC9OaYxSYTOSQB9b73BoXcH4lNdmQM8iK1bXqEhQfmRx2MnjBzNHVaW
	cgabrW/ywSjq7xo22xbE3o5+0a9c0LlIR9RI1YExouB7pXm9ZIZkuHj8Y5jMuXgQlAgrR/X0K+/Bs
	oW9vIivy2PkpRzsFz1BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHFZ-0000000CAPu-2RiT;
	Mon, 11 May 2026 03:24:09 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHFW-0000000CAPK-0ZNe
	for opensbi@lists.infradead.org;
	Mon, 11 May 2026 03:24:07 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-63124ac76f5so1140362137.1
        for <opensbi@lists.infradead.org>; Sun, 10 May 2026 20:24:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778469844; cv=none;
        d=google.com; s=arc-20240605;
        b=HbiuHUb3DUFDUv7RlKR1yXZ8t75KJ+zhKr4Z2qv/S0DxsAo4BItVcTSBb0Vwms+VPG
         bjAofUjaNNzmJxBUrYKspSyBqVjEafbxoXhZ/cL1sgre9jgAV2KqtpIuXN1ydRji9RAo
         HJ25rSbGQHJNm/QHuL9ejo/vKnkJy6n455+ScRiL9JgXP778upIrbg6mKC1lE11twFOq
         vNX+PdE+PpP9mLmBmLsxL5gWBIqRB/aWXbuUKzN0Vuf8nE0oqEM0r76boL3oN5IqYkJz
         Xba5Mno9YKHdH48u+PwobuZOq4/qtjXnyXH8HAFwmAR8dIepTiahxUIBBXUhXKj30uJ5
         su7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WUMnHw40vgiKjHTDgHUIwRDaa/ufKZR2HyfDMqHy3sI=;
        fh=6DkKFrsSNDzPGZaTnIq9wdefkLogFHHL3ybXjQ4mndU=;
        b=Qz1MV3puTiRWIklPVyCj0ZPktNM0ekTJVkxUXTlqLAiDOHf3+REpyIgp8inuVeOzWZ
         Nocx+47+eR7LDfnoyQBjByhl7c2cDUR4sUVlevlyCBZx+yMo94pVjsIqBVxrhavE4u4o
         PSG7hHvtbKJ3YRxpw18bEjz6X8pjWtGvW/+ygRCFLIFuGjkraZ0i4t/RQTXJNbQOoaE3
         Sj2owMaVHAA3NcyQSZlnY60hqXv91vy+jMKIimrUpcF9u/98Wr9kmxLC0s6sLgGnIGtA
         PN8+kIF873iVZNe7XbTxCvcyzzYp0k3AgptULe9up3RRAGH1MqpSCgaG6N0KhiEZf2GT
         o75A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1778469844; x=1779074644; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUMnHw40vgiKjHTDgHUIwRDaa/ufKZR2HyfDMqHy3sI=;
        b=DIWoA2VY79KkIiP6NuSVsTp4yLZi8U+H2RoOaRBJRpC8Wul0O9Cu3r7t8Spumpq4iK
         aKPkBFgVzItez7Yadi0lAgdet2DWk0nOh6+O2EfDoW7/1IkSOu33TGjkgjWQv00JSkcP
         7UDTyvn3G8feNs77FxIvezkoKe8R7VykzK2KL76qrYVsrPKBb5Hzl8whq29TuQe1kKdG
         b4/9xilGuKF67mAkyXKA7rX84msf2edxRjmdLjprZ3tZlPrCXJcGp5OBeZOQIFSPqhk3
         YNs0xpc5TUGJN/XuReajcKD48Jc7gQU+y07FXpesGNFINjD4+hfDHQ4tL8n6Ehunsitw
         ADJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469844; x=1779074644;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WUMnHw40vgiKjHTDgHUIwRDaa/ufKZR2HyfDMqHy3sI=;
        b=CNwcs0+sA049AOD/sTii/nrkE/6zQxxSWhgh0luptDoLQ1Kw3e5mRJ26GztAawWWK+
         rjj1L6dQzZHr70QKZfo+bIxSQhpAnGwKKzh3753o3UAcH33t+V4yB6E4F5lBLnv+GUZl
         Wx5+LtB5oEYXfwyWVetv09oJNNpn0CizGpxsPq/0gl5pyYAwMieuEPqTvHzjKxdhF4MP
         y+syeJFiP/y6CNauOkdksi5NY4XQKYXbCVNrTrR4TkVDHmvVXCoFhiSNhp6UgEA35XcQ
         TP7G8dUDOkB6EQGvaewzeJINZApacd90eDvf3i+2rMTxZwaZC7oJ02so01xK2rtko6tb
         LPtQ==
X-Forwarded-Encrypted: i=1; AFNElJ9X6rMUzmSJUk3IiolbtlKrT6Vc2jnS7YJ45MeSMHigwPdtYNbfSkklPp4SePy6f7UzF7KMwCa+@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3GiixA95Ri0xIhbONS1lU8lNcmPZxHiUBnX1dW4SKzGw2BXgr
	pMMzIs4q8NZkP9ri3gzeqyfuiZRM2OJXsNYMvSFg8wYN5xmCZJD1opw7Lu2k/cv3td1zNFo36qY
	UGMPfzj/58un6HFkX0yHC7Q19z73oFi2mGAQQvBrZGNw07G/T2RVifvjKXA==
X-Gm-Gg: Acq92OFQZ4eyKIjtz1jsrpBono9QErjHMA2UwgCb4nphOt8FuCkGLFWC3UCvH5X+saf
	JRIdqdaBNGd3bBCtCd/0ehuJVlHTH1y0eQhKZJ4DBlShfDWGy5VVNogEHttV2AlyQwcbBMEqhpH
	5ZLyhCOZJz+K2qj7WNzGKG6IjhFldHKTNBPLGAa+LSW5qLwq+uIWFYNa6gIh+cwI/ITfu5p/qdM
	kEcP6+XZbtIxG1RNttUpt2jBqgF0txyNUI4ixfXHPej9KhNWYWFNrRG+ID1dm40VkAlnb9SQr/n
	zvpNK9qh9Q==
X-Received: by 2002:a05:6102:1620:b0:631:2472:e832 with SMTP id
 ada2fe7eead31-631da131c39mr2523289137.8.1778469844542; Sun, 10 May 2026
 20:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1778176768.git.evvoevod@tenstorrent.com> <1c6feb6d359b9827b3c2ad8f4f0e0a4dfd1de911.1778176768.git.evvoevod@tenstorrent.com>
In-Reply-To: <1c6feb6d359b9827b3c2ad8f4f0e0a4dfd1de911.1778176768.git.evvoevod@tenstorrent.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Mon, 11 May 2026 11:23:51 +0800
X-Gm-Features: AVHnY4JbVGEs__2h2CTOrFNlATaVkMb8OGbMa74PFAV2aubA4UX3KAG8NCiyxv4
Message-ID: <CAHh=Yk_zsAkodPEReLS7ie_pA8KB=35UuZbmCvnqc+7HD-FD+g@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] lib: sbi: Add Smrnmi extension macros for
 registers and bits
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_202406_193723_1D2148DE 
X-CRM114-Status: GOOD (  13.46  )
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

RXZnZW55IFZvZXZvZGluIDxldnZvZXZvZEB0ZW5zdG9ycmVudC5jb20+IOaWvCAyMDI25bm0Neac
iDjml6XpgLHkupQg5LiK5Y2IMjowOOWvq+mBk++8mgo+Cj4gQWRkIENTUiBkZWZpbml0aW9ucyAo
TU5TQ1JBVENILCBNTlNUQVRVUywgTU5FUEMsIE1OQ0FVU0UpIGFuZCBiaXQgZGVmaW5pdGlvbnMK
PiAoTU5TVEFUVVNfTk1JRSwgTU5TVEFUVVNfTU5QViwgTU5TVEFUVVNfTU5QUCkuIEFsc28gYWRk
IFNCSV9IQVJUX0VYVF9TTVJOTUkgdG8KPiB0aGUgaGFydCBleHRlbnNpb24gZW51bWVyYXRpb24u
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBFdmdlbnkgVm9ldm9kaW4gPGV2dm9ldm9kQHRlbnN0b3JyZW50
LmNvbT4KPiBSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KPiAt
LS0KPiAgaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCB8IDEwICsrKysrKysrKysKPiAgaW5j
bHVkZS9zYmkvc2JpX2hhcnQuaCAgICAgICB8ICAyICsrCj4gIGxpYi9zYmkvc2JpX2hhcnQuYyAg
ICAgICAgICAgfCAgMSArCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmggYi9pbmNsdWRlL3NiaS9y
aXNjdl9lbmNvZGluZy5oCj4gaW5kZXggM2MxZDUyNTYuLjE4ZjdiNGE3IDEwMDY0NAo+IC0tLSBh
L2luY2x1ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiArKysgYi9pbmNsdWRlL3NiaS9yaXNjdl9l
bmNvZGluZy5oCj4gQEAgLTIxNSw2ICsyMTUsMTAgQEAKPgo+ICAjZW5kaWYKPgo+ICsjZGVmaW5l
IE1OU1RBVFVTX05NSUUgICAgICAgICAgICAgICAgICAoX1VMKDB4OCkpCj4gKyNkZWZpbmUgTU5T
VEFUVVNfTU5QViAgICAgICAgICAgICAgICAgIChfVUwoMHg4MCkpCj4gKyNkZWZpbmUgTU5TVEFU
VVNfTU5QUCAgICAgICAgICAgICAgICAgIChfVUwoMHgxODAwKSkKUGxlYXNlIGFkZCBkZWZpbmUg
Zm8gbW5zdGF0dXMuTU5QRUxQIGJpdCBhcyB3ZWxsLgo+ICsKPiAgI2RlZmluZSBNSFBNRVZFTlRf
U1NDT0ZfTUFTSyAgICAgICAgICAgX1VMTCgweEZGMDAwMDAwMDAwMDAwMDApCj4KPiAgI2RlZmlu
ZSBFTlZDRkdfU1RDRSAgICAgICAgICAgICAgICAgICAgKF9VTEwoMSkgPDwgNjMpCj4gQEAgLTgz
MCw2ICs4MzQsMTIgQEAKPiAgI2RlZmluZSBDU1JfQ1VTVE9NMTBfTV9ST19CQVNFICAgICAgICAg
MHhGQzAKPiAgI2RlZmluZSBDU1JfQ1VTVE9NMTBfTV9ST19DT1VOVCAgICAgICAgICAgICAgICAw
eDA0MAo+Cj4gKy8qIFNtcm5taSBleHRlbnNpb24gcmVnaXN0ZXJzICovCj4gKyNkZWZpbmUgQ1NS
X01OU0NSQVRDSCAgICAgICAgICAgICAgICAgICAgICAgICAgMHg3NDAKPiArI2RlZmluZSBDU1Jf
TU5FUEMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NzQxCj4gKyNkZWZp
bmUgQ1NSX01OQ0FVU0UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAweDc0Mgo+
ICsjZGVmaW5lIENTUl9NTlNUQVRVUyAgICAgICAgICAgICAgICAgICAgICAgICAgIDB4NzQ0Cj4g
Kwo+ICAvKiA9PT09PSBUcmFwL0V4Y2VwdGlvbiBDYXVzZXMgPT09PT0gKi8KPgo+ICAjZGVmaW5l
IENBVVNFX01JU0FMSUdORURfRkVUQ0ggICAgICAgICAweDAKPiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9zYmkvc2JpX2hhcnQuaCBiL2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBpbmRleCBhNzg4YjM0
Yy4uOTM3Y2RmMjkgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2hhcnQuaAo+ICsrKyBi
L2luY2x1ZGUvc2JpL3NiaV9oYXJ0LmgKPiBAQCAtODcsNiArODcsOCBAQCBlbnVtIHNiaV9oYXJ0
X2V4dGVuc2lvbnMgewo+ICAgICAgICAgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0ZMVVNIX0RfTDEs
Cj4gICAgICAgICAvKiogSGFydCBoYXMgWHNmY2Vhc2UgZXh0ZW5zaW9uICovCj4gICAgICAgICBT
QklfSEFSVF9FWFRfWFNJRklWRV9DRUFTRSwKPiArICAgICAgIC8qKiBIYXJ0IGhhcyBTbXJubWkg
ZXh0ZW5zaW9uICovCj4gKyAgICAgICBTQklfSEFSVF9FWFRfU01STk1JLAo+Cj4gICAgICAgICAv
KiogTWF4aW11bSBpbmRleCBvZiBIYXJ0IGV4dGVuc2lvbiAqLwo+ICAgICAgICAgU0JJX0hBUlRf
RVhUX01BWCwKPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlf
aGFydC5jCj4gaW5kZXggOTllMTM5OTAuLjRhZWZiNzU5IDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkv
c2JpX2hhcnQuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2hhcnQuYwo+IEBAIC0zOTYsNiArMzk2LDcg
QEAgY29uc3Qgc3RydWN0IHNiaV9oYXJ0X2V4dF9kYXRhIHNiaV9oYXJ0X2V4dFtdID0gewo+ICAg
ICAgICAgX19TQklfSEFSVF9FWFRfREFUQShzc3N0YXRlZW4sIFNCSV9IQVJUX0VYVF9TU1NUQVRF
RU4pLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFUQSh4c2ZjZmx1c2hkbG9uZSwgU0JJX0hB
UlRfRVhUX1hTSUZJVkVfQ0ZMVVNIX0RfTDEpLAo+ICAgICAgICAgX19TQklfSEFSVF9FWFRfREFU
QSh4c2ZjZWFzZSwgU0JJX0hBUlRfRVhUX1hTSUZJVkVfQ0VBU0UpLAo+ICsgICAgICAgX19TQklf
SEFSVF9FWFRfREFUQShzbXJubWksIFNCSV9IQVJUX0VYVF9TTVJOTUkpLAo+ICB9Owo+Cj4gIF9T
dGF0aWNfYXNzZXJ0KFNCSV9IQVJUX0VYVF9NQVggPT0gYXJyYXlfc2l6ZShzYmlfaGFydF9leHQp
LAo+IC0tCj4gMi40My4wCj4KT3RoZXJ3aXNlLCBMR1RNCgpSZXZpZXdlZC1ieTogTnlsb24gQ2hl
biA8bnlsb24uY2hlbkBzaWZpdmUuY29tPgoKUmVnYXJkcywKTnlsb24KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
