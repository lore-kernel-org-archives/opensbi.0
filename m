Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DFDC369B4
	for <opensbi@archiver.kernel.org>; Tue, 15 Apr 2025 14:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WINHYtyv3NglNvajUzU/Yp5fqUSwFZQ9AjHAL764zcY=; b=BDUsJEDjG2YV2n
	SNBQCqrOXZldKCI1cBDH5TI+2lsVRSx+/wbI0DWW83L/DErfDOQVWx3WNfy8GYPvDs/iS2raInQZ2
	9T9ELfNqsq9L0/7i3dsU7ROMNcCzNxanlf4IKHS8ZU/ARk5GHMXuLZ3In5KQsbOTKY7/U/qDEYGpH
	bYVWpXZu+ZWz+6iivYyayJNWk8tPl3EU54Np0f/NFj+trvfzuoDKMQMvy+1VkMAVOW8qRbfTPeVKV
	aYzcyHrwBjK+BkwTCy6JHMR+qa3LLFEhUdb2WsxcGOFy0x0NYIhR0WB3xNsV78SaTQ99VkAfEEvgf
	oK8v7uXJYucJXhoGIxbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4hVR-000000067xN-0RZR;
	Tue, 15 Apr 2025 14:43:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4gD3-00000005tBJ-3yHp
	for opensbi@bombadil.infradead.org;
	Tue, 15 Apr 2025 13:20:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=PjC21zWh4KlAP9jvKsSKUccRsB9nTUWf3ZSUm6akP3A=; b=l7JHmQQcjpanRsZtD0p/XoVCRL
	6odFB2WKFTXePPGZ2b+caVBNKVaiVU0ASktOYQPRnZQ5giQpbNxQ0Rp5C/kMNzwP6Bsj4ECbFccll
	MM4Sjx1fStHt+jsT1vSwSWUDto0soy9nauFznFSCe9gej6t2iJUDAIU25yeSwJ0KQvaOjEOsFK6BX
	nic7U9uDGIn7YH3Rx5hF1IiXU9/zPPBgyy4dQ4oWcnzqT42j8Fp3WJvFZ+xcTmImNmq140nMOml4D
	9RtNakysAh8MBo34skqxJ/8Cc4WNQ5lqlzQ7VbgqOCwYZ4R0bSyZaA6+NH3ZQTC4CyaE4y+oALaXY
	svK7oadA==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u4gD1-00000009tLp-15NR
	for opensbi@lists.infradead.org;
	Tue, 15 Apr 2025 13:20:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43d4ff56136so7451995e9.3
        for <opensbi@lists.infradead.org>; Tue, 15 Apr 2025 06:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744723211; x=1745328011; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjC21zWh4KlAP9jvKsSKUccRsB9nTUWf3ZSUm6akP3A=;
        b=HLyPeB2HEDGqXNdmx5momqMKYj7FfLnBhIPi5dE0z4WoCNK4LgjYDGp5e6IJa5IboD
         uvKuj+rqqPr752FeO6IejgPwrhkfi6oxh0YhjPtzJ5YQfPyA9JMvmhh0DOOJhnUHtHhf
         fQFSuDHEpDjIxY7qcHvMMHib/XVQSXYLHp+KlLT1WY0DYKL4a3Jj/Qw+CBV3qGBL8czR
         UBjI+NjRavENA2j9zWWWoy4FJa3mbmi0bomBjxz+wZwGsRHP6gCqEWGcsRKLtTdHc2Qt
         xL8Wmus4dsGSgw3sUtrsSgAN4sa4z0PHoeSuLhN47zr40lNQgE405OZPDtmrgSGwj7QL
         UwxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723211; x=1745328011;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjC21zWh4KlAP9jvKsSKUccRsB9nTUWf3ZSUm6akP3A=;
        b=GtXDxm8Kw5oSFcdzCi813Dt7d8dm78yr7z5PYOEPpPFeoAYFinqiqnneQ/HgDwzYqm
         c27GbTl6O/tpWdzKs5MGz5pzdryTmbFDnyQmgStB/YidSIn0caUzmb87iVX0T6YrLhU3
         bcHNUBrIi8v6oq2OkWHJ2AeLik0wMzGD9MZPtu+Z/l6Kmvcpyr9hWv+Vh91Nqtnf1uEt
         mcI9oUKiMVqhhXPgl+l8VY3s7FKmuzOwCgZAqfYP4/HUG3fv5wvl8FW480p3gHOuY2mh
         T9P4LdjVWmDQHuMI2JAu+nF7bERkrIno1HinLnsmMRLyDtGBLPpdcAAqOtD+Tk3VW6yO
         LvXg==
X-Gm-Message-State: AOJu0YyEVHl1r8HJm0r/kGeMoz6EgBVywy8HA5OkVKt2iL9X+PR3hgae
	nt6TWEOuQCmJEmCz3onmwUszurZts5Xv9eX5kukWIKup0wW8nre1A+BEcX55JAKHYd8sES1yV/1
	Pkko=
