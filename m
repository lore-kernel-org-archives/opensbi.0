Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75725C55171
	for <opensbi@archiver.kernel.org>; Sun,  2 Aug 2026 09:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4gYZXRnEbB/rleu2Lr3zrM+leCAgLv08zCR0JXHMr6A=; b=FY3jXtzQPmI2fj
	jkF8dO9nHaUqIQSP3FDDfI/dEEyWl8LExQCvWiNjqaaQN3QWqs1tnYrKapwkCzwjyTpS0OxA1K8z3
	RKvpbTwF2Dl8imKpvD+vw0WHFoV1IiEhTRbHbbcYVHZYJ/+3kwqWZDqJ9cEzmjb33DEVML5C4ojtE
	JdnrAxtBbCHC/R04lHxVghYGb58mg9t4IOlPyuOW0oX6EshPB9Z2QZOQ6GX1coJUW8JkeRWTm3lhT
	eLUzkZRiHnm900w5COlW8d0RSldzf/8Iz9yiZmCC3ePpuEL+2uzk0bqdee/gGC+eMXN/QIKqKupJN
	jGe6j9qgwiLJLteGmkpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqStO-0000000FWtx-0AhI;
	Sun, 02 Aug 2026 09:54:02 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqStK-0000000FWtb-3LP6
	for opensbi@lists.infradead.org;
	Sun, 02 Aug 2026 09:54:00 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4728c12ba97so1284963f8f.0
        for <opensbi@lists.infradead.org>; Sun, 02 Aug 2026 02:53:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785664436; cv=none;
        d=google.com; s=arc-20260327;
        b=ofKTGrTbFcwzYqM5HvvpQ70cQjRRLfUjSh5IfpvkEdMt8TfFLZVf1HotwoeXeRQ7hf
         MkLxDF7A+inVS5/+sP3sSzAWGoBYZakViJ6tgnit/wMRbmIBdQQrHqqSODlsdkPHt+tr
         HMI8NiWL1PuyO2JHa0PoWoZ5bwGHgAqZQp1869zdreJ9VYTFNwKtnBvSZF81GXYpk72i
         sAbOVBC8wh2b/dDktDcGmMvR1KDbQ59n+V1ajjJcH64bhIllOf1zg7xANjtosDwb1N89
         rNYiwcF81eiinWBjWXuV1PQGMsoLLmClGL40xVDS7e4TiBTMsPkZbN5j8Ou9UUbjXqKC
         t/qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=li+DXi7LeUDjcJXCzbXc9/J/3hwuiopD6Lm/VJsAAds=;
        fh=j+lCFUfsP0zyYz1EgANI2qKTY0sSjMy5gduQ7GQ3+xI=;
        b=f+HqVIP6qItFrM96x17JcRE0M7PZzirRdb6nPcgwznZZixnZMVa8qzyqbKZ5EiVBiK
         9ZAgGUR2DDxyo63dl9Jo61JOmgNSxYMW/COLPLqqNrk0iRkJZTDhvIHCGUUKkJHaua6a
         vTnZKx0ToX8hlxBE6BkMpT6vd5wOCfsb9tTxcyeu4NQ9TpV8djs98BrTMUP7S8qOlJJI
         H/eu4mRCwzuQ5cBbqHGFonxU1uIHfRlL42MMo5v+flwU8PfjGjzqUD1Kn1SuvYPydn7n
         hkSTfTPAhUWjJ0NU14OJUwbgPDt+8aSuW0xVTGF4YG6S53+zBdh9iOMSkYf9P9kDtLxS
         Hkhg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785664436; x=1786269236; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=li+DXi7LeUDjcJXCzbXc9/J/3hwuiopD6Lm/VJsAAds=;
        b=fBq26R8i3ZdUEzNeyRLT2krJwwQWFo2dW2Og0rnHZaU6N1Q2FsNvGJbwkftT2HJ61S
         7CNb26y+nYuG6YhJ4kTtMErXZEu65AaVjY6/npOalmlGhkZPX9e7ShrHWsEwqCKKZ+s6
         hw52jw0VQT9fYYLRiUworDUY1i3s0i4DAo9qvtw1ZvJ+1B7bNz4mOK7v4k2OLlo5pD9/
         sjor7OAV3oz5T8Bsq0tYGfbyTnMsRtXOjVIhWU6rAeMFQm2mZT+qvfDLnzB0/ZTz7qkC
         bltpuG0HNo08TVSJTaW/msNvxUcZrsn2KfOOCd0Y5lU/eMTVq7Cl3SW5ZRXgrXi5edQm
         FCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785664436; x=1786269236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=li+DXi7LeUDjcJXCzbXc9/J/3hwuiopD6Lm/VJsAAds=;
        b=YshMnXY4CLKmLKLYGUJ/dhuT/vG1Oe7yhBNPayIcqGEzNVbw8gik9HpanZllJVNfYv
         2tgFjckyb8vRQ2WtXlIpnLS81FiHGYuwlBp22aDircDIlI8Bk85r/Hy3A/KH+vFZNA4v
         +jHgV8U9pQnkq4UewpUm4ABnUFxo7FEyBTOo957h9sirCpT/md/0Q4N20keSFxUG9sBx
         tKdwALbFBuEXAuzGJwie27sZgg8trwUvYx9RlLjpsqOmQ+SxSLo2lRW2JZ4jPnhib8u2
         spI6xtuxDpr2o+mdf9Q83c4d3MF58Lh7i/LqKeajy7PueP24YupPlpBZciG0khdvNp3g
         k38A==
