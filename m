Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FE9C55174
	for <opensbi@archiver.kernel.org>; Wed,  5 Aug 2026 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ef+iXbL5vjVww5FfLEOMH/jap2e22xQxQP7eEWuQkVg=; b=xYQ7Dc5iOcuu1n
	p76zH2RXcBud5y5u/U2U3FsrOx6GRLFbXhHgd+4Ub6Dpu49S74WEKTQ9DfXgTA7l4ELWtGU+zkOEN
	IZvBDQE0ViWdAxsGG/JcSca1Rwjx8j/LIFKz7YpwApYS69VZG3gWIfHLmypdiXRVqyL1TFyTuVXRY
	raQeBYbUp+QCgh4oRdOZlAy2uUrMDbkLKjoYDUQK3TVvBB2QUb6V8HEKQJjJhWsDyJ9STlCrAPEdu
	akljjBxb2yZtp7HT7G5Dh2FjPmwDQ4TfCDwX2/uzRAfw3aNgkt3mKJ7dY80zjUulU6lOsyCAMpGKC
	iDy+P2JtCbV2BoFVqlBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgVx-00000004Oy8-1mh4;
	Wed, 05 Aug 2026 18:38:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrgVu-00000004OxT-1jMX
	for opensbi@lists.infradead.org;
	Wed, 05 Aug 2026 18:38:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675HRvt73343741
	for <opensbi@lists.infradead.org>; Wed, 5 Aug 2026 18:38:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=leSillmoVckc9rQCIEtN2ylcPXdxuRZrxKv
	Vg/Tbfuc=; b=imHeDzGsREsTF34lwxHEJmhNYq0ln34xz7fUcDa9a/TFzrd5JaT
	E6IzYD7stZ5lxuN2MqGOb0POG24kTNCSxdaQu9cwSBDnY4y+SZn0yrR0r3XALnFO
	u3AHzXAkieNiSwt7iWQRmPL65J7DSVIA4zEhjUAMV4/i3RPCn7iC8dgrLjjFJp79
	0jn75b59Q+UGenbsT5Kl9O7lF9g/T7x5K1poAYhBW0+F75YmuI65ZhkScNh4kXPe
	gN1mB9bUBQEyVwl3S1izOjAuD7ntYr9mi2MrgE1ATAMNJVMh+puyv13Qt8mAGi1H
	mTg965p0zhMMjNrZPM3DQTRYeQXLqsx0cUw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv5x9sjcv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 18:38:48 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cf6acd760cso15979535ad.3
        for <opensbi@lists.infradead.org>; Wed, 05 Aug 2026 11:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785955127; x=1786559927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=leSillmoVckc9rQCIEtN2ylcPXdxuRZrxKvVg/Tbfuc=;
        b=Z92Zd4rDJ0ciZoz0qGPExS/HBni1HEPUGyhQ59YrSe9jcZe/n5hzsdxjIuCOSr9sl5
         R+RBSV3gTVN2qrLE33B6xW8BwvPVq9KpDCGmryQvWdV2Buyy9cnCPovY000AJ5rWrHgS
         hkbvv4dGFMExCV1ZNTazSruw7dZ1gR8MOlhsedIhDHUJToybGOlu7U2Fo4fN/oC9NXWf
         47sWJlnn+fVecunDBNjNVQ67vHMy9O6P47j99DqBiRu91U/FPE9M4HgeTTda03ozxyCh
         yOnWvZ5urhX2jgvcJ8EhO0NHKsEbFKK5COk9cgjc3zr4tN8KEwdJx7DjAu9gLTITgTzP
         mVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785955127; x=1786559927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=leSillmoVckc9rQCIEtN2ylcPXdxuRZrxKvVg/Tbfuc=;
        b=bmtAWWKpFKki6cJ5COMebdtr/qIQllA5nxlqlNr0f4js22K0UQYxzQrty2DMs3EJgB
         cYe8wxGRxXZcilTW8LDe5ZKUzeIn/t7gGNXJlGinv8vxEeSIooeKXm6Oc+vZstZaHUdS
         1Knn0QKy47N4242qJVDN1njSrjUaCULieeU2Y6SpW+P8e1e07YKE0JCm23Sm5kjKGT4w
         3fbit3ZxmE5eYydr4PFOcGDvoYXmHezbw7ZC9iDHJ6MHk4v7HsdTig7jSaJXKBALvpmI
         N7IeDj/dwnigM7hQH7FyC/rBwMvBlEhWRnjc/BElMquO6e+Q0Wd03TJHk1Pr8O5vvDHi
         aI9Q==
