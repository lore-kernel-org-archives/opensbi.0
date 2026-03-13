Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89F42106FD7F
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iltDhxkcx3eNirNdOtd0e5ewpwODrn2HNTU58ShFGJQ=; b=4X9Rv5BaeQmCGr
	jmuKeG2eXaAJ8cpySvUJN7kWhzoA0JXdaCM9tjMSVWotgl9Qohx/5cpM7jTH048//Ife8vO3dNkx9
	YiWbibDth/JCPNy6niNm6qY4dmG+ULZPGaK/AcFvyo0DSZc2i5XeFcvkaDM6RL0TWp0bL5as87bIV
	lRCbR4y1AT3Fxsn2V6sMN3b/g/RQD+yLjzulFi7i7g8SrA5i7VDJBD1mpUeFExB1zIpatst26BKsj
	bkPW01/Rqvupe4H2xQhi+ia6fz/PuEsK3oKV/12X4JQ1+XgU+inDjCfsgHRSv6YX2ctUwFvWWV+d8
	sg6f6ZCtXuevNcczsfFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0uld-0000000GZb4-1KpT;
	Fri, 13 Mar 2026 05:08:57 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ulX-0000000GZZ3-0Sig
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:08:56 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c737d3a51bdso754756a12.3
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773378529; x=1773983329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uzQ3COQsCj6zOmna9aJpJTAQZrhsSwqcOS9nnDAte7Q=;
        b=E3FCoPW5TgQpxVTq9irw7lnhfjomiVAU+oOZLcTVcDZ89Or2ppS3ACgIWRJBRUcaXY
         7TkW1lHYWSAn0V+E8YwBzjdARHZzksDIl3SzqvZfW69Ed4YkdFJ4/vAj80yR5li6UsMf
         3JnrJXqSXrY3b/Wys8tJgFh/y161jBmmiUu6+OltYd+Zzr6W8Js5PWeosBJODR4mEJpq
         2UUwdm5LHcj/Bm7gjshurGJGJwWmduUCwegUTwM4g43NJlOPtzDx9dZJi2stTehO3VPN
         QyVYq+NScW924HWBna8yQSrLTYLAN9hCuC8jkzagKkjTi3ZAAUwhJF4/UAAdcY4TvgUc
         C7Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773378529; x=1773983329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzQ3COQsCj6zOmna9aJpJTAQZrhsSwqcOS9nnDAte7Q=;
        b=RcjPIGNHzE8m1c4P3mdqvqlZoGmTwqJdzNupTS9aT2G38MOuHVB+QIOPc5OFZv2J5G
         wygsUmdfsIe4sdFrvbLWFexEm2FoD07aHHKsLb6Da1fepK/xzajYPYvCjZy1UaLjxMoz
         uMipyOLekwmXsvJM9aQEW9huApx/H66Ctf5rO7PP7i+zY6WShl8WmFsehoKD9UJGXUFR
         DB7NruuC3/eufiC1CC/njYkkBoFf5aiHqOoCAy/eNesulNT41pj3xWKrJqAiMY2Jmwk3
         nJ+15D2l3io75lXUbuiCaDHSUxxavhBpNI6wqQauIAH8p5IEsOy9JcMfBfxAAtNdnpDk
         O2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ8bnAA5uuE13VoK32jd9zouZhAyAyyp5Zgx5iYyWuARsoJYoAUJqFRQ2jMVImlUNnvuJaWiQD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4G28zaZ2bEY9cq5tTtFclRLVl3njXVuL87UlzEK4oepifA0+Y
	6Hs5sxd3YvQ8yvjV9Q5b+Tn+31AAOQQR6M0xPYUGbVn49bjhciObCA1g
X-Gm-Gg: ATEYQzzgKJPWs84sRgb7uhtlXSeotvJFeKJfBEi5vaVeNFMpvMH9Y2PY3A0b9OHMvSp
	wK75B4GLUJOARwMhj4v6C0Zsw47Y/H4elRxy5JXtCSdSrBetwQnMtzYXpTdJWEGDfMJJOjDxCzy
	EfhhQfCI6GTYiIIqG2jJFlQ7HPTSy6nPahoe4d9qJcpO3gPho8RGRrkg7HB3vn89MkwXvJHNylr
	qPAZNwYhTwq13XFhpoZbMuyhrkK5LlMm/hSaqW39wEXJ+KkNFnZL06mSpyMTdI/MLhsYhop1yDR
	BZH9qQpJfrrcnnJQuaiGNVHfOvAEKbXkdmW3nEaiDVObRGAkwuzKxSudHs30o1NbxheH5RDzMwJ
	2G65o7ECbF8uOwC4pnQa8AuH1yddNHkbY3wAvT+LQMa2ty7kRm4mZu6IqpReLBlKT6PkE1pK+Q+
	VReJ0sM7KEDLLWhELUG2qFaCJZV4h6ae8aEAgqt5qWalOaEw69vgGn82Gsp4WHf6vZsVsr
X-Received: by 2002:a05:6a21:6190:b0:395:7fb:9362 with SMTP id adf61e73a8af0-398eca9d72dmr1654010637.19.1773378529484;
        Thu, 12 Mar 2026 22:08:49 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73eb97a1d7sm676221a12.6.2026.03.12.22.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:08:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Andrew Jones <andrew.jones@linux.dev>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	opensbi@lists.infradead.org
Subject: [kvm-unit-tests PATCH 1/2] riscv: sbi: dbtr: fix enable trigger return code check
Date: Fri, 13 Mar 2026 15:08:30 +1000
Message-ID: <20260313050831.4016944-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_220851_192725_4D1746F0 
X-CRM114-Status: UNSURE (   8.63  )
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

Enabling triggers that are not mapped to a HW debug trigger
should return SBI_ERR_INVALID_PARAM.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 riscv/sbi-dbtr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/riscv/sbi-dbtr.c b/riscv/sbi-dbtr.c
index 129f79b8..489242b0 100644
--- a/riscv/sbi-dbtr.c
+++ b/riscv/sbi-dbtr.c
@@ -744,7 +744,7 @@ static void dbtr_test_uninstall_enable(struct sbi_dbtr_shmem_entry *shmem, enum
 	dbtr_uninstall_trigger();
 
 	ret = sbi_debug_enable_triggers(0, 1);
-	sbiret_report_error(&ret, SBI_SUCCESS, "sbi_debug_enable_triggers");
+	sbiret_report_error(&ret, SBI_ERR_INVALID_PARAM, "sbi_debug_enable_triggers");
 
 	install_exception_handler(EXC_BREAKPOINT, dbtr_exception_handler);
 
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