X-Forwarded-Encrypted: i=1; AHgh+Ro9tBkCa5iArzRbnYGelZ+/T9VcCDAuiyLvZ/MF4WJ0VY0Lzb9VN8Tch1Zjr1yhSBMGbUljUFU3@lists.infradead.org
X-Gm-Message-State: AOJu0YyBJ0oN4QsUDQH1HeIeiu0oQ74AvOD6a8kvXgjmBx06tKGb1rW4
	Yyp6kzIwG8hU58tW1oka82P0Qj9y7+46+jQPiS2gRajHCyGVnaQk2eSEIewzARnFRtLEP0NFxb+
	+CzoAK49kEG8MrqL56UwzDZe/IObt6jI5qSEfRv8ThA==
X-Gm-Gg: AR+sD11rR2GAqpUKL07m7tl4igp3cmBv0DoGvXzxkXv0XqPr96XY0ROVWNFcmLz2WMw
	IiBxKC3iMSGy9F3hb0BJ64mM4MLlcX0xRS96Fx0VBgm/zcsMKle+XriP2lRtUGEeuX15QwtH4+N
	aH7PzBQZHw5mOwnP4ZV7ewfyY9A3qvPQPCCgd+25UNSd6zw2IuomyT77gV0ygI+Zc+oD4UYTihN
	5cMRZTNEgEZNy/jGOJWRNLMCQW78TDNZrY9tGl6C6rM/OXqhyv7aCnIOYpKRuHWYio7N3HtZ1oz
	T6P0/4U/PcUsjwyoKHd0MDpRuA7sVs/y3DMKlth12iRQhBpk/yEJqR354ca5Tglo7xp3kwZTe+W
	QVO0AbXDiGCZHBCeavXIAwbG5Wa39fkYLV13UUzdANy/rdnMbD6JTMn7pU0uzZuiCDNm8EYu4/8
	0=
X-Received: by 2002:a05:6000:29c2:b0:474:530:9d with SMTP id
 ffacd0b85a97d-47fd72b03e1mr9792065f8f.13.1785664435821; Sun, 02 Aug 2026
 02:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260727042504.1743250-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 2 Aug 2026 15:23:42 +0530
