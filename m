Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB2DD1038F
	for <opensbi@archiver.kernel.org>; Wed, 26 Nov 2025 08:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:From:To:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q02LTiKPEww3IZhMSS2YVvB3v6U3ZkYiGlWJ9yuwk38=; b=j6YMQ0eEqYWiFu
	8kC+y7JqIKtsHgjgyBm0QRpXAF+6peVhWbNXsnOJ1KbJrEMk0Iir8/2ZGxAhagfF+ziQgfXJOgKkh
	wyrGNxdNSaF+YFdAsrl7sY2S0anpVzORVYiFDWz5s0Rh2v0iWY0DZsdDqdKqUc0Dep+1ocPs1Dwz7
	Z4Fps5UACHg/VbmzT9BKHiaZvxToiQlMqgw4a2H0FUBdxPcCXf6FCWKaHB8ZTCDlHZ0rBMdigeh7R
	tzo+eXhn/K7WaN0rxcrDLEaMvmmYsVFXDOYa6CWFiRMio8G1M32UX63px8Mf34aoS5G9+SNDeRePS
	0vhjQOC8nyLqFNIsS8vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAmE-0000000Eb1z-1lNT;
	Wed, 26 Nov 2025 08:21:26 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOAmC-0000000Eb1A-1bix
	for opensbi@lists.infradead.org;
	Wed, 26 Nov 2025 08:21:25 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4779c9109ceso4699955e9.1
        for <opensbi@lists.infradead.org>; Wed, 26 Nov 2025 00:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1764145282; x=1764750082; darn=lists.infradead.org;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvMbPWKo5fVZoeEaCtVopJQ44JzMQKwUliK0dlLlpOA=;
        b=GdQwab0MgL+iNo0dhytKix4LqUUJ1lIXeGhjs0PsS2Ho6tw/XvlcGFJ1sMwDLCXsmF
         y/sLfgBJ+XvNS4UybJetC/f35T4oy5UnO28eznNhROwXYyDZ7Ql0Fnvt9N9bCGSTKtyR
         7HEJVusZnf1oUxmvXg63En/v8XyhJWgdcX/wUiMKYvirvc6vwjQUAH5jdylOXEM1Km4Q
         9C5f6qT3R9yNFXTR6zuQQ7EFOn506zoutSZFJjAgDnL5paij+ID20s7lP4TGcFVeu430
         knDTFTx+ZADfnPy58QFLbHQ+iTFqvfYW6jYvzzLuZ4UZWBQtk1DjHKObYXDfdFXUzCAP
         ifZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764145282; x=1764750082;
        h=in-reply-to:references:subject:from:to:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MvMbPWKo5fVZoeEaCtVopJQ44JzMQKwUliK0dlLlpOA=;
        b=oTzz6RiV3EdSjqfNaOe68YsJLo4BfPfIsQV3g5GG8nPKbPTUIpRkzpZIVaVrGHiyNN
         33ohYSwmUZ6YQwVtCTMR0E0YjnA5HTUNBAuS0+7sfVcyF4bnp9yqyVyvNO2ZRnW/FSH9
         s0/L2GZy5rRJVHfPQ9uDBEQkjeRHSjBp8e/pjzc99kF4VV+F2bDlwhQ5EYi51j6QOz4e
         2TOL+ZnbmQz1oXfI/J6OGfx5ypiA5GoNWIdZXOf1DDJ3AHReoSYn3kZh03nfjhu3fao2
         zXamJKN2GOBklEollHs0MLFlZFSQ3iJtvAkIINanAfenBHR9Qmjd4xu7uZEtvBodv2vG
         Ch4g==
X-Gm-Message-State: AOJu0YzWzMihnDYG5RqGVxV5VP9SihZJ6L73dibMyyOvOge9gHH6Ii2q
	oH6HToKMWGuglwliIfwih06emedjntqU4Q2FdKIDTM9K10Td26sqk9amlSLmNSWMeCM=
X-Gm-Gg: ASbGnct5vyTP+dUd1qR36eY208BvuNb6lHOjpsMqlbO8QRPBD4f0ZRMsxd02heTKCTr
	1By/U+GPFAeBjYZ9vqSuBZRP2M7x4SYXBD+zKbg3UQrytOGfM/K4ceSMrKvGBNt825NHzF6Bv41
	mICcRBU6ZtIkbCqhCZ/D+Wr6fK/K/eBqdPWPAtFMFVPa9JgcgftQ8xZmfBa38Zpei+q/AKwn4wz
	itSLFHTNTJj3QcpcYBp2siV4SnlkXR2y7Raxts8WCeThF5BC0GulEbo4rO+wmaPpUVvNVZ9AUFC
	siQiwMeGv44RzeNSOegfSAukbN9VVLHNVrTcPB5/umtyKqOKhTsM5/w/RvobUQJa3uxrWX4iokY
	rvm31ytiUom7VH0DksbFivVW1HASx2yTyMwkwOLHFRwF0IAUdxUZ2SWKdqZ5aUzNMwRV60IQLkJ
	angxEIVdZuGq+SlmfZvlbDAjAYnmkyIlddXGU3D023jtuGTjAOV/iE9BuL
