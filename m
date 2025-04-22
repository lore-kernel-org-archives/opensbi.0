Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A95D2C369C2
	for <opensbi@archiver.kernel.org>; Tue, 22 Apr 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OXHzrNXrzJvN5tjjOLC2o9OgQ3e/aToQft2ZWHpWMWE=; b=efZ8zkuRomGRFy
	Qz17/AI0rxhqrSHgp1UCUUzVrMYyUyTD/VDd4jORTn27PbjrvqUHTPrFEhSN4/u195QytHt7VVRbj
	tUI3RKf4qa8Y4cs0uQa+C61dF8zAJ9c1ph9qkYQhALctSZEE8uyxzIk7iuuSTA2CSGl4KEtT4U81F
	AR0bRJQXQm9wp1L/mmA0kz9r1kuj8ewiPpOIDA/ElbIB59ZIdeRf+Qzq51IcVz36KAE6b86GMEvU4
	Y5GyZQRDPNHG4yCH4PdTqmKrp2nqOfMloqk87CY0iJciVtb5x+Jk7AXBKzlWT9rKIdJOq3lX8k9Jb
	tS/D0RwZ8uNzAsWiMKZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7FFi-00000007dwN-0XAc;
	Tue, 22 Apr 2025 15:09:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7DlD-00000007JnP-3DGW
	for opensbi@bombadil.infradead.org;
	Tue, 22 Apr 2025 13:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ahGeIVVJTs1RcDp4bB6MGW5PsOKsH3VaMvNHEKfUX40=; b=lHI7jQF2K0wTAbhR5WnO6wYqX+
	Tw5VaJA82RxVm0htx4pBwCRRxyjr0JGpuCJe2RxCEMnNrkVimf+4QEm7yeXMin8iNXpMNl0ZYVRb2
	I0go4le+XAE0LlS7KfrAr0G987EobK22/awHaYi4VsUYV3KwSJm0b9NaeHH30qz3tlxVs4swHNY0F
	OajL3NY8Z9t+AQPqkyA8mMxaPpcW68IaG6uNAPnj2098mVYmy5qnb4HBXSgYGPte7iaFotCEC+v8J
	SmJRtwZ7OKc4KETlCtzIgXctXwbMiazzfchqJTxF8Qswh+9IZSgTQQshFwsG/Vk7wA2z2OAOGEtPf
	T3gIRtLg==;
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7DlA-0000000BEeQ-32mT
	for opensbi@lists.infradead.org;
	Tue, 22 Apr 2025 13:34:02 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3d91b55bd39so6574725ab.0
        for <opensbi@lists.infradead.org>; Tue, 22 Apr 2025 06:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1745328836; x=1745933636; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahGeIVVJTs1RcDp4bB6MGW5PsOKsH3VaMvNHEKfUX40=;
        b=uUZC0tPfughtj0CQ9A21pApSlgzehpGG2WUlayUQrguS4mft8S2oeapsxYd9pkcj07
         ZRuvWQvL09G5059A0JX0Do0F5ko6OSCFBfJ21lhsM5MIgkXs10IXY+a7SNFCCdv0O8yZ
         xTTobyTMmHbTNFoEyt+bCWf0TabuVJ7eg/Kaab56ch5cxrX4N/dPOM7H12xQ/ewJiYDf
         ov68ujw5rS/eY5Y88nrD6C/4nipO83q3eGziTwkG4+4TVcxKmD5JkGOdhDoN9Z5EKgWl
         siKaedNQ6+huyEd/vdx8EqrC8Y5GaX2CE3ChgbSqZ0b7hHaxeZPMVyfUquU8tqaR14kU
         Tucw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745328836; x=1745933636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahGeIVVJTs1RcDp4bB6MGW5PsOKsH3VaMvNHEKfUX40=;
        b=HIoAhmTd2ecZeIicLN2YeBg7UzIDBY+hPOmZ8U+bG4e0BnMrCUizbcLSx2ZrfA5Wn4
         Tw9A+XwWinwSBZjgYi3/1Dzj/PTDTcelC9c8DRzBiwiBEzjO09R0vHPiacTvNyZGeC69
         SZlFT+XwWHy8OhGHuBh6JcyzO4sPeOLo2LZd4RP/LSEb8ruq3DHNUOuy8PU4z6l03X3v
         h6uZbaB79Cl4v/shejyKpOsFi0iAnutA28UlgtlplhegcvG5Mtn7HFjd6wjRX1KawlVs
         YXacp7Q6XzlmjMfMlK6zmJWRcKi5VLNg8ZAhL1qi/T6rfm3+Mx3Ecdu8KwShoEyrS3nV
         DlcA==
X-Gm-Message-State: AOJu0YwRdaZI7VIJJMKsGhnnAUpyu9wnoEwhWKqEc4Zysum8yYhM4Yi0
	JHVTbG+6vbGODGHeVaCviFAQuYV+fDkNXNY8fXB3jTD3mP8U7xU4qCxXGxAn67pqxG8/2SBg9im
	JZdngY8llmOujZy1suy8uAuqgX0zDbvHkJvUWuQ==
