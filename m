Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA29C83F17
	for <opensbi@archiver.kernel.org>; Mon, 28 Jul 2025 05:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjZ879FaEe6Pjm/RIrniI/yy4bKRiBAvtMdb88XvTPM=; b=4vCx+IKJhIpiFm
	o/3tq1u9XMnHsbXdFy/UMxPb3tCgdd6qnl3lMsQGFUvVXB6HgocEXxootQFhDwKXlxdWlEhc1Rtd6
	9AVPv5xM8KjjX5O8pP7ujUP8UrY5Oaoif2plmqSWWKv04leygGR+GVAuDSvfznOTVRQbFXrKk477Q
	S+fCKS/NK9zZsxYdfMS70vA1n3uyYxvan/dx9dEdVRaaeB5TxRcpev1DSUOhBfbKIn4RApzWMQ0hq
	RqevEvbZ4KHo4Bmg6EZ3jW8l64OSuvK++VIKslOetoDFPYLhnb037AROXGD5ZDbwhjnpp9KeA6WQ2
	wgh/Tq+PdC4PiHp6ty5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugGHr-0000000DeXz-1nCr;
	Mon, 28 Jul 2025 05:20:35 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugG9F-0000000DdoF-0z3a
	for opensbi@lists.infradead.org;
	Mon, 28 Jul 2025 05:11:42 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-3e2c547bc90so60066295ab.2
        for <opensbi@lists.infradead.org>; Sun, 27 Jul 2025 22:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1753679500; x=1754284300; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wLAqo682LfsvPoV7LzBU3Sq2F/bFV78xH/WaVZMqCtg=;
        b=Vycv1w41SbZ8gzBYFOO/KSMEoJDT0mh4Yfb06OJhcORaaxi1QpoQr0y8PVCc6NH4nG
         tf+TMTSe7dW15GN5bG5HBTWFQB6O2Ad2HXY2jlnZF3Ee8rA9zIlkCrARHu5gMSRqti/l
         AJP6qwWnBa7LxRu75BrjAyV4dO9eR4inNUpKzpiwGLWka72pAJhO83Ij8A/Pza6kd+hK
         KcnmZ3lQT7rxJqQwqHR8WSSsQflZ6Ebosi5asRKBoAdW18SUDM5wvKgA/AvzkQDEdoSM
         sapuji68HWjusmiNoJqrIAloAKU+70aitvuXmL52ZLZ5oG8Qo3lNV1ydzjGgtRnmmqKd
         ha9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753679500; x=1754284300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wLAqo682LfsvPoV7LzBU3Sq2F/bFV78xH/WaVZMqCtg=;
        b=xPBpUHE1erwIIWcWZOfbJD3UEQg+/E3NgJPJgACJu/YnhPZFelox95s3GlsSUZ+pEV
         EiNvow/55DPQXSoIDetMeUV4mAq7z+DuYDWoHEY3DsEuZ7P9ZktPfjsKr91Dlf71Dfh0
         aUftxRacu61qz8+LcLxvidORhy2jYsNMQW7BDIzpbjZT2xP65k3uUo5pQA/bSD7+jVkT
         IfvnqexxzV2QFY5+ldQl8bdxx8Y4HZizQOmg0CdmqjrGbcxDCArIu4dFI1y+ZN2r9jKo
         AT71zoElhzmiB/guVPP5ZOH9aCOcNkbYVulkcU63q6WKDs/rUMRNyWZNZBn34NcYqPcP
         2m5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWzkIHm85hFT9aXJ7s5k6wzhyoo+YX5F6IKV6Afoz9A0gGceDcqBmcR5u/5oNBXqdL3+ASReEdS@lists.infradead.org
X-Gm-Message-State: AOJu0YyqoUtYyItKzAKlC+1hbFaC5k3tAPsdStMNgGhH9L4QBsev55VO
	sIqUSVkB2u+9j/sZyxIJjU2w8emZGpzkg/ZmqWnAO4UhafWzM/dCjCI5abS2F8MKN6WCM4MT7Ey
	Qgiq4Qlh9kKlU2q7bdhSAZeNK/gYiOXsj8WRTRsSRNF1YKxi53Qjj
X-Gm-Gg: ASbGnctpN/whrtmQ3ybffY3qd4XqW/eFMsMe+unt/jI8gIC6ld1bOyHEHe1ER2dSJS6
	uaI7RGmOzOI0sib+h/8ubwjlyBxCCXleQ3q/O2bpOBMB7uOgi+/m7/kAnK8i1/AzfY58xqN9GWI
	Omukb/VLMyjahp4nKowjUarFkJv6HqM/rTvSEv8wO/QtEqrQTEo/DoLCwFO8ZOSfu/UUjNMAXKM
	2s+zjg=