X-Google-Smtp-Source: AGHT+IHgl3IOd9uwxyK0s0UXoMAj6mO7sbEBB9yokUfLPRBc99l8yO3VI2etUU64kLufG9wUTqjo9Q==
X-Received: by 2002:a05:600c:4443:b0:471:1387:377e with SMTP id 5b1f17b1804b1-477c01ddc08mr106845255e9.6.1764145281655;
        Wed, 26 Nov 2025 00:21:21 -0800 (PST)
Received: from localhost (ip-89-103-73-235.bb.vodafone.cz. [89.103.73.235])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47903e5fae6sm40019485e9.0.2025.11.26.00.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 00:21:21 -0800 (PST)
Mime-Version: 1.0
Date: Wed, 26 Nov 2025 09:21:16 +0100
Message-Id: <DEIHB3SVYL4W.119RRX5IAT3A5@ventanamicro.com>
Cc: <opensbi@lists.infradead.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] lib: sbi: expected trap must always clear MPRV
References: <20251124220339.3695940-1-debug@rivosinc.com>
 <DEHQBF6B4C9L.125VJJV9WIVFK@ventanamicro.com>
 <aSXvYP2OvUzePP8F@debug.ba.rivosinc.com>
 <DEI035QOBYW1.3MQ044IEZOUH9@ventanamicro.com>
 <aSYAyc347ybLinMS@debug.ba.rivosinc.com>
 <DEI1ATBUEOYS.25ZYOU3OFGQLE@ventanamicro.com>
 <aSYL3FUKAKfyDgqY@debug.ba.rivosinc.com>
In-Reply-To: <aSYL3FUKAKfyDgqY@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_002124_431629_CE5B1868 
X-CRM114-Status: UNSURE (   7.76  )
X-CRM114-Notice: Please train this message.
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

MjAyNS0xMS0yNVQxMjowNDo0NC0wODowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0ByaXZvc2luYy5j
b20+Ogo+IE9uIFR1ZSwgTm92IDI1LCAyMDI1IGF0IDA4OjQ4OjM1UE0gKzAxMDAsIFJhZGltIEty
xI1tw6HFmSB3cm90ZToKPj4yMDI1LTExLTI1VDExOjE3OjI5LTA4OjAwLCBEZWVwYWsgR3VwdGEg
PGRlYnVnQHJpdm9zaW5jLmNvbT46Cj4+PiBJIGNhbiBtb2RpZnkgdGhlIGNvbW1pdCBtZXNzYWdl
IHRvIHJlbW92ZSBzZWN1cml0eSBpbXBhY3QgKHRoYXQgaXQgc2VlbXMgbGlrZQo+Pj4gaG93IGlt
cGxlbWVudGF0aW9ucyBhcmUgaW1wbGVtZW50aW5nIGl0KSBhbmQgcmUtc2VuZCBpdC4KPj4KPj5U
aGF0IHdvdWxkIGhlbHAuICBUaGUgcGF0Y2ggYWxzbyB1c2VzIGEgd3JvbmcgYml0bWFzayBmb3Ig
Y3NyYzoKPj5NUFJWIGlzIGJpdCAxNywgYnV0IHlvdSdyZSBjbGVhcmluZyBiaXQgNSwgU1BJRS4K
Pj4oSXNuJ3QgaXQgcG9zc2libGUgdG8gdXNlIE1TVEFUVVNfTVBSViB0aGVyZT8pCj4KPiBJdCdz
IGBsdWlgIChsb2FkIHVwcGVyIGltbWVkaWF0ZSkuIEkgY291bGQganVzdCBkbyBgbGkgYTQsIE1U
U1RBVFVTX1BSVmAuCj4gQWx0aG91Z2ggaXRzIGEgbGFyZ2VyIGltbWVkaWF0ZSwgc28gbW9zdCBs
aWtlbHkgYXNzZW1ibGVyIHdpbGwgc3BsaXQgaW50bwo+IHR3byBpbnN0cnVjdGlvbnMgb3Igd291
bGQgcmVwbGFjZSBpdCB3aXRoIGBsdWlgLgoKU29ycnksIEkgbWlzc2VkIHRoYXQuICBZZWFoLCBh
c3NlbWJsZXIgc2hvdWxkIHRyYW5zbGF0ZSBpdCB0byBqdXN0IGx1aS4KCi0tIApvcGVuc2JpIG1h
aWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
