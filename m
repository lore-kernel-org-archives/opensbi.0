Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147AA606A325
	for <opensbi@archiver.kernel.org>; Thu, 19 Nov 2026 12:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RkewRdKT;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=OA/BhBms
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ah9dOOWVARBkuRyfBa4F4cK/wBuuAbyAfJBcm+wdjw=; b=RkewRdKT44VHFPq9StMesfZ0er
	Jo8Kjx+VLo+7Kv0cArRRmIeK8NG69EIiaYl3Hws3Q+pG4YoPsl5WVSwbPxCwgNL2yatB7LuSp2QsI
	V7dOa2g3enD34UUkwlEojjaMiaFqItgZ3moj3RoAeIJRpiSqK/rF6vPt1E67D2Xf8hwWcCK+x3dqV
	PfIZb6AEo2Nla3o+QlG5pyLmrkjnFVy9Vk+Tnh4YsUbTisw18NkCzBprx3Xffu6quEQAHMJBKnoTO
	OYONkyyconJWHPM7Catkf4J3KDBpiU8FbjZfpJbVFnUjY/JWR1rSNrj0xviK2jrUWvXPX02tpt6Sc
	KRR5QveA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1fp-0000000Bw4X-09s5;
	Thu, 19 Nov 2026 12:55:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1fm-0000000Bw3k-2BDu
	for opensbi@lists.infradead.org;
	Thu, 19 Nov 2026 12:55:32 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-491971ac844so2189095f8f.2
        for <opensbi@lists.infradead.org>; Thu, 19 Nov 2026 04:55:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092928; cv=none;
        d=google.com; s=arc-20260327;
        b=fTTyn57LHjFf2ZKIb0/S7WXivbTUWiDxLlFg/rZH2wmQSrYI/dyDeCTCP63syP/fCb
         8ypKodZkUvHvZWli6iPpKNq/6myil5AsfLI0SL2wUt+UNmDuQJbnbCapH/bQgyDGOoS1
         8TYMX6GlBLlw8AwbxCSZzPL8N+Z9WqH5g1cMbHDasIz+I4VmxsZu5E7s5IyhjA+dpZ31
         zs1SnYnJi4AuTxR2AVM0IikvWtgeuRk8wL6yc5m6/zWDVUsF7+WT3AAwwd5dpPTRZ3ig
         s6SMNtdeE89ktnttudrf/7YXJ4ZbJFzicewEEay4Yh621SqvgQ8NzyTEwSAXlf2Qfu51
         TjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wd5VoHp9uzWZjx1sNcl4uinzT9ktxw8REPlgZRmCvFo=;
        fh=KrYJhzZvIgXYjgi9IqeDq7QDVTAAX0EvLn/l70df43w=;
        b=TX4icQ/ycViKkNaZsUERGi7qrrGJsKEOCqvryQ814m86y2/aKybg5BoLpcieveuqTl
         9Wm8oHQkqrkSl/lRYwq6XPFOFDlavksUXC29WNzfWAhN+do19WOCfwQcxtlGgdfyqk6u
         gqrJX32kWz0ZI14XE8K+1yQB+HcBtpvvhAKBlbFvQK8i6xzCwEmK1xN0r7lkQdTMvjja
         7vKBgMfYrk7DElQit664PQ/VL22EkZJ/zzBYsndZP9/Bj7zhwd66Rux/rm8pQ3gpfvLP
         epbb6yVw13/5VCLvGnttQ6de6/tatRSOaR82Ii82TbCrC4MPO8B8Dd0N8UuFX/+aZ2Uy
         CASg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795092928; x=1795697728; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wd5VoHp9uzWZjx1sNcl4uinzT9ktxw8REPlgZRmCvFo=;
        b=OA/BhBmsYgz2cvtVb/VoY0e7/p+RnCyq9t9JuPH7EodztaeWwloMAZ1A04M/YOhSOG
         KUqDxDyZc+P+zlT5lMi5+pnX2q0WL6LZSrkHVNmJ5dnN5FmqFfiHA4kou4B3fLtvdzrB
         612rrkGsDXIUQizhkx/sLPK9QcFbfaYpUxW0gzVYKdQ+xzMw7VhwjvhKBbo3915RVzcd
         cTzEjSDKaS7ePVGTHp3ljpIXdBq3Su4rGJpXaNfHTAMZaw4DkjFlpHDg9D0i93clZ3FD
         4PTzO+Kt/qH9SM+kc5HXjcLQq+gNwEtjfHNRPJrN8ExnQX+++yx6A7XSYB9l/H7foQpS
         TJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092928; x=1795697728;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wd5VoHp9uzWZjx1sNcl4uinzT9ktxw8REPlgZRmCvFo=;
        b=qYgOmqt50ho/gaPPDQ9MA6OESJxiHBk6t1f5mu6Cw6d/GU8Ad1Odn9HmY+z58eiy5T
         4ABqvEtmw4PaqVavt9I89ypDFEUGUlgzC25RLQWnDMi3+2ANmm83so9lMrPE+PgxFQFR
         o5gPyZy3/kiqPXtWphaFHNhPKkJESPWL1WAn2D6liClDI9Ju+wRjvBNDAoGgmsFwNbud
         fjAXJAp76zjiopwv10WSiqJ64yG08WH8q5SuNO1H+ZssyhxsfglOA42jRBWZpZtl5c3L
         VJdZ1oYUyezcU1YzR37deiZAJVsmXEGsidBu/mxEUrBu6zau6r6uu7Ll3FkSh7gkLA68
         y1bg==
