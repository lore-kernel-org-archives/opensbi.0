Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C010DCD4F26
	for <opensbi@archiver.kernel.org>; Fri, 26 Jun 2026 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qHfWQ5A3uDYqpsYtFEf/plp6WmxyvvQX+TY/l9Y0qQ=; b=py8e9mD8WwvIOE
	7eIqsZIxlYLPUwc1DdkS4DBbWZE4BLLfsMDMh6Mnd1rQfpudlJEMECTrypkPleiC4Ln9GhOEMR2/d
	tf65O+dzy3x9iYv0Fq0b+9IKsq/PPwnFasLG8Jzo9iLq4CwmY2UogqBrJ/l8/RKOK9YcPHAjJi+gG
	sZUXHiarfi0NLhQ9uIbqeVFdbO+dCNBtpIQdyJ6/OYgCJ7ZT9mPc42z67dgcjEaHVJvVWAa8W1spR
	YzEh6b4O9dqBGD6rcJT+Gh0gcNZUB/cYwY4FR07HNebJnRHU1YaEzrO2RFeRri4x48f/29d8djogj
	P2M8XdJk1FqDe8sWW/ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cF-0000000B4Qc-1SNR;
	Fri, 26 Jun 2026 10:16:55 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd3cA-0000000B4NK-2Mno
	for opensbi@lists.infradead.org;
	Fri, 26 Jun 2026 10:16:54 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-84540eb70b2so395797b3a.2
        for <opensbi@lists.infradead.org>; Fri, 26 Jun 2026 03:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1782469010; x=1783073810; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EVIbVEbYCfSxUaYIPC50od8924dJ7F43Lr/a7np1tHw=;
        b=A5TV2d/9YpXW1eXWhNXoILWHQS5UPYgQRCnaS9jRSYnUHYRQhiWC9r/jHn/0XzdsYx
         gBFmd+f94H5nqfuoPzRf75ZLU0fPKxaN+ADRSoNr7UzRJARb91AdFHFSpg+6MTta38Of
         bI5p8N3DjI93kKPCq08X7jXZR5scVczpabP0E7dEq7c2jrusEIKdBjgUherEcCm/qgCe
         jZgW+kK7fQSwLoJXISTINCpXh9cYXNn3XB9nul+1nFtnJ5lXbBd5OnTyl/I1Fuklh5aH
         XlonXtIfMe8qtcYF9H0oT6n6VACsSCjmHLl3k/yytVDomt6abqprHs+U3CYue8Y+9QBs
         YZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782469010; x=1783073810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EVIbVEbYCfSxUaYIPC50od8924dJ7F43Lr/a7np1tHw=;
        b=Io3Cq/du2HGmkkCWgjJfGdngpESYXWcrizcB+jcImUgnYXaQUp48oYJGqKPFWV79r2
         w0PHNhpB8ZYYxA1GCM0TMSMsr7eV9ydFW9a7qXokrzm+c99DdE1AoZc2wvC8q3LAZnff
         yu34lAdOp7PsiFCDhNCziw45yMefp8yhNuE6ZtqMlQkOrauhfquogZNHCpIotA+aMrK2
         0/FoPllrUQFncSFSaPYhIOVkD2iZ0GlRTPmKyz0w2nVeBsmCBnOkCnxMWMxlgr8qdKYE
         iJ1/yzJ+w4BY4gAPqX2M07adrbSwLAiWUtnJTWleRkswHRTlxTbuxUSaE0V65M3PWyDe
         Dtqg==
X-Gm-Message-State: AOJu0YxZOxoo18QRls0iF5QYTD7DdpQMX5PUe0atWECpJrVky8e+znn5
	MiR0cLYjNn5d0VEbHTkeBP9pss361CORytZBouLmF5MGHbSGKMEmd1NrgAACj3DMwv5XsZOzuuy
	cWrq7O9v/z+wISJpYVkc4nSyWuJpOruCuteRJCsDI719qn2RnYUUuHGH7s1U1N7mGGT3L1mVFhy
	fIpFHD4LS3gB9xtnA/nW2QtS7R1nA65LYw/ALkmPWQrog1kXqgBaY=
X-Gm-Gg: AfdE7cmGVtIPAcw32fHf3dAnXOPS5dLCwnhtdPzP3HCwzErVUrxy8w9cY9kJtJVOaC8
	Z3PbpfhqqfQ2pmwpyNeLa6qKpVCsJj0U8Y5mPWIdZnkXUm3OFvOqxBYxTojzZftqNdevpnj9slC
	Y9YoyJtVwSpOyk1Vqz48EecKi/pZpheoulSKqigkitj3ziDNRxe2frJFNkYRR4yyAQSKdItc3l7
	z7p6wyRXVvqdXl1VVtxv9xBaVY9gkaAXtYnPH7hHRS78p6EHs46IK/XQSljN+KJ/3CIi41SSJG7
	rhSzXu/FM/iTYgQ/eRecCnvdUFr7D0rU/LHDZ98KeRVwFLHxcbCmEY905VDBlNxEwbAfQCUUSbk
	M/6I8efeJmlxUIMCkrK/ewj9TTjB53CMohNMJoSkaFFslXq1Hcb05ZQ9zVCnp+r/nDlx9MI6Mfv
	E4n7zTjOKb6UFxCqwwTEz0b0cZjNqeR+EJcybe
X-Received: by 2002:a05:6a00:1c8e:b0:842:708f:39be with SMTP id d2e1a72fcca58-845b39b0668mr7114498b3a.5.1782469009773;
        Fri, 26 Jun 2026 03:16:49 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a3ec0ec9sm6414226b3a.0.2026.06.26.03.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 03:16:48 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [RFC PATCH 05/12] include: sbi_domain: add Worlds WID fields
Date: Fri, 26 Jun 2026 18:14:26 +0800
Message-ID: <20260626101433.3133466-6-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260626101433.3133466-1-peter.lin@sifive.com>
References: <20260626101433.3133466-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_031650_601915_93B83521 
X-CRM114-Status: UNSURE (   8.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

Adds next_wid (u32 WID for next boot stage), has_next_wid (distinguishes
explicit zero from unset for pmwid fallback), and next_widlist (u64 bitmask
specifying which WIDs can be delegated to this domain) to sbi_domain
structure. Enables per-domain World ID configuration.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 include/sbi/sbi_domain.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/sbi/sbi_domain.h b/include/sbi/sbi_domain.h
index 16edd4ce..7d523493 100644
--- a/include/sbi/sbi_domain.h
+++ b/include/sbi/sbi_domain.h
@@ -211,6 +211,12 @@ struct sbi_domain {
 	unsigned long next_addr;
 	/** Privilege mode of next booting stage for this domain */
 	unsigned long next_mode;
+	/** Next booting stage World ID for this domain */
+	u32 next_wid;
+	/** Whether next_wid was explicitly set */
+	bool has_next_wid;
+	/** Next booting stage World ID delegation bitmask for this domain */
+	u64 next_widlist;
 	/** Is domain allowed to reset the system */
 	bool system_reset_allowed;
 	/** Is domain allowed to suspend the system */
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
