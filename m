Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77509106FD7F
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PqiekFmcznaQ1xmTyAlI1Cr2JtnimOAJXTYa3OXz4CQ=; b=FGErh91PyxprPT
	Lm6LkFiRYPgfSROVgUq0u6gszptpn38AK9pGCs5jjCqpKzNd7FP3EriboKnFsT9+XZ6fDllkKaJ5g
	HMWp/an6H5+yPNaqKjat8kKKNaBF2ZxL4eKyIIc5HEusJPCiXBh0KNwZSuSgxgWwYidnppEHpeBGl
	A4lcOvMEzmE0drihAkB2hZf8ultEQP7yvtNZI5G88suCWOFGOMB+7jyqPM5A/UOzfARuyfgUkKM+t
	I0p4LRVzDnH6IXH9koI0t8aEnSv8wxfuplqtvohnTLYGjwJg3SgHiZiC0L5OthdrJ/xovQ208U8yv
	gAHYR3dUHG/OQyPqNyRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ulj-0000000GZeB-2GCl;
	Fri, 13 Mar 2026 05:09:03 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ulb-0000000GZa7-1ghm
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:09:01 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c648bc907ebso1203520a12.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773378534; x=1773983334; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xafO+FHn/tcABOfSsYiI8MAh86pKbUb1BqbY4MczeRI=;
        b=RMCXqo8VrWD7mbb9DHE8bFOY+SkFSuwfrlRm7peS5U3CHDJWiQH06my/JKFxsADEYh
         2sYoEMpluSy0RNbY9tE3E7MYa6fLW5BdmYnHEhsfmGQq+r/VQjU+NhVEzyX7O3dFdqI5
         7WiA7MZSqTE3rvKBJuNmkKZcfwtKcAXoplHfeRMD9xm72lJjxhM8CBq5NDLR1fa4SEBg
         DxJdruKAnqDluWPx7OrwSL62ECecZLYhiwO75G7z5i7Tr4v0HI3dexyzVKpigCpHxV8y
         PXVAXn22HOcrEs7tZFXfNGx1IpYPZdjgfeR/ns17DOVJv4vS2IcLRpIqnTjL/sRtzKUN
         Drjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773378534; x=1773983334;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xafO+FHn/tcABOfSsYiI8MAh86pKbUb1BqbY4MczeRI=;
        b=mfAKzRQPtPPvg638/an8MLBDD8nJJ4qAnfM+N7CUq9jWLJFJ1sxAg+BSY/wuBtqeZN
         aR0K5c3LU/kIXtIUnJGtPaO5cq+uRgC6SsBUxYFHYbc7cgZO9f4bfuok9ejqU8UC+NEw
         H7QVdB6aBfL1jpoejRvUZ0h1/B+fwFshFrsZTr5KRTSFYz/OJtC/WRv5Rur7XfkdbdsB
         RwHN6NnI1T009JdZMhaHCnm8nYIjF5geVLrfD0Fz2xj7pH1YmllnOV0y2gKdcCNS2Eom
         /8g4aFEwBy7B/8L/TV4Mzv5ttUZw1gjUn0ec4aiqxRGCJUzp0mPfHEVMyBjdu5GTurdb
         uZMA==
X-Forwarded-Encrypted: i=1; AJvYcCUxp4+4GflVWEjFWWsVqgmkrb5AZepJwkEybCFzjt6XNpNdP5FOcqdl2mniKhlKEd5eX0kKzlRC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4QDIrB1t9u5mTTlTUW1N9NhOIVaolf5KG7eQd/L5O+83DvK3D
	Pz5/nl5ATY34/Wv5vkWaSa2Mh6zY1owUMEej+AR29BuhkmPe/yjYhz8xXaJJQQ==
X-Gm-Gg: ATEYQzwmwZvgYUnEo2rgIss+/3vWfqmnyw00E16cMNVvV7B7y6jcNxFBM6FdJMdvR4D
	+XkYc4lQezM3k2JcnmJ1OvQ119FNpd44kXIf4jQ74dfCNxta5lHQT74TbWpqm6Lo6AU1ehWHgy2
	sZXk3atA3gIE6ND18iruHi7HGo57y531eBHm1CcgbswSrg2HILwa4ENO+dWeZN49RX7AXfgQcAb
	2h3vM+8YxVfj9NAwyo6vIUT/zp6HsYWYib3v7sAG/OysnoR9bcfFJJ0P7yXpJm2dCr8IS5qlaY8
	Fsw3GLKn1YHGUO/Rl0dggFcmwIcB4sOY2SAVgX6PejJoWH1S5rDSjx9DuX5lGqHnF8c6GLvM2+z
	FnOcjSmZAY1GgfE+7qLBMT1V+dqbx4lqKIvuaBQDRmlW0deJmraZDq8YNZJsAtOTwk3Eux1e1ij
	2pNrH8rWnhMUzu+72TenDk+/7U8Gy1QUBprab+3qFZwYDBelCqSvNsdzFPfHfmocCzGFpW
