Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB48AEA3F35
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 10:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uNbxkM+J3W5Ok8lqs29Ov7EVaOv8vbj3pHReDE80Qdc=; b=CPzwh7ZxngAhn6
	w5AAgX4KhY4HNZKDUgB3ljgoWapmGe4P6mkvrZwo2JzWVvM+lU4caBFbYMsrka4CU0Gp5WJfVwajv
	E03Cq4A7D5rnuFf1YGNrOvvm0omjkKNeC3VTvSJJeyGXWGCoBw87xmjfACU6xXAuELM+6k96UYrsJ
	xlvRAseIofUAsQAd0BLwbWhd0qCdjFG6w1/jLcGU6W79/NH8UdxkdAqKqCGUfVi/nRNRa0aQz6mzw
	QyVhy1SEHDui+rgGG9trTRVSg9L3G+J3xiXVevONbjCoQ4/QrQ9QMtKr96btpP4hXXxthDvsq5Fir
	LKn4R9lKizebmBi77lhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpl2A-0000000GqBt-4AJm;
	Tue, 10 Feb 2026 10:31:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpl27-0000000GqBW-2Wch
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 10:31:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4806bf39419so39885165e9.1
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 02:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1770719509; x=1771324309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8ihZJxsOoWcjwksMgu9Jk1Iskn3hPc55eYnm3G2Fw+M=;
        b=dxKc2T6MmNzBDY5T/joNrHRP4j9f8+4BMIwIVzxvnDd4jH3dezlaE0j2E7wIhW6GXm
         v2cFByafwedFx5YVsve0hS5+KtQU1rrwMOTiauOPjwhpJBcWSfc8XW2MIIi3Ckw7NQHW
         GRylSsUtyk9HjuRUr1PFynit59KntqlFwY88nY8OcA+SkHXKmWemtXXEwQI9EpE5e0Tl
         ErGaxcJ2WBTrT9CJG8PCZQYbLa9HfKJaSaf0f2EIfugqhytcNWtZnttOQkYqb7jmwh1/
         Th8lWm/zzlOffsmeDkaqQV6CCUcanDvC9Dqy0VAkr2FM3A5V3RSLRZxE7QTMkX+VYckg
         7xGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770719509; x=1771324309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ihZJxsOoWcjwksMgu9Jk1Iskn3hPc55eYnm3G2Fw+M=;
        b=gZA2beUZ6pLJUx+KXY9s3szW+jWpP9ZfGyv3MldWY7MobPxKjrfRWx7Bnp23+kk1ax
         vg0IRBSTgSgqR6EUxKaIpne4aiQWW349Elb4CNU80IxAdQis7/Y4Mv9+e/RQekjdjtSG
         9DBlE68nxAnCCfPnNtHS5Ib3tw5pGaREpY9NRwoarYtUIEiJHzOu9T4tpBNslWTd+Ffy
         o65NqweMpZxVs+SyS0ulkuhJG7doCGtpT97PpFfMN63ynCfTQQOlrjKbPkl85oIwLw4E
         +6qHvyxY/shDttoUm7v/YReuWxdV9SBpeX2XplzSCT9Bpq4z45Z/+dfgwFHn+tGdR8KA
         O9sA==
X-Gm-Message-State: AOJu0YxWhJAO16VUPOW29biBuZlE1hFmHaShCo+jKwWwDUdpul0s936u
	pI26mAWp/ZirjRT/sTaYhS3U8kA5t9sUvNdfJtLFydTnp72mIsh5LnjL0w9g0Pd3QguiZYTbtU5
	n7Dsx
X-Gm-Gg: AZuq6aKKnDeaebLySW59wqYWZSvGtUtB4k8v8tDwR8ArAk8ZpIu7ZS+HKX2abzvsGOP
	/0RHh0rc8MMTar8d4i+UgZDY8DSn6hcC53+Ni+6rX4Fe6SlTzWnzn5457FV87PGLUMA9+N96qrL
	GA+yuPPj5u996KFeRFUIyQIPpVheYUavlw2RA2oaebYxS5fFQjm3feW5giEmscJ/NOXDnxFSOHm
	J+0lqLJOKB6iyWEwD9YxBoj8T7FzMIwCneXBC0FsAUTQZEA/D20YeMl8vMDgDkq4QIuVpXqycuK
	b5Y4vGQApre8TlRIkuAkHwuNc16MRDr7Iz5KGPZbJsXVCbIzR9btc4E4iphVTQ+GAjzR0QmcSDf
	2geynkP/Scxl5Ed8I1uBx7XKA3T2r9Hytb0tC5HKH/x8BqF5nryBukZ14wwJYiCPtIjjKdfaZF1
	K5QFoORmA6nj/wmUfiORdcxnajaRGJz2YI96IcuA==
X-Received: by 2002:a05:600c:3e1a:b0:480:1c1c:47d6 with SMTP id 5b1f17b1804b1-483505116camr25509035e9.6.1770719509000;
        Tue, 10 Feb 2026 02:31:49 -0800 (PST)
Received: from localhost.localdomain ([78.41.211.48])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483209af8e0sm192183095e9.5.2026.02.10.02.31.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 02:31:48 -0800 (PST)
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
Date: Tue, 10 Feb 2026 10:31:25 +0000
Message-ID: <20260210103125.2751-1-dave.patel@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_023151_895477_CD6F96C3 
X-CRM114-Status: GOOD (  11.51  )
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
