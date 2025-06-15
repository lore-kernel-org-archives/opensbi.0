Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328DCC61CE8
	for <opensbi@archiver.kernel.org>; Sun, 15 Jun 2025 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Akfrjoy0BML10+GXXQkuLBMoLMXzdj4uyztVCxuHXhU=; b=gMXGBRf6XEG4J/
	ouRWhUsCflIGHXAf/H5gJKj3aSpJv3ErE6AzruVmgIKhPv+nnuWdAIeRkcYuQgxBG997mPomRA2eq
	3nwvszhbRWG/80VAJTw4IUTdg/fwAiQECyAhJkg5lIFWqqpUCovubFtNW4FzIphcpzuYgAhPmEq9d
	8uB/zXSvbdvvFzR/WXjOGwJLlCYVoBwCHuOZMGUtae6kXKGNIcxX81aYepZsr4Gb8Ajx4a6r2jq0G
	wV/LA33LHs8fmOVLTeqewyzSGgBrS8yLGbUqOIMO0qVCj+zk22F78kmvgJPgKs14LVBAjBRXJRnvP
	W3UgJ0wfIvaEuvZK+nSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnIc-00000002W6l-43Ut;
	Sun, 15 Jun 2025 13:21:26 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnIa-00000002W6N-3jfK
	for opensbi@lists.infradead.org;
	Sun, 15 Jun 2025 13:21:26 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3d6d6d82633so10636255ab.0
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 06:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749993683; x=1750598483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5dxrt4c9sCO3xfebMgGT/Jdxk7SwOx7oFTKhpsadIuQ=;
        b=ft476xArqb3UsQV2lxDp3kcB2ykEsJbUgfXz4QygFFPWkxO9xZgdmcpwXlMU3Lj9Qd
         qVb1fKtbS7gVaXd5yXVRL1hPJ3/gJmeG6AYK2UPVBfSFB6wHnz311klNxsrHuMEeIK4F
         EdbFStrDX7afSw3gKU9rUS+gnIFF+fIDQrxO+8JJSvCiQ/W1TZL1BPg2yTUcPnVGHzT6
         UtnpKuv9zwt8hfdyIV8A7As81ZB9OMi2Gfyxs7561OWe9w4KiT5hvSkgHEsNRS6CEp+/
         rj8P7RH5dXz23hGH5mzYYfVJIzp48ctlg8pFKW1Z9kw4jCX9Uigf4yQKR61kETiVUebS
         aC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749993683; x=1750598483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5dxrt4c9sCO3xfebMgGT/Jdxk7SwOx7oFTKhpsadIuQ=;
        b=J+AJVwjMx4cKzYrgRaRhbh3JxfzHPINJCyH2hxys+6gDbnr71Xw3ksaevqY38FsJOf
         /gz03KnoBfwVXkTxhawTsRC3HOJTqdShBp+eFAqrtdq1ET1xYWb9NtY9OixwUUZ9TQsf
         bQD7qA4ZFok0JOJFj9fqGnYbOG8GU5sI77JHa2mHRg92qPsOxvxLmXU/AQA3sP6iDVS0
         NYbjLwYiQ2cJKGJV/RuVvFZB6eZXhi20sxnymYMlMJhEJmikaWjrN4bAWuLeYekS7pxh
         TrYjJqZNxSHK0s8Yi14tQvYbyz7mG2qIuQmo429hQ+yPuFSOTdjw/CCoMhgWZ0BdOsKD
         /9iA==
X-Gm-Message-State: AOJu0Yx1EOv55lEhctxIdMfLamk80DE/uew9DVaY6GJE7C7a2vo8rlW0
	kJDZh9Z3mwMaDFanPScLSTqHEdEvlJy04lXacPAmSwzyY+pfTrMiM7WXbqAYFR9tyRXOmoZPg6T
	KhfDXVasio8ejPGta0zNerJ9Ph62UCUxR2fYvO3AQrg==
X-Gm-Gg: ASbGnctNakWhRW+8rq9H9fQoVaun+Jjq05SnXhi/tEimcUZ2GUmqoz6Nyg4zC0CyweA
	p7Sr1Ft2opDZ8FOa9VOA5E6TWHr5kwP7KSYn+rnYpycsdy7Ojvi/vX2sQigzkyWpr236ltRGbjq
	X03e8GWAhsUq/1+V9x5CaigQhl+s9om948d2cKpZsbzLjPJIGgBfCMXe1Nza+7ItI1XZ5cwukKD
	XBq7g==
X-Google-Smtp-Source: AGHT+IEtTIdC3Ok7DAjskI0OQZBO+F7KpIcMvuqagUA3CaZp/G3600vXKj+r0u/6mrN0GjZ3gtqWzh4qFMEFb4+vrAE=
X-Received: by 2002:a05:6e02:164e:b0:3dd:d194:f72d with SMTP id
 e9e14a558f8ab-3de07d1436emr63781655ab.8.1749993683294; Sun, 15 Jun 2025
 06:21:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250515025931.3383142-1-raj.khem@gmail.com>
In-Reply-To: <20250515025931.3383142-1-raj.khem@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Jun 2025 18:51:11 +0530
X-Gm-Features: AX0GCFs60XTts_qN_qGrSvyB4UfVjt8AblZI9RcdObHABIzBYd4u5mygGUSc-LI
Message-ID: <CAAhSdy2Ww52cPXFgCskxWc2bWJoCN_kTY-+39k6mGapXbYGYog@mail.gmail.com>
Subject: Re: [PATCH] Makefile: Add flag for reprodubility compiler flags
To: Khem Raj <raj.khem@gmail.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_062125_164351_6A371706 
X-CRM114-Status: GOOD (  15.46  )
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

