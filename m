Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461C5E9904A
	for <opensbi@archiver.kernel.org>; Fri, 10 Apr 2026 08:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGhHX9S15Tr3UdvTALdf1p5LKyyXeYxcwnnSvwGMEkA=; b=RGf2DS2gFNJcGO
	l2kZp88TU5b3GhB+p8lD/qIK493MMCFsip4wJsLFU1Pza+Zvoc3lMT6ZhPRX6DNGZQ7wXGJB/zD4t
	Ash4Jf4SoJe9AIGmUd1JXvqVCvTucxdY19XW/7RtBCvoFkrZpk9ao70AVlIKr7W8xPQqlGNBuxLdF
	X/Tfw+e1abM8Erc+fmLfcF+7N9UQI5akDw/Oyc2USGl+Ru/XPP8IH4t/mqfxEJc8KRmxlVJ9SdBxZ
	s57/amh+A1T4iDwbSWe4KFbXsLeUBe3Ha2Pbo5bWp8I+fqlp/0sAaHW1sIByoyxIOV8n9AZVfA8bf
	ziSRtT+k0fDotWEA0xGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6w6-0000000Bol6-12Hx;
	Fri, 10 Apr 2026 08:09:54 +0000
Received: from mail-oo1-xc2b.google.com ([2607:f8b0:4864:20::c2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6w3-0000000BokL-1tIJ
	for opensbi@lists.infradead.org;
	Fri, 10 Apr 2026 08:09:52 +0000
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-67934c83063so651602eaf.0
        for <opensbi@lists.infradead.org>; Fri, 10 Apr 2026 01:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775808590; cv=none;
        d=google.com; s=arc-20240605;
        b=ICwIFG0g4fCF6J67+FRSrbjK1gDjO6vgl0uyoJGRasvadQA+H6YgIpTY5CW1aKZi7r
         1bSuDVXoojF7hECfgWXiux9aXWyFxMqL+AuUf5Q0zWqcbNFVzSZmN/et3Reru3q9Mb+y
         mNLvv8z68Wr0gaOfimds6w09dxs4H+HrgXoZadfLawSfTHJsb/BRD/HUrlj1SRPXOcxe
         w11IJbPc5r+1LdJNeeQFP2E31xDNVnffrjfXIHVYvELObbBL4HCr4bmIea+bqgjyBK8g
         jX7lbX+vVCqoBf9nlasQNU5KgnQQ1VxnHUKkYa8OBaDkmfXmlr81Vck+VwnwJwpGEYNN
         Yzzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tjOBPceCG08Q+i5wjNkpz4ncFnfkIF03zMnYG9qcmQU=;
        fh=eKJuLwe/Q3abxqiDCY82BKbySJb4gPVa1nOip41npJE=;
        b=A5Np8RDhopMI5TIp8H8FCQ3RqZWSSlRP4PoBzs/cFUdf3AHLvkei6zZZ0kG1TJnBgr
         5JL/fsEZGSINkWJri15EvYO6Pk4ZyTcg7Ys+JGr2lAyw7GPqYr1fVvL2uezqdHdeX8sI
         qz0z+9DbRSOgYautEXVX9fUC++4NF6yrD4XRzBcQKI3IWqbWsfE11Y3IJZW7Hu1nEMMi
         OIzHD+4VG4jxSbpYNjSkOvHjMpqXTu7G/nXW2Ixch/LGRg2mpGPRgFX5HUAorobYO06g
         stOhLtrvlUBeI/3Fv7v01ClPTT+BTpyENnjPr+SLzb45pLMssFEon7XKLJY8QgVGSYPq
         hWCA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775808590; x=1776413390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjOBPceCG08Q+i5wjNkpz4ncFnfkIF03zMnYG9qcmQU=;
        b=OzWR2RMg+ijpkRVqWIi5U5MZd/9xbdSAchobplAEu2W8fjK9d0Yw0pbHU0/W2bR2+2
         kNb1fwR3zNlW3aRHxE0aYBpYoHAo4zh9Lb5eJztOOke6vub5qOoYD7k0UWXGGONQmpeu
         P+KysS4yQaoyroWens7QXngF9yRrR7U6BRClxZGhKrOWRb32aE2fIfiOntFIpo3/m8H0
         8jpqWt84E7VTgBG0fFt5dWKd3wNPzpqDVnaOW3M9RoYKiVpbZ91wDEMtJrogdwjD9p3z
         kEuYHC4PJS404k8BOPpPf6uL142CJZV26ynETyjKkp6h5EGzECmV5wt/oJ47yHrLmbvz
         UMSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775808590; x=1776413390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjOBPceCG08Q+i5wjNkpz4ncFnfkIF03zMnYG9qcmQU=;
        b=SoWx4txhIZ6S3uALR8UwY1qdEUxpWEL8vXZ7X7KosUBHAMTHDYfcu7ASsYZ0m1j+aj
         UgYn0dvZmQfTH+wyogxScajavMNYbUIYqFp3L3eH3baqub5VpWjnfbDU9lvNLbCLXbP1
         j7WqZU7c1zS3VUYuIHchRFe8xEE9cWaWf15hn4blvVDs/NGwSxopI5XuRXGM6dRrEU4s
         vEUvKTnNIMn8itMiZ6YPG2ZvtCvqlakEr3pB/lBlRDN3ZXaJ0rhkr4Zst1MtVa4f7Nve
         W3Y7Qn0McBIrrPd52007Cw4Xv/G3bY6ButRd7pcg3rRWeW6/aM5SF1m0eoYC43EX5Y1e
         B6Qg==
X-Gm-Message-State: AOJu0YyUI7Uwq0IrAJ45jsQYyHk9L5Bs9bHBbO4mDwKBNY9hWe7/dGhi
	avloL9rufXipgkLm89pbk29X2XTEuJEFkG+3CLeB2wigQ/ngvqKTWYuThfmc3LNjxbMeu4xf+OT
	yYxUBboU7gPi3z2MRMxGmeWSwty0whTlrbh/gfORe7Q==
X-Gm-Gg: AeBDievBAEUjgOXXGM+V0eXroJRGEk+c20MskhQaZuRFJ8Z+CJobwiLDLLzjCPKNLpm
	l5YkPeTAs5OGmlMQ7cm1cOnLCDMk6YzmqMMBaH8C+k/WmU+TL9KYPT4UL9Rqr/JyJHBTbCvtyY2
	LcJCFZAtFpVAba5Uh4ujQQq4r1Y2YYDip3Fbqqhj6qmzBigf9hkF+twJGO34dW9Sp1oJDXHhPqX
	LpZxSkxzCS3Gs6gi5+W5GgrzUqNL9LwMLgB3BoV8LIEsMB91SCMNyFbAj3wWeMzWFXL2QyGGvsW
	mNc3ewBN3+OEf0865SUL/TpjQ/WLdbZdaytnb6HtSz99+jfMNvxoDAWbyAv+vlCwvGtboK+nkWM
	XlMJgJiJanlT+1oGxBBFb7H0TLg==
X-Received: by 2002:a05:6820:1903:b0:687:6290:6333 with SMTP id
 006d021491bc7-68be8fcba9amr1058894eaf.58.1775808589467; Fri, 10 Apr 2026
 01:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260310183155.2186463-1-evvoevod@oss.tenstorrent.com>
 <20260310183155.2186463-4-evvoevod@oss.tenstorrent.com> <CAAhSdy2PHSsMNib5Bscp1mWvdQTii_PG7jDpgR9vf_f=7x04sw@mail.gmail.com>
 <20260409191943.291207-1-evvoevod@tenstorrent.com>
In-Reply-To: <20260409191943.291207-1-evvoevod@tenstorrent.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 10 Apr 2026 13:39:38 +0530
X-Gm-Features: AQROBzAzN1AtqDyCU_DXk6EPglLsLDUbgQoDQ9rSh9bwEi6Axn_AWn_FsFKw0YU
Message-ID: <CAAhSdy2jFkLSH0WThrcEg36LDc+hwiGHRcHGOZ6+FxdO+ok+2Q@mail.gmail.com>
Subject: Re: [PATCH 3/7] firmware: Add RNMI/RNME handler infrastructure
To: Evgeny Voevodin <evvoevod@tenstorrent.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_010951_750938_6C541FB0 
X-CRM114-Status: GOOD (  30.08  )
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

T24gRnJpLCBBcHIgMTAsIDIwMjYgYXQgMTI6NTDigK9BTSBFdmdlbnkgVm9ldm9kaW4KPGV2dm9l
dm9kQHRlbnN0b3JyZW50LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEFwciA5LCAyMDI2IGF0IDg6
MjEgQU0gQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4gd3JvdGU6Cj4gPiBPbiBXZWQs
IE1hciAxMSwgMjAyNiBhdCAxMjowMyBBTSBFdmdlbnkgVm9ldm9kaW4KPiA+IDxldnZvZXZvZEB0
ZW5zdG9ycmVudC5jb20+IHdyb3RlOgo+ID4gPgo+ID4gPiArLm1hY3JvIFRSQVBfQ0FMTF9DX1JO
TUVfUk9VVElORQo+ID4gPiArICAgICAgIC8qIENhbGwgQyByb3V0aW5lICovCj4gPiA+ICsgICAg
ICAgYWRkICAgICBhMCwgc3AsIHplcm8KPiA+ID4gKyAgICAgICBjYWxsICAgIHNiaV9ybm1lX2hh
bmRsZXIKPiA+ID4gKy5lbmRtCj4gPiA+ICsKPiA+Cj4gPiBzL1RSQVBfQ0FMTF9DX1JOTUVfUk9V
VElORS9UUkFQX0NBTExfQ19STk1JX1JPVVRJTkUvCj4KPiBUaGlzIG1hY3JvIGlzIHVzZWQgaW4g
dGhlIFJOTUUgKGV4Y2VwdGlvbikgcGF0aCB0byBjYWxsCj4gc2JpX3JubWVfaGFuZGxlcigpLCBz
byB0aGUgY3VycmVudCBuYW1lIGlzIGludGVudGlvbmFsLgo+IFNlZSBiZWxvdyBmb3Igd2h5IFJO
TUUgbmVlZHMgYSBzZXBhcmF0ZSBwYXRoLgo+Cj4gPiA+ICtfcm5taV9oYW5kbGVyOgo+ID4KPiA+
IHMvX3JubWlfaGFuZGxlci9fdHJhcF9ybm1pX2hhbmRsZXIvCj4KPiBXaWxsIGZpeC4gSSdsbCBh
bHNvIHJlbmFtZSBfcm5tZV9oYW5kbGVyIHRvIF90cmFwX3JubWVfaGFuZGxlcgo+IGZvciBjb25z
aXN0ZW5jeS4KPgo+ID4gPiArX3JubWVfaGFuZGxlcjoKPiA+ID4gWy4uLl0KPiA+ID4gKyAgICAg
ICAvKiBtcmV0IC0gcmV0dXJuIGZyb20gZXhjZXB0aW9uICovCj4gPiA+ICsgICAgICAgbXJldAo+
ID4gPiArCj4gPgo+ID4gRHJvcCB0aGlzIF9ybm1lX2hhbmRsZXIgYmVjYXVzZSBDIGhhbmRsZXIg
Y2FuIGRpZmZlcmVudGlhdGUKPiA+IGJldHdlZW4gTk1FIGFuZCBOTUkgYmFzZWQgb24gdGhlIE1T
QiBvZiBtbmNhdXNlIENTUi4KPgo+IFBlciB0aGUgU21ybm1pIGV4dGVuc2lvbiBzcGVjaWZpY2F0
aW9uLCB3aGVuIGFuCj4gZXhjZXB0aW9uIG9jY3VycyB3aXRoIE5NSUU9MDoKPgo+ICAgInRoZSBh
Y3Rpb25zIHRha2VuIGFyZSB0aGUgc2FtZSBhcyBpZiB0aGUgZXhjZXB0aW9uIGhhZAo+ICAgIG9j
Y3VycmVkIHdoaWxlIG1uc3RhdHVzLk5NSUUgd2VyZSBzZXQsIGV4Y2VwdCB0aGF0IHRoZQo+ICAg
IHByb2dyYW0gY291bnRlciBpcyBzZXQgdG8gdGhlIFJOTUkgZXhjZXB0aW9uIHRyYXAgaGFuZGxl
cgo+ICAgIGFkZHJlc3MgKHJhdGhlciB0aGFuIHRoZSBhZGRyZXNzIHNwZWNpZmllZCBieSBtdHZl
YykiCj4KPiBUaGlzIG1lYW5zIFJOTUUgdGFrZXMgdGhlIG5vcm1hbCBNLW1vZGUgdHJhcCBhY3Rp
b246IGl0IHdyaXRlcwo+IG1lcGMsIG1jYXVzZSwgbXN0YXR1cyAtLSB0aGUgcmVndWxhciBNLW1v
ZGUgQ1NScywgbm90IE1OKiBDU1JzLgo+IG1uY2F1c2UgaXMgbm90IHdyaXR0ZW4gYnkgdGhlIFJO
TUUgdHJhcCBhY3Rpb24gKGl0IG9ubHkKPiB3cml0ZXMgbWVwYywgbWNhdXNlLCBtc3RhdHVzKSwg
c28gaXQgcmV0YWlucyB3aGF0ZXZlciB2YWx1ZQo+IGl0IGhhZCBiZWZvcmUgLS0gZWl0aGVyIGZy
b20gYSBwcmVjZWRpbmcgUk5NSSAoTVNCPTEpIG9yIGl0cwo+IHVuc3BlY2lmaWVkIHJlc2V0IHZh
bHVlLiBJbiBuZWl0aGVyIGNhc2UgZG9lcyBpdCByZWZsZWN0IHRoZQo+IFJOTUUgZXhjZXB0aW9u
LCBzbyBjaGVja2luZyBtbmNhdXNlIE1TQiBjYW5ub3QgcmVsaWFibHkKPiBkaXN0aW5ndWlzaCBS
Tk1JIGZyb20gUk5NRS4KPgo+IG1uY2F1c2UgaXMgb25seSB3cml0dGVuIHdpdGggTVNCPTAgZm9y
IGV4Y2VwdGlvbnMgd2hlbiBTbWRibHRycAo+IGlzIGFsc28gaW1wbGVtZW50ZWQgKGZyb20gdGhl
IG1uY2F1c2UgQ1NSIGRlc2NyaXB0aW9uOiAiZXhjZXB0aW9uCj4gd2l0aGluIE0tbW9kZSB0aGF0
IHJlc3VsdHMgaW4gYSBkb3VibGUgdHJhcCBhcyBzcGVjaWZpZWQgaW4gdGhlCj4gU21kYmx0cnAg
ZXh0ZW5zaW9uIikuCj4gV2l0aCBTbWRibHRycCwgYm90aCBwYXRocyBnbyB0byBOTUlWRUMgYW5k
IHVzZSBNTiogQ1NScywgc28gYQo+IHNpbmdsZSBoYW5kbGVyIHdvdWxkIHdvcmsuIFdpdGhvdXQg
aXQsIHRoZXkgZGlmZmVyIGZ1bmRhbWVudGFsbHk6Cj4KPiAgIFJOTUk6IE1OU0NSQVRDSCwgTU5F
UEMvTU5TVEFUVVMvTU5DQVVTRSwgbW5yZXQKPiAgIFJOTUU6IE1TQ1JBVENILCAgTUVQQy9NU1RB
VFVTL01DQVVTRSwgICAgbXJldAo+Cj4gQSBzaW5nbGUgYXNzZW1ibHkgZW50cnkgcG9pbnQgY2Fu
bm90IHNlcnZlIGJvdGggYmVjYXVzZSB0aGUgdmVyeQo+IGZpcnN0IGluc3RydWN0aW9uIG11c3Qg
Y2hvb3NlIHdoaWNoIHNjcmF0Y2ggQ1NSIHRvIHN3YXAgKE1OU0NSQVRDSAo+IHZzIE1TQ1JBVENI
KSwgYW5kIHRoZXJlIGlzIG5vIENTUiB0aGF0IGNhbiBkaXN0aW5ndWlzaCB0aGUgdHdvCj4gY2Fz
ZXMgYXQgdGhhdCBwb2ludC4KCkNsZWFybHksIGZvciBSTk1FLCB0aGUgZXhpc3RpbmcgX3RyYXBf
aGFuZGxlcigpIGNhbiBiZSByZS11c2VkCmJlY2F1c2UgX3RyYXBfaGFuZGxlcigpIGRlcGVuZHMg
b24gc2FtZSBzZXQgb2YgQ1NScyBhbmQgbXJldAppbnN0cnVjdGlvbi4KCkkgYWdyZWUgdGhhdCBj
b2RlIHBhdGggUk5NRSBzaG91bGQgYmUgZGlmZmVyZW50IGZyb20gUk5NSSBidXQKdGhhdCBkb2Vz
IG5vdCBtZWFuIHdlIG5lZWQgdGhyZWUgc2VwYXJhdGUgbG93LWxldmVsIGhhbmRsZXJzLgoKRnVy
dGhlciwgdGhlIFNtcm5taSBzcGVjIGFsc28gc3RhdGVzIHRoZSBmb2xsb3dpbmc6CiJGb3IgZXhh
bXBsZSwgc29tZSBpbXBsZW1lbnRhdGlvbnMgbWlnaHQgdXNlIHRoZSBhZGRyZXNzIHNwZWNpZmll
ZAppbiBtdHZlYyBhcyB0aGUgUk5NSSBleGNlcHRpb24gdHJhcCBoYW5kbGVyLiIKClRoaXMgbWVh
bnMgb24gcGxhdGZvcm1zIHdoZXJlIG10dmVjIHBvaW50cyB0byB0aGUgUk5NSSBleGNlcHRpb24K
dHJhcCBoYW5kbGVyIGFkZHJlc3MsIHdlIHdpbGwgaGF2ZSB0byBhbnl3YXkgcmUtdXNlIF90cmFw
X2hhbmRsZXIoKQphbmQgc2JpX3RyYXBfaGFuZGxlcigpIGZvciBSTk1JIGV4Y2VwdGlvbiBoYW5k
bGluZy4KCj4KPiBJJ2QgbGlrZSB0byBrZWVwIGJvdGggaGFuZGxlcnMgZm9yIGNvcnJlY3RuZXNz
IHdpdGggcHVyZSBTbXJubWkuCj4gU21kYmx0cnAgc3VwcG9ydCAoYW5kIHRoZSBzaW5nbGUtaGFu
ZGxlciBvcHRpbWl6YXRpb24pIGNvdWxkIGJlCj4gYWRkZWQgaW4gYSBmb2xsb3ctdXAgc2VyaWVz
LiBXb3VsZCB0aGF0IHdvcms/Cj4KPiA+ID4gKyAgICAgICBpbnQgKCpybm1lX2hhbmRsZXIpKHN0
cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCk7Cj4gPiA+ICsKPiA+ID4gKyAgICAgICBpbnQg
KCpybm1pX2hhbmRsZXIpKHN0cnVjdCBzYmlfdHJhcF9jb250ZXh0ICp0Y250eCk7Cj4gPgo+ID4g
RHJvcCB0aGVzZSBwbGF0Zm9ybSBjYWxsYmFja3MgZnJvbSB0aGlzIHBhdGNoLiBXZSB3aWxsIGJl
Cj4gPiBleHRlbmRpbmcgc2JpX2lycWNoaXAgdG8gc3VwcG9ydCBOTUlzLiBGb3IgTk1FLCB3ZSB3
aWxsCj4gPiBjYW4gc2ltcGx5IGNyYXNoLgo+Cj4gQWdyZWVkLiBJJ2xsIHJlbW92ZSB0aGUgcGxh
dGZvcm0gY2FsbGJhY2tzLiBGb3IgUk5NSSwgSSdsbAo+IHJvdXRlIHRocm91Z2ggc2JpX2lycWNo
aXAgb25jZSB0aGF0IHN1cHBvcnQgaXMgaW4gcGxhY2UuIEZvcgo+IFJOTUUsIEknbGwgc2ltcGxp
ZnkgdG8ganVzdCBwcmludCBkaWFnbm9zdGljcyBhbmQgaGFuZy4KPgo+ID4gPiArc3RydWN0IHNi
aV90cmFwX2NvbnRleHQgKnNiaV9ybm1lX2hhbmRsZXIoc3RydWN0IHNiaV90cmFwX2NvbnRleHQg
KnRjbnR4KTsKPiA+ID4gKwo+ID4gPiArc3RydWN0IHNiaV90cmFwX2NvbnRleHQgKnNiaV9ybm1p
X2hhbmRsZXIoc3RydWN0IHNiaV90cmFwX2NvbnRleHQgKnRjbnR4KTsKPiA+ID4gKwo+ID4KPiA+
IE9ubHkgb25lIHNiaV90cmFwX3JubWlfaGFuZGxlcigpIG5lZWRlZCBoZXJlIHdoaWNoIHdpbGwg
YmUKPiA+IGNhbGxlZCBmb3IgYm90aCBOTUkgYW5kIE5NRS4KPgo+IEFzIGRlc2NyaWJlZCBhYm92
ZSwgc2luY2UgdGhlIGFzc2VtYmx5IGVudHJ5IHBvaW50cyBtdXN0IGJlCj4gc2VwYXJhdGUgKGRp
ZmZlcmVudCBDU1Igc2V0cyksIEknbGwga2VlcCB0d28gQyBmdW5jdGlvbnM6Cj4KPiAgIC0gc2Jp
X3RyYXBfcm5taV9oYW5kbGVyKCk6IGhhbmRsZXMgTk1JIGludGVycnVwdHMsIHdpbGwKPiAgICAg
cm91dGUgdGhyb3VnaCBzYmlfaXJxY2hpcAo+ICAgLSBzYmlfdHJhcF9ybm1lX2hhbmRsZXIoKTog
aGFuZGxlcyBleGNlcHRpb25zIHdpdGggTk1JRT0wLAo+ICAgICBwcmludHMgZGlhZ25vc3RpY3Mg
YW5kIGhhbmdzCj4KPiBCb3RoIHdpbGwgYmUgcmVuYW1lZCB3aXRoIHRoZSB0cmFwXyBwcmVmaXgg
YXMgeW91IHN1Z2dlc3RlZC4KPgoKUmVnYXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
