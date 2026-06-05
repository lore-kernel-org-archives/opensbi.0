Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25D1CD6E5D
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ay6VQX0QlBzoBuAqN4b80k1G/3FGanlVrFWMQlt4d54=; b=EOWKh6WtZqb94z
	+PT3BOnq/Vq1BlTfUrF1KAv2PW460CyZT4dGqYO9b2YXLo0BSCNA+tSUeE1vQQEIfDHPM/8bODBr1
	e+HGGBqqQ1th4LsxDjqbbCl7ciVBXVCyJTcMC4p04q5D3f8vbHibLN2+nlOGLl4yA+gry52hdfI2Z
	n5bvlHV454XpiG/NIPNxhhYHzqSPPzQIQcOo3+Slp6XvdmH5u79d0waj7MdvVu0uaRsbhBP/Jnvsj
	tIGteuhukXHMWKDkoIw9gEZ3njQwFeMCJCj88Xsr0DFN3PJOo5PiJd5eEqm0iYtyUWwgHGpsUNt1t
	doa/1A9WjFBaLHyg5LYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSoo-00000000Xni-3t2K;
	Fri, 05 Jun 2026 11:34:30 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSok-00000000Xl0-0NL2
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:28 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-8423f236418so989108b3a.1
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659265; x=1781264065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJIf0pJej/GII+3ZkO4sx4cUHDDFS4dfuL5N6BkZ8rc=;
        b=mYqEy88nHyoiEnXP6ypeNkGdJx7oOSs5ypDy79PUar7eFJM5HrrlPpB+c1X3D8jaHe
         PROEHB38yNRuw94xjVvuKn4Glw+JFMoDeHrIW6s/SbsmPG7scItKFDgyI21PQsncqUtA
         7/A2B1D5azPF6bLXZu2++pAbPNs/L6CaGz5SE68DH/jEBhNgH3y1lV8lnnB8WY79QOj1
         bSzcNNlrMM9fihcDuSq0NHmhCwU2ee4ZSw1O1TL4u5ZCUDD2dtMT6cth0zyMpWQvRcgG
         ySff80lYEPenkpOHpFR94IhIHbSRz5biPfNf3H1BNN6fxnNtfS9KCC9D3KO717a7SJQB
         NcZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659265; x=1781264065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJIf0pJej/GII+3ZkO4sx4cUHDDFS4dfuL5N6BkZ8rc=;
        b=oiJ7dSBSTQWrqaOi2lukRxCxH7lNr7m+kuIDXYWz5N8uqpFxAwGhqkYkGzlkrv6GXe
         q5Pirbozt2v+A9MLO9Ik+ZU05bLIAr/mG4LGxez5KKnXChMxJYlwVViRqw8EZjGbDdyO
         jNowKvLor8ImaON8ymfZ575wit23Mp4pXHcdBhP8oarFZy5OzLyQf7cTiCqKD8cQ18pA
         ckmN8l9fj23zk1hJ8VJ2Mec9hddEtzBiEfrmKvyMk+wdIiW1hWFUwqkPIRZvdR0Aq/xI
         kPC2r7lwEYYpTPGZ/cgOwD169Ix0s1xNUWly17UBVhO52fy/j+o+qqkXhoFF+ifxHQrg
         XwOA==
X-Gm-Message-State: AOJu0YwPsZZdnPH9wsi82kdC31FJM/qTZ2Oevue0wTS9F23caegTn0p2
	c22QvF2Lg8pT2iwfyFJY+0a36B9PAiwFnphsyci6pkPJzBxYKcbd5yyW59cABQ==
X-Gm-Gg: Acq92OHZDYZ8K83bBoadLijPAnoal3O+8uWHqBRSokrPV0UbOU9lndu2rOh1KAj1L46
	Oq1ZNvGLhMqFTOZC00eU3zuXi/QO/WidN8PGBcVTkLjjz9yJmMya5rv+vaFEJOf8gH55qRlfBw1
	1eRn89ummlZni9+t5/RN1S8f+2U2E0b/yX7ncVQ8Wggm3cxY4/8Du20Jioz7amkfVJH7getKX+v
	UfnaAltl+3kQOKhKNslr8fZSEDoZF1+tZfsRYgmuGlOcKUqYcFk+i1jiqix2fPJiJpTiJE8enXu
	22QBbplLvBNZcatccBzLJFlxkkUIVzlkEk+dN2czsC6QldO5RVEcHOdJn85vtSyLtkHlF4CpurL
	+ruZhKRlcCTOEBaRIyQdXtu9YXAPmarpPBN1gBsFunO77HgXR3zLw+8IB3LLCRMdFSKk/IJA0iw
	5yIiG2Bpznk+SvaMCR8nPtpXuZqORARoh5NPM=
