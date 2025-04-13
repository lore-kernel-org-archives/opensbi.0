Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7807DC369B6
	for <opensbi@archiver.kernel.org>; Sun, 13 Apr 2025 15:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zECIb2bjg9vdwjHUNTa4Z2XiRbTniurS7rDLMOzFK2I=; b=yRaqLwoLDYg935
	LAcmULGGAuXrDT9JCzSAr1OcaUI6mx4sZy+aDPkSOAUOS1hWyjkn8kiN5qj4TNSJ/2c00Sdfd+Ea1
	OHhG/wUsrBQUGEz8zrA0trjlT2wgp04RPPPSPn3V3ylUUzW+Aw11hMRB3w3vthXFKFEAGzp+x2kJr
	3H/QMdm2c8slXgfGs79tvaXzTGNzMsilwJhyG2gu3gRshK+/fIl0yQw6eK2jfirjk5KyT3DT5qqkA
	dqWs8Q/VMvt/B+NAVxkRXAwqqQsF2gp4c/Y9NWbz7BqdfbymCyoN/WoFAAb/9vIK8i1PiYqjrLdPX
	dGifE80viWurSHr6sBCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yv4-0000000HIic-3oEf;
	Sun, 13 Apr 2025 15:06:50 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3yuz-0000000HIfx-37WG
	for opensbi@lists.infradead.org;
	Sun, 13 Apr 2025 15:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=/raGh
	hwk1RyX5eZKjIGpmbfEFj6TaroNFPcycAYfERY=; b=bxXtWUBihVzci/WRY1wWf
	vREHK0f/+w4fHrDmYCITL6TjDEgvnNfVBSRYcjrQ9a9gzeP0Q3Ab+rOxQwfXp+Ah
	Ku50LTITTeEvuILbbu/UgaeW3cS789ZBLs3DXcG8V76A0q9p/+ftigNHxOghRMKR
	bye0KpMiB6NX54D2YXGWgs=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P+H30vtnZUv4Aw--.52201S5;
	Sun, 13 Apr 2025 23:06:34 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 3/5] lib: sbi: Fix sbi_timer for Asymmetric Multi-Processing
Date: Sun, 13 Apr 2025 23:06:18 +0800
Message-ID: <20250413150628.75614-4-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250413150628.75614-1-wxjstz@126.com>
References: <20250413150628.75614-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3P+H30vtnZUv4Aw--.52201S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxGr1xKF4rKF4DXF4DCFWfKrg_yoW5Xw48p3
	y3Kay7JrW0qrW0gw18Gw1DZr95G3WkJw18GrykKw48Aa1fJrWrJFy7tF15tFW7AF9Fgaya
	yr4Fvr1FkF4UJ37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi1v38UUUUU=
X-Originating-IP: [112.83.182.169]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5BAuOmf7z4BIpwAAsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_080646_100875_A3833B2C 
X-CRM114-Status: GOOD (  13.62  )
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

The original get_time_val is assigned to get_ticks by detecting
Zicntr during cold boot. However, if the multi-core system is not
symmetrical, some cores do not have the Zicntr extension, and an
error will occur when executing sbi_timer_value.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 lib/sbi/sbi_timer.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/lib/sbi/sbi_timer.c b/lib/sbi/sbi_timer.c
index 14e5ee46..5266c612 100644
--- a/lib/sbi/sbi_timer.c
+++ b/lib/sbi/sbi_timer.c
@@ -19,7 +19,6 @@
 #include <sbi/sbi_timer.h>
 
 static unsigned long time_delta_off;
-static u64 (*get_time_val)(void);
 static const struct sbi_timer_device *timer_dev = NULL;
 
 #if __riscv_xlen == 32
@@ -52,16 +51,19 @@ static void nop_delay_fn(void *opaque)
 void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 			  void (*delay_fn)(void *), void *opaque)
 {
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
 	u64 start_val, delta;
 
 	/* Do nothing if we don't have timer device */
-	if (!timer_dev || !get_time_val) {
+	if (!timer_dev ||
+	    (!sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR) &&
+	     !timer_dev->timer_value)) {
 		sbi_printf("%s: called without timer device\n", __func__);
 		return;
 	}
 
 	/* Save starting timer value */
-	start_val = get_time_val();
+	start_val = sbi_timer_value();
 
 	/* Compute desired timer value delta */
 	delta = ((u64)timer_dev->timer_freq * (u64)units);
@@ -72,7 +74,7 @@ void sbi_timer_delay_loop(ulong units, u64 unit_freq,
 		delay_fn = nop_delay_fn;
 
 	/* Busy loop until desired timer value delta reached */
-	while ((get_time_val() - start_val) < delta)
+	while ((sbi_timer_value() - start_val) < delta)
 		delay_fn(opaque);
 }
 
@@ -91,8 +93,11 @@ bool sbi_timer_waitms_until(bool (*predicate)(void *), void *arg,
 
 u64 sbi_timer_value(void)
 {
-	if (get_time_val)
-		return get_time_val();
+	struct sbi_scratch *scratch = sbi_scratch_thishart_ptr();
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR))
+		return get_ticks();
+	if (timer_dev && timer_dev->timer_value)
+		return timer_dev->timer_value();
 	return 0;
 }
 
@@ -181,8 +186,6 @@ void sbi_timer_set_device(const struct sbi_timer_device *dev)
 		return;
 
 	timer_dev = dev;
-	if (!get_time_val && timer_dev->timer_value)
-		get_time_val = timer_dev->timer_value;
 }
 
 int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
@@ -196,9 +199,6 @@ int sbi_timer_init(struct sbi_scratch *scratch, bool cold_boot)
 		if (!time_delta_off)
 			return SBI_ENOMEM;
 
-		if (sbi_hart_has_extension(scratch, SBI_HART_EXT_ZICNTR))
-			get_time_val = get_ticks;
-
 		ret = sbi_platform_timer_init(plat);
 		if (ret)
 			return ret;
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
