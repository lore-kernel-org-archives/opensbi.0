Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8143CD8CB2
	for <opensbi@archiver.kernel.org>; Wed, 10 Jun 2026 12:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhAUw9nJCuDdFKWMyX6rCB8ngBqAvLMGGBvB945jplA=; b=RQeOAd0bJ3rjot
	aDm6vm64Wqp6i1gGqRlCgPUBY8RGsoqeiBZ7Ih15AoptTQZSe/yFEDHwiWCpwsOQb4PoNbcpbzF+n
	XZ2qoR0B55xIOfcnOspMdvpxKgEHGW0L7UN4cyFN8g33t0pqEox1OTL+515T1xES/j/6VKwbyWTED
	P8x0lx1L/37Ilmp1WQtW6wIP/F9C+1yAwIXhphOGOG6SZrxC3pHgyyOImgAqlFONJ+7QcIz7PPQUO
	qkaQ6ups/xtegdv75uFgqBTpdpPr/n2LsWQNb+sY6cU9y0OR1onu2rP0AxJy/0LGBIBQ5Ymn6mCMR
	W7vy4P6rX9FJTvt2qF6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIAH-00000007ePD-3MPe;
	Wed, 10 Jun 2026 12:36:13 +0000
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXIAF-00000007eOk-3BcJ
	for opensbi@lists.infradead.org;
	Wed, 10 Jun 2026 12:36:13 +0000
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-5176096116fso73383471cf.0
        for <opensbi@lists.infradead.org>; Wed, 10 Jun 2026 05:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781094970; cv=none;
        d=google.com; s=arc-20240605;
        b=K9becwqASjDRQPWsPxv3Eizd77TD/L5YACPMhhk+tbQtJf1eQYFT4s2My07NP5hHwB
         YPWO/dXkzgaJA2V87ljgCVl4OaW2SC+EGW28ji7mW9UREDPFfgR92gu11oJQn8RJ+UQA
         ZCHovZljBHryn2Wg732iIy/QXfeouztLIsd0Kzf877VPevc7aI7H7i5lKT2Vg/93VHx/
         RcO2IU/8SmDzXY2G44WO145eH2oiLR5TOKzaGMgEzmjTB2hQvNOlwgktC8u6PIf9+1BO
         Bbf+J6F8vcktD250/EjEx+n/7PKMM/TKM1vyqZdv5bMuYN++nhJaH9jIha0MT5XihqZ1
         M3Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3y5lToL18lF1q6oJcICLAYQnM/FJT2Opeu3J8IuLdvQ=;
        fh=s8r/FTK/68oCjpkCnOc1fK9DCo6TBMvdxlAYkLUYfOI=;
        b=AJw82LBYLxqU95AlYhCu2qDMFifYOgX9qgSCw3OT2iN05Te1fGrfI8oMoEF3gQqy3g
         PIfF2yLEHBmNafRmY2wzysd/phtzw3AlXuIFKVP0Zgf1AmgTkRKmzD2if9X6g15rqsbz
         5vVoAAo076HQOhZMV3skR8Gr6sw8QnrQvUIq7D2e6PJiL7FV22K08LB1PuLV8zRyIzUt
         hYedqSIGp45HTl8Qfr4DjrKX0xVm4KoRz3DbhaT47p8b5/pCVVqHcDhyvNmwuB2I5t33
         szRx/3VeW7A7pXssk3iMP/+fxRIMIh0Rwbsz/5U0Bj2YoOj9P+SNZhAQy3MXgDJ5E9Fl
         teuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781094970; x=1781699770; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3y5lToL18lF1q6oJcICLAYQnM/FJT2Opeu3J8IuLdvQ=;
        b=UxV9ZSPwJf3Rm1QL3bLlT1qEz9pmoUVq73/41E8kjfR+BbP7d1gENhdXhicm0XLc1k
         jLVqSoqR4biy+zmf+PQILNgbENBFbouUod+I9IQ2sUlzY0G1Gk8SGhUVprz2CCkQ031t
         5pcn+Bw2I9FyJA60QXZ4hdieistiJ/tg+MeDfdhvJwluYCtL7YJWkMEEY/23gRL0Uwnd
         isuEIy8n9qX4m9Um4PPX0JbUjPZhxgR2puWCM8GdRm6WJWebQNqYC5juQBFLY8Hb6ej/
         aM6ANQ9+5JliUCUK+Xae6r4BAhS25rumhSExq34Gp3CpXlc07g/sflHYDtTfeI/6kHtg
         ymfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781094970; x=1781699770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3y5lToL18lF1q6oJcICLAYQnM/FJT2Opeu3J8IuLdvQ=;
        b=S+haOhi07vGs81XpkKDzgNIR+RqaP9B3yXEx1R6axakzVE04d1+RkinUiwPBUggGxj
         Q1W/swusYPCgcWem7t6U/JG0Fdjo8jv0wWZ+g3pyA93CIPMNfKY9JM/QmOuJnskF0wpJ
         Pca45bsRIBHH2NLE0bX0Jf25DG9E0/YAkS4YPmqjjIILvWi+GlaBEU+wWThFCleT/dBe
         W5FG766CX9vE6auoh1xRaOcLwtGSS755TM3tOY8arqUNVS99ezHoCokHTfqj32SLE3Kr
         vMzpMbO5/Gqhd6azldanPIWMp2VFM77ObMF7FRHaTACCwFmKmegfbAgIqMu8MAPTcTwY
         Y2mQ==
