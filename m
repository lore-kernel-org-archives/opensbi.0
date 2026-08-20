Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D9F0C5DF88
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 12:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rR6zrzgjYI3Oh+EXzzwY197/EhmWFdV3QHWCcXLbt5Q=; b=sXYiMw/k3fUXXU
	gvBHgd3gGC2wRd8RmyeiwOPl9pb2dHlt8ksskTQ7lMrRaOWSAUyyrlyZHgHt1EVOAciLul2a5vNoF
	4bmEwiD3pOqBciOE3kKDIEAdjNN2xX6u2/U7a5EMO6A7P3+VdemAZ96OVJAsEcLGe+hv9Cuf98UJK
	bGbGbc3q+KjsMaajTn5XDEXaMmZMNFAmgVrpxdhcd92XXw16XMqR9ly/LYDb54/vxib9LNsAMOdJn
	CtDT1hNlRp83p1k5loTpPAaRDrAYFcZqnaIE11KEnFRxy3l300aWuiP6RWRqh55CXLXMNmDrTtl1J
	aUpiY7iTR2/o05/3J4wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1e8-0000000BVfH-0wfq;
	Thu, 20 Aug 2026 12:13:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1e5-0000000BVe6-10gS
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 12:13:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KA3FCU3454836
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 12:13:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Fe1xKhi81dV
	iVkd5wlvk+/0IMn1TltAtb+UsuCqVccw=; b=MvJIszPWD/4y0UiBJwocHG5sYpW
	rx48qHXFyr/VvcXNXXDNF3fsFrdk+/AiF97cBmXm30hN0v0VL8Gi5xq1ygm182HW
	dKdxi58ZUU4prZVhYzXYSWtuNWveXGrl8wHj9xv+TnUb7goMrWqinLZsFSy6St08
	Ia8gm6CqXFw1RR8114d+w91PfebYmqcJ9ezZo6SoBUfx8Gc0x4uU4ADtKwryYeJf
	fbnR/v6M1JNV3PjxESgVikvDOethEBV/wYBeFThQ4HMhyth/yDgYa9mZ+mqf5PU0
	GpxlUyXrWSOVnDn/uuB4S2n349qeV9gaq4O29tMkgo+2Oen6mzrCntwe6HQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg88f5y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 12:13:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d52734fc41so44700015ad.1
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 05:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787227999; x=1787832799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fe1xKhi81dViVkd5wlvk+/0IMn1TltAtb+UsuCqVccw=;
        b=Efzl64HxrePdb8bmwkIabVtCFBaNsK09DRQ1GtYzyGXtrUmBhs8b44iRo2IpF0+JeY
         4KXf6gy0AwmEeTaVgrwa6vvP+8TXmhHcbUAXtYB8lHiahIPtTaq+wvy+uQUekDH6s+0v
         hKOQPDKmJZEw+5kcl66UXb2Qq6U0kWD56KQKaGfeBSEswWm1+D43AWcRtOGLbJ3RnCVi
         cEmuRS32lgJiiQxl9z6ZYDmt8ijzGVXmYCK3wKbzPjwFtkGiIsHn9vvHtWyLB5OHYCMw
         rYzrsIhvBun/GpMJk54aWX7KWxFPkTCIFaLJ6iuNx2n58IWMQgvCM9mgrRP1EOg/sTNq
         8CBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787227999; x=1787832799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fe1xKhi81dViVkd5wlvk+/0IMn1TltAtb+UsuCqVccw=;
        b=S8MWmiEasU9vT3IxFktSy+qm4wX9UOGrznHx0V8YLKwGa/aAoQBV1nB0843Qq22r3e
         5IyPFA8uy27tPlqRBfNcRMwccCb+2nc2aJjzx8Z1oPZWe71HXnEolZ2Nbj0dCT7rUtV6
         IJ0xSIDEqAf9Df1Thl1xoaZFIwg4W2WLuF9OLvEiPsXIw1BbjOSMI+HK5hE2SVJFOFP1
         5T50DR2+rHD1Gi0liRpAl7/6yWG2L+i9LoixlHNeJnaR12rgaKdzutClJJsHorxQyQg0
         zYgkwOPrxOlaQdVeaiYMOypzLWiQ7pjOG/puitaJfjhw3PpGN87vI0In26OZsnFWsM+m
         LBXQ==
