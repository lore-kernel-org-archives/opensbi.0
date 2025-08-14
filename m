Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D81CA0EE6
	for <opensbi@archiver.kernel.org>; Thu, 14 Aug 2025 14:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSz3Tlj0x3cAQx1o0wjRxJZbgv+sDT/rA/VJtWLTMpI=; b=GcyPnZVL7jAkrf
	nM7zHiBkwYcjkMFAsssntMDS/rdK9NtF7xleEpXK2XMIiaxEuLZ7X9wGOWop/PWdztsrnK0h7OYlu
	xz+aJ3pmiTdGuK1ss4/pUkZHXhmCGewQi12mx+WdQV8y1NwEgLec+FXQgam64UO1pTKPd/9GKDVfU
	zoSXWXR35wX8gYoIDeHatUnonq1C3n6NuemFHBrl7ENgDk1+/7VTaiQv0fIzOolVUt/cM1xGx10sk
	3J37rZdG+A1s1FmQ38diZH0qkqcvM9WVE4WIAmMlC+u3fuT7DcyJ752NgKBUDpG1SbFAEqvj9ECIV
	HVGjMgvwSo+/OBQvtDRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYlB-0000000HDFJ-0NeC;
	Thu, 14 Aug 2025 14:16:53 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVlz-0000000Gi2R-3xAq
	for opensbi@lists.infradead.org;
	Thu, 14 Aug 2025 11:05:33 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-76e39ec6e05so131536b3a.2
        for <opensbi@lists.infradead.org>; Thu, 14 Aug 2025 04:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1755169531; x=1755774331; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hyF/7/bnEyiACPbX1Py7iQexzKakAISTY0cy1aiwpnI=;
        b=k2Da1/+H4viDBM4TUYigCsibK7wMYoPYpJOZ5eN+OxbX2eJO2BlbEu/5z6Nz2hLqLW
         wU8qQ57BHVxfOpXbILKr4VqScO36Bl+3YF8mMN3JI8Wk7STIu2566OJdnxLdBO9o1+1t
         1W2X54LiuA48GTK/tx7ErTjRDPsAwJGGO6aGziY07PZOHdkWiSNv/JOro1Ec3c4DjWk/
         DMk8bJomeauuMOo9v45gEHE2AEsjlL6mvgBWg2gHf+SJ4h7MhX0waGsoF5c+qRAqoAVi
         /1gDJC1edJAIR571K3lSAAZvV4DEVAdydD14QuIisL4tQnyFKHM24qFkKipwgk6+Y7Eu
         lKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755169531; x=1755774331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hyF/7/bnEyiACPbX1Py7iQexzKakAISTY0cy1aiwpnI=;
        b=gAK5xcjeEWtGSP3bnmuZhj5lVe6mdbal2kj1SUufNodF7n2lMpW5rtBaEteYYtm3na
         Lm7BoMUSbbJwYKhwrM0sgzgYv9ZsGnwdxdAUi9ZV2SO3gNfB9yw9A3CVma/LYfo1c23P
         99evXWBDlVySRH2q4fCqtlXL9dwTslYGHIKxfusG4WFggmZ8ECpvMylgoMjvQqPaCyxZ
         9pRePhWAnn+NbJOnuzCZ9tlu3wH98J9CLVjDZxsTKzmmzo9yyvmGd4mvqI8IGvfN8pKY
         +9uSjsM8o546dwSknLBwkb6pEDhvngItEimNM5XYz5PoIUQGVoL9Or78AktCkBIzVzQb
         o4cA==
X-Gm-Message-State: AOJu0YyHp9bsBAAxplZpVrAJiHvHmKp7a7uOdtbyUq9PLh7Jny1b2qcU
	Tw3eaMy/c+kQWO91Wio55/4hUzoPINImDBfyUql9SJi1GIv7rvy/z7a5tZnlVc8tBV+sSFfvtdZ
	5jvEpgO8l3MeF8wNxuPLS5mw4RXm0X+ToKNIk3YQ55tF/NIiobEW+lQf124mlAinEgaDmVBuPMK
	npKFG/EG/dX2LO2T3PdjM1IyJ1Pl+ibCJF76PQHPy/jmguOnZIxsAnJg==