X-Gm-Message-State: APuU4Z8xYQ1/O5Pw+XOoL/f6NRsmGt1IrwSG6nwyYfweTDwsAUAgVr/N
	USWENYuqqgMbXZm91lWP7KzJLlCparwUDVkmPZe7knyv9E8rYzg4CNwWJAOz0x+b5OLR4CU0bwO
	otrPV26MFp682TSy2uDssSZEejSGxsoYV6b1RXOl1Mpr/yLYHNW75
X-Gm-Gg: AZFdTZeUWAv2Bclh4kWsNF8ErmVXBZsyJd4HXiGYUkumZVVo4sSj2/cATvPLS7lkkUa
	vFqPaSV2p+FxAHp6OUvZOe8xHwkjXxglAKE4RcmF4SfBJEWKrhYpQMw6PyDsOuTj7m+cQ3ppbi8
	XQWefk6WG5WmQOQlyMqKCbHYs5E+UFgJSXau9wdlpb180NaBDqjswkyPnmL8lbe8YOeVdVimbj5
	FmTGdh+yFWUfah3+guIzXiTDNjjrmoODDEqcvXSiE1UgDe2hELaHNhoiH3zVvHco5miD0E4xYZx
	xMTEIJyHz36nN88dDlnRkGTP2j32i7nm89umVfDTRX56nazwTMn+5ollMoP1XmvpWEb6nmHVlA0
	Q9di2uDJpeARMi6FJS1bZoT8mtMf++P4xvNU1KVrF7sibycQYJyn+1/mPLl2mKGW8uDWskvebw1
	EocS2e5+zh/SWDm9ZTrz8uaiISiHWNVNgmWKgDrI47SgjEidgAA59H
X-Received: by 2002:a05:6000:1a8b:b0:4a8:eed3:760 with SMTP id
 ffacd0b85a97d-4a8eed31258mr5349932f8f.31.1795092927773; Thu, 19 Nov 2026
 04:55:27 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 18:25:16 +0530