X-Google-Smtp-Source: AGHT+IGxREuL6fZO+tHZThs/N3yrkM5yqp49aCsCyaIsi0WruVZfuRdhOYkZ3pxoGzkdsKDJR6kpZRFk+SkRZybfbqA=
X-Received: by 2002:a05:6e02:300a:b0:3dd:be49:9278 with SMTP id
 e9e14a558f8ab-3e3c5110919mr156747275ab.0.1753679499654; Sun, 27 Jul 2025
 22:11:39 -0700 (PDT)
MIME-Version: 1.0
References: <20250728045551.355122-1-wxjstz@126.com> <E921AB6A-1390-4BFC-9B13-91D3036B9F1B@jrtc27.com>
In-Reply-To: <E921AB6A-1390-4BFC-9B13-91D3036B9F1B@jrtc27.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Jul 2025 10:41:27 +0530
X-Gm-Features: Ac12FXwrqVwUXzFe6Q1iUoaUMr9jxUJkYsSvunTSZukJTjLmAz2tvIgaRA13qcg
Message-ID: <CAAhSdy3fsJK2Mgq9ixCMq9UDyP9vHxg9XysnfqjrPWDQAD+s+Q@mail.gmail.com>
Subject: Re: [PATCH] platform: andes: Fix license to compatible GPL
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Xiang W <wxjstz@126.com>, opensbi@lists.infradead.org, 
	Yu Chien Peter Lin <peterlin@andestech.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_221141_471633_A6C66354 
X-CRM114-Status: GOOD (  24.35  )
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

