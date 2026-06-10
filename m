Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D903CCD8CB9
	for <opensbi@archiver.kernel.org>; Wed, 10 Jun 2026 12:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYUIGhs9belX5uDoXHqfpKB1aj+HrM7P+M6L/dSCR3s=; b=XEm6RpPAuEKzCG
	q1O96v/JYibK056adtsFj0yVxajGgemf+gccWTCgCtAI/90wC1Ie6TlXrcZWwr3h7Sx/m8LO+7dhE
	RMWpjw90zay+e1DwR0+k1GW9Ohkkpk7vKyPw/w9Ya4pYXWiH8UzrAuvlhAtM5Fz+iHyTVrGAwd+xD
	zrZ4gn2VIFDINA6sltCNpq0pb8pxkXAr3hLvOo9aJyLg6L0MZxbVTlUPR0xuRIeVoXsQ5w/PZnOq0
	HbHk0OfnfYe4i6qzHqHzrIN3e0BqixdBzU0/lAUwtJLD6zEndcJoNHn8Opwc6dxy51X0YQe42Nu8N
	jTKXgKMPXDEOgGAs9MRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIJK-00000007f6i-3ERL;
	Wed, 10 Jun 2026 12:45:34 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIJI-00000007f6L-2xM1
	for opensbi@lists.infradead.org;
	Wed, 10 Jun 2026 12:45:33 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7e709dd1ab2so2153822a34.1
        for <opensbi@lists.infradead.org>; Wed, 10 Jun 2026 05:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781095532; cv=none;
        d=google.com; s=arc-20240605;
        b=PEZGFJZhuKxp43tI9e1j7Roya2ljUAQO4KNOew+ZskgkYJLbDtYzh1m2qWguLzYyPJ
         qW3Eg/C+ooXhSQiOKJL87JHUqfZMNF31QvbDpnvNwy3RXVph89U8PO7kdi2dYa0s29ks
         aKJM23H1NeahOks4bqjeNLJ6Nev6+uXglLLpT7WDFAIxqqK+O3wusrjywd2UErpJcVoP
         Br8MAfJ+dxOBysW7cdxPn2EBjaidt/TLN77pXOk7BlhRW0jNOGQCnJrU/SOkjU4hYGZF
         jT6KA4Zm7193AFNfuFgMGcPGNBx4SlNtbJ8JwB8sS8YoX2DwmyjizONhkpULzmQQDdSh
         zf8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jsBj7KWAOmnINgHim3vBDve/qMV+xFqHwB0b0l5BlDw=;
        fh=1xveiQGYA3Z/yJxZTiIlAGuUFWNkd4EOgMh0UYnH888=;
        b=Ru92kc34ZQi6godvi+k8KeOBwQccAO/LH83O1j5fIS7onyFav2z7m1R+CIfCu22XmE
         2uDA+U+v8VRGn36uzese2+66e+kaDD/U3oKHjtKlsIRVIKj0swgnoQrBt1XFArLW6Sak
         iub2ixt2oOOsUjQxXouBLaVP1fduaHnkZmQaiVc8xTvh0i/oLsW+KHDuDDO+vzNOHmif
         U1amEac7WoDBp6vYCglkEiPxvgrfQ1Dzlw59fzk+tIKYsp/nY18R6mivAqJx8LqZvOts
         05fTFKdga49zsm5TtGLNeuvh10RwFBqFQ+SmoMI6Xf33GgSCr/e+E3z6lpwBgXVxtpza
         5PRg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781095532; x=1781700332; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsBj7KWAOmnINgHim3vBDve/qMV+xFqHwB0b0l5BlDw=;
        b=XIqi0FrNk6r/TesKQAngdmYJg6xiiqSGjYNR7D5/usK+QNXMa1ZvM3rai0HYOwqKMg
         aeUfFFpJ/I2oveb4/6JZ02ChR4Di590tjFHbS1L4i4pC74eQLsf4jkztasRrA2t1Tgee
         RG2yxOA8E5uO2jxgBuu9IvgAfiU4PDVeqC9DphzbZhQjHoQbpJ4htLZJt0RbnLojJg8R
         Cbvh/rNLQWYQlCzVWyVnvmm45Toiem1eF4LoMYIEkUC5RGOmIhyJeO2FCFdCdv8kiVf+
         NigHZ0mmTTV8qEpcREB7GEORfi3tRq/Hd7ZLByBLeTRBe98ujqmafEiUD9jq7QTM9cOR
         kr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781095532; x=1781700332;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jsBj7KWAOmnINgHim3vBDve/qMV+xFqHwB0b0l5BlDw=;
        b=b7G8PylggGyfStM4wtFiGVjaFsyywD2OYioFhm36MMuMMR9CRE3icjOhW58plIaRIj
         ilifFvSFlLr/893y+VaRrsw1Hd+UmU9ZNR3X6P20cAM2qGMNxHybyzMcB7N5wwZZ+rC2
         K01YeUGzqiUwpdRI3fZ4s3dEOyzAVCScnCdvdMO5Vrm4EHou3OE0mlAQjgtqrV31Pq7l
         imnXlnMyMMFoaDcXlS6jD5pEvU5PCwZ0ey/S2xXx8DK8hqyylWHA3MFxc061+qJY4VKc
         vQBt139mS6mFycJ9NKPLty8Ee2h1NuO6L/KJo2UgSeug8yukRIRxdqTOzAgn2Aq9to0Y
         /EQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MgJp/+ez0SwflMvrxTFm/Vjdv5V4NgdG73kLnvRgTV0WoM74Ea79PBJr5SPLRvK2ONsHZicQA@lists.infradead.org
