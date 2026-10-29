Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CD5606A32A
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 06:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CuYUnKtN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=DdYggcWD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=xLXcwSRzEWhHoVFQjahCEIj6e2+99IoMvHWuUpXwx/c=; b=CuYUnKtNNhHTq+wX/bKkOYZ8dO
	WqfJafyXK8ZHm6P0IPJZKkyZUdRmrYqy/SnZDr9VIXHhQFxRGG7ATyurfrQHCu0JgRtCVl/xeEXeB
	4UFUZrhPmMscD0POIEgJV6hSG4wXYiZRa2CD9/Ul4x4fTWzOzFxHz/UHZaQhnm1esVyXQ5vtn6JpZ
	5SrbNhkbbm2lhUGGkBuFwsmUOKWONrcwudpkqfVt9348B9ygr9lHJrlAlFNuniMkLl6KqviLnn1Zk
	86DQ8TmALo/D+a6KMiZUrtsqr2r0UMD+qzYEkvgSOQo9bQ2kH5hdsJKE6nNI45v2k/Dpa+mQqn1ML
	OEkKHPOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJPX-00000008SmK-1N5p;
	Thu, 29 Oct 2026 06:14:51 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMJPV-00000008Slh-01iK
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 06:14:50 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-48c4649b35bso1518458f8f.3
        for <opensbi@lists.infradead.org>; Wed, 28 Oct 2026 23:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793254486; cv=none;
        d=google.com; s=arc-20260327;
        b=NH/pV02h+0mwupS7OhGyib7Iixm8FD+3q6DgrcPhoMHf10N/bLUo+g2AZbcHLnY17/
         dOt++Ccpx3gsupUnHhTd+rOuCiIJBq6/D+U6AjQ2pl/VXECOs9j6dME3LLbzAFRXI2v2
         ZFX7JF/XvqFndG6HbKMSnsMh0CqiP9FAu9/eZ3Y5wfXNP/SuWXUzXUMhDrkNzueuGf1o
         SPY/3zPo2rc9atvmwXrij50HTcbFphQJiw5BJQSDYm50qtuxg9HURIJtbQqT1XU6B7gl
         Zkr56HipUmZS+p1tQ66/IaUFBTsdjoYbbvUPERjp2v5qirHx1ocoRfAVolhMlcy8GfkV
         l2gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wMfOxCPlwo/RlHBHy4SArQTAJIMRFedjEu1x0yUsbnY=;
        fh=AwBXrWtsqTMax6f3gbCCubbzRiA1Mt7rtR9MaoOiSio=;
        b=R+Q/K73hoOjXdUpxEsEYY1swojV7YoaxBd58sPJsATmPVVKRWdfpdOaBS4juli8hhj
         Cpsrpzq7Hx/wrLxjaPQz2gJQPVpnHSss6U/nSwSsoNDXltEjUDH5FQuwGFoZIWMACCig
         rpSeg/LjbP2h1qkC/PsxGhAZLPXYQZ40hnBXgOabk4VQB4RD6E3RtbOgygH0UUzJK6pj
         s8d79b+5AfniKlKgulwv4PU/ei8Uofhaa+sAs8IMO87wgm8WfRC0np41M6c2jxIzmk6f
         BANJGstRrrTZ9A1UinwulvQxLF25xMSKGpOZSLS4vrIQhN68zsaAmws0sQy0DJEzZfLd
         Fdjg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793254486; x=1793859286; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wMfOxCPlwo/RlHBHy4SArQTAJIMRFedjEu1x0yUsbnY=;
        b=DdYggcWDIakBXStyDQMT/xYB7wDHpsbhca4SUxiUqFpgUYsz+79FPy1E1DK+DHpRN8
         WgA+tDugdlylYYqD/DNbyWrvyuWv+bn1YyfKj+FH2GxutteRzYTl56Vcusw5uXnVX+H2
         x5iKjd8nJHN51sB9jMoAREVPhwuqyAYceSZFz1xqhgCaa+5laS0bt4kQYcp9kD8x2Q7r
         MutlCGehlIdilGCDRv0WVxUHJfwOK95XkfVttO7H2PXOgrpE3G6U8QbemQxsfK4sp5ZW
         uPMGMDnHFbUgi5P6lVc+SpyiVKWxmfKe2/StGLhEawyqczZXl/xdaS9EMFFsfPtFBNFa
         iywA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793254486; x=1793859286;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wMfOxCPlwo/RlHBHy4SArQTAJIMRFedjEu1x0yUsbnY=;
        b=ILr/sDDHmXOeCk0evvH+siDBtkhpJrC+Eo2hM3T3PZcSGKAoDh6f3HVoCI6VXLtunx
         VGJIBtHHOw7hyWXWDILgIh9N4sWOhyBCjzoCEKuBj2ze+wZbaAGzausramYDUd8ANL9J
         brPTcq6vcskDT3ip4Su8OGhDQJ92sWeqScbjE0CdukFT1p9mP7/yPwQdaoXMwFLxOvUJ
         yXmIJ+JVjxk/p9vYBp7WY8vifQoRJChEQIYFoAwEqutClfm3tSuA5UWHUdVIq9HSn5Kl
         rliFNg+JUD+bv2PMyzKXLLikmyCW5BIHXS/rlxb88lyvKYQjSAUmpjJRq+7rUmzg63nZ
         S/qA==
