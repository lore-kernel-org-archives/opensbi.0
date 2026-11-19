Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26769606A325
	for <opensbi@archiver.kernel.org>; Thu, 19 Nov 2026 12:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vy9Gff8M;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=sqC++1In
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tlXO4c/Jqlm9zjzFyYGW9NayPnhagfdMfE1eAxpS+/E=; b=Vy9Gff8M+IFiyIrA9Bxmwu05Df
	qQQuPYgri5edgFi+lSDXyIvvC7sxc16EaWIzMYxrkabbvyqiUSj+Y843KX2g6zMy5Sk6MVW7umswu
	pqfCbcozAe36oswOgTlduW80XsVaIrBMrE7l3cXvCQTC9EXk8M4Xsz9Aym1MQ8JukQuWPzwsoFXxI
	P0Wbu1MKWh+XpSSP9+f11egyLU51Sd3JdKIHvttqEsP01J+GdoAykjGfm38cDwrBcj+6URUVINdfY
	ZOxxCDrIjtoGzbo0ODHlNcJKV6aONoa3U8flc2wGOnkhI9jvz4YBx0Bhxd7WilQPO29ZpBe894Spi
	ZB25gIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1RQ-0000000BtMq-1lEP;
	Thu, 19 Nov 2026 12:40:40 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1RN-0000000BtM5-1z83
	for opensbi@lists.infradead.org;
	Thu, 19 Nov 2026 12:40:38 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so22736875e9.3
        for <opensbi@lists.infradead.org>; Thu, 19 Nov 2026 04:40:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795092035; cv=none;
        d=google.com; s=arc-20260327;
        b=qe154e5jaT/Zz3OWADrLEu14JEBacqJ72luxFrRMVSnV82tnE6KLDEnDu0V83YffRl
         SDnAuLXCx5hH5rf9Sp71WKw5P1/Bw6+YyLx4bIRkEoDdCBKDGrqVD3ph2KgLmdzm9H89
         nVVyBAB4eygq87Khnn/ThKc8EIjsL8Bk2EfsmB7XzVuUWqBncZtKjFY+vYdlcu73IFoH
         h4711K9lCYaf+eFmm78qyo8tgG7yuv/NXYaGjuDRvG6cOZ9z5pIE2jSPsVEVaecjr6Go
         ycmvBq83vTEb+E6cxHwDLAG5Ok+YIoqUSBUb5nuNnskCvr174gcAsQBz1HhxKL43d6mf
         fTzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cxn7rxr0o5hY9DEHlvNLrxqvxSU8vtBeqe8IQNaCgh8=;
        fh=DBGZmiR6djWg29J77zsed/CHwCDZ0Ays2W/Mc340CsI=;
        b=bj8uexEkSDfmLPXlp9cSOtKBsMr4PkEgQOnrFhCZKoMNXKBY9n1ewkt5bLeBjox6TY
         fPLQV6TQ0706OSMShx3DlVpwhS08n6VZiOXFKYCg1dJT9qSHmW5Rn6OcMQqoX2FU1cRB
         DCpJQJuN7qUqYA+NN/KBXKT4yWOtdcGqT5JGGkCvy+CGPAC9+196yVo7lzrrV4DHmBcw
         2xZl74Ci+m1vvr2JOTCLNk/VGXiqI6i5gxNnd/Iqv4Y1JRb+BQx0+KGDEO/sY5WeUrWV
         mcnzMxLCIrm6Nk765jFf9s3mPP7xVP8aBbdXHSORlizPRasKoH9+bbD78Q9gGS5+YKXI
         n1cw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795092035; x=1795696835; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cxn7rxr0o5hY9DEHlvNLrxqvxSU8vtBeqe8IQNaCgh8=;
        b=sqC++1In6jor8U0uxmS+pcKPYuZR/+zT87yPKOvCwXt1tncUN2nSa/TXI78u30M+nR
         riuTI84kc4Ri2Fejpq9FfJWqEumVw1inkkc/wWrNvATNlKSiGp7ptscsPl1dL8V8pmW8
         hE92i0ZODvCBJNOAmDAUpSpKUTvhoyrvHuWlulsDilPZF5PKHCro9GjBODKZziOjKNFU
         61f3Dofe8j8382fDp3CYQA5TbwHel6MYDnBzvmT2XM0F5AJS4w10aJXkzX6MI46bTo1e
         0mtkDoZke/Om87WiNPnQOCbFr6CVuGbhVDBNzh2bk9pBbaIZQOvFT6H6RPyRYAxKEjgD
         la3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795092035; x=1795696835;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cxn7rxr0o5hY9DEHlvNLrxqvxSU8vtBeqe8IQNaCgh8=;
        b=pgFpeTmbRpZE1ZLKTfQ2ZIS36CQVSMUBuE6fbDAsJN5dkNQ/BBabSoObp3mLCc0ArK
         ERFtf9wLJ1DXtaHQFC/kQvYj2+n8DsfdkJrcPY90VDCQ4MhCPD4NAmX6qXn/1KWWP+iH
         pHeC+vMouMR5/ELUQLPBOx5U5ngBuR+UaYqDQCnUKbta49cVFc2VUqUX8XA6ZSsfk1Di
         Hk+bWeK70CVa77+gCFCjL+ZJeW9kpSjDxbJ7NAWQHfB28ehnK2k0hurNnHZuIQYfSiJE
         y9gNp4Fres4/k4Jqyf/UAh+WvmGr+ASZ2SUeeUwQN8dQrr4Q9w87sYKXFqoapE3hckor
         g3zw==
