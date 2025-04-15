Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00076C369AB
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B4lyk2C9gBkgkdg6cMFAx4fHLhdKTrSN/MiUHtqkmZg=; b=N50M4BklcmwNMN
	oVn88JXPuE3p84odb4udN62wBvr6v3n9LdGWC+GAbtTe3u4OejmUMIkFlert1uue1AOTYfhEgtEEy
	+6vVmQ5v4jF1IPdmt94RUqBwmrJtkd3QGi65x2P5b5qtHTEY4QII6TuNZnkpFal+XdPr7SLuVV61C
	ZqBRnM76BxPCxeu46NnXrFEWbQciCYBGMqj4H6s3tB1/zIZIodUsJOZEL2yFYZHgZyoIH8iSsvTci
	d4jo7SwBkUaa1psgBwuhP76AzIKU6sl6ZhZaodRfNGRrOxrSdzCVsaQQL2igxIuITnNQ9iwjD3+8I
	5H7iaSxfUQKBiDA3qvjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gMg-00000005upY-19mx;
	Tue, 15 Apr 2025 13:30:14 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCr-00000005t6p-42Nb
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43eeb4e09b5so5678115e9.1
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723203; x=1745328003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=McdmOW/5h2VAQ5UEHNXtvey9Jn/dxpuXlqM3LQTn9PQ=;
        b=cfbCrQqa8l++t7/fI/iR58QLVGaHIa69GQX6MNQZPDLtHYm3YQbflZEqBrA+orlEtl
         YjAdnMKQ7ywDPOSvDf76sEhv3HyeLDAiCY1JWpFO0I6XFQNHePJ2j1a1PTBRA3uTg70N
         WehzWFo6fQZiWG/zWrSxrkvmLnMmt90K47ShMmzRMwEHeGAIpqCPWKkBaFoChWGiUwMC
         TiYFSga5t+/C6fCekVCrmgUd1kQJKB2C8P3S0/tXOntIY2YwGiHIB5leETdLzEmqUCuR
         Oc5xirhqHg2G5tBCroklNoHdBBkS8meTBIKVj3N4IOGB2OB02iWlM9gAZQNcYD3oR8z4
         hfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723203; x=1745328003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=McdmOW/5h2VAQ5UEHNXtvey9Jn/dxpuXlqM3LQTn9PQ=;
        b=LFWA+ITwHSreAZgHf1KB0XzuGYABhIFJwhoTzDGJLc8nq5zuCbqFU67Zi5qnJy190p
         yejgApmObedyGVm5KGifEClOpm+NFOAjChWY9cDSt14JYVTsmMQwrEdFpHho8MjSX8Cm
         aavlSWmfSBq77P5f0DKYD4+Kek2LCyQ5G8Lz9gqYdhdg9iTClHoxHsqFp7hjZgzx6pdD
         Cv3SZ+XIQ7gaxC9K0f8cU6JrBouI5lOtAw1CR82+m/rfM0gHamIP55ZI2U0kNZvM4fzy
         9iA07tCqmtnLKLMd0IXlV332IcCz2XwflvRHJfQGHSMQr4jIeA4+Z8CnyTcLRJ+U8n6S
         pVpw==
X-Gm-Message-State: AOJu0YwulTTn4yWvcTL1ZK/jJSbkxCLprDhcMWdl2gBNi2TFLb3QbjK3
	CPpkl1zO4tfH2+0QXppilVFfsIPEdzX5urMs+8bF2DlvMW1S8kOSAqTmnRDgbyAbRkxC2jvLfv2
	Z/o4=
