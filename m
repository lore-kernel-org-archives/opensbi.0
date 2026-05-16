Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B46CD4F21
	for <opensbi@archiver.kernel.org>; Sat, 16 May 2026 17:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L0a2OSlzf3c4GHVJk5jj5d731OdWj4jLBJ8oiWwKHbw=; b=RA0e7pYW70GTmV
	DK/ur/ZGslfn497AQn1YAJopYmxrp/2auQtape28WL9P/BlKYznf0cH5YcnRPJoMz6BuGRBxovlwm
	2B4eGquR2R0wzHB0Vhx09WBnwP2ngfl9uqbmmAwtjbfhoEfoR1sTe3Di32/T0nEUsNT7kDwhSz1Hz
	+K4j8NasuMcHpKZ6mXnpNtvCMH4gZs9wrQP8dC7dAg4c6/ybcNObN04O1UlbINWMMo9ZBGD9iFHQd
	NuriqLRCZuUTrxPnDmyFvstNZiSkEJ2vryEDJkbAR/monoDKc/ldCxNidLPNrN8xZeCeylLbJSv5I
	OtbmtRWIJn14ecXPVknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIde-0000000B5P9-3LPc;
	Sat, 16 May 2026 17:17:22 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOIdb-0000000B5Ob-2DqH
	for opensbi@lists.infradead.org;
	Sat, 16 May 2026 17:17:21 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso6335275e9.2
        for <opensbi@lists.infradead.org>; Sat, 16 May 2026 10:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778951837; x=1779556637; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9IPi3EFExbVMcbxO5v6groQLeJ1Hxy4Dp4WtOowTTU8=;
        b=BrOKIVQtBIn8Mays0nyu73y/4McUnAkt/y6+8Gz1uhoAwVffJP294l5TA58jxnvlxb
         ZHBqTaW4lCwlGv2Sw8O9oqG81hlnmqWdkHgpD3I9pPxY+iRi+H0FtSKEVPLAmj9QuP+f
         PZUGnBaj8CYNVdo+y3Ht+OIn97iSvCbAghAtmUMF9P8Y5eWq6txsRbLaOf8KS+A044nw
         t5VNTuwKcTy1DdWZA7Ha6YLIQFFOfRCb/3qCxaTu/OLn5tTqVFYQLs+J2HODvUdLovS/
         LDomNUPQFFaQVcs3HFbKX0bMXNl9jGmS+Vvnc6OuguCnNF1uGN/4/FbrvNR7YM/169Bn
         6lNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778951837; x=1779556637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IPi3EFExbVMcbxO5v6groQLeJ1Hxy4Dp4WtOowTTU8=;
        b=RpgLmSJP7fsAdQ/M2+LpLCd+B9CyqyHTSyJTlxoUrs0JqbHMX4xNkBn0EaFZnpPyn2
         vToCoNi0DRN7PMRRvmmA35V79RCBxVPUNTFoc9GY3STGYitusNqEyMi2b6RlEBME9hiO
         IXHPHw46472t+DwdWiWMI9+B5RK7k7YFT/efF3w3iUNI7PvglVFsd6gmCgIx/FVH+D8s
         6jigSVYOKAi7RFAu4svtPbdbZ9tZyHNdC0yZYklZe0LFxCiF2xtLtc+N3Ahbwf35vVqm
         GC1H1+yrtKjQDdZEkklj1pv9bmrtXgCFC4Y5gbMBghIEcanEBT/AWfALRN3XtSWH169e
         0XJA==
X-Forwarded-Encrypted: i=1; AFNElJ9/4udFW3QP9TlvYBx+u6qkDd1tkS5i8GpLC10TnL/HnbO0M6Fz0fPUd8ZlnSL3oBs7AZkYLNxm@lists.infradead.org
X-Gm-Message-State: AOJu0YyjG3wZmacwjq6tqqFlNw3N4CQFRp0x/p/+DZ7M61rpbunr73NN
	Weq5XC/JIgX/g8Yr/Avx4RWOdehy6K1ixW231e0KLImNBdJhaQgjnuKk7tfkkCC03rU=
