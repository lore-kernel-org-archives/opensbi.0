Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D79606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 08:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a/XTfdJR;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=NgW609Wh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oJgUuZ9JZeXLpD2sVNOO51tpHEeg1WYW5um9d+r6Uuc=; b=a/XTfdJR6hFvVln0S1wk4djYBl
	82coQgH6bFIOB3iwiEFtC9hnSpaYu6by2zHfcmYpk6MZQVy4UwNVymQRtafiYrLaWPzcznwWjP3uM
	FhqA6MVbon1XgLat2IF2Px0bAffQmdEk/Rys2CqfDMN4Fs6PKRIxB2rDRKPCmhyfDGRQZSMR1YJ46
	w9HJWS1Ln8ObQCp/MCoI0HyBWDu06QXFtuQADZTTsuROeuyAjQtUONpTD/RSawuhZuhEAfFGIH3oW
	KdO/t+v2n9orf0wZO1zxcGYa3XIGwsPuEOw5Lw0Uxg32GY8MPHupOxvNC8bzisjYMbYrQ+ygbHT3W
	9yGQ45QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtgX-00000000spI-1HLW;
	Sun, 25 Oct 2026 08:34:33 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtgU-00000000sov-3au6
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 08:34:32 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so1243957f8f.0
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 01:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792917269; cv=none;
        d=google.com; s=arc-20260327;
        b=FqwvkBujHyHNZ3K3LxgfThk9NJ9CgQuJwOA2qAe0iOhk8q6yHv4e/2qCN59Tpg2kPz
         gkgR69q46X86zZ5Y+6aWii6NPEHD4KS9QBnV2PUlFvCNlEAmzH+y3ONe0KCZOUz67Q+t
         3XHOH9pRYUv4Y4HzwTNYUXoBo/UfJ1KsBkJgAh+o4deI0EPSv32l606HpZKyfiWRCgwQ
         gPcx8HBb9+u+OmuS8P8J6DcDzMCagXNkvISXDB4yS+MjCsh9S+cvuwUy/AtwgNFCCmZG
         IVkH2qMgEfhLIdWBbco3UqYGPhSUSPO9Kv1sbN6/xEdIQVIx74q2k6K/xjF9v3+Ek3di
         u1MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/H282RG5V7zUEAlW50SNQrD/WE7knStQvW5IR7GaLYQ=;
        fh=A005cFjBBNkI8pjlR1Bm9S+xnBM8OAWlHgDOakxaXzw=;
        b=KVQyxkrU1dUcTopkKmjwXs4ob9HZ429yYODQq1K4Qinz6DJfX1QjL+Ao3zL6Dm7qNv
         iTVlDXvmN8cQRlU0mQNT3NyM1oYI0mpfMXceC+K9WJKbFtBqWT4uuzk+zaoMo04dCJ4O
         Hc2pgrQmYFEx0L1hiMdFfdxPO5nd+QnEQwpKs/b2dRPCKgaFxw8nXGYF3cr+kJU5boNk
         O/TX99qDsc8oufHNFiAWESlReepWQebr36blbYR4UATripmUujHX1JOwOxvlmX/8sd6B
         fYhydA78Xt6xXB13iXBnjbMKXpEMDdH1QpfcEgNNStqiq1mUM9SHvqLCXdRUM5+3i3g0
         WTbw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1792917269; x=1793522069; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/H282RG5V7zUEAlW50SNQrD/WE7knStQvW5IR7GaLYQ=;
        b=NgW609WhPLsit8Ub2X8WFinULCZ/vIICMbsdzVMHf8oxwg0hIOlmTZwOxgOZ2M2vyP
         2ZyIRExDSRnjsyPOebGypiBbtbOPl/sh5dMx+JFKw2Upiic1uuXvGh8qfALKSHorflJs
         YjT0FfxuakseiOE793pRr7Y66OJ3wGBBak79xKWj9H27sDUU3jYScJhLG6dmxztvMwlz
         TSnTAV/K9wSa5xeqXDrBo+hL7OLb7A/lPjjpk42ihPFAVynkDrxLNP5AwvHRbvODJHBs
         fcVp+D4hue9TO9LsGaUokD2oUP/Dz8V1IPVQ1Z0V7AZ1eltN9WjwoFokRerM80y9cRWT
         cQSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917269; x=1793522069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/H282RG5V7zUEAlW50SNQrD/WE7knStQvW5IR7GaLYQ=;
        b=so++CgD1Y1Z5yQKGSEnKZLNJcwpm0kGBBlWN6dBjrKppmLYaGqeixsjXpEJBLwxPZH
         YDWww5UkhSC7hC1LLiHAbzjPt2q/d9uoc4drFKXXDcgld4XyxXX4e264AEDyn6qtTMlZ
         KZdyPoTXcV7nZdxmJDyl7PtUX+auTFhDnGuOhTcpNxgA1k6k7YGmT6FXFbZB2DwmJ2Wl
         QM58reJ/50i7TIjkMVrnF6bDSZCTj+Uu82rW0xcgTW/08ypPpSfjQTXaeGMC9JmvDlyn
         T7PkpXOQMgeiqtUeRq7iVy6Ma5JxkL45ZfSxrsHriv+c1TpyFkDmeujd9gqP7lkh2C1b
         DabQ==
