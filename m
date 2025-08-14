Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E789ECA0EE4
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 15:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sn1BOxDIPv30lSUNWckVgMmHIwr2/pEfLxC4u0TOcYY=; b=Iav9E6AyyxaG8e
	tpiYGcCvmi6+DEUbiFnkvkfkl4VMnkOwCMshhcXOJyMzkxPrMqbN8+ey9YAO5w5CuprgGYA8RkIlh
	GZEdftBCrNShTFe7aABcWA+4/qL1KxOQdDjiQr1Nzga91Ke3k0Tt4OSI0fQ+oyFzdNwid7nTpSghu
	ZpscDqIHtin5zkw/6VLJ/bMZIECyupDc3RrhbvUEIDxRfR0N6Kwp27GP9KW6IcqLWqOXCt/sW3x5G
	S/60Pz7vHm/bCbZsqy8bkRxHBRFsqDkxMGOK0vSozg8lYnnVaF85MTWVDBr/BwY7qin8M9QVezuts
	Soj9E00hzxAZz+blNLdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma11-0000000HTmr-18WB;
	Thu, 14 Aug 2025 15:37:19 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVm7-0000000Gi4k-33qE
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:40 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-24456f3f669so8912505ad.1
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169539; x=1755774339; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1P+WhGkozjN+uRpvhjzTmyP/23EnYYCc7/1jJtphSB0=;
        b=FMpDcufoIWFs3+w0DDR+Q4EkRj8pT6r8vQ18uOnQ/dT1PZbe62v4n2GscYXSLwQDdm
         z8hFVqYmoVU/EwTYUaYRW9Z7GVxlkjrkmzyLnGuYlpfEsfN3aR3Ir5nLVsSEp2QtzW0B
         u5358FfdS6WvSkSv7L1pfRcbEzVY+cuEPl8GZC7jScqLBvYh4xfKXnwnuTl6ncc8HOI1
         9X8P/SYQm7ID3SxaLWVoIfw4v53RYDg3jhdU1iaGvWufwfo3MBLd4cYkqzGSt6LwffrI
         VcT/+MEKGUVQV450eHJbsVgtI73z8uVWTKZiU3t5VqZ3F5P158ph/7OTVyQKvrAOMAAk
         W4yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169539; x=1755774339;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P+WhGkozjN+uRpvhjzTmyP/23EnYYCc7/1jJtphSB0=;
        b=ogf7UYcomM9bRpUtaUnWiI/CRoE0B0tpyrvdHtCBc1BYsKs6oyh3GaCIcQ7tWmsHNk
         pPtGs05KKgv/0KPBchHfJ0IyR5++xUKZs7xHimIxoXkWyZ/+qu4LNCbhA+hkYdT/UZpE
         7Ql7ZZFCKOeDnnNkBaen5n0SfAfCHCZbFGjxUmATx2viPxRn6kWQGwgXnpKLu5Mv1nmb
         Y/0NrOehNDl+MWOLFga51lWv4dQS5UMNK/3WRxFFLFr/iUVX64UTdFGJr/Q4vEZCzdSM
         hezjFednf81OnF8kRWbDuNybXJtIt4JzOZDxWl5Ap4clCBKWvwsWzk8MOd4vCWrDgMdt
         /m4w==
X-Gm-Message-State: AOJu0YzktrMtxKgkbNWAbxs6G9hx80BAJSHZTwQ3VMGLKaH+fxKPy8KQ
	9/qECWhYqcomwjMsJI6bE+c61iuVZExRKCNxzmzaTRbS4gnWG2gx4txfTvbtj9a7QWxOeqSaXjX
	1Ud7DS5QZoar11ENrMsKao7bzlL5mTzPGh2UjjtovOCwVzUpyb6QG3jD0pHHuaZzJkmbmCEQLOY
	O7K2fcmrYWb4brihw20o7452SNLdB6J+/BMVZHYlaMegEW0u//0rEocw==
X-Gm-Gg: ASbGnctZQVCovKodTEaZpovuyJyOAHco+HHQJbEIexI0E2NxG7l6Upf79VNvcYk72WK
	y/MTXcOPUucyIcSP+YM3PmXe1XZs/xhfmyilFwPI8xA75XBGAWlOowfeSdzcO6h37WTQhMD5DeI
	6FNWpriBS5iM1i4WJZ8cHatQIyCyZPBrdXDO6yVl3L+5UbyoVuC5ehr+kS78Q6o9VoDaYnXwbcj
	K2L/q1V2vR5h9miNvtU0vllYNQ/3EwwhfyEmJqhKWpuv7GQBAEMPJps6Wysz/kS8Vqo5zX4Dx1X
	g5VREesUYkd18SSH95RTK/5mUwqoD4l/2eSi2M9sxDqVgDwfDyTTDY/FMBRjbzYwxMsAJdc0GuV
	ExS1OeC/0RXFUah+k+hZP2tZ7o1Ok+V/t/gu8+Ci/ivbtbLw=
X-Google-Smtp-Source: AGHT+IHotufFGXK68rgpy2moHtg0ULYu1yv4O4DkHfFakflbrP0iL3D+VufUuGNJk80KjUB1TMOd0A==
X-Received: by 2002:a17:902:d490:b0:234:9dce:74e3 with SMTP id d9443c01a7336-2445948668fmr29692275ad.2.1755169538533;
        Thu, 14 Aug 2025 04:05:38 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:38 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 7/8] lib: sbi_domain: ensure consistent firmware PMP entries
Date: Thu, 14 Aug 2025 19:05:21 +0800
Message-ID: <20250814110522.18809-8-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040539_765486_F70E3C26 
X-CRM114-Status: GOOD (  10.28  )
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