X-Gm-Message-State: AFq9FYI3Pb16QOYCKxjdjRuj1q+ouJZxaHPRKpqLI/dBW3ELwBQnACHe
	yrfAPXr71ckTK0vtpxkW5BlytZTI4hZiR56C6wPDIA6Z9ADaybCDGMIszlxnYI90fMw5zLt2Nmj
	kxyGkqj/HPNUfFgDP4vFUUwpUoqw6ZC0TEKygu476dA==
X-Gm-Gg: AYBFou3xMCMuxqYW6NiXgDxq6gPayQjlP7HjF0OpLnjn91kx4IdsRIv/LUCT94RJynG
	6Tg3XYOAJdpZ90bLS2O4dzK4wjcuvQ/IMiSDsPWX0E7Ay5/xwRZsB1y/9D5U4UBjQhsPi3KjJPY
	C+scTW84lerI7bmZfpnRbGDEMev8VYWxFqBaKx73R8TGmv344CwzHhJkRwdIZQlcxBBg1AZtxKT
	3tBTEyenItoojwp2DX+MQbkkFYedjKSjuJwoTRmbqN188NN4CyIfEgZ1hDdYuOhdGpo96eVGLpI
	vgS2lgCrQvZQjroSxtP9E2FpJdw6UX72066ytPIglZ65LDBhKS+XcWj0oB4M93JwpZprn0OaUHR
	95LKfUM33JljxI7VinKHYVnD1bDy2Znx01oy1+dFSbkuaX9ApnuO0U/aHJqhl72Hjua9a4rroay
	ZTfHHvsPEUSMqaz2fnacYCG+BGYDwHe4m2St3Ck1pRV6zr2xnT/as5y4zMc6UAiRehuXdgGTELE
	+yZ1w==
X-Received: by 2002:a5d:588c:0:b0:48c:6cdd:ba89 with SMTP id
 ffacd0b85a97d-48e5d4680c7mr10238502f8f.36.1793254486540; Wed, 28 Oct 2026
 23:14:46 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261028-spacemit-k3-v6-0-01d984f60941@linux.spacemit.com> <20261028-spacemit-k3-v6-6-01d984f60941@linux.spacemit.com>
In-Reply-To: <20261028-spacemit-k3-v6-6-01d984f60941@linux.spacemit.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 29 Oct 2026 11:44:34 +0530
X-Gm-Features: AclHuK8FN9bSFXH2y5kHaTN4L_G93dekkFnmoyeoRIyyw5AREa8LJdvLS5Siyug
Message-ID: <CAAhSdy2gq+Etn79s48Q7d1StTtohG4_8sjT0TsDheDQuQfzZ+A@mail.gmail.com>
Subject: Re: [PATCH v6 6/6] platform: generic: spacemit: k3: override
 cold_boot_allowed for hart 0 only
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: opensbi@lists.infradead.org, Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
	Bo Gan <ganboing@gmail.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
	Kevin Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	Valentin Haudiquet <valentin.haudiquet@canonical.com>, E Shattow <e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_231449_061164_51E1A46A 
X-CRM114-Status: GOOD (  15.30  )
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