X-Gm-Message-State: AFq9FYJGlU4PBtJIyBsxLkwodpdIPvzYXiew8Hji3NkTMdC6Tsp0EP7A
	GlTurgaHHSMsI8Kn7yOI4l2X0LiLVsbtLnw0gl5zAbhybRxAFxNSNGIvOZqEmbOKSqg4RxKRXRc
	nAFddH9BRkOCN2yhYizpAL81yj4/2QdadZEuI0O/BTQ==
X-Gm-Gg: AYBFou2VAJpgwLVMJE1p8THc/9N8rdGmNX9ZSb7u5twADoTlbFLIEyrhEHSm/ojmnzZ
	4ZKT5fhBeUpb3f45XlEnTMIg8JDwl/E4jNCs8oGbr0zQb9WwhgCMxZvTq0DFn1kRJ3k3jtcbBk2
	Wz9GAXFN4UedQcXQdP7iWhLcFJ1MUYWdVcUk4Nc/fUEYtMIT30ErNLWm7QOvD65UOTDPLBgW3YG
	ougp0K9/0CqqYEyaxz189eGDIgL7T7igsa+23zBkAFYzLJr7OYjAfxFBiouWcNgIOMPmxKIIZxq
	zm3CBjROVYC+xX9/MrSuyt6v6p3romLeSWABHcTWap90MNVpuwZmtXNSedltuXAuW5gSsqQ7Y2l
	04jDxjV21GriqPxfGIv2QvVkH+8oY4L67FXRT1q559kXZBEEsawkN/JnSkjFrQailHLeN3TCf97
	fNTEDys2Vv0lLjZv0pceK2J8kz/mJBrWn9/7UvBPcB0ZmbP4Zfjw1alpjD
X-Received: by 2002:a05:6000:184f:b0:48b:226:839 with SMTP id
 ffacd0b85a97d-48e3ed26e05mr7608339f8f.14.1792917268589; Sun, 25 Oct 2026
 01:34:28 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260922030633.10886-1-sebasjosue84@gmail.com>
