Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4685C5DF8C
	for <opensbi@archiver.kernel.org>; Mon, 24 Aug 2026 02:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DormbE4aGaKnI4wvrzA2Vuhk4g0VBnjFEISkVujp0Xo=; b=3GOuY+8bT8Up4K
	HSY5M/QMZcUchLt6tSfmfWZhY7cQP5yZncD1s7pYu/GAcu52J6qZ7lLDKdIQ8aek++SUHvG9fWAB2
	wYNyPdFR8gZDBrow7hRz2klta/Y0KMu0gbUSYKVgXOzbXmsxFEs69sNdZuvOySZQLcBOIhdW2RIo7
	vZS6iJkXHzOdA9TymWJBMUQN3+9lFLkaNnoeDzzJzVaY99g12sw2nJqRyFApx4sqP/VpstFLxxVB2
	9Ut+BvY7l1bufBbykIXDdx7en5elH2yL2hS7H3SiYdsJKUADBc/N0/0iIdhpCef65xXt77iww7zXP
	Drejd2zqt+luT8YvHq1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8b-0000000Fkx2-13Dl;
	Mon, 24 Aug 2026 02:10:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyK8X-0000000Fkvw-29Z9
	for opensbi@lists.infradead.org;
	Mon, 24 Aug 2026 02:10:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0l2iP268840
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=pmRYpt/avk5XfjM7zuYWor0sEomzkDHkohN
	mdjI96dw=; b=HxDxpnHGGoOv9UFqV2SoT+WgeHfuoyGb9rpgS5jTWzdlc7eWCN3
	8oGB6IGynKX1oOHYL9+BnDIPdX4blAc8V8elYwli5G/sVCBDO3srP+eAJZ0gmaxn
	2fFd/4L3gMh3e5KpdWd61Q+17JMCoGtyUBpJP1XkVac0MxaWADZme6OBEwmJ2ecR
	MQe1MtRo/16duOC5gGL79GAbc7CgVB1+WlfWeO1DyeCzNwzlhCKqt4aixekogyKQ
	B5TaGuTwIF/AyCL7yov9y28/iVO7U/iaO/GjC992a27BurdDTlbKrm3lf+NScBoZ
	N5IaT/wCICoVxrtutAP9WUkBkpo7zn/epgg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qvx9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 24 Aug 2026 02:10:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8485b7e18b4so4866488b3a.1
        for <opensbi@lists.infradead.org>; Sun, 23 Aug 2026 19:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787537405; x=1788142205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pmRYpt/avk5XfjM7zuYWor0sEomzkDHkohNmdjI96dw=;
        b=GNE/KuDkYGCN6mdr8ZY9e8/CwUXJwB8xMIFGjxNmfLRYTTmH3wCSC4/nOuE/miYAnD
         yFl0Xyc7J4G/QIGjcggCyczJssbDru/H4u1ut/BXK+MxwQ1Qi1tGvcd6aLI66Rq2TWEs
         qdK4E88PHZK0VvlJPbyxM+VLI1TalOQSRgGzfaoOZ/VaVtXebRAIwA1oiHCVkVogrTM4
         FKsoKA1m7G2DYwZU6NVnAto/YytRrlUHFW6YErCjx0tU5h2hYlw68s2QTTa3n9hZjDYk
         TP5RQgcd9SpWB4eWpWHI8vUd+7LjKjwMs7mfb90QWz/J/Ia20RyBIA6aDZUs7FVhEigc
         bTcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787537405; x=1788142205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pmRYpt/avk5XfjM7zuYWor0sEomzkDHkohNmdjI96dw=;
        b=kBATNpIdpWq2Mpe0whUKVclFZo+zrbUQLHNNxyFrnHS0igXZM8+WojNtAdnw3ZKSag
         RxAR5ei4brPHgV9tshMsCb5Z6wpijNTq6POm2jAXQWrlL9e2SPfQACec8OUL4IpqOdUr
         lpMUHX2cJKY7HQ3rC3HzyNHmgKW6GqK5doty2nvc7g24W/F3a6QrsK903Z0l77WZ2aQV
         IdD8igawt6jy7LXr49VdsMgTwBtHbLF0K5gJZvopt5oQxujQoB2Sy33qzr69HPoNz6Cd
         AXk5phMy3LIQzikjF72W3aq58bUVLFALO7rdYG/fWbHnOzcGBcSTOb4J1oUyy7HhJrE7
         Ly8Q==
X-Gm-Message-State: AFuF++nB9E0ObAohAZrFhYa5Gu6UpFJWT12i8hPMJ492ogCpL5NY+UcG
	HBEp+qEh+jlhBvZgeFI1fw8SovyJ31+SLia66NnoNP4DadLksOvBb3EsrVg3O/hYzKquW9InUmm
	/uHNLp5dOMSEkaD8QPhS0kqVrF/HYy9VN24avyA3RTEw9eSmPN4uWCrmCS35PnzSN0JzA4Qaaxg
	==
