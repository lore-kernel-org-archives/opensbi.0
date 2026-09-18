Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F6CC88E75
	for <opensbi@archiver.kernel.org>; Fri, 18 Sep 2026 03:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3yA+Hi/FG23N9KRSsaC8xfjPgQutUgSS5xbuNVyPr0A=; b=dbO9M3w25euvcw
	cAVav1wL/eny7pn6FPbnK1rqHdnfwM+XxccyXC+r6mgiemDRokslUA88m6QKV70WkosDY3eibVCbF
	yHRqn6W/UiHu61LvdnxFBs599qtlyR78gFVdQPmd8r6VIJyG6V8BmXOXPfHaHiEkBhUmGJ74soyIq
	4RAKQR+dFkqq1gDrfWtWas/0cYEYzUXda6wCKnChDMEm32iOqX8LNNmsKAQf6vbt9UJ2Hlbk71oOO
	AJ1U9nNpnS+TFp7/LyxhhrQvMQDVBbrB6sDOV5YRHSg/ShnwoAzGxAZG+32bocyxNkv1URmuW5XKp
	f4l+AzuCxOV6l7CByIRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzO-0000000DMpL-08uK;
	Fri, 18 Sep 2026 03:10:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7OzI-0000000DMoQ-3LJ7
	for opensbi@lists.infradead.org;
	Fri, 18 Sep 2026 03:10:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I2UwZP3384254
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XdyB3uMiLKJcStZCeQ+YCBRHSUSnGndaplZ
	UsyaqeVE=; b=oUUyHBfsK1+hRUkNYuG+4a+KrRn1+G1h2qv1FvGnPUpK1GXBsFT
	6o8x4xYDqbSYjacPcKqX7o5WnrZ+edBdIOYsHxc2nnJJz3fFwSDocuhNJvPIsNxN
	Fd0zo7n4ZG4uv6BBXV393y8H9mdM6APmk/33ZXPgPbdmo+IESWUL/BPtuHZG35uU
	Ci3pclY7qsR8O3XjVxv4bsdJB7nTixPsKZ1QEUgGbOC7BLuq762nPDSQdQQ7Tgs2
	HX1NEgvHBid59NEITh+HefL0paSDQ/Nbu/JdH6wVm0K8CMYgF3mxGZ/d1LXlRTWP
	7cS80DbtftNHvEDvsBphVRi0mjgiTyB5Ztg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grk97tnj9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Fri, 18 Sep 2026 03:10:06 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-87088f3b83dso465172b3a.1
        for <opensbi@lists.infradead.org>; Thu, 17 Sep 2026 20:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789701006; x=1790305806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XdyB3uMiLKJcStZCeQ+YCBRHSUSnGndaplZUsyaqeVE=;
        b=YW9e6hSLPRrT4dGMHkW3nATcU8YVwgUAuiGpZMSrLh1Zl34p5nM5LHc04Sk/M+GRhJ
         xR5yFINWGT80XYqsl6S+yAlYaSAdi+s6mevcOr8fJyJJA76GRoJ0l4M+aC5/ihIq9/NM
         j51+9gVNR31kQQ4Mv7q73a4BKzny0dBfd0RCFDkMJqOqNGovbZre1rR9YS1BCRANdKax
         40Lhzza6YC05FAWz90erzWRaw/ExVRV1bO2XCnkqrLO3Q+D7fAKBhxIDGQ2XGykg3fsT
         k6HSB8i+RvBsUiGywRgrkGM5dQpWAK1m/pJD8fYjg+l7aOjMFz2hypImqaaed2Ufgduf
         vhMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701006; x=1790305806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdyB3uMiLKJcStZCeQ+YCBRHSUSnGndaplZUsyaqeVE=;
        b=eAQfBEbnhgtXFLsYqbUW3PtlsPM9H+HVt65jOVEsELbpX4hE9qlNzOn5cyv50cWz0R
         9fyGjU7igwE3x9z6inYtaxmHBdvECjkbqmPeoJIKgXIM1lmqhKocTPgMRu9Q2d7gYZ2b
         G8jFA3M53MACqlRClA1qjANw+uSqHZdbkblkQgUmPDEsS43cSsQ8XP8nysFr+TF2GcbO
         tSEnNtmTEI65Y/rMsd0LO7T1H9x3N5Wkf+fQw7cU5LSNT5LthN9Pm9o07xyRv7NqsQtA
         lPhR944JQqA1Thpw53Nz5zr3/nsXsSQ9HorFOMT+50x45aSkAPS/mTHsJa67P3f0+r5i
         sjTw==
X-Gm-Message-State: AFuF++kzIWZdzgVheIgQFs+w5IV3iIXV+N02OZh4NRzqqzVwwrXm7ywc
	g/oPzlLk6v0u02IIeDOfpWVOjrPMF/e/BXsD0XqdEudH6dUv8+PxGnVOTktqLFW2v5YhsHlZAUr
	F4/w4EnSMX8NoFSF3Gy7sMGnVJBerVMrtRf06zFYdlHUE4yiIWmZjNkcpU6MJMGo9d3IbPHtG2w
	==
X-Gm-Gg: AYBFou19c9hW0O4OX8XvANtpO8GZUwOLzvOaO9gBKhl/4HjjUWQAse6L5HobSHPMCG0
	yjB5LzaIqOC5QSH+Zh2D710Ywi0pft7zlSnP+Weo3jAA/XCVU/NnTCO+6dbu2zm2EDGYZUdqxvI
	qeOHkmCl62b5x6F7OJBPRVn48xs4mvr02J20BHqK2sYva6nvphIfSjyC2P0Hz9hvr7gPa+uvb/v
	rM9dyrIn4LyjJv8yeiiraC1UheNTbMzbZiYEyU+7ZKikl3fqTK1NVyL1on3GdnkEmsUQQrd5Iam
	FlLou5YVGc1JIgRVxKYvm/J8/q7Z9V11II7K6jUALZRm174U5uEnv7lH4odbsnlFRTbVA7Sab99
	D+bTzZr+UUItu2xG8skAtuvIAGdVmWfwGQsAoz528BwAtc4EkhTEbIbyE5AOyY1HbZyu36HI7bA
	FHBF+/lZh8vC/bP106vQke