X-Gm-Gg: Acq92OHRkWJ8NAMvdhWUVyLH259cM0IvTDa2aNGXQWG6gjm1VY2ZOmqcl+rmMKmGh0Y
	e8FeAm9A+OTbrnQRHMt+V8tALYCGtUkcl/SQSbIpbbvcp/1SU2L0SkMGWcCKOIcFhO+p0pBsido
	hGYzJncNy4su23DhaEOQYxXZhdLzu9ql4jtoNo6/TwyLmZuMsLS8LfX+WW7USHqDqWHWgMxT1pV
	Pfv5Jwc8d0P1DdF3zS6QBOe5fc58zbrUPere5syyxy5bS3+q/mrPAW49lu19EZVlqD1SWo5/8tW
	wW8jfTvnusFI6CbFPqBF8lyyhowysCCO8/v4XNo3oL3/753m+ZaR5jYz0yaxUl51N6o5On0x0KR
	nSCOA3x9mOgScBqXL1io1xqscYav7l9CHSiswkghAiZjSEy1CdJTvgycjdNSCTaA5eX8WMSiQd6
	a36/TR126BLccl7WMqZCu8w1T27JHVSEVXhZlk2jssk4LOLcI4EbKJhcm3t1aS7A==
X-Received: by 2002:a05:600c:4e43:b0:48f:e230:8cad with SMTP id 5b1f17b1804b1-48fe6632135mr113226985e9.33.1778951837393;
        Sat, 16 May 2026 10:17:17 -0700 (PDT)
Received: from [172.27.130.2] (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9e767cb9sm22811791f8f.2.2026.05.16.10.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 10:17:17 -0700 (PDT)
Message-ID: <14f4791c-692f-44ab-946a-61bebc9a4d01@riscstar.com>
Date: Sat, 16 May 2026 18:17:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] lib: sbi: Add RISC-V vector context save/restore
 support
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>,
 Anup Patel <anuppate@qti.qualcomm.com>, Scott Bambrough
 <scott@riscstar.com>, Robin Randhawa <robin.randhawa@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ray Mao <raymond.mao@riscstar.com>, Dhaval <dhaval@rivosinc.com>,
 Peter Lin <peter.lin@sifive.com>, opensbi@lists.infradead.org
References: <20260515054208.151045-1-dave.patel@riscstar.com>
 <20260515054208.151045-2-dave.patel@riscstar.com>
 <CAAhSdy3vOWOYd=nim8kzc6mZFBVBJmu-52Gw-mg8rKsfPF3Z7A@mail.gmail.com>
 <7c06e1b8-8c42-4dcc-ac68-066a5bc6d567@riscstar.com>
 <CAAhSdy2wJTHCP+gUKHjfS4Xn=m7TYyy6rpO5Xq9nvbiyoPJSwA@mail.gmail.com>
Content-Language: en-US
From: Dave Patel <dave.patel@riscstar.com>
In-Reply-To: <CAAhSdy2wJTHCP+gUKHjfS4Xn=m7TYyy6rpO5Xq9nvbiyoPJSwA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260516_101719_870278_BE4F5460 
X-CRM114-Status: GOOD (  22.50  )
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

