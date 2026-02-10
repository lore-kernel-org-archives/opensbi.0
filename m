Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DBFEA3F30
	for <opensbi@archiver.kernel.org>; Tue, 10 Feb 2026 09:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JfzLOQ/e0k4FtZvxmPytuXgYpu912vk+eLgOse3djKU=; b=wJOxEkwjphefBR
	kv2SpranWypt/HT18JfxyE1oj/LP/wJS2xX8BSviAjzFfOrwXhgwzfxqvmmywUbdnoaZOMwriZVVL
	JityV78qk4h/ZAoOyFgdnKwSlstBaC8PHqA5ZvyIedqAPNZlVfZi3zczRGs9Z/QFqNpRsHR6XSSFH
	aCXyXYaN8M7jMAnC7zQUOLsKejjW8umKISmGyhSU6ygqJr7oU6crw20z7k9ocI+nSYPhcIih/jodF
	6dLDUlK8BF2SzLInrjYZmh+R4mIBvPL60o8CV+Qdaq4ED/vpr58LAVUG5N44MIN9Af+WG/YenqANt
	YkAyyaIOfFXwQwumvB4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGh-0000000GlWy-20o4;
	Tue, 10 Feb 2026 09:42:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpkGe-0000000GlW7-2tRK
	for opensbi@lists.infradead.org;
	Tue, 10 Feb 2026 09:42:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a7a23f5915so35953105ad.2
        for <opensbi@lists.infradead.org>; Tue, 10 Feb 2026 01:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770716567; x=1771321367; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqwLy8tVl2buxUTfxRNT6krmk51MYTmc3q0ABhBXPPU=;
        b=RTHJH3RKoQ+YO3MkyDKaBTONso8aame/w7OVoPccZu7RLBnaLc9YAEEAwzyE/BNMeU
         CnHTUprIs8EKVpigy34BlPnl/eI0x7GAyCvyhXxdajW8UqfUgxkVS+WvivUHdb+36+Oi
         szrgiHexHiaCMIq/K7GyXFgSew4WCQFntL3/quTDuANWgBqt1YuHyzWv9kyJf4YKnU0+
         9KJVmBZfCkkf6ER0nJK3/wsjOEfahsjOvuC9BaJ8HGwksB7NhkCrpiHvWLvVkmY6qRNj
         HOrBurnd9HBO2zbG0l7bTknyKIjIPjH/UdkFrt1WcAda7WHcaO1M4Y6XT1409JFyuHq+
         Wcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770716567; x=1771321367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aqwLy8tVl2buxUTfxRNT6krmk51MYTmc3q0ABhBXPPU=;
        b=k2dH0bojXNDD+Tx+uf4VdnO59xGwcUWfw50PhP/DI+BWxY96Fqurz4Hca49+f8vyLo
         0TIab5htN+eZIEC8Fx8/fethJIoUobJpw44VNBAMoDKZfzc+rFVNn7dVd21N0X4DJBkP
         ilKJ8qr6vSckvq5dZ69/HvRTKkWKNf3OILCHGglQ59nCwIZWvWpuXfndEtcNeDhGBgqq
         Jgm2ZqGpRaIRxRp2o6qJh+/miZEt7lp1mwBrekoaHE1IW/Tl/L86eOMbcgD86ULWKQL/
         N5N2tBTtA+NywjoZzqZ1eZ03xd/GgFwG80nT46NyfZmub+5vsBw4ZtsgEl9Ib1wkv/xT
         Bzug==
X-Gm-Message-State: AOJu0Yy24Q1nmh0oYIKgLyVroQVQsHG1bvc+wUUmBwaj5ySrW/cv6mSt
	nwFL6NN0X1asNhjQaHxrtiLPhdEd+48Y3zGr8aTErHkBmoNjAi+fHN1/kzOUnw==
X-Gm-Gg: AZuq6aJoCSTzw+ly3diPGCBePKcihkaO10kuBBGDzt4IDNVhagBoGLx390HQlCDNd1T
	wMKhAxmatD8TqYxceso84y/Fg5KseWbBSmWENrOOJXOLWMi/JfY1F5QaeLdy5KAEwlWoVloL9QG
	TmZFcGMOgpoOD9/wsrJ6ixostoJElGLddNrCW3hpbyUqxtooVZi0/M3BJUUGC/s78J9qxJWUwqn
	a8/qnJwEHiooZ1GudrhWuKI9H3aVHwfr1GscZm7ieMn93nLErwCVxxBppMGbCuguQULNn5IupFt
	0fEL2JfG1NePu1zNNeBb36OujVVxJYehvVulAt+fbsOCOnCVhapIK+oQs4YIT9WVJRwuJfzGiUZ
	xwQjyvsRuKACRW880OS8m0cQJwyhlfCdt9ToQHO0B4JmIFwSvBAuQGSZuh1ChGaK3RS5bX0SbNa
	3bv+OOzeyfMmhco7G2lqh4ovlE
X-Received: by 2002:a17:902:cf4b:b0:2a8:ac0f:9ae4 with SMTP id d9443c01a7336-2a9522333dcmr137067065ad.48.1770716567402;
        Tue, 10 Feb 2026 01:42:47 -0800 (PST)
Received: from m91p.airy.home ([172.92.174.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a9521b8d79sm133219215ad.61.2026.02.10.01.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:42:46 -0800 (PST)
From: Bo Gan <ganboing@gmail.com>
To: opensbi@lists.infradead.org,
	dramforever@live.com,
	anup.patel@oss.qualcomm.com
Cc: anup@brainfault.org,
	cleger@rivosinc.com,
	samuel.holland@sifive.com
Subject: [PATCH 1/7] include: sbi: Add more mstatus and instruction encoding
Date: Tue, 10 Feb 2026 01:40:38 -0800
Message-Id: <20260210094044.72591-2-ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210094044.72591-1-ganboing@gmail.com>
References: <20260210094044.72591-1-ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_014248_726318_5634CC73 
X-CRM114-Status: UNSURE (   9.03  )
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
---
 include/sbi/riscv_encoding.h | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index b5a4ce81..8ab59abe 100644
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
@@ -939,6 +944,10 @@
 #define INSN_MATCH_C_FSWSP		0xe002
 #define INSN_MASK_C_FSWSP		0xe003
 
+#define INSN_MATCH_C_LBU		0x8000
+#define INSN_MASK_C_LBU			0xfc03
+#define INSN_MATCH_C_SB			0x8800
+#define INSN_MASK_C_SB			0xfc03
 #define INSN_MATCH_C_LHU		0x8400
 #define INSN_MASK_C_LHU			0xfc43
 #define INSN_MATCH_C_LH			0x8440
@@ -1368,6 +1377,9 @@
 #define SH_RS2C				2
 
 #define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
+#define RVC_LB_IMM(x)			((RV_X(x, 6, 1) << 0) | \
+					 (RV_X(x, 5, 1) << 1))
+#define RVC_LH_IMM(x)			 (RV_X(x, 5, 1) << 1)
 #define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
 					 (RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 5, 1) << 6))
@@ -1379,6 +1391,10 @@
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
