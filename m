Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC0CA0FF6
	for <opensbi@archiver.kernel.org>; Thu, 28 Aug 2025 05:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a3VwSRWoKmF3nKxsYFlwGT3/hFHxi5lpwH1nZCPtHnw=; b=Z+NGFXDmBUcn0W
	2h8eYppA0zYpY3WjBWsfLpcmEKyTHPaa3VHry7bPtW3ak+OTHwJm5hhGcgg8613mg6w0YZvpJ4UMe
	zpiaC8/UcKMHdhw8Gb5pmYepX/ZasKhm4qPuz4jXVSU1MZHpNmLe0f862YXsjc6+hHYfXa0N4Ysw0
	VGjB+ffJL7iN2n8D2FpoWaIAVx/U4ZGDgTdK4RX2R0JZ6IgeCWbfzRPDvxI4xy0BD6iJkHIpTvGgw
	Zzjt0c8F1IAmx0P/RmEP6UirO/BVtukmzSIDNixghYlxvlaAjknzIzpJt/FBf12dxrcHo26sO+YzT
	48n8PFzDf9bzt/hHe+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVGi-00000000KZV-1pjE;
	Thu, 28 Aug 2025 05:33:52 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urVFB-00000000KU5-1DaQ
	for opensbi@lists.infradead.org;
	Thu, 28 Aug 2025 05:32:18 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3ea8b3a64b8so5319405ab.2
        for <opensbi@lists.infradead.org>; Wed, 27 Aug 2025 22:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1756359136; x=1756963936; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fMUR9p12S23p1Ha0SgD5v7elfUJXb0I3renBiWYyM+w=;
        b=bQZJzDCcaXiJtVEThdxlfWLWvgX3DsDaWFSI9F3xPUqW1BmW6zyhVWhG1u0g2yB1XS
         6MysUaTneKT3q+ahLisyfTOttzl4zI/lKtLNN2OhLY1mSDbJxN++wPQMT6Rn/zF4Teko
         +JEjwuHn6Wyv/EBZQSADwjUYXfeVUd6mtGKOTl1RDEljIdR16/iP0LeT9iRjZhGQ8XWo
         ledEB19L3LLQG6bPpKY3sxMc0Z13rV/MuaG2qIHzeHDWLopo0LKVxXMeFEOKxQFo1C24
         kgEM46Y0z40CSieFWZ6VE5G1t6XYvbFlb3ZgVplgKl0aPaE8s2DGcLQTCn2t4zg4khXz
         Qh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756359136; x=1756963936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fMUR9p12S23p1Ha0SgD5v7elfUJXb0I3renBiWYyM+w=;
        b=qjHwpjqaMrnQxjztphpYpbAuIGGCL7ooycy7R50vNh5Zvf+ZVuQVkxzckd5Xymd0k+
         gag4Hny2GrUs7MDobd6h/1wXlJSeDPrEoZRd1LDHwRdK2LuKJw+GrYFV+4M3T+88GFgT
         GeNYx8UenwR1fsu1Tgp5Mhg2L7Ilj1Vnzn9NyCWoVRH1Dqs7oaukDR/a/i2ObnDXA4o6
         B1NcqWjpYj7Namt7ldEeQuX7OcB4pQNePPv2nlUYz9AgcKSn/mKfemEeOTqSfRDL3bL2
         BYRv6misMoOLstJ4OO+xO50rm4hXIsRMT2x1uS3IS8+HU6nGDb1UtRtqKtnV0vQxrO4l
         s0ug==
X-Gm-Message-State: AOJu0Yz5ItnynWIg0AeIngyLwYOHBtKuf6BZU8yBmyz2WeV9kNAncpbm
	Yhw1N3l6t2ojaQ7w8VXBlBbehpIJqzwWXGzrwwx+TDsmp5F0eyYSGn06l+wjv2O3dqAnDlaJPcK
	ogxFLof3KKqZlYo4Katyrq/sfimuGVmEgMCs7dDYiF4TPtBjHCuH93Qs=
X-Gm-Gg: ASbGnct9Ur5mzEWHKJizO1l+Ff4Tk8xQ2yJHLAu6gk/MzaCNFx/NGtb7L+XgCafmS2j
	8+h8X+4nIzzDYfZaWy1EGDssihuP9eQybKx2AjkFq9ie0kx3ZjfxN7G72CgXm6TOtnsWl45J3sI
	oDk5TWidkFXGIEq0jt6DYQTzRDcf+eOXVMDXcrrx4aYL4c5lh1TqgMlexebwd9U9qcaoI4CSNkQ
	jePHg6QPukvbDkcI0JuBHUWEWLebunXPCtKd6k6Q4/rUcZESlQ=
