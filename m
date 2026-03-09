Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7918EF371F
	for <opensbi@archiver.kernel.org>; Mon,  9 Mar 2026 08:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2widg5X5KkcsKh1cQFAhPMxF/PgxzNOiKCC8RQDfew4=; b=C6Zx53lfDAP1S5
	9u3IySWqjIomUVGgFbutbaXpTMvYaM3b5ouX/58E8d69A+/pELMljZuqDB8nLAf4GAUxqTPG5QzuN
	XxIRTT4VTo5t4xWZcZET2R08pk1fCvB2yLLkCf+RsQuKATzheEGByEZ0r2/NLQ8IlzAS0BWE9sg1Q
	yH8NBPcCnX30lNxw/J8iyc6qRjM1lJIpXm9GddBpG/FKVhoMNwucx2lmND0Rzk026hzycCdticMAI
	XJ7GItqu5atYZ8Btvmi++YUnh+CINKYF+OFkmq+TFDpbTxvmGgttYykeY1gMdBtSk3bnBph9jxfq2
	6EgQbt9/ndaOYVWNCp1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWSU-00000006v4O-18ad;
	Mon, 09 Mar 2026 08:59:26 +0000
Received: from mail-oo1-xc32.google.com ([2607:f8b0:4864:20::c32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzWSR-00000006v3D-2VZW
	for opensbi@lists.infradead.org;
	Mon, 09 Mar 2026 08:59:24 +0000
Received: by mail-oo1-xc32.google.com with SMTP id 006d021491bc7-66ee7b9af94so4566008eaf.0
        for <opensbi@lists.infradead.org>; Mon, 09 Mar 2026 01:59:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773046762; cv=none;
        d=google.com; s=arc-20240605;
        b=MswGyYxHhhQLnPGo1dkyCkzHdQVkWoYg2CCEbGxl1BNzkUOhcnKGTutI/+55tszOMZ
         HF6fOWposN33Sg4OrNHpnvv/581yCJKZrQY6NhY45eO8I1PhRWegLMYzn5UEvQcceSIR
         d2BJrzg3CTd57BzAO7Y6SzCxCUeiImcyL8n+qZjol8SjJvI2YFcQhisKwiOeIbT6H/X1
         Zia0mmiPUgI5dpqcg5O2aenW6ec9keMVBkRGlNB2JaGfGQEtYvoghOP3xabajqYZQ90N
         8/QFW7MNO0dWJ2ylIGwF1DDr3YuQrAOBhDqBHog/1toDJTiutZQIsb67OSlP49mCqcvg
         zlHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UlPejG8TgDdQO/UsV5oUeg8RawXq+KW1xmwha2VjQxE=;
        fh=TTbPBhNEfNCU7YQnz5XUQ+Q/71jPA+B9JfqM4EnvPxk=;
        b=hwiqIVfA/qfzh22vhOJpI9avIhROiLE4SBFu4iPtf8nJhiWFT0KSP22ALtMjGIqhTn
         EVZZcoj/v6Ha9Pa5dYO3QEyfoV4xUVBgl6jBjhJCGnirJMJDbQ8hquYtjO5pjkLy9Tm2
         7g1X29/KBCjHUeb0DifAjZV48M9Py3PmH1WL3yuZRfwmEbzyUua/hkbrS+XXf8Soi+W6
         sA26H91TlMPH45pW4d0mI5Xq95nvER4rqm5vIt206phsbcfTImiPVoptel4LCkBKbDHd
         ShmgM8sJKuLwKrNQKBwKdjdlbOwwipOSqyM64WinwP4Z0dSOQi/s+r91RSyYmb76h9F2
         42kg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1773046762; x=1773651562; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UlPejG8TgDdQO/UsV5oUeg8RawXq+KW1xmwha2VjQxE=;
        b=LwWlcw9p1tNatQl983C/3Go7WVj9wM7pdl5yN13qfKbzgMMNG8mBEbS9holjqk7XF2
         SlkCqeE0IClIBWtAivaKVvwMf0SjR7/Pc/p5oqmWPOeOYrqeF14I+fDaqIa/cZoL86kq
         tAD0yBMGtb9vtU1IoIL6gdt4Ydk5gSUpx4lnIupFC5H2L4f3UrThO28Y38MlNZKnUnw4
         qJ3EPBDPCavZJqSbYeEvc3XHkOgsIF2TZt2pBRVqqsVqjWWQWGDT9TxYMQQUNHTxKF5g
         8quEFXy7H5KeKwJMr0YRQRRHjRPSw5SMVzxSq/v3OjEDpIFwiF9KPxkhmjsZy0XbQiUX
         K87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773046762; x=1773651562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UlPejG8TgDdQO/UsV5oUeg8RawXq+KW1xmwha2VjQxE=;
        b=NAN7pzm2fSkqouSXOAfGKsnoA+vwmguiGYHtDI2MGo59SGCjUgt6Yul+AViRblJbkV
         7s16IfQvMOxGlHJoCxpAXtHdLtRU+aIX1kfaKGYQov5IuthEQrCRSQ+gmumI3Z1jptEw
         18To6gxW6QtHu5kAc07JVet7VULijfy26Iv8tQqy003BeTJMTEAqecjm3M6s/Ex/tubD
         aUX7xm7GzorF4wKtVCIbci2ehQdcpsMtFs3+0ahE3d2tx3w5ZQbNFySyzZ85dNijAV4O
         mivKCV6psU2PicW1DHsKqO65+Paees71I/aheU0dHF9ksIuWyGIdaBQWjRozXxPdwfMG
         QOoQ==
X-Gm-Message-State: AOJu0Yx3O1ZlZYYoEaijFILi/fwhdksoCIsSN+lJ6gWbo2oEUikr0piM
	BJgweaY68d9OAIy/0XATnRgmL/et1Dqs0OW3OAFetLu97tbTTQ8KMzetRVV6AM4IRf38mLC15aN
	pH35P9N9vAARv/ffKgb7zJFk/pImWJ5ZA7wFZZoXvfcjdf3YasG0qus0=
X-Gm-Gg: ATEYQzzd4i09RC2hEjPS9yFDIJVMI37dSszHTiFw1soWK86N3Fhw2/W4z4zFR1aEWPz
	eu4U2jBDLlLJAUMGTj/B3PWvxKdiK/Irv/DGc9jyt0m/4kslFrQr+oSrX7TQw/iRL/yK21tTky4
	C8ZsBDZPDxBld9akQolJnnV4H8Czsu3vCl4GyH5VP8UC9bONB0FmAKkz/MZPw7F7DOisL7mHn6P
	i4UO5y9ZejUSYmAjhUnXFUV/9mUQHZrJysjPF0/FNaWWx2s4d3CpyRng89a+9OvTq/6Z96UC2Xe
	jZCH4yUjwrPxYD8CM+ziGeQhBn+sCbvNNssakakak3R7ubCDyUCph9lke9b6c6lMq7hVE6e0G/O
	9d5xkFghSDsE23RdMYrAXiG9wcA==
X-Received: by 2002:a05:6820:1b0e:b0:67a:1dad:9d63 with SMTP id
 006d021491bc7-67b9bc65edamr6787531eaf.6.1773046762481; Mon, 09 Mar 2026
 01:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260219083423.30690-1-victoriano.morales@openchip.com>
In-Reply-To: <20260219083423.30690-1-victoriano.morales@openchip.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 Mar 2026 14:29:11 +0530
X-Gm-Features: AaiRm53vcbo0HUN6EGepAhaPqaUanIf0cTvbvktdDU2_ALnUEJSLa_DIJ3kwBg0
Message-ID: <CAAhSdy2G3aKJ7nCwnG1nOCDLcDVAmx6g+jg7jnkzVP-p_6KREA@mail.gmail.com>
Subject: Re: [PATCH] lib: fdt_helper: Removed unnecessary dt parsing check
To: "Victoriano Morales | OPENCHIP" <victoriano.morales@openchip.com>
Cc: "opensbi@lists.infradead.org" <opensbi@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_015923_643132_9092F1C3 
X-CRM114-Status: GOOD (  14.92  )
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

T24gVGh1LCBGZWIgMTksIDIwMjYgYXQgMjowNOKAr1BNIFZpY3Rvcmlhbm8gTW9yYWxlcyB8IE9Q
RU5DSElQCjx2aWN0b3JpYW5vLm1vcmFsZXNAb3BlbmNoaXAuY29tPiB3cm90ZToKPgo+IEZyb206
IFZpY3Rvcmlhbm8gTW9yYWxlcyA8dmljdG9yaWFuby5tb3JhbGVzQG9wZW5jaGlwLmNvbT4KPgo+
IFRoZSBjaGVjayBmb3IgdGhlIGFkZHJlc3MgYmVpbmcgZGlmZmVyZW50IGZyb20gMCBmb3IgdGhl
IFVBUlQsIFBMSUMsCj4gQVBMSUMgYW5kIElNU0lDIGR0IG5vZGVzIGlzIHVubm5lY2Vzc2FyeSBh
bmQgY291bGQgc2tpcCB2YWxpZCBub2Rlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IFZpY3Rvcmlhbm8g
TW9yYWxlcyA8dmljdG9yaWFuby5tb3JhbGVzQG9wZW5jaGlwLmNvbT4KCkxHVE0uCgpSZXZpZXdl
ZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KCkFwcGxpZWQgdGhpcyBwYXRj
aCB0byB0aGUgcmlzY3Yvb3BlbnNiaSByZXBvLgoKVGhhbmtzLApBbnVwCgoKPiAtLS0KPiAgbGli
L3V0aWxzL2ZkdC9mZHRfaGVscGVyLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvbGliL3V0aWxz
L2ZkdC9mZHRfaGVscGVyLmMgYi9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIuYwo+IGluZGV4IDc5
OWZkNDhkLi5hOGM2ZTFhYSAxMDA2NDQKPiAtLS0gYS9saWIvdXRpbHMvZmR0L2ZkdF9oZWxwZXIu
Ywo+ICsrKyBiL2xpYi91dGlscy9mZHQvZmR0X2hlbHBlci5jCj4gQEAgLTUwMiw3ICs1MDIsNyBA
QCBzdGF0aWMgaW50IGZkdF9wYXJzZV91YXJ0X25vZGVfY29tbW9uKGNvbnN0IHZvaWQgKmZkdCwg
aW50IG5vZGVvZmZzZXQsCj4KPiAgICAgICAgIHJjID0gZmR0X2dldF9ub2RlX2FkZHJfc2l6ZShm
ZHQsIG5vZGVvZmZzZXQsIDAsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
JnJlZ19hZGRyLCAmcmVnX3NpemUpOwo+IC0gICAgICAgaWYgKHJjIDwgMCB8fCAhcmVnX2FkZHIg
fHwgIXJlZ19zaXplKQo+ICsgICAgICAgaWYgKHJjIDwgMCB8fCAhcmVnX3NpemUpCj4gICAgICAg
ICAgICAgICAgIHJldHVybiBTQklfRU5PREVWOwo+ICAgICAgICAgdWFydC0+YWRkciA9IHJlZ19h
ZGRyOwo+Cj4gQEAgLTY3MSw3ICs2NzEsNyBAQCBpbnQgZmR0X3BhcnNlX2FwbGljX25vZGUoY29u
c3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwgc3RydWN0IGFwbGljX2RhdGEgKmFwbGljKQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gU0JJX0VOT0RFVjsKPgo+ICAgICAgICAgcmMgPSBmZHRfZ2V0
X25vZGVfYWRkcl9zaXplKGZkdCwgbm9kZW9mZiwgMCwgJnJlZ19hZGRyLCAmcmVnX3NpemUpOwo+
IC0gICAgICAgaWYgKHJjIDwgMCB8fCAhcmVnX2FkZHIgfHwgIXJlZ19zaXplKQo+ICsgICAgICAg
aWYgKHJjIDwgMCB8fCAhcmVnX3NpemUpCj4gICAgICAgICAgICAgICAgIHJldHVybiBTQklfRU5P
REVWOwo+ICAgICAgICAgYXBsaWMtPmFkZHIgPSByZWdfYWRkcjsKPiAgICAgICAgIGFwbGljLT5z
aXplID0gcmVnX3NpemU7Cj4gQEAgLTg2Myw3ICs4NjMsNyBAQCBpbnQgZmR0X3BhcnNlX2ltc2lj
X25vZGUoY29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZiwgc3RydWN0IGltc2ljX2RhdGEgKmlt
c2ljKQo+Cj4gICAgICAgICAgICAgICAgIHJjID0gZmR0X2dldF9ub2RlX2FkZHJfc2l6ZShmZHQs
IG5vZGVvZmYsIGksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmcmVnX2FkZHIsICZyZWdfc2l6ZSk7Cj4gLSAgICAgICAgICAgICAgIGlmIChyYyA8IDAgfHwg
IXJlZ19hZGRyIHx8ICFyZWdfc2l6ZSkKPiArICAgICAgICAgICAgICAgaWYgKHJjIDwgMCB8fCAh
cmVnX3NpemUpCj4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gICAgICAgICAgICAg
ICAgIHJlZ3MtPmFkZHIgPSByZWdfYWRkcjsKPiAgICAgICAgICAgICAgICAgcmVncy0+c2l6ZSA9
IHJlZ19zaXplOwo+IEBAIC04ODUsNyArODg1LDcgQEAgaW50IGZkdF9wYXJzZV9wbGljX25vZGUo
Y29uc3Qgdm9pZCAqZmR0LCBpbnQgbm9kZW9mZnNldCwgc3RydWN0IHBsaWNfZGF0YSAqcGxpYykK
Pgo+ICAgICAgICAgcmMgPSBmZHRfZ2V0X25vZGVfYWRkcl9zaXplKGZkdCwgbm9kZW9mZnNldCwg
MCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAmcmVnX2FkZHIsICZyZWdf
c2l6ZSk7Cj4gLSAgICAgICBpZiAocmMgPCAwIHx8ICFyZWdfYWRkciB8fCAhcmVnX3NpemUpCj4g
KyAgICAgICBpZiAocmMgPCAwIHx8ICFyZWdfc2l6ZSkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IFNCSV9FTk9ERVY7Cj4gICAgICAgICBwbGljLT5hZGRyID0gcmVnX2FkZHI7Cj4gICAgICAgICBw
bGljLT5zaXplID0gcmVnX3NpemU7Cj4gLS0KPiAyLjQzLjAKPgo+Cj4gLS0KPiBvcGVuc2JpIG1h
aWxpbmcgbGlzdAo+IG9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQoKLS0gCm9wZW5zYmkgbWFpbGlu
ZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
