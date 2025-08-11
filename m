Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65982CA0EDA
	for <opensbi@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4m4CGfSMWv2AgsYVZ7J0h3qW1BqCAPoFhEZdArewZg=; b=SE4QxIK0e1wH7Y
	YczXobGF+BF0OBmJkUylfEdyOEBjWvLVArAsSajIKgDKSHOhSCTr5ahrewl+WrKzwkHXea3in9yb3
	fU3Iwxm3MnJkVrRSbt9Snvnz5wxtMgdXldVy3clmcx3YgU77bI5n3DQ4TZ2uTbGJNCk8NTk9IIsoS
	J/HaRHRDeCP2C8uRH1zHvpnkVXU5FJhPhymbmCjFsAtQTF8RLJwyNCN7NuOrBWUuMHnFu8y/bQAH/
	fkop+qy/ERvMGwe4BvEcQfLTwQmIcYPmS5FJ/RhE7mLFZm4jL/iixM4tzXg4zvmX6xZrYxePviTo1
	saOsYjkMbJqGo8l48Mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaag-000000099LA-27QE;
	Mon, 11 Aug 2025 22:02:02 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUkw-00000008G1J-2HSW
	for opensbi@lists.infradead.org;
	Mon, 11 Aug 2025 15:48:15 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-31f5ab057ebso481884a91.2
        for <opensbi@lists.infradead.org>; Mon, 11 Aug 2025 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927293; x=1755532093; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YBVruwG7CfiJ9ZwjVRVDEuhASFA0qG68fAYmFT+T2uo=;
        b=GSw8dBsmKi0FguZUxy9LiDJa+co3PBNEyJVVR5AC1SAYd0H4woSnIDXDYZXbaeVQo+
         f8YsH69nxevyywmEay4FSDGaCRUDyFC5rUwcaoxubsQj9T/ANe9JN4QasFyr6htRkWZf
         NUACP2h+malarnf4M23wP7g0SHQoHRR/N4IJMvW1oSmLReCD+coSOuiVd+B1zKWuCjZL
         6ewM4NJw5MXdl11h/DuEHduxK7Fd+xXSmRJX7PCRrybpACMHog0DX+AIepacoQPb2jQf
         cfqq88jGNBr9J22TBieIeSiC2y504doCxmoDwol0VG79LQAvSmJ5YXEug0ivylTCkqie
         kajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927293; x=1755532093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBVruwG7CfiJ9ZwjVRVDEuhASFA0qG68fAYmFT+T2uo=;
        b=UBDay2cIGlw+P4yaJ8H3FhxM6VhRKSWOV4R7NBmSHeD/DcqXF6Yy63CfZtvwiYbOqw
         8zGwOGtyFwTPIKizCNwNu6Ze3AvHlWpZro7yEjhGS3812aCFoUCV6qnuPiRcfOlmxNtO
         XI20uxRBudTeZcm3tsbcxGgShWC1I6lBEMqYDieVoXDBRpSWkWXgS20Q16ouNwCTKRWx
         OjYfuUpzw6DTchGYpRpjRPnIwEy3/lItwG5vkZMUFZO6X6O+/T3a3WbQYn6Z2gJX7Ogo
         j4Y29jKdX76itKygmUt+LHQilfW98i4WfmLHPUOSuMzGrMqOBcJVAaFp8gBIQ6d18RvM
         4Utg==
X-Forwarded-Encrypted: i=1; AJvYcCWVRkboEZIgGgVtiFu5SQJMf7DDbNdInNLJ4Vx71iLU1qfFh7ylIF2bMq4oV/b7AFj3hneoDq/h@lists.infradead.org
X-Gm-Message-State: AOJu0YxtrQaFsIb76WRk3k6K/H0lajpyMa7oTWGqwDNXhn3hfE8VUWx9
	cSA+Do37ZFKtm6Nyutc8W4lEdqd32xIv7t2Jdsip7ulIa5vgG3vyzP9R/ZKawmDw7xm4NaFr/oc
	cEn9Oa18oIvddaPaAoUQ97oBZ5gLTSNsadpnU
X-Gm-Gg: ASbGncsG0mAB8fgGsJ2ajGk69sr3emVIH97tpwhpHuKJWHcuYr8jvcvE6TEWB+nkvlZ
	pGNsvKSgruC6VsKEAQHyJV7L4lios6O1Hx5xj8s4cFhyn4EhamomdaTbym18XPEjo9zWbSfvfD+
	xAy7rOAd5o6PL4uN/zdyE0IWcx7ruINEfpXptFrbOxY6n2sW/4etws4ct+BOFKBq/xmQo8EiyoH
	r64X0w=
X-Google-Smtp-Source: AGHT+IE87MTsaBqedqU2pqWbkvIhxzQQBaDjjGZmY0A0OPokdRAG7QqkoqUph+cvdlJ3Wy+ntPgitKfUdsPBrcUlVHM=
X-Received: by 2002:a17:90b:1d07:b0:31e:7f76:c123 with SMTP id
 98e67ed59e1d1-3219785f0a2mr6136497a91.4.1754927293328; Mon, 11 Aug 2025
 08:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <1aadc5594074447a8c38da0ac33b5235@thalesgroup.com>
 <1FC085FD-22F6-4FFF-854F-8E1186C46FD8@jrtc27.com> <e8a80f721c3a42eabc7338307234af09@thalesgroup.com>