X-Gm-Message-State: AOJu0Yzarss44JwViv4RmP3upfb1iJ+lSYS2lVj+RVSm8GteO7uFuTBp
	gAfMI0lJwfgnvXhJ0JyfSCAfDX1IbP+lGFb4Sq0gbT/tse6gnTA6vGQt0f3FJ4PiOJWo7nrgj+X
	+/EmbdLeW5OXFZtRO8RiRt8nx71/Mj8Bh/ejTkxzJFg==
X-Gm-Gg: Acq92OHe1mVOUowkVrPA3HvbzvQkweu69bivm51VbppaKxzsWSGmXoMoTik+QaOPEmT
	JWkrUntIU/7cmViiFThxCI7NWWHlMS0x9uJfw5EkY7PU7QnDnwGRyPcH6HgWcHfYbNpwtpyU2Vu
	cHxlmFG9+JSqCpfwCBlEA6A3x/zebOh+lRMDli1TAFtiHeKmdkWZbUYwRCkVBdT+JQgdaP+TkQq
	iwHau7e9pqbS1Mv3sdE+Wd7Tdm7fdArsr3b6O6v06Bo9BrP9EVR+P63RDjZdw/A6NbdGme4uxJz
	+ehWdpC56op0R5Ei8T0XcsDAk7dMEgDIAcrJ8eAAsRy5R7f6TczIwEnOIxX4mIcofadJddG0qMD
	e22jbg7uzvLXfHopOqjz+blZXkUijlKSD72FR
X-Received: by 2002:ac8:7f01:0:b0:517:8aed:1498 with SMTP id
 d75a77b69052e-51795ae6df5mr355177711cf.16.1781094969717; Wed, 10 Jun 2026
 05:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260430045528.420437-1-npiggin@gmail.com>
In-Reply-To: <20260430045528.420437-1-npiggin@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 10 Jun 2026 18:05:57 +0530
X-Gm-Features: AVVi8Ccp-OQnXGBhzLxYcHQAYJ4D2qkIcZ74TqgSRSb1GX_h8tuzz64gDwnG-O8
Message-ID: <CAAhSdy3Rj7dOUKm2D-5t6Vh0Naxatrz5reQj4YdhYZpebH503w@mail.gmail.com>
Subject: Re: [PATCH 0/7] Make PMP encoding usable for non-hart PMPs
To: Nicholas Piggin <npiggin@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_053611_926705_F15222A3 
X-CRM114-Status: GOOD (  19.24  )
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

