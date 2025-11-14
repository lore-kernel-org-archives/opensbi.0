Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A72CEACCE
	for <opensbi@archiver.kernel.org>; Fri, 14 Nov 2025 20:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUMcgzOQfWr6lgb4dorPsz4ogvCjH20mYl1nFZfTLC4=; b=O3gA9Orz0qbs0I
	nIsTxnKVrUFyO0cKP13GcehWaYfaVXtxGustVtHOcUh9uUF7H84pjNLBC6h+7lvUlWiViPes4nmcC
	XFYr6rnCO83LQ0OV8Q3ihyEjjCZ4n/NThzXOTZRXnUbSjNXVesZUUim57xc5MVsUsc0DKsvNGtvtB
	ahdTg2yBg0HdwbS+AFcrwnjejZt30EmotCid3jklr7ZNXCAXG5m25leLOtI1+OB04Eyo5oPOrJKAe
	11GE6IHVsiTl9XB1CKZPPWdRd8sUl00WMHUQS1OrTrRRTIG/srmg8Xb7HvCJkFl+LcIRYarAAUam5
	0llvsYDr+eRTCemhdZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZU-0000000D5kX-0iES;
	Fri, 14 Nov 2025 20:39:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK0ZS-0000000D5hy-1mq7
	for opensbi@bombadil.infradead.org;
	Fri, 14 Nov 2025 20:39:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6g0h7nVGRATgelfN/f3nPirrtMTjn4y/MCwWQogelgc=; b=Y1xsN6ppLx5Jvm759PCzVyKVi8
	Jc6CBX1FnhcWr/2XPeifQFnATTKgSrWY39HqK/NCwzfw+Lf964gCld1MgvIkFPaywTFZgG6YQ7XFX
	KjeNaTI0ZK9/SHezsf7q3rCaOzdYgGbcd+jRtj7Ox8xMncKxLi6edBlc3P/0glEg78UL5RrcRS0zL
	IpDcflfLa10QjJjAatsPCI0RlwsT5f/I4uEM38vNCN7zLBLKRmNF0SAm0bWA+T/lCfM3ja6FRDVHR
	qyuBoNLeKVe3EFQsd0hE8Plztl7fOf4dDsCAe2CqBx16ywejv+W+JVXBHqDQy4OPoa7kjO5s1/y19
	g8OD+Fpw==;
Received: from mout.gmx.net ([212.227.15.19])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJzhl-00000003TzV-0Gyo
	for opensbi@lists.infradead.org;
	Fri, 14 Nov 2025 19:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1763152738; x=1763757538; i=b.freisen@gmx.net;
	bh=6g0h7nVGRATgelfN/f3nPirrtMTjn4y/MCwWQogelgc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eb4vcDwZhTcsQitDPysrATbbdmuc7DsavBGBSoHadbOG/FaDiE8781nxm6bnNwP3
	 YpLn831+H9p9j10y6/uqecxE+0IL1TKZn1cIhcALhZPkfzWvGkukeaeIvbsboW8JJ
	 QL5H7uKuhSVdC2ya57YQHoAR7hGueyhXOuUfpPnt1ndRV30TcT4PBqvKcWdO5L1a0
	 MEhtFdcaoWqU4ROvkZ5sN7XbPQ0E4+3wZnCwZC2Ml65uq2XHSXUJU91dW/ScKwE9n
	 ZeAsZSwHT7ZQph1zpr1UDBAixs+mB5AJAEl4yB+fSVrxRmLOOrHb6kI16EiehQXKa
	 ABCmfXW70tDECgJVkA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.138]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N17UW-1wLE642yGg-00s6an; Fri, 14
 Nov 2025 21:38:58 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v2 5/7] lib: sbi: Workaround for FENCE(.I) errata on C906, C910.
Date: Fri, 14 Nov 2025 21:38:40 +0100
Message-ID: <20251114203842.13396-6-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114203842.13396-1-b.freisen@gmx.net>
References: <20251114203842.13396-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:CUtUWBWxBVHVjpl7GvXh0Y6973Y7h9yn895NOppFq15DwArnAhE
 SHj1SnJvvAA20L0l93es6vtFOgTHlCDTbdJ8MYRWbISJe0hW9sUzED+kXvYAS3fVfVuJA3l
 3kdd9KeZDxq517PDV/o3wVwKuqBppgFY95GQqXpAXPJkxBt4n6Wm/hlV7xu13HS/jG+194+
 zaGl/PYmmTFdcHNoVBrVg==
UI-OutboundReport: notjunk:1;M01:P0:Fb3XtQDhzyY=;JtiIcnQASMuSGdFd3ztIod8lvLT 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 L/7maPqI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_194333_210713_2E839E44 
X-CRM114-Status: UNSURE (   8.78  )
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

According to the RISCVuzz paper by Thomas et al., the T-Head/XuanTie C906
and C910 cores fail to ignore reserved fields in the "fence" and "fence.i"
encodings and trigger illegal instruction traps if these fields are non-zero,
so address that in the illegal instruction trap handler.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 include/sbi/riscv_encoding.h |  4 ++++
 lib/sbi/sbi_illegal_insn.c   | 17 +++++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 2970ba0..d956ebb 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -944,8 +944,12 @@
 #define INSN_MASK_WFI			0xffffff00
 #define INSN_MATCH_WFI			0x10500000
 
+#define INSN_MASK_FENCE			0x0000707f
+#define INSN_MATCH_FENCE		0x0000000f
 #define INSN_MASK_FENCE_TSO		0xfff0707f
 #define INSN_MATCH_FENCE_TSO		0x8330000f
+#define INSN_MASK_FENCE_I		0x0000707f
+#define INSN_MATCH_FENCE_I		0x0000100f
 
 #define INSN_MASK_VECTOR_UNIT_STRIDE		0xfdf0707f
 #define INSN_MASK_VECTOR_FAULT_ONLY_FIRST	0xfdf0707f
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index fa82264..ed51f4d 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -42,6 +42,23 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 		return 0;
 	}
 
+#ifdef CONFIG_THEAD_C9XX_ERRATA
+	/* Errata workaround: C906, C910 fail to ignore reserved fields
+	 * in the `fence` and `fence.i` encodings. [Thomas2024RISCVuzz] */
+	if ((insn & INSN_MASK_FENCE) == INSN_MATCH_FENCE) {
+		/* NOTE: Emulation should ideally preserve the `pred` and
+		 * `succ` fields, but that is not easily possible here. */
+		mb();
+		regs->mepc += 4;
+		return 0;
+	}
+	if ((insn & INSN_MASK_FENCE_I) == INSN_MATCH_FENCE_I) {
+		RISCV_FENCE_I;
+		regs->mepc += 4;
+		return 0;
+	}
+#endif
+
 	return truly_illegal_insn(insn, regs);
 }
 
-- 
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