Q3VycmVudGx5LCBkdXJpbmcgYSBkb21haW4gY29udGV4dCBzd2l0Y2gsIGFsbCBQTVAgZW50cmll
cyDigJQgaW5jbHVkaW5nCnRob3NlIGdyYW50aW5nIFJXL1JYIHBlcm1pc3Npb25zIHRvIGZpcm13
YXJlIGRhdGEgYW5kIGNvZGUgYXJlIGNsZWFyZWQKd2hpY2ggd2lsbCBsZWFkIHRvIGFjY2VzcyBm
YXVsdHMuCgpUbyBjb25maWd1cmUgZmlybXdhcmUgUE1QIGVudHJpZXMgZGV0ZXJtaW5pc3RpY2Fs
bHkgYWNyb3NzIHN3aXRjaGVzLApzb3J0IHJlZ2lvbnMgc28gdGhhdCBmaXJtd2FyZSByZWdpb25z
IGNvbWUgYmVmb3JlIG90aGVycy4KClNpZ25lZC1vZmYtYnk6IFl1LUNoaWVuIFBldGVyIExpbiA8
cGV0ZXIubGluQHNpZml2ZS5jb20+Ci0tLQogaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oIHwgIDMg
KysrCiBsaWIvc2JpL3NiaV9kb21haW4uYyAgICAgfCAxNCArKysrKysrKysrKysrKwogMiBmaWxl
cyBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9zYmkvc2Jp
X2RvbWFpbi5oIGIvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCmluZGV4IGQ3MTM1NGM3Li4zMTIz
NzQwMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9zYmkvc2JpX2RvbWFpbi5oCisrKyBiL2luY2x1ZGUv
c2JpL3NiaV9kb21haW4uaApAQCAtMTIxLDYgKzEyMSw5IEBAIHN0cnVjdCBzYmlfZG9tYWluX21l
bXJlZ2lvbiB7CiAJCSgoX19mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX1NVX0FDQ0VTU19N
QVNLKSAgJiYJXAogCQkgIShfX2ZsYWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fTV9BQ0NFU1Nf
TUFTSykpCiAKKyNkZWZpbmUgU0JJX0RPTUFJTl9NRU1SRUdJT05fSVNfRklSTVdBUkUoX19mbGFn
cykJCQlcCisJCSgoX19mbGFncyAmIFNCSV9ET01BSU5fTUVNUkVHSU9OX0ZXKSA/IHRydWUgOiBm
YWxzZSkJXAorCiAvKiogQml0IHRvIGNvbnRyb2wgaWYgcGVybWlzc2lvbnMgYXJlIGVuZm9yY2Vk
IG9uIGFsbCBtb2RlcyAqLwogI2RlZmluZSBTQklfRE9NQUlOX01FTVJFR0lPTl9FTkZfUEVSTUlT
U0lPTlMJKDFVTCA8PCA2KQogCmRpZmYgLS1naXQgYS9saWIvc2JpL3NiaV9kb21haW4uYyBiL2xp
Yi9zYmkvc2JpX2RvbWFpbi5jCmluZGV4IGNjZmNjN2YwLi45ZTI4NGY0OSAxMDA2NDQKLS0tIGEv
bGliL3NiaS9zYmlfZG9tYWluLmMKKysrIGIvbGliL3NiaS9zYmlfZG9tYWluLmMKQEAgLTI5NSw2
ICsyOTUsMjAgQEAgc3RhdGljIGJvb2wgaXNfcmVnaW9uX2NvbXBhdGlibGUoY29uc3Qgc3RydWN0
IHNiaV9kb21haW5fbWVtcmVnaW9uICpyZWdBLAogc3RhdGljIGJvb2wgaXNfcmVnaW9uX2JlZm9y
ZShjb25zdCBzdHJ1Y3Qgc2JpX2RvbWFpbl9tZW1yZWdpb24gKnJlZ0EsCiAJCQkgICAgIGNvbnN0
IHN0cnVjdCBzYmlfZG9tYWluX21lbXJlZ2lvbiAqcmVnQikKIHsKKwkvKgorCSAqIEZpcm13YXJl
IHJlZ2lvbnMgYXJlIHBsYWNlZCBiZWZvcmUgbm9u4oCRZmlybXdhcmUKKwkgKiByZWdpb25zLiBU
aGlzIGVuc3VyZXMgZmlybXdhcmUgY29kZS9kYXRhIHJlbWFpbgorCSAqIGFjY2Vzc2libGUgd2hl
biBTbWVQTVAgaXMgZW5hYmxlZC4gT3B0aW9uYWwgZm9yCisJICogcmVndWxhciBQTVAsIGJ1dCBz
YWZlIHRvIGZvbGxvdyBjb25zaXN0ZW50bHkuCisJICovCisJaWYgKFNCSV9ET01BSU5fTUVNUkVH
SU9OX0lTX0ZJUk1XQVJFKHJlZ0EtPmZsYWdzKSAmJgorCSAgICFTQklfRE9NQUlOX01FTVJFR0lP
Tl9JU19GSVJNV0FSRShyZWdCLT5mbGFncykpCisJCXJldHVybiB0cnVlOworCWlmICghU0JJX0RP
TUFJTl9NRU1SRUdJT05fSVNfRklSTVdBUkUocmVnQS0+ZmxhZ3MpICYmCisJICAgIFNCSV9ET01B
SU5fTUVNUkVHSU9OX0lTX0ZJUk1XQVJFKHJlZ0ItPmZsYWdzKSkKKwkJcmV0dXJuIGZhbHNlOwor
CisKIAlpZiAocmVnQS0+b3JkZXIgPCByZWdCLT5vcmRlcikKIAkJcmV0dXJuIHRydWU7CiAKLS0g
CjIuMzkuMwoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2Jp
Cg==