X-Gm-Gg: AR+sD138KWSbFsbvdGOdfwbinCww+z2E3QPM6db+npm7bhvRguL06M04DQE9e/CHT/j
	WKGMPLhwuoQ7sYeW2kdVSuVhC9WDRa9Y9bpnTVF1JqEABovmlFOk1nteDLVYflsumq/3Hkc/U4k
	qMEbpB2O5dcETGTM0UN3VnhxX0H0esArHAYm2fAg7wU3ry9ZI3Qka7D4HQFStNkJMimnqPlhJd8
	4QrekSGuCX8k+nLqvh+2WTP5eeHbVtmugG4MJ7RgnCTfScZDpleFYfnCh3fVq804HaR4w8rjkxg
	HLH0xlLqJUOYg6+hGNJ8onwnqHL3jdXiLCyjWDLV/oSUJy6FRp5mxxV2tRY3BwT4buQShKU38SP
	FeyB2Fgcr0A5ZWDAQjQ3TC1rJspe7HQOE9I4WcMZkJu/lPBj+V0YF9iDlUQgOx7/LWGanEjRRAQ
	YqrKP6F9ClDZWd9gcN9BKV
X-Received: by 2002:a05:6a21:9188:b0:3c3:875d:c546 with SMTP id adf61e73a8af0-3cd4ba48366mr28876848637.7.1787537405232;
        Sun, 23 Aug 2026 19:10:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:9188:b0:3c3:875d:c546 with SMTP id adf61e73a8af0-3cd4ba48366mr28876722637.7.1787537404618;
        Sun, 23 Aug 2026 19:10:04 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f92359c9sm20487634eec.27.2026.08.23.19.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 19:10:03 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [RFC PATCH v4 0/4] Add Smsdid and Smmpt supervisor domain protection
Date: Mon, 24 Aug 2026 07:39:48 +0530
Message-ID: <20260824020953.2438946-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: LXuUbY983G9CCwXraADgT37MLxvcgv1O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfX1CfV9fdDEdmU
 jTwXo9corQ29KcrAxRfSYdsSxkt+lx45TW8Vft/JBnkkgH/IM724nMqiWX04mqZRjB6tKBsaoSt
 Qf7OYtqYmDkcOmzUPHDEBOs8Uipp7kMV1t1bTO6QBkshMq0+Lnij+5iSDe3Gq04se8uoZcPi8Af
 18vProoKlhOTR1JygNO3Igo+amMqDfMwiwg4mHk+A8I8G6UJlj2QewM53osRkyPbhhAdHx+PQlp
 AkF+sUnmvFjtMMi8PVvxfjzRqH6ufS7QBbcoO3KxY15S3Gl12M4AX5Ab7A39LOeLG2geYxkCs/R
 YG7MWM7iiXhNM6DGUtrdIeEj5kUVvqGhNOek4HuieK4+wFcO0EVWTftB7Z592mFwr3dMEFqHXyz
 AOaol6B4tqNungpaxAAYN4ivVGyCvktHrsALYJc/8tnaD6IQ0jFCt8TITmnK6zyVmhZ1Njqm/oH
 SDYJmLn7sRvbH7I6uTA==
X-Proofpoint-GUID: LXuUbY983G9CCwXraADgT37MLxvcgv1O
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAxNyBTYWx0ZWRfX4gIqAzcV0ShT
 UbU4l9qFgVmD4mwRNADVthGL2JnPhCPOGFiCejSkEQUCfAKJILa2vAfLi5X5cVoKehQIBWmjr3q
 hxaMGAiX+K6MNON4JHZ2eBHFe/T5Mqg=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a8ba7fe cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GaQpPoNlAAAA:8 a=SRrdq9N9AAAA:8 a=mDV3o1hIAAAA:8
 a=NEAV23lmAAAA:8 a=8AhkY8urYo2wpgZAtSoA:9 a=OpyuDcXvxspvyRM73sMx:22
 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_191009_674111_9F9101F0 
X-CRM114-Status: GOOD (  18.03  )
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

This series adds OpenSBI support for the RISC-V SMMPT specification
sub-extensions - Smsdid (supervisor domain ID) and
Smmpt (supervisor domain memory protection).

Together these let M-mode firmware confine each supervisor domain to a
physical address space that is enforced in hardware, via a per domain
memory protection table (MPT) selected by the mmpt CSR.

Every supervisor domain gets its own MPT built from the memory regions
of its SBI domain. Per-region XWR permissions are derived from the
region's S/U access flags from SBI domain, so a region that does not have S/U
access is mapped as an deny instead of skipped.

The Root domain maps all physical memory, with the firmware region explicitly
denied to S-mode. Regions may be shared between domains, each side keeping
its own permissions.

NOTE: This series is based on another unmerged series which is present here: 
https://lore.kernel.org/all/20260820121309.2551296-1-rahul.pathak@oss.qualcomm.com/

