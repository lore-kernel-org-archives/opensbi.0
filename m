Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1597C5B572
	for <opensbi@archiver.kernel.org>; Mon, 17 Aug 2026 09:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BDT4DPiueFV7Sc7V1XPW9iaBouc3pk/Fi6k4i6M4oQI=; b=G2lWpC80Ad/I0E
	VA6SOOCBOmPvHnhpCcvCeKd6mXSh0gT3wRKuMcqf21S0vu0cmmYIrFmc+f8+K3m6qof71ZD/FAxD8
	nYLVpIcrkDA1HmzkP7jm5JzD5zvKrGUAPDtln24HbiYfJNdjY0w9eP2Q7MBFdp1ZJpjJVjquvtgbm
	msPzmWM1LME67cRKo0B1VOV43R7XwoXfWn4X9MQXmDoYapwlEzVyzmYqXrmS31O67OfbGw+x/UymA
	lJJDKVy9B6JvEgkDi7W/jLfyBhzgkvTVvdYJEhvcWxyrPv9a0MmapJf2X6e5onUnvSpSz3Ha5h+SJ
	0KyC7MOjlaRlNSc4UshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHy-00000005lpz-3lnG;
	Mon, 17 Aug 2026 09:05:50 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvtHq-00000005liK-0pcV
	for opensbi@lists.infradead.org;
	Mon, 17 Aug 2026 09:05:49 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84874b52eabso4200981b3a.0
        for <opensbi@lists.infradead.org>; Mon, 17 Aug 2026 02:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786957541; x=1787562341; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PfDcxSXeo0Y24zWRKhEhNahZIvPM5pLabPnoX16za3A=;
        b=ZyswUbsSuHMIeoEaA0nFayBAHT+oo5yutBYmq/nCFOhEGC7Yz6pWen5sNw7hslp/cp
         szM2G1ZNwRfgxM3QeFKkit+VU7jyf8iBmS59tw8HSjaQ3oVGfAKMBbUlp5XNivVrmPIZ
         Ld9vN8dSdmIjJnOdszTzq36nOcuIk7KArfnVrzZBPXuahZTrqdqJJwDUL88+R/ZHrIV6
         RKpPhtnDpMJX93zrHSnAJ41jJvOzKlfDo29i9a5XjZIfKnmWcGfLRACpofc0IU/e/Ea1
         NyqnDl9bgRFgFujP2Tt/mUNWdbfT/SNmcKHUShlMnCPQbtWQPhfAUM3gVh8/nPsnATO6
         RGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786957541; x=1787562341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PfDcxSXeo0Y24zWRKhEhNahZIvPM5pLabPnoX16za3A=;
        b=WxT/acMpql2A8+9cyXC4mWEuPktmcL438TEJ10Cgv7UBdnTUqsYZcjcPWd8gGsefFt
         +QoLwd/dp54e/27517YONQmj0bIpjb/k9+siQVAV74lpwz1/FbkAz0H3OFEiQYEpaOki
         utT4N89uVSlhE1OYZj/KfSIbIXil0jV5RKJyWFT8InTf670XFPKBm5fNvrGxRQ8IaTSM
         JlTKmgr+XkiJ4j+BRbDR4uZJWuKPujhA+18klIpyYsokHOU8fIUsjF2H0kxN/GoDBP/6
         yZQxnj5OmgK4ymc87NAaJJbrjc1Cxj6FXus/ChZA9/t6IYcSGvIIUlhFYx/toYLUZnZK
         9+jQ==
X-Gm-Message-State: AOJu0Yz2L7xTD8cn6sYgIY3bAaprvPHognUS7fnHMpYubyjf5Y2bNvwu
	jBMDUnBqyn+r83l1LQhm5/9IRqvs4LOdFjOzx0YGIZFoAwbzbffcxMZ83tniT25qlhou4919izC
	TfumSOAuHWFqX+dyVQtSHTZeI/mHLQIfX7VNWhcLr3Q/IiIm/d3KMBYSJ2zzaDTKrPHTudKicee
	xM+bsCJxbgZuJx7Lhds+tYvpnizaQq4o7vJawUrfBMI1/Fm6XL4FE=
X-Gm-Gg: AR+sD12WTYuEU+wYd4R7ovKSUY06YSkbvVA4FZiEdGyvpwVAcfa+G1c/x6PiFiCGR31
	8hv/XOSzkDugkB+1IiMscF2aehWtBhXClp/tHMxpyR3mgE0jvGFrRX7h5VSFOLsIxJ8YnEi+58G
	h8w+MRF/vu5aiUSqYcN7PyK2DE1oCjnN16FhPvgKVMMVNHy7dLRWJnSIFAN+ImBeGbs/3zKKjrv
	AH9YFHdJw3lZl+Bmsbm14MlfTc1SO+gp+AuEF4ZkIa/SFQFOD2Exj/5Y58Tc2NsLINNHsR9sWl3
	UhtjKBY1YbitMNBg60ClD9IB3XrAm1lkGyK70JAYMSfEF+1pJFQ6O5OVDo2DdPx5JDoKezk2xWb
	DiIu9miN8wau7Six5QzL7r1tIMi+ZkTcfj9yFSmogShXZ5ltZxHG8wKIwnFoNz1XbIAolf1ZQRc
	n/A1jJ5axUZXuKqk8LgcwGugFlP6l03LTRNIcBt+X/EPtRlc/+0s7Snk+IK9TJ2J/dKeBkjMIU1
	dDr8RD05loi
