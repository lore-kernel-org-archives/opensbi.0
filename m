Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 038FD606A31C
	for <opensbi@archiver.kernel.org>; Wed, 18 Nov 2026 09:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2odDrL/G;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=summations.net header.i=@summations.net header.a=rsa-sha256 header.s=google header.b=B0GrJSpB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=l91R00qlkQkWLbFUO0LZa3RlLIh5QSeUIqvPU39Z+dg=; b=2odDrL/GK2eHL+SmjzWmqnuWNO
	mCLmaJbi5JIRKObpVVHpuE3X6mpHUVlFUxJcfQdnWHSf/cV0oRd187ZY+o4FLNJ7Q/s0iNzEop2lQ
	S/wXW7ShWcSt7cqpknshoqqgH0furyEPX5AMr1szx4y08JtObk43O+A+qT+X+BkfqDQY5L1NVeIQ3
	mbDvYtigLGglT/FPG9fdkIvNuNYHO62deMNYmG/1gdubbJT3u8389IDueYdsLgTC0Xf347N1HIV87
	V4KivL499tYbMXaeiidFBlN2uVpuxMaNZiXTJH145A6wbTlioU4IC3FvjFhdvIDswensPFpxm2GdF
	uZ9wAHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbwi-00000008M7M-0cen;
	Wed, 18 Nov 2026 09:27:16 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTbwf-00000008M1T-0jSA
	for opensbi@lists.infradead.org;
	Wed, 18 Nov 2026 09:27:14 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-8b32daac9d7so4514227b3.0
        for <opensbi@lists.infradead.org>; Wed, 18 Nov 2026 01:27:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794994031; cv=none;
        d=google.com; s=arc-20260327;
        b=bnJ/KB+9jaYsF8L1NC6FzDR1nwP7jvpRvDjmNaAUDx6lm+Lk3rWlxDtxtxE8VyHp8I
         EQq13TEgfnUYYbPukZHIA0yH2M10VBh5U720ZiHu12xZqyaKvBisuuukM0xmWfogYD2A
         rSl8ZVVVuELfUVEia9CSD6Y9AzLmM/BoosYd4xHxezEb0NACbHN6xk2cX/5g3UySTO4f
         4Ae8L0lGv5oFmy6uWydwZa1G93pnugytQ0A/OHRlcAjeAyuN9mzZ4lWLaK7eHa956QyB
         j0hn/jwu/Vxxn+EBbjzFVL8u9PRCtXGolvVRoGtTfvBSr2oKDC/Du8+KfpMopIVpRhnY
         QUZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sG3lWXBdPZAmxDVFdJAE1clfyo1hmOX7pzmSzAYoivY=;
        fh=Ck9X1cQ6zEXteMjVk79ib6BKr+LbI80fo5ky5B2JXhI=;
        b=eiZJ0tCrGasjCgztqZUIw0BaSP9tKyDsksh9MeibJH9ZCnE5dhWd8EgoEyehGf/RFw
         iDtT0Sd5t3G9vnVDVcy3WN7wX2/fkrhvE+bBRSRM03SkuoiOjjwONxQ2h8k94OQzJEtg
         mFgtbJ9n14Q5p67eYohh4HUQgBaBUuHXN+Z/IoslqQ/6llEz4lm7/BGnduA4NHS8D3bV
         METlksj/ndPl8Z8RM2DkqjSWeNQ4E+mggizVFA/CgsmCjKJvMxM9eSQYCjpNa1jbixjp
         Nknkef2mRtVesmO98v5CZhxlbQpFr1Ik0tzuWJopMNU1DUGZrLxPdX1EdnPhbEsoy5Ux
         20iA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=summations.net; s=google; t=1794994031; x=1795598831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sG3lWXBdPZAmxDVFdJAE1clfyo1hmOX7pzmSzAYoivY=;
        b=B0GrJSpBtl7nBq2xohD0lPMExUmceXiHPoVGwVyF5jkqsCb91D4JaQK/op8IejVDYu
         +BKc7cPfGo48N+i63GELsogFBrDl0kIU+5kSqyNc5ECKxD1cWOcx4TnF03JOpwmeXdlC
         KhBPU6X94it8dT8/JX4Jw+JuuQrqdHZ+pJkBDjqjr3sO/DsXXazVTIT7bE5hAOEkmoM1
         5OAb/iXrRAlIm6/AkR1KxnNI75ghNGHV4Q5OyAoXkCqyotUVpBolD/nknvodDdy/K37C
         YX3BbIs6frAyeYPYkM18wjE7bARcYVMotLurCjSMJajmbM9/XJi41ap3DZ6mS6QZhKXI
         D/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994031; x=1795598831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sG3lWXBdPZAmxDVFdJAE1clfyo1hmOX7pzmSzAYoivY=;
        b=1wwkFb3ZDzBMCguRRCyROqP8PsRxIicRQrAMnUL5uqF/Qf0tB6bE0aPzKwCfgpgRhT
         vjOpMgu2iBxK33MzzSYb91lGXkuuYGV/2Ar0O+X2//FVCboBMrc5ZESsAYhpOf35L1Oa
         8Fe2FjReBv7+2yEMdH+8RhVOIGY0bWireP0Udnaf9QNnKnwwAuHDSfimOcl+NIuHAacu
         qKdUJOvziwLOZ42PGEwB2bnC0dEoiUsv4n7OwxK5oNU+FgAvpvJoP17wSe8LADajDBXa
         NtELQoTv8vMrVxqAYa8ElQo6HrTsclz7af0isRHPGIY3j/7t6Z+iGSQrN7x+4dpl6c6s
         m8ag==
