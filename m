Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5120C71144
	for <opensbi@archiver.kernel.org>; Wed, 11 Jun 2025 15:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjNbVinXfHz4qAJRtLyeQyuhuNmzENH+LXlEqEqVe2Y=; b=RJRWeIxG58GRxD
	E7aaO6ASMSZaqDD2NxQhYqzHkOHTnWyYEAoQStYElhgOXA4FddCHU6PgeX4eIqwSHi5006DQhowZ3
	K6e3lGJBDsSfE6TGQKlWkQiLBLtgPLd1pYCV1M6VnWBTpDrR/5+Dm1pZ5IYyYJujXeL490/YILkVH
	8I2eBLylkTL/7OVCN+Q4LnlX/TSAUXcx/6T/4EUIxW1mqV0nq2RlzWwAuGAnclv3a1YriuQb/RSfM
	iMiJU3D+sx6R1iz2Evw74IAq6x3eWRNlMohCwFKXtmfqURR1W44JmB5A8blrKUHHPngUZqNXgENiE
	XDNd7Fke3UcmC9n/GkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNL8-0000000ANnw-1KO6;
	Wed, 11 Jun 2025 15:26:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKI-00000009p2A-3rbQ
	for opensbi@bombadil.infradead.org;
	Wed, 11 Jun 2025 12:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+1O5orG+LXbmpyv9zaGiWqXBPZa5VXKqeKtaHjWpEDU=; b=c1uMwQjeIPfdwjdT4Lnr9fgpN5
	8KPu7fXv74YxrLPeMz6AbqZ9JrwAbOjmc5O1RV7o87ZOtRSgwFlL+V616XGMKpUG7zjQ7fnm7kSEO
	OS0ZGGeT/86mi3aVjUSTXGn5xtOsHovBRwXaBf4bILY7w+Y+3qbWe5PJo6QgLWUg3vQ2X/t41Odtu
	nd35Rb3mQ/4jFV0Z+Kv+1qTLq5nSkKNF/0cekKkOu7ZYS49xJg5+GlWN1cIFd5GID5cAcGV9N8yFD
	Ah4UqpET8M5/rQW9wm9iqhp8oEW/uVNZ1+z7z6JbAgbEMm73JO8R+Js3ztnX5bsxWz2DvbcHVzs34
	pKOqC2Pw==;
Received: from m16.mail.126.com ([220.197.31.6])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPKKG-00000002Nea-383Z
	for opensbi@lists.infradead.org;
	Wed, 11 Jun 2025 12:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=+1
	O5orG+LXbmpyv9zaGiWqXBPZa5VXKqeKtaHjWpEDU=; b=C1ypWNqorB2tc0guKQ
	pLYGmwKlrCoaYTf/lyF/m+HOgxkZdLcQGMHtWYbJTVPXnD8se/jiBUFXIuQvMdRp
	3r9n6gSLd+aE3J4ADNnMyviklDx8do6TV4zCEaXZ2Vhvg5NayOlUWrRsLae+S6jc
	7+8hcpievE98NpkjDnFPfJFvI=
Received: from T490.lan (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wDHn7e3ckloWd4vAA--.63780S9;
	Wed, 11 Jun 2025 20:12:43 +0800 (CST)
From: Xiang W <wxjstz@126.com>
To: opensbi@lists.infradead.org
Cc: Xiang W <wxjstz@126.com>,
	anup@brainfault.org
Subject: [PATCH 07/12] lib: sbi: Initialize as much as possible before sbi_hsm_init
Date: Wed, 11 Jun 2025 20:12:24 +0800
Message-ID: <20250611121236.937455-8-wxjstz@126.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611121236.937455-1-wxjstz@126.com>
References: <20250611121236.937455-1-wxjstz@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wDHn7e3ckloWd4vAA--.63780S9
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr4UJw4fuFW8tr13KF15urg_yoW5Gr1xpF
	yUKF1DAr4v9ryvg34DXw47Zr1rK3Wktw13Gry8G392vrW0yF1rXrnrKr1ayas8GFWqga13
	uws2vry8GF1UXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zEhL08UUUUU=
X-Originating-IP: [153.35.240.84]
X-CM-SenderInfo: pz0m23b26rjloofrz/1tbi5AFpOmhJaY15yAABsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_131305_268693_A78A172B 
X-CRM114-Status: UNSURE (   8.59  )
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

Separate sbi_hsm_hart_wait from sbi_hsm_init to allow the secondary
Hart to perform more initialization.

Signed-off-by: Xiang W <wxjstz@126.com>
---
 include/sbi/sbi_hsm.h |  3 +++
 lib/sbi/sbi_hsm.c     | 13 +++++--------
 lib/sbi/sbi_init.c    |  2 ++
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/include/sbi/sbi_hsm.h b/include/sbi/sbi_hsm.h
index 38f90516..f7a6497c 100644
--- a/include/sbi/sbi_hsm.h
+++ b/include/sbi/sbi_hsm.h
@@ -64,6 +64,9 @@ const struct sbi_hsm_device *sbi_hsm_get_device(void);
 void sbi_hsm_set_device(const struct sbi_hsm_device *dev);
 
 int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot);
+
+void sbi_hsm_hart_wait(struct sbi_scratch *scratch, bool cold_boot);
+
 void __noreturn sbi_hsm_exit(struct sbi_scratch *scratch);
 
 int sbi_hsm_hart_start(struct sbi_scratch *scratch,
diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index e8128a39..b5f3194e 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -159,11 +159,14 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
-static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
+void sbi_hsm_hart_wait(struct sbi_scratch *scratch, bool cold_boot)
 {
 	unsigned long saved_mie;
 	struct sbi_hsm_data *hdata = sbi_scratch_offset_ptr(scratch,
 							    hart_data_offset);
+	if (cold_boot)
+		return;
+
 	/* Save MIE CSR */
 	saved_mie = csr_read(CSR_MIE);
 
@@ -180,15 +183,11 @@ static void sbi_hsm_hart_wait(struct sbi_scratch *scratch)
 			hsm_device_hart_stop();
 
 		wfi();
+		sbi_ipi_raw_clear();
 	}
 
 	/* Restore MIE CSR */
 	csr_write(CSR_MIE, saved_mie);
-
-	/*
-	 * No need to clear IPI here because the sbi_ipi_init() will
-	 * clear it for current HART.
-	 */
 }
 
 const struct sbi_hsm_device *sbi_hsm_get_device(void)
@@ -269,8 +268,6 @@ int sbi_hsm_init(struct sbi_scratch *scratch, bool cold_boot)
 				    SBI_HSM_STATE_STOPPED);
 			ATOMIC_INIT(&hdata->start_ticket, 0);
 		}
-	} else {
-		sbi_hsm_hart_wait(scratch);
 	}
 
 	return 0;
diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index 8405fcf3..47802d54 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -409,6 +409,8 @@ static void __noreturn init_startup(struct sbi_scratch *scratch, u32 hartid, boo
 		sbi_hart_hang();
 	}
 
+	sbi_hsm_hart_wait(scratch, cold_boot);
+
 	count = sbi_scratch_offset_ptr(scratch, init_count_offset);
 	(*count)++;
 
-- 
2.47.2


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