X-Gm-Message-State: AFuF++lqzE1mY5H7zI540iHhA9b+UUJHWO0bYaCFLBUHD00Aj2F7hZ6K
	Dyv7IMVjAi50C8u5l5y7xGTjZexV1qPcI6uHUbC+z8Q9zU+u5ZCHS8EA4unI5vSgtKS4YR1yS7J
	hMmbPjCcgtYKvRC9O/rhqU8tcge8SHGNztiOxI8Q6ODEHKCpCcXwpAEwrJacAJmEBpI+lmCxMzg
	==
X-Gm-Gg: AR+sD11qvVM02+kNegBIBc5PwiPGaKIaSVz5Lw5QnxYexOpUbiFMkoVDT7Ezu78MGH9
	YzxVwPZq3cOoLFk1luzAN3rxRgSVRhZxqxVNcp1aZ7thtbNzMnMWzw1cAfhwmnWGqOObTraGXdG
	p6porcvtDs9EGpNAC9w89xIIr3vF8Vrf24NjaR2VOXr6o+jfrghCjvfpASPE9HnZEYTcYLZhxYj
	Ol94qZgD6gU6aIwf4QNu9HUGPMJblvGSlw9GKrJurweYxku2aD5foq4XY18mDwB0mFufH6YLwjb
	vAaoy9jV+uOM3tXJjt4QoTwLiBUkb/wXrpt2bqWCn+f+wYATId5HlMeF6kwhPm7xxd22un4TwEV
	74AJ8ykG6ArjAOSJsAUcurzAY2ULkcdCWi72OSiqdtLUpRPrwUNwtRiIyBOTIkLB7XjPdH3HE//
	YhWrKXdHjX+ShSiXW4xbNl
X-Received: by 2002:a17:903:b8c:b0:2cf:4c0f:5127 with SMTP id d9443c01a7336-2d5fd6a3fa5mr241147045ad.10.1787227998977;
        Thu, 20 Aug 2026 05:13:18 -0700 (PDT)
X-Received: by 2002:a17:903:b8c:b0:2cf:4c0f:5127 with SMTP id d9443c01a7336-2d5fd6a3fa5mr241145145ad.10.1787227998359;
        Thu, 20 Aug 2026 05:13:18 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d55538fsm6005415ad.13.2026.08.20.05.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:13:17 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net,
        Anup Patel <anup@brainfault.org>,
        Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
Subject: [PATCH 1/2] lib: sbi: Rename map_range/unmap_range functions
Date: Thu, 20 Aug 2026 17:43:08 +0530
Message-ID: <20260820121309.2551296-2-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820121309.2551296-1-rahul.pathak@oss.qualcomm.com>
References: <20260820121309.2551296-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX8M3x1b3JTZew
 RvLOTZ5IsqAXfMWBoeVG41Xf/E8V+sECsuDhrXfzLRrIoDiln65Wv3WWjvfsHzTbbljYNQ+GSaV
 p+K4zomWR4QVjmvkZFxxiU+oUIc/jdY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfXw0IXRUd1vc3Q
 sPYN8qIs71CkiwAnYJfdiVMHuvtBY3kMqrqgcMADv/Hw/rP3/ZiTcwo0kG++QvkfONADlYDjTGg
 TNMhkd9NZyvE0tXiSyeqpbUTAhdAXqc0P7DhQmlHyXzjbMDjftR4+rCfnPpesDL/LO62LNIS8bT
 CGhlpt+jkh7+aKczZgCugbBvS5WVgYYebyYC+qQ9lTzu4N7PG3LxVl9dttj/uldtq2+V4KvCV46
 8CGKuLsmDyH7wuUf513i+6GU38/ZoyFO3/seJZhz5SVk6eW8SXGC5PTW4TBhL06eBF2dbBMmP0P
 bU8LFEYrb4rARZanV6bRtQwBNIHOEexbgcwyNb26siaZ0df3qbF2rZih3isZ7wJk+2h3nMCMgRi
 2DYgSw0rKopiSVJqmsfgzP1b6pvDw6L6hsW6vwd+8bxQ6J9uzfatLMDqQBKuA/OKXiQW2STQB43
 /dUNG8vWjoSOYO1vgmw==
