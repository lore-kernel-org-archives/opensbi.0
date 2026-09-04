Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F82C79F87
	for <opensbi@archiver.kernel.org>; Fri,  4 Sep 2026 16:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d9vxWCZmo1TSNiFVrw/raK+L3ef1H8waw7cB6PjxGLA=; b=MHrGeD6f0d844N
	Blqrl/tgagi423fssdcjqIe9dcmTyKSt0dQLIqPfVMcZI24DMYJQo3sNu0TKtGeMe6F/jFm7KxIO1
	OSX9tGs2dcoeKKnSWq3YGF06GHEjXBor8NiASYhu9ZnnkvfcJ0OWJT7fVcaId7DgzuJ+1NaLAgZ7W
	nNBrbBITY3GExCiXqCvgIfS8wGve7y0int78sILftjxg4ZJON93yH6Dhz4Vwdtod4rPK6r2nmy9mj
	ANiLsnOS/RGmQwTqEg3h03TKhTsO8zxsP4P3BpHd9L/BPN8J77dOO1SQW/XR2r9ArZnbQbl+fLvls
	U5ZmCY+0hU6WNLTzWF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnH-00000002jZH-31aI;
	Fri, 04 Sep 2026 16:29:35 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WnF-00000002jXk-1n7e
	for opensbi@lists.infradead.org;
	Fri, 04 Sep 2026 16:29:34 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-90ce08834feso17726856d6.0
        for <opensbi@lists.infradead.org>; Fri, 04 Sep 2026 09:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788539372; x=1789144172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BxkmhAiEgzgL0m6a2XIwYI28aet6jKP6N+Rmyc23lkE=;
        b=qUM9xWQQNVHIW/Csv7+U06ZGF+khQ236ZU8P7NGa+S2jzteAFpV9Da1S3Q3XLOeslt
         NBXVC3bVJULSTNBTqVvMhLhsytf+i4TZaMlMkG/tq/k3i14y7mDffHek7IBIeTkijHWX
         bnGqhCPjcbjUBgCodORJjAihTW3ATYMbK2LMQc54MiHzVm/I3AU4M+81B+f8k1hN6OE4
         LBiDDuZ11dk8LFaVlNHdoCYad6ZvBdt7DmkcTr0pwkor/k13a8MBc/6r6oqo+h9HjG1J
         XUTIYApUEzycsmE1qH8/cCJnns/GXUbS3mX9yguK6o+ZMC0JF5vjK0kn48pdiHs/SHiX
         zzHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788539372; x=1789144172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BxkmhAiEgzgL0m6a2XIwYI28aet6jKP6N+Rmyc23lkE=;
        b=UmnojNARU6h1L2/nCl8dC0H0V2kGaVMgJIiCEz678XpJ5A2GOUtm596y8kgrJEK93p
         zeasO1lWe/a5wuWfoytv2grrfjfs5JD9MJypOor3hpi7ckWfZihcsXsR5UMZBHpi3Z8Z
         HqSoPthr5ngfRpw5m7NHmi7MO1vAri4N9igXXY/FDSoXc88oV04UED2RIXNsmUemjSGE
         I0lc5VpI8Q71T0eZlqKnDottUy6sE6aIYjb48COZ4XuWeA0BedHzGWEZNteAFblWNewK
         bJsB5QWDypeK5J/QLEyif+idW+b1Ka+xGSRDKqPvGGC6OPMDYYSJj2vQhcb4GWVjXbQL
         LWLQ==
X-Gm-Message-State: AFuF++nyy+XS3WLywZV55DIUaFOGNAvpPeHARadgRgq5b+VNbNbQrnXD
	S7C/umUkqpU9nYrFghJDHPS5gr1ve0NAXRVcsB1TnEi/W/6vk54wDxsyukEfkQ==
X-Gm-Gg: AYBFou2OxZ9iDmKKPDpoQHiBuXTkuMGKFnWILZ+zHt9pIZtxLVuW0GCOS9RRdR8JX/w
	KOnSQpcS3hxjYf8g4D323tA5MZHG1ffDq2aDYmg243m3QR2hFUJqp/O5Ip8d5wMxhV/HIAkCLWv
	GzqXcYcCVJJUpqgMVJVbiZVQFhvvz+3ireDzfoydqniv/sV1bmz5qgrSlLEmadozNhuSvbaidwV
	VzmEebx4lkHbnunepW4aIOAM8a1YdG6zdqoK28I082WpHkoMJLNpc+cVAqioquQwJOqMb5ZgPgI
	Xx6dbks/TqXuUtcKXaaqVOWs//+lTKfbSyqAsqhzXqGOcViR0FcAW28l2v+OKmwlvriKn/Bc9a5
	bZQbzUmbyP+uXkKowr5AVbXErENbcRqA7fBhW6DrDW60js05RY/XwJbQ4h/eb3RZ9L+WZOm9xvL
	xZDNThZay67z8xhl2mOYzJsjo1Ib1zDAR7QhYrCMgXHl2GU3Gytvc/eZBuGvG0EsdU4HvPXIBmo
	afM0PlJ9KpKXWxiyvz9hQ==
