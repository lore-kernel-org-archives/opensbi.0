Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBB3C624DE
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IkFY2iZCMGBQ0XYtSSMHuyPpOVVtflwcg5X/4wT9+sg=; b=li5u564wyuLDK0
	j7MNyDfWl/vAonKt1Aj8BMetrN0OhoIfqZxr+BazU+uSXwtZWXZ5Zax5JbegslY+ZmsAlcZ3vV1QX
	Imjg6h2ASuWXxQkqiNWbIOr2oPWM9PrqhPcLcUd3x6bLJy9mQ9NjGkNzMyETI5uSP9cDe5FBZ6xij
	+mIYZENwRvxr+Zxs8Q3EkHuMSU09GczkIIVZNqicaSPEOnyD9OS7xf7/9mSMaFjGgjsZ77NAosRp4
	Wd1P1N3KsuVZ+08HROc0NRxQA1KdXDvmjz+8OscYU/eVWAL+sv5I46H+QS2yCFTxBVldMNJiHfX1h
	wxQYlJiuFkwzroB+yWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omj-00000001IzU-0keo;
	Fri, 04 Sep 2026 07:56:29 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Omg-00000001Iyq-2rYI
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 07:56:28 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48584dc164fso656958f8f.0
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 00:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788508584; cv=none;
        d=google.com; s=arc-20260327;
        b=NnekfGwz00IccBAV03kWZkM+naJ0N8BpAq2oRd1g4HQQMCtdsA/+nnxiEUgyJqQMak
         P1CN3c75qezbrEwGrcGgXGfs1IuWOvrbktuWyp58vfywe1pL2buMWhi5hQYACDT4UlAA
         r4v5AzbTxrLGXbwmRLmSZu2+HoIE/aD2w4dUdIyYKYE+UWf2VfYLDyTfAgAZgbQRtZgk
         aIo1sO3ybSNquu814CWo+0Y7BdsWbJ+SdMHDWA5bTYhf2c4Tbt7yncAlUEW38K76RGj4
         c/cGA/kZ21Ady8Qu2mUDQEFzx5tACIbIPgyunsZPeKTJYq7mz2VtfNXZaofbk9ap4GZs
         fbbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LVXElCaEzIyjQBzcRDNbBfnl0eFM1sZKM9qXiuo5DYU=;
        fh=KFL2ZnSEuyOnR/Qh1iesqX1KcdxrnTrRWFET+qVGlVQ=;
        b=BZXknQPNvaZpUo4xJGww+nh6/JxSYPPqAQjQwyQ5FoPCvfUeY5KEiu/uoSvNrGbO+S
         +ZGGgW0gEn16MJDNUO8HOyOOY8GjMTPQQVzW9FqLfwxKBTiEI5ggf+UFGjNKpHeTV5q1
         08u6Nf84cQKVeMSErvEwo6iDng49oNpi+U+LLcW9M0rdLbP66er7hkP8//wR454Ywcrx
         U7vEesHjt/Dzie/GPCXAC8yJrY5SL8uPVsVdqplAKnniIXN6V7zvb6lwtNBY9IPfFFij
         PsiUSRsjkmafMWKLLuTkVfjj7ciU7COkA9yECKyA0m/LfMR/u8urTLRqQvLFf/Vb+1m3
         g6Tw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1788508584; x=1789113384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LVXElCaEzIyjQBzcRDNbBfnl0eFM1sZKM9qXiuo5DYU=;
        b=IOEKY5atLKlk4YnlQPDOXMB5GS52IrBD+Xc21o7R/TG8954cRL9ZK4gWNJqvkfYXXS
         ypv6WlH6q7JEvYnFmB7J2tj6cIFY26ivDGGStXcR7dA3wHOKdTgu46mPpoLfCWNYV+xR
         bHw3Tp1NMHLSkBcZK1PPVgE3piVXZRKWHaf3V/7lWT0N+nloGuKGkiBEuAS40FoXg60S
         vCs0OU9QdwAILpTq7pPfyEWILd+UxDiC2xWYPIYEtvhyDXWZexucjfIrvPpxGG246JWD
         pKVYgr5ROXOQO4cgi71p3tVv9Z4m2M58ljYtEhWqN3BhyIaNa3mro7fPdQR1bKuaW0BS
         Nkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788508584; x=1789113384;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LVXElCaEzIyjQBzcRDNbBfnl0eFM1sZKM9qXiuo5DYU=;
        b=eQc4bkkKB+VJSXNq01oaUXRl2J9wuIaHJPL45d25KLZuT2PdaVJKIxeB6sgzdEVR8+
         lAMcxn+kTtuY361sG8cWxrPMv3xXUbuHOkunBXjY4+x+U692zuIuVWJavJoTP1a6hEED
         pj1D3TupzBfKSEgBAhWgVAQt6CFSJn6NZphSycsvpZLDgjySv9CxfYnFUTG33YZYZzql
         593tqZG469SkWv6voFNzKgU182HAmI3oEAZumJyGhyXe/Ovq2gJCl9qTIcpI+3TXcXE1
         G7qsXQlIMvE+OgGaE46Ff9pTuqZh0Dw8HMWcwTs8s1aEQyqb0UzbaRG6lfV0W2KiDv+p
         EEFA==
