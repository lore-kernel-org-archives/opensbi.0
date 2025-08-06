Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6774DC87FCB
	for <opensbi@archiver.kernel.org>; Wed,  6 Aug 2025 17:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uihMnh9MzougEZGyZULipveZ7X2koeUZYFZpMuIFiFw=; b=Zt5pwiZ0/FRmta
	RxNNvwBMrHtod4c9kq3jklF8CpxpP0L94XmQ9DZ7ccBfZXYYbWGGkIWSgrPysYxY73Z5d+xXy/XGH
	4/TsBXBU5FRS0Nm/hVDSlgx1521hH5Vvysip7Mol7DKYkjKEXgwnNlaWhtow7ZczNTdJoZIb2VhRf
	f8jLCK9FGQsx35VWP55FMokQfx4hEuKpuV9HlpdKMYzxSPCjf6ZEjMzn4Qtscjrnt3OZftcJu0JOw
	wiRLZB060ZXGcp7vReUFUK3aPKd5CRS8BGm+QqAkP3ykUXU/tix/6zQKkOe1UHYE6qxRFkEp+2sJb
	Nw3/kiLGhjz+JdJ27frw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhio-0000000FrnU-1Wd1;
	Wed, 06 Aug 2025 17:14:38 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujhf1-0000000FrGm-2zXM
	for opensbi@lists.infradead.org;
	Wed, 06 Aug 2025 17:10:44 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-709233a8609so1937676d6.1
        for <opensbi@lists.infradead.org>; Wed, 06 Aug 2025 10:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1754500242; x=1755105042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6p6RUr0j0B2xI89gLWmkOUGbKaQtFloCYYqFBWoyEQ0=;
        b=MMjOwfn79XmYNXYJ8judFDnGFVET/TEAIXvFHRQgbyuWxROvysrJnOqt+FAqj5cNKu
         9a9+thWs6vcrn0hraib8u91eshGAJJVtHYQLrdYMBSWcy3HmLJi/o+8kg/tD6JFfteYP
         JiNk0W0B686R3hUfHIFUS0OwsqcEtKz9Ctd8fv7uT0LJfIYlNFsAn7LPlnZNY4SMd0eJ
         +/na4Dp0d0Elw8indcS5Z/yc6Uu8re/310U+SO3eQoLFLe8efY29Zgc9kFkRWKD5xfCw
         hiEPA14UuBkfHpUrdXchrnejnJG8Z1Nc/NHh96IZMEqwNaaUlVLdd7fsMCxr3AL9cNj6
         mXPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754500242; x=1755105042;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6p6RUr0j0B2xI89gLWmkOUGbKaQtFloCYYqFBWoyEQ0=;
        b=ILZImsyNNrMO248Qnsw2A1UK4gVOuVLEWDsaDaLyJraUpnAzwnOBO4jR89vXw42x8n
         40qLOp2CqMAQ4zzz2rC9vS4nOfed9ywNkzcb+l9YnbJuax431uRNaubLcic65Jzoh55p
         hIv52CESHHaRCrxUdvns8MhMLrYBbbLmxQZlc1QRnAKnexsET079V6Um6pWDF9kCJ07O
         pIQOMZwdGZ4jW0FwPCacxmRNdwTGDmzptNG3WGnQvHm4br/zFuaC6zcDQnTTSlPtYugx
         Y+LFMD51vP6E+W84nPqUXnmgZKP2dbxF5NPSNvbOsXvwZBzlozPftDSMKpHVuxntSom9
         cX5Q==
X-Gm-Message-State: AOJu0Yx3zhMLWxAleKHYZnGmPUttpCkzfb+cbccaXAQMSsqjwNNkpvtx
	JjbRYTFh70nbrQxG+mhFjmal9xNzcZypBDNQ+9/gvnY4onFQRkE9zRm4CpKBoWMayqD4OGefWJ0
	zWyn8
X-Gm-Gg: ASbGnctalAiDNKHsPYSrod+dkvuz94SkAZ5Ertw2POPBUIOSmYbAFtBAT7F9/+SD6Lr
	Hngyr8ndCb726PWLsWHWSRiO3W4A8Qhz1DIAtulkmDSKACqeO2DPJX5ix14RvRaWNknIBfiSZk8
	SAn1n0znVq6cWo3T6di9WMjqgtK+b128hPKehe4teveWE0sKMpmX2W/GcAs+HA8I8lJBbdDHElO
	L/nuKTrj95ogoR05FQAXbUlqrvwwb50f8I+Lfuxj9Pw5C3YDunwoSAVCNWqACmrD5Xg/nskvWZq
	hAaYzB3ALdp2+t37jriAlHpdAOzoBCK1aqDyExM/rlFJ5FGKmFQPS75/AHO4s7pzfinwHClkV7k
	h/hr7Ct5nXWRpecmZk3RHbOMZgjwzF5+0zL1aEofM6iyz0QseWiF9SuFFu/zSAtQ/0bI0pchyDQ
	en9M18n2pGhNVDDb0p
X-Google-Smtp-Source: AGHT+IE5GEdZryRkdZiectuByDLlPrGbyGiCltoZ2I7gnYFSYTXasqNqXEaWYGHVZywiNqt5/j8kgg==
X-Received: by 2002:a05:6214:c81:b0:704:7fda:d174 with SMTP id 6a1803df08f44-7097ae12bf1mr53765216d6.2.1754500242262;
        Wed, 06 Aug 2025 10:10:42 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077ca12e2fsm87395766d6.22.2025.08.06.10.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 10:10:41 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: opensbi@lists.infradead.org
Cc: Anup Patel <apatel@ventanamicro.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH] dbtr: Fix sbi_dbtr_read_trig to read from CSRs
Date: Wed,  6 Aug 2025 10:10:41 -0700
Message-ID: <20250806171041.810270-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_101043_862465_3E275FA6 
X-CRM114-Status: UNSURE (   9.24  )
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

sbi_dbtr_read_trig returned the saved state of tdata{1-3}, when it
should have returned the updated state read from CSRs.

Update sbi_dbtr_read_trig to return updated state read from CSRs.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 lib/sbi/sbi_dbtr.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index a832c7f1..a39c3164 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -529,9 +529,9 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
 		xmit->tstate = cpu_to_lle(trig->state);
-		xmit->tdata1 = cpu_to_lle(trig->tdata1);
-		xmit->tdata2 = cpu_to_lle(trig->tdata2);
-		xmit->tdata3 = cpu_to_lle(trig->tdata3);
+		xmit->tdata1 = csr_read(CSR_TDATA1);
+		xmit->tdata2 = csr_read(CSR_TDATA2);
+		xmit->tdata3 = csr_read(CSR_TDATA1);
 	}
 	sbi_hart_unmap_saddr();
 
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
