Return-Path: <opensbi-bounces+opensbi=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22339C4451C
	for <opensbi@archiver.kernel.org>; Wed, 22 Jul 2026 03:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z3rOiKDNr4uz257KMHCfMeupgVlfHVb4aAC/o2vQcs0=; b=G2uaSn9Pv7lSv0
	+jAVUBPAd9mtXawiL1rw1GSfyyyfFzU4fmkJjqdX22pQViGCauNr33OzFIJjh8ZF/glT+a3ySUBTy
	pln91oX+UroiyEAf3mt30nNeAStOTfsLbUzUmRplVoqmkAPgrj/SGECXMH7g2EnbBzI5qIFtGfebN
	ini5r9eyIjm6/gfru/sizcXKpHg3butIdjKk+2JroUuBnq7N7YcTfEll4WpcdaBHxPxzbf8bJ7oYY
	gEG2C++kNFbaJR+RkyhhFnWGY/AlnphVBJxP8JNBMNQ3wBice5AhenN4HhNew6S9zwDEQP0rjg4s4
	uzh+HD3XULZWwLfwYqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNji-0000000Ap2S-3uuJ;
	Wed, 22 Jul 2026 03:35:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmNjf-0000000Ap1h-1tqx
	for opensbi@lists.infradead.org;
	Wed, 22 Jul 2026 03:35:09 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1CHU33401790
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zcnyZ/P6aUHJMdChDcKhOqYyZEPjnWlbqCc
	BSs3Dhv4=; b=XGE1Hex/FXX/vmIIb33Ym6yCo44KyhQLS/GKeqNhICmvNKScF0F
	sDsehZR5C6d7fiDaYDGG87SC4RK8br85HecWpZCpRp7ti5gfSD04pf5Ze+c1mvnu
	cr3B40txhPbYj3wpdtzOVx4X/DrCvsuupn8Wgj3y8CkQWoHbSgxJVP7QSm7JsJs6
	xknfy5nTTkf4mCH52IrT0DJ1FuYR4KH+T0mFGKGvWnaYK/u/QSHg5HdecTMyAtjM
	N6uFim8clBimZEFtGo+dJu2jChNeTkYL6c5Kf4SuZi85C1+X/8AtaNl4hYjp0Xz9
	JzwzeUftY/Mwi3kdm6DM3Jon38fHVYkuNeg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6a9xqj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Wed, 22 Jul 2026 03:35:05 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c9667280edeso13761431a12.2
        for <opensbi@lists.infradead.org>; Tue, 21 Jul 2026 20:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784691305; x=1785296105; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcnyZ/P6aUHJMdChDcKhOqYyZEPjnWlbqCcBSs3Dhv4=;
        b=DKM5Z6inPom93ddaPmb1hM8R2CzP/bN1uSf8UCyJaOOrwfTkNUtcdkOSYM/3WFONcj
         o9vj7NZr6MR73I/yGV+PA8ix5xBveJDkYcmXr6L6M93yqOey+0nBilnY2lcWVn1zwaR1
         cJPnX6gcAdd8l1fKgn6JxQ76vo5s3VpSkJAonPb+/AFDvhLO8dN3knDoUForYx/jWDb8
         UvpLuun7dZ/jQULJlabJTUqrZz4VT3WVrYF4F/zigGqqurR5fmisYGL6ahsm/ZIW25Ge
         RxzhXKNg3tQm5oLUPAUEHBIW7PvQ3iXZDYZJvBSAjTnkQAgw04tTMIZjH8vPdwLLIB6B
         1Aog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784691305; x=1785296105;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcnyZ/P6aUHJMdChDcKhOqYyZEPjnWlbqCcBSs3Dhv4=;
        b=WHEZbcEjIBY/iYkcnNbJxz5yAhfRDMbDqbQL7z7JVLO4UsIXMCOaS3hP6WhDPP5a0v
         QwLnK//LnR0iNMLA8CWlUvQoWsUCJZXxaiyRYyRRAA07FjTBktiGNawVjSdTPzSwsVtb
         GcH7u3IoJJu3EzAbhBIEtb1W1RDuNwB1eDy33s3E/7JEzvvmYBEuz2AE06oO0K/70xmG
         A8i2ctP4v3DmqLCinpveYcdUlc+5ePrCL+2lqVAyrJQp/hwUsoA19sRLAFZ7C7EUpwtE
         O1An4hO0kcKryB6Ja5d018cCW9Lo5SWzfPgg/PVhe3iua0sh+/NCIi/vwsK9ke6cJpTR
         ssUw==