X-Gm-Message-State: APuU4Z9w3XqcwuRNKKI/vh4GpLquFMvpXrLKyc1zwCjF0WzQFV1W/FAi
	yeNmWyL5kPyTFsxOILy5VTRwrXZADmXahEX/DcWx3oxN2euZMF6U/1Pe21172rmez9xXhAL4Ml3
	/k02Ntrp/tlUU0Frb8utrXBLEKXpc0hwQhimOh5Zc3Z4=
X-Gm-Gg: AZFdTZfXAoD1oLxyNcpDnzDDY4f6DjGDmINsUWZGa8Sim1TB3f/1x08MjLJtbMlBYTY
	xrUYcsvIixNp9/wDtfdpiPfGQBZjH4W4bm4zJjIlRanvrhE1XNouvXwIohoJQt4iozkgRsWs0Pv
	aRvmaaNWwDprntv5MWF02Xv9SO2PFmf9es5u2nj+hjaMYvhWQvvkoU6QQuldRIipUHWtIN5DM7o
	e8ZUTWe0ds+XjxUjmsiRH/liaTlY88wdhHNyj06tzgYqE3ZP5IneeReWfTLQqFQov8nMGNPOUXp
	ksTg2/yGHbVpaLpuvAUiOHdDL3w7+r1Hcz/WyR9Ir+ld36TP7eP4bij7MF/2qWvkCXm7yECwmHa
	Ct2X86OCE0MRsYbcVJ36Yk9ROp5OQ1bu3JdUyB2dOUZTBllSWP1LO9Te5DTr6V/YswduRIKu25F
	3wK/Zcu5IekMHYmKvCMUxzg+AQpQ==
X-Received: by 2002:a05:690c:6108:b0:8b1:60a0:c311 with SMTP id
 00721157ae682-8b4fedb7176mr9422727b3.33.1794994030802; Wed, 18 Nov 2026
 01:27:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261117184547.1145243-1-pawandeep.oza@oss.qualcomm.com> <20261117184547.1145243-3-pawandeep.oza@oss.qualcomm.com>
In-Reply-To: <20261117184547.1145243-3-pawandeep.oza@oss.qualcomm.com>
From: Rahul Pathak <rahul@summations.net>
Date: Wed, 18 Nov 2026 14:56:59 +0530
X-Gm-Features: Aa3M54rbtwQPRi9q62xV-fw-LG4XThz1FNK1SO41oerI-BEWoKHnOm9I4KNH5PI
Message-ID: <CABdD5xmT3WpTO1u_OM4MZU4g1=W6yxn4ToybBXcRgDh+T-YqYg@mail.gmail.com>
Subject: Re: [PATCH v9 2/7] include: sbi/sbi_hartmask: add equality helper
To: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Cc: opensbi@lists.infradead.org, Anup Patel <anup@brainfault.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_012713_251748_E7BF5EC2 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

T24gV2VkLCBOb3YgMTgsIDIwMjYgYXQgMTI6MTXigK9BTSBQYXdhbmRlZXAgT3phCjxwYXdhbmRl
ZXAub3phQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gRnJvbTogT3phIFBhd2FuZGVlcCA8
cGF3YW5kZWVwLm96YUBvc3MucXVhbGNvbW0uY29tPgo+Cj4gQWRkIHNiaV9oYXJ0bWFza19lcXVh
bCgpIHRvIGNoZWNrIHdoZXRoZXIgdHdvIGhhcnRtYXNrcyBjb250YWluIHRoZQo+IHNhbWUgaGFy
dCBpbmRleGVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogT3phIFBhd2FuZGVlcCA8cGF3YW5kZWVwLm96
YUBvc3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBpbmNsdWRlL3NiaS9zYmlfaGFydG1hc2suaCB8
IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKQo+CgpSZXZpZXdlZC1ieTogUmFodWwgUGF0aGFrIDxyYWh1bC5wYXRoYWtAb3NzLnF1YWxj
b21tLmNvbT4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
