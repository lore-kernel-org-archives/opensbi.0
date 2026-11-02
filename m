Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044D5606A326
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 08:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YoNQyTQE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=lGMdx8Y0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ipGkAAvV6DvU5qFB8SMLV/pDDnotWIG5+6h5kzzwagM=; b=YoNQyTQEi5E8TmtATlcD/3Is3R
	nYVShlyNGNpKaQUDNQyjhsLwlhqaRycpdhjvAgTQCFm4uaAwAHFPSvC405fk1rL6O/6wZi2kKfuZ7
	f7/LHAAOwCzw11wgkTkYxUrGXnEFKnh45un2RS8NNBcpfSeBMdFymBNwR24SgRczQO2/FbbkiX+pd
	rV5e1jFhVEFJ7xfLMxrpfOyxVWam8Wc1jCRbZcp2lXZi/DLh/9wsIsNDmDSgLYi6hCW3YYu7KI93g
	+sXElisFGzr/zvYpL1Ys/nXeYvcvC4yaH7t0INzcX+JncDmlAF/wp0U2dGXLAE0R2TfraY9plCUHN
	rX1IsBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmyj-0000000Foj9-3UlH;
	Mon, 02 Nov 2026 08:01:17 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNmyg-0000000FohZ-2wPx
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 08:01:16 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e47347279so1505597f8f.1
        for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 00:01:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793606473; cv=none;
        d=google.com; s=arc-20260327;
        b=Vy4nJEjhJTJ9LXrQhXnIyBCOKGwWC6YAiVTDrVuucQUyxB+Jdf2QKxrFNRR+gFV1Iz
         netmGhUTNqbEu++eJeTo0x8y14kY/uQy0DDR/xstexkF2yiizLBW1rS7GT8KJP6DUMCv
         3obAGm4Pz3skU8s34o/064lBkC43cLuGAV0O0A6v4c99IVFzok7r9mPetI7RsSz1r8/4
         1z2dVk5vJOq2hARB5fmFuFhHJgMaCmEWvuRRbo90yNbXoBBw4TUAiNJWMhe+8jMcFxzH
         nL7+7EfxV80PtQ/IEdVbsbU9BMJcglOLLFxN62GRJ5NxCA3GAlCdM+BwplOIDpFHu/GC
         c3yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lWaq07jgd82RBos8/HV2TNNC+9AJOFG8ViJ8NeMGlbo=;
        fh=jM6m8Fvf/Cznlo5HxBEx9+GO8nbNsGXokw0AqBkKWlo=;
        b=VZZYi5uoK73ZO/RyCJ+eU54fIiEEBbB5Nk6oDHlwUzuHzfR1kZ0UN6tpcclSXoxzcp
         bkSa1ft7QvnYIcy4OmQ9Dpy2PphcOXBwYejOuJvEjpjWCWzG+i1po+jeOzaTq3/5aDAU
         qTAWDntbOWl15RUCGxemjdKrjnJtfOlkvg8BoBgqy96mSKvhElLNAH1Vg3RmF4NjUaNV
         DmNZn38VBp994zPBsedixcrwu+xSQypXfVE9GGQKPfUCeCWm4c35zQE3aNe2MEKj4YoA
         +sNQ0uFanocq8F7tCf4sURkt4XHqijYjCL00TWu3EbifzkrvgM85+MZnMg6okVuO8mvp
         BcvQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1793606473; x=1794211273; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lWaq07jgd82RBos8/HV2TNNC+9AJOFG8ViJ8NeMGlbo=;
        b=lGMdx8Y0DlHZBJ4BLWjb4iAbDNtD2n4h1ucefb7L5fQG/FJjN1JXu+0/DFL9ugHp/o
         Rvoktn8MRINtSLnzlg2xHdUJvZXPctFikkFIm1BMpeKILt64KGxhew5yE97gbhgRzgbE
         XA0I4ZiGMyOoRGwoQtC7XgREJkoKlajWgDAyaUdka1sKESj/R9JbGT4NXmOz4/slMR+H
         kdLK0QNT0Vx02S5flUJ3+13BrG/iNq8cQKsdMPxuY1aIFm/n+0wrJTaBMyWX2OxSeVYD
         1SdXZhkn/A691bt40cy8w19kuNmQ84VAs5njPxYB/a8W/2vOzOHRD5y2FG4j/NpmLC1E
         NwAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606473; x=1794211273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lWaq07jgd82RBos8/HV2TNNC+9AJOFG8ViJ8NeMGlbo=;
        b=jZvpizfBP85TLf+1iJCIBxDF3CtjJCYSjXWrlqmWZxSmp3wXZAOWR3hpFyMNVVui9l
         ICy/lpnRUO1evBfUes2IHDN8T05RmN+ON+olGCPMwU4oNE8frGtrZwyMT8lqXn12w2AU
         QsRGHwmO1RYIsJBQQ5zr7GO3pDFpvgbElzqkbbcNnciy1caGsLc6zjglUDjJqvm+J3KV
         BtapdC7tkmCGN/E+0hrZpDRkTCmX/4wTctE6yqO5RGBtJzQfn5wL3ukO9KBrmVrtLO8F
         MzYVaBXwES2LouzRqCP8nq2HtiCmkVdmXwAw+SsVxg8qf9aZmBVYrTnDAyo8jJRLDxyk
         p0xA==
