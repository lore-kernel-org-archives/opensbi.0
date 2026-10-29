Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DB2606A320
	for <opensbi@archiver.kernel.org>; Thu, 29 Oct 2026 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lAGexWgx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JGO+iMlL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FLcbiR6H
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QTODDVPJHj6ycJff9JS2hH0cdZmxxPcR3IzScblNzew=; b=lAGexWgx/zX59zxdyfcbB5CWwZ
	EgNx9IXuGvxfQzfL0BEZ4wg0EQeD0LaxmGX+WmyGIu1LYw5LDEeTELbz7palaW6AdUYoO5HwNxdPj
	r2mN7N4Q17sKYHV8Rk0l8L0VFU2Ho3RnorY8XhKNIqtDTN2HehKnGKeKxH1ooexTQhzdZBBwynEY4
	9xcXjLnDEfVnFj7c0eaCH/lXDTZFEOg7QfBoNqD6XJHvgHqPuzDbBqsOuiAbBANPOm4VhWOExNbz9
	8KlmpL9wmhq6I4AyUZrzuAFnXkHPC05413/H+wKz/nzXvINE31GdFPolUC3CjjAccWxhAs+lD6gSS
	/kybx0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPTi-00000009EHE-0fky;
	Thu, 29 Oct 2026 12:43:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPTe-00000009EG9-3YsM
	for opensbi@lists.infradead.org;
	Thu, 29 Oct 2026 12:43:32 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TCeECg061404
	for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 12:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SIlFgE4OumiQRk5RYF1NqMAtVvpXPkvWnQ5
	sbLeNBqY=; b=JGO+iMlLT8GK6m9s/qe6BRQuFstO4W97LQu7IcU/9uYw3d49y4/
	RwgeYtH6Jpyw/sPqeZ0sXqZ59iTSWyNnOMr3A+w+sqYdm8LRpnmknSIt/tRROF02
	+5bOMWyyMH0qbwIBkvLeTRUbLqG3Eu5we6j+fhMM1iZfo4QxZXjhPVnWsho77dl0
	lsI/HkGW1FYrmgjLt8WjtpsVsoDaf6daSMaW6EelCXh6hOdXeVmNfxRkSbrTrcfb
	B14L0BBtdE4X/IaA7mo0zuytJeR0u46cE4F9vq+Zx+hbq97HJ78bflsOFsY394kY
	WTHrV81mZhrC3HQY1zWz1sWKYM96kAkZ1wA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpgpuk6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 12:43:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ad7030e886so2325250a91.0
        for <opensbi@lists.infradead.org>; Thu, 29 Oct 2026 05:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793277807; x=1793882607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SIlFgE4OumiQRk5RYF1NqMAtVvpXPkvWnQ5sbLeNBqY=;
        b=FLcbiR6HbIWxJGBB3xireito2Cr78261BC/qtjxj3RmDs5X03D9M1rz2Ac7mZ1Q+N0
         2vzijiF6K7fSCHlBRWSM9ghl7pHDLXCkG2cQFMT2e6umI99bFIdCdMxM05FaGLRnXFth
         6Y4jot7yiWdtp+jaiThbSdGIlrGUqV/GdyL7P2vgaxbK9vPErGcq9MmXzm1+YqLIzO3j
         GhxMMN3DcbPy6Ovj6+yvzW1Dq8CoYZC94g+gv574vGU21MkYncHlyKoPfJHOquje6RU5
         ZHezxEkyY7JK6jUeGTjAPaPlXQOW108reU+rcyCitXcfzgB6/za7ovRznQT3b/FeGcnY
         u7MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793277807; x=1793882607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SIlFgE4OumiQRk5RYF1NqMAtVvpXPkvWnQ5sbLeNBqY=;
        b=dwhhUsHWaom7Z0THYwyD7TT3s04VmbURZdOGg6bWIxZ4TifFs209Z+QYZQ3eR1iu1U
         UpWrRtj2LtCsX9Csnh8QpY1a0e6AQPyTm7PJNYbJVu+aOr348GTUph778aDhWIwlJvAj
         jy2Qw8/y1LorbdgQKxkf0Lt6Ghszr0EXU/+d96v/7HnxXXbv9Uyr9FXlwE4n851r8PcH
         IWlI5jZS1vMhjzcbY17Z5kOaYjtuihHU/JSmeyNdO+i+kjMFlH79zAfJd3gVbbIFm9Av
         TOI5gaGHA2j51eZ28bz6U+wZBE5kkzDdL4TqyjIgfTAsUCFSeRnOQbRyYGa9/2fGmhiC
         1GQg==
X-Gm-Message-State: AFq9FYIHyt/Xts7fR8aaDqDPSjLfhVmxbQO3MyKDHTpI8F7K/uJHQGzG
	hdwTMygRzIZ8cg4FvLTYkky5UutCiKvnB22vUIugB7a4Ehd8JAZ8mIghTmu/ebfhKUPaso8M0Lf
	9q8tE8i3IMHMxovV9KtxeP/zLCqV9Me+ca9Y88+h3USZqZlXaqW1mAp5u+6TwKH0xzW8/IBVtsQ
	==
