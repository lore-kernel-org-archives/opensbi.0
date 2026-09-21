Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0500AC982E1
	for <opensbi@archiver.kernel.org>; Mon, 21 Sep 2026 12:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZM5xYBQ2rHqqYuUDn33NkelEnZ3WFTSw4sQwWKzB8E=; b=xn0EGrsBpxEyDq
	mSV87CXyDXaRO60R2i+jgf++RBR5Ka1g/WP122mDY5vjrnpDtOkFnNR71KMGCwffA1MBcoLfxwijr
	DicyXRq9+9lLI/zEDmqNDXdpChSoltv3ONSmtsgZNj3nJBV5a632sb7UjpGSHAiaaZVBcbKtDqObS
	Lqs9dDvba3RplSAP0aRImSW2MVc9lBKcLnXWT1ckhaSykJofFWoKvv8qWNZc+eyYWcpfhG1+d86bS
	B2cYcX5HnL6PQsUa98538XLlwxfGvSckXO1Dw6q7xucIkKjdvmZ9Bb3TUgPDHdlgplFKDaCRgt00c
	QF7AuekX++qem6q53f5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8cla-0000000202a-312F;
	Mon, 21 Sep 2026 12:05:02 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8clX-0000000201b-3ekg
	for opensbi@lists.infradead.org;
	Mon, 21 Sep 2026 12:05:00 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843c2790ccso1730611f8f.1
        for <opensbi@lists.infradead.org>; Mon, 21 Sep 2026 05:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789992298; cv=none;
        d=google.com; s=arc-20260327;
        b=KbtgtepSAdSEDPKxd9OhXx5UzCaxj77PEiigmYoXc8pDkX40puHgtqlZOdEJx7/RNi
         SGHXVjyRFtFz6HiR3YrEsLhYN7O39aLVNgBiYkcO3JYX/GM/L0Oh3Ar6hj+d91yScoCq
         8yG4j/XE6PqgNnNp5DzcG66Ue3V8aBRywzGZLP4cYzuVoyYCRQ0OQH5QqJz+OT1spitw
         3yGyfrboz4SP40fXxasDiGRzRRjgVybBgXWgFXW/qJHUyg8J6iZiWmzsn8QTezrWwD45
         mM2egVDUgK3AVYM9Y4gheXla0Fh7zNNtKxBKfysV48a0QlwhCLKVpSf2tdYNqlCFgtd4
         XpzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iELwemhXC2E1gCMs01SRfQ4Q4EiVKpwTP2T+RsNNUe4=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=ZZ9F5T/evQ00XHR7HIwFlFKjzCr+l28Z+HJ09zMz4kHjW2NqlYKv832u5dBXszigvz
         da0Jh0GiUgEvEBnnqRRA4jzhE44fB6yAZKAgpQtjNjKCHNGXKaagDQQmeG6AuWn5dh1B
         8Hx/2mzd/+v+kM+2MpOCaixC+/oJwvm0fyryVgED7RlOK7AgqyWaxr5The7ukDhpDgXI
         S+zqX2PiGkxevjKtXdLWT0CdEMN2uokryp37BpuDMv816okh2sPrC9LwcTxjH2q/8OhQ
         mAnVOD+DH/kG9rOTPia/qbrYuylqSe/5Ekx5yxsYOLFbF4X0YP3Hi6/JlGCLYjI2mk5u
         CNQQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789992298; x=1790597098; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iELwemhXC2E1gCMs01SRfQ4Q4EiVKpwTP2T+RsNNUe4=;
        b=MQ3QYFamYOgwPkaaD5GbIRh/f0XLKNlOsTYBbII3ZpSK2XbzdgqWjibmP5cw7AYNRm
         H5ooSPQdQria4m0Jkfdenq/x3EQwx2cCFI40CrAu5HgFgAKjq7g/rNuD1fISGc0cnhNP
         tNoFsvlX76HEoRvnE90rAu1LEbk0mZa6WqngsvwNQv05xUCcodIlLTYf3rk7MYw6ce/J
         frF/pJozxbNtACmLr2rwsPaI9eiDskNxT/SnXn0XDV81g225r8jyYeCU+Ngpb9uyGFrf
         SB3GNeyrBEdr0s90JiUJgnsvWIhCVdPoSOxGtLm5xoRZ0LVLxbTvDRMnkOSh7baTwlb4
         JZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992298; x=1790597098;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iELwemhXC2E1gCMs01SRfQ4Q4EiVKpwTP2T+RsNNUe4=;
        b=jufxXR/GertYOJ2So5v9j3dzCLZ6yWrrzEzMoXkOmhrgQ6BBNr1wUg+vZccYo9VbDX
         A5HPKSLQoAt8dMKLwD7Uj0spjxPUijTawymFhuNqWXz0N/BCU/wtyEPMHbiNE2i/Bb+5
         Fh33kM5/OMSlD5UXyBu+3U3ZIW9hii9ztGPThldV19PJzrl9zrczgZLgDl6htAKPcaEu
         4mF8IcjI4XQjSQPrptx9LSYza0A5qF2+CiFHpiib0jATqSK0oEsQ0NPqQHtLGYBAKB+D
         O2bVPMoV0OggpYzF65fZgdUa+lnbXus9rcgBQ/qsfwB+xXRnIyk6c0+y46kBP86x1DQn
         kdAQ==
