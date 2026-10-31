Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4160D606A31A
	for <opensbi@archiver.kernel.org>; Sat, 31 Oct 2026 12:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Lolxh9Xo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UB7eKVFw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ft+JaFAU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=3bO/UwKPf12xwd2a8G0q2KAH/I2zdRRJj4FPuszxodo=; b=Lolxh9Xo20ib35hSa4HK4MdOPu
	ZKkxmYGSLk54ToRU+UwxsqbEghPJeOeDmEGsH5wAGsy4iNXRAwI8uGMANb6qkJwJ3xcy9WYxf/zrp
	CEuKtTLhYz2fJuF/McnH5zx/SAdYxCZb+BHWIzKC4aYMjXTfY31au42QPqXFiMPZbkeTDTooz7lkz
	XvYnT1uJIkO2pLyIZ6+D+jjSJRgcFsCEMKElJ/akGi49LlPnhuQFaCIyNrIKP183eMTvH4wGGbq4u
	larp1vTjQ8JlS0nCy9bOron2+G3KCbkAwsEgDb99qgWW+3TbdboTiyo+WhmH/edUBzZ+Yj6rAVIBo
	2sl/4ZhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Bv-0000000DIrT-4A8b;
	Sat, 31 Oct 2026 12:28:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN8Bs-0000000DIqz-1tOv
	for opensbi@lists.infradead.org;
	Sat, 31 Oct 2026 12:28:10 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4aD5m1175473
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1cPLCX4grDGsTAsWMTEjK8d5h/lrD/aS6wA
	8r+TaM2g=; b=UB7eKVFwm1SJ/0CvmvLeB0sR7W9VZPeb+pHD63KcyUGatpnJRLc
	5DNp78FSuxDg2Ltk4qCzajDie8Xwj76vX1B2MV5ldmhIpcPJdqFGqVVo6n2vzIAe
	3COf0X2oQ4xgec/dVxCN1YR8O2vqd9cTm4VDVO+JoC2EHuDVnfGOlxqg/aaNqrsM
	r533FsWMEZl6nNnGveOAs2nMO4QnZsFInu/wG0J1251rAJRj+Zwqh3bxuI0UXq5O
	8PhYofgj0dNSjbAmQx76lGcypbIwcAAIVbK1c+7VkLLztT7QDf7JeTWa+DxS0/Hp
	N1AvgHkvMyMN7rHtESXlWtIdbeoy60g/C4g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkheda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 12:28:05 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a190c53a3so2110961eec.0
        for <opensbi@lists.infradead.org>; Sat, 31 Oct 2026 05:28:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449685; x=1794054485; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1cPLCX4grDGsTAsWMTEjK8d5h/lrD/aS6wA8r+TaM2g=;
        b=Ft+JaFAU5J0FFDesT4XzWPBwcqH7Oo9cPPGgvyJ+nIRhInvHbTEPRdyv6RrVy27VFq
         r8gjZ+oMjBQu1r2SzJggXoHPxs+sLK2EFw0zDFZ2jYviSKiGjI70lbWALEyn2JfRyLai
         T+o58N0WErZ879eluXQbU+HXVPKauAbGErFBEZUQbcCxCWPA6GhANP830diAT2MnzyVg
         0Q/9nY2e+yWe5ypUo0k45PhWxhqi1WQ+kbDDsjpHLcB37ibYRdj8OrsgCjrBBgYdqb8E
         hVLjRugnFNlA1w1y0vVMYqMsiRG6XpEIfpsxtqcG36P6JIQ9G/+EiD2Odo0GNF6WMpa9
         fjfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449685; x=1794054485;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1cPLCX4grDGsTAsWMTEjK8d5h/lrD/aS6wA8r+TaM2g=;
        b=FP0a3uu0DoUeVu2RUWsXTadnYUBkoO2t/iXabK2KOXBkTom8FJAAdrhPoDPlKtAdok
         9LZUvAzFCtZxkcku/ryY2sUAPLLs6rGN79Q2ljD4j+mvZQtU9QVIGZoDjmwpqmDa6xSJ
         eCPW1hY8FntqeKMPzEhvKIWUa6oOnfblZ5tIxbv36oBAt1NdxWcvKW93lk0BiDk/4980
         V/8Opy+xjHLMUpuJreSJ9D3B4Y9WcML+5SqZ5RH4i9z+Er4vZwrW4qSdqNIIHC9j7xLa
         r4OW3XM804TVb6v0iQmdF27NadFJsPisZcHFFyD17vHGoyNUfLN/x50nJ5ImqwqsGHP6
         pGMw==