X-Gm-Message-State: AFuF++kYxWGw412C4lWPTho5+RmbT1T0JcyaSw6wxe7TWSJEDnDSYxlF
	VMA2n6vrH84YuUT+li1wTuUEkLFpUoyGGBqhwv7p4DSdbRkiteZU9r1b3a5UwGLensXMevg1d03
	I++8HhZpqx7nBhngZ2KCKZ38LCJ9TQAd18Tfsp1XKFR4DcQK8Zac55rc=
X-Gm-Gg: AYBFou0K8h3wdQ2xaZI/JjXOZssFRgFMInYGiYwZR+8wbJNK4EJGyjtJmoNfaQAW3Tc
	FO8lU8MFJARh8JPzlaO4cx5wS8B3PL0mkfbYU0xMLFwJV/wR9cE+AqwbADTYCmlA+KR/ii3EzDm
	GRXO61c7enmVciIEKmpdhIKd1WewjU3I8kZ+muwDlsEzOgquZu7apaMrNSwixqSpWeXsoPNf4jY
	VWZo77WV8O5WSCVlTlHmIdB/4VdrjLH0Fi8ZsHsaM8MZUEVIzXb4RjN2vq/llhT1I+VEpsM+joE
	mZf2i3Blby3pEcWX3vJFnzftkIJ6T3wVDlxSH99RESUVtri4hV6EcIat7iA1wK8Em/hDDir/VlT
	t3CRN+XW5G6VYuw4geOwyMoce1ke2+yWydjTZyFs+M9EyeRdyZAafPEBCUD8d39g=
X-Received: by 2002:a5d:5f94:0:b0:485:8a46:7063 with SMTP id
 ffacd0b85a97d-4858a46724emr2319755f8f.53.1788508583732; Fri, 04 Sep 2026
 00:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260803171128.3506804-1-david.garcia@aheadcomputing.com>
 <20260818210023.466462-1-david.garcia@aheadcomputing.com> <20260818210023.466462-2-david.garcia@aheadcomputing.com>
In-Reply-To: <20260818210023.466462-2-david.garcia@aheadcomputing.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 4 Sep 2026 13:26:12 +0530
X-Gm-Features: AcwNN1WDnYv-37JqhYF1ywQG2sNcvd2_mXQFEn5WsjHsUV18FsYTiVh8NNo22fY
Message-ID: <CAAhSdy3+Bv0YgW4h5sV8N-gE2fNjVU+uMsi_u5Z2=UZWMsbyPA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] lib: sbi_pmu: Return invalid param error for
 reserved event_idx bits
