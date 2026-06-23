Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A0ACDB46F
	for <opensbi@archiver.kernel.org>; Tue, 23 Jun 2026 02:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IXZNf1dZQVvrQy8pAYBRVtrGe7lv2JShrwLvbDYJoEc=; b=FHSeD9H5hIAL9g
	VIazj3wtdRWZ15rtljeoSS42/+Vt+O7NMMxHuB7ZmtgAKp7l2ZNxJvCTyhwATA4AlD7DCYPIDHXKk
	p8GcF8dFlX4q6voDwRR65tW8lM3A99Y9WkUwnZhN44UR/8Vp0A7Mhgtk+CnBfT5Y5NwplFICs8YZm
	cfoo1czLSudLUeFuXdg61Lh75kJRn6lbwHnywfZGkV8/oy9i6gVo/sIljf5MXOe5S5rZyjyjyBj+O
	gghBDC5hKmfYhMXjPzr2T+MH5zPocMXpmB75fkVLywZJ+9M/EO/jYOeZXtFtI4QHRDYaL+RB/yJj8
	6FxtERpPKCSdyjWmJRZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrDF-00000005bp5-1UhX;
	Tue, 23 Jun 2026 02:50:09 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbrDC-00000005boi-04Ug
	for opensbi@lists.infradead.org;
	Tue, 23 Jun 2026 02:50:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1782182996; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iQCWG4qycHcGoS0QF7L3jbrdvD4NZrB6dJ4fCwCMatUFsEwcP3CZ08vcD3r3OjmtIBXfVJmLqlLd6cotEQUzdtv0kfw9DjSInuPo+GfidRnQ4VZYAz27U3doAeWgYZsIeoEPqTIphnoRhp7cbaOm6NW1gGr5h/ZDuP7cN3756BY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1782182996; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=6uwLUim5YbEQWxqk15fz80zmZ92ufANQDv/XH/rQ6m8=; 
	b=f36ce6s5nJFgg7/8jAWPkrm5pPEUKDKcZckG8iuPLk0MixvRKs8pkRREPQbeI61vPsTNwpx6TaKNzO3pGSn4QlbLrUIHgb+fqePDh/przoK+6uUJocMFx5kYpQB1dRMr0GW+zYcfTNL5d/tzdroWRU/GkpTXW4ZzEXFRSQNI3gA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1782182996;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Cc:Cc:Reply-To;
	bh=6uwLUim5YbEQWxqk15fz80zmZ92ufANQDv/XH/rQ6m8=;
	b=h7AGDLF57TvTJAwNRAGfioZgEOyIOhoyraazOqOirxAMMBx4I0pilmb8pkxJHYRy
	8a5OaWbDvXJpZrXNWQK3cJBNMlgzHQeRiBH22ocYkhONIP6WWD9pHzsiWYYzOz0cNu1
	xVGAT4FB1hxRR8uY3IfKwGh80jVGudhGpaOPiHME=
Received: by mx.zohomail.com with SMTPS id 1782182993856948.8207460762544;
	Mon, 22 Jun 2026 19:49:53 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 23 Jun 2026 10:49:25 +0800
Subject: [PATCH] platform: generic: spacemit: k1: fix wrong address
 definitions
MIME-Version: 1.0
Message-Id: <20260623-k1-fix-addr-v1-1-3dbde8c03bd6@pigmoral.tech>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMyw5AMBCF4VeRWZukrejCq4hFL1OGBGkRiXh3x
 fLLyfkvSBSZEjTFBZEOTrzMGbIswA1m7gnZZ4MSSgstapwkBj7ReB+RVB20qqQLVkJ+rJHy9tX
 a7nfa7UhuexNw3w+Hm4eJbwAAAA==
X-Change-ID: 20260605-k1-fix-addr-e25f6231cfb1
To: opensbi@lists.infradead.org
Cc: Xianbin Zhu <xianbin.zhu@linux.spacemit.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, spacemit@lists.linux.dev, 
 Junhui Liu <junhui.liu@pigmoral.tech>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782182988; l=4361;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=0/n35Voh+5ojdPBR3qx+elkjhoB6WNleuxFAonpdkPk=;
 b=i7+5K1n9qyIl8Kc2K/1kRRZTEJFawdoJqZImyjUsxFOVNi94JGFwBmu8ZE/CKN+2Mlo+m2JOa
 wrghxvufhQWDoPkOH1M/NGb/4ZQRSNg3Zz5HeycHmS/TeyTaOKdR2Wk
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_195006_448481_9EBB957E 
X-CRM114-Status: UNSURE (   6.88  )
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

PMU_AP_CORE2_IDLE_CFG and PMU_AP_CORE3_IDLE_CFG are not continuous with
PMU_AP_CORE0_IDLE_CFG and PMU_AP_CORE1_IDLE_CFG. They are at PMU AP
base + 0x160 and + 0x164, matching the vendor OpenSBI definitions. After
fixing these addresses, the intermediate cluster offset macros are
redundant now, so define the wakeup and idle registers directly as
PMU_AP_BASE offsets. This makes the actual register addresses easier to
inspect and compare against the vendor code.

C1_RVBADDR_HI_ADDR is also corrected according to the vendor OpenSBI
definition. This was tested by writing an invalid value to the corrected
address, which prevents cluster1 CPUs from coming online, while doing
the same with the old address does not affect SMP boot.

