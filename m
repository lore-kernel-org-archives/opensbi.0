Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D59606A327
	for <opensbi@archiver.kernel.org>; Sun, 25 Oct 2026 14:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C/X0Fwgk;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZXbBcDi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PHuOMhjh94kZhs7nqROzJRweIsQulXReZpmG1IwM+Ik=; b=C/X0FwgkziGfo31AEhR7SUKMDw
	fkr+2IlHHu6ce1A9riLUa2mIytBhtJpjYsWlA0wpyCGBOY0IjddTRpfolm4hGoWQElUUUjyVnQM45
	QcSi2yJamQrr7h7l3F6rDOhsCADUlyVujUX0dqRLyR2bWO221qN+V7iZpTmxjIkV2gP6Wp5Xt9yi3
	PUGaP4+8vnbRp4qR9Lf4aQy5Adz6Bb0HhKgrmRGkADbJgYmQhHq4fkcs46ECN0kE0dj5UPb+/dS9h
	+xANrt+TCmYwntEB29H6EhT4kq9Kr46eDjykQkB7x0DxZ8/m9qvNWKHfBiBGADF7irsVcee/eA1yM
	h1uWt7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzbf-000000018tu-3ElH;
	Sun, 25 Oct 2026 14:53:55 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKzbd-000000018sI-28GB
	for opensbi@lists.infradead.org;
	Sun, 25 Oct 2026 14:53:54 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5ec20398b05so851958e0c.1
        for <opensbi@lists.infradead.org>; Sun, 25 Oct 2026 07:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792940032; x=1793544832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9QKORYeUYf/hTJ/MGITsUPXl2onEvAHmNQAdrz1h0qI=;
        b=jZXbBcDiGVKaGP+aWOR7KBx4SmXfCE5JFwzXEi7Uw0WOKPlsvU6HnerOCSGGAe53ia
         do6TpFB+g6envz8P4DHnobvG1h8Kz4ibysI9ul9wlLPti6NCrMK/YQrg8DK1bi/ZgZrc
         Jwq7GfS7Gbr3TDDln1ZXrOIXqNVJg5Q0zjcNCCGoqAkXMuVjHmwvGvk7RmXbFQ3+YzVr
         5NYriplrIhUJJ7WimzqvcTR6ALef1wSXaYdyr0A6wuBiYsoXws1rKQBdCi/MDzIg7/1r
         3nTJZWSYSgyKtwaGlTyf8mrxZew7zPNkpDCTdVU32ZFa4b9FkdPfHGq/TqjNSV4SeBYA
         wJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792940032; x=1793544832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9QKORYeUYf/hTJ/MGITsUPXl2onEvAHmNQAdrz1h0qI=;
        b=c+6Cz/fF06ooguIAJAclbtBUgBFVMF5gGgDLzq/cXJ68CTuUXfLbnGhsdrPJ2sbUZD
         7o+xshFxQELEPnUF6uQPKS3mRAuZiMA3FYyvoQQpb/eN6ifZL7gSUQGKzKKFWs7Qygj3
         JP6Zhe0PdBnUyGJ2RLazeJ5nVpy9bN8tuyQqZXeG+8DshEvP5qQgw8FB4WGOKp0VQUzR
         LOoHfGw6vR3Oq61tsF6dBZzehnQ6zbCfo4cnq8DvNvmnuxHugP0NtySES66si9Xyjfje
         3KtOXhkf7C46yURHQzJGCizh4BqYxHbuild3Ez5NvMjMU3E+87XYlm4G3HCXDOpw21oS
         9mZg==
X-Gm-Message-State: AFq9FYJfawBLYhiFKjtuxUxDWVhJG3/bhxTp5eRao7Bf7MreptnChxx7
	6D3ZjhB/lvWrSKBa0DizXx5NmICfzmluJwmwXwpcxov/LvWW6/IJPtesbcePQQ==
X-Gm-Gg: AYBFou2c1XURsFd0e6eohMC/yLL8qcVT4frpIbjfJn0RbrNadRqLM1UgMYc54kNO6B8
	2ikPROQ0bvGhgyu93+IhZuF4eHhMjfRTEvjPowLXBrtNON7QUpjuHm/OgkaSmoIm8uewV+vs5wm
	LZyJ2rwFr9576FjFRgBy6KOBTY4yRIFuKa7V5+dGghdM8rA+KVhxODTOPv4Zy90m55UQ7tPS8GV
	kdqzg5oE6Av49/YNBTQSKSW+LbOv6+1Fr8O0+oN+1TN6xYUCTp/PQCuwPGY5wSx1nXe0O3jlN/m
	btdeDjmxQEtLM1HYRPm5W+M7vCHpXKSNCptcdaO+q1soZq6ecJ2EE4MTsGStqXJAyxlk5s2dMOV
	9iTt4IV6zQheUAUbVULYEopet3ofoINl5iZOuAM0ALr8iR1j45/C0Mk73h5lQEcz8gvX/n59bwn
	hykAcg51b4Lgpzyuf3BSTpvOH1bRwMxiAVDFApdj6tpnRz76C0hHBDkCSmxmL7klOQlNUZT2Wg0
	5cq+33Dz5ZCKyEIR1m8atb/MuI/edU043LVMyihMo/sY2YHkbRdM3vwelozL5Pj0ddfO8MOrrNW
	BERVLaglsDoXtkmfmznj/Dx9GtBv+sdK5guDcq4DwQe39A==
X-Received: by 2002:a05:6122:d1a:b0:5ea:c37b:450 with SMTP id 71dfb90a1353d-5ec23319ce7mr1443558e0c.20.1792940032538;
        Sun, 25 Oct 2026 07:53:52 -0700 (PDT)
Received: from localhost.localdomain ([186.151.100.62])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234add5dsm5501237e0c.16.2026.10.25.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:53:52 -0700 (PDT)
From: Sebastian Alba Vives <sebasjosue84@gmail.com>
To: opensbi@lists.infradead.org
Cc: anup.patel@oss.qualcomm.com,
	pengpeng@iscas.ac.cn,
	hppiscas@163.com,
	Sebastian Alba Vives <sebasjosue84@gmail.com>,
	Anup Patel <anup@brainfault.org>
Subject: [PATCH v2 2/2] lib: sbi_pmu: reject out-of-bounds counter index in pmu_ctr_write_hw()
Date: Sun, 25 Oct 2026 08:53:38 -0600
Message-ID: <20261025145338.2569358-3-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261025145338.2569358-1-sebasjosue84@gmail.com>
References: <20261025145338.2569358-1-sebasjosue84@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_075353_568751_A08D7B60 
X-CRM114-Status: GOOD (  12.79  )
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
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 lib/sbi/sbi_pmu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index c68a675a..96438599 100644
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
 	csr_write_num(CSR_MCYCLEH + cidx, ival >> BITS_PER_LONG);
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
 			if (ret)
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
