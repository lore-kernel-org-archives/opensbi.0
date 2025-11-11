Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D20ACCF9E3
	for <opensbi@archiver.kernel.org>; Tue, 11 Nov 2025 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=581ya3D+6hbelaLeHBWyLZu16Fc7NMTcRcZHtGK0zEY=; b=KVP+lyDBrPdnWM
	npY/f9vRWJmNXb9OAAfah93JXMlRkh7oSq5MWfk9TlxRnhZmPHucwSpnVw/2UPsfD7QrYJVUE33GH
	r6VKDOmeg2v7tTzQ/UlcyWDqwUQRpkyOnDQtB09LP/yogzuHydwnI83P1/lDQQqcwbFIsUuGfZRFl
	OFVaubAcT/o3j+jy8+eW2INBnjKdvOy45TTAg0HLICUijBo6uh3V7wh7XtETwHV8ojYmBVUnAphBU
	DEXV/tENUbvV9Odcb/XdV3UjxEx6OIHy1Fah/1PWQPAP55+5c2mM6Qj1Q8wFu2KuahvKSGwND6fsF
	M2cIBrtWbQ68+FRfkAHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlSc-00000006w4t-3jNI;
	Tue, 11 Nov 2025 10:18:50 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIlSW-00000006w3C-0RFk
	for opensbi@lists.infradead.org;
	Tue, 11 Nov 2025 10:18:50 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b72574b4e47so71934766b.3
        for <opensbi@lists.infradead.org>; Tue, 11 Nov 2025 02:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1762856322; x=1763461122; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D8YHAVdrcV5BfIpu9lAjYs45kGG7ZI+m8aa5YtEwSRY=;
        b=VIukzrQWgi3VFUpxjdoSgsGwdp+7c4Deo9NpUGAnXHCoPQDC4FgSUejPwEZUN27YFm
         rXxvBfXjQkMe4yY/fpqOWJHo1isOFXktQpED3TaHJv3hp6Ah7Lczsff4XWf+z83w8Lkd
         /U2+xDKZ2TOJ2boU1eOBTQj6Lnq6CG9SShn3sXZAZVMQtTGJAOpOjPtJ5BFOnRxRtPpk
         83+Wdj/IuJYRQsQSDHzCi0BvxE/7WKAIHvZcrVwFvrJn0qQQmTyQBZbFLKyTAmePXbKe
         HgIIfHv/znVV47oozAwPmyLB1V1a3hBQF1cN3ouTrl2djHH+HD8rCZRBI2F7PcOYCe+U
         zSbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762856322; x=1763461122;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D8YHAVdrcV5BfIpu9lAjYs45kGG7ZI+m8aa5YtEwSRY=;
        b=I5pcuUbtvaccD68YfVpmeN8MYH5wsQl0cyJwtz58hal1aLcJPYuDpFnz5rzqwUNZTu
         3yDv/RytBkziT1HnkmSh71uVO56DI43lltly0mXXSUwza929aYvRUzc7szfIRQpYXb3i
         qK3xsOG3wMqF3qXxC784g06jNvizBHxF1RASblKBmtNieyjSGta/R1gwcwk4ej8E1uvq
         hCY6r5bs278GTQ2VIDeK7m5CQuAb1scO7cML3zD4MdVq5fuN2hebDbYsQkX6ZBUA7qRc
         +j5KTxZXcH5C5elU7XK6uWXzP47WFqeG2f6ksckqx1dR/t/SHReec/4bVB/KkUMtP+Lb
         +aXw==
X-Forwarded-Encrypted: i=1; AJvYcCVJWwILDE4koF5/GoVUeYswCYno0snMVo930z9pki7rFHznMrfSm746rxae6qT2PhAKIvX72Qxg@lists.infradead.org
X-Gm-Message-State: AOJu0YwroigUbEiANeG3Gwgo2XNr9J2IM98SdEC/eAQEHPCU60WNvucE
	Xc+dNXsmujzjii+hRgzxgpxdz7cxuoK1VkBjb3vNyBCgspTSGo19SC3mCeCrIo8lK4s=
X-Gm-Gg: ASbGnctjTSlf8dzUILgJo/8z6QVwsJ2NyqSH0Zg2xBWTltkoC4fMzAAp2a98xvLZRkr
	AU4T6f2lKO7pAqgIaxbYhb1yzThG3Q9TOD8DWzHxErxR7rqUW8sH5UkrfzV/GlVW9uV6R1AI7P8
	AMAzAD/chCvWwi9/8bRK7Tr6alZLEEy8suMWOfqeLxaCZPP5+F4a8MM7erw9CiM+oDiSa280awc
	8zwKYggC4icWTWyP+DcmwpmeHvQBMOGNt/r3c7CdpnVeJR4BavbbvD/kgESrqP+HMrF4Fk5XhqJ
	xgDMlzPzuSMzntM4UyKMbhnnFm3WBOzk3CEPHN0W6bjtIZnm1prh+7j7o/aElD0bgXTN/7nMwpA
	pKaUbDiP7VU/G8TxSgrb/TnKWxz/kp11CgDe3/CzW8GB9rERH9UeNdYnbJBAuwg37x3dKbL4O27
	A=
