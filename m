Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D158CC561E6
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cVM/GLi+DthXF/k6X4buQX+tsWOGuExUQhAfkS4zXWM=; b=Sj+aXCAaf27ThA
	R5L5it1ULH2lpPoVLHXjeH24V2IMwKdiCoKDmUPkGay5+BMIgekGZ5+9Eb/OP81HDO8TX5FBpgiaq
	pv70DqbvdnmfVOK48qXl61uryyo/K2/wLjLNihUrh4sBS2/bzTTdcRFIGrHMUfFUgqZqSLLuxyz/u
	imh/Iy2UDrA6Q8Sbwg6HVw8cuLLG4l+hWyTxzDomJHhHV2OdgbWPCbx2AChhhSQJgLzxiIZj3rfJi
	NK2UGtrQtB8MkpgQRV2/IwQ3w7qS45hvoLh4vlCygfBcb6t1awhHvhiNeTGqxJwRAjpZOy1RQPQwe
	HR5uY8ZBysRowxlsJHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgW9-00000004P4b-3XkV;
	Wed, 05 Aug 2026 18:39:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgW6-00000004P2e-3iuF
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 18:39:04 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HS65L3888518
	for <opensbi@lists.infradead.org>; Wed, 5 Aug 2026 18:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Li2pGg7hgSp
	bvO9mXwR+zKWbWxb6QnoZr6zwv0P8Iis=; b=diyCaiiGwghIpASEWy3OxE8DO4S
	ZWHs52gKj9OoHVeXQjfKvadhgWUs1kRoXCM4ilDulhXbqN2UsOjVabQ76HCKq79R
	Eh36Oz2MzEiC4S6CtaJFqzgLmGUmgpLi/qkmPmWKRRB/lMQSbsUgEM7+W3SBYIDa
	zq8mxEE87qsSIxEuyU2wxTV9sAnVtGrW4ZuiaKZ2Z83F/T/TseUfcEZ03wBrHtzo
	9j3mlDsZsCsMjl4+9/b1kteMvJTzFBbBZe3h/FOIaZKKRkkfh2kMY17HFlXbHyDB
	DuR6qGJYhpcZLG83HDqR/RdpLLTAn3bJxbhWokuHPnspX7Gbbk6yEj0i8Iw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x5sjpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 18:39:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb74d5db64eso1381400a12.2
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 11:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785955141; x=1786559941; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Li2pGg7hgSpbvO9mXwR+zKWbWxb6QnoZr6zwv0P8Iis=;
        b=KiwfCeXJzLNTBlp6WjM/KUlKVfXA3OZ1v6I71fbL3Rv6p1GeuKZIdkwkCh3m7nOzOV
         d+T4G322jZbIv50h8i58Zd+Ry+aZ1DP1yhGLEcCC4xtEmLS7lJ3yHFIAfmzpEvOq1VjW
         fQgTpydQsrQMMKtxLu8U9nkmK06OhLr/pPQ+yfE2U5XVYLaSN0ezV3kuELkkO+5aYEVp
         I1Xx+Q0xeVY74Vu6D7N3Pu+Ny42OfHgtROZAth+EiK+Plj5od+MvcKKGvfXdsWjiI++3
         3VioiJ/9ge+7SlGnDYV4AE1VaCWeSFw5ZVcsF8a0H/OkKavyWh5LJbF++gdCowBBrwQh
         TaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955141; x=1786559941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Li2pGg7hgSpbvO9mXwR+zKWbWxb6QnoZr6zwv0P8Iis=;
        b=n6yElS3A7NO4ItQX34ZMooh+cHKRzycJnOc+qwbYIeFe9VesPG0RKwCUl/Bb03kDMj
         LPu6rYqgDuY4Xpx56gTDfqNtfny2HscmvznapTIzxLmYEEQHAK0dXRruI6r08XMYwxNI
         quHd/BUjeKeBsAMQtITuhxpcNGku8bDoTfZXFJpeRMKb4wm2DA1x7I0C7RgBt+pY690g
         mFTm355mxmC06qbofLQGKACPWUIKfMtEQj+SX0hnsrTG/7eT9nXqFKvpTOXP8+fOwE6r
         sjoFwoLBe8QbdYgxC+lrpxfF4qkjfl4EDnZniAs2FsuQ86doC31ebT3F0MsySClfQfg6
         aarw==
X-Gm-Message-State: AOJu0YzkjY53F9YpvySIlqWT36BTBYY89NF3P5wSZuJ+IzTDWtNLxff2
	I013ZX05F0VKAknRfIizH5DSGQcK4o86l76ii6CfczQpD/8gFgBUr0XaRHlDos96BR2VYQwuHdy
	q57aMuH0dhqjo7FjJXhFe6pw2p7G0QhtA67aExVOF24iLUoePbrKyzQmkEZ52m0DCP7yyg/1ICw
	==