In-Reply-To: <20260922030633.10886-1-sebasjosue84@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 25 Oct 2026 14:04:16 +0530
X-Gm-Features: AclHuK_NCD2d23I3QmJdXkosoeao6GSz5t9K2rIEGbcWgY7JMuJODTFTj4pvWis
Message-ID: <CAAhSdy3psnvO6ynCOBdb7QVxSj5w6=6P_BEk4BHqXrs1ZD9YLw@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi_trap_v_ldst: fix mask buffer overflow on VLEN > 128
To: Sebastian Alba Vives <sebasjosue84@gmail.com>
Cc: opensbi@lists.infradead.org, ganboing@gmail.com, apatel@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_013430_928381_BF171833 
X-CRM114-Status: GOOD (  21.44  )
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgODozNuKAr0FNIFNlYmFzdGlhbiBBbGJhIFZpdmVzCjxz
ZWJhc2pvc3VlODRAZ21haWwuY29tPiB3cm90ZToKPgo+IG1hc2tfbGVuIGNvdW50cyBtYXNrIGJp
dHM6IGl0IGlzIGRlcml2ZWQgZnJvbSB2bGVuYiAqIDgsIGFuZCB0aGUgbWFzawo+IGluZGV4aW5n
IGJlbG93IGRpdmlkZXMgYnkgOCB0byB0dXJuIGEgYml0IGluZGV4IGludG8gYSBieXRlIGluZGV4
Lgo+IGdldF92cmVnKCkgY291bnRzIGJ5dGVzOiBpdHMgc2l6ZSBhcmd1bWVudCBmZWVkcyAidnNl
dHZsaSB4MCwgJTAsIGU4LAo+IG04IiBhbmQgYSB2c2U4LnYsIGJvdGggb2Ygd2hpY2ggb3BlcmF0
ZSBvbiA4LWJpdCBlbGVtZW50cy4KPgo+IEJvdGggZW11bGF0b3JzIHBhc3MgbWFza19sZW4gZGly
ZWN0bHkgYXMgZ2V0X3ZyZWcoKSdzIHNpemUsIHNvIHRoZQo+IGZpcm13YXJlIHdyaXRlcyBlaWdo
dCB0aW1lcyBtb3JlIHRoYW4gaW50ZW5kZWQgaW50byBtYXNrW10sIGEKPiBNQVNLX0JVRkZMRU4g
LyA4ID09IDEyOCBieXRlIHN0YWNrIGJ1ZmZlci4gVGhlIHdyaXRlIHN0YXlzIGluIGJvdW5kcwo+
IG9ubHkgd2hpbGUgdmxlbmIgKiA4IDw9IDEyOCwgdGhhdCBpcyBWTEVOIDw9IDEyOC4gQWJvdmUg
dGhhdCBpdCBydW5zCj4gcGFzdCB0aGUgZW5kIG9mIHRoZSBidWZmZXIgYW5kIGNvcnJ1cHRzIHRo
ZSBNLW1vZGUgc3RhY2ssIGluY2x1ZGluZyB0aGUKPiBzYXZlZCByZXR1cm4gYWRkcmVzcy4KPgo+
IFRoZSBwcmUtcmV3b3JrIGNvZGUgcGFzc2VkIHZsZW5iLCBhIGJ5dGUgY291bnQsIHdoaWNoIHdh
cyBjb3JyZWN0OyB0aGUKPiBjaHVua2VkIHZlcnNpb24gcmVwbGFjZWQgaXQgd2l0aCBhIGJpdCBj
b3VudC4KPgo+IFJlYWNoYWJsZSBmcm9tIFMtbW9kZSBvciBVLW1vZGUgd2l0aCBhIHNpbmdsZSBt
YXNrZWQsIG1pc2FsaWduZWQgdmVjdG9yCj4gbG9hZCBvciBzdG9yZSBvbiBhIGhhcnQgd2hvc2Ug
VkxFTiBleGNlZWRzIDEyOCBiaXRzLiBPYnNlcnZlZCBvbgo+IHFlbXUtc3lzdGVtLXJpc2N2NjQg
d2l0aCAtY3B1IHJ2NjQsdj10cnVlLHZsZW49MjU2LHppY2Nsc209ZmFsc2U6IHRoZQo+IGZpcm13
YXJlIHRha2VzIGFuIGluc3RydWN0aW9uIGFjY2VzcyBmYXVsdCBpbiBNLW1vZGUgd2l0aCBtZXBj
IGFuZCByYQo+IGJvdGggemVyby4gVGhlIHNhbWUgcGF5bG9hZCBhdCB2bGVuPTEyOCBlbnRlcnMg
dGhlIGVtdWxhdG9yIGFuZAo+IGNvbXBsZXRlcyBub3JtYWxseS4KPgo+IENvbnZlcnQgcG9zIGFu
ZCBzaXplIHRvIGJ5dGVzIGF0IGJvdGggY2FsbCBzaXRlcy4gbWFza19sZW4gaXMgYSBwb3dlciBv
Zgo+IHR3byBhbmQgYXQgbGVhc3QgOCwgYW5kIHBvcyBpcyBhbHJlYWR5IGEgbXVsdGlwbGUgb2Yg
bWFza19sZW4sIHNvIGJvdGgKPiBkaXZpc2lvbnMgYXJlIGV4YWN0Lgo+Cj4gRml4ZXM6IGE4YmU1
ZTk0ICgibGliOiBzYmk6IFJld29yayBtaXNhbGlnbmVkIHZlY3RvciBsb2FkL3N0b3JlIikKPiBT
aWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQWxiYSBWaXZlcyA8c2ViYXNqb3N1ZTg0QGdtYWlsLmNv
bT4KClRoaXMgbG9va3MgY29ycmVjdCB0byBtZSBhbmQgc2luY2UgSSBkaWQgbm90IHNlZSBhbnkg
b3RoZXIgY29tbWVudHMsCkkgd2lsbCBnbyBhaGVhZCB3aXRoIHRoaXMgcGF0Y2guCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRj
aCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBsaWIv
c2JpL3NiaV90cmFwX3ZfbGRzdC5jIHwgMTAgKysrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkv
c2JpX3RyYXBfdl9sZHN0LmMgYi9saWIvc2JpL3NiaV90cmFwX3ZfbGRzdC5jCj4gaW5kZXggNTQw
ZjY1NWYuLjlmMWMzMTJhIDEwMDY0NAo+IC0tLSBhL2xpYi9zYmkvc2JpX3RyYXBfdl9sZHN0LmMK
PiArKysgYi9saWIvc2JpL3NiaV90cmFwX3ZfbGRzdC5jCj4gQEAgLTIxMyw4ICsyMTMsOSBAQCBp
bnQgc2JpX21pc2FsaWduZWRfdl9sZF9lbXVsYXRvcih1bG9uZyBpbnNuLCBzdHJ1Y3Qgc2JpX3Ry
YXBfY29udGV4dCAqdGNudHgpCj4gICAgICAgICAgICAgICAgIGlmIChtYXNrZWQpIHsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAodnN0YXJ0ID09IG9yaWdfdnN0YXJ0IHx8IHZzdGFydCAl
IG1hc2tfbGVuID09IDApCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAvKiBGZXRj
aCBhIG1hc2tfbGVuIGNodW5rIG9mIG1hc2sgKi8KPiAtICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGdldF92cmVnKHZsZW5iLCAwLCB2c3RhcnQgLyBtYXNrX2xlbiAqIG1hc2tfbGVuLAo+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWFza19sZW4sIG1hc2sp
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ2V0X3ZyZWcodmxlbmIsIDAsCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2c3RhcnQgLyBtYXNrX2xl
biAqIG1hc2tfbGVuIC8gOCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG1hc2tfbGVuIC8gOCwgbWFzayk7Cj4KPiAgICAgICAgICAgICAgICAgICAgICAgICBpZiAo
fm1hc2tbdnN0YXJ0ICUgbWFza19sZW4gLyA4XSAmIEJJVCh2c3RhcnQgJSA4KSkKPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+IEBAIC0zMjYsOCArMzI3LDkgQEAg
aW50IHNiaV9taXNhbGlnbmVkX3Zfc3RfZW11bGF0b3IodWxvbmcgaW5zbiwgc3RydWN0IHNiaV90
cmFwX2NvbnRleHQgKnRjbnR4KQo+ICAgICAgICAgICAgICAgICBpZiAobWFza2VkKSB7Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgaWYgKHZzdGFydCA9PSBvcmlnX3ZzdGFydCB8fCB2c3RhcnQg
JSBtYXNrX2xlbiA9PSAwKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyogRmV0
Y2ggYSBtYXNrX2xlbiBjaHVuayBvZiBtYXNrICovCj4gLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnZXRfdnJlZyh2bGVuYiwgMCwgdnN0YXJ0IC8gbWFza19sZW4gKiBtYXNrX2xlbiwK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG1hc2tfbGVuLCBtYXNr
KTsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF92cmVnKHZsZW5iLCAwLAo+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdnN0YXJ0IC8gbWFza19s
ZW4gKiBtYXNrX2xlbiAvIDgsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBtYXNrX2xlbiAvIDgsIG1hc2spOwo+Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KH5tYXNrW3ZzdGFydCAlIG1hc2tfbGVuIC8gOF0gJiBCSVQodnN0YXJ0ICUgOCkpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPgo+IGJhc2UtY29tbWl0OiAzNTkz
YTVmYWNjNGM2OTM4YjkwNDI5YTY5NzNiYTllZTIxZmM1ODk5Cj4gLS0KPiAyLjQzLjAKPgoKLS0g
Cm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
