Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 830C3C3ABCB
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 05:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I5AElDljt/AE1Vq9xrMxWwkL6lN+z1TLVeM0Fv7+F/Q=; b=FlbqhSAPN80azK
	2Wd+Gjjk4S/8ZsPLqNK79G9Q1AXMgkUTrzNJzvo/Hh+eyX1IDHdww+ltX4kXz+BBwDI0gJXpOkWLz
	fOmvqWsE1KHY03eYttOI1ekGWuWyjWN9vcoPGwjtV+cqtkY3NguIa+vCZs7IMkzMLIsNSDVThHpd7
	/HJELZTGLzb0VZ8w8GyrHiWXUeJV3182nnz3FgOfSV1NIraiCcWChGma9sslA0D2HJcCoMikkDOxn
	Rqq+erfG3q0f42JHl1VIuDV6HWFrOU+534e1FMuozo6LZOjRx8/h/Z/7MSdSaLdrGUt7McSqT29Yr
	yzUInHHzIi75KYgD38qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF4bf-0000000E4ju-1p27;
	Wed, 14 May 2025 05:24:39 +0000
Received: from m16.mail.126.com ([220.197.31.9])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF4bc-0000000E4if-039x
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 05:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8g
	R3ywwZOQ5uXYittI9xF0mkNxqQWFfTrQGb20gedj4=; b=qJ81gOW/fURGIu+z0p
	9KPvpsLBVcgkcKpSryan7DRluYWagdvY9fzMOAhyT+2wvcDP8J/tw0v0dVC7eEsn
	bljb8r0hoy2EUyk88WpPYj9+sQ5a9vgy2Rj6I5loxTVaC9S3TCq11Q5RdkJlz7e/
	bo+cnNWLGUV/xoZI0/YaOcwDs=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3fwUIKSRoQHfbAA--.24362S2;
	Wed, 14 May 2025 13:24:25 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	hchauhan@ventanamicro.com,
	Xiang W <wxjstz@126.com>
Subject: [PATCH v2] lib: sbi: Optimize saddr mapping in sbi_dbtr.c
Date: Wed, 14 May 2025 13:24:02 +0800
Message-ID: <20250514052422.575551-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wD3fwUIKSRoQHfbAA--.24362S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr48CFWfGFWDtr4fGFy5XFb_yoW5Gr4rpF
	Z5CF1DKrs2qryUt3y8Jw18Aryru3WxXa45t39akryv9as8Zr18Xry29w1vva4SqrWjva12
	yF1j9F4jkFs8JFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zug4mAUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AJNOmgkJbIZcAABsi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_222436_353922_32965B2D 
X-CRM114-Status: UNSURE (   7.68  )
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

The original implementation mapped saddr individually for each entry.
The updated code now maps saddr for all entries in a single operation.
This change reduces the number of PMP (Physical Memory Protection)
operations, improving efficiency and performance.

Signed-off-by: Xiang W <wxjstz@126.com>
---
changes in v2:
- Fixed a type conversion error
---
 lib/sbi/sbi_dbtr.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f0e91285..b018e7cb 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -523,16 +523,17 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
+	sbi_hart_map_saddr((unsigned long)shmem_base,
+			   trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
 		xmit->tstate = cpu_to_lle(trig->state);
 		xmit->tdata1 = cpu_to_lle(trig->tdata1);
 		xmit->tdata2 = cpu_to_lle(trig->tdata2);
 		xmit->tdata3 = cpu_to_lle(trig->tdata3);
-		sbi_hart_unmap_saddr();
 	}
+	sbi_hart_unmap_saddr();
 
 	return SBI_SUCCESS;
 }
@@ -556,10 +557,11 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
+	sbi_hart_map_saddr((unsigned long)shmem_base,
+			   trig_count * sizeof(*entry));
 
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		ctrl = recv->tdata1;
 
@@ -574,11 +576,11 @@ int sbi_dbtr_install_trig(unsigned long smode,
 			sbi_hart_unmap_saddr();
 			return SBI_ERR_FAILED;
 		}
-		sbi_hart_unmap_saddr();
 	}
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
+		sbi_hart_unmap_saddr();
 		return SBI_ERR_FAILED;
 	}
 
@@ -590,16 +592,15 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		 */
 		trig = sbi_alloc_trigger();
 
-		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
-
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		xmit = (struct sbi_dbtr_id_msg *)(&entry->id);
 
 		dbtr_trigger_setup(trig,  recv);
 		dbtr_trigger_enable(trig);
 		xmit->idx = cpu_to_lle(trig->index);
-		sbi_hart_unmap_saddr();
+
 	}
+	sbi_hart_unmap_saddr();
 
 	return SBI_SUCCESS;
 }
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