X-Received: by 2002:a05:6a21:6190:b0:398:8766:4d0a with SMTP id adf61e73a8af0-398eca9db12mr1654088637.19.1773378534287;
        Thu, 12 Mar 2026 22:08:54 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97a1d7sm676221a12.6.2026.03.12.22.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:08:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	opensbi@lists.infradead.org
Subject: [kvm-unit-tests PATCH 2/2] riscv: dbtr: Add initial API corner case / error handling tests
Date: Fri, 13 Mar 2026 15:08:31 +1000
Message-ID: <20260313050831.4016944-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313050831.4016944-1-npiggin@gmail.com>
References: <20260313050831.4016944-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_220855_489020_E149C97A 
X-CRM114-Status: GOOD (  15.64  )
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

The SBI DBTR specification has quite detailed API requirements
that are easy to get wrong. This implements the beginning of
testing some corner cases, not with trigger behaviour but with
API behaviour.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
These tests expose a bunch of major and minor errors in OpenSBI
handling, for which I will post patches to the opensbi list. As
well as possibly a bug in the SBI spec, reported here.

https://github.com/riscv-non-isa/riscv-sbi-doc/issues/257

Thanks,
Nick
---
---
 riscv/sbi-dbtr.c | 314 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 314 insertions(+)

diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
index 489242b0..156b743b 100644
--- a/riscv/sbi-dbtr.c
+++ b/riscv/sbi-dbtr.c
@@ -423,6 +423,318 @@ static enum McontrolType dbtr_test_type(unsigned long *num_trig)
 	return SBI_DBTR_TDATA1_TYPE_NONE;
 }
 