X-Gm-Gg: ASbGnctQU8z3FvHH51vs+UYq3Gnz5/X4OQiSFUbQmWs3C55135txydDlprhRd3nQKK7
	5ZwUrv+Pm58guygo88rka+P/QaPAcbo1z07D8WBaIvt40ELRLZ9+p+3UqHkcFeTpcDWeFXETnPY
	oCabimK7iFpI4sss663dG6roI=
X-Google-Smtp-Source: AGHT+IGaFdLGfIxZvJhjJDs3N9uvnc46AWa0HxY9sUHKgb3Vnm0gGivo9QtGBXviyxM7dFcJB7cN8hYg84VcvhusRZA=
X-Received: by 2002:a05:6e02:156a:b0:3d4:3fbf:967d with SMTP id
 e9e14a558f8ab-3d88ed8c6b0mr165271605ab.7.1745328836118; Tue, 22 Apr 2025
 06:33:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250325234342.711447-1-samuel.holland@sifive.com> <20250325234342.711447-3-samuel.holland@sifive.com>
In-Reply-To: <20250325234342.711447-3-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 22 Apr 2025 19:03:45 +0530
X-Gm-Features: ATxdqUHH2wegLK6hW9IVY-AX5pw3KOhtr_4J3CF8lNQAUQn8DPwySzcQurVByyE
Message-ID: <CAAhSdy2QM5mEmD+Zcs+6yOPaqXMmndFNO5ei7L++-aJqJuzpvQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] platform: rzfive: Call andes_pma_setup_regions()
 only during cold boot
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_143400_932597_06BA325F 
X-CRM114-Status: GOOD (  16.92  )
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

T24gV2VkLCBNYXIgMjYsIDIwMjUgYXQgNToxM+KAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgZnVuY3Rpb24gYWNjZXNzZXMgdGhl
IEZEVCBibG9iLCB3aGljaCBtZWFucyBpdCBpcyBvbmx5IHZhbGlkIHRvCj4gY2FsbCBkdXJpbmcg
Y29sZCBib290LCBiZWZvcmUgYSBsb3dlciBwcml2aWxlZ2UgbGV2ZWwgaGFzIGFuIG9wcG9ydHVu
aXR5Cj4gdG8gY2xvYmJlciB0aGF0IG1lbW9yeS4KPgo+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBI
b2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBB
bnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPgo+
ICBwbGF0Zm9ybS9nZW5lcmljL3JlbmVzYXMvcnpmaXZlL3J6Zml2ZS5jIHwgMTIgKysrKysrKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvcmVuZXNhcy9yemZpdmUvcnpmaXZlLmMg
Yi9wbGF0Zm9ybS9nZW5lcmljL3JlbmVzYXMvcnpmaXZlL3J6Zml2ZS5jCj4gaW5kZXggNTkwODRj
NDEuLmRiNTIzMDg4IDEwMDY0NAo+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvcmVuZXNhcy9yemZp
dmUvcnpmaXZlLmMKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL3JlbmVzYXMvcnpmaXZlL3J6Zml2
ZS5jCj4gQEAgLTI3LDggKzI3LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgYW5kZXNfcG1hX3Jl
Z2lvbiByZW5lc2FzX3J6Zml2ZV9wbWFfcmVnaW9uc1tdID0gewo+ICBzdGF0aWMgaW50IHJlbmVz
YXNfcnpmaXZlX2ZpbmFsX2luaXQoYm9vbCBjb2xkX2Jvb3QsIHZvaWQgKmZkdCwKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IGZkdF9tYXRjaCAqbWF0
Y2gpCj4gIHsKPiAtICAgICAgIHJldHVybiBhbmRlc19wbWFfc2V0dXBfcmVnaW9ucyhmZHQsIHJl
bmVzYXNfcnpmaXZlX3BtYV9yZWdpb25zLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGFycmF5X3NpemUocmVuZXNhc19yemZpdmVfcG1hX3JlZ2lvbnMpKTsKPiArICAg
ICAgIGludCByYzsKPiArCj4gKyAgICAgICBpZiAoY29sZF9ib290KSB7Cj4gKyAgICAgICAgICAg
ICAgIHJjID0gYW5kZXNfcG1hX3NldHVwX3JlZ2lvbnMoZmR0LCByZW5lc2FzX3J6Zml2ZV9wbWFf
cmVnaW9ucywKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBh
cnJheV9zaXplKHJlbmVzYXNfcnpmaXZlX3BtYV9yZWdpb25zKSk7Cj4gKyAgICAgICAgICAgICAg
IGlmIChyYykKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmM7Cj4gKyAgICAgICB9
Cj4gKwo+ICsgICAgICAgcmV0dXJuIDA7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHJlbmVzYXNfcnpm
aXZlX2Vhcmx5X2luaXQoYm9vbCBjb2xkX2Jvb3QsIGNvbnN0IHZvaWQgKmZkdCwKPiAtLQo+IDIu
NDcuMgo+Cj4KPiAtLQo+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
