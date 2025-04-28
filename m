Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2519EC369D5
	for <opensbi@archiver.kernel.org>; Mon, 28 Apr 2025 13:55:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hOKAFDe1mbeZ/qtncgjtvYpAnmz7k4DwFkPwe9b9IOk=; b=wtipUE8kEleS4O
	lKXfni/VTtWbj4BouaXRSg4yIrCY7vh8RlxyTRyrLdQpALCWqL3x2KZpXiudSKbdkdcawD0yxL0KG
	eRlLPiT7gfYcjRhz8t24KNGTyo2206oo9MGmg6RZEXYihgwckBNOm5EE+ATdxr8H1XHuq6IlvrTGP
	Px8SzIRVry45lETAjGhJ2muH2S9rkizkL1J01Q2HX9ISlULJGPAkahUVJaRyRM1IVo45nP7NO5jDO
	LSJ+iIUZyZYcxRvUIAUP4Rhjh37m6HzgOzUOC8PBPdLETNm+qKT9ijwaq8STpiYFmzztOWlffjR6y
	I5PNCSvnxnaPtK64AmdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Ows-00000006YHI-3g7x;
	Mon, 28 Apr 2025 13:55:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9On2-00000006Wc1-42fH
	for opensbi@lists.infradead.org;
	Mon, 28 Apr 2025 13:44:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43ceeb85ab2so2772115e9.0
        for <opensbi@lists.infradead.org>; Mon, 28 Apr 2025 06:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745847895; x=1746452695; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4qmA7KPvjWs8h2VBZ3rh0cmIg4z2PuuAipdbl3QFuUM=;
        b=I8ca+bRXyKhCbsQekkx+WVM3ucO7CD8EpHSAljgyyuPfh9H4CPG2JRdvPgecdHoTBd
         ZZwdsev9gO2AxDTGG/OpJi8UxbarPUvAOy8Rn8i0wQcW0G+WuW+xvw4m3x/3aTJhg+yZ
         5pU8nadcLZV4uiyZOJTiv8gY6fIzbCzX0ccYsBdLDjn/fQuaafzx+N52Av2MQLzjCOFI
         1TmB8rDjIfDRGjL6X8+efUrENFg0N/lv9jR1Rm6xXbYhAOBNio2j+hJWqXZZWkoAWaYo
         9InHzo91b4yD85UXPfcAuj6/mUvooq+OHLFSzvLHxUwQ83qtHsYgRFc0mWXAHTHA7VzZ
         uY+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847895; x=1746452695;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4qmA7KPvjWs8h2VBZ3rh0cmIg4z2PuuAipdbl3QFuUM=;
        b=guJlSARRSvZ3JUO2dO9uedDLj+HIh788xcyITcvFCrsH+Kh1YcuvEcUSP5j0JrmWyj
         GQoqaHlL6jaf1xCbfSDzwtwN2dEJ3oFacRTQU+lQeN3De5c77y7GEuDEfI9hVEEz7WEQ
         9RacXK+8xBMiw0BxnwzPO6veBaYVuoALXxoSoJP6ggB96583qWXhXPCy34mgisCCys4n
         ifQ+qUiTUAIB3YQu9kgGoUQK4cYBzomCsZdTtjwt31UJtVyFIYtW3Yx/vujN3XCO+uc+
         o0tOi7PX9h70hG5mC2MFqMmCbPUjoH8Yj7o1ML6LOWQH88nCfzIkrR7WArFUO1J+tkc6
         ziLQ==
X-Gm-Message-State: AOJu0Yz0I07P8YX4yfNS4K8tHVJilZxmC6X1oaJHRCdoeQE3W4DPC2bF
	LO0Lw5npfbvuSITu38q2vDAScHxbJQiBvmP/2wjiQ+CN2Ix2DDTAWSz1HD4e2Rr6rpoOsWyFoOc
	TAPA=
X-Gm-Gg: ASbGncuKAmGNixMJ5y+A6kMP1vKX2nW0llwaYaE50oxQQcw78cL/PdkXAahjAfJOtCQ
	NDATGxFo9KT0ifHFSCgyMjrc0MbilLoG/pxlbCD2rCAnyNCV/wfbtEEnlE1v4YgecvxLoppesiP
	awRloKb9bULNfv1FKGx3JRldw8cL1Wcmmjjqwyk/0KGateiuYDs86+9BTek+tEbRGQGH6/m+0FM
	rW5lqLFV/3u0P1dGaTW4PJrKeZ5W8LutAGQ45cfJYN4c0YkZC0+n4A4ssXu+z4h0lYql85L97GP
	qtuVD4K1WTtZrGUOoWbFo97uObg1KtYAYWGKUi5OdZ4bfwo=