X-Authority-Analysis: v=2.4 cv=Y7/IdBeN c=1 sm=1 tr=0 ts=6a86ef60 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=W-_n0kkjAAAA:8 a=NnRM1_deUklkRIrYnNUA:9 a=uG9DUKGECoFWVXl0Dc02:22
 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-GUID: hlqXvJBud24OVivSA3tUWwuJxk-MNCsp
X-Proofpoint-ORIG-GUID: hlqXvJBud24OVivSA3tUWwuJxk-MNCsp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 clxscore=1015 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_051321_405594_F5D2727F 
X-CRM114-Status: GOOD (  20.00  )
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

*_map_range and *_unmap_range functions are required
in M-Mode to get the temporary access to S-Mode and U-Mode
regions. Thse functions only operate using the TYPE_MEMORY
memory protection mechanisms. Rename them to reflect the
actual usage of these functions and let generic map/unmap_range
names to implement generic functions

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Pawandeep Oza <pawandeep.oza@oss.qualcomm.com>
---
 include/sbi/sbi_hart_protection.h | 27 ++++++++++++++++-----------
 lib/sbi/sbi_dbtr.c                | 26 +++++++++++++-------------
 lib/sbi/sbi_ecall_dbcn.c          |  4 ++--
 lib/sbi/sbi_hart_pmp.c            | 10 +++++-----
 lib/sbi/sbi_hart_protection.c     | 12 ++++++------
 lib/sbi/sbi_mpxy.c                | 24 ++++++++++++------------
 lib/sbi/sbi_pmu.c                 |  4 ++--
 lib/sbi/sbi_sse.c                 |  8 ++++----
 8 files changed, 60 insertions(+), 55 deletions(-)

diff --git a/include/sbi/sbi_hart_protection.h b/include/sbi/sbi_hart_protection.h
index cafe6ee7..bdcad008 100644
--- a/include/sbi/sbi_hart_protection.h
+++ b/include/sbi/sbi_hart_protection.h
@@ -40,13 +40,17 @@ struct sbi_hart_protection {
 	/** Unconfigure protection for current HART (Optional) */
 	void (*unconfigure)(struct sbi_scratch *scratch, struct sbi_domain *dom);
 
-	/** Create temporary mapping to access address range on current HART (Optional) */
-	int (*map_range)(struct sbi_scratch *scratch,
-			 unsigned long base, unsigned long size);
-
-	/** Destroy temporary mapping on current HART (Optional) */
-	int (*unmap_range)(struct sbi_scratch *scratch,
-			   unsigned long base, unsigned long size);
+	/**
+	 * Give temporary M-mode access to an S/U-mode address range on current
+	 * HART (Optional). Only applicable for the TYPE_MEMORY and the TYPE_ID
+	 * mechanisms are not invoked.
+	 */
+	int (*temp_map_range)(struct sbi_scratch *scratch,
+			      unsigned long base, unsigned long size);
+
+	/** Remove the temporary M-mode access on the current HART (Optional) */
+	int (*temp_unmap_range)(struct sbi_scratch *scratch,
+				unsigned long base, unsigned long size);
 };
 
 /**
@@ -111,23 +115,24 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 				    struct sbi_domain *next_dom);
 
 /**
- * Create temporary mapping to access address range on current HART
+ * Give temporary M-mode access to an S/U-mode address range on the
+ * current HART. Only valid for TYPE_MEMORY.
  *
  * @param base base address of the temporary mapping
  * @param size size of the temporary mapping
  *
  * @return 0 on success and negative error code on failure
  */