T24gNS8xNi8yNiAxNzowMCwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBTYXQsIE1heSAxNiwgMjAy
NiBhdCAzOjUz4oCvUE0gRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+IHdyb3Rl
Ogo+Pgo+PiBPbiA1LzE1LzI2IDA4OjQxLCBBbnVwIFBhdGVsIHdyb3RlOgo+Pj4gT24gRnJpLCBN
YXkgMTUsIDIwMjYgYXQgMTE6MTLigK9BTSA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+IHdyb3Rl
Ogo+Pj4+Cj4+Pj4gRnJvbTogRGF2ZSBQYXRlbCA8ZGF2ZS5wYXRlbEByaXNjc3Rhci5jb20+Cj4+
Pj4KPj4+PiBFYWdlciBjb250ZXh0IHN3aXRjaDogQWRkIHN1cHBvcnQgZm9yIHNhdmluZyBhbmQg
cmVzdG9yaW5nIFJJU0MtViB2ZWN0b3IKPj4+PiBleHRlbnNpb24gc3RhdGUgaW4gT3BlblNCSS4g
VGhpcyBpbnRyb2R1Y2VzIGEgcGVyLWhhcnQgdmVjdG9yIGNvbnRleHQKPj4+PiBzdHJ1Y3R1cmUg
YW5kIGhlbHBlciByb3V0aW5lcyB0byBwZXJmb3JtIGZ1bGwgY29udGV4dCBzYXZlIGFuZCByZXN0
b3JlLgo+Pj4+Cj4+Pj4gVGhlIHZlY3RvciBjb250ZXh0IGluY2x1ZGVzIHZjc3IgQ1NScyBhbG9u
ZyB3aXRoIHN0b3JhZ2UgZm9yIGFsbCAzMiB2ZWN0b3IKPj4+PiByZWdpc3RlcnMuIFRoZSByZWdp
c3RlciBzdGF0ZSBpcyBzYXZlZCBhbmQgcmVzdG9yZWQgdXNpbmcgYnl0ZS13aXNlIHZlY3Rvcgo+
Pj4+IGxvYWQvc3RvcmUgaW5zdHJ1Y3Rpb25zICh2czhyL3ZsOHIpLgo+Pj4+Cj4+Pj4gVGhlIGlt
cGxlbWVudGF0aW9uIGZvbGxvd3MgYW4gZWFnZXIgY29udGV4dCBzd2l0Y2hpbmcgbW9kZWwgd2hl
cmUgdGhlIGVudGlyZQo+Pj4+IHZlY3RvciBzdGF0ZSBpcyBzYXZlZCBhbmQgcmVzdG9yZWQgb24g
ZXZlcnkgY29udGV4dCBzd2l0Y2guIFRoaXMgcHJvdmlkZXMgYQo+Pj4+IHNpbXBsZSBhbmQgZGV0
ZXJtaW5pc3RpYyBtZWNoYW5pc20gd2l0aG91dCByZXF1aXJpbmcgbGF6eSB0cmFwLWJhc2VkCj4+
Pj4gbWFuYWdlbWVudC4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmUgUGF0ZWwgPGRhdmUu
cGF0ZWxAcmlzY3N0YXIuY29tPgo+Pj4+IC0tLQo+Pj4+ICBpbmNsdWRlL3NiaS9zYmlfdmVjdG9y
LmggfCAgMjggKysrKysrKysrKwo+Pj4+ICBsaWIvc2JpL29iamVjdHMubWsgICAgICAgfCAgIDEg
Kwo+Pj4+ICBsaWIvc2JpL3NiaV92ZWN0b3IuYyAgICAgfCAxMDkgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4+Pj4gIDMgZmlsZXMgY2hhbmdlZCwgMTM4IGluc2VydGlv
bnMoKykKPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvc2JpL3NiaV92ZWN0b3IuaAo+
Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbGliL3NiaS9zYmlfdmVjdG9yLmMKPj4+Pgo+Pj4+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL3NiaS9zYmlfdmVjdG9yLmggYi9pbmNsdWRlL3NiaS9zYmlfdmVj
dG9yLmgKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwLi5iYmQ4
NTdjMwo+Pj4+IC0tLSAvZGV2L251bGwKPj4+PiArKysgYi9pbmNsdWRlL3NiaS9zYmlfdmVjdG9y
LmgKPj4+PiBAQCAtMCwwICsxLDI4IEBACj4+Pj4gKy8qCj4+Pj4gKyAqIFNQRFgtTGljZW5zZS1J
ZGVudGlmaWVyOiBCU0QtMi1DbGF1c2UKPj4+PiArICoKPj4+PiArICogQ29weXJpZ2h0IChjKSAy
MDI2IFJJU0NzdGFyIFNvbHV0aW9ucy4KPj4+PiArICoKPj4+PiArICogQXV0aG9yczoKPj4+PiAr
ICogICBEYXZlIFBhdGVsIDxkYXZlLnBhdGVsQHJpc2NzdGFyLmNvbT4KPj4+PiArICovCj4+Pj4g
Kwo+Pj4+ICsjaWZuZGVmIF9fU0JJX1ZFQ1RPUl9IX18KPj4+PiArI2RlZmluZSBfX1NCSV9WRUNU
T1JfSF9fCj4+Pj4gKwo+Pj4+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+Pj4+ICsKPj4+
PiArc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCB7Cj4+Pj4gKyAgICAgICB1bnNpZ25lZCBsb25n
IHZjc3I7Cj4+Pj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZzdGFydDsKPj4+PiArCj4+Pj4gKyAg
ICAgICAvKiBzaXplIGRlcGVuZHMgb24gVkxFTiAqLwo+Pj4+ICsgICAgICAgdWludDhfdCB2cmVn
c1tdOwo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArdm9pZCBzYmlfdmVjdG9yX3NhdmUoc3RydWN0IHNi
aV92ZWN0b3JfY29udGV4dCAqZHN0KTsKPj4+PiArdm9pZCBzYmlfdmVjdG9yX3Jlc3RvcmUoY29u
c3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4dCAqc3JjKTsKPj4+PiArdW5zaWduZWQgbG9uZyB2
ZWN0b3JfdmxlbmIodm9pZCk7Cj4+Pj4gKwo+Pj4+ICsjZW5kaWYgLy9fX1NCSV9WRUNUT1JfSF9f
Cj4+Pj4gKwo+Pj4+IGRpZmYgLS1naXQgYS9saWIvc2JpL29iamVjdHMubWsgYi9saWIvc2JpL29i
amVjdHMubWsKPj4+PiBpbmRleCA5N2NjNDUyMS4uZGRiMmU3YWMgMTAwNjQ0Cj4+Pj4gLS0tIGEv
bGliL3NiaS9vYmplY3RzLm1rCj4+Pj4gKysrIGIvbGliL3NiaS9vYmplY3RzLm1rCj4+Pj4gQEAg
LTEwOSwzICsxMDksNCBAQCBsaWJzYmktb2Jqcy15ICs9IHNiaV90cmFwX3ZfbGRzdC5vCj4+Pj4g
IGxpYnNiaS1vYmpzLXkgKz0gc2JpX3VucHJpdi5vCj4+Pj4gIGxpYnNiaS1vYmpzLXkgKz0gc2Jp
X2V4cGVjdGVkX3RyYXAubwo+Pj4+ICBsaWJzYmktb2Jqcy15ICs9IHNiaV9jcHBjLm8KPj4+PiAr
bGlic2JpLW9ianMteSArPSBzYmlfdmVjdG9yLm8KPj4+PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9z
YmlfdmVjdG9yLmMgYi9saWIvc2JpL3NiaV92ZWN0b3IuYwo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAw
NjQ0Cj4+Pj4gaW5kZXggMDAwMDAwMDAuLjFkMmFjOTQ0Cj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+
ICsrKyBiL2xpYi9zYmkvc2JpX3ZlY3Rvci5jCj4+Pj4gQEAgLTAsMCArMSwxMDkgQEAKPj4+PiAr
LyoKPj4+PiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+Pj4+ICsg
Kgo+Pj4+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjYgUklTQ3N0YXIgU29sdXRpb25zLgo+Pj4+ICsg
Kgo+Pj4+ICsgKiBBdXRob3JzOgo+Pj4+ICsgKiAgICAgIERhdmUgUGF0ZWwgPGRhdmUucGF0ZWxA
cmlzY3N0YXIuY29tPgo+Pj4+ICsgKi8KPj4+PiArCj4+Pj4gKyNpbmNsdWRlIDxzYmkvc2JpX2Rv
bWFpbi5oPgo+Pj4+ICsjaW5jbHVkZSA8c2JpL3Jpc2N2X2VuY29kaW5nLmg+Cj4+Pj4gKyNpbmNs
dWRlIDxzYmkvcmlzY3ZfYXNtLmg+Cj4+Pj4gKyNpbmNsdWRlIDxzYmkvc2JpX3ZlY3Rvci5oPgo+
Pj4+ICsjaW5jbHVkZSA8c2JpL3NiaV90eXBlcy5oPgo+Pj4+ICsjaW5jbHVkZSA8c2JpL3NiaV9o
YXJ0Lmg+Cj4+Pj4gKyNpbmNsdWRlIDxzYmkvc2JpX2Vycm9yLmg+Cj4+Pj4gKyNpbmNsdWRlIDxz
Ymkvc2JpX2NvbnNvbGUuaD4KPj4+PiArCj4+Pj4gKyNpZmRlZiBPUEVOU0JJX0NDX1NVUFBPUlRf
VkVDVE9SCj4+Pj4gKwo+Pj4+ICt1bnNpZ25lZCBsb25nIHZlY3Rvcl92bGVuYih2b2lkKQo+Pj4+
ICt7Cj4+Pj4gKyAgICAgICB1bnNpZ25lZCBsb25nIHZsZW5iID0gMDsKPj4+PiArCj4+Pj4gKyAg
ICAgICBhc20gdm9sYXRpbGUgKAo+Pj4+ICsgICAgICAgICAgICAgICAiLm9wdGlvbiBwdXNoXG5c
dCIKPj4+PiArICAgICAgICAgICAgICAgIi5vcHRpb24gYXJjaCwgK3Zcblx0Igo+Pj4+ICsgICAg
ICAgICAgICAgICAiY3NyciAlMCwgdmxlbmJcblx0Igo+Pj4+ICsgICAgICAgICAgICAgICAiLm9w
dGlvbiBwb3Bcblx0Igo+Pj4+ICsgICAgICAgICAgICAgICA6ICI9ciIodmxlbmIpCj4+Pj4gKyAg
ICAgICAgICAgICAgIDoKPj4+PiArICAgICAgICAgICAgICAgOiAibWVtb3J5Iik7Cj4+Pj4gKwo+
Pj4+ICsgICAgICAgcmV0dXJuIHZsZW5iOwo+Pj4+ICt9Cj4+Pj4gKwo+Pj4+ICt2b2lkIHNiaV92
ZWN0b3Jfc2F2ZShzdHJ1Y3Qgc2JpX3ZlY3Rvcl9jb250ZXh0ICpkc3QpCj4+Pj4gK3sKPj4+PiAr
ICAgICAgIGlmICghZHN0KQo+Pj4+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4+Pj4gKwo+Pj4+
ICsgICAgICAgLyogU3RlcCAxOiBTYXZlIENTUnMgKi8KPj4+PiArICAgICAgIGRzdC0+dmNzciA9
IGNzcl9yZWFkKHZjc3IpOwo+Pj4+ICsgICAgICAgZHN0LT52c3RhcnQgPSBjc3JfcmVhZCh2c3Rh
cnQpOwo+Pj4+ICsKPj4+PiArICAgICAgIHVsb25nIHZsZW5iID0gdmVjdG9yX3ZsZW5iKCk7Cj4+
Pj4gKyAgICAgICB1aW50OF90ICpiYXNlID0gZHN0LT52cmVnczsKPj4+PiArCj4+Pj4gKyAgICAg
ICAvKiBTdGVwIDM6IFNhdmUgdmVjdG9yIHJlZ2lzdGVycyAqLwo+Pj4+ICsjZGVmaW5lIFNBVkVf
VlJFRyhpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4g
KyAgICAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPj4+PiArICAgICAgIGFzbSB2b2xhdGlsZSggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsgICAgICAgICAgICAgICAiICAgICAgIC5vcHRp
b24gcHVzaFxuXHQiICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAg
ICIgICAgICAgLm9wdGlvbiBhcmNoLCArdlxuXHQiICAgICAgICAgICAgICAgICAgIFwKPj4+PiAr
ICAgICAgICAgICAgICAgIiAgICAgICB2czhyLnYgdiIgI2kgIiwgKCUwKVxuXHQiICAgICAgICAg
ICAgICAgXAo+Pj4+ICsgICAgICAgICAgICAgICAiICAgICAgIC5vcHRpb24gcG9wXG5cdCIgICAg
ICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAgIDo6ICAgICAgInIiKGJh
c2UgKyAoaSkgKiB2bGVuYikgOiAibWVtb3J5Iik7ICAgIFwKPj4+PiArICAgICAgIH0pICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsK
Pj4+PiArICAgICAgIFNBVkVfVlJFRygwKTsKPj4+PiArICAgICAgIFNBVkVfVlJFRyg4KTsKPj4+
PiArICAgICAgIFNBVkVfVlJFRygxNik7Cj4+Pj4gKyAgICAgICBTQVZFX1ZSRUcoMjQpOwo+Pj4K
Pj4+IFNhbWUgaXNzdWUgYXMgRlAgc2F2ZS9yZXN0b3JlLCB0aGlzIHdpbGwgdHJhcCBhbmQgY3Jh
c2gKPj4+IGlmIFZlY3RvciBpcyBkaXNhYmxlZCBpbiBtc3RhdHVzLlZTLgo+Pj4KPj4+IEZvciBj
b3JyZWN0IGltcGxlbWVudGF0aW9uLCByZWZlciBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoKS9yZXN0
b3JlKCkKPj4+IGZyb20gPGxpbnV4X3NvdXJjZT4vYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0
b3IuaAo+Pj4KPj4+PiArCj4+Pj4gKyN1bmRlZiBTQVZFX1ZSRUcKPj4+PiArfQo+Pj4+ICsKPj4+
PiArdm9pZCBzYmlfdmVjdG9yX3Jlc3RvcmUoY29uc3Qgc3RydWN0IHNiaV92ZWN0b3JfY29udGV4
dCAqc3JjKQo+Pj4+ICt7Cj4+Pj4gKyAgICAgICBpZiAoIXNyYykKPj4+PiArICAgICAgICAgICAg
ICAgcmV0dXJuOwo+Pj4+ICsKPj4+PiArICAgICAgIGNvbnN0IHVpbnQ4X3QgKmJhc2UgPSBzcmMt
PnZyZWdzOwo+Pj4+ICsgICAgICAgdWxvbmcgdmxlbmIgPSB2ZWN0b3JfdmxlbmIoKTsKPj4+PiAr
Cj4+Pj4gKyAgICAgICAvKiBTdGVwIDI6IFJlc3RvcmUgdmVjdG9yIHJlZ2lzdGVycyAqLwo+Pj4+
ICsjZGVmaW5lIFJFU1RPUkVfVlJFRyhpKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBcCj4+Pj4gKyAgICAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKPj4+PiArICAgICAgIGFzbSB2b2xhdGlsZSggICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAo+Pj4+ICsgICAgICAgICAgICAg
ICAiICAgICAgIC5vcHRpb24gcHVzaFxuXHQiICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4g
KyAgICAgICAgICAgICAgICIgICAgICAgLm9wdGlvbiBhcmNoLCArdlxuXHQiICAgICAgICAgICAg
ICAgICAgIFwKPj4+PiArICAgICAgICAgICAgICAgIiAgICAgICB2bDhyLnYgdiIgI2kgIiwgKCUw
KVxuXHQiICAgICAgICAgICAgICAgXAo+Pj4+ICsgICAgICAgICAgICAgICAiICAgICAgIC5vcHRp
b24gcG9wXG5cdCIgICAgICAgICAgICAgICAgICAgICAgICBcCj4+Pj4gKyAgICAgICAgICAgICAg
IDo6ICAgICAgInIiKGJhc2UgKyAoaSkgKiB2bGVuYikgOiAibWVtb3J5Iik7ICAgIFwKPj4+PiAr
ICAgICAgICB9KSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXAo+Pj4+ICsKPj4+PiArICAgICAgIFJFU1RPUkVfVlJFRygwKTsKPj4+PiArICAgICAg
IFJFU1RPUkVfVlJFRyg4KTsKPj4+PiArICAgICAgIFJFU1RPUkVfVlJFRygxNik7Cj4+Pj4gKyAg
ICAgICBSRVNUT1JFX1ZSRUcoMjQpOwo+Pj4+ICsjdW5kZWYgUkVTVE9SRV9WUkVHCj4+Pj4gKwo+
Pj4+ICsgICAgICAgLyogU3RlcCAzOiBSZXN0b3JlIENTUidzIGxhc3QgKi8KPj4+PiArICAgICAg
IC8qIFJlc3RvcmUgQ1NScyBmaXJzdCAqLwo+Pj4+ICsgICAgICAgY3NyX3dyaXRlKHZjc3IsICAg
c3JjLT52Y3NyKTsKPj4+PiArICAgICAgIGNzcl93cml0ZSh2c3RhcnQsIHNyYy0+dnN0YXJ0KTsK
Pj4+PiArfQo+Pj4+ICsKPj4+PiArI2Vsc2UKPj4+PiArCj4+Pj4gK3ZvaWQgc2JpX3ZlY3Rvcl9z
YXZlKHN0cnVjdCBzYmlfdmVjdG9yX2NvbnRleHQgKmRzdCkKPj4+PiArewo+Pj4+ICt9Cj4+Pj4g
Kwo+Pj4+ICt2b2lkIHNiaV92ZWN0b3JfcmVzdG9yZShjb25zdCBzdHJ1Y3Qgc2JpX3ZlY3Rvcl9j
b250ZXh0ICpzcmMpCj4+Pj4gK3sKPj4+PiArfQo+Pj4+ICsKPj4+PiArI2VuZGlmIC8qIE9QRU5T
QklfQ0NfU1VQUE9SVF9WRUNUT1IgKi8KPj4+PiAtLQo+Pj4+IDIuNDMuMAo+Pj4+Cj4+Pj4KPj4+
PiAtLQo+Pj4+IG9wZW5zYmkgbWFpbGluZyBsaXN0Cj4+Pj4gb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCj4+Pj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9v
cGVuc2JpCj4+Pgo+Pj4gUmVnYXJkcywKPj4+IEFudXAKPj4KPj4gSGkgQW51cCwKPj4gICAgICAg
ICBGaXJzdGx5IHRoYW5rcyBmb3IgYWxsIHlvdXIgcmV2aWV3IGNvbW1lbnRzLCBJIGhhdmUgZW5k
ZWF2b3IgdG8KPj4gY292ZXIgYWxsIG9mIHRoZW0sIHNvIHBsZWFzZSBjb25maXJtLgo+Pgo+PiBS
Z2FyZGluZyB0aGlzIGNvbW1lbnQgb2YgbXN0YXR1cy5WUyBhbmQgRlMgKEkgdGhpbmsgd2hpY2gg
aW5jbHVkZXMgMwo+PiBjb21tZW50cykKPj4KPj4gSSBoYXZlIGFscmVhZHkgaGF2ZSBjb2RlIGlu
cGxhY2UgaW4gcGF0Y2ggMywgcGxlYXNlIHNlZSBiZWxvdyBsaW5lIGZyb20KPj4gcGF0Y2ggMwo+
Pgo+PiArICAgICAgIC8qIE1ha2Ugc3VyZSBGUyBhbmQgVlMgaXMgb24gYmVmb3JlIGNvbnRleHQg
c3dpdGNoICovCj4+Cj4+ICsgICAgICAgY3NyX3NldChDU1JfTVNUQVRVUywgTVNUQVRVU19GUyB8
IE1TVEFUVVNfVlMpOwo+IAo+IFNldHRpbmcgbXN0YXR1cy5GUyBhbmQgbXN0YXR1cy5WUyBpbiBz
d2l0Y2hfdG9fbmV4dF9kb21haW5fY29udGV4dCgpCj4gbWVhbnMgeW91IGZsb2F0aW5nIGFuZCB2
ZWN0b3JlIHNhdmUvcmVzdG9yZSBpcyBub3Qgc2VsZiBjb250YWluZWQgYW5kCj4gZXhwZWN0aW5n
IHRoZSBjYWxsaW5nIGZ1bmN0aW9uIHRvIHNldHVwIG1zdGF0dXMuRlMgYW5kIG1zdGF0dXMuVlMu
Cj4gCj4gCj4+Cj4+IFNpbmNlIHRoZSBjb250ZXh0IG9mIEZsb2F0aW5nIGFuZCBWZWN0b3IgaXMg
bW9yZSBncmFudWxhciBpbiBPcGVuc2JpIEkKPj4gdGhvdWdodCBvZiBoYW5kbGUgaW4gY29udGV4
dCBzd2l0Y2guCj4+Cj4+IFNvIHRoZXJlIGlzIG5vIGlzc3VlIG9mIHRyYXAgYW5kIGNyYXNoLCBo
b3dldmVyIHRoZXJlIGlzIHN0aWxsIGEKPj4gcXVlc3Rpb24gcmVnYXJkaW5nIGlmIHlvdSBhcmUg
ZmluZSB3aXRoIHRoaXMgb3IgeW91IHdhbnQgaXQgbW9yZSBmaW5lCj4+IGdyYWluZWQgaW5zaWRl
IGl0cyBpbmRpdmlkdWFsIGZ1bmN0aW9ucz8KPj4KPiAKPiBJIHdvdWxkIGluc2lzdCB0byBrZWVw
IHRoZSBmbG9hdCBhbmQgdmVjdG9yIHNhdmUvcmVzdG9yZSBjb2RlCj4gYWxpZ25lZCB3aXRoIExp
bnV4IHNvdXJjZXMuCj4gCj4gUmVnYXJkcywKPiBBbnVwCgpIaSBBbnVwLAogICAgICAgIFRoYW5r
cywgb2sgSSB1bmRlcnN0YW5kIHlvdSB3YW50IE9wZW5zYmkgdG8gdGlnaHRseSBhbGlnbmVkIHdp
dGgKTGludXguCgpJIHdpbGwgZG8gdGhlIG1vZGlmaWNhdGlvbiBhbmQgc2hhbGwgcHVibGlzaCBu
ZXcgcGF0Y2hlcy4KClRoYW5rcwpEYXZlCgoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5z
YmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL29wZW5zYmkK
