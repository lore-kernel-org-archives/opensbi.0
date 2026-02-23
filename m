Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B56EA4FD1
	for <opensbi@archiver.kernel.org>; Mon, 23 Feb 2026 14:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RsMdZeHjVuMLZ7F76AWeBlbkVWj4Ca6g26quZp0+n7E=; b=TfXR75yyStTy2H
	6zq6pTmhMiPVhmNQvopQDtNckVNr2WB0BSwIl4CDKtkxe80wz0A2EUoUND+y6fh2HGjErNBoXEg/C
	4e8HIcoqfkoucPOSs3TbB0e8DSzjF9Djaz2dZuP245c7ozPxKH3iX90F8TurzcOMlTxveA5nJ3b1S
	0U5rYUyXAvHLr5E3Sc4m7dNoCEu8mw3C5NX9vwHK64wieaHvU5XA9OB3IO7/MDg9/S4dR8S+0HTcP
	rZ/daAhajo50uNepyowQJm1QiPVY4kQmogknH6XSfp3hkFhQN6B/RBBhyEcksH9i9hUnlExxBNDPr
	038kUduWGyXVQPUOy9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLj-00000000W59-0jUy;
	Mon, 23 Feb 2026 14:55:51 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXLe-00000000VrU-2RRZ
	for opensbi@lists.infradead.org;
	Mon, 23 Feb 2026 14:55:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1771858544; x=1803394544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p4eAkMuZyY+7A73qKWPqW08ONO0O4JlltO5mbkK+LyU=;
  b=UvOuvnFl9bFEX9XrCMBa2waCmUFfinafltqQkvayHtUn0Zp/gs2xcN6M
   04m0VekZjnjlKBly3BxAmAH6K1gZ59qNoanHOagWcwhIfqOd1jwD9REhm
   US/qNoVWdp0z4EAR1hwsZxQUFr9IwcTx8QxhJLyRQiRIcdjXUvbp+5hX5
   eYKiVweiH3+ySlsLBPJbDf+Q4I0qFHF9i7Mn1RFz7EK2M38w+JRpQNAV7
   TYNymyxabNyS/ZA2O1gfya/38lsFUwbZ0X3XFqeVlB7+DiFbRVVNpTiyU
   czVeKveMF+xU9sLIR83cTk8JE86mEjMY3lJSMl7gtBqMivjVfLWgvwaIe
   A==;
X-CSE-ConnectionGUID: qI7r+ZoDSMW1Btie+JMykQ==
X-CSE-MsgGUID: B22JM6TuTPWw1Z/Fp4J8zA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:55:43 +0200
X-CSE-ConnectionGUID: ZZAZjYs/SPuYgKfRtKz1wg==
X-CSE-MsgGUID: N2rjycccTwyQnTJDdrRRxg==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces03_data.me-corp.lan with SMTP; 23 Feb 2026 16:58:18 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 23 Feb 2026 16:55:44 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	benoit.monin@bootlin.com,
	cc=cfu@mips.com,
	opensbi@lists.infradead.org
Subject: [PATCH v3 22/23] platform: generic: p8700: fix MIPS specific CSRs
Date: Mon, 23 Feb 2026 16:55:01 +0200
Message-ID: <20260223-for-upstream-eyeq7h-v3-22-621d004d1a21@mobileye.com>
In-Reply-To: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
References: <20260223-for-upstream-eyeq7h-v3-0-621d004d1a21@mobileye.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_065546_951098_1B685EB7 
X-CRM114-Status: UNSURE (   7.73  )
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

P8700 has MIPS specific CSRs. Fix the list, adding
few missing ones and remove few non-existing

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 platform/generic/include/mips/p8700.h | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/platform/generic/include/mips/p8700.h b/platform/generic/include/mips/p8700.h
index d23d1d34724710e91f4812b845e9cf2f5dad0249..e64c62e170375fe943045e388d0f9af9774942d1 100644
--- a/platform/generic/include/mips/p8700.h
+++ b/platform/generic/include/mips/p8700.h
@@ -45,11 +45,10 @@ extern const struct p8700_cm_info *p8700_cm_info;
 
 /* MIPS CSR */
 #define CSR_MIPSTVEC		0x7c0
-#define CSR_MIPSCONFIG0		0x7d0
+#define CSR_MIPSCACHEERR	0x7c5
+#define CSR_MIPSERRCTL		0x7c6
+#define CSR_MIPSDIAGDATA	0x7c8
 #define CSR_MIPSCONFIG1		0x7d1
-#define CSR_MIPSCONFIG2		0x7d2
-#define CSR_MIPSCONFIG3		0x7d3
-#define CSR_MIPSCONFIG4		0x7d4
 #define CSR_MIPSCONFIG5		0x7d5
 #define CSR_MIPSCONFIG6		0x7d6
 #define CSR_MIPSCONFIG7		0x7d7
@@ -58,6 +57,23 @@ extern const struct p8700_cm_info *p8700_cm_info;
 #define CSR_MIPSCONFIG10	0x7da
 #define CSR_MIPSCONFIG11	0x7db
 
+/* fields for CSR_MIPSCACHEERR */
+#define MIPSCACHEERR_STATE	GENMASK(31,30)
+#define MIPSCACHEERR_ARRAY	GENMASK(29,26)
+#define MIPSCACHEERR_ERR_BIT	GENMASK(25,20)	/* for correctable */
+#define MIPSCACHEERR_F2		BIT(23)		/* for uncorrectable */
+#define MIPSCACHEERR_F		BIT(22)		/* for uncorrectable */
+#define MIPSCACHEERR_P		BIT(21)		/* for uncorrectable */
+#define MIPSCACHEERR_S		BIT(20)		/* for uncorrectable */
+#define MIPSCACHEERR_WAY	GENMASK(19,17)
+#define MIPSCACHEERR_INDEX	GENMASK(16,4)
+#define MIPSCACHEERR_WORD	GENMASK(3,0)
+
+/* fields for CSR_MIPSERRCTL */
+#define MIPSERRCTL_PE		BIT(31)
+#define MIPSERRCTL_BUS_TO	GENMASK(19,10)
+
+/* fields for CSR_MIPSCONFIG1 */
 #define MIPSCONFIG1_L2C		BIT(31)
 #define MIPSCONFIG1_IS		GENMASK(24,22)
 #define MIPSCONFIG1_IL		GENMASK(21,19)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
