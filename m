Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7569F606A31A
	for <opensbi@archiver.kernel.org>; Wed, 28 Oct 2026 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bJ2ovA1G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=gAKZVoSS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mbiRJ48M0AkIW5KAYgBfmGkRh94PYEs1qLieUQDfSTA=; b=bJ2ovA1GayfZIHM7hrYE95g75N
	TJKp+qKK/sc2Dq0Vq9qD25/0e3xGrhp/8hDH4uAq32tmWomKiA6cH5XyttNHxF/Lq45gxbc208fZ9
	G/Ve6TD1zy7+Du3bUHzffElf75GdwrhQPOXc1mGdVujVwmSoq40tInK+PzzqsX5lBfxoJn7OZIr9P
	3qiSuJItmHmd0dxgReiFDsR+GS+9BRS9KDShgLmffsJwhzdZxn8LQ8y6S75U/7txdNNbf23ZYce+n
	+iDIuJJqcawIE9u7wQMbL9jqAAsCJjfs76M5BdMxh++KrqdneeABGK4p3N+g6pdWizsrJC7PsFMFo
	KDpPshNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1a0-00000006qBT-1PV9;
	Wed, 28 Oct 2026 11:12:28 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM1Zx-00000006qB4-2egH
	for opensbi@lists.infradead.org;
	Wed, 28 Oct 2026 11:12:26 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-48b060ec084so493944f8f.0
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 04:12:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793185944; cv=none;
        d=google.com; s=arc-20260327;
        b=K9Lfb5CML3c02xYQLPkQaGH3NqDvjxjRKbvMytGieuFM//LFuM3aMG8Z2a0wr/ggl5
         baOZOfiuvr+cKKRxn8KoQojNMf5Oy/GB+mfER0CSe6ZC0GB3sZtz6sRLhJKmlLkEWwYv
         9X3jD4Q2tKEaqHhkvFpGrbbTb85iR2hsMPIwUmSCUp7REe6MMl7h9V3V1ihGmQrxPiOr
         ZRL1HLh+So0v5CIYKI4VlLpFAW8DUauf1v8ni8+7MfQvDavZmNJwn4OcZ9eFpc16AnYo
         KFkztjXGySNYIs0uen3/+JTjXkIRxM7piACJ8bD9zz53TJmYhfEdAor/z1xY2EWCq6cO
         ZvIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=60YAyeYS62/f3VR0isKUVDLK33LCgZxrA9qpPylPgDU=;
        fh=s0V2QxfkZ31uI08A+gYD94xQ3QEn9NHnxJRAVF9iZzc=;
        b=FkYUmziGqF5ob97wJeLvE7RSOgLzHMTk4j8+OX4mAUBBkEA2V/bwpNNRPsv93rrpRo
         GkdR5Ozlt95u4Xeofw06D+tAFVxJ6AyT2rG+IWXN06+B+nVd0B37WhMMnG90+FCtCZuh
         oyk5WhKhyH5tBjtaLe+gE1+7O2bFJHc/w/aYYBauCBjQu6zWUrCtKqTOqMMMdy6KHHx+
         eXP5To+FBoO2b+3RoYHmQJRkTdhN+B+P0JKHwGmLyX8YKHvJN10AH5HjzQ83HIolqSWL
         4vb5jY2VxE+nFUELTrh3kaEO17H3xZhtqpKkwI6CO8xRUNZZu9lwszqULWiDIHuyjRot
         tKPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793185944; x=1793790744; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=60YAyeYS62/f3VR0isKUVDLK33LCgZxrA9qpPylPgDU=;
        b=gAKZVoSSaZ+3Dn+/gm/jg8LCTuPAGm4cQUDNwXnv3Q6i2n1TPTgdrDuhnHSpVLmbAr
         /htherF3uPVLJNFkU3OWxaZh7ZW49PfeB+V4CrPZTWZGT/+tP60Mr6OCAve2bKAxi7LZ
         GOe6EH8I6cmaiMuWz/h1HStT9t1CdrrJ9ERfK5UjE+0Dm7YfQCBJMrd+lIcE3U984g3W
         kj2cmv0T6Fi55HFG2cHx62ucTBqZEZZJ/ko2ZGMu4GRxjfgShWxurznwmZMAItjISKrv
         hPlmXJ4rDtDijRcMFjhhcCzEzoeqAD2FM8QP2NtklFrSYDq2LbVMOR35yP2X0de+Zhpr
         1jpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793185944; x=1793790744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=60YAyeYS62/f3VR0isKUVDLK33LCgZxrA9qpPylPgDU=;
        b=kchjRy4CkmRBo8J96pjXvNQ1mPZUa1vxz6hjiqPZuxhIO0ji92M0ntPUYaM5KqFaq3
         Agnt8uirgAmW9Xgwd8cVzXzsE+NiUPCUTgFJ9snPYyRyOIqOiOlX/59sTooCIGSe/Cdf
         1xlUhgs7Mz9rkljVC6fTw4864RE8DjjnUionhf3BQLyDj2alkn8PNG7Pf4Sg4Os/wB0r
         AzIM305g8URxSHMwNwcZIKp7ONiEbf/bnv//nS+sDPSZ3TzxBhoZiE3yj5e4MoGxRxaK
         hC44WPGgovefFIFOROl7ZusGel15kegWF4aDCxKcHZyzSMyN+tI4Is210U59tbCsQW+W
         6LwQ==