X-Gm-Features: Aa3M54rGNUmcbKYZhjRoG-l1VaaVtpfLNT8Z37HnrlhvRhvafV7NmBbMj3X76GY
Message-ID: <CAAhSdy3d=PLpMBDhEj0PrJEw6-=pTk25euhY8Msv5z0BnHj5pA@mail.gmail.com>
Subject: Re: [PATCH v10 0/7] MPXY interdomain bridge driver
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_045530_632695_A60B14B8 
X-CRM114-Status: GOOD (  20.96  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMzoyNeKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBUaGlzIHNlcmllcyBpbnRyb2R1Y2Vz
IHR3byBuZXcgY2FwYWJpbGl0aWVzIHRvIE9wZW5TQkk6Cj4KPiAgIDEuIEEgZG9tYWluIHJlZ2lz
dHJhdGlvbiBub3RpZmllciBtZWNoYW5pc20KPiAgIDIuIFJQTUkgUkVRVUVTVF9GT1JXQVJEIFNl
cnZpY2UgR3JvdXAgZGVmaW5hdGlvbnMKPiAgIDMuIEFuIEZEVC1jb25maWd1cmVkIE1QWFkgYnJp
ZGdlIGRyaXZlciBmb3IgaW50ZXItZG9tYWluIG1lc3NhZ2UgcGFzc2luZwo+Cj4gLS0tIE1vdGl2
YXRpb24gLS0tCj4KPiBNb2Rlcm4gU0JJIGRlcGxveW1lbnRzIGluY3JlYXNpbmdseSByZXF1aXJl
IGNvb3BlcmF0aW9uIGJldHdlZW4gbXVsdGlwbGUKPiBkb21haW5zIHNoYXJpbmcgdGhlIHNhbWUg
cGh5c2ljYWwgaGFydCDigJQgZm9yIGV4YW1wbGUgYSB0cnVzdGVkIGJhcmUtbWV0YWwKPiBkb21h
aW4gYW5kIGFuIHVudHJ1c3RlZCBkb21haW4gcnVubmluZyBvbiBhIHNpbmdsZQo+IGNvcmUuIFdo
aWxlIE9wZW5TQkkncyBkb21haW4gY29udGV4dCBzd2l0Y2hpbmcgaW5mcmFzdHJ1Y3R1cmUgcHJv
dmlkZXMgdGhlCj4gbWVjaGFuaXNtIGZvciBoYXJ0IG11bHRpcGxleGluZyBiZXR3ZWVuIGRvbWFp
bnMsIHRoZXJlIHdhcyBubyBleGlzdGluZwo+IGZhY2lsaXR5IGZvciBkb21haW5zIHRvIGV4Y2hh
bmdlIG1lc3NhZ2VzIGFjcm9zcyBkb21haW4gYm91bmRhcmllcy4KPgo+IFRoaXMgc2VyaWVzIGFk
ZHJlc3NlcyB0aGF0IGdhcCBieSBpbXBsZW1lbnRpbmcgYSBicmlkZ2Ugb3ZlciB0aGUgTVBYWQo+
IChNZXNzYWdlIFByb3h5KSBleHRlbnNpb24gdGhhdCB1c2VzIGRvbWFpbiBjb250ZXh0IHN3aXRj
aGluZyBhcyBpdHMKPiB0cmFuc3BvcnQuCj4KPiB0aGUgc2VyaWVzIGFsc28gYWRkcyBzb3VyY2Ug
ZHJpdmVyIHdoZXJlIHZhcmlvdXMgcHJvdG9jb2xzIG92ZXIgUlBNSSBjYW4KPiBleGlzdC4gZS5n
LiBtYW5hZ2VtZW50IG1vZGUgb3IgdGVlIG1vZGUgZHJpdmVycy4KPgo+IHRoZSBEVCBiaW5kaW5n
cyBhcmUgYXMgZm9sbG93aW5nLiB3aGljaCBkZWZpbmVzIGJvdGggbXVsdGlwbGUgc291cmNlcwo+
IGFuZCBzaW5nbGUgZGVzdGluYXRpb24uCj4KPiBicmlkZ2UwOiB1bnRydXN0ZWQtdG8tdHJ1c3Rl
ZC1icmlkZ2Ugewo+ICAgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gIm9wZW5zYmkscnBtaS1t
cHh5LXJlcWZ3ZC1icmlkZ2UiOwo+ICAgICAgICAgICAgICAgICByaXNjdixkb21haW4gPSA8JnRk
b21haW4+Owo+ICAgICAgICAgICAgICAgICByaXNjdixzYmktbXB4eS1jaGFubmVsLWlkID0gPDB4
Mj47Cj4gICAgICAgICAgICAgICAgIHNvdXJjZTAgewo+ICAgICAgICAgICAgICAgICAgICAgY29t
cGF0aWJsZSA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIm9wZW5zYmkscnBtaS1tcHh5LXJl
cWZ3ZC1tbSI7Cj4gICAgICAgICAgICAgICAgICAgICByaXNjdixkb21haW4gPSA8JnVkb21haW4+
Owo+ICAgICAgICAgICAgICAgICAgICAgcmlzY3Ysc2JpLW1weHktY2hhbm5lbC1pZCA9IDwweDE+
Owo+ICAgICAgICAgICAgICAgICB9Owo+Cj4gICAgICAgICAgICAgICAgIHNvdXJjZTEgewo+ICAg
ICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
Im9wZW5zYmkscnBtaS1tcHh5LXJlcWZ3ZC10ZWUiOwo+ICAgICAgICAgICAgICAgICAgICAgcmlz
Y3YsZG9tYWluID0gPCZ1ZG9tYWluPjsKPiAgICAgICAgICAgICAgICAgICAgIHJpc2N2LHNiaS1t
cHh5LWNoYW5uZWwtaWQgPSA8MHgzPjsKPiAgICAgICAgICAgICAgICAgfTsKPiAgICAgICAgICAg
ICB9Owo+Cj4gLS0tIFRlc3RpbmcgLS0tCj4KPiBUaGUgc2VyaWVzIHdhcyB0ZXN0ZWQgb24gUUVN
VSBTaUZpdmUgVW5sZWFzaGVkIChzaWZpdmVfdSkgd2l0aCB0aGUKPiBhYm92ZSBkZXZpY2UgdHJl
ZSBjb25maWd1cmF0aW9uLiBUaGUgdGVzdCBzZXR1cCBjb25zaXN0cyBvZjoKPgo+ICAgLSBoYXJ0
MSBzaGFyZWQgYmV0d2VlbiB0cnVzdGVkLWRvbWFpbiBhbmQgdW50cnVzdGVkLWRvbWFpbgo+ICAg
LSB0cnVzdGVkLWRvbWFpbjogYmFyZS1tZXRhbCBhcHBsaWNhdGlvbiBsb2FkZWQgYXQgMHg4MDEw
MDAwMAo+ICAgICBib290aW5nIGluIFMtbW9kZSB2aWEgdGhlIGRvbWFpbidzIG5leHQtYWRkcgo+
ICAgLSB1bnRydXN0ZWQtZG9tYWluOiBMaW51eCBrZXJuZWwgd2l0aCBhIGtlcm5lbCB0aHJlYWQg
c2VuZGluZwo+ICAgICBwZXJpb2RpYyBNUFhZIG1lc3NhZ2VzIHZpYSBGSUQjNSAoU0VORF9NU0df
V0lUSF9SRVNQT05TRSkKPiAgICAgYW5kIEZJRCM2IChTRU5EX01TR19OT19SRVNQT05TRSkgb24g
TVBYWSBjaGFubmVsIDB4MQo+ICAgLSBBIHNlcGFyYXRlIGJhcmUtbWV0YWwgdGVsbmV0IGNvbnNv
bGUgYXBwbGljYXRpb24gcG9sbGluZwo+ICAgICBNUFhZIGNoYW5uZWwgMHgyIHVzaW5nIFJFUUZX
RF9SRVRSSUVWRV9DVVJSRU5UX01FU1NBR0UKPiAgICAgYW5kIFJFUUZXRF9DT01QTEVURV9DVVJS
RU5UX01FU1NBR0UKPgo+IFRoZSBMaW51eCBrZXJuZWwgdGhyZWFkIHNlbmRzIGEgdGVzdCBwYXls
b2FkICgiTVBYWS1IRUxMTyBzZXE9TiIpIGV2ZXJ5Cj4gMzAgc2Vjb25kcyBhbHRlcm5hdGluZyBi
ZXR3ZWVuIEZJRCM1IChleHBlY3RpbmcgYSByZXNwb25zZSkgYW5kIEZJRCM2Cj4gKGZpcmUtYW5k
LWZvcmdldCkuIFRoZSBiYXJlLW1ldGFsIGFwcGxpY2F0aW9uIHJldHJpZXZlcyB0aGUgZm9yd2Fy
ZGVkCj4gbWVzc2FnZSB2aWEgdGhlIFJFUUZXRCBzZXJ2aWNlIGdyb3VwIGFuZCBlY2hvZXMgaXQg
YmFjayBhcyB0aGUKPiBDT01QTEVURSByZXNwb25zZS4gVGhlIExpbnV4IGRyaXZlciB2ZXJpZmll
cyByZWNlaXB0IG9mIHRoZSBlY2hvZWQKPiByZXNwb25zZS4KPgo+IEJvdGggRklEIzUgYW5kIEZJ
RCM2IHBhdGhzIHdlcmUgZXhlcmNpc2VkIGFuZCB2ZXJpZmllZCBlbmQtdG8tZW5kCj4gYWNyb3Nz
IHRoZSBkb21haW4gYm91bmRhcnkgb24gYSBzaW5nbGUgc2hhcmVkIGhhcnQgd2l0aG91dCByZXF1
aXJpbmcKPiBhbnkgZGVkaWNhdGVkIGludGVyLXByb2Nlc3NvciBjb21tdW5pY2F0aW9uIGhhcmR3
YXJlLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MToKPiBkZWNvbmZpZyBzZWxlY3RzIENPTkZJR19GRFRf
TVBYWV9CUklER0UKPgo+IENoYW5nZXMgc2luY2UgdjI6Cj4gc3VwcG9ydHMgbXVsdGlwbGUgc291
cmNlIGRvbWFpbiB0b3dhcmRzIHNpbmdsZSBkZXN0aW5hdGlvbi4gKG1hbnk6b25lKQo+Cj4gQ2hh
bmdlcyBzaW5jZSB2NDoKPiBjb3NtZXRpYyBjaGFuZ2VzLCBhbmQgc29tZSBtb2R1bGFyIGNoYW5n
ZXMKPgo+IENoYW5nZXMgc2luY2UgdjU6Cj4gYWRkZWQgY29uY2VwdCBvZiBzb3VyY2UgZHJpdmVy
Cj4KPiBDaGFuZ2VzIHNpbmNlIHY2Ogo+IGNvdmVyIGxldHRlciBjaGFuZ2VzIG9ubHkKPgo+IENo
YW5nZXMgc2luY2Ugdjc6Cj4gZml4ZWQgcmV2aWV3IGNvbW1lbnRzCj4gbWFrZSB0aGUgYnJpZGdl
IGRyaXZlciBjYXJyYXkgYmFzZWQKPiB3aGVyZSBzb3VyY2UgZHJpdmVycyBhcnJheSBjYW4gYmUg
bWFpbnRhaW5lZC4KPgo+IENoYW5nZXMgc2luY2Ugdjg6Cj4gYWRkZWQgZG9jdW1lbnRhdGlvbi4K
PiBtb3ZlZCBzYmlfaGFydG1hc2tfZXF1YWwgZGVmaW5hdGluIHRvIHNiaV9oYXJ0bWFzay5oCj4g
Zml4ZWQgbWlub3IgY29tbWVudHMuCj4KPiBDaGFuZ2VzIHNpbmNlIHY5Ogo+IGNoYW5nZWQgaW1w
bGVtZW50YXRpb24gb2Ygc2JpX2hhcnRtYXNrX2VxdWFsCj4gZml4ZWQgc2VydmljZSBJRCBsb29r
dXAgbG9vcAo+IHJlZ2lzdGVyaW5nIG1weHkgZWNhbGwgZXh0ZW50aW9uIHdpdGhvdXQgYW55IGNv
bmRpdGlvbgo+Cj4gQ2hhbmdlcyBzaW5jZSB2MTA6Cj4gZG9jdW1lbnRhaXRvbiB0YWxrcyBhYm91
dCBicmlkZ2UgaW4gZGV0YWlsLgo+IG1pbm9yIGNvbW1lbnRzIGZpeGVkLgo+Cj4gT3phIFBhd2Fu
ZGVlcCAoNyk6Cj4gICBzYmlfdXRpbHM6IG1haWxib3g6IGFkZCBSUE1JIFJFUVVFU1RfRk9SV0FS
RCBzZXJ2aWNlIGdyb3VwIGRlZmluaXRpb25zCj4gICBpbmNsdWRlOiBzYmkvc2JpX2hhcnRtYXNr
OiBhZGQgZXF1YWxpdHkgaGVscGVyCj4gICBzYmlfdXRpbHM6IG1weHk6IEFkZCBGRFQtYmFzZWQg
TVBYWSBSUE1JIGJyaWRnZSBkcml2ZXIKPiAgIHNiaV91dGlsczogbXB4eTo6IEFkZCBNUFhZIFJQ
TUkgYnJpZGdlIE1NIGRyaXZlcgo+ICAgZG9jczogYWRkIE9wZW5TQkkgZG9tYWluIGJyaWRnZSBk
b2N1bWVudGF0aW9uCj4gICBsaWI6IHV0aWxzOiBtcHh5OiBGaXggUlBNSSBzZXJ2aWNlIElEIGxv
b2t1cAo+ICAgbGliOiBzYmk6IG1weHk6IFJlZ2lzdGVyIGV4dGVuc2lvbiB1bmNvbmRpdGlvbmFs
bHkKCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5r
cywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
