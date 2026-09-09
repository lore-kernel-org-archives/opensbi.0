Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EEAC79FB7
	for <opensbi@archiver.kernel.org>; Wed,  9 Sep 2026 16:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hr3TFzVmNHS6Sm58Ci51ss0pikFB6uUs5RQbiYTWjNY=; b=t/B3h91+/ibjET
	YDyiNoiOdNwormVxor4OBm6lkCWxgZnsjeGN/H+krA6Ah8ZHqJNbv/lNrzglUkfjPZvHvaGZEOO/H
	vg/YB9cK37gfREcdGX/t7YJwSGC276Em07aIF1TAj+c3e+oolf32VGub1zCRXdgFAlGIcpDUocesD
	8pujEvCBHCSdEfkAfE2fhMR/pX96IDr/yI4O0FqGyAVTzFDl691/SKYdS9unA/8nLhWyVtzcRxLGi
	3k/D28UViLAEbA5icBqH3BhaWlk1NkVvwHS4P82JnhrMv3hY1+xxbpiXGgnxIJkCMHwe6PZRZpoAT
	kZsfxU3XCtBYJkfnBrIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDC-0000000CJxu-3Pll;
	Wed, 09 Sep 2026 16:31:50 +0000
Received: from mail-wm2-x0b.google.com ([2a00:1450:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LDA-0000000CJtx-3eoj
	for opensbi@lists.infradead.org;
	Wed, 09 Sep 2026 16:31:50 +0000
Received: by mail-wm2-x0b.google.com with SMTP id 5b1f17b1804b1-49ccea58fe3so12537815e9.1
        for <opensbi@lists.infradead.org>; Wed, 09 Sep 2026 09:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788971507; x=1789576307; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3Gr7mZvvP2RP8YVE9PzeeRU3+lkzjm5BZ3r6Inkw3mw=;
        b=VUP5+a69ZOuEwHBW+J3dkgfwGhHTgIyYvt7oBvQzu+RUBvmhndt98odldJQkgMAEOU
         q4M9hY6yHtBXhSIG78nC8FC7415pG49MExKhQgRoRmYSei/BZbiXXRXHD6edTIB3Zr/t
         UsBUENxQNjgyasZRWvh5tAkU1buWJQsf1/qQfJxBpgtm3A5BriV2ofYm/p5/kQoeXOTA
         noXCSpT88Yey7prIeQSQjN3Hq+JIIWYpg/4CrtsOb8tP6snUs+urfeYBktDu/PNDF/fy
         OK++a3V9daifcwl0Xi15Zy+xqCPeVsfADAQoEC7fuSqyW2bTsESW3+vUKx7r2381iAqD
         54VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788971507; x=1789576307;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Gr7mZvvP2RP8YVE9PzeeRU3+lkzjm5BZ3r6Inkw3mw=;
        b=b1RmBgx/aJL9AF1ewjjUrvcXLxOKQ68+2D2sfCNLqtY63ZTrzg2NWXmItDP4XPc/5n
         p/6lV6/etGcdtiNrZ6A2HHpGKY4HVnfuc/SkCBXKeIWerH31uZ28JkJkVu1W+9Y15dZG
         ALF+AxZREZ2pXb16Pj7HFSG4ioSQYfXrY0zYGh8ht47y5fpiaSmzBlHf6fvLk8mVDLtn
         ZYEKRcBHJVTQjHmr4iiGh2EtyDgrk/umbBpVNosH5KWgQD2YTBUCmuGaB/XbO8UoUxWY
         X+z37cYshy4gcBB2ha9OpFfkuWG3TEIoBifQcew3L8Qd9HoXwAG+eRufbXJlinJ3q8vH
         PN5g==
X-Gm-Message-State: AFuF++lroIqoAFwcHkiRgyujt8+Wru3Hjf0g4MU6i4/PqFThnbUIR0Za
	RQAofdFVogX/7latqaAHAm15wsi6I/7/3zPR0lucq2tb6wTWAwVSi576hK5JFF64
X-Gm-Gg: AYBFou1Fdp2QSwcmvixjch4X8fTN1fsmUEdwcG4ywBB+iahHB4WKKjO1XiuV3pb6i0F
	KCjYTY5mqMjdHFJRFasDltkEa8fi2ZugdfZiggNWz+qWycfRtf3ySLJlTEeO6kTCxdGJVUPWWI9
	tuAuAFzBFLqGwhGXMe/gii7bnBZ7rWqedFEV3YnEowbNgsX11opyAOn7VCqJT/YGUZqN199Wu3H
	2k5xqGGnUOhC7XKPjkOvyt78UIA/8w9tD+4R3Sh92lNZqJ5rUW8Xpcg1y22uOhWAbPRu6gNi493
	uz6Vb4/QDttBH2PInHNiD4KlW/kO2GxOEeCdLdAWU44nC2surYWA6yNnqJ8WrRj/qAwpTguE6MD
	ZkxdiEws1vPiu1kfg+q/l4tCC9XZ2SRSZux96CMNfmaVPeAkF5N+6YWSV4rDjm7O67G8h9qjRpC
	9MdwJkVR2rk8roeesHpYTH4KNhR9jB+M4XbbAHuf1pPRmn6B2htQspx5h/JmwPKdGtX8SwBn/QE
	lo5Ns2B1AltyStAvR4k1wjrHIFUHTtb9X2WO0SDOCWQoVQTJtqjm9C3IcdcBJ6m+QAtK1Ws5v/W
	WzY=
X-Received: by 2002:a05:600c:4e46:b0:49b:910c:7703 with SMTP id 5b1f17b1804b1-49cf823f160mr358804475e9.9.1788971507005;
        Wed, 09 Sep 2026 09:31:47 -0700 (PDT)
Received: from localhost.localdomain ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c06f04sm2763705e9.13.2026.09.09.09.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 09:31:44 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH v2 13/14] lib: test: disable TSA for spinlock tests
Date: Wed,  9 Sep 2026 18:23:22 +0200
Message-ID: <20260909162322.29778-15-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
References: <20260909162322.29778-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_093148_925144_3DE97226 
X-CRM114-Status: UNSURE (   9.52  )
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

VGhlIHNwaW5sb2NrIHRlc3RzIGRlbGliZXJhdGVseSB1c2UgdW5jb252ZW50aW9uYWwgbG9ja2lu
ZyBwYXR0ZXJucyB0bwp0ZXN0IGVkZ2UgY2FzZXMuIERpc2FibGUgdGhyZWFkIHNhZmV0eSBhbmFs
eXNpcyBmb3IgdGhlbSBzbyB0aGF0IHRoZXkKZG9uJ3QgZ2VuZXJhdGUgZmFsc2UgcG9zaXRpdmVz
IHdoZW4gdGhlIGZlYXR1cmUgaXMgZW5hYmxlZC4KClNpZ25lZC1vZmYtYnk6IENhcmxvcyBMw7Nw
ZXogPGNhcmxvcy5sb3BlenI0MDk2QGdtYWlsLmNvbT4KLS0tCiBsaWIvc2JpL3Rlc3RzL3Jpc2N2
X2xvY2tzX3Rlc3QuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvbGliL3NiaS90ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMgYi9saWIvc2JpL3Rl
c3RzL3Jpc2N2X2xvY2tzX3Rlc3QuYwppbmRleCA3ODk0YzRlOTg3M2MuLjJjYmJhM2RhOGI2YiAx
MDA2NDQKLS0tIGEvbGliL3NiaS90ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMKKysrIGIvbGliL3Ni
aS90ZXN0cy9yaXNjdl9sb2Nrc190ZXN0LmMKQEAgLTQsNiArNCw3IEBACiBzdGF0aWMgc3Bpbmxv
Y2tfdCB0ZXN0X2xvY2sgPSBTUElOX0xPQ0tfSU5JVElBTElaRVI7CiAKIHN0YXRpYyB2b2lkIHNw
aW5fbG9ja190ZXN0KHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkKKwlOT19USFJFQURf
U0FGRVRZX0FOQUxZU0lTCiB7CiAJLyogV2UgZG9uJ3Qgd2FudCB0byBhY2NpZGVudGFsbHkgZ2V0
IGxvY2tlZCAqLwogCVNCSVVOSVRfQVNTRVJUKHRlc3QsICFzcGluX2xvY2tfY2hlY2soJnRlc3Rf
bG9jaykpOwpAQCAtMTYsNiArMTcsNyBAQCBzdGF0aWMgdm9pZCBzcGluX2xvY2tfdGVzdChzdHJ1
Y3Qgc2JpdW5pdF90ZXN0X2Nhc2UgKnRlc3QpCiB9CiAKIHN0YXRpYyB2b2lkIHNwaW5fdHJ5bG9j
a19mYWlsKHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkKKwlOT19USFJFQURfU0FGRVRZ
X0FOQUxZU0lTCiB7CiAJLyogV2UgZG9uJ3Qgd2FudCB0byBhY2NpZGVudGFsbHkgZ2V0IGxvY2tl
ZCAqLwogCVNCSVVOSVRfQVNTRVJUKHRlc3QsICFzcGluX2xvY2tfY2hlY2soJnRlc3RfbG9jaykp
OwpAQCAtMjYsNiArMjgsNyBAQCBzdGF0aWMgdm9pZCBzcGluX3RyeWxvY2tfZmFpbChzdHJ1Y3Qg
c2JpdW5pdF90ZXN0X2Nhc2UgKnRlc3QpCiB9CiAKIHN0YXRpYyB2b2lkIHNwaW5fdHJ5bG9ja19z
dWNjZXNzKHN0cnVjdCBzYml1bml0X3Rlc3RfY2FzZSAqdGVzdCkKKwlOT19USFJFQURfU0FGRVRZ
X0FOQUxZU0lTCiB7CiAJU0JJVU5JVF9FWFBFQ1QodGVzdCwgc3Bpbl90cnlsb2NrKCZ0ZXN0X2xv
Y2spKTsKIAlzcGluX3VubG9jaygmdGVzdF9sb2NrKTsKLS0gCjIuNTEuMAoKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
