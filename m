Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CFEC369DC
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=olUD9uI7HXWtdvVO6TGVQ4EjqVZxcHYg1V2YP/3DwZQ=; b=W/l2zA48mUtJKw
	4+B72qug5qZV0np9VK0nm3WZJk+HQZ1vWnTqL/wO9Hih41OFNSMhR2fFXOtnX9sFg/dWU3sg5mz6K
	dtflNZHs5UEeLiDSQ6LbyYH4rB9nGbdHVnaDvHES7Ymuw9N0Mib7KIbldEYXNyuOMgCVE24nl/fEB
	Qr/LDH3TH6cYLW2I1olnBWqFs8FFZQuCJOsNplldfYJ5ClTNCV1AN4Sg9ZSmp+ZnghaZWNhzM9/SU
	83pgQo7GraSI5H0UanMWaBxdvCvEFJkA/Dd5Sbx4orXOrcAuYHDN+zbXSQGKQr7DedXb2bLdh5QJ8
	yCjEq8ewrO6vvUBx3L9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9o68-0000000AIbs-05mS;
	Tue, 29 Apr 2025 16:46:20 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyE-00000009xXK-19Uo
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:03 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ce4e47a85so6052255e9.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937000; x=1746541800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tejbvpay2vnQkr4vEWtT+ZDvmRp6gIEFzynEPP5wrio=;
        b=jSBnGDNmmpP9nBiRctP8/qXm1aD8OoFW6csqDx0ditsfNKrhd0esVhysvmmwfj+qJv
         0R+uF9GAElzEWoPNiiOZl6LbY8ioqRZcyp1TYQ47JisQgGWIqR5btcPt8PHETTOy5vxz
         1XN2WVPbV7ILnTbiEfBREy/oNb2xGkysHjXpxjujfXmn6IKbViaQCnND9R4idZDw3PQ1
         RGFv+GxWtSBrlpG4qIkC7DN6aUNMxQ5VIicfrA/bWvujCvAuJZukzZZCXiKdaUUtYlqL
         dNVeXvEE5IvzdNMgNN5UOV29lHkkLHPFuZW4gJU1CHjy7xCetx1fPwnCVpTpm9nA4np8
         ZZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937000; x=1746541800;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tejbvpay2vnQkr4vEWtT+ZDvmRp6gIEFzynEPP5wrio=;
        b=pb90XfKvJXPQNloqDw9M4DhPElDZ4rPyS52TCdpzsbmDQVZWPyEc3TrCH24LKFJf6F
         Zt1rXJyACcN8KScyA0IXIUWnVym1sSz6GnoT+JM2Ywu8YAFEQb6BwUNbRg6wtyeLXKfD
         BdhtB0irrXx/Iopt8+URJk1biQx96Z7TH6MLp5f8GtYsgitclh2nqq7dmQdSW1fmIMU7
         hMhSUdqE+J/LTmsg2TKhwz9/+Bes1icBxQ6Vi5hkwXSqycumoJNQGk1P2Nkb7XqGDlMD
         mcH+XCRhI/yCU9+2XV7F4tghRzGYAQdsNgI2dQvEDS1DXYaJw+grvtMeWhbLeYF2IAsK
         1EoQ==
X-Gm-Message-State: AOJu0YxWl82HfNI9yDD1ab1wSDlndwi/a3SMEH/15RgAsiqPGhh8Hdtz
	tcuT+4x2YoVD1xlko9W0iUthZS/kMdOL/aBGpKReMn3oyGGG++IKBWhwxuLGHr8KXwqafZaS90Y
	7wo8=
