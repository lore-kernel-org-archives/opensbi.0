Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF054CD6E5D
	for <opensbi@archiver.kernel.org>; Fri,  5 Jun 2026 11:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rWR12AtCjn7TmRLHexRNyqiVYGdhHog99QZHq+AjZ1Y=; b=rcet21h1Mv72NR
	ChE5Z4mGsJ+fMDmC6Fg5E8P9Z63Jra4jtI4BOk3EOSHY8Kehu87+KrYXttJOMfwbVLRMDvqidCiul
	qkeJtqPEL4cFVJ0IjiC7BJcw/HoFjy3Dm+5wxKPRq9Cx9cFjy/X/+C3OdzYwmfPfI0ogX8Vj0yVCF
	qlP5TPFLx8yUu4BfMAhjZyN715Bl2KiZ/rEHg3mKTBDMOx7U3Z42johGhoJZK2O/ylhMfYLJOvT5x
	oliO0wK/Rx2Ir39jIFVjYQchpfsY7VaoCR1/irjzZMNPbH6Tx+CZnH6kpJEnw8nSma7z4mkqVM9x8
	5S9h6qBIIjRwko4qNLXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSom-00000000XmC-3WJb;
	Fri, 05 Jun 2026 11:34:28 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVSoj-00000000Xkl-1slL
	for opensbi@lists.infradead.org;
	Fri, 05 Jun 2026 11:34:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-842358aaf36so759559b3a.2
        for <opensbi@lists.infradead.org>; Fri, 05 Jun 2026 04:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659264; x=1781264064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YtzTBjKKY7Tn5ZrFRNNz2FZHgPsQSYHivJxvnEbPdqU=;
        b=dkHlLE0UC8srjAQow4bg2wqtlLeCI/J36yjTCeFwjdefhRSyurpEwaAvS2xQfOFyHt
         QPaDIuO3pDFVk4/3pFiy8Gdrwr6Lv7+SJy27Xi+sktm5LLz2Aw6Y/6jHUeywK66NSeag
         5ZdMh5caUdCTQ1j/sG1ik95Fylp5Tx3mq5mE2fft1cYItDmWIajWNvayOXzRhZL2CZql
         8z0QNAxdJpn/AuSIGbeH+HezXGm3si55knANxPQkTsi/Y1a3+AFq0/qM19sYnXxcZsGk
         euHsnb+pUwrw0ZcVBNsjNZkOB6Fb2BN8GFjSW02ikHITOgFtEdg1Ft6KgmTCp00BRcE0
         xSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659264; x=1781264064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YtzTBjKKY7Tn5ZrFRNNz2FZHgPsQSYHivJxvnEbPdqU=;
        b=lVAWzDrEPslwj/YsHDHXY80UD+5WINiiC4l3Jkb1SxU1bKLIP39SfuT1MEQsVxIlp2
         tYvGLD3oCjpboI4ZTFQiPu/8Rb2QOrKdDESZtnPeNwsh2B9354YWbyW/CwCOocCALx0d
         XSfsU0U6ORH3XkpggluQpDmbBcqaSB0KwcJF5hHL03VKMRbYfnWkbUtxJY91n0GT6cDs
         3AP+hsoVkrJ+9XwF8pfWhpVzLZGwtUejTMwkvB581k4lNsE2tgWH+zJS/87c0/b+klDj
         S60hMKUOYVtPovhvdQ/y9XhH5HlFJfqhakscM5EnzmL2ZBJbpvAeX7H3MEZ61HxvvHPm
         WRKQ==
X-Gm-Message-State: AOJu0YytrXghbl3+MN8QtiWvCrk4NFh4jZ4VuAz+41oW6O4YYBreERQc
	NM0RcqeRLopzYzigvY2TFMXRHePriEa36RrNZLZsuaQlKR9BZ/dABTfNC1cYrA==
X-Gm-Gg: Acq92OGaNy5TVdBbobKe8PuPYbCfXR1DzL/ZvmLggn778bUC2FmV2FI7wCajrzARpAf
	d9YGf0GVspaf63Sanz1TIhz+Swj2NOQFF83bfSTjF//YLg8D3AJ+x3ibZcIdw0bUo1N+UPM4PCI
	WsG1iDkw0/tfQSu1bpDdn/FHLgnitfVZkHgYHxvmwBxe9s7zqliMXOsZwxwunvyzaQtUfiTKlZq
	3/1+5EopnT/eMUeA01R9VppSN3RKTKbUQv8PSz9w3OHFmX6DMSYk8YdCZlP1W0A6f67dRx2KHEp
	4obsUgDHTPTHDF/wnikAN5LPSAJ3JNqseXV3m68CaZkbvfkjLqeUIffVp9JailDdC4r5v7bCqyK
	1ZW4yQ0QNGB66nf/CODQU10JzdklE1RGh8ocFNa3XjYueKXUi2eOi99Aww5ldR9bWej0ClHaCEF
	PNkcINewEguZBBHy+xysRCt0z5sXlc73A5wD4=
