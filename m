Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7566ECD8CA8
	for <opensbi@archiver.kernel.org>; Mon,  8 Jun 2026 12:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7ifmd5a5BCE6yHAAnDJILsbhdw/DIcb3fmsmUTSbL+Q=; b=MPqJ3hIvQSJvTV
	m0Qlj2/Cijv0RGLcNkG05u2G6tTz8hkZIvyL9zI3wNcBvIgZbGVITvrNla9YqwTX+i6nf2ORcqPdb
	oQ8vNrp9hxgl9Fp0YH9mel+/tN72jvA2ghNBm+g91g89JHQJiULhpkDA2g+Ybw4V5dtK1lS3X/jxI
	jqY8GRe9nHV9ajjRCJHFjjSds/lTIbVVfeVIuFcJavRtq/fy8SjM16+mV7i7dVVn2get+nk0IqmjO
	fs+xAlP94t7xeXOlOtSnGBDuK7XmrnY+/r73P3h/t79UFxgUfnhbvOn9jFiIKlPkymUEYcJZJk7Ku
	NP1sUeCDwmL96qUgOcdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTv-00000003Xvk-0cJM;
	Mon, 08 Jun 2026 12:53:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZTr-00000003Xte-3G4B
	for opensbi@lists.infradead.org;
	Mon, 08 Jun 2026 12:53:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658BCGTL3480567;
	Mon, 8 Jun 2026 12:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4b0pcPd2hW76LYymjF6Cm3CR0rqBu8PPWID
	kxQLClFA=; b=dZWa4ovPs/iggfybpIRU4nRZ9c2N3niynICY6riU5jqptrQo7u+
	kNpZ+n6chlWUj8gGgCrfdmrF+we5ICEzdRccjnUKEm85JRAxqeCCjdolvOBcGkmX
	GfIgIeDqkKMNX9DPY95c5cZnulqoXHtsggshjiOcaPFpFhkzx97i8h+UGw1XJU5B
	MsNVClq/NA+IsZOe5GclA1D5/BBOjbIgDlX7MIKnDOiFeEOZiLpG74qd15/DqcOG
	eHrKidKnfIeY4ZQF0yWkXRzYYf9uMw/YxZegHnhBpoNyC6grw1Eql9P52VOw/m5J
	VqNvtCDFAjyA0GM3INVI1eTeCy2Cv53Ft+g==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emaj5085p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 658CrIv3018167;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmj8fsf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 658CrI63018141;
	Mon, 8 Jun 2026 12:53:18 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 658CrI1w018135
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jun 2026 12:53:18 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 1191D21AF3; Mon,  8 Jun 2026 18:23:17 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        "David E . Garcia Porras" <david.garcia@aheadcomputing.com>
Subject: [PATCH v2 0/4] MPXY MSI availability and RPMI notification updates
Date: Mon,  8 Jun 2026 18:22:52 +0530
Message-ID: <20260608125257.3220114-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: rrPhk4H-4CZkcw2SdPOqFTw1p4rtPqIm
X-Proofpoint-GUID: rrPhk4H-4CZkcw2SdPOqFTw1p4rtPqIm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDEyMiBTYWx0ZWRfXzuju27k2fYPf
 yyVzZEhnURt2HOsXkzkSIV9sVeXcvvu2vir1CdeCO2ymBqcXWSq3KvNAvczABLe8lUHjFwmRCBA
 xni64I39AYxn9iYAPpVAsNXlMrMPh8cIWJUAmhM4r+tVSVt8OucYTw38nxiR5WHwBINhQn6H0AV
 PL59V7FOmY+oYA3I5kHFay9Xu45m+18L549vnLHZKglS8i2VKJMC+yVPmLA/RbOeU57d9P5YseE
 4/kHh3/UItKrF0OBm5xg7q0rcnORyvy+QfE44A8+IgxLz1Ktgef9hLdMQy4Nbq2/gatLzTm1UrI
 huEiioM1zgwjzuJrzh1j6A8n7insDSsuSm6V27abFHHxTQAREQZ21PV/8PHhBdDNGe/kj98VmeF
 fiYI8m31QBfaih5XCkt1i2lJkrXZXa/Io8ytOEqEB0KYu9AqXByIiyvjE5Fsp+OQZmG2R1LAU/V
 0DZvfDxgean7MEX2XJA==
X-Authority-Analysis: v=2.4 cv=TLh1jVla c=1 sm=1 tr=0 ts=6a26bb41 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=mlbbMAg2AAAA:8 a=m800TuCUfr10df__xK4A:9
 a=MVgJjSScqoDYXLft4fpg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_03,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1011
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_055328_167790_F7EB8366 
X-CRM114-Status: UNSURE (   8.82  )
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

From: David E. Garcia Porras <david.garcia@aheadcomputing.com>

This series enables proper MSI availability determination for MPXY
channels and updates RPMI notification structures and Performance
service group event definitions.

Patch1 introduce capabilities in sbi_irqchip_device and adds
sbi_irqchip_find_device_by_caps() to find irqchip based on
capabilities.

Patch2 replaces the hardcoded msi_avail = false in MPXY channel
setup with a runtime check using sbi_irqchip_find_device_by_caps()
to detect presence of MSI controller.

Patch3 adds rpmi_event_notification_state enum, and missing
req_state/current_state fields to the RPMI enable notification
request/response structs for RPMI spec compliance. Also, adds
notification event ID enums and data structures for RPMI Performance
service group events (power change, limit change, and level change).

Patch4 adds missing SBI MPXY notification related defines.

Anup Patel (1):
  lib: sbi_irqchip: Allow irqchip drivers advertise capabilities

David E. Garcia Porras (3):
  lib: sbi_mpxy: Enable MPXY channel MSI availability determination
  include: mailbox: Update RPMI notification structs and add performance
    events
  include: sbi: Add SBI MPXY notification related defines

 include/sbi/sbi_ecall_interface.h        |  9 ++++++
 include/sbi/sbi_irqchip.h                | 11 ++++++-
 include/sbi_utils/mailbox/rpmi_msgprot.h | 41 ++++++++++++++++++++++++
 lib/sbi/sbi_irqchip.c                    | 20 ++++++++++++
 lib/sbi/sbi_mpxy.c                       |  8 ++---
 lib/utils/irqchip/aplic.c                |  1 +
 lib/utils/irqchip/imsic.c                |  1 +
 7 files changed, 86 insertions(+), 5 deletions(-)

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
