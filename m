Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B05C369DC
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 17:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hevSHaDARoentrR2WRdyMUBzOLs+RofzLsjUdtOvDH4=; b=Op7BElnpEFLVyQ
	gl0v8qh7yStcYKHuXp38I1RyWYS5gYO+B82YqRiYAgaHn2UBHDsirjq1UL4ZxpU5Cu1xKh4BQ/xUK
	mLk4I3sWR7DG2D+vDRvzwRAWQMYGsRnq6HxgTPc8v5c93yq/NGEgTpbVgBkcBpWcuyjKJDI9TMqYZ
	51NiCqzMOczDZTcCOxzR4HW3OyqbufuV0JArBvvO1H0DmF+5fiB+L+y8iNF7eRpWuP9mNrjRbHL4B
	XRjfIzKNtpIjF2m0DcLc4PW1OD+BZstYJ7IyzwN6RNh9lAphITLN3f1uT+gVJ9CWd+7M3WCzpMJOX
	7NXW0r+pqkOnizURnpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oKa-0000000ALR4-1VdY;
	Tue, 29 Apr 2025 17:01:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyM-00000009xaF-0v9v
	for opensbi@bombadil.infradead.org;
	Tue, 29 Apr 2025 14:30:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1Mx8iNAKNeTZirNm6Z+P+pMrsZNir59YMJz8cm6eMXY=; b=jV9+ivgxUGrAy2ZCmNiOkbZNKK
	T+RHYmYlz6JoJvWMGRyQ7uG3KBBjt6JDRFmcTw3PfRwHNWNxFyV/9ud6YjJ9S7VzMi90wj1Lp4yew
	VwSZKJFepmcXKaqFjZuTG6nph79PPa1NXjr74aYReCyvUnae074in4j8lTrtETrOUCJL7U4Bb2u/N
	lYc2fY5SQZFhWlXnHOFWem3YtKWEq/GVjjzzGtY1CNEYin7Sm0ftkw8W0yxpp3sG78qAgH3FtO9WK
	Ieak3T2LCO9r500mXgeXQ7QtIQam3qN9lK5XbuJTrQje3Sstz7abi3spwzPG1j8yhK1NO4TKpFA2B
	1csmT9Zg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9lyJ-0000000DOA2-1Xdq
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:09 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-43cf825f46bso3755225e9.3
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937005; x=1746541805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Mx8iNAKNeTZirNm6Z+P+pMrsZNir59YMJz8cm6eMXY=;
        b=Bf2EkG2uoD6EeaZ3RcumxT2d2xgmp69UhK2fuLcy5Ih3erXg+qKrWR9MhVY/2bewYq
         26s1quxRQUolpgyPvchUK5tjPGSjbMWCHtecFIEKKu/13Wn/y6lzLN3nzYUB+RGRTKj9
         ozPRwIc+nrknzhVtktBVfZ+eiom3CRDIPlk+x3cgXEOX7V9dlz741yGFiLpkNZsQA94c
         GWOLIBEroIo/aeQ7WS9GQSWRYfD+KA/Y5kN/EktK+lnoe8HHkfWcFXrHOaVYHVa4Ja8g
         09UAco1eX9OD85M6DJP7x58tmkTG84u086utWIkKM7j1+ODdJd2lyfHn8wDw9A5aqq/f
         1AqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937005; x=1746541805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Mx8iNAKNeTZirNm6Z+P+pMrsZNir59YMJz8cm6eMXY=;
        b=d2u2i/tNgqg8cMJ6isGLBBIc8MW/8QQ/1hH6V87o6QE8mF+Bc4EVrQADCnI6jG6HD5
         VQgQVMBKEOnM9PZwbENSsftgjSjVprn2JIYW8RvLMp22+UGI3yakzNQ5LBpNjb1U+ut3
         O9AVsYqE6c3D7QH/iYCcfrH7O8K0CBcNhQ21KbYlfqbRQKPHQbQn5mW3mJ/kNIlOjHMY
         zEHTRlz6efoTeH20eznDbTaRvF0TSSekRimdNdi0AtDZ7DJjTKi1iZ3EWf7vTc/RP6PM
         TT3jZeGM1j3X4Fhkx7kg8nbu516uv4Uc/P5N586pK6zMn/KoBmTU0PouKc6WNKCHKFhV
         ZWvA==
X-Gm-Message-State: AOJu0YwHuUTPsB9udM63EZ3NTDc9Fv9wxfrIPcpeTmA+QxJwIxdYtYom
	jQa8+P3/o14s28Sc2ounW1IJ9EE7RILYYDJwHenGgO1vT2xlH9QxHRX/GOV3e5PEv8mWT27Lkvr
	zkL4=
