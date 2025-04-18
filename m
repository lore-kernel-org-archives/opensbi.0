Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB78DC369AB
	for <opensbi@archiver.kernel.org>; Fri, 18 Apr 2025 07:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vlcRIk1jTPKRNftTj7jFIW0nqmIb1BKNgakRBx3XW4c=; b=M8D
	KzcA4rQcwJfsw/2JFy7yUkzqaweeneToWf4JdGSCXL1e0ozl1kZ3I2U87Wg9mWs+zkV645tpT02cA
	jJX7VCgKbX6kS5HuG7jT2cMNhF8BL8rJlUKRpeuEPK5v3hG9ibp9/tQ0flOy7lwctvXaASqo1ovAA
	rmltgOxhNE6BferazP1eRaGoghyi3BbZueiBnTAQO299xA4yREdW/tZFr+vo3nBMblL6REGINyscx
	M6kDUxlMo8RwXL/PYC9lIAtU3iCmVdcliOFtsVrUTxSF4FFzHNB5RAhlzoS2U9dedVHHlhyxk7X0i
	3jaxvjRyyXN+KAgKekfdsG7JXdccgnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fn2-0000000FPmB-1F5b;
	Fri, 18 Apr 2025 07:05:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fUS-0000000FJ1A-2zaG
	for opensbi@lists.infradead.org;
	Fri, 18 Apr 2025 06:46:21 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-22401f4d35aso19540645ad.2
        for <opensbi@lists.infradead.org>; Thu, 17 Apr 2025 23:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744958779; x=1745563579; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VdO/A2XncgW7uepsNhzBw6uxn9HmkUbF8SkMi/HzfF8=;
        b=golI3Ktn4mMp3qN0Wu47JIflgyodasqsxU6eDCIzv+UCRAHYoURg9kqmrcak5yg4Qz
         4uYQkSoZw1meCcQHfpEbRAC1GF8SUgeWWNdgxroYC9ShoSCWT+SG7MFU7I5F8dgLyZbY
         BIJLaBIdAxY1Uvn+hnYmJsZK1PLk2PnsTAdfujmbjsy3MndTG6hVVrVNeMkeesQt4CqY
         EQtpu8DA7hSpcSqimkKtfNzw7+bwTAWCCfkQfXZPawjTLVduSwFQqY2TUZd6aTogpKhJ
         l8fjER4/I1xnluFLTr8g0FRTn04R0tUmpEhfKiRZAaMxS1q8gGmYdc1fz8+zYtzsiIax
         LEGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744958779; x=1745563579;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VdO/A2XncgW7uepsNhzBw6uxn9HmkUbF8SkMi/HzfF8=;
        b=I4AWJW4MbVeNzIfJRdyzOMG8rTguFOxSHSCtlnPkzHRNMDxu9OwR/YhsKgVppmfNi1
         DzeltVUytzqQwX60A5ot1GNAmu78A+pJ2sIvnURCzhszRn9ewOsUEd+5e53BieBl7Ovm
         n9CRT96agNBtF7LQzaqbeurYhnNfaAx7vdOYA5h9GmovPuXf7A8GmL/Mrn8FgbUvhcad
         Cb36PZlWwuLpu0/EPIiOoo1rZyYlX9irxwBgpUeIuZCHoj5dHz9/j+BgeUrdMjppoSmq
         9tLN7QnrDFrjqQFRmDJbqRaaJdmvBnJWAaqrk0x72NQDXvDcKeaB4KElKGQXGSwEZvgd
         LpCg==
X-Gm-Message-State: AOJu0Yx7zz9EJyPrLEk5sPi/chDuUDAdoad7wnIvA8/tpr5rfbNvLX55
	RtUXW1cIhrU8wVbJkVWR/3b797eWr8yHjZKzdYqTj9l7G6MPCXMngS9v/dryAB92N35Ok8fKoa5
	YK0IPOwX/QeujgeJA6pyp49Z1pVlXJ7PLcLquX7VR8ONMSwIOOUD5747TaCAY6+9nLmB2eMQyC9
	PeXMfB549agM/L0qmX1pdpotncmiUcUpBlDdKkhYmObYW5
X-Gm-Gg: ASbGncti/wLmG2obqozarz/dObKOfD7RT9OxQoSRu23JTABaX2lwUEackTRt81diN1x
	5WSZa/3kqyS2nVgc1RuUXN8W2p9sQ9F9Tm708+saXabBwK4JtBXwjdMwoVrRXRDmw0/lX5K2kPy
	ie1DyvRANHDZzU+V7CyFqiBAqx8Ed7umCLQdfCnMPtRqVsXvjIiIYpEsakMRffYsVrkq9mVcxGG
	17cJfana5oPimhptaGTnwTBodjt6YqYHtHg274moVvoBgNK8elq9h9R2RSoSl3rLujVxcDXQUHx
	fZGo6yEB+cuQM9vGLcBblcMWgZrX22ytMLf/x6pL/f84oTr7BQp98sMDcuswZKReVyPeTbnxlQ=
	=
X-Google-Smtp-Source: AGHT+IF9P6MC1PWgbdDzIceZWiMdz7JraWKI903SHTBaPj5KgEBx2YhowbXVcxnfVxv16Xfolt/p0g==
X-Received: by 2002:a17:902:d4ce:b0:223:50f0:b97 with SMTP id d9443c01a7336-22c53620f22mr21191385ad.52.1744958778925;
        Thu, 17 Apr 2025 23:46:18 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bdb21asm10791895ad.5.2025.04.17.23.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 23:46:18 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: opensbi@lists.infradead.org
Subject: [PATCH] lib: sbi: Use hsm stop for hsm wait
Date: Fri, 18 Apr 2025 14:45:06 +0800
Message-Id: <20250418064506.15771-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_234620_766723_4424761C 
X-CRM114-Status: GOOD (  11.99  )
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
Cc: Nick Hu <nick.hu@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

If we hotplug a core and then perform a suspend-to-RAM operation on a
multi-core platform, the hotplugged CPU may be woken up along with the rest
of the system, particularly on platforms that wake all cores from the
deepest sleep state. When this happens, the hotplugged CPU enters the
sbi_hsm_wait WFI wait loop instead of transitioning into a
platform-specific low-power state. To address this, we add a HSM stop call
within the wait loop. This allows platforms that support HSM stop to enter
a low-power state when the CPU is unexpectedly woken up.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 lib/sbi/sbi_hsm.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index dfe8408d..e8128a39 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -37,6 +37,8 @@
 
 static const struct sbi_hsm_device *hsm_dev = NULL;
 static unsigned long hart_data_offset;
+static bool hsm_device_has_hart_hotplug(void);
+static int hsm_device_hart_stop(void);
 
 /** Per hart specific data to manage state transition **/
 struct sbi_hsm_data {
@@ -170,6 +172,13 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
 
 	/* Wait for state transition requested by sbi_hsm_hart_start() */
 	while (atomic_read(&hdata->state) != SBI_HSM_STATE_START_PENDING) {
+		/*
+		 * If the hsm_dev is ready and it support the hotplug, we can
+		 * use the hsm stop for more power saving
+		 */
+		if (hsm_device_has_hart_hotplug())
+			hsm_device_hart_stop();
+
 		wfi();
 	}
 
-- 
2.17.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
