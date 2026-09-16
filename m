Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00D1C88E5C
	for <opensbi@archiver.kernel.org>; Wed, 16 Sep 2026 05:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AAg9UTHzTx9rJrJJNJ2SyhKKM2rQ7ZqBD+7uVX9+fRo=; b=KJ8N1HN8m9BOFR
	AcZaQoPE/BHqjb9rEEHJQEhKUFe0MfyH1CfapfsaRb0L10/IEZmd1+7yG2m6gTgkFrOvw2hwpUonT
	9d7nQI4rhkTpn6eRDvbxfBPmGJ+YrkcSms7ZNpAduR+4blJAQWJB9/8UIQLQuuiIsScnrjxZqCqZD
	5Fxgu/pRAkB9jLzFv3ex1GfX9Q8R88KvOLsca9uIFvFNDlAmYyl4D2KKajX+ztba8/YQXTmX27Z1f
	7DMtQGEVu0SEnsbXC0zkdFP4gsnrc1UeZ5K3iESszwTe4OgPhIj8ksNgUSNPGmf5IcNjBFeeVnzf+
	mwzj77BAVOeueZN8Ew/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i3c-00000008NLh-16jf;
	Wed, 16 Sep 2026 05:19:44 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6i3Z-00000008NKq-1Tu1
	for opensbi@lists.infradead.org;
	Wed, 16 Sep 2026 05:19:43 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49b965f447cso4015205e9.3
        for <opensbi@lists.infradead.org>; Tue, 15 Sep 2026 22:19:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789535979; cv=none;
        d=google.com; s=arc-20260327;
        b=PHH952VQ8kXDR8Y80Ax8j2njDXa/b8hu5dyJL6c0sQF7tdvKimpuNo0rCUh+qESInx
         QjppIRiBMZB1rBxcWQ4bNF2lsk+O2BmPuuoAhb59n03RxKlY/0wGBJ1f8yPKAyemDx9f
         A5hSXt2mt2SnwBvP2212KXxWz9fIIddp1AXCXxMb3J2Ggfy/+IBHHMG4tc0dAjyablGO
         Pf0Oh3hc2YohbLzaSZ/xQZur2Ev+KLJVMwFU9vbkm3eXC6Tf8mofnfNPydRw4ktaeTiy
         pWzjSA4rmFnBBWGqLZREHjSqRoxIENzqI++8XddMm2FBt+YbomCczlcvHraVobTrN6pt
         nq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rYjYzc4fAnxL8Mtk/jTqz2bEbC4QTLs8z574v4fQPfo=;
        fh=i0H8YoyaQLtcjkg2uVXXA4bRT95nI0bq+qeBsCKVdEs=;
        b=C3F5l8hu/21pq6KLcEOJCMVeu6LS4usqIpcaYe6oSfh71tlvnhnqnYgGmhFY0RG01H
         8kloFWgRKTXG9vAnqp1TW7PO8zidEMUF7gLiDGulTaxww+Xh/EjFDiPJhcOpQliXTfrg
         l5wTfUk3lZeVPCFEL/hBe71kEHW9os1nIJ3WPq8zsPfLX8DyUspagGipjqeT9N1sB5y2
         0Tz9uL5LduCbuVFypI5pVsS1tUoOmcg2B+UCSLtU40L6zGaFjvXU/cBoxOdFHLpZTE0I
         SOfX9DaBme1E8TDr5c2n+D8toIgV8JCfMf9accuUiwb6l2crjKrwR0R9MA8KyZAiW4FA
         3gag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1789535979; x=1790140779; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rYjYzc4fAnxL8Mtk/jTqz2bEbC4QTLs8z574v4fQPfo=;
        b=okotJYEdsCwB9sJpGNegMQJ3EasenvTEpGOyPibfD5dCqrYE33wICnNXge8HVFvC29
         B0//H2FDdvhac0jk6DrRMPZKqr9kutMRZIH67Bjhfa23xd8LaXtjHQ5U7o7NRK1HF1WO
         X424MuSmFUPREvZQmGVZabWzL88pB7DIfCSRC2ZRsB3hzRZcpl/grfxVM9jppLrzO4Mg
         3UWUEm8oOf0JBojNb2unHPC1SEB0vXfooGCiN3Ui5F///D89ehsG8VzcO5DjnOblr3Zp
         pJ/BhqTvL2nfLEftmvkH2ORI+3dIUxp1oOtZCJhj0WyltkfuMDKnZAJK2TkqSEsJ7wcf
         KHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789535979; x=1790140779;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rYjYzc4fAnxL8Mtk/jTqz2bEbC4QTLs8z574v4fQPfo=;
        b=QFc0XRIVzx0Ab3rvbdxEVElFsHAVbeh6unrolm4SygR7ntJJEM1PRmDmWUXhCOxfEM
         5o+hCh0arCcY591QerZyqPcUuT2zqtByP80KPJsohyxScDy/ljhRzxE6GCaxAugYPLF3
         VseIdiYSZxkkw0q6jj94dsNmJefhD9hRnXUZcY4bAfVDfg/5onGlLw5By1KQ6HM3mEFV
         5acTQHaiM7zYli1UASUtig+39Hz0Daid9s3FDY3+QxQ3ox2cRcHO3LywW4Kd83Fpeyiw
         oiEbr6g4579QBy2LEmTJR663vLnB7BL9nSXQxqEWJyyPuxVUXAUrcG/rW5J/isw6jpwC
         Dryw==