X-Gm-Gg: ASbGncuAGh74g5ZGnxGiCiF1Lbr/88RnelOxmqsgc1AFuMtQA0clh+Qx9qPAdO38UON
	tKlJN8/y4T4aGcSqpvj/w5qRL50UpHdSTW0fVYlB5enX+KN09oO6YFGXhjf5d9+W9lM03p/qRxp
	fUaItHICjNXc9AdixkQtHOmXXmzvsndgnHq8aezPl3XC14370DMqmwOF46j+4pJC+ku0YavJ+EZ
	CrmVOeXrYS7gdIRq81dqiy00mzIBF6InS9QdteA7eV9Snw5GHlBRwfsUEdZMWPAtCvqeAwH6pvK
	7iufMR96kKFnh9Nvt3CTf7Beoq4wjVLdfnMVk3AYZqBWiukFiiInEW4XnK+sie1YrxxTIp1uC7i
	pJb7cz061cGGx2MtGAeUyamq7n+yVt1Th5ekYCrx8Hz3mEm4=
X-Google-Smtp-Source: AGHT+IFvf8soeAHNI65B7z3R13g0ItEJhLFD/+pqH+4oDyXksLq0+ogBT5jKOlZSz4KG49JXotx6xA==
X-Received: by 2002:a05:6a20:a122:b0:240:cd6:a922 with SMTP id adf61e73a8af0-240bd252517mr4081423637.37.1755169530747;
        Thu, 14 Aug 2025 04:05:30 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4683722179sm9624755a12.13.2025.08.14.04.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 04:05:30 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	alvinga@andestech.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH 2/8] lib: sbi_domain: allow specifying inaccessible region
Date: Thu, 14 Aug 2025 19:05:16 +0800
Message-ID: <20250814110522.18809-3-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250814110522.18809-1-peter.lin@sifive.com>
References: <20250814110522.18809-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_040531_979631_8333B192 
X-CRM114-Status: GOOD (  13.07  )
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

