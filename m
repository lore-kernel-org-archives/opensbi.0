Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCAFC369DC
	for <opensbi@archiver.kernel.org>; Tue, 29 Apr 2025 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ogJ11cXXWUleXBNYluswdvGhokv+2a8LDSa8+Tc6MtA=; b=09bwB3hz4FsZ7p
	lASbaTLpF6QLfo+V7MKcrih4U87rTUfe55KL8bGaZeuGPxOyO7ZaxlaYVy9oMiMRh20QZkw3htAFv
	PJE/Jek8KP7wyaN9SS6l10JtcIk3IXJuFNut3gAEWPVIOFar34J2I86R79IzS5OU/j7fXLub8XaXT
	D6BJjr8Z7bKJyvJka5KZanbSTR9ltdWt24974rtqa0mbGbZWE2uB0iwcNz64g0U4sZeJM0H8+NsHT
	WBIn09g45Dou5iVggyLw9NW+szpAhc5kGJMYC1s9n5wU9Hj4n+o1J+LBK8DE4CGh3vjAOrFuo1UKQ
	HDt4jV59OhHZM8RgGgFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9oKZ-0000000ALQd-27qq;
	Tue, 29 Apr 2025 17:01:15 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lyH-00000009xYi-39j0
	for opensbi@lists.infradead.org;
	Tue, 29 Apr 2025 14:30:06 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-440668acbf3so8181615e9.0
        for <opensbi@lists.infradead.org>; Tue, 29 Apr 2025 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745937004; x=1746541804; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaewGNGJ6cl8JUYc290fWuFAQ5QngOTGkMt4QCU6KKk=;
        b=jXiSdSfaohfMPANIaLSA418DYUgfOzAhOzCBy2cFyTBb/neZJsYHzRBo6yA6WvEHH7
         jngco67CKxma7d9LDQnAhf6oCvMRTCnS41MJve+eRUkEVOMvn9sSq+csreBxsaaaNsaW
         ZIE4rMg70P8dG4aFvO4CHYTBl/c/abJ56IWBiJqsyjkRMu6ZBvqlNgpsCMVajfMQZg4j
         zvKBQO1JI6W3HlaEsBW9w2wZZgVqGI2Gb2GQ0lOV05lfQcMRePCHMswPz7hANiakTiHT
         GVZrgtWjOOHZ644ffmIi0F1xhovVxxzilf5Nw6eM/XB8K9eqxVVxY8LFIcfvMYChXflJ
         94xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745937004; x=1746541804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaewGNGJ6cl8JUYc290fWuFAQ5QngOTGkMt4QCU6KKk=;
        b=UELpaM6Uxtnvzhjmn5hosL5GqcArOoyDtnjGvS4RW5YT675S3Evddn0kHb3kjDxZMZ
         d1+lRumKZHMc+0dAi7JeitrROCgt6GxnaPaYMLy8VZttzVJwtH57j02IGYRS+Qh0dwz/
         52/wYiByr70FGW75/BZEqR9Cp4A66udAjFARif9WWKqxsLy/Unf7IjYab26nIzuf4ecB
         6e45QW9BE3CJzBRuBSsj9uXvkt+YoEHYp6JEPHN8xaNkaYGQZ5IRPu4be75D8kYtfBZR
         89++9Vr5kOrsbb7vD9H5FCIxfEmkGiAkEJxTuad3DINZan/RyuDVnWC17UZFs6YyqDPU
         EKcQ==
X-Gm-Message-State: AOJu0Yyt7CPV1MbJeKIwfqaShEouPF39E/Lhvl/Sn1/X0YKz41s6T2DE
	Ybku6y4qFdlt+UY8+bBt6QeOezXcI6AXKfyoO+Qtxvcx4Scgj8Wmo8tTO9ief+ScLvEMhOVY3RX
	C9PU=