T24gV2VkLCBPY3QgMjgsIDIwMjYgYXQgNzoyN+KAr1BNIFRyb3kgTWl0Y2hlbGwKPHRyb3kubWl0
Y2hlbGxAbGludXguc3BhY2VtaXQuY29tPiB3cm90ZToKPgo+IEZyb206IFZhbGVudGluIEhhdWRp
cXVldCA8dmFsZW50aW4uaGF1ZGlxdWV0QGNhbm9uaWNhbC5jb20+Cj4KPiBPbmx5IGhhcnQgMCBp
cyBwb3dlcmVkIGF0IHJlc2V0IG9uIEszOyBzZWNvbmRhcnkgaGFydHMgYXJlIHN0YXJ0ZWQgbGF0
ZXIKPiB0aHJvdWdoIEhTTS4gUmVzdHJpY3QgY29sZC1ib290IGVsaWdpYmlsaXR5IHRvIGhhcnQg
MCBpbnN0ZWFkIG9mIHVzaW5nCj4gdGhlIGdlbmVyaWMgRFQtY29uZmlndXJlZCBoYXJ0IG1hc2ss
IG1hdGNoaW5nIEsxLgo+Cj4gU2lnbmVkLW9mZi1ieTogVmFsZW50aW4gSGF1ZGlxdWV0IDx2YWxl
bnRpbi5oYXVkaXF1ZXRAY2Fub25pY2FsLmNvbT4KPiBSZXZpZXdlZC1ieTogRSBTaGF0dG93IDxl
QGZyZWVzaGVsbC5kZT4KPiBTaWduZWQtb2ZmLWJ5OiBUcm95IE1pdGNoZWxsIDx0cm95Lm1pdGNo
ZWxsQGxpbnV4LnNwYWNlbWl0LmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8
YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3Bl
bnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBwbGF0Zm9ybS9nZW5lcmljL3NwYWNl
bWl0L2szLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4K
PiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9zcGFjZW1pdC9rMy5jIGIvcGxhdGZvcm0v
Z2VuZXJpYy9zcGFjZW1pdC9rMy5jCj4gaW5kZXggOTY3ZDA5YmYuLjc5MjJhYjExIDEwMDY0NAo+
IC0tLSBhL3BsYXRmb3JtL2dlbmVyaWMvc3BhY2VtaXQvazMuYwo+ICsrKyBiL3BsYXRmb3JtL2dl
bmVyaWMvc3BhY2VtaXQvazMuYwo+IEBAIC0xMDIsMTEgKzEwMiwxNyBAQCBzdGF0aWMgaW50IHNw
YWNlbWl0X2szX2Vhcmx5X2luaXQoYm9vbCBjb2xkX2Jvb3QpCj4gICAgICAgICByZXR1cm4gZ2Vu
ZXJpY19lYXJseV9pbml0KGNvbGRfYm9vdCk7Cj4gIH0KPgo+ICtzdGF0aWMgYm9vbCBzcGFjZW1p
dF9rM19jb2xkX2Jvb3RfYWxsb3dlZCh1MzIgaGFydGlkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4g
IWhhcnRpZDsKPiArfQo+ICsKPiAgc3RhdGljIGludCBzcGFjZW1pdF9rM19wbGF0Zm9ybV9pbml0
KGNvbnN0IHZvaWQgKmZkdCwgaW50IG5vZGVvZmYsCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnN0IHN0cnVjdCBmZHRfbWF0Y2ggKm1hdGNoKQo+ICB7Cj4gICAgICAg
ICBzcGFjZW1pdF9rM19oYXJ0X2luaXQoY3VycmVudF9oYXJ0aWQoKSk7Cj4gICAgICAgICBnZW5l
cmljX3BsYXRmb3JtX29wcy5lYXJseV9pbml0ID0gc3BhY2VtaXRfazNfZWFybHlfaW5pdDsKPiAr
ICAgICAgIGdlbmVyaWNfcGxhdGZvcm1fb3BzLmNvbGRfYm9vdF9hbGxvd2VkID0gc3BhY2VtaXRf
azNfY29sZF9ib290X2FsbG93ZWQ7Cj4KPiAgICAgICAgIHJldHVybiAwOwo+ICB9Cj4KPiAtLQo+
IDIuNTUuMAo+CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
