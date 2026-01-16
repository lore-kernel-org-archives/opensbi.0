Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB7BC982DB
	for <opensbi@archiver.kernel.org>; Fri, 16 Jan 2026 16:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A7VRzsXetACqVIsAmEpfoRJDNAWyz0InwAPqsoVXZnA=; b=lsZvc9wGAJbP2R
	LYqPN365szevJt/LdNcOrEq6YsnPAD0cospRO55lhuDvj0K2ofQbkSVlGaN+mWiA4bGkd5/WmbCGc
	twwshklPtflZmNfD7cqoldPvcI8wE8dWMwBpoAXgmc0cTiOkRe1lrKu/d3TqmDu4XHK0vBGcXF67p
	052IVtkVqN1+rDKjyspXFjqHn1HkZpBuj8dAEKgTD9wEQ+XVrVOAvb2Oc5WbaFUdmoyIzxPiwzhWj
	rjk52W4n+ljwT66gpwD8iiEWxjMuegdoz2nUXzrNH+IcMsEPHMnTo+wdrSNDnpGdvOKK80Br7aSUG
	jp8RNZmv1ivn9nX05cBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgn4n-0000000EUi4-1DBE;
	Fri, 16 Jan 2026 16:53:33 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgn4l-0000000EUhc-0EWg
	for opensbi@lists.infradead.org;
	Fri, 16 Jan 2026 16:53:32 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a0d5c365ceso17673515ad.3
        for <opensbi@lists.infradead.org>; Fri, 16 Jan 2026 08:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768582409; x=1769187209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tlIc/KleQ1nHJpta+d5zHC/+jGbCz1DoHz2sEkbVXag=;
        b=e9UbWkRSYVWgjNRGb5b7GF4/e+VnKUWe9QyHsfYGME1w5eBc6D36nth0uitDxlWDoc
         ogwYrmwhwlcOgul5Lzht/yy7Y8AiY10uaEkA8lolwYSs1Mh3dg89ecYmbfEIdxJeUun+
         Gq8Sh+zTEs/RwbWaZ69owBrHGFqi4mYQ77KYw3ERNTQrF4S8SFkCjd/2nTPY28/jYX0I
         unKJiDT7Nl0W6GVgpC7eENsQr5eCAfvryzH+ePyTbjBLX4CUHfomwM3gpwPGqd6ilZu9
         JyAYaySHCoO3SIhTSz1PGSAeYwxnt6zlkdbs/tSZc9K/EIgtDTMiKyDhFir+apsAOJlq
         dnmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768582409; x=1769187209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tlIc/KleQ1nHJpta+d5zHC/+jGbCz1DoHz2sEkbVXag=;
        b=lbA2eEvAx4+87vUMFMKkBTn8SRuBHmjtleBD/1PSPz5E3XdrHUuyTnzxSQBWVKBRJw
         9Y6O+SZYm3nCR6G6T2ivLoSZognSqU+q3UgRVdAX5ELz2XYD1JDLc3Sja9r/SMLiP7KO
         0CUDL/k6tayjcEjMP40YdTiWMFnRkmrg6yh5VIf5DHgPSUpScpTZ93btXoGXlFBjkuRO
         LI8cWAQE4cXu3yR1Hfr8EYZV58CBMafEjlhvIV934MBzFU3l+54Rft9aQWhdJFIfocf+
         BQ4KPkOiGxS00TG0BP5+knMso39XivoYxHz8LyCtj/3RuRiIfx9JX5v3A2ll2kJ6gR69
         a8Cg==
X-Gm-Message-State: AOJu0YxbenKBOoaLuNdoKYI4kQxsC+vma386F+aU2l8ztoQ62HFOATj5
	zABJ6AV6NdAX4i1ybKE3bSEUQ6ige3LBx3fCUl4xSHvp5pxxyNddb1g0LyMYSQ==
X-Gm-Gg: AY/fxX4aItGE0jBrZqXcgRXr7p4HdmlNvoPAdMPqZvFyxVeUMJIOmUdNlwILfhi6ju2
	hbU3ENCf2M1y/p3piVfDKFJjd74kdBNlbyHb4Od4xTqIgB0ziJ4R58Z2CIVGlZHnePBwajNeatX
	Xgla6FWP/8z1hPYLoOcYAYcyLYMOWlRXQ2teQGi8Isd7YN+dXgKFbTdFSeR8yvCRsErjCMb3EoU
	ZDiiZqk2aHDChykLUiyvRd8A/lZKaqEW4mS+2gCZWb78EHkBBfUXHWcfyr8EKbF+6ihszL7w85M
	nJSO24Y4W+8wJIJLGoQry5zD1qC6WW+fkGK6GXQsPbC4M93wnU6oK/b/xB6sKLzqf+beTtwlofC
	wSNGSksqUYRtTSAVsLlowRIb8zlNtqeAbpoUqAP/QOlipVBwddTl9+8C12G0PlqxDGHlDm2lKHG
	1uatwmjRmMoXC6b9cA+2EY2ZoDwZHAQIYaW7Yznn0A0ALsADG24g==
X-Received: by 2002:a17:902:ccc7:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a718a743e4mr30879895ad.61.1768582409203;
        Fri, 16 Jan 2026 08:53:29 -0800 (PST)
Received: from JRT-PC.. (bb121-7-149-229.singnet.com.sg. [121.7.149.229])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941c56bsm25919405ad.92.2026.01.16.08.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 08:53:28 -0800 (PST)
From: James Raphael Tiovalen <jamestiotio@gmail.com>
To: opensbi@lists.infradead.org
Cc: andrew.jones@linux.dev,
	atishp@rivosinc.com,
	James Raphael Tiovalen <jamestiotio@gmail.com>
Subject: [PATCH] lib: sbi_pmu: Fix multiple FW counter start operations with custom PMU device
Date: Sat, 17 Jan 2026 00:53:04 +0800
Message-ID: <20260116165304.180441-1-jamestiotio@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_085331_093437_405253BF 
X-CRM114-Status: GOOD (  12.46  )
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

Currently, we immediately return the result of `fw_counter_start` if the
event code is 0xFFFF. However, this skips setting the bit in the
`fw_counters_started` bitmap even if the platform-specific call
succeeds. Restore the original behavior of returning early only on an
error so that we still set the bit in the bitmap. This prevents multiple
starts of the same FW counter. This also aligns the expectations of
`pmu_ctr_start_fw` with `pmu_ctr_stop_fw` since we cannot assume that
the platform-specific functions to start and stop FW counters will
modify the bitmap state.

Fixes: 57d3aa3b0dbd ("lib: sbi_pmu: Introduce fw_counter_write_value API")
Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/sbi/sbi_pmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index e084005d..75038f91 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -448,6 +448,8 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 			    uint64_t event_data, uint64_t ival,
 			    bool ival_update)
 {
+	int ret;
+
 	if ((event_code >= SBI_PMU_FW_MAX &&
 	    event_code <= SBI_PMU_FW_RESERVED_MAX) ||
 	    event_code > SBI_PMU_FW_PLATFORM)
@@ -468,9 +470,11 @@ static int pmu_ctr_start_fw(struct sbi_pmu_hart_state *phs,
 							cidx - num_hw_ctrs,
 							ival);
 
-		return pmu_dev->fw_counter_start(phs->hartid,
+		ret = pmu_dev->fw_counter_start(phs->hartid,
 						 cidx - num_hw_ctrs,
 						 event_data);
+		if (ret)
+			return ret;
 	} else {
 		if (ival_update)
 			phs->fw_counters_data[cidx - num_hw_ctrs] = ival;
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