X-Forwarded-Encrypted: i=1; AKwUvBx9bQZClwP5lchzymTRBRnUKDXAWtZywhm+Kd/Wg9Eqv9YFNeY9v51vQcIVPcPspQanH9JJbbl3@lists.infradead.org
X-Gm-Message-State: AFuF++lpNc1p921mVG4i+9g+6c2/o6Zhfvevxsm1/IvP0zcpFcGtpC2k
	InSAnQGTeTadI/7Zwb57MYxwHwkwtJs67CMu+Nslbmq1CbifaLQ872ZPhN0RvHVkMk5mNDhd6CF
	k6iM037Um6J58wOprkVtvPLqs6uSmRFlYmJWpwxrVVQ==
X-Gm-Gg: AYBFou0vMi7G81TRMRN2tvI4LzQKA2kPGFdpstypKU88K0QR+Tt8Eok4cHGeHbNMdyK
	RIvbNNc7oenZJ7L551Qa1X4/AWaOlm2Mhvm7im+Qq87GS4iYEWBDja4im1Mga5GdlESHIEu7XxK
	W7G0xf/ewtNOLxLbZ8NrCjx9Dw6VhckpTtyau9heEsCp2MRonlZhLE1U9T/GbwAiJJJGJ19t5pj
	81mAwpeqmS/tInrP8jAJMy8COxod0eZjsIz2QooXMDsDcBROwi8hXTpQi6/nEneA3Tr5R1mdCFH
	7Oc1pF0j5ARChujxAMgCS5wBkxUv5xHgd+NBfZ1yewUJGoxUlPIx6qTODxee3/iZ9CvQ6b8qsR/
	2saSBFnu99mASsMRLqHtv4bERV22O0t/6l4kWdWyGNS7BFvFBGoNp/SG0NJyDeHsULs4PAQMUP7
	WslSJD5njU
X-Received: by 2002:a05:600c:4709:b0:493:f5bf:4dc6 with SMTP id
 5b1f17b1804b1-49eac46374bmr10620665e9.7.1789535979217; Tue, 15 Sep 2026
 22:19:39 -0700 (PDT)
MIME-Version: 1.0
References: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
In-Reply-To: <20260905131748.922920-1-anup.patel@oss.qualcomm.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Sep 2026 10:49:27 +0530
X-Gm-Features: AcwNN1WIvZb1yaIQK9q1rOCoXGVKNzJRWiwgyUAYGQ_N7uv3ZKoP4287AClRDGs
Message-ID: <CAAhSdy1wmAnzQ3Y+=UyQ27L-3mFMFkwiev6wDnaAfM0pFG=Zsw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] OpenSBI domain initialization order
To: Anup Patel <anup.patel@oss.qualcomm.com>
Cc: Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	Samuel Holland <samuel.holland@sifive.com>, opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_221942_083623_C8ED9676 
X-CRM114-Status: GOOD (  14.09  )
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

