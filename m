Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F01B606A32E
	for <opensbi@archiver.kernel.org>; Tue, 27 Oct 2026 08:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VV7koiU9;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=X7zO9IPl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5R31j24S1Zbyp3tB0shRf4gAdWawjocAe5mmqjjmU/k=; b=VV7koiU9lcrdNimXP1ViRsdirN
	Snv6PoaLqsyXYDjYshNdx6SAIJt5A6D5xpkpOYX1WQR4VO0cAlgq1ygBI7g9sMWO0ZPPfnvRhfopw
	Fg4J2xsxLT9Lz7ke1BhluvBpJO1DwAvv7PXKAj8Tveo8VZHjotK+MFNRzKg8gLl90G8Pm2ykgTc7V
	f7apW3Q2f02h/Kweko8t3XMuxgmz0dBl1OumKqlQpTkkLt+W4t1qR7N25kfIbOzaaRKv/+CcMycLH
	2EElBPNN8oNYWZaScForZchEZjX35LoICLEsUCpVsCqy0FTE/e6XqPlGqvqQEg5PcXxgEXOkLUMNX
	9qPR3SFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcf0-000000042Wc-1cNh;
	Tue, 27 Oct 2026 08:35:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLcey-000000042U7-0Len
	for opensbi@lists.infradead.org;
	Tue, 27 Oct 2026 08:35:57 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-8a4c72951b8so1334967b3a.3
        for <opensbi@lists.infradead.org>; Tue, 27 Oct 2026 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1793090155; x=1793694955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TBcEW2y7ca8O+Z02XQ+d7FaL0nyz2XtGdNUVG6qNwOc=;
        b=X7zO9IPlDPS2gl0U8GxdSjwHfaxDHcqj522MN82OEB1lyW0qVkBA+iXnGsQXSKfNij
         fU5v+/xE33CLsI1DUBlZoItjrNCpEfEpSPmX8HubebSJlsgrvtsKCwBh3Kbz2es+7cb3
         pkZHCMEmRkNeDuZDnK/gwoKE+6Lt/7ACDPoBjXcojT5gJy93gC64kOZVeTCLAOjmtTrz
         HjzMRJHKeD2p5RF927vbkdi+0mItEQcNNfinKsgow6KI5Bd164a1sw+NMgt4rZ8hQaLK
         ITfStGhmyRMZH41Hi6Q3KmK+60lx6Urk90UDA/C4gMG2HAhNPx1Udk/ueh3gg2r1AMBx
         hMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090155; x=1793694955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TBcEW2y7ca8O+Z02XQ+d7FaL0nyz2XtGdNUVG6qNwOc=;
        b=vl2H98/WASnJ+RQfCB+gvrvit+uAOoHHCwBwyJKi+1RF6+V54zetVOzS3KtYbIh3GI
         h5yW5kjS3w4mH6FPSaXBpDFu6c1k91BW2Wig+Qt1imZotP6LV1Zs+BxWIgywD1WdXXu2
         cUrGdqFVY6rnjCsBT4L//JEPqhcL4I/fzj151B4QR5ruDm9hLnqaKdiRonIuLToZiyuD
         RhB/OWtEgGe/GEcU2OeBIQptfm+RE37+/hRhubKigcFU1hTzKkkPYn5Fx0T6erzdfxU7
         /VGlUhPdjKmHqgCNkrjA8WcaTpgkMxw8FrQOyq9TBMrCaGT8yb9NzI/LZUNWEVaoXdNe
         sdPg==
X-Gm-Message-State: AFq9FYLazwUNb7D93QgHC6ccM97HzxH7VHV5+xGzj7WSrZI1wZ87igh3
	Hyfpgj/YVQO2jXplkA5qEEF25u/pgiUuVoUFAl/FjqdG5iaoL65MWC0pgraEuao56SJg4A78D/M
	MZiKUkcR66MbhhAJvfF+5GI80K+JOuUGO8NPyTT0AQuJKbbAwGJB9kTJEIJCi0RAOuDlvlngg1X
	go0OcldeEy2UdoV7Uq6RMQWqxxFUQvNaTnVU5eA1jw4xDj6EHP0n0=