X-Gm-Message-State: AOJu0YxF6EjVKnYn9wWo0uOlONqjfKKJnmAOEytMuhGHDXC/EenUtsnr
	M3G5e3RDe5+4Fb5izwRFkFbZ8AI3h9nSZD03HJwu6kR8vUVA6byu94lY1ypNosdy15FkoANmUR2
	+AkYbyTz0THki+eEAP2gqQUhUwkLSnnso0pY3jYepwyiR3kVNZ+HfHeg=
X-Gm-Gg: Acq92OGahArqY0hq24QpuFGFjvbGCTixHf0yAsU4FbOod8QLk57oZUVdJxkhbc/rSzs
	d+zKWZGeR/FjJSPLYmBEdBq/UHAqsxnijrD14Og/E2Q3wRY2B22QloH0NpwZ4ZVjjYXwHZJNOAC
	rFvTlPy50hFX/bjQqpNy6QIhy31G/Aq3+fneE5hH+rOXFCawgEFbJ7gyimbM2kuDX1an/hlfjmU
	qdnamkAkYvfWA8y6nZLk9ggrFm7WgqyJzf92hrqoS4pwaIawOd7i5TXMu3dxc5elRwAkBGwwURe
	6D3+oQCNd+TyKsBu5PT8I94eMc3hQ5nzcKKzR9Tyt6RDvWpV13vam5+cqfSYys+GhWjCXxNdEDX
	/MDVvfW3wUy9pIAkwMelGRJyS4Vdpe+ebeJRe
X-Received: by 2002:a05:6820:4b84:b0:69b:94ac:da1e with SMTP id
 006d021491bc7-69e68c1af93mr13340025eaf.31.1781095531724; Wed, 10 Jun 2026
 05:45:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Jun 2026 18:15:20 +0530
X-Gm-Features: AVVi8CfKqofCR3q0hjIjCqvd8NbbG1Nd45Ep-ImZiYN8_b6Gl2X9XJ4CfZt06iI
Message-ID: <CAAhSdy2bZnm8WbjGZkpTCJOCSkij-Svyg+ZH0ibFtrs=67pvdQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] MPXY MSI availability and RPMI notification updates
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org, 
	"David E . Garcia Porras" <david.garcia@aheadcomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_054532_752392_2A1AC47E 
X-CRM114-Status: GOOD (  13.50  )
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

