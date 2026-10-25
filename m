Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE4A606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 14:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WAd1ndZu;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pKj3cDxg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WfgCJ1awtjr1ulcHF3U4BRzZLHmukoAqhTgZoGA3gaA=; b=WAd1ndZupDINXt2K6905a9GVZh
	6lhYJ6BWPZznayYGvWaEEXa6fqy7QNNT48G9aeP0ITQHzQQs/gOdF64LZk5IWO3hF37KWB2MbRVmd
	Fwn2XC5G4HUU+KnbUABBvOQ3QvX3D1RzqMMWYKszc4ejVNsmV5gXo+PuZLNTk5KSRoQb8Dagxht2+
	XxFFUTKVoXa7MLQ+5/idUv3+VFASkaCrb2iuDdteprjq3YQfE/Yf9R3JbF6GLkavmcIGI+0JajkJQ
	jAlMSF/HmDvyJQIkegFjfjYhTOYEhr9hN9+37X3lWilWxtBMPirpW00VIY/JqBcU125mNPPxyL9ml
	gL3M8gaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzbe-000000018tJ-2pfx;
	Sun, 25 Oct 2026 14:53:54 +0000
Received: from mail-vk1-xa2e.google.com ([2607:f8b0:4864:20::a2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzbc-000000018s3-22Kz
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 14:53:53 +0000
Received: by mail-vk1-xa2e.google.com with SMTP id 71dfb90a1353d-5ec20398b05so851947e0c.1
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 07:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940031; x=1793544831; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1QXvRmwT8pyTn5QQai4AJZM4oxlccr2kc+IArIPBKU=;
        b=pKj3cDxgunkIr5yrTRgQpRk8/Wbo+7tv3oEUUc/OpBQG9zsoK8oYUFjsW3Ys1bFETX
         dcpW5tOd+8JcwKljuDgsVr79cRLhWRD69om5IzHcPyTHN/QTRo7YVGDHHZZWiMqV5zGY
         K2XD8QmAVCgUl6LmylpCK74U/Lv/f/JTcF/9YzAEsAMCJZd7p7e49v5S0NXkd2l6x1WY
         Va/CY6BBbtEt+PAryk31D3UvvRqWqUGuCSez/WNtoQ9eDKvI2Z7YS69SzkXakMWvdDqM
         Med3i2f+5ztGOik3ZUfxzYyTxogE2/FUn1Pq/h+g59q4BxfgaoRyIV7CEn6IHa+MLAnh
         TF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940031; x=1793544831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=n1QXvRmwT8pyTn5QQai4AJZM4oxlccr2kc+IArIPBKU=;
        b=tQUojiYujc1oCsm66oQZ7RDAPz8jHmGTY/KFWVy1MYyBLXbJuclp8yu2px1INRZ1vK
         hX7/YV1JGQ9kvejFBubxtkz2eUeKVlqXkkh/vH8xloUNuQJ5bzpNDVlPmNH6k/EO43qz
         RTVkiXt35B9wo5J2z36FZmwK1hOjFx8OdZhouW+r8iO58sjso42vdcXNelJMgM9dElW7
         cj5AXo38PKfxWGQCYEoF9rptgOsJborYnpSbADde9amZWD1Ji25JTqQpW8TgXL8lEXso
         Y+s53jvJBy4m9kQeXIH1hce+bQTe9hdnuMGQs6mrX5v/tuo8bpELYI3ToCPdvnTKnocW
         Oq4w==
X-Gm-Message-State: AFq9FYJcNdjDC25mLeqyyRLU9pIkgChCqVfhowDdFqgAVQLvRH/bisrN
	Ab3FHvezHZm/L5g3v4+VNnrmLvh/Vg07fA/UPDsucbidgVGM/jK3kY/yB5Yeyw==
X-Gm-Gg: AYBFou1N+A8jtQr6YuPoZfXy3VU8D7REnMyFYMtIXvJ8aQr8ibWJcMh+z4o/NgRjG55
	WenATep8qJA3rzDFZyllrm1sKd4bHUmGjofnGCk4hwsBzM1xpK2hA9qeGW2almxBeNscHQE5IOs
	NICHVWkpQTxCjGbL5x1sU8n0Zhgio9206dPKaq0IKkEPt5nNwDAWhVdEJ43FWExz8S/8cAAd5s7
	/6vmH0MDFKGGnetRq0k0WeMevzkl/7wZgJgS2KJYxBjnf3Jl5BxOey/StxvX2t48yg2vuHzTdnJ
	T8339v5Csx+wA7gBgDKwcI5dPcQjSNR/pk6OceQl6amkr4sJ7MGjQeM7Tm/hg0SlPuShZ9ypuZ2
	pVFiIPAe6cz0M1OyifcZouFvG3ujYdGHnZL7fc2BcdK0EHdAF1z1NG7QUjw+psi0GUY8x6xHR+K
	aF5yYrfTqtTpOftIqwUjhPT9DJRAW787iZ1+/PugX1bX5kuFGIhPFz86UEQoB0Isx3EJ4gkIJlX
	HBQJxmrGdx6EbInR5oYFk2ivqVZTqQt1G5olux1nYmCS0y8mcODb+dmbfs6xt8FdqmssRBGLGqD
	MNjPKYu/3ekB2CN+54zKrHqwj/ibVVIwBQNfGvtQWD1D
X-Received: by 2002:a05:6122:2886:b0:5ea:d2fa:c2e6 with SMTP id 71dfb90a1353d-5ec232dc158mr1384876e0c.14.1792940031251;
        Sun, 25 Oct 2026 07:53:51 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234add5dsm5501237e0c.16.2026.10.25.07.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:50 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	pengpeng@iscas.ac.cn,
	hppiscas@163.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH v2 1/2] lib: sbi_pmu: do not ignore pmu_ctr_start_hw() error in cfg_match
Date: Sun, 25 Oct 2026 08:53:37 -0600
Message-ID: <20261025145338.2569358-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145338.2569358-1-sebasjosue84@gmail.com>
References: <20261025145338.2569358-1-sebasjosue84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_075352_531079_8253705F 
X-CRM114-Status: GOOD (  12.48  )
X-Spam-Score: -1.9 (-)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sbi_pmu_ctr_cfg_match() calls pmu_ctr_start_hw() for the AUTO_START
flag and drops the result. pmu_ctr_start_hw() carries its own index
guard

	if (cidx >= num_hw_ctrs || cidx == 1)
		return SBI_EINVAL;

and can also return SBI_EALREADY_STARTED when the counter is already
running. Both are reported to the caller as a successful configure.

Neither is benign. A rejected index means nothing was configured, and
an already running counter may have been configured for a different
event previously, so the supervisor must not be told its configure
succeeded.

This is also the only one of the three start paths in the file that
discards the error. sbi_pmu_ctr_start() propagates it:

	ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
	if (ret)
		return ret;

and the firmware branch directly below this call site propagates the
error from pmu_dev->fw_counter_start() as well.

Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---
 lib/sbi/sbi_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index bf43ad89..c68a675a 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -982,8 +982,11 @@ skip_match:
 	    event_type == SBI_PMU_EVENT_TYPE_HW_RAW_V2) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			pmu_ctr_write_hw(ctr_idx, 0);
-		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
-			pmu_ctr_start_hw(ctr_idx, 0, false);
+		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
+			ret = pmu_ctr_start_hw(ctr_idx, 0, false);
+			if (ret)
+				return ret;
+		}
 	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			phs->fw_counters_data[ctr_idx - num_hw_ctrs] = 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
