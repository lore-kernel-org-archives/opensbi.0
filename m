Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B023109316E
	for <opensbi@archiver.kernel.org>; Fri, 20 Mar 2026 04:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rIaRZ4pTXz9/herixrTl171Q+3FVzK4UwCE6WIbnUbA=; b=os89Z+466D2pZL
	n9YtJZJOYaA7S3S0H9xXrm/8txCMRJxNe6DVfYCz0YFZloyXN3WM8sHDtuMP6MioBYEGEVuhcgl5B
	e+znqRrfRlpysfvJtpGhZDwuDYxDLkplxrTkNc6/X1LQPx9NnFm7ODQ33rckwZZfc6ZN9MnGRAvNH
	u2gndMl8+94fzf30mX6Zl3NBu82UVxmGTWbGpoIc2X8GVnwf2Ci3PN/xCLi54nW5A/C+PLJD1ORWm
	hqFTF4NpnVdcCiupzmp7rKNUkGNCTSXPRolLaMKWqTQ62KWN9QLMiSXjLpiepEkDjWe3IlGUWrTpJ
	i+9shrKxpOgUB4BffKtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Rj3-0000000C4Ym-0e59;
	Fri, 20 Mar 2026 04:44:45 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Rj0-0000000C4YQ-1idI
	for opensbi@lists.infradead.org;
	Fri, 20 Mar 2026 04:44:43 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-67baf20e8c2so76779eaf.3
        for <opensbi@lists.infradead.org>; Thu, 19 Mar 2026 21:44:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773981881; cv=none;
        d=google.com; s=arc-20240605;
        b=OYIN2EZ8sWe6MY21R7P5aKF+S5cu1N7b+o2MkdFA9HSkLE4h2HnVzT2EYJEMJWe61D
         YeU/quJ9/PofjQdnzAqeBSe7RrkdNKFyk9WCxqE/A6qxBxq8R6Iq5fprgdfTwPbMR8nJ
         ONWazKfbM3+BXNzNWdUD4UhCrUeYqqyUhQ1SjQByPl+gX3hPoFx7CpTrrhBKGuNmDiA0
         mDkYdQY69kxwpq88criO3H5HekYHpMZhCLtmEF+IHgr4Hz2Vnjj4xky2KK9A0oZixprX
         7szYENgw1c3g5zFGiK4U2nfHDvSKE2uu0AK/m/OCIXhmKzPKVwmXJmOYVrad9ulgyh6q
         lejA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uSNmwcuNySdxU0hTCcrM5b1XZXDTXUoqwAMlR7uSpCg=;
        fh=ZvUNVdBUaw9ITe6WhmV5AcAsi7vmvtm+VWe7OnyYmG8=;
        b=gC1r827gfBcjdxxoKoCiSl4vmkyzVVjtkNI/rvWC/DPAO1kVl4HSIHmw5XAdAFR78J
         1LqFApVk1UzDReoL+5lyVrmljMdcCHeq0OnyC8afaEiRiDVzw2iwMBcBvksK6t3dXN2U
         8hAmZms/I8CIR/GNAtJkrCjteZWNH5uU5uPICFwG70LWDBf+T/lyQuTOswdRd8EbNXwZ
         DIzZAG2N71sUqOehkb7d2r41hHD9VyXehmUt3AfM0QucnAeQ5c5p6YmPIr8/j37QW8ER
         CnKqsDEkF0eG4h9JaROg/I/hD2X6aU1xuDSDK3pOoOI9/K9UPXGSstQm55Sk7+2Cwai6
         g9vQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773981881; x=1774586681; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uSNmwcuNySdxU0hTCcrM5b1XZXDTXUoqwAMlR7uSpCg=;
        b=HXoC7khXzT1UMmZ5XMAke1m52joeqzHbBVRQ/jvUKky/MJbb516JURYs98b1jP3+fQ
         DsZ1BcV4ZqWluz1Md2MsIU6Z69s4NkpLzt7q9sGaLVteOTkZRnPQ6l06u4BWKDwHsvis
         Gy8CXHiaU/XlHGV5a9nEw/8gANyN25UI0Tfyga6D96TuBD4uXFuce+ZOkkfpqgG2WMCP
         5Jw1+UrgJscyrL/Lyx8AR0Gh+F0n5x+nKUYKrI4eP28eMm6D7BMwx0qkmt23K1B81jpi
         WX2rWWImYzQAG4fWJ0z4pDtpFeQNfiXnDm3s2xxp0KjS4NeX3HKdFXvyC3ZjwiN1ffCR
         wB1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773981881; x=1774586681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uSNmwcuNySdxU0hTCcrM5b1XZXDTXUoqwAMlR7uSpCg=;
        b=mWy597Te7S0ePcFi/62E73567fUpVmCBDwASLdgkkbHfW2Of3zF0LfnCmXYZr8Pux7
         CYVVOFj2/DJ0n8wgiMlFWvOZULyEtR+jPbKpHiwi3NPJCjpI8QzfZaEsD8kHtvA8r3KW
         FH3SigzqB17eI2Evf5XDqmuwXjqedDzQ/vq8MOe8JtGX4QRtJ57JKGbbSvj6Uv7iff+D
         qp/BWmjincJbWnRlmyWz7SDTr+VurDQydGluZxU/XseTSgzjpGKR/jNy4eTC/+805QMx
         y+Gp36IOlHwp73++iiPFytLxlKHfKW/BJXszc54MK8ZtTQkdeWkj2wh/qb/pWdjuu6KS
         ivPQ==