X-Google-Smtp-Source: AGHT+IG3V3FxKspfCFRAr6iJ7B7KB3jPuq3vRuIySbZNSh2O1f2IwjZkoc16h0Y1BskuWfmzdg49lvnPoec0JUCwrXY=
X-Received: by 2002:a05:6e02:1485:b0:3f0:375:e587 with SMTP id
 e9e14a558f8ab-3f00375e694mr68716705ab.11.1756359136213; Wed, 27 Aug 2025
 22:32:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250723204010.9927-1-cfu@mips.com>
In-Reply-To: <20250723204010.9927-1-cfu@mips.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 28 Aug 2025 11:02:05 +0530
X-Gm-Features: Ac12FXx3zNGi6tyk2PXIjTLciObimGNVPDcf1oCDJhBXF81MUxZHx5HqCH8eEWA
Message-ID: <CAAhSdy2VRE_bfqhae+ZCxwH-rZnmm+uL+nfYAzTXEn=C84L80Q@mail.gmail.com>
Subject: Re: [PATCH v3] generic: mips: support harts to boot from mips_warm_boot
To: Chao-ying Fu <icebergfu@gmail.com>
Cc: opensbi@lists.infradead.org, Chao-ying Fu <cfu@mips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_223217_336024_9C8F27AB 
X-CRM114-Status: GOOD (  21.12  )
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

