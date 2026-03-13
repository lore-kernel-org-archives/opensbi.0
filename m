Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80361106FD7D
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fL6hCamKTOYAaJP4oHSAkBsM2LpmNMTYGMJY/zVAlXk=; b=zFWU7WGUt57H34
	1mmJyCNc+0RpztueTjLAqo+OmShEdO4Rqm0VkHzERgROSDAysyVAFGSlHN8umVIbOajhNP1EMx9cC
	SxwX9CAXMyo1VKXpm14K8eemF1RP3ZB3WykOUReh/um7J/IBbnlh1FtvpiUh3J31Bqzx6Ts29HyxG
	FEhfMKR3Y9UIMp0A45D4IeRAkUWmJ9ij8M7ol2PMYqW8Oo2bCpKKjZ389V8Ji6hBIYHb0uOlBF2qO
	SYbYdYj5Lczz1OxEcT1/dw7xOakI87dZI8ZqkPN08sLp6P4nvCc8ME3kJxNVi0KnEbStA+btVMtJM
	NVzVbaIR5DfegCpSjtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ux7-0000000GcHA-1zel;
	Fri, 13 Mar 2026 05:20:49 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ux3-0000000GcEE-1u0T
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:48 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso987156a91.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379244; x=1773984044; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kfhA473IaaUVkFT2CMoMeAYI81cdCzREeN1AXKic2rs=;
        b=SHcU+J6SWlm6g+FTKd1llC4ffs4BOusyleG8ZMClrOzLCxUTP9hu2NwtbvzdkSNv50
         NNkpzrLPYnksCmBEWifDy7cHCQbSu7N0AvcZpFblTJPHowBsbnFgMdxxzU0Fac1mzBm6
         z+22y3+vSzwb3SAwHBUOPQEq1DebgRAJEEqUUr0HhpCBeJAbGwo3KXEQ5KzS0/w63vE8
         Sm+lVQ5mIWFN0X11cn0aKFh38oOeup4gnfxuDDm8ZMGdMrQ+Qw230xYTmBpUap66YcfG
         OB0ScOBcaBOEpzs3TYtAWDKDVf0jDHc7/upPIaGThYboK/MH4Qmzh7y3AsJKfG/un2iQ
         6sbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379244; x=1773984044;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kfhA473IaaUVkFT2CMoMeAYI81cdCzREeN1AXKic2rs=;
        b=OGb7yX3axU55Ca33+RxEgekfjZ0meSNCpQ1saiw4dDph6wOc7KOp+iFiiauhg9+1jb
         IYTq1XKee8s4BJFdlthtCAja1gWVqTXcyxMVVI61bUFjK8L2zjOrGfUpxypO2e2jG7nJ
         OkKbrlqXPurv4NDXrQhfTmSNnByhhUl3MYcSLqcRDxDiWi+YSPuYUQLxpLEziVAOuvs/
         l37+8TAZgKIHxWeJPSOioS/dMxJMDyNRyoU6hJrZu3/Lv49fP6dosZwWqQKtrdRlbyuh
         GgU2vduEsnX3qUgzRALhqlmq7TScrDEcBhMIT8K2aCwDs46G+vPsCBsnB595XZlKvWuI
         5pBA==
X-Gm-Message-State: AOJu0Yxw+ltTarn4J/cK+milGxP9o7GHSKDqOg/lXs1waD8ZFMyDQRuy
	ff0VBjXjwawwdfqm0qv3RChTKAQgihGOIDSuyx7P/CTE+VyPGWjLo+K6AjgoHw==
X-Gm-Gg: ATEYQzwd7HgJ64Izdpt6s4dPZEst1nG7V4HFxICL68P0TBvi+wdSESeeP6zGomd6ZGv
	3XUyqV9wXqE1ep2D5v5bqZwxQaHmZiPdwojKDKqcI23FOiY/u3u0cLq45qFstLlK3/wGzsIShon
	ZiPjiOyft2Q2q5AS458b/BT1vlkcwXHLuXUZzuYhgq4LwUFZM9XNlu/rrJqovLUohPlPG/4cEmy
	mL5jURQNslKAaoWrUkg9m47fZsVgLm9WiyBYFmMa89MjhOV9IvBCb4Jl6ReNMqApnLvL6GZ0R4g
	usxrsAEhu2ll6LQOvOBFrZ8FyVZE6ElPN8JQNtJ+x8LxkWvhEP8rkMCtC1prwKWXR4bswsyVrpX
	DDmWJdtVgjMMab0Xi+Qeiy65ETQYDqaOf0FLj704fxp5y2fJfTpcW6bZUlI1EFWoRA8G60BlVsG
	d5oWsvDOcTGPuzvajhEcDIfjHaSj/ML6wMLJfOvTV8ctc4nkdHj8YYKgAzF4T2r3E0c+3P
X-Received: by 2002:a17:90b:2783:b0:359:3088:6ab1 with SMTP id 98e67ed59e1d1-35a21e1ca4fmr1879652a91.1.1773379244335;
        Thu, 12 Mar 2026 22:20:44 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 09/18] dbtr: Read triggers should not read HW trigger if not mapped
Date: Fri, 13 Mar 2026 15:19:38 +1000
Message-ID: <20260313051948.4017134-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222045_491311_6CF5B169 
X-CRM114-Status: UNSURE (   9.69  )
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

When no hardware trigger is mapped to a dbtr trig idx there is logically
no hardware trigger to be read. The mapped status can be tested in the
tstate word, so callers understand this.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a2c45061..6efd5435 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -577,14 +577,26 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
-		csr_write(CSR_TSELECT, trig->index);
-		trig->tdata1 = csr_read(CSR_TDATA1);
-		trig->tdata2 = csr_read(CSR_TDATA2);
-		trig->tdata3 = csr_read(CSR_TDATA3);
+
 		xmit->tstate = cpu_to_lle(trig->state);
-		xmit->tdata1 = cpu_to_lle(trig->tdata1);
-		xmit->tdata2 = cpu_to_lle(trig->tdata2);
-		xmit->tdata3 = cpu_to_lle(trig->tdata3);
+		if (trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) {
+			csr_write(CSR_TSELECT, trig->index);
+			trig->tdata1 = csr_read(CSR_TDATA1);
+			trig->tdata2 = csr_read(CSR_TDATA2);
+			trig->tdata3 = csr_read(CSR_TDATA3);
+			xmit->tdata1 = cpu_to_lle(trig->tdata1);
+			xmit->tdata2 = cpu_to_lle(trig->tdata2);
+			xmit->tdata3 = cpu_to_lle(trig->tdata3);
+		} else {
+			/*
+			 * If the trig idx does not have a HW trigger
+			 * assigned then just return zeroes in tdata
+			 * words.
+			 */
+			xmit->tdata1 = 0;
+			xmit->tdata2 = 0;
+			xmit->tdata3 = 0;
+		}
 	}
 	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
