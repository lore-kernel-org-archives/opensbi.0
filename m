Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 584CDC44512
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/oFINjfe2Vr3HtsKgdD9yKif7A4EW4c0QfrRUq2Qn0=; b=3AZy8589CugXXs
	yaDvI9a+5gBRaRYDQ1eiVBdK4ZypRnKs5Xnkms5BDfCNuVap3YtZq4p8My7ORlsBKfksT1oN2VNTM
	ZDNUphREv06Pf0miVtEFMMMuZidMOoxw4HFOwicWTxxUbjPjXfsnfbFBtSf9n5GorcG2fWngEEJZd
	rXLAcW0x5Qz/ipzrwrughCbj47hdvGVDImf6gcl4eww6Kbkc7LssJwogJFoAn/JdDw5k5x1u8dh2x
	iKmWqFzEUjXY0xZZKS4sYVRfctkYTAQu0hyzONYGvo7HnXGz5hPwqdkUVGp+h7fMkBE46jA3zf2tp
	UJzizwISESCRwAoJoRWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjr-0000000Ap6D-1mar;
	Wed, 22 Jul 2026 03:35:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjo-0000000Ap4v-2ERL
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1DV3B3152067
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cam32AvDmdj
	fb231kn8n6LCsY9Z/W9Pggv1U1566DYc=; b=CH2Qa4Dud/bkeZNehfM+scROPsH
	9KRcARL1kIm2o5h3vO6ErrOaDIAuc2SKlFl9Ctjk/jwNZTH5CumAHWY19UPyfuAw
	0yqgoySOkPzy8Tw0kK7QxCqSwnTW9z9EjL41krCY6fNDne7JL7Ei/ydCR32i5hav
	ivxQdKpgGvdKxpTiLPbN/ytPA+ccw94PUkMniFbbvmPpKAEYCenH/5VPbuVdQtCF
	h6jet3YPDoEWrvMT7ow2brN7uBAkfUq7NsZ6c//H2ey0ePOBUh95Vf+L+C/Mm55K
	uUast5XZIz3irOWWpReDaTtQryn9FuVUeU/6qCwaAnqP3XLykIsP26Hgatw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd5e1y2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:16 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb835525b10so3067798a12.2
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 20:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784691315; x=1785296115; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cam32AvDmdjfb231kn8n6LCsY9Z/W9Pggv1U1566DYc=;
        b=RaPQSNEuYEpOgDT6XzQU3eQdaSJmzHHUIfYV6feOumotIwyDTrHP/WZzejoMRhMg9G
         vEfIVsHlhLl2FY/MWhiB300IW0ix210DO6uEyEqsY6PzXaNrYC4oEwjiO5CopX84ePBo
         CyBJdLtrQw8ZKuRm4e+uXN8ystSpZ/C3Qb7mvPJUhm/Peg/JavAyji92tLWlnHBAPa5g
         ZZHhldTa60cTNIpjgtz4OdDZppK0cgL3Mtc/G6TQHYRHxJxqQulfPoJcsKAGLQJQIqCC
         4fRwm6QZ/nlIWnpNREiW7dGkdYp+xUbHwQuXLKXVVOVk1iKx5hbnx1bN7znbQ2cFfxyi
         bAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691315; x=1785296115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cam32AvDmdjfb231kn8n6LCsY9Z/W9Pggv1U1566DYc=;
        b=SbdibstJx6af95J0amITx7obDHewqfHqvQ79UEMs44vrvQ6nm12o6T+SnoHM5krHUh
         LjvKV1XnfQ9tU56lQa1oBTlkOpV6uexk2mC0A0wplIpfVQV3lUWZx4UbJybVZUTN9HZD
         m+N+sAU5UTVg8KV1Y8tnPVk2UDgngOFQiFfaDxm2OerqW1MsCtkklgar54l51lddc54S
         Jon6iosOTBRCudCNNDCRR/MZPUMkCHA2vSj4KsKxsSYcm/9qUB9uX46Z8uTHyKnf5q1g
         ZxDGWHLd+qs9/Nr0DVAovrvYKndWGoZQyMc9f745mUatUIX8q+AAtChNg1/IGKpQwUtB
         82eQ==
X-Gm-Message-State: AOJu0YwdaXQAeC41uT9gvYFeB7siILq1ESUX29aZA2Qet3LDjNraYDWP
	sRG2+Sln6b2wiifHRu/AZ8516Rq3xGWK9BT/vZmOb572hH0ADNpxe5PxrJfGP5TrisHtRh76K2c
	MF+qJ0XW6dEwbzn+2XCZqrGZSrUPptcJJ9/PB94CaDkk61AcyNMmwCOX9JfVsr8vcSvME12HmNQ
	==