X-Gm-Message-State: AFq9FYJwcAbM0oRTTXjznjkIYwHGwPZdrjS2W8cckd8LroCejDOtU5GT
	6qPXw61U8oHipjWSPrSTZiT/m++YwCxq0Wx6lS7bIXTV8pFKBtGAZW+8MPHuPPBCbSyq0hWLS0A
	VzXrzr+caKlqiYWExcusXafo3mAa1zIbYSU3tioPCqjI0peYWU0iWhSbWaY2CMrIR2kRJbuEAmw
	==
X-Gm-Gg: AYBFou044ZEqOlr/Cp4GbwCjYVy/3HjSxqNpaDaQIIR5cv/G+KIRtc476TCOmEza5L+
	KgjgGEldVY7U0u3//oKqaWO36gIpJtY+46JUKQ1ej5ld2JYWYWKwJT1Waag1nVXUt2DVRr2Y1/G
	8JMA/C4ZowT8D7uOvBxdOwB4ZWmrCfAUUkT1qWX80+36gr3SiEbGC3ajMclQ+Pc6JI6eQepzl1A
	t27NTMzd2OTRWeAvle3bhz6jMDcEHvcJRcD9upG49VU37vuWV1nbZB83euLJCo0PQQ+5vsx25aP
	swHAuKDd8i34iY/ukk/pNpXNlSHbh4MjZ9d4m5W0hYR4Zn25XFUe1oGNObwNYU7fFiUOyyxi9K/
	ioFTKN4Q2K2g291d+Wa3AhGws5VbsaGaj2U6VTzYBC+MVbjWZJ+5kelkZuLF9QLqh6FiZy0AKBg
	DW7zo+JTvT4IWFkzCqhlhG+owygKLZHDKeZZ+53zMLMEGArGTh6M0a4CaHJOhsPcN+kawu
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr7362643eec.4.1793449684601;
        Sat, 31 Oct 2026 05:28:04 -0700 (PDT)
X-Received: by 2002:a05:693c:8211:b0:369:f3a3:fad6 with SMTP id 5a478bee46e88-36a42340d04mr7362602eec.4.1793449683752;
        Sat, 31 Oct 2026 05:28:03 -0700 (PDT)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4293b651sm15515168eec.17.2026.10.31.05.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:28:03 -0700 (PDT)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v6 0/6] Add Smsd supervisor domain protection
Date: Sat, 31 Oct 2026 17:57:49 +0530
Message-ID: <20261031122757.2572125-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: uoWw-HCn-ET7D025xqquZ_FNVbNxGJ7Y
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae5ded6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=GaQpPoNlAAAA:8
 a=SRrdq9N9AAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8 a=gqFXYJlQtVIwrXZ7rAsA:9
 a=bBxd6f-gb0O0v-kibOvt:22 a=xF5q_uoM5gZT5J3czcBi:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX/KArxJU6Q2m2
 UvZU8B3Y8v6XEs6ZUGU+2Sl+x/kNSc21LQKFKd3igmsoGTZFpE0oM9wAGAnFkXrJAoSKTGbP2aN
 ROkno+HfCtHA5A3P5vSXAFbHsjr/kpo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX1sppMZs9yqGO
 1R7jXqr6ePfPc31gvZuoWYgGa4agn+JEQP9DvMryg9ZayPkz3nGBuaJCzaIZXEMNG4ZJSy205jd
 agOhigGIRGFYfC+3rLxB1znMixsbts4eyiU+hya1deuQNCgSyqhAZyfk3U4VTlWsJjgbZlmodYm
 puNwr3UIcqzZU4bHT3Yha1nycHtcU6tKYsdaT+LxJS6AXvJP8WhoCK8kujWU4QG24Pn7YAamxL4
 XvMn+VsgJpEfFASRs+g28PzRkMI2bHM/+LQzdT7lzeTXuk5Vb0/L4ampP0IXAkN2Rtsxm/rCStu
 1/wqy/qEg/c+YeBVjZYpaGisSYrI/aD+Pa+ydP1Qq8EIaMu81zkLrocGXg8hiuGx92bu5hCibUM
 9PJYaY9VZ9l3QF3/ArM5v1MndB4Vm2uQNK9TnZ9AwhjN6AnYiIbxeQj9D56f0DpwxoL1Tr9v8EN
 Td/tqqRkBzX1whInykA==