X-Gm-Message-State: AFuF++n+F17WARTo/VQOe9iLW2e300Vc/9kEknbs8lVtSxDeSSlzBjbv
	7x3Ph96chZC25foFL4gEuyaNAKIACBlZKWvvGVas3n02es68B6pfrlyyTIBXtj09BV9G0gEYXrh
	nFBffy6XXbu7JDM8kByMAUMWnHt5VrlM3HVpnMFa7zg==
X-Gm-Gg: AYBFou2c3xAS5IOv0bN2vzhBjdRF+FtgLWKb0RNR0Fqbqr0U0UnbfysqjvIYfM483sp
	KGfrSjRIm4VqVSmtk8CQy98NMMq5Vv1n8r9xdRvQbCa1czATZccsZZAUiLzFnhdIsX3yNcrjvqL
	JCyqU/60eSXVt2UBCDbswJAbrsyjBKa5wv+0Wti7fAwJBnz+zor+OduMkDL5TW6e3QEThVw0ew1
	7VpxSKzflvqcyjlFncRfEeD2owtRUsLnkw+ZVpFR/BuIz7V3vnS9RR3Nut5hyNYT4xU1e8qRXA5
	fc7MdaFoJODSnFUxYlONuDUsHKpFKEI1GnV3sWGzTV7RFNS6UBaokPa7SqCpsTG5Q+mbUxHIEb4
	sXZHDR7E7gjWIWH+fO8kM5FamuZz5heAywW/9sEzx3AhvAL2iSdbXtMGsJX6U1MKVx/HewTfW2w
	==
X-Received: by 2002:a05:600c:8b24:b0:49f:ce78:3563 with SMTP id
 5b1f17b1804b1-49fce78360emr91080435e9.20.1789992297513; Mon, 21 Sep 2026
 05:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com> <20260910210819.525538-3-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20260910210819.525538-3-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 21 Sep 2026 17:34:46 +0530