X-Received: by 2002:a05:6a21:6f88:b0:3dd:85a8:cacf with SMTP id adf61e73a8af0-3dd8c4aed88mr2146195637.38.1789701005902;
        Thu, 17 Sep 2026 20:10:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f88:b0:3dd:85a8:cacf with SMTP id adf61e73a8af0-3dd8c4aed88mr2146123637.38.1789701005411;
        Thu, 17 Sep 2026 20:10:05 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144cddb4cf8sm846468c88.1.2026.09.17.20.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:10:04 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm, rahul@summations.net,
        Rahul Pathak <rahul.pathak@oss.qualcomm.com>
Subject: [RFC PATCH v5 0/4] Add Smsdid and Smmpt supervisor domain protection
Date: Fri, 18 Sep 2026 08:39:49 +0530
Message-ID: <20260918030955.3902993-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=LOzz05W9 c=1 sm=1 tr=0 ts=6aacab8f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=GaQpPoNlAAAA:8 a=SRrdq9N9AAAA:8 a=mDV3o1hIAAAA:8
 a=NEAV23lmAAAA:8 a=X8QcXq7Ae5nnelrvIMQA:9 a=OpyuDcXvxspvyRM73sMx:22
 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfX0t+4gmyCiPKd
 GYoM88VqNpLRLk6SRRaASM/rDWtGi3GfDLVPgjn1VLTRTq8EHNQ/18EgcjEAXUOyZniDYrf/mic
 vZFjorg39W7IZ7tOZu+zeRoETmAn1q+3CohxZIk6WDvv2afARtgMya0Xk+rd0PFHlPIhOQElMU3
 xG+kUSFZrKdkiCN2BnKMTzN8J6LIo2hSWRlnsHw58xQpBs8rjvrLTMrs+z433FNkbqCrmA24foQ
 53xDe0btYvUsWK/TUQi6AlOBtbSQYfW/DNVaygbuwVnsQpO0xSgwbOu0ZSd/RCLAH3t56LqP+Va
 0uy0k83RF4CJxJ/3ENS5KrFxPAbQWYXNIW3n8AxnfakVzLc2d8rHWYlV6wRkbdwFZ8JLD4emGUg
 1dII25/WuYgsF+0f6HTkGlgpJiZDsrWfqiQd6807TnaL2o9JVv9Ffl+yBq5KxAzeU2iNHquaSoo
 oVT4Vxcyl4OOVVhtSVg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDAzOCBTYWx0ZWRfXz9kqZbrOWDIq
 oVWVsIldhxdH7dijMjnyUVFvOFl3sI+Y3HbDiuoxBO22+rZLu+ownkxnL4zJCZDeBDsNU3YHLwY
 rszIeHFu67qGnOew2uw1Kn6cyUriN9A=
X-Proofpoint-ORIG-GUID: zjUU-y9979U3U7FSHYCReQY9gf4ISbtH
X-Proofpoint-GUID: zjUU-y9979U3U7FSHYCReQY9gf4ISbtH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_01,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_201008_999908_C4D4C289 
X-CRM114-Status: GOOD (  18.88  )
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

This version of series is based on another series by Pawandeep which
adds support for the domain notifier infrastructure.
https://lore.kernel.org/opensbi/20260910210819.525538-1-pawandeep.oza@oss.qualcomm.com/

Testing:
Booted Linux when Smmpt was active. The boot dump shows the expected per region
permissions. Also checked with a small self-test in Qemu which confirms the
firmware region denied and the kernel region permitted from S-mode.

The Qemu RISC-V Virt machine was used to test this. The new cli args
required to be passed to Qemu are -

./qemu-system-riscv64 -nographic -M virt -cpu rv64,x-smsdid=true,x-smmpt=true

or 

./qemu-system-riscv64 -nographic -M virt -cpu rv64,smepmp=true,x-smsdid=true,x-smmpt=true


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
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v5

Further Development:
This series add base infrastructure for Smsdid and Smmpt. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations.

v4 -> v5:
  1. Drop the state_finalize callback on sbi_domain_state 
     and use domain finalize notifier built on the registration notifier
     infrastructure instead.
  2. Remove stray text in copyright header in sbi_hart.c.

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
  lib: sbi_domain: Add domain register finalize notifier
  riscv: Add Smsdid and Smmpt hart extensions
  mpt: Add Smsdid and Smmpt supervisor domain core
  lib: sbi: Initialize SMMPT during coldboot

 include/sbi/sbi_domain.h    |   16 +
 include/sbi/sbi_hart.h      |    4 +
 include/sbi/sbi_hart_mpt.h  |  312 +++++++++++
 lib/sbi/objects.mk          |    2 +
 lib/sbi/sbi_domain.c        |   80 +++
 lib/sbi/sbi_hart.c          |    8 +
 lib/sbi/sbi_hart_mpt.c      | 1007 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_mpt.c           | 1000 ++++++++++++++++++++++++++++++++++
 platform/generic/platform.c |   11 +
 9 files changed, 2440 insertions(+)
 create mode 100644 include/sbi/sbi_hart_mpt.h
 create mode 100644 lib/sbi/sbi_hart_mpt.c
 create mode 100644 lib/sbi/sbi_mpt.c

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
