Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F55606A31D
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 06:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y68QAqHO;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AVSBMrRD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N71UFb803fUkUN0cwPjDKdq58NKfglZKz6HNian8RUw=; b=Y68QAqHOepty/Z7hI9FGHb0oU2
	adY2QyB8Nq363LCGg6Z5KJwhzet+dmjN1kqKaEhCRGVaLfnO2WNDu24dBlytr4RJ+EFh4mu46NEzv
	yqG3I+cO2UkzBvdn6fNvRHm1KsEszAUi9DcYAFCehyH/EOC8E8jDlTl2mHAib2KW9AjqF80VCtmU2
	llOBS4+Y1nsMpEc2EDx4fdeOy/Fki6veibu7VfgqhO7+jdm0dg+bZ58c8Mq99MVyRrIe7niScPh9B
	trW/WzpNzXK363W49wh/aomt7N166yo3feNiszXsVq13NMs8Q1w4zzFyVjHcOS2QmIVsbXmO9I8q4
	axydM6Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrj5-00000000nJm-1iy7;
	Sun, 25 Oct 2026 06:29:03 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKrj3-00000000nJ0-0fHS
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 06:29:02 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-5eadea8f0edso1219537e0c.1
        for <opensbi@lists.infradead.org>; Sat, 24 Oct 2026 23:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792909740; x=1793514540; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NzYvjEl7bdfTWQzc5vN2qE38OsqOq45JMWiGNXGimnA=;
        b=AVSBMrRDeb0FNwkB7sxAEWW3BmUuCL/NQuOJT0Ms/WJi6YiGa+ixL7BDLaqk1C82iQ
         XVLBj6DJSQuNyLUXH1iyXs6jbjZ23QU/BLxUb9VYFtI8Tv8wKkS2OV+ro35RwlKQWzx8
         W8PgCluQI6Kw2+/WufoTLXPy5d+fv25TYUnpz4LTpfYQYD11Zz3/gEdz0iMcIdKoa9D8
         FW1JSmwVeHyyLFYDkhuiWu858hSWUNLxNaukLeJHf4d5iFFtgfKgeqR9UaYyg19tb3NM
         vn5DLUId4Cov2Nxwv4VNHutzomHjVwbOuq3GhX3WcwPCkDHfzF0+Se0VzqHfw3kTa+ux
         xE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792909740; x=1793514540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NzYvjEl7bdfTWQzc5vN2qE38OsqOq45JMWiGNXGimnA=;
        b=z4HgQcG8R7/aHXPGX1SihXbZhFEdQugdO5kW2DHFD3eeUN9gZ6GqRsKfJab4HbEmjf
         ahm7zboVydwaBt5wyADY9mbL4lAZFzA5bOKG6wE83fRBzs0TxmSzGGsi2LaMASBYIf99
         jGoH6PoepxORc3WvAy675L1aqY5PRTwsbQ4DgXs8WD+aTyGXjNwG3kdwpgvWR7ey1ygW
         zyZpfSzWHuJ6ZMPJRUZIWMqOYe0PPLTq2K8/8oshdYF7Afuo1y8uUfpUVX1gA0CKNE2m
         fDOpfs2E8y2vkPKR9AU4s9s9cBgyLxCsd0nKT83SvfmCCnjDhNIygsRh1ZbFbOCGxFKc
         qSYw==
X-Gm-Message-State: AFq9FYLXNIDR1mSVaZfiuQ2H48idIMzP8M+J11A9Jj43YzvIYhvrRwp5
	p8I/PZX+Z6nPU5Tnj68cn1NAsIKhhpo2BNnY8rPg4tn7lzcSKeH3CJu7timprQ==
X-Gm-Gg: AYBFou3Tga2XfXxtYBgFoxLCJ7IuL+oZZtiXb72VkMlHI1DvW1dMdvrQMF1lANgm4cg
	fkhRSolqGyUxWhEE4QMoem11Vq+tI1DJKFOoyu/TKXT1c9mMYDTJQ2G6tiLQRReQ1RhpUAxY7yr
	FxccYH4sjLuSUvdB3Abb6xtHz6uKriVldxC5459HqDNXg+6oHNPZOPKpPBbs3pLL3VbEhQhVVRb
	niioYwUKnWqpSn6NiBtyK0EK+6AlcGmqb3aejQFqQIAdVi1VKIM+tAXb8lWlf99b2kreochKPeb
	CraiHZ0VBzSULr+PpZro9otEgu7zXH+Sxek0hU7EUYxzTwx0cfnp2X0btDxQY/ngOjwY+iOruFy
	YoltxjEZ4Qwt+5KPf4A3+oiTBE8wJFf3EuQ1lekf1YG8PgP9zmMZUwnsxckfxabYcaKhAZEi1je
	+g10cj8EKHF04T2hq7wjpBNixG0Br3+C3G8H+tgoLk6eNuwbzypfz+QhppPd+k7NjZmj59af1v0
	cwN1mdz8PTgO7lalKCROUv+OeecLzk5UlGBD2Cx9+0B+zSBdbBSm3ymrTtEujr2qBoQCgb4a28v
	/as4KELE5OTArW3h1ki+eHgC1KfT2HuZth6Z8UD5PhTA
