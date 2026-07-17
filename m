Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81F40C44515
	for <opensbi@archiver.kernel.org>; Fri, 17 Jul 2026 07:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mf1rmX5f5Eh/nPVSD6l9HGKtyp47kbrB68K796lKvCI=; b=ETb4v37EXIapyD
	SemEmEbowmO6knTuxdZzp6xQqXR4T6dr5tFIXtvUbZnCPZvA+8kGg3inu2KPxSwjXVEPg1VZPQNja
	DaRyrmT8gw4xRqxMJTs86GLgXnBp1H4z6zOOfRaXCgJMgQXKnKS/EvuDY4V3TpmxQJfO78B+99b/L
	e7Sh1AXQL0qSEyWQM0N0/nhYcwleUdHq7PaRNivubmD955gneYBGmxiLMp0EDZK8tG3NNeVGtF25w
	pJCT1oyyLo94Hi52Hruzeua9hGdnFm1pTEyQEEjqLhglQ52LsSLOMCIR/5qmLFKZSAVI4yBQnOFQI
	oc170r6RpdG4ZpJxcSPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFI-00000001UjY-0sQ9;
	Fri, 17 Jul 2026 07:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkdFH-00000001UiQ-2FVw
	for opensbi@bombadil.infradead.org;
	Fri, 17 Jul 2026 07:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=RSUtRhRuxL9eFvluyh5AyHD26K1U8Oetkv1OIr2pzv4=; b=kXXLKDsDV9f5+vhSuDEnpM/IJp
	jtQacOoR61Ey4zweuK8EuWcYdC9EdcriPHS09sQ/R2s6ay9gFAictNYa0jiFS9f2knlkA3FPMu3+L
	G5IRTUBktRGwbihzGfDOzCwxuV5Z2xIGincen9t/ESRH0Y03k/2V6bIkR+8U2JMDCpExwWzdqAutU
	fuXw1r5wEqMkbRGp3OWyYwsd7TfQB0dZzAch9U7ryvjfLRJZJa6NrKQeMqHhjrvyC2WLT3idb2+y+
	U4iRl6A99Qh1dywF1PCbyB9RSvQakg80Atdzl9NCQyzIoMfniObSzQHGdUB3pI2oBxr9NQ307+uQV
	QwNClByg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkdFD-0000000EcyD-3Hrl
	for opensbi@lists.infradead.org;
	Fri, 17 Jul 2026 07:44:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cvhM662142;
	Fri, 17 Jul 2026 07:44:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=RSUtRhRuxL9eFvluyh5AyHD26K1U8Oetkv1
	OIr2pzv4=; b=Q4PCxQ+xWvU1+te4/ZGR+TuSl4rYA7fnCxXSQi1JM2w+GQ8bLWU
	7Lw+DTI6Cy60aiLgKXKGIke8MnnB2FdUiN89Rms7VQteH2YELTHPtNjYVjrZjYrh
	FnT/Zvv0cqbIX51CGnBLgEOlQeqwUhF2oDMYlU4tDMZqTconvXtc+HKwNlGCduf8
	NB7FdxF5qz5Y9Fn6iIHY7G8IeuIN2FkHHgk3diFokTBvt7NuhRY9UgjH5wIO7Gra
	rpuaZnn0bqzyHscn88XLmgCCezxupxxfcVMa+yNrQJp/zC3K9ladf5l+g4F3Eu8M
	ArbS8wTW7xaDDSMgwYji7TPxTzXGbqyRIEg==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1m9kags-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:18 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 66H7iEWd015890;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4fbewm32q3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 66H7iEoo015866;
	Fri, 17 Jul 2026 07:44:14 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 66H7iEwC015860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jul 2026 07:44:14 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id B90FD21CFC; Fri, 17 Jul 2026 13:14:13 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH 0/5] Extend hart protection abstraction for ID configuration
Date: Fri, 17 Jul 2026 13:14:08 +0530
Message-ID: <20260717074413.2536416-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=IMIyzAvG c=1 sm=1 tr=0 ts=6a59dd53 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8 a=JZAHDvXsWLUJ7fh6G30A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX6DSyPeFtm1uW
 a8ZMuqw3n/sVAuAOkAYVcoCvufcsWFtY+HKKD1Qm6w/n9tkfko4DCNdlubh0yvqHAvHggCu5IJq
 1DhYLkvRCguU65GfeKjbGwvWwmP/cjUa7EjajDpaCbOgYjU4f4zrIqmU/+uNIw7kr7Ha6yp0+1l
 aGFegI2NT0C9VcIn3ZY+fI1leC/4gbOt22OnXCfqbDJqQoW1b0sUJeB2wMd4Zr3C784Bu5+AzNc
 p0npB0ZR5dwijBLUsOSq2jp3SMj5YTKufCL2Muy1ijhqP4Qcjm8nok+ARHYkY62hLHwgc5Z8DSl
 GekySdZVmF61RYWFK3GUtKfRYfyyt8BDF8dwIGm4q1FHFB00Bin5EifHBbpRoGi0uw11avIJ0y2
 gy8yF1gGkpwjUvzlUN4/yN2nE6kucEjzkLcQOTFxzCIFg05c7UjmK7T9GyzeGrEaBLSodBtugAy
 V+rJOXXuT98prBvCdig==
X-Proofpoint-GUID: wOo-1DJnCtYGQxYDQWP1Cx5Bnh_7SxPY
X-Proofpoint-ORIG-GUID: wOo-1DJnCtYGQxYDQWP1Cx5Bnh_7SxPY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NSBTYWx0ZWRfX/ynOFgP2s8Pa
 fDYMQTXlp0KowWFLbQaejBGSYqN/JqlrD8D9/wVacr5sdslSzwQuE6h0blpjaDX34YRaBUNCud+
 MPKOp+6/wDF/+rLZPKpdCITQ8QmTUE0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_084428_392198_06C74100 
X-CRM114-Status: UNSURE (   7.64  )
X-CRM114-Notice: Please train this message.
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

Extend hart protection abstraction to support ID configuration related
ISA extensions such as RISC-V worlds, Supervisor domain ID, QoS ID, etc.

These patches can also be found in sbi_hart_protect_imp_v1 branch
at: https://github.com/avpatel/opensbi.git

Anup Patel (5):
  lib: sbi: Fix typos related to hart protection
  lib: sbi: Introduce sbi_hart_protection_reconfigure() function
  lib: sbi: Add domain parameter to hart protection (un)configure()
  lib: sbi: Extend hart protection abstraction to allow ID configuration
  lib: sbi: Print list of all hart protection mechanisms at boot time

 include/sbi/sbi_hart_protection.h |  49 ++++++++--
 lib/sbi/sbi_domain_context.c      |   3 +-
 lib/sbi/sbi_hart_pmp.c            |  13 ++-
 lib/sbi/sbi_hart_protection.c     | 151 +++++++++++++++++++++++++++---
 lib/sbi/sbi_init.c                |  18 ++--
 platform/generic/eswin/eic770x.c  |   8 +-
 6 files changed, 200 insertions(+), 42 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
