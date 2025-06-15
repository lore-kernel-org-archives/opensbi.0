Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D33DC71135
	for <opensbi@archiver.kernel.org>; Sun, 15 Jun 2025 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ePTTrF74eHadWphZrh9whJ7weeWLIfOH39tgJywyF9U=; b=WUiTdk+EkkDrZ4
	ZW9ZMiC/CTqpP3CNcPRpBkRIuSDVDD2ex3+3A4nFp56Q2eqaPjDMaVD5TpqaLNpwSN/jJXdBa/B4t
	OV6AY+ud0aJhn9QrnOu+jmV4GnpsM+6u7/tFSxlVZaJMsRELnpMh5olFoHp+cNdy/IQ7x/xETCTiz
	WNc16De6b8tlb69rRYHfugLMrfW9XVEt20bNmfK3n0gkPx/c8pCJZULoe0nxzNoFRtHbbhssoTn/C
	IPBcngUujYJox/2EOxe2w5TdRi0mcWQn3hu7hABc5ovwbVCBesTiCrYrdJi51v2KFhzedtOAUYDo1
	idwlwRHZ+S1oHsB8tgAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnRC-00000002WXd-1tYw;
	Sun, 15 Jun 2025 13:30:18 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQnR9-00000002WXH-1wHA
	for opensbi@lists.infradead.org;
	Sun, 15 Jun 2025 13:30:16 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-3de1875bf9dso107055ab.2
        for <opensbi@lists.infradead.org>; Sun, 15 Jun 2025 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1749994214; x=1750599014; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkFyZrUSoT/kl8s+6r7F4JLffi0Dmi3X0bWRdAeta/0=;
        b=wdOLu9RcUe2FrcyCoAOIb0QveKojgUMk6DvradmdV+4HGXmKZR5VU2DxNaqz3rlF3s
         vutLPnbLNY6KipwETm00gRWLIeDAcUX3998ZU8sHIb5OOLBd75l1jm0ZQZsuWi63EDHb
         N8P4OjBPwWm7+ZMhinXnNAlfVceUafbCz+vALoR4KPY3Pw9vWfatYCq8Dzxym6zJ9Ysm
         7GeE/Z61vBfCBeJPw/D8qi9JiXJUuzo6ujREvFh7VhFIqUFr25sxn1SyBJRweToeCcq1
         OPCaTgdaWhS4E8RD3ay33K6YRvm1rWN4GdXVSSIHTteBJZE5O6/YBtTB7Sf2ef5NpDyd
         T1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749994214; x=1750599014;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CkFyZrUSoT/kl8s+6r7F4JLffi0Dmi3X0bWRdAeta/0=;
        b=hmTkgE5XC5gdmgm1QKy1AkEw32ppKDx+/QxpsX/R5y6OgYCIrxw5Kxdd3gQ9rXOXow
         77+ApfEpJbwVsMt4upp5V/sxVbr02DY4Fagtunnhc8cJfCmr2U3OZ2uoPBl6WWFwVVR2
         soLg00YJbfQ9zDQa1kPQZjKZxPI5oL8isklyFLMoKE7Ql+szqYvhQvddHYgYhfoHsPol
         eyysAsOnk8MHv5aMAxEnWekgU9BhaTF5JollNTnakqH/2EX1T3H0elSiZJ+HSnHQqt02
         vKN5CNAvFXsws8Vc0IPYz5/ZAoNwcxoxJzTaYyyohvYWzcQxI6vKb/gfDm7CjAiR7rwa
         ACeA==
X-Gm-Message-State: AOJu0YxyuJdRSXgClDdnliRDvsLCUxIdyhx6BGxm8zlJGCGKxaBbh9JI
	sQMhNs+jJMXWLjv346P1ebk1zvS/WFv2Zl1UDtRJs23m/U2ArSdJAfrFTcqlTIkFkq8urGu1Kzq
	zgpSSx62STrnTnY+lB7F2NRdc9m/AZabdIuI3oo0OZQ==
