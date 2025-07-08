Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DE7AC8303C
	for <opensbi@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X5yJsyPDnH81iNmIyNUPa6jFD+HWLQDj6lq6WXIFTME=; b=qTc3ARzJrkaOlZ
	LDcXzeTjr/xSdPKEHyVcPLvx9GGoDWEyjPLob9ceLM+E/yyzPk+Qp+afb08/B1LzAecvYKr2Rw4yv
	IFAlhGyetgS1SbUXrd2SQRwDHEqQ94kuea4M5qEyzUJFAfyWKpGt1kBIJRhDM0IVy/cYH1wrnWV6t
	L6tfISZRkF8F1nMpF5VPQ9m6LzKe7dWuOyWvkw+lNhZeiFv+UjOTCfCr1WYKpuai7B6CLIqPo4spB
	4UiMiir5eFyR4bUA1UwDH37rHg3RVXpia374dOf8cdvWg8k63M3UrIZUIjtjtwusYIYVMUgQfMBrE
	xQ5MAcDtwUVESEs8VdlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAk-00000006NlP-0RqN;
	Tue, 08 Jul 2025 19:40:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZClc-00000006D7f-2luq
	for opensbi@lists.infradead.org;
	Tue, 08 Jul 2025 18:10:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso654226f8f.1
        for <opensbi@lists.infradead.org>; Tue, 08 Jul 2025 11:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751998207; x=1752603007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8nWPYg9Zr7Cm8+U+mJALKU2BnNczhz64HnwkBWLfO0=;
        b=A86qXKxxHTs61O8tfr42fNbhuv2hHosIRoCWz6J5I388xwD50PfBQoCk/zthH+wauj
         pb1O5LvhdD4dCewo5gWMECB8Goc2qHGQbQU4karJjWzDfv3zvzZ+Nb2M2N/DbDn/ohwn
         qZ+c3rF1dGViMDDOzaCfTRD+oXZxl2PL8p0pg9tTkk2nnFbyEY6WPkePRrH6fzRU/zBg
         NYcpZ+c4SVd1B2KzMoiNw4jdaCvfIfSYhe9FkdtAWsEK1ocaLZfzq0q2SLh5tEuqpIIc
         84PUKVkx3JH0L6FSxktnyM74xDFw6PVPufVI4Psw8JUbzIs13dMbGT8Gz7b5NELDE/yS
         e7FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751998207; x=1752603007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8nWPYg9Zr7Cm8+U+mJALKU2BnNczhz64HnwkBWLfO0=;
        b=VYKM5WOjOzjNCKgSkkvtIc6EebzsrjW93TmxWCxuX0TrsibKpv0//uuKCnL7vi+Usp
         /AOaxUP5zf8UkF6gym22Weh28AZWfieycGbPdl4C+U+FL5avKw9ACz5Gh+mDK18glCdI
         gBkpUD7IaEpTjNEDuanVkU1e3cn7XqWBHRBQwHGFPWnEmzuDunHDPIZCpXGnn3pGXlzq
         NoR5aij3L2mEm9e81+YWpuhBr6v9/Q1L+luf2eWKF8nd4np+tNbdKMT0KxKdgDjLKrmG
         eNm8PGJJ31MtbwmK2jyP8vyMaBowjyYNlhWRu7xTj+WjFZbV/s1S+/5asN5QxBB4HaDm
         Vl1w==
X-Gm-Message-State: AOJu0Yybazb9AhELTNq5Kjfhw3uPXNiblo1xtKdxD6Jy5CyNCfIY+na9
	gkIyTOTmyei+cliZC6k7JLxjLPrwunaStyHmrUJfUvqB6YoxiLg6R8HgT1BIAG6Y
X-Gm-Gg: ASbGncsPXztJ4Mx2QPjdBejP2ui5E2e1MNxpS8eKgYiCKQnp2YWlIxmt7B7f3N1qEEB
	kN/n7hshmroO1O/vJXXxboG60xakawEpA6sMhEqpI3j4wm5m2WMemmTXO0aH8mrfhpOAlBaEUlr
	PbgFI2X2c57GKFqU7uBowCeQmJUANu+qalxNCGyoyjRinEjCOp9chhAmLowzP7GcofGxWvdHbv8
	OMF/Lo1iCGDs9yeKJW3dG8i7zikv+WBM/hcqachMT8UelOAbEwh+/3HfXEZ4srOAORrwAkQWuRl
	DgN3bYwq97jjg9hVYq7WbO5SUOsP7Bc01oUBruQC1eWOdrw9IO+qe9BTyhFcoh2LmduWKMuBZsU
	EnZ/cMapIZZ1B0P16ALBOpnolE8o6g+LNtRi8VZTW4vroNTclWvo=
