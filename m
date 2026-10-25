Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55723606A31A
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VJ4hzJio;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C4FDQkE1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=57j+D5muC0mCiKWGfZsKTRsdCWZkt5O9oTsjVJdPr7s=; b=VJ4hzJioXEKbm+NlOBB9AnXoZ3
	F7fjx8DJxgeqf3RuMHv7dkwzMhnlRCOlEmyfYCn2QR26XbtCuDlzD4MOSz1ZIuJ2G4OsP4XXm0Tc7
	BCNis/RXEFpnpUVfPDyLLEI03fdPLJx/io/aUwdWtDav59C7bD95rudv7iOGKeHsJseN6Y/sS+0Zw
	x9dm7nlzlnv0oXiNsob/8dys26Tk8YMxk8+sTZxD0BT+co/WKdScCLMvLxZWi2ST055h7YUWApSWa
	tSL9N1j2CG9az/0ZaTTWJUfb0qRR7kIwtvb5CRyEkim+4hv1R+fCHenAd+1wBOx3t3rSR7XogGACH
	34XZU4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrj3-00000000nJJ-18jN;
	Sun, 25 Oct 2026 06:29:01 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrj0-00000000nIZ-3qTa
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 06:29:00 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-5eabf243d05so829992e0c.2
        for <opensbi@lists.infradead.org>; Sat, 24 Oct 2026 23:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792909737; x=1793514537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7K8MKopj5ohpwtFon+8Giuz+fzyD7GzFvGOpzzGO4TU=;
        b=C4FDQkE1xXBtwK9BkgnzX/idvKH9Vv5ROF2FayefR37h04Co0M3ScADStY91UetwTq
         hTOA82ftj0ToT7keOJwSmKX7zJdzIncuHcCNrimv0cdrbTetIvqAEeVtcWnGbOGxtmeJ
         vv7nPtbo7Ji2KaI85cKOnESOgDYi4WaKYxn9X7j3R7xsoaaXlvx4scZrlCTMzgKNor+0
         HYresg9XdpPNnb2T+eJCiVZgmVlh9w97RGSeM3aJRlR1cbjGi+uQfy4h/9zaF6RY+F1s
         iHFC03TBYm3cNlwZd2ZAUaqBZH2b1wKdoYDf/0ELLY6m/DjDnmoUP3sQU/FjFpQsYZ1i
         6sXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792909737; x=1793514537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7K8MKopj5ohpwtFon+8Giuz+fzyD7GzFvGOpzzGO4TU=;
        b=mdS1p2J3q5mM6/N4xtEX65+mpygk9L/WCkPwCGuhRSV0fVZwD1qGqf4OjEDCx1/LxO
         9/V9EeuNNP3CWts3hj5K1sLkFO7uLZhPAFhlohpOx7zXSZRblG0PbvGhbUTMdA5xlmpx
         9Qs/EpHndTDcrWnBLkGs23Hl4JZbEhSDczdoWpjuSq7NcFtvMoRSW1b+vZ/sXbQei3Ah
         kNmFHsygki5xZ61kJzVSXoy7BrTLPOoc+/NqZ+/p70jy+K3sS7zvtLu4rLA8BG56t/pP
         yJga1vxdZlO5BiU6wWVtDSBXLX9jNrnyZCF2XfdBdX1bAoAu+6xA7nlDH+XYlLLC3t13
         b/Zw==
X-Gm-Message-State: AFq9FYLLkj3dNnDnv7tcO2ihaZtAz90OsINvHdGQY8Z5aiZX21m/Wp3H
	oPBgDmOdIVkAk8QzPiMzl1JKpOZBMaHxdmxoFO03XEc97BFcOxKF5eW3yAQdAQ==