X-Received: by 2002:a05:6a00:298d:b0:848:6895:b754 with SMTP id d2e1a72fcca58-84fde267d11mr25586757b3a.28.1786957541073;
        Mon, 17 Aug 2026 02:05:41 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8517d223f1bsm2487386b3a.38.2026.08.17.02.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 02:05:40 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: zong.li@sifive.com,
	greentime.hu@sifive.com,
	anup@brainfault.org,
	scott@riscstar.com,
	conor@kernel.org,
	dave.patel@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	pawandeep.oza@oss.qualcomm.com,
	krzk@kernel.org,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v2 8/9] lib: sbi: display World ID configuration at boot
Date: Mon, 17 Aug 2026 17:05:02 +0800
Message-ID: <20260817090503.2104998-9-peter.lin@sifive.com>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20260817090503.2104998-1-peter.lin@sifive.com>
References: <20260817090503.2104998-1-peter.lin@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_020542_247815_8DCC51B6 
X-CRM114-Status: GOOD (  10.84  )
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

Display domain-specific World ID (Wid/Widdeleg)
and M-mode World ID source (from mwid/pmwid) during
initialization for RISC-V Worlds debugging and
verification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
---
 lib/sbi/sbi_domain.c | 31 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_init.c   | 13 +++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index fa69170b..d1f7bb0c 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -10,6 +10,7 @@
 #include <sbi/riscv_asm.h>
 #include <sbi/sbi_console.h>
 #include <sbi/sbi_domain.h>
+#include <sbi/sbi_hart.h>
 #include <sbi/sbi_hartmask.h>
 #include <sbi/sbi_heap.h>
 #include <sbi/sbi_hsm.h>
@@ -533,6 +534,8 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 	u32 i, j, k;
 	unsigned long rstart, rend;
 	struct sbi_domain_memregion *reg;
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	const struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
 
 	sbi_printf("Domain%d Name        %s: %s\n",
 		   dom->index, suffix, dom->name);
@@ -608,6 +611,34 @@ void sbi_domain_dump(const struct sbi_domain *dom, const char *suffix)
 		break;
 	}
 
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMLWID)) {
+		if (dom->has_wid) {
+			sbi_printf("Domain%d Wid         %s: %u\n",
+				   dom->index, suffix, dom->wid);
+		} else if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID)) {
+			sbi_printf("Domain%d Wid         %s: %lu (mwid)\n",
+				   dom->index, suffix,
+				   csr_read(CSR_MWID) & ~MWID_LOCK);
+		} else if (hf->has_pmwid) {
+			sbi_printf("Domain%d Wid         %s: %u (pmwid)\n",
+				   dom->index, suffix, hf->pmwid);
+		} else {
+			sbi_printf("Domain%d Wid         %s: unknown\n",
+				   dom->index, suffix);
+		}
+	} else {
+		sbi_printf("Domain%d Wid         %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWIDDELEG)) {
+		sbi_printf("Domain%d Widdeleg    %s: 0x%" PRIx64 "\n",
+			   dom->index, suffix, dom->widdeleg);
+	} else {
+		sbi_printf("Domain%d Widdeleg    %s: unsupported\n",
+			   dom->index, suffix);
+	}
+
 	sbi_printf("Domain%d SysReset    %s: %s\n",
 		   dom->index, suffix, (dom->system_reset_allowed) ? "yes" : "no");
 
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b6..f771f548 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -167,6 +167,7 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	int xlen;
 	char str[256];
 	const struct sbi_domain *dom = sbi_domain_thishart_ptr();
+	struct sbi_hart_features *hf = sbi_hart_features_ptr(scratch);
 
 	if (scratch->options & SBI_SCRATCH_NO_BOOT_PRINTS)
 		return;
@@ -199,6 +200,18 @@ static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
 	sbi_printf("Boot HART Debug Triggers    : %d triggers\n",
 		   sbi_dbtr_get_total_triggers());
 	sbi_hart_delegation_dump(scratch, "Boot HART ", "           ");
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID)) {
+		ulong mwid = csr_read(CSR_MWID);
+
+		sbi_printf("Boot HART M-mode World ID   : %lu (%s)\n",
+			   mwid & ~MWID_LOCK,
+			   (mwid & MWID_LOCK) ? "locked" : "unlocked");
+	} else if (hf->has_pmwid) {
+		sbi_printf("Boot HART M-mode World ID   : %u (pmwid)\n",
+			   hf->pmwid);
+	} else {
+		sbi_printf("Boot HART M-mode World ID   : unsupported\n");
+	}
 }
 
 static unsigned long coldboot_done;
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