X-Google-Smtp-Source: AGHT+IEG/fIQ1ESkC2KkmsEDJCK9er3GHYI9L9VgbEwcgTPnxm8wblv6o6FeqlBhiwc2xUj8fVXWtg==
X-Received: by 2002:a05:600c:1c90:b0:43e:94fa:4aef with SMTP id 5b1f17b1804b1-454cd0942edmr17341475e9.8.1751998206441;
        Tue, 08 Jul 2025 11:10:06 -0700 (PDT)
Received: from LT-5CD4135M7L.localdomain (172.red-83-41-144.dynamicip.rima-tde.net. [83.41.144.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b9671asm13734888f8f.53.2025.07.08.11.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 11:10:06 -0700 (PDT)
From: =?UTF-8?q?Manuel=20Hern=C3=A1ndez=20M=C3=A9ndez?= <maherme.dev@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Manuel=20Hern=C3=A1ndez=20M=C3=A9ndez?= <maherme.dev@gmail.com>
Subject: [PATCH] platform: openpiton: fix uninitialized plic_data struct
Date: Tue,  8 Jul 2025 20:09:14 +0200
Message-Id: <20250708180914.1131-1-maherme.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_111008_703568_3E8EE6E4 
X-CRM114-Status: GOOD (  13.06  )
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

VGhlIHBsaWNfZGF0YSBzdHJ1Y3Qgd2FzIHVuaW5pdGlhbGl6ZWQuIFRoaXMgbGVkIHRvIG1pc2Z1
bmN0aW9uIGJlaGF2aW9yCnNpbmNlIGl0IHdhcyBzdWJzZXF1ZW50bHkgYXNzaWduZWQgdG8gdGhl
IGdsb2JhbCBwbGljIHN0cnVjdCwgYW5kIHNvbWUKc3RydWN0IGZpZWxkcywgc3VjaCBhcyBmbGFn
cyBhbmQgaXJxY2hpcCwgY29udGFpbmVkIHJhbmRvbSB2YWx1ZXMuClRoZSBmaXggcHJvcG9zZXMg
dG8gaW5pdGlhbGl6ZSB0aGUgcGxpY19kYXRhIHRvIHRoZSBnbG9iYWwgcGxpYyBzdHJ1Y3QsCnNv
LCBhZnRlciBwYXJzaW5nIHRoZSBmZHQsIHRoZSBmaWVsZHMgb2YgdGhlIHN0cnVjdCB3aWxsIGJl
IHNldCB0byB0aGUKZGVmYXVsdCB2YWx1ZXMgc2V0IGluIGdsb2JhbCBwbGljIHN0cnVjdCBkZWZp
bml0aW9uLCBvciB0aGUgcGFyc2VkIHZhbHVlcwppbiB0aGUgZmR0LCBvciB6ZXJvLgoKRml4ZXM6
IDRjMzc0NTEgKCJwbGF0Zm9ybTogb3BlbnBpdG9uOiBSZWFkIHRoZSBkZXZpY2UgY29uZmlndXJh
dGlvbnMgZnJvbQpkZXZpY2UgdHJlZSIpClNpZ25lZC1vZmYtYnk6IE1hbnVlbCBIZXJuw6FuZGV6
IE3DqW5kZXogPG1haGVybWUuZGV2QGdtYWlsLmNvbT4KLS0tCiBwbGF0Zm9ybS9mcGdhL29wZW5w
aXRvbi9wbGF0Zm9ybS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcGxhdGZvcm0vZnBnYS9vcGVucGl0b24vcGxhdGZv
cm0uYyBiL3BsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMKaW5kZXggZDJjZjNlMzIu
LmZhYTI5OWNlIDEwMDY0NAotLS0gYS9wbGF0Zm9ybS9mcGdhL29wZW5waXRvbi9wbGF0Zm9ybS5j
CisrKyBiL3BsYXRmb3JtL2ZwZ2Evb3BlbnBpdG9uL3BsYXRmb3JtLmMKQEAgLTc5LDcgKzc5LDcg
QEAgc3RhdGljIGludCBvcGVucGl0b25fZWFybHlfaW5pdChib29sIGNvbGRfYm9vdCkKIHsKIAlj
b25zdCB2b2lkICpmZHQ7CiAJc3RydWN0IHBsYXRmb3JtX3VhcnRfZGF0YSB1YXJ0X2RhdGEgPSB7
IDAgfTsKLQlzdHJ1Y3QgcGxpY19kYXRhIHBsaWNfZGF0YTsKKwlzdHJ1Y3QgcGxpY19kYXRhIHBs
aWNfZGF0YSA9IHBsaWM7CiAJdW5zaWduZWQgbG9uZyBhY2xpbnRfZnJlcTsKIAl1aW50NjRfdCBj
bGludF9hZGRyOwogCWludCByYzsKLS0gCjIuMzQuMQoKCi0tIApvcGVuc2JpIG1haWxpbmcgbGlz
dApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