X-Gm-Message-State: AFq9FYI+SJENhGLapDWzldZEuZcOeaC0gkjGgj7wIJhIURAPXukPMZFX
	Ey5iNV+DLDPAiePq5NHMr/s6aai67qg7wcZfY1SkGLXrX5BFl1hHvBBdzydIGV0iugJPlnzdP0W
	5V9iPpRqaAU5aY23469vHjWserdJqiaI1funcnJoe4A==
X-Gm-Gg: AYBFou0ZDJ1hd9CDTo3mQ8lGOanq5BfGEohIcEk5Cap9pVj2lDpxFHrrHBfngsIZB1O
	QRMBtQLtgZDWl8JiuW/fI9TUBipP2oVx17WLuHiHLdjfUEQwCwsxu2mXXJSrSQnp+e6XOamfQJL
	fN/XUUm6AfT43Na+jvLvNLOZEP/wQUo054MFPb1wFjfqBh7c+36DQ7tE1KPcSNJkcX+9Ao6eggS
	wiiYl1fBaY1uAqvG9MxV2+AYelNv9blvlWgxy8QR1QKBNtxWPj0DdxIFZunzYRxgr8HVK1hBHlC
	0RE/F6fyoS6yM0ornBJGCagxqLhmJ+jpNFP29Hl2s74Avc4iCcYsuFYvHq9evdeojYYXZyFQhlH
	lkXd3ayts/qWCHIAaGLlSSmeWmpPag6ccEhTSZkM6eQZvtu0j6a9SvCI1B6181kDt5h6NloxWcE
	OXR+OVnYqRTxo2ErbNIXNsHURmbN9uEIRbwxMMLvemo8axmFWXaoOgRnk=
X-Received: by 2002:a05:6000:2dc3:b0:48d:ee0d:8b3d with SMTP id
 ffacd0b85a97d-48e5d5979b3mr4710779f8f.28.1793185943682; Wed, 28 Oct 2026
 04:12:23 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027083509.1076577-1-peter.lin@sifive.com> <20261027083509.1076577-8-peter.lin@sifive.com>