X-Gm-Gg: ASbGncszPxuQEOvK01dqdzWtnr6phqLtrezZMvwVqY3aio2gse9QGMmuaCTc3bcC9Lj
	WRWArBGeZhB/PbngA9g/ieQuzsGMkad0WOV9kSo19Eair7Iq/ugxX0kbXaBx9XaPPbdOGq2JERt
	HmdfOScF0IWV1SmD2V/BrsAgzsf/cFdFYsZTjwSyDK/g992o9yUleAUiZUF/GuuMhxWLJTCJpwj
	SfwRe3A0ALzg8vYHictnkBOizSvnp8SBmY8zSoGbgGIIzOlGyweD5nEblA8Jf9EXjdnmTdj2dOL
	zG/4u4eFt/A4TkCKvPBAhXCeNc5xFMMAh7V1tsDmLdVbBOrT
X-Google-Smtp-Source: AGHT+IHUJXK8dCJxa6CDi7yyhfw3BanKWB33AzpShWWfp6B3TPHRuV4wDBPgWHBhu+fKeXcWBRl6ew==
X-Received: by 2002:a05:600c:3d05:b0:439:a30f:2e49 with SMTP id 5b1f17b1804b1-43f8ecd4908mr11613665e9.5.1744723211347;
        Tue, 15 Apr 2025 06:20:11 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:c67a:74e3:4d6f:be48])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf4456fdsm13976777f8f.86.2025.04.15.06.20.10
        for <opensbi@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 06:20:11 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Subject: [PATCH 8/8] lib: sbi_hart: properly reset Ssstateen
Date: Tue, 15 Apr 2025 15:19:09 +0200
Message-ID: <20250415131908.2699782-10-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
References: <20250415131908.2699782-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_142015_403283_5BFD2B52 
X-CRM114-Status: UNSURE (   9.87  )
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

c3N0YXRlZW4qIGFuZCBoc3RhdGVlbiogQ1NScyBtdXN0IGJlIHplcm9lZCBieSBNLW1vZGUgaWYg
dGhlIG1zdGF0ZWVuKgpyZWdpc3RlcnMgYXJlIG1pc3NpbmcsIHRvIGF2b2lkIHNlY3VyaXR5IGlz
c3Vlcy4KClNpZ25lZC1vZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWlj
cm8uY29tPgotLS0KIGxpYi9zYmkvc2JpX2hhcnQuYyB8IDE2ICsrKysrKysrKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2xpYi9zYmkvc2JpX2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwppbmRleCBiYzBhNzNk
MTI5OGQuLjBmNjFlOWNkMWM5OCAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCisrKyBi
L2xpYi9zYmkvc2JpX2hhcnQuYwpAQCAtMTE0LDEyICsxMTQsMjIgQEAgc3RhdGljIHZvaWQgbXN0
YXR1c19pbml0KHN0cnVjdCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKIAkJY3NyX3dyaXRlNjQoQ1NS
X01TVEFURUVOMSwgU01TVEFURUVOX1NUQVRFTik7CiAJCWNzcl93cml0ZTY0KENTUl9NU1RBVEVF
TjIsIFNNU1RBVEVFTl9TVEFURU4pOwogCQljc3Jfd3JpdGU2NChDU1JfTVNUQVRFRU4zLCBTTVNU
QVRFRU5fU1RBVEVOKTsKKwl9CiAKLQkJaWYgKG1pc2FfZXh0ZW5zaW9uKCdTJykpCisJaWYgKHNi
aV9oYXJ0X2hhc19leHRlbnNpb24oc2NyYXRjaCwgU0JJX0hBUlRfRVhUX1NNU1RBVEVFTikgfHwK
KwkgICAgc2JpX2hhcnRfaGFzX2V4dGVuc2lvbihzY3JhdGNoLCBTQklfSEFSVF9FWFRfU1NTVEFU
RUVOKSkgeworCQlpZiAobWlzYV9leHRlbnNpb24oJ1MnKSkgewogCQkJY3NyX3dyaXRlKENTUl9T
U1RBVEVFTjAsIDApOwotCi0JCWlmIChtaXNhX2V4dGVuc2lvbignSCcpKQorCQkJY3NyX3dyaXRl
KENTUl9TU1RBVEVFTjEsIDApOworCQkJY3NyX3dyaXRlKENTUl9TU1RBVEVFTjIsIDApOworCQkJ
Y3NyX3dyaXRlKENTUl9TU1RBVEVFTjMsIDApOworCQl9CisJCWlmIChtaXNhX2V4dGVuc2lvbign
SCcpKSB7CiAJCQljc3Jfd3JpdGU2NChDU1JfSFNUQVRFRU4wLCAodWludDY0X3QpMCk7CisJCQlj
c3Jfd3JpdGU2NChDU1JfSFNUQVRFRU4xLCAodWludDY0X3QpMCk7CisJCQljc3Jfd3JpdGU2NChD
U1JfSFNUQVRFRU4yLCAodWludDY0X3QpMCk7CisJCQljc3Jfd3JpdGU2NChDU1JfSFNUQVRFRU4z
LCAodWludDY0X3QpMCk7CisJCX0KIAl9CiAKIAlpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNj
cmF0Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIpIHsKLS0gCjIuNDguMQoKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