Testing:
Booted Linux when Smmpt was active. The boot dump shows the expected per region
permissions. Also checked with a small self-test in Qemu which confirms the
firmware region denied and the kernel region permitted from S-mode.

The Qemu RISC-V Virt machine was used to test this. The new cli args
required to be passed to Qemu are -

./qemu-system-riscv64 -nographic -M virt -cpu rv64,x-smsdid=true,x-smmpt=true

Boot Logs:

NOTE: The below logs are due the sbi_mpt_dump() function which is
present but not called. Its kept for debugging purposes.

sbi_mpt: mode=Smmpt52    SDIDLEN=6 max_domains=64
root_size=0x1000 root_align=0x1000
fw 0x0000000080000000+0x19e000  pool=global heap
SDID  0 root=0x0000000080098000 regions=9 dom=root
S-Domain0 Region01          : 0x0000000080000000+0x80000           : xwr=0 (---)
S-Domain0 Region02          : 0x0000000080000000+0x200000          : xwr=0 (---)
S-Domain0 Region03          : 0x0000000000100000+0x1000            : xwr=3 (RW-)
S-Domain0 Region04          : 0x0000000010000000+0x1000            : xwr=3 (RW-)
S-Domain0 Region05          : 0x0000000002000000+0x10000           : xwr=0 (---)
S-Domain0 Region06          : 0x000000000c400000+0x200000          : xwr=3 (RW-)
S-Domain0 Region07          : 0x000000000c000000+0x400000          : xwr=3 (RW-)
S-Domain0 Region08          : 0x0000000080000000+0x19e000          : xwr=0 (---) [LOCKED]
S-Domain0 Default           : Rest of the address space            : xwr=7 (RWX)   [baseline, overlay by regions above]
Boot HART ID                : 0
Boot HART Domain            : root
Boot HART Priv Version      : v1.12
Boot HART Base ISA          : rv64imafdch
Boot HART ISA Extensions    : sstc,zicntr,zihpm,zicboz,zicbom,sdtrig,svadu,f,d,smsdid,smmpt
Boot HART PMP Count         : 16
Boot HART PMP Granularity   : 2 bits
Boot HART PMP Address Bits  : 54
Boot HART MHPM Info         : 16 (0x0007fff8)
Boot HART Debug Triggers    : 2 triggers
Boot HART MIDELEG           : 0x0000000000001666
Boot HART MEDELEG           : 0x0000000000f4b509

The corresponding Qemu Smmpt support from LIU Zhiwei
https://patchew.org/QEMU/20260723200325.24969-1-zhiwei._5Fliu@linux.alibaba.com/

This is part of collaboration work for RISC-V SMMTT development. More
details are here:
https://lists.gnu.org/archive/html/qemu-riscv/2026-07/msg01018.html

These OpenSBI changes are also present in github -
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v4

Further Development:
This series add base infrastructure for Smsdid and Smmpt. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations.

v3 -> v4:
  1. Drop the map_range/unmap_range rename patch from this series.
  2. Move sbi_mpt_init() function out of the platform.c and make it
     part of the sbi hart protection mechanism.
  3. Drop mpt_early_init() and mpt_final_init() functions. The SMMPT
     core registers the sbi domain state callbacks for initialization,
     activation and cleanup.
  4. Add state_finalize callback in for per domain state finalization.
  5. Address the review comments like typos and add relevant macros
     instead of using numbers for clarity.
  6. Remove the sbi_mpt_dump() function call.

v2 -> v3:
  1. Adapt to sbi hart protection abstraction.
  2. Add missing sbi_mpt_hart_deactivate() decl in sbi_mpt.h.
  3. Rename the *map_range and *unmap_range set of functions in sbi_hart_protection.
  4. Update the copyright string.

v1 -> v2:
  1. Rebase to latest master
  2. Change probe order between mode and sdid.
  3. Add sbi_mpt_query_access() function.
  4. Formatting changes.

Rahul Pathak (4):
  lib: sbi_domain: Add finalize callback for per-domain state
  riscv: Add Smsdid and Smmpt hart extensions
  mpt: Add Smsdid and Smmpt supervisor domain core
  lib: sbi: Initialize SMMPT during coldboot

 include/sbi/sbi_domain_state.h |   22 +
 include/sbi/sbi_hart.h         |    4 +
 include/sbi/sbi_hart_mpt.h     |  312 ++++++++++
 lib/sbi/objects.mk             |    2 +
 lib/sbi/sbi_domain.c           |   16 +
 lib/sbi/sbi_domain_state.c     |   25 +
 lib/sbi/sbi_hart.c             |   10 +-
 lib/sbi/sbi_hart_mpt.c         |  993 +++++++++++++++++++++++++++++++
 lib/sbi/sbi_mpt.c              | 1000 ++++++++++++++++++++++++++++++++
 platform/generic/platform.c    |    9 +
 10 files changed, 2392 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_hart_mpt.h
 create mode 100644 lib/sbi/sbi_hart_mpt.c
 create mode 100644 lib/sbi/sbi_mpt.c

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