-int sbi_hart_protection_map_range(unsigned long base, unsigned long size);
+int sbi_hart_protection_temp_map_range(unsigned long base, unsigned long size);
 
 /**
- * Destroy temporary mapping to access address range on current HART
+ * Remove the temporary M-mode access on the current HART
  *
  * @param base base address of the temporary mapping
  * @param size size of the temporary mapping
  *
  * @return 0 on success and negative error code on failure
  */
-int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size);
+int sbi_hart_protection_temp_unmap_range(unsigned long base, unsigned long size);
 
 #endif /* __SBI_HART_PROTECTION_H__ */
diff --git a/lib/sbi/sbi_dbtr.c b/lib/sbi/sbi_dbtr.c
index 01047969..afa8232f 100644
--- a/lib/sbi/sbi_dbtr.c
+++ b/lib/sbi/sbi_dbtr.c
@@ -580,7 +580,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 
 	shmem_base = hart_shmem_base(hs);
 
-	sbi_hart_protection_map_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
 		xmit = &entry->data;
@@ -594,7 +594,7 @@ int sbi_dbtr_read_trig(unsigned long smode,
 		xmit->tdata2 = cpu_to_lle(trig->tdata2);
 		xmit->tdata3 = cpu_to_lle(trig->tdata3);
 	}
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
@@ -620,7 +620,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		return SBI_ERR_NO_SHMEM;
 
 	shmem_base = hart_shmem_base(hs);
-	sbi_hart_protection_map_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base,
 				      trig_count * sizeof(*entry));
 
 	/*
@@ -639,14 +639,14 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 		if (!dbtr_trigger_supported(TDATA1_GET_TYPE(ctrl))) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
 		if (!dbtr_trigger_valid(TDATA1_GET_TYPE(ctrl), ctrl)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
@@ -654,7 +654,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 		if ((recv->tdata2 && !tdata2_impl) ||
 		    (recv->tdata3 && !tdata3_impl)) {
 			*out = _idx;
-			sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+			sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 							trig_count * sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
@@ -662,7 +662,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 	if (hs->available_trigs < trig_count) {
 		*out = hs->available_trigs;
-		sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+		sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					       trig_count * sizeof(*entry));
 		return SBI_ERR_FAILED;
 	}
@@ -684,7 +684,7 @@ int sbi_dbtr_install_trig(unsigned long smode,
 
 	}
 
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base,
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base,
 					trig_count * sizeof(*entry));
 
 	return SBI_SUCCESS;
@@ -768,29 +768,29 @@ int sbi_dbtr_update_trig(unsigned long smode,
 	tdata3_impl = tdata_implemented(CSR_TDATA3);
 
 	for_each_trig_entry(shmem_base, trig_count, typeof(*entry), entry) {
-		sbi_hart_protection_map_range((unsigned long)entry, sizeof(*entry));
+		sbi_hart_protection_temp_map_range((unsigned long)entry, sizeof(*entry));
 		trig_idx = entry->id.idx;
 
 		if (trig_idx >= hs->total_trigs) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_INVALID_PARAM;
 		}
 
 		trig = INDEX_TO_TRIGGER(trig_idx);
 
 		if (!(trig->state & RV_DBTR_BIT_MASK(TS, MAPPED))) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_FAILED;
 		}
 
 		if ((entry->data.tdata2 && !tdata2_impl) ||
 		    (entry->data.tdata3 && !tdata3_impl)) {
-			sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+			sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 			return SBI_ERR_NOT_SUPPORTED;
 		}
 
 		dbtr_trigger_setup(trig, &entry->data);
-		sbi_hart_protection_unmap_range((unsigned long)entry, sizeof(*entry));
+		sbi_hart_protection_temp_unmap_range((unsigned long)entry, sizeof(*entry));
 		dbtr_trigger_enable(trig);
 	}
 
diff --git a/lib/sbi/sbi_ecall_dbcn.c b/lib/sbi/sbi_ecall_dbcn.c
index 75c8455d..76837737 100644
--- a/lib/sbi/sbi_ecall_dbcn.c
+++ b/lib/sbi/sbi_ecall_dbcn.c
@@ -46,12 +46,12 @@ static int sbi_ecall_dbcn_handler(unsigned long extid, unsigned long funcid,
 					regs->a1, regs->a0, smode,
 					SBI_DOMAIN_READ|SBI_DOMAIN_WRITE))
 			return SBI_ERR_INVALID_PARAM;
-		sbi_hart_protection_map_range(regs->a1, regs->a0);
+		sbi_hart_protection_temp_map_range(regs->a1, regs->a0);
 		if (funcid == SBI_EXT_DBCN_CONSOLE_WRITE)
 			out->value = sbi_nputs((const char *)regs->a1, regs->a0);
 		else
 			out->value = sbi_ngets((char *)regs->a1, regs->a0);
-		sbi_hart_protection_unmap_range(regs->a1, regs->a0);
+		sbi_hart_protection_temp_unmap_range(regs->a1, regs->a0);
 		return 0;
 	case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
 		sbi_putc(regs->a0);
diff --git a/lib/sbi/sbi_hart_pmp.c b/lib/sbi/sbi_hart_pmp.c
index c0a4ce1b..c530739f 100644
--- a/lib/sbi/sbi_hart_pmp.c
+++ b/lib/sbi/sbi_hart_pmp.c
@@ -135,7 +135,7 @@ int sbi_hart_pmp_get(unsigned int n, unsigned long *prot_out, unsigned long *add
  * When shared memory access is required, the physical address
  * should be programmed into the first PMP entry with R/W
  * permissions to the M-mode. Once the work is done, it should be
- * unmapped. sbi_hart_protection_map_range/sbi_hart_protection_unmap_range
+ * unmapped. sbi_hart_protection_temp_map_range/sbi_hart_protection_temp_unmap_range
  * function pair should be used to map/unmap the shared memory.
  */
 #define SBI_SMEPMP_RESV_ENTRY		0