X-Gm-Message-State: AOJu0YyR22eet+sfa16hukq5+Shnd25jw0gkkwhjtj+1eFEEntEy3u7J
	kHeCDwBev7n0O8ONDHiBidRHZNQ90Xa7agM9ih7JZxibQxUUzuFn/pQ4NhHSMyB4dAapFPENGIt
	KvoOVAqggUg4jpdTqSTEUvwmFD9rervzLf9SXV3HHv59w1dEvYxE8+QFuJVQFk++OqrGjY+obzQ
	==
X-Gm-Gg: AR+sD13QxeFAVchIcYF0Y0OmeqDpCSkKOiheCKrYwQQvnfNJPIR9e3SWKWCbwxa2idz
	Y3ubDiVLKl2h2mbZ3lLB/xVqQwKWfflxvY32LX7ijzBzHaXzoEmnSPh5314swd4ygzypDSKkuZI
	42yXZ3dIGMND1x9566/bWPa+jJCcCxic+GZ0UJzgmJPNpc6Yzb0c9lQsMeuYM52Q/PVQcPbETc5
	apjCLbZT+ge30wc7yJoyNvKXB0oAYeW1KU4LtOxrkUiQVY7//LHseGWNGwtZsqkYkOLz7Z/Wl5X
	6vKxGWlvglfi+l7eW9mNY37x34iKSU6nCmgLUGtu+j1ivdATgGkhRZCbRF4NtuM91IfKKgO8sgn
	+nBxo8xz/OfzEGO3Vwbd1TxA3Bb+7OtfYwyquFqmMQHKx6WCZEPixkTU06rTjGQepUbYQ4PYFqt
	CXRMY17siQ16Cs5IATPsHc
X-Received: by 2002:a05:6a21:e097:b0:3bf:d1f9:b1ca with SMTP id adf61e73a8af0-3c3ad7777e6mr22301822637.30.1784691304730;
        Tue, 21 Jul 2026 20:35:04 -0700 (PDT)
X-Received: by 2002:a05:6a21:e097:b0:3bf:d1f9:b1ca with SMTP id adf61e73a8af0-3c3ad7777e6mr22301802637.30.1784691304254;
        Tue, 21 Jul 2026 20:35:04 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d1302659fsm1645787c88.8.2026.07.21.20.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 20:35:03 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH 0/5] Add Smsdid and Smmpt supervisor domain protection
Date: Wed, 22 Jul 2026 09:04:49 +0530
Message-ID: <20260722033455.2658178-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX7qlCp5zVlvD6
 BCluipfwcqjNYT9uFlKrgbIV1Gu2UhRZEZpnfvVEKb2kgKjaprQY+Knbkl+P+wZgRKFtGVd8MyQ
 BHs5B+G7lU45LcKljRmrC7Ps+KleSAO4mVU2XJm8v/Lx+EcS8AzsNYZYC8tdL7c0Fpok1JIdZbd
 FTA7hu2sHg0NzB2gKd8aka48Yos6/qtT3I5nugOUmLWry71SjU51YiJXIjyExwIp5r8iEdNXwPq
 CPpcxJ9Vm5qs68Gs6bELbk/1YujVOVJFabb7DkuLsrPWt0p8AzbR1E6MbXw3UUhEQ98p1m5f4Cc
 ob/vS1C/VKUTOtw3qkeINoqD/VkUfF4lFyBgOFdfDx+Vl+LlOobEAP03vDI8cjWw3SLw0hPj7vm
 GBUxvx5x5/MzmHMgoPfTWhr8bETPCmr6SuI9KCXPM5kKzLBz9aPAZnhcz3ftdaRbrj1vTaEMsn8
 Wc4F8JfNc9DwKkJjbQw==