X-Google-Smtp-Source: AGHT+IEQI3hJLbnThp9CAPHM1dVsnp0EXQtZzZQeGFD20i1TI5sU9Ok5/TBHE04my0TJYQEQHKOK7w==
X-Received: by 2002:a5d:5f83:0:b0:3a0:6868:8b13 with SMTP id ffacd0b85a97d-3a074e0e0f8mr3180226f8f.1.1745847894679;
        Mon, 28 Apr 2025 06:44:54 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:785:f3a7:1fbb:6b76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbedf4sm11074512f8f.45.2025.04.28.06.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 06:44:54 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 28 Apr 2025 15:44:53 +0200
Message-Id: <D9IBFEASD5JP.1ISQR5MP8X452@ventanamicro.com>
Subject: Re: [PATCH 8/8] lib: sbi_hart: properly reset Ssstateen
Cc: <opensbi@lists.infradead.org>
To: "Anup Patel" <anup@brainfault.org>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
 <20250415131908.2699782-10-rkrcmar@ventanamicro.com>
 <CAAhSdy1P3apLpKOzW4YSpHGN-PQGokaCMsotOb6LubZoavExNg@mail.gmail.com>
In-Reply-To: <CAAhSdy1P3apLpKOzW4YSpHGN-PQGokaCMsotOb6LubZoavExNg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_064457_002323_F8069AA1 
X-CRM114-Status: UNSURE (   8.72  )
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

MjAyNS0wNC0yOFQxODowOTo0NyswNTozMCwgQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9y
Zz46Cj4gT24gVHVlLCBBcHIgMTUsIDIwMjUgYXQgODoxM+KAr1BNIFJhZGltIEtyxI1tw6HFmSA8
cmtyY21hckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPj4KPj4gc3N0YXRlZW4qIGFuZCBoc3Rh
dGVlbiogQ1NScyBtdXN0IGJlIHplcm9lZCBieSBNLW1vZGUgaWYgdGhlIG1zdGF0ZWVuKgo+PiBy
ZWdpc3RlcnMgYXJlIG1pc3NpbmcsIHRvIGF2b2lkIHNlY3VyaXR5IGlzc3Vlcy4KPj4KPj4gU2ln
bmVkLW9mZi1ieTogUmFkaW0gS3LEjW3DocWZIDxya3JjbWFyQHZlbnRhbmFtaWNyby5jb20+Cj4+
IC0tLQo+PiBkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9zYmlfaGFy
dC5jCj4+IEBAIC0xMTQsMTIgKzExNCwyMiBAQCBzdGF0aWMgdm9pZCBtc3RhdHVzX2luaXQoc3Ry
dWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoKQo+PiAgICAgICAgICAgICAgICAgY3NyX3dyaXRlNjQo
Q1NSX01TVEFURUVOMSwgU01TVEFURUVOX1NUQVRFTik7Cj4+ICAgICAgICAgICAgICAgICBjc3Jf
d3JpdGU2NChDU1JfTVNUQVRFRU4yLCBTTVNUQVRFRU5fU1RBVEVOKTsKPj4gICAgICAgICAgICAg
ICAgIGNzcl93cml0ZTY0KENTUl9NU1RBVEVFTjMsIFNNU1RBVEVFTl9TVEFURU4pOwo+PiArICAg
ICAgIH0KPj4KPj4gLSAgICAgICAgICAgICAgIGlmIChtaXNhX2V4dGVuc2lvbignUycpKQo+PiAr
ICAgICAgIGlmIChzYmlfaGFydF9oYXNfZXh0ZW5zaW9uKHNjcmF0Y2gsIFNCSV9IQVJUX0VYVF9T
TVNUQVRFRU4pIHx8Cj4+ICsgICAgICAgICAgIHNiaV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRj
aCwgU0JJX0hBUlRfRVhUX1NTU1RBVEVFTikpIHsKPgo+IFRoaXMgc2hvdWxkIG9ubHkgY2hlY2sg
U1NTVEFURUVFTi4KClJpZ2h0LCBTbXN0YXRlZW4gaW1wbGllcyBTc3N0YXRlZW4sIHRoYW5rcy4K
Ci0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