QWNjb3JkaW5nIHRvIHRoZSBSSVND4oCRViBQcml2aWxlZ2VkIFNwZWNpZmljYXRpb24sIFNtZVBN
UApyZWdpb25zIHRoYXQgZ3JhbnQgbm8gYWNjZXNzIGluIGFueSBwcml2aWxlZ2UgbW9kZSBhcmUK
dmFsaWQuIEFsbG93IHN1Y2ggcmVnaW9ucyB0byBiZSBzcGVjaWZpZWQuCgpTaWduZWQtb2ZmLWJ5
OiBZdS1DaGllbiBQZXRlciBMaW4gPHBldGVyLmxpbkBzaWZpdmUuY29tPgotLS0KIGxpYi9zYmkv
c2JpX2RvbWFpbi5jIHwgMTMgKysrKysrKysrKysrLQogbGliL3NiaS9zYmlfaGFydC5jICAgfCAg
NCAtLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvbGliL3NiaS9zYmlfZG9tYWluLmMgYi9saWIvc2JpL3NiaV9kb21haW4u
YwppbmRleCAxZmE1NmI2YS4uZThhZGY2NmYgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2RvbWFp
bi5jCisrKyBiL2xpYi9zYmkvc2JpX2RvbWFpbi5jCkBAIC0xMjYsNyArMTI2LDE4IEBAIHVuc2ln
bmVkIGludCBzYmlfZG9tYWluX2dldF9zbWVwbXBfZmxhZ3Moc3RydWN0IHNiaV9kb21haW5fbWVt
cmVnaW9uICpyZWcpCiB7CiAJdW5zaWduZWQgaW50IHBtcF9mbGFncyA9IDA7CiAKLQlpZiAoU0JJ
X0RPTUFJTl9NRU1SRUdJT05fSVNfU0hBUkVEKHJlZy0+ZmxhZ3MpKSB7CisJaWYgKChyZWctPmZs
YWdzICYgU0JJX0RPTUFJTl9NRU1SRUdJT05fQUNDRVNTX01BU0spID09IDApIHsKKwkJLyoKKwkJ
ICogSW5hY2Nlc3NpYmxlIHJlZ2lvbiBmb3IgYW55IG1vZGVzCisJCSAqCisJCSAqIE5vdGUgdGhh
dCBTbWVQTVAgY29uZmlndXJhdGlvbiBhbGxvd3MgdHdvIHNldHRpbmdzCisJCSAqIGZvciBzdWNo
IHJlZ2lvbjoKKwkJICogLSBwbXBjZmcuTFJXWCA9IDAwMDAgKEluYWNjZXNzaWJsZSByZWdpb24p
CisJCSAqIC0gcG1wY2ZnLkxSV1ggPSAxMDAwIChMb2NrZWQgaW5hY2Nlc3NpYmxlIHJlZ2lvbikK
KwkJICogSGVyZSB3ZSB1c2UgdGhlIGZpcnN0IG9uZS4KKwkJICovCisJCXJldHVybiAwOworCX0g
ZWxzZSBpZiAoU0JJX0RPTUFJTl9NRU1SRUdJT05fSVNfU0hBUkVEKHJlZy0+ZmxhZ3MpKSB7CiAJ
CS8qIFJlYWQgb25seSBmb3IgYm90aCBNIGFuZCBTVSBtb2RlcyAqLwogCQlpZiAoU0JJX0RPTUFJ
Tl9NRU1SRUdJT05fSVNfU1VSX01SKHJlZy0+ZmxhZ3MpKQogCQkJcG1wX2ZsYWdzID0gKFBNUF9M
IHwgUE1QX1IgfCBQTVBfVyB8IFBNUF9YKTsKZGlmZiAtLWdpdCBhL2xpYi9zYmkvc2JpX2hhcnQu
YyBiL2xpYi9zYmkvc2JpX2hhcnQuYwppbmRleCBjNWMzZWNiNC4uZWFiMjdmNDggMTAwNjQ0Ci0t
LSBhL2xpYi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9oYXJ0LmMKQEAgLTM1OCw4
ICszNTgsNiBAQCBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF9jb25maWd1cmUoc3RydWN0IHNi
aV9zY3JhdGNoICpzY3JhdGNoLAogCQl9CiAKIAkJcG1wX2ZsYWdzID0gc2JpX2RvbWFpbl9nZXRf
c21lcG1wX2ZsYWdzKHJlZyk7Ci0JCWlmICghcG1wX2ZsYWdzKQotCQkJcmV0dXJuIDA7CiAKIAkJ
c2JpX2hhcnRfc21lcG1wX3NldChzY3JhdGNoLCBkb20sIHJlZywgcG1wX2lkeCsrLCBwbXBfZmxh
Z3MsCiAJCQkJICAgIHBtcF9sb2cyZ3JhbiwgcG1wX2FkZHJfbWF4KTsKQEAgLTM4NCw4ICszODIs
NiBAQCBzdGF0aWMgaW50IHNiaV9oYXJ0X3NtZXBtcF9jb25maWd1cmUoc3RydWN0IHNiaV9zY3Jh
dGNoICpzY3JhdGNoLAogCQl9CiAKIAkJcG1wX2ZsYWdzID0gc2JpX2RvbWFpbl9nZXRfc21lcG1w
X2ZsYWdzKHJlZyk7Ci0JCWlmICghcG1wX2ZsYWdzKQotCQkJcmV0dXJuIDA7CiAKIAkJc2JpX2hh
cnRfc21lcG1wX3NldChzY3JhdGNoLCBkb20sIHJlZywgcG1wX2lkeCsrLCBwbXBfZmxhZ3MsCiAJ
CQkJICAgIHBtcF9sb2cyZ3JhbiwgcG1wX2FkZHJfbWF4KTsKLS0gCjIuMzkuMwoKCi0tIApvcGVu
c2JpIG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