T24gTW9uLCBKdWwgMjgsIDIwMjUgYXQgMTA6MzTigK9BTSBKZXNzaWNhIENsYXJrZSA8anJ0YzI3
QGpydGMyNy5jb20+IHdyb3RlOgo+Cj4gT24gMjggSnVsIDIwMjUsIGF0IDA1OjU1LCBYaWFuZyBX
IDx3eGpzdHpAMTI2LmNvbT4gd3JvdGU6Cj4gPgo+ID4gU2luY2UgcGxhdGZvcm0vZ2VuZXJpYy9p
bmNsdWRlL2FuZGVzL2FuZGVzLmggYW5kCj4gPiBwbGF0Zm9ybS9nZW5lcmljL2luY2x1ZGUvYW5k
ZXMvYW5kZXNfcG1hLmggYXJlIGxpY2Vuc2VkIHVuZGVyIHRoZQo+ID4gR1BMLCBhbnkgQyBmaWxl
cyB0aGF0IHVzZSB0aGVtIHNob3VsZCBhbHNvIGJlIG1vZGlmaWVkIHRvIGNvbXBseQo+ID4gd2l0
aCB0aGUgR1BMLiBPdGhlcndpc2UsIHRoZXJlIG1heSBiZSBwb3RlbnRpYWwgbGVnYWwgaXNzdWVz
Lgo+Cj4gRmlyc3RseSwgdGhhdOKAmXMgbm90IGhvdyBsaWNlbnNlcyB3b3JrLiBUaGUgY29tYmlu
ZWQgd29yayBpcyBHUEwsIGJ1dAo+IHRoYXQgZG9lc27igJl0IG1lYW4gdGhlc2UgZmlsZXMgYXJl
LiBUaGV5IGNhbiBiZSBCU0QsIGFuZCBzaG91bGQgYmUsCj4gYmVjYXVzZSB0aGF04oCZcyB3aGF0
IHRoZXkgd2VyZSBjb250cmlidXRlZCB1bmRlci4KPgo+IFNlY29uZGx5LCB3aHkgYXJlIHRoZXJl
IEdQTOKAmWVkIGZpbGVzIGluIE9wZW5TQkk/IEl04oCZcyBhIEJTRC1saWNlbnNlZAo+IHByb2pl
Y3QsIGFuZCBhbnl0aGluZyBlbHNlKiBpcyBwcm9ibGVtYXRpYyBmb3IgdmVuZG9ycy4gRXNwZWNp
YWxseSBmb3IKPiBzb3VyY2UgZmlsZXMgdGhhdCBhcmUgaW5jbHVkZWQgYnkgZGVmYXVsdCBpbiB0
aGUgZ2VuZXJpYyBwbGF0Zm9ybSBidWlsZC4KPgo+IFNvIGEgaGFyZCBOQUsgZnJvbSBtZSwgYW5k
IGEgY2FsbCB0byBkZWxldGUgdGhlIEdQTOKAmWVkIEFuZGVzIGZpbGVzIG9yCj4gcmVwbGFjZSB0
aGVtIHdpdGggQlNELWxpY2Vuc2VkIG9uZXMgKHdoaWNoIGNhbiBqdXN0IGJlIGdldHRpbmcgdGhl
Cj4gYXV0aG9yKHMpIHRvIHJlbGljZW5zZSB0aGVtKS4gSSBkb3VidCB0aGVyZeKAmXMgYW55dGhp
bmcgaW50ZXJlc3RpbmcgaW4KPiB0aGVtIGFueXdheS4KCkkgYWdyZWUgd2l0aCBKZXNzaWNhIG9u
IHRoaXMuIExldHMgbm90IGhhdmUgYW55IG5vbi1wZXJtaXNzaXZlCnNvdXJjZXMgaW4gT3BlblNC
SS4KClRoZSBBbmRlcyBoZWFkZXJzIGhhdmUgYmVlbiBvdmVybG9va2VkIGluIHBhdGNoIHJldmll
d3Mgc28KSSBzdWdnZXN0IHVwZGF0aW5nIHRoZXNlIGhlYWRlcnMgdG8gdXNlIEJTRC1saWNlbnNl
LgoKUmVnYXJkcywKQW51cAoKPgo+IEplc3MKPgo+ICogV2VsbCwgYW55dGhpbmcgY29weWxlZnQg
LyBub24tcGVybWlzc2l2ZQo+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBYaWFuZyBXIDx3eGpzdHpAMTI2
LmNvbT4KPiA+IC0tLQo+ID4gcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hZTM1MC5jICAgICB8IDIg
Ky0KPiA+IHBsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG11LmMgfCAyICstCj4gPiBwbGF0
Zm9ybS9nZW5lcmljL2FuZGVzL2FuZGVzX3NiaS5jIHwgMiArLQo+ID4gcGxhdGZvcm0vZ2VuZXJp
Yy9hbmRlcy9zbGVlcC5TICAgICB8IDIgKy0KPiA+IDQgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5l
cmljL2FuZGVzL2FlMzUwLmMgYi9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL2FlMzUwLmMKPiA+IGlu
ZGV4IGYwNmUyMDdkLi44ODBkNTgwMyAxMDA2NDQKPiA+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMv
YW5kZXMvYWUzNTAuYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hZTM1MC5jCj4g
PiBAQCAtMSw1ICsxLDUgQEAKPiA+IC8qCj4gPiAtICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEJTRC0yLUNsYXVzZQo+ID4gKyAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4g
PiAgKgo+ID4gICogQ29weXJpZ2h0IChjKSAyMDIyIEFuZGVzIFRlY2hub2xvZ3kgQ29ycG9yYXRp
b24KPiA+ICAqCj4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19w
bXUuYyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG11LmMKPiA+IGluZGV4IDllZWU0
ZWRjLi42MDk5YTczYiAxMDA2NDQKPiA+IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5k
ZXNfcG11LmMKPiA+ICsrKyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvYW5kZXNfcG11LmMKPiA+
IEBAIC0xLDQgKzEsNCBAQAo+ID4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1D
bGF1c2UKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gLyoKPiA+
ICAqIGFuZGVzX3BtdS5jIC0gQW5kZXMgUE1VIGRldmljZSBjYWxsYmFja3MgYW5kIHBsYXRmb3Jt
IG92ZXJyaWRlcwo+ID4gICoKPiA+IGRpZmYgLS1naXQgYS9wbGF0Zm9ybS9nZW5lcmljL2FuZGVz
L2FuZGVzX3NiaS5jIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19zYmkuYwo+ID4gaW5k
ZXggZjY4YWM5MDguLjZjMTU1ZTEwIDEwMDY0NAo+ID4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9h
bmRlcy9hbmRlc19zYmkuYwo+ID4gKysrIGIvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9hbmRlc19z
YmkuYwo+ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6
IEJTRC0yLUNsYXVzZQo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4g
PiAvKgo+ID4gICogQ29weXJpZ2h0IChDKSAyMDIzIFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29ycC4K
PiA+ICAqCj4gPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9zbGVlcC5TIGIv
cGxhdGZvcm0vZ2VuZXJpYy9hbmRlcy9zbGVlcC5TCj4gPiBpbmRleCAzNjFhZmYzYS4uOTY3ZmRh
ZWYgMTAwNjQ0Cj4gPiAtLS0gYS9wbGF0Zm9ybS9nZW5lcmljL2FuZGVzL3NsZWVwLlMKPiA+ICsr
KyBiL3BsYXRmb3JtL2dlbmVyaWMvYW5kZXMvc2xlZXAuUwo+ID4gQEAgLTEsNSArMSw1IEBACj4g
PiAvKgo+ID4gLSAqIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPiA+ICsg
KiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gICoKPiA+ICAqIENvcHlyaWdo
dCAoYykgMjAyMyBBbmRlcyBUZWNobm9sb2d5IENvcnBvcmF0aW9uCj4gPiAgKgo+ID4gLS0KPiA+
IDIuNDcuMgo+ID4KPiA+Cj4gPiAtLQo+ID4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiA+IG9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCj4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2Jp
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9vcGVuc2JpCg==
