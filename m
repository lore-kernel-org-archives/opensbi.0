Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84192C3ABC5
	for <opensbi@archiver.kernel.org>; Wed, 14 May 2025 05:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lnTOkhQ36CTmJHngjXHrq/hS+NKvmEcsmwH6Zh5AhM4=; b=UIdlPBnoVo8WtD
	lI8osC2t4IgN6R44jUhemF/QPY+SbH+EeokOfUibtjQKj42pG/3GkVas2ExFuocn0+6mSb40S3s3o
	C7p4lQiACT3zYIqjgA98RXpFumRPY4wk49qA20XS5BTp5jphBS7I+No3JHS9c6qRyHk9Tcys09PH8
	t3b6qnm/EiiQS6NWDXWCvwbHT6Bs6L5PWNTL/ZgTHZWYOYfLyd5tfdIwjlhEqkCfX80JNDrMvzHS5
	B73ltJey3Upp/fsgswbm1nYi2JMfTDt7O8kskkx1UPbNRHzknAeLQhBxqppi+j3P5rvF/V+Lt4uKQ
	mBq+195KnH0VU2EaOoNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF4Tj-0000000E49Z-1d1b;
	Wed, 14 May 2025 05:16:27 +0000
Received: from m16.mail.126.com ([117.135.210.6])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF4Tg-0000000E48O-0hYE
	for opensbi@lists.infradead.org;
	Wed, 14 May 2025 05:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=oi
	ldey6VVYmcuaYxXmhBwwjhPiIjSqVITWUOhHWL4l4=; b=OyxXm70hw3rUEo57VC
	i41OmG3vFIv4+k/gbmlI/YGUJhwigqUHDucW2j3ZxzW4gbCle6HAq7oRFif/9Tic
	D7mTwV8ZQ/NPUVoegYS+00QA4VGkEM9PrSJ17aIjM2+bSYZZI0Z+48qo0X2MnE9w
	mRPjSmZY6aV9TOrrLS+S5IqkA=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wDnT_IYJyRoe+H9AA--.1841S2;
	Wed, 14 May 2025 13:16:09 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	hchauhan@ventanamicro.com,
	Xiang W <wxjstz@126.com>
Subject: [PATCH] lib: sbi: Optimize saddr mapping in sbi_dbtr.c
Date: Wed, 14 May 2025 13:15:49 +0800
Message-ID: <20250514051605.559791-1-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CM-TRANSID: _____wDnT_IYJyRoe+H9AA--.1841S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WrWxtr4xtw13Kry5JFyrWFg_yoW5JF1UpF
	WrGF1DKrs2qryUt3y8Jw18AryrZa1xXa45t39akryvvas8Zr18Xry2kw1vva4SqrWjvF12
	yF1j9F4jkFs8JrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zNsj1wUUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi1x1NOmgkGaWg0QABs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_221624_576122_0E514BDD 
X-CRM114-Status: UNSURE (   7.40  )
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
 lib/sbi/sbi_dbtr.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index f0e91285..06f6cd9e 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -523,16 +523,16 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
+	sbi_hart_map_saddr(shmem_base, trig_count * sizeof(*entry));
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
@@ -556,10 +556,10 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
+	sbi_hart_map_saddr(shmem_base, trig_count * sizeof(*entry));
 
 	/* Check requested triggers configuration */
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_map_saddr((unsigned long)entry, sizeof(*entry));
 		recv = (struct sbi_dbtr_data_msg *)(&entry->data);
 		ctrl = recv->tdata1;
 
@@ -574,11 +574,11 @@ int sbi_dbtr_install_trig(unsigned long smode,
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
 
@@ -590,16 +590,15 @@ int sbi_dbtr_install_trig(unsigned long smode,
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
