Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B489EC43602
	for <opensbi@archiver.kernel.org>; Tue,  7 Jul 2026 03:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ij9nW40iviv972cgfRqicftOcUOopVc3RHsBPxmoTOc=; b=KJpp9ORY30lU5R
	bp59ARiLidGclRckhU3maUdy6NrYx4rgFVbZ2C4L15uXBMyLzOgvDr2YLkp6Se2pDp+bv6CoQvZ+w
	AUeJb5Txe/eTzMkGkWnWFhA7X81G/TZW4csW3ld0GPJqnV2tk5zxLso+CNS4lok+6XzApDFU07OMy
	luE/EiB3MyZkzBAOInl5phTabB+e+Xa0SQUuL8MryDvtWCIjWjZSFqpjWaDRfWMgOsiHkkXTqhUGY
	+gcO7wM7K+5uxfDMIKdNphtC89p6EnNXe/4VanTYG/uoGjfzM3Zevf8tj0SlsYtYNXETCrqEjnz3+
	/83/l9JHLjdP37vzCZGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwfE-0000000E16g-2DJX;
	Tue, 07 Jul 2026 03:40:04 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgwf9-0000000E14v-0uMY
	for opensbi@lists.infradead.org;
	Tue, 07 Jul 2026 03:40:00 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso3823695a91.2
        for <opensbi@lists.infradead.org>; Mon, 06 Jul 2026 20:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1783395598; x=1784000398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CTIzuy8nA2uwCOpglOueO0WAPfJmnfSiF7f+nq/XxT0=;
        b=P1AsDo90Q3lTIPBUfurbk3k6OayRlvLyYBvVll72/YVOCzH74DJhVDaIfeTlxQWXlq
         apvooOn4IuTkJwfu+wtNvzCy77CFyCfjjJ2lnVsIz2I67sog981F77KCcuGcx96r39ji
         onOMnAkglFPiXdCZ6vzkTCjz00dZk26K0uqevMygMF6ML1/uTxSpVdT0ehgdd1wBW9ib
         nff0xKhkLb0pzj0rZWVMDyDu55SuiLXHv+hEQZ2poDY9MR13SFSHi9sLhTxv3LFjWJN4
         LmKfy5GpNqBuoH9uTlOKyE1jUY3apbpRqt/UD8mWB2zEQ4dT1i8v13/Zxtxb/y57C1nz
         F7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783395598; x=1784000398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CTIzuy8nA2uwCOpglOueO0WAPfJmnfSiF7f+nq/XxT0=;
        b=HpWNQLVJmnwqSzf3c9jcvWS38RdYIPmisYpZR3B9ZdqbJOaTzXvGAitvy7crhleukj
         KKvBZtgrJlOBkvn2QyulsOichB4bBonPuaXt7mdQPIcQy0fQsDnp4ZoE6a0LLC5Rps9t
         nej08lh95sLjPwFPy58n+EqIyJWUxZPWH9x5ZhZSHouKD/DYfubk04QAPEIt019TOaU1
         u2uB/XA7/KlRir6LqQqYhK6+4Wdc3peG923ng38NPiCsJFQZ8SQUX+OaUDaFNl0dKELf
         j+N7xTdt5oggeJvJBwuS66fWn6nEfGcGDsnrWak0i6sBfpbuWzp8FQ4XflPRZp6nIIcm
         gMaA==
X-Gm-Message-State: AOJu0YzwN85BMMaB6qdFMy92mu8b7yIWL8UQD4SohHHrzWzHNOYQt3r1
	dEp+3qqfWgriL6OG4OkZBNxafu1jf3Q1zrT0Gg2Zm6Qatz5eCLcqZWEhMe9sPAXsw7hP/Gq5Qh3
	+UzZx88fdhMRJMZ4nurHl8xSNe/gNref3SRdLoza27TySPGs/RzEZ5osSIGp1hLx8VUUofdmSVn
	Mk6Yb82I532upPmqFVaIfE9kFsuHltZZUWYvZhB5Q0GB9ALw==
X-Gm-Gg: AfdE7cmvEnxq3zoY2pIpbQoTw5hbQQBHTluUYe2z2iC+kiIZF3yD7hwXZl9qQaHJA4w
	hH9jPx3CYD0UD44kUxY7cqhkiMtvKGwV97ZZK+QS/iVbpYihume3HrWltsQOGqNtmycvSzXxtii
	fg3BuN+51L6xdLxTuXLi1d2nK//z9ZcT/KJmfBZ35YP25D8eJ/BVUBxlZ31i21oqCUL6h4WlQ1Y
	AAXvhEkfWhC+gWbxkJoku65kzJIbprQ46QpCSP0fDerb1PhG8kw9DTnWqJm/b+6vbs4bGfGpjGt
	Ee1j8kF1IJwzu5lwiIVz+MCnP9h91fQc5InNJk7B2zJXmv8+cl63yOYCIbR6xeAuxkA965dNSvu
	F8jnDIcKRDNDqcsUuGgX7dlGYNyM4EnwMFV0BtZx5/7kU4EC21NFd0nGHd93Celo83RLwQoejoi
	2EY/El0tMV4CmB0RlwLW68ggJW
