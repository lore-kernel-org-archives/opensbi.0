Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614D1C3ABC9
	for <opensbi@archiver.kernel.org>; Thu, 15 May 2025 14:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cf49VhpsSci1FpN3jZ7dQLrxjCeZF4Q8ObEDWM2ooJ4=; b=pNoiCL31Sz/ecu
	SfnVktSV0I/RGuFe2tcQLOYBq0bEiUFM57rJ+E4ftKLWfFTh6qQlSFo/KTNeLZtZ8R+sxzQf4rlcr
	igG0d26u4AXFm6O9hPg2R7EREgjIpANxSvqpraNwmmzhnyRAgPaHaKsTxSbxCKwupsSTklpY11Mp0
	W30tRvhr/ui9hu6arjjgcpR4h16r5aQoGjsaoGAfdu96Y+kVVjQ8cXCH5jWZOT2W2DIJDfNj1rlL3
	NUIKdnW55ZClmMy4Q+2IwmN+AxQzJog9U6PXqB8gWPYdI3/vM2Jh9mE0OMHVqPWlYIbvOvNxPZcDZ
	hFIRzRgRlhJ/n1IsNkvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZvv-00000000wcZ-33co;
	Thu, 15 May 2025 14:51:39 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZpU-00000000vXD-3ceF
	for opensbi@lists.infradead.org;
	Thu, 15 May 2025 14:45:02 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-3da739653b2so3445455ab.0
        for <opensbi@lists.infradead.org>; Thu, 15 May 2025 07:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1747320300; x=1747925100; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIVFM0DW/k/JpMRSNIALT8UIq+1aYY795qRYijrpuwc=;
        b=wbPrQV5Aar896jJb6uXU/lt81lXMd7TOpe2+pvQn1jcvHyBk4C7SjiiSNp9Iy5gAr3
         oYsLbtK2fBEr66TXhm1C3pVvhcmjVymsV4xS00VuI/WRmsn3QfQi2NE1ni3R3zGNNNUG
         CZvDIaunCuGlKYLVZMjIv9RXJ6wUi3ULB5CRdDa7eeKWxlJYDF7NpuN4E0a1ziqoYQ6o
         ZXSfV6IgECDLsM2OXAxcRVNEumy4d/0TEreD9hH5b3rC88izKmS4FEn6VtrphTXCuL6l
         Ia817aN4rVNMQqY3gGRt9LJs5Rm/DQfFwncWoUX/mVl4GI1x+TagOl9zLKXvTTt5Doil
         VoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320300; x=1747925100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIVFM0DW/k/JpMRSNIALT8UIq+1aYY795qRYijrpuwc=;
        b=MAUxhiFRtizwIAPCEOiZtomEFoXN5l06HxKHAeaXJtZpdY2qwtETESf0zz+WWIChaJ
         7EJi1vjSCXH2Bml4R9PUS78h5ywsuhtMN2Lw25WWK+c4hS/CoKVsTcfAUHcishK55/E2
         xTGZrei2rrCnplRYI0IOA5AfWmEF6q7T/1p6K2yDILoiZ6MvbaKvFX+SDhWZ9gjDQFyB
         2+M+BVeANbusPErqzv1ehIjsZ0oIT5AzV36sx3oavPOGbwvhwF0rSuVbzpNoUqg8LVEr
         oj/lK1uBCRUij3BdLOxi/C95qhsIDbRdfszka3Xme50ZWB+yglJslM3rYygw/7rq97E+
         Alng==
X-Gm-Message-State: AOJu0YyOE6NtSGzSn8KEWm5bAUFRPFJpiGo/uhXbEQuAnDzQ19CulWDM
	p5XhbTU6g7mUIr9OQuO2eFs/9s59HQj+/IZ0VgIhKaFhfK2lJpZYIkJjwWGmAF2hsk563Hzsr4r
	MxZCC8ooMu/31XOjrSxNYejDEQGvb5Eu9q0tVPQ==