In-Reply-To: <20261027083509.1076577-8-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Oct 2026 16:42:11 +0530
X-Gm-Features: AclHuK_r4Vw0GWlPMhD1kkBdy2ikdqci2PqmaKqkheFkr8y1pO6T2Cq5eeE-ioM
Message-ID: <CAAhSdy3KP5K804bqrB4=+tRRzruF25a06E4uxw9B6smpEzZsog@mail.gmail.com>
Subject: Re: [PATCH v3 7/9] include: sbi_types: add PRIx64 format macro
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, pawandeep.oza@oss.qualcomm.com, 
	rkrcmar@qti.qualcomm.com, raymond.mao@riscstar.com, robin.randhawa@sifive.com, 
	samuel.holland@sifive.com, zong.li@sifive.com, greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_041225_705825_91CAAFDF 
X-CRM114-Status: GOOD (  11.74  )
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

T24gVHVlLCBPY3QgMjcsIDIwMjYgYXQgMjowNuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gQWRkIFBSSXg2NCBmb3IgcG9ydGFibGUgNjQt
Yml0IGhleCBwcmludGluZy4gRXhwYW5kcwo+IHRvIDAxNmx4IG9uIFJWNjQgYW5kIDAxNmxseCBv
biBSVjMyLCBlbmFibGluZyBjb25zaXN0ZW50Cj4gcHJpbnRmLXN0eWxlIGZvcm1hdHRpbmcgb2Yg
dWludDY0X3QgdmFsdWVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogWXUtQ2hpZW4gUGV0ZXIgTGluIDxw
ZXRlci5saW5Ac2lmaXZlLmNvbT4KPiBSZXZpZXdlZC1ieTogUGF3YW5kZWVwIE96YSA8cGF3YW5k
ZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgoKTEdUTS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVs
IDxhbnVwQGJyYWluZmF1bHQub3JnPgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+IENoYW5nZSB2Mi0+
djM6Cj4gLSBObyBjaGFuZ2UKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmggfCAyICsr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9pbmNs
dWRlL3NiaS9zYmlfdHlwZXMuaCBiL2luY2x1ZGUvc2JpL3NiaV90eXBlcy5oCj4gaW5kZXggYjhh
N2U2Y2IuLjc4MGE0YzJhIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvc2JpL3NiaV90eXBlcy5oCj4g
KysrIGIvaW5jbHVkZS9zYmkvc2JpX3R5cGVzLmgKPiBAQCAtMzQsMTIgKzM0LDE0IEBAIHR5cGVk
ZWYgdW5zaWduZWQgbG9uZyAgICAgICAgICAgICAgIHU2NDsKPiAgdHlwZWRlZiBsb25nICAgICAg
ICAgICAgICAgICAgIGludDY0X3Q7Cj4gIHR5cGVkZWYgdW5zaWduZWQgbG9uZyAgICAgICAgICB1
aW50NjRfdDsKPiAgI2RlZmluZSBQUklMWCAgICAgICAgICAgICAgICAgICIwMTZseCIKPiArI2Rl
ZmluZSBQUkl4NjQgICAgICAgICAgICAgICAgICIwMTZseCIKPiAgI2VsaWYgX19yaXNjdl94bGVu
ID09IDMyCj4gIHR5cGVkZWYgbG9uZyBsb25nICAgICAgICAgICAgICBzNjQ7Cj4gIHR5cGVkZWYg
dW5zaWduZWQgbG9uZyBsb25nICAgICB1NjQ7Cj4gIHR5cGVkZWYgbG9uZyBsb25nICAgICAgICAg
ICAgICBpbnQ2NF90Owo+ICB0eXBlZGVmIHVuc2lnbmVkIGxvbmcgbG9uZyAgICAgdWludDY0X3Q7
Cj4gICNkZWZpbmUgUFJJTFggICAgICAgICAgICAgICAgICAiMDhseCIKPiArI2RlZmluZSBQUkl4
NjQgICAgICAgICAgICAgICAgICIwMTZsbHgiCj4gICNlbHNlCj4gICNlcnJvciAiVW5leHBlY3Rl
ZCBfX3Jpc2N2X3hsZW4iCj4gICNlbmRpZgo+IC0tCj4gMi40My43Cj4KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