X-Received: by 2002:a17:90b:4a87:b0:37f:9ce2:348c with SMTP id 98e67ed59e1d1-38758064e54mr3596015a91.29.1783395597907;
        Mon, 06 Jul 2026 20:39:57 -0700 (PDT)
Received: from sw04.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f596asm2904096eec.2.2026.07.06.20.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 20:39:57 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: opensbi@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH 1/7] firmware: fw_dynamic: add boot_dtb field to struct fw_dynamic_info
Date: Mon,  6 Jul 2026 20:39:48 -0700
Message-ID: <20260707033954.2054859-2-zong.li@sifive.com>
X-Mailer: git-send-email @GIT_VERSION@
In-Reply-To: <20260707033954.2054859-1-zong.li@sifive.com>
References: <20260707033954.2054859-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_203959_257224_673CC781 
X-CRM114-Status: GOOD (  13.05  )
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

Introduce a new info version (FW_DYNAMIC_INFO_VERSION_3) and add an
unsigned long 'boot_dtb' member at the end of struct fw_dynamic_info to
carry the device tree blob (DTB) address.

This field will be consumed by the new FW_DYNAMIC_APPEND firmware type.

Signed-off-by: Zong Li <zong.li@sifive.com>
---
 include/sbi/fw_dynamic.h | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/sbi/fw_dynamic.h b/include/sbi/fw_dynamic.h
index 2ab4dbab..5fcf5dab 100644
--- a/include/sbi/fw_dynamic.h
+++ b/include/sbi/fw_dynamic.h
@@ -26,13 +26,16 @@
 #define FW_DYNAMIC_INFO_OPTIONS_OFFSET		(4 * __SIZEOF_LONG__)
 /** Offset of boot_hart member in fw_dynamic_info  (version >= 2) */
 #define FW_DYNAMIC_INFO_BOOT_HART_OFFSET	(5 * __SIZEOF_LONG__)
+/** Offset of boot_dtb member in fw_dynamic_info  (version >= 3) */
+#define FW_DYNAMIC_INFO_BOOT_DTB_OFFSET		(6 * __SIZEOF_LONG__)
 
 /** Expected value of info magic ('OSBI' ascii string in hex) */
 #define FW_DYNAMIC_INFO_MAGIC_VALUE		0x4942534f
 
 /** Maximum supported info version */
 #define FW_DYNAMIC_INFO_VERSION_2		0x2
-#define FW_DYNAMIC_INFO_VERSION_MAX		FW_DYNAMIC_INFO_VERSION_2
+#define FW_DYNAMIC_INFO_VERSION_3		0x3
+#define FW_DYNAMIC_INFO_VERSION_MAX		FW_DYNAMIC_INFO_VERSION_3
 
 /** Possible next mode values */
 #define FW_DYNAMIC_INFO_NEXT_MODE_U		0x0
@@ -73,6 +76,17 @@ struct fw_dynamic_info {
 	 * to use the relocation lottery mechanism.
 	 */
 	unsigned long boot_hart;
+	/**
+	 * Address of the device tree blob (DTB) to be passed to the next
+	 * booting stage.
+	 *
+	 * This field is only meaningful for the FW_DYNAMIC_APPEND firmware
+	 * type (version >= 3), where the previous booting stage patches the
+	 * appended fw_dynamic_info structure at the tail of the OpenSBI
+	 * binary instead of passing a pointer in a2. fw_base.S loads this
+	 * value into a1 before the normal boot flow.
+	 */
+	unsigned long boot_dtb;
 } __packed;
 
 /**
@@ -85,6 +99,7 @@ assert_member_offset(struct fw_dynamic_info, next_addr, FW_DYNAMIC_INFO_NEXT_ADD
 assert_member_offset(struct fw_dynamic_info, next_mode, FW_DYNAMIC_INFO_NEXT_MODE_OFFSET);
 assert_member_offset(struct fw_dynamic_info, options, FW_DYNAMIC_INFO_OPTIONS_OFFSET);
 assert_member_offset(struct fw_dynamic_info, boot_hart, FW_DYNAMIC_INFO_BOOT_HART_OFFSET);
+assert_member_offset(struct fw_dynamic_info, boot_dtb, FW_DYNAMIC_INFO_BOOT_DTB_OFFSET);
 
 #endif
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