X-Gm-Gg: AR+sD12AkNxSr4CRzsk1JA0KxSuDHfhWcbGU1mI3bxzyeAVU4DEjOce9W2eSGM3ONJz
	h4wLGIAxASjyjR5Yn7YXwqDCDiq/JYKi3GlRz2tiztNy0Hxe9DIlUiHo2Q7x/xwGFzQkt0Kcw5V
	KYXhhNO6K7Xdi7ZombE1dq1ng/kx8ft6OkJjI+1FP9e2gvfKaVHgLqeCZ34luXIvdNBsxdOtzhP
	iQToJ8ZXK0q/xjbogntmzo04LZdVslWLMw+7PvloFtnwshCBB4sD03F7jfgceefsQuYY+Y8sSw+
	UZdSf1lqE2QecyluQonQ9A9MIjE1oE7aQdav8ard6KaZcEsDKxAe4gC5rPGV9BczgLaMbrl7y19
	ohSJFK8X1BAxTrsLQdTQeWM/MRSc2Pa2a5I5yae98FxrR3Ff9neD3ZO//jpgdXR0QXoZkD+jWo3
	MJTm/TsQ6o6SKV9BjhuNuy
X-Received: by 2002:a05:6a21:6b02:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cb85dc29f9mr11687398637.5.1785955140698;
        Wed, 05 Aug 2026 11:39:00 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b02:b0:3c3:89cf:f3a with SMTP id adf61e73a8af0-3cb85dc29f9mr11687339637.5.1785955140230;
        Wed, 05 Aug 2026 11:39:00 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm17636943eec.12.2026.08.05.11.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:38:59 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v3 5/5] sbi: init: Print supervisor domains at boot
Date: Thu,  6 Aug 2026 00:08:38 +0530
Message-ID: <20260805183839.2576691-6-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
References: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=Xea5Co55 c=1 sm=1 tr=0 ts=6a738345 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=K4ympkDPe7tnraVRMg0A:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: LJVOgxqCynEpAzfNeeiqA1zt3YtEhxoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX0/qATUy38TAf
 5s4LGdeQTBaBq7IezyAn+/fEkrkam7WvH3Ec95dmvwqWIRVa1Vhu4bOYCqDntcEa9uJsgp6UWcJ
 pNm5dccsNp17CtMt2Th0gF8BO2UAbN8GlDE7SINNBRbMF3mnO1tej70fUIeEgcht6T3gzE/Owok
 4I4Xxf3nXjHVwvcXoJ+JquSyV3wafDiMr1BaZkVo1Mfd7guTEl6x8JxG/wO7ynsQqtN4bUb0B+W
 AuW34Xcr2/cl2yGlCLrKZcQwQ49T8MMPD4/EK1Ur//vhFspcdIy2+aWVdBXFhVBP28t4oF+1YEP
 p0VgG7wXB11yqHLhioOtor1nz4j871o9nH93zed5Co3mlLJkrql6EPc/AJIVbxBmdllJOdi2v5E
 2CJigTnaq6/O6YcxoPeVrUXoe3HxBjVnz849XUd36qGAxaawiXTNAzMjFYKl7hHhwg+iSI1OXt3
 BwaKUBA6SfduIM8f0Uw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX1fzhCy0Z92FF
 Tz4HV73k6dK5TiE2RBngBgpdP18OSDc2Kj6KCjAyCl7pWcWqnydJRCRCfNrxaXdmixdeJFtH7XV
 yHoamPTM3dEdmnhCMGevdmBeNYRMtX8=
X-Proofpoint-ORIG-GUID: LJVOgxqCynEpAzfNeeiqA1zt3YtEhxoG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_113903_044096_37B4B0F6 
X-CRM114-Status: GOOD (  11.19  )
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

Print the configured supervisor domains alongside the existing domain
details during boot.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/sbi/sbi_init.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/sbi/sbi_init.c b/lib/sbi/sbi_init.c
index acd2f8b6..dc399494 100644
--- a/lib/sbi/sbi_init.c
+++ b/lib/sbi/sbi_init.c
@@ -35,6 +35,7 @@
 #include <sbi/sbi_tlb.h>
 #include <sbi/sbi_version.h>
 #include <sbi/sbi_unit_test.h>
+#include <sbi/sbi_mpt.h>
 
 #define BANNER                                              \
 	"   ____                    _____ ____ _____\n"     \
@@ -160,6 +161,9 @@ static void sbi_boot_print_domains(struct sbi_scratch *scratch)
 
 	/* Domain details */
 	sbi_domain_dump_all("        ");
+
+	/* Print Supervisor Domains */
+	sbi_mpt_dump();
 }
 
 static void sbi_boot_print_hart(struct sbi_scratch *scratch, u32 hartid)
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