X-Google-Smtp-Source: AGHT+IHhoZoqg62U6xt4hL2+Lks/bb5v4l/uzHF4UHqgCgOjnr8QrBTmhzfg/mUIbzXEhdfCAWIUdw==
X-Received: by 2002:a17:906:ee86:b0:b70:e685:5ac8 with SMTP id a640c23a62f3a-b72e02ce63fmr674617066b.3.1762856321489;
        Tue, 11 Nov 2025 02:18:41 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b72bf723172sm1298213366b.32.2025.11.11.02.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 02:18:41 -0800 (PST)
Mime-Version: 1.0
Date: Tue, 11 Nov 2025 11:18:21 +0100
Message-Id: <DE5SEKPHV34G.18XMB4JDT7M0O@ventanamicro.com>
Subject: Re: [PATCH v3] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <anup@brainfault.org>, <guoren@kernel.org>,
 <opensbi@lists.infradead.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <cp0613@linux.alibaba.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <DE53DAU3LAAK.2FGKTU66OSUEX@ventanamicro.com>
 <20251111094938.1492-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251111094938.1492-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_021844_148870_03FF8E10 
X-CRM114-Status: GOOD (  14.66  )
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

MjAyNS0xMS0xMVQxNzo0OTozNiswODowMCwgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT46Cj4g
T24gMjAyNS0xMS0xMCAwMjo0MSBQTSwgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+PiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzbyB0aGVyZSBpcyBubyBuZWVkIHRv
IGNvbnNpZGVyIHRoZSBleGVjdXRpb24KPj4gPiBzaXR1YXRpb24gaW4gTS1tb2RlLCBpdCBpcyBv
bmx5IG5lY2Vzc2FyeSB0byBlbmFibGUgdGhlIHJlbGV2YW50IHBlcm1pc3Npb25zLgo+PiAKPj4g
VGhlIGV4ZWN1dGlvbiBvZiBNLW1vZGUgaXMgYWZmZWN0ZWQgYnkgc3JtY2ZnLCBzbyB3ZSBoYXZl
IHRvIGJlCj4+IGV4dHJlbWVseSBjYXJlZnVsIGFib3V0IGlzb2xhdGlvbiBpbiBvcGVuc2JpIHRv
bywgZXNwZWNpYWxseSB3aGVuCj4+IGp1Z2dsaW5nIG11bHRpcGxlIGRvbWFpbnMuCj4+IAo+PiAo
SSB0aGluayB3ZSBtaWdodCBiZSBmaW5lIG5vdywgYnV0IGhhdmluZyBvcGVuc2JpIHN3aXRjaCB0
byBhIHNybWNmZwo+PiAgdGhhdCBpc24ndCBjb250cm9sbGVkIGJ5IFMtbW9kZSB3aWxsIHJlc3Vs
dCBpbiBhIGxvdCBsZXNzIGhlYWRhY2hlcy4uLikKPj4gCj4+IFRoYW5rcy4KPgo+IEluZGVlZCwg
c3RyaWN0bHkgc3BlYWtpbmcsIHRoZSBleGVjdXRpb24gb2YgTS1tb2RlIGlzIGFsc28gYWZmZWN0
ZWQgYnkgc3JtY2ZnLgo+IFdoZW4gZGVhbGluZyB3aXRoIG11bHRpcGxlIGRvbWFpbnMsIGF0dGVu
dGlvbiBuZWVkcyB0byBiZSBwYWlkIHRvIGlzb2xhdGlvbiBhbmQKPiBjb250ZXh0IHN3aXRjaGlu
ZyBpc3N1ZXMuIEkgdW5kZXJzdGFuZCB5b3VyIHBvaW50IG9mIHZpZXcuCj4KPiBIb3dldmVyLCBJ
IHdvbmRlciBpZiBpdCBjb3VsZCBiZSBkb25lIGluIGEgbGF0ZXIgc3RhZ2Ugb2YgdGhlIHdvcmss
IGJlY2F1c2UgdGhlcmUKPiBpcyBjdXJyZW50bHkgYSBkcmFmdCBzcGVjaWZpY2F0aW9uIHNtbXR0
WzFdIHRoYXQgaXMgYWxzbyByZWxhdGVkIHRvIHRoaXMuIFRoaXMKPiBleHRlbnNpb24gaW52b2x2
ZXMgbXVsdGlwbGUgU3VwZXJ2aXNvciBEb21haW5zLCBhbmQgYXQgdGhpcyB0aW1lLCBpdCBpcyBu
ZWNlc3NhcnkKPiB0byBpbXBsZW1lbnQgY29udGV4dCBzd2l0Y2hpbmcgb2Ygc3JtY2ZnIGJldHdl
ZW4gZGlmZmVyZW50IGRvbWFpbnMuCgpJIGFncmVlIHRoYXQgd2UgY2FuIHJldHVybiB0byB0aGF0
IGlzc3VlIGxhdGVyLCBhcyBpdCdzIG5vdCBjbGVhcmx5CmJ1Z2d5IGZvciBub3cuICBGb3IgdGhp
cyBwYXRjaCwgSSB3b3VsZCBqdXN0IGxpa2UgdG8gZml4IHRoZSBjb25kaXRpb24uCgpUaGFua3Mu
CgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
