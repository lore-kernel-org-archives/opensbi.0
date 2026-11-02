Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A885606A327
	for <opensbi@archiver.kernel.org>; Mon,  2 Nov 2026 04:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YFnnOs7N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lCC8xEyo;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MaX4yIb2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=00TGwB+bGC7TQka/uARlbdIvMM2x9eq8ceiRqx8Usa8=; b=YFnnOs7NJejJcgp1RUB/CWA/+Z
	4d1bod6byHn7U7y019b5ITdc+ksIaf2qCbLKif4h0zneDyIJWZAb2pY/ScKR5rr6EEThjPTKwWT34
	o7gHM4zL6usjFQ/jntyxLyEZ/erYxSvXQZv/rXHdkXuTlW45VBI3Sd/bP3+/c80/ENWGQphC7/QwB
	zy5Lmjxi9hcsJIOiZFjKmW0DOlBJB3CSTRTDTvOGt+UVb+SldNNTXyz9tEO5+9aSjGUNDcr7XpJjh
	7P5PgxRBsfEmmF+2X1+wMneyoRm/eAE7ur+EbLcd1Xdx32c09HvzJWqkNj+zbErfxCa5JQnxRIQQ5
	GhxuUB+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkX-0000000FW5Y-0flk;
	Mon, 02 Nov 2026 04:34:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNjkP-0000000FW2o-37IV
	for opensbi@lists.infradead.org;
	Mon, 02 Nov 2026 04:34:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A23vVIm2746307
	for <opensbi@lists.infradead.org>; Mon, 2 Nov 2026 04:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MJw2HQmj6a/J+4+H0LZxPF71gpOTQpsbvB3
	XE59rx0I=; b=lCC8xEyoYmtrN6EfNUaqAJq6GkmiT+9i38XdTYebU+10RHuwPs7
	3lOz7H1FdgN0tr6I8enpqHb/U+QfYk7Bp8lHD2bBvv9Q3Fahk+l0rTyck8jR/fF0
	msn3/jhEa9cilaOTA1ETT0evx/rOPiWEskKfr7/cXFKigcmgrWsmzAbl2XAS49fE
	lXT+FmKio1TUGkD9mvbXnShn8HF9BsWeGMfRa7lgHEVCOKrDJlUfo5dBgZUjZQ8h
	XyRQNCv/6h088NBqK03+/e2q88Ys5qCk6fDYmyzaquuFejfYbFMZWTDA7x4ogdGE
	4DdV173FwakHK9fIB4Dx6ZJob4s6zfa9wFg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8dud49m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <opensbi@lists.infradead.org>; Mon, 02 Nov 2026 04:34:15 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36637676140so3708017eec.0
        for <opensbi@lists.infradead.org>; Sun, 01 Nov 2026 20:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793594055; x=1794198855; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MJw2HQmj6a/J+4+H0LZxPF71gpOTQpsbvB3XE59rx0I=;
        b=MaX4yIb2xJfaB08nw5m17ZyCJgomSCG59HRqwvkbgTrLh81AdHm+gyB3R3gRhD+rDT
         tPjlezKagODusDLuyQ3r83Ev+86RLBqQyX8vX8e/t9ihlvs444yQALCzBeM24qmuKCB6
         BxDLtRShYY+SuoOUD/iZTdkp0Gv3yBAt4eQ5OdqWWjvwpC9A56ZAvzwJ6x8ag9b0otnL
         y2cNVqpiZMXE9U9Q4vREmEYViCxrrC4xOZVwHB0H1Xvwwiu5p/fdHrojjnY/kEhlnvP7
         hq09lImF/ncmQft6nnylN20MwVJFNfwzcobpxVcSAdl6DjGEsA51AOVYd2flt7xJPaEh
         aTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594055; x=1794198855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MJw2HQmj6a/J+4+H0LZxPF71gpOTQpsbvB3XE59rx0I=;
        b=nwkrciErVcr0UzJpJV292JAehoX14pempLG+KABvfONmfptGqCpWoeCgADDmPLvdXc
         a8H4hzf6rp9B7jRquLL8Ld51A0ULY8OSrLRFJ2ObcfNKsFrI290FeZmpkhe9EXK7HTd0
         4c6ICrwUKfdtmymdZK9FPME4PfO1vA+l3TVlE3tNuFsByPEXgK9kLfs68hm/sjxQvkaM
         VKjZIB4amkiQKGJxwR5JC1afwPLcYd3fcReBPXlDuc18HyZzD5L/Xf7D8NwH7I34TTW/
         mwo24qWxiZZsv6VQYZEt4/FiT8o6ilgf2UmsIO8Vb2iuBpmYgCmNuRKkEPGUD+hLSxFU
         I2Jg==
X-Gm-Message-State: AFq9FYLZPiG84ohv9oHS0Arj9V/u7bnAff3O6CiTthJR6xiWUO/veaoV
	0YEu8AeUyygu0mu8IdhX64hSJgjL9OngX4ubIQkvuiJCEEwA/+SYwJGxCymR+5v6Gvv1BKjSgG9
	Y8xIeY4W6uy4tGd/3hV1ivhNjiwKbTthJ/omsPEbvB2RswQOq9s1ZvjUr+Yk2onH9sLs+2P36fw
	==
