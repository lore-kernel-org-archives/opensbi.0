Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB24B606A324
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 04:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mWGihRHL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RsJJTEY5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=imrt6u4a
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wi1YYyFq03ggisAtOWcCA+FuGAI4gUZTwGx9IWhsPuc=; b=mWGihRHLbz6XwcJG1o0maCf9+3
	HyeEUHtXyOqnptqgZJDg7YGs/dDJuUD1joEDjMN//aQYQy/p1VI1hs7XY3HbblvV5UAYs9D9qSTKR
	CjKCRYF8ZwEZLS7QdECUAIGX6iUThmqxvYddhytFPlYOt0vUFuTefjSvU1Uebfgkl55c/RVmPgtPd
	jtNaJ7uJM84ZGiCFzrBa2Us5rxYYLFImklsPCqbZ3UeLZiawbZsFlzyQ9upBPnkbq73WkdA2R0GDo
	GGwe0VERi76vA72ZSpmCyj91JxAc0zCVWUgEUtJ/uBiFlExYBEIIgvD1WVPiHXnBjYrBjGEDnsNv3
	6j8QC9Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkV-0000000FW4j-3mzQ;
	Mon, 02 Nov 2026 04:34:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkR-0000000FW3L-1RcE
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 04:34:23 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23v7cG2752931
	for <opensbi@lists.infradead.org>; Mon, 2 Nov 2026 04:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hupoeRpCSEm
	OrkwqJQtyFN7RKikmPsVDDW+gV2BX60g=; b=RsJJTEY528yeI7T4tBbTdgooVPk
	RiIQnzA0v30emNXLY94hg6fuRgD4KMWqUoytdbNkDXwKrAmIWgdEr8Ru3BI0324n
	OvwaLWHCHLbGcwNIzX5JbPCK4P6gp4yLlqHB+dCi0vhJdG6vlBtNx0fDKxyjFuel
	DO/xt51E3AZjsj5yevgs4z92RQ9DABlNi1fspyLmgh5vKvOGccLr6Ery1ofqhDvT
	HFAa4MauWPreX3EUOh7nOByX1NQg+nfyUUIh3UTlehh9OhyfJtta7JOyASeWteYg
	gmI9uzmtig+iNkhUaWIB20lhQkIOqjJ8SEWWiji1jj1o0W3vq0vITULD/Rw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpg200k3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 04:34:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-14373747468so2831332c88.1
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 20:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594057; x=1794198857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hupoeRpCSEmOrkwqJQtyFN7RKikmPsVDDW+gV2BX60g=;
        b=imrt6u4a/oOTnBNoeSFMTsmrYRTdF5mRZ7aWZKY/Yo60YfEEyNCV4W4qYO/WJb5svR
         C1khd3ZI28vJhEXt4HFzoX/CgteIhITZk+PI3CF9Yo+q5VdW/gsA+mM7yIk6R/00VNjs
         hUacOqcB3QH/NXVKzP+AD5HM0277sExPTP//exWNso93dtOpR8dvJ/+EkwLbShGSRoxs
         O1Km5MirWHBpwmQeqKN3+Z6tIi2K72apkbmQSjQAKkLrCwVupFUKUBHjadaQ4mUHz3Za
         jutitoBTYFXcsOrDGmoVIljmDfBK+8uirYjDm73hzaQ3Iwyx1/2I7CU3h0/r/95JJEFw
         FTtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594057; x=1794198857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hupoeRpCSEmOrkwqJQtyFN7RKikmPsVDDW+gV2BX60g=;
        b=JR1nBuX8q9SikRAKiBnmpwIT0fR+ms4LlzZ7D8qt/kbJ4vDWbIDBlKQgvZpok7uxRi
         gq9zT18V5sQHEmQGwFTDiJW90zUru2BfwHuiR+JAwEuIJEQQgKgWWwIIMTDlAywoC0T5
         V5mGd3gkswEBfxZSauJC4dDUY/qkxyMQ5tbdrBLOtl4kS2s9YcE5JDrS6ZSLRova8WbT
         aKiBrf61jZMCaegr7yACKWdpXKdtAFgkCR79AZ6dRMD7NvRQB5L1vDxfebJPwJcT/xNF
         PJqmJIrOpxAb/py3ARgakmvvnKxnX46fK/w41CJVDTWA6aShSZRa4sQbRDfNIb+aYB1z
         +Exw==