X-Gm-Gg: ASbGncsk08ZacPCuGa9f3621sHJo+kusjkBtWTkeqfx13UB5vzSZNGWgrUdF1Ij83P2
	8VkjXswWEdVLFeQhPcPwf4yy+W3x8A69Kb61jgw1/yAbKll1qulu3/NE+iphD0OelWjliWY+lFf
	oBJ+JOG4gfWubz2mnfbSjRhT5NjrkEf0qVdl/Zw0CchBzIva1LCCeJb9/YUYPm+8CHTb6t3mmeY
	qqA7H5FNXNXkLvr8ROCaXlh3+4c8xKtr1fXTucQ0p1fjFIIC7NjPkIZPIsA0s4gw+Nf1ZKHJdYu
	ZySbrDOK/9a7EuXKYvxuvhgqV3PZvl7H3X8eu3msHDju4HJp
X-Google-Smtp-Source: AGHT+IFEKsBXB4TS2ibz+KTAvzmiXjueCrwpwJxtFEspQRycksHbRwq1GtfKifx9BogB+fCdNUK/gw==
X-Received: by 2002:a05:600c:4fd0:b0:43b:c962:ad29 with SMTP id 5b1f17b1804b1-441ac84b54emr12198965e9.1.1745936999851;
        Tue, 29 Apr 2025 07:29:59 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5c68esm13980773f8f.82.2025.04.29.07.29.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:29:59 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 0/8] Reset more security-related CSRs
Date: Tue, 29 Apr 2025 16:25:42 +0200
Message-ID: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073002_319352_8FBE0D9C 
X-CRM114-Status: UNSURE (   5.87  )
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

SGVsbG8sCgphbGwgcGF0Y2hlcyBhcmUgbWFya2VkIGFzIHJldmlld2VkIGJ5IEFudXAgYWZ0ZXIg
aW1wbGVtZW50aW5nIGhpcwpzdWdnZXN0aW9ucy4KCnYyOiBbMS84XSBSZW1vdmUgcmVkdW5kYW50
IG5ld2xpbmUuIFtBbnVwXQogICAgWzcvOF0gSW1wcm92ZSBjb21tZW50cy4gW0FudXBdCiAgICBb
OC84XSBSZW1vdmUgcG9pbnRsZXNzIFNtc3RhdGVlbiBjaGVjay4gW0FudXBdCiAgICBbMS04Lzhd
IEFkZCBSZXZpZXdlZC1ieSBbQW51cF0KdjE6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL29wZW5z
YmkvMjAyNTA0MTUxMzE5MDguMjY5OTc4Mi0yLXJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbS8KClJh
ZGltIEtyxI1tw6HFmSAoOCk6CiAgbGliOiBzYmk6IGFkZCA2NCBiaXQgY3NyIG1hY3JvcwogIGxp
Yjogc2JpOiB1c2UgNjQgYml0IGNzciBtYWNyb3MKICBsaWI6IHNiaV9oYXJ0OiByZXNldCBoc3Rh
dHVzCiAgbGliOiBzYmlfaGFydDogcmVzZXQgc3N0YXRlZW4gYW5kIGhzdGF0ZWVuCiAgbGliOiBz
YmlfaGFydDogZml4IHNzdGF0ZWVuIGVtdWxhdGlvbgogIGxpYjogc2JpX2hhcnQ6IHJlc2V0IG1z
dGF0ZWVuMAogIGxpYjogc2JpX2hhcnQ6IGFkZCBTc3N0YXRlZW4gZXh0ZW5zaW9uCiAgbGliOiBz
YmlfaGFydDogcHJvcGVybHkgcmVzZXQgU3NzdGF0ZWVuCgogaW5jbHVkZS9zYmkvcmlzY3ZfYXNt
LmggfCAyMCArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvc2JpL3NiaV9oYXJ0LmggIHwgIDQg
KysrLQogbGliL3NiaS9zYmlfaGFydC5jICAgICAgfCA0NSArKysrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLQogbGliL3NiaS9zYmlfdGltZXIuYyAgICAgfCAgNyArLS0tLS0t
CiA0IGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDIzIGRlbGV0aW9ucygtKQoKLS0g
CjIuNDguMQoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
