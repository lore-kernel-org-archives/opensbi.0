Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD0C53209
	for <opensbi@archiver.kernel.org>; Mon, 27 Jul 2026 13:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/oFINjfe2Vr3HtsKgdD9yKif7A4EW4c0QfrRUq2Qn0=; b=xxjx1jNE0r/D17
	0ICNaudTFWpm3l7r0wtZg72Gkemv564ZomuCy7Sr948pF32Gt/ksGdiMKREReCmOmwN6k/qbA4Xo1
	y14Ng/OXM+TuFqf1fsy9gMLcfg7wjE2ei7BSjppqSqExFsoyHNM+QWhYZLh6+vbQ2elquda01aQsZ
	zf1Ye9vwkAQasNtNJX6BNCNKd0TChUrTctrE/D6J2TybeZQrLwLgh12WVFmabX2SpRDEIW39kkCSt
	v2vqQ1E72e+Hn8+63pEQ08OCY9frfhSoBWk/XLFt1uVhJr8zUqSDjR7drYlDTj94l9EpzZ4hNRpef
	zxsQ/Bnrjp9r5iV/Ojng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLof-00000002ugo-1xl2;
	Mon, 27 Jul 2026 13:56:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLoc-00000002uee-2ffp
	for opensbi@lists.infradead.org;
	Mon, 27 Jul 2026 13:56:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaRG3414024
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cam32AvDmdj
	fb231kn8n6LCsY9Z/W9Pggv1U1566DYc=; b=nR/6JlPCvcUc5XZmUuzZ9KwWvw2
	cuDfpG2syxwi1hfwF5m40F82mFr0w0EJufdSEZEPuKkoGnqLc5xhKcrtke/gOFHu
	no9VYDS29fZrJDMDShAHYQ3j5aQXaf9KkMge9RMMVgiPldixcuV608GqKYNg/cNw
	+KVK7Wxb17fBbHXe0CNAGgo5kL7b4bJnMLyMcn93dM7TSJpZ1z6/FxjFPofaaAbb
	wqFdtoEIqO7AmrTOAKDV/wegu4Pj+75OaJOUwi4C9F1rQjvTQ03QofIX1zSiq5/Y
	trm/p4Cv3TWX4qbCjinYQvo06GSHlvkDCHjHYo3q6F1nnhMaVl6V6u2+xUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4v68xc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 13:56:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc5faecf01so59413325ad.1
        for <opensbi@lists.infradead.org>; Mon, 27 Jul 2026 06:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785160581; x=1785765381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cam32AvDmdjfb231kn8n6LCsY9Z/W9Pggv1U1566DYc=;
        b=fyEhZy/7wn4fDLeRArtc/VEndjkie2UeAuD4DKL2H4cIXjj1B39TkeUPGQ7VEWjoiD
         urTx6GFBVT2Kso1U37+0ln+rfJ7xnNa5kUg2Vgno8YyytYlPMrc5mlah5nIsvyqwsPi5
         QD42tnICunZIaKwMMaxfWOLoM0JMdQLnUbSSFuLcmcVFd6SQvvt4PwJTXurOmtncjUHf
         grbGZU3ikSPxftpsJNaxOkzPJQguvJYeVtE8qcB9JEF525065bUjlV4m3eJ4GbmHPD/Z
         qyTdeFOSeyCkWpjSRFYUOaXQhmFgaiNNHs3eLa5zZyZU7GTCZ0cAkeObNRurxQJjnmH1
         jBBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785160581; x=1785765381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cam32AvDmdjfb231kn8n6LCsY9Z/W9Pggv1U1566DYc=;
        b=p2i2PNP/SgZvgYV5WfSEEUrBFkC8o0cN1M2Q5zYTEm2zy6jMszCgMp3UKDTSB3rWjX
         GqH4zj70/oD0PF+gHMz9FHkbHxh/DXEUGujxEkBd6F1q7npO8+XxEv71Vu9QHpbaMHiT
         KmqNdTVC6GnlTn2FlXSHvZM5bzQPEL/LLx/HgV4mxuBVkUuLm/J05yoyHMEG81NDGZYx
         QB5p/YH1Vz+u3ApLLJNqWYc61EZtwLLytBspDPwCKEKYCBiHZ/CvY9m716PPMrlXTTA+
         zp/qTyxQ2jwe/t7NEeU74e02BNBJIhqigTo4IVjWlqAnljYi3GdEhvibrK9oN5iHs9o+
         /14A==
