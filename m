Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BDAEB5954
	for <opensbi@archiver.kernel.org>; Wed, 11 Feb 2026 10:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNbxkM+J3W5Ok8lqs29Ov7EVaOv8vbj3pHReDE80Qdc=; b=HllZH3NXxmnRuT
	PKswzkVZxju0xgQkFEPueCbcPRzyjUasR4L2W1OebgSpLeiqzs1NeY5ROZGxGtreycM8nsIr2StX5
	Liz05wBT3eGNgN5/ZWzyhROz5TSpP9eSR4e1opQ4KkS/UGqOnDsxBLsJchn2XF/o2rzxyrT7DVM8K
	edy9WTfYjvkgXc+GJoClbG/wHsqZxaLJ3yYS75vi7XglkDvvPlodzCBmZVlU7V90nzcEyfvjCW7FU
	tUn6BSJyYdeTh5JhAneze7uaMnsuB9ijdHyuic2g645AJ3FLWymBr2wENFF74kAtSenL1J8A1aeci
	cucDdKnmWRojSW8PUu3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq71F-00000000TEn-013h;
	Wed, 11 Feb 2026 10:00:25 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vq719-00000000TEF-08gM
	for opensbi@lists.infradead.org;
	Wed, 11 Feb 2026 10:00:21 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43622089851so1679498f8f.3
        for <opensbi@lists.infradead.org>; Wed, 11 Feb 2026 02:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770804017; x=1771408817; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ihZJxsOoWcjwksMgu9Jk1Iskn3hPc55eYnm3G2Fw+M=;
        b=mejGspZGw9PQskOXFcXuVPKPTyAFQK7dRNneFAUZBINXKh9Nnz7E8eVkr/MF1cwTGy
         yCXHxNig4E04th4vb+q8PUIjtLm6vnGsWeccVOC/uOzSBFX9TRqdgZYm6NH5cP1bRqu4
         2bQFTOtPyeqDouuFcW74nPfp3UGVzSqFnEAHRB1/gws2tfrglzfF2mwH41twGQDPJsBv
         r4WMIM8cgSzW6q1LZnhq+SuYkqRdmtoL2M0je9fTfjF6z5MDel/aeysdwsfzAii/KjDu
         gncxP9kGm8psJBgWGREZKRYYH7J7eO+RDZu2PZPTH5u+e0uZXa+UdgCytf9NNiOG1RAU
         zCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770804017; x=1771408817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ihZJxsOoWcjwksMgu9Jk1Iskn3hPc55eYnm3G2Fw+M=;
        b=d1xDfEg/LDcIPOPhX/CWgYnIscElgKyFCA6nDmB744hiPfEWbUoj1o7empjsDKXMf5
         Z5EuHNtfOrEZeR54pjwZdInSPMIfgAxOauFCw+dy1B1eD4gXHdf/9D85ldptogsuVG9U
         nvqaZcguQtRD1h/ESqmtdbPGwnTGn/XHVcd2JhFkMEglZvScRrOPoSEwnxFaXvTesKu5
         KbZgV+oQOETYgL0dsQk+LnCCMeJbaEkBWxtciKrJpLuPkj3PBSoZRD8X8B7S/VzFg9Ph
         YsZaBWSGK1ihDcuY2FWTwoMnd8OeR3no2DtOsstR1smrRfiVziyY0na/uZUb2UMSp/Rq
         4INQ==
X-Gm-Message-State: AOJu0YzgBj1GJRRIEYyK1iwICzlb3ckRMkb1vLmiP/VKDm2i+Z6GUhck
	d8uag+8c7JpEM3R0w7gwi55/5Hs1zwlBsxiRf1itXoXkM1KkFAzLb6VYVkLzUlqKtosyDfQaFvi
	6HND5BTg=