X-Gm-Message-State: APuU4Z9tsbyRtlxhIk1PAsd/LraLljKO8MaTNC2wPu7RgxnD2ahaxT7+
	dNvzS/44EAOK4kDscQnh48L0WTL286DOLBOrWU1z0LumUTYSrq7khV5YZH1+DP+1kRUaqEmEgkD
	C5PQ/nvbr7Vyc40jX0I4nvXehuUOt+V9gis0HelX82s2kZvKML4Nv
X-Gm-Gg: AYBFou3VQi18GgPeCONbYgSKwe+hjhiNRNPSn8N/I4PJrtxltkrKyKaYmMH5eyak/IU
	nrFfFs7TDnjOIgUSddvNXISETuF+Kakf/vWSU0zl33oqE7UfPmsLDizaaSmg3eOUkQV3WVS9AHE
	yfBL7IJqA+U8rribIZ6Z1mr8sVu12u57k7lTHMRnGAZ9UQ3psFUWSQS13sJXQJVQoejkvEzJbkL
	UfTTB3eBlFzlhs3E5QwQXD4cy1bJEI5iyt+H/2AKR08Acg0oNyWdYhfXG+MKlROSVT4rYc/c+bW
	gNAh0OJ6GqR2D41v4srXdrStzy8uuYOqDdwnp7KOE2lDStMltb5Sq/XHVpsVPYXHhAPsAJo9bLh
	sDqW9mC4xhs7KbIHas45RET+1ns9rY4PpJmOnFeLzfhYM7y1U5VQjrPQ/mZHE6lc7vO56elXtgP
	HnDWyk6rLWgYhFKywyuHG+rqnwFbciRGEiteJXKHHRXze8AnmItW9+RFuD
X-Received: by 2002:a05:6000:2dc3:b0:48e:68da:1c5c with SMTP id
 ffacd0b85a97d-48e6e2f83aamr20331101f8f.16.1793606472420; Mon, 02 Nov 2026
 00:01:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015203610.835320-1-khem.raj@oss.qualcomm.com>
In-Reply-To: <20261015203610.835320-1-khem.raj@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Nov 2026 13:31:00 +0530
X-Gm-Features: AclHuK8kGIHHjkgnrSc9z-gnGMu91BHM6sggubTtGZld4Qfj4Lkgs2__m7uyGwY
Message-ID: <CAAhSdy2yv+AqKSi726fFe-c=UNSE27a78TT-a=h-i_676seQ5g@mail.gmail.com>
Subject: Re: [PATCH] lib: utils/serial: Remove unused baudrate/frequency globals
To: Khem Raj <raj.khem@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_000114_757074_556DE315 
X-CRM114-Status: GOOD (  16.46  )
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

