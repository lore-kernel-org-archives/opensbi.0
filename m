Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912E5CE7B0E
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 13:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyrstqL2Jp8VZEfTSlEWvjAVhEL1vYwVys8kS5l4KbQ=; b=U9zmQj5cGVEqIw
	Ls29GVDPe/n5NHigY3zn88K9cQO22Rm3aWXVGGFz6Kcl5qai6AHIo8MUp61XrI16xooGwmrIKJ6QZ
	F/M5jkcMFfVtPwxVfXS7GGKRs1NKOIpOH6sBcZ8fDBkt4mIwRv/7xH+j0FpouDK34AczSYRNUZAhn
	KR3wZz5qzQwV07kmCBIbZz15iq3WcfXlkzYN4/1wQ5c0qrxjCGXt8L8eiMEd2u27iO2gNFvbIOFw5
	Df7VRY0NlxSoJQ9thxcUR0VROrDs4TdudPEo0leFvLOOrXcz093NaQ05RtyfFjlipRw+6LEd4xOdT
	WsssaUZDG18atUehJbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuGt-0000000CIhe-2CMl;
	Fri, 14 Nov 2025 13:55:27 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuGq-0000000CIgE-0Qto
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 13:55:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6415bc0cab2so271619a12.3
        for <opensbi@lists.infradead.org>; Fri, 14 Nov 2025 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1763128522; x=1763733322; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ABH173IkU9AYmp06lkxWpAqGgWO4f4iwchvzAy01iv8=;
        b=NftbmESRlVTokBfk4HWfzLwuqKv37Bydn8doQp+cPOxeEq14oCmxhUTyOc31TTaor9
         PH4/6hgehNxslJfOCKakW5yz+OvI63+rKvHQcbDs/dUnGiTGBZmDS7nfaYAtV0gBEtF/
         jMpkDBrgvqx2kFpZwK6B7Z6aTOB/MD7FD7t+PYe3j+vRUW4hgzPiF9rYYGWG5w/UqhxO
         30+gXIGXNZ8egriJ4xdZJ7B6n5laPUICkC3v5dE/VxJsT7V6pwjZ6AaN/EJ1AI/5Yj0q
         XWr2FQR15+v9dCPNquXPiihHH1JA0bJqYoLHKLbB894SElLijrJBkVYyPMKlfFtNEDGm
         IRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763128522; x=1763733322;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ABH173IkU9AYmp06lkxWpAqGgWO4f4iwchvzAy01iv8=;
        b=J+PfOQaJkp1ZNT++2rH0bQgF7vK3vmeo/m7wQAShhQisSh6GlOnISEXISJLrYvDmuV
         MNX6Dnqh11oDICMZv1fyHQfHnog1TGvWwt+ZXK6YB/IfOv0QJubnhV8UDqX90uTtpfQu
         opV9uP3jTP9hPGweCW1+Tj5xownAvWIeVrbnQIyLb4PN1UqE8T8qXIfpm8sluPCWbbJ6
         arHL/ntAF2O2n5UlXdRxwmoUmnaPYIHYvekTYi07tfXkbESsTwwBLTFiiVku+V2ukVl/
         JH5k/WUfg/WRnkBLcf5zmQWwydioT0C2kDHY7Egwgm6aq6/Z3ytwA1NTeb8Vq4kCUIrM
         cZlw==
X-Forwarded-Encrypted: i=1; AJvYcCXyGr//Xw5lAqIVU7IU9mDLUOc1hSKHTo2csBTqZ7zlL7bTaDs7+KH6mE4Jxo/GMPjakeNp3ypk@lists.infradead.org
X-Gm-Message-State: AOJu0YzMqct9TmiM5Srvm+pMS4ENgOCe2TnxL/HhLofxDaHq/N4vZMBO
	nZ6o1aXPzF7Ko8f4lm4dyIKdoSZk2vfa0JaJxxI9JxW3Ei5hp/H/dQUJ/wY/fnoJ3Bo=
X-Gm-Gg: ASbGnctXh6g3G34CY8SHV8ZaNoRS9oxHT3Gy8LD5MlHyM6BDKIUI2Eh+3wjyZ0PHfTS
	8x6ugXePQfCX2mfzt8bRQWEIjiPDv9bjlahEoQuKzPhMXYPToSTKgkvdLDtF4tqWrOW8bel33nH
	OA+c1YTu+7fGtPxjyVPaaLfS/txfzwFqMryW3O48wPanYk5J9F+Kf6PmNnTTIZCmZ3ixYruf0BA
	qnXflZOzB0X9XvpCZJGCA1wYzkxY/MovO6dHYLOfxKYoE3kSNozb6O9D0iIzV09kBN73cXf+sv7
	LqUru+MoPR9i0NfWYKUdznnpGSn+r3l798qYsoLtZUwzUxJQs2pksAhYN3crl5LRSuC8zN7bbkF
	Q/N2ZaXLamyF1en7HYpLSgugD8oavv28qHHtsPYF7zvK7plTvpriMBpk8+6gWs4ElQ0PzpOwqAf
	g=
X-Google-Smtp-Source: AGHT+IHcNpZdpS33cHHjwgszMLCxZGm/XVCFtgBW+fLMsb+hIEbbALZvWhTNgAdOlPTN4qEte2kY4g==
X-Received: by 2002:a17:907:3daa:b0:b73:59b0:34c6 with SMTP id a640c23a62f3a-b7367fa07ecmr163585566b.4.1763128522271;
        Fri, 14 Nov 2025 05:55:22 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::3052])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b73718fec4csm87515166b.39.2025.11.14.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:55:21 -0800 (PST)