X-Gm-Message-State: APuU4Z9Sod/Ir5GC9BhDUhFmLGYuqU2gQ/gk7RsHhFE6TZiBlrQajfkj
	GC3bqPGnhI2WxW3CK2HxCI70s/cfBcx4CXJGr/IUBThJmKWPo4WiECQoqoHqnfyNenh3LD/N7kA
	LVF8nF5864B46VvdBy0HNQ63kUDkGora7zaFfd/7l1w==
X-Gm-Gg: AYBFou0IN8Xij72ba0lVWcrYzgQE8+HfacBHZcAIgwXu4dkg2X1Hx0aGyEg1/iyIQHO
	dIICIxP/9oK6lW1S2XLdu8EPGAyAyIWhqLWnPvH9l5L8Fr8UCccKHytMr7HUl7xtXUR1pu5Nirc
	kw78v4WdvLVj6MZzWeVUk2kZW51iE2S8FC6znqYldCRBzei7pTwP566ijwte+C79BHjCzBvaR8t
	zAiGn++ZlJw+iHbozZna2Mg36hyZV4ssf/Cyfhj6nCMFLjOGdolyifcGFHA56WRqvm8dpC9Efqp
	6l1UVo+ziH4wj/unYcfPTFZwjfErCXD/+RsliSqhs0EOhta5+fxXjxP9+g1JJu+XkIERGr+dG3n
	vJj7NIuG+97xZD598WwRlKz99Au3VWw7MUxLSqxTRRhUesoH8QAro8CxADkhLg2Ukej4e7e/EEc
	H6mKgAhIzxquuHLFl1ScAG6Dy+Qu8ijP/hSh5bVUxwBB15oQ2IqMBi
X-Received: by 2002:a05:600d:9:b0:4bb:81b2:c801 with SMTP id
 5b1f17b1804b1-4bb81b2c809mr62994545e9.20.1795092034841; Thu, 19 Nov 2026
 04:40:34 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118215549.2499040-1-pawandeep.oza@oss.qualcomm.com> <20261118215549.2499040-8-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261118215549.2499040-8-pawandeep.oza@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 19 Nov 2026 18:10:23 +0530
X-Gm-Features: Aa3M54oz_CHxxFpS7-9vtkMSecrGIWtFlb-fIKjbkU5pNPOHXA08iacA1Yd8Lq0
Message-ID: <CAAhSdy1nPdWE4+dadjrVh98fWyg=exAEkafQiUoW2WTvZAcUfw@mail.gmail.com>
Subject: Re: [PATCH v10 7/7] lib: sbi: mpxy: Register extension unconditionally
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Rahul Pathak <rahul.pathak@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044037_532821_9509A3F0 
X-CRM114-Status: GOOD (  16.49  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgMzoyNeKAr0FNIFBhd2FuZGVlcCBPemEKPHBhd2FuZGVl
cC5vemFAb3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBPemEgUGF3YW5kZWVwIDxw
YXdhbmRlZXAub3phQG9zcy5xdWFsY29tbS5jb20+Cj4KPiBSZWdpc3RlciB0aGUgTVBYWSBlY2Fs
bCBleHRlbnNpb24gdW5jb25kaXRpb25hbGx5LCBhcyB0aGlzIGlzIHRvbyBlYXJseQo+IGluIHRo
ZSBpbml0IG9yZGVyIGFuZCBhbnkgY2hhbm5lbCBtaWdodCBub3QgaGF2ZSBiZWVuIHJlZ2lzdGVy
ZWQgeWV0Lgo+Cj4gUmV2aWV3ZWQtYnk6IFJhaHVsIFBhdGhhayA8cmFodWwucGF0aGFrQG9zcy5x
dWFsY29tbS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96
YUBvc3MucXVhbGNvbW0uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVw
QGJyYWluZmF1bHQub3JnPgoKPiAtLS0KPiAgbGliL3NiaS9zYmlfZWNhbGxfbXB4eS5jIHwgNyAr
KysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZWNhbGxfbXB4eS5jIGIvbGliL3NiaS9zYmlf
ZWNhbGxfbXB4eS5jCj4gaW5kZXggMGE1ZTM1MjUuLmJkNTU2NDBiIDEwMDY0NAo+IC0tLSBhL2xp
Yi9zYmkvc2JpX2VjYWxsX21weHkuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX2VjYWxsX21weHkuYwo+
IEBAIC01Nyw5ICs1NywxMCBAQCBzdHJ1Y3Qgc2JpX2VjYWxsX2V4dGVuc2lvbiBlY2FsbF9tcHh5
Owo+Cj4gIHN0YXRpYyBpbnQgc2JpX2VjYWxsX21weHlfcmVnaXN0ZXJfZXh0ZW5zaW9ucyh2b2lk
KQo+ICB7Cj4gLSAgICAgICBpZiAoIXNiaV9tcHh5X2NoYW5uZWxfYXZhaWxhYmxlKCkpCj4gLSAg
ICAgICAgICAgICAgIHJldHVybiAwOwo+IC0KPiArICAgICAgIC8qCj4gKyAgICAgICAgKiBSZWdp
c3RlciB0aGUgTVBYWSBlY2FsbCBleHRlbnNpb24gdW5jb25kaXRpb25hbGx5LCBhcyB0aGlzIGlz
IHRvbyBlYXJseQo+ICsgICAgICAgICogaW4gdGhlIGluaXQgb3JkZXIgYW5kIGFueSBjaGFubmVs
IG1pZ2h0IG5vdCBoYXZlIGJlZW4gcmVnaXN0ZXJlZCB5ZXQuCj4gKyAgICAgICAgKi8KPiAgICAg
ICAgIHJldHVybiBzYmlfZWNhbGxfcmVnaXN0ZXJfZXh0ZW5zaW9uKCZlY2FsbF9tcHh5KTsKPiAg
fQo+Cj4gLS0KPiAyLjQzLjAKPgoKVGhhbmtzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxp
c3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