X-Gm-Message-State: AFq9FYL6Q8wzr3OhSoI2T+OM5u/82Xhyw6/sJ6QYwQNVUH5upJwkC4OL
	6u6M3OjdOR86JzVbR8+NxqP7Q/vFq3hoTgAuiHQ4ZNgGvpfg6bTzXxZpaoRDiHieb2zKXfifYqV
	rqUQtWlrXfbfwXX0mcDcSpoe38hixWVuCqfE3LX9chywwg72vip29qsK6VwbaHCCiOP5lDT6FGw
	==
X-Gm-Gg: AYBFou0Q1Q6Kc+5qWDMkC9eQLO9JP8JRwyJ2DEli4Tn47IBKKqnv/HtNQlBxalo9rtB
	wjUAUuI2yghmD2XrWcnjUpkPzCPIQJhmFlNAqKr/roiztUyMhnefLEL0vvR3tfqCmSauNVuDueI
	bLg2s6lguLRmu9Gf4IxGuAenN0Tkks4J/8VQ+n1x7IFZVYdsnqRiR+IZXN2LkuXE7AidLw9mPt9
	4x1e1+1MwBOBFoEDvILBL5KeQmA4nagAzTkurO56TcIhzD9atu0HNJwXdK1sadspuC8GsmUfrJ/
	Jl9O0ybBA2zntYeJTlQnZ0tQ+77PVUH83eVa8XC1l6Z4ZWRkTqmTyEnGoe0TNZbD0AMEf6nRWgO
	licHR4nnZSTM/a7RKS4tq8GnDjC3wTzfS/JDyMmeBS85SJgsYCDsA6H/fGMOAivGq3/VdUKbbrR
	u60XHe1j3iuGtpTVTrkZofkakS7+9CJSIcOPalMvRlfwDmslSFthBQ1N2Mj0BC4A1jzPCkJQ==
X-Received: by 2002:a05:7023:903:b0:17f:7280:1332 with SMTP id a92af1059eb24-1ac5c92f6e4mr14891090c88.40.1793594056671;
        Sun, 01 Nov 2026 20:34:16 -0800 (PST)
X-Received: by 2002:a05:7023:903:b0:17f:7280:1332 with SMTP id a92af1059eb24-1ac5c92f6e4mr14891050c88.40.1793594055871;
        Sun, 01 Nov 2026 20:34:15 -0800 (PST)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm28014910c88.12.2026.11.01.20.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:34:15 -0800 (PST)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v7 1/6] lib: sbi_domain: Add finalize callback for per-domain state
Date: Mon,  2 Nov 2026 10:03:52 +0530
Message-ID: <20261102043400.287938-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
References: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: RdMjcUvqtg0-kAbT_pNcAzW2_H8R3p78
X-Authority-Analysis: v=2.4 cv=fZY4WEQF c=1 sm=1 tr=0 ts=6ae812ca cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=A3s7GLJBcYfuUOYuCAAA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: RdMjcUvqtg0-kAbT_pNcAzW2_H8R3p78
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX9jrKi9V8PN/8
 21nKO0Pyy0OwSjyut6JpVd30HwQeL/+oG7K4HiI6BEcFHeaKbTbUMb6ZVCo5zaUQA3GgAcr8Knb
 LpqT0cHYJiQm299aBK2bDMKNovpUAyOsojf21v01qslCJYUgJIPkSItGE/gDbikLrknuOuT82gk
 CB/+ROw9kp6WCGb4/t9yd4O7gFID1iDiVYEbnAuAY8dttoAPHl1DooTnkeqQGd3N7tJ7g2ij/zg
 ZfwcTjpAsEtdfh/CZtfvRCNuirMxtUONytOLaPccW/8kTk1TJU9MWEgxN1KGSLYvl4iAlCcResY
 agJY3JDbjHCCYQlqdnLqXhaShk3dtvTIP5GmydMavGVM/W1o0ADa4pRBOFaBo5UPn+EjfbThR5K
 gnMpCyMAsKelmqLCH0/+apGqH4OF7W5Y0o5t6G2ULrZV/LbTvmOJ0y6f64qZbOfmxoUlceTW2tL
 VwF9w1YOLP6OmdQVD1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX0ZIkBtmrd5WK
 FUBTGpCvWd+v12SwwSCCzwoZoupJjC5nIjnOpcamt+gS5FimES1HIUmPAMItZs8QQAFdzrp6tM4
 TFnU8SizOWtRLOVkKyj8dcuhyH17hVc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_203419_515108_5B2E4E3C 