T24gVGh1LCBBcHIgMzAsIDIwMjYgYXQgMTA6MjXigK9BTSBOaWNob2xhcyBQaWdnaW4gPG5waWdn
aW5AZ21haWwuY29tPiB3cm90ZToKPgo+IFRoZSBUZW5zdG9ycmVudCBSSVNDLVYgSU9NTVUgaW1w
bGVtZW50cyBQTVBzIHdpdGggTU1ScyBpbiB0aGUgc2FtZQo+IGZvcm1hdCBhcyBzcGVjaWZpZWQg
aW4gdGhlIFJJU0MtViBJU0EgZm9yIHRoZSBoYXJ0IENTUnMuIFRoaXMgc2VyaWVzCj4gc3BsaXRz
IG91dCB0aGUgUE1QIGVuY29kaW5nIGZ1bmN0aW9ucyBzbyBpdCBjYW4gYmUgc2hhcmVkIGJ5IGJv
dGgKPiB1c2Vycy4KPgo+IEkgbW92ZWQgdGhpcyBzZXJpZXMgb3V0IG9mIHRoZSBUZW5zdG9ycmVu
dCBBdGxhbnRpcyBwbGF0Zm9ybSBzZXJpZXMKPiB0aGF0IGluY2x1ZGVkIElPTU1VIHN1cHBvcnQs
IHRyaWVkIHRvIGRvIGJldHRlciBhdCBzcGxpdHRpbmcgaXQgdXAsCj4gdGlkaWVkIGFuZCBpbXBy
b3ZlZCBjb2RlLgo+Cj4gVGhlIG5ldyB1c2VyIG9mIHRoZSBBUEkgY2FuIGJlIHNlZW4gaGVyZSBm
b3IgcmVmZXJlbmNlICh3aWxsIG5vdAo+IHF1aXRlIGNvbXBpbGUgd2l0aCB0aGlzIG5ldyBzZXJp
ZXMpOgo+Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvb3BlbnNiaS8yMDI2MDMxMDAwNTAwMC4z
ODM3NTEyLTQtbnBpZ2dpbkBnbWFpbC5jb20vCj4KPiBJIHdpbGwgcG9zdCB0aGF0IG9uZSBvdXQg
YWdhaW4gYWZ0ZXIgdGhlIGJhc2UgQXRsYW50aXMgcGxhdGZvcm0gYW5kCj4gdGhpcyBzZXJpZXMg
aXMgbWVyZ2VkLgo+Cj4gVGhhbmtzLAo+IE5pY2sKPgo+IE5pY2hvbGFzIFBpZ2dpbiAoNyk6Cj4g
ICBsaWI6IHNiaTogSW50cm9kdWNlIHBtcF90IHR5cGUKPiAgIGxpYjogc2JpOiBzcGxpdCBQTVAg
ZW5jb2RpbmcgYW5kIENTUiBhY2Nlc3MKPiAgIGxpYjogc2JpOiBNb3ZlIFJJU0MtViBQTVAgZW5j
b2RpbmcgZnVuY3Rpb25zIHRvIHNiaV9wbXAuYwo+ICAgbGliOiBzYmk6IEFkZCBQTVAgQ1NSIHJl
YWQgYW5kIHdyaXRlIGFjY2Vzc29ycwo+ICAgbGliOiBzYmk6IEFkZCBwbXBfaXNfZW5hYmxlZCgp
IGhlbHBlcgo+ICAgbGliOiBzYmk6IEFkZCBoYXJ0XyBwcmVmaXggdG8gUE1QIGZ1bmN0aW9ucwo+
ICAgbGliOiBzYmk6IE1vdmUgaGFydCBQTVAgZnVuY3Rpb25zIHRvIHNiaV9oYXJ0X3BtcC5jCgpU
aGUgb25seSBtaW5vciBjb21tZW50IGlzIHRvIHVzZSAic2JpXyIgcHJlZml4IGZvciB2YXJpb3Vz
CnB1YmxpYyBmdW5jdGlvbnMgaW4gc2JpX3BtcC5oIGFuZCBzYmlfaGFydF9wbXAuaCBvdGhlcndp
c2UKdGhpcyBsb29rcyBnb29kIHRvIG1lLiBJIHdpbGwgdGFrZSBjYXJlIG9mIGl0IGF0IHRoZSB0
aW1lIG9mCm1lcmdpbmcuCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KCkFwcGxpZWQgdGhpcyBzZXJpZXMgdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRo
YW5rcywKQW51cAoKPgo+ICBpbmNsdWRlL3NiaS9yaXNjdl9hc20uaCAgICAgICAgICB8ICAxMiAt
LS0KPiAgaW5jbHVkZS9zYmkvc2JpX2hhcnRfcG1wLmggICAgICAgfCAgMTIgKysrCj4gIGluY2x1
ZGUvc2JpL3NiaV9wbXAuaCAgICAgICAgICAgIHwgIDIzICsrKysrCj4gIGxpYi9zYmkvb2JqZWN0
cy5tayAgICAgICAgICAgICAgIHwgICAxICsKPiAgbGliL3NiaS9yaXNjdl9hc20uYyAgICAgICAg
ICAgICAgfCAxNjIgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBsaWIvc2JpL3Ni
aV9oYXJ0X3BtcC5jICAgICAgICAgICB8IDEyOCArKysrKysrKysrKysrKysrKysrKysrLS0KPiAg
bGliL3NiaS9zYmlfcG1wLmMgICAgICAgICAgICAgICAgfCAxMDUgKysrKysrKysrKysrKysrKysr
KysKPiAgcGxhdGZvcm0vZ2VuZXJpYy9lc3dpbi9laWM3NzB4LmMgfCAgMzYgKysrLS0tLQo+ICA4
IGZpbGVzIGNoYW5nZWQsIDI3OSBpbnNlcnRpb25zKCspLCAyMDAgZGVsZXRpb25zKC0pCj4gIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL3NiaS9zYmlfcG1wLmgKPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGxpYi9zYmkvc2JpX3BtcC5jCj4KPiAtLQo+IDIuNTMuMAo+Cj4KPiAtLQo+IG9wZW5zYmkg
bWFpbGluZyBsaXN0Cj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCgotLSAKb3BlbnNiaSBtYWls
aW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
