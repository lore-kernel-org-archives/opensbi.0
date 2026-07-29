Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEF20C53219
	for <opensbi@archiver.kernel.org>; Wed, 29 Jul 2026 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+Ybg7Kfa+aY1EZhgP/7z7jc9QR/NfeniWPnaRuLER4=; b=nn2zRY6IbgznRV
	HFGpuDTvbWrgnltRWDfxu7h9XZXYPVovGGCsfKwgSZuJUDDx0rp+oC/HKy9KGwtrd3bqKVFhUyv2o
	XprbuJaxPlZqBPptylD2Nvbyyz7rECHcnPvFOOLLhjGRNfCvwe9c87tBDMG6ob8z2f0CnRAiJwHAl
	q6zFfIOJ57u9HqvQ1q8MGtv0nUoEYw0wNYzQxHrGrHu7yEGRW3bfXwRMGEbRJ7B8pXFArx5VZAtzD
	F3okBlme3DvjKo2EhTbD9yoajcADT+oEF14jaftFnoChzqZeLZpVo+chxYbj7diOBvOjRM9WmrF2T
	A4MlK3u0eD7PQ0JhKL8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Oe-00000008bNj-1T6m;
	Wed, 29 Jul 2026 16:44:44 +0000
Received: from mail-wr2-x02.google.com ([2a00:1450:4864:30::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp7Ob-00000008bIk-2Lcf
	for opensbi@lists.infradead.org;
	Wed, 29 Jul 2026 16:44:42 +0000
Received: by mail-wr2-x02.google.com with SMTP id ffacd0b85a97d-4784b41f3aeso290110f8f.1
        for <opensbi@lists.infradead.org>; Wed, 29 Jul 2026 09:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785343480; x=1785948280; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDt1KyjTb50Et87E4xT74LcxWwKGgPqcyjDpLlkgErw=;
        b=d+UZzKtkVtPY2r8zQcWNAWUm6ryeq9363iO1Sz9/TN51UqY9I5ZEFTkTaR+XqgUxn4
         X+uVrHHPWqCxGLt2kfnYc7sO7yMPyRX6WmaH3DYTR8/E4CLreXNnmuW9pqyu6uZ2Y8kL
         utdpDe0bHEEb/VakS8hprxdLZ6Uq5EbGzyC6xPibSsj4I+NlxxykBe2WS9zYdwmvjPlL
         w7AkTDKAfv1PdWwseJ+NjZwoTePCUYomLKWv643I8DY1QDvpRsi6DzO+yJT3dyfkshWc
         0adz1Cm21iT0r2X+FAaJDvNr55CjgEm230e5V78QQSdExaI3xK9SWYqsL73OqP44OL2A
         7EFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785343480; x=1785948280;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDt1KyjTb50Et87E4xT74LcxWwKGgPqcyjDpLlkgErw=;
        b=E27wZbgqSqHZxcFNfuW1a+mscOprKfJXe4vWpWkM3kJCzjFk4LNv1Q/eQ7NxqZcyVD
         NWE57VjZIwKz5l/oQPOJIp8Ybz7yjgVRnrLJ0QKzHOFM/WS7i4T+N0j4duOPDamppk2f
         /9jJM+ALrt8ZNmMKZ1FJ1jZ4Ovls2Ok3w7vnntI8K1nWik9qvqmXZv0vSRzxT719JrZc
         bZW8PVg7iE0cXz5dscX/ZHZuA3Y2qft4ySzcS5AFvYDOUeZuMco5ams8nWN91OikPLKd
         kdjKLXoPzXCA7UX7xaJQthikevVXHU9TG05vBJIqPUEygabefVdWVh9wkkrT3ZDLqMM5
         BAMg==
X-Gm-Message-State: AOJu0YwDYoivg2VgphOab0cEjiZbL88zAjL9ReW/gEwM+QSC0dZlVifP
	pnclIYNIBpGtWObbe9k8/Yfd7pOt+1pR10swlmPxHZZ8mHbMzMDTEWpYsPurIF3E7Fg=
X-Gm-Gg: AR+sD13K/wq/jEYFBNFExBRF//I0fYWVAsvunkk0BEwzTGkeGRu8i1bM7CbMSWMlTyb
	HeiJSGBdSQqx2HhP1/4u29TLKoM3TIv3ZXfX5n/cvoZrEuSE7KFRhSqfXjcKTszO3P16QD9Sqn3
	E7VmVkUhOAiSHTHUQ5o7VgMvWgnSWBlyew1kEnno+TNkFCQtJFcK2nmR4W9XDLxwBjnS0ZMiCjx
	hgGB+fqhv6QvK77GEMsAiBArsqtM2nFV7xtJDwKmO55UJVJTs+MoWmdezOBaTUg5rHe+9byCnCW
	6H4DuxfC2JIUAzS54pwSL9OuhOpQ9KP0gm+nNSMdEojyCg6JcRnyOxbiMUK7VWAmNHXJDy20FPN
	Jgb+LKyuropXX7+SYJeGYJtEWAeghDGZi7ZCmwkwBoI6BqHA+Jtzte2KFYPTTC9HO269NDfeCpQ
	Q6fxkMoLy/QOTyukMNumjCx6HALFsCaOjUVK/j3oLsqDM+tcZ3PJspPTjdavAWYC6/n4Sq1sbKq
	5SMksKAZH0UiLV3Ri/FmLBdlw2ZR0mN//X4wQc0+WO9ug/VuzgcFXwI7g==
X-Received: by 2002:a05:600c:a46:b0:496:c2fd:1731 with SMTP id 5b1f17b1804b1-496c653e0e1mr84259085e9.1.1785343479906;
        Wed, 29 Jul 2026 09:44:39 -0700 (PDT)
Received: from leap.suse.de ([84.77.88.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6aa3a88sm8474869f8f.6.2026.07.29.09.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 09:44:39 -0700 (PDT)
From: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
To: opensbi@lists.infradead.org
Cc: =?UTF-8?q?Carlos=20L=C3=B3pez?= <carlos.lopezr4096@gmail.com>
Subject: [PATCH 07/14] lib: sbi_timer: add TSA annotations
Date: Wed, 29 Jul 2026 18:35:34 +0200
Message-ID: <20260729163540.3162978-9-carlos.lopezr4096@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
References: <20260729163540.3162978-2-carlos.lopezr4096@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_094441_694826_19881E2A 
X-CRM114-Status: GOOD (  12.12  )
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

QWRkIFRocmVhZCBTYWZldHkgQW5hbHlzaXMgKFRTQSkgYW5ub3RhdGlvbnMgZm9yIHRoZSB0aW1l
cgppbXBsZW1lbnRhdGlvbi4gVGhpcyBpbmNsdWRlcyBpbmRpY2F0aW5nIHdoaWNoIGZpZWxkcyBh
cmUgcHJvdGVjdGVkCmJ5IGEgc3BpbmxvY2ssIGFuZCBhbm5vdGF0aW5nIHdoaWNoIGZ1bmN0aW9u
cyBtdXN0IGJlIGNhbGxlZCB1bmRlciBhCnNwaW5sb2NrLiBFeGNsdWRlIHNiaV90aW1lcl9pbml0
KCksIGFzIHRoZSBzcGlubG9jayBjYW5ub3QgYmUgYWNxdWlyZWQKYmVmb3JlIGl0IGlzIGluaXRp
YWxpemVkLgoKU2lnbmVkLW9mZi1ieTogQ2FybG9zIEzDs3BleiA8Y2FybG9zLmxvcGV6cjQwOTZA
Z21haWwuY29tPgotLS0KIGxpYi9zYmkvc2JpX3RpbWVyLmMgfCA1ICsrKystCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL3Ni
aS9zYmlfdGltZXIuYyBiL2xpYi9zYmkvc2JpX3RpbWVyLmMKaW5kZXggNGQ3MzdkMjJhMThiLi4w
MDY4ZTgzZWMxZTkgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX3RpbWVyLmMKKysrIGIvbGliL3Ni
aS9zYmlfdGltZXIuYwpAQCAtMjMsNyArMjMsNyBAQAogc3RydWN0IHRpbWVyX3N0YXRlIHsKIAl1
NjQgdGltZV9kZWx0YTsKIAlzcGlubG9ja190IGV2ZW50X2xpc3RfbG9jazsKLQlzdHJ1Y3Qgc2Jp
X2RsaXN0IGV2ZW50X2xpc3Q7CisJc3RydWN0IHNiaV9kbGlzdCBldmVudF9saXN0IEdVQVJERURf
QlkoJmV2ZW50X2xpc3RfbG9jayk7CiAJc3RydWN0IHNiaV90aW1lcl9ldmVudCBzbW9kZV9ldjsK
IH07CiAKQEAgLTE0OCw2ICsxNDgsNyBAQCB2b2lkIHNiaV90aW1lcl9zZXRfZGVsdGFfdXBwZXIo
dWxvbmcgZGVsdGFfdXBwZXIpCiAjZW5kaWYKIAogc3RhdGljIHZvaWQgX19zYmlfdGltZXJfdXBk
YXRlX2RldmljZShzdHJ1Y3QgdGltZXJfc3RhdGUgKnRzdGF0ZSkKKwlNVVNUX0hPTEQoJnRzdGF0
ZS0+ZXZlbnRfbGlzdF9sb2NrKQogewogCXN0cnVjdCBzYmlfdGltZXJfZXZlbnQgKmV2OwogCkBA
IC0xNzYsNiArMTc3LDcgQEAgc3RhdGljIHZvaWQgX19zYmlfdGltZXJfZXZlbnRfc3RvcChzdHJ1
Y3Qgc2JpX3RpbWVyX2V2ZW50ICpldikKIAogc3RhdGljIHZvaWQgX19zYmlfdGltZXJfZXZlbnRf
c3RhcnQoc3RydWN0IHRpbWVyX3N0YXRlICp0c3RhdGUsCiAJCQkJICAgIHN0cnVjdCBzYmlfdGlt
ZXJfZXZlbnQgKmV2LCB1NjQgbmV4dF9ldmVudCkKKwlNVVNUX0hPTEQoJnRzdGF0ZS0+ZXZlbnRf
bGlzdF9sb2NrKQogewogCXN0cnVjdCBzYmlfdGltZXJfZXZlbnQgKnRldiwgKm5leHRfZXYgPSBO
VUxMOwogCkBAIC0zMzgsNiArMzQwLDcgQEAgdm9pZCBzYmlfdGltZXJfc2V0X2RldmljZShjb25z
dCBzdHJ1Y3Qgc2JpX3RpbWVyX2RldmljZSAqZGV2KQogfQogCiBpbnQgc2JpX3RpbWVyX2luaXQo
c3RydWN0IHNiaV9zY3JhdGNoICpzY3JhdGNoLCBib29sIGNvbGRfYm9vdCkKKwlOT19USFJFQURf
U0FGRVRZX0FOQUxZU0lTCiB7CiAJY29uc3Qgc3RydWN0IHNiaV9wbGF0Zm9ybSAqcGxhdCA9IHNi
aV9wbGF0Zm9ybV9wdHIoc2NyYXRjaCk7CiAJc3RydWN0IHRpbWVyX3N0YXRlICp0c3RhdGU7Ci0t
IAoyLjUxLjAKCgotLSAKb3BlbnNiaSBtYWlsaW5nIGxpc3QKb3BlbnNiaUBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbnNi
aQo=