Fixes: 1f84ec2a ("platform: generic: spacemit: add K1")
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 platform/generic/include/spacemit/k1.h | 46 +++++++++++++---------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/platform/generic/include/spacemit/k1.h b/platform/generic/include/spacemit/k1.h
index bd666346..7095bc08 100644
--- a/platform/generic/include/spacemit/k1.h
+++ b/platform/generic/include/spacemit/k1.h
@@ -25,33 +25,23 @@
 
 #define PMU_AP_BASE				0xd4282800
 
-#define PMU_AP_CORE0_WAKEUP_OFFSET		(PMU_AP_BASE + 0x12c)
-#define PMU_AP_CORE4_WAKEUP_OFFSET		(PMU_AP_BASE + 0x324)
-#define PMU_AP_CLUSTER0_WAKEUP_OFFSET(index)	(PMU_AP_CORE0_WAKEUP_OFFSET + index * 4)
-#define PMU_AP_CLUSTER1_WAKEUP_OFFSET(index)	(PMU_AP_CORE4_WAKEUP_OFFSET + index * 4)
-
-#define PMU_AP_CORE0_IDLE_CFG_OFFSET		(PMU_AP_BASE + 0x124)
-#define PMU_AP_CORE4_IDLE_CFG_OFFSET		(PMU_AP_BASE + 0x304)
-#define PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(index)	(PMU_AP_CORE0_IDLE_CFG_OFFSET + index * 4)
-#define PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(index)	(PMU_AP_CORE4_IDLE_CFG_OFFSET + index * 4)
-
-#define PMU_AP_CORE0_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(0)
-#define PMU_AP_CORE1_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(1)
-#define PMU_AP_CORE2_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(2)
-#define PMU_AP_CORE3_WAKEUP			PMU_AP_CLUSTER0_WAKEUP_OFFSET(3)
-#define PMU_AP_CORE4_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(0)
-#define PMU_AP_CORE5_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(1)
-#define PMU_AP_CORE6_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(2)
-#define PMU_AP_CORE7_WAKEUP			PMU_AP_CLUSTER1_WAKEUP_OFFSET(3)
-
-#define PMU_AP_CORE0_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(0)
-#define PMU_AP_CORE1_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(1)
-#define PMU_AP_CORE2_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(2)
-#define PMU_AP_CORE3_IDLE_CFG			PMU_AP_CLUSTER0_IDLE_CFG_OFFSET(3)
-#define PMU_AP_CORE4_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(0)
-#define PMU_AP_CORE5_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(1)
-#define PMU_AP_CORE6_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(2)
-#define PMU_AP_CORE7_IDLE_CFG			PMU_AP_CLUSTER1_IDLE_CFG_OFFSET(3)
+#define PMU_AP_CORE0_WAKEUP			(PMU_AP_BASE + 0x12c)
+#define PMU_AP_CORE1_WAKEUP			(PMU_AP_BASE + 0x130)
+#define PMU_AP_CORE2_WAKEUP			(PMU_AP_BASE + 0x134)
+#define PMU_AP_CORE3_WAKEUP			(PMU_AP_BASE + 0x138)
+#define PMU_AP_CORE4_WAKEUP			(PMU_AP_BASE + 0x324)
+#define PMU_AP_CORE5_WAKEUP			(PMU_AP_BASE + 0x328)
+#define PMU_AP_CORE6_WAKEUP			(PMU_AP_BASE + 0x32c)
+#define PMU_AP_CORE7_WAKEUP			(PMU_AP_BASE + 0x330)
+
+#define PMU_AP_CORE0_IDLE_CFG			(PMU_AP_BASE + 0x124)
+#define PMU_AP_CORE1_IDLE_CFG			(PMU_AP_BASE + 0x128)
+#define PMU_AP_CORE2_IDLE_CFG			(PMU_AP_BASE + 0x160)
+#define PMU_AP_CORE3_IDLE_CFG			(PMU_AP_BASE + 0x164)
+#define PMU_AP_CORE4_IDLE_CFG			(PMU_AP_BASE + 0x304)
+#define PMU_AP_CORE5_IDLE_CFG			(PMU_AP_BASE + 0x308)
+#define PMU_AP_CORE6_IDLE_CFG			(PMU_AP_BASE + 0x30c)
+#define PMU_AP_CORE7_IDLE_CFG			(PMU_AP_BASE + 0x310)
 
 /* power down */
 #define PMU_AP_IDLE_PWRDWN			BIT(0)
@@ -68,7 +58,7 @@
 #define C0_RVBADDR_LO_ADDR			0xd4282db0
 #define C0_RVBADDR_HI_ADDR			0xd4282db4
 #define C1_RVBADDR_LO_ADDR			0xd4282eb0
-#define C1_RVBADDR_HI_ADDR			0xd4282c04
+#define C1_RVBADDR_HI_ADDR			0xd4282eb4
 
 #define CCI_550_PLATFORM_CCI_ADDR		0xd8500000
 

---
base-commit: a8be5e9478be08f09a720f7013ec30d6e2bd9fcc
change-id: 20260605-k1-fix-addr-e25f6231cfb1

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