X-Gm-Gg: AYBFou3/+6uS6d0QllAzbdCNgNr1V78FeyEV4cXelJQk7GU9B6FVl4M+dogl6lpZ5Fy
	11hKkNZE5Mf/l+hKO0pqlS7YH/GT2o66BLayB5EtTQRDtyC2I9lwjPytvQmERRmZk35NQ5KsNbT
	2Voa5DfgOp0ZNPP0VHRsJVzW+veoUOrYTw1LqgVeRNtJt+s5sAPqI3osd/NwXLctThm1iUhLxly
	AT92VjfYlClCqy8j1a8gmlU2HjWf33rrPXz4ogCwPCDa84wd+qoKLSK/XvpkncNSEtHPWMsrMKT
	3gQxwPSn7+3ikmerEZgGEJ2OaDzHZ1OtMm7UQQLPUw+UI831SmJvcozkA0seYrDx0AFxuxGc1Mj
	pPI3Fhl40swHBJL1ogsJ5njF3jt26qqd2CsCuZvf0MA0vh4h9Og4MUbhj5mR1SpoM7H16kMVSNm
	/SbqBxGWCWyGsO6bLzsFTrEo9l0VQkRDTCpoVcrCdM2uFN2AIIhXGLfcTzfZ/VseBcxK4tLcDNc
	VmMqQuzO60eHXJokh0PJsCazWMV0Y28jhzrWYMkxwXaL3mmytMK5A==
X-Received: by 2002:a05:6a21:1f83:b0:3e0:f9da:3952 with SMTP id adf61e73a8af0-3e7cd606cefmr7655625637.67.1793090155104;
        Tue, 27 Oct 2026 01:35:55 -0700 (PDT)
Received: from localhost ([136.226.240.181])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdad6d900b1sm350135a12.4.2026.10.27.01.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:35:54 -0700 (PDT)
From: Yu-Chien Peter Lin <peter.lin@sifive.com>
To: opensbi@lists.infradead.org
Cc: anup@brainfault.org,
	pawandeep.oza@oss.qualcomm.com,
	rkrcmar@qti.qualcomm.com,
	raymond.mao@riscstar.com,
	robin.randhawa@sifive.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	greentime.hu@sifive.com,
	Yu-Chien Peter Lin <peter.lin@sifive.com>
Subject: [PATCH v3 4/9] lib: sbi_hart: lock mwid CSR for RoT immutability
Date: Tue, 27 Oct 2026 16:35:04 +0800
Message-Id: <20261027083509.1076577-5-peter.lin@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027083509.1076577-1-peter.lin@sifive.com>
References: <20261027083509.1076577-1-peter.lin@sifive.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_013556_121667_4CDE0306 
X-CRM114-Status: GOOD (  10.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Lock the M-mode World ID (mwid) CSR during hart re-initialization
to enforce immutability of the WID established by the root-of-trust.

OpenSBI does not assign the WID value itself; it only sets MWID_LOCK
to freeze the value established by prior RoT stage. The MWID_LOCK bit
at XLEN-1 is sticky and makes the CSR read-only until reset, enforcing
a temporal security boundary per the RISC-V Worlds specification.

Signed-off-by: Yu-Chien Peter Lin <peter.lin@sifive.com>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
Change v2->v3:
- No change
---
 lib/sbi/sbi_hart.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/sbi/sbi_hart.c b/lib/sbi/sbi_hart.c
index 38a761ac..f05d9b5d 100644
--- a/lib/sbi/sbi_hart.c
+++ b/lib/sbi/sbi_hart.c
@@ -724,6 +724,13 @@ int sbi_hart_reinit(struct sbi_scratch *scratch)
 	if (rc)
 		return rc;
 
+	/*
+	 * Assume MWID is restored by root-of-trust M-mode in previous
+	 * stage. Lock mwid so RoT-defined WID remains immutable.
+	 */
+	if (sbi_hart_has_extension(scratch, SBI_HART_EXT_SMWID))
+		csr_set(CSR_MWID, MWID_LOCK);
+
 	return 0;
 }
 
-- 
2.43.7


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