X-Received: by 2002:aa7:8891:0:b0:835:3d5e:1dd3 with SMTP id d2e1a72fcca58-842b0fb6d92mr2941010b3a.42.1780659264443;
        Fri, 05 Jun 2026 04:34:24 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8428222263dsm10141414b3a.2.2026.06.05.04.34.23
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
Subject: [PATCH v2 1/8] include: sbi: Add more mstatus and instruction encoding
Date: Fri,  5 Jun 2026 04:32:07 -0700
Message-Id: <20260605113214.242-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605113214.242-1-ganboing@gmail.com>
References: <20260605113214.242-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_043425_486154_50CC6B59 
X-CRM114-Status: UNSURE (   8.83  )
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

- Add MXL encoding for calculating XLEN.
- Add instruction encoding for c.lbu/c.sb,
  and imm encoding for multiple RVC insn.

Signed-off-by: Bo Gan <ganboing@gmail.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 include/sbi/riscv_encoding.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index 18f7b4a7..535aed66 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -36,8 +36,10 @@
 #define MSTATUS_SDT			_UL(0x01000000)
 #define MSTATUS32_SD			_UL(0x80000000)
 #if __riscv_xlen == 64
-#define MSTATUS_UXL			_ULL(0x0000000300000000)
-#define MSTATUS_SXL			_ULL(0x0000000C00000000)
+#define MSTATUS_UXL_SHIFT		32
+#define MSTATUS_UXL			(_ULL(3) << MSTATUS_UXL_SHIFT)
+#define MSTATUS_SXL_SHIFT		34
+#define MSTATUS_SXL			(_ULL(3) << MSTATUS_SXL_SHIFT)
 #define MSTATUS_SBE			_ULL(0x0000001000000000)
 #define MSTATUS_MBE			_ULL(0x0000002000000000)
 #define MSTATUS_GVA			_ULL(0x0000004000000000)
@@ -56,6 +58,9 @@
 #endif
 #define MSTATUS32_SD			_UL(0x80000000)
 #define MSTATUS64_SD			_ULL(0x8000000000000000)
+#define MXL_XLEN_32			1
+#define MXL_XLEN_64			2
+#define MXL_TO_XLEN(x)			(1U << (x + 4))
 
 #define SSTATUS_SIE			MSTATUS_SIE
 #define SSTATUS_SPIE_SHIFT		MSTATUS_SPIE_SHIFT
@@ -959,6 +964,10 @@
 #define INSN_MATCH_C_FSWSP		0xe002
 #define INSN_MASK_C_FSWSP		0xe003
 
+#define INSN_MATCH_C_LBU		0x8000
+#define INSN_MASK_C_LBU			0xfc03
+#define INSN_MATCH_C_SB			0x8800
+#define INSN_MASK_C_SB			0xfc03
 #define INSN_MATCH_C_LHU		0x8400
 #define INSN_MASK_C_LHU			0xfc43
 #define INSN_MATCH_C_LH			0x8440
@@ -1388,6 +1397,9 @@
 #define SH_RS2C				2
 
 #define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
+#define RVC_LB_IMM(x)			((RV_X(x, 6, 1) << 0) | \
+					 (RV_X(x, 5, 1) << 1))
+#define RVC_LH_IMM(x)			 (RV_X(x, 5, 1) << 1)
 #define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
 					 (RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 5, 1) << 6))
@@ -1399,6 +1411,10 @@
 #define RVC_LDSP_IMM(x)			((RV_X(x, 5, 2) << 3) | \
 					 (RV_X(x, 12, 1) << 5) | \
 					 (RV_X(x, 2, 3) << 6))
+#define RVC_SB_IMM(x)			RVC_LB_IMM(x)
+#define RVC_SH_IMM(x)			RVC_LH_IMM(x)
+#define RVC_SW_IMM(x)			RVC_LW_IMM(x)
+#define RVC_SD_IMM(x)			RVC_LD_IMM(x)
 #define RVC_SWSP_IMM(x)			((RV_X(x, 9, 4) << 2) | \
 					 (RV_X(x, 7, 2) << 6))
 #define RVC_SDSP_IMM(x)			((RV_X(x, 10, 3) << 3) | \
-- 
2.34.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