X-Gm-Message-State: AOJu0YxKlRW2m22opXZ3cbqeKTFUJLiYk+nVbsqEhQJyEH1LHs3OGdDQ
	iB0O7nXmFvx3J69XoOKSgFjkb2bO8YJuxPcjCRnBO8D7/n1Nl/nVRZAFI1TIv7zrbfpcHg17vss
	cq3f3liwnm8yWWBGdrvpgH4wbhiKy1j/tRfZmGwVJAf1sZ8j9SduaPRq/IY2Hd7C+YytEUql1mQ
	==
X-Gm-Gg: AR+sD10+yGePvazbULhX+awkkP2E/I6DCJygTj5XKzEcoix71vTFAm3eEwSIVbXKxDh
	fltdzhpf1O3ObsUghnHz7SVlbOpgtFOpT7up/tWzI5QXltp87R/XzPxVm0SM29zRMh/flI4AqAw
	HOjRysKc67p8u7H14EfEwsDCNTydOUPiaD7kCs44qKQ5rHtOXiOhWpUlnkfHKFHDfajAb5Lg//J
	BT8D0LyuS/XUciqhFoVVRxfxEWgTjHBIAqUd0ggfqK8HNRec0LVe3KA0fInA3RnZhGYK95bu6zY
	Uov8gR+tdKchpn2ItxbHYePQG8AwZqmBMCepU0JNg1OGXoEPdsEWcckjXZX89JxcUH/eAqWbRIE
	XQOPGM95a+weT9DFjEH4arLLQltBxD+BAdNsGfE/Eo9yobQuXRayz6r6jpQ9C/+3jlut0Ku9Tcq
	bjkw9xDrSRkx4KAXqQTBWh
X-Received: by 2002:a17:902:e951:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d0ca96246bmr112848105ad.22.1785955127377;
        Wed, 05 Aug 2026 11:38:47 -0700 (PDT)
X-Received: by 2002:a17:902:e951:b0:2ca:bf68:2a54 with SMTP id d9443c01a7336-2d0ca96246bmr112847405ad.22.1785955126855;
        Wed, 05 Aug 2026 11:38:46 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586447d52sm17636943eec.12.2026.08.05.11.38.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 11:38:45 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v3 0/5] Add Smsdid and Smmpt supervisor domain protection
Date: Thu,  6 Aug 2026 00:08:33 +0530
Message-ID: <20260805183839.2576691-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX3kT69xHGN7q3
 koyV+PSte2CZjVtfiwgBTc0HpugwRmrB/DaTOWiU2Dmjtg7o8MI942ssa3JmWfFqyJEKhnEa48j
 wxsn4bPJutBFJ0zTbcthBO/+Rv4q6BV9ULV99UKJdLj6x1QlG1mkvAeVL3QGkVdBQDtnybhxFAL
 KvtAcco33/tWW7s/Pqc4mVCgMP1R7nth8pjsmcqjixm2QIkXQrn24HCYFimHPaEvTE/W+STjgez
 4N9Nblpvsmk3riq81PONT9huodSfvh0Smx+X9VuJ1TcFq5+7vfsb+1VRT1aB34ql/0zqhjGhu/C
 efsALk2C11sJiAQfy5h3ah/b5cg/QdekIOp+l0ir/tVCC5G8OVEO9Oy4lA9aTQKXFWTxym6gQsb
 m4aMiFxM/0cdIzLQ61SWVP6aXW+pE2KfqvOSvgbhRGmq9UA7IaaJnvfqgYvHeGsp39OTsWApUzY
 qN7xTTK0ZsZQJVXtYrQ==