To: "David E. Garcia Porras" <david.garcia@aheadcomputing.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_005626_754126_3ADA05DC 
X-CRM114-Status: GOOD (  21.38  )
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

T24gV2VkLCBBdWcgMTksIDIwMjYgYXQgMjozMOKAr0FNIERhdmlkIEUuIEdhcmNpYSBQb3JyYXMK
PGRhdmlkLmdhcmNpYUBhaGVhZGNvbXB1dGluZy5jb20+IHdyb3RlOgo+Cj4gQXMgcGVyIHNlY3Rp
b24gMTEuMTQgb2YgdGhlIFNCSSBzcGVjaWZpY2F0aW9uIChGdW5jdGlvbjogR2V0IFBNVSBFdmVu
dAo+IEluZm8sIEZJRCAjOCksIFRhYmxlIDQ3LCB0aGUgZXZlbnRfaWR4IHdvcmQgb2YgYW4gZXZl
bnQgaW5mbyBlbnRyeQo+IG9ubHkgdXNlcyBCSVRbMDoxOV07IEJJVFsyMDozMV0gYXJlIHJlc2Vy
dmVkIGZvciB0aGUgZnV0dXJlIHB1cnBvc2UKPiBhbmQgbXVzdCBiZSB6ZXJvLiBUYWJsZSA0OCBm
dXJ0aGVyIHJlcXVpcmVzIHRoZSBTQkkgaW1wbGVtZW50YXRpb24gdG8KPiByZXR1cm4gU0JJX0VS
Ul9JTlZBTElEX1BBUkFNIGlmIGFueSByZXNlcnZlZCBiaXQgaW4gYW4gZXZlbnRfaWR4IHdvcmQK
PiBpcyBzZXQuCj4KPiBzYmlfcG11X2V2ZW50X2dldF9pbmZvKCkgZG9lcyBub3QgY2hlY2sgdGhl
IHJlc2VydmVkIGJpdHMsIHNvIGEKPiBtYWxmb3JtZWQgZXZlbnRfaWR4IGlzIHNpbGVudGx5IHBh
c3NlZCBvbiB0byBwbXVfZXZlbnRfdmFsaWRhdGUoKQo+IGluc3RlYWQgb2YgZmFpbGluZyB0aGUg
Y2FsbC4gQWRkIFNCSV9QTVVfRVZFTlRfSURYX01CWl9NQVNLIGNvdmVyaW5nCj4gdGhlIG11c3Qt
YmUtemVybyBiaXRzIGFuZCByZXR1cm4gU0JJX0VSUl9JTlZBTElEX1BBUkFNIHdoZW4gYW55IG9m
Cj4gdGhlbSBhcmUgc2V0Lgo+Cj4gRml4ZXM6IGU0MzQ1ODQyMTY4YiAoImxpYjogc2JpX3BtdTog
SW1wbGVtZW50IFNCSSBQTVUgZXZlbnQgaW5mbyBmdW5jdGlvbiIpCj4gU2lnbmVkLW9mZi1ieTog
RGF2aWQgRS4gR2FyY2lhIFBvcnJhcyA8ZGF2aWQuZ2FyY2lhQGFoZWFkY29tcHV0aW5nLmNvbT4K
CkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFw
cGxpZWQgdGhpcyBwYXRjaCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVw
CgoKPiAtLS0KPiAgaW5jbHVkZS9zYmkvc2JpX2VjYWxsX2ludGVyZmFjZS5oIHwgMiArKwo+ICBs
aWIvc2JpL3NiaV9wbXUuYyAgICAgICAgICAgICAgICAgfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9lY2Fs
bF9pbnRlcmZhY2UuaCBiL2luY2x1ZGUvc2JpL3NiaV9lY2FsbF9pbnRlcmZhY2UuaAo+IGluZGV4
IGFjYjkxYTAxLi5iZmRlMjVkMCAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL3NiaS9zYmlfZWNhbGxf
aW50ZXJmYWNlLmgKPiArKysgYi9pbmNsdWRlL3NiaS9zYmlfZWNhbGxfaW50ZXJmYWNlLmgKPiBA
QCAtMjcxLDYgKzI3MSw4IEBAIHN0cnVjdCBzYmlfcG11X2V2ZW50X2luZm8gewo+ICAjZGVmaW5l
IFNCSV9QTVVfRVZFTlRfSURYX1RZUEVfT0ZGU0VUIDE2Cj4gICNkZWZpbmUgU0JJX1BNVV9FVkVO
VF9JRFhfVFlQRV9NQVNLICgweEYgPDwgU0JJX1BNVV9FVkVOVF9JRFhfVFlQRV9PRkZTRVQpCj4g
ICNkZWZpbmUgU0JJX1BNVV9FVkVOVF9JRFhfQ09ERV9NQVNLIDB4RkZGRgo+ICsjZGVmaW5lIFNC
SV9QTVVfRVZFTlRfSURYX01CWl9PRkZTRVQgMjAKPiArI2RlZmluZSBTQklfUE1VX0VWRU5UX0lE
WF9NQlpfTUFTSyAoMHhGRkYgPDwgU0JJX1BNVV9FVkVOVF9JRFhfTUJaX09GRlNFVCkKPiAgI2Rl
ZmluZSBTQklfUE1VX0VWRU5UX1JBV19JRFggMHgyMDAwMAo+ICAjZGVmaW5lIFNCSV9QTVVfRVZF
TlRfUkFXX1YyX0lEWCAweDMwMDAwCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfcG11LmMg
Yi9saWIvc2JpL3NiaV9wbXUuYwo+IGluZGV4IGEwZjZkMmZhLi40NTU4ODc2ZSAxMDA2NDQKPiAt
LS0gYS9saWIvc2JpL3NiaV9wbXUuYwo+ICsrKyBiL2xpYi9zYmkvc2JpX3BtdS5jCj4gQEAgLTEw
OTgsNiArMTA5OCw5IEBAIGludCBzYmlfcG11X2V2ZW50X2dldF9pbmZvKHVuc2lnbmVkIGxvbmcg
c2htZW1fcGh5c19sbywgdW5zaWduZWQgbG9uZyBzaG1lbV9waHlzCj4gICAgICAgICBlaW5mbyA9
IChzdHJ1Y3Qgc2JpX3BtdV9ldmVudF9pbmZvICopKHNobWVtX3BoeXNfbG8pOwo+ICAgICAgICAg
Zm9yIChpID0gMDsgaSA8IG51bV9ldmVudHM7IGkrKykgewo+ICAgICAgICAgICAgICAgICBldmVu
dF9pZHggPSBlaW5mb1tpXS5ldmVudF9pZHg7Cj4gKyAgICAgICAgICAgICAgIC8qIEFueSBtdXN0
LWJlLXplcm8gZXZlbnRfaWR4IGJpdHMgc2V0IHNob3VsZCByZXR1cm4gSU5WQUxJRF9QQVJBTSBw
ZXItc3BlYyAqLwo+ICsgICAgICAgICAgICAgICBpZiAoZXZlbnRfaWR4ICYgU0JJX1BNVV9FVkVO
VF9JRFhfTUJaX01BU0spCj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJf
SU5WQUxJRF9QQVJBTTsKPiAgICAgICAgICAgICAgICAgZXZlbnRfdHlwZSA9IHBtdV9ldmVudF92
YWxpZGF0ZShwaHMsIGV2ZW50X2lkeCwgZWluZm9baV0uZXZlbnRfZGF0YSk7Cj4gICAgICAgICAg
ICAgICAgIGlmIChldmVudF90eXBlIDwgMCkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGVp
bmZvW2ldLm91dHB1dCA9IDA7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1haWxp
bmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBs
aXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