Mime-Version: 1.0
Date: Fri, 14 Nov 2025 14:54:58 +0100
Message-Id: <DE8GW2BKAOKE.2XBAO1XW4C2RF@ventanamicro.com>
Subject: Re: [PATCH v5] lib: sbi: Enable Ssqosid Ext using mstateen0
Cc: <anup@brainfault.org>, <guoren@kernel.org>, "opensbi"
 <opensbi-bounces@lists.infradead.org>
To: <cp0613@linux.alibaba.com>, <opensbi@lists.infradead.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20251114115722.1831-1-cp0613@linux.alibaba.com>
In-Reply-To: <20251114115722.1831-1-cp0613@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_055524_177011_85B6AC96 
X-CRM114-Status: GOOD (  11.00  )
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

MjAyNS0xMS0xNFQxOTo1NzoyMiswODowMCwgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT46Cj4g
RnJvbTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPgo+IFRoZSBRb1MgSWRl
bnRpZmllcnMgZXh0ZW5zaW9uIChTc3Fvc2lkKSBpbnRyb2R1Y2VzIHRoZSBzcm1jZmcgcmVnaXN0
ZXIsCj4gd2hpY2ggY29uZmlndXJlcyBhIGhhcnQgd2l0aCB0d28gaWRlbnRpZmllcnM6IGEgUmVz
b3VyY2UgQ29udHJvbCBJRAo+IChSQ0lEKSBhbmQgYSBNb25pdG9yaW5nIENvdW50ZXIgSUQgKE1D
SUQpLiBUaGVzZSBpZGVudGlmaWVycyBhY2NvbXBhbnkKPiBlYWNoIHJlcXVlc3QgaXNzdWVkIGJ5
IHRoZSBoYXJ0IHRvIHNoYXJlZCByZXNvdXJjZSBjb250cm9sbGVycy4KPgo+IElmIGV4dGVuc2lv
biBTbXN0YXRlZW4gaXMgaW1wbGVtZW50ZWQgdG9nZXRoZXIgd2l0aCBTc3Fvc2lkLCB0aGVuCj4g
U3Nxb3NpZCBhbHNvIHJlcXVpcmVzIHRoZSBTUk1DRkcgYml0IGluIG1zdGF0ZWVuMCB0byBiZSBp
bXBsZW1lbnRlZC4gSWYKPiBtc3RhdGVlbjAuU1JNQ0ZHIGlzIDAsIGF0dGVtcHRzIHRvIGFjY2Vz
cyBzcm1jZmcgaW4gcHJpdmlsZWdlIG1vZGVzIGxlc3MKPiBwcml2aWxlZ2VkIHRoYW4gTS1tb2Rl
IHJhaXNlIGFuIGlsbGVnYWwtaW5zdHJ1Y3Rpb24gZXhjZXB0aW9uLiBJZgo+IG1zdGF0ZWVuMC5T
Uk1DRkcgaXMgMSBvciBpZiBleHRlbnNpb24gU21zdGF0ZWVuIGlzIG5vdCBpbXBsZW1lbnRlZCwK
PiBhdHRlbXB0cyB0byBhY2Nlc3Mgc3JtY2ZnIHdoZW4gVj0xIHJhaXNlIGEgdmlydHVhbC1pbnN0
cnVjdGlvbiBleGNlcHRpb24uCj4KPiBUaGlzIGV4dGVuc2lvbiBjYW4gYmUgZm91bmQgaW4gdGhl
IFJJU0MtViBJbnN0cnVjdGlvbiBTZXQgTWFudWFsOgo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNj
di9yaXNjdi1pc2EtbWFudWFsCj4KPiBDaGFuZ2VzIGluIHY1Ogo+ICAtIFJlbW92ZSBTQklfSEFS
VF9FWFRfU1NRT1NJRCBkZXBlbmRlbmN5IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIKPgo+IENoYW5n
ZXMgaW4gdjQ6Cj4gIC0gUmVtb3ZlIGV4dHJhbmVvdXMgcGFyZW50aGVzZXMgYXJvdW5kIFNNU1RB
VEVFTjBfU1JNQ0ZHCj4KPiBDaGFuZ2VzIGluIHYzOgo+ICAtIENoZWNrIFNCSV9IQVJUX0VYVF9T
U1FPU0lEIHdoZW4gc3dhcHBpbmcgU1JNQ0ZHCj4KPiBDaGFuZ2VzIGluIHYyOgo+ICAtIFJlbW92
ZSB0cmFwLW4tZGV0ZWN0Cj4gIC0gQ29udGV4dCBzd2l0Y2ggQ1NSX1NSTUNGRwo+Cj4gU2lnbmVk
LW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiAtLS0KCkl0J3Mg
cG9zc2libGUgdGhhdCBTLW1vZGUgY29udHJvbCBvdmVyIHNybWNmZyBtaWdodCBsZWFrIHZlcnkg
bGl0dGxlCmluZm9ybWF0aW9uIGFjcm9zcyBhcmNoaXRlY3R1cmFsIGlzb2xhdGlvbiBib3VuZGFy
aWVzLCBidXQgSSBkb24ndCBrbm93CmVub3VnaCBhYm91dCBDQlFSSSB0byBtb3VudCBhbnkgcHJh
Y3RpY2FsIGF0dGFjayAoaXQgbWlnaHQgbm90IGV4aXN0KSwKc28gdGhlIGN1cnJlbnQgaGFuZGxp
bmcgc2VlbXMgYWNjZXB0YWJsZSwKClJldmlld2VkLWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNt
YXJAdmVudGFuYW1pY3JvLmNvbT4KClRoYW5rcy4KCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApv
cGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9vcGVuc2JpCg==
