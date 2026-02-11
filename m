Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486EAEB271F
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 10:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iswIhMBjUoGAMp4JWHDh5Q6CXqCdxhnHSA1FBwON7iU=; b=DoMTj5AwIu9pEm
	xiW1WT4w5Cneyr2Mv3fC0vI3bR9rEobENmypDPDyANdoukv+25imNXnlmV6eJSN5eY42YBazlw6M3
	0zio3bMNIF0JYDWUrTTaCQpoWpRiusR1axqwG4Jq/SfYBnbWk9msYycq/y2o9MdBaRWsOby2li0KO
	N7Yi/uIdt4xWXwZjDjoBbD4fFg0H4rfR9U3GmyhdvK/kwpD37zTXZ4AxOY6QsqYTnnFZHMUXWhBC2
	7J/LKAI5vW12RMvgntqZ8KsRM+PXUFojs4I8guafkgMzGyTCdk/p2pJhlNl5qxk/RoJcjoB35B3RX
	C9ahGW94XQRtEfnW5Tpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7cP-00000000WVo-0QFk;
	Wed, 11 Feb 2026 10:38:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq7cM-00000000WVL-2mNt
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 10:38:48 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2aaf59c4f7cso8821085ad.1
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 02:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770806325; x=1771411125; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LRjEskGOEUM4fnnptJ4eB0xanXVRjddQBV0Y1yXiPtY=;
        b=jztE/UBDytcMHgZXnEGckMqv2dp+eleCqyfrR84dDoxmy6WmKmUQu3WpaYKPr2adrx
         ihsVBd1Yt+AUzUjuClqrAfc73+CWXfDqfr1mne5MxZb3UZy+5QRJZPm0LMRvht2Rx64c
         1pKerDjnReqaZv/AGh8ohU6IpjxE4QkaZvQu8Is4TcVE+RM6koUid327pqlChgZwKhJy
         /IZ4AV+5DNYlbVkj/szJwWspyPpcNTR/OdsDIBfLvAgn+CMPLSV4sEpOpBofDhNc412S
         zbOPi3vcwGRBUltciLIDxQQ9+Ys1HjFCWQepw5PciphugvBUR6FRMCl/WhxzjQrQogWM
         VKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770806325; x=1771411125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LRjEskGOEUM4fnnptJ4eB0xanXVRjddQBV0Y1yXiPtY=;
        b=gRR12LAvXqLajmY0S/b1OUbFnR2BVsHutF3HLKpnDF/mI4ppxZn5Io4T1w0O4UUIv2
         OHmnQpBhYzaRSdXM9ddSRlJMYW3IMddvz7MU0R/6gE/eBkgJ6lkTymZkjfLJewVmVWxM
         H/M02FHoYObXD969AsxBRlfpL78kBelUBSvbyYM1Nk2tB14N1EOd8gUbtK9urEwE0AWE
         5EuZxTmfBk401V3f59zrfo5Z1aIe8LzOy+4aiJFhbWOxM1+naEEclHxuG4OrjfAhn8zr
         bT65S0bLxhi/3KI/i1GAMIhMQdYtSR4YLNYLxxKLnhJsOFIJD+5rZvRFfQCOcBfXt+QZ
         ebHA==
X-Gm-Message-State: AOJu0Yz3frkhvZemKAxBDzoVjEdGjWV7pBI/XZG4QZO4cEQUH9eH8ilZ
	U8zODV5E/3/KrvQZ7Y1+WJTwe2UUPhsq3ssw2F/OmGhWvAUbVRZ2elfr