X-Gm-Message-State: AOJu0YzhXBUHmh0rAa/z7Xh9/I3wIwyoovJSUnG69VmWB+gJNXO/v71s
	R4Z1R+t9jX3R++DSD97zinhGOxKHDcXi3LVTuJptYOelBTht0/aCOx+eQMlLTwbxnG9ITpjUH6I
	kxJ7rYVfQwBgbOd6xu/MCfUXJGJd3prQmqHDkCFCimw==
X-Gm-Gg: ATEYQzwvf16/EPCXyJxznFfdbbZufXj4Dxg4OkgpoopOS2xl6Zg2CvZ+moPiid9Agz+
	BEPLYfcaMVeb2TGVKWT8nVxVCUDE5atnlBNQsUZ1+e82rRCyyNBI0y/JW5CsW1q0qZi96kUOBXg
	8HAYtRdW7/ssjzJwjIoFrdfdb0MVRSRkjeOHY9TjBRJez8XoHK0mJi73WmNnusHUn1HbmNaZjPd
	3Y4oDoSDbewhg2iBgbUGzfD39OxPkBqtMM4MiQEn0Qu/i4flaXbz/hqx7hyoRTEkXcVKr2eC3Xa
	Gwvc6GUIP2H7aKOc57I8Kt9H7Hz4OlMdJQYk7I4nCQYv0c1B4N8ddWJLvEy382cGeAO3TZpO0TG
	xIlVhV/11UMFr7l4QrcLxPGMDcw==
X-Received: by 2002:a05:6820:3396:20b0:67c:27a7:8c4a with SMTP id
 006d021491bc7-67c27a7958emr336059eaf.62.1773981881248; Thu, 19 Mar 2026
 21:44:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260210094044.72591-1-ganboing@gmail.com> <20260210094044.72591-4-ganboing@gmail.com>
In-Reply-To: <20260210094044.72591-4-ganboing@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 20 Mar 2026 10:14:30 +0530
X-Gm-Features: AaiRm519KkZgF1RWv1UOe0bUxqbwBeOr0cKRCUTixTnK8eaGvvSBZfOIduXyoUs
Message-ID: <CAAhSdy25mHY8sADaj8f9vgDWd3ebiND9qH7UuFSgqTma2L_Bfw@mail.gmail.com>
Subject: Re: [PATCH 3/7] include: sbi: Add GET_RDS_NUM/SET(_FP32/_FP64)_RDS macros
To: Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com, 
	anup.patel@oss.qualcomm.com, cleger@rivosinc.com, samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_214442_464152_42622397 
X-CRM114-Status: GOOD (  13.94  )
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