X-Proofpoint-GUID: tMtxRAx3exRVIH1F3pv9y-OiTxT9pL6E
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAzMCBTYWx0ZWRfX8hHpRC5UkDc5
 wOFeVhZ1g+R5k1fiig8gMrlUelc97dfgZofdY5zxkDytdLBLVBgJqDJydDW9PL/x37vsOZiuXJQ
 5nLmxZbG9IZKOeN8SXX7veBid1MlvJ8=
X-Authority-Analysis: v=2.4 cv=HvJG3UTS c=1 sm=1 tr=0 ts=6a603a69 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8
 a=xDhHRFnIYBu1Vv_iMmQA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: tMtxRAx3exRVIH1F3pv9y-OiTxT9pL6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_203507_813025_DDC0C2FE 
X-CRM114-Status: GOOD (  17.04  )
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
Booted Linux when Smmpt was active. The boot dump shows the expected perregion
permissions. Also checked with a small self-test in Qemu which confirms the
firmware region denied and the kernel region permitted from S-mode.

The Qemu RISC-V Virt machine was used to test this. The new cli args
requried to be passed to Qemu are -

./qemu-system-riscv64 -nographic -M virt -cpu rv64,x-smsdid=true,x-smmpt=true

Please note that extra some logs in OpenSBI and Qemu are added for testing
which will be removed later.

The Qemu log for smmpt_check_access is currently commented in the qemu
branch to let linux boot logs print. But its present there for anyone to enable
and check.

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
QEMU: smmpt_check_access: addr=0x80010000 mode=2 sdid=0 mptppn=0x80098 xwr=0 accesstype=0 -> DENY
QEMU: smmpt_check_access: addr=0x80200000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=2 -> PERMIT
QEMU: SELFTEST fw(0x80010000)=DENY(ok)  kernel(0x80200000)=PERMIT(ok)
QEMU: smmpt_check_access: addr=0x80200000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=2 -> PERMIT
QEMU: smmpt_check_access: addr=0x802010d8 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=2 -> PERMIT
QEMU: smmpt_check_access: addr=0x81c25000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=1 -> PERMIT
QEMU: smmpt_check_access: addr=0x81c26000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=1 -> PERMIT
QEMU: smmpt_check_access: addr=0x81c27000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=1 -> PERMIT
QEMU: smmpt_check_access: addr=0x81c28000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=1 -> PERMIT
QEMU: smmpt_check_access: addr=0x81c29000 mode=2 sdid=0 mptppn=0x80098 xwr=7 accesstype=1 -> PERMIT


The corresponding Qemu Smmpt support was also added which is present here -
https://github.com/pathakraul/qemu/tree/rpathak_smmpt_v1

These OpenSBI changes are also present in github - 
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v1

Further Development:
This series add base infrastructure for Smsdid and Smmpt. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations.

Rahul Pathak (5):
  riscv: Add Smsdid and Smmpt hart extensions
  mpt: Add Smsdid and Smmpt supervisor domain core
  platform/generic: Initialise MPT at boot
  sbi: hsm: Activate MPT for domain on hart start/resume
  sbi: init: Print supervisor domains at boot

 include/sbi/sbi_hart.h      |   5 +-
 include/sbi/sbi_mpt.h       | 321 +++++++++++++
 lib/sbi/objects.mk          |   2 +
 lib/sbi/sbi_hart.c          |   2 +
 lib/sbi/sbi_hsm.c           |   7 +
 lib/sbi/sbi_init.c          |   4 +
 lib/sbi/sbi_mpt.c           | 882 +++++++++++++++++++++++++++++++++++
 lib/sbi/sbi_mpt_mode.c      | 891 ++++++++++++++++++++++++++++++++++++
 platform/generic/platform.c | 101 ++++
 9 files changed, 2214 insertions(+), 1 deletion(-)
 create mode 100644 include/sbi/sbi_mpt.h
 create mode 100644 lib/sbi/sbi_mpt.c
 create mode 100644 lib/sbi/sbi_mpt_mode.c

-- 
2.51.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