T24gVGh1LCBKdWwgMjQsIDIwMjUgYXQgMjoxMOKAr0FNIENoYW8teWluZyBGdSA8aWNlYmVyZ2Z1
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBXZSBwcm9ncmFtIHJlc2V0IGJhc2UgZm9yIGhhcnRzIChv
dGhlciB0aGFuIGhhcnQgMCkgdG8gYm9vdCBhdAo+IG1pcHNfd2FybV9ib290IHRoYXQganVtcHMg
dG8gX3N0YXJ0X3dhcm0uIFRoaXMgaGVscHMgdG8gc2tpcCBzb21lIGNvZGUKPiBzZXF1ZW5jZSB0
byBzcGVlZCB1cC4KPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8teWluZyBGdSA8Y2Z1QG1pcHMuY29t
Pgo+IC0tLQo+ICBwbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUyB8IDIwICsr
KysrKysrKysrKysrKysrKysrCj4gIHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9vYmplY3RzLm1rICAg
ICAgIHwgIDIgKy0KPiAgcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4NzAwLmMgICAgICAgICAgfCAg
NSArKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBsYXRmb3JtL2dlbmVyaWMvbWlwcy9taXBzX3dhcm1f
Ym9vdC5TCj4KPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL21pcHNfd2FybV9i
b290LlMgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uMjVjZGI4Mwo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvbWlwc193YXJtX2Jvb3QuUwo+IEBAIC0wLDAgKzEs
MjAgQEAKPiArLyoKPiArICogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEJTRC0yLUNsYXVzZQo+
ICsgKgo+ICsgKiBDb3B5cmlnaHQgKGMpIDIwMjUgTUlQUwo+ICsgKgo+ICsgKi8KPiArICAgICAg
IC50ZXh0Cj4gKyAgICAgICAuYWxpZ24gIDEyCj4gKyAgICAgICAuZ2xvYmwgIG1pcHNfd2FybV9i
b290Cj4gK21pcHNfd2FybV9ib290Ogo+ICsgICAgICAgaiAgICAgICBfc3RhcnRfd2FybQo+ICsg
ICAgICAgLmFsaWduICAyCj4gK25taV92ZWN0b3I6Cj4gKyAgICAgICBqICAgICAgIF9zdGFydF93
YXJtCj4gKyAgICAgICAuYWxpZ24gIDIKPiArY2FjaGVlcnJfdmVjdG9yOgo+ICsgICAgICAgaiAg
ICAgICBfc3RhcnRfd2FybQo+ICsgICAgICAgLmFsaWduICAyCj4gK2RlYnVnZXhjX3ZlY3RvcjoK
PiArICAgICAgIGogICAgICAgX3N0YXJ0X3dhcm0KCm5taV92ZWN0b3IsIGNhY2hlZXJyX3ZlY3Rv
ciwgYW5kIGRlYnVnZXhjX3ZlY3RvciBhcmUgbm90IHVzZWQKYW55d2hlcmUgc28gSSBoYXZlIGRy
b3BwZWQgdGhlc2UgYXQgdGhlIHRpbWUgb2YgbWVyZ2luZy4gUGxlYXNlCnNlbmQgc2VwYXJhdGUg
cGF0Y2hlcyB0byBhZGQgdGhlc2Ugd2hlbiB0aGV5IGFyZSBiZWluZyB1c2VkCnNvbWV3aGVyZS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGllZCB0
aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCj4gZGlm
ZiAtLWdpdCBhL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9vYmplY3RzLm1rIGIvcGxhdGZvcm0vZ2Vu
ZXJpYy9taXBzL29iamVjdHMubWsKPiBpbmRleCBiYmJjMTVhLi5hMDhjNGM2IDEwMDY0NAo+IC0t
LSBhL3BsYXRmb3JtL2dlbmVyaWMvbWlwcy9vYmplY3RzLm1rCj4gKysrIGIvcGxhdGZvcm0vZ2Vu
ZXJpYy9taXBzL29iamVjdHMubWsKPiBAQCAtNCw1ICs0LDUgQEAKPgo+ICBpZmVxICgkKFBMQVRG
T1JNX1JJU0NWX1hMRU4pLCA2NCkKPiAgY2FycmF5LXBsYXRmb3JtX292ZXJyaWRlX21vZHVsZXMt
JChDT05GSUdfUExBVEZPUk1fTUlQU19QODcwMCkgKz0gbWlwc19wODcwMAo+IC1wbGF0Zm9ybS1v
YmpzLSQoQ09ORklHX1BMQVRGT1JNX01JUFNfUDg3MDApICs9IG1pcHMvcDg3MDAubwo+ICtwbGF0
Zm9ybS1vYmpzLSQoQ09ORklHX1BMQVRGT1JNX01JUFNfUDg3MDApICs9IG1pcHMvcDg3MDAubyBt
aXBzL21pcHNfd2FybV9ib290Lm8KPiAgZW5kaWYKPiBkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZ2Vu
ZXJpYy9taXBzL3A4NzAwLmMgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYwo+IGluZGV4
IDg4OGE0NWMuLmQzZTAxNWIgMTAwNjQ0Cj4gLS0tIGEvcGxhdGZvcm0vZ2VuZXJpYy9taXBzL3A4
NzAwLmMKPiArKysgYi9wbGF0Zm9ybS9nZW5lcmljL21pcHMvcDg3MDAuYwo+IEBAIC0xNiw2ICsx
Niw4IEBACj4gICNpbmNsdWRlIDxtaXBzL3A4NzAwLmg+Cj4gICNpbmNsdWRlIDxtaXBzL21pcHMt
Y20uaD4KPgo+ICtleHRlcm4gdm9pZCBtaXBzX3dhcm1fYm9vdCh2b2lkKTsKPiArCj4gIHN0YXRp
YyB1bnNpZ25lZCBsb25nIG1pcHNfY3NyX3JlYWRfbnVtKGludCBjc3JfbnVtKQo+ICB7Cj4gICNk
ZWZpbmUgc3dpdGNoY2FzZV9jc3JfcmVhZChfX2Nzcl9udW0sIF9fdmFsKSAgICAgICAgICBcCj4g
QEAgLTE1MCw2ICsxNTIsOSBAQCBzdGF0aWMgaW50IG1pcHNfaGFydF9zdGFydCh1MzIgaGFydGlk
LCB1bG9uZyBzYWRkcikKPiAgICAgICAgIGlmIChoYXJ0aWQgPT0gMCkKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIFNCSV9FTk9UU1VQUDsKPgo+ICsgICAgICAgLyogQ2hhbmdlIHJlc2V0IGJhc2Ug
dG8gbWlwc193YXJtX2Jvb3QgKi8KPiArICAgICAgIHdyaXRlX2djcl9jb19yZXNldF9iYXNlKGhh
cnRpZCwgKHVuc2lnbmVkIGxvbmcpbWlwc193YXJtX2Jvb3QsIGxvY2FsX3ApOwo+ICsKPiAgICAg
ICAgIGlmIChjcHVfaGFydChoYXJ0aWQpID09IDApIHsKPiAgICAgICAgICAgICAgICAgLyogRW5z
dXJlIGl0cyBjb2hlcmVuY3kgaXMgZGlzYWJsZWQgKi8KPiAgICAgICAgICAgICAgICAgd3JpdGVf
Z2NyX2NvX2NvaGVyZW5jZShoYXJ0aWQsIDAsIGxvY2FsX3ApOwo+IC0tCj4gMi40Ny4xCj4KPgo+
IC0tCj4gb3BlbnNiaSBtYWlsaW5nIGxpc3QKPiBvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcK
PiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkKCi0t
IApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