X-Gm-Gg: AZuq6aLSYWfm9BxEEIf993jQ6hBRrAUv+RDuaRj5vzAain7JIQhykMTEbo3LG1aEE+D
	5bqh/Hhk1aYRI7s5tZSFs6YU7uzVsrlmnLPuEtecX/3dOqWAfRTKXdryHmsKiuxCB5KDy2OZyaP
	nNOOR2JQeoliOjPy9bVSL8phmkZ600EQoMm60Q2pHbvIPAkGsME8GgBxftOM7ZwbAHet/XqybaY
	Rzx4se6SrwyrEWKwtwkwjHnuadr6qNzgsiauzKkRHe5bl7VuXvQ/Q7mcS7l60xktNUiI7XAoFJ4
	fXkZutTeLXIhlCGl3MpM4Gf/UOuPx++CyN3QKu/YRcwUX0p6+oFfxR4cPC2PVYVcqDKuXrwrslK
	YmM02pftIiMt56gzfE/cUt666Dbu0jdcdNXAkd1re90f21/efN04PZkA2RM6ISsfcYJQgfo3miD
	zXrg5cUZ/YMcDTNt2yKZ+nKZv0+x2tlvJYp/WiQN/H3WFlPG95IoqYT3RAPqr37MciiUTddqfmP
	5EfSQ==
X-Received: by 2002:a5d:5c8a:0:b0:430:fd84:315a with SMTP id ffacd0b85a97d-43629381a52mr25599916f8f.39.1770804016889;
        Wed, 11 Feb 2026 02:00:16 -0800 (PST)
Received: from Dev-EliteBook.Home (97e782b0.skybroadband.com. [151.231.130.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e0196bsm3631364f8f.23.2026.02.11.02.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:00:16 -0800 (PST)
From: dave.patel@riscstar.com
To: opensbi@lists.infradead.org
Cc: Scott Bambrough <scott@riscstar.com>,
	Dave Patel <dave.patel@riscstar.com>,
	Ray Mao <raymond.mao@riscstar.com>,
	Robin Randhawa <robin.randhawa@sifive.com>,
	Anup Patel <anup.patel@qti.qualcomm.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anuppate@qti.qualcomm.com>,
	Dhaval <dhaval@rivosinc.com>,
	Peter Lin <peter.lin@sifive.com>
Subject: [PATCH] Trap and Emulate changes
Date: Wed, 11 Feb 2026 10:00:10 +0000
Message-ID: <20260211100010.4082-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_020019_069384_E18EC36E 
X-CRM114-Status: GOOD (  10.80  )
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

From: Dave Patel <dave.patel@riscstar.com>

Signed-off-by: Dave Patel <dave.patel@riscstar.com>
---
 lib/sbi/sbi_illegal_insn.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index fa82264a..88079e39 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -110,10 +110,33 @@ static int system_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 	return 0;
 }

+static int sbi_get_emulated_irq_insn(ulong insn, struct sbi_trap_regs *regs)
+{
+	ulong rs1_val	= GET_RS1(insn, regs);
+	ulong rs2_val	= GET_RS2(insn, regs);
+	//ulong prev_mode = sbi_mstatus_prev_mode(regs->mstatus);
+	ulong irq_val;
+
+	/*
+	// This is were the emualted irq vlaue is fetched
+	if (prev_mode == PRV_S && sbi_emulate_irq_read(&irq_val))
+		return truly_illegal_insn(insn, regs);
+	*/
+
+	// For testing
+	irq_val = rs1_val + rs2_val;
+
+	SET_RD(insn, regs, irq_val);
+
+	regs->mepc += 4;
+
+	return 0;
+}
+
 static const illegal_insn_func illegal_insn_table[32] = {
 	truly_illegal_insn, /* 0 */
 	truly_illegal_insn, /* 1 */
-	truly_illegal_insn, /* 2 */
+	sbi_get_emulated_irq_insn,   /* 2 */
 	misc_mem_opcode_insn, /* 3 */
 	truly_illegal_insn, /* 4 */
 	truly_illegal_insn, /* 5 */
--
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
