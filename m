Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90ECE8FDD0
	for <opensbi@archiver.kernel.org>; Sat, 27 Dec 2025 10:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xYyx2RipuW8LEjx8r+8wFZ/CGDiWi2S8rBsD40ffr+A=; b=Bv5UZPj+uYQEt/
	p3OiZlFTl2/kmNK9Y9v4mImoNeG3sXeaayd5g5FIBfXyCO0mMAAsQqjpRzwoaJs8y/kpG/EXEzz5t
	LhjutuZ8ywpLokWUxxJq6D/QLj2tcC4WVs7jhog9v4+xcWndZ+TnwCUfyrKUVadmpnPoY5LEyUODI
	/TRZWsh/ZP1UcXhN6AByPuFGDMwU+4TD0PhjsOE8qh/K7CsRgKlh//qwyKTapiw1FQoCUHf2i9D3L
	3dxEQfGe+xMLV7U9itchhJdKNc+M3BFZ0K3vH7Yi1ixaYuogBX9aXdCheJyijVDECVUDmK6TGFgEr
	6sEu83+N56obIwNmGV9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZREm-00000001qj1-3gJD;
	Sat, 27 Dec 2025 10:09:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZREj-00000001qif-3ixx
	for opensbi@lists.infradead.org;
	Sat, 27 Dec 2025 10:09:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BR3Vqnq3565425;
	Sat, 27 Dec 2025 10:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=cZr3JaAPitMmlC4pKGsFqeEEIHkV3Bw/TIH
	cGWqJvFs=; b=f4xw10CALCUamdlq36zqmXwJaiP5kCQ6MyhdNwtbVGYC+BbZXQL
	G5qBa53ESpu1cbWKPOKlyC2cjIUFtn5Bwrg3Kc+AnlFMOgnJiTYpHYFyfi9Q60O7
	F2ryqwYJ3uAUTctTKO85tRB5PdvUbADZ/NuVnaxgvhoZWFfJEczQAgUmcCAxpLGO
	IGybJKvN5mImnBh/v6WMdpm5lZZqvY0buKX72pc+4CbyK5YC0ipO+NaM9F+zObFZ
	ufjqgNTiWZAZAtOr1kK1BRXaxP/1vlwQn2ZOQnYqiZSKjfrY9J2vLc8z8oR/+yaS
	Estz9DEa48E5kljrJ7/7pHDddqyZaWd2HoA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6f60g19-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 10:09:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BRA9ILH018296;
	Sat, 27 Dec 2025 10:09:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4ba8hk9wbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 10:09:18 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BRA9Hso018291;
	Sat, 27 Dec 2025 10:09:17 GMT
Received: from hu-devc-blr-u24-a.qualcomm.com (hu-anuppate-blr.qualcomm.com [10.131.36.165])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5BRA9HYN018290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 10:09:17 +0000
Received: by hu-devc-blr-u24-a.qualcomm.com (Postfix, from userid 486687)
	id EBA5A21A4A; Sat, 27 Dec 2025 15:39:16 +0530 (+0530)
From: Anup Patel <anup.patel@oss.qualcomm.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Anup Patel <anup@brainfault.org>, opensbi@lists.infradead.org,
        Anup Patel <anup.patel@oss.qualcomm.com>
Subject: [PATCH] include: Fix LLVM compile error in sbi_utils/hsm/fdt_hsm_sifive_inst.h
Date: Sat, 27 Dec 2025 15:39:16 +0530
Message-ID: <20251227100916.327524-1-anup.patel@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nAnLAHQLRWglENzt123koqH6xX38c-2Y
X-Proofpoint-ORIG-GUID: nAnLAHQLRWglENzt123koqH6xX38c-2Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDA5MyBTYWx0ZWRfX410eMFqiqJa6
 och0sdqQWm3+hsGMN6Q/ch48gvr8bku1S6PDYsTrN7FuXmCBdgZgatMzVVJe9kyqdwA5H1oJlVH
 xzrOC/2Cf+8cw4BG+I0AW2gnuX1z2iUPyjBXgDCXxRvJrwuhYJ3/MsuBGCQa80I5bMN7MwePdUb
 ZL1XsgOPUFEX32zAS0jiDxrBdQOaUPlj2YdJg9vp80Pug9lJ9zhbRC5cA7IzhDYriR5IeUNI+z6
 JxPa7og/rFwyO7RQmPNCQuhrkTOaKODzvw6OhYKNtjWiQCLq8GcazInE72X7yiKaTtY+JijwQ2a
 AljESgz4NGpn/lC81m0LKM5tyrj4xDASAiRM2EZXKQkZYsXVoqbbT1A2mtXL35umjaraiX4Fcr4
 TIyN3wg3lUAjUx6zx9+5e5LxbFECiUxVyRqxqtlFzsM8xjaPfzpTQ4x4jJwUmLw4EZ6H9/PdaF3
 6Y1LdHrb0QKD0Pg1D4g==
X-Authority-Analysis: v=2.4 cv=YuEChoYX c=1 sm=1 tr=0 ts=694fb051 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=e8dQ48STw3_EGemJetoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 phishscore=0 spamscore=0 clxscore=1011 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512270093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_020926_056923_911B160C 
X-CRM114-Status: GOOD (  11.43  )
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

Currently, OpenSBI fails to compile for LLVM=1 using 2025.11.27
riscv-gnu-toolchain with the following error:

In file included from opensbi/lib/utils/suspend/fdt_suspend_sifive_smc0.c:20:
opensbi/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h:17:23: error: expected instruction format
   17 |         __asm__ __volatile__(".insn 0xfc000073" ::: "memory");
      |                              ^
<inline asm>:1:8: note: instantiated into assembly here
    1 |         .insn 0xfc000073
      |               ^
In file included from opensbi/lib/utils/suspend/fdt_suspend_sifive_smc0.c:20:
opensbi/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h:12:23: error: expected instruction format
   12 |         __asm__ __volatile__(".insn 0x30500073" ::: "memory");
      |                              ^
<inline asm>:1:8: note: instantiated into assembly here
    1 |         .insn 0x30500073
      |               ^
2 errors generated.

To fix this compile error, use ".word" in-place ".insn".

Fixes: 1514a327306b ("lib: utils/hsm: Add SiFive TMC0 driver")
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 include/sbi_utils/hsm/fdt_hsm_sifive_inst.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
index de8aba19..7e9180ea 100644
--- a/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
+++ b/include/sbi_utils/hsm/fdt_hsm_sifive_inst.h
@@ -9,12 +9,12 @@
 
 static inline void sifive_cease(void)
 {
-	__asm__ __volatile__(".insn 0x30500073" ::: "memory");
+	__asm__ __volatile__(".word 0x30500073" ::: "memory");
 }
 
 static inline void sifive_cflush(void)
 {
-	__asm__ __volatile__(".insn 0xfc000073" ::: "memory");
+	__asm__ __volatile__(".word 0xfc000073" ::: "memory");
 }
 
 #endif
-- 
2.43.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