@@ -327,7 +327,7 @@ static int sbi_hart_smepmp_configure(struct sbi_scratch *scratch,
 	return 0;
 }
 
-static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
+static int sbi_hart_smepmp_temp_map_range(struct sbi_scratch *scratch,
 				     unsigned long addr, unsigned long size)
 {
 	/* shared R/W access for M and S/U mode */
@@ -359,7 +359,7 @@ static int sbi_hart_smepmp_map_range(struct sbi_scratch *scratch,
 	return SBI_OK;
 }
 
-static int sbi_hart_smepmp_unmap_range(struct sbi_scratch *scratch,
+static int sbi_hart_smepmp_temp_unmap_range(struct sbi_scratch *scratch,
 				       unsigned long addr, unsigned long size)
 {
 	sbi_platform_pmp_disable(sbi_platform_ptr(scratch), SBI_SMEPMP_RESV_ENTRY);
@@ -436,8 +436,8 @@ static struct sbi_hart_protection epmp_protection = {
 	.type = SBI_HART_PROTECTION_TYPE_MEMORY,
 	.configure = sbi_hart_smepmp_configure,
 	.unconfigure = sbi_hart_pmp_unconfigure,
-	.map_range = sbi_hart_smepmp_map_range,
-	.unmap_range = sbi_hart_smepmp_unmap_range,
+	.temp_map_range = sbi_hart_smepmp_temp_map_range,
+	.temp_unmap_range = sbi_hart_smepmp_temp_unmap_range,
 };
 
 int sbi_hart_pmp_init(struct sbi_scratch *scratch)
diff --git a/lib/sbi/sbi_hart_protection.c b/lib/sbi/sbi_hart_protection.c
index c4c149c8..ee4d4beb 100644
--- a/lib/sbi/sbi_hart_protection.c
+++ b/lib/sbi/sbi_hart_protection.c
@@ -196,22 +196,22 @@ int sbi_hart_protection_reconfigure(struct sbi_scratch *scratch,
 	return 0;
 }
 
-int sbi_hart_protection_map_range(unsigned long base, unsigned long size)
+int sbi_hart_protection_temp_map_range(unsigned long base, unsigned long size)
 {
 	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
-	if (!hprot || !hprot->map_range)
+	if (!hprot || !hprot->temp_map_range)
 		return 0;
 
-	return hprot->map_range(sbi_scratch_thishart_ptr(), base, size);
+	return hprot->temp_map_range(sbi_scratch_thishart_ptr(), base, size);
 }
 
-int sbi_hart_protection_unmap_range(unsigned long base, unsigned long size)
+int sbi_hart_protection_temp_unmap_range(unsigned long base, unsigned long size)
 {
 	struct sbi_hart_protection *hprot = __hart_memory_protection_best();
 
-	if (!hprot || !hprot->unmap_range)
+	if (!hprot || !hprot->temp_unmap_range)
 		return 0;
 
-	return hprot->unmap_range(sbi_scratch_thishart_ptr(), base, size);
+	return hprot->temp_unmap_range(sbi_scratch_thishart_ptr(), base, size);
 }
diff --git a/lib/sbi/sbi_mpxy.c b/lib/sbi/sbi_mpxy.c
index 19f59f3a..41fea0ae 100644
--- a/lib/sbi/sbi_mpxy.c
+++ b/lib/sbi/sbi_mpxy.c
@@ -401,10 +401,10 @@ int sbi_mpxy_set_shmem(unsigned long shmem_phys_lo,
 	if (flags == SBI_EXT_MPXY_SHMEM_FLAG_OVERWRITE_RETURN) {
 		ret_buf = (unsigned long *)(ulong)SHMEM_PHYS_ADDR(shmem_phys_hi,
 								  shmem_phys_lo);
-		sbi_hart_protection_map_range((unsigned long)ret_buf, mpxy_shmem_size);
+		sbi_hart_protection_temp_map_range((unsigned long)ret_buf, mpxy_shmem_size);
 		ret_buf[0] = cpu_to_lle(ms->shmem.shmem_addr_lo);
 		ret_buf[1] = cpu_to_lle(ms->shmem.shmem_addr_hi);
-		sbi_hart_protection_unmap_range((unsigned long)ret_buf, mpxy_shmem_size);
+		sbi_hart_protection_temp_unmap_range((unsigned long)ret_buf, mpxy_shmem_size);
 	}
 
 	/** Setup the new shared memory */
@@ -436,7 +436,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/** number of channel ids which can be stored in shmem adjusting
 	 * for remaining and returned fields */
@@ -466,7 +466,7 @@ int sbi_mpxy_get_channel_ids(u32 start_index)
 	shmem_base[0] = cpu_to_le32(remaining);
 	shmem_base[1] = cpu_to_le32(returned);
 
-	sbi_hart_protection_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	return SBI_SUCCESS;
 }
@@ -498,7 +498,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_protection_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 
 	/* Standard attributes range check */
 	if (mpxy_is_std_attr(base_attr_id)) {
@@ -537,7 +537,7 @@ int sbi_mpxy_read_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 					       base_attr_id, attr_count);
 	}
 out:
-	sbi_hart_protection_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)hart_shmem_base(ms), mpxy_shmem_size);
 	return ret;
 }
 