X-Gm-Gg: ASbGncsv7zjaQ9nxBrJ9sbH/iyFOAPWNW7ko0xYlXsWusu9aT8YeRKYFXzq+0jn25RH
	X5BQbM5JwvRNxOtIRYBnm6pVwBp/cXuvx8SkAJ/jXlA4PiLjUAYkHKrZz7Da5PKEYXNczzsD0dE
	lJyYgPs8yXj+76+hmbVTT/9O9rUGFRjUaEOp2VwjZCLGjqeXNIg5PQL+Iy8S+vGzQPaoyVkI9pF
	P6Y61oKMBLaD8gef5f7goTftcQoMzfD3dMMl0aipSh2ybTV1lGbTNhuwHXHn7oLvd0177hCnt/h
	7KngZ/vR6GvHvmN+m6/TAvfbu+/a2OhrC8shi53E/yA8jBk8
X-Google-Smtp-Source: AGHT+IFIgmokgZgzPezPuc5w/ooE4PFotfnCZyQNzKkzofKIkhNWneSHwer1CFAl7c3xUe8hRMxwxw==
X-Received: by 2002:a05:600c:3b90:b0:43b:cab3:1fd1 with SMTP id 5b1f17b1804b1-441ac84b1ecmr10196905e9.1.1745937003899;
        Tue, 29 Apr 2025 07:30:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:b996:f7e3:35e8:5091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a530f6e6sm157590945e9.17.2025.04.29.07.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:30:03 -0700 (PDT)
From: =?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 4/8] lib: sbi_hart: reset sstateen and hstateen
Date: Tue, 29 Apr 2025 16:25:46 +0200
Message-ID: <20250429142549.3673976-6-rkrcmar@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
References: <20250429142549.3673976-2-rkrcmar@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_073005_787754_AD21496F 
X-CRM114-Status: UNSURE (   8.55  )
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
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgpTaWduZWQtb2Zm
LWJ5OiBSYWRpbSBLcsSNbcOhxZkgPHJrcmNtYXJAdmVudGFuYW1pY3JvLmNvbT4KLS0tCnYyOiBB
ZGQgUmV2aWV3ZWQtYnkgW0FudXBdCi0tLQogbGliL3NiaS9zYmlfaGFydC5jIHwgNiArKysrKysK
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvc2JpL3Ni
aV9oYXJ0LmMgYi9saWIvc2JpL3NiaV9oYXJ0LmMKaW5kZXggNWVhNzMyOGExOGM5Li5iZGY2NmVm
NzY3ZWQgMTAwNjQ0Ci0tLSBhL2xpYi9zYmkvc2JpX2hhcnQuYworKysgYi9saWIvc2JpL3NiaV9o
YXJ0LmMKQEAgLTExMSw2ICsxMTEsMTIgQEAgc3RhdGljIHZvaWQgbXN0YXR1c19pbml0KHN0cnVj
dCBzYmlfc2NyYXRjaCAqc2NyYXRjaCkKIAkJCW1zdGF0ZWVuX3ZhbCAmPSB+U01TVEFURUVOMF9D
VFI7CiAKIAkJY3NyX3dyaXRlNjQoQ1NSX01TVEFURUVOMCwgbXN0YXRlZW5fdmFsKTsKKworCQlp
ZiAobWlzYV9leHRlbnNpb24oJ1MnKSkKKwkJCWNzcl93cml0ZShDU1JfU1NUQVRFRU4wLCAwKTsK
KworCQlpZiAobWlzYV9leHRlbnNpb24oJ0gnKSkKKwkJCWNzcl93cml0ZTY0KENTUl9IU1RBVEVF
TjAsICh1aW50NjRfdCkwKTsKIAl9CiAKIAlpZiAoc2JpX2hhcnRfcHJpdl92ZXJzaW9uKHNjcmF0
Y2gpID49IFNCSV9IQVJUX1BSSVZfVkVSXzFfMTIpIHsKLS0gCjIuNDguMQoKCi0tIApvcGVuc2Jp
IG1haWxpbmcgbGlzdApvcGVuc2JpQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuc2JpCg==