X-Gm-Gg: AYBFou2rtNdRCk7k1bPI5CgWgH6gBXsA3f7mezui5T2Udw57lezyiUw0ptTfD/8ENjg
	NMZpcZU1h8SyIXfxxfzQZeZQscibfuQv43j4tCD7G8RwbMXfL6IGuUADt296f8p/+uC+eLZo1a8
	3QZeqZCY75+LAk/6m14WO7zbf23+XRrZycOirNQORelH1mJTcKQ/er5GQQkHDHEEzqPgPNHVvnC
	keCdab0PYpgA1/OtpsXGnsglc7KsHNHNodckBHqX9qJk5rBY03LSDh92ymyMXvFWxYFBv5mZvz8
	k7hXOGcpQO+wHRPDY1O3nCtgdfF246WPfsb2KiRCYxXDgQehrmWk0CFejjQsuDAIJkBAsEJ/VRV
	zXBO/PlXR6dNIJD/8jEwSrGaiSOMbF7626xTXdP/fNbiqLg/PkFHMYJx703Qls9vFsg2WXauGXg
	nGNHQO9V+Liw374I5/0EJmW+pkWVeXjl/lHKrztn/pPqjC5KNPcXCsnuli6jv7BRojMuBbSw==
X-Received: by 2002:a05:701a:c96d:b0:17c:393d:a0c8 with SMTP id a92af1059eb24-1ac56c9ffc8mr11666679c88.5.1793594054408;
        Sun, 01 Nov 2026 20:34:14 -0800 (PST)
X-Received: by 2002:a05:701a:c96d:b0:17c:393d:a0c8 with SMTP id a92af1059eb24-1ac56c9ffc8mr11666643c88.5.1793594053747;
        Sun, 01 Nov 2026 20:34:13 -0800 (PST)
Received: from hu-rahupath-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1aed79b3dfcsm28014910c88.12.2026.11.01.20.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:34:13 -0800 (PST)
From: Rahul Pathak <rahul.pathak@oss.qualcomm.com>
To: opensbi@lists.infradead.org
Cc: rahul.pathak@oss.qualcomm.com, rahul@summations.net
Subject: [RFC PATCH v7 0/6] Add Smsd supervisor domain protection
Date: Mon,  2 Nov 2026 10:03:51 +0530
Message-ID: <20261102043400.287938-1-rahul.pathak@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=O6esLx9W c=1 sm=1 tr=0 ts=6ae812c7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=xvfqbYfxAAAA:20
 a=GaQpPoNlAAAA:8 a=SRrdq9N9AAAA:8 a=mDV3o1hIAAAA:8 a=NEAV23lmAAAA:8
 a=EcU-Dwbl4GcSEt3mWZkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22 a=xF5q_uoM5gZT5J3czcBi:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: 6RJIybDg70ZEFhUDxXRCyb9NVGVexCN6
X-Proofpoint-GUID: 6RJIybDg70ZEFhUDxXRCyb9NVGVexCN6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX/mzwx5LIWlWv
 H0tpknHsudbObPAAV41JBaht9taStPI8/T108rZvtnguf8d0/CPpHlnLra2TYfN9ujInaKk0ZVy
 2vSYFa/QUL59xrPn4A1huPodQyqnhreVqK1cDs6v/85gq0ISLlzqKuFjcZjWsWNUnvRf7P0zmG9
 YUunlMgJTH69hqknfLF0s7PHl2j3Dqs8oNIlyp+qUFuf2Q14V1ks5T1i9H7EEc7agyYVUf3Mgm7
 Hx0KzgL1V2lVlssHQDi5WBxmUD94K/AA9128DZKPd4fBZzzZwwOKIz/msRWovVnc4zZQzvbyya9
 zuiELfzLEOstBZOMBBejMFCenm+3O3rUqzAEe4n5yNo0TOGBPC0Q0ZP/Xehw4iGxKVMknufr0BH
 s5IizraJ9/FifHukJklEWahi1SRe9/jR14NDQK3vG3eozKII6l31p/V4eZSmkcF4JveaZveLsFZ
 atP0UW8vcQWtBEf8LfQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNyBTYWx0ZWRfX6qbZhN3HyRuG
 hUb8EFzHfNdd8IdtuEVxu+s1y0e89tyz74iRDLCJZQeZDvu3Dz33Zh9EJdF3S9lqidZ250GyT5h
 1Tu7fI0k7QoXJnrC0FK1AmDASL+bVk4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_203417_909731_A71E3655 
X-CRM114-Status: GOOD (  23.19  )
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

NOTE: This series is updated for the latest RISC-V SDAP (Supervisor
domains access protection) spec 0.9 which has gone though some changes
which are not yet adapted in Qemu. This series is only for review.
Rest of the coverletter is old and will be Updated once the Qemu is
available with SDAP v0.9 support.

https://github.com/riscv/riscv-smmtt/releases/download/v0.9.0/supervisor-domains.pdf

This series adds OpenSBI support for the RISC-V SDAP specification
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
Booted Linux when Sdap was active. The boot dump shows the expected per region
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
https://github.com/pathakraul/opensbi/tree/rpathak_smmpt_v7

Further Development:
This series add base infrastructure for Smsd. Development
and testing with more then one Supervisor Domain. Extensive testing with
all the modes and other platform configurations. SDID allocation through
DT through a per domain property.

v6 -> v7:
  1. Naming convention improvements, changes from smmpt to smsd/mpt.
  
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