@@ -650,7 +650,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 	shmem_base = hart_shmem_base(ms);
 	end_id = base_attr_id + attr_count - 1;
 
-	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	mem_ptr = (u32 *)shmem_base;
 
@@ -707,7 +707,7 @@ int sbi_mpxy_write_attrs(u32 channel_id, u32 base_attr_id, u32 attr_count)
 					       base_attr_id, attr_count);
 	}
 out:
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 	return ret;
 }
 
@@ -740,7 +740,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 		return SBI_ERR_INVALID_PARAM;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (resp_data_len) {
 		resp_buf = shmem_base;
@@ -757,7 +757,7 @@ int sbi_mpxy_send_message(u32 channel_id, u8 msg_id,
 							     msg_data_len);
 	}
 
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (ret == SBI_ERR_TIMEOUT || ret == SBI_ERR_IO)
 		return ret;
@@ -788,12 +788,12 @@ int sbi_mpxy_get_notification_events(u32 channel_id, unsigned long *events_len)
 		return SBI_ERR_NOT_SUPPORTED;
 
 	shmem_base = hart_shmem_base(ms);
-	sbi_hart_protection_map_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_map_range((unsigned long)shmem_base, mpxy_shmem_size);
 	eventsbuf = shmem_base;
 	ret = channel->get_notification_events(channel, eventsbuf,
 					       mpxy_shmem_size,
 					       events_len);