X-Gm-Gg: AR+sD13wFbLF03ayCxGdjbXV2Uj5fH/9BuY9sMwg8PBZFoBGSoJwwvRtD/lfaspxL5f
	u9yDD2iG89BSVEcMrKvxIoGwtc+ZW6q87Eup3ulAhuCBSJDS79MQuyVKCsGVUoDGL6FopwJ73Z9
	jT6q7QgQnx0MjX6DkdoRJ38ALaGzxv4/Bt3XDQ8cnaFOLs7apn+jqzPxEX7kfIQ/x0VisqpVx0S
	NSG/CJwH0MoFULLBhtODGb0IctRo64Mu1R7N+rOyaCf80pJ1SwzqkWPb5+cNtpraludGfJezRsV
	zExzviaw8S41tirtNIdx2L/1wKDCqbYHQ/7c5mbEYeuFbdUJn7yMQg4k42HRu4gLNByUT1dnhAu
	urwIB0gCfLNZdhsVPKcW6krVUXBD0XNp6n3/C7qlMGY8Hjv96b/7wCYSDah28U+QzR1h/1Pj9S9
	zE/mwcId075XwgrnpS9A7B
X-Received: by 2002:a05:6a21:6b16:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c3ad5ff3b3mr23387463637.13.1784691315483;
        Tue, 21 Jul 2026 20:35:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b16:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3c3ad5ff3b3mr23387440637.13.1784691315063;
        Tue, 21 Jul 2026 20:35:15 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm1645787c88.8.2026.07.21.20.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:35:14 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH 4/5] sbi: hsm: Activate MPT for domain on hart start/resume
Date: Wed, 22 Jul 2026 09:04:53 +0530
Message-ID: <20260722033455.2658178-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
References: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: U_-w76uHXQuN38JYL2Cpgy4RlshIuPkx
X-Authority-Analysis: v=2.4 cv=CbE4Irrl c=1 sm=1 tr=0 ts=6a603a74 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=I2QwZAZjeMJzLANR6iwA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: U_-w76uHXQuN38JYL2Cpgy4RlshIuPkx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX+yV9Y1Q1HmOW
 POSvnGpUjpXiMVNtwshMELJp0WS//pQBn4kgHVwDR0ur8JosvDm5kan50EK0hs3B1pbYImUpxU8
 x5lvLV8usSzsHe17lhWqvxHye/k6/39CkHknhw1qrBMdIzuSAlPks+YlFNIlGvXMMDEqPVe2t9p
 Ix5wLUeyA4hNthU6OhZyY8Vpq6SaZ12IkgqQ/TQ7pnv83xVU3Og+kX6WDvm9FG3q8RGWmxw6RV+
 1NA/Ha+Av5YZRo+k1mykxd4jaWIAS3IP/ePe+Sin50cpdsFRLH1IOhbTtZ+GjSY0sebLkDJxfkF
 M81OpG2QGEcglXN4IbPz428yYKzHFu4jVFyKgA0ohYICVXDVYvQ5PeVN56fZ5fUE0+UVed8fL8y
 ukpryblCGOse1IXMmUpSl6HdTXEGk6gdy8a1vtZKN+rV9nB47JTqJ6TmaXD96tg1sDK/JZvpP7y
 I5BsKg1+GvqiiJSiqgw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX9Cmh/sKbMip8
 Y0EOL+6eaLUSGZmKaIvukuDLYt3nUO9dxi8UN2+hKnb9YX7OrqMRMpWut1EDGXx1Dj5b8kfPc/a
 2/lbcqx39of7c02R55nGvNYQ0E/+W8g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203516_701272_D4CA0A13 
X-CRM114-Status: GOOD (  11.64  )
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

Program the hart mmpt CSR for its supervisor domain on the HSM
start and resume paths before entering S-mode.

Signed-off-by: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
---
 lib/sbi/sbi_hsm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/sbi/sbi_hsm.c b/lib/sbi/sbi_hsm.c
index 0a355f9c..eb39d5c2 100644
--- a/lib/sbi/sbi_hsm.c
+++ b/lib/sbi/sbi_hsm.c
@@ -25,6 +25,7 @@
 #include <sbi/sbi_system.h>
 #include <sbi/sbi_timer.h>
 #include <sbi/sbi_console.h>
+#include <sbi/sbi_mpt.h>
 
 #define __sbi_hsm_hart_change_state(hdata, oldstate, newstate)		\
 ({									\
@@ -154,6 +155,9 @@ void __noreturn sbi_hsm_hart_start_finish(struct sbi_scratch *scratch,
 	next_mode = scratch->next_mode;
 	hsm_start_ticket_release(hdata);
 
+	/* Program hart mmpt for its supervisor domain before entering S-mode. */
+	sbi_mpt_hart_activate_for_domain(sbi_domain_thishart_ptr());
+
 	sbi_hart_switch_mode(hartid, next_arg1, next_addr, next_mode, false);
 }
 
@@ -478,6 +482,9 @@ void __noreturn sbi_hsm_hart_resume_finish(struct sbi_scratch *scratch,
 	 */
 	__sbi_hsm_suspend_non_ret_restore(scratch);
 
+	/* Reprogram mmpt on the a resumed hart */
+	sbi_mpt_hart_activate_for_domain(sbi_domain_thishart_ptr());
+
 	sbi_hart_switch_mode(hartid, scratch->next_arg1,
 			     scratch->next_addr,
 			     scratch->next_mode, false);
-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
