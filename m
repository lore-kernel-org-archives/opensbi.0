Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D204EA3F27
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 15:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J/73jmt973QpcgTGHIAiReAa4S87MQNwZ4ijvnkQFPY=; b=OHtsc+e4BVXxpK
	e2Kw542ImHTDiaOUzMeWVXJIeLpybuDTTTeatUCXlGInBQV0q2OLtBgx0lPwupbUFQ2cinvWhDo5G
	7PqF6/kTwwL6eLonPR5zZeutINwmv3N+x02KiCQr/dbkGLkpkBgFe6QPRu+Ftkl67LUgS3heuicRG
	JrTxqtHpsqCoigR0lbdhVj3iG4tBa+2zXKmBqPai8N3P0C3nKWi5o3O+Jz7uCpoQuwLJ9sDtzruhG
	JxAOsCC8HGjrU1cvHZ2D7o15d2YGkfewNffDd2ysdtHmYDQt8BO56Lv5ge8MIY3hs3awz4JAL4tfa
	kpnXADomLLMOG5MB1jQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqC9t-00000000mnC-3hcD;
	Wed, 11 Feb 2026 15:29:41 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqC9s-00000000mmS-14vt
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 15:29:41 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-662f5c5507cso4537762eaf.3
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 07:29:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770823779; cv=none;
        d=google.com; s=arc-20240605;
        b=X1AmAO4eV7veEwmZQwZBaGvFfEVb95MYVGmQDIQZDQZYpF/DABoYiJXJoj7sec5hCp
         nVc6N5NoFighwdSC59sOrkhz0EOu42HtlLwqyG4k5VQsNmpzFt41Oh+qsZc3x7HwmgJI
         Gn2VQAM6QEmdZHt16YbtFv+3WpJ5KE/zOi+YSeON3HAKNpOMPUZFOQNy/I55zgfaLbE7
         gcMaeRr/DctFp8VaYONFlxksfGc+xognzAHu965Rl62N2hK8aQlq4emU0uYZ9+KzQqdk
         LnQG6fSOjU0vFbRQ+U91GpykpAypInu0sLbqPngof0VYF+EYCk6qre1BkAqFOIHmC7q0
         aDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aWZxvOeAycw7wBO3ZUqy+57vJC8vbM1qT2zV3d3enGA=;
        fh=FChK+hraIDH/7HwMZQVa2Pzj+yiymUQIqJV22IxlURw=;
        b=PbCpy4svVLVZM70yElNz8sgcC1H/pBInBoXqFz8hd4Kq5Z+L6VJfxZI1e5FzbVX3rh
         Qz99TBjNVUnHUaM1YuYlCtXswxOD7VlLBsGxicbICrv2jx7mjovZlDbnCxOuQSz1lrly
         5HljR3ANxzL+768VpbEdGqzir/FdswUYDJPkpkx+l4JgMmcnKZ0HH7LJvbjyczWcVVQU
         CygqbpRisRS25RRmMTLapC/ubG/9L6bvRHGYSAA1fiEV3GZyQ/ZFOh53yMpp44Aq236C
         CMtlQEJU/rVgk/cLih4RBU+eKIpp29Yjt9Oj/PA3j6rF6ytmGeoQwq3HxGX0n15ycRZT
         YwXQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1770823779; x=1771428579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aWZxvOeAycw7wBO3ZUqy+57vJC8vbM1qT2zV3d3enGA=;
        b=JV6WgsIIB8MDTLKOEsqdh/8EorkJq1GS2x/c4eB4LZ1ktCPIi9yEMbisC5qQhPBstg
         uibu+GMRDXobMgmginiI8zoVocD1O3hD6g13Md3W3GNsN7EVQVN7aAwnJGZ8WjgtxM2O
         +oJVGw3z/6HnGPkBSP3NjYJUKgYJcolu/5oaDaTmsn0UnIkv8WTsitiBt9O4XUKwu8hB
         Qqdi90L8Bek+L+Y89F9+4+7UngNXDCf2+03Cd6O+OIbEMh/Zny/pQWbgPquz1AdriSrG
         g0moXnDw2gYxY2vWaSu9QMxp5WgyxMI4FS7C+Z3KRpN+v42QKwxu0+5+REMkYLu/vSf6
         L9Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770823779; x=1771428579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWZxvOeAycw7wBO3ZUqy+57vJC8vbM1qT2zV3d3enGA=;
        b=ID0PZ+95HjRdj/g7N65jeijZ3sb0CUbXRdvr59JrOsxou1KZ9CI4RcIrkp2m947QGJ
         6aQHpGMbLOv+FPw8eZoGpMPq0grPMiu6tiLuOtx70P0FJtPVm8ilUz9BC5PJH3sDYlZd
         N9Gj9Z57y6bj55oGoKMpPwn4GprscElMdK1uXgFOfNWt/E/hRG2EquJQbRCce/aLxWB9
         LQuR53cqGiqDiZzLPRb1GpKVFMMwHH4Ky3g0GkWL+iMHGquqtLJvSwgXbYw9gIiwHTRs
         XdBt0nUIUmJhkoh2PxgZR8KQn27aSqlOzmkj0/DxUogCZHcTPn9DCrBKzGfzSIcAWfGV
         deMA==