X-Gm-Gg: AYBFou2Pt+FOvQVDZFsjI1IaJfVGGCYCdvXSpHncKPDAsdImo2dugfvM650F3xRslCN
	MpTu21qm/L4c2uUClW9JtDQxJ9Y8zhuSyYfp7SxwINq3l1FIuDJ9qnAuwcT4Ri+cnf0Fh+0LVlu
	6fJbb+ZIdBi8mSzrJEHezR9cJqJP6GHAa034i1vreS8EjXln9IUwfTjC2ZKSEdFQdEYY9HBi7uV
	foKkzCv9na/dLtFw5KfPFbG06tWRvkRp12BDYTXl9hz4WjCaKSZ9bSwW2fyuamHA4g3ZxL/YCb2
	jCNp2AdLiCMQc3MIS68MpuIuJUTIIpYgeXzLr7yK/IQNNK6BBRb/ZQkmDE6XwncC8ba+bOqLGNv
	2taVbNSkVKmnPVYQ4vd33DBxZtj1MJel6UiMM6mBalBkppDu4mFzu9cauRemqUpyWvG8uDGzrWL
	Wac0XV1IwP1Hrfb10k3/Vad/dMKTBmcY2KMAES0Fjw625UUWJCQoxo4SyiAdQGFON25piXe8CSH
	2nqHRUPTezdELwR7/Ue35m7Y5MUFo9nXn4Dpy7hdwMQM6gjIkSAWkZmquIE7a6GNxpjeZuFnpu7
	wnHlbwEmqRLiR6UszxUCSwmDILUrTGgr3kQco77awZHm
X-Received: by 2002:a05:6122:3b83:b0:5d6:7f46:b8dc with SMTP id 71dfb90a1353d-5ec23338ccemr1129956e0c.21.1792909737485;
        Sat, 24 Oct 2026 23:28:57 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f5148sm4552395e0c.6.2026.10.24.23.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:28:56 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	pengpeng@iscas.ac.cn,
	hppiscas@163.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH 1/2] lib: sbi_pmu: do not ignore pmu_ctr_start_hw() error in cfg_match
Date: Sun, 25 Oct 2026 00:28:34 -0600
Message-ID: <20261025062836.2445655-2-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025062836.2445655-1-sebasjosue84@gmail.com>
References: <20261025062836.2445655-1-sebasjosue84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_232858_985837_1235F235 
X-CRM114-Status: GOOD (  16.45  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

sbi_pmu_ctr_cfg_match() calls pmu_ctr_start_hw() for the AUTO_START
flag and drops the result. pmu_ctr_start_hw() carries its own index
guard

	if (cidx >= num_hw_ctrs || cidx == 1)
		return SBI_EINVAL;

so a rejected index is reported to the caller as a successful
configure.

This is the only one of the three start paths in the file that
discards the error. sbi_pmu_ctr_start() propagates it:

	ret = pmu_ctr_start_hw(cidx, ival, bUpdate);
	if (ret)
		return ret;

and the firmware branch directly below this call site propagates the
error from pmu_dev->fw_counter_start() as well.

Propagate the error, except SBI_EALREADY_STARTED. That value only
says the mcountinhibit bit was already clear, which is a benign
condition for a configure call, and failing the whole call because
the counter was already running would be a behaviour change for
existing supervisors.

Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---

Two things I kept out of the commit message because they are design
questions rather than part of the fix.

I filtered SBI_EALREADY_STARTED on the assumption that a configure
call should not fail just because the counter was already running. If
you would rather have every value propagated, the change is to drop
the second half of the condition.

The other is partial success. By the time this call site runs,
phs->active_events[ctr_idx] has already been written, so returning an
error leaves the counter configured while reporting a failed configure
to the supervisor. I did not add a rollback because that goes beyond
what you asked for, but I can send that instead if you would rather
the call be all-or-nothing.

 lib/sbi/sbi_pmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 653b8f69..62d5e206 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -982,8 +982,11 @@ skip_match:
 	    event_type == SBI_PMU_EVENT_TYPE_HW_RAW_V2) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			pmu_ctr_write_hw(ctr_idx, 0);
-		if (flags & SBI_PMU_CFG_FLAG_AUTO_START)
-			pmu_ctr_start_hw(ctr_idx, 0, false);
+		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
+			ret = pmu_ctr_start_hw(ctr_idx, 0, false);
+			if (ret && ret != SBI_EALREADY_STARTED)
+				return ret;
+		}
 	} else if (event_type == SBI_PMU_EVENT_TYPE_FW) {
 		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
 			phs->fw_counters_data[ctr_idx - num_hw_ctrs] = 0;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