X-Gm-Message-State: AOJu0Yz8pXgTEYuLfeK6+dCaxstqn+/Z14QgaJ6vvLBrN/nUp/SBEIc5
	CbKoLaPW6JzRXV6Yt2RSB6y1YI76eYsGrU4abNlE9PqW3M+lYhUhD7nGI3HUdE3uEj/ubs+dqz9
	3QGyVw/A0p+1CjsKl4iQB5299tIL6TJ0I9Y2Ob/QgA4/LeYM15xBFeROy4zwGtrc/Kq95MkViDQ
	==
X-Gm-Gg: AR+sD12MSJDEs6LMDvxkECq1q7Z2fbPzw1dhFqRy6l8Uwux6+1Lko5lB2aaDb8uqCzt
	oB1NzhBu7lwoaciwCcGxPsecKiIHZMp88Y2mEUPKKra2YWP4WcCGDHdRf5Q+ktSD+9Bk0GR96pr
	hszL9CietKu/+GHASq74Eyo30b1FL5v+abcleGmyqJriUuFFv6fVlcEUU0mB2lvI9Vud1WS/Rmn
	v2R+muxPZkC6BGEIW0vEePdSrEWaEekkHPp+D63SI4iE+lWYZfqjCoxSlbVrYA4nfLNk67T/zVn
	Ym4BUdbG4pNS6lkYu+Hj1AUWpV9zcD4ep79UOq1zwqvs7bvaQ08zgjQIHUVFkPTWdIB6emzdII0
	lpHMgYUNnWWRorW1fTKCX0SJ7VrLD8VWFCuuj3jHjbgcV/dO5Spl5Nd6lEOW1DbXaBp0IWysddJ
	W8rpSAB6oKrQYIEPD6PYK/
X-Received: by 2002:a17:903:946:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d008bdb8d3mr7745135ad.42.1785160581258;
        Mon, 27 Jul 2026 06:56:21 -0700 (PDT)
X-Received: by 2002:a17:903:946:b0:2cc:df15:91de with SMTP id d9443c01a7336-2d008bdb8d3mr7744915ad.42.1785160580831;
        Mon, 27 Jul 2026 06:56:20 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm47067658eec.25.2026.07.27.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 06:56:19 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v2 4/5] sbi: hsm: Activate MPT for domain on hart start/resume
Date: Mon, 27 Jul 2026 19:26:02 +0530
Message-ID: <20260727135605.465309-5-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
References: <20260727135605.465309-1-rahul.pathak@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX8iCj5iwIahXV
 xsAGhU4pFzuKKinuYCVCXLHvzIG+2utWkttd9YORVzJL5Dz36h/i6tKsFvxy8Z/S17ua/B2h9Ow
 aAmZzgekcod/RvpXqAaMvvBMpvH/V1s=
X-Proofpoint-GUID: sfbLYQuJthgvmHWw6sXlPTbYajr0xUbo
X-Authority-Analysis: v=2.4 cv=ev3vCIpX c=1 sm=1 tr=0 ts=6a676386 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=I2QwZAZjeMJzLANR6iwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: sfbLYQuJthgvmHWw6sXlPTbYajr0xUbo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzMSBTYWx0ZWRfX7FcIoWKAS7Cp
 Bwle52sTvFC7eFabbNzDfolTuOrCOP98dy9tNsZvOb9QI5pIB1ZWi5hzY+e19gzXl1buNToxVvP
 xYj3V6snPJklV6HoLCzBB4fNDm9A15gEz7huexK/p3QWxzOD18VzcZhpSneI59ueplAUBir+rnq
 bKVHSCsRcHSv/tirqfCvoXCMI+P3N6tKDcFVLj5aW/ZP9fsdGonruEd0BPBUgQ8eOKdY0GSTq5F
 gRu5ObtfQno9L5oKyQY5YO3ht78/vlIl5EYOVyMm4MAF6Ne7UbbjQNP6bq0eE3AvhfWnn1FWnzC
 2WF+2gk45FZ97rxvgg5d5q08Hl+mozxzdzt43TqMAUYZf7ctgx4mDDcKWP/Hwp0OAjfWI7hpzNG
 7pbz/9XIPYRJjf5VlYT19mJy0D1a+DtbpYPqy8MrjbUrXH666zAmTzUKPI8p+3xIVy5EqY8DexT
 3ouFspocJ5jAB+WnATw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_065622_899880_808461B3 
X-CRM114-Status: GOOD (  11.33  )
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