X-Proofpoint-ORIG-GUID: MIfO2j9Uks7AFOWYSOUYywu0NNTDSVIr
X-Authority-Analysis: v=2.4 cv=BMqDalQG c=1 sm=1 tr=0 ts=6a738338 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=GaQpPoNlAAAA:8
 a=SRrdq9N9AAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=BJeBD9hh94LXeHMgPyQA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-GUID: MIfO2j9Uks7AFOWYSOUYywu0NNTDSVIr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDE1MyBTYWx0ZWRfX8QuhvauB+1Hs
 waLeXw5efP0c0+bZGzFVwYTsUlTF6j3Da/qkCdcDesKg/x6KgI+M7I4mKQF2uvR+p1kJZ1M8ckF
 dwLd3uIs2EIPLiEU8tyJJUCsOxgrTuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_05,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_113850_567882_79D07A7A 
X-CRM114-Status: GOOD (  17.50  )
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

Testing:
Booted Linux when Smmpt was active. The boot dump shows the expected per region
permissions. Also checked with a small self-test in Qemu which confirms the
firmware region denied and the kernel region permitted from S-mode.

The Qemu RISC-V Virt machine was used to test this. The new cli args
required to be passed to Qemu are -

./qemu-system-riscv64 -nographic -M virt -cpu rv64,x-smsdid=true,x-smmpt=true

Please note that extra some logs in OpenSBI and Qemu are added for testing
which will be removed later.

Boot Logs:

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
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v3

Further Development:
This series add base infrastructure for Smsdid and Smmpt. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations.

v2 -> v3:
  1. Adapt to sbi hart protection abstraction.
  2. Add missing sbi_mpt_hart_deactivate() decl in sbi_mpt.h.
  3. Rename the *map_range and *unmap_range set of functions in
     sbi_hart_protection.
  4. Update the copyright string.

v1 -> v2:
	1. Rebase to latest master
	2. Change probe order between mode and sdid.
	3. Add sbi_mpt_query_access() function.
	4. Formatting changes.

Rahul Pathak (5):
  lib: sbi: Rename map_range/unmap_range functions
  riscv: Add Smsdid and Smmpt hart extensions
  mpt: Add Smsdid and Smmpt supervisor domain core
  platform/generic: Initialise MPT at boot
  sbi: init: Print supervisor domains at boot

 include/sbi/sbi_hart.h            |   4 +
 include/sbi/sbi_hart_protection.h |  27 +-
 include/sbi/sbi_mpt.h             | 336 ++++++++++
 lib/sbi/objects.mk                |   2 +
 lib/sbi/sbi_dbtr.c                |  26 +-
 lib/sbi/sbi_ecall_dbcn.c          |   4 +-
 lib/sbi/sbi_hart.c                |   2 +
 lib/sbi/sbi_hart_pmp.c            |  10 +-
 lib/sbi/sbi_hart_protection.c     |  12 +-
 lib/sbi/sbi_init.c                |   4 +
 lib/sbi/sbi_mpt.c                 | 955 ++++++++++++++++++++++++++++
 lib/sbi/sbi_mpt_mode.c            | 997 ++++++++++++++++++++++++++++++
 lib/sbi/sbi_mpxy.c                |  24 +-
 lib/sbi/sbi_pmu.c                 |   4 +-
 lib/sbi/sbi_sse.c                 |   8 +-
 platform/generic/platform.c       | 101 +++
 16 files changed, 2461 insertions(+), 55 deletions(-)
 create mode 100644 include/sbi/sbi_mpt.h
 create mode 100644 lib/sbi/sbi_mpt.c
 create mode 100644 lib/sbi/sbi_mpt_mode.c

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
