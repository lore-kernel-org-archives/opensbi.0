Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F587C5DF81
	for <opensbi@archiver.kernel.org>; Thu, 20 Aug 2026 12:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jdA/K8u6t5rlEO+/qhNCoFNW8xh7UEgq1Vjc2yv0lHA=; b=lOeEr6SQJMdqhe
	DCZvWNzp9sQRMzKSEibFO3ZLkSwwND+4aFpKtq0VOf8WwTaxltLIg76fui/KfEnIg8R+jlvSMkZ3y
	2AMzkvgvdXzURgzD4Ej+ru/3W+fdxA7MTzvAm506PD0UjXN3txb8tr7baVCHxLyuyiKWPUlDz4fea
	+Va92avlYalmGtglkBhNTjH0y7TzmBrxyKz6MsZottIm3G6XR77Cl4+lVdyY52ejgT3lG6uHqcz72
	IQnETMFsDIEv8ipIpP+WNBXboSUcl1PyR5UZurlIMshXIKuXQARNqPEuoAK0bIndUrOHxowMNlGJa
	YUgV+KwfXY/v2L7s/V7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1e7-0000000BVeq-0Zix;
	Thu, 20 Aug 2026 12:13:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx1e3-0000000BVdm-40Mu
	for opensbi@lists.infradead.org;
	Thu, 20 Aug 2026 12:13:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8jjUx2529709
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 12:13:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=af/gqX54+Tdg4UO287P+t1ViYcl2/TUJhPZ
	ZMEKV59w=; b=cAZsSjsFTKz/GW94E950QkI9PXrmHubIWcaUf2i9Alu2s+AN19v
	3GTfu80GDVIwCSr3qSPh1CSb2NtfXZ5+OeB/MAgyAw2AKzHSu3wVsWNatQNQrY4i
	puv0g9/hLvhNAW6hXD5FVyIL5ubrnK9qu0JqdxA1rZwiiK6hqp/sq5diFd85Ax2e
	D/mlly0ctQ+gFOmf3dzwhYIDR5LByXINF4RrX/sotzwhDUh0k2z/+KHeAfSTbv4Q
	c0ih41OhMWCtbTyp240/zXWRjBRMM6Q9BQJOUkswfzUBbG2Hh7dkKQSkR0Ueu4sa
	tSedClSWU9fRbEOQpHZNkOrP9mF4SAdb8jQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5xbv8rsg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 12:13:17 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso53584235ad.2
        for <opensbi@lists.infradead.org>; Thu, 20 Aug 2026 05:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787227996; x=1787832796; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=af/gqX54+Tdg4UO287P+t1ViYcl2/TUJhPZZMEKV59w=;
        b=OlPuueG8uVnOT9dv0N+Spx/Hfp/o092xQwXhvpE4dhTOUenZaDN5a0Ql0XWExFEsUK
         o43NBxKvVBE6dCluxh88FibvoHfTz/LU7lQS9bFtl1ECiPI6ZFzCw0oNJA3fa9gRPvxh
         1ShKxthZcFCl67bKc/QYWNH3mWOsBMGf+o65s7nvD/6Et846on3YmK3dgoblJ8V472kb
         LhwKSLoxIuXga/7qLTDjAZkBmhWU4YcGtdzZqYpOz1bE9bW1X4yyDqynxxKaFXBaTtgt
         h1ObwlaZ/5+G8gVYP2AsvRk78lJuAJ8dAXFedOpDaTLwOcL/XB+o2QQPz4AHbYwvROm3
         IXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787227996; x=1787832796;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=af/gqX54+Tdg4UO287P+t1ViYcl2/TUJhPZZMEKV59w=;
        b=ak0VYZmgLZbP/3X8lxxS8d7bhwA/FZz63wAIRHtdIKVe3nNxnR6fegqgooTmieGsaM
         +DLYvsRyWQcBe3YNzg/rP84JsVuDJV/q9b2u97iOGkkGlhCwRZmRdZCF7GU5ATQHpuEB
         G+fizigJQvC/NzqCautPuvhUYTNbKsW+hrxjXgw/Xf1b/2OZYdjReeCk8bVIixdYj2X3
         pzCxpc4SrYSqegS7/dlOPDfW8IjbZ2hR3U2vnkgWOKvIvLpRHwAXpfr+dsqCEuDmLvKZ
         UIxHDE6PM01v6dqe1Mtr3Q5G6mWkCvAswDGqkOUhYd010sKrm7dgzjfDhy7etDtTiFSF
         a8UQ==
X-Gm-Message-State: AFuF++kQEGaJF+aqqptseWgWuE+Q1OI4bQqZT7y72aT2+f3P7V4cS5Zp
	JuV8Jy8Xi6urd+Vay9NrXDW6Qx0Zef6EVAPw0O4Y469hC7gVfps/1z1DKOwjatKWaZfJNqidUDl
	cnbThikIA06rsRFD67Fq38JkqHH4OVF6YOOmsEwq9d4Tjht71SRvnqWVi7dwIFwFA3R89UBHDRw
	==
X-Gm-Gg: AR+sD10kGS7PLOzCZMWnXUkHI0+Js61nTipzhuKcyrfbLfjxDYO1D8dyyK03XGcLohQ
	BwBNH2HzgeZZZxeI4HJFgBUn5VBzjm3iOJYpxJBrxVYhH+SP2vbIYJBW5q5vCi/Wik0hdUD3rI9
	7Uuk1dVK+sRTCjolm7d+hB/FQl+xnz/suNQWG8RZOiGl1eljeDOhHJLYslPhd1FWrDtIj9w8RPP
	ZQc5OT3i3s/VjRg7FQcUouRQzeZ4bKDMZ7VqV23HL68mBUNnvm3CSNaM+a8p33W7dWVqGK1q4Op
	X3mv0hVilPOknEf9iE5nJ1TDb051cCZGSJciSwJOomzcn1RyBIms9mYA5KeEwB3zoY45154x0CU
	rqL+MEr+OPyoOn9xUpNCyqRD6oZXMuZcKc9Wok1Pe/f2FRz6asOXQKlob6D/C3aJvBo2ZTW5vbY
	LPFnb6kl0qtW/wrvNLlb8d
