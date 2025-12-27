Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695AAE9270E
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 12:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pGBb08JYknGmaI8NnIXzr027jkja15jgz76TD3+Alc8=; b=fDoDi4lRHBvmsY
	9K1jrmjdbzaPSBr95dAdtFdrQpurGOs8bXVvY5A+l5ynNUxNqC+cRXxnrPbOG+7WiJagqL9O77x4i
	WqAgsI67KnROR9g/+S/An7WZ856C9zr5zxGkzYPpfFvQ5Xf+8jqEYCxpvm7wgreRhz8zWKhnUZrxD
	4zbph84P6pRI97Z/uHT4a5dx3E2UGTUvsbfAHclFxPNbzqdW8UoxFvQg+k7X3zDjphdeZJevzM6d6
	F5txAfSLPQ2X7Qur1vW2K8F/jXdDvZ6u4C1R/14vQn7si48IJyx14PKpd/0DHh0bd2xDiUIcSbi/x
	txBrP5DEX4l9foFU6rrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG9-00000001wmP-1nR9;
	Sat, 27 Dec 2025 12:19:01 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZTG2-00000001wef-1LEn
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 12:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1766837932; x=1767442732; i=b.freisen@gmx.net;
	bh=Y3klwyCNsK/4WC+tkZQFc9T3KSDTKr2CDQYuKIvnHkA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Xuqf6YzvkDjhIipTRkRjf0wLoEO/hYLFHlvfkQ1MDdZhEIkLXGhdnjVWnqmXCRNO
	 l+DwZFJFtr5a71tFwCmCVxR8rUSZYBtRFUYYzBDNN7U7zwQtLDKC3rCWM5o7vHnOg
	 KkbmroqU+nJhnrr0IVCG2Y/MRhvpvOVVJnBhz5z9i6oMD9cjeMVDOmMFFUg6SMd7B
	 oKf0OXXLEVb694PyQr3mQqZf9mh1UKKznjFqPWvTbRhZZT9DJqzJJNRHgPcIbKURe
	 m1rxsL01d7fja+xgW134n8hpyQdAiwfjRRPM9IB82zupLGiF3DqPueh/kcFXntPqM
	 ++NhQW/zJwffU1DLew==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.117]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N7R1J-1w0Wko3glB-0151Bn; Sat, 27
 Dec 2025 13:18:51 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH v3 1/3] lib: sbi: Workaround for FENCE(.I) errata on C906, C910.
Date: Sat, 27 Dec 2025 13:18:00 +0100
Message-ID: <20251227121802.15703-2-b.freisen@gmx.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251227121802.15703-1-b.freisen@gmx.net>
References: <20251227121802.15703-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:vy0JlksTkA97nrC0cINaAYCbIhDCgatXT22KKjrs65bEu3RLiRh
 Z2IDNNVjUR03Co7MPsxsV+nPENKewoRdWW0JTNRneEYCybF4cad+YBGeVNksJ9H05KT0HHS
 qaarmn7NcdqG0iJqu1lhx+zfIQQFRQIsignQlKP62/ykm5OMTXBEnzg/ot3ziamkIVAf6Re
 P59aczXP49bFbaPabFSBw==
UI-OutboundReport: notjunk:1;M01:P0:g5ZFPk0JctA=;eQpuL72FkdK3kQXUQDHaccA0q+/ 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_041854_690374_7EEE9F81 
X-CRM114-Status: UNSURE (   8.75  )
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
 lib/sbi/sbi_illegal_insn.c   | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b5a4ce81..2ba27b0d 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -949,8 +949,12 @@
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
index fa82264a..4b854506 100644
--- a/lib/sbi/sbi_illegal_insn.c
+++ b/lib/sbi/sbi_illegal_insn.c
@@ -42,6 +42,21 @@ static int misc_mem_opcode_insn(ulong insn, struct sbi_trap_regs *regs)
 		return 0;
 	}
 
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
+
 	return truly_illegal_insn(insn, regs);
 }
 
-- 
2.52.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