X-Gm-Features: AcwNN1UvCx1gySw6ODGsaiBNF3jY14of35vluPV1w1XMizFbFV7PG1EdEx-c3V0
Message-ID: <CAAhSdy3Eq_9SrW1HvOGUd3Wn_CVCt4MmpS5LXGqbNn6tmdoT-Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] sbi_utils: mailbox: add RPMI REQUEST_FORWARD
 service group definitions
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_050459_929224_F489B8B3 
X-CRM114-Status: GOOD (  17.74  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgMjozOOKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBBZGQgbWVzc2FnZSBwcm90b2NvbCBk
ZWZpbml0aW9ucyBmb3IgdGhlIFJQTUkgUkVRVUVTVF9GT1JXQVJEIHNlcnZpY2UKPiBncm91cCAo
U0VSVklDRUdST1VQX0lEOiAweDAwMEQpLgo+Cj4gVGhlIGZvbGxvd2luZyBhcmUgaW50cm9kdWNl
ZDoKPgo+ICAgLSBlbnVtIHJwbWlfcmVxdWVzdF9mb3J3YXJkX3NlcnZpY2VfaWQ6IHNlcnZpY2Ug
SURzIGZvciB0aGUKPiAgICAgUkVRVUVTVF9GT1JXQVJEIHNlcnZpY2UgZ3JvdXA6Cj4gICAgICAg
LSBSRVFGV0RfRU5BQkxFX05PVElGSUNBVElPTiAgKDB4MDEpCj4gICAgICAgLSBSRVFGV0RfUkVU
UklFVkVfQ1VSUkVOVF9NRVNTQUdFICgweDAyKQo+ICAgICAgIC0gUkVRRldEX0NPTVBMRVRFX0NV
UlJFTlRfTUVTU0FHRSAoMHgwMykKPgo+ICAgLSBzdHJ1Y3QgcnBtaV9yZXF1ZXN0X2ZvcndhcmRf
cmVzcDogcmVzcG9uc2Ugc3RydWN0dXJlIGZvcgo+ICAgICBSRVFGV0RfUkVUUklFVkVfQ1VSUkVO
VF9NRVNTQUdFIChTRVJWSUNFX0lEIDB4MDIpIGNhcnJ5aW5nCj4gICAgIHN0YXR1cywgcmVtYWlu
aW5nIGJ5dGVzLCByZXR1cm5lZCBieXRlcyBhbmQgYSBmbGV4aWJsZSBhcnJheQo+ICAgICBtZW1i
ZXIgZm9yIHRoZSBpbmxpbmUgbWVzc2FnZSBkYXRhLgo+Cj4gICAtIHN0cnVjdCBycG1pX3JlcXVl
c3RfY29tcGxldGVfcmVzcDogcmVzcG9uc2Ugc3RydWN0dXJlIGZvcgo+ICAgICBSRVFGV0RfQ09N
UExFVEVfQ1VSUkVOVF9NRVNTQUdFIChTRVJWSUNFX0lEIDB4MDMpIGNhcnJ5aW5nCj4gICAgIHN0
YXR1cyBhbmQgdGhlIG51bWJlciBvZiBwZW5kaW5nIGZvcndhcmRlZCBtZXNzYWdlcy4KPgo+IFRo
ZXNlIGRlZmluaXRpb25zIGFyZSB1c2VkIGJ5IHRoZSBNUFhZIGJyaWRnZSBkcml2ZXIgdG8gaW1w
bGVtZW50Cj4gdGhlIFJQTUkgUkVRVUVTVF9GT1JXQVJEIHByb3RvY29sIGZvciBpbnRlci1kb21h
aW4gbWVzc2FnZSBwYXNzaW5nCj4gb3ZlciB0aGUgU0JJIE1QWFkgZXh0ZW5zaW9uLgo+Cj4gU2ln
bmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29t
PgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoK
UmVnYXJkcywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21z
Z3Byb3QuaCB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9y
cG1pX21zZ3Byb3QuaCBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxib3gvcnBtaV9tc2dwcm90LmgK
PiBpbmRleCA3YWU0YWJlMC4uYzVkNTY0YWMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9zYmlfdXRp
bHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaAo+ICsrKyBiL2luY2x1ZGUvc2JpX3V0aWxzL21haWxi
b3gvcnBtaV9tc2dwcm90LmgKPiBAQCAtMTA2NCw0ICsxMDY0LDI0IEBAIHN0cnVjdCBycG1pX2xv
Z2dpbmdfbG9nX2RhdGFfcmVzcCB7Cj4gICAgICAgICBzMzIgc3RhdHVzOwo+ICB9Owo+Cj4gKy8q
KiBSUE1JIFJFUVVFU1RfRk9SV0FSRCBTZXJ2aWNlR3JvdXAgU2VydmljZSBJRHMgKi8KPiArZW51
bSBycG1pX3JlcXVlc3RfZm9yd2FyZF9zZXJ2aWNlX2lkIHsKPiArICAgICAgIFJFUUZXRF9FTkFC
TEVfTk9USUZJQ0FUSU9OID0gMHgwMSwKPiArICAgICAgIFJFUUZXRF9SRVRSSUVWRV9DVVJSRU5U
X01FU1NBR0UgPSAweDAyLAo+ICsgICAgICAgUkVRRldEX0NPTVBMRVRFX0NVUlJFTlRfTUVTU0FH
RSwKPiArfTsKPiArCj4gK3N0cnVjdCBycG1pX3JlcXVlc3RfZm9yd2FyZF9yZXNwIHsKPiArICAg
ICAgIHUzMiBzdGF0dXM7Cj4gKyAgICAgICB1MzIgcmVtYWluaW5nOwo+ICsgICAgICAgdTMyIHJl
dHVybmVkOwo+ICsgICAgICAgdTggZGF0YVtdOwo+ICt9Owo+ICsKPiArLyoqIFJQTUkgTU0gU2Vy
dmljZUdyb3VwIENvbW11bmljYXRlIHJlc3BvbnNlIHN0cnVjdCAqLwo+ICtzdHJ1Y3QgcnBtaV9y
ZXF1ZXN0X2NvbXBsZXRlX3Jlc3Agewo+ICsgICAgICAgdTMyIHN0YXR1czsKPiArICAgICAgIHUz
MiBudW1fb2ZfbWVzc2FnZXM7Cj4gK307Cj4gKwo+ICAjZW5kaWYgLyogIV9fUlBNSV9NU0dQUk9U
X0hfXyAqLwo+IC0tCj4gMi40My4wCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