X-CRM114-Status: GOOD (  19.61  )
X-Spam-Score: -2.8 (--)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Per-domain state is registered via sbi_domain_state in state_setup()
but during that time the domain memory regions are not final.
Add optional state_finalize() callback which is called
from sbi_domain_finalize for each domain after all domains are
registered and their memory regions are final.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 include/sbi/sbi_domain_state.h | 22 ++++++++++++++++++++++
 lib/sbi/sbi_domain.c           | 16 ++++++++++++++++
 lib/sbi/sbi_domain_state.c     | 25 +++++++++++++++++++++++++
 3 files changed, 63 insertions(+)

diff --git a/include/sbi/sbi_domain_state.h b/include/sbi/sbi_domain_state.h
index 72030380b357..6528a95b9b56 100644
--- a/include/sbi/sbi_domain_state.h
+++ b/include/sbi/sbi_domain_state.h
@@ -40,6 +40,18 @@ struct sbi_domain_state {
 	/** Optional callback to setup domain state */
 	int (*state_setup)(struct sbi_domain *dom,
 			  struct sbi_domain_state *state, void *state_ptr);
+	/**
+	 * Optional callback to finalize domain state
+	 *
+	 * Called for each domain from sbi_domain_finalize() after all
+	 * domains are registered and memory regions are final.
+	 *
+	 * State from the domain memory regions must be setup here instead
+	 * of state_setup()
+	 */
+	int (*state_finalize)(struct sbi_domain *dom,
+			      struct sbi_domain_state *state, void *state_ptr);
+
 	/** Optional callback to cleanup domain state */
 	void (*state_cleanup)(struct sbi_domain *dom,
 			     struct sbi_domain_state *state, void *state_ptr);
@@ -64,6 +76,16 @@ void *sbi_domain_state_ptr(struct sbi_domain *dom, struct sbi_domain_state *stat
  */
 int sbi_domain_setup_state(struct sbi_domain *dom);
 
+/**
+ * Finalize all domain state for a domain
+ * @param dom pointer to domain
+ *
+ * @return 0 on success and negative error code on failure
+ *
+ * Note: This function is used internally within domain framework.
+ */
+int sbi_domain_finalize_state(struct sbi_domain *dom);
+
 /**
  * Cleanup all domain state for a domain
  * @param dom pointer to domain
diff --git a/lib/sbi/sbi_domain.c b/lib/sbi/sbi_domain.c
index 42fe56324a94..0214c5d43bbf 100644
--- a/lib/sbi/sbi_domain.c
+++ b/lib/sbi/sbi_domain.c
@@ -947,6 +947,7 @@ int sbi_domain_startup(struct sbi_scratch *scratch, u32 cold_hartid)
 int sbi_domain_finalize(struct sbi_scratch *scratch)
 {
 	int rc;
+	struct sbi_domain *dom;
 	const struct sbi_platform *plat = sbi_platform_ptr(scratch);
 
 	/* Sanity checks */
@@ -967,6 +968,21 @@ int sbi_domain_finalize(struct sbi_scratch *scratch)
 	 */
 	domain_finalized = true;
 
+	/*
+	 * Finalize per-domain state of each domain. Now all domains
+	 * are finalized already and their memory regions are final.
+	 * State which is derived from the domain memory regions is
+	 * set up below.
+	 */
+	sbi_domain_for_each(dom) {
+		rc = sbi_domain_finalize_state(dom);
+		if (rc) {
+			sbi_printf("%s: domain state finalize failed for %s"
+				   " (error %d)\n", __func__, dom->name, rc);
+			return rc;
+		}
+	}
+
 	return 0;
 }
 
diff --git a/lib/sbi/sbi_domain_state.c b/lib/sbi/sbi_domain_state.c
index 2d1f30e32169..f8ccab693764 100644
--- a/lib/sbi/sbi_domain_state.c
+++ b/lib/sbi/sbi_domain_state.c
@@ -84,6 +84,31 @@ int sbi_domain_setup_state(struct sbi_domain *dom)
 	return 0;
 }
 
+int sbi_domain_finalize_state(struct sbi_domain *dom)
+{
+	struct sbi_domain_state *state;
+	void *state_ptr;
+	int rc;
+
+	if (!dom)
+		return SBI_EINVAL;
+
+	sbi_list_for_each_entry(state, &state_list, head) {
+		if (!state->state_finalize)
+			continue;
+
+		state_ptr = sbi_domain_state_ptr(dom, state);
+		if (!state_ptr)
+			continue;
+
+		rc = state->state_finalize(dom, state, state_ptr);
+		if (rc)
+			return rc;
+	}
+
+	return 0;
+}
+
 void sbi_domain_cleanup_state(struct sbi_domain *dom)
 {
 	struct sbi_domain_state *state;
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