T24gVHVlLCBGZWIgMTAsIDIwMjYgYXQgMzoxMuKAr1BNIEJvIEdhbiA8Z2FuYm9pbmdAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFRoZXNlIG1hY3JvcyBjYW4gYmUgdXNlZCB0byBkZWNvZGUgcmQnIGFu
ZCBzZXQgcmQnIGluIFJWQyBpbnN0cnVjdGlvbnMKPgo+IFNpZ25lZC1vZmYtYnk6IEJvIEdhbiA8
Z2FuYm9pbmdAZ21haWwuY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvcmlz
Y3ZfZW5jb2RpbmcuaCB8ICAxICsKPiAgaW5jbHVkZS9zYmkvcmlzY3ZfZnAuaCAgICAgICB8IDI0
ICsrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfdHJhcC5oICAgICAg
IHwgIDEgKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaCBiL2luY2x1
ZGUvc2JpL3Jpc2N2X2VuY29kaW5nLmgKPiBpbmRleCA4YWI1OWFiZS4uMDY0YmE5ZDEgMTAwNjQ0
Cj4gLS0tIGEvaW5jbHVkZS9zYmkvcmlzY3ZfZW5jb2RpbmcuaAo+ICsrKyBiL2luY2x1ZGUvc2Jp
L3Jpc2N2X2VuY29kaW5nLmgKPiBAQCAtMTQxNCw2ICsxNDE0LDcgQEAKPiAgI2RlZmluZSBHRVRf
UlMyU19OVU0oaW5zbikgICAgICAgICAgICAgUlZDX1JTMlMoaW5zbikKPiAgI2RlZmluZSBHRVRf
UlMyQ19OVU0oaW5zbikgICAgICAgICAgICAgUlZDX1JTMihpbnNuKQo+ICAjZGVmaW5lIEdFVF9S
RF9OVU0oaW5zbikgICAgICAgICAgICAgICAoKGluc24gJiBNQVNLX1JEKSA+PiBTSF9SRCkKPiAr
I2RlZmluZSBHRVRfUkRTX05VTShpbnNuKSAgICAgICAgICAgICAgUlZDX1JTMlMoaW5zbikKPiAg
I2RlZmluZSBHRVRfQ1NSX05VTShpbnNuKSAgICAgICAgICAgICAgKChpbnNuICYgTUFTS19DU1Ip
ID4+IFNISUZUX0NTUikKPiAgI2RlZmluZSBHRVRfQVFSTChpbnNuKSAgICAgICAgICAgICAgICAg
KChpbnNuICYgTUFTS19BUVJMKSA+PiBTSElGVF9BUVJMKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvc2JpL3Jpc2N2X2ZwLmggYi9pbmNsdWRlL3NiaS9yaXNjdl9mcC5oCj4gaW5kZXggZjUyM2M1
NmUuLjAzMDExYWY5IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3Jpc2N2X2ZwLmgKPiArKysg
Yi9pbmNsdWRlL3NiaS9yaXNjdl9mcC5oCj4gQEAgLTkxLDE1ICs5MSwyNyBAQAo+ICAjZGVmaW5l
IEdFVF9GNjRfUlMxKGluc24sIHJlZ3MpIChHRVRfRjY0X1JFRyhpbnNuLCAxNSwgcmVncykpCj4g
ICNkZWZpbmUgR0VUX0Y2NF9SUzIoaW5zbiwgcmVncykgKEdFVF9GNjRfUkVHKGluc24sIDIwLCBy
ZWdzKSkKPiAgI2RlZmluZSBHRVRfRjY0X1JTMyhpbnNuLCByZWdzKSAoR0VUX0Y2NF9SRUcoaW5z
biwgMjcsIHJlZ3MpKQo+IC0jZGVmaW5lIFNFVF9GMzJfUkQoaW5zbiwgcmVncywgdmFsKSBcCj4g
LSAgICAgICAoU0VUX0YzMl9SRUcoaW5zbiwgNywgcmVncywgdmFsKSwgU0VUX0ZTX0RJUlRZKHJl
Z3MpKQo+IC0jZGVmaW5lIFNFVF9GNjRfUkQoaW5zbiwgcmVncywgdmFsKSBcCj4gLSAgICAgICAo
U0VUX0Y2NF9SRUcoaW5zbiwgNywgcmVncywgdmFsKSwgU0VUX0ZTX0RJUlRZKHJlZ3MpKQo+ICsj
ZGVmaW5lIFNFVF9GMzJfUkQoaW5zbiwgcmVncywgdmFsKSBkbyB7ICAgICAgIFwKPiArICAgICAg
IFNFVF9GMzJfUkVHKGluc24sIDcsIHJlZ3MsIHZhbCk7ICAgICAgICBcCj4gKyAgICAgICBTRVRf
RlNfRElSVFkocmVncyk7ICAgICAgICAgICAgICAgICAgICAgXAo+ICt9IHdoaWxlKDApCj4gKyNk
ZWZpbmUgU0VUX0Y2NF9SRChpbnNuLCByZWdzLCB2YWwpIGRvIHsgICAgICAgXAo+ICsgICAgICAg
U0VUX0Y2NF9SRUcoaW5zbiwgNywgcmVncywgdmFsKTsgICAgICAgIFwKPiArICAgICAgIFNFVF9G
U19ESVJUWShyZWdzKTsgICAgICAgICAgICAgICAgICAgICBcCj4gK30gd2hpbGUoMCkKPgo+ICAj
ZGVmaW5lIEdFVF9GMzJfUlMyQyhpbnNuLCByZWdzKSAoR0VUX0YzMl9SRUcoaW5zbiwgMiwgcmVn
cykpCj4gLSNkZWZpbmUgR0VUX0YzMl9SUzJTKGluc24sIHJlZ3MpIChHRVRfRjMyX1JFRyhSVkNf
UlMyUyhpbnNuKSwgMCwgcmVncykpCj4gKyNkZWZpbmUgR0VUX0YzMl9SUzJTKGluc24sIHJlZ3Mp
IChHRVRfRjMyX1JFRyhHRVRfUlMyU19OVU0oaW5zbiksIDAsIHJlZ3MpKQo+ICAjZGVmaW5lIEdF
VF9GNjRfUlMyQyhpbnNuLCByZWdzKSAoR0VUX0Y2NF9SRUcoaW5zbiwgMiwgcmVncykpCj4gLSNk
ZWZpbmUgR0VUX0Y2NF9SUzJTKGluc24sIHJlZ3MpIChHRVRfRjY0X1JFRyhSVkNfUlMyUyhpbnNu
KSwgMCwgcmVncykpCj4gKyNkZWZpbmUgR0VUX0Y2NF9SUzJTKGluc24sIHJlZ3MpIChHRVRfRjY0
X1JFRyhHRVRfUlMyU19OVU0oaW5zbiksIDAsIHJlZ3MpKQo+ICsjZGVmaW5lIFNFVF9GMzJfUkRT
KGluc24sIHJlZ3MsIHZhbCkgZG8geyAgICAgICAgICAgICAgXAo+ICsgICAgICAgU0VUX0YzMl9S
RUcoR0VUX1JEU19OVU0oaW5zbiksIDAsIHJlZ3MsIHZhbCk7ICAgXAo+ICsgICAgICAgU0VUX0ZT
X0RJUlRZKHJlZ3MpOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+ICt9IHdoaWxlKDAp
Cj4gKyNkZWZpbmUgU0VUX0Y2NF9SRFMoaW5zbiwgcmVncywgdmFsKSBkbyB7ICAgICAgICAgICAg
ICBcCj4gKyAgICAgICBTRVRfRjY0X1JFRyhHRVRfUkRTX05VTShpbnNuKSwgMCwgcmVncywgdmFs
KTsgICBcCj4gKyAgICAgICBTRVRfRlNfRElSVFkocmVncyk7ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4gK30gd2hpbGUoMCkKPgo+ICAjZW5kaWYKPgo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3NiaS9zYmlfdHJhcC5oIGIvaW5jbHVkZS9zYmkvc2JpX3RyYXAuaAo+IGluZGV4IDRlZjY3
MmY0Li44MTZlOTNjOCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfdHJhcC5oCj4gKysr
IGIvaW5jbHVkZS9zYmkvc2JpX3RyYXAuaAo+IEBAIC0yMTgsNiArMjE4LDcgQEAgX1N0YXRpY19h
c3NlcnQoCj4gICNkZWZpbmUgR0VUX1JTMlMoaW5zbiwgcmVncykgICAgICAgICAgIFJFR19WQUwo
R0VUX1JTMlNfTlVNKGluc24pLCByZWdzKQo+ICAjZGVmaW5lIEdFVF9SUzJDKGluc24sIHJlZ3Mp
ICAgICAgICAgICBSRUdfVkFMKEdFVF9SUzJDX05VTShpbnNuKSwgcmVncykKPiAgI2RlZmluZSBT
RVRfUkQoaW5zbiwgcmVncywgdmFsKSAgICAgICAgICAgICAgICAoUkVHX1ZBTChHRVRfUkRfTlVN
KGluc24pLCByZWdzKSA9ICh2YWwpKQo+ICsjZGVmaW5lIFNFVF9SRFMoaW5zbiwgcmVncywgdmFs
KSAgICAgICAoUkVHX1ZBTChHRVRfUkRTX05VTShpbnNuKSwgcmVncykgPSAodmFsKSkKPgo+ICAv
KiogUmVwcmVzZW50YXRpb24gb2YgdHJhcCBkZXRhaWxzICovCj4gIHN0cnVjdCBzYmlfdHJhcF9p
bmZvIHsKPiAtLQo+IDIuMzQuMQo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQo=