T24gTW9uLCBKdW4gOCwgMjAyNiBhdCA2OjIz4oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEZyb206IERhdmlkIEUuIEdhcmNpYSBQb3JyYXMg
PGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+Cj4KPiBUaGlzIHNlcmllcyBlbmFibGVz
IHByb3BlciBNU0kgYXZhaWxhYmlsaXR5IGRldGVybWluYXRpb24gZm9yIE1QWFkKPiBjaGFubmVs
cyBhbmQgdXBkYXRlcyBSUE1JIG5vdGlmaWNhdGlvbiBzdHJ1Y3R1cmVzIGFuZCBQZXJmb3JtYW5j
ZQo+IHNlcnZpY2UgZ3JvdXAgZXZlbnQgZGVmaW5pdGlvbnMuCj4KPiBQYXRjaDEgaW50cm9kdWNl
IGNhcGFiaWxpdGllcyBpbiBzYmlfaXJxY2hpcF9kZXZpY2UgYW5kIGFkZHMKPiBzYmlfaXJxY2hp
cF9maW5kX2RldmljZV9ieV9jYXBzKCkgdG8gZmluZCBpcnFjaGlwIGJhc2VkIG9uCj4gY2FwYWJp
bGl0aWVzLgo+Cj4gUGF0Y2gyIHJlcGxhY2VzIHRoZSBoYXJkY29kZWQgbXNpX2F2YWlsID0gZmFs
c2UgaW4gTVBYWSBjaGFubmVsCj4gc2V0dXAgd2l0aCBhIHJ1bnRpbWUgY2hlY2sgdXNpbmcgc2Jp
X2lycWNoaXBfZmluZF9kZXZpY2VfYnlfY2FwcygpCj4gdG8gZGV0ZWN0IHByZXNlbmNlIG9mIE1T
SSBjb250cm9sbGVyLgo+Cj4gUGF0Y2gzIGFkZHMgcnBtaV9ldmVudF9ub3RpZmljYXRpb25fc3Rh
dGUgZW51bSwgYW5kIG1pc3NpbmcKPiByZXFfc3RhdGUvY3VycmVudF9zdGF0ZSBmaWVsZHMgdG8g
dGhlIFJQTUkgZW5hYmxlIG5vdGlmaWNhdGlvbgo+IHJlcXVlc3QvcmVzcG9uc2Ugc3RydWN0cyBm
b3IgUlBNSSBzcGVjIGNvbXBsaWFuY2UuIEFsc28sIGFkZHMKPiBub3RpZmljYXRpb24gZXZlbnQg
SUQgZW51bXMgYW5kIGRhdGEgc3RydWN0dXJlcyBmb3IgUlBNSSBQZXJmb3JtYW5jZQo+IHNlcnZp
Y2UgZ3JvdXAgZXZlbnRzIChwb3dlciBjaGFuZ2UsIGxpbWl0IGNoYW5nZSwgYW5kIGxldmVsIGNo
YW5nZSkuCj4KPiBQYXRjaDQgYWRkcyBtaXNzaW5nIFNCSSBNUFhZIG5vdGlmaWNhdGlvbiByZWxh
dGVkIGRlZmluZXMuCj4KPiBBbnVwIFBhdGVsICgxKToKPiAgIGxpYjogc2JpX2lycWNoaXA6IEFs
bG93IGlycWNoaXAgZHJpdmVycyBhZHZlcnRpc2UgY2FwYWJpbGl0aWVzCj4KPiBEYXZpZCBFLiBH
YXJjaWEgUG9ycmFzICgzKToKPiAgIGxpYjogc2JpX21weHk6IEVuYWJsZSBNUFhZIGNoYW5uZWwg
TVNJIGF2YWlsYWJpbGl0eSBkZXRlcm1pbmF0aW9uCj4gICBpbmNsdWRlOiBtYWlsYm94OiBVcGRh
dGUgUlBNSSBub3RpZmljYXRpb24gc3RydWN0cyBhbmQgYWRkIHBlcmZvcm1hbmNlCj4gICAgIGV2
ZW50cwo+ICAgaW5jbHVkZTogc2JpOiBBZGQgU0JJIE1QWFkgbm90aWZpY2F0aW9uIHJlbGF0ZWQg
ZGVmaW5lcwo+Cj4gIGluY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaCAgICAgICAgfCAg
OSArKysrKysKPiAgaW5jbHVkZS9zYmkvc2JpX2lycWNoaXAuaCAgICAgICAgICAgICAgICB8IDEx
ICsrKysrKy0KPiAgaW5jbHVkZS9zYmlfdXRpbHMvbWFpbGJveC9ycG1pX21zZ3Byb3QuaCB8IDQx
ICsrKysrKysrKysrKysrKysrKysrKysrKwo+ICBsaWIvc2JpL3NiaV9pcnFjaGlwLmMgICAgICAg
ICAgICAgICAgICAgIHwgMjAgKysrKysrKysrKysrCj4gIGxpYi9zYmkvc2JpX21weHkuYyAgICAg
ICAgICAgICAgICAgICAgICAgfCAgOCArKy0tLQo+ICBsaWIvdXRpbHMvaXJxY2hpcC9hcGxpYy5j
ICAgICAgICAgICAgICAgIHwgIDEgKwo+ICBsaWIvdXRpbHMvaXJxY2hpcC9pbXNpYy5jICAgICAg
ICAgICAgICAgIHwgIDEgKwo+ICA3IGZpbGVzIGNoYW5nZWQsIDg2IGluc2VydGlvbnMoKyksIDUg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDMuMAo+CgpBcG9sb2dpZXMgZm9yIHRoZSBkZWxheSwg
dGhpcyBzZXJpZXMgd2FzIHdhaXRpbmcgaW4gbXkKcXVldWUgc2luY2UgcGFzdCAyIG1vbnRocy4K
CkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClJlZ2FyZHMs
CkFudXAKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
