Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 600FFCCF9E5
	for <opensbi@archiver.kernel.org>; Sun, 26 Oct 2025 20:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkv1OgSI/XCoLoxHQ2QeP6wxIbqNtOYxIeoNsIobN3U=; b=RHvvPws6XuKHNj
	PmvgVXid8LUPzEciBMywQrUQO7WIFpA0bzCdiYyMVC0SteVivu9nsKTEWS5/RyHa4+BdDR5+dtbsu
	dhkft9Y/kx9BrcawaDDmlxAKt6xezHx52iyLgl/TlQXjx/yed1j7nnidh1Jn8aUuAIr1Y2NFHhn3+
	p2V28SXAQ2BADqn6Y3HLcK60Jt5yW3sioSa6UMqQAAwaWMwz7kFokhi86oQOn0AiCR0ubxPB09gHU
	Cpfiej7nCPj9utkz2RweFJIlpcOQMYuOUYCm9tsZCyineztApoLtcI9t0OSrQxZfMBdVKhhdBtJiM
	hScglQj+aBxt2dM06cFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I5-0000000CiWu-0eJ6;
	Sun, 26 Oct 2025 20:24:37 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD7I2-0000000CiVc-2zxs
	for opensbi@lists.infradead.org;
	Sun, 26 Oct 2025 20:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1761510273; x=1762115073; i=b.freisen@gmx.net;
	bh=dsD0+DT8Q1ZWLZLKIoVl9CrMShiYVDpSiALEJgNMK3Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AMdTJytG2EUOgm5sOg//5ihgrzx6yzQAd7yvec9ajWoLpdOIiQceT9R5IWwBiYmi
	 vcLl3DFg+hzWzkdn/QJZFKL/fd0RJnrNG7mG/YNuQG7hPhR1G7eYfZDkk84T1iwVp
	 WTkugK7cZjc8ad+GQuKNXXDz6Ls8I7j4qofgspVJQ54deyfo3PpuXriheNhBTUoXY
	 fLEuTh3rsw6pQ1L2V/NxPHi7wYflnWWHSCT+VXrln8t6Ndd4fAQtiqmvzjFez/PTn
	 EEOs281PHYTK3PQ5mq6klOrQRdAlfBIR7SYe5InpA3nPwCgRVrSJJCtGa2DuduUmH
	 UPXwpo9txlD5bAM8Lg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from blackbox ([95.223.79.155]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzBp-1uvrQ93rIf-00Ii4b; Sun, 26
 Oct 2025 21:24:32 +0100
From: Benedikt Freisen <b.freisen@gmx.net>
To: opensbi@lists.infradead.org
Cc: Benedikt Freisen <b.freisen@gmx.net>
Subject: [PATCH 2/5] lib: sbi: Workaround for FENCE(.I) errata on C906, C910.
Date: Sun, 26 Oct 2025 21:21:56 +0100
Message-ID: <20251026202416.23550-3-b.freisen@gmx.net>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251026202416.23550-1-b.freisen@gmx.net>
References: <20251026202416.23550-1-b.freisen@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:UyLAlt9zUwLfGujLIYqckbgEuDmhwSr6RNWhVTQP952+6mUJAQt
 Yw5nrttCxnaQP7sapOnM2V28vsY6eQBqMmlNVv5d5Fxzu7ZMhgFZ38mvuMvJcFwM6o7ePg/
 3JYRWG/HTNOo4NVcze8qSKPwPikhZfhHj8UBNw/aeHpQUewcrE/cCeCtcdyAusPIj7SUyS5
 e3K9JHj93ts/eBjvvX3pw==
UI-OutboundReport: notjunk:1;M01:P0:jlGTCzOfkXA=;0fMrkRZO1R7q+x0XRNUITVaB3lL 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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_132435_030981_53C0C52E 
X-CRM114-Status: UNSURE (   8.58  )
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

According to the RISCVuzz paper by Thomas et al., the T-Head/Xuantie C906
and C910 cores fail to ignore reserved fields in the "fence" and "fence.i"
encodings and trigger illegal instruction traps if these fields are non-zero,
so address that in the illegal instruction trap handler.

Signed-off-by: Benedikt Freisen <b.freisen@gmx.net>
---
 include/sbi/riscv_encoding.h |  4 ++++
 lib/sbi/sbi_illegal_insn.c   | 15 +++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 92cbc27..c9b3d92 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -944,8 +944,12 @@
 #define INSN_MASK_WFI			0xffffff00
 #define INSN_MATCH_WFI			0x10500000
 
+#define INSN_MASK_FENCE			0xf000707f
+#define INSN_MATCH_FENCE		0x0000000f
 #define INSN_MASK_FENCE_TSO		0xffffffff
 #define INSN_MATCH_FENCE_TSO		0x8330000f
+#define INSN_MASK_FENCE_I		0x0000707f
+#define INSN_MATCH_FENCE_I		0x0000100f
 
 #define INSN_MASK_VECTOR_UNIT_STRIDE		0xfdf0707f
 #define INSN_MASK_VECTOR_FAULT_ONLY_FIRST	0xfdf0707f
diff --git a/lib/sbi/sbi_illegal_insn.c b/lib/sbi/sbi_illegal_insn.c
index fa82264..4b85450 100644
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
2.51.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