X-Received: by 2002:ad4:4ee4:0:b0:910:3453:d4a7 with SMTP id 6a1803df08f44-9103f0365famr73973716d6.33.1788539372124;
        Fri, 04 Sep 2026 09:29:32 -0700 (PDT)
Received: from ubuntu.localdomain ([209.227.130.181])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910405966f0sm24432386d6.6.2026.09.04.09.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 09:29:31 -0700 (PDT)
From: Raymond Mao <raymondmaoca@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	scott@riscstar.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	peter.lin@sifive.com
Subject: [PATCH v3 2/5] hart: add WorldGuard CSR IDs and hart extension flags
Date: Fri,  4 Sep 2026 12:29:12 -0400
Message-Id: <20260904162915.1092353-3-raymondmaoca@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260904162915.1092353-1-raymondmaoca@gmail.com>
References: <20260904162915.1092353-1-raymondmaoca@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_092933_481048_D41E5C22 
X-CRM114-Status: UNSURE (   8.82  )
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

From: Raymond Mao <raymond.mao@riscstar.com>

Define the WorldGuard-related CSR numbers and advertise the Worlds
ISA extensions: smlwid, smlwidlist, smwid, smwiddeleg, and sswid.
This lets platform code probe support before programming MLWID,
MLWIDLIST, MWIDDELEG, and SLWID.

Signed-off-by: Raymond Mao <raymond.mao@riscstar.com>
---
 include/sbi/riscv_encoding.h |  4 ++++
 include/sbi/sbi_hart.h       | 10 ++++++++++
 lib/sbi/sbi_hart.c           |  5 +++++
 3 files changed, 19 insertions(+)

diff --git a/include/sbi/riscv_encoding.h b/include/sbi/riscv_encoding.h
index ffe7666c..5aca57a5 100644
--- a/include/sbi/riscv_encoding.h
+++ b/include/sbi/riscv_encoding.h
@@ -373,6 +373,7 @@
 
 /* Supervisor Protection and Translation */
 #define CSR_SATP			0x180
+#define CSR_SLWID			0x190
 
 /* Supervisor Indirect Register Alias */
 #define CSR_SISELECT			0x150
@@ -510,6 +511,7 @@
 /* Machine Configuration */
 #define CSR_MENVCFG			0x30a
 #define CSR_MENVCFGH			0x31a
+#define CSR_MLWID			0x390
 
 /* Machine Trap Handling */
 #define CSR_MSCRATCH			0x340
@@ -736,6 +738,8 @@
 /* Machine Security Configuration CSR (mseccfg) */
 #define CSR_MSECCFG			0x747
 #define CSR_MSECCFGH			0x757
+#define CSR_MWIDDELEG			0x748
+#define CSR_MLWIDLIST			0x74a
 
 #define MSECCFG_MML_SHIFT		(0)
 #define MSECCFG_MML			(_UL(1) << MSECCFG_MML_SHIFT)
diff --git a/include/sbi/sbi_hart.h b/include/sbi/sbi_hart.h
index 543393bb..67362ec3 100644
--- a/include/sbi/sbi_hart.h
+++ b/include/sbi/sbi_hart.h
@@ -63,6 +63,16 @@ enum sbi_hart_extensions {
 	SBI_HART_EXT_SSCSRIND,
 	/** Hart has Ssccfg extension */
 	SBI_HART_EXT_SSCCFG,
+	/** Hart has Smlwid extension */
+	SBI_HART_EXT_SMLWID,
+	/** Hart has Smlwidlist extension */
+	SBI_HART_EXT_SMLWIDLIST,
+	/** Hart has Smwid extension */
+	SBI_HART_EXT_SMWID,
+	/** Hart has Smwiddeleg extension */
+	SBI_HART_EXT_SMWIDDELEG,
+	/** Hart has Sswid extension */
+	SBI_HART_EXT_SSWID,
 	/** Hart has Svade extension */
 	SBI_HART_EXT_SVADE,
 	/** Hart has Svadu extension */
diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index bee88557..aeafb51a 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -344,6 +344,11 @@ const struct sbi_hart_ext_data sbi_hart_ext[] = {
 	__SBI_HART_EXT_DATA(smcdeleg, SBI_HART_EXT_SMCDELEG),
 	__SBI_HART_EXT_DATA(sscsrind, SBI_HART_EXT_SSCSRIND),
 	__SBI_HART_EXT_DATA(ssccfg, SBI_HART_EXT_SSCCFG),
+	__SBI_HART_EXT_DATA(smlwid, SBI_HART_EXT_SMLWID),
+	__SBI_HART_EXT_DATA(smlwidlist, SBI_HART_EXT_SMLWIDLIST),
+	__SBI_HART_EXT_DATA(smwid, SBI_HART_EXT_SMWID),
+	__SBI_HART_EXT_DATA(smwiddeleg, SBI_HART_EXT_SMWIDDELEG),
+	__SBI_HART_EXT_DATA(sswid, SBI_HART_EXT_SSWID),
 	__SBI_HART_EXT_DATA(svade, SBI_HART_EXT_SVADE),
 	__SBI_HART_EXT_DATA(svadu, SBI_HART_EXT_SVADU),
 	__SBI_HART_EXT_DATA(smnpm, SBI_HART_EXT_SMNPM),
-- 
2.25.1


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