X-Gm-Gg: AYBFou09LOXYid2i25bqrB9Um3g/ZNfpZ3ToheAKA/kOwd/0993yXz9TnbjLSd65kOy
	sxWxN2SuzVf/ds3r8RMJu3fQGXKHK3YhXNQSHIDwRwWZxCqpKi4cVWW/38KsD4mxdPiCsveo1I+
	RYHobWGzbC8pyAiF/6sn3knPZHIkdyqu0fLUr/raS9tpL0CF57ck6YTW6xbjghW3NIvqJCLggG4
	Fl6wtw6wiymN3AZaNghvNKMQCXf8gb5A2PhCxLR6QqCuM6L9XcZr0w+v9AinMte2RBnhuaqxKBV
	x0ujqEs4vzkffZaw6W7J/Jxc5JscbDi5hoRYnRCtlJ0CJzEqbqXVe9nMd0xiNvwxbtSAet0HI1d
	w1IVi2AOgwtYLMd6UwMVJvP87WcCWe+5BaCKbD1p+MydzeIFCKr9AYknZOv+VarAzeSjL4vbmy6
	hJmFzKL1gbQ3Rmhfb0RqHxgnKbIbovBO4Fzu8SYlqg8KwBBPuo7hfFEHIe0SQN1AwtDxB7QNkt7
	w8=
X-Received: by 2002:a17:90b:17c7:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae58124fcamr4172747a91.50.1793277806829;
        Thu, 29 Oct 2026 05:43:26 -0700 (PDT)
X-Received: by 2002:a17:90b:17c7:b0:3ac:7c52:fae5 with SMTP id 98e67ed59e1d1-3ae58124fcamr4172720a91.50.1793277806232;
        Thu, 29 Oct 2026 05:43:26 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8401casm4284191a91.11.2026.10.29.05.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:43:25 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>
Subject: [PATCH] lib: sbi_pmu: Allow resetting an already stopped counter
Date: Thu, 29 Oct 2026 18:13:07 +0530
Message-ID: <20261029124309.3689651-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0OSBTYWx0ZWRfX9VbbhifXon9G
 BrWrRGOmJ3W+M7oJDH03xjyt1FUhcQRUti9fXdkZnz1Pv0lVvYc/wBF/CVgnP5PMk/1yzFrcXer
 iugEpxtCmQhGE+gT2Qmb14XM9cXDEiYhDAaWKcpIvH5MxLDhjTmDDvl3oXIpY588dMvqKiWBdwb
 clxuaDNLZZCYPTK0FuFmqMoY6mJoLcWmTITEkVUyLU5sNZRcUwsjEo+ulcE5Uj8q3Sz+VCMqabe
 Khg59y+geSimiC96uGx/obsnomAl1l59XIgUmplIcszACgmxjqAzoGWlEIvN8dPCOAioquDQYUw
 4K29NvOL1Rw1RUFkc8h2n2zQYJV/YjUeRkj/yXejYiQyrD3z3VTzUAdTo5MUckpkEvTBUZZq6Vc
 CQPgnYb9f9gQgonzPvmVIqVZoeKE68xx0ZTnYob3cxJAmlluzBOYZW32YmdtYXGD1C9OY08fMFw
 jXi3/e31G6LzdylqyRg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0OSBTYWx0ZWRfX+92txSuBh2Yy
 7Gn2VjJL4UzJhMy2hGynZdLGdzePGdZZMhSfQLB1BgJuVY0TzkcyogKn+CF+Yin/c9zeWBjWNCm
 Vro5c4TK39O2t3s1uY878c/OHVggl3U=
X-Proofpoint-ORIG-GUID: W_CTwOHD98VbhosD82r_RzTvkdE9yhdo
X-Proofpoint-GUID: W_CTwOHD98VbhosD82r_RzTvkdE9yhdo
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6ae33f70 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=NsMoeiBgmrf3wRvFGV8A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_054331_002263_26DB763A 
X-CRM114-Status: GOOD (  13.47  )
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

Kernel sbi_pmu driver issues a counter stop with SBI_PMU_STOP_FLAG_RESET
while removing a perf event. This is done after the counter is stopped
which causes pmu_ctr_stop_hw() to fail with SBI_EALREADY_STOPPED.

Allow pmu_ctr_stop_hw to complete the requested reset and return
success, while still reporting error in other cases.

Fixes: c5077d497d0f ("lib: sbi_pmu: Fix counter and event info error codes as per SBI v3.0 spec")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 lib/sbi/sbi_pmu.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/lib/sbi/sbi_pmu.c b/lib/sbi/sbi_pmu.c
index a043dc7c..01c45f7a 100644
--- a/lib/sbi/sbi_pmu.c
+++ b/lib/sbi/sbi_pmu.c
@@ -721,16 +721,21 @@ int sbi_pmu_ctr_stop(unsigned long cbase, unsigned long cmask,
 
 		else if (event_idx_type == SBI_PMU_EVENT_TYPE_FW)
 			ret = pmu_ctr_stop_fw(phs, cidx, event_code);
-		else
+		else {
 			ret = pmu_ctr_stop_hw(cidx);
+			if (ret && ret != SBI_EALREADY_STOPPED)
+				return ret;
 
-		if(ret)
-			return ret;
-
-		if (cidx > (CSR_INSTRET - CSR_CYCLE) && flag & SBI_PMU_STOP_FLAG_RESET) {
-			phs->active_events[cidx] = SBI_PMU_EVENT_IDX_INVALID;
-			pmu_reset_hw_mhpmevent(cidx);
+			if (flag & SBI_PMU_STOP_FLAG_RESET &&
+			    cidx > (CSR_INSTRET - CSR_CYCLE)) {
+				phs->active_events[cidx] = SBI_PMU_EVENT_IDX_INVALID;
+				pmu_reset_hw_mhpmevent(cidx);
+				ret = 0;
+			}
 		}
+
+		if (ret)
+			return ret;
 	}
 
 	/* Clear PMU overflow interrupt to avoid spurious ones */
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