In-Reply-To: <e8a80f721c3a42eabc7338307234af09@thalesgroup.com>
From: =?UTF-8?Q?Manuel_Hern=C3=A1ndez_M=C3=A9ndez?= <maherme.dev@gmail.com>
Date: Mon, 11 Aug 2025 17:48:01 +0200
X-Gm-Features: Ac12FXwBfSkPUtMbgsJuUySW00BM1nQrvauwQk5Ya20DbwC8TN2hj7mCiIdfw3s
Message-ID: <CACwcpNuASn_YQsMuHK568gGqr+hB0KEc=p_EVzKqkjBPuRuQ_A@mail.gmail.com>
Subject: Re: platform: add CVA6 platform and support for PMU.
To: LE RHUN Jimmy <jimmy.lerhun@thalesgroup.com>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, 
	"opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_084814_599742_0CD993E2 
X-CRM114-Status: GOOD (  17.04  )
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

SGksCgpJIHNlbnQgYSBwYXRjaCB0byBhZGQgUE1VIHRvIE9wZW5waXRvbiBwbGF0Zm9ybQooaHR0
cHM6Ly9saXN0cy5pbmZyYWRlYWQub3JnL3BpcGVybWFpbC9vcGVuc2JpLzIwMjUtSnVseS8wMDg2
ODEuaHRtbCkuClRoaXMgc2hvdWxkIHdvcmsgZm9yIEFyaWFuZSBhbmQgQ1ZBNiBhcyB3ZWxsLiBG
b2xsb3dpbmcgU2FtdWVsJ3MKcmVjb21tZW5kYXRpb24sIEkgYW0gd29ya2luZyBvbiBwb3J0aW5n
IHRoZSBPcGVucGl0b24gcGxhdGZvcm0gZnJvbQpmcGdhIHRvIGdlbmVyaWMuIE15IHBsYW4gaXMg
YWxzbyB0byBwb3J0IHRoZSBBcmlhbmUgY29yZSBsYXRlci4KClJlZ2FyZHMsCk1hbnVlbC4KCgpP
biBGcmksIEF1ZyA4LCAyMDI1IGF0IDQ6NTbigK9QTSBMRSBSSFVOIEppbW15CjxqaW1teS5sZXJo
dW5AdGhhbGVzZ3JvdXAuY29tPiB3cm90ZToKPgo+IENsYXNzaWZpZWQgYXM6IHtPUEVOfQo+Cj4g
VmVuZHJlZGkgOCBhb8O7dCAyMDI1IDE1OjQyLCBKZXNzaWNhIENsYXJrZSA8anJ0YzI3QGpydGMy
Ny5jb20+IGEgw6ljcml0IDoKPiA+T24gOCBBdWcgMjAyNSwgYXQgMTQ6MzUsIExFIFJIVU4gSmlt
bXkgPGppbW15Lmxlcmh1bkB0aGFsZXNncm91cC5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gQWRkIGEg
bmV3IHBsYXRmb3JtIGNhbGxlZCBDVkE2IChodHRwczovL2dpdGh1Yi5jb20vb3Blbmh3Z3JvdXAv
Y3ZhNikuCj4gPj4gQWRkIHN1cHBvcnQgZm9yIFBlcmZvcm1hbmNlIE1vbml0b3JpbmcgVW5pdCBm
b3IgdGhpcyBwbGF0Zm9ybS4KPiA+PiBUaGlzIGRldmVsb3BtZW50IHN0YXJ0cyBmcm9tIHRhZyB2
MS41Lgo+ID4KPiA+RG9lcyBnZW5lcmljIG5vdCB3b3JrIGZvciBpdD8gTXkgdW5kZXJzdGFuZGlu
ZyB3YXMgaXQgZGlkLCBhbmQgaWYgc3VwcG9ydCBmb3IgYW55dGhpbmcgaXMgbWlzc2luZyBpbiBn
ZW5lcmljIGl0IHNob3VsZCBiZSBhZGRlZCB0byBnZW5lcmljLgo+ID4KPiA+SmVzc2ljYQo+Cj4g
VGhhbmtzIGZvciB5b3VyIHF1aWNrIGFuc3dlci4gSSdtIHVzaW5nIHRoZSBzdGFuZGFyZCBZb2N0
byBkaXN0cmlidXRpb24gZm9yIHRoaXMgY29yZSA6Cj4gaHR0cHM6Ly9naXRodWIuY29tL29wZW5o
d2dyb3VwL21ldGEtY3ZhNi15b2N0byBhbmQgaXQgaGFzIGEgc3BlY2lmaWMgY29uZmlndXJhdGlv
biBmb3IgT3BlblNCSSB0aGF0IHdhcyBub3Qgc3VibWl0dGVkIGhlcmUgYW5kIHRoYXQgbGFja2Vk
IFBNVSBzdXBwb3J0Lgo+IEkgaGFkIHRvIGRlZmluZSBoYXJkd2FyZS1zcGVjaWZpYyBpbmZvcm1h
dGlvbiBhYm91dCBwZXJmb3JtYW5jZSBjb3VudGVycy4KPiBBY3R1YWxseSBDVkE2IGlzIGFuIGV2
b2x1dGlvbiBvZiBBcmlhbmUgKHRoYXQgZXhpc3RzIGluIHBsYXRmb3JtL2ZwZ2EvYXJpYW5lKS4K
Pgo+IEtpbmQgcmVnYXJkcywKPiBKaW1teQo+Cj4gPj4gU2lnbmVkLW9mZi1ieTogSmltbXkgTGUg
Umh1biA8amltbXkubGVyaHVuQHRoYWxlc2dyb3VwLmNvbT4KPiA+Pgo+ID4+IDxPcGVuU0JJXzEu
NV9hZGRfQ1ZBNl9QTVUucGF0Y2g+LS0KPiA+PiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+ID4+IG9w
ZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo+Cj4KPiB7T1BFTn0KPgo+IC0tCj4gb3BlbnNiaSBt
YWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0tIApvcGVuc2JpIG1haWxp
bmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