X-Gm-Message-State: AOJu0Yxj+FEt0k5pWU02z6lYmTGVbqq3zvOJHXftuDUX1PZpTXEV1dA9
	iWs4Re5WeEegYJe4SRmHRCiaoqGClX4t7St66uNCtueIuPeuywRLHpKNJNenXdlJgfAulz9FO1u
	RKVSBGPEWa6EPslHEXFBx0NUtx6hhUxiJHUkfzEcdBw==
X-Gm-Gg: AZuq6aIDZ8wthJfmbtsaHQ+ZEL10uVqi2//MkuN2tKbhQIlXRsTSAXvMBs9ByGKKgds
	GZNZx3xr6dTaXT0dR8afYVhWmy2ygJRSJwyOEuvFbfvLhq7ZNZNuAjjPI80HX60wmXRMMwpzhCO
	cAd0yconZ1cuPbOIboO+Rds01mHUc9NbPziDYOxdYTCIFDjUVVcAmB4ki7jcDDBDxaAcNz86JmT
	//t1OTcU/DbudAr8cfJGf3zPUNftvY/JxHUdjXA7++lRx5sl8os4ydWHhrvr0yObtsQsAyklNAG
	LW66W7D8xZnl0EHKmQer8JDoZWe2Jq6UzpHfc9/S1gv8uRWfymH30H1cuFgZgkuwQBvGRbPX6Oy
	A+vw5
X-Received: by 2002:a05:6820:4dcb:b0:659:9a49:8f4c with SMTP id
 006d021491bc7-6747ee9a300mr982942eaf.17.1770823778933; Wed, 11 Feb 2026
 07:29:38 -0800 (PST)
MIME-Version: 1.0
References: <20251130111643.1291462-1-peter.lin@sifive.com>
In-Reply-To: <20251130111643.1291462-1-peter.lin@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 11 Feb 2026 20:59:27 +0530
X-Gm-Features: AZwV_QgcfM_cN_JsPNa5h3Wt7bO1gxjm-RRcWYLbJ-JbVJ8mnHywU5Kk109QGCk
Message-ID: <CAAhSdy1SoJc15PCXEmUAd4dNjXm5O=mCgtAUcnJEgJakqHpwSQ@mail.gmail.com>
Subject: Re: [RFC PATCH v3 0/6] Extend the reserved PMP entries
To: Yu-Chien Peter Lin <peter.lin@sifive.com>
Cc: opensbi@lists.infradead.org, zong.li@sifive.com, greentime.hu@sifive.com, 
	samuel.holland@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_072940_442050_B3D25122 
X-CRM114-Status: GOOD (  20.72  )
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