T24gVGh1LCBNYXkgMTUsIDIwMjUgYXQgODoyOeKAr0FNIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFp
bC5jb20+IHdyb3RlOgo+Cj4gUHJvdmlkZXMgbWVjaGFuaXNtIHRvIHJlbW92ZSBhYnNvbHV0ZSBw
YXRocyBmcm9tIGJpbmFyaWVzIHVzaW5nCj4gLWZmaWxlLXByZWZpeC1tYXAKPgo+IEl0IHdpbGwg
aGVscCBkaXN0cm9zIChlLmcuIHlvY3RvIGJhc2VkIG9uZXMgKSB3aGljaCB3YW50IHRvIHNoaXAK
PiB0aGUgLmVsZiBmaWxlcyBidXQgbmVlZCB0byBzY3J1YiBhYnNvbHV0ZSBwYXRocyBpbiBvYmpl
Y3RzCj4KPiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgoKTEdU
TS4KClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKQXBwbGll
ZCB0aGlzIHBhdGNoIHRvIHRoZSByaXNjdi9vcGVuc2JpIHJlcG8uCgpUaGFua3MsCkFudXAKCgo+
IC0tLQo+ICBNYWtlZmlsZSB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+IGluZGV4IGU5MDgz
NmM3Li4yMmQ0ZWNmZiAxMDA2NDQKPiAtLS0gYS9NYWtlZmlsZQo+ICsrKyBiL01ha2VmaWxlCj4g
QEAgLTE3NCw2ICsxNzQsMTEgQEAgZWxzZQo+ICBVU0VfTERfRkxBRyAgICA9ICAgICAgIC1mdXNl
LWxkPWJmZAo+ICBlbmRpZgo+Cj4gK1JFUFJPRFVDSUJMRSA/PSBuCj4gK2lmZXEgKCQoUkVQUk9E
VUNJQkxFKSx5KQo+ICtSRVBST0RVQ0lCTEVfRkxBR1MgICAgICAgICAgICAgKz0gICAgICAtZmZp
bGUtcHJlZml4LW1hcD0kKHNyY19kaXIpPQo+ICtlbmRpZgo+ICsKPiAgIyBDaGVjayB3aGV0aGVy
IHRoZSBsaW5rZXIgc3VwcG9ydHMgY3JlYXRpbmcgUElFcwo+ICBPUEVOU0JJX0xEX1BJRSA6PSAk
KHNoZWxsICQoQ0MpICQoQ0xBTkdfVEFSR0VUKSAkKFJFTEFYX0ZMQUcpICQoVVNFX0xEX0ZMQUcp
IC1mUElFIC1ub3N0ZGxpYiAtV2wsLXBpZSAteCBjIC9kZXYvbnVsbCAtbyAvZGV2L251bGwgPi9k
ZXYvbnVsbCAyPiYxICYmIGVjaG8geSB8fCBlY2hvIG4pCj4KPiBAQCAtMzYyLDYgKzM2Nyw3IEBA
IEdFTkZMQUdTICAgICs9ICAgICAgJChmaXJtd2FyZS1nZW5mbGFncy15KQo+Cj4gIENGTEFHUyAg
ICAgICAgID0gICAgICAgLWcgLVdhbGwgLVdlcnJvciAtZmZyZWVzdGFuZGluZyAtbm9zdGRsaWIg
LWZuby1zdGFjay1wcm90ZWN0b3IgLWZuby1zdHJpY3QtYWxpYXNpbmcgLWZmdW5jdGlvbi1zZWN0
aW9ucyAtZmRhdGEtc2VjdGlvbnMKPiAgQ0ZMQUdTICAgICAgICAgKz0gICAgICAtZm5vLW9taXQt
ZnJhbWUtcG9pbnRlciAtZm5vLW9wdGltaXplLXNpYmxpbmctY2FsbHMKPiArQ0ZMQUdTICAgICAg
ICAgKz0gICAgICAkKFJFUFJPRFVDSUJMRV9GTEFHUykKPiAgIyBPcHRpb25hbGx5IHN1cHBvcnRl
ZCBmbGFncwo+ICBpZmVxICgkKENDX1NVUFBPUlRfVkVDVE9SKSx5KQo+ICBDRkxBR1MgICAgICAg
ICArPSAgICAgIC1ET1BFTlNCSV9DQ19TVVBQT1JUX1ZFQ1RPUgo+IEBAIC0zODcsNiArMzkzLDcg
QEAgQ1BQRkxBR1MgICAgKz0gICAgICAkKGZpcm13YXJlLWNwcGZsYWdzLXkpCj4gIEFTRkxBR1Mg
ICAgICAgICAgICAgICAgPSAgICAgICAtZyAtV2FsbCAtbm9zdGRsaWIKPiAgQVNGTEFHUyAgICAg
ICAgICAgICAgICArPSAgICAgIC1mbm8tb21pdC1mcmFtZS1wb2ludGVyIC1mbm8tb3B0aW1pemUt
c2libGluZy1jYWxscwo+ICBBU0ZMQUdTICAgICAgICAgICAgICAgICs9ICAgICAgLWZQSUUKPiAr
QVNGTEFHUyAgICAgICAgICAgICAgICArPSAgICAgICQoUkVQUk9EVUNJQkxFX0ZMQUdTKQo+ICAj
IE9wdGlvbmFsbHkgc3VwcG9ydGVkIGZsYWdzCj4gIGlmZXEgKCQoQ0NfU1VQUE9SVF9TQVZFX1JF
U1RPUkUpLHkpCj4gIEFTRkxBR1MgICAgICAgICAgICAgICAgKz0gICAgICAtbW5vLXNhdmUtcmVz
dG9yZQo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFk
ZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3Bl
bnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