X-Proofpoint-ORIG-GUID: uoWw-HCn-ET7D025xqquZ_FNVbNxGJ7Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_052808_638137_89ADF74F 
X-CRM114-Status: GOOD (  21.68  )
X-Spam-Score: -2.7 (--)
X-BeenThere: opensbi@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <opensbi.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/opensbi/>
List-Post: <mailto:opensbi@lists.infradead.org>
List-Help: <mailto:opensbi-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/opensbi>,
 <mailto:opensbi-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "opensbi" <opensbi-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

NOTE: This series is updated for the latest SMMTT spec 0.9 which has
gone though some changes which are not yet adapted in Qemu. This series
is only for review. Rest of the coverletter is old and will be Updated
once the Qemu is available with SMMTT v0.9 support.

This series adds OpenSBI support for the RISC-V SMMPT specification
sub-extensions - Smsd (supervisor domain).

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
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v6

Further Development:
This series add base infrastructure for Smsd. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations. SDID allocation through
DT through a per domain property.

v5 -> v6:
  1. Revert back to state_finalize callback for per domain state
  finalization(v4) instead of having a notifier.
  2. Introduce memory class for TYPE_MEMORY hart protection mechanisms.
  3. Added the fdt_cpu_has_extension() helper to check for an extension in
  the DT before the hart extensions are parsed.
  4. Updated to RISC-V SMMTT specification v0.9
  5. Allow only root domain to initialize if the SDIDLEN=0 instead of disabling
  MPT for the system.
  6. The MPT heap memory is reserved only when a hart in the DT implements Smsd
  extension.
  7. Rebase on the latest master.

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

Rahul Pathak (6):
  lib: sbi_domain: Add finalize callback for per-domain state
  lib: sbi: Introduce memory class for memory type hart protection
  lib: utils: fdt: Add helper to check for an extension in DT
  riscv: Add Smsd (supervisor domain) hart extensions
  mpt: Add Smsd (supervisor domain) core
  lib: sbi: Initialize Smsd during coldboot

 include/sbi/sbi_domain_state.h     |   22 +
 include/sbi/sbi_hart.h             |    2 +
 include/sbi/sbi_hart_mpt.h         |  314 +++++++++
 include/sbi/sbi_hart_protection.h  |   20 +
 include/sbi_utils/fdt/fdt_helper.h |    4 +
 lib/sbi/objects.mk                 |    2 +
 lib/sbi/sbi_domain.c               |   16 +
 lib/sbi/sbi_domain_state.c         |   25 +
 lib/sbi/sbi_hart.c                 |    7 +
 lib/sbi/sbi_hart_mpt.c             |  991 +++++++++++++++++++++++++++
 lib/sbi/sbi_hart_pmp.c             |    2 +
 lib/sbi/sbi_hart_protection.c      |   84 +--
 lib/sbi/sbi_mpt.c                  | 1000 ++++++++++++++++++++++++++++
 lib/utils/fdt/fdt_helper.c         |   61 +-
 platform/generic/platform.c        |   23 +-
 15 files changed, 2502 insertions(+), 71 deletions(-)
 create mode 100644 include/sbi/sbi_hart_mpt.h
 create mode 100644 lib/sbi/sbi_hart_mpt.c
 create mode 100644 lib/sbi/sbi_mpt.c

-- 
2.53.0


-- 
opensbi mailing list
opensbi@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/opensbi