T24gRnJpLCBPY3QgMTYsIDIwMjYgYXQgMjowNuKAr0FNIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KPgo+
IFRoZSBzaWZpdmUtdWFydCBhbmQgY2FkZW5jZS11YXJ0IGRyaXZlcnMgc3RvcmUgdGhlIGlucHV0
IGNsb2NrCj4gZnJlcXVlbmN5IGFuZCBiYXVkcmF0ZSBpbnRvIGZpbGUtc3RhdGljIGdsb2JhbHMg
ZHVyaW5nIGluaXQsIGJ1dAo+IG5ldmVyIHJlYWQgdGhlbSBiYWNrOyB0aGUgZGl2aXNvciBpcyBj
b21wdXRlZCBkaXJlY3RseSBmcm9tIHRoZQo+IGZ1bmN0aW9uIGFyZ3VtZW50cy4gQ2xhbmcgMjMg
YWRkcyAtV3VudXNlZC1idXQtc2V0LWdsb2JhbCwgd2hpY2ggaXMKPiBlbmFibGVkIGJ5IC1XYWxs
LCBzbyB0aGUgYnVpbGQgZmFpbHMgd2l0aCAtV2Vycm9yOgo+Cj4gICBzaWZpdmUtdWFydC5jOjM0
OjEyOiBlcnJvcjogdmFyaWFibGUgJ3VhcnRfaW5fZnJlcScgc2V0IGJ1dCBub3QgdXNlZCBbLVdl
cnJvciwtV3VudXNlZC1idXQtc2V0LWdsb2JhbF0KPiAgIHNpZml2ZS11YXJ0LmM6MzU6MTI6IGVy
cm9yOiB2YXJpYWJsZSAndWFydF9iYXVkcmF0ZScgc2V0IGJ1dCBub3QgdXNlZCBbLVdlcnJvciwt
V3VudXNlZC1idXQtc2V0LWdsb2JhbF0KPgo+IERyb3AgdGhlIGRlYWQgdmFyaWFibGVzLgo+Cj4g
U2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KCkxHVE0uCgpSZXZp
ZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBw
YXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAg
bGliL3V0aWxzL3NlcmlhbC9jYWRlbmNlLXVhcnQuYyB8IDQgLS0tLQo+ICBsaWIvdXRpbHMvc2Vy
aWFsL3NpZml2ZS11YXJ0LmMgIHwgNCAtLS0tCj4gIDIgZmlsZXMgY2hhbmdlZCwgOCBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS9saWIvdXRpbHMvc2VyaWFsL2NhZGVuY2UtdWFydC5jIGIv
bGliL3V0aWxzL3NlcmlhbC9jYWRlbmNlLXVhcnQuYwo+IGluZGV4IDMwZmJiOTUuLjgwZGM0Mjkg
MTAwNjQ0Cj4gLS0tIGEvbGliL3V0aWxzL3NlcmlhbC9jYWRlbmNlLXVhcnQuYwo+ICsrKyBiL2xp
Yi91dGlscy9zZXJpYWwvY2FkZW5jZS11YXJ0LmMKPiBAQCAtMzksOCArMzksNiBAQAo+ICAvKiBj
bGFuZy1mb3JtYXQgb24gKi8KPgo+ICBzdGF0aWMgdm9sYXRpbGUgdm9pZCAqdWFydF9iYXNlOwo+
IC1zdGF0aWMgdTMyIHVhcnRfaW5fZnJlcTsKPiAtc3RhdGljIHUzMiB1YXJ0X2JhdWRyYXRlOwo+
Cj4gIC8qCj4gICAqIEZpbmQgbWluaW11bSBkaXZpc29yIGRpdmlkZXMgaW5fZnJlcSB0byBtYXhf
dGFyZ2V0X2h6Owo+IEBAIC05NSw4ICs5Myw2IEBAIHN0YXRpYyBzdHJ1Y3Qgc2JpX2NvbnNvbGVf
ZGV2aWNlIGNhZGVuY2VfY29uc29sZSA9IHsKPiAgaW50IGNhZGVuY2VfdWFydF9pbml0KHVuc2ln
bmVkIGxvbmcgYmFzZSwgdTMyIGluX2ZyZXEsIHUzMiBiYXVkcmF0ZSkKPiAgewo+ICAgICAgICAg
dWFydF9iYXNlICAgICA9ICh2b2xhdGlsZSB2b2lkICopYmFzZTsKPiAtICAgICAgIHVhcnRfaW5f
ZnJlcSAgPSBpbl9mcmVxOwo+IC0gICAgICAgdWFydF9iYXVkcmF0ZSA9IGJhdWRyYXRlOwo+Cj4g
ICAgICAgICAvKiBEaXNhYmxlIGludGVycnVwdHMgKi8KPiAgICAgICAgIHNldF9yZWcoVUFSVF9S
RUdfSURSLCAweEZGRkZGRkZGKTsKPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxzL3NlcmlhbC9zaWZp
dmUtdWFydC5jIGIvbGliL3V0aWxzL3NlcmlhbC9zaWZpdmUtdWFydC5jCj4gaW5kZXggNTU2Mzcx
My4uMjM1OTc2ZSAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvc2VyaWFsL3NpZml2ZS11YXJ0LmMK
PiArKysgYi9saWIvdXRpbHMvc2VyaWFsL3NpZml2ZS11YXJ0LmMKPiBAQCAtMzEsOCArMzEsNiBA
QAo+ICAvKiBjbGFuZy1mb3JtYXQgb24gKi8KPgo+ICBzdGF0aWMgdm9sYXRpbGUgY2hhciAqdWFy
dF9iYXNlOwo+IC1zdGF0aWMgdTMyIHVhcnRfaW5fZnJlcTsKPiAtc3RhdGljIHUzMiB1YXJ0X2Jh
dWRyYXRlOwo+Cj4gIC8qKgo+ICAgKiBGaW5kIG1pbmltdW0gZGl2aXNvciBkaXZpZGVzIGluX2Zy
ZXEgdG8gbWF4X3RhcmdldF9oejsKPiBAQCAtOTQsOCArOTIsNiBAQCBzdGF0aWMgc3RydWN0IHNi
aV9jb25zb2xlX2RldmljZSBzaWZpdmVfY29uc29sZSA9IHsKPiAgaW50IHNpZml2ZV91YXJ0X2lu
aXQodW5zaWduZWQgbG9uZyBiYXNlLCB1MzIgaW5fZnJlcSwgdTMyIGJhdWRyYXRlKQo+ICB7Cj4g
ICAgICAgICB1YXJ0X2Jhc2UgICAgID0gKHZvbGF0aWxlIGNoYXIgKiliYXNlOwo+IC0gICAgICAg
dWFydF9pbl9mcmVxICA9IGluX2ZyZXE7Cj4gLSAgICAgICB1YXJ0X2JhdWRyYXRlID0gYmF1ZHJh
dGU7Cj4KPiAgICAgICAgIC8qIENvbmZpZ3VyZSBiYXVkcmF0ZSAqLwo+ICAgICAgICAgaWYgKGlu
X2ZyZXEgJiYgYmF1ZHJhdGUpCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbnNiaQo=