X-Gm-Gg: ASbGncu9bHdhQoDIwQbJPIFiKlYR702GMwgSX9KOFssiauxhssAMwS+0HF/yXSkSXbL
	GIsIPfpstIcQB8/KUp5S8pxmRAT2U67GrnwgYwE8eqKJwnILw65l1WP3Cxw4yxdnWHZQ+VuEdXt
	Nr3HvzjyWp7PA3lR6jUgAvr+AP70cG613TSA==
X-Google-Smtp-Source: AGHT+IFNfdD2OfJ6gAB2gD6RChqXlNnEXI5wvgPNUDwLmvNco6m8fcy9eDb2XNC5f+PJyfjxR5q8M+PeAATlrEzIF1I=
X-Received: by 2002:a05:6e02:470f:b0:3da:715a:dde4 with SMTP id
 e9e14a558f8ab-3db6f7acf65mr74106155ab.9.1747320299787; Thu, 15 May 2025
 07:44:59 -0700 (PDT)
MIME-Version: 1.0
References: <20250424034003.28522-1-nick.hu@sifive.com>
In-Reply-To: <20250424034003.28522-1-nick.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 15 May 2025 20:14:49 +0530
X-Gm-Features: AX0GCFtLR-5-TUpfCJXFPqjf4_tf-CMgRJe6hZwSuorJ3Sj3eupsuFj5dPEUtcI
Message-ID: <CAAhSdy0-KvzhSmf6-aUxexMTOJF-wD0io1NLHgpfn8dBLSs2uA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Support external CMO to flush entire cache
To: Nick Hu <nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_074501_176862_C298EA14 
X-CRM114-Status: GOOD (  12.31  )
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
Cc: vincent.chen@sifive.com, opensbi@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgOToxMOKAr0FNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZl
LmNvbT4gd3JvdGU6Cj4KPiBTb21lIGZlYXR1cmVzLCBzdWNoIGFzIHBvd2VyIG1hbmFnZW1lbnQs
IG1heSByZXF1aXJlIGZsdXNoaW5nIHRoZSBlbnRpcmUKPiBjYWNoZSBiZWZvcmUgZW50ZXJpbmcg
YSBub24tcmV0ZW50aW9uIHBvd2VyIHN0YXRlLiBUbyBzdXBwb3J0IHRoaXMsIGEKPiBzaW1wbGUg
Y2FjaGUgZnJhbWV3b3JrIGlzIGludHJvZHVjZWQgdG8gYWxsb3cgdGhlIGV4dGVybmFsIENNTyB0
bwo+IHBlcmZvcm0gYSBmdWxsIGNhY2hlIGZsdXNoLgoKVGhpcyBzZXJpZXMgc2hvdWxkIGFsc28g
aW5jbHVkZSBwYXRjaGVzIHdoaWNoIHVzZSB0aGUgY2FjaGVfeHl6KCkKQVBJcyB1cG9uIHBvd2Vy
IG1hbmFnZW1lbnQgb3BlcmF0aW9ucyAgKGUuZy4gc3VzcGVuZCB0byBSQU0pLgoKUmVnYXJkcywK
QW51cAoKPgo+IENoYW5nZXMgaW4gdjI6Cj4gLSBTaW5jZSB0aGUgcGxhdGZvcm0gb3ZlcnJpZGUg
aG9va3Mgd2FzIGRlcHJlY2F0ZWQsIHVzZSB0aGUgZmR0X2RyaXZlcgo+IGZvciBpbml0aWFsaXpp
bmcgdGhlIHNpZml2ZV9kZXZfcGxhdGZvcm0uCj4KPiBOaWNrIEh1ICgzKToKPiAgIGxpYjogdXRp
bHM6IEFkZCBjYWNoZSBmbHVzaCBsaWJyYXJ5Cj4gICBsaWI6IHV0aWxzOiBBZGQgRkRUIGNhY2hl
IGxpYnJhcnkKPiAgIGxpYjogdXRpbHMvY2FjaGU6IEFkZCBmZHQgY21vIGhlbHBlcnMKPgo+IFZp
bmNlbnQgQ2hlbiAoMik6Cj4gICB1dGlsczogY2FjaGU6IEFkZCBTaUZpdmUgY2NhY2hlIGNvbnRy
b2xsZXIKPiAgIHBsYXRmb3JtOiBnZW5lcmljOiBBZGQgU2lGaXZlIGRldmVsb3BtZW50IHBsYXRm
b3JtCj4KPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvY2FjaGUuaCAgICAgICAgICAgICAgIHwg
IDY5ICsrKysrKysKPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2NhY2hlLmggICAgICAg
ICAgIHwgIDM0ICsrKysKPiAgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2Ntb19oZWxwZXIu
aCAgICAgIHwgIDM0ICsrKysKPiAgbGliL3V0aWxzL0tjb25maWcgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAyICsKPiAgbGliL3V0aWxzL2NhY2hlL0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDIzICsrKwo+ICBsaWIvdXRpbHMvY2FjaGUvY2FjaGUuYyAgICAgICAgICAg
ICAgICAgICAgICAgfCAgNDYgKysrKysKPiAgbGliL3V0aWxzL2NhY2hlL2ZkdF9jYWNoZS5jICAg
ICAgICAgICAgICAgICAgIHwgIDg3ICsrKysrKysrKwo+ICBsaWIvdXRpbHMvY2FjaGUvZmR0X2Nh
Y2hlX2RyaXZlcnMuY2FycmF5ICAgICAgfCAgIDMgKwo+ICBsaWIvdXRpbHMvY2FjaGUvZmR0X2Nt
b19oZWxwZXIuYyAgICAgICAgICAgICAgfCAxMTIgKysrKysrKysrKysKPiAgbGliL3V0aWxzL2Nh
Y2hlL2ZkdF9zaWZpdmVfY2NhY2hlLmMgICAgICAgICAgIHwgMTc1ICsrKysrKysrKysrKysrKysr
Kwo+ICBsaWIvdXRpbHMvY2FjaGUvb2JqZWN0cy5tayAgICAgICAgICAgICAgICAgICAgfCAgMTQg
KysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgICA1
ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9jb25maWdzL2RlZmNvbmZpZyAgICAgICAgICAgIHwgICAz
ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvb2JqZWN0cy5tayAgICAgICAgICAgIHwgICAz
ICsKPiAgcGxhdGZvcm0vZ2VuZXJpYy9zaWZpdmUvc2lmaXZlX2Rldl9wbGF0Zm9ybS5jIHwgIDQy
ICsrKysrCj4gIDE1IGZpbGVzIGNoYW5nZWQsIDY1MiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL3NiaV91dGlscy9jYWNoZS9jYWNoZS5oCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL3NiaV91dGlscy9jYWNoZS9mZHRfY2FjaGUuaAo+ICBjcmVhdGUgbW9k
ZSAxMDA2NDQgaW5jbHVkZS9zYmlfdXRpbHMvY2FjaGUvZmR0X2Ntb19oZWxwZXIuaAo+ICBjcmVh
dGUgbW9kZSAxMDA2NDQgbGliL3V0aWxzL2NhY2hlL0tjb25maWcKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi91dGlscy9jYWNoZS9jYWNoZS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRp
bHMvY2FjaGUvZmR0X2NhY2hlLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGlscy9jYWNo
ZS9mZHRfY2FjaGVfZHJpdmVycy5jYXJyYXkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGxpYi91dGls
cy9jYWNoZS9mZHRfY21vX2hlbHBlci5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBsaWIvdXRpbHMv
Y2FjaGUvZmR0X3NpZml2ZV9jY2FjaGUuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3V0aWxz
L2NhY2hlL29iamVjdHMubWsKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMv
c2lmaXZlL3NpZml2ZV9kZXZfcGxhdGZvcm0uYwo+Cj4gLS0KPiAyLjE3LjEKPgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
