Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BCF106FD80
	for <opensbi@archiver.kernel.org>; Fri, 13 Mar 2026 05:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmuvT++3XPN3ZrSxcltJOLFVyUgedIVsxTV8Biw5TqA=; b=1uE4ZnP08TG+o0
	SUubol4l2bCO3pNMWF+yBSpQbetOcI/xLT4USdZIkZUeIWDZIXsY88NZaGjkPWMMJiwR1rPn9efhK
	a9B+K1Zya59eYgosBtp+UJr7GNUUq2mWO/FSEkhX7TN/WTzzxruqr2b9miLn5UPBuVzzPuQml4pAw
	mV/8+Moefq27EfTPW570NeX2G/WmQjwP1r0if8xuIfLomtbS/mrCYt0A+yAUgQt+AIyD2Cz3rE/Es
	54SaE20/zb+1ZZ+AUPttp+JZIA+UMXq2D6zy5+j/Pq50gGgIaAoPizGa0xlqaZ6GUe5S510iw4EDR
	SJujxWbPkFHKZIKYfXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ux9-0000000GcJG-3Dsd;
	Fri, 13 Mar 2026 05:20:51 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ux7-0000000GcGX-17L2
	for opensbi@lists.infradead.org;
	Fri, 13 Mar 2026 05:20:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35a1cc6e478so722839a91.0
        for <opensbi@lists.infradead.org>; Thu, 12 Mar 2026 22:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773379248; x=1773984048; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xxar0DD14byXlb1GkE3my2y7NM81e4wmaoF4aOrGWJU=;
        b=GZtQvdNKsv8TfTfd2snEKkuFTT5+7f3S0EGGbS8llBTpWZiDckINQmrAK6jaU9DrlC
         0zX0BPtCgkrvSEmtKZRBi5ZbWbobI4IGegya0DIYl2f1Nb1xzcIi4YnvlazzWF4lnUB/
         eZX8/+1kDq6mjey9Ldzjg0JNvwn4Tv/HkcJ6yAbie9slJliEbOVtcLmlr/KvofSWz3re
         j/ffRBEF4VmjXGBZbgVquE5QTaFcg/fK5JHjQIHnf/Ck4CIgMEK4OG5E5yEhlKoiFLnz
         iDww5ev3/ht9A+r/8Fjle+ytblSNCmhNU8tr2LtaHPu18KNppBUzpaHnu+m6l1kV4Sbn
         PUuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773379248; x=1773984048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xxar0DD14byXlb1GkE3my2y7NM81e4wmaoF4aOrGWJU=;
        b=aSFZ8Hg7E30HTIy0hHjzyAGz0SKr00Ff62zlJHOkgGZwbunYqXYCfZ/uWymJh4WRZ9
         k6/qHkzqET1sWWHPwdbIoeMDp0ccJadBW3IDA0lghdM0Srpy/S0dxiHhMHd11IIUTTQD
         b61YCG3RMRgHv08a0Drdxoem5ufp4KMN/KCLBrM7+WLGAqjAQbOvjZUMr3l29h7UpiUr
         1FHUvFr3PRL40Ugb850hZ2SAJG0HyaaGB0bEqKjXtNL9u4AJ7vpQ69kJc8MT0FsQ2oPl
         XfSJDyczMsZcji9ZWI2eWhPTh5ds5J10z2hihaiLzPKTZBmHTeXYRrz9m6TzEAWyNJKj
         aOIw==
X-Gm-Message-State: AOJu0Ywv87N99ojYyntO2YaraSiKrUQ4BcIpWBiTTQg+8nuT9peaQ5B3
	xD96kTx2enkOjKl3cDOWlaVFSNgxkFsTHAbhowChvz54C8DFm3yHtxnYOS0ahQ==
X-Gm-Gg: ATEYQzyJRYTbIu6tdqVkct6DCVCDsl1VKHF8lph9Y2tj8b/rR8Mi2pp5iipe3HzKWlp
	0iAGjhR3OJ8L3Sn33/Z1uRD4eY0YeNLuSPM9Yb47oC39pXX7xIiZgUwbVZtE5Ex6PSV9ypN279M
	zlgnJXDGadrdu/jEfna9Ia5eP3zz+wiGNlM4v6lYzptnjo5HbSY1j0Dwqw9WmwgEqFg6PfQEeoa
	kKPYYNKcVtdP0aQCivKf9jPh7+T0iPZ7mwItxSu1/I6rYgCNT5f8P5SH7C8yThp5n73500j+IQ8
	/tGYvsfIe0y7V/f/KDybdcle/ZmF/P/nqTvJMLqwL+okceA1J23rU32E4Pc8ugCHySe6p/0ad3z
	o9MLmmF3M40E9seuJ6SWgIP7csqg7Gm4nHkNuXBN09R1AKtsp+GhFeOn3F/9WfXNZc2I+iZwKQv
	TnxJB8fPOE60CuEA/ZXOjQ9XUgY5z0KiQWyPerTcUERGwoGfGUnmxcts8/wqQFEvlb+JOZ
X-Received: by 2002:a17:90b:278d:b0:359:8564:dc0e with SMTP id 98e67ed59e1d1-35a21e485c8mr1959068a91.3.1773379247900;
        Thu, 12 Mar 2026 22:20:47 -0700 (PDT)
Received: from lima-default (103.95.112.190.qld.leaptel.network. [103.95.112.190])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a030490b9sm7298892a91.17.2026.03.12.22.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 22:20:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: opensbi@lists.infradead.org
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>
Subject: [PATCH 10/18] dbtr: Avoid crash in sbi_debug_read_triggers
Date: Fri, 13 Mar 2026 15:19:39 +1000
Message-ID: <20260313051948.4017134-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260313051948.4017134-1-npiggin@gmail.com>
References: <20260313051948.4017134-1-npiggin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_222049_309798_B8D907B3 
X-CRM114-Status: UNSURE (   9.23  )
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

Not all trigger types make tdata2 or tdata3 csrs available to read.
This can result in crash in the SBI_EXT_DBTR_TRIGGER_READ ecall.

Fix this by using csr_read_allowed() to read those csrs. In the case of
a trap nothing needs to be done since the caller will know those values
are unavailable, based on the trigger type returned in tdata1.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/sbi/sbi_dbtr.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 6efd5435..f72c76f2 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -575,6 +575,8 @@ int sbi_dbtr_read_trig(unsigned long smode,
 	sbi_hart_protection_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
+		struct sbi_trap_info trap = {0};
+
 		xmit = &entry->data;
 		trig = INDEX_TO_TRIGGER((_idx + trig_idx_base));
 
@@ -582,8 +584,8 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		if (trig->state & RV_DBTR_BIT_MASK(TS, MAPPED)) {
 			csr_write(CSR_TSELECT, trig->index);
 			trig->tdata1 = csr_read(CSR_TDATA1);
-			trig->tdata2 = csr_read(CSR_TDATA2);
-			trig->tdata3 = csr_read(CSR_TDATA3);
+			trig->tdata2 = csr_read_allowed(CSR_TDATA2, &trap);
+			trig->tdata3 = csr_read_allowed(CSR_TDATA3, &trap);
 			xmit->tdata1 = cpu_to_lle(trig->tdata1);
 			xmit->tdata2 = cpu_to_lle(trig->tdata2);
 			xmit->tdata3 = cpu_to_lle(trig->tdata3);
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