-	sbi_hart_protection_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
+	sbi_hart_protection_temp_unmap_range((unsigned long)shmem_base, mpxy_shmem_size);
 
 	if (ret)
 		return ret;
diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a0f6d2fa..aac6adb6 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -1093,7 +1093,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 					 SBI_DOMAIN_READ | SBI_DOMAIN_WRITE))
 		return SBI_ERR_INVALID_ADDRESS;
 
-	sbi_hart_protection_map_range(shmem_phys_lo, shmem_size);
+	sbi_hart_protection_temp_map_range(shmem_phys_lo, shmem_size);
 
 	einfo = (struct sbi_pmu_event_info *)(shmem_phys_lo);
 	for (i = 0; i < num_events; i++) {
@@ -1127,7 +1127,7 @@ int sbi_pmu_event_get_info(unsigned long shmem_phys_lo, unsigned long shmem_phys
 		}
 	}
 
-	sbi_hart_protection_unmap_range(shmem_phys_lo, shmem_size);
+	sbi_hart_protection_temp_unmap_range(shmem_phys_lo, shmem_size);
 
 	return 0;
 }
diff --git a/lib/sbi/sbi_sse.c b/lib/sbi/sbi_sse.c
index 818afb87..ad9e6a06 100644
--- a/lib/sbi/sbi_sse.c
+++ b/lib/sbi/sbi_sse.c
@@ -1037,7 +1037,7 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	if (ret)
 		return ret;
 
-	sbi_hart_protection_map_range(output_phys_lo, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_map_range(output_phys_lo, sizeof(unsigned long) * attr_count);
 
 	/*
 	 * Copy all attributes at once since struct sse_event_attrs is matching
@@ -1050,7 +1050,7 @@ int sbi_sse_read_attrs(uint32_t event_id, uint32_t base_attr_id,
 	attrs = (unsigned long *)output_phys_lo;
 	copy_attrs(attrs, &e_attrs[base_attr_id], attr_count);
 
-	sbi_hart_protection_unmap_range(output_phys_lo, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_unmap_range(output_phys_lo, sizeof(unsigned long) * attr_count);
 
 	sse_event_put(e);
 
@@ -1065,7 +1065,7 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	uint32_t id, end_id = base_attr_id + attr_count;
 	unsigned long *attrs = (unsigned long *)input_phys;
 
-	sbi_hart_protection_map_range(input_phys, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_map_range(input_phys, sizeof(unsigned long) * attr_count);
 
 	for (id = base_attr_id; id < end_id; id++) {
 		val = attrs[attr++];
@@ -1081,7 +1081,7 @@ static int sse_write_attrs(struct sbi_sse_event *e, uint32_t base_attr_id,
 	}
 
 out:
-	sbi_hart_protection_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
+	sbi_hart_protection_temp_unmap_range(input_phys, sizeof(unsigned long) * attr_count);
 
 	return ret;
 }
-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