T24gU2F0LCBTZXAgNSwgMjAyNiBhdCA2OjQ34oCvUE0gQW51cCBQYXRlbCA8YW51cC5wYXRlbEBv
c3MucXVhbGNvbW0uY29tPiB3cm90ZToKPgo+IEN1cnJlbnRseSwgd2UgcmVseSBvbiB0aGUgIm9w
ZW5zYmktZG9tYWluIiBEVCBwcm9wZXJ0eSBvZiBDUFUgRFQgbm9kZXMKPiB0byBzZWxlY3QgdGhl
IGRvbWFpbiBhc3NpZ25lZCB0byBlYWNoIEhBUlQgYXQgYm9vdC10aW1lIGJ1dCB1bmZvcnR1bmF0
ZWx5Cj4gdGhpcyBpcyBvbmx5IHN1aXRhYmxlIGlmIHdlIGhhdmUgdHdvIG5vbi1ST09UIGRvbWFp
bnMgKGFrYSB0cnVzZWQgYW5kCj4gbm9uLXRydXN0ZWQuIEZvciBtb3JlIHRoYW4gdHdvIG5vbi1S
T09UIGRvbWFpbnMsIHRoZSBkb21haW4gaW5pdGlhbGl6YXRpb24KPiBvcmRlciBzaG91bGQgYmUg
bXVjaCBtb3JlIHByZWRpY3RhYmxlIHdoZXJlIHVzZXJzIHNob3VsZCBkZWZpbmUgdGhlIGV4YWN0
Cj4gb3JkZXIgdmlhIHNvbWUgRFQgcHJvcGVydHkgdW5kZXIgZG9tYWluIERUIG5vZGVzLgo+Cj4g
VGhlc2UgcGF0Y2hlcyBjYW4gYWxzbyBiZSBmb3VuZCBpbiBzYmlfZG9tYWluX2luaXRfb3JkZXJf
djMgYnJhbmNoCj4gYXQ6IGh0dHBzOi8vZ2l0aHViLmNvbS9hdnBhdGVsL29wZW5zYmkuZ2l0Cj4K
PiBDaGFuZ2VzIHNpbmNlIHYyOgo+IC0gRHJvcCB1bnVzZWQgY3B1c19vZmZzZXQgdmFyaWFibGUg
aW4gUEFUQ0gyCj4gLSBVcGRhdGUgZG9jdW1lbnRhdGlvbiBvZiBuZXh0LWFyZzEsIG5leHQtYWRk
ciwgYW5kIG5leHQtbW9kZSBEVAo+ICAgcHJvcGVydGllcyBpbiBQQVRDSDIKPiAtIEFkZGVkIGRv
Y3VtZW50YXRpb24gb2YgaW5pdC1vcmRlciBEVCBwcm9wZXJ0eSBpbiBQQVRDSDMKPgo+IENoYW5n
ZXMgc2luY2UgdjE6Cj4gLSBSZW1vdmVkIHVud2FudGVkICJicmVhayIgZnJvbSB0aGUgbG9vcCBp
biBzYmlfZG9tYWluX2NvbnRleHRfZXhpdCgpCj4gLSBVc2Ugcm9vdCB2YWx1ZXMgd2hlbiAibmV4
dC1hcmcxIiwgIm5leHQtYWRkciIgYW5kICJuZXh0LW1vZGUiIERUCj4gICBwcm9wZXJ0aWVzIGFy
ZSBhYnNlbnQgaW4gdGhlIGRvbWFpbiBEVCBub2RlLgo+Cj4gQW51cCBQYXRlbCAoMyk6Cj4gICBs
aWI6IHNiaV9kb21haW46IENoZWNrIHBvc3NpYmxlIGhhcnRzIGluCj4gICAgIHNiaV9kb21haW5f
Y29udGV4dF9lbnRlci9leGl0KCkKPiAgIGxpYjogc2JpX2RvbWFpbjogUmUtd29yayBib290LXRp
bWUgYXNzaWdubWVudCBvZiBIQVJUcyB0byBub24tUk9PVAo+ICAgICBkb21haW5zCj4gICBsaWI6
IHNiaV9kb21haW46IEludHJvZHVjZSBkb21haW4gaW50aWFsaXphdGlvbiBvcmRlcgo+Cj4gIGRv
Y3MvZG9tYWluX3N1cHBvcnQubWQgICAgICAgICAgICAgfCAgNDkgKysrKysrLS0tLS0tLQo+ICBp
bmNsdWRlL3NiaS9zYmlfZG9tYWluLmggICAgICAgICAgIHwgICA2ICstCj4gIGluY2x1ZGUvc2Jp
X3V0aWxzL2ZkdC9mZHRfZG9tYWluLmggfCAgIDMgKy0KPiAgbGliL3NiaS9zYmlfZG9tYWluLmMg
ICAgICAgICAgICAgICB8ICA0NSArKysrKysrLS0tLS0KPiAgbGliL3NiaS9zYmlfZG9tYWluX2Nv
bnRleHQuYyAgICAgICB8ICAzMSArKysrKy0tLQo+ICBsaWIvdXRpbHMvZmR0L2ZkdF9kb21haW4u
YyAgICAgICAgIHwgMTEwICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDYgZmlsZXMg
Y2hhbmdlZCwgODkgaW5zZXJ0aW9ucygrKSwgMTU1IGRlbGV0aW9ucygtKQo+Cj4gLS0KPiAyLjQz
LjAKPgoKQXBwbGllZCB0aGlzIHNlcmllcyB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKUmVn
YXJkcywKQW51cAoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5z
YmkK