X-Gm-Gg: AZuq6aIdYsMhPnb1O20z34vRyObZv31LOc2SmJNXKTd+ZR+marIsqkjd6Rs43aWnImm
	aOfiu9ZI9qArWaXVjax8crp58ER3PcvAYMYzGG7bPMU0rGYciXpLXewejw2+lNe61eH3a6bOato
	E/TjniT2QbqWuQtH15w2sACIBd4W/7Tl4uxIX8pnjJt8RioBYcS23jQ7qifrINpW0HIldg3qz9D
	93K/pA/caWBjfgfN4UAD6N7Sgk0P3POG5jMdwzE9WJKSYH+bSmCtq0jLNnyZFm0IhZcpq+iAEd+
	3UWQFC45T0MO6maMxmUd5+x1i/8UX7thfR2noV2dVIp3Jfef6XxDn52A50R+TFCxyFv9Q2bYauJ
	1RMQ4cQUCuLOH1x7MvlJQ3Ag+zNlkBibcNxhgz6HcSZJvUFzZgXDBdFg8XGmhR4c4BgkQ/qyY7G
	wDvDNeB1Ae0jVcREmkuLAuSgMt
X-Received: by 2002:a17:903:3583:b0:2aa:eed5:c5aa with SMTP id d9443c01a7336-2aaeed5c710mr90508365ad.57.1770806325178;
        Wed, 11 Feb 2026 02:38:45 -0800 (PST)
Received: from [192.168.0.13] ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab2984ab2fsm17475375ad.17.2026.02.11.02.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Feb 2026 02:38:44 -0800 (PST)
Message-ID: <18716d93-ed49-4c30-80b3-0956306df776@gmail.com>
Date: Wed, 11 Feb 2026 02:36:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] lib: sbi: Rework load/store emulator instruction
 decoding
To: Andrew Jones <andrew.jones@oss.qualcomm.com>, Bo Gan <ganboing@gmail.com>
Cc: opensbi@lists.infradead.org, dramforever@live.com,
 anup.patel@oss.qualcomm.com, anup@brainfault.org, cleger@rivosinc.com,
 samuel.holland@sifive.com
References: <20260210094044.72591-1-ganboing@gmail.com>
 <20260210094044.72591-7-ganboing@gmail.com>
 <3joqam2xgawjrhjyao7q7ulni23x5b73lk7twirld2lpiw2xf6@slh6pvojkksv>
