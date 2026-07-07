Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A743C43458
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WT+fwtvEasNaBD4EPvjoWubgwyEKzxE564zJaiXB+8c=; b=fm7pTDpFrP6LAw
	kF/KmCj42go1VGY+jf4xsRB/zJoRcNhA/4bU5rg6rddjWEFnLObZa6IitWIlRP3ukjDvMuvQmXuKQ
	BJqRMARntlYFKQXVhmFCgm92JfJ60vZCkoqZNMK4R6V5GKUYRYst/2MZh8w6uxswlnfKw2o6SMHJE
	A3BOXEPnr92++5ybv7U1vCBaQWrABN6yG4zojOBOd7ce9XwpdoD7jh9UgcviVE7lURbusf6a2HRB/
	VAFzimNyeygruZdod2L3znI1DwYw5eUrz8JxYeMYVYxFh0YUEl6UItDf/lJxHmTO7tVP0NQgUgSZL
	M/Zds9NEGMRR4sZ+S8Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfJ-0000000E199-0CEp;
	Tue, 07 Jul 2026 03:40:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfB-0000000E161-37HP
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:04 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-38426d04bb4so146715a91.1
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395601; x=1784000401; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GgEnca6giCUnjFWl7xonIatFbSK3T7fVAd/t3WtZA2w=;
        b=ZbgqSvZH8OV2vNaNudMVYncGOTYtDSnpRGuT49ESNbOBSciwNQUwwoFgXjRSLou5bR
         YhqTchJjThNl57KAibVrgH8dPxYS4NEgbfhDpbKQ4qQNXp3foIeERG3M5Vd8kMq4Ck9A
         ZxeDUABEnupKez1b3fr9AQCBNS9H0Bvt4Vgq1+/sRuEYyNxRbpaKVmvGI3NO21P+ZjNq
         Psj0N6fp1leystK7PpBVyq4BYPzBW8oq9Dz7UF6RslySRv5gKBJ7lPSX4XQkgacNAXWH
         EZrHdQ4UtIzD2fXw7e22nyiNPUFT5pqLXOHPR5Lk1yoglKh7JVItvUp6a1l4WLcMKRtS
         z5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395601; x=1784000401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GgEnca6giCUnjFWl7xonIatFbSK3T7fVAd/t3WtZA2w=;
        b=CyXeYwccusPYhMvEuIoIyTEQWHqsm4eKy3gPA0fK/zuLD/57qbOTTATdXlhnbPAz1u
         DpqH14e8SiY7Onr1d9anJAKdmNAGx6LppYC/ydX7MePuTQHaEURslCdTodVwQQnsRsyu
         aCQguLu0Yy9VE9TFohQnyN4DnNIHuhbnYoB7/Ba1N7IFa1gKSzy+LuzMnh7BiOGtxLdH
         Kl9A1gGvtiUIOHg9kbDCAGQIpyZFZUEkuSi02BoQBFtCZicJwLLecwOFpEtsKDigMFjP
         57V3s9FSyuRmrj6veYxRknFgJbmiL344razetjTgMe7DgOByQrN0yI+eGkEDmEVTLRs/
         aYaQ==
X-Gm-Message-State: AOJu0Yx2AZEd1gRytHGKar3mw42pJ51TPWF8cEh/8MnJSXwNEC8HFo/Z
	tqagZOSW8CzRMdZJJmpla1bIgatHuQs/nyNvFNLHyQcgxkXKRbo+rjFp20SBQ/O0dWfwuKhr0v0
	a68AxzRqcQCedeLnTX4HvxfDz17jPKztMFOXSnyABtPI4YXCsjgxlXmFLX2fCAzZ6i8i8f08gwz
	VwnfXq7ufNOCGDU4pNDjsAqMdDxWZ/lxnmOeWK0TmxY5iMoWpX
X-Gm-Gg: AfdE7clbG4akrBbIMBh4rNsXwyDc16EZl7LB2nZLEafRjdvMaW6RfvBZK28wK5enluk
	jKDy11qnkB3BV3AbABf4r9BBRRv7WBGmX/PvgsYF7/2y+LWcIyOt2ZG8d+OZ5A6JnetCHQL5J4I
	EfPyf5JEO8JN0m9OQXAk/mNlERDffUnQ4BheoZZssu8Le58ExEGFyYEvIt5IHcsuucD+Cbr8VGR
	7w8TDtDMtLAaUity6MKDkifOyMJSEHhNboImAf0r6Z2X4/0RwNSTDyxmFA4Z9OuSu7hT+J1yZwr
	Q/RGaLDE7hf2qOTgIj03T33JvP/7qbj53HuBIB8OBcxyIrjVrGQU/3UczmGV5dDR2YVgmB3RA3v
	sar4yOhRXdEuXa9X0x9FzdtDWMIJEcnxf8VOhLHGeKodl6zOA0jpRf0Qb99j51eKRunzEEpf6Eo
	t8urkgjvFe5iUFLADhu4U97HL+
X-Received: by 2002:a17:90b:3a48:b0:37f:ee3a:12a with SMTP id 98e67ed59e1d1-387d6b978a7mr1250039a91.2.1783395600484;
        Mon, 06 Jul 2026 20:40:00 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:40:00 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 4/7] firmware: fw_base.S: call fw_dynamic_append_boot_args on cold boot
Date: Mon,  6 Jul 2026 20:39:51 -0700
Message-ID: <20260707033954.2054859-5-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_204001_791553_7B8680B0 
X-CRM114-Status: UNSURE (   9.16  )
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

When building the FW_DYNAMIC_APPEND firmware type, the previous booting
stage jumps directly to _start without setting up a0/a1/a2. Add a single
guarded call at the very top of the cold _start path to
fw_dynamic_append_boot_args(), whose implementation lives in
fw_dynamic_append.S.

The call is wrapped in #ifdef FW_DYNAMIC_APPEND, which is only defined by
fw_dynamic_append.S, so FW_DYNAMIC, FW_JUMP and FW_PAYLOAD compile and
behave exactly as before. Only the cold boot path is touched, secondary
HARTs continue to enter through _start_warm.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 firmware/fw_base.S | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/firmware/fw_base.S b/firmware/fw_base.S
index 0c5c65c1..91a17efb 100644
--- a/firmware/fw_base.S
+++ b/firmware/fw_base.S
@@ -46,6 +46,17 @@
 	.globl _start
 	.globl _start_warm
 _start:
+#ifdef FW_DYNAMIC_APPEND
+	/*
+	 * FW_DYNAMIC_APPEND entry fixup (cold boot path only).
+	 *
+	 * For this firmware type the previous booting stage does NOT pass the
+	 * usual a0=hartid, a1=dtb, a2=fw_dynamic_info arguments. It merely
+	 * patches the fw_dynamic_info structure appended at the tail of this
+	 * binary (right before .bss, see fw_base.ldS) and jumps here.
+	 */
+	call	fw_dynamic_append_boot_args
+#endif
 	/* Find preferred boot HART id */
 	MOV_3R	s0, a0, s1, a1, s2, a2
 	call	fw_boot_hart
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