X-Received: by 2002:a05:6a00:bc81:b0:837:80a:5abe with SMTP id d2e1a72fcca58-842b0fbb616mr3042900b3a.37.1780659265060;
        Fri, 05 Jun 2026 04:34:25 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:34:24 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	wangruikang@iscas.ac.cn,
	dramforever@live.com,
	andrew.jones@oss.qualcomm.com
Cc: cleger@rivosinc.com,
	pjw@kernel.org,
	asrinivasan@oss.tenstorrent.com,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 2/8] include: sbi: Add sbi_regs_prev_xlen
Date: Fri,  5 Jun 2026 04:32:08 -0700
Message-Id: <20260605113214.242-3-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043426_128246_D282CDBB 
X-CRM114-Status: UNSURE (   9.57  )
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

sbi_regs_prev_xlen reports the xlen of previous mode by decoding
from multiple CSRs including mstatus/hstatus/vsstatus

Signed-off-by: Bo Gan <ganboing@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/sbi_trap.h | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/include/sbi/sbi_trap.h b/include/sbi/sbi_trap.h
index 091a2446..3be418a3 100644
--- a/include/sbi/sbi_trap.h
+++ b/include/sbi/sbi_trap.h
@@ -273,6 +273,64 @@ static inline int sbi_mstatus_prev_mode(unsigned long mstatus)
 	return (mstatus & MSTATUS_MPP) >> MSTATUS_MPP_SHIFT;
 }
 
+#if __riscv_xlen == 32
+static inline int sbi_regs_prev_xlen(const struct sbi_trap_regs *regs)
+{
+	return __riscv_xlen;
+}
+#else
+static inline int sbi_mstatus_sxl(unsigned long mstatus)
+{
+	return (mstatus & MSTATUS_SXL) >> MSTATUS_SXL_SHIFT;
+}
+
+static inline int sbi_mstatus_uxl(unsigned long mstatus)
+{
+	return (mstatus & MSTATUS_UXL) >> MSTATUS_UXL_SHIFT;
+}
+
+static inline int sbi_hstatus_vsxl(unsigned long hstatus)
+{
+	return (hstatus & HSTATUS_VSXL) >> HSTATUS_VSXL_SHIFT;
+}
+
+static inline int sbi_regs_prev_xlen(const struct sbi_trap_regs *regs)
+{
+	unsigned long hstatus, vsstatus;
+
+	if (!sbi_regs_from_virt(regs)) {
+		switch (sbi_mstatus_prev_mode(regs->mstatus)) {
+		case PRV_M:
+			return __riscv_xlen;
+		case PRV_S:
+			return MXL_TO_XLEN(sbi_mstatus_sxl(regs->mstatus));
+		case PRV_U:
+			return MXL_TO_XLEN(sbi_mstatus_uxl(regs->mstatus));
+		default:
+			__builtin_unreachable();
+		}
+	}
+
+	/* V=1, Check HSXLEN first */
+	if (sbi_mstatus_sxl(regs->mstatus) < MXL_XLEN_64)
+		return 32;
+
+	hstatus = csr_read(CSR_HSTATUS);
+	/* Check VSXLEN */
+	if (sbi_hstatus_vsxl(hstatus) < MXL_XLEN_64)
+		return 32;
+
+	vsstatus = csr_read(CSR_VSSTATUS);
+	switch (sbi_mstatus_prev_mode(regs->mstatus)) {
+		case PRV_S:
+			return MXL_TO_XLEN(sbi_hstatus_vsxl(hstatus));
+		case PRV_U:
+			return MXL_TO_XLEN(sbi_mstatus_uxl(vsstatus));
+	}
+	__builtin_unreachable();
+}
+#endif
+
 int sbi_trap_redirect(struct sbi_trap_regs *regs,
 		      const struct sbi_trap_info *trap);
 
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
