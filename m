Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE7BC369AB
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Binlp5IRQy4VHJm1AoQ02C/OiwgEFG84VHSvnD65UqU=; b=YlCmy562IWzKiP
	drH882QZebce38tsQCmXoaMpuiuzz1LpzQigNDXFOnF3heRgcyE9nmQ5nh+88qn6Xw4pgmi156HA3
	09IexXYyGCWdPLlbk2RSipq7GvaDOHjJBwgOQsEZRTbQObP2ZFHHxy4vXQfRPz6ieluz1Xqqs90mH
	i06PBtEgNxJFpeYWiKwsIcxKQ16ml858dpFDvGPsMUYwrlZAn3US4yinEkgodvO9MZjB9NvWs+0d5
	vCAg7tQ1tZtNlASJ7DBvgP1W8ar+XwE9P9iY3QmyDdNoAkBIC9/eO2+3VOUPJmUI6qq8FM8NgJOhl
	JZI1pFNDxW3/rCPoMS9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVO-000000067uG-0AD5;
	Tue, 15 Apr 2025 14:43:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gCv-00000005t8P-20H2
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:10 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so7114785e9.2
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723208; x=1745328008; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=13YeK1yX+Yvx6GD6kRf35E5z4I7PJ4Yxllh5Ag1eYq0=;
        b=cPwWIjqeWe2lFylNhheCIbvMjHCfjvjMNBbpa/1yn3wvLwPfyimBL4Bm3Z0i1UzXe7
         73GnH/AydNXWtE0wZZDRRpSpx+Zp2urxJc95wCEHdEk6UbWl/tFakqGVHB7/C+fdO8xl
         qHyiCXldyYr3hJwQwDcaPO3Q4elFFvO4zsYy2uYiIV3PuSVqNEEVLzOYe0b6zq53kxYx
         332k3EUqkEXSFq7/k4nlAhMvnxBYVZgrp8oXJMeHQ3/5dlp6BS0nY2r09nNKYnd3qEhi
         AJeRdYJi4ODVPZNBBcQhMLQSqFaljKay47Dh4hsRjxYAU1s3pxpO2lAZwvGV/xSNN9ho
         O9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723208; x=1745328008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=13YeK1yX+Yvx6GD6kRf35E5z4I7PJ4Yxllh5Ag1eYq0=;
        b=FtturQ2c7eb9FPCCJ9Mm1/f2Go2Proom9NilwZzeZH2ec+Uo/Pv8zMztJxFaypyuCu
         TvXW7/j36V/exenUhNsEMbf0Kf/XcMfB63JiOI6hKFh3wUHBJecYXCgWVE1KSCT1mP4d
         YsRVXhnxDts0f+phY7yfV6f1ykLSFUI2rWNpoT8qZ+vYN27eN+gXlUWFBqH7vt234CrX
         0j/i7HL4m9bi5V4OS6uC+VrI9E/U5bdr99A7LWy4BV7HENGs8N54aoR+hClGtPHUzz+A
         gCTAx5C0e1kMOoe0RFyFBtg/UnH1fq3xZPHcX2f060Y/5126HXpr1hs6gsofNzYYTrYb
         MWew==
X-Gm-Message-State: AOJu0Yw94y7+eV58QT0w0v+iC2sMTvVhHGQq4JmS1Wh/9ybsTJoUGtOM
	+/Wg5/hPypieCJBjx+mDfgtyDhW9EatqJQpyXCQKC8JAG8Ko8tUFENJ9T2g+qFxky1dEahFjOPB
	/eB8=
X-Gm-Gg: ASbGncsXCjvueXlwaS4yroWTavbSSXIMOndywHaPGCk6Xg8RTb/DKOUygZY/qOqT33u
	cNqLUhX1EwtBc3vfGfTbqXThn00U3+l/f4hPFZmPV6BOreX8jZCkLcVjeuwQVS4TjvYgKSpRxO/
	NKuz71vTWHkKRt4Rle5k0KF4sF7+C4nzF9vBRoZ67/YpQFVE+BrnW+qR8LWn7Rk6v/eh/QjKHOF
	cTBz2IIyCTA29Fu6rNq6s76PWkC+AU7N5Zjlq5dg+ctkIjPCKqPv/tFCuBW2p/x2kaR8WqxB0Yo
	xVXQOC08f2pdCUss7r2d3RnrWyhpBsOnOP3Y+RC6aDiExWqp
X-Google-Smtp-Source: AGHT+IFgsGUThwu0FC9O7hY5fcB0y8OAGAr2InArLI1WYEUtP5S/1QEdLn2x6XjttXwSmT904FIihw==
X-Received: by 2002:a05:600c:1e1c:b0:439:a1c7:7b3a with SMTP id 5b1f17b1804b1-43f8ec3e8b1mr12197335e9.1.1744723207436;
        Tue, 15 Apr 2025 06:20:07 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c8fb4sm210985505e9.35.2025.04.15.06.20.07
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:07 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 4/8] lib: sbi_hart: reset sstateen and hstateen
Date: Tue, 15 Apr 2025 15:19:05 +0200
Message-ID: <20250415131908.2699782-6-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_062009_514882_0C225B2A 
X-CRM114-Status: UNSURE (   8.56  )
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

Tm90IHJlc2V0dGluZyBzc3RhdGVlbiBpcyBhIHBvdGVudGlhbCBzZWN1cml0eSBob2xlLCBiZWNh
dXNlIFUgbWlnaHQgYmUKYWJsZSB0byBhY2Nlc3Mgc3RhdGUgdGhhdCBTIGRvZXMgbm90IHByb3Bl
cmx5IGNvbnRleHQtc3dpdGNoLgpTaW1pbGFyIGZvciBoc3RhdGVlbiB3aXRoIFZTIGFuZCBIUy4K
ClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29t
PgotLS0KIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfaGFydC5jIGIvbGliL3NiaS9z
YmlfaGFydC5jCmluZGV4IGI2NmI4OWY2YmM1MS4uYzI4MGMwYjNlODVlIDEwMDY0NAotLS0gYS9s
aWIvc2JpL3NiaV9oYXJ0LmMKKysrIGIvbGliL3NiaS9zYmlfaGFydC5jCkBAIC0xMTEsNiArMTEx
LDEyIEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qgc2JpX3NjcmF0Y2ggKnNjcmF0
Y2gpCiAJCQltc3RhdGVlbl92YWwgJj0gflNNU1RBVEVFTjBfQ1RSOwogCiAJCWNzcl93cml0ZTY0
KENTUl9NU1RBVEVFTjAsIG1zdGF0ZWVuX3ZhbCk7CisKKwkJaWYgKG1pc2FfZXh0ZW5zaW9uKCdT
JykpCisJCQljc3Jfd3JpdGUoQ1NSX1NTVEFURUVOMCwgMCk7CisKKwkJaWYgKG1pc2FfZXh0ZW5z
aW9uKCdIJykpCisJCQljc3Jfd3JpdGU2NChDU1JfSFNUQVRFRU4wLCAodWludDY0X3QpMCk7CiAJ
fQogCiAJaWYgKHNiaV9oYXJ0X3ByaXZfdmVyc2lvbihzY3JhdGNoKSA+PSBTQklfSEFSVF9QUklW
X1ZFUl8xXzEyKSB7Ci0tIAoyLjQ4LjEKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNi
aUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vb3BlbnNiaQo=
