Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADBCCD4F3C
	for <opensbi@archiver.kernel.org>; Mon, 18 May 2026 08:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7x7/iYlGOwsxadKfYJZKtYVrW/M5sskMaL0ZwpHSaJU=; b=miCabeRNV1xDsY
	ZoKVC1F73c/n7jJ0uOHyxTxWeUqM0TFoErvFkaeVdGrpQSpuwBm2yrhoTCon+kRymF/gjV8Wddo1y
	SSz01M2Ghy5CwXoVEKzmbKFVZp2R97U7/svpsXgtVVRpGRmLZgpOhUPU7SKDUPhvCzVAse8B2Vvsr
	216npdv62sW1lTKi3OhKlrErYl+TPTh+pQ0etEMNiZWDDP0T5d6qR8EXD46F+iVoS1YzsPSclEdhS
	pG9sLQvB9IStJfFjXiTBg5akg9R6sEQYcjpdBbWU2oSJWWBQWkJnROjgSVW86vuiLYn0Rtzrulw0J
	p01NobApb+aGdJ1K0dEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtN2-0000000EoF3-28TK;
	Mon, 18 May 2026 08:30:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtN0-0000000EoEF-1mlE
	for opensbi@bombadil.infradead.org;
	Mon, 18 May 2026 08:30:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=T/HXRDPS8UhTMThIXjmlDLrYIXv2BKsVnDNo/wbCUSk=; b=J7Ynm3rcmMdUizwVDaY6VjmbHu
	6/cLsoVpQ7ziixbkTqvId15u91y2czntbVuiGO042aEjvlnUUKvo9RMYUQLUUvl5brUS2ZsoN/YXR
	/kZtw4yYRhZUP9Kjw5ZPb36IaaRUHlOcu9PJToSf3ygezui5+Q7W+MhOafSQ8bzIeW2yr12aDB/mb
	+MgeksNwg/F7dN5O0sLQYvUoGWDKh6Op2mJBErlk93xrnx2aVe1RDA8NZqQrIzPEorMd0yz+n9TyN
	VXrb1Oh49zorV//0WY9CYAXoOn5jSvKafEmdhWYSKRQjpxWXxbPVwOA3hKHacCqnecTauj6fLo/Qw
	n9jXWE2g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtMw-0000000ANc5-3j9R
	for opensbi@lists.infradead.org;
	Mon, 18 May 2026 08:30:37 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I4simb3595488;
	Mon, 18 May 2026 08:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=T/HXRDPS8UhTMThIXjmlDL
	rYIXv2BKsVnDNo/wbCUSk=; b=U+L/ydy0256hzSxRj3kzZ3tB1TPRcH1/DrhQDi
	gMJLTThYx2ARucEwij9aog5FYnET9vL/5V6qdTEX+KwP3ngpNoF7L0vZy08vrO6z
	5wcnu7Xo9kQNUY88UzIbPYk/+VcdEI9wFY/8zUj76EeddgpU8gQsAYVI6sDDSUUd
	Ej1loMetTVGBgj21P+bx3/glxpVMhk7o87LN9sR8e+HW+wqmbiOIpqpRvnlDAFSL
	vwhCicwUrh5wA5cUJ1yNVdo4sl7A+HVeFfYG7ZOqeP4aTTxOLZdvhBjGYB+Tp+pF
	sQ+l8V8qVwsxW36PA+pnUnUJ1DAXxwd1ncHkf4B32RaPGzaA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0qdgeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:28 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 64I8UPKZ032693;
	Mon, 18 May 2026 08:30:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4e716cyqmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:25 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 64I8UPCp032669;
	Mon, 18 May 2026 08:30:25 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 64I8UP1M032664
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 May 2026 08:30:25 +0000 (GMT)
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id 76FC321AEB; Mon, 18 May 2026 14:00:24 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Raymond Mao <raymond.mao@riscstar.com>,
        Dave Patel <dave.patel@riscstar.com>,
        Evgeny Voevodin <evvoevod@tenstorrent.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org