X-Gm-Gg: ASbGnctdNzEWZNhYJ8UTmBPAM8Oym3eGqemzmtLZYlbBRNuEJMFQG2aMcjOdbvydAfS
	ZAFICiFWaK0LJddE8o7EFgNaniiiMlNaMY0S32n+yjTlaqJ6L2x+Ue/9v0umslUqqIm/U2R9lLM
	rE08xnqHJoVqYMaan3NZOauRMprxbNSXjSzKGDfR9FyGvcBPhS8tVaZfsOTwTD2KjWGjhhrgOE3
	kFkdQ==
X-Google-Smtp-Source: AGHT+IGxZW5qXanWW5BEco2xpU4x/U41UB87UPNFe9/otLOx8mnL0g4acf79t08dZ+7Cli3W4qWKeLEzBqdmQvqjzgE=
X-Received: by 2002:a05:6e02:5e0a:b0:3de:1200:219f with SMTP id
 e9e14a558f8ab-3de12002a2fmr15778995ab.22.1749994214432; Sun, 15 Jun 2025
 06:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250522013503.2556053-1-samuel.holland@sifive.com>
In-Reply-To: <20250522013503.2556053-1-samuel.holland@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 15 Jun 2025 19:00:02 +0530
X-Gm-Features: AX0GCFuvpKP-J42993i1EpfHCJ-vJdjmU-mUdayQvrqUq2k_Z9wUHYDn_rWMWKo
Message-ID: <CAAhSdy0duycXTf5=PDqEDx+Ek0qiP_EUwm6HuBqyzr0BKtAEvg@mail.gmail.com>
Subject: Re: [PATCH] lib: sbi: fwft: Use only the provided PMLEN value
To: Samuel Holland <samuel.holland@sifive.com>
Cc: opensbi@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_063015_504159_3A31D7A5 
X-CRM114-Status: GOOD (  17.37  )
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