X-Gm-Gg: ASbGncsRNEHfnPxYIS7WOZT9WI1S89Ye/pUM//Sjyw2qG7P5poNVm+zHJ+fPZzqyW91
	t79qvd9+IoSnOqe8YoSa+lH+l78JAeheoYQhFinMsabOF3SFi776vNIIjYkLcc85bmJLE/fSBMp
	x55QIaETn3cNS4YSgISXm/yqv9Gpt5gPd2sOKXLJgk+LsRtjmgNcPsDHaH0viYjIvEj9X10lAql
	XO4E73voSmLLa2eyMhnsgxoaTAq7bNguB3Z+LdXCPD7xuRKlUU6xJmA+yhi47SrqGpWWzuBl3tw
	kdQPxNWrfrDtcVuqda+/nrhtapKqM1QLOWXW3hKLFlHKzIt2czB+xhmitOs=
X-Google-Smtp-Source: AGHT+IGMjNeOatO0U+d2/UQwaxB3mGFZKoJN41B9Sn0e5MvzCBivBe0qzWb3wmkTWscEFB2IB7UG3A==
X-Received: by 2002:a05:6000:430a:b0:39a:c832:4f3b with SMTP id ffacd0b85a97d-39ea5313d74mr4059981f8f.8.1744723203409;
        Tue, 15 Apr 2025 06:20:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae97751fsm14098123f8f.41.2025.04.15.06.20.02
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:03 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 0/8] Reset more security-related CSRs
Date: Tue, 15 Apr 2025 15:19:01 +0200
Message-ID: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062006_005974_9DD0A844 
X-CRM114-Status: UNSURE (   6.09  )
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

SGVsbG8sCgp0aGVyZSBpcyBhIHBvc3NpYmxlIHNlY3VyaXR5IGhvbGUgaW4gdGhlIGluaXRpYWwg
c3RhdGUgb2YgbWFueSBDU1JzIHRoYXQKY29udHJvbCBpc29sYXRpb24gYmV0d2VlbiBwcml2aWxl
Z2UgbGV2ZWxzLgoKWzEsMi84XSBhcmUgbWFraW5nIHRoZSByZXN0IGVhc2llciB0byBpbXBsZW1l
bnQuClRoZSB2dWxuZXJhYmlsaXRpZXMgZ2V0IGZpeGVkIGluIFszLDQsOC84XS4KWzUvOF0gZml4
ZXMgYSBsb29zZWx5LXJlbGF0ZWQgb3BlbnNiaSBidWcuCgpSYWRpbSBLcsSNbcOhxZkgKDgpOgog
IGxpYjogc2JpOiBhZGQgNjQgYml0IGNzciBtYWNyb3MKICBsaWI6IHNiaTogdXNlIDY0IGJpdCBj
c3IgbWFjcm9zCiAgbGliOiBzYmlfaGFydDogcmVzZXQgaHN0YXR1cwogIGxpYjogc2JpX2hhcnQ6
IHJlc2V0IHNzdGF0ZWVuIGFuZCBoc3RhdGVlbgogIGxpYjogc2JpX2hhcnQ6IGZpeCBzc3RhdGVl
biBlbXVsYXRpb24KICBsaWI6IHNiaV9oYXJ0OiByZXNldCBtc3RhdGVlbjAKICBsaWI6IHNiaV9o
YXJ0OiBhZGQgU3NzdGF0ZWVuIGV4dGVuc2lvbgogIGxpYjogc2JpX2hhcnQ6IHByb3Blcmx5IHJl
c2V0IFNzc3RhdGVlbgoKIGluY2x1ZGUvc2JpL3Jpc2N2X2FzbS5oIHwgMjEgKysrKysrKysrKysr
KysrKysrKwogaW5jbHVkZS9zYmkvc2JpX2hhcnQuaCAgfCAgNCArKystCiBsaWIvc2JpL3NiaV9o
YXJ0LmMgICAgICB8IDQ2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
CiBsaWIvc2JpL3NiaV90aW1lci5jICAgICB8ICA3ICstLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwg
NTUgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCgotLSAKMi40OC4xCgoKLS0gCm9wZW5z
YmkgbWFpbGluZyBsaXN0Cm9wZW5zYmlAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5zYmkK