X-Received: by 2002:a05:6122:e014:20b0:5ec:2394:fdc5 with SMTP id 71dfb90a1353d-5ec23b53fd0mr521709e0c.20.1792909739864;
        Sat, 24 Oct 2026 23:28:59 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec233f5148sm4552395e0c.6.2026.10.24.23.28.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 23:28:59 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	pengpeng@iscas.ac.cn,
	hppiscas@163.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>
Subject: [PATCH 2/2] lib: sbi_pmu: reject out-of-bounds counter index in pmu_ctr_write_hw()
Date: Sun, 25 Oct 2026 00:28:35 -0600
Message-ID: <20261025062836.2445655-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025062836.2445655-1-sebasjosue84@gmail.com>
References: <20261025062836.2445655-1-sebasjosue84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_232901_227477_FE65EBFA 
X-CRM114-Status: GOOD (  16.23  )
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

pmu_ctr_write_hw() writes CSR_MCYCLE + cidx with no check on cidx,
while its sibling pmu_ctr_start_hw() guards the same index space:

	if (cidx >= num_hw_ctrs || cidx == 1)
		return SBI_EINVAL;

A cidx at or above num_hw_ctrs addresses an mhpmcounter the platform
need not implement, and cidx == 1 addresses 0xb01, which is not
assigned. Either one traps in M-mode instead of returning an error.

Give the function the same guard and a return value. The guard is
copied from pmu_ctr_start_hw() rather than limited to the upper
bound, so that the two functions accept exactly the same index space.

Only the call site in sbi_pmu_ctr_cfg_match() propagates the error.
The two call sites inside pmu_ctr_start_hw() run after the identical
guard in that function, so they cannot fail and are left unchanged.

Fixes: 13d40f21d588 ("lib: sbi: Add PMU support")
Signed-off-by: Sebastian Alba Vives <sebasjosue84@gmail.com>
---

A note on reachability, so the Fixes tag is not read as more than it
is.

Since 9f37e25f ("lib: sbi: reject PMU skip-match counter class
mismatches") the SKIP_MATCH path rejects a hardware event on a
firmware counter. Index 1 cannot reach this call site either:
active_events[1] is initialised to SBI_PMU_EVENT_IDX_INVALID and
pmu_ctr_find_hw() masks out the fixed counters with
~SBI_PMU_FIXED_CTR_MASK. I could not find a route that gets a bad
index into pmu_ctr_write_hw() on current master, so this is hardening
of a latent defect, not a live one.

I included cidx == 1 to match pmu_ctr_start_hw() exactly, which is
slightly more than the out-of-bounds check you asked for. If you would
rather the two functions guard different index spaces, I will resend
with only the upper bound.

 lib/sbi/sbi_pmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index 62d5e206..74aa2fe0 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -389,8 +389,12 @@ static int pmu_ctr_enable_irq_hw(int ctr_idx)
 	return 0;
 }
 
-static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
+static int pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
 {
+	/* Make sure the counter index lies within the range and is not TM bit */
+	if (cidx >= num_hw_ctrs || cidx == 1)
+		return SBI_EINVAL;
+
 #if __riscv_xlen == 32
 	csr_write_num(CSR_MCYCLE + cidx, 0);
 	csr_write_num(CSR_MCYCLE + cidx, ival & 0xFFFFFFFF);
@@ -398,6 +402,8 @@ static void pmu_ctr_write_hw(uint32_t cidx, uint64_t ival)
 #else
 	csr_write_num(CSR_MCYCLE + cidx, ival);
 #endif
+
+	return 0;
 }
 
 static int pmu_ctr_start_hw(uint32_t cidx, uint64_t ival, bool ival_update)
@@ -980,8 +986,11 @@ skip_match:
 	    event_type == SBI_PMU_EVENT_TYPE_HW_CACHE ||
 	    event_type == SBI_PMU_EVENT_TYPE_HW_RAW ||
 	    event_type == SBI_PMU_EVENT_TYPE_HW_RAW_V2) {
-		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE)
-			pmu_ctr_write_hw(ctr_idx, 0);
+		if (flags & SBI_PMU_CFG_FLAG_CLEAR_VALUE) {
+			ret = pmu_ctr_write_hw(ctr_idx, 0);
+			if (ret)
+				return ret;
+		}
 		if (flags & SBI_PMU_CFG_FLAG_AUTO_START) {
 			ret = pmu_ctr_start_hw(ctr_idx, 0, false);
 			if (ret && ret != SBI_EALREADY_STARTED)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