X-Gm-Features: AUfX_mxlnvcbvOF6adsP31FQz9N_13BRNFZ4UImi1-TIT_NNartEfyOMuDC8XoI
Message-ID: <CAAhSdy0Of4w2DwnPd=rWMQ+aCq53NeDf_h8V85Ft5FeXqdESjw@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Extend hart protection abstraction for ID configuration
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_025358_891994_CE6B5BD3 
X-CRM114-Status: GOOD (  10.35  )
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

T24gTW9uLCBKdWwgMjcsIDIwMjYgYXQgOTo1NeKAr0FNIEFudXAgUGF0ZWwgPGFudXAucGF0ZWxA
b3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBFeHRlbmQgaGFydCBwcm90ZWN0aW9uIGFic3Ry
YWN0aW9uIHRvIHN1cHBvcnQgSUQgY29uZmlndXJhdGlvbiByZWxhdGVkCj4gSVNBIGV4dGVuc2lv
bnMgc3VjaCBhcyBSSVNDLVYgd29ybGRzLCBTdXBlcnZpc29yIGRvbWFpbiBJRCwgUW9TIElELCBl
dGMuCj4KPiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJlIGZvdW5kIGluIHNiaV9oYXJ0X3Byb3Rl
Y3RfaW1wX3YyIGJyYW5jaAo+IGF0OiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9vcGVuc2Jp
LmdpdAo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiAgLSBBZGRyZXNzZWQgUmFodWwncyBjb21tZW50
cyBpbiBQQVRDSDEsIFBBVENIMiwgYW5kIFBBVENINAo+Cj4gQW51cCBQYXRlbCAoNSk6Cj4gICBs
aWI6IHNiaTogRml4IHR5cG9zIHJlbGF0ZWQgdG8gaGFydCBwcm90ZWN0aW9uCj4gICBsaWI6IHNi
aTogSW50cm9kdWNlIHNiaV9oYXJ0X3Byb3RlY3Rpb25fcmVjb25maWd1cmUoKSBmdW5jdGlvbgo+
ICAgbGliOiBzYmk6IEFkZCBkb21haW4gcGFyYW1ldGVyIHRvIGhhcnQgcHJvdGVjdGlvbiAodW4p
Y29uZmlndXJlKCkKPiAgIGxpYjogc2JpOiBFeHRlbmQgaGFydCBwcm90ZWN0aW9uIGFic3RyYWN0
aW9uIHRvIGFsbG93IElEIGNvbmZpZ3VyYXRpb24KPiAgIGxpYjogc2JpOiBQcmludCBsaXN0IG9m
IGFsbCBoYXJ0IHByb3RlY3Rpb24gbWVjaGFuaXNtcyBhdCBib290IHRpbWUKPgo+ICBpbmNsdWRl
L3NiaS9zYmlfaGFydF9wcm90ZWN0aW9uLmggfCAgNDkgKysrKysrKystLQo+ICBsaWIvc2JpL3Ni
aV9kb21haW5fY29udGV4dC5jICAgICAgfCAgIDMgKy0KPiAgbGliL3NiaS9zYmlfaGFydF9wbXAu
YyAgICAgICAgICAgIHwgIDEzICsrLQo+ICBsaWIvc2JpL3NiaV9oYXJ0X3Byb3RlY3Rpb24uYyAg
ICAgfCAxNTMgKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0tCj4gIGxpYi9zYmkvc2JpX2lu
aXQuYyAgICAgICAgICAgICAgICB8ICAxOCArKy0tCj4gIHBsYXRmb3JtL2dlbmVyaWMvZXN3aW4v
ZWljNzcweC5jICB8ICAgOCArLQo+ICA2IGZpbGVzIGNoYW5nZWQsIDIwMiBpbnNlcnRpb25zKCsp
LCA0MiBkZWxldGlvbnMoLSkKPgo+IC0tCj4gMi40My4wCj4KCkFwcGxpZWQgdGhpcyBzZXJpZXMg
dG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwbyB0byB1bmJsb2NrIFNtbXB0CmFuZCBSSVNDLVYgd29y
bGRzIHN1cHBvcnQuCgpUaGFua3MsCkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVu
c2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9vcGVuc2JpCg==