+static struct sbiret dbtr_test_api(unsigned long trig_max)
+{
+	/* + 1 so overflow can be tested */
+	static struct sbi_dbtr_shmem_entry shmem[RV_MAX_TRIGGERS + 1] = {};
+	static unsigned long test[RV_MAX_TRIGGERS + 1];
+	unsigned long tdata1;
+	unsigned long trig_type;
+	struct sbiret ret;
+	int i;
+
+	/*
+	 * This set of tests is to test API response, not hardware/trigger
+	 * behaviour, which is left to later tests.
+	 *
+	 * Notably absent from these API tests at the moment are:
+	 * - Enable/disable tests.
+	 * - trig_state verification.
+	 * - Testing more valid and invalid tdata1/2/3 values.
+	 */
+
+	trig_type = dbtr_test_type(&trig_max);
+	tdata1 = gen_tdata1(trig_type, VALUE_LOAD | VALUE_STORE, MODE_S);
+
+	/* + 1, so overflow can be tested */
+	memset(shmem, 0, sizeof(shmem));
+	for (i = 0; i < RV_MAX_TRIGGERS + 1; i++) {
+		shmem[i].data.tdata1 = tdata1;
+		shmem[i].data.tdata2 = (unsigned long)&test[i];
+	}
+
+	report_prefix_push("api");
+
+	report_prefix_push("no_shmem");
+	ret = sbi_debug_read_triggers(0, 0);
+	sbiret_report_error(&ret, SBI_ERR_NO_SHMEM, "sbi_debug_read_triggers");
+	report(ret.value == 0, "read return value");
+	ret = sbi_debug_install_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_NO_SHMEM, "sbi_debug_install_triggers");
+	report(ret.value == 0, "install return value");
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_NO_SHMEM, "sbi_debug_update_triggers");
+	report(ret.value == 0, "update return value");
+	report_prefix_pop();
+
+	report_prefix_push("shmem");
+	ret = sbi_debug_set_shmem_raw(1, 0, 0);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_set_shmem unaligned");
+	ret = sbi_debug_set_shmem_raw(0, -1, 0);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_ADDRESS, "sbi_debug_set_shmem bad address");
+	ret = sbi_debug_set_shmem(shmem);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_set_shmem");
+	ret = sbi_debug_read_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers");
+	ret = sbi_debug_set_shmem_raw(-1, -1, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_set_shmem unset");
+	ret = sbi_debug_read_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_ERR_NO_SHMEM, "sbi_debug_read_triggers");
+	report_prefix_pop();
+
+	ret = sbi_debug_set_shmem(shmem);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_set_shmem");
+
+	report_prefix_push("read triggers");
+	ret = sbi_debug_read_triggers(0, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers 0, 0");
+	ret = sbi_debug_read_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers 0, 1");
+	ret = sbi_debug_read_triggers(trig_max - 1, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers trig_max - 1, 0");
+	ret = sbi_debug_read_triggers(trig_max - 1, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers trig_max - 1, 1");
+	ret = sbi_debug_read_triggers(trig_max, 0);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_read_triggers trig_max, 0");
+	ret = sbi_debug_read_triggers(trig_max, 1);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_read_triggers trig_max, 1");
+	ret = sbi_debug_read_triggers(0, trig_max);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers 0, trig_max");
+	ret = sbi_debug_read_triggers(1, trig_max);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_read_triggers 1, trig_max");
+	ret = sbi_debug_read_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers 1");
+	ret = sbi_debug_read_triggers(0, trig_max);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_read_triggers trig_max");
+	report_prefix_pop();
+
+	report_prefix_push("install triggers");
+	ret = sbi_debug_install_triggers(0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 0");
+	ret = sbi_debug_install_triggers(trig_max + 1);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_install_triggers 0");
+
+	shmem[0].data.tdata1 = gen_tdata1(trig_type, VALUE_LOAD, MODE_M);
+	ret = sbi_debug_install_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_install_triggers 1 invalid");
+	report(ret.value == 0, "error index 0");
+	shmem[0].data.tdata1 = tdata1;
+
+	if (trig_max > 1) {
+		shmem[1].data.tdata1 = gen_tdata1(trig_type, VALUE_LOAD, MODE_M);
+		ret = sbi_debug_install_triggers(2);
+		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_install_triggers 2 invalid");
+		report(ret.value == 1, "error index 1");
+		shmem[1].data.tdata1 = tdata1;
+	}
+
+	ret = sbi_debug_install_triggers(1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+	report(shmem[0].data.tstate == 0, "install index 0");
+	ret = sbi_debug_install_triggers(trig_max);
+	sbiret_report_error(&ret, SBI_ERR_FAILURE, "sbi_debug_install_triggers trig_max");
+	report(ret.value == trig_max - 1, "error index trig_max - 1");
+	if (trig_max > 1) {
+		ret = sbi_debug_install_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+		report(shmem[0].data.tstate == 1, "install index 1");
+
+		ret = sbi_debug_uninstall_triggers(0, 1);
+		if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1")) {
+			report_prefix_pop();
+			goto out;
+		}
+
+		ret = sbi_debug_install_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+		report(shmem[0].data.tstate == 0, "install index 0");
+
+		ret = sbi_debug_uninstall_triggers(1, 1);
+		if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 1 1")) {
+			report_prefix_pop();
+			goto out;
+		}
+	}
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1")) {
+		report_prefix_pop();
+		goto out;
+	}
+
+	ret = sbi_debug_install_triggers(trig_max);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers trig_max");
+	ret = sbi_debug_uninstall_triggers(0, (1UL << trig_max) - 1);
+	if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 (1ULL << trig_max) - 1")) {
+		report_prefix_pop();
+		goto out;
+	}
+
+	/* Try to detect overrun by looking at the return value */
+	report_prefix_push("overrun");
+	shmem[trig_max].data.tdata1 = gen_tdata1(trig_type, VALUE_LOAD | VALUE_STORE, MODE_M);
+	ret = sbi_debug_install_triggers(trig_max + 1);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_install_triggers trig_max");
+	report(ret.value == 0, "value overrun check");
+	shmem[trig_max].data.tdata1 = tdata1; /* restore valid */
+	report_prefix_pop();
+
+	report_prefix_pop();
+
+	report_prefix_push("update triggers");
+	ret = sbi_debug_update_triggers(0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_update_triggers 0");
+	ret = sbi_debug_update_triggers(trig_max + 1);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_update_triggers 0");
+
+	shmem[0].data.tstate = 0;
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_FAILURE, "sbi_debug_update_triggers 1 not mapped");
+	report(ret.value == 0, "error index 0");
+
+	shmem[0].data.tstate = trig_max;
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_update_triggers 1 idx == trig_max");
+	report(ret.value == 0, "error index 0");
+
+	ret = sbi_debug_install_triggers(1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+
+	shmem[0].data.tstate = 0;
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_update_triggers 1");
+
+	/* Update 2 both with same index */
+	shmem[1].data.tstate = 0;
+	ret = sbi_debug_update_triggers(2);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_update_triggers 2");
+
+	shmem[0].data.tstate = 1;
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_FAILURE, "sbi_debug_update_triggers 1 not mapped");
+	report(ret.value == 0, "error index 0");
+
+	shmem[0].data.tstate = 0;
+	shmem[1].data.tstate = 1;
+	ret = sbi_debug_update_triggers(2);
+	sbiret_report_error(&ret, SBI_ERR_FAILURE, "sbi_debug_update_triggers 2 not mapped");
+	report(ret.value == 1, "error index 1");
+
+	shmem[0].data.tstate = 0;
+	shmem[0].data.tdata1 = gen_tdata1(trig_type, VALUE_LOAD, MODE_M);
+	ret = sbi_debug_update_triggers(1);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_update_triggers 1 invalid");
+	report(ret.value == 0, "error index 0");
+	shmem[0].data.tdata1 = tdata1;
+	if (trig_max > 1) {
+		ret = sbi_debug_install_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+		report(shmem[0].data.tstate == 1, "install index 1");
+
+		shmem[0].data.tstate = 1;
+		ret = sbi_debug_update_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_update_triggers 1");
+
+		shmem[0].data.tstate = 0;
+		shmem[1].data.tstate = 1;
+		ret = sbi_debug_update_triggers(2);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_update_triggers 2");
+
+		ret = sbi_debug_uninstall_triggers(1, 1);
+		if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 1 1")) {
+			report_prefix_pop();
+			goto out;
+		}
+	}
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1")) {
+		report_prefix_pop();
+		goto out;
+	}
+
+	/* Try to detect overrun by looking at the return value */
+	report_prefix_push("overrun");
+	ret = sbi_debug_install_triggers(1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers trig_max");
+
+	for (i = 0; i <= trig_max; i++)
+		shmem[trig_max].data.tstate = 0;
+	shmem[trig_max].data.tdata1 = gen_tdata1(trig_type, VALUE_LOAD | VALUE_STORE, MODE_M);
+	ret = sbi_debug_update_triggers(trig_max + 1);
+	sbiret_report_error(&ret, SBI_ERR_BAD_RANGE, "sbi_debug_install_triggers trig_max");
+	report(ret.value == 0, "value overrun check");
+	shmem[trig_max].data.tdata1 = tdata1; /* restore valid */
+
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	if (!sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1")) {
+		report_prefix_pop();
+		goto out;
+	}
+	report_prefix_pop();
+
+	report_prefix_pop();
+
+	report_prefix_push("uninstall triggers");
+	ret = sbi_debug_uninstall_triggers(0, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 0");
+	ret = sbi_debug_uninstall_triggers(trig_max, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers trig_max 0");
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_uninstall_triggers 0 1");
+	ret = sbi_debug_uninstall_triggers(trig_max, 1);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_uninstall_triggers trig_max 1");
+	ret = sbi_debug_install_triggers(1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+	report(shmem[0].data.tstate == 0, "install index 0");
+	ret = sbi_debug_uninstall_triggers(0, 2);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_uninstall_triggers 0 2");
+	ret = sbi_debug_uninstall_triggers(0, 3);
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_uninstall_triggers 0 3");
+	ret = sbi_debug_uninstall_triggers(0, 1);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1");
+	if (trig_max > 1) {
+		ret = sbi_debug_install_triggers(2);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 2");
+		report(shmem[0].data.tstate == 0, "install index 0");
+		report(shmem[1].data.tstate == 1, "install index 1");
+		ret = sbi_debug_uninstall_triggers(0, 1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1");
+		ret = sbi_debug_install_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+		report(shmem[0].data.tstate == 0, "install index 0");
+		ret = sbi_debug_uninstall_triggers(1, 1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 1 1");
+		ret = sbi_debug_install_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+		report(shmem[1].data.tstate == 1, "install index 1");
+		ret = sbi_debug_uninstall_triggers(0, 2);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 2");
+		ret = sbi_debug_install_triggers(1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 1");
+		report(shmem[1].data.tstate == 1, "install index 1");
+		ret = sbi_debug_uninstall_triggers(0, 3);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 3");
+		ret = sbi_debug_install_triggers(2);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_install_triggers 2");
+		report(shmem[0].data.tstate == 0, "install index 0");
+		report(shmem[1].data.tstate == 1, "install index 1");
+		ret = sbi_debug_uninstall_triggers(1, 1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 1 1");
+		ret = sbi_debug_uninstall_triggers(0, 3);
+		sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_uninstall_triggers 0 3");
+		ret = sbi_debug_uninstall_triggers(0, 1);
+		sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_uninstall_triggers 0 1");
+	}
+	report_prefix_pop();
+
+out:
+	ret = sbi_debug_set_shmem_raw(-1, -1, 0);
+	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_set_shmem unset");
+
+	report_prefix_pop();
+
+	return ret;
+}
+
 static struct sbiret dbtr_test_store_install_uninstall(struct sbi_dbtr_shmem_entry *shmem,
 						      enum McontrolType type)
 {
@@ -838,6 +1150,8 @@ void check_dbtr(void)
 	if (!num_trigs)
 		goto exit_test;
 
+	dbtr_test_api(num_trigs);
+
 	trig_type = dbtr_test_type(&num_trigs);
 	if (trig_type == SBI_DBTR_TDATA1_TYPE_NONE)
 		goto exit_test;
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