X-Received: by 2002:a17:902:e746:b0:2cf:ccc2:6088 with SMTP id d9443c01a7336-2d5fd6b1a8amr212516325ad.4.1787227996239;
        Thu, 20 Aug 2026 05:13:16 -0700 (PDT)
X-Received: by 2002:a17:902:e746:b0:2cf:ccc2:6088 with SMTP id d9443c01a7336-2d5fd6b1a8amr212515245ad.4.1787227995691;
        Thu, 20 Aug 2026 05:13:15 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d55538fsm6005415ad.13.2026.08.20.05.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:13:15 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [PATCH 0/2] Rename sbi_domain functions and per-domain data
Date: Thu, 20 Aug 2026 17:43:07 +0530
Message-ID: <20260820121309.2551296-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=AMKAkK6n c=1 sm=1 tr=0 ts=6a86ef5d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=D2JQj3Sdp9h7u0U-dOcA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX7nM6uyR1esly
 a30as55wdz7WIwKHkdDukB99/ROjx/3xF3gqkLTL+jOiRnJ0zheCIN11f0J7Y1ECLEdKjYb9ye9
 pwxzJlZPMeJY36WUOIYdp1wM61fI7hF5YOf3WGdO/knkSmyWk8l6q4kClj/a1Y3+0pEvj87/ZM2
 i32s3Ox5Ebd4czYLhC6vWZIqAyLDErlCuQ+Nce0IrzL8C45ZVfh+Eft6itZtPi6dRjSoDFAT7MU
 EkMJ/IiTgUh929RlwrKRBFBB5A9IqQzvs1zMkKm2IrmsmdB601pkDBCgGPnqNni8Abp7DVL66bV
 b5FZv4Y0j+z7wIDpuflu+BidI3KR6Qs2GHDq7+/NeFhGFqz+fKzCKU2PNVoIvLn/tdIJXFqUfXN
 3WpOz7qlF13B5IZd0cwA9NbX+QAYUNnDf2VDIKw/0/PvAeIkWApOQr1/SqWIWiHoj2YO5jfQ+sy
 Mt+hyPZLSZy3x6rtehw==
X-Proofpoint-GUID: yeHEK688jQVq1TUgf0HgFC85GseENr1A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5MSBTYWx0ZWRfX0LsAqlX4zkul
 31UQcto3jQdHlvGoucQXSbRcFel0aM5LalnKPGHGOEMbc2yx0xKvBEXmcR7ZH8k34ywwNDmihJC
 QQ2/PswvPMeKTyJO9bNDxIBa/BgGo9U=
X-Proofpoint-ORIG-GUID: yeHEK688jQVq1TUgf0HgFC85GseENr1A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_051320_213397_B4401438 
X-CRM114-Status: GOOD (  15.31  )
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

This series changes the names of sbi domain callback
functions and per-domain data structures and functions
to represent what they actually do. There are no functional
changes.

Patch 1 renames the hart protection map_range()/unmap_range() callbacks
and their  wrappers to temp_map_range()/temp_unmap_range(). These
are not generic address-range mapping operations but they are only used by
M-mode to get temporarily access to an S/U-mode address range.

Patch 2 renames the per-domain data mechanism to per-domain state. The
areas registered through it hold various states associated with a
domain - hart context in sbi_domain_context and MPXY state in sbi_mpxy
today - which "data" does not convey.

Patch 1 earlier was part of SMMPT series but due to patch 2 making it
a separate series and it will be removed from next version of SMMPT
series.
https://lore.kernel.org/opensbi/20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com/

Rahul Pathak (2):
  lib: sbi: Rename map_range/unmap_range functions
  lib: sbi_domain: Rename per-domain data to per-domain state

 include/sbi/sbi_domain.h          |   6 +-
 include/sbi/sbi_domain_data.h     |  93 --------------------
 include/sbi/sbi_domain_state.h    |  93 ++++++++++++++++++++
 include/sbi/sbi_hart_protection.h |  27 +++---
 lib/sbi/objects.mk                |   2 +-
 lib/sbi/sbi_dbtr.c                |  26 +++---
 lib/sbi/sbi_domain.c              |   6 +-
 lib/sbi/sbi_domain_context.c      |  14 +--
 lib/sbi/sbi_domain_data.c         | 138 ------------------------------
 lib/sbi/sbi_domain_state.c        | 138 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_ecall_dbcn.c          |   4 +-
 lib/sbi/sbi_hart_pmp.c            |  10 +--
 lib/sbi/sbi_hart_protection.c     |  12 +--
 lib/sbi/sbi_mpxy.c                |  56 ++++++------
 lib/sbi/sbi_pmu.c                 |   4 +-
 lib/sbi/sbi_sse.c                 |   8 +-
 16 files changed, 321 insertions(+), 316 deletions(-)
 delete mode 100644 include/sbi/sbi_domain_data.h
 create mode 100644 include/sbi/sbi_domain_state.h
 delete mode 100644 lib/sbi/sbi_domain_data.c
 create mode 100644 lib/sbi/sbi_domain_state.c

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