Content-Language: en-US
From: Bo Gan <ganboing@gmail.com>
In-Reply-To: <3joqam2xgawjrhjyao7q7ulni23x5b73lk7twirld2lpiw2xf6@slh6pvojkksv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_023846_737564_349A2FE9 
X-CRM114-Status: GOOD (  19.94  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

SGkgQW5kcmV3LAoKT24gMi8xMC8yNiAwODowOCwgQW5kcmV3IEpvbmVzIHdyb3RlOgo+IE9uIFR1
ZSwgRmViIDEwLCAyMDI2IGF0IDAxOjQwOjQzQU0gLTA4MDAsIEJvIEdhbiB3cm90ZToKPiAuLi4K
Pj4gVmFsaWRhdGlvbjoKPj4gVGhlIHBhdGNoIGlzIHZhbGlkYXRlZCB0byBoYXZlIGZpeGVkIHRo
ZSBpc3N1ZSB3aXRoIHRlc3QgY2FzZXMgcnVubmluZwo+PiBvbiBhIG1vZGlmaWVkIHZlcnNpb24g
b2YgUUVNVSB0aGF0IGV4cG9zZXMgbWlzYWxpZ25lZCBmYXVsdHMgWzFdLCBhbmQKPj4gYSBmdXJ0
aGVyIG1vZGlmaWVkIHZlcnNpb24gdGhhdCByZW1vdmVzIHRpbnN0IHRyYW5zZm9ybWF0aW9uIFsy
XS4gVGhlCj4+IFMtbW9kZSBPUyBpcyBhIGxvY2FsIGJ1aWxkIG9mIERlYmlhbiBUcml4aWUgNi4x
MiBrZXJuZWwgdGhhdCBlbmFibGVzCj4+IENPTVBBVCAoUlYzMiksIGFuZCB0aGUgVS1tb2RlIHRl
c3QgYXBwbGljYXRpb24gZXhlcmNpc2VzIGFsbCBpbnRlZ2VyCj4+IGFuZCBmbG9hdGluZy1wb2lu
dCBsb2FkL3N0b3JlIChSVklGRDY0LzMyK1JWQzY0LzMyKSBpbnN0cnVjdGlvbnMgd2l0aAo+PiBh
bGwgcG9zc2libGUgaW1tIHZhbHVlcy4gVGhlIHBhdGNoIGlzIGFsc28gdGVzdGVkIG9uIHJlYWwg
SFcgKFNpZml2ZQo+PiBQNTUwL0VTV0lOIEVJQzc3MDApLCB3aGljaCBvbmx5IHN1cHBvcnRzIFJW
NjQuIE9uIFA1NTAsIHRoZSBzYW1lIHRlc3QKPj4gd2FzIHZhbGlkYXRlZCBib3RoIGluIFUgbW9k
ZSBhbmQgVlUgbW9kZSwgd2hlcmUgdGhlIGhvc3QgcnVucyBhIDYuMTIKPj4gRVNXSU4gdmVuZG9y
IGtlcm5lbCB0aGF0IGhhcyBzb21lIEVTV0lOIFNvQyBkZXZpY2UgZHJpdmVyIHBhdGNoZXMgWzNd
Cj4+IGFwcGxpZWQsIGFuZCB0aGUgZ3Vlc3QgcnVucyB0aGUgZXhhY3Qgc2FtZSBEZWJpYW4gVHJp
eGllIDYuMTIga2VybmVsCj4+IG1lbnRpb25lZCBhYm92ZS4KPj4KPj4gWzFdIGh0dHBzOi8vZ2l0
aHViLmNvbS9nYW5ib2luZy9xZW11L3RyZWUvZ2FuYm9pbmctbWlzYWxpZ24KPj4gWzJdIGh0dHBz
Oi8vZ2l0aHViLmNvbS9nYW5ib2luZy9xZW11L3RyZWUvZ2FuYm9pbmctbWlzYWxpZ24tbm8tdGlu
c3QKPj4gWzNdIGh0dHBzOi8vZ2l0aHViLmNvbS9zaWZpdmVpbmMvcmlzY3YtbGludXgvdHJlZS9y
ZWwva2VybmVsLTYuMTIvaGlmaXZlLXByZW1pZXItcDU1MAo+Pgo+IAo+IEhpIEJvLAo+IAo+IEl0
J2QgYmUgbmljZSBpZiB3ZSBjb3VsZCBpbnRlZ3JhdGUgZW11bGF0aW9uIHRlc3RzIGludG8gYSB0
ZXN0IHN1aXRlIHRoYXQKPiBnZXRzIHJ1biBmcmVxdWVudGx5IGluIG9yZGVyIHRvIGNhdGNoIHJl
Z3Jlc3Npb25zLiBXZSBoYXZlIGFscmVhZHkgc3RhcnRlZAo+IHVzaW5nIHRoZSBrdm0tdW5pdC10
ZXN0c1s0XSBmcmFtZXdvcmsgZm9yIFNCSSB0ZXN0aW5nIHNvIGFkZGluZyBlbXVsYXRpb24KCkdv
b2QgdG8ga25vdy4gSSB3YXNuJ3QgYXdhcmUgb2YgdGhpcyBwcm9qZWN0LiBJJ2xsIGRlZmluaXRl
bHkgdGFrZSBhIGxvb2sKYW5kIHNlZSBpZiBJIGNhbiB1cHN0cmVhbSB0aGUgdGVzdCBjYXNlcyB0
aGVyZS4gSSBndWVzcyBpdCBjYW4gYmUgdXRpbGl6ZWQKdG8gdGVzdCBtaXNhbGlnbmVkIGhhbmRs
ZXIgaW4gYm90aCBNIG1vZGUgT3BlblNCSSBhbmQgdGhlIEtWTSBTQkkgbGF5ZXIsCmRlcGVuZGlu
ZyBvbiB3aGV0aGVyIGhvc3QgTGludXgvS1ZNIGVuYWJsZXMgbWlzYWxpZ25lZCBleGMgZGVsZWdh
dGlvbiwKY29ycmVjdD8KCj4gdGVzdHMgdGhlcmUgd291bGQgbWFrZSBzZW5zZS4gSWYgc3BlY2lh
bCBRRU1VIGJlaGF2aW9yIGlzIG5lZWRlZCB0aGVuIHdlCj4gc2hvdWxkIGdldCBjcHUgcHJvcGVy
dGllcyB0aGF0IGVuYWJsZSB0aG9zZSBiZWhhdmlvcnMgdXBzdHJlYW1lZCBzbyB3ZSBjYW4KPiB0
dXJuIHRoZW0gb24gd2hlbiBydW5uaW5nIHRoZSB0ZXN0cy4KCkkgdGhpbmsgdGhpcyBpcyBkb25l
IGJ5IG90aGVycyBmb3Igc3VyZS4gSSB3YXMgYWN0dWFsbHkgaW5zcGlyZWQgYnkgdGhpcwpodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDEyMTEyMTE5MzMuMTk4NzkyLTEtZmtvbnJhZEBh
bWQuY29tLwpzZXJpZXMgYnkgRnJlZGVyaWMgdG8gaGFjayBRRU1VLiBTaW1pbGFyIHBhdGNoZXMg
aGF2ZSBiZWVuIGRvbmUgYnkgb3RoZXJzCnN1Y2ggYXMgQ2zDqW1lbnQgbWVudGlvbmVkIGluIHRo
aXMgc2VyaWVzOgpodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTAxMDYxNTQ4NDcuMTEw
MDM0NC0xLWNsZWdlckByaXZvc2luYy5jb20vCkknZCBsaWtlIHRvIGhlYXIgZnJvbSBmb2xrcyB0
byB1bmRlcnN0YW5kIGlmIHRoZXJlJ3JlIGFueSByb2FkYmxvY2tzCmV4cG9zaW5nIHRoZSBtaXNh
bGlnbmVkIGZhdWx0IGluIFFFTVUgKGdhdGVkIGJ5IGEgY29uZmlnIGZsYWcpLCBiZWZvcmUKYXR0
ZW1wdGluZy4KClNwb2lsZXIgYWxlcnQ6IExpbnV4J3MgbWlzYWxpZ25lZCBoYW5kbGVyIHNlZW1z
IHRvIGJlIGFmZmVjdGVkIGJ5IHRoZQpzYW1lIGluc24gZGVjb2RpbmcgaXNzdWUgd2hlcmUgdGhl
cmUncyBubyBjaGVja2luZyBvZiBwcmV2aW91cyBYTEVOLiBJJ20KeWV0IHRvIGNoZWNrIGlmIExp
bnV4IGlzIGFmZmVjdGVkIGJ5IG90aGVyIGlzc3VlcyBpbiB0aGlzIHBhdGNoc2V0LCB0b28uCk9u
Y2UgdGhpcyBjaGFuZ2UgaXMgbWVyZ2VkIGluIE9wZW5TQkksIEknbGwgYWxzbyBiZSBsb29raW5n
IGludG8gZml4aW5nCkxpbnV4IGFuZCBhZGRpbmcgbXkgdGVzdCBjYXNlcyBpbnRvIExpbnV4L3Nl
bGZ0ZXN0cyBhcyB3ZWxsLgoKPiAKPiBbNF0gaHR0cHM6Ly9naXRsYWIuY29tL2t2bS11bml0LXRl
c3RzL2t2bS11bml0LXRlc3RzCj4gCj4gVGhhbmtzLAo+IGRyZXcKCkJvCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