X-Gm-Gg: ASbGncsQuJTDhbNBEgx3szpb35Lap7D1Os+P7v/mjdz9JDwL69/8tZ8Mpq6KipWc3F2
	FQj7OhKOJO0+XNbLKugpu5xDgzBF/OPJV6/I09yL3f5yp690V830JiQ+RbQViXwZt+3Zgm7CQ6V
	O/sWMRnQRiZxVc1TKUjWZTVfx4Fueq/CI4CGWN+qdOmzKYzhNF9PEpzuj87ayAZ74Z/EY95NlUt
	VCW2zkcTfLOavcCufhZ2PyzcUKCQYWuCl28XKs47N0dLoAExdUx7utrC23mJk8TO94V9Ssb3HCv
	ntcoh2FpeANmiMmAL+3Hj33MrtGg+rHfpEo+JuDkTkxwPlA8
X-Google-Smtp-Source: AGHT+IH3/k9bMciBba5YXJhI0heicJDd6UgmWKY7etCi8ltOzACGavA7pdU4IdEcB6S0rRWbkU+b0w==
X-Received: by 2002:a05:600c:3d0c:b0:43b:ca39:a9b8 with SMTP id 5b1f17b1804b1-441ac84c132mr12099445e9.2.1745937004765;
        Tue, 29 Apr 2025 07:30:04 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a538f4aasm156913375e9.38.2025.04.29.07.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:04 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 5/8] lib: sbi_hart: fix sstateen emulation
Date: Tue, 29 Apr 2025 16:25:47 +0200
Message-ID: <20250429142549.3673976-7-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_153007_564739_D3DFC00B 
X-CRM114-Status: UNSURE (   8.41  )
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

VGhlIFNzdGF0ZWVuIGV4dGVuc2lvbiBkZWZpbmVzIDQgc3N0YXRlZW4gcmVnaXN0ZXJzLCBidXQg
U0JJIGN1cnJlbnRseQpjb25maWd1cmVzIHRoZSBleGVjdXRpb24gZW52aXJvbm1lbnQgdG8gdGhy
b3cgaWxsZWdhbCBpbnN0cnVjdGlvbgpleGNlcHRpb24gd2hlbiBhY2Nlc3Npbmcgc3N0YXRlZW4x
LTMuCgpTQkkgc2hvdWxkIGltcGxlbWVudCBhbGwgc3N0YXRlZW4gcmVnaXN0ZXJzLCBzbyBkZWxl
Z2F0ZSB0aGUKaW1wbGVtZW50YXRpb24gdG8gaGFyZHdhcmUgYnkgc2V0dGluZyB0aGUgU0UgYml0
LgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgotLS0KdjI6
IEFkZCBSZXZpZXdlZC1ieSBbQW51cF0KLS0tCiBsaWIvc2JpL3NiaV9oYXJ0LmMgfCAzICsrKwog
MSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2Jp
X2hhcnQuYyBiL2xpYi9zYmkvc2JpX2hhcnQuYwppbmRleCBiZGY2NmVmNzY3ZWQuLmZjMzdiMjQ5
Yjg5MiAxMDA2NDQKLS0tIGEvbGliL3NiaS9zYmlfaGFydC5jCisrKyBiL2xpYi9zYmkvc2JpX2hh
cnQuYwpAQCAtMTExLDYgKzExMSw5IEBAIHN0YXRpYyB2b2lkIG1zdGF0dXNfaW5pdChzdHJ1Y3Qg
c2JpX3NjcmF0Y2ggKnNjcmF0Y2gpCiAJCQltc3RhdGVlbl92YWwgJj0gflNNU1RBVEVFTjBfQ1RS
OwogCiAJCWNzcl93cml0ZTY0KENTUl9NU1RBVEVFTjAsIG1zdGF0ZWVuX3ZhbCk7CisJCWNzcl93
cml0ZTY0KENTUl9NU1RBVEVFTjEsIFNNU1RBVEVFTl9TVEFURU4pOworCQljc3Jfd3JpdGU2NChD
U1JfTVNUQVRFRU4yLCBTTVNUQVRFRU5fU1RBVEVOKTsKKwkJY3NyX3dyaXRlNjQoQ1NSX01TVEFU
RUVOMywgU01TVEFURUVOX1NUQVRFTik7CiAKIAkJaWYgKG1pc2FfZXh0ZW5zaW9uKCdTJykpCiAJ
CQljc3Jfd3JpdGUoQ1NSX1NTVEFURUVOMCwgMCk7Ci0tIAoyLjQ4LjEKCgotLSAKb3BlbnNiaSBt
YWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNiaQo=