T24gU3VuLCBOb3YgMzAsIDIwMjUgYXQgNDo0NuKAr1BNIFl1LUNoaWVuIFBldGVyIExpbiA8cGV0
ZXIubGluQHNpZml2ZS5jb20+IHdyb3RlOgo+Cj4gVGhpcyBzZXJpZXMgZXh0ZW5kcyBPcGVuU0JJ
IHRvIHN1cHBvcnQgbXVsdGlwbGUgcmVzZXJ2ZWQgUE1QIGVudHJpZXMKPiB0aGF0IHBsYXRmb3Jt
cyBjYW4gY29uZmlndXJlIGZvciBjcml0aWNhbCBtZW1vcnkgcHJvdGVjdGlvbiBuZWVkcy4KPgo+
IEtleSBjaGFyYWN0ZXJpc3RpY3Mgb2YgcmVzZXJ2ZWQgUE1QIGVudHJpZXM6Cj4KPiAtIEhhdmUg
aGlnaGVzdCBwcmlvcml0eQo+IC0gQXZhaWxhYmxlIGluIFRvUiBtb2RlIGZvciBwbGF0Zm9ybS1z
cGVjaWZpYyB1c2UgY2FzZXMKPiAtIFBlcnNpc3RlbnQgYWNyb3NzIGRvbWFpbiBjb250ZXh0IHN3
aXRjaGVzIChjYW5ub3QgYmUgZGlzYWJsZWQpCj4gLSBTdXBwb3J0IHJ1bnRpbWUgYWxsb2NhdGlv
biB0aHJvdWdoIGEgZGVkaWNhdGVkIGFsbG9jYXRvciBBUEkKPgo+IE1vdGl2YXRpb246Cj4KPiBS
ZXNlcnZlZCBQTVAgZW50cmllcyBhZGRyZXNzIHRoZSBuZWVkIHRvIHByb3RlY3QgbWVtb3J5IHJl
Z2lvbnMgdGhhdAo+IGNhbm5vdCBiZSBjb3ZlcmVkIGJ5IGRvbWFpbi1tYW5hZ2VkIFBNUCBlbnRy
aWVzLiBGb3IgZXhhbXBsZSwgcGxhdGZvcm1zCj4gY2FuIGVuZm9yY2UgUE1BX1VOU0FGRSByZWdp
b25zIFsxXSBwYXJzZWQgZnJvbSB0aGUgZGV2aWNlIHRyZWUuIFRoZXNlCj4gcmVnaW9ucyBvZnRl
biBjYW5ub3QgYmUgcHJlY2lzZWx5IGNvdmVyZWQgYnkgb25lIG9yIHR3byBOQVBPVCBlbnRyaWVz
LAo+IHNvIHVzaW5nIHJlc2VydmVkIGVudHJpZXMgYWxsb2NhdGVkIGluIFRvUiBtb2RlIG9wdGlt
aXplcyBQTVAgdXNhZ2UuCgpUb1IgaGFzIGl0cyBvd24gZG93bnNpZGUgYmVjYXVzZSB0aGUgbmV4
dCBQTVAgZW50cnkgbWFya3MgdGhlIGVuZCBvZgp0aGUgVG9SIFBNUCByZWdpb24gc28gaW4gbWFu
eSBjYXNlcyB3ZSBtaWdodCBlbmR1cCB1c2luZyBtb3JlIFBNUAplbnRyaWVzIHdpdGggVG9SIGFz
IGNvbXBhcmVkIHRvIE5BUE9ULgoKRm9yIHRoZSBvcHRpbWFsIG51bWJlciBvZiBQTVAgZW50cmll
cywgdGhlcmUgaXMgbm8gY2xlYXIgd2lubmVyIGluIHRoZQpOQVBPVCB2cyBUb1IgZGViYXRlLgoK
Pgo+IEFkZGl0aW9uYWxseSwgcmVzZXJ2ZWQgZW50cmllcyByZW1haW4gdW5jaGFuZ2VkIGFjcm9z
cyBkb21haW4gdHJhbnNpdGlvbnMKPiBhbmQgcGVyc2lzdCB1bnRpbCBoYXJ0IHJlc2V0LCBlbnN1
cmUgY29uc2lzdGVudCBwcm90ZWN0aW9ucy4KPgo+IFVzZSBjYXNlIGRlbW9uc3RyYXRpb246Cj4K
PiBUaGlzIHNlcmllcyBpbmNsdWRlcyBhIGRlbW9uc3RyYXRpb24gb24gdGhlIFNpRml2ZSBGVTU0
MCBwbGF0Zm9ybSwgd2hpY2gKPiB1c2VzIGEgcmVzZXJ2ZWQgUE1QIGVudHJ5IHRvIHByb3RlY3Qg
dGhlIG1lbW9yeSByZWdpb24gYXQgMHgwLTB4MTAwMAo+IGR1cmluZyBlYXJseSBib290LiBUaGlz
IHNlcnZlcyBhcyBhIHJlZmVyZW5jZSBpbXBsZW1lbnRhdGlvbiBzaG93aW5nIGhvdwo+IHBsYXRm
b3JtcyBjYW4gbGV2ZXJhZ2UgdGhlIHJlc2VydmVkIFBNUCBhbGxvY2F0b3IuCgpJbnN0ZWFkIG9m
IHRoZSBpbmZyYXN0cnVjdHVyZSBhZGRlZCBieSB0aGlzIHNlcmllcywgYSBwbGF0Zm9ybSBjYW4K
c2ltcGx5IGFkZCByb290IG1lbXJlZ2lvbnMgaW4gc2JpX3BsYXRmb3JtX2Vhcmx5X2luaXQoKSB1
c2luZwpzYmlfZG9tYWluX3Jvb3RfYWRkX21lbXJhbmdlKCkuCgpJZiB0aGUgYWJvdmUgaXMgc3Rp
bGwgbm90IHN1ZmZpY2llbnQgdGhlbiB0aGUgcGxhdGZvcm0gY2FuIGhhdmUgYSBzZXBhcmF0ZQpo
b29rIGZvciByZXNlcnZlZCBQTVAgZW50cmllcyBhcyBiZWxvdyAoYWx0aG91Z2ggSSBkb24ndCBy
ZWNvbW1lbmQgaXQpLgoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvc2JpL3NiaV9wbGF0Zm9ybS5oIGIv
aW5jbHVkZS9zYmkvc2JpX3BsYXRmb3JtLmgKaW5kZXggZTY1ZDk4NzcuLjRlY2M0NTgyIDEwMDY0
NAotLS0gYS9pbmNsdWRlL3NiaS9zYmlfcGxhdGZvcm0uaAorKysgYi9pbmNsdWRlL3NiaS9zYmlf
cGxhdGZvcm0uaApAQCAtMTQ5LDYgKzE0OSw4IEBAIHN0cnVjdCBzYmlfcGxhdGZvcm1fb3BlcmF0
aW9ucyB7CiAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGxvZzJsZW4pOwogICAgIC8qKiBwbGF0
Zm9ybSBzcGVjaWZpYyBwbXAgZGlzYWJsZSBvbiBjdXJyZW50IEhBUlQgKi8KICAgICB2b2lkICgq
cG1wX2Rpc2FibGUpKHVuc2lnbmVkIGludCBuKTsKKyAgICAvKiogcGxhdGZvcm0gc3BlY2lmaWMg
d2F5IHRvIHVwZGF0ZSBhIFBNUCBlbnRyeSBhcyByZXNlcnZlZCBvbgpjdXJyZW50IEhBUlQgKi8K
KyAgICBib29sICgqcG1wX3VwZGF0ZV9yZXNlcnZlZCkodW5zaWduZWQgaW50IG4sIGJvb2wgc2tp
cF93cml0ZSk7CiB9OwoKIC8qKiBQbGF0Zm9ybSBkZWZhdWx0IHBlci1IQVJUIHN0YWNrIHNpemUg
Zm9yIGV4Y2VwdGlvbi9pbnRlcnJ1cHQgaGFuZGxpbmcgKi8KQEAgLTY4Nyw2ICs2ODksMjMgQEAg
c3RhdGljIGlubGluZSB2b2lkIHNiaV9wbGF0Zm9ybV9wbXBfZGlzYWJsZShjb25zdApzdHJ1Y3Qg
c2JpX3BsYXRmb3JtICpwbGF0LAogICAgICAgICBzYmlfcGxhdGZvcm1fb3BzKHBsYXQpLT5wbXBf
ZGlzYWJsZShuKTsKIH0KCisvKioKKyAqIFBsYXRmb3JtIHNwZWNpZmljIHdheSB0byB1cGRhdGUg
YSBQTVAgZW50cnkgYXMgcmVzZXJ2ZWQgb24gY3VycmVudCBIQVJUCisgKgorICogQHBhcmFtIHBs
YXQgcG9pbnRlciB0byBzdHJ1Y3Qgc2JpX3BsYXRmb3JtCisgKiBAcGFyYW0gbiBpbmRleCBvZiB0
aGUgcG1wIGVudHJ5CisgKiBAcGFyYW0gc2tpcF93cml0ZSBmbGFnIGluZGljYXRpbmcgcG1wIGVu
dHJ5IG11c3Qgbm90IGJlIHdyaXR0ZW4KKyAqCisgKiBAcmV0dXJuIHRydWUgaWYgYSBwbXAgZW50
cnkgaXMgcmVzZXJ2ZWQgYW5kIGZhbHNlIG90aGVyd2lzZQorICovCitzdGF0aWMgaW5saW5lIGJv
b2wgc2JpX3BsYXRmb3JtX3BtcF91cGRhdGVfcmVzZXJ2ZWQoY29uc3Qgc3RydWN0CnNiaV9wbGF0
Zm9ybSAqcGxhdCwKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgbiwg
Ym9vbCBza2lwX3dyaXRlKQoreworICAgIGlmIChwbGF0ICYmIHNiaV9wbGF0Zm9ybV9vcHMocGxh
dCktPnBtcF91cGRhdGVfcmVzZXJ2ZWQpCisgICAgICAgIHJldHVybiBzYmlfcGxhdGZvcm1fb3Bz
KHBsYXQpLT5wbXBfdXBkYXRlX3Jlc2VydmVkKG4sIHNraXBfd3JpdGUpOworICAgIHJldHVybiBm
YWxzZTsKK30KKwogI2VuZGlmCgogI2VuZGlmCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9oYXJ0
X3BtcC5jIGIvbGliL3NiaS9zYmlfaGFydF9wbXAuYwppbmRleCBiZTQ1OTEyOS4uMjcyNDIxMTMg
MTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnRfcG1wLmMKKysrIGIvbGliL3NiaS9zYmlfaGFy
dF9wbXAuYwpAQCAtMTIwLDYgKzEyMCw3IEBAIHN0YXRpYyBib29sIGlzX3ZhbGlkX3BtcF9pZHgo
dW5zaWduZWQgaW50CnBtcF9jb3VudCwgdW5zaWduZWQgaW50IHBtcF9pZHgpCgogc3RhdGljIGlu
dCBzYmlfaGFydF9zbWVwbXBfY29uZmlndXJlKHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkK
IHsKKyAgICBjb25zdCBzdHJ1Y3Qgc2JpX3BsYXRmb3JtICpwbGF0ID0gc2JpX3BsYXRmb3JtX3B0
cihzY3JhdGNoKTsKICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZzsKICAgICBz
dHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tID0gc2JpX2RvbWFpbl90aGlzaGFydF9wdHIoKTsKICAgICB1
bnNpZ25lZCBpbnQgcG1wX2xvZzJncmFuLCBwbXBfYml0czsKQEAgLTE0Nyw2ICsxNDgsOSBAQCBz
dGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF9jb25maWd1cmUoc3RydWN0CnNiaV9zY3JhdGNoICpz
Y3JhdGNoKQogICAgICAgICAvKiBTa2lwIHJlc2VydmVkIGVudHJ5ICovCiAgICAgICAgIGlmIChw
bXBfaWR4ID09IFNCSV9TTUVQTVBfUkVTVl9FTlRSWSkKICAgICAgICAgICAgIHBtcF9pZHgrKzsK
KyAgICAgICAgd2hpbGUgKHNiaV9wbGF0Zm9ybV9wbXBfdXBkYXRlX3Jlc2VydmVkKHBsYXQsIHBt
cF9pZHgsIGZhbHNlKSkKKyAgICAgICAgICAgIHBtcF9pZHgrKzsKKwogICAgICAgICBpZiAoIWlz
X3ZhbGlkX3BtcF9pZHgocG1wX2NvdW50LCBwbXBfaWR4KSkKICAgICAgICAgICAgIHJldHVybiBT
QklfRUZBSUw7CgpAQCAtMTkwLDYgKzE5NCw5IEBAIHN0YXRpYyBpbnQgc2JpX2hhcnRfc21lcG1w
X2NvbmZpZ3VyZShzdHJ1Y3QKc2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCiAgICAgICAgIC8qIFNraXAg
cmVzZXJ2ZWQgZW50cnkgKi8KICAgICAgICAgaWYgKHBtcF9pZHggPT0gU0JJX1NNRVBNUF9SRVNW
X0VOVFJZKQogICAgICAgICAgICAgcG1wX2lkeCsrOworICAgICAgICB3aGlsZSAoc2JpX3BsYXRm
b3JtX3BtcF91cGRhdGVfcmVzZXJ2ZWQocGxhdCwgcG1wX2lkeCwgdHJ1ZSkpCisgICAgICAgICAg
ICBwbXBfaWR4Kys7CisKICAgICAgICAgaWYgKCFpc192YWxpZF9wbXBfaWR4KHBtcF9jb3VudCwg
cG1wX2lkeCkpCiAgICAgICAgICAgICByZXR1cm4gU0JJX0VGQUlMOwoKQEAgLTI1NSw2ICsyNjIs
NyBAQCBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF91bm1hcF9yYW5nZShzdHJ1Y3QKc2JpX3Nj
cmF0Y2ggKnNjcmF0Y2gsCgogc3RhdGljIGludCBzYmlfaGFydF9vbGRwbXBfY29uZmlndXJlKHN0
cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKIHsKKyAgICBjb25zdCBzdHJ1Y3Qgc2JpX3BsYXRm
b3JtICpwbGF0ID0gc2JpX3BsYXRmb3JtX3B0cihzY3JhdGNoKTsKICAgICBzdHJ1Y3Qgc2JpX2Rv
bWFpbl9tZW1yZWdpb24gKnJlZzsKICAgICBzdHJ1Y3Qgc2JpX2RvbWFpbiAqZG9tID0gc2JpX2Rv
bWFpbl90aGlzaGFydF9wdHIoKTsKICAgICB1bnNpZ25lZCBsb25nIHBtcF9hZGRyLCBwbXBfYWRk
cl9tYXg7CkBAIC0yNjksNiArMjc3LDkgQEAgc3RhdGljIGludCBzYmlfaGFydF9vbGRwbXBfY29u
ZmlndXJlKHN0cnVjdApzYmlfc2NyYXRjaCAqc2NyYXRjaCkKCiAgICAgcG1wX2lkeCA9IDA7CiAg
ICAgc2JpX2RvbWFpbl9mb3JfZWFjaF9tZW1yZWdpb24oZG9tLCByZWcpIHsKKyAgICAgICAgd2hp
bGUgKHNiaV9wbGF0Zm9ybV9wbXBfdXBkYXRlX3Jlc2VydmVkKHBsYXQsIHBtcF9pZHgsIGZhbHNl
KSkKKyAgICAgICAgICAgIHBtcF9pZHgrKzsKKwogICAgICAgICBpZiAoIWlzX3ZhbGlkX3BtcF9p
ZHgocG1wX2NvdW50LCBwbXBfaWR4KSkKICAgICAgICAgICAgIHJldHVybiBTQklfRUZBSUw7CgpS
ZWdhcmRzLApBbnVwCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQo=
