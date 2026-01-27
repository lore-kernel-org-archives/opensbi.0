Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 617B8D2FEE6
	for <opensbi@archiver.kernel.org>; Tue, 27 Jan 2026 23:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version
	:Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/NTo3hSM+hQvRdPhgIyvV9/PFUk2c6CFyutTq8QV2QY=; b=wq/QEwU72LWBRx
	YqYvK627xOHfbYY1kphX0cFESc/LsgFzmajn7IIGEe6sfkYTKankCbTaSVTWzpg4XwK9V3wSqeEq2
	w4OgOZfhqBBd6uFXq4OFPb7SEdBGBF2bRkh9mRuezw7g1o9DAN+Lk7YBhRGaLuTqgm8dBC9M8fi2l
	gvTnfHxE9akWYe5wMnhGIpLkHB8N9JrD2YKQhrJXB8BeZO604UaqsrKJhzGf6ZlWBdFPJpEslJ2gM
	ZmrUHm0hC6l/IBC44ee45k3LAEMppHiGiGEt5sAKhS9QpfxclJ4XSH+Ku+80IFM3x4SEpkriUUBG1
	QeEmQkbCki+8fJi6orGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksx3-0000000FBjQ-0EF0;
	Tue, 27 Jan 2026 23:58:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vksx0-0000000FBj4-3Dpn
	for opensbi@lists.infradead.org;
	Tue, 27 Jan 2026 23:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C67944216;
	Tue, 27 Jan 2026 23:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEB0CC116C6;
	Tue, 27 Jan 2026 23:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769558303;
	bh=1xVB6+zbYCvP/AlCEK2TZXtgt+E0ALjickNAPLOU6KI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=u0JWzUh+uzRF0knafQkXjR/gXTOUjMDbn2SZ1LSt2F9+a4xw24P2BV95FtbmTfUJl
	 VR4B6cVIcgUfrMxbL3g+//swfunj0QxDOtQOhQjRkb2yEK7kFs9qRtRJD0Yuw2UDGW
	 CBk79Gofzz/Vz2yF46IIRUic0kl4MupN5eaQUWXHWd8386XsBwPzIACvvqnXwNwyTv
	 U3Ek2syh6Ue9eF/c/TQVx7BBCbx3bN0XbvDtQq32dfEV41eZQFVK+990o99Wd/5vMN
	 Mv0y3EvoQx8ntIbiQjNyoSWQq5QJKb3rwxVmaFhPd0xa1DO8dB9ToTqmZslBTI3+Xt
	 Djyh6KMVvvVYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D069CD2FEE6;
	Tue, 27 Jan 2026 23:58:23 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 27 Jan 2026 15:58:15 -0800
Subject: [PATCH] lib: sbi_pmu: Track SBI_PMU_FW_PLATFORM started counter
MIME-Version: 1.0
Message-Id: <20260127-pmu_platform_stop-v1-1-b07d1abd1ef2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyNz3YLc0viCnMSStPyi3PjikvwC3bTUpNQ0M9PEpDRTEyWgvoKi1LT
 MCrCZ0bG1tQC1VSDXYwAAAA==
X-Change-ID: 20260127-pmu_platform_stop-febef65abf54
To: opensbi@lists.infradead.org
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769558303; l=1617;
 i=thecharlesjenkins@gmail.com; s=20260127; h=from:subject:message-id;
 bh=tj6syk7F+QBPYvFgdhMk+dIRCVB7V4CGNm5JdEIntMk=;
 b=lDq3WIP/TZ8xkAt+Haaz4tTYh4BWQH8wWkjnx3Gk9r1Ldf54ka1XheZfAwi7/3ZrzVwDVjlxV
 c1JpB9MFtYUDlWhAsyPQDpERYJF0ffaoohLk0PqoCPvdHuWpgi6pdwl
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=4AzEw2rmBYSzmHkYTjITwPc2sWIvqjw/Fu3GnQmSMTI=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/20260127
 with auth_id=619
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_155826_836001_170CBF58 
X-CRM114-Status: GOOD (  10.26  )
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
Errors-To: opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

When a SBI_PMU_FW_PLATFORM starts, add the counter to the counter array
instead of returning early. This will cause fw_counter_stop() to be
called when a SBI_PMU_FW_PLATFORM counter should be stopped.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 lib/sbi/sbi_pmu.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e084005d..3c61079b 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -448,6 +448,8 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 			    uint64_t event_data, uint64_t ival,
 			    bool ival_update)
 {
+	int rc = 0;
+
 	if ((event_code >= SBI_PMU_FW_MAX &&
 	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
 	    event_code > SBI_PMU_FW_PLATFORM)
@@ -468,9 +470,9 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 							cidx - num_hw_ctrs,
 							ival);
 
-		return pmu_dev->fw_counter_start(phs->hartid,
-						 cidx - num_hw_ctrs,
-						 event_data);
+		rc = pmu_dev->fw_counter_start(phs->hartid,
+					       cidx - num_hw_ctrs,
+					       event_data);
 	} else {
 		if (ival_update)
 			phs->fw_counters_data[cidx - num_hw_ctrs] = ival;
@@ -478,7 +480,7 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 
 	phs->fw_counters_started |= BIT(cidx - num_hw_ctrs);
 
-	return 0;
+	return rc;
 }
 
 static void pmu_update_inhibit_flags(unsigned long flags, uint64_t *mhpmevent_val)

---
base-commit: 74434f255873d74e56cc50aa762d1caf24c099f8
change-id: 20260127-pmu_platform_stop-febef65abf54

- Charlie



-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