T24gVGh1LCBNYXkgMjIsIDIwMjUgYXQgNzowNeKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEFzIG9mIHJpc2N2LXNiaS1kb2MgY29tbWl0
IGM3ZDNkMWY3ZGNhYSAoImV4dC1md2Z0OiB1c2UgdGhlIHByb3ZpZGVkCj4gdmFsdWUgaW4gZndm
dF9zZXQoUE9JTlRFUl9NQVNLSU5HX1BNTEVOKSIpLCB0aGUgU0JJIGltcGxlbWVudGF0aW9uIG11
c3QKPiB1c2Ugb25seSB0aGUgcHJvdmlkZWQgUE1MRU4gdmFsdWUgb3IgZWxzZSBmYWlsLiBJdCBt
YXkgbm90IGZhbGwgYmFjayB0bwo+IGEgbGFyZ2VyIFBNTEVOIHZhbHVlLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+CgpBcHBsaWVk
IHRoaXMgcGF0Y2ggdG8gdGhlIHJpc2N2L29wZW5zYmkgcmVwby4KClRoYW5rcywKQW51cAoKPiAt
LS0KPgo+ICBsaWIvc2JpL3NiaV9md2Z0LmMgfCAzNiArKysrKysrKysrKysrKysrKystLS0tLS0t
LS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE4IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2Z3ZnQuYyBiL2xpYi9zYmkvc2Jp
X2Z3ZnQuYwo+IGluZGV4IGM0NjAwNmQ0Li5hMmFlZmI5YSAxMDA2NDQKPiAtLS0gYS9saWIvc2Jp
L3NiaV9md2Z0LmMKPiArKysgYi9saWIvc2JpL3NiaV9md2Z0LmMKPiBAQCAtMjIzLDMyICsyMjMs
MzIgQEAgc3RhdGljIGludCBmd2Z0X3BtbGVuX3N1cHBvcnRlZChzdHJ1Y3QgZndmdF9jb25maWcg
KmNvbmYpCj4gICAgICAgICByZXR1cm4gU0JJX09LOwo+ICB9Cj4KPiAtc3RhdGljIGJvb2wgZndm
dF90cnlfdG9fc2V0X3BtbSh1bnNpZ25lZCBsb25nIHBtbSkKPiAtewo+IC0gICAgICAgY3NyX3Nl
dChDU1JfTUVOVkNGRywgcG1tKTsKPiAtICAgICAgIHJldHVybiAoY3NyX3JlYWQoQ1NSX01FTlZD
RkcpICYgRU5WQ0ZHX1BNTSkgPT0gcG1tOwo+IC19Cj4gLQo+ICBzdGF0aWMgaW50IGZ3ZnRfc2V0
X3BtbGVuKHN0cnVjdCBmd2Z0X2NvbmZpZyAqY29uZiwgdW5zaWduZWQgbG9uZyB2YWx1ZSkKPiAg
ewo+IC0gICAgICAgdW5zaWduZWQgbG9uZyBwcmV2Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBw
bW0sIHByZXY7Cj4KPiAtICAgICAgIGlmICh2YWx1ZSA+IDE2KQo+ICsgICAgICAgc3dpdGNoICh2
YWx1ZSkgewo+ICsgICAgICAgY2FzZSAwOgo+ICsgICAgICAgICAgICAgICBwbW0gPSBFTlZDRkdf
UE1NX1BNTEVOXzA7Cj4gKyAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSA3Ogo+
ICsgICAgICAgICAgICAgICBwbW0gPSBFTlZDRkdfUE1NX1BNTEVOXzc7Cj4gKyAgICAgICAgICAg
ICAgIGJyZWFrOwo+ICsgICAgICAgY2FzZSAxNjoKPiArICAgICAgICAgICAgICAgcG1tID0gRU5W
Q0ZHX1BNTV9QTUxFTl8xNjsKPiArICAgICAgICAgICAgICAgYnJlYWs7Cj4gKyAgICAgICBkZWZh
dWx0Ogo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgIH0KPgo+
ICAgICAgICAgcHJldiA9IGNzcl9yZWFkX2NsZWFyKENTUl9NRU5WQ0ZHLCBFTlZDRkdfUE1NKTsK
PiAtICAgICAgIGlmICh2YWx1ZSA9PSAwKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gU0JJX09L
Owo+IC0gICAgICAgaWYgKHZhbHVlIDw9IDcpIHsKPiAtICAgICAgICAgICAgICAgaWYgKGZ3ZnRf
dHJ5X3RvX3NldF9wbW0oRU5WQ0ZHX1BNTV9QTUxFTl83KSkKPiAtICAgICAgICAgICAgICAgICAg
ICAgICByZXR1cm4gU0JJX09LOwo+IC0gICAgICAgICAgICAgICBjc3JfY2xlYXIoQ1NSX01FTlZD
RkcsIEVOVkNGR19QTU0pOwo+ICsgICAgICAgY3NyX3NldChDU1JfTUVOVkNGRywgcG1tKTsKPiAr
ICAgICAgIGlmICgoY3NyX3JlYWQoQ1NSX01FTlZDRkcpICYgRU5WQ0ZHX1BNTSkgIT0gcG1tKSB7
Cj4gKyAgICAgICAgICAgICAgIGNzcl93cml0ZShDU1JfTUVOVkNGRywgcHJldik7Cj4gKyAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRUlOVkFMOwo+ICAgICAgICAgfQo+IC0gICAgICAgaWYgKGZ3
ZnRfdHJ5X3RvX3NldF9wbW0oRU5WQ0ZHX1BNTV9QTUxFTl8xNikpCj4gLSAgICAgICAgICAgICAg
IHJldHVybiBTQklfT0s7Cj4gLSAgICAgICBjc3Jfd3JpdGUoQ1NSX01FTlZDRkcsIHByZXYpOwo+
Cj4gLSAgICAgICByZXR1cm4gU0JJX0VJTlZBTDsKPiArICAgICAgIHJldHVybiBTQklfT0s7Cj4g
IH0KPgo+ICBzdGF0aWMgaW50IGZ3ZnRfZ2V0X3BtbGVuKHN0cnVjdCBmd2Z0X2NvbmZpZyAqY29u
ZiwgdW5zaWduZWQgbG9uZyAqdmFsdWUpCj4gLS0KPiAyLjQ3LjIKPgo+IGJhc2UtY29tbWl0OiA2
OWEwZjAyNDVmMzllYTNhZjQ2ODVjYWI0Y2IyZGRhOTBhY2QxN2NkCj4gYnJhbmNoOiB1cC9md2Z0
LXBtbGVuLXVwZGF0ZQo+Cj4gLS0KPiBvcGVuc2JpIG1haWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlz
dHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29w
ZW5zYmkK