Subject: [PATCH v8 0/3] Add eager FP and Vector context switching support
Date: Mon, 18 May 2026 14:00:20 +0530
Message-ID: <20260518083023.997323-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: Hh69fJm9X-mhz_s2G4tzWXDa5xo-g_Z0
X-Proofpoint-GUID: Hh69fJm9X-mhz_s2G4tzWXDa5xo-g_Z0
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0ace24 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=ee_2aqc6AAAA:8
 a=TB2v9Yog4TAX-pDngRsA:9 a=QEXdDO2ut3YA:10 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA4MCBTYWx0ZWRfX8kfNdHQVqTDs
 IjUlk4OKEl67p3juQWObcYPLVARCnlamFxh1TaTRo2EFJ9nxFPl8P1ijRVp7w4MtpUOvsyMf2Th
 kc4F64ypCkWJZbemVBWqYX6uShk7kPFZ7EliDL3BXT8gcyZqAbr/49JTWFyYEe+ZHE+TGb606Xg
 7bNkHgd58/FocvFVvs70JEtauB/DmXfuaSOay73PAllg9lOKjw8T3tYgdcASpgBoj0bUWv0J76i
 xg1D7yMxXFX3tAT9kPhZh/tV6uuFbkO5JXW9CS+hri337kPo0C9N8N+EXiWmoafeuEd2IQBPV9v
 CVWaFigOOI6ebVzmBDBlhe3EDiqJZWdaO1KCrn+H+S08Leekh1xhI8HVQngiDb2EKN1jNMArMi6
 jSz5EGu3yDK0/DsFMNYJp5smkmSZqh06YboPpOfgJIbm+T/TkOAroglz4oJx23K2RK9pKgvzIY2
 ns0DzJDc5BikHULcklg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_093035_565185_F3F5D5ED 
X-CRM114-Status: GOOD (  13.18  )
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

From: Dave Patel <dave.patel@riscstar.com>

This patch series adds proper support for per-domain floating-point (FP) and
vector (V) contexts in the domain context switch logic. Each domain
now maintains its own FP and vector state, which is saved and restored
during domain switches.

Conditionalize FP and Vector save/restore based on extensions, unconditional
save and restore of floating-point (FP) and Vector registers fails on
generic platform firmware. This firmware must run on multiple platforms
that may lack these extensions.

Address this by conditionally executing FP save/restore only if the underlying
hart supports the F or D extensions. Similarly, perform Vector save/restore
only if the hart supports the Vector extension.

Changes since v7:
- Rebased on latest OpenSBI master
- Addressed all my comments on v7 series

Changes include:

- Add Vector save and restore functionality
- Add Floating Point save and restore functioanlity
- Added `fp_ctx` and `vec_ctx` members to `struct hart_context`.
- Introduced dynamic vector struct allocation for vlenb in 'struct hart_context'
  to allocate and free per-domain FP and vector context.
- Modified `sbi_domain_register()` to initialize FP/Vector context per domain.
- Updated `switch_to_next_domain_context()` to save/restore FP and vector
  contexts safely:
    - Ensures FS/VS fields in `mstatus` are enabled (set to Initial) only if Off.
- Added runtime checks for FP and vector extensions where needed.
- Added SBI_HART_EXT_F, SBI_HART_EXT_D, SBI_HART_EXT_V to enum
  sbi_hart_extensions and the sbi_hart_ext[] array. Use sbi_hart_has_extension()
  to check for these capabilities before performing the context switches

This improves support for multi-domain systems with FP and Vector
extensions, and prevents corruption of FP/Vector state during domain
switches.

Dave Patel (3):
  lib: sbi: Add RISC-V vector context save/restore support
  lib: sbi: Add floating-point context save/restore support.
  lib: sbi: domain FP/Vector context support for context switch

 include/sbi/sbi_fp.h         |  35 +++++++
 include/sbi/sbi_hart.h       |   6 ++
 include/sbi/sbi_vector.h     |  40 ++++++++
 lib/sbi/objects.mk           |   2 +
 lib/sbi/sbi_domain_context.c |  33 ++++++
 lib/sbi/sbi_fp.c             | 192 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_hart.c           |   3 +
 lib/sbi/sbi_vector.c         |  94 +++++++++++++++++
 8 files changed, 405 insertions(+)
 create mode 100644 include/sbi/sbi_fp.h
 create mode 100644 include/sbi/sbi_vector.h
 create mode 100644 lib/sbi/sbi_fp.c
 create mode 100644 lib/sbi/sbi_vector.c

-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
